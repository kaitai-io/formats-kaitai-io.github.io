import kaitai_struct_nim_runtime
import options
import /network/ethernet_frame
import /network/packet_ppi

import "ethernet_frame"
import "packet_ppi"
type
  Pcap* = ref object of KaitaiStruct
    `hdr`*: Pcap_Header
    `packets`*: seq[Pcap_Packet]
    `parent`*: KaitaiStruct
  Pcap_Linktype* = enum
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
  Pcap_Header* = ref object of KaitaiStruct
    `magicNumber`*: seq[byte]
    `versionMajor`*: uint16
    `versionMinor`*: uint16
    `thiszone`*: int32
    `sigfigs`*: uint32
    `snaplen`*: uint32
    `network`*: Pcap_Linktype
    `parent`*: Pcap
  Pcap_Packet* = ref object of KaitaiStruct
    `tsSec`*: uint32
    `tsUsec`*: uint32
    `inclLen`*: uint32
    `origLen`*: uint32
    `body`*: KaitaiStruct
    `parent`*: Pcap
    `rawBody`*: seq[byte]

proc read*(_: typedesc[Pcap], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Pcap
proc read*(_: typedesc[Pcap_Header], io: KaitaiStream, root: KaitaiStruct, parent: Pcap): Pcap_Header
proc read*(_: typedesc[Pcap_Packet], io: KaitaiStream, root: KaitaiStruct, parent: Pcap): Pcap_Packet



##[
PCAP (named after libpcap / winpcap) is a popular format for saving
network traffic grabbed by network sniffers. It is typically
produced by tools like [tcpdump](https://www.tcpdump.org/) or
[Wireshark](https://www.wireshark.org/).

@see <a href="http://wiki.wireshark.org/Development/LibpcapFileFormat">Source</a>
]##
proc read*(_: typedesc[Pcap], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Pcap =
  template this: untyped = result
  this = new(Pcap)
  let root = if root == nil: cast[Pcap](this) else: cast[Pcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let hdrExpr = Pcap_Header.read(this.io, this.root, this)
  this.hdr = hdrExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = Pcap_Packet.read(this.io, this.root, this)
      this.packets.add(it)
      inc i

proc fromFile*(_: typedesc[Pcap], filename: string): Pcap =
  Pcap.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://wiki.wireshark.org/Development/LibpcapFileFormat#Global_Header">Source</a>
]##
proc read*(_: typedesc[Pcap_Header], io: KaitaiStream, root: KaitaiStruct, parent: Pcap): Pcap_Header =
  template this: untyped = result
  this = new(Pcap_Header)
  let root = if root == nil: cast[Pcap](this) else: cast[Pcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicNumberExpr = this.io.readBytes(int(4))
  this.magicNumber = magicNumberExpr
  let versionMajorExpr = this.io.readU2le()
  this.versionMajor = versionMajorExpr
  let versionMinorExpr = this.io.readU2le()
  this.versionMinor = versionMinorExpr

  ##[
  Correction time in seconds between UTC and the local
timezone of the following packet header timestamps.

  ]##
  let thiszoneExpr = this.io.readS4le()
  this.thiszone = thiszoneExpr

  ##[
  In theory, the accuracy of time stamps in the capture; in
practice, all tools set it to 0.

  ]##
  let sigfigsExpr = this.io.readU4le()
  this.sigfigs = sigfigsExpr

  ##[
  The "snapshot length" for the capture (typically 65535 or
even more, but might be limited by the user), see: incl_len
vs. orig_len.

  ]##
  let snaplenExpr = this.io.readU4le()
  this.snaplen = snaplenExpr

  ##[
  Link-layer header type, specifying the type of headers at
the beginning of the packet.

  ]##
  let networkExpr = Pcap_Linktype(this.io.readU4le())
  this.network = networkExpr

proc fromFile*(_: typedesc[Pcap_Header], filename: string): Pcap_Header =
  Pcap_Header.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://wiki.wireshark.org/Development/LibpcapFileFormat#Record_.28Packet.29_Header">Source</a>
]##
proc read*(_: typedesc[Pcap_Packet], io: KaitaiStream, root: KaitaiStruct, parent: Pcap): Pcap_Packet =
  template this: untyped = result
  this = new(Pcap_Packet)
  let root = if root == nil: cast[Pcap](this) else: cast[Pcap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tsSecExpr = this.io.readU4le()
  this.tsSec = tsSecExpr
  let tsUsecExpr = this.io.readU4le()
  this.tsUsec = tsUsecExpr

  ##[
  Number of bytes of packet data actually captured and saved in the file.
  ]##
  let inclLenExpr = this.io.readU4le()
  this.inclLen = inclLenExpr

  ##[
  Length of the packet as it appeared on the network when it was captured.
  ]##
  let origLenExpr = this.io.readU4le()
  this.origLen = origLenExpr

  ##[
  @see <a href="https://wiki.wireshark.org/Development/LibpcapFileFormat#Packet_Data">Source</a>
  ]##
  block:
    let on = Pcap(this.root).hdr.network
    if on == pcap.ppi:
      let rawBodyExpr = this.io.readBytes(int(this.inclLen))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = PacketPpi.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == pcap.ethernet:
      let rawBodyExpr = this.io.readBytes(int(this.inclLen))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = EthernetFrame.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int(this.inclLen))
      this.body = bodyExpr

proc fromFile*(_: typedesc[Pcap_Packet], filename: string): Pcap_Packet =
  Pcap_Packet.read(newKaitaiFileStream(filename), nil, nil)

