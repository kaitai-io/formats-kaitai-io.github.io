import kaitai_struct_nim_runtime
import options

type
  TcpSegment* = ref object of KaitaiStruct
    `srcPort`*: uint16
    `dstPort`*: uint16
    `seqNum`*: uint32
    `ackNum`*: uint32
    `b12`*: uint8
    `b13`*: uint8
    `windowSize`*: uint16
    `checksum`*: uint16
    `urgentPointer`*: uint16
    `body`*: seq[byte]
    `parent`*: KaitaiStruct

proc read*(_: typedesc[TcpSegment], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): TcpSegment



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

  let srcPortExpr = this.io.readU2be()
  this.srcPort = srcPortExpr
  let dstPortExpr = this.io.readU2be()
  this.dstPort = dstPortExpr
  let seqNumExpr = this.io.readU4be()
  this.seqNum = seqNumExpr
  let ackNumExpr = this.io.readU4be()
  this.ackNum = ackNumExpr
  let b12Expr = this.io.readU1()
  this.b12 = b12Expr
  let b13Expr = this.io.readU1()
  this.b13 = b13Expr
  let windowSizeExpr = this.io.readU2be()
  this.windowSize = windowSizeExpr
  let checksumExpr = this.io.readU2be()
  this.checksum = checksumExpr
  let urgentPointerExpr = this.io.readU2be()
  this.urgentPointer = urgentPointerExpr
  let bodyExpr = this.io.readBytesFull()
  this.body = bodyExpr

proc fromFile*(_: typedesc[TcpSegment], filename: string): TcpSegment =
  TcpSegment.read(newKaitaiFileStream(filename), nil, nil)

