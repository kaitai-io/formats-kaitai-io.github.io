// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.QuicktimeMov = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * @see {@link https://developer.apple.com/library/content/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-BBCGDDDF|Source}
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
    X_3GE9: 862414137,
    X_3GF9: 862414393,
    X_3GG6: 862414646,
    X_3GG9: 862414649,
    X_3GH9: 862414905,
    X_3GM9: 862416185,
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
    X_3GT9: 862417977,
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
    MFSM: 1296454477,
    MGSV: 1296520022,
    MPPI: 1297109065,
    MSNV: 1297305174,
    ROSS: 1380930387,
    SEAU: 1397047637,
    SEBK: 1397047883,
    XAVC: 1480676931,
    AVC1: 1635148593,
    BBXM: 1650620525,
    CAQV: 1667330422,
    CCFF: 1667458662,
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
    IFRM: 1768321645,
    ISC2: 1769169714,
    ISO2: 1769172786,
    ISO3: 1769172787,
    ISO4: 1769172788,
    ISO5: 1769172789,
    ISO6: 1769172790,
    ISOM: 1769172845,
    JP2: 1785737760,
    JPM: 1785752864,
    JPSI: 1785754473,
    JPX: 1785755680,
    JPXB: 1785755746,
    LMSG: 1819112295,
    MJ2S: 1835676275,
    MJP2: 1835692082,
    MP21: 1836069425,
    MP41: 1836069937,
    MP42: 1836069938,
    MP71: 1836070705,
    MSDH: 1836278888,
    MSIX: 1836280184,
    NIKO: 1852402543,
    ODCF: 1868850022,
    OPF2: 1869637170,
    OPX2: 1869641778,
    PANA: 1885433441,
    PIFF: 1885955686,
    PNVI: 1886287465,
    QT: 1903435808,
    RISX: 1919513464,
    SDV: 1935963680,
    SENV: 1936027254,
    SIMS: 1936289139,
    SISX: 1936290680,
    SSSS: 1936946035,
    UVVU: 1970697845,

    862401121: "X_3G2A",
    862414134: "X_3GE6",
    862414137: "X_3GE9",
    862414393: "X_3GF9",
    862414646: "X_3GG6",
    862414649: "X_3GG9",
    862414905: "X_3GH9",
    862416185: "X_3GM9",
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
    862417977: "X_3GT9",
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
    1296454477: "MFSM",
    1296520022: "MGSV",
    1297109065: "MPPI",
    1297305174: "MSNV",
    1380930387: "ROSS",
    1397047637: "SEAU",
    1397047883: "SEBK",
    1480676931: "XAVC",
    1635148593: "AVC1",
    1650620525: "BBXM",
    1667330422: "CAQV",
    1667458662: "CCFF",
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
    1768321645: "IFRM",
    1769169714: "ISC2",
    1769172786: "ISO2",
    1769172787: "ISO3",
    1769172788: "ISO4",
    1769172789: "ISO5",
    1769172790: "ISO6",
    1769172845: "ISOM",
    1785737760: "JP2",
    1785752864: "JPM",
    1785754473: "JPSI",
    1785755680: "JPX",
    1785755746: "JPXB",
    1819112295: "LMSG",
    1835676275: "MJ2S",
    1835692082: "MJP2",
    1836069425: "MP21",
    1836069937: "MP41",
    1836069938: "MP42",
    1836070705: "MP71",
    1836278888: "MSDH",
    1836280184: "MSIX",
    1852402543: "NIKO",
    1868850022: "ODCF",
    1869637170: "OPF2",
    1869641778: "OPX2",
    1885433441: "PANA",
    1885955686: "PIFF",
    1886287465: "PNVI",
    1903435808: "QT",
    1919513464: "RISX",
    1935963680: "SDV",
    1936027254: "SENV",
    1936289139: "SIMS",
    1936290680: "SISX",
    1936946035: "SSSS",
    1970697845: "UVVU",
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
   * @see {@link https://developer.apple.com/library/content/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-BBCGFGJG|Source}
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
   * @see {@link https://developer.apple.com/library/content/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-CJBCBIFF|Source}
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
   * @see {@link https://developer.apple.com/library/content/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-25550|Source}
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
