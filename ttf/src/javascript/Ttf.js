// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Ttf = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * A TrueType font file contains data, in table format, that comprises
 * an outline font.
 * @see {@link https://www.microsoft.com/typography/tt/ttf_spec/ttch02.doc|Source}
 */

var Ttf = (function() {
  function Ttf(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Ttf.prototype._read = function() {
    this.offsetTable = new OffsetTable(this._io, this, this._root);
    this.directoryTable = [];
    for (var i = 0; i < this.offsetTable.numTables; i++) {
      this.directoryTable.push(new DirTableEntry(this._io, this, this._root));
    }
  }

  var Post = Ttf.Post = (function() {
    function Post(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Post.prototype._read = function() {
      this.format = new Fixed(this._io, this, this._root);
      this.italicAngle = new Fixed(this._io, this, this._root);
      this.underlinePosition = this._io.readS2be();
      this.underlineThichness = this._io.readS2be();
      this.isFixedPitch = this._io.readU4be();
      this.minMemType42 = this._io.readU4be();
      this.maxMemType42 = this._io.readU4be();
      this.minMemType1 = this._io.readU4be();
      this.maxMemType1 = this._io.readU4be();
      if ( ((this.format.major == 2) && (this.format.minor == 0)) ) {
        this.format20 = new Format20(this._io, this, this._root);
      }
    }

    var Format20 = Post.Format20 = (function() {
      function Format20(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Format20.prototype._read = function() {
        this.numberOfGlyphs = this._io.readU2be();
        this.glyphNameIndex = [];
        for (var i = 0; i < this.numberOfGlyphs; i++) {
          this.glyphNameIndex.push(this._io.readU2be());
        }
        this.glyphNames = [];
        var i = 0;
        do {
          var _ = new PascalString(this._io, this, this._root);
          this.glyphNames.push(_);
          i++;
        } while (!( ((_.length == 0) || (this._io.isEof())) ));
      }

      var PascalString = Format20.PascalString = (function() {
        function PascalString(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        PascalString.prototype._read = function() {
          this.length = this._io.readU1();
          if (this.length != 0) {
            this.value = KaitaiStream.bytesToStr(this._io.readBytes(this.length), "ascii");
          }
        }

        return PascalString;
      })();

      return Format20;
    })();

    return Post;
  })();

  /**
   * Name table is meant to include human-readable string metadata
   * that describes font: name of the font, its styles, copyright &
   * trademark notices, vendor and designer info, etc.
   * 
   * The table includes a list of "name records", each of which
   * corresponds to a single metadata entry.
   * @see {@link https://developer.apple.com/fonts/TrueType-Reference-Manual/RM06/Chap6name.html|Source}
   */

  var Name = Ttf.Name = (function() {
    Name.Platforms = Object.freeze({
      UNICODE: 0,
      MACINTOSH: 1,
      RESERVED_2: 2,
      MICROSOFT: 3,

      0: "UNICODE",
      1: "MACINTOSH",
      2: "RESERVED_2",
      3: "MICROSOFT",
    });

    Name.Names = Object.freeze({
      COPYRIGHT: 0,
      FONT_FAMILY: 1,
      FONT_SUBFAMILY: 2,
      UNIQUE_SUBFAMILY_ID: 3,
      FULL_FONT_NAME: 4,
      NAME_TABLE_VERSION: 5,
      POSTSCRIPT_FONT_NAME: 6,
      TRADEMARK: 7,
      MANUFACTURER: 8,
      DESIGNER: 9,
      DESCRIPTION: 10,
      URL_VENDOR: 11,
      URL_DESIGNER: 12,
      LICENSE: 13,
      URL_LICENSE: 14,
      RESERVED_15: 15,
      PREFERRED_FAMILY: 16,
      PREFERRED_SUBFAMILY: 17,
      COMPATIBLE_FULL_NAME: 18,
      SAMPLE_TEXT: 19,

      0: "COPYRIGHT",
      1: "FONT_FAMILY",
      2: "FONT_SUBFAMILY",
      3: "UNIQUE_SUBFAMILY_ID",
      4: "FULL_FONT_NAME",
      5: "NAME_TABLE_VERSION",
      6: "POSTSCRIPT_FONT_NAME",
      7: "TRADEMARK",
      8: "MANUFACTURER",
      9: "DESIGNER",
      10: "DESCRIPTION",
      11: "URL_VENDOR",
      12: "URL_DESIGNER",
      13: "LICENSE",
      14: "URL_LICENSE",
      15: "RESERVED_15",
      16: "PREFERRED_FAMILY",
      17: "PREFERRED_SUBFAMILY",
      18: "COMPATIBLE_FULL_NAME",
      19: "SAMPLE_TEXT",
    });

    function Name(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Name.prototype._read = function() {
      this.formatSelector = this._io.readU2be();
      this.numNameRecords = this._io.readU2be();
      this.ofsStrings = this._io.readU2be();
      this.nameRecords = [];
      for (var i = 0; i < this.numNameRecords; i++) {
        this.nameRecords.push(new NameRecord(this._io, this, this._root));
      }
    }

    var NameRecord = Name.NameRecord = (function() {
      function NameRecord(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      NameRecord.prototype._read = function() {
        this.platformId = this._io.readU2be();
        this.encodingId = this._io.readU2be();
        this.languageId = this._io.readU2be();
        this.nameId = this._io.readU2be();
        this.lenStr = this._io.readU2be();
        this.ofsStr = this._io.readU2be();
      }
      Object.defineProperty(NameRecord.prototype, 'asciiValue', {
        get: function() {
          if (this._m_asciiValue !== undefined)
            return this._m_asciiValue;
          var io = this._parent._io;
          var _pos = io.pos;
          io.seek((this._parent.ofsStrings + this.ofsStr));
          this._m_asciiValue = KaitaiStream.bytesToStr(io.readBytes(this.lenStr), "ascii");
          io.seek(_pos);
          return this._m_asciiValue;
        }
      });
      Object.defineProperty(NameRecord.prototype, 'unicodeValue', {
        get: function() {
          if (this._m_unicodeValue !== undefined)
            return this._m_unicodeValue;
          var io = this._parent._io;
          var _pos = io.pos;
          io.seek((this._parent.ofsStrings + this.ofsStr));
          this._m_unicodeValue = KaitaiStream.bytesToStr(io.readBytes(this.lenStr), "utf-16be");
          io.seek(_pos);
          return this._m_unicodeValue;
        }
      });

      return NameRecord;
    })();

    return Name;
  })();

  var Head = Ttf.Head = (function() {
    Head.Flags = Object.freeze({
      BASELINE_AT_Y0: 1,
      LEFT_SIDEBEARING_AT_X0: 2,
      FLAG_DEPEND_ON_POINT_SIZE: 4,
      FLAG_FORCE_PPEM: 8,
      FLAG_MAY_ADVANCE_WIDTH: 16,

      1: "BASELINE_AT_Y0",
      2: "LEFT_SIDEBEARING_AT_X0",
      4: "FLAG_DEPEND_ON_POINT_SIZE",
      8: "FLAG_FORCE_PPEM",
      16: "FLAG_MAY_ADVANCE_WIDTH",
    });

    Head.FontDirectionHint = Object.freeze({
      FULLY_MIXED_DIRECTIONAL_GLYPHS: 0,
      ONLY_STRONGLY_LEFT_TO_RIGHT: 1,
      STRONGLY_LEFT_TO_RIGHT_AND_NEUTRALS: 2,

      0: "FULLY_MIXED_DIRECTIONAL_GLYPHS",
      1: "ONLY_STRONGLY_LEFT_TO_RIGHT",
      2: "STRONGLY_LEFT_TO_RIGHT_AND_NEUTRALS",
    });

    function Head(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Head.prototype._read = function() {
      this.version = new Fixed(this._io, this, this._root);
      this.fontRevision = new Fixed(this._io, this, this._root);
      this.checksumAdjustment = this._io.readU4be();
      this.magicNumber = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magicNumber, [95, 15, 60, 245]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([95, 15, 60, 245], this.magicNumber, this._io, "/types/head/seq/3");
      }
      this.flags = this._io.readU2be();
      this.unitsPerEm = this._io.readU2be();
      this.created = this._io.readU8be();
      this.modified = this._io.readU8be();
      this.xMin = this._io.readS2be();
      this.yMin = this._io.readS2be();
      this.xMax = this._io.readS2be();
      this.yMax = this._io.readS2be();
      this.macStyle = this._io.readU2be();
      this.lowestRecPpem = this._io.readU2be();
      this.fontDirectionHint = this._io.readS2be();
      this.indexToLocFormat = this._io.readS2be();
      this.glyphDataFormat = this._io.readS2be();
    }

    return Head;
  })();

  var Prep = Ttf.Prep = (function() {
    function Prep(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Prep.prototype._read = function() {
      this.instructions = this._io.readBytesFull();
    }

    return Prep;
  })();

  var Hhea = Ttf.Hhea = (function() {
    function Hhea(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Hhea.prototype._read = function() {
      this.version = new Fixed(this._io, this, this._root);
      this.ascender = this._io.readS2be();
      this.descender = this._io.readS2be();
      this.lineGap = this._io.readS2be();
      this.advanceWidthMax = this._io.readU2be();
      this.minLeftSideBearing = this._io.readS2be();
      this.minRightSideBearing = this._io.readS2be();
      this.xMaxExtend = this._io.readS2be();
      this.caretSlopeRise = this._io.readS2be();
      this.caretSlopeRun = this._io.readS2be();
      this.reserved = this._io.readBytes(10);
      if (!((KaitaiStream.byteArrayCompare(this.reserved, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0, 0, 0, 0, 0, 0, 0, 0, 0, 0], this.reserved, this._io, "/types/hhea/seq/10");
      }
      this.metricDataFormat = this._io.readS2be();
      this.numberOfHmetrics = this._io.readU2be();
    }

    /**
     * Typographic ascent
     */

    /**
     * Typographic descent
     */

    /**
     * Typographic line gap. Negative LineGap values are treated as zero in Windows 3.1, System 6, and System 7.
     */

    /**
     * Maximum advance width value in `hmtx` table.
     */

    /**
     * Minimum left sidebearing value in `hmtx` table.
     */

    /**
     * Minimum right sidebearing value; calculated as Min(aw - lsb - (xMax - xMin)).
     */

    /**
     * Max(lsb + (xMax - xMin)).
     */

    return Hhea;
  })();

  var Fpgm = Ttf.Fpgm = (function() {
    function Fpgm(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Fpgm.prototype._read = function() {
      this.instructions = this._io.readBytesFull();
    }

    return Fpgm;
  })();

  var Kern = Ttf.Kern = (function() {
    function Kern(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Kern.prototype._read = function() {
      this.version = this._io.readU2be();
      this.subtableCount = this._io.readU2be();
      this.subtables = [];
      for (var i = 0; i < this.subtableCount; i++) {
        this.subtables.push(new Subtable(this._io, this, this._root));
      }
    }

    var Subtable = Kern.Subtable = (function() {
      function Subtable(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Subtable.prototype._read = function() {
        this.version = this._io.readU2be();
        this.length = this._io.readU2be();
        this.format = this._io.readU1();
        this.reserved = this._io.readBitsIntBe(4);
        this.isOverride = this._io.readBitsIntBe(1) != 0;
        this.isCrossStream = this._io.readBitsIntBe(1) != 0;
        this.isMinimum = this._io.readBitsIntBe(1) != 0;
        this.isHorizontal = this._io.readBitsIntBe(1) != 0;
        this._io.alignToByte();
        if (this.format == 0) {
          this.format0 = new Format0(this._io, this, this._root);
        }
      }

      var Format0 = Subtable.Format0 = (function() {
        function Format0(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        Format0.prototype._read = function() {
          this.pairCount = this._io.readU2be();
          this.searchRange = this._io.readU2be();
          this.entrySelector = this._io.readU2be();
          this.rangeShift = this._io.readU2be();
          this.kerningPairs = [];
          for (var i = 0; i < this.pairCount; i++) {
            this.kerningPairs.push(new KerningPair(this._io, this, this._root));
          }
        }

        var KerningPair = Format0.KerningPair = (function() {
          function KerningPair(_io, _parent, _root) {
            this._io = _io;
            this._parent = _parent;
            this._root = _root || this;

            this._read();
          }
          KerningPair.prototype._read = function() {
            this.left = this._io.readU2be();
            this.right = this._io.readU2be();
            this.value = this._io.readS2be();
          }

          return KerningPair;
        })();

        return Format0;
      })();

      return Subtable;
    })();

    return Kern;
  })();

  var DirTableEntry = Ttf.DirTableEntry = (function() {
    function DirTableEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DirTableEntry.prototype._read = function() {
      this.tag = KaitaiStream.bytesToStr(this._io.readBytes(4), "ascii");
      this.checksum = this._io.readU4be();
      this.offset = this._io.readU4be();
      this.length = this._io.readU4be();
    }
    Object.defineProperty(DirTableEntry.prototype, 'value', {
      get: function() {
        if (this._m_value !== undefined)
          return this._m_value;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this.offset);
        switch (this.tag) {
        case "head":
          this._raw__m_value = io.readBytes(this.length);
          var _io__raw__m_value = new KaitaiStream(this._raw__m_value);
          this._m_value = new Head(_io__raw__m_value, this, this._root);
          break;
        case "cvt ":
          this._raw__m_value = io.readBytes(this.length);
          var _io__raw__m_value = new KaitaiStream(this._raw__m_value);
          this._m_value = new Cvt(_io__raw__m_value, this, this._root);
          break;
        case "prep":
          this._raw__m_value = io.readBytes(this.length);
          var _io__raw__m_value = new KaitaiStream(this._raw__m_value);
          this._m_value = new Prep(_io__raw__m_value, this, this._root);
          break;
        case "kern":
          this._raw__m_value = io.readBytes(this.length);
          var _io__raw__m_value = new KaitaiStream(this._raw__m_value);
          this._m_value = new Kern(_io__raw__m_value, this, this._root);
          break;
        case "hhea":
          this._raw__m_value = io.readBytes(this.length);
          var _io__raw__m_value = new KaitaiStream(this._raw__m_value);
          this._m_value = new Hhea(_io__raw__m_value, this, this._root);
          break;
        case "post":
          this._raw__m_value = io.readBytes(this.length);
          var _io__raw__m_value = new KaitaiStream(this._raw__m_value);
          this._m_value = new Post(_io__raw__m_value, this, this._root);
          break;
        case "OS/2":
          this._raw__m_value = io.readBytes(this.length);
          var _io__raw__m_value = new KaitaiStream(this._raw__m_value);
          this._m_value = new Os2(_io__raw__m_value, this, this._root);
          break;
        case "name":
          this._raw__m_value = io.readBytes(this.length);
          var _io__raw__m_value = new KaitaiStream(this._raw__m_value);
          this._m_value = new Name(_io__raw__m_value, this, this._root);
          break;
        case "maxp":
          this._raw__m_value = io.readBytes(this.length);
          var _io__raw__m_value = new KaitaiStream(this._raw__m_value);
          this._m_value = new Maxp(_io__raw__m_value, this, this._root);
          break;
        case "glyf":
          this._raw__m_value = io.readBytes(this.length);
          var _io__raw__m_value = new KaitaiStream(this._raw__m_value);
          this._m_value = new Glyf(_io__raw__m_value, this, this._root);
          break;
        case "fpgm":
          this._raw__m_value = io.readBytes(this.length);
          var _io__raw__m_value = new KaitaiStream(this._raw__m_value);
          this._m_value = new Fpgm(_io__raw__m_value, this, this._root);
          break;
        case "cmap":
          this._raw__m_value = io.readBytes(this.length);
          var _io__raw__m_value = new KaitaiStream(this._raw__m_value);
          this._m_value = new Cmap(_io__raw__m_value, this, this._root);
          break;
        default:
          this._m_value = io.readBytes(this.length);
          break;
        }
        io.seek(_pos);
        return this._m_value;
      }
    });

    return DirTableEntry;
  })();

  /**
   * The OS/2 table consists of a set of metrics that are required by Windows and OS/2.
   */

  var Os2 = Ttf.Os2 = (function() {
    Os2.WeightClass = Object.freeze({
      THIN: 100,
      EXTRA_LIGHT: 200,
      LIGHT: 300,
      NORMAL: 400,
      MEDIUM: 500,
      SEMI_BOLD: 600,
      BOLD: 700,
      EXTRA_BOLD: 800,
      BLACK: 900,

      100: "THIN",
      200: "EXTRA_LIGHT",
      300: "LIGHT",
      400: "NORMAL",
      500: "MEDIUM",
      600: "SEMI_BOLD",
      700: "BOLD",
      800: "EXTRA_BOLD",
      900: "BLACK",
    });

    Os2.WidthClass = Object.freeze({
      ULTRA_CONDENSED: 1,
      EXTRA_CONDENSED: 2,
      CONDENSED: 3,
      SEMI_CONDENSED: 4,
      NORMAL: 5,
      SEMI_EXPANDED: 6,
      EXPANDED: 7,
      EXTRA_EXPANDED: 8,
      ULTRA_EXPANDED: 9,

      1: "ULTRA_CONDENSED",
      2: "EXTRA_CONDENSED",
      3: "CONDENSED",
      4: "SEMI_CONDENSED",
      5: "NORMAL",
      6: "SEMI_EXPANDED",
      7: "EXPANDED",
      8: "EXTRA_EXPANDED",
      9: "ULTRA_EXPANDED",
    });

    Os2.FsType = Object.freeze({
      RESTRICTED_LICENSE_EMBEDDING: 2,
      PREVIEW_AND_PRINT_EMBEDDING: 4,
      EDITABLE_EMBEDDING: 8,

      2: "RESTRICTED_LICENSE_EMBEDDING",
      4: "PREVIEW_AND_PRINT_EMBEDDING",
      8: "EDITABLE_EMBEDDING",
    });

    Os2.FsSelection = Object.freeze({
      ITALIC: 1,
      UNDERSCORE: 2,
      NEGATIVE: 4,
      OUTLINED: 8,
      STRIKEOUT: 16,
      BOLD: 32,
      REGULAR: 64,

      1: "ITALIC",
      2: "UNDERSCORE",
      4: "NEGATIVE",
      8: "OUTLINED",
      16: "STRIKEOUT",
      32: "BOLD",
      64: "REGULAR",
    });

    function Os2(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Os2.prototype._read = function() {
      this.version = this._io.readU2be();
      this.xAvgCharWidth = this._io.readS2be();
      this.weightClass = this._io.readU2be();
      this.widthClass = this._io.readU2be();
      this.fsType = this._io.readS2be();
      this.ySubscriptXSize = this._io.readS2be();
      this.ySubscriptYSize = this._io.readS2be();
      this.ySubscriptXOffset = this._io.readS2be();
      this.ySubscriptYOffset = this._io.readS2be();
      this.ySuperscriptXSize = this._io.readS2be();
      this.ySuperscriptYSize = this._io.readS2be();
      this.ySuperscriptXOffset = this._io.readS2be();
      this.ySuperscriptYOffset = this._io.readS2be();
      this.yStrikeoutSize = this._io.readS2be();
      this.yStrikeoutPosition = this._io.readS2be();
      this.sFamilyClass = this._io.readS2be();
      this.panose = new Panose(this._io, this, this._root);
      this.unicodeRange = new UnicodeRange(this._io, this, this._root);
      this.achVendId = KaitaiStream.bytesToStr(this._io.readBytes(4), "ascii");
      this.selection = this._io.readU2be();
      this.firstCharIndex = this._io.readU2be();
      this.lastCharIndex = this._io.readU2be();
      this.typoAscender = this._io.readS2be();
      this.typoDescender = this._io.readS2be();
      this.typoLineGap = this._io.readS2be();
      this.winAscent = this._io.readU2be();
      this.winDescent = this._io.readU2be();
      this.codePageRange = new CodePageRange(this._io, this, this._root);
    }

    var Panose = Os2.Panose = (function() {
      Panose.Weight = Object.freeze({
        ANY: 0,
        NO_FIT: 1,
        VERY_LIGHT: 2,
        LIGHT: 3,
        THIN: 4,
        BOOK: 5,
        MEDIUM: 6,
        DEMI: 7,
        BOLD: 8,
        HEAVY: 9,
        BLACK: 10,
        NORD: 11,

        0: "ANY",
        1: "NO_FIT",
        2: "VERY_LIGHT",
        3: "LIGHT",
        4: "THIN",
        5: "BOOK",
        6: "MEDIUM",
        7: "DEMI",
        8: "BOLD",
        9: "HEAVY",
        10: "BLACK",
        11: "NORD",
      });

      Panose.Proportion = Object.freeze({
        ANY: 0,
        NO_FIT: 1,
        OLD_STYLE: 2,
        MODERN: 3,
        EVEN_WIDTH: 4,
        EXPANDED: 5,
        CONDENSED: 6,
        VERY_EXPANDED: 7,
        VERY_CONDENSED: 8,
        MONOSPACED: 9,

        0: "ANY",
        1: "NO_FIT",
        2: "OLD_STYLE",
        3: "MODERN",
        4: "EVEN_WIDTH",
        5: "EXPANDED",
        6: "CONDENSED",
        7: "VERY_EXPANDED",
        8: "VERY_CONDENSED",
        9: "MONOSPACED",
      });

      Panose.FamilyKind = Object.freeze({
        ANY: 0,
        NO_FIT: 1,
        TEXT_AND_DISPLAY: 2,
        SCRIPT: 3,
        DECORATIVE: 4,
        PICTORIAL: 5,

        0: "ANY",
        1: "NO_FIT",
        2: "TEXT_AND_DISPLAY",
        3: "SCRIPT",
        4: "DECORATIVE",
        5: "PICTORIAL",
      });

      Panose.LetterForm = Object.freeze({
        ANY: 0,
        NO_FIT: 1,
        NORMAL_CONTACT: 2,
        NORMAL_WEIGHTED: 3,
        NORMAL_BOXED: 4,
        NORMAL_FLATTENED: 5,
        NORMAL_ROUNDED: 6,
        NORMAL_OFF_CENTER: 7,
        NORMAL_SQUARE: 8,
        OBLIQUE_CONTACT: 9,
        OBLIQUE_WEIGHTED: 10,
        OBLIQUE_BOXED: 11,
        OBLIQUE_FLATTENED: 12,
        OBLIQUE_ROUNDED: 13,
        OBLIQUE_OFF_CENTER: 14,
        OBLIQUE_SQUARE: 15,

        0: "ANY",
        1: "NO_FIT",
        2: "NORMAL_CONTACT",
        3: "NORMAL_WEIGHTED",
        4: "NORMAL_BOXED",
        5: "NORMAL_FLATTENED",
        6: "NORMAL_ROUNDED",
        7: "NORMAL_OFF_CENTER",
        8: "NORMAL_SQUARE",
        9: "OBLIQUE_CONTACT",
        10: "OBLIQUE_WEIGHTED",
        11: "OBLIQUE_BOXED",
        12: "OBLIQUE_FLATTENED",
        13: "OBLIQUE_ROUNDED",
        14: "OBLIQUE_OFF_CENTER",
        15: "OBLIQUE_SQUARE",
      });

      Panose.SerifStyle = Object.freeze({
        ANY: 0,
        NO_FIT: 1,
        COVE: 2,
        OBTUSE_COVE: 3,
        SQUARE_COVE: 4,
        OBTUSE_SQUARE_COVE: 5,
        SQUARE: 6,
        THIN: 7,
        BONE: 8,
        EXAGGERATED: 9,
        TRIANGLE: 10,
        NORMAL_SANS: 11,
        OBTUSE_SANS: 12,
        PERP_SANS: 13,
        FLARED: 14,
        ROUNDED: 15,

        0: "ANY",
        1: "NO_FIT",
        2: "COVE",
        3: "OBTUSE_COVE",
        4: "SQUARE_COVE",
        5: "OBTUSE_SQUARE_COVE",
        6: "SQUARE",
        7: "THIN",
        8: "BONE",
        9: "EXAGGERATED",
        10: "TRIANGLE",
        11: "NORMAL_SANS",
        12: "OBTUSE_SANS",
        13: "PERP_SANS",
        14: "FLARED",
        15: "ROUNDED",
      });

      Panose.XHeight = Object.freeze({
        ANY: 0,
        NO_FIT: 1,
        CONSTANT_SMALL: 2,
        CONSTANT_STANDARD: 3,
        CONSTANT_LARGE: 4,
        DUCKING_SMALL: 5,
        DUCKING_STANDARD: 6,
        DUCKING_LARGE: 7,

        0: "ANY",
        1: "NO_FIT",
        2: "CONSTANT_SMALL",
        3: "CONSTANT_STANDARD",
        4: "CONSTANT_LARGE",
        5: "DUCKING_SMALL",
        6: "DUCKING_STANDARD",
        7: "DUCKING_LARGE",
      });

      Panose.ArmStyle = Object.freeze({
        ANY: 0,
        NO_FIT: 1,
        STRAIGHT_ARMS_HORIZONTAL: 2,
        STRAIGHT_ARMS_WEDGE: 3,
        STRAIGHT_ARMS_VERTICAL: 4,
        STRAIGHT_ARMS_SINGLE_SERIF: 5,
        STRAIGHT_ARMS_DOUBLE_SERIF: 6,
        NON_STRAIGHT_ARMS_HORIZONTAL: 7,
        NON_STRAIGHT_ARMS_WEDGE: 8,
        NON_STRAIGHT_ARMS_VERTICAL: 9,
        NON_STRAIGHT_ARMS_SINGLE_SERIF: 10,
        NON_STRAIGHT_ARMS_DOUBLE_SERIF: 11,

        0: "ANY",
        1: "NO_FIT",
        2: "STRAIGHT_ARMS_HORIZONTAL",
        3: "STRAIGHT_ARMS_WEDGE",
        4: "STRAIGHT_ARMS_VERTICAL",
        5: "STRAIGHT_ARMS_SINGLE_SERIF",
        6: "STRAIGHT_ARMS_DOUBLE_SERIF",
        7: "NON_STRAIGHT_ARMS_HORIZONTAL",
        8: "NON_STRAIGHT_ARMS_WEDGE",
        9: "NON_STRAIGHT_ARMS_VERTICAL",
        10: "NON_STRAIGHT_ARMS_SINGLE_SERIF",
        11: "NON_STRAIGHT_ARMS_DOUBLE_SERIF",
      });

      Panose.StrokeVariation = Object.freeze({
        ANY: 0,
        NO_FIT: 1,
        GRADUAL_DIAGONAL: 2,
        GRADUAL_TRANSITIONAL: 3,
        GRADUAL_VERTICAL: 4,
        GRADUAL_HORIZONTAL: 5,
        RAPID_VERTICAL: 6,
        RAPID_HORIZONTAL: 7,
        INSTANT_VERTICAL: 8,

        0: "ANY",
        1: "NO_FIT",
        2: "GRADUAL_DIAGONAL",
        3: "GRADUAL_TRANSITIONAL",
        4: "GRADUAL_VERTICAL",
        5: "GRADUAL_HORIZONTAL",
        6: "RAPID_VERTICAL",
        7: "RAPID_HORIZONTAL",
        8: "INSTANT_VERTICAL",
      });

      Panose.Contrast = Object.freeze({
        ANY: 0,
        NO_FIT: 1,
        NONE: 2,
        VERY_LOW: 3,
        LOW: 4,
        MEDIUM_LOW: 5,
        MEDIUM: 6,
        MEDIUM_HIGH: 7,
        HIGH: 8,
        VERY_HIGH: 9,

        0: "ANY",
        1: "NO_FIT",
        2: "NONE",
        3: "VERY_LOW",
        4: "LOW",
        5: "MEDIUM_LOW",
        6: "MEDIUM",
        7: "MEDIUM_HIGH",
        8: "HIGH",
        9: "VERY_HIGH",
      });

      Panose.Midline = Object.freeze({
        ANY: 0,
        NO_FIT: 1,
        STANDARD_TRIMMED: 2,
        STANDARD_POINTED: 3,
        STANDARD_SERIFED: 4,
        HIGH_TRIMMED: 5,
        HIGH_POINTED: 6,
        HIGH_SERIFED: 7,
        CONSTANT_TRIMMED: 8,
        CONSTANT_POINTED: 9,
        CONSTANT_SERIFED: 10,
        LOW_TRIMMED: 11,
        LOW_POINTED: 12,
        LOW_SERIFED: 13,

        0: "ANY",
        1: "NO_FIT",
        2: "STANDARD_TRIMMED",
        3: "STANDARD_POINTED",
        4: "STANDARD_SERIFED",
        5: "HIGH_TRIMMED",
        6: "HIGH_POINTED",
        7: "HIGH_SERIFED",
        8: "CONSTANT_TRIMMED",
        9: "CONSTANT_POINTED",
        10: "CONSTANT_SERIFED",
        11: "LOW_TRIMMED",
        12: "LOW_POINTED",
        13: "LOW_SERIFED",
      });

      function Panose(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Panose.prototype._read = function() {
        this.familyType = this._io.readU1();
        this.serifStyle = this._io.readU1();
        this.weight = this._io.readU1();
        this.proportion = this._io.readU1();
        this.contrast = this._io.readU1();
        this.strokeVariation = this._io.readU1();
        this.armStyle = this._io.readU1();
        this.letterForm = this._io.readU1();
        this.midline = this._io.readU1();
        this.xHeight = this._io.readU1();
      }

      return Panose;
    })();

    var UnicodeRange = Os2.UnicodeRange = (function() {
      function UnicodeRange(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      UnicodeRange.prototype._read = function() {
        this.basicLatin = this._io.readBitsIntBe(1) != 0;
        this.latin1Supplement = this._io.readBitsIntBe(1) != 0;
        this.latinExtendedA = this._io.readBitsIntBe(1) != 0;
        this.latinExtendedB = this._io.readBitsIntBe(1) != 0;
        this.ipaExtensions = this._io.readBitsIntBe(1) != 0;
        this.spacingModifierLetters = this._io.readBitsIntBe(1) != 0;
        this.combiningDiacriticalMarks = this._io.readBitsIntBe(1) != 0;
        this.basicGreek = this._io.readBitsIntBe(1) != 0;
        this.greekSymbolsAndCoptic = this._io.readBitsIntBe(1) != 0;
        this.cyrillic = this._io.readBitsIntBe(1) != 0;
        this.armenian = this._io.readBitsIntBe(1) != 0;
        this.basicHebrew = this._io.readBitsIntBe(1) != 0;
        this.hebrewExtended = this._io.readBitsIntBe(1) != 0;
        this.basicArabic = this._io.readBitsIntBe(1) != 0;
        this.arabicExtended = this._io.readBitsIntBe(1) != 0;
        this.devanagari = this._io.readBitsIntBe(1) != 0;
        this.bengali = this._io.readBitsIntBe(1) != 0;
        this.gurmukhi = this._io.readBitsIntBe(1) != 0;
        this.gujarati = this._io.readBitsIntBe(1) != 0;
        this.oriya = this._io.readBitsIntBe(1) != 0;
        this.tamil = this._io.readBitsIntBe(1) != 0;
        this.telugu = this._io.readBitsIntBe(1) != 0;
        this.kannada = this._io.readBitsIntBe(1) != 0;
        this.malayalam = this._io.readBitsIntBe(1) != 0;
        this.thai = this._io.readBitsIntBe(1) != 0;
        this.lao = this._io.readBitsIntBe(1) != 0;
        this.basicGeorgian = this._io.readBitsIntBe(1) != 0;
        this.georgianExtended = this._io.readBitsIntBe(1) != 0;
        this.hangulJamo = this._io.readBitsIntBe(1) != 0;
        this.latinExtendedAdditional = this._io.readBitsIntBe(1) != 0;
        this.greekExtended = this._io.readBitsIntBe(1) != 0;
        this.generalPunctuation = this._io.readBitsIntBe(1) != 0;
        this.superscriptsAndSubscripts = this._io.readBitsIntBe(1) != 0;
        this.currencySymbols = this._io.readBitsIntBe(1) != 0;
        this.combiningDiacriticalMarksForSymbols = this._io.readBitsIntBe(1) != 0;
        this.letterlikeSymbols = this._io.readBitsIntBe(1) != 0;
        this.numberForms = this._io.readBitsIntBe(1) != 0;
        this.arrows = this._io.readBitsIntBe(1) != 0;
        this.mathematicalOperators = this._io.readBitsIntBe(1) != 0;
        this.miscellaneousTechnical = this._io.readBitsIntBe(1) != 0;
        this.controlPictures = this._io.readBitsIntBe(1) != 0;
        this.opticalCharacterRecognition = this._io.readBitsIntBe(1) != 0;
        this.enclosedAlphanumerics = this._io.readBitsIntBe(1) != 0;
        this.boxDrawing = this._io.readBitsIntBe(1) != 0;
        this.blockElements = this._io.readBitsIntBe(1) != 0;
        this.geometricShapes = this._io.readBitsIntBe(1) != 0;
        this.miscellaneousSymbols = this._io.readBitsIntBe(1) != 0;
        this.dingbats = this._io.readBitsIntBe(1) != 0;
        this.cjkSymbolsAndPunctuation = this._io.readBitsIntBe(1) != 0;
        this.hiragana = this._io.readBitsIntBe(1) != 0;
        this.katakana = this._io.readBitsIntBe(1) != 0;
        this.bopomofo = this._io.readBitsIntBe(1) != 0;
        this.hangulCompatibilityJamo = this._io.readBitsIntBe(1) != 0;
        this.cjkMiscellaneous = this._io.readBitsIntBe(1) != 0;
        this.enclosedCjkLettersAndMonths = this._io.readBitsIntBe(1) != 0;
        this.cjkCompatibility = this._io.readBitsIntBe(1) != 0;
        this.hangul = this._io.readBitsIntBe(1) != 0;
        this.reservedForUnicodeSubranges1 = this._io.readBitsIntBe(1) != 0;
        this.reservedForUnicodeSubranges2 = this._io.readBitsIntBe(1) != 0;
        this.cjkUnifiedIdeographs = this._io.readBitsIntBe(1) != 0;
        this.privateUseArea = this._io.readBitsIntBe(1) != 0;
        this.cjkCompatibilityIdeographs = this._io.readBitsIntBe(1) != 0;
        this.alphabeticPresentationForms = this._io.readBitsIntBe(1) != 0;
        this.arabicPresentationFormsA = this._io.readBitsIntBe(1) != 0;
        this.combiningHalfMarks = this._io.readBitsIntBe(1) != 0;
        this.cjkCompatibilityForms = this._io.readBitsIntBe(1) != 0;
        this.smallFormVariants = this._io.readBitsIntBe(1) != 0;
        this.arabicPresentationFormsB = this._io.readBitsIntBe(1) != 0;
        this.halfwidthAndFullwidthForms = this._io.readBitsIntBe(1) != 0;
        this.specials = this._io.readBitsIntBe(1) != 0;
        this._io.alignToByte();
        this.reserved = this._io.readBytes(7);
      }

      return UnicodeRange;
    })();

    var CodePageRange = Os2.CodePageRange = (function() {
      function CodePageRange(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      CodePageRange.prototype._read = function() {
        this.symbolCharacterSet = this._io.readBitsIntBe(1) != 0;
        this.oemCharacterSet = this._io.readBitsIntBe(1) != 0;
        this.macintoshCharacterSet = this._io.readBitsIntBe(1) != 0;
        this.reservedForAlternateAnsiOem = this._io.readBitsIntBe(7);
        this.cp1361KoreanJohab = this._io.readBitsIntBe(1) != 0;
        this.cp950ChineseTraditionalCharsTaiwanAndHongKong = this._io.readBitsIntBe(1) != 0;
        this.cp949KoreanWansung = this._io.readBitsIntBe(1) != 0;
        this.cp936ChineseSimplifiedCharsPrcAndSingapore = this._io.readBitsIntBe(1) != 0;
        this.cp932JisJapan = this._io.readBitsIntBe(1) != 0;
        this.cp874Thai = this._io.readBitsIntBe(1) != 0;
        this.reservedForAlternateAnsi = this._io.readBitsIntBe(8);
        this.cp1257WindowsBaltic = this._io.readBitsIntBe(1) != 0;
        this.cp1256Arabic = this._io.readBitsIntBe(1) != 0;
        this.cp1255Hebrew = this._io.readBitsIntBe(1) != 0;
        this.cp1254Turkish = this._io.readBitsIntBe(1) != 0;
        this.cp1253Greek = this._io.readBitsIntBe(1) != 0;
        this.cp1251Cyrillic = this._io.readBitsIntBe(1) != 0;
        this.cp1250Latin2EasternEurope = this._io.readBitsIntBe(1) != 0;
        this.cp1252Latin1 = this._io.readBitsIntBe(1) != 0;
        this.cp437Us = this._io.readBitsIntBe(1) != 0;
        this.cp850WeLatin1 = this._io.readBitsIntBe(1) != 0;
        this.cp708ArabicAsmo708 = this._io.readBitsIntBe(1) != 0;
        this.cp737GreekFormer437G = this._io.readBitsIntBe(1) != 0;
        this.cp775MsDosBaltic = this._io.readBitsIntBe(1) != 0;
        this.cp852Latin2 = this._io.readBitsIntBe(1) != 0;
        this.cp855IbmCyrillicPrimarilyRussian = this._io.readBitsIntBe(1) != 0;
        this.cp857IbmTurkish = this._io.readBitsIntBe(1) != 0;
        this.cp860MsDosPortuguese = this._io.readBitsIntBe(1) != 0;
        this.cp861MsDosIcelandic = this._io.readBitsIntBe(1) != 0;
        this.cp862Hebrew = this._io.readBitsIntBe(1) != 0;
        this.cp863MsDosCanadianFrench = this._io.readBitsIntBe(1) != 0;
        this.cp864Arabic = this._io.readBitsIntBe(1) != 0;
        this.cp865MsDosNordic = this._io.readBitsIntBe(1) != 0;
        this.cp866MsDosRussian = this._io.readBitsIntBe(1) != 0;
        this.cp869IbmGreek = this._io.readBitsIntBe(1) != 0;
        this.reservedForOem = this._io.readBitsIntBe(16);
      }

      return CodePageRange;
    })();

    /**
     * The version number for this OS/2 table.
     */

    /**
     * The Average Character Width parameter specifies the arithmetic average of the escapement (width) of all of the 26 lowercase letters a through z of the Latin alphabet and the space character. If any of the 26 lowercase letters are not present, this parameter should equal the weighted average of all glyphs in the font. For non-UGL (platform 3, encoding 0) fonts, use the unweighted average.
     */

    /**
     * Indicates the visual weight (degree of blackness or thickness of strokes) of the characters in the font.
     */

    /**
     * Indicates a relative change from the normal aspect ratio (width to height ratio) as specified by a font designer for the glyphs in a font.
     */

    /**
     * Indicates font embedding licensing rights for the font. Embeddable fonts may be stored in a document. When a document with embedded fonts is opened on a system that does not have the font installed (the remote system), the embedded font may be loaded for temporary (and in some cases, permanent) use on that system by an embedding-aware application. Embedding licensing rights are granted by the vendor of the font.
     */

    /**
     * The recommended horizontal size in font design units for subscripts for this font.
     */

    /**
     * The recommended vertical size in font design units for subscripts for this font.
     */

    /**
     * The recommended horizontal offset in font design untis for subscripts for this font.
     */

    /**
     * The recommended vertical offset in font design units from the baseline for subscripts for this font.
     */

    /**
     * The recommended horizontal size in font design units for superscripts for this font.
     */

    /**
     * The recommended vertical size in font design units for superscripts for this font.
     */

    /**
     * The recommended horizontal offset in font design units for superscripts for this font.
     */

    /**
     * The recommended vertical offset in font design units from the baseline for superscripts for this font.
     */

    /**
     * Width of the strikeout stroke in font design units.
     */

    /**
     * The position of the strikeout stroke relative to the baseline in font design units.
     */

    /**
     * This parameter is a classification of font-family design.
     */

    /**
     * The four character identifier for the vendor of the given type face.
     */

    /**
     * Contains information concerning the nature of the font patterns
     */

    /**
     * The minimum Unicode index (character code) in this font, according to the cmap subtable for platform ID 3 and encoding ID 0 or 1.
     */

    /**
     * The maximum Unicode index (character code) in this font, according to the cmap subtable for platform ID 3 and encoding ID 0 or 1.
     */

    /**
     * The typographic ascender for this font.
     */

    /**
     * The typographic descender for this font.
     */

    /**
     * The typographic line gap for this font.
     */

    /**
     * The ascender metric for Windows.
     */

    /**
     * The descender metric for Windows.
     */

    /**
     * This field is used to specify the code pages encompassed by the font file in the `cmap` subtable for platform 3, encoding ID 1 (Microsoft platform).
     */

    return Os2;
  })();

  var Fixed = Ttf.Fixed = (function() {
    function Fixed(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Fixed.prototype._read = function() {
      this.major = this._io.readU2be();
      this.minor = this._io.readU2be();
    }

    return Fixed;
  })();

  var Glyf = Ttf.Glyf = (function() {
    function Glyf(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Glyf.prototype._read = function() {
      this.numberOfContours = this._io.readS2be();
      this.xMin = this._io.readS2be();
      this.yMin = this._io.readS2be();
      this.xMax = this._io.readS2be();
      this.yMax = this._io.readS2be();
      if (this.numberOfContours > 0) {
        this.value = new SimpleGlyph(this._io, this, this._root);
      }
    }

    var SimpleGlyph = Glyf.SimpleGlyph = (function() {
      function SimpleGlyph(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SimpleGlyph.prototype._read = function() {
        this.endPtsOfContours = [];
        for (var i = 0; i < this._parent.numberOfContours; i++) {
          this.endPtsOfContours.push(this._io.readU2be());
        }
        this.instructionLength = this._io.readU2be();
        this.instructions = this._io.readBytes(this.instructionLength);
        this.flags = [];
        for (var i = 0; i < this.pointCount; i++) {
          this.flags.push(new Flag(this._io, this, this._root));
        }
      }

      var Flag = SimpleGlyph.Flag = (function() {
        function Flag(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        Flag.prototype._read = function() {
          this.reserved = this._io.readBitsIntBe(2);
          this.yIsSame = this._io.readBitsIntBe(1) != 0;
          this.xIsSame = this._io.readBitsIntBe(1) != 0;
          this.repeat = this._io.readBitsIntBe(1) != 0;
          this.yShortVector = this._io.readBitsIntBe(1) != 0;
          this.xShortVector = this._io.readBitsIntBe(1) != 0;
          this.onCurve = this._io.readBitsIntBe(1) != 0;
          this._io.alignToByte();
          if (this.repeat) {
            this.repeatValue = this._io.readU1();
          }
        }

        return Flag;
      })();
      Object.defineProperty(SimpleGlyph.prototype, 'pointCount', {
        get: function() {
          if (this._m_pointCount !== undefined)
            return this._m_pointCount;
          this._m_pointCount = (KaitaiStream.arrayMax(this.endPtsOfContours) + 1);
          return this._m_pointCount;
        }
      });

      return SimpleGlyph;
    })();

    return Glyf;
  })();

  /**
   * cvt  - Control Value Table This table contains a list of values that can be referenced by instructions. They can be used, among other things, to control characteristics for different glyphs.
   */

  var Cvt = Ttf.Cvt = (function() {
    function Cvt(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Cvt.prototype._read = function() {
      this.fwords = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.fwords.push(this._io.readS2be());
        i++;
      }
    }

    return Cvt;
  })();

  var Maxp = Ttf.Maxp = (function() {
    function Maxp(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Maxp.prototype._read = function() {
      this.tableVersionNumber = new Fixed(this._io, this, this._root);
      this.numGlyphs = this._io.readU2be();
      if (this.isVersion10) {
        this.version10Body = new MaxpVersion10Body(this._io, this, this._root);
      }
    }
    Object.defineProperty(Maxp.prototype, 'isVersion10', {
      get: function() {
        if (this._m_isVersion10 !== undefined)
          return this._m_isVersion10;
        this._m_isVersion10 =  ((this.tableVersionNumber.major == 1) && (this.tableVersionNumber.minor == 0)) ;
        return this._m_isVersion10;
      }
    });

    /**
     * 0x00010000 for version 1.0.
     */

    /**
     * The number of glyphs in the font.
     */

    return Maxp;
  })();

  var MaxpVersion10Body = Ttf.MaxpVersion10Body = (function() {
    function MaxpVersion10Body(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MaxpVersion10Body.prototype._read = function() {
      this.maxPoints = this._io.readU2be();
      this.maxContours = this._io.readU2be();
      this.maxCompositePoints = this._io.readU2be();
      this.maxCompositeContours = this._io.readU2be();
      this.maxZones = this._io.readU2be();
      this.maxTwilightPoints = this._io.readU2be();
      this.maxStorage = this._io.readU2be();
      this.maxFunctionDefs = this._io.readU2be();
      this.maxInstructionDefs = this._io.readU2be();
      this.maxStackElements = this._io.readU2be();
      this.maxSizeOfInstructions = this._io.readU2be();
      this.maxComponentElements = this._io.readU2be();
      this.maxComponentDepth = this._io.readU2be();
    }

    /**
     * Maximum points in a non-composite glyph.
     */

    /**
     * Maximum contours in a non-composite glyph.
     */

    /**
     * Maximum points in a composite glyph.
     */

    /**
     * Maximum contours in a composite glyph.
     */

    /**
     * 1 if instructions do not use the twilight zone (Z0), or 2 if instructions do use Z0; should be set to 2 in most cases.
     */

    /**
     * Maximum points used in Z0.
     */

    /**
     * Number of Storage Area locations.
     */

    /**
     * Number of FDEFs.
     */

    /**
     * Number of IDEFs.
     */

    /**
     * Maximum stack depth.
     */

    /**
     * Maximum byte count for glyph instructions.
     */

    /**
     * Maximum number of components referenced at "top level" for any composite glyph.
     */

    /**
     * Maximum levels of recursion; 1 for simple components.
     */

    return MaxpVersion10Body;
  })();

  var OffsetTable = Ttf.OffsetTable = (function() {
    function OffsetTable(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    OffsetTable.prototype._read = function() {
      this.sfntVersion = new Fixed(this._io, this, this._root);
      this.numTables = this._io.readU2be();
      this.searchRange = this._io.readU2be();
      this.entrySelector = this._io.readU2be();
      this.rangeShift = this._io.readU2be();
    }

    return OffsetTable;
  })();

  /**
   * cmap - Character To Glyph Index Mapping Table This table defines the mapping of character codes to the glyph index values used in the font.
   */

  var Cmap = Ttf.Cmap = (function() {
    function Cmap(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Cmap.prototype._read = function() {
      this.versionNumber = this._io.readU2be();
      this.numberOfEncodingTables = this._io.readU2be();
      this.tables = [];
      for (var i = 0; i < this.numberOfEncodingTables; i++) {
        this.tables.push(new SubtableHeader(this._io, this, this._root));
      }
    }

    var SubtableHeader = Cmap.SubtableHeader = (function() {
      function SubtableHeader(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SubtableHeader.prototype._read = function() {
        this.platformId = this._io.readU2be();
        this.encodingId = this._io.readU2be();
        this.subtableOffset = this._io.readU4be();
      }
      Object.defineProperty(SubtableHeader.prototype, 'table', {
        get: function() {
          if (this._m_table !== undefined)
            return this._m_table;
          var io = this._parent._io;
          var _pos = io.pos;
          io.seek(this.subtableOffset);
          this._m_table = new Subtable(io, this, this._root);
          io.seek(_pos);
          return this._m_table;
        }
      });

      return SubtableHeader;
    })();

    var Subtable = Cmap.Subtable = (function() {
      Subtable.SubtableFormat = Object.freeze({
        BYTE_ENCODING_TABLE: 0,
        HIGH_BYTE_MAPPING_THROUGH_TABLE: 2,
        SEGMENT_MAPPING_TO_DELTA_VALUES: 4,
        TRIMMED_TABLE_MAPPING: 6,

        0: "BYTE_ENCODING_TABLE",
        2: "HIGH_BYTE_MAPPING_THROUGH_TABLE",
        4: "SEGMENT_MAPPING_TO_DELTA_VALUES",
        6: "TRIMMED_TABLE_MAPPING",
      });

      function Subtable(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Subtable.prototype._read = function() {
        this.format = this._io.readU2be();
        this.length = this._io.readU2be();
        this.version = this._io.readU2be();
        switch (this.format) {
        case Ttf.Cmap.Subtable.SubtableFormat.BYTE_ENCODING_TABLE:
          this._raw_value = this._io.readBytes((this.length - 6));
          var _io__raw_value = new KaitaiStream(this._raw_value);
          this.value = new ByteEncodingTable(_io__raw_value, this, this._root);
          break;
        case Ttf.Cmap.Subtable.SubtableFormat.SEGMENT_MAPPING_TO_DELTA_VALUES:
          this._raw_value = this._io.readBytes((this.length - 6));
          var _io__raw_value = new KaitaiStream(this._raw_value);
          this.value = new SegmentMappingToDeltaValues(_io__raw_value, this, this._root);
          break;
        case Ttf.Cmap.Subtable.SubtableFormat.HIGH_BYTE_MAPPING_THROUGH_TABLE:
          this._raw_value = this._io.readBytes((this.length - 6));
          var _io__raw_value = new KaitaiStream(this._raw_value);
          this.value = new HighByteMappingThroughTable(_io__raw_value, this, this._root);
          break;
        case Ttf.Cmap.Subtable.SubtableFormat.TRIMMED_TABLE_MAPPING:
          this._raw_value = this._io.readBytes((this.length - 6));
          var _io__raw_value = new KaitaiStream(this._raw_value);
          this.value = new TrimmedTableMapping(_io__raw_value, this, this._root);
          break;
        default:
          this.value = this._io.readBytes((this.length - 6));
          break;
        }
      }

      var ByteEncodingTable = Subtable.ByteEncodingTable = (function() {
        function ByteEncodingTable(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        ByteEncodingTable.prototype._read = function() {
          this.glyphIdArray = this._io.readBytes(256);
        }

        return ByteEncodingTable;
      })();

      var HighByteMappingThroughTable = Subtable.HighByteMappingThroughTable = (function() {
        function HighByteMappingThroughTable(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        HighByteMappingThroughTable.prototype._read = function() {
          this.subHeaderKeys = [];
          for (var i = 0; i < 256; i++) {
            this.subHeaderKeys.push(this._io.readU2be());
          }
        }

        return HighByteMappingThroughTable;
      })();

      var SegmentMappingToDeltaValues = Subtable.SegmentMappingToDeltaValues = (function() {
        function SegmentMappingToDeltaValues(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        SegmentMappingToDeltaValues.prototype._read = function() {
          this.segCountX2 = this._io.readU2be();
          this.searchRange = this._io.readU2be();
          this.entrySelector = this._io.readU2be();
          this.rangeShift = this._io.readU2be();
          this.endCount = [];
          for (var i = 0; i < this.segCount; i++) {
            this.endCount.push(this._io.readU2be());
          }
          this.reservedPad = this._io.readU2be();
          this.startCount = [];
          for (var i = 0; i < this.segCount; i++) {
            this.startCount.push(this._io.readU2be());
          }
          this.idDelta = [];
          for (var i = 0; i < this.segCount; i++) {
            this.idDelta.push(this._io.readU2be());
          }
          this.idRangeOffset = [];
          for (var i = 0; i < this.segCount; i++) {
            this.idRangeOffset.push(this._io.readU2be());
          }
          this.glyphIdArray = [];
          var i = 0;
          while (!this._io.isEof()) {
            this.glyphIdArray.push(this._io.readU2be());
            i++;
          }
        }
        Object.defineProperty(SegmentMappingToDeltaValues.prototype, 'segCount', {
          get: function() {
            if (this._m_segCount !== undefined)
              return this._m_segCount;
            this._m_segCount = Math.floor(this.segCountX2 / 2);
            return this._m_segCount;
          }
        });

        return SegmentMappingToDeltaValues;
      })();

      var TrimmedTableMapping = Subtable.TrimmedTableMapping = (function() {
        function TrimmedTableMapping(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        TrimmedTableMapping.prototype._read = function() {
          this.firstCode = this._io.readU2be();
          this.entryCount = this._io.readU2be();
          this.glyphIdArray = [];
          for (var i = 0; i < this.entryCount; i++) {
            this.glyphIdArray.push(this._io.readU2be());
          }
        }

        return TrimmedTableMapping;
      })();

      return Subtable;
    })();

    return Cmap;
  })();

  return Ttf;
})();
return Ttf;
}));
