import kaitai_struct_nim_runtime
import options

type
  UdpDatagram* = ref object of KaitaiStruct
    `srcPort`*: uint16
    `dstPort`*: uint16
    `length`*: uint16
    `checksum`*: uint16
    `body`*: seq[byte]
    `parent`*: KaitaiStruct

proc read*(_: typedesc[UdpDatagram], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UdpDatagram



##[
UDP is a simple stateless transport layer (AKA OSI layer 4)
protocol, one of the core Internet protocols. It provides source and
destination ports, basic checksumming, but provides not guarantees
of delivery, order of packets, or duplicate delivery.

]##
proc read*(_: typedesc[UdpDatagram], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UdpDatagram =
  template this: untyped = result
  this = new(UdpDatagram)
  let root = if root == nil: cast[UdpDatagram](this) else: cast[UdpDatagram](root)
  this.io = io
  this.root = root
  this.parent = parent

  let srcPortExpr = this.io.readU2be()
  this.srcPort = srcPortExpr
  let dstPortExpr = this.io.readU2be()
  this.dstPort = dstPortExpr
  let lengthExpr = this.io.readU2be()
  this.length = lengthExpr
  let checksumExpr = this.io.readU2be()
  this.checksum = checksumExpr
  let bodyExpr = this.io.readBytes(int(this.length - 8))
  this.body = bodyExpr

proc fromFile*(_: typedesc[UdpDatagram], filename: string): UdpDatagram =
  UdpDatagram.read(newKaitaiFileStream(filename), nil, nil)

