// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

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

  function Wmf(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Wmf.prototype._read = function() {
    this.specialHdr = new SpecialHeader(this._io, this, this._root);
    this.header = new WmfHeader(this._io, this, this._root);
    this.records = []
    do {
      var _ = new Record(this._io, this, this._root);
      this.records.push(_);
    } while (!(_.function == Wmf.Func.EOF));
  }

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

  var WmfHeader = Wmf.WmfHeader = (function() {
    WmfHeader.MetafileType = Object.freeze({
      MEMORY_METAFILE: 1,
      DISK_METAFILE: 2,

      1: "MEMORY_METAFILE",
      2: "DISK_METAFILE",
    });

    function WmfHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    WmfHeader.prototype._read = function() {
      this.type = this._io.readU2le();
      this.headerSize = this._io.readU2le();
      this.version = this._io.readU2le();
      this.size = this._io.readU4le();
      this.numberOfObjects = this._io.readU2le();
      this.maxRecord = this._io.readU4le();
      this.numberOfMembers = this._io.readU2le();
    }

    return WmfHeader;
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
      this.params = this._io.readBytes(((this.size - 3) * 2));
    }

    return Record;
  })();

  return Wmf;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Wmf', [], function() {
    return Wmf;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Wmf;
}
