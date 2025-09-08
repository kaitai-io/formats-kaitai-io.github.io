// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.AllegroDat || (root.AllegroDat = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (AllegroDat_, KaitaiStream) {
/**
 * Allegro library for C (mostly used for game and multimedia apps
 * programming) used its own container file format.
 * 
 * In general, it allows storage of arbitrary binary data blocks
 * bundled together with some simple key-value style metadata
 * ("properties") for every block. Allegro also pre-defines some simple
 * formats for bitmaps, fonts, MIDI music, sound samples and
 * palettes. Allegro library v4.0+ also support LZSS compression.
 * 
 * This spec applies to Allegro data files for library versions 2.2 up
 * to 4.4.
 * @see {@link https://liballeg.org/stabledocs/en/datafile.html|Source}
 */

var AllegroDat = (function() {
  AllegroDat.PackEnum = Object.freeze({
    UNPACKED: 1936484398,

    1936484398: "UNPACKED",
  });

  function AllegroDat(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  AllegroDat.prototype._read = function() {
    this.packMagic = this._io.readU4be();
    this.datMagic = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.datMagic, new Uint8Array([65, 76, 76, 46])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([65, 76, 76, 46]), this.datMagic, this._io, "/seq/1");
    }
    this.numObjects = this._io.readU4be();
    this.objects = [];
    for (var i = 0; i < this.numObjects; i++) {
      this.objects.push(new DatObject(this._io, this, this._root));
    }
  }

  var DatBitmap = AllegroDat.DatBitmap = (function() {
    function DatBitmap(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    DatBitmap.prototype._read = function() {
      this.bitsPerPixel = this._io.readS2be();
      this.width = this._io.readU2be();
      this.height = this._io.readU2be();
      this.image = this._io.readBytesFull();
    }

    return DatBitmap;
  })();

  var DatFont = AllegroDat.DatFont = (function() {
    function DatFont(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    DatFont.prototype._read = function() {
      this.fontSize = this._io.readS2be();
      switch (this.fontSize) {
      case 0:
        this.body = new DatFont39(this._io, this, this._root);
        break;
      case 16:
        this.body = new DatFont16(this._io, this, this._root);
        break;
      case 8:
        this.body = new DatFont8(this._io, this, this._root);
        break;
      }
    }

    return DatFont;
  })();

  /**
   * Simple monochrome monospaced font, 95 characters, 8x16 px
   * characters.
   */

  var DatFont16 = AllegroDat.DatFont16 = (function() {
    function DatFont16(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    DatFont16.prototype._read = function() {
      this.chars = [];
      for (var i = 0; i < 95; i++) {
        this.chars.push(this._io.readBytes(16));
      }
    }

    return DatFont16;
  })();

  /**
   * New bitmap font format introduced since Allegro 3.9: allows
   * flexible designation of character ranges, 8-bit colored
   * characters, etc.
   */

  var DatFont39 = AllegroDat.DatFont39 = (function() {
    function DatFont39(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    DatFont39.prototype._read = function() {
      this.numRanges = this._io.readS2be();
      this.ranges = [];
      for (var i = 0; i < this.numRanges; i++) {
        this.ranges.push(new Range(this._io, this, this._root));
      }
    }

    var FontChar = DatFont39.FontChar = (function() {
      function FontChar(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      FontChar.prototype._read = function() {
        this.width = this._io.readU2be();
        this.height = this._io.readU2be();
        this.body = this._io.readBytes(this.width * this.height);
      }

      return FontChar;
    })();

    var Range = DatFont39.Range = (function() {
      function Range(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      Range.prototype._read = function() {
        this.mono = this._io.readU1();
        this.startChar = this._io.readU4be();
        this.endChar = this._io.readU4be();
        this.chars = [];
        for (var i = 0; i < (this.endChar - this.startChar) + 1; i++) {
          this.chars.push(new FontChar(this._io, this, this._root));
        }
      }

      /**
       * First character in range
       */

      /**
       * Last character in range (inclusive)
       */

      return Range;
    })();

    return DatFont39;
  })();

  /**
   * Simple monochrome monospaced font, 95 characters, 8x8 px
   * characters.
   */

  var DatFont8 = AllegroDat.DatFont8 = (function() {
    function DatFont8(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    DatFont8.prototype._read = function() {
      this.chars = [];
      for (var i = 0; i < 95; i++) {
        this.chars.push(this._io.readBytes(8));
      }
    }

    return DatFont8;
  })();

  var DatObject = AllegroDat.DatObject = (function() {
    function DatObject(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    DatObject.prototype._read = function() {
      this.properties = [];
      var i = 0;
      do {
        var _ = new Property(this._io, this, this._root);
        this.properties.push(_);
        i++;
      } while (!(!(_.isValid)));
      this.lenCompressed = this._io.readS4be();
      this.lenUncompressed = this._io.readS4be();
      switch (this.type) {
      case "BMP ":
        this._raw_body = this._io.readBytes(this.lenCompressed);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new DatBitmap(_io__raw_body, this, this._root);
        break;
      case "FONT":
        this._raw_body = this._io.readBytes(this.lenCompressed);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new DatFont(_io__raw_body, this, this._root);
        break;
      case "RLE ":
        this._raw_body = this._io.readBytes(this.lenCompressed);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new DatRleSprite(_io__raw_body, this, this._root);
        break;
      default:
        this.body = this._io.readBytes(this.lenCompressed);
        break;
      }
    }
    Object.defineProperty(DatObject.prototype, 'type', {
      get: function() {
        if (this._m_type !== undefined)
          return this._m_type;
        this._m_type = this.properties[this.properties.length - 1].magic;
        return this._m_type;
      }
    });

    return DatObject;
  })();

  var DatRleSprite = AllegroDat.DatRleSprite = (function() {
    function DatRleSprite(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    DatRleSprite.prototype._read = function() {
      this.bitsPerPixel = this._io.readS2be();
      this.width = this._io.readU2be();
      this.height = this._io.readU2be();
      this.lenImage = this._io.readU4be();
      this.image = this._io.readBytesFull();
    }

    return DatRleSprite;
  })();

  var Property = AllegroDat.Property = (function() {
    function Property(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Property.prototype._read = function() {
      this.magic = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
      if (this.isValid) {
        this.type = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
      }
      if (this.isValid) {
        this.lenBody = this._io.readU4be();
      }
      if (this.isValid) {
        this.body = KaitaiStream.bytesToStr(this._io.readBytes(this.lenBody), "UTF-8");
      }
    }
    Object.defineProperty(Property.prototype, 'isValid', {
      get: function() {
        if (this._m_isValid !== undefined)
          return this._m_isValid;
        this._m_isValid = this.magic == "prop";
        return this._m_isValid;
      }
    });

    return Property;
  })();

  return AllegroDat;
})();
AllegroDat_.AllegroDat = AllegroDat;
});
