import kaitai_struct_nim_runtime
import options
import /network/some_ip/some_ip_sd

import "some_ip_sd"
type
  SomeIp* = ref object of KaitaiStruct
    `header`*: SomeIp_Header
    `payload`*: KaitaiStruct
    `parent`*: KaitaiStruct
    `rawPayload`*: seq[byte]
  SomeIp_Header* = ref object of KaitaiStruct
    `messageId`*: SomeIp_Header_MessageId
    `length`*: uint32
    `requestId`*: SomeIp_Header_RequestId
    `protocolVersion`*: uint8
    `interfaceVersion`*: uint8
    `messageType`*: SomeIp_Header_MessageTypeEnum
    `returnCode`*: SomeIp_Header_ReturnCodeEnum
    `parent`*: SomeIp
    `rawMessageId`*: seq[byte]
    `rawRequestId`*: seq[byte]
    `isValidServiceDiscoveryInst`*: bool
  SomeIp_Header_MessageTypeEnum* = enum
    request = 0
    request_no_return = 1
    notification = 2
    request_ack = 64
    request_no_return_ack = 65
    notification_ack = 66
    response = 128
    error = 129
    response_ack = 192
    error_ack = 193
  SomeIp_Header_ReturnCodeEnum* = enum
    ok = 0
    not_ok = 1
    unknown_service = 2
    unknown_method = 3
    not_ready = 4
    not_reachable = 5
    time_out = 6
    wrong_protocol_version = 7
    wrong_interface_version = 8
    malformed_message = 9
    wrong_message_type = 10
  SomeIp_Header_MessageId* = ref object of KaitaiStruct
    `serviceId`*: uint16
    `subId`*: bool
    `methodId`*: uint64
    `eventId`*: uint64
    `parent`*: SomeIp_Header
    `valueInst`*: uint32
  SomeIp_Header_RequestId* = ref object of KaitaiStruct
    `clientId`*: uint16
    `sessionId`*: uint16
    `parent`*: SomeIp_Header
    `valueInst`*: uint32

proc read*(_: typedesc[SomeIp], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SomeIp
proc read*(_: typedesc[SomeIp_Header], io: KaitaiStream, root: KaitaiStruct, parent: SomeIp): SomeIp_Header
proc read*(_: typedesc[SomeIp_Header_MessageId], io: KaitaiStream, root: KaitaiStruct, parent: SomeIp_Header): SomeIp_Header_MessageId
proc read*(_: typedesc[SomeIp_Header_RequestId], io: KaitaiStream, root: KaitaiStruct, parent: SomeIp_Header): SomeIp_Header_RequestId

proc isValidServiceDiscovery*(this: SomeIp_Header): bool
proc value*(this: SomeIp_Header_MessageId): uint32
proc value*(this: SomeIp_Header_RequestId): uint32


##[
SOME/IP (Scalable service-Oriented MiddlewarE over IP) is an automotive/embedded
communication protocol which supports remoteprocedure calls, event notifications
and the underlying serialization/wire format.

@see <a href="https://www.autosar.org/fileadmin/user_upload/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPProtocol.pdf">Source</a>
]##
proc read*(_: typedesc[SomeIp], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SomeIp =
  template this: untyped = result
  this = new(SomeIp)
  let root = if root == nil: cast[SomeIp](this) else: cast[SomeIp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = SomeIp_Header.read(this.io, this.root, this)
  this.header = headerExpr
  block:
    let on = this.header.messageId.value
    if on == 4294934784'i64:
      let rawPayloadExpr = this.io.readBytes(int((this.header.length - 8)))
      this.rawPayload = rawPayloadExpr
      let rawPayloadIo = newKaitaiStream(rawPayloadExpr)
      let payloadExpr = SomeIpSd.read(rawPayloadIo, this.root, this)
      this.payload = payloadExpr
    else:
      let payloadExpr = this.io.readBytes(int((this.header.length - 8)))
      this.payload = payloadExpr

proc fromFile*(_: typedesc[SomeIp], filename: string): SomeIp =
  SomeIp.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SomeIp_Header], io: KaitaiStream, root: KaitaiStruct, parent: SomeIp): SomeIp_Header =
  template this: untyped = result
  this = new(SomeIp_Header)
  let root = if root == nil: cast[SomeIp](this) else: cast[SomeIp](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The Message ID shall be a 32 Bit identifier that is used to identify
the RPC call to a method of an application or to identify an event.

  ]##
  let rawMessageIdExpr = this.io.readBytes(int(4))
  this.rawMessageId = rawMessageIdExpr
  let rawMessageIdIo = newKaitaiStream(rawMessageIdExpr)
  let messageIdExpr = SomeIp_Header_MessageId.read(rawMessageIdIo, this.root, this)
  this.messageId = messageIdExpr

  ##[
  [PRS_SOMEIP_00042] Length field shall contain the length in Byte
starting from Request ID/Client ID until the end of the SOME/IP message.

  ]##
  let lengthExpr = this.io.readU4be()
  this.length = lengthExpr

  ##[
  The Request ID allows a provider and subscriber to differentiate
multiple parallel uses of the same method, event, getter or setter.

  ]##
  let rawRequestIdExpr = this.io.readBytes(int(4))
  this.rawRequestId = rawRequestIdExpr
  let rawRequestIdIo = newKaitaiStream(rawRequestIdExpr)
  let requestIdExpr = SomeIp_Header_RequestId.read(rawRequestIdIo, this.root, this)
  this.requestId = requestIdExpr

  ##[
  The Protocol Version identifies the used SOME/IP Header format
(not including the Payload format).

  ]##
  let protocolVersionExpr = this.io.readU1()
  this.protocolVersion = protocolVersionExpr

  ##[
  Interface Version shall be an 8 Bit field that contains the
MajorVersion of the Service Interface.

  ]##
  let interfaceVersionExpr = this.io.readU1()
  this.interfaceVersion = interfaceVersionExpr

  ##[
  The Message Type field is used to differentiate different types of
messages.

  @see "AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.4"
  ]##
  let messageTypeExpr = SomeIp_Header_MessageTypeEnum(this.io.readU1())
  this.messageType = messageTypeExpr

  ##[
  The Return Code shall be used to signal whether a request was
successfully processed.

  @see "AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.5"
  ]##
  let returnCodeExpr = SomeIp_Header_ReturnCodeEnum(this.io.readU1())
  this.returnCode = returnCodeExpr

proc isValidServiceDiscovery(this: SomeIp_Header): bool = 

  ##[
  auxillary value
  @see "AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - section 4.1.2.1 General Requirements"
  ]##
  if this.isValidServiceDiscoveryInst != nil:
    return this.isValidServiceDiscoveryInst
  let isValidServiceDiscoveryInstExpr = bool( ((this.messageId.value == 4294934784'i64) and (this.protocolVersion == 1) and (this.interfaceVersion == 1) and (this.messageType == some_ip.notification) and (this.returnCode == some_ip.ok)) )
  this.isValidServiceDiscoveryInst = isValidServiceDiscoveryInstExpr
  if this.isValidServiceDiscoveryInst != nil:
    return this.isValidServiceDiscoveryInst

proc fromFile*(_: typedesc[SomeIp_Header], filename: string): SomeIp_Header =
  SomeIp_Header.read(newKaitaiFileStream(filename), nil, nil)


##[
[PRS_SOMEIP_00035] The assignment of the Message ID shall be up to
the user. However, the Message ID shall be unique for the whole
system (i.e. the vehicle). TheMessage ID is similar to a CAN ID and
should be handled via a comparable process.
[PRS_SOMEIP_00038] Message IDs of method calls shall be structured in
the ID with 2^16 services with 2^15 methods.

@see "AUTOSAR_PRS_SOMEIPProtocol.pdf 4.1.1.1  Message ID"
]##
proc read*(_: typedesc[SomeIp_Header_MessageId], io: KaitaiStream, root: KaitaiStruct, parent: SomeIp_Header): SomeIp_Header_MessageId =
  template this: untyped = result
  this = new(SomeIp_Header_MessageId)
  let root = if root == nil: cast[SomeIp](this) else: cast[SomeIp](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Service ID
  ]##
  let serviceIdExpr = this.io.readU2be()
  this.serviceId = serviceIdExpr

  ##[
  Single bit to flag, if there is a Method or a Event ID
  ]##
  let subIdExpr = this.io.readBitsIntBe(1) != 0
  this.subId = subIdExpr

  ##[
  Method ID
  @see "AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.1."
  ]##
  if this.subId == false:
    let methodIdExpr = this.io.readBitsIntBe(15)
    this.methodId = methodIdExpr

  ##[
  Event ID
  @see "AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.6"
  ]##
  if this.subId == true:
    let eventIdExpr = this.io.readBitsIntBe(15)
    this.eventId = eventIdExpr

proc value(this: SomeIp_Header_MessageId): uint32 = 

  ##[
  The value provides the undissected Message ID
  ]##
  if this.valueInst != nil:
    return this.valueInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let valueInstExpr = this.io.readU4be()
  this.valueInst = valueInstExpr
  this.io.seek(pos)
  if this.valueInst != nil:
    return this.valueInst

proc fromFile*(_: typedesc[SomeIp_Header_MessageId], filename: string): SomeIp_Header_MessageId =
  SomeIp_Header_MessageId.read(newKaitaiFileStream(filename), nil, nil)


##[
The Request ID allows a provider and subscriber to differentiate
multiple parallel usesof the same method, event, getter or setter.

@see "AUTOSAR_PRS_SOMEIPProtocol.pdf - section 4.1.1.3  Request ID"
]##
proc read*(_: typedesc[SomeIp_Header_RequestId], io: KaitaiStream, root: KaitaiStruct, parent: SomeIp_Header): SomeIp_Header_RequestId =
  template this: untyped = result
  this = new(SomeIp_Header_RequestId)
  let root = if root == nil: cast[SomeIp](this) else: cast[SomeIp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let clientIdExpr = this.io.readU2be()
  this.clientId = clientIdExpr
  let sessionIdExpr = this.io.readU2be()
  this.sessionId = sessionIdExpr

proc value(this: SomeIp_Header_RequestId): uint32 = 

  ##[
  The value provides the undissected Request ID
  ]##
  if this.valueInst != nil:
    return this.valueInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let valueInstExpr = this.io.readU4be()
  this.valueInst = valueInstExpr
  this.io.seek(pos)
  if this.valueInst != nil:
    return this.valueInst

proc fromFile*(_: typedesc[SomeIp_Header_RequestId], filename: string): SomeIp_Header_RequestId =
  SomeIp_Header_RequestId.read(newKaitaiFileStream(filename), nil, nil)

