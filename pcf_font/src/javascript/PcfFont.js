// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './BytesWithIo'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./BytesWithIo'));
  } else {
    factory(root.PcfFont || (root.PcfFont = {}), root.KaitaiStream, root.BytesWithIo || (root.BytesWithIo = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (PcfFont_, KaitaiStream, BytesWithIo_) {
/**
 * Portable Compiled Format (PCF) font is a bitmap font format
 * originating from X11 Window System. It matches BDF format (which is
 * text-based) closely, but instead being binary and
 * platform-independent (as opposed to previously used SNF binary
 * format) due to introduced features to handle different endianness
 * and bit order.
 * 
 * The overall composition of the format is straightforward: it's more
 * or less classic directory of type-offset-size pointers, pointing to
 * what PCF format calls "tables". Each table carries a certain
 * piece of information related to the font (metadata properties,
 * metrics, bitmaps, mapping of glyphs to characters, etc).
 * @see {@link https://fontforge.org/docs/techref/pcf-format.html|Source}
 */

var PcfFont = (function() {
  PcfFont.Types = Object.freeze({
    PROPERTIES: 1,
    ACCELERATORS: 2,
    METRICS: 4,
    BITMAPS: 8,
    INK_METRICS: 16,
    BDF_ENCODINGS: 32,
    SWIDTHS: 64,
    GLYPH_NAMES: 128,
    BDF_ACCELERATORS: 256,

    1: "PROPERTIES",
    2: "ACCELERATORS",
    4: "METRICS",
    8: "BITMAPS",
    16: "INK_METRICS",
    32: "BDF_ENCODINGS",
    64: "SWIDTHS",
    128: "GLYPH_NAMES",
    256: "BDF_ACCELERATORS",
  });

  function PcfFont(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  PcfFont.prototype._read = function() {
    this.magic = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([1, 102, 99, 112])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([1, 102, 99, 112]), this.magic, this._io, "/seq/0");
    }
    this.numTables = this._io.readU4le();
    this.tables = [];
    for (var i = 0; i < this.numTables; i++) {
      this.tables.push(new Table(this._io, this, this._root));
    }
  }

  /**
   * Table format specifier, always 4 bytes. Original implementation treats
   * it as always little-endian and makes liberal use of bitmasking to parse
   * various parts of it.
   * 
   * TODO: this format specification recognizes endianness and bit
   * order format bits, but it does not really takes any parsing
   * decisions based on them.
   * @see {@link https://fontforge.org/docs/techref/pcf-format.html#file-header|Source}
   */

  var Format = PcfFont.Format = (function() {
    function Format(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Format.prototype._read = function() {
      this.padding1 = this._io.readBitsIntBe(2);
      this.scanUnitMask = this._io.readBitsIntBe(2);
      this.isMostSignificantBitFirst = this._io.readBitsIntBe(1) != 0;
      this.isBigEndian = this._io.readBitsIntBe(1) != 0;
      this.glyphPadMask = this._io.readBitsIntBe(2);
      this._io.alignToByte();
      this.format = this._io.readU1();
      this.padding = this._io.readU2le();
    }

    /**
     * If set, then all integers in the table are treated as big-endian
     */

    return Format;
  })();

  /**
   * Table offers a offset + length pointer to a particular
   * table. "Type" of table references certain enum. Applications can
   * ignore enum values which they don't support.
   */

  var Table = PcfFont.Table = (function() {
    function Table(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Table.prototype._read = function() {
      this.type = this._io.readU4le();
      this.format = new Format(this._io, this, this._root);
      this.lenBody = this._io.readU4le();
      this.ofsBody = this._io.readU4le();
    }

    /**
     * Table that allows mapping of character codes to glyphs present in the
     * font. Supports 1-byte and 2-byte character codes.
     * 
     * Note that this mapping is agnostic to character encoding itself - it
     * can represent ASCII, Unicode (ISO/IEC 10646), various single-byte
     * national encodings, etc. If application cares about it, normally
     * encoding will be specified in `properties` table, in the properties named
     * `CHARSET_REGISTRY` / `CHARSET_ENCODING`.
     * @see {@link https://fontforge.org/docs/techref/pcf-format.html#the-encoding-table|Source}
     */

    var BdfEncodings = Table.BdfEncodings = (function() {
      function BdfEncodings(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      BdfEncodings.prototype._read = function() {
        this.format = new Format(this._io, this, this._root);
        this.minCharOrByte2 = this._io.readU2le();
        this.maxCharOrByte2 = this._io.readU2le();
        this.minByte1 = this._io.readU2le();
        this.maxByte1 = this._io.readU2le();
        this.defaultChar = this._io.readU2le();
        this.glyphIndexes = [];
        for (var i = 0; i < ((this.maxCharOrByte2 - this.minCharOrByte2) + 1) * ((this.maxByte1 - this.minByte1) + 1); i++) {
          this.glyphIndexes.push(this._io.readU2le());
        }
      }

      return BdfEncodings;
    })();

    /**
     * Table containing uncompressed glyph bitmaps.
     * @see {@link https://fontforge.org/docs/techref/pcf-format.html#the-bitmap-table|Source}
     */

    var Bitmaps = Table.Bitmaps = (function() {
      function Bitmaps(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      Bitmaps.prototype._read = function() {
        this.format = new Format(this._io, this, this._root);
        this.numGlyphs = this._io.readU4le();
        this.offsets = [];
        for (var i = 0; i < this.numGlyphs; i++) {
          this.offsets.push(this._io.readU4le());
        }
        this.bitmapSizes = [];
        for (var i = 0; i < 4; i++) {
          this.bitmapSizes.push(this._io.readU4le());
        }
      }

      return Bitmaps;
    })();

    /**
     * Table containing character names for every glyph.
     * @see {@link https://fontforge.org/docs/techref/pcf-format.html#the-glyph-names-table|Source}
     */

    var GlyphNames = Table.GlyphNames = (function() {
      function GlyphNames(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      GlyphNames.prototype._read = function() {
        this.format = new Format(this._io, this, this._root);
        this.numGlyphs = this._io.readU4le();
        this.names = [];
        for (var i = 0; i < this.numGlyphs; i++) {
          this.names.push(new StringRef(this._io, this, this._root));
        }
        this.lenStrings = this._io.readU4le();
        this._raw_strings = this._io.readBytes(this.lenStrings);
        var _io__raw_strings = new KaitaiStream(this._raw_strings);
        this.strings = new BytesWithIo_.BytesWithIo(_io__raw_strings, null, null);
      }

      var StringRef = GlyphNames.StringRef = (function() {
        function StringRef(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root;

          this._read();
        }
        StringRef.prototype._read = function() {
          this.ofsString = this._io.readU4le();
        }
        Object.defineProperty(StringRef.prototype, 'value', {
          get: function() {
            if (this._m_value !== undefined)
              return this._m_value;
            var io = this._parent.strings._io;
            var _pos = io.pos;
            io.seek(this.ofsString);
            this._m_value = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "UTF-8");
            io.seek(_pos);
            return this._m_value;
          }
        });

        return StringRef;
      })();

      /**
       * Glyph names are represented as string references in strings buffer.
       */

      /**
       * Strings buffer which contains all glyph names.
       */

      return GlyphNames;
    })();

    /**
     * Array of properties (key-value pairs), used to convey different X11
     * settings of a font. Key is always an X font atom.
     * @see {@link https://fontforge.org/docs/techref/pcf-format.html#properties-table|Source}
     */

    var Properties = Table.Properties = (function() {
      function Properties(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      Properties.prototype._read = function() {
        this.format = new Format(this._io, this, this._root);
        this.numProps = this._io.readU4le();
        this.props = [];
        for (var i = 0; i < this.numProps; i++) {
          this.props.push(new Prop(this._io, this, this._root));
        }
        this.padding = this._io.readBytes(((this.numProps & 3) == 0 ? 0 : 4 - (this.numProps & 3)));
        this.lenStrings = this._io.readU4le();
        this._raw_strings = this._io.readBytes(this.lenStrings);
        var _io__raw_strings = new KaitaiStream(this._raw_strings);
        this.strings = new BytesWithIo_.BytesWithIo(_io__raw_strings, null, null);
      }

      /**
       * Property is a key-value pair, "key" being always a
       * string and "value" being either a string or a 32-bit
       * integer based on an additinal flag (`is_string`).
       * 
       * Simple offset-based mechanism is employed to keep this
       * type's sequence fixed-sized and thus have simple access
       * to property key/value by index.
       */

      var Prop = Properties.Prop = (function() {
        function Prop(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root;

          this._read();
        }
        Prop.prototype._read = function() {
          this.ofsName = this._io.readU4le();
          this.isString = this._io.readU1();
          this.valueOrOfsValue = this._io.readU4le();
        }

        /**
         * Value of the property, if this is an integer value.
         */
        Object.defineProperty(Prop.prototype, 'intValue', {
          get: function() {
            if (this._m_intValue !== undefined)
              return this._m_intValue;
            if (this.isString == 0) {
              this._m_intValue = this.valueOrOfsValue;
            }
            return this._m_intValue;
          }
        });

        /**
         * Name of the property addressed in the strings buffer.
         */
        Object.defineProperty(Prop.prototype, 'name', {
          get: function() {
            if (this._m_name !== undefined)
              return this._m_name;
            var io = this._parent.strings._io;
            var _pos = io.pos;
            io.seek(this.ofsName);
            this._m_name = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "UTF-8");
            io.seek(_pos);
            return this._m_name;
          }
        });

        /**
         * Value of the property addressed in the strings
         * buffer, if this is a string value.
         */
        Object.defineProperty(Prop.prototype, 'strValue', {
          get: function() {
            if (this._m_strValue !== undefined)
              return this._m_strValue;
            if (this.isString != 0) {
              var io = this._parent.strings._io;
              var _pos = io.pos;
              io.seek(this.valueOrOfsValue);
              this._m_strValue = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "UTF-8");
              io.seek(_pos);
            }
            return this._m_strValue;
          }
        });

        /**
         * Offset to name in the strings buffer.
         */

        /**
         * Designates if value is an integer (zero) or a string (non-zero).
         */

        /**
         * If the value is an integer (`is_string` is false),
         * then it's stored here. If the value is a string
         * (`is_string` is true), then it stores offset to the
         * value in the strings buffer.
         */

        return Prop;
      })();

      /**
       * Strings buffer. Never used directly, but instead is
       * addressed by offsets from the properties.
       */

      return Properties;
    })();

    /**
     * Table containing scalable widths of characters.
     * @see {@link https://fontforge.org/docs/techref/pcf-format.html#the-scalable-widths-table|Source}
     */

    var Swidths = Table.Swidths = (function() {
      function Swidths(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      Swidths.prototype._read = function() {
        this.format = new Format(this._io, this, this._root);
        this.numGlyphs = this._io.readU4le();
        this.swidths = [];
        for (var i = 0; i < this.numGlyphs; i++) {
          this.swidths.push(this._io.readU4le());
        }
      }

      /**
       * The scalable width of a character is the width of the corresponding
       * PostScript character in em-units (1/1000ths of an em).
       */

      return Swidths;
    })();
    Object.defineProperty(Table.prototype, 'body', {
      get: function() {
        if (this._m_body !== undefined)
          return this._m_body;
        var _pos = this._io.pos;
        this._io.seek(this.ofsBody);
        switch (this.type) {
        case PcfFont.Types.BDF_ENCODINGS:
          this._raw__m_body = this._io.readBytes(this.lenBody);
          var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
          this._m_body = new BdfEncodings(_io__raw__m_body, this, this._root);
          break;
        case PcfFont.Types.BITMAPS:
          this._raw__m_body = this._io.readBytes(this.lenBody);
          var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
          this._m_body = new Bitmaps(_io__raw__m_body, this, this._root);
          break;
        case PcfFont.Types.GLYPH_NAMES:
          this._raw__m_body = this._io.readBytes(this.lenBody);
          var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
          this._m_body = new GlyphNames(_io__raw__m_body, this, this._root);
          break;
        case PcfFont.Types.PROPERTIES:
          this._raw__m_body = this._io.readBytes(this.lenBody);
          var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
          this._m_body = new Properties(_io__raw__m_body, this, this._root);
          break;
        case PcfFont.Types.SWIDTHS:
          this._raw__m_body = this._io.readBytes(this.lenBody);
          var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
          this._m_body = new Swidths(_io__raw__m_body, this, this._root);
          break;
        default:
          this._m_body = this._io.readBytes(this.lenBody);
          break;
        }
        this._io.seek(_pos);
        return this._m_body;
      }
    });

    return Table;
  })();

  return PcfFont;
})();
PcfFont_.PcfFont = PcfFont;
});
