// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: common.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

public struct Common_SignParam {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var chainType: String {
    get {return _storage._chainType}
    set {_uniqueStorage()._chainType = newValue}
  }

  public var path: String {
    get {return _storage._path}
    set {_uniqueStorage()._path = newValue}
  }

  public var network: String {
    get {return _storage._network}
    set {_uniqueStorage()._network = newValue}
  }

  public var input: SwiftProtobuf.Google_Protobuf_Any {
    get {return _storage._input ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_uniqueStorage()._input = newValue}
  }
  /// Returns true if `input` has been explicitly set.
  public var hasInput: Bool {return _storage._input != nil}
  /// Clears the value of `input`. Subsequent reads from it will return its default value.
  public mutating func clearInput() {_uniqueStorage()._input = nil}

  public var payment: String {
    get {return _storage._payment}
    set {_uniqueStorage()._payment = newValue}
  }

  public var receiver: String {
    get {return _storage._receiver}
    set {_uniqueStorage()._receiver = newValue}
  }

  public var sender: String {
    get {return _storage._sender}
    set {_uniqueStorage()._sender = newValue}
  }

  public var fee: String {
    get {return _storage._fee}
    set {_uniqueStorage()._fee = newValue}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "common"

extension Common_SignParam: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SignParam"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "chainType"),
    2: .same(proto: "path"),
    3: .same(proto: "network"),
    4: .same(proto: "input"),
    5: .same(proto: "payment"),
    6: .same(proto: "receiver"),
    7: .same(proto: "sender"),
    8: .same(proto: "fee"),
  ]

  fileprivate class _StorageClass {
    var _chainType: String = String()
    var _path: String = String()
    var _network: String = String()
    var _input: SwiftProtobuf.Google_Protobuf_Any? = nil
    var _payment: String = String()
    var _receiver: String = String()
    var _sender: String = String()
    var _fee: String = String()

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _chainType = source._chainType
      _path = source._path
      _network = source._network
      _input = source._input
      _payment = source._payment
      _receiver = source._receiver
      _sender = source._sender
      _fee = source._fee
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularStringField(value: &_storage._chainType)
        case 2: try decoder.decodeSingularStringField(value: &_storage._path)
        case 3: try decoder.decodeSingularStringField(value: &_storage._network)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._input)
        case 5: try decoder.decodeSingularStringField(value: &_storage._payment)
        case 6: try decoder.decodeSingularStringField(value: &_storage._receiver)
        case 7: try decoder.decodeSingularStringField(value: &_storage._sender)
        case 8: try decoder.decodeSingularStringField(value: &_storage._fee)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._chainType.isEmpty {
        try visitor.visitSingularStringField(value: _storage._chainType, fieldNumber: 1)
      }
      if !_storage._path.isEmpty {
        try visitor.visitSingularStringField(value: _storage._path, fieldNumber: 2)
      }
      if !_storage._network.isEmpty {
        try visitor.visitSingularStringField(value: _storage._network, fieldNumber: 3)
      }
      if let v = _storage._input {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
      if !_storage._payment.isEmpty {
        try visitor.visitSingularStringField(value: _storage._payment, fieldNumber: 5)
      }
      if !_storage._receiver.isEmpty {
        try visitor.visitSingularStringField(value: _storage._receiver, fieldNumber: 6)
      }
      if !_storage._sender.isEmpty {
        try visitor.visitSingularStringField(value: _storage._sender, fieldNumber: 7)
      }
      if !_storage._fee.isEmpty {
        try visitor.visitSingularStringField(value: _storage._fee, fieldNumber: 8)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Common_SignParam, rhs: Common_SignParam) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._chainType != rhs_storage._chainType {return false}
        if _storage._path != rhs_storage._path {return false}
        if _storage._network != rhs_storage._network {return false}
        if _storage._input != rhs_storage._input {return false}
        if _storage._payment != rhs_storage._payment {return false}
        if _storage._receiver != rhs_storage._receiver {return false}
        if _storage._sender != rhs_storage._sender {return false}
        if _storage._fee != rhs_storage._fee {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
