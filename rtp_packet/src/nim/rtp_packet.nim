import kaitai_struct_nim_runtime
import options

type
  RtpPacket* = ref object of KaitaiStruct
    `version`*: uint64
    `hasPadding`*: bool
    `hasExtension`*: bool
    `csrcCount`*: uint64
    `marker`*: bool
    `payloadType`*: RtpPacket_PayloadTypeEnum
    `sequenceNumber`*: uint16
    `timestamp`*: uint32
    `ssrc`*: uint32
    `headerExtension`*: RtpPacket_HeaderExtention
    `data`*: seq[byte]
    `padding`*: seq[byte]
    `parent`*: KaitaiStruct
    `lenPaddingIfExistsInst`: uint8
    `lenPaddingIfExistsInstFlag`: bool
    `lenPaddingInst`: uint8
    `lenPaddingInstFlag`: bool
  RtpPacket_PayloadTypeEnum* = enum
    pcmu = 0
    reserved1 = 1
    reserved2 = 2
    gsm = 3
    g723 = 4
    dvi4_1 = 5
    dvi4_2 = 6
    lpc = 7
    pcma = 8
    g722 = 9
    l16_1 = 10
    l16_2 = 11
    qcelp = 12
    cn = 13
    mpa = 14
    g728 = 15
    dvi4_3 = 16
    dvi4_4 = 17
    g729 = 18
    reserved19 = 19
    unassigned20 = 20
    unassigned21 = 21
    unassigned22 = 22
    unassigned23 = 23
    unassigned24 = 24
    celb = 25
    jpeg = 26
    unassigned27 = 27
    nv = 28
    unassigned29 = 29
    unassigned30 = 30
    h261 = 31
    mpv = 32
    mp2t = 33
    h263 = 34
    mpeg_ps = 96
  RtpPacket_HeaderExtention* = ref object of KaitaiStruct
    `id`*: uint16
    `length`*: uint16
    `parent`*: RtpPacket

proc read*(_: typedesc[RtpPacket], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): RtpPacket
proc read*(_: typedesc[RtpPacket_HeaderExtention], io: KaitaiStream, root: KaitaiStruct, parent: RtpPacket): RtpPacket_HeaderExtention

proc lenPaddingIfExists*(this: RtpPacket): uint8
proc lenPadding*(this: RtpPacket): uint8


##[
The Real-time Transport Protocol (RTP) is a widely used network
protocol for transmitting audio or video. It usually works with the
RTP Control Protocol (RTCP). The transmission can be based on
Transmission Control Protocol (TCP) or User Datagram Protocol (UDP).

]##
proc read*(_: typedesc[RtpPacket], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): RtpPacket =
  template this: untyped = result
  this = new(RtpPacket)
  let root = if root == nil: cast[RtpPacket](this) else: cast[RtpPacket](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = this.io.readBitsIntBe(2)
  this.version = versionExpr
  let hasPaddingExpr = this.io.readBitsIntBe(1) != 0
  this.hasPadding = hasPaddingExpr
  let hasExtensionExpr = this.io.readBitsIntBe(1) != 0
  this.hasExtension = hasExtensionExpr
  let csrcCountExpr = this.io.readBitsIntBe(4)
  this.csrcCount = csrcCountExpr
  let markerExpr = this.io.readBitsIntBe(1) != 0
  this.marker = markerExpr
  let payloadTypeExpr = RtpPacket_PayloadTypeEnum(this.io.readBitsIntBe(7))
  this.payloadType = payloadTypeExpr
  alignToByte(this.io)
  let sequenceNumberExpr = this.io.readU2be()
  this.sequenceNumber = sequenceNumberExpr
  let timestampExpr = this.io.readU4be()
  this.timestamp = timestampExpr
  let ssrcExpr = this.io.readU4be()
  this.ssrc = ssrcExpr
  if this.hasExtension:
    let headerExtensionExpr = RtpPacket_HeaderExtention.read(this.io, this.root, this)
    this.headerExtension = headerExtensionExpr

  ##[
  Payload without padding.
  ]##
  let dataExpr = this.io.readBytes(int(((this.io.size - this.io.pos) - this.lenPadding)))
  this.data = dataExpr
  let paddingExpr = this.io.readBytes(int(this.lenPadding))
  this.padding = paddingExpr

proc lenPaddingIfExists(this: RtpPacket): uint8 = 

  ##[
  If padding bit is enabled, last byte of data contains number of
bytes appended to the payload as padding.

  ]##
  if this.lenPaddingIfExistsInstFlag:
    return this.lenPaddingIfExistsInst
  if this.hasPadding:
    let pos = this.io.pos()
    this.io.seek(int((this.io.size - 1)))
    let lenPaddingIfExistsInstExpr = this.io.readU1()
    this.lenPaddingIfExistsInst = lenPaddingIfExistsInstExpr
    this.io.seek(pos)
  this.lenPaddingIfExistsInstFlag = true
  return this.lenPaddingIfExistsInst

proc lenPadding(this: RtpPacket): uint8 = 

  ##[
  Always returns number of padding bytes to in the payload.
  ]##
  if this.lenPaddingInstFlag:
    return this.lenPaddingInst
  let lenPaddingInstExpr = uint8((if this.hasPadding: this.lenPaddingIfExists else: 0))
  this.lenPaddingInst = lenPaddingInstExpr
  this.lenPaddingInstFlag = true
  return this.lenPaddingInst

proc fromFile*(_: typedesc[RtpPacket], filename: string): RtpPacket =
  RtpPacket.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RtpPacket_HeaderExtention], io: KaitaiStream, root: KaitaiStruct, parent: RtpPacket): RtpPacket_HeaderExtention =
  template this: untyped = result
  this = new(RtpPacket_HeaderExtention)
  let root = if root == nil: cast[RtpPacket](this) else: cast[RtpPacket](root)
  this.io = io
  this.root = root
  this.parent = parent

  let idExpr = this.io.readU2be()
  this.id = idExpr
  let lengthExpr = this.io.readU2be()
  this.length = lengthExpr

proc fromFile*(_: typedesc[RtpPacket_HeaderExtention], filename: string): RtpPacket_HeaderExtention =
  RtpPacket_HeaderExtention.read(newKaitaiFileStream(filename), nil, nil)

