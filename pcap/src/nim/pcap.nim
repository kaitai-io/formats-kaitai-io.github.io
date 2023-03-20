import kaitai_struct_nim_runtime
import options
import /network/ethernet_frame
import /network/packet_ppi

import "packet_ppi"
import "ethernet_frame"
type
  Pcap* = ref object of KaitaiStruct
    `hdr`*: Pcap_Header
    `packets`*: seq[Pcap_Packet]
    `parent`*: KaitaiStruct
  Pcap_Linktype* = enum
    null_linktype = 0
    ethernet = 1
    exp_ethernet = 2
    ax25 = 3
    pronet = 4
    chaos = 5
    ieee802_5 = 6
    arcnet_bsd = 7
    slip = 8
    ppp = 9
    fddi = 10
    redback_smartedge = 32
    ppp_hdlc = 50
    ppp_ether = 51
    symantec_firewall = 99
    atm_rfc1483 = 100
    raw = 101
    c_hdlc = 104
    ieee802_11 = 105
    atm_clip = 106
    frelay = 107
    loop = 108
    enc = 109
    netbsd_hdlc = 112
    linux_sll = 113
    ltalk = 114
    econet = 115
    ipfilter = 116
    pflog = 117
    cisco_ios = 118
    ieee802_11_prism = 119
    aironet_header = 120
    ip_over_fc = 122
    sunatm = 123
    rio = 124
    pci_exp = 125
    aurora = 126
    ieee802_11_radiotap = 127
    tzsp = 128
    arcnet_linux = 129
    juniper_mlppp = 130
    juniper_mlfr = 131
    juniper_es = 132
    juniper_ggsn = 133
    juniper_mfr = 134
    juniper_atm2 = 135
    juniper_services = 136
    juniper_atm1 = 137
    apple_ip_over_ieee1394 = 138
    mtp2_with_phdr = 139
    mtp2 = 140
    mtp3 = 141
    sccp = 142
    docsis = 143
    linux_irda = 144
    ibm_sp = 145
    ibm_sn = 146
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
    juniper_monitor = 164
    bacnet_ms_tp = 165
    ppp_pppd = 166
    juniper_pppoe = 167
    juniper_pppoe_atm = 168
    gprs_llc = 169
    gpf_t = 170
    gpf_f = 171
    gcom_t1e1 = 172
    gcom_serial = 173
    juniper_pic_peer = 174
    erf_eth = 175
    erf_pos = 176
    linux_lapd = 177
    juniper_ether = 178
    juniper_ppp = 179
    juniper_frelay = 180
    juniper_chdlc = 181
    mfr = 182
    juniper_vp = 183
    a429 = 184
    a653_icm = 185
    usb_freebsd = 186
    bluetooth_hci_h4 = 187
    ieee802_16_mac_cps = 188
    usb_linux = 189
    can20b = 190
    ieee802_15_4_linux = 191
    ppi = 192
    ieee802_16_mac_cps_radio = 193
    juniper_ism = 194
    ieee802_15_4_withfcs = 195
    sita = 196
    erf = 197
    raif1 = 198
    ipmb_kontron = 199
    juniper_st = 200
    bluetooth_hci_h4_with_phdr = 201
    ax25_kiss = 202
    lapd = 203
    ppp_with_dir = 204
    c_hdlc_with_dir = 205
    frelay_with_dir = 206
    lapb_with_dir = 207
    ipmb_linux = 209
    flexray = 210
    most = 211
    lin = 212
    x2e_serial = 213
    x2e_xoraya = 214
    ieee802_15_4_nonask_phy = 215
    linux_evdev = 216
    gsmtap_um = 217
    gsmtap_abis = 218
    mpls = 219
    usb_linux_mmapped = 220
    dect = 221
    aos = 222
    wihart = 223
    fc_2 = 224
    fc_2_with_frame_delims = 225
    ipnet = 226
    can_socketcan = 227
    ipv4 = 228
    ipv6 = 229
    ieee802_15_4_nofcs = 230
    dbus = 231
    juniper_vs = 232
    juniper_srx_e2e = 233
    juniper_fibrechannel = 234
    dvb_ci = 235
    mux27010 = 236
    stanag_5066_d_pdu = 237
    juniper_atm_cemic = 238
    nflog = 239
    netanalyzer = 240
    netanalyzer_transparent = 241
    ipoib = 242
    mpeg_2_ts = 243
    ng40 = 244
    nfc_llcp = 245
    pfsync = 246
    infiniband = 247
    sctp = 248
    usbpcap = 249
    rtac_serial = 250
    bluetooth_le_ll = 251
    wireshark_upper_pdu = 252
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
    rds = 265
    usb_darwin = 266
    openflow = 267
    sdlc = 268
    ti_lln_sniffer = 269
    loratap = 270
    vsock = 271
    nordic_ble = 272
    docsis31_xra31 = 273
    ethernet_mpacket = 274
    displayport_aux = 275
    linux_sll2 = 276
    sercos_monitor = 277
    openvizsla = 278
    ebhscr = 279
    vpp_dispatch = 280
    dsa_tag_brcm = 281
    dsa_tag_brcm_prepend = 282
    ieee802_15_4_tap = 283
    dsa_tag_dsa = 284
    dsa_tag_edsa = 285
    elee = 286
    zwave_serial = 287
    usb_2_0 = 288
    atsc_alp = 289
    etw = 290
    netanalyzer_ng = 291
    zboss_ncp = 292
    usb_2_0_low_speed = 293
    usb_2_0_full_speed = 294
    usb_2_0_high_speed = 295
    auerswald_log = 296
    zwave_tap = 297
    silabs_debug_channel = 298
    fira_uci = 299
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

@see <a href="https://wiki.wireshark.org/Development/LibpcapFileFormat">Source</a>
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

