// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './EthernetFrame'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./EthernetFrame'));
  } else {
    root.PacketPpi = factory(root.KaitaiStream, root.EthernetFrame);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream, EthernetFrame) {
/**
 * PPI is a standard for link layer packet encapsulation, proposed as
 * generic extensible container to store both captured in-band data and
 * out-of-band data. Originally it was developed to provide 802.11n
 * radio information, but can be used for other purposes as well.
 * 
 * Sample capture:
 * <https://wiki.wireshark.org/uploads/27707187aeb30df68e70c8fb9d614981/http.cap>
 * @see {@link https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf|PPI header format spec, section 3}
 */

var PacketPpi = (function() {
  PacketPpi.PfhType = Object.freeze({
    RADIO_802_11_COMMON: 2,
    RADIO_802_11N_MAC_EXT: 3,
    RADIO_802_11N_MAC_PHY_EXT: 4,
    SPECTRUM_MAP: 5,
    PROCESS_INFO: 6,
    CAPTURE_INFO: 7,

    2: "RADIO_802_11_COMMON",
    3: "RADIO_802_11N_MAC_EXT",
    4: "RADIO_802_11N_MAC_PHY_EXT",
    5: "SPECTRUM_MAP",
    6: "PROCESS_INFO",
    7: "CAPTURE_INFO",
  });

  PacketPpi.Linktype = Object.freeze({
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

  function PacketPpi(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  PacketPpi.prototype._read = function() {
    this.header = new PacketPpiHeader(this._io, this, this._root);
    this._raw_fields = this._io.readBytes((this.header.pphLen - 8));
    var _io__raw_fields = new KaitaiStream(this._raw_fields);
    this.fields = new PacketPpiFields(_io__raw_fields, this, this._root);
    switch (this.header.pphDlt) {
    case PacketPpi.Linktype.PPI:
      this._raw_body = this._io.readBytesFull();
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new PacketPpi(_io__raw_body, this, null);
      break;
    case PacketPpi.Linktype.ETHERNET:
      this._raw_body = this._io.readBytesFull();
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new EthernetFrame(_io__raw_body, this, null);
      break;
    default:
      this.body = this._io.readBytesFull();
      break;
    }
  }

  var PacketPpiFields = PacketPpi.PacketPpiFields = (function() {
    function PacketPpiFields(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PacketPpiFields.prototype._read = function() {
      this.entries = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.entries.push(new PacketPpiField(this._io, this, this._root));
        i++;
      }
    }

    return PacketPpiFields;
  })();

  /**
   * @see {@link https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf|PPI header format spec, section 4.1.3}
   */

  var Radio80211nMacExtBody = PacketPpi.Radio80211nMacExtBody = (function() {
    function Radio80211nMacExtBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Radio80211nMacExtBody.prototype._read = function() {
      this.flags = new MacFlags(this._io, this, this._root);
      this.aMpduId = this._io.readU4le();
      this.numDelimiters = this._io.readU1();
      this.reserved = this._io.readBytes(3);
    }

    return Radio80211nMacExtBody;
  })();

  var MacFlags = PacketPpi.MacFlags = (function() {
    function MacFlags(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MacFlags.prototype._read = function() {
      this.unused1 = this._io.readBitsIntBe(1) != 0;
      this.aggregateDelimiter = this._io.readBitsIntBe(1) != 0;
      this.moreAggregates = this._io.readBitsIntBe(1) != 0;
      this.aggregate = this._io.readBitsIntBe(1) != 0;
      this.dupRx = this._io.readBitsIntBe(1) != 0;
      this.rxShortGuard = this._io.readBitsIntBe(1) != 0;
      this.isHt40 = this._io.readBitsIntBe(1) != 0;
      this.greenfield = this._io.readBitsIntBe(1) != 0;
      this._io.alignToByte();
      this.unused2 = this._io.readBytes(3);
    }

    /**
     * Aggregate delimiter CRC error after this frame
     */

    /**
     * More aggregates
     */

    /**
     * Aggregate
     */

    /**
     * Duplicate RX
     */

    /**
     * RX short guard interval (SGI)
     */

    /**
     * true = HT40, false = HT20
     */

    /**
     * Greenfield
     */

    return MacFlags;
  })();

  /**
   * @see {@link https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf|PPI header format spec, section 3.1}
   */

  var PacketPpiHeader = PacketPpi.PacketPpiHeader = (function() {
    function PacketPpiHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PacketPpiHeader.prototype._read = function() {
      this.pphVersion = this._io.readU1();
      this.pphFlags = this._io.readU1();
      this.pphLen = this._io.readU2le();
      this.pphDlt = this._io.readU4le();
    }

    return PacketPpiHeader;
  })();

  /**
   * @see {@link https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf|PPI header format spec, section 4.1.2}
   */

  var Radio80211CommonBody = PacketPpi.Radio80211CommonBody = (function() {
    function Radio80211CommonBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Radio80211CommonBody.prototype._read = function() {
      this.tsfTimer = this._io.readU8le();
      this.flags = this._io.readU2le();
      this.rate = this._io.readU2le();
      this.channelFreq = this._io.readU2le();
      this.channelFlags = this._io.readU2le();
      this.fhssHopset = this._io.readU1();
      this.fhssPattern = this._io.readU1();
      this.dbmAntsignal = this._io.readS1();
      this.dbmAntnoise = this._io.readS1();
    }

    return Radio80211CommonBody;
  })();

  /**
   * @see {@link https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf|PPI header format spec, section 3.1}
   */

  var PacketPpiField = PacketPpi.PacketPpiField = (function() {
    function PacketPpiField(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PacketPpiField.prototype._read = function() {
      this.pfhType = this._io.readU2le();
      this.pfhDatalen = this._io.readU2le();
      switch (this.pfhType) {
      case PacketPpi.PfhType.RADIO_802_11_COMMON:
        this._raw_body = this._io.readBytes(this.pfhDatalen);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new Radio80211CommonBody(_io__raw_body, this, this._root);
        break;
      case PacketPpi.PfhType.RADIO_802_11N_MAC_EXT:
        this._raw_body = this._io.readBytes(this.pfhDatalen);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new Radio80211nMacExtBody(_io__raw_body, this, this._root);
        break;
      case PacketPpi.PfhType.RADIO_802_11N_MAC_PHY_EXT:
        this._raw_body = this._io.readBytes(this.pfhDatalen);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new Radio80211nMacPhyExtBody(_io__raw_body, this, this._root);
        break;
      default:
        this.body = this._io.readBytes(this.pfhDatalen);
        break;
      }
    }

    return PacketPpiField;
  })();

  /**
   * @see {@link https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf|PPI header format spec, section 4.1.4}
   */

  var Radio80211nMacPhyExtBody = PacketPpi.Radio80211nMacPhyExtBody = (function() {
    function Radio80211nMacPhyExtBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Radio80211nMacPhyExtBody.prototype._read = function() {
      this.flags = new MacFlags(this._io, this, this._root);
      this.aMpduId = this._io.readU4le();
      this.numDelimiters = this._io.readU1();
      this.mcs = this._io.readU1();
      this.numStreams = this._io.readU1();
      this.rssiCombined = this._io.readU1();
      this.rssiAntCtl = [];
      for (var i = 0; i < 4; i++) {
        this.rssiAntCtl.push(this._io.readU1());
      }
      this.rssiAntExt = [];
      for (var i = 0; i < 4; i++) {
        this.rssiAntExt.push(this._io.readU1());
      }
      this.extChannelFreq = this._io.readU2le();
      this.extChannelFlags = new ChannelFlags(this._io, this, this._root);
      this.rfSignalNoise = [];
      for (var i = 0; i < 4; i++) {
        this.rfSignalNoise.push(new SignalNoise(this._io, this, this._root));
      }
      this.evm = [];
      for (var i = 0; i < 4; i++) {
        this.evm.push(this._io.readU4le());
      }
    }

    var ChannelFlags = Radio80211nMacPhyExtBody.ChannelFlags = (function() {
      function ChannelFlags(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      ChannelFlags.prototype._read = function() {
        this.spectrum2ghz = this._io.readBitsIntBe(1) != 0;
        this.ofdm = this._io.readBitsIntBe(1) != 0;
        this.cck = this._io.readBitsIntBe(1) != 0;
        this.turbo = this._io.readBitsIntBe(1) != 0;
        this.unused = this._io.readBitsIntBe(8);
        this.gfsk = this._io.readBitsIntBe(1) != 0;
        this.dynCckOfdm = this._io.readBitsIntBe(1) != 0;
        this.onlyPassiveScan = this._io.readBitsIntBe(1) != 0;
        this.spectrum5ghz = this._io.readBitsIntBe(1) != 0;
      }

      /**
       * 2 GHz spectrum
       */

      /**
       * OFDM (Orthogonal Frequency-Division Multiplexing)
       */

      /**
       * CCK (Complementary Code Keying)
       */

      /**
       * Gaussian Frequency Shift Keying
       */

      /**
       * Dynamic CCK-OFDM
       */

      /**
       * Only passive scan allowed
       */

      /**
       * 5 GHz spectrum
       */

      return ChannelFlags;
    })();

    /**
     * RF signal + noise pair at a single antenna
     */

    var SignalNoise = Radio80211nMacPhyExtBody.SignalNoise = (function() {
      function SignalNoise(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SignalNoise.prototype._read = function() {
        this.signal = this._io.readS1();
        this.noise = this._io.readS1();
      }

      /**
       * RF signal, dBm
       */

      /**
       * RF noise, dBm
       */

      return SignalNoise;
    })();

    /**
     * Modulation Coding Scheme (MCS)
     */

    /**
     * Number of spatial streams (0 = unknown)
     */

    /**
     * RSSI (Received Signal Strength Indication), combined from all active antennas / channels
     */

    /**
     * RSSI (Received Signal Strength Indication) for antennas 0-3, control channel
     */

    /**
     * RSSI (Received Signal Strength Indication) for antennas 0-3, extension channel
     */

    /**
     * Extension channel frequency (MHz)
     */

    /**
     * Extension channel flags
     */

    /**
     * Signal + noise values for antennas 0-3
     */

    /**
     * EVM (Error Vector Magnitude) for chains 0-3
     */

    return Radio80211nMacPhyExtBody;
  })();

  return PacketPpi;
})();
return PacketPpi;
}));
