// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './TcpSegment', './UdpDatagram', './Ipv4Packet', './IcmpPacket', './Ipv6Packet'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./TcpSegment'), require('./UdpDatagram'), require('./Ipv4Packet'), require('./IcmpPacket'), require('./Ipv6Packet'));
  } else {
    root.ProtocolBody = factory(root.KaitaiStream, root.TcpSegment, root.UdpDatagram, root.Ipv4Packet, root.IcmpPacket, root.Ipv6Packet);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream, TcpSegment, UdpDatagram, Ipv4Packet, IcmpPacket, Ipv6Packet) {
/**
 * Protocol body represents particular payload on transport level (OSI
 * layer 4).
 * 
 * Typically this payload in encapsulated into network level (OSI layer
 * 3) packet, which includes "protocol number" field that would be used
 * to decide what's inside the payload and how to parse it. Thanks to
 * IANA's standardization effort, multiple network level use the same
 * IDs for these payloads named "protocol numbers".
 * 
 * This is effectively a "router" type: it expects to get protocol
 * number as a parameter, and then invokes relevant type parser based
 * on that parameter.
 * @see {@link https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml|Source}
 */

var ProtocolBody = (function() {
  ProtocolBody.ProtocolEnum = Object.freeze({
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
    TTP_OR_IPTM: 84,
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
    84: "TTP_OR_IPTM",
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

  function ProtocolBody(_io, _parent, _root, protocolNum) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;
    this.protocolNum = protocolNum;

    this._read();
  }
  ProtocolBody.prototype._read = function() {
    switch (this.protocol) {
    case ProtocolBody.ProtocolEnum.IPV6_NONXT:
      this.body = new NoNextHeader(this._io, this, this._root);
      break;
    case ProtocolBody.ProtocolEnum.IPV4:
      this.body = new Ipv4Packet(this._io, this, null);
      break;
    case ProtocolBody.ProtocolEnum.UDP:
      this.body = new UdpDatagram(this._io, this, null);
      break;
    case ProtocolBody.ProtocolEnum.ICMP:
      this.body = new IcmpPacket(this._io, this, null);
      break;
    case ProtocolBody.ProtocolEnum.HOPOPT:
      this.body = new OptionHopByHop(this._io, this, this._root);
      break;
    case ProtocolBody.ProtocolEnum.IPV6:
      this.body = new Ipv6Packet(this._io, this, null);
      break;
    case ProtocolBody.ProtocolEnum.TCP:
      this.body = new TcpSegment(this._io, this, null);
      break;
    }
  }

  /**
   * Dummy type for IPv6 "no next header" type, which signifies end of headers chain.
   */

  var NoNextHeader = ProtocolBody.NoNextHeader = (function() {
    function NoNextHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    NoNextHeader.prototype._read = function() {
    }

    return NoNextHeader;
  })();

  var OptionHopByHop = ProtocolBody.OptionHopByHop = (function() {
    function OptionHopByHop(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    OptionHopByHop.prototype._read = function() {
      this.nextHeaderType = this._io.readU1();
      this.hdrExtLen = this._io.readU1();
      this.body = this._io.readBytes((this.hdrExtLen - 1));
      this.nextHeader = new ProtocolBody(this._io, this, null, this.nextHeaderType);
    }

    return OptionHopByHop;
  })();
  Object.defineProperty(ProtocolBody.prototype, 'protocol', {
    get: function() {
      if (this._m_protocol !== undefined)
        return this._m_protocol;
      this._m_protocol = this.protocolNum;
      return this._m_protocol;
    }
  });

  /**
   * Protocol number as an integer.
   */

  return ProtocolBody;
})();
return ProtocolBody;
}));
