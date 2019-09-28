// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Wmf = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * WMF (Windows Metafile) is a relatively early vector image format
 * introduced for Microsoft Windows in 1990.
 * 
 * Inside, it provides a serialized list of Windows GDI (Graphics
 * Device Interface) function calls, which, if played back, result in
 * an image being drawn on a given surface (display, off-screen buffer,
 * printer, etc).
 * @see {@link http://www.digitalpreservation.gov/formats/digformatspecs/WindowsMetafileFormat(wmf)Specification.pdf|Source}
 */

var Wmf = (function() {
  Wmf.Func = Object.freeze({
    EOF: 0,
    SAVEDC: 30,
    REALIZEPALETTE: 53,
    SETPALENTRIES: 55,
    CREATEPALETTE: 247,
    SETBKMODE: 258,
    SETMAPMODE: 259,
    SETROP2: 260,
    SETRELABS: 261,
    SETPOLYFILLMODE: 262,
    SETSTRETCHBLTMODE: 263,
    SETTEXTCHAREXTRA: 264,
    RESTOREDC: 295,
    INVERTREGION: 298,
    PAINTREGION: 299,
    SELECTCLIPREGION: 300,
    SELECTOBJECT: 301,
    SETTEXTALIGN: 302,
    RESIZEPALETTE: 313,
    DIBCREATEPATTERNBRUSH: 322,
    SETLAYOUT: 329,
    DELETEOBJECT: 496,
    CREATEPATTERNBRUSH: 505,
    SETBKCOLOR: 513,
    SETTEXTCOLOR: 521,
    SETTEXTJUSTIFICATION: 522,
    SETWINDOWORG: 523,
    SETWINDOWEXT: 524,
    SETVIEWPORTORG: 525,
    SETVIEWPORTEXT: 526,
    OFFSETWINDOWORG: 527,
    OFFSETVIEWPORTORG: 529,
    LINETO: 531,
    MOVETO: 532,
    OFFSETCLIPRGN: 544,
    FILLREGION: 552,
    SETMAPPERFLAGS: 561,
    SELECTPALETTE: 564,
    CREATEPENINDIRECT: 762,
    CREATEFONTINDIRECT: 763,
    CREATEBRUSHINDIRECT: 764,
    POLYGON: 804,
    POLYLINE: 805,
    SCALEWINDOWEXT: 1040,
    SCALEVIEWPORTEXT: 1042,
    EXCLUDECLIPRECT: 1045,
    INTERSECTCLIPRECT: 1046,
    ELLIPSE: 1048,
    FLOODFILL: 1049,
    RECTANGLE: 1051,
    SETPIXEL: 1055,
    FRAMEREGION: 1065,
    ANIMATEPALETTE: 1078,
    TEXTOUT: 1313,
    POLYPOLYGON: 1336,
    EXTFLOODFILL: 1352,
    ROUNDRECT: 1564,
    PATBLT: 1565,
    ESCAPE: 1574,
    CREATEREGION: 1791,
    ARC: 2071,
    PIE: 2074,
    CHORD: 2096,
    BITBLT: 2338,
    DIBBITBLT: 2368,
    EXTTEXTOUT: 2610,
    STRETCHBLT: 2851,
    DIBSTRETCHBLT: 2881,
    SETDIBTODEV: 3379,
    STRETCHDIB: 3907,

    0: "EOF",
    30: "SAVEDC",
    53: "REALIZEPALETTE",
    55: "SETPALENTRIES",
    247: "CREATEPALETTE",
    258: "SETBKMODE",
    259: "SETMAPMODE",
    260: "SETROP2",
    261: "SETRELABS",
    262: "SETPOLYFILLMODE",
    263: "SETSTRETCHBLTMODE",
    264: "SETTEXTCHAREXTRA",
    295: "RESTOREDC",
    298: "INVERTREGION",
    299: "PAINTREGION",
    300: "SELECTCLIPREGION",
    301: "SELECTOBJECT",
    302: "SETTEXTALIGN",
    313: "RESIZEPALETTE",
    322: "DIBCREATEPATTERNBRUSH",
    329: "SETLAYOUT",
    496: "DELETEOBJECT",
    505: "CREATEPATTERNBRUSH",
    513: "SETBKCOLOR",
    521: "SETTEXTCOLOR",
    522: "SETTEXTJUSTIFICATION",
    523: "SETWINDOWORG",
    524: "SETWINDOWEXT",
    525: "SETVIEWPORTORG",
    526: "SETVIEWPORTEXT",
    527: "OFFSETWINDOWORG",
    529: "OFFSETVIEWPORTORG",
    531: "LINETO",
    532: "MOVETO",
    544: "OFFSETCLIPRGN",
    552: "FILLREGION",
    561: "SETMAPPERFLAGS",
    564: "SELECTPALETTE",
    762: "CREATEPENINDIRECT",
    763: "CREATEFONTINDIRECT",
    764: "CREATEBRUSHINDIRECT",
    804: "POLYGON",
    805: "POLYLINE",
    1040: "SCALEWINDOWEXT",
    1042: "SCALEVIEWPORTEXT",
    1045: "EXCLUDECLIPRECT",
    1046: "INTERSECTCLIPRECT",
    1048: "ELLIPSE",
    1049: "FLOODFILL",
    1051: "RECTANGLE",
    1055: "SETPIXEL",
    1065: "FRAMEREGION",
    1078: "ANIMATEPALETTE",
    1313: "TEXTOUT",
    1336: "POLYPOLYGON",
    1352: "EXTFLOODFILL",
    1564: "ROUNDRECT",
    1565: "PATBLT",
    1574: "ESCAPE",
    1791: "CREATEREGION",
    2071: "ARC",
    2074: "PIE",
    2096: "CHORD",
    2338: "BITBLT",
    2368: "DIBBITBLT",
    2610: "EXTTEXTOUT",
    2851: "STRETCHBLT",
    2881: "DIBSTRETCHBLT",
    3379: "SETDIBTODEV",
    3907: "STRETCHDIB",
  });

  Wmf.BinRasterOp = Object.freeze({
    BLACK: 1,
    NOTMERGEPEN: 2,
    MASKNOTPEN: 3,
    NOTCOPYPEN: 4,
    MASKPENNOT: 5,
    NOT: 6,
    XORPEN: 7,
    NOTMASKPEN: 8,
    MASKPEN: 9,
    NOTXORPEN: 10,
    NOP: 11,
    MERGENOTPEN: 12,
    COPYPEN: 13,
    MERGEPENNOT: 14,
    MERGEPEN: 15,
    WHITE: 16,

    1: "BLACK",
    2: "NOTMERGEPEN",
    3: "MASKNOTPEN",
    4: "NOTCOPYPEN",
    5: "MASKPENNOT",
    6: "NOT",
    7: "XORPEN",
    8: "NOTMASKPEN",
    9: "MASKPEN",
    10: "NOTXORPEN",
    11: "NOP",
    12: "MERGENOTPEN",
    13: "COPYPEN",
    14: "MERGEPENNOT",
    15: "MERGEPEN",
    16: "WHITE",
  });

  Wmf.MixMode = Object.freeze({
    TRANSPARENT: 1,
    OPAQUE: 2,

    1: "TRANSPARENT",
    2: "OPAQUE",
  });

  Wmf.PolyFillMode = Object.freeze({
    ALTERNATE: 1,
    WINDING: 2,

    1: "ALTERNATE",
    2: "WINDING",
  });

  function Wmf(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Wmf.prototype._read = function() {
    this.specialHeader = new SpecialHeader(this._io, this, this._root);
    this.header = new Header(this._io, this, this._root);
    this.records = []
    var i = 0;
    do {
      var _ = new Record(this._io, this, this._root);
      this.records.push(_);
      i++;
    } while (!(_.function == Wmf.Func.EOF));
  }

  var ParamsSetwindoworg = Wmf.ParamsSetwindoworg = (function() {
    function ParamsSetwindoworg(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ParamsSetwindoworg.prototype._read = function() {
      this.y = this._io.readS2le();
      this.x = this._io.readS2le();
    }

    /**
     * Y coordinate of the window origin, in logical units.
     */

    /**
     * X coordinate of the window origin, in logical units.
     */

    return ParamsSetwindoworg;
  })();

  var ParamsSetbkmode = Wmf.ParamsSetbkmode = (function() {
    function ParamsSetbkmode(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ParamsSetbkmode.prototype._read = function() {
      this.bkMode = this._io.readU2le();
    }

    /**
     * Defines current graphic context background mix mode.
     */

    return ParamsSetbkmode;
  })();

  var PointS = Wmf.PointS = (function() {
    function PointS(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PointS.prototype._read = function() {
      this.x = this._io.readS2le();
      this.y = this._io.readS2le();
    }

    /**
     * X coordinate of the point, in logical units.
     */

    /**
     * Y coordinate of the point, in logical units.
     */

    return PointS;
  })();

  var ParamsSetwindowext = Wmf.ParamsSetwindowext = (function() {
    function ParamsSetwindowext(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ParamsSetwindowext.prototype._read = function() {
      this.y = this._io.readS2le();
      this.x = this._io.readS2le();
    }

    /**
     * Vertical extent of the window in logical units.
     */

    /**
     * Horizontal extent of the window in logical units.
     */

    return ParamsSetwindowext;
  })();

  var ParamsPolygon = Wmf.ParamsPolygon = (function() {
    function ParamsPolygon(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ParamsPolygon.prototype._read = function() {
      this.numPoints = this._io.readS2le();
      this.points = new Array(this.numPoints);
      for (var i = 0; i < this.numPoints; i++) {
        this.points[i] = new PointS(this._io, this, this._root);
      }
    }

    return ParamsPolygon;
  })();

  var Header = Wmf.Header = (function() {
    Header.MetafileType = Object.freeze({
      MEMORY_METAFILE: 1,
      DISK_METAFILE: 2,

      1: "MEMORY_METAFILE",
      2: "DISK_METAFILE",
    });

    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.metafileType = this._io.readU2le();
      this.headerSize = this._io.readU2le();
      this.version = this._io.readU2le();
      this.size = this._io.readU4le();
      this.numberOfObjects = this._io.readU2le();
      this.maxRecord = this._io.readU4le();
      this.numberOfMembers = this._io.readU2le();
    }

    return Header;
  })();

  var ColorRef = Wmf.ColorRef = (function() {
    function ColorRef(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ColorRef.prototype._read = function() {
      this.red = this._io.readU1();
      this.green = this._io.readU1();
      this.blue = this._io.readU1();
      this.reserved = this._io.readU1();
    }

    return ColorRef;
  })();

  var ParamsSetrop2 = Wmf.ParamsSetrop2 = (function() {
    function ParamsSetrop2(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ParamsSetrop2.prototype._read = function() {
      this.drawMode = this._io.readU2le();
    }

    /**
     * Defines current foreground binary raster operation mixing mode.
     */

    return ParamsSetrop2;
  })();

  var ParamsSetpolyfillmode = Wmf.ParamsSetpolyfillmode = (function() {
    function ParamsSetpolyfillmode(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ParamsSetpolyfillmode.prototype._read = function() {
      this.polyFillMode = this._io.readU2le();
    }

    /**
     * Defines current polygon fill mode.
     */

    return ParamsSetpolyfillmode;
  })();

  var ParamsPolyline = Wmf.ParamsPolyline = (function() {
    function ParamsPolyline(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ParamsPolyline.prototype._read = function() {
      this.numPoints = this._io.readS2le();
      this.points = new Array(this.numPoints);
      for (var i = 0; i < this.numPoints; i++) {
        this.points[i] = new PointS(this._io, this, this._root);
      }
    }

    return ParamsPolyline;
  })();

  var SpecialHeader = Wmf.SpecialHeader = (function() {
    function SpecialHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SpecialHeader.prototype._read = function() {
      this.magic = this._io.ensureFixedContents([215, 205, 198, 154]);
      this.handle = this._io.ensureFixedContents([0, 0]);
      this.left = this._io.readS2le();
      this.top = this._io.readS2le();
      this.right = this._io.readS2le();
      this.bottom = this._io.readS2le();
      this.inch = this._io.readU2le();
      this.reserved = this._io.ensureFixedContents([0, 0, 0, 0]);
      this.checksum = this._io.readU2le();
    }

    return SpecialHeader;
  })();

  var Record = Wmf.Record = (function() {
    function Record(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Record.prototype._read = function() {
      this.size = this._io.readU4le();
      this.function = this._io.readU2le();
      switch (this.function) {
      case Wmf.Func.SETBKMODE:
        this._raw_params = this._io.readBytes(((this.size - 3) * 2));
        var _io__raw_params = new KaitaiStream(this._raw_params);
        this.params = new ParamsSetbkmode(_io__raw_params, this, this._root);
        break;
      case Wmf.Func.POLYGON:
        this._raw_params = this._io.readBytes(((this.size - 3) * 2));
        var _io__raw_params = new KaitaiStream(this._raw_params);
        this.params = new ParamsPolygon(_io__raw_params, this, this._root);
        break;
      case Wmf.Func.SETBKCOLOR:
        this._raw_params = this._io.readBytes(((this.size - 3) * 2));
        var _io__raw_params = new KaitaiStream(this._raw_params);
        this.params = new ColorRef(_io__raw_params, this, this._root);
        break;
      case Wmf.Func.SETPOLYFILLMODE:
        this._raw_params = this._io.readBytes(((this.size - 3) * 2));
        var _io__raw_params = new KaitaiStream(this._raw_params);
        this.params = new ParamsSetpolyfillmode(_io__raw_params, this, this._root);
        break;
      case Wmf.Func.SETWINDOWORG:
        this._raw_params = this._io.readBytes(((this.size - 3) * 2));
        var _io__raw_params = new KaitaiStream(this._raw_params);
        this.params = new ParamsSetwindoworg(_io__raw_params, this, this._root);
        break;
      case Wmf.Func.SETROP2:
        this._raw_params = this._io.readBytes(((this.size - 3) * 2));
        var _io__raw_params = new KaitaiStream(this._raw_params);
        this.params = new ParamsSetrop2(_io__raw_params, this, this._root);
        break;
      case Wmf.Func.SETWINDOWEXT:
        this._raw_params = this._io.readBytes(((this.size - 3) * 2));
        var _io__raw_params = new KaitaiStream(this._raw_params);
        this.params = new ParamsSetwindowext(_io__raw_params, this, this._root);
        break;
      case Wmf.Func.POLYLINE:
        this._raw_params = this._io.readBytes(((this.size - 3) * 2));
        var _io__raw_params = new KaitaiStream(this._raw_params);
        this.params = new ParamsPolyline(_io__raw_params, this, this._root);
        break;
      default:
        this.params = this._io.readBytes(((this.size - 3) * 2));
        break;
      }
    }

    return Record;
  })();

  return Wmf;
})();
return Wmf;
}));
