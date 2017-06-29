// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

if (typeof require === 'function')
  var TcpSegment = require('./TcpSegment.js');

if (typeof require === 'function')
  var UdpDatagram = require('./UdpDatagram.js');

if (typeof require === 'function')
  var IcmpPacket = require('./IcmpPacket.js');

if (typeof require === 'function')
  var Ipv6Packet = require('./Ipv6Packet.js');

var Ipv4Packet = (function() {
  Ipv4Packet.ProtocolEnum = Object.freeze({
    HOPOPT: 0,
    ICMP: 1,
    IGMP: 2,
    GGP: 3,
    IPV4: 4,
    ST: 5,
    TCP: 6,
    CBT: 7,
    EGP: 8,
    IGP: 9,
    BBN_RCC_MON: 10,
    NVP_II: 11,
    PUP: 12,
    ARGUS: 13,
    EMCON: 14,
    XNET: 15,
    CHAOS: 16,
    UDP: 17,
    MUX: 18,
    DCN_MEAS: 19,
    HMP: 20,
    PRM: 21,
    XNS_IDP: 22,
    TRUNK_1: 23,
    TRUNK_2: 24,
    LEAF_1: 25,
    LEAF_2: 26,
    RDP: 27,
    IRTP: 28,
    ISO_TP4: 29,
    NETBLT: 30,
    MFE_NSP: 31,
    MERIT_INP: 32,
    DCCP: 33,
    X_3PC: 34,
    IDPR: 35,
    XTP: 36,
    DDP: 37,
    IDPR_CMTP: 38,
    TP_PLUS_PLUS: 39,
    IL: 40,
    IPV6: 41,
    SDRP: 42,
    IPV6_ROUTE: 43,
    IPV6_FRAG: 44,
    IDRP: 45,
    RSVP: 46,
    GRE: 47,
    DSR: 48,
    BNA: 49,
    ESP: 50,
    AH: 51,
    I_NLSP: 52,
    SWIPE: 53,
    NARP: 54,
    MOBILE: 55,
    TLSP: 56,
    SKIP: 57,
    IPV6_ICMP: 58,
    IPV6_NONXT: 59,
    IPV6_OPTS: 60,
    ANY_HOST_INTERNAL_PROTOCOL: 61,
    CFTP: 62,
    ANY_LOCAL_NETWORK: 63,
    SAT_EXPAK: 64,
    KRYPTOLAN: 65,
    RVD: 66,
    IPPC: 67,
    ANY_DISTRIBUTED_FILE_SYSTEM: 68,
    SAT_MON: 69,
    VISA: 70,
    IPCV: 71,
    CPNX: 72,
    CPHB: 73,
    WSN: 74,
    PVP: 75,
    BR_SAT_MON: 76,
    SUN_ND: 77,
    WB_MON: 78,
    WB_EXPAK: 79,
    ISO_IP: 80,
    VMTP: 81,
    SECURE_VMTP: 82,
    VINES: 83,
    IPTM: 84,
    NSFNET_IGP: 85,
    DGP: 86,
    TCF: 87,
    EIGRP: 88,
    OSPFIGP: 89,
    SPRITE_RPC: 90,
    LARP: 91,
    MTP: 92,
    AX_25: 93,
    IPIP: 94,
    MICP: 95,
    SCC_SP: 96,
    ETHERIP: 97,
    ENCAP: 98,
    ANY_PRIVATE_ENCRYPTION_SCHEME: 99,
    GMTP: 100,
    IFMP: 101,
    PNNI: 102,
    PIM: 103,
    ARIS: 104,
    SCPS: 105,
    QNX: 106,
    A_N: 107,
    IPCOMP: 108,
    SNP: 109,
    COMPAQ_PEER: 110,
    IPX_IN_IP: 111,
    VRRP: 112,
    PGM: 113,
    ANY_0_HOP: 114,
    L2TP: 115,
    DDX: 116,
    IATP: 117,
    STP: 118,
    SRP: 119,
    UTI: 120,
    SMP: 121,
    SM: 122,
    PTP: 123,
    ISIS_OVER_IPV4: 124,
    FIRE: 125,
    CRTP: 126,
    CRUDP: 127,
    SSCOPMCE: 128,
    IPLT: 129,
    SPS: 130,
    PIPE: 131,
    SCTP: 132,
    FC: 133,
    RSVP_E2E_IGNORE: 134,
    MOBILITY_HEADER: 135,
    UDPLITE: 136,
    MPLS_IN_IP: 137,
    MANET: 138,
    HIP: 139,
    SHIM6: 140,
    WESP: 141,
    ROHC: 142,
    RESERVED_255: 255,

    0: "HOPOPT",
    1: "ICMP",
    2: "IGMP",
    3: "GGP",
    4: "IPV4",
    5: "ST",
    6: "TCP",
    7: "CBT",
    8: "EGP",
    9: "IGP",
    10: "BBN_RCC_MON",
    11: "NVP_II",
    12: "PUP",
    13: "ARGUS",
    14: "EMCON",
    15: "XNET",
    16: "CHAOS",
    17: "UDP",
    18: "MUX",
    19: "DCN_MEAS",
    20: "HMP",
    21: "PRM",
    22: "XNS_IDP",
    23: "TRUNK_1",
    24: "TRUNK_2",
    25: "LEAF_1",
    26: "LEAF_2",
    27: "RDP",
    28: "IRTP",
    29: "ISO_TP4",
    30: "NETBLT",
    31: "MFE_NSP",
    32: "MERIT_INP",
    33: "DCCP",
    34: "X_3PC",
    35: "IDPR",
    36: "XTP",
    37: "DDP",
    38: "IDPR_CMTP",
    39: "TP_PLUS_PLUS",
    40: "IL",
    41: "IPV6",
    42: "SDRP",
    43: "IPV6_ROUTE",
    44: "IPV6_FRAG",
    45: "IDRP",
    46: "RSVP",
    47: "GRE",
    48: "DSR",
    49: "BNA",
    50: "ESP",
    51: "AH",
    52: "I_NLSP",
    53: "SWIPE",
    54: "NARP",
    55: "MOBILE",
    56: "TLSP",
    57: "SKIP",
    58: "IPV6_ICMP",
    59: "IPV6_NONXT",
    60: "IPV6_OPTS",
    61: "ANY_HOST_INTERNAL_PROTOCOL",
    62: "CFTP",
    63: "ANY_LOCAL_NETWORK",
    64: "SAT_EXPAK",
    65: "KRYPTOLAN",
    66: "RVD",
    67: "IPPC",
    68: "ANY_DISTRIBUTED_FILE_SYSTEM",
    69: "SAT_MON",
    70: "VISA",
    71: "IPCV",
    72: "CPNX",
    73: "CPHB",
    74: "WSN",
    75: "PVP",
    76: "BR_SAT_MON",
    77: "SUN_ND",
    78: "WB_MON",
    79: "WB_EXPAK",
    80: "ISO_IP",
    81: "VMTP",
    82: "SECURE_VMTP",
    83: "VINES",
    84: "IPTM",
    85: "NSFNET_IGP",
    86: "DGP",
    87: "TCF",
    88: "EIGRP",
    89: "OSPFIGP",
    90: "SPRITE_RPC",
    91: "LARP",
    92: "MTP",
    93: "AX_25",
    94: "IPIP",
    95: "MICP",
    96: "SCC_SP",
    97: "ETHERIP",
    98: "ENCAP",
    99: "ANY_PRIVATE_ENCRYPTION_SCHEME",
    100: "GMTP",
    101: "IFMP",
    102: "PNNI",
    103: "PIM",
    104: "ARIS",
    105: "SCPS",
    106: "QNX",
    107: "A_N",
    108: "IPCOMP",
    109: "SNP",
    110: "COMPAQ_PEER",
    111: "IPX_IN_IP",
    112: "VRRP",
    113: "PGM",
    114: "ANY_0_HOP",
    115: "L2TP",
    116: "DDX",
    117: "IATP",
    118: "STP",
    119: "SRP",
    120: "UTI",
    121: "SMP",
    122: "SM",
    123: "PTP",
    124: "ISIS_OVER_IPV4",
    125: "FIRE",
    126: "CRTP",
    127: "CRUDP",
    128: "SSCOPMCE",
    129: "IPLT",
    130: "SPS",
    131: "PIPE",
    132: "SCTP",
    133: "FC",
    134: "RSVP_E2E_IGNORE",
    135: "MOBILITY_HEADER",
    136: "UDPLITE",
    137: "MPLS_IN_IP",
    138: "MANET",
    139: "HIP",
    140: "SHIM6",
    141: "WESP",
    142: "ROHC",
    255: "RESERVED_255",
  });

  function Ipv4Packet(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Ipv4Packet.prototype._read = function() {
    this.b1 = this._io.readU1();
    this.b2 = this._io.readU1();
    this.totalLength = this._io.readU2be();
    this.identification = this._io.readU2be();
    this.b67 = this._io.readU2be();
    this.ttl = this._io.readU1();
    this.protocol = this._io.readU1();
    this.headerChecksum = this._io.readU2be();
    this.srcIpAddr = this._io.readBytes(4);
    this.dstIpAddr = this._io.readBytes(4);
    this._raw_options = this._io.readBytes((this.ihlBytes - 20));
    var _io__raw_options = new KaitaiStream(this._raw_options);
    this.options = new Ipv4Options(_io__raw_options, this, this._root);
    switch (this.protocol) {
    case Ipv4Packet.ProtocolEnum.TCP:
      this._raw_body = this._io.readBytes((this.totalLength - this.ihlBytes));
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new TcpSegment(_io__raw_body);
      break;
    case Ipv4Packet.ProtocolEnum.ICMP:
      this._raw_body = this._io.readBytes((this.totalLength - this.ihlBytes));
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new IcmpPacket(_io__raw_body);
      break;
    case Ipv4Packet.ProtocolEnum.UDP:
      this._raw_body = this._io.readBytes((this.totalLength - this.ihlBytes));
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new UdpDatagram(_io__raw_body);
      break;
    case Ipv4Packet.ProtocolEnum.IPV6:
      this._raw_body = this._io.readBytes((this.totalLength - this.ihlBytes));
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new Ipv6Packet(_io__raw_body);
      break;
    default:
      this.body = this._io.readBytes((this.totalLength - this.ihlBytes));
      break;
    }
  }

  var Ipv4Options = Ipv4Packet.Ipv4Options = (function() {
    function Ipv4Options(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Ipv4Options.prototype._read = function() {
      this.entries = [];
      while (!this._io.isEof()) {
        this.entries.push(new Ipv4Option(this._io, this, this._root));
      }
    }

    return Ipv4Options;
  })();

  var Ipv4Option = Ipv4Packet.Ipv4Option = (function() {
    function Ipv4Option(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Ipv4Option.prototype._read = function() {
      this.b1 = this._io.readU1();
      this.len = this._io.readU1();
      this.body = this._io.readBytes((this.len > 2 ? (this.len - 2) : 0));
    }
    Object.defineProperty(Ipv4Option.prototype, 'copy', {
      get: function() {
        if (this._m_copy !== undefined)
          return this._m_copy;
        this._m_copy = ((this.b1 & 128) >> 7);
        return this._m_copy;
      }
    });
    Object.defineProperty(Ipv4Option.prototype, 'optClass', {
      get: function() {
        if (this._m_optClass !== undefined)
          return this._m_optClass;
        this._m_optClass = ((this.b1 & 96) >> 5);
        return this._m_optClass;
      }
    });
    Object.defineProperty(Ipv4Option.prototype, 'number', {
      get: function() {
        if (this._m_number !== undefined)
          return this._m_number;
        this._m_number = (this.b1 & 31);
        return this._m_number;
      }
    });

    return Ipv4Option;
  })();
  Object.defineProperty(Ipv4Packet.prototype, 'version', {
    get: function() {
      if (this._m_version !== undefined)
        return this._m_version;
      this._m_version = ((this.b1 & 240) >> 4);
      return this._m_version;
    }
  });
  Object.defineProperty(Ipv4Packet.prototype, 'ihl', {
    get: function() {
      if (this._m_ihl !== undefined)
        return this._m_ihl;
      this._m_ihl = (this.b1 & 15);
      return this._m_ihl;
    }
  });
  Object.defineProperty(Ipv4Packet.prototype, 'ihlBytes', {
    get: function() {
      if (this._m_ihlBytes !== undefined)
        return this._m_ihlBytes;
      this._m_ihlBytes = (this.ihl * 4);
      return this._m_ihlBytes;
    }
  });

  return Ipv4Packet;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Ipv4Packet', [], function() {
    return Ipv4Packet;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Ipv4Packet;
}
