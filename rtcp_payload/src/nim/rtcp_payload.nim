import kaitai_struct_nim_runtime
import options

type
  RtcpPayload* = ref object of KaitaiStruct
    `rtcpPackets`*: seq[RtcpPayload_RtcpPacket]
    `parent`*: KaitaiStruct
  RtcpPayload_PayloadType* = enum
    fir = 192
    nack = 193
    ij = 195
    sr = 200
    rr = 201
    sdes = 202
    bye = 203
    app = 204
    rtpfb = 205
    psfb = 206
    xr = 207
    avb = 208
    rsi = 209
  RtcpPayload_SdesSubtype* = enum
    pad = 0
    cname = 1
    name = 2
    email = 3
    phone = 4
    loc = 5
    tool = 6
    note = 7
    priv = 8
  RtcpPayload_PsfbSubtype* = enum
    pli = 1
    sli = 2
    rpsi = 3
    fir = 4
    tstr = 5
    tstn = 6
    vbcm = 7
    afb = 15
  RtcpPayload_RtpfbSubtype* = enum
    nack = 1
    tmmbr = 3
    tmmbn = 4
    rrr = 5
    transport_feedback = 15
  RtcpPayload_PsfbAfbRembPacket* = ref object of KaitaiStruct
    `numSsrc`*: uint8
    `brExp`*: uint64
    `brMantissa`*: uint64
    `ssrcList`*: seq[uint32]
    `parent`*: RtcpPayload_PsfbAfbPacket
    `maxTotalBitrateInst`: int
    `maxTotalBitrateInstFlag`: bool
  RtcpPayload_SrPacket* = ref object of KaitaiStruct
    `ssrc`*: uint32
    `ntpMsw`*: uint32
    `ntpLsw`*: uint32
    `rtpTimestamp`*: uint32
    `senderPacketCount`*: uint32
    `senderOctetCount`*: uint32
    `reportBlock`*: seq[RtcpPayload_ReportBlock]
    `parent`*: RtcpPayload_RtcpPacket
    `ntpInst`: int
    `ntpInstFlag`: bool
  RtcpPayload_RrPacket* = ref object of KaitaiStruct
    `ssrc`*: uint32
    `reportBlock`*: seq[RtcpPayload_ReportBlock]
    `parent`*: RtcpPayload_RtcpPacket
  RtcpPayload_RtcpPacket* = ref object of KaitaiStruct
    `version`*: uint64
    `padding`*: bool
    `subtype`*: uint64
    `payloadType`*: RtcpPayload_PayloadType
    `length`*: uint16
    `body`*: KaitaiStruct
    `parent`*: RtcpPayload
    `rawBody`*: seq[byte]
  RtcpPayload_SdesTlv* = ref object of KaitaiStruct
    `type`*: RtcpPayload_SdesSubtype
    `length`*: uint8
    `value`*: seq[byte]
    `parent`*: RtcpPayload_SourceChunk
  RtcpPayload_ReportBlock* = ref object of KaitaiStruct
    `ssrcSource`*: uint32
    `lostVal`*: uint8
    `highestSeqNumReceived`*: uint32
    `interarrivalJitter`*: uint32
    `lsr`*: uint32
    `dlsr`*: uint32
    `parent`*: KaitaiStruct
    `fractionLostInst`: int
    `fractionLostInstFlag`: bool
    `cumulativePacketsLostInst`: int
    `cumulativePacketsLostInstFlag`: bool
  RtcpPayload_RtpfbTransportFeedbackPacket* = ref object of KaitaiStruct
    `baseSequenceNumber`*: uint16
    `packetStatusCount`*: uint16
    `b4`*: uint32
    `remaining`*: seq[byte]
    `parent`*: RtcpPayload_RtpfbPacket
    `referenceTimeInst`: int
    `referenceTimeInstFlag`: bool
    `fbPktCountInst`: int
    `fbPktCountInstFlag`: bool
    `packetStatusInst`: seq[byte]
    `packetStatusInstFlag`: bool
    `recvDeltaInst`: seq[byte]
    `recvDeltaInstFlag`: bool
  RtcpPayload_PsfbPacket* = ref object of KaitaiStruct
    `ssrc`*: uint32
    `ssrcMediaSource`*: uint32
    `fciBlock`*: KaitaiStruct
    `parent`*: RtcpPayload_RtcpPacket
    `rawFciBlock`*: seq[byte]
    `fmtInst`: RtcpPayload_PsfbSubtype
    `fmtInstFlag`: bool
  RtcpPayload_SourceChunk* = ref object of KaitaiStruct
    `ssrc`*: uint32
    `sdesTlv`*: seq[RtcpPayload_SdesTlv]
    `parent`*: RtcpPayload_SdesPacket
  RtcpPayload_SdesPacket* = ref object of KaitaiStruct
    `sourceChunk`*: seq[RtcpPayload_SourceChunk]
    `parent`*: RtcpPayload_RtcpPacket
    `sourceCountInst`: uint64
    `sourceCountInstFlag`: bool
  RtcpPayload_RtpfbPacket* = ref object of KaitaiStruct
    `ssrc`*: uint32
    `ssrcMediaSource`*: uint32
    `fciBlock`*: KaitaiStruct
    `parent`*: RtcpPayload_RtcpPacket
    `rawFciBlock`*: seq[byte]
    `fmtInst`: RtcpPayload_RtpfbSubtype
    `fmtInstFlag`: bool
  RtcpPayload_PacketStatusChunk* = ref object of KaitaiStruct
    `t`*: bool
    `s2`*: uint64
    `s1`*: bool
    `rle`*: uint64
    `symbolList`*: uint64
    `parent`*: KaitaiStruct
    `sInst`: int
    `sInstFlag`: bool
  RtcpPayload_PsfbAfbPacket* = ref object of KaitaiStruct
    `uid`*: uint32
    `contents`*: KaitaiStruct
    `parent`*: RtcpPayload_PsfbPacket
    `rawContents`*: seq[byte]

proc read*(_: typedesc[RtcpPayload], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): RtcpPayload
proc read*(_: typedesc[RtcpPayload_PsfbAfbRembPacket], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload_PsfbAfbPacket): RtcpPayload_PsfbAfbRembPacket
proc read*(_: typedesc[RtcpPayload_SrPacket], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload_RtcpPacket): RtcpPayload_SrPacket
proc read*(_: typedesc[RtcpPayload_RrPacket], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload_RtcpPacket): RtcpPayload_RrPacket
proc read*(_: typedesc[RtcpPayload_RtcpPacket], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload): RtcpPayload_RtcpPacket
proc read*(_: typedesc[RtcpPayload_SdesTlv], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload_SourceChunk): RtcpPayload_SdesTlv
proc read*(_: typedesc[RtcpPayload_ReportBlock], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): RtcpPayload_ReportBlock
proc read*(_: typedesc[RtcpPayload_RtpfbTransportFeedbackPacket], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload_RtpfbPacket): RtcpPayload_RtpfbTransportFeedbackPacket
proc read*(_: typedesc[RtcpPayload_PsfbPacket], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload_RtcpPacket): RtcpPayload_PsfbPacket
proc read*(_: typedesc[RtcpPayload_SourceChunk], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload_SdesPacket): RtcpPayload_SourceChunk
proc read*(_: typedesc[RtcpPayload_SdesPacket], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload_RtcpPacket): RtcpPayload_SdesPacket
proc read*(_: typedesc[RtcpPayload_RtpfbPacket], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload_RtcpPacket): RtcpPayload_RtpfbPacket
proc read*(_: typedesc[RtcpPayload_PacketStatusChunk], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): RtcpPayload_PacketStatusChunk
proc read*(_: typedesc[RtcpPayload_PsfbAfbPacket], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload_PsfbPacket): RtcpPayload_PsfbAfbPacket

proc maxTotalBitrate*(this: RtcpPayload_PsfbAfbRembPacket): int
proc ntp*(this: RtcpPayload_SrPacket): int
proc fractionLost*(this: RtcpPayload_ReportBlock): int
proc cumulativePacketsLost*(this: RtcpPayload_ReportBlock): int
proc referenceTime*(this: RtcpPayload_RtpfbTransportFeedbackPacket): int
proc fbPktCount*(this: RtcpPayload_RtpfbTransportFeedbackPacket): int
proc packetStatus*(this: RtcpPayload_RtpfbTransportFeedbackPacket): seq[byte]
proc recvDelta*(this: RtcpPayload_RtpfbTransportFeedbackPacket): seq[byte]
proc fmt*(this: RtcpPayload_PsfbPacket): RtcpPayload_PsfbSubtype
proc sourceCount*(this: RtcpPayload_SdesPacket): uint64
proc fmt*(this: RtcpPayload_RtpfbPacket): RtcpPayload_RtpfbSubtype
proc s*(this: RtcpPayload_PacketStatusChunk): int


##[
RTCP is the Real-Time Control Protocol
@see <a href="https://tools.ietf.org/html/rfc3550">Source</a>
]##
proc read*(_: typedesc[RtcpPayload], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): RtcpPayload =
  template this: untyped = result
  this = new(RtcpPayload)
  let root = if root == nil: cast[RtcpPayload](this) else: cast[RtcpPayload](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = RtcpPayload_RtcpPacket.read(this.io, this.root, this)
      this.rtcpPackets.add(it)
      inc i

proc fromFile*(_: typedesc[RtcpPayload], filename: string): RtcpPayload =
  RtcpPayload.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RtcpPayload_PsfbAfbRembPacket], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload_PsfbAfbPacket): RtcpPayload_PsfbAfbRembPacket =
  template this: untyped = result
  this = new(RtcpPayload_PsfbAfbRembPacket)
  let root = if root == nil: cast[RtcpPayload](this) else: cast[RtcpPayload](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numSsrcExpr = this.io.readU1()
  this.numSsrc = numSsrcExpr
  let brExpExpr = this.io.readBitsIntBe(6)
  this.brExp = brExpExpr
  let brMantissaExpr = this.io.readBitsIntBe(18)
  this.brMantissa = brMantissaExpr
  alignToByte(this.io)
  for i in 0 ..< int(this.numSsrc):
    let it = this.io.readU4be()
    this.ssrcList.add(it)

proc maxTotalBitrate(this: RtcpPayload_PsfbAfbRembPacket): int = 
  if this.maxTotalBitrateInstFlag:
    return this.maxTotalBitrateInst
  let maxTotalBitrateInstExpr = int((this.brMantissa * (1 shl this.brExp)))
  this.maxTotalBitrateInst = maxTotalBitrateInstExpr
  this.maxTotalBitrateInstFlag = true
  return this.maxTotalBitrateInst

proc fromFile*(_: typedesc[RtcpPayload_PsfbAfbRembPacket], filename: string): RtcpPayload_PsfbAfbRembPacket =
  RtcpPayload_PsfbAfbRembPacket.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RtcpPayload_SrPacket], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload_RtcpPacket): RtcpPayload_SrPacket =
  template this: untyped = result
  this = new(RtcpPayload_SrPacket)
  let root = if root == nil: cast[RtcpPayload](this) else: cast[RtcpPayload](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ssrcExpr = this.io.readU4be()
  this.ssrc = ssrcExpr
  let ntpMswExpr = this.io.readU4be()
  this.ntpMsw = ntpMswExpr
  let ntpLswExpr = this.io.readU4be()
  this.ntpLsw = ntpLswExpr
  let rtpTimestampExpr = this.io.readU4be()
  this.rtpTimestamp = rtpTimestampExpr
  let senderPacketCountExpr = this.io.readU4be()
  this.senderPacketCount = senderPacketCountExpr
  let senderOctetCountExpr = this.io.readU4be()
  this.senderOctetCount = senderOctetCountExpr
  for i in 0 ..< int(this.parent.subtype):
    let it = RtcpPayload_ReportBlock.read(this.io, this.root, this)
    this.reportBlock.add(it)

proc ntp(this: RtcpPayload_SrPacket): int = 
  if this.ntpInstFlag:
    return this.ntpInst
  let ntpInstExpr = int(((this.ntpMsw shl 32) and this.ntpLsw))
  this.ntpInst = ntpInstExpr
  this.ntpInstFlag = true
  return this.ntpInst

proc fromFile*(_: typedesc[RtcpPayload_SrPacket], filename: string): RtcpPayload_SrPacket =
  RtcpPayload_SrPacket.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RtcpPayload_RrPacket], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload_RtcpPacket): RtcpPayload_RrPacket =
  template this: untyped = result
  this = new(RtcpPayload_RrPacket)
  let root = if root == nil: cast[RtcpPayload](this) else: cast[RtcpPayload](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ssrcExpr = this.io.readU4be()
  this.ssrc = ssrcExpr
  for i in 0 ..< int(this.parent.subtype):
    let it = RtcpPayload_ReportBlock.read(this.io, this.root, this)
    this.reportBlock.add(it)

proc fromFile*(_: typedesc[RtcpPayload_RrPacket], filename: string): RtcpPayload_RrPacket =
  RtcpPayload_RrPacket.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RtcpPayload_RtcpPacket], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload): RtcpPayload_RtcpPacket =
  template this: untyped = result
  this = new(RtcpPayload_RtcpPacket)
  let root = if root == nil: cast[RtcpPayload](this) else: cast[RtcpPayload](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = this.io.readBitsIntBe(2)
  this.version = versionExpr
  let paddingExpr = this.io.readBitsIntBe(1) != 0
  this.padding = paddingExpr
  let subtypeExpr = this.io.readBitsIntBe(5)
  this.subtype = subtypeExpr
  alignToByte(this.io)
  let payloadTypeExpr = RtcpPayload_PayloadType(this.io.readU1())
  this.payloadType = payloadTypeExpr
  let lengthExpr = this.io.readU2be()
  this.length = lengthExpr
  block:
    let on = this.payloadType
    if on == rtcp_payload.sr:
      let rawBodyExpr = this.io.readBytes(int((4 * this.length)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = RtcpPayload_SrPacket.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == rtcp_payload.psfb:
      let rawBodyExpr = this.io.readBytes(int((4 * this.length)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = RtcpPayload_PsfbPacket.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == rtcp_payload.rr:
      let rawBodyExpr = this.io.readBytes(int((4 * this.length)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = RtcpPayload_RrPacket.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == rtcp_payload.rtpfb:
      let rawBodyExpr = this.io.readBytes(int((4 * this.length)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = RtcpPayload_RtpfbPacket.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == rtcp_payload.sdes:
      let rawBodyExpr = this.io.readBytes(int((4 * this.length)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = RtcpPayload_SdesPacket.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int((4 * this.length)))
      this.body = bodyExpr

proc fromFile*(_: typedesc[RtcpPayload_RtcpPacket], filename: string): RtcpPayload_RtcpPacket =
  RtcpPayload_RtcpPacket.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RtcpPayload_SdesTlv], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload_SourceChunk): RtcpPayload_SdesTlv =
  template this: untyped = result
  this = new(RtcpPayload_SdesTlv)
  let root = if root == nil: cast[RtcpPayload](this) else: cast[RtcpPayload](root)
  this.io = io
  this.root = root
  this.parent = parent

  let typeExpr = RtcpPayload_SdesSubtype(this.io.readU1())
  this.type = typeExpr
  if this.type != rtcp_payload.pad:
    let lengthExpr = this.io.readU1()
    this.length = lengthExpr
  if this.type != rtcp_payload.pad:
    let valueExpr = this.io.readBytes(int(this.length))
    this.value = valueExpr

proc fromFile*(_: typedesc[RtcpPayload_SdesTlv], filename: string): RtcpPayload_SdesTlv =
  RtcpPayload_SdesTlv.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RtcpPayload_ReportBlock], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): RtcpPayload_ReportBlock =
  template this: untyped = result
  this = new(RtcpPayload_ReportBlock)
  let root = if root == nil: cast[RtcpPayload](this) else: cast[RtcpPayload](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ssrcSourceExpr = this.io.readU4be()
  this.ssrcSource = ssrcSourceExpr
  let lostValExpr = this.io.readU1()
  this.lostVal = lostValExpr
  let highestSeqNumReceivedExpr = this.io.readU4be()
  this.highestSeqNumReceived = highestSeqNumReceivedExpr
  let interarrivalJitterExpr = this.io.readU4be()
  this.interarrivalJitter = interarrivalJitterExpr
  let lsrExpr = this.io.readU4be()
  this.lsr = lsrExpr
  let dlsrExpr = this.io.readU4be()
  this.dlsr = dlsrExpr

proc fractionLost(this: RtcpPayload_ReportBlock): int = 
  if this.fractionLostInstFlag:
    return this.fractionLostInst
  let fractionLostInstExpr = int((this.lostVal shr 24))
  this.fractionLostInst = fractionLostInstExpr
  this.fractionLostInstFlag = true
  return this.fractionLostInst

proc cumulativePacketsLost(this: RtcpPayload_ReportBlock): int = 
  if this.cumulativePacketsLostInstFlag:
    return this.cumulativePacketsLostInst
  let cumulativePacketsLostInstExpr = int((this.lostVal and 16777215))
  this.cumulativePacketsLostInst = cumulativePacketsLostInstExpr
  this.cumulativePacketsLostInstFlag = true
  return this.cumulativePacketsLostInst

proc fromFile*(_: typedesc[RtcpPayload_ReportBlock], filename: string): RtcpPayload_ReportBlock =
  RtcpPayload_ReportBlock.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RtcpPayload_RtpfbTransportFeedbackPacket], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload_RtpfbPacket): RtcpPayload_RtpfbTransportFeedbackPacket =
  template this: untyped = result
  this = new(RtcpPayload_RtpfbTransportFeedbackPacket)
  let root = if root == nil: cast[RtcpPayload](this) else: cast[RtcpPayload](root)
  this.io = io
  this.root = root
  this.parent = parent

  let baseSequenceNumberExpr = this.io.readU2be()
  this.baseSequenceNumber = baseSequenceNumberExpr
  let packetStatusCountExpr = this.io.readU2be()
  this.packetStatusCount = packetStatusCountExpr
  let b4Expr = this.io.readU4be()
  this.b4 = b4Expr
  let remainingExpr = this.io.readBytesFull()
  this.remaining = remainingExpr

proc referenceTime(this: RtcpPayload_RtpfbTransportFeedbackPacket): int = 
  if this.referenceTimeInstFlag:
    return this.referenceTimeInst
  let referenceTimeInstExpr = int((this.b4 shr 8))
  this.referenceTimeInst = referenceTimeInstExpr
  this.referenceTimeInstFlag = true
  return this.referenceTimeInst

proc fbPktCount(this: RtcpPayload_RtpfbTransportFeedbackPacket): int = 
  if this.fbPktCountInstFlag:
    return this.fbPktCountInst
  let fbPktCountInstExpr = int((this.b4 and 255))
  this.fbPktCountInst = fbPktCountInstExpr
  this.fbPktCountInstFlag = true
  return this.fbPktCountInst

proc packetStatus(this: RtcpPayload_RtpfbTransportFeedbackPacket): seq[byte] = 
  if this.packetStatusInstFlag:
    return this.packetStatusInst
  let packetStatusInstExpr = this.io.readBytes(int(0))
  this.packetStatusInst = packetStatusInstExpr
  this.packetStatusInstFlag = true
  return this.packetStatusInst

proc recvDelta(this: RtcpPayload_RtpfbTransportFeedbackPacket): seq[byte] = 
  if this.recvDeltaInstFlag:
    return this.recvDeltaInst
  let recvDeltaInstExpr = this.io.readBytes(int(0))
  this.recvDeltaInst = recvDeltaInstExpr
  this.recvDeltaInstFlag = true
  return this.recvDeltaInst

proc fromFile*(_: typedesc[RtcpPayload_RtpfbTransportFeedbackPacket], filename: string): RtcpPayload_RtpfbTransportFeedbackPacket =
  RtcpPayload_RtpfbTransportFeedbackPacket.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RtcpPayload_PsfbPacket], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload_RtcpPacket): RtcpPayload_PsfbPacket =
  template this: untyped = result
  this = new(RtcpPayload_PsfbPacket)
  let root = if root == nil: cast[RtcpPayload](this) else: cast[RtcpPayload](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ssrcExpr = this.io.readU4be()
  this.ssrc = ssrcExpr
  let ssrcMediaSourceExpr = this.io.readU4be()
  this.ssrcMediaSource = ssrcMediaSourceExpr
  block:
    let on = this.fmt
    if on == rtcp_payload.afb:
      let rawFciBlockExpr = this.io.readBytesFull()
      this.rawFciBlock = rawFciBlockExpr
      let rawFciBlockIo = newKaitaiStream(rawFciBlockExpr)
      let fciBlockExpr = RtcpPayload_PsfbAfbPacket.read(rawFciBlockIo, this.root, this)
      this.fciBlock = fciBlockExpr
    else:
      let fciBlockExpr = this.io.readBytesFull()
      this.fciBlock = fciBlockExpr

proc fmt(this: RtcpPayload_PsfbPacket): RtcpPayload_PsfbSubtype = 
  if this.fmtInstFlag:
    return this.fmtInst
  let fmtInstExpr = RtcpPayload_PsfbSubtype(RtcpPayload_PsfbSubtype(this.parent.subtype))
  this.fmtInst = fmtInstExpr
  this.fmtInstFlag = true
  return this.fmtInst

proc fromFile*(_: typedesc[RtcpPayload_PsfbPacket], filename: string): RtcpPayload_PsfbPacket =
  RtcpPayload_PsfbPacket.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RtcpPayload_SourceChunk], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload_SdesPacket): RtcpPayload_SourceChunk =
  template this: untyped = result
  this = new(RtcpPayload_SourceChunk)
  let root = if root == nil: cast[RtcpPayload](this) else: cast[RtcpPayload](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ssrcExpr = this.io.readU4be()
  this.ssrc = ssrcExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = RtcpPayload_SdesTlv.read(this.io, this.root, this)
      this.sdesTlv.add(it)
      inc i

proc fromFile*(_: typedesc[RtcpPayload_SourceChunk], filename: string): RtcpPayload_SourceChunk =
  RtcpPayload_SourceChunk.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RtcpPayload_SdesPacket], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload_RtcpPacket): RtcpPayload_SdesPacket =
  template this: untyped = result
  this = new(RtcpPayload_SdesPacket)
  let root = if root == nil: cast[RtcpPayload](this) else: cast[RtcpPayload](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(this.sourceCount):
    let it = RtcpPayload_SourceChunk.read(this.io, this.root, this)
    this.sourceChunk.add(it)

proc sourceCount(this: RtcpPayload_SdesPacket): uint64 = 
  if this.sourceCountInstFlag:
    return this.sourceCountInst
  let sourceCountInstExpr = uint64(this.parent.subtype)
  this.sourceCountInst = sourceCountInstExpr
  this.sourceCountInstFlag = true
  return this.sourceCountInst

proc fromFile*(_: typedesc[RtcpPayload_SdesPacket], filename: string): RtcpPayload_SdesPacket =
  RtcpPayload_SdesPacket.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RtcpPayload_RtpfbPacket], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload_RtcpPacket): RtcpPayload_RtpfbPacket =
  template this: untyped = result
  this = new(RtcpPayload_RtpfbPacket)
  let root = if root == nil: cast[RtcpPayload](this) else: cast[RtcpPayload](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ssrcExpr = this.io.readU4be()
  this.ssrc = ssrcExpr
  let ssrcMediaSourceExpr = this.io.readU4be()
  this.ssrcMediaSource = ssrcMediaSourceExpr
  block:
    let on = this.fmt
    if on == rtcp_payload.transport_feedback:
      let rawFciBlockExpr = this.io.readBytesFull()
      this.rawFciBlock = rawFciBlockExpr
      let rawFciBlockIo = newKaitaiStream(rawFciBlockExpr)
      let fciBlockExpr = RtcpPayload_RtpfbTransportFeedbackPacket.read(rawFciBlockIo, this.root, this)
      this.fciBlock = fciBlockExpr
    else:
      let fciBlockExpr = this.io.readBytesFull()
      this.fciBlock = fciBlockExpr

proc fmt(this: RtcpPayload_RtpfbPacket): RtcpPayload_RtpfbSubtype = 
  if this.fmtInstFlag:
    return this.fmtInst
  let fmtInstExpr = RtcpPayload_RtpfbSubtype(RtcpPayload_RtpfbSubtype(this.parent.subtype))
  this.fmtInst = fmtInstExpr
  this.fmtInstFlag = true
  return this.fmtInst

proc fromFile*(_: typedesc[RtcpPayload_RtpfbPacket], filename: string): RtcpPayload_RtpfbPacket =
  RtcpPayload_RtpfbPacket.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RtcpPayload_PacketStatusChunk], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): RtcpPayload_PacketStatusChunk =
  template this: untyped = result
  this = new(RtcpPayload_PacketStatusChunk)
  let root = if root == nil: cast[RtcpPayload](this) else: cast[RtcpPayload](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tExpr = this.io.readBitsIntBe(1) != 0
  this.t = tExpr
  if (if this.t: 1 else: 0) == 0:
    let s2Expr = this.io.readBitsIntBe(2)
    this.s2 = s2Expr
  if (if this.t: 1 else: 0) == 1:
    let s1Expr = this.io.readBitsIntBe(1) != 0
    this.s1 = s1Expr
  if (if this.t: 1 else: 0) == 0:
    let rleExpr = this.io.readBitsIntBe(13)
    this.rle = rleExpr
  if (if this.t: 1 else: 0) == 1:
    let symbolListExpr = this.io.readBitsIntBe(14)
    this.symbolList = symbolListExpr

proc s(this: RtcpPayload_PacketStatusChunk): int = 
  if this.sInstFlag:
    return this.sInst
  let sInstExpr = int((if (if this.t: 1 else: 0) == 0: this.s2 else: (if (if this.s1: 1 else: 0) == 0: 1 else: 0)))
  this.sInst = sInstExpr
  this.sInstFlag = true
  return this.sInst

proc fromFile*(_: typedesc[RtcpPayload_PacketStatusChunk], filename: string): RtcpPayload_PacketStatusChunk =
  RtcpPayload_PacketStatusChunk.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RtcpPayload_PsfbAfbPacket], io: KaitaiStream, root: KaitaiStruct, parent: RtcpPayload_PsfbPacket): RtcpPayload_PsfbAfbPacket =
  template this: untyped = result
  this = new(RtcpPayload_PsfbAfbPacket)
  let root = if root == nil: cast[RtcpPayload](this) else: cast[RtcpPayload](root)
  this.io = io
  this.root = root
  this.parent = parent

  let uidExpr = this.io.readU4be()
  this.uid = uidExpr
  block:
    let on = this.uid
    if on == 1380273474:
      let rawContentsExpr = this.io.readBytesFull()
      this.rawContents = rawContentsExpr
      let rawContentsIo = newKaitaiStream(rawContentsExpr)
      let contentsExpr = RtcpPayload_PsfbAfbRembPacket.read(rawContentsIo, this.root, this)
      this.contents = contentsExpr
    else:
      let contentsExpr = this.io.readBytesFull()
      this.contents = contentsExpr

proc fromFile*(_: typedesc[RtcpPayload_PsfbAfbPacket], filename: string): RtcpPayload_PsfbAfbPacket =
  RtcpPayload_PsfbAfbPacket.read(newKaitaiFileStream(filename), nil, nil)

