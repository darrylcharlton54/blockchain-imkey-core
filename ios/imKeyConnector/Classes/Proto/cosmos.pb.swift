// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos.proto
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

public struct Cosmosapi_Coin {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var amount: String = String()

  public var denom: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Cosmosapi_StdFee {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var amount: [Cosmosapi_Coin] = []

  public var gas: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Cosmosapi_SignData {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var accountNumber: String {
    get {return _storage._accountNumber}
    set {_uniqueStorage()._accountNumber = newValue}
  }

  public var chainID: String {
    get {return _storage._chainID}
    set {_uniqueStorage()._chainID = newValue}
  }

  public var fee: Cosmosapi_StdFee {
    get {return _storage._fee ?? Cosmosapi_StdFee()}
    set {_uniqueStorage()._fee = newValue}
  }
  /// Returns true if `fee` has been explicitly set.
  public var hasFee: Bool {return _storage._fee != nil}
  /// Clears the value of `fee`. Subsequent reads from it will return its default value.
  public mutating func clearFee() {_uniqueStorage()._fee = nil}

  public var memo: String {
    get {return _storage._memo}
    set {_uniqueStorage()._memo = newValue}
  }

  public var msgs: [Cosmosapi_Msg] {
    get {return _storage._msgs}
    set {_uniqueStorage()._msgs = newValue}
  }

  public var sequence: String {
    get {return _storage._sequence}
    set {_uniqueStorage()._sequence = newValue}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

public struct Cosmosapi_Msg {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var type: String {
    get {return _storage._type}
    set {_uniqueStorage()._type = newValue}
  }

  public var value: Cosmosapi_MsgValue {
    get {return _storage._value ?? Cosmosapi_MsgValue()}
    set {_uniqueStorage()._value = newValue}
  }
  /// Returns true if `value` has been explicitly set.
  public var hasValue: Bool {return _storage._value != nil}
  /// Clears the value of `value`. Subsequent reads from it will return its default value.
  public mutating func clearValue() {_uniqueStorage()._value = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

public struct Cosmosapi_MsgValue {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var amount: [Cosmosapi_Coin] = []

  public var delegatorAddress: String = String()

  public var validatorAddress: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Cosmosapi_CosmosTxReq {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var signData: Cosmosapi_SignData {
    get {return _storage._signData ?? Cosmosapi_SignData()}
    set {_uniqueStorage()._signData = newValue}
  }
  /// Returns true if `signData` has been explicitly set.
  public var hasSignData: Bool {return _storage._signData != nil}
  /// Clears the value of `signData`. Subsequent reads from it will return its default value.
  public mutating func clearSignData() {_uniqueStorage()._signData = nil}

  public var path: String {
    get {return _storage._path}
    set {_uniqueStorage()._path = newValue}
  }

  public var paymentDis: String {
    get {return _storage._paymentDis}
    set {_uniqueStorage()._paymentDis = newValue}
  }

  public var toDis: String {
    get {return _storage._toDis}
    set {_uniqueStorage()._toDis = newValue}
  }

  public var fromDis: String {
    get {return _storage._fromDis}
    set {_uniqueStorage()._fromDis = newValue}
  }

  public var feeDis: String {
    get {return _storage._feeDis}
    set {_uniqueStorage()._feeDis = newValue}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

public struct Cosmosapi_CosmosTxRes {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var txData: String = String()

  public var txHash: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Cosmosapi_CosmosAddressReq {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var path: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Cosmosapi_CosmosAddressRes {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var address: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmosapi"

extension Cosmosapi_Coin: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Coin"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "amount"),
    2: .same(proto: "denom"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.amount)
      case 2: try decoder.decodeSingularStringField(value: &self.denom)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.amount.isEmpty {
      try visitor.visitSingularStringField(value: self.amount, fieldNumber: 1)
    }
    if !self.denom.isEmpty {
      try visitor.visitSingularStringField(value: self.denom, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmosapi_Coin, rhs: Cosmosapi_Coin) -> Bool {
    if lhs.amount != rhs.amount {return false}
    if lhs.denom != rhs.denom {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmosapi_StdFee: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".StdFee"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "amount"),
    2: .same(proto: "gas"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.amount)
      case 2: try decoder.decodeSingularStringField(value: &self.gas)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.amount.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.amount, fieldNumber: 1)
    }
    if !self.gas.isEmpty {
      try visitor.visitSingularStringField(value: self.gas, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmosapi_StdFee, rhs: Cosmosapi_StdFee) -> Bool {
    if lhs.amount != rhs.amount {return false}
    if lhs.gas != rhs.gas {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmosapi_SignData: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SignData"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "account_number"),
    2: .standard(proto: "chain_id"),
    3: .same(proto: "fee"),
    4: .same(proto: "memo"),
    5: .same(proto: "msgs"),
    6: .same(proto: "sequence"),
  ]

  fileprivate class _StorageClass {
    var _accountNumber: String = String()
    var _chainID: String = String()
    var _fee: Cosmosapi_StdFee? = nil
    var _memo: String = String()
    var _msgs: [Cosmosapi_Msg] = []
    var _sequence: String = String()

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _accountNumber = source._accountNumber
      _chainID = source._chainID
      _fee = source._fee
      _memo = source._memo
      _msgs = source._msgs
      _sequence = source._sequence
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._accountNumber)
        case 2: try decoder.decodeSingularStringField(value: &_storage._chainID)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._fee)
        case 4: try decoder.decodeSingularStringField(value: &_storage._memo)
        case 5: try decoder.decodeRepeatedMessageField(value: &_storage._msgs)
        case 6: try decoder.decodeSingularStringField(value: &_storage._sequence)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._accountNumber.isEmpty {
        try visitor.visitSingularStringField(value: _storage._accountNumber, fieldNumber: 1)
      }
      if !_storage._chainID.isEmpty {
        try visitor.visitSingularStringField(value: _storage._chainID, fieldNumber: 2)
      }
      if let v = _storage._fee {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
      if !_storage._memo.isEmpty {
        try visitor.visitSingularStringField(value: _storage._memo, fieldNumber: 4)
      }
      if !_storage._msgs.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._msgs, fieldNumber: 5)
      }
      if !_storage._sequence.isEmpty {
        try visitor.visitSingularStringField(value: _storage._sequence, fieldNumber: 6)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmosapi_SignData, rhs: Cosmosapi_SignData) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._accountNumber != rhs_storage._accountNumber {return false}
        if _storage._chainID != rhs_storage._chainID {return false}
        if _storage._fee != rhs_storage._fee {return false}
        if _storage._memo != rhs_storage._memo {return false}
        if _storage._msgs != rhs_storage._msgs {return false}
        if _storage._sequence != rhs_storage._sequence {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmosapi_Msg: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Msg"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "type"),
    2: .same(proto: "value"),
  ]

  fileprivate class _StorageClass {
    var _type: String = String()
    var _value: Cosmosapi_MsgValue? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _type = source._type
      _value = source._value
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._type)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._value)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._type.isEmpty {
        try visitor.visitSingularStringField(value: _storage._type, fieldNumber: 1)
      }
      if let v = _storage._value {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmosapi_Msg, rhs: Cosmosapi_Msg) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._type != rhs_storage._type {return false}
        if _storage._value != rhs_storage._value {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmosapi_MsgValue: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MsgValue"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "amount"),
    2: .standard(proto: "delegator_address"),
    3: .standard(proto: "validator_address"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.amount)
      case 2: try decoder.decodeSingularStringField(value: &self.delegatorAddress)
      case 3: try decoder.decodeSingularStringField(value: &self.validatorAddress)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.amount.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.amount, fieldNumber: 1)
    }
    if !self.delegatorAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.delegatorAddress, fieldNumber: 2)
    }
    if !self.validatorAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.validatorAddress, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmosapi_MsgValue, rhs: Cosmosapi_MsgValue) -> Bool {
    if lhs.amount != rhs.amount {return false}
    if lhs.delegatorAddress != rhs.delegatorAddress {return false}
    if lhs.validatorAddress != rhs.validatorAddress {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmosapi_CosmosTxReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".CosmosTxReq"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "signData"),
    2: .same(proto: "path"),
    3: .standard(proto: "payment_dis"),
    4: .standard(proto: "to_dis"),
    5: .standard(proto: "from_dis"),
    6: .standard(proto: "fee_dis"),
  ]

  fileprivate class _StorageClass {
    var _signData: Cosmosapi_SignData? = nil
    var _path: String = String()
    var _paymentDis: String = String()
    var _toDis: String = String()
    var _fromDis: String = String()
    var _feeDis: String = String()

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _signData = source._signData
      _path = source._path
      _paymentDis = source._paymentDis
      _toDis = source._toDis
      _fromDis = source._fromDis
      _feeDis = source._feeDis
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._signData)
        case 2: try decoder.decodeSingularStringField(value: &_storage._path)
        case 3: try decoder.decodeSingularStringField(value: &_storage._paymentDis)
        case 4: try decoder.decodeSingularStringField(value: &_storage._toDis)
        case 5: try decoder.decodeSingularStringField(value: &_storage._fromDis)
        case 6: try decoder.decodeSingularStringField(value: &_storage._feeDis)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._signData {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if !_storage._path.isEmpty {
        try visitor.visitSingularStringField(value: _storage._path, fieldNumber: 2)
      }
      if !_storage._paymentDis.isEmpty {
        try visitor.visitSingularStringField(value: _storage._paymentDis, fieldNumber: 3)
      }
      if !_storage._toDis.isEmpty {
        try visitor.visitSingularStringField(value: _storage._toDis, fieldNumber: 4)
      }
      if !_storage._fromDis.isEmpty {
        try visitor.visitSingularStringField(value: _storage._fromDis, fieldNumber: 5)
      }
      if !_storage._feeDis.isEmpty {
        try visitor.visitSingularStringField(value: _storage._feeDis, fieldNumber: 6)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmosapi_CosmosTxReq, rhs: Cosmosapi_CosmosTxReq) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._signData != rhs_storage._signData {return false}
        if _storage._path != rhs_storage._path {return false}
        if _storage._paymentDis != rhs_storage._paymentDis {return false}
        if _storage._toDis != rhs_storage._toDis {return false}
        if _storage._fromDis != rhs_storage._fromDis {return false}
        if _storage._feeDis != rhs_storage._feeDis {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmosapi_CosmosTxRes: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".CosmosTxRes"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "tx_data"),
    2: .standard(proto: "tx_hash"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.txData)
      case 2: try decoder.decodeSingularStringField(value: &self.txHash)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.txData.isEmpty {
      try visitor.visitSingularStringField(value: self.txData, fieldNumber: 1)
    }
    if !self.txHash.isEmpty {
      try visitor.visitSingularStringField(value: self.txHash, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmosapi_CosmosTxRes, rhs: Cosmosapi_CosmosTxRes) -> Bool {
    if lhs.txData != rhs.txData {return false}
    if lhs.txHash != rhs.txHash {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmosapi_CosmosAddressReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".CosmosAddressReq"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "path"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.path)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.path.isEmpty {
      try visitor.visitSingularStringField(value: self.path, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmosapi_CosmosAddressReq, rhs: Cosmosapi_CosmosAddressReq) -> Bool {
    if lhs.path != rhs.path {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmosapi_CosmosAddressRes: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".CosmosAddressRes"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "address"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.address)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.address.isEmpty {
      try visitor.visitSingularStringField(value: self.address, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmosapi_CosmosAddressRes, rhs: Cosmosapi_CosmosAddressRes) -> Bool {
    if lhs.address != rhs.address {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
