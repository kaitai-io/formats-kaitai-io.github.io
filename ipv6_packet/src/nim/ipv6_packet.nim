import kaitai_struct_nim_runtime
import options
import /network/protocol_body

import "protocol_body"
type
  Ipv6Packet* = ref object of KaitaiStruct
    `version`*: uint64
    `trafficClass`*: uint64
    `flowLabel`*: uint64
    `payloadLength`*: uint16
    `nextHeaderType`*: uint8
    `hopLimit`*: uint8
    `srcIpv6Addr`*: seq[byte]
    `dstIpv6Addr`*: seq[byte]
    `nextHeader`*: ProtocolBody
    `rest`*: seq[byte]
    `parent`*: KaitaiStruct

proc read*(_: typedesc[Ipv6Packet], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ipv6Packet


proc read*(_: typedesc[Ipv6Packet], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ipv6Packet =
  template this: untyped = result
  this = new(Ipv6Packet)
  let root = if root == nil: cast[Ipv6Packet](this) else: cast[Ipv6Packet](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = this.io.readBitsIntBe(4)
  this.version = versionExpr
  let trafficClassExpr = this.io.readBitsIntBe(8)
  this.trafficClass = trafficClassExpr
  let flowLabelExpr = this.io.readBitsIntBe(20)
  this.flowLabel = flowLabelExpr
  alignToByte(this.io)
  let payloadLengthExpr = this.io.readU2be()
  this.payloadLength = payloadLengthExpr
  let nextHeaderTypeExpr = this.io.readU1()
  this.nextHeaderType = nextHeaderTypeExpr
  let hopLimitExpr = this.io.readU1()
  this.hopLimit = hopLimitExpr
  let srcIpv6AddrExpr = this.io.readBytes(int(16))
  this.srcIpv6Addr = srcIpv6AddrExpr
  let dstIpv6AddrExpr = this.io.readBytes(int(16))
  this.dstIpv6Addr = dstIpv6AddrExpr
  let nextHeaderExpr = ProtocolBody.read(this.io, this.root, this, this.nextHeaderType)
  this.nextHeader = nextHeaderExpr
  let restExpr = this.io.readBytesFull()
  this.rest = restExpr

proc fromFile*(_: typedesc[Ipv6Packet], filename: string): Ipv6Packet =
  Ipv6Packet.read(newKaitaiFileStream(filename), nil, nil)

