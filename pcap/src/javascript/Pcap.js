// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './EthernetFrame', './PacketPpi'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./EthernetFrame'), require('./PacketPpi'));
  } else {
    root.Pcap = factory(root.KaitaiStream, root.EthernetFrame, root.PacketPpi);
  }
}(this, function (KaitaiStream, EthernetFrame, PacketPpi) {
/**
 * PCAP (named after libpcap / winpcap) is a popular format for saving
 * network traffic grabbed by network sniffers. It is typically
 * produced by tools like [tcpdump](https://www.tcpdump.org/) or
 * [Wireshark](https://www.wireshark.org/).
 * @see {@link http://wiki.wireshark.org/Development/LibpcapFileFormat|Source}
 */

var Pcap = (function() {
  Pcap.Linktype = Object.freeze({
    NULL_LINKTYPE: 0,
    ETHERNET: 1,
    AX25: 3,
    IEEE802_5: 6,
    ARCNET_BSD: 7,
    SLIP: 8,
    PPP: 9,
    FDDI: 10,
    PPP_HDLC: 50,
    PPP_ETHER: 51,
    ATM_RFC1483: 100,
    RAW: 101,
    C_HDLC: 104,
    IEEE802_11: 105,
    FRELAY: 107,
    LOOP: 108,
    LINUX_SLL: 113,
    LTALK: 114,
    PFLOG: 117,
    IEEE802_11_PRISM: 119,
    IP_OVER_FC: 122,
    SUNATM: 123,
    IEEE802_11_RADIOTAP: 127,
    ARCNET_LINUX: 129,
    APPLE_IP_OVER_IEEE1394: 138,
    MTP2_WITH_PHDR: 139,
    MTP2: 140,
    MTP3: 141,
    SCCP: 142,
    DOCSIS: 143,
    LINUX_IRDA: 144,
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
    BACNET_MS_TP: 165,
    PPP_PPPD: 166,
    GPRS_LLC: 169,
    GPF_T: 170,
    GPF_F: 171,
    LINUX_LAPD: 177,
    BLUETOOTH_HCI_H4: 187,
    USB_LINUX: 189,
    PPI: 192,
    IEEE802_15_4: 195,
    SITA: 196,
    ERF: 197,
    BLUETOOTH_HCI_H4_WITH_PHDR: 201,
    AX25_KISS: 202,
    LAPD: 203,
    PPP_WITH_DIR: 204,
    C_HDLC_WITH_DIR: 205,
    FRELAY_WITH_DIR: 206,
    IPMB_LINUX: 209,
    IEEE802_15_4_NONASK_PHY: 215,
    USB_LINUX_MMAPPED: 220,
    FC_2: 224,
    FC_2_WITH_FRAME_DELIMS: 225,
    IPNET: 226,
    CAN_SOCKETCAN: 227,
    IPV4: 228,
    IPV6: 229,
    IEEE802_15_4_NOFCS: 230,
    DBUS: 231,
    DVB_CI: 235,
    MUX27010: 236,
    STANAG_5066_D_PDU: 237,
    NFLOG: 239,
    NETANALYZER: 240,
    NETANALYZER_TRANSPARENT: 241,
    IPOIB: 242,
    MPEG_2_TS: 243,
    NG40: 244,
    NFC_LLCP: 245,
    INFINIBAND: 247,
    SCTP: 248,
    USBPCAP: 249,
    RTAC_SERIAL: 250,
    BLUETOOTH_LE_LL: 251,
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

    0: "NULL_LINKTYPE",
    1: "ETHERNET",
    3: "AX25",
    6: "IEEE802_5",
    7: "ARCNET_BSD",
    8: "SLIP",
    9: "PPP",
    10: "FDDI",
    50: "PPP_HDLC",
    51: "PPP_ETHER",
    100: "ATM_RFC1483",
    101: "RAW",
    104: "C_HDLC",
    105: "IEEE802_11",
    107: "FRELAY",
    108: "LOOP",
    113: "LINUX_SLL",
    114: "LTALK",
    117: "PFLOG",
    119: "IEEE802_11_PRISM",
    122: "IP_OVER_FC",
    123: "SUNATM",
    127: "IEEE802_11_RADIOTAP",
    129: "ARCNET_LINUX",
    138: "APPLE_IP_OVER_IEEE1394",
    139: "MTP2_WITH_PHDR",
    140: "MTP2",
    141: "MTP3",
    142: "SCCP",
    143: "DOCSIS",
    144: "LINUX_IRDA",
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
    165: "BACNET_MS_TP",
    166: "PPP_PPPD",
    169: "GPRS_LLC",
    170: "GPF_T",
    171: "GPF_F",
    177: "LINUX_LAPD",
    187: "BLUETOOTH_HCI_H4",
    189: "USB_LINUX",
    192: "PPI",
    195: "IEEE802_15_4",
    196: "SITA",
    197: "ERF",
    201: "BLUETOOTH_HCI_H4_WITH_PHDR",
    202: "AX25_KISS",
    203: "LAPD",
    204: "PPP_WITH_DIR",
    205: "C_HDLC_WITH_DIR",
    206: "FRELAY_WITH_DIR",
    209: "IPMB_LINUX",
    215: "IEEE802_15_4_NONASK_PHY",
    220: "USB_LINUX_MMAPPED",
    224: "FC_2",
    225: "FC_2_WITH_FRAME_DELIMS",
    226: "IPNET",
    227: "CAN_SOCKETCAN",
    228: "IPV4",
    229: "IPV6",
    230: "IEEE802_15_4_NOFCS",
    231: "DBUS",
    235: "DVB_CI",
    236: "MUX27010",
    237: "STANAG_5066_D_PDU",
    239: "NFLOG",
    240: "NETANALYZER",
    241: "NETANALYZER_TRANSPARENT",
    242: "IPOIB",
    243: "MPEG_2_TS",
    244: "NG40",
    245: "NFC_LLCP",
    247: "INFINIBAND",
    248: "SCTP",
    249: "USBPCAP",
    250: "RTAC_SERIAL",
    251: "BLUETOOTH_LE_LL",
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
      this.magicNumber = this._io.ensureFixedContents([212, 195, 178, 161]);
      this.versionMajor = this._io.readU2le();
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
