import kaitai_struct_nim_runtime
import options
import rtp_packet

type
  Rtpdump* = ref object of KaitaiStruct
    `fileHeader`*: Rtpdump_HeaderT
    `packets`*: seq[Rtpdump_PacketT]
    `parent`*: KaitaiStruct
  Rtpdump_HeaderT* = ref object of KaitaiStruct
    `shebang`*: seq[byte]
    `space`*: seq[byte]
    `ip`*: string
    `port`*: string
    `startSec`*: uint32
    `startUsec`*: uint32
    `ip2`*: uint32
    `port2`*: uint16
    `padding`*: uint16
    `parent`*: Rtpdump
  Rtpdump_PacketT* = ref object of KaitaiStruct
    `length`*: uint16
    `lenBody`*: uint16
    `packetUsec`*: uint32
    `body`*: RtpPacket
    `parent`*: Rtpdump
    `rawBody`*: seq[byte]

proc read*(_: typedesc[Rtpdump], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Rtpdump
proc read*(_: typedesc[Rtpdump_HeaderT], io: KaitaiStream, root: KaitaiStruct, parent: Rtpdump): Rtpdump_HeaderT
proc read*(_: typedesc[Rtpdump_PacketT], io: KaitaiStream, root: KaitaiStruct, parent: Rtpdump): Rtpdump_PacketT



##[
rtpdump is a format used by rtptools to record and replay
rtp data from network capture.

@see <a href="https://chromium.googlesource.com/external/webrtc/stable/talk/+/master/media/base/rtpdump.h">Source</a>
]##
proc read*(_: typedesc[Rtpdump], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Rtpdump =
  template this: untyped = result
  this = new(Rtpdump)
  let root = if root == nil: cast[Rtpdump](this) else: cast[Rtpdump](root)
  this.io = io
  this.root = root
  this.parent = parent

  let fileHeaderExpr = Rtpdump_HeaderT.read(this.io, this.root, this)
  this.fileHeader = fileHeaderExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = Rtpdump_PacketT.read(this.io, this.root, this)
      this.packets.add(it)
      inc i

proc fromFile*(_: typedesc[Rtpdump], filename: string): Rtpdump =
  Rtpdump.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Rtpdump_HeaderT], io: KaitaiStream, root: KaitaiStruct, parent: Rtpdump): Rtpdump_HeaderT =
  template this: untyped = result
  this = new(Rtpdump_HeaderT)
  let root = if root == nil: cast[Rtpdump](this) else: cast[Rtpdump](root)
  this.io = io
  this.root = root
  this.parent = parent

  let shebangExpr = this.io.readBytes(int(12))
  this.shebang = shebangExpr
  let spaceExpr = this.io.readBytes(int(1))
  this.space = spaceExpr
  let ipExpr = encode(this.io.readBytesTerm(47, false, true, true), "ASCII")
  this.ip = ipExpr
  let portExpr = encode(this.io.readBytesTerm(10, false, true, true), "ASCII")
  this.port = portExpr

  ##[
  start of recording, the seconds part.

  ]##
  let startSecExpr = this.io.readU4be()
  this.startSec = startSecExpr

  ##[
  start of recording, the microseconds part.

  ]##
  let startUsecExpr = this.io.readU4be()
  this.startUsec = startUsecExpr

  ##[
  network source.

  ]##
  let ip2Expr = this.io.readU4be()
  this.ip2 = ip2Expr

  ##[
  port.

  ]##
  let port2Expr = this.io.readU2be()
  this.port2 = port2Expr

  ##[
  2 bytes padding.

  ]##
  let paddingExpr = this.io.readU2be()
  this.padding = paddingExpr

proc fromFile*(_: typedesc[Rtpdump_HeaderT], filename: string): Rtpdump_HeaderT =
  Rtpdump_HeaderT.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Rtpdump_PacketT], io: KaitaiStream, root: KaitaiStruct, parent: Rtpdump): Rtpdump_PacketT =
  template this: untyped = result
  this = new(Rtpdump_PacketT)
  let root = if root == nil: cast[Rtpdump](this) else: cast[Rtpdump](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  packet length (including this header).

  ]##
  let lengthExpr = this.io.readU2be()
  this.length = lengthExpr

  ##[
  payload length.

  ]##
  let lenBodyExpr = this.io.readU2be()
  this.lenBody = lenBodyExpr

  ##[
  timestamp of packet since the start.

  ]##
  let packetUsecExpr = this.io.readU4be()
  this.packetUsec = packetUsecExpr
  let rawBodyExpr = this.io.readBytes(int(this.lenBody))
  this.rawBody = rawBodyExpr
  let rawBodyIo = newKaitaiStream(rawBodyExpr)
  let bodyExpr = RtpPacket.read(rawBodyIo, nil, nil)
  this.body = bodyExpr

proc fromFile*(_: typedesc[Rtpdump_PacketT], filename: string): Rtpdump_PacketT =
  Rtpdump_PacketT.read(newKaitaiFileStream(filename), nil, nil)

