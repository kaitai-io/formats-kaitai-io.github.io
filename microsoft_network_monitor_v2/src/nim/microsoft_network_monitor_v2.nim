import kaitai_struct_nim_runtime
import options
import /network/ethernet_frame
import /windows/windows_systemtime

import "ethernet_frame"
import "windows_systemtime"
type
  MicrosoftNetworkMonitorV2* = ref object of KaitaiStruct
    `signature`*: seq[byte]
    `versionMinor`*: uint8
    `versionMajor`*: uint8
    `macType`*: MicrosoftNetworkMonitorV2_Linktype
    `timeCaptureStart`*: WindowsSystemtime
    `frameTableOfs`*: uint32
    `frameTableLen`*: uint32
    `userDataOfs`*: uint32
    `userDataLen`*: uint32
    `commentOfs`*: uint32
    `commentLen`*: uint32
    `statisticsOfs`*: uint32
    `statisticsLen`*: uint32
    `networkInfoOfs`*: uint32
    `networkInfoLen`*: uint32
    `conversationStatsOfs`*: uint32
    `conversationStatsLen`*: uint32
    `parent`*: KaitaiStruct
    `rawFrameTableInst`*: seq[byte]
    `frameTableInst`: MicrosoftNetworkMonitorV2_FrameIndex
    `frameTableInstFlag`: bool
  MicrosoftNetworkMonitorV2_Linktype* = enum
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
  MicrosoftNetworkMonitorV2_FrameIndex* = ref object of KaitaiStruct
    `entries`*: seq[MicrosoftNetworkMonitorV2_FrameIndexEntry]
    `parent`*: MicrosoftNetworkMonitorV2
  MicrosoftNetworkMonitorV2_FrameIndexEntry* = ref object of KaitaiStruct
    `ofs`*: uint32
    `parent`*: MicrosoftNetworkMonitorV2_FrameIndex
    `bodyInst`: MicrosoftNetworkMonitorV2_Frame
    `bodyInstFlag`: bool
  MicrosoftNetworkMonitorV2_Frame* = ref object of KaitaiStruct
    `tsDelta`*: uint64
    `origLen`*: uint32
    `incLen`*: uint32
    `body`*: KaitaiStruct
    `parent`*: MicrosoftNetworkMonitorV2_FrameIndexEntry
    `rawBody`*: seq[byte]

proc read*(_: typedesc[MicrosoftNetworkMonitorV2], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MicrosoftNetworkMonitorV2
proc read*(_: typedesc[MicrosoftNetworkMonitorV2_FrameIndex], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftNetworkMonitorV2): MicrosoftNetworkMonitorV2_FrameIndex
proc read*(_: typedesc[MicrosoftNetworkMonitorV2_FrameIndexEntry], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftNetworkMonitorV2_FrameIndex): MicrosoftNetworkMonitorV2_FrameIndexEntry
proc read*(_: typedesc[MicrosoftNetworkMonitorV2_Frame], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftNetworkMonitorV2_FrameIndexEntry): MicrosoftNetworkMonitorV2_Frame

proc frameTable*(this: MicrosoftNetworkMonitorV2): MicrosoftNetworkMonitorV2_FrameIndex
proc body*(this: MicrosoftNetworkMonitorV2_FrameIndexEntry): MicrosoftNetworkMonitorV2_Frame


##[
Microsoft Network Monitor (AKA Netmon) is a proprietary Microsoft's
network packet sniffing and analysis tool. It can save captured
traffic as .cap files, which usually contain the packets and may
contain some additional info - enhanced network info, calculated
statistics, etc.

There are at least 2 different versions of the format: v1 and
v2. Netmon v3 seems to use the same file format as v1.

@see <a href="https://docs.microsoft.com/en-us/windows/win32/netmon2/capturefile-header-values">Source</a>
]##
proc read*(_: typedesc[MicrosoftNetworkMonitorV2], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MicrosoftNetworkMonitorV2 =
  template this: untyped = result
  this = new(MicrosoftNetworkMonitorV2)
  let root = if root == nil: cast[MicrosoftNetworkMonitorV2](this) else: cast[MicrosoftNetworkMonitorV2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let signatureExpr = this.io.readBytes(int(4))
  this.signature = signatureExpr

  ##[
  Format version (minor), BCD
  ]##
  let versionMinorExpr = this.io.readU1()
  this.versionMinor = versionMinorExpr

  ##[
  Format version (major), BCD
  ]##
  let versionMajorExpr = this.io.readU1()
  this.versionMajor = versionMajorExpr

  ##[
  Network topology type of captured data
  ]##
  let macTypeExpr = MicrosoftNetworkMonitorV2_Linktype(this.io.readU2le())
  this.macType = macTypeExpr

  ##[
  Timestamp of capture start
  ]##
  let timeCaptureStartExpr = WindowsSystemtime.read(this.io, this.root, this)
  this.timeCaptureStart = timeCaptureStartExpr
  let frameTableOfsExpr = this.io.readU4le()
  this.frameTableOfs = frameTableOfsExpr
  let frameTableLenExpr = this.io.readU4le()
  this.frameTableLen = frameTableLenExpr
  let userDataOfsExpr = this.io.readU4le()
  this.userDataOfs = userDataOfsExpr
  let userDataLenExpr = this.io.readU4le()
  this.userDataLen = userDataLenExpr
  let commentOfsExpr = this.io.readU4le()
  this.commentOfs = commentOfsExpr
  let commentLenExpr = this.io.readU4le()
  this.commentLen = commentLenExpr
  let statisticsOfsExpr = this.io.readU4le()
  this.statisticsOfs = statisticsOfsExpr
  let statisticsLenExpr = this.io.readU4le()
  this.statisticsLen = statisticsLenExpr
  let networkInfoOfsExpr = this.io.readU4le()
  this.networkInfoOfs = networkInfoOfsExpr
  let networkInfoLenExpr = this.io.readU4le()
  this.networkInfoLen = networkInfoLenExpr
  let conversationStatsOfsExpr = this.io.readU4le()
  this.conversationStatsOfs = conversationStatsOfsExpr
  let conversationStatsLenExpr = this.io.readU4le()
  this.conversationStatsLen = conversationStatsLenExpr

proc frameTable(this: MicrosoftNetworkMonitorV2): MicrosoftNetworkMonitorV2_FrameIndex = 

  ##[
  Index that is used to access individual captured frames
  ]##
  if this.frameTableInstFlag:
    return this.frameTableInst
  let pos = this.io.pos()
  this.io.seek(int(this.frameTableOfs))
  let rawFrameTableInstExpr = this.io.readBytes(int(this.frameTableLen))
  this.rawFrameTableInst = rawFrameTableInstExpr
  let rawFrameTableInstIo = newKaitaiStream(rawFrameTableInstExpr)
  let frameTableInstExpr = MicrosoftNetworkMonitorV2_FrameIndex.read(rawFrameTableInstIo, this.root, this)
  this.frameTableInst = frameTableInstExpr
  this.io.seek(pos)
  this.frameTableInstFlag = true
  return this.frameTableInst

proc fromFile*(_: typedesc[MicrosoftNetworkMonitorV2], filename: string): MicrosoftNetworkMonitorV2 =
  MicrosoftNetworkMonitorV2.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MicrosoftNetworkMonitorV2_FrameIndex], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftNetworkMonitorV2): MicrosoftNetworkMonitorV2_FrameIndex =
  template this: untyped = result
  this = new(MicrosoftNetworkMonitorV2_FrameIndex)
  let root = if root == nil: cast[MicrosoftNetworkMonitorV2](this) else: cast[MicrosoftNetworkMonitorV2](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = MicrosoftNetworkMonitorV2_FrameIndexEntry.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[MicrosoftNetworkMonitorV2_FrameIndex], filename: string): MicrosoftNetworkMonitorV2_FrameIndex =
  MicrosoftNetworkMonitorV2_FrameIndex.read(newKaitaiFileStream(filename), nil, nil)


##[
Each index entry is just a pointer to where the frame data is
stored in the file.

]##
proc read*(_: typedesc[MicrosoftNetworkMonitorV2_FrameIndexEntry], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftNetworkMonitorV2_FrameIndex): MicrosoftNetworkMonitorV2_FrameIndexEntry =
  template this: untyped = result
  this = new(MicrosoftNetworkMonitorV2_FrameIndexEntry)
  let root = if root == nil: cast[MicrosoftNetworkMonitorV2](this) else: cast[MicrosoftNetworkMonitorV2](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Absolute pointer to frame data in the file
  ]##
  let ofsExpr = this.io.readU4le()
  this.ofs = ofsExpr

proc body(this: MicrosoftNetworkMonitorV2_FrameIndexEntry): MicrosoftNetworkMonitorV2_Frame = 

  ##[
  Frame body itself
  ]##
  if this.bodyInstFlag:
    return this.bodyInst
  let io = MicrosoftNetworkMonitorV2(this.root).io
  let pos = io.pos()
  io.seek(int(this.ofs))
  let bodyInstExpr = MicrosoftNetworkMonitorV2_Frame.read(io, this.root, this)
  this.bodyInst = bodyInstExpr
  io.seek(pos)
  this.bodyInstFlag = true
  return this.bodyInst

proc fromFile*(_: typedesc[MicrosoftNetworkMonitorV2_FrameIndexEntry], filename: string): MicrosoftNetworkMonitorV2_FrameIndexEntry =
  MicrosoftNetworkMonitorV2_FrameIndexEntry.read(newKaitaiFileStream(filename), nil, nil)


##[
A container for actually captured network data. Allow to
timestamp individual frames and designates how much data from
the original packet was actually written into the file.

@see <a href="https://docs.microsoft.com/en-us/windows/win32/netmon2/frame">Source</a>
]##
proc read*(_: typedesc[MicrosoftNetworkMonitorV2_Frame], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftNetworkMonitorV2_FrameIndexEntry): MicrosoftNetworkMonitorV2_Frame =
  template this: untyped = result
  this = new(MicrosoftNetworkMonitorV2_Frame)
  let root = if root == nil: cast[MicrosoftNetworkMonitorV2](this) else: cast[MicrosoftNetworkMonitorV2](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Time stamp - usecs since start of capture
  ]##
  let tsDeltaExpr = this.io.readU8le()
  this.tsDelta = tsDeltaExpr

  ##[
  Actual length of packet
  ]##
  let origLenExpr = this.io.readU4le()
  this.origLen = origLenExpr

  ##[
  Number of octets captured in file
  ]##
  let incLenExpr = this.io.readU4le()
  this.incLen = incLenExpr

  ##[
  Actual packet captured from the network
  ]##
  block:
    let on = MicrosoftNetworkMonitorV2(this.root).macType
    if on == microsoft_network_monitor_v2.ethernet:
      let rawBodyExpr = this.io.readBytes(int(this.incLen))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = EthernetFrame.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int(this.incLen))
      this.body = bodyExpr

proc fromFile*(_: typedesc[MicrosoftNetworkMonitorV2_Frame], filename: string): MicrosoftNetworkMonitorV2_Frame =
  MicrosoftNetworkMonitorV2_Frame.read(newKaitaiFileStream(filename), nil, nil)

