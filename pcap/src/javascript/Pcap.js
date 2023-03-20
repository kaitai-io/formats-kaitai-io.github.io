// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './PacketPpi', './EthernetFrame'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./PacketPpi'), require('./EthernetFrame'));
  } else {
    root.Pcap = factory(root.KaitaiStream, root.PacketPpi, root.EthernetFrame);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream, PacketPpi, EthernetFrame) {
/**
 * PCAP (named after libpcap / winpcap) is a popular format for saving
 * network traffic grabbed by network sniffers. It is typically
 * produced by tools like [tcpdump](https://www.tcpdump.org/) or
 * [Wireshark](https://www.wireshark.org/).
 * @see {@link https://wiki.wireshark.org/Development/LibpcapFileFormat|Source}
 */

var Pcap = (function() {
  Pcap.Linktype = Object.freeze({
    NULL_LINKTYPE: 0,
    ETHERNET: 1,
    EXP_ETHERNET: 2,
    AX25: 3,
    PRONET: 4,
    CHAOS: 5,
    IEEE802_5: 6,
    ARCNET_BSD: 7,
    SLIP: 8,
    PPP: 9,
    FDDI: 10,
    REDBACK_SMARTEDGE: 32,
    PPP_HDLC: 50,
    PPP_ETHER: 51,
    SYMANTEC_FIREWALL: 99,
    ATM_RFC1483: 100,
    RAW: 101,
    C_HDLC: 104,
    IEEE802_11: 105,
    ATM_CLIP: 106,
    FRELAY: 107,
    LOOP: 108,
    ENC: 109,
    NETBSD_HDLC: 112,
    LINUX_SLL: 113,
    LTALK: 114,
    ECONET: 115,
    IPFILTER: 116,
    PFLOG: 117,
    CISCO_IOS: 118,
    IEEE802_11_PRISM: 119,
    AIRONET_HEADER: 120,
    IP_OVER_FC: 122,
    SUNATM: 123,
    RIO: 124,
    PCI_EXP: 125,
    AURORA: 126,
    IEEE802_11_RADIOTAP: 127,
    TZSP: 128,
    ARCNET_LINUX: 129,
    JUNIPER_MLPPP: 130,
    JUNIPER_MLFR: 131,
    JUNIPER_ES: 132,
    JUNIPER_GGSN: 133,
    JUNIPER_MFR: 134,
    JUNIPER_ATM2: 135,
    JUNIPER_SERVICES: 136,
    JUNIPER_ATM1: 137,
    APPLE_IP_OVER_IEEE1394: 138,
    MTP2_WITH_PHDR: 139,
    MTP2: 140,
    MTP3: 141,
    SCCP: 142,
    DOCSIS: 143,
    LINUX_IRDA: 144,
    IBM_SP: 145,
    IBM_SN: 146,
    USER0: 147,
    USER1: 148,
    USER2: 149,
    USER3: 150,
    USER4: 151,
    USER5: 152,
    USER6: 153,
    USER7: 154,
    USER8: 155,
    USER9: 156,
    USER10: 157,
    USER11: 158,
    USER12: 159,
    USER13: 160,
    USER14: 161,
    USER15: 162,
    IEEE802_11_AVS: 163,
    JUNIPER_MONITOR: 164,
    BACNET_MS_TP: 165,
    PPP_PPPD: 166,
    JUNIPER_PPPOE: 167,
    JUNIPER_PPPOE_ATM: 168,
    GPRS_LLC: 169,
    GPF_T: 170,
    GPF_F: 171,
    GCOM_T1E1: 172,
    GCOM_SERIAL: 173,
    JUNIPER_PIC_PEER: 174,
    ERF_ETH: 175,
    ERF_POS: 176,
    LINUX_LAPD: 177,
    JUNIPER_ETHER: 178,
    JUNIPER_PPP: 179,
    JUNIPER_FRELAY: 180,
    JUNIPER_CHDLC: 181,
    MFR: 182,
    JUNIPER_VP: 183,
    A429: 184,
    A653_ICM: 185,
    USB_FREEBSD: 186,
    BLUETOOTH_HCI_H4: 187,
    IEEE802_16_MAC_CPS: 188,
    USB_LINUX: 189,
    CAN20B: 190,
    IEEE802_15_4_LINUX: 191,
    PPI: 192,
    IEEE802_16_MAC_CPS_RADIO: 193,
    JUNIPER_ISM: 194,
    IEEE802_15_4_WITHFCS: 195,
    SITA: 196,
    ERF: 197,
    RAIF1: 198,
    IPMB_KONTRON: 199,
    JUNIPER_ST: 200,
    BLUETOOTH_HCI_H4_WITH_PHDR: 201,
    AX25_KISS: 202,
    LAPD: 203,
    PPP_WITH_DIR: 204,
    C_HDLC_WITH_DIR: 205,
    FRELAY_WITH_DIR: 206,
    LAPB_WITH_DIR: 207,
    IPMB_LINUX: 209,
    FLEXRAY: 210,
    MOST: 211,
    LIN: 212,
    X2E_SERIAL: 213,
    X2E_XORAYA: 214,
    IEEE802_15_4_NONASK_PHY: 215,
    LINUX_EVDEV: 216,
    GSMTAP_UM: 217,
    GSMTAP_ABIS: 218,
    MPLS: 219,
    USB_LINUX_MMAPPED: 220,
    DECT: 221,
    AOS: 222,
    WIHART: 223,
    FC_2: 224,
    FC_2_WITH_FRAME_DELIMS: 225,
    IPNET: 226,
    CAN_SOCKETCAN: 227,
    IPV4: 228,
    IPV6: 229,
    IEEE802_15_4_NOFCS: 230,
    DBUS: 231,
    JUNIPER_VS: 232,
    JUNIPER_SRX_E2E: 233,
    JUNIPER_FIBRECHANNEL: 234,
    DVB_CI: 235,
    MUX27010: 236,
    STANAG_5066_D_PDU: 237,
    JUNIPER_ATM_CEMIC: 238,
    NFLOG: 239,
    NETANALYZER: 240,
    NETANALYZER_TRANSPARENT: 241,
    IPOIB: 242,
    MPEG_2_TS: 243,
    NG40: 244,
    NFC_LLCP: 245,
    PFSYNC: 246,
    INFINIBAND: 247,
    SCTP: 248,
    USBPCAP: 249,
    RTAC_SERIAL: 250,
    BLUETOOTH_LE_LL: 251,
    WIRESHARK_UPPER_PDU: 252,
    NETLINK: 253,
    BLUETOOTH_LINUX_MONITOR: 254,
    BLUETOOTH_BREDR_BB: 255,
    BLUETOOTH_LE_LL_WITH_PHDR: 256,
    PROFIBUS_DL: 257,
    PKTAP: 258,
    EPON: 259,
    IPMI_HPM_2: 260,
    ZWAVE_R1_R2: 261,
    ZWAVE_R3: 262,
    WATTSTOPPER_DLM: 263,
    ISO_14443: 264,
    RDS: 265,
    USB_DARWIN: 266,
    OPENFLOW: 267,
    SDLC: 268,
    TI_LLN_SNIFFER: 269,
    LORATAP: 270,
    VSOCK: 271,
    NORDIC_BLE: 272,
    DOCSIS31_XRA31: 273,
    ETHERNET_MPACKET: 274,
    DISPLAYPORT_AUX: 275,
    LINUX_SLL2: 276,
    SERCOS_MONITOR: 277,
    OPENVIZSLA: 278,
    EBHSCR: 279,
    VPP_DISPATCH: 280,
    DSA_TAG_BRCM: 281,
    DSA_TAG_BRCM_PREPEND: 282,
    IEEE802_15_4_TAP: 283,
    DSA_TAG_DSA: 284,
    DSA_TAG_EDSA: 285,
    ELEE: 286,
    ZWAVE_SERIAL: 287,
    USB_2_0: 288,
    ATSC_ALP: 289,
    ETW: 290,
    NETANALYZER_NG: 291,
    ZBOSS_NCP: 292,
    USB_2_0_LOW_SPEED: 293,
    USB_2_0_FULL_SPEED: 294,
    USB_2_0_HIGH_SPEED: 295,
    AUERSWALD_LOG: 296,
    ZWAVE_TAP: 297,
    SILABS_DEBUG_CHANNEL: 298,
    FIRA_UCI: 299,

    0: "NULL_LINKTYPE",
    1: "ETHERNET",
    2: "EXP_ETHERNET",
    3: "AX25",
    4: "PRONET",
    5: "CHAOS",
    6: "IEEE802_5",
    7: "ARCNET_BSD",
    8: "SLIP",
    9: "PPP",
    10: "FDDI",
    32: "REDBACK_SMARTEDGE",
    50: "PPP_HDLC",
    51: "PPP_ETHER",
    99: "SYMANTEC_FIREWALL",
    100: "ATM_RFC1483",
    101: "RAW",
    104: "C_HDLC",
    105: "IEEE802_11",
    106: "ATM_CLIP",
    107: "FRELAY",
    108: "LOOP",
    109: "ENC",
    112: "NETBSD_HDLC",
    113: "LINUX_SLL",
    114: "LTALK",
    115: "ECONET",
    116: "IPFILTER",
    117: "PFLOG",
    118: "CISCO_IOS",
    119: "IEEE802_11_PRISM",
    120: "AIRONET_HEADER",
    122: "IP_OVER_FC",
    123: "SUNATM",
    124: "RIO",
    125: "PCI_EXP",
    126: "AURORA",
    127: "IEEE802_11_RADIOTAP",
    128: "TZSP",
    129: "ARCNET_LINUX",
    130: "JUNIPER_MLPPP",
    131: "JUNIPER_MLFR",
    132: "JUNIPER_ES",
    133: "JUNIPER_GGSN",
    134: "JUNIPER_MFR",
    135: "JUNIPER_ATM2",
    136: "JUNIPER_SERVICES",
    137: "JUNIPER_ATM1",
    138: "APPLE_IP_OVER_IEEE1394",
    139: "MTP2_WITH_PHDR",
    140: "MTP2",
    141: "MTP3",
    142: "SCCP",
    143: "DOCSIS",
    144: "LINUX_IRDA",
    145: "IBM_SP",
    146: "IBM_SN",
    147: "USER0",
    148: "USER1",
    149: "USER2",
    150: "USER3",
    151: "USER4",
    152: "USER5",
    153: "USER6",
    154: "USER7",
    155: "USER8",
    156: "USER9",
    157: "USER10",
    158: "USER11",
    159: "USER12",
    160: "USER13",
    161: "USER14",
    162: "USER15",
    163: "IEEE802_11_AVS",
    164: "JUNIPER_MONITOR",
    165: "BACNET_MS_TP",
    166: "PPP_PPPD",
    167: "JUNIPER_PPPOE",
    168: "JUNIPER_PPPOE_ATM",
    169: "GPRS_LLC",
    170: "GPF_T",
    171: "GPF_F",
    172: "GCOM_T1E1",
    173: "GCOM_SERIAL",
    174: "JUNIPER_PIC_PEER",
    175: "ERF_ETH",
    176: "ERF_POS",
    177: "LINUX_LAPD",
    178: "JUNIPER_ETHER",
    179: "JUNIPER_PPP",
    180: "JUNIPER_FRELAY",
    181: "JUNIPER_CHDLC",
    182: "MFR",
    183: "JUNIPER_VP",
    184: "A429",
    185: "A653_ICM",
    186: "USB_FREEBSD",
    187: "BLUETOOTH_HCI_H4",
    188: "IEEE802_16_MAC_CPS",
    189: "USB_LINUX",
    190: "CAN20B",
    191: "IEEE802_15_4_LINUX",
    192: "PPI",
    193: "IEEE802_16_MAC_CPS_RADIO",
    194: "JUNIPER_ISM",
    195: "IEEE802_15_4_WITHFCS",
    196: "SITA",
    197: "ERF",
    198: "RAIF1",
    199: "IPMB_KONTRON",
    200: "JUNIPER_ST",
    201: "BLUETOOTH_HCI_H4_WITH_PHDR",
    202: "AX25_KISS",
    203: "LAPD",
    204: "PPP_WITH_DIR",
    205: "C_HDLC_WITH_DIR",
    206: "FRELAY_WITH_DIR",
    207: "LAPB_WITH_DIR",
    209: "IPMB_LINUX",
    210: "FLEXRAY",
    211: "MOST",
    212: "LIN",
    213: "X2E_SERIAL",
    214: "X2E_XORAYA",
    215: "IEEE802_15_4_NONASK_PHY",
    216: "LINUX_EVDEV",
    217: "GSMTAP_UM",
    218: "GSMTAP_ABIS",
    219: "MPLS",
    220: "USB_LINUX_MMAPPED",
    221: "DECT",
    222: "AOS",
    223: "WIHART",
    224: "FC_2",
    225: "FC_2_WITH_FRAME_DELIMS",
    226: "IPNET",
    227: "CAN_SOCKETCAN",
    228: "IPV4",
    229: "IPV6",
    230: "IEEE802_15_4_NOFCS",
    231: "DBUS",
    232: "JUNIPER_VS",
    233: "JUNIPER_SRX_E2E",
    234: "JUNIPER_FIBRECHANNEL",
    235: "DVB_CI",
    236: "MUX27010",
    237: "STANAG_5066_D_PDU",
    238: "JUNIPER_ATM_CEMIC",
    239: "NFLOG",
    240: "NETANALYZER",
    241: "NETANALYZER_TRANSPARENT",
    242: "IPOIB",
    243: "MPEG_2_TS",
    244: "NG40",
    245: "NFC_LLCP",
    246: "PFSYNC",
    247: "INFINIBAND",
    248: "SCTP",
    249: "USBPCAP",
    250: "RTAC_SERIAL",
    251: "BLUETOOTH_LE_LL",
    252: "WIRESHARK_UPPER_PDU",
    253: "NETLINK",
    254: "BLUETOOTH_LINUX_MONITOR",
    255: "BLUETOOTH_BREDR_BB",
    256: "BLUETOOTH_LE_LL_WITH_PHDR",
    257: "PROFIBUS_DL",
    258: "PKTAP",
    259: "EPON",
    260: "IPMI_HPM_2",
    261: "ZWAVE_R1_R2",
    262: "ZWAVE_R3",
    263: "WATTSTOPPER_DLM",
    264: "ISO_14443",
    265: "RDS",
    266: "USB_DARWIN",
    267: "OPENFLOW",
    268: "SDLC",
    269: "TI_LLN_SNIFFER",
    270: "LORATAP",
    271: "VSOCK",
    272: "NORDIC_BLE",
    273: "DOCSIS31_XRA31",
    274: "ETHERNET_MPACKET",
    275: "DISPLAYPORT_AUX",
    276: "LINUX_SLL2",
    277: "SERCOS_MONITOR",
    278: "OPENVIZSLA",
    279: "EBHSCR",
    280: "VPP_DISPATCH",
    281: "DSA_TAG_BRCM",
    282: "DSA_TAG_BRCM_PREPEND",
    283: "IEEE802_15_4_TAP",
    284: "DSA_TAG_DSA",
    285: "DSA_TAG_EDSA",
    286: "ELEE",
    287: "ZWAVE_SERIAL",
    288: "USB_2_0",
    289: "ATSC_ALP",
    290: "ETW",
    291: "NETANALYZER_NG",
    292: "ZBOSS_NCP",
    293: "USB_2_0_LOW_SPEED",
    294: "USB_2_0_FULL_SPEED",
    295: "USB_2_0_HIGH_SPEED",
    296: "AUERSWALD_LOG",
    297: "ZWAVE_TAP",
    298: "SILABS_DEBUG_CHANNEL",
    299: "FIRA_UCI",
  });

  function Pcap(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Pcap.prototype._read = function() {
    this.hdr = new Header(this._io, this, this._root);
    this.packets = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.packets.push(new Packet(this._io, this, this._root));
      i++;
    }
  }

  /**
   * @see {@link https://wiki.wireshark.org/Development/LibpcapFileFormat#Global_Header|Source}
   */

  var Header = Pcap.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.magicNumber = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magicNumber, [212, 195, 178, 161]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([212, 195, 178, 161], this.magicNumber, this._io, "/types/header/seq/0");
      }
      this.versionMajor = this._io.readU2le();
      if (!(this.versionMajor == 2)) {
        throw new KaitaiStream.ValidationNotEqualError(2, this.versionMajor, this._io, "/types/header/seq/1");
      }
      this.versionMinor = this._io.readU2le();
      this.thiszone = this._io.readS4le();
      this.sigfigs = this._io.readU4le();
      this.snaplen = this._io.readU4le();
      this.network = this._io.readU4le();
    }

    /**
     * Correction time in seconds between UTC and the local
     * timezone of the following packet header timestamps.
     */

    /**
     * In theory, the accuracy of time stamps in the capture; in
     * practice, all tools set it to 0.
     */

    /**
     * The "snapshot length" for the capture (typically 65535 or
     * even more, but might be limited by the user), see: incl_len
     * vs. orig_len.
     */

    /**
     * Link-layer header type, specifying the type of headers at
     * the beginning of the packet.
     */

    return Header;
  })();

  /**
   * @see {@link https://wiki.wireshark.org/Development/LibpcapFileFormat#Record_.28Packet.29_Header|Source}
   */

  var Packet = Pcap.Packet = (function() {
    function Packet(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Packet.prototype._read = function() {
      this.tsSec = this._io.readU4le();
      this.tsUsec = this._io.readU4le();
      this.inclLen = this._io.readU4le();
      this.origLen = this._io.readU4le();
      switch (this._root.hdr.network) {
      case Pcap.Linktype.PPI:
        this._raw_body = this._io.readBytes(this.inclLen);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new PacketPpi(_io__raw_body, this, null);
        break;
      case Pcap.Linktype.ETHERNET:
        this._raw_body = this._io.readBytes(this.inclLen);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new EthernetFrame(_io__raw_body, this, null);
        break;
      default:
        this.body = this._io.readBytes(this.inclLen);
        break;
      }
    }

    /**
     * Number of bytes of packet data actually captured and saved in the file.
     */

    /**
     * Length of the packet as it appeared on the network when it was captured.
     */

    /**
     * @see {@link https://wiki.wireshark.org/Development/LibpcapFileFormat#Packet_Data|Source}
     */

    return Packet;
  })();

  return Pcap;
})();
return Pcap;
}));
