// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.QuicktimeMov = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * @see {@link https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-BBCGDDDF|Source}
 */

var QuicktimeMov = (function() {
  QuicktimeMov.AtomType = Object.freeze({
    XTRA: 1484026465,
    DINF: 1684631142,
    DREF: 1685218662,
    EDTS: 1701082227,
    ELST: 1701606260,
    FREE: 1718773093,
    FTYP: 1718909296,
    HDLR: 1751411826,
    IODS: 1768907891,
    MDAT: 1835295092,
    MDHD: 1835296868,
    MDIA: 1835297121,
    META: 1835365473,
    MINF: 1835626086,
    MOOF: 1836019558,
    MOOV: 1836019574,
    MVHD: 1836476516,
    SMHD: 1936549988,
    STBL: 1937007212,
    STCO: 1937007471,
    STSC: 1937011555,
    STSD: 1937011556,
    STSZ: 1937011578,
    STTS: 1937011827,
    TKHD: 1953196132,
    TRAF: 1953653094,
    TRAK: 1953653099,
    TREF: 1953654118,
    UDTA: 1969517665,
    VMHD: 1986881636,

    1484026465: "XTRA",
    1684631142: "DINF",
    1685218662: "DREF",
    1701082227: "EDTS",
    1701606260: "ELST",
    1718773093: "FREE",
    1718909296: "FTYP",
    1751411826: "HDLR",
    1768907891: "IODS",
    1835295092: "MDAT",
    1835296868: "MDHD",
    1835297121: "MDIA",
    1835365473: "META",
    1835626086: "MINF",
    1836019558: "MOOF",
    1836019574: "MOOV",
    1836476516: "MVHD",
    1936549988: "SMHD",
    1937007212: "STBL",
    1937007471: "STCO",
    1937011555: "STSC",
    1937011556: "STSD",
    1937011578: "STSZ",
    1937011827: "STTS",
    1953196132: "TKHD",
    1953653094: "TRAF",
    1953653099: "TRAK",
    1953654118: "TREF",
    1969517665: "UDTA",
    1986881636: "VMHD",
  });

  QuicktimeMov.Brand = Object.freeze({
    X_3G2A: 862401121,
    X_3GE6: 862414134,
    X_3GE7: 862414135,
    X_3GE9: 862414137,
    X_3GF9: 862414393,
    X_3GG6: 862414646,
    X_3GG9: 862414649,
    X_3GH9: 862414905,
    X_3GM9: 862416185,
    X_3GMA: 862416193,
    X_3GP4: 862416948,
    X_3GP5: 862416949,
    X_3GP6: 862416950,
    X_3GP7: 862416951,
    X_3GP8: 862416952,
    X_3GP9: 862416953,
    X_3GR6: 862417462,
    X_3GR9: 862417465,
    X_3GS6: 862417718,
    X_3GS9: 862417721,
    X_3GT8: 862417976,
    X_3GT9: 862417977,
    X_3GTV: 862418038,
    X_3GVR: 862418546,
    X_3VRA: 863400545,
    X_3VRB: 863400546,
    X_3VRM: 863400557,
    ARRI: 1095914057,
    CAEP: 1128351056,
    CDES: 1128555891,
    J2P0: 1244811312,
    J2P1: 1244811313,
    LCAG: 1279476039,
    M4A: 1295270176,
    M4B: 1295270432,
    M4P: 1295274016,
    M4V: 1295275552,
    MA1A: 1296118081,
    MA1B: 1296118082,
    MFSM: 1296454477,
    MGSV: 1296520022,
    MPPI: 1297109065,
    MSNV: 1297305174,
    MIAB: 1298743618,
    MIAC: 1298743619,
    MIAN: 1298743662,
    MIBU: 1298743925,
    MICM: 1298744173,
    MIHA: 1298745409,
    MIHB: 1298745410,
    MIHE: 1298745413,
    MIPR: 1298747506,
    ROSS: 1380930387,
    SEAU: 1397047637,
    SEBK: 1397047883,
    XAVC: 1480676931,
    ADTI: 1633973353,
    AID3: 1634296883,
    AV01: 1635135537,
    AVC1: 1635148593,
    AVCI: 1635148649,
    AVCS: 1635148659,
    AVDE: 1635148901,
    AVIF: 1635150182,
    AVIO: 1635150191,
    AVIS: 1635150195,
    BBXM: 1650620525,
    CA4M: 1667314797,
    CA4S: 1667314803,
    CAAA: 1667326305,
    CAAC: 1667326307,
    CABL: 1667326572,
    CAMA: 1667329377,
    CAMC: 1667329379,
    CAQV: 1667330422,
    CASU: 1667330933,
    CCEA: 1667458401,
    CCFF: 1667458662,
    CDM1: 1667525937,
    CDM4: 1667525940,
    CEAC: 1667588451,
    CFHD: 1667655780,
    CFSD: 1667658596,
    CHD1: 1667785777,
    CHD2: 1667785778,
    CHDF: 1667785830,
    CHEV: 1667786102,
    CHH1: 1667786801,
    CHHD: 1667786852,
    CINT: 1667853940,
    CLG1: 1668048689,
    CLG2: 1668048690,
    CMF2: 1668113970,
    CMFC: 1668114019,
    CMFF: 1668114022,
    CMFL: 1668114028,
    CMFS: 1668114035,
    CMHM: 1668114541,
    CMHS: 1668114547,
    COMP: 1668246896,
    CSH1: 1668507697,
    CUD1: 1668637745,
    CUD2: 1668637746,
    CUD8: 1668637752,
    CUD9: 1668637753,
    CUVD: 1668642404,
    CVID: 1668704612,
    CWVT: 1668773492,
    DA0A: 1684090977,
    DA0B: 1684090978,
    DA1A: 1684091233,
    DA1B: 1684091234,
    DA2A: 1684091489,
    DA2B: 1684091490,
    DA3A: 1684091745,
    DA3B: 1684091746,
    DASH: 1684108136,
    DBY1: 1684175153,
    DMB1: 1684890161,
    DSMS: 1685286259,
    DTS1: 1685353265,
    DTS2: 1685353266,
    DTS3: 1685353267,
    DV1A: 1685467489,
    DV1B: 1685467490,
    DV2A: 1685467745,
    DV2B: 1685467746,
    DV3A: 1685468001,
    DV3B: 1685468002,
    DVR1: 1685484081,
    DVT1: 1685484593,
    DXO: 1685614368,
    EMSG: 1701671783,
    HEIC: 1751476579,
    HEIM: 1751476589,
    HEIS: 1751476595,
    HEIX: 1751476600,
    HEOI: 1751478121,
    HEVC: 1751479907,
    HEVD: 1751479908,
    HEVI: 1751479913,
    HEVM: 1751479917,
    HEVS: 1751479923,
    HEVX: 1751479928,
    HVCE: 1752589157,
    HVCI: 1752589161,
    HVCX: 1752589176,
    HVTI: 1752593513,
    IFAA: 1768317281,
    IFHD: 1768319076,
    IFHH: 1768319080,
    IFHR: 1768319090,
    IFHS: 1768319091,
    IFHU: 1768319093,
    IFHX: 1768319096,
    IFRM: 1768321645,
    IFSD: 1768321892,
    IM1I: 1768763753,
    IM1T: 1768763764,
    IM2I: 1768764009,
    IM2T: 1768764020,
    ISC2: 1769169714,
    ISO2: 1769172786,
    ISO3: 1769172787,
    ISO4: 1769172788,
    ISO5: 1769172789,
    ISO6: 1769172790,
    ISO7: 1769172791,
    ISO8: 1769172792,
    ISO9: 1769172793,
    ISOA: 1769172833,
    ISOB: 1769172834,
    ISOC: 1769172835,
    ISOM: 1769172845,
    J2IS: 1781688691,
    J2KI: 1781689193,
    J2KS: 1781689203,
    JP2: 1785737760,
    JPEG: 1785750887,
    JPGS: 1785751411,
    JPM: 1785752864,
    JPOI: 1785753449,
    JPSI: 1785754473,
    JPX: 1785755680,
    JPXB: 1785755746,
    JXL: 1786276896,
    JXS: 1786278688,
    JXSC: 1786278755,
    JXSI: 1786278761,
    JXSS: 1786278771,
    LHTE: 1818784869,
    LHTI: 1818784873,
    LMSG: 1819112295,
    MIAF: 1835622758,
    MIF1: 1835623985,
    MIF2: 1835623986,
    MJ2S: 1835676275,
    MJP2: 1835692082,
    MP21: 1836069425,
    MP41: 1836069937,
    MP42: 1836069938,
    MP71: 1836070705,
    MPUF: 1836086630,
    MSDH: 1836278888,
    MSF1: 1836279345,
    MSIX: 1836280184,
    NIKO: 1852402543,
    NLSL: 1852601196,
    NRAS: 1852989811,
    OA2D: 1868640868,
    OABL: 1868653164,
    ODCF: 1868850022,
    OMPP: 1869443184,
    OPF2: 1869637170,
    OPX2: 1869641778,
    OVDP: 1870029936,
    OVLY: 1870031993,
    PAFF: 1885431398,
    PANA: 1885433441,
    PIFF: 1885955686,
    PMFF: 1886217830,
    PNVI: 1886287465,
    PRED: 1886545252,
    QT: 1903435808,
    RELO: 1919249519,
    RISX: 1919513464,
    SDV: 1935963680,
    SENV: 1936027254,
    SIMS: 1936289139,
    SISX: 1936290680,
    SITI: 1936290921,
    SLH1: 1936484401,
    SLH2: 1936484402,
    SLH3: 1936484403,
    SSSS: 1936946035,
    TTML: 1953787244,
    TTWV: 1953789814,
    UHVI: 1969780329,
    UNIF: 1970170214,
    UVVU: 1970697845,
    VWPT: 1987539060,
    YT4: 2037658656,

    862401121: "X_3G2A",
    862414134: "X_3GE6",
    862414135: "X_3GE7",
    862414137: "X_3GE9",
    862414393: "X_3GF9",
    862414646: "X_3GG6",
    862414649: "X_3GG9",
    862414905: "X_3GH9",
    862416185: "X_3GM9",
    862416193: "X_3GMA",
    862416948: "X_3GP4",
    862416949: "X_3GP5",
    862416950: "X_3GP6",
    862416951: "X_3GP7",
    862416952: "X_3GP8",
    862416953: "X_3GP9",
    862417462: "X_3GR6",
    862417465: "X_3GR9",
    862417718: "X_3GS6",
    862417721: "X_3GS9",
    862417976: "X_3GT8",
    862417977: "X_3GT9",
    862418038: "X_3GTV",
    862418546: "X_3GVR",
    863400545: "X_3VRA",
    863400546: "X_3VRB",
    863400557: "X_3VRM",
    1095914057: "ARRI",
    1128351056: "CAEP",
    1128555891: "CDES",
    1244811312: "J2P0",
    1244811313: "J2P1",
    1279476039: "LCAG",
    1295270176: "M4A",
    1295270432: "M4B",
    1295274016: "M4P",
    1295275552: "M4V",
    1296118081: "MA1A",
    1296118082: "MA1B",
    1296454477: "MFSM",
    1296520022: "MGSV",
    1297109065: "MPPI",
    1297305174: "MSNV",
    1298743618: "MIAB",
    1298743619: "MIAC",
    1298743662: "MIAN",
    1298743925: "MIBU",
    1298744173: "MICM",
    1298745409: "MIHA",
    1298745410: "MIHB",
    1298745413: "MIHE",
    1298747506: "MIPR",
    1380930387: "ROSS",
    1397047637: "SEAU",
    1397047883: "SEBK",
    1480676931: "XAVC",
    1633973353: "ADTI",
    1634296883: "AID3",
    1635135537: "AV01",
    1635148593: "AVC1",
    1635148649: "AVCI",
    1635148659: "AVCS",
    1635148901: "AVDE",
    1635150182: "AVIF",
    1635150191: "AVIO",
    1635150195: "AVIS",
    1650620525: "BBXM",
    1667314797: "CA4M",
    1667314803: "CA4S",
    1667326305: "CAAA",
    1667326307: "CAAC",
    1667326572: "CABL",
    1667329377: "CAMA",
    1667329379: "CAMC",
    1667330422: "CAQV",
    1667330933: "CASU",
    1667458401: "CCEA",
    1667458662: "CCFF",
    1667525937: "CDM1",
    1667525940: "CDM4",
    1667588451: "CEAC",
    1667655780: "CFHD",
    1667658596: "CFSD",
    1667785777: "CHD1",
    1667785778: "CHD2",
    1667785830: "CHDF",
    1667786102: "CHEV",
    1667786801: "CHH1",
    1667786852: "CHHD",
    1667853940: "CINT",
    1668048689: "CLG1",
    1668048690: "CLG2",
    1668113970: "CMF2",
    1668114019: "CMFC",
    1668114022: "CMFF",
    1668114028: "CMFL",
    1668114035: "CMFS",
    1668114541: "CMHM",
    1668114547: "CMHS",
    1668246896: "COMP",
    1668507697: "CSH1",
    1668637745: "CUD1",
    1668637746: "CUD2",
    1668637752: "CUD8",
    1668637753: "CUD9",
    1668642404: "CUVD",
    1668704612: "CVID",
    1668773492: "CWVT",
    1684090977: "DA0A",
    1684090978: "DA0B",
    1684091233: "DA1A",
    1684091234: "DA1B",
    1684091489: "DA2A",
    1684091490: "DA2B",
    1684091745: "DA3A",
    1684091746: "DA3B",
    1684108136: "DASH",
    1684175153: "DBY1",
    1684890161: "DMB1",
    1685286259: "DSMS",
    1685353265: "DTS1",
    1685353266: "DTS2",
    1685353267: "DTS3",
    1685467489: "DV1A",
    1685467490: "DV1B",
    1685467745: "DV2A",
    1685467746: "DV2B",
    1685468001: "DV3A",
    1685468002: "DV3B",
    1685484081: "DVR1",
    1685484593: "DVT1",
    1685614368: "DXO",
    1701671783: "EMSG",
    1751476579: "HEIC",
    1751476589: "HEIM",
    1751476595: "HEIS",
    1751476600: "HEIX",
    1751478121: "HEOI",
    1751479907: "HEVC",
    1751479908: "HEVD",
    1751479913: "HEVI",
    1751479917: "HEVM",
    1751479923: "HEVS",
    1751479928: "HEVX",
    1752589157: "HVCE",
    1752589161: "HVCI",
    1752589176: "HVCX",
    1752593513: "HVTI",
    1768317281: "IFAA",
    1768319076: "IFHD",
    1768319080: "IFHH",
    1768319090: "IFHR",
    1768319091: "IFHS",
    1768319093: "IFHU",
    1768319096: "IFHX",
    1768321645: "IFRM",
    1768321892: "IFSD",
    1768763753: "IM1I",
    1768763764: "IM1T",
    1768764009: "IM2I",
    1768764020: "IM2T",
    1769169714: "ISC2",
    1769172786: "ISO2",
    1769172787: "ISO3",
    1769172788: "ISO4",
    1769172789: "ISO5",
    1769172790: "ISO6",
    1769172791: "ISO7",
    1769172792: "ISO8",
    1769172793: "ISO9",
    1769172833: "ISOA",
    1769172834: "ISOB",
    1769172835: "ISOC",
    1769172845: "ISOM",
    1781688691: "J2IS",
    1781689193: "J2KI",
    1781689203: "J2KS",
    1785737760: "JP2",
    1785750887: "JPEG",
    1785751411: "JPGS",
    1785752864: "JPM",
    1785753449: "JPOI",
    1785754473: "JPSI",
    1785755680: "JPX",
    1785755746: "JPXB",
    1786276896: "JXL",
    1786278688: "JXS",
    1786278755: "JXSC",
    1786278761: "JXSI",
    1786278771: "JXSS",
    1818784869: "LHTE",
    1818784873: "LHTI",
    1819112295: "LMSG",
    1835622758: "MIAF",
    1835623985: "MIF1",
    1835623986: "MIF2",
    1835676275: "MJ2S",
    1835692082: "MJP2",
    1836069425: "MP21",
    1836069937: "MP41",
    1836069938: "MP42",
    1836070705: "MP71",
    1836086630: "MPUF",
    1836278888: "MSDH",
    1836279345: "MSF1",
    1836280184: "MSIX",
    1852402543: "NIKO",
    1852601196: "NLSL",
    1852989811: "NRAS",
    1868640868: "OA2D",
    1868653164: "OABL",
    1868850022: "ODCF",
    1869443184: "OMPP",
    1869637170: "OPF2",
    1869641778: "OPX2",
    1870029936: "OVDP",
    1870031993: "OVLY",
    1885431398: "PAFF",
    1885433441: "PANA",
    1885955686: "PIFF",
    1886217830: "PMFF",
    1886287465: "PNVI",
    1886545252: "PRED",
    1903435808: "QT",
    1919249519: "RELO",
    1919513464: "RISX",
    1935963680: "SDV",
    1936027254: "SENV",
    1936289139: "SIMS",
    1936290680: "SISX",
    1936290921: "SITI",
    1936484401: "SLH1",
    1936484402: "SLH2",
    1936484403: "SLH3",
    1936946035: "SSSS",
    1953787244: "TTML",
    1953789814: "TTWV",
    1969780329: "UHVI",
    1970170214: "UNIF",
    1970697845: "UVVU",
    1987539060: "VWPT",
    2037658656: "YT4",
  });

  function QuicktimeMov(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  QuicktimeMov.prototype._read = function() {
    this.atoms = new AtomList(this._io, this, this._root);
  }

  /**
   * @see {@link https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-BBCGFGJG|Source}
   */

  var MvhdBody = QuicktimeMov.MvhdBody = (function() {
    function MvhdBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MvhdBody.prototype._read = function() {
      this.version = this._io.readU1();
      this.flags = this._io.readBytes(3);
      this.creationTime = this._io.readU4be();
      this.modificationTime = this._io.readU4be();
      this.timeScale = this._io.readU4be();
      this.duration = this._io.readU4be();
      this.preferredRate = new Fixed32(this._io, this, this._root);
      this.preferredVolume = new Fixed16(this._io, this, this._root);
      this.reserved1 = this._io.readBytes(10);
      this.matrix = this._io.readBytes(36);
      this.previewTime = this._io.readU4be();
      this.previewDuration = this._io.readU4be();
      this.posterTime = this._io.readU4be();
      this.selectionTime = this._io.readU4be();
      this.selectionDuration = this._io.readU4be();
      this.currentTime = this._io.readU4be();
      this.nextTrackId = this._io.readU4be();
    }

    /**
     * Version of this movie header atom
     */

    /**
     * A time value that indicates the time scale for this
     * movie - the number of time units that pass per second
     * in its time coordinate system. A time coordinate system that
     * measures time in sixtieths of a second, for example, has a
     * time scale of 60.
     */

    /**
     * A time value that indicates the duration of the movie in
     * time scale units. Note that this property is derived from
     * the movie's tracks. The value of this field corresponds to
     * the duration of the longest track in the movie.
     */

    /**
     * The rate at which to play this movie. A value of 1.0 indicates normal rate.
     */

    /**
     * How loud to play this movie's sound. A value of 1.0 indicates full volume.
     */

    /**
     * A matrix shows how to map points from one coordinate space into another.
     */

    /**
     * The time value in the movie at which the preview begins.
     */

    /**
     * The duration of the movie preview in movie time scale units.
     */

    /**
     * The time value of the time of the movie poster.
     */

    /**
     * The time value for the start time of the current selection.
     */

    /**
     * The duration of the current selection in movie time scale units.
     */

    /**
     * The time value for current time position within the movie.
     */

    /**
     * Indicates a value to use for the track ID number of the next
     * track added to this movie. Note that 0 is not a valid track
     * ID value.
     */

    return MvhdBody;
  })();

  /**
   * @see {@link https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-CJBCBIFF|Source}
   */

  var FtypBody = QuicktimeMov.FtypBody = (function() {
    function FtypBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FtypBody.prototype._read = function() {
      this.majorBrand = this._io.readU4be();
      this.minorVersion = this._io.readBytes(4);
      this.compatibleBrands = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.compatibleBrands.push(this._io.readU4be());
        i++;
      }
    }

    return FtypBody;
  })();

  /**
   * Fixed-point 32-bit number.
   */

  var Fixed32 = QuicktimeMov.Fixed32 = (function() {
    function Fixed32(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Fixed32.prototype._read = function() {
      this.intPart = this._io.readS2be();
      this.fracPart = this._io.readU2be();
    }

    return Fixed32;
  })();

  /**
   * Fixed-point 16-bit number.
   */

  var Fixed16 = QuicktimeMov.Fixed16 = (function() {
    function Fixed16(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Fixed16.prototype._read = function() {
      this.intPart = this._io.readS1();
      this.fracPart = this._io.readU1();
    }

    return Fixed16;
  })();

  var Atom = QuicktimeMov.Atom = (function() {
    function Atom(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Atom.prototype._read = function() {
      this.len32 = this._io.readU4be();
      this.atomType = this._io.readU4be();
      if (this.len32 == 1) {
        this.len64 = this._io.readU8be();
      }
      switch (this.atomType) {
      case QuicktimeMov.AtomType.MOOF:
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new AtomList(_io__raw_body, this, this._root);
        break;
      case QuicktimeMov.AtomType.TKHD:
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new TkhdBody(_io__raw_body, this, this._root);
        break;
      case QuicktimeMov.AtomType.STBL:
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new AtomList(_io__raw_body, this, this._root);
        break;
      case QuicktimeMov.AtomType.TRAF:
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new AtomList(_io__raw_body, this, this._root);
        break;
      case QuicktimeMov.AtomType.MINF:
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new AtomList(_io__raw_body, this, this._root);
        break;
      case QuicktimeMov.AtomType.TRAK:
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new AtomList(_io__raw_body, this, this._root);
        break;
      case QuicktimeMov.AtomType.MOOV:
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new AtomList(_io__raw_body, this, this._root);
        break;
      case QuicktimeMov.AtomType.MDIA:
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new AtomList(_io__raw_body, this, this._root);
        break;
      case QuicktimeMov.AtomType.DINF:
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new AtomList(_io__raw_body, this, this._root);
        break;
      case QuicktimeMov.AtomType.MVHD:
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new MvhdBody(_io__raw_body, this, this._root);
        break;
      case QuicktimeMov.AtomType.FTYP:
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new FtypBody(_io__raw_body, this, this._root);
        break;
      default:
        this.body = this._io.readBytes(this.len);
        break;
      }
    }
    Object.defineProperty(Atom.prototype, 'len', {
      get: function() {
        if (this._m_len !== undefined)
          return this._m_len;
        this._m_len = (this.len32 == 0 ? (this._io.size - 8) : (this.len32 == 1 ? (this.len64 - 16) : (this.len32 - 8)));
        return this._m_len;
      }
    });

    return Atom;
  })();

  /**
   * @see {@link https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-25550|Source}
   */

  var TkhdBody = QuicktimeMov.TkhdBody = (function() {
    function TkhdBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    TkhdBody.prototype._read = function() {
      this.version = this._io.readU1();
      this.flags = this._io.readBytes(3);
      this.creationTime = this._io.readU4be();
      this.modificationTime = this._io.readU4be();
      this.trackId = this._io.readU4be();
      this.reserved1 = this._io.readBytes(4);
      this.duration = this._io.readU4be();
      this.reserved2 = this._io.readBytes(8);
      this.layer = this._io.readU2be();
      this.alternativeGroup = this._io.readU2be();
      this.volume = this._io.readU2be();
      this.reserved3 = this._io.readU2be();
      this.matrix = this._io.readBytes(36);
      this.width = new Fixed32(this._io, this, this._root);
      this.height = new Fixed32(this._io, this, this._root);
    }

    /**
     * Integer that uniquely identifies the track. The value 0 cannot be used.
     */

    return TkhdBody;
  })();

  var AtomList = QuicktimeMov.AtomList = (function() {
    function AtomList(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    AtomList.prototype._read = function() {
      this.items = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.items.push(new Atom(this._io, this, this._root));
        i++;
      }
    }

    return AtomList;
  })();

  return QuicktimeMov;
})();
return QuicktimeMov;
}));
