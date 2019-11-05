//
//  Secp256k1.swift
//  token
//
//  Created by James Chen on 2016/10/26.
//  Copyright © 2016 imToken PTE. LTD. All rights reserved.
//

import Foundation
import secp256k1

extension Encryptor {
  struct SignResult {
    let signature: String // Hex format
    let recid: Int32
  }

  class Secp256k1 {
    static let failureSignResult = SignResult(signature: "", recid: 0)
    private let signatureLength = 64
    private let keyLength = 64
    
    /// Sign a message with a key and return the result.
    /// - Parameter key: Key in hex format.
    /// - Parameter message: Message in hex format.
    /// - Returns: Signature as a `SignResult`.
    func sign(key: String, message: String) -> SignResult {
      Log.d("prv key: " + key)
      guard let keyBytes = key.key_dataFromHexString()?.bytes,
        let messageBytes = message.key_dataFromHexString()?.bytes else {
          return  Secp256k1.failureSignResult
      }
      Log.d("messageBytes: " + message)
      
      let context = secp256k1_context_create(UInt32(SECP256K1_CONTEXT_SIGN | SECP256K1_CONTEXT_VERIFY))!
      defer {
        secp256k1_context_destroy(context)
      }
      
      if secp256k1_ec_seckey_verify(context, keyBytes) != 1 {
        return Secp256k1.failureSignResult
      }
      
      var sig = secp256k1_ecdsa_recoverable_signature()
      
      if secp256k1_ecdsa_sign_recoverable(context, &sig, messageBytes, keyBytes, secp256k1_nonce_function_rfc6979, nil) == 0 {
        return Secp256k1.failureSignResult
      }
      
      var data = Data(count: signatureLength)
      var recid: Int32 = 0
      data.withUnsafeMutableBytes { (bytes: UnsafeMutablePointer<UInt8>) in
        _ = secp256k1_ecdsa_recoverable_signature_serialize_compact(context, bytes, &recid, &sig)
      }
      
      return SignResult(signature: data.key_toHexString(), recid: recid)
    }

    /// Recover public key from signature and message.
    /// - Parameter signature: Signature.
    /// - Parameter message: Raw message before signing.
    /// - Parameter recid: recid.
    /// - Returns: Recoverd public key.
    func recover(signature: String, message: String, recid: Int32) -> String? {
      guard let signBytes = signature.key_dataFromHexString()?.bytes,
        let messageBytes = message.key_dataFromHexString()?.bytes else {
          return nil
      }

      let context = secp256k1_context_create(UInt32(SECP256K1_CONTEXT_SIGN | SECP256K1_CONTEXT_VERIFY))!
      defer {
        secp256k1_context_destroy(context)
      }

      var sig = secp256k1_ecdsa_recoverable_signature()
      secp256k1_ecdsa_recoverable_signature_parse_compact(context, &sig, signBytes, recid)

      var publicKey = secp256k1_pubkey()
      var result: Int32 = 0
      result = secp256k1_ecdsa_recover(context, &publicKey, &sig, messageBytes)

      if result == 0 {
        return nil
      }

      var length = 65
      var data = Data(count: length)
      data.withUnsafeMutableBytes { (bytes: UnsafeMutablePointer<UInt8>) in
        result = secp256k1_ec_pubkey_serialize(context, bytes, &length, &publicKey, UInt32(SECP256K1_EC_UNCOMPRESSED))
      }

      if result == 0 {
        return nil
      }

      return data.toHexString()
    }
  }
}
