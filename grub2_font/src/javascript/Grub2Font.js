// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Grub2Font || (root.Grub2Font = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Grub2Font_, KaitaiStream) {
/**
 * Bitmap font format for the GRUB 2 bootloader.
 * @see {@link https://grub.gibibit.com/New_font_format|Source}
 */

var Grub2Font = (function() {
  function Grub2Font(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Grub2Font.prototype._read = function() {
    this.magic = this._io.readBytes(12);
    if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([70, 73, 76, 69, 0, 0, 0, 4, 80, 70, 70, 50])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([70, 73, 76, 69, 0, 0, 0, 4, 80, 70, 70, 50]), this.magic, this._io, "/seq/0");
    }
    this.sections = [];
    var i = 0;
    do {
      var _ = new Section(this._io, this, this._root);
      this.sections.push(_);
      i++;
    } while (!(_.sectionType == "DATA"));
  }

  var AsceSection = Grub2Font.AsceSection = (function() {
    function AsceSection(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    AsceSection.prototype._read = function() {
      this.ascentInPixels = this._io.readU2be();
    }

    return AsceSection;
  })();

  var ChixSection = Grub2Font.ChixSection = (function() {
    function ChixSection(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ChixSection.prototype._read = function() {
      this.characters = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.characters.push(new Character(this._io, this, this._root));
        i++;
      }
    }

    var Character = ChixSection.Character = (function() {
      function Character(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      Character.prototype._read = function() {
        this.codePoint = this._io.readU4be();
        this.flags = this._io.readU1();
        this.ofsDefinition = this._io.readU4be();
      }
      Object.defineProperty(Character.prototype, 'definition', {
        get: function() {
          if (this._m_definition !== undefined)
            return this._m_definition;
          var io = this._root._io;
          var _pos = io.pos;
          io.seek(this.ofsDefinition);
          this._m_definition = new CharacterDefinition(io, this, this._root);
          io.seek(_pos);
          return this._m_definition;
        }
      });

      /**
       * Unicode code point
       */

      return Character;
    })();

    var CharacterDefinition = ChixSection.CharacterDefinition = (function() {
      function CharacterDefinition(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      CharacterDefinition.prototype._read = function() {
        this.width = this._io.readU2be();
        this.height = this._io.readU2be();
        this.xOffset = this._io.readS2be();
        this.yOffset = this._io.readS2be();
        this.deviceWidth = this._io.readS2be();
        this.bitmapData = this._io.readBytes(Math.floor((this.width * this.height + 7) / 8));
      }

      /**
       * A two-dimensional bitmap, one bit per pixel. It is organized as
       * row-major, top-down, left-to-right. The most significant bit of
       * each byte corresponds to the leftmost or uppermost pixel from all
       * bits of the byte. If a bit is set (1, `true`), the pixel is set to
       * the font color, if a bit is clear (0, `false`), the pixel is
       * transparent.
       * 
       * Rows are **not** padded to byte boundaries (i.e., a
       * single byte may contain bits belonging to multiple rows). The last
       * byte of the bitmap _is_ padded with zero bits at all unused least
       * significant bit positions so that the bitmap ends on a byte
       * boundary.
       */

      return CharacterDefinition;
    })();

    return ChixSection;
  })();

  var DescSection = Grub2Font.DescSection = (function() {
    function DescSection(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    DescSection.prototype._read = function() {
      this.descentInPixels = this._io.readU2be();
    }

    return DescSection;
  })();

  var FamiSection = Grub2Font.FamiSection = (function() {
    function FamiSection(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    FamiSection.prototype._read = function() {
      this.fontFamilyName = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "ASCII");
    }

    return FamiSection;
  })();

  var MaxhSection = Grub2Font.MaxhSection = (function() {
    function MaxhSection(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    MaxhSection.prototype._read = function() {
      this.maximumCharacterHeight = this._io.readU2be();
    }

    return MaxhSection;
  })();

  var MaxwSection = Grub2Font.MaxwSection = (function() {
    function MaxwSection(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    MaxwSection.prototype._read = function() {
      this.maximumCharacterWidth = this._io.readU2be();
    }

    return MaxwSection;
  })();

  var NameSection = Grub2Font.NameSection = (function() {
    function NameSection(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    NameSection.prototype._read = function() {
      this.fontName = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "ASCII");
    }

    return NameSection;
  })();

  var PtszSection = Grub2Font.PtszSection = (function() {
    function PtszSection(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    PtszSection.prototype._read = function() {
      this.fontPointSize = this._io.readU2be();
    }

    return PtszSection;
  })();

  var Section = Grub2Font.Section = (function() {
    function Section(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Section.prototype._read = function() {
      this.sectionType = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
      this.lenBody = this._io.readU4be();
      if (this.sectionType != "DATA") {
        switch (this.sectionType) {
        case "ASCE":
          this._raw_body = this._io.readBytes(this.lenBody);
          var _io__raw_body = new KaitaiStream(this._raw_body);
          this.body = new AsceSection(_io__raw_body, this, this._root);
          break;
        case "CHIX":
          this._raw_body = this._io.readBytes(this.lenBody);
          var _io__raw_body = new KaitaiStream(this._raw_body);
          this.body = new ChixSection(_io__raw_body, this, this._root);
          break;
        case "DESC":
          this._raw_body = this._io.readBytes(this.lenBody);
          var _io__raw_body = new KaitaiStream(this._raw_body);
          this.body = new DescSection(_io__raw_body, this, this._root);
          break;
        case "FAMI":
          this._raw_body = this._io.readBytes(this.lenBody);
          var _io__raw_body = new KaitaiStream(this._raw_body);
          this.body = new FamiSection(_io__raw_body, this, this._root);
          break;
        case "MAXH":
          this._raw_body = this._io.readBytes(this.lenBody);
          var _io__raw_body = new KaitaiStream(this._raw_body);
          this.body = new MaxhSection(_io__raw_body, this, this._root);
          break;
        case "MAXW":
          this._raw_body = this._io.readBytes(this.lenBody);
          var _io__raw_body = new KaitaiStream(this._raw_body);
          this.body = new MaxwSection(_io__raw_body, this, this._root);
          break;
        case "NAME":
          this._raw_body = this._io.readBytes(this.lenBody);
          var _io__raw_body = new KaitaiStream(this._raw_body);
          this.body = new NameSection(_io__raw_body, this, this._root);
          break;
        case "PTSZ":
          this._raw_body = this._io.readBytes(this.lenBody);
          var _io__raw_body = new KaitaiStream(this._raw_body);
          this.body = new PtszSection(_io__raw_body, this, this._root);
          break;
        case "SLAN":
          this._raw_body = this._io.readBytes(this.lenBody);
          var _io__raw_body = new KaitaiStream(this._raw_body);
          this.body = new SlanSection(_io__raw_body, this, this._root);
          break;
        case "WEIG":
          this._raw_body = this._io.readBytes(this.lenBody);
          var _io__raw_body = new KaitaiStream(this._raw_body);
          this.body = new WeigSection(_io__raw_body, this, this._root);
          break;
        default:
          this.body = this._io.readBytes(this.lenBody);
          break;
        }
      }
    }

    /**
     * Should be set to `0xFFFF_FFFF` for `section_type != "DATA"`
     */

    return Section;
  })();

  var SlanSection = Grub2Font.SlanSection = (function() {
    function SlanSection(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    SlanSection.prototype._read = function() {
      this.fontSlant = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "ASCII");
    }

    return SlanSection;
  })();

  var WeigSection = Grub2Font.WeigSection = (function() {
    function WeigSection(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    WeigSection.prototype._read = function() {
      this.fontWeight = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "ASCII");
    }

    return WeigSection;
  })();

  /**
   * The "DATA" section acts as a terminator. The documentation says:
   * "A marker that indicates the remainder of the file is data accessed
   * via the character index (CHIX) section. When reading this font file,
   * the rest of the file can be ignored when scanning the sections."
   */

  return Grub2Font;
})();
Grub2Font_.Grub2Font = Grub2Font;
});
