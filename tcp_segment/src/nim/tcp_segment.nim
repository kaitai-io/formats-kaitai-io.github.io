import kaitai_struct_nim_runtime
import options

type
  TcpSegment* = ref object of KaitaiStruct
    `srcPort`*: uint16
    `dstPort`*: uint16
    `seqNum`*: uint32
    `ackNum`*: uint32
    `dataOffset`*: uint64
    `reserved`*: uint64
    `flags`*: TcpSegment_Flags
    `windowSize`*: uint16
    `checksum`*: uint16
    `urgentPointer`*: uint16
    `options`*: seq[byte]
    `body`*: seq[byte]
    `parent`*: KaitaiStruct
  TcpSegment_Flags* = ref object of KaitaiStruct
    `cwr`*: bool
    `ece`*: bool
    `urg`*: bool
    `ack`*: bool
    `psh`*: bool
    `rst`*: bool
    `syn`*: bool
    `fin`*: bool
    `parent`*: TcpSegment

proc read*(_: typedesc[TcpSegment], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): TcpSegment
proc read*(_: typedesc[TcpSegment_Flags], io: KaitaiStream, root: KaitaiStruct, parent: TcpSegment): TcpSegment_Flags



##[
TCP is one of the core Internet protocols on transport layer (AKA
OSI layer 4), providing stateful connections with error checking,
guarantees of delivery, order of segments and avoidance of duplicate
delivery.

]##
proc read*(_: typedesc[TcpSegment], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): TcpSegment =
  template this: untyped = result
  this = new(TcpSegment)
  let root = if root == nil: cast[TcpSegment](this) else: cast[TcpSegment](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Source port
  ]##
  let srcPortExpr = this.io.readU2be()
  this.srcPort = srcPortExpr

  ##[
  Destination port
  ]##
  let dstPortExpr = this.io.readU2be()
  this.dstPort = dstPortExpr

  ##[
  Sequence number
  ]##
  let seqNumExpr = this.io.readU4be()
  this.seqNum = seqNumExpr

  ##[
  Acknowledgment number
  ]##
  let ackNumExpr = this.io.readU4be()
  this.ackNum = ackNumExpr

  ##[
  Data offset (in 32-bit words from the beginning of this type, normally 32 or can be extended if there are any TCP options or padding is present)
  ]##
  let dataOffsetExpr = this.io.readBitsIntBe(4)
  this.dataOffset = dataOffsetExpr
  let reservedExpr = this.io.readBitsIntBe(4)
  this.reserved = reservedExpr
  alignToByte(this.io)
  let flagsExpr = TcpSegment_Flags.read(this.io, this.root, this)
  this.flags = flagsExpr
  let windowSizeExpr = this.io.readU2be()
  this.windowSize = windowSizeExpr
  let checksumExpr = this.io.readU2be()
  this.checksum = checksumExpr
  let urgentPointerExpr = this.io.readU2be()
  this.urgentPointer = urgentPointerExpr
  if ((this.dataOffset * 4) - 20) != 0:
    let optionsExpr = this.io.readBytes(int(((this.dataOffset * 4) - 20)))
    this.options = optionsExpr
  let bodyExpr = this.io.readBytesFull()
  this.body = bodyExpr

proc fromFile*(_: typedesc[TcpSegment], filename: string): TcpSegment =
  TcpSegment.read(newKaitaiFileStream(filename), nil, nil)


##[
TCP header flags as defined "TCP Header Flags" registry.

]##
proc read*(_: typedesc[TcpSegment_Flags], io: KaitaiStream, root: KaitaiStruct, parent: TcpSegment): TcpSegment_Flags =
  template this: untyped = result
  this = new(TcpSegment_Flags)
  let root = if root == nil: cast[TcpSegment](this) else: cast[TcpSegment](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Congestion Window Reduced
  ]##
  let cwrExpr = this.io.readBitsIntBe(1) != 0
  this.cwr = cwrExpr

  ##[
  ECN-Echo
  ]##
  let eceExpr = this.io.readBitsIntBe(1) != 0
  this.ece = eceExpr

  ##[
  Urgent pointer field is significant
  ]##
  let urgExpr = this.io.readBitsIntBe(1) != 0
  this.urg = urgExpr

  ##[
  Acknowledgment field is significant
  ]##
  let ackExpr = this.io.readBitsIntBe(1) != 0
  this.ack = ackExpr

  ##[
  Push function
  ]##
  let pshExpr = this.io.readBitsIntBe(1) != 0
  this.psh = pshExpr

  ##[
  Reset the connection
  ]##
  let rstExpr = this.io.readBitsIntBe(1) != 0
  this.rst = rstExpr

  ##[
  Synchronize sequence numbers
  ]##
  let synExpr = this.io.readBitsIntBe(1) != 0
  this.syn = synExpr

  ##[
  No more data from sender
  ]##
  let finExpr = this.io.readBitsIntBe(1) != 0
  this.fin = finExpr

proc fromFile*(_: typedesc[TcpSegment_Flags], filename: string): TcpSegment_Flags =
  TcpSegment_Flags.read(newKaitaiFileStream(filename), nil, nil)

