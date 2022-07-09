import kaitai_struct_nim_runtime
import options
import /network/protocol_body

import "protocol_body"
type
  Ipv4Packet* = ref object of KaitaiStruct
    `b1`*: uint8
    `b2`*: uint8
    `totalLength`*: uint16
    `identification`*: uint16
    `b67`*: uint16
    `ttl`*: uint8
    `protocol`*: uint8
    `headerChecksum`*: uint16
    `srcIpAddr`*: seq[byte]
    `dstIpAddr`*: seq[byte]
    `options`*: Ipv4Packet_Ipv4Options
    `body`*: ProtocolBody
    `parent`*: KaitaiStruct
    `rawOptions`*: seq[byte]
    `rawBody`*: seq[byte]
    `versionInst`: int
    `versionInstFlag`: bool
    `ihlInst`: int
    `ihlInstFlag`: bool
    `ihlBytesInst`: int
    `ihlBytesInstFlag`: bool
  Ipv4Packet_Ipv4Options* = ref object of KaitaiStruct
    `entries`*: seq[Ipv4Packet_Ipv4Option]
    `parent`*: Ipv4Packet
  Ipv4Packet_Ipv4Option* = ref object of KaitaiStruct
    `b1`*: uint8
    `len`*: uint8
    `body`*: seq[byte]
    `parent`*: Ipv4Packet_Ipv4Options
    `copyInst`: int
    `copyInstFlag`: bool
    `optClassInst`: int
    `optClassInstFlag`: bool
    `numberInst`: int
    `numberInstFlag`: bool

proc read*(_: typedesc[Ipv4Packet], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ipv4Packet
proc read*(_: typedesc[Ipv4Packet_Ipv4Options], io: KaitaiStream, root: KaitaiStruct, parent: Ipv4Packet): Ipv4Packet_Ipv4Options
proc read*(_: typedesc[Ipv4Packet_Ipv4Option], io: KaitaiStream, root: KaitaiStruct, parent: Ipv4Packet_Ipv4Options): Ipv4Packet_Ipv4Option

proc version*(this: Ipv4Packet): int
proc ihl*(this: Ipv4Packet): int
proc ihlBytes*(this: Ipv4Packet): int
proc copy*(this: Ipv4Packet_Ipv4Option): int
proc optClass*(this: Ipv4Packet_Ipv4Option): int
proc number*(this: Ipv4Packet_Ipv4Option): int

proc read*(_: typedesc[Ipv4Packet], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ipv4Packet =
  template this: untyped = result
  this = new(Ipv4Packet)
  let root = if root == nil: cast[Ipv4Packet](this) else: cast[Ipv4Packet](root)
  this.io = io
  this.root = root
  this.parent = parent

  let b1Expr = this.io.readU1()
  this.b1 = b1Expr
  let b2Expr = this.io.readU1()
  this.b2 = b2Expr
  let totalLengthExpr = this.io.readU2be()
  this.totalLength = totalLengthExpr
  let identificationExpr = this.io.readU2be()
  this.identification = identificationExpr
  let b67Expr = this.io.readU2be()
  this.b67 = b67Expr
  let ttlExpr = this.io.readU1()
  this.ttl = ttlExpr
  let protocolExpr = this.io.readU1()
  this.protocol = protocolExpr
  let headerChecksumExpr = this.io.readU2be()
  this.headerChecksum = headerChecksumExpr
  let srcIpAddrExpr = this.io.readBytes(int(4))
  this.srcIpAddr = srcIpAddrExpr
  let dstIpAddrExpr = this.io.readBytes(int(4))
  this.dstIpAddr = dstIpAddrExpr
  let rawOptionsExpr = this.io.readBytes(int((this.ihlBytes - 20)))
  this.rawOptions = rawOptionsExpr
  let rawOptionsIo = newKaitaiStream(rawOptionsExpr)
  let optionsExpr = Ipv4Packet_Ipv4Options.read(rawOptionsIo, this.root, this)
  this.options = optionsExpr
  let rawBodyExpr = this.io.readBytes(int((this.totalLength - this.ihlBytes)))
  this.rawBody = rawBodyExpr
  let rawBodyIo = newKaitaiStream(rawBodyExpr)
  let bodyExpr = ProtocolBody.read(rawBodyIo, this.root, this, this.protocol)
  this.body = bodyExpr

proc version(this: Ipv4Packet): int = 
  if this.versionInstFlag:
    return this.versionInst
  let versionInstExpr = int(((this.b1 and 240) shr 4))
  this.versionInst = versionInstExpr
  this.versionInstFlag = true
  return this.versionInst

proc ihl(this: Ipv4Packet): int = 
  if this.ihlInstFlag:
    return this.ihlInst
  let ihlInstExpr = int((this.b1 and 15))
  this.ihlInst = ihlInstExpr
  this.ihlInstFlag = true
  return this.ihlInst

proc ihlBytes(this: Ipv4Packet): int = 
  if this.ihlBytesInstFlag:
    return this.ihlBytesInst
  let ihlBytesInstExpr = int((this.ihl * 4))
  this.ihlBytesInst = ihlBytesInstExpr
  this.ihlBytesInstFlag = true
  return this.ihlBytesInst

proc fromFile*(_: typedesc[Ipv4Packet], filename: string): Ipv4Packet =
  Ipv4Packet.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ipv4Packet_Ipv4Options], io: KaitaiStream, root: KaitaiStruct, parent: Ipv4Packet): Ipv4Packet_Ipv4Options =
  template this: untyped = result
  this = new(Ipv4Packet_Ipv4Options)
  let root = if root == nil: cast[Ipv4Packet](this) else: cast[Ipv4Packet](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Ipv4Packet_Ipv4Option.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[Ipv4Packet_Ipv4Options], filename: string): Ipv4Packet_Ipv4Options =
  Ipv4Packet_Ipv4Options.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ipv4Packet_Ipv4Option], io: KaitaiStream, root: KaitaiStruct, parent: Ipv4Packet_Ipv4Options): Ipv4Packet_Ipv4Option =
  template this: untyped = result
  this = new(Ipv4Packet_Ipv4Option)
  let root = if root == nil: cast[Ipv4Packet](this) else: cast[Ipv4Packet](root)
  this.io = io
  this.root = root
  this.parent = parent

  let b1Expr = this.io.readU1()
  this.b1 = b1Expr
  let lenExpr = this.io.readU1()
  this.len = lenExpr
  let bodyExpr = this.io.readBytes(int((if this.len > 2: (this.len - 2) else: 0)))
  this.body = bodyExpr

proc copy(this: Ipv4Packet_Ipv4Option): int = 
  if this.copyInstFlag:
    return this.copyInst
  let copyInstExpr = int(((this.b1 and 128) shr 7))
  this.copyInst = copyInstExpr
  this.copyInstFlag = true
  return this.copyInst

proc optClass(this: Ipv4Packet_Ipv4Option): int = 
  if this.optClassInstFlag:
    return this.optClassInst
  let optClassInstExpr = int(((this.b1 and 96) shr 5))
  this.optClassInst = optClassInstExpr
  this.optClassInstFlag = true
  return this.optClassInst

proc number(this: Ipv4Packet_Ipv4Option): int = 
  if this.numberInstFlag:
    return this.numberInst
  let numberInstExpr = int((this.b1 and 31))
  this.numberInst = numberInstExpr
  this.numberInstFlag = true
  return this.numberInst

proc fromFile*(_: typedesc[Ipv4Packet_Ipv4Option], filename: string): Ipv4Packet_Ipv4Option =
  Ipv4Packet_Ipv4Option.read(newKaitaiFileStream(filename), nil, nil)

