import kaitai_struct_nim_runtime
import options

type
  IcmpPacket* = ref object of KaitaiStruct
    `icmpType`*: IcmpPacket_IcmpTypeEnum
    `destinationUnreachable`*: IcmpPacket_DestinationUnreachableMsg
    `timeExceeded`*: IcmpPacket_TimeExceededMsg
    `echo`*: IcmpPacket_EchoMsg
    `parent`*: KaitaiStruct
  IcmpPacket_IcmpTypeEnum* = enum
    echo_reply = 0
    destination_unreachable = 3
    source_quench = 4
    redirect = 5
    echo = 8
    time_exceeded = 11
  IcmpPacket_DestinationUnreachableMsg* = ref object of KaitaiStruct
    `code`*: IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode
    `checksum`*: uint16
    `parent`*: IcmpPacket
  IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode* = enum
    net_unreachable = 0
    host_unreachable = 1
    protocol_unreachable = 2
    port_unreachable = 3
    fragmentation_needed_and_df_set = 4
    source_route_failed = 5
    dst_net_unkown = 6
    sdt_host_unkown = 7
    src_isolated = 8
    net_prohibited_by_admin = 9
    host_prohibited_by_admin = 10
    net_unreachable_for_tos = 11
    host_unreachable_for_tos = 12
    communication_prohibited_by_admin = 13
    host_precedence_violation = 14
    precedence_cuttoff_in_effect = 15
  IcmpPacket_EchoMsg* = ref object of KaitaiStruct
    `code`*: seq[byte]
    `checksum`*: uint16
    `identifier`*: uint16
    `seqNum`*: uint16
    `data`*: seq[byte]
    `parent`*: IcmpPacket
  IcmpPacket_TimeExceededMsg* = ref object of KaitaiStruct
    `code`*: IcmpPacket_TimeExceededMsg_TimeExceededCode
    `checksum`*: uint16
    `parent`*: IcmpPacket
  IcmpPacket_TimeExceededMsg_TimeExceededCode* = enum
    time_to_live_exceeded_in_transit = 0
    fragment_reassembly_time_exceeded = 1

proc read*(_: typedesc[IcmpPacket], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): IcmpPacket
proc read*(_: typedesc[IcmpPacket_DestinationUnreachableMsg], io: KaitaiStream, root: KaitaiStruct, parent: IcmpPacket): IcmpPacket_DestinationUnreachableMsg
proc read*(_: typedesc[IcmpPacket_EchoMsg], io: KaitaiStream, root: KaitaiStruct, parent: IcmpPacket): IcmpPacket_EchoMsg
proc read*(_: typedesc[IcmpPacket_TimeExceededMsg], io: KaitaiStream, root: KaitaiStruct, parent: IcmpPacket): IcmpPacket_TimeExceededMsg


proc read*(_: typedesc[IcmpPacket], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): IcmpPacket =
  template this: untyped = result
  this = new(IcmpPacket)
  let root = if root == nil: cast[IcmpPacket](this) else: cast[IcmpPacket](root)
  this.io = io
  this.root = root
  this.parent = parent

  let icmpTypeExpr = IcmpPacket_IcmpTypeEnum(this.io.readU1())
  this.icmpType = icmpTypeExpr
  if this.icmpType == icmp_packet.destination_unreachable:
    let destinationUnreachableExpr = IcmpPacket_DestinationUnreachableMsg.read(this.io, this.root, this)
    this.destinationUnreachable = destinationUnreachableExpr
  if this.icmpType == icmp_packet.time_exceeded:
    let timeExceededExpr = IcmpPacket_TimeExceededMsg.read(this.io, this.root, this)
    this.timeExceeded = timeExceededExpr
  if  ((this.icmpType == icmp_packet.echo) or (this.icmpType == icmp_packet.echo_reply)) :
    let echoExpr = IcmpPacket_EchoMsg.read(this.io, this.root, this)
    this.echo = echoExpr

proc fromFile*(_: typedesc[IcmpPacket], filename: string): IcmpPacket =
  IcmpPacket.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[IcmpPacket_DestinationUnreachableMsg], io: KaitaiStream, root: KaitaiStruct, parent: IcmpPacket): IcmpPacket_DestinationUnreachableMsg =
  template this: untyped = result
  this = new(IcmpPacket_DestinationUnreachableMsg)
  let root = if root == nil: cast[IcmpPacket](this) else: cast[IcmpPacket](root)
  this.io = io
  this.root = root
  this.parent = parent

  let codeExpr = IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode(this.io.readU1())
  this.code = codeExpr
  let checksumExpr = this.io.readU2be()
  this.checksum = checksumExpr

proc fromFile*(_: typedesc[IcmpPacket_DestinationUnreachableMsg], filename: string): IcmpPacket_DestinationUnreachableMsg =
  IcmpPacket_DestinationUnreachableMsg.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[IcmpPacket_EchoMsg], io: KaitaiStream, root: KaitaiStruct, parent: IcmpPacket): IcmpPacket_EchoMsg =
  template this: untyped = result
  this = new(IcmpPacket_EchoMsg)
  let root = if root == nil: cast[IcmpPacket](this) else: cast[IcmpPacket](root)
  this.io = io
  this.root = root
  this.parent = parent

  let codeExpr = this.io.readBytes(int(1))
  this.code = codeExpr
  let checksumExpr = this.io.readU2be()
  this.checksum = checksumExpr
  let identifierExpr = this.io.readU2be()
  this.identifier = identifierExpr
  let seqNumExpr = this.io.readU2be()
  this.seqNum = seqNumExpr
  let dataExpr = this.io.readBytesFull()
  this.data = dataExpr

proc fromFile*(_: typedesc[IcmpPacket_EchoMsg], filename: string): IcmpPacket_EchoMsg =
  IcmpPacket_EchoMsg.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[IcmpPacket_TimeExceededMsg], io: KaitaiStream, root: KaitaiStruct, parent: IcmpPacket): IcmpPacket_TimeExceededMsg =
  template this: untyped = result
  this = new(IcmpPacket_TimeExceededMsg)
  let root = if root == nil: cast[IcmpPacket](this) else: cast[IcmpPacket](root)
  this.io = io
  this.root = root
  this.parent = parent

  let codeExpr = IcmpPacket_TimeExceededMsg_TimeExceededCode(this.io.readU1())
  this.code = codeExpr
  let checksumExpr = this.io.readU2be()
  this.checksum = checksumExpr

proc fromFile*(_: typedesc[IcmpPacket_TimeExceededMsg], filename: string): IcmpPacket_TimeExceededMsg =
  IcmpPacket_TimeExceededMsg.read(newKaitaiFileStream(filename), nil, nil)

