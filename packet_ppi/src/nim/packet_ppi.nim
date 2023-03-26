import kaitai_struct_nim_runtime
import options
import /network/ethernet_frame

import "ethernet_frame"
type
  PacketPpi* = ref object of KaitaiStruct
    `header`*: PacketPpi_PacketPpiHeader
    `fields`*: PacketPpi_PacketPpiFields
    `body`*: KaitaiStruct
    `parent`*: KaitaiStruct
    `rawFields`*: seq[byte]
    `rawBody`*: seq[byte]
  PacketPpi_PfhType* = enum
    radio_802_11_common = 2
    radio_802_11n_mac_ext = 3
    radio_802_11n_mac_phy_ext = 4
    spectrum_map = 5
    process_info = 6
    capture_info = 7
  PacketPpi_Linktype* = enum
    null_linktype = 0
    ethernet = 1
    ax25 = 3
    ieee802_5 = 6
    arcnet_bsd = 7
    slip = 8
    ppp = 9
    fddi = 10
    ppp_hdlc = 50
    ppp_ether = 51
    atm_rfc1483 = 100
    raw = 101
    c_hdlc = 104
    ieee802_11 = 105
    frelay = 107
    loop = 108
    linux_sll = 113
    ltalk = 114
    pflog = 117
    ieee802_11_prism = 119
    ip_over_fc = 122
    sunatm = 123
    ieee802_11_radiotap = 127
    arcnet_linux = 129
    apple_ip_over_ieee1394 = 138
    mtp2_with_phdr = 139
    mtp2 = 140
    mtp3 = 141
    sccp = 142
    docsis = 143
    linux_irda = 144
    user0 = 147
    user1 = 148
    user2 = 149
    user3 = 150
    user4 = 151
    user5 = 152
    user6 = 153
    user7 = 154
    user8 = 155
    user9 = 156
    user10 = 157
    user11 = 158
    user12 = 159
    user13 = 160
    user14 = 161
    user15 = 162
    ieee802_11_avs = 163
    bacnet_ms_tp = 165
    ppp_pppd = 166
    gprs_llc = 169
    gpf_t = 170
    gpf_f = 171
    linux_lapd = 177
    bluetooth_hci_h4 = 187
    usb_linux = 189
    ppi = 192
    ieee802_15_4 = 195
    sita = 196
    erf = 197
    bluetooth_hci_h4_with_phdr = 201
    ax25_kiss = 202
    lapd = 203
    ppp_with_dir = 204
    c_hdlc_with_dir = 205
    frelay_with_dir = 206
    ipmb_linux = 209
    ieee802_15_4_nonask_phy = 215
    usb_linux_mmapped = 220
    fc_2 = 224
    fc_2_with_frame_delims = 225
    ipnet = 226
    can_socketcan = 227
    ipv4 = 228
    ipv6 = 229
    ieee802_15_4_nofcs = 230
    dbus = 231
    dvb_ci = 235
    mux27010 = 236
    stanag_5066_d_pdu = 237
    nflog = 239
    netanalyzer = 240
    netanalyzer_transparent = 241
    ipoib = 242
    mpeg_2_ts = 243
    ng40 = 244
    nfc_llcp = 245
    infiniband = 247
    sctp = 248
    usbpcap = 249
    rtac_serial = 250
    bluetooth_le_ll = 251
    netlink = 253
    bluetooth_linux_monitor = 254
    bluetooth_bredr_bb = 255
    bluetooth_le_ll_with_phdr = 256
    profibus_dl = 257
    pktap = 258
    epon = 259
    ipmi_hpm_2 = 260
    zwave_r1_r2 = 261
    zwave_r3 = 262
    wattstopper_dlm = 263
    iso_14443 = 264
  PacketPpi_PacketPpiFields* = ref object of KaitaiStruct
    `entries`*: seq[PacketPpi_PacketPpiField]
    `parent`*: PacketPpi
  PacketPpi_Radio80211nMacExtBody* = ref object of KaitaiStruct
    `flags`*: PacketPpi_MacFlags
    `aMpduId`*: uint32
    `numDelimiters`*: uint8
    `reserved`*: seq[byte]
    `parent`*: PacketPpi_PacketPpiField
  PacketPpi_MacFlags* = ref object of KaitaiStruct
    `unused1`*: bool
    `aggregateDelimiter`*: bool
    `moreAggregates`*: bool
    `aggregate`*: bool
    `dupRx`*: bool
    `rxShortGuard`*: bool
    `isHt40`*: bool
    `greenfield`*: bool
    `unused2`*: seq[byte]
    `parent`*: KaitaiStruct
  PacketPpi_PacketPpiHeader* = ref object of KaitaiStruct
    `pphVersion`*: uint8
    `pphFlags`*: uint8
    `pphLen`*: uint16
    `pphDlt`*: PacketPpi_Linktype
    `parent`*: PacketPpi
  PacketPpi_Radio80211CommonBody* = ref object of KaitaiStruct
    `tsfTimer`*: uint64
    `flags`*: uint16
    `rate`*: uint16
    `channelFreq`*: uint16
    `channelFlags`*: uint16
    `fhssHopset`*: uint8
    `fhssPattern`*: uint8
    `dbmAntsignal`*: int8
    `dbmAntnoise`*: int8
    `parent`*: PacketPpi_PacketPpiField
  PacketPpi_PacketPpiField* = ref object of KaitaiStruct
    `pfhType`*: PacketPpi_PfhType
    `pfhDatalen`*: uint16
    `body`*: KaitaiStruct
    `parent`*: PacketPpi_PacketPpiFields
    `rawBody`*: seq[byte]
  PacketPpi_Radio80211nMacPhyExtBody* = ref object of KaitaiStruct
    `flags`*: PacketPpi_MacFlags
    `aMpduId`*: uint32
    `numDelimiters`*: uint8
    `mcs`*: uint8
    `numStreams`*: uint8
    `rssiCombined`*: uint8
    `rssiAntCtl`*: seq[uint8]
    `rssiAntExt`*: seq[uint8]
    `extChannelFreq`*: uint16
    `extChannelFlags`*: PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags
    `rfSignalNoise`*: seq[PacketPpi_Radio80211nMacPhyExtBody_SignalNoise]
    `evm`*: seq[uint32]
    `parent`*: PacketPpi_PacketPpiField
  PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags* = ref object of KaitaiStruct
    `spectrum2ghz`*: bool
    `ofdm`*: bool
    `cck`*: bool
    `turbo`*: bool
    `unused`*: uint64
    `gfsk`*: bool
    `dynCckOfdm`*: bool
    `onlyPassiveScan`*: bool
    `spectrum5ghz`*: bool
    `parent`*: PacketPpi_Radio80211nMacPhyExtBody
  PacketPpi_Radio80211nMacPhyExtBody_SignalNoise* = ref object of KaitaiStruct
    `signal`*: int8
    `noise`*: int8
    `parent`*: PacketPpi_Radio80211nMacPhyExtBody

proc read*(_: typedesc[PacketPpi], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PacketPpi
proc read*(_: typedesc[PacketPpi_PacketPpiFields], io: KaitaiStream, root: KaitaiStruct, parent: PacketPpi): PacketPpi_PacketPpiFields
proc read*(_: typedesc[PacketPpi_Radio80211nMacExtBody], io: KaitaiStream, root: KaitaiStruct, parent: PacketPpi_PacketPpiField): PacketPpi_Radio80211nMacExtBody
proc read*(_: typedesc[PacketPpi_MacFlags], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PacketPpi_MacFlags
proc read*(_: typedesc[PacketPpi_PacketPpiHeader], io: KaitaiStream, root: KaitaiStruct, parent: PacketPpi): PacketPpi_PacketPpiHeader
proc read*(_: typedesc[PacketPpi_Radio80211CommonBody], io: KaitaiStream, root: KaitaiStruct, parent: PacketPpi_PacketPpiField): PacketPpi_Radio80211CommonBody
proc read*(_: typedesc[PacketPpi_PacketPpiField], io: KaitaiStream, root: KaitaiStruct, parent: PacketPpi_PacketPpiFields): PacketPpi_PacketPpiField
proc read*(_: typedesc[PacketPpi_Radio80211nMacPhyExtBody], io: KaitaiStream, root: KaitaiStruct, parent: PacketPpi_PacketPpiField): PacketPpi_Radio80211nMacPhyExtBody
proc read*(_: typedesc[PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags], io: KaitaiStream, root: KaitaiStruct, parent: PacketPpi_Radio80211nMacPhyExtBody): PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags
proc read*(_: typedesc[PacketPpi_Radio80211nMacPhyExtBody_SignalNoise], io: KaitaiStream, root: KaitaiStruct, parent: PacketPpi_Radio80211nMacPhyExtBody): PacketPpi_Radio80211nMacPhyExtBody_SignalNoise



##[
PPI is a standard for link layer packet encapsulation, proposed as
generic extensible container to store both captured in-band data and
out-of-band data. Originally it was developed to provide 802.11n
radio information, but can be used for other purposes as well.

Sample capture:
<https://wiki.wireshark.org/uploads/27707187aeb30df68e70c8fb9d614981/http.cap>

@see <a href="https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 3</a>
]##
proc read*(_: typedesc[PacketPpi], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PacketPpi =
  template this: untyped = result
  this = new(PacketPpi)
  let root = if root == nil: cast[PacketPpi](this) else: cast[PacketPpi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = PacketPpi_PacketPpiHeader.read(this.io, this.root, this)
  this.header = headerExpr
  let rawFieldsExpr = this.io.readBytes(int((this.header.pphLen - 8)))
  this.rawFields = rawFieldsExpr
  let rawFieldsIo = newKaitaiStream(rawFieldsExpr)
  let fieldsExpr = PacketPpi_PacketPpiFields.read(rawFieldsIo, this.root, this)
  this.fields = fieldsExpr
  block:
    let on = this.header.pphDlt
    if on == packet_ppi.ppi:
      let rawBodyExpr = this.io.readBytesFull()
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = PacketPpi.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == packet_ppi.ethernet:
      let rawBodyExpr = this.io.readBytesFull()
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = EthernetFrame.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytesFull()
      this.body = bodyExpr

proc fromFile*(_: typedesc[PacketPpi], filename: string): PacketPpi =
  PacketPpi.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PacketPpi_PacketPpiFields], io: KaitaiStream, root: KaitaiStruct, parent: PacketPpi): PacketPpi_PacketPpiFields =
  template this: untyped = result
  this = new(PacketPpi_PacketPpiFields)
  let root = if root == nil: cast[PacketPpi](this) else: cast[PacketPpi](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = PacketPpi_PacketPpiField.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[PacketPpi_PacketPpiFields], filename: string): PacketPpi_PacketPpiFields =
  PacketPpi_PacketPpiFields.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 4.1.3</a>
]##
proc read*(_: typedesc[PacketPpi_Radio80211nMacExtBody], io: KaitaiStream, root: KaitaiStruct, parent: PacketPpi_PacketPpiField): PacketPpi_Radio80211nMacExtBody =
  template this: untyped = result
  this = new(PacketPpi_Radio80211nMacExtBody)
  let root = if root == nil: cast[PacketPpi](this) else: cast[PacketPpi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let flagsExpr = PacketPpi_MacFlags.read(this.io, this.root, this)
  this.flags = flagsExpr
  let aMpduIdExpr = this.io.readU4le()
  this.aMpduId = aMpduIdExpr
  let numDelimitersExpr = this.io.readU1()
  this.numDelimiters = numDelimitersExpr
  let reservedExpr = this.io.readBytes(int(3))
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[PacketPpi_Radio80211nMacExtBody], filename: string): PacketPpi_Radio80211nMacExtBody =
  PacketPpi_Radio80211nMacExtBody.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PacketPpi_MacFlags], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PacketPpi_MacFlags =
  template this: untyped = result
  this = new(PacketPpi_MacFlags)
  let root = if root == nil: cast[PacketPpi](this) else: cast[PacketPpi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let unused1Expr = this.io.readBitsIntBe(1) != 0
  this.unused1 = unused1Expr

  ##[
  Aggregate delimiter CRC error after this frame
  ]##
  let aggregateDelimiterExpr = this.io.readBitsIntBe(1) != 0
  this.aggregateDelimiter = aggregateDelimiterExpr

  ##[
  More aggregates
  ]##
  let moreAggregatesExpr = this.io.readBitsIntBe(1) != 0
  this.moreAggregates = moreAggregatesExpr

  ##[
  Aggregate
  ]##
  let aggregateExpr = this.io.readBitsIntBe(1) != 0
  this.aggregate = aggregateExpr

  ##[
  Duplicate RX
  ]##
  let dupRxExpr = this.io.readBitsIntBe(1) != 0
  this.dupRx = dupRxExpr

  ##[
  RX short guard interval (SGI)
  ]##
  let rxShortGuardExpr = this.io.readBitsIntBe(1) != 0
  this.rxShortGuard = rxShortGuardExpr

  ##[
  true = HT40, false = HT20
  ]##
  let isHt40Expr = this.io.readBitsIntBe(1) != 0
  this.isHt40 = isHt40Expr

  ##[
  Greenfield
  ]##
  let greenfieldExpr = this.io.readBitsIntBe(1) != 0
  this.greenfield = greenfieldExpr
  alignToByte(this.io)
  let unused2Expr = this.io.readBytes(int(3))
  this.unused2 = unused2Expr

proc fromFile*(_: typedesc[PacketPpi_MacFlags], filename: string): PacketPpi_MacFlags =
  PacketPpi_MacFlags.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 3.1</a>
]##
proc read*(_: typedesc[PacketPpi_PacketPpiHeader], io: KaitaiStream, root: KaitaiStruct, parent: PacketPpi): PacketPpi_PacketPpiHeader =
  template this: untyped = result
  this = new(PacketPpi_PacketPpiHeader)
  let root = if root == nil: cast[PacketPpi](this) else: cast[PacketPpi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let pphVersionExpr = this.io.readU1()
  this.pphVersion = pphVersionExpr
  let pphFlagsExpr = this.io.readU1()
  this.pphFlags = pphFlagsExpr
  let pphLenExpr = this.io.readU2le()
  this.pphLen = pphLenExpr
  let pphDltExpr = PacketPpi_Linktype(this.io.readU4le())
  this.pphDlt = pphDltExpr

proc fromFile*(_: typedesc[PacketPpi_PacketPpiHeader], filename: string): PacketPpi_PacketPpiHeader =
  PacketPpi_PacketPpiHeader.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 4.1.2</a>
]##
proc read*(_: typedesc[PacketPpi_Radio80211CommonBody], io: KaitaiStream, root: KaitaiStruct, parent: PacketPpi_PacketPpiField): PacketPpi_Radio80211CommonBody =
  template this: untyped = result
  this = new(PacketPpi_Radio80211CommonBody)
  let root = if root == nil: cast[PacketPpi](this) else: cast[PacketPpi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tsfTimerExpr = this.io.readU8le()
  this.tsfTimer = tsfTimerExpr
  let flagsExpr = this.io.readU2le()
  this.flags = flagsExpr
  let rateExpr = this.io.readU2le()
  this.rate = rateExpr
  let channelFreqExpr = this.io.readU2le()
  this.channelFreq = channelFreqExpr
  let channelFlagsExpr = this.io.readU2le()
  this.channelFlags = channelFlagsExpr
  let fhssHopsetExpr = this.io.readU1()
  this.fhssHopset = fhssHopsetExpr
  let fhssPatternExpr = this.io.readU1()
  this.fhssPattern = fhssPatternExpr
  let dbmAntsignalExpr = this.io.readS1()
  this.dbmAntsignal = dbmAntsignalExpr
  let dbmAntnoiseExpr = this.io.readS1()
  this.dbmAntnoise = dbmAntnoiseExpr

proc fromFile*(_: typedesc[PacketPpi_Radio80211CommonBody], filename: string): PacketPpi_Radio80211CommonBody =
  PacketPpi_Radio80211CommonBody.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 3.1</a>
]##
proc read*(_: typedesc[PacketPpi_PacketPpiField], io: KaitaiStream, root: KaitaiStruct, parent: PacketPpi_PacketPpiFields): PacketPpi_PacketPpiField =
  template this: untyped = result
  this = new(PacketPpi_PacketPpiField)
  let root = if root == nil: cast[PacketPpi](this) else: cast[PacketPpi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let pfhTypeExpr = PacketPpi_PfhType(this.io.readU2le())
  this.pfhType = pfhTypeExpr
  let pfhDatalenExpr = this.io.readU2le()
  this.pfhDatalen = pfhDatalenExpr
  block:
    let on = this.pfhType
    if on == packet_ppi.radio_802_11_common:
      let rawBodyExpr = this.io.readBytes(int(this.pfhDatalen))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = PacketPpi_Radio80211CommonBody.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == packet_ppi.radio_802_11n_mac_ext:
      let rawBodyExpr = this.io.readBytes(int(this.pfhDatalen))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = PacketPpi_Radio80211nMacExtBody.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == packet_ppi.radio_802_11n_mac_phy_ext:
      let rawBodyExpr = this.io.readBytes(int(this.pfhDatalen))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = PacketPpi_Radio80211nMacPhyExtBody.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int(this.pfhDatalen))
      this.body = bodyExpr

proc fromFile*(_: typedesc[PacketPpi_PacketPpiField], filename: string): PacketPpi_PacketPpiField =
  PacketPpi_PacketPpiField.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 4.1.4</a>
]##
proc read*(_: typedesc[PacketPpi_Radio80211nMacPhyExtBody], io: KaitaiStream, root: KaitaiStruct, parent: PacketPpi_PacketPpiField): PacketPpi_Radio80211nMacPhyExtBody =
  template this: untyped = result
  this = new(PacketPpi_Radio80211nMacPhyExtBody)
  let root = if root == nil: cast[PacketPpi](this) else: cast[PacketPpi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let flagsExpr = PacketPpi_MacFlags.read(this.io, this.root, this)
  this.flags = flagsExpr
  let aMpduIdExpr = this.io.readU4le()
  this.aMpduId = aMpduIdExpr
  let numDelimitersExpr = this.io.readU1()
  this.numDelimiters = numDelimitersExpr

  ##[
  Modulation Coding Scheme (MCS)
  ]##
  let mcsExpr = this.io.readU1()
  this.mcs = mcsExpr

  ##[
  Number of spatial streams (0 = unknown)
  ]##
  let numStreamsExpr = this.io.readU1()
  this.numStreams = numStreamsExpr

  ##[
  RSSI (Received Signal Strength Indication), combined from all active antennas / channels
  ]##
  let rssiCombinedExpr = this.io.readU1()
  this.rssiCombined = rssiCombinedExpr

  ##[
  RSSI (Received Signal Strength Indication) for antennas 0-3, control channel
  ]##
  for i in 0 ..< int(4):
    let it = this.io.readU1()
    this.rssiAntCtl.add(it)

  ##[
  RSSI (Received Signal Strength Indication) for antennas 0-3, extension channel
  ]##
  for i in 0 ..< int(4):
    let it = this.io.readU1()
    this.rssiAntExt.add(it)

  ##[
  Extension channel frequency (MHz)
  ]##
  let extChannelFreqExpr = this.io.readU2le()
  this.extChannelFreq = extChannelFreqExpr

  ##[
  Extension channel flags
  ]##
  let extChannelFlagsExpr = PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags.read(this.io, this.root, this)
  this.extChannelFlags = extChannelFlagsExpr

  ##[
  Signal + noise values for antennas 0-3
  ]##
  for i in 0 ..< int(4):
    let it = PacketPpi_Radio80211nMacPhyExtBody_SignalNoise.read(this.io, this.root, this)
    this.rfSignalNoise.add(it)

  ##[
  EVM (Error Vector Magnitude) for chains 0-3
  ]##
  for i in 0 ..< int(4):
    let it = this.io.readU4le()
    this.evm.add(it)

proc fromFile*(_: typedesc[PacketPpi_Radio80211nMacPhyExtBody], filename: string): PacketPpi_Radio80211nMacPhyExtBody =
  PacketPpi_Radio80211nMacPhyExtBody.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags], io: KaitaiStream, root: KaitaiStruct, parent: PacketPpi_Radio80211nMacPhyExtBody): PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags =
  template this: untyped = result
  this = new(PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags)
  let root = if root == nil: cast[PacketPpi](this) else: cast[PacketPpi](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  2 GHz spectrum
  ]##
  let spectrum2ghzExpr = this.io.readBitsIntBe(1) != 0
  this.spectrum2ghz = spectrum2ghzExpr

  ##[
  OFDM (Orthogonal Frequency-Division Multiplexing)
  ]##
  let ofdmExpr = this.io.readBitsIntBe(1) != 0
  this.ofdm = ofdmExpr

  ##[
  CCK (Complementary Code Keying)
  ]##
  let cckExpr = this.io.readBitsIntBe(1) != 0
  this.cck = cckExpr
  let turboExpr = this.io.readBitsIntBe(1) != 0
  this.turbo = turboExpr
  let unusedExpr = this.io.readBitsIntBe(8)
  this.unused = unusedExpr

  ##[
  Gaussian Frequency Shift Keying
  ]##
  let gfskExpr = this.io.readBitsIntBe(1) != 0
  this.gfsk = gfskExpr

  ##[
  Dynamic CCK-OFDM
  ]##
  let dynCckOfdmExpr = this.io.readBitsIntBe(1) != 0
  this.dynCckOfdm = dynCckOfdmExpr

  ##[
  Only passive scan allowed
  ]##
  let onlyPassiveScanExpr = this.io.readBitsIntBe(1) != 0
  this.onlyPassiveScan = onlyPassiveScanExpr

  ##[
  5 GHz spectrum
  ]##
  let spectrum5ghzExpr = this.io.readBitsIntBe(1) != 0
  this.spectrum5ghz = spectrum5ghzExpr

proc fromFile*(_: typedesc[PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags], filename: string): PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags =
  PacketPpi_Radio80211nMacPhyExtBody_ChannelFlags.read(newKaitaiFileStream(filename), nil, nil)


##[
RF signal + noise pair at a single antenna
]##
proc read*(_: typedesc[PacketPpi_Radio80211nMacPhyExtBody_SignalNoise], io: KaitaiStream, root: KaitaiStruct, parent: PacketPpi_Radio80211nMacPhyExtBody): PacketPpi_Radio80211nMacPhyExtBody_SignalNoise =
  template this: untyped = result
  this = new(PacketPpi_Radio80211nMacPhyExtBody_SignalNoise)
  let root = if root == nil: cast[PacketPpi](this) else: cast[PacketPpi](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  RF signal, dBm
  ]##
  let signalExpr = this.io.readS1()
  this.signal = signalExpr

  ##[
  RF noise, dBm
  ]##
  let noiseExpr = this.io.readS1()
  this.noise = noiseExpr

proc fromFile*(_: typedesc[PacketPpi_Radio80211nMacPhyExtBody_SignalNoise], filename: string): PacketPpi_Radio80211nMacPhyExtBody_SignalNoise =
  PacketPpi_Radio80211nMacPhyExtBody_SignalNoise.read(newKaitaiFileStream(filename), nil, nil)

