// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.AppleSingleDouble = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * AppleSingle and AppleDouble files are used by certain Mac
 * applications (e.g. Finder) to store Mac-specific file attributes on
 * filesystems that do not support that.
 * 
 * Syntactically, both formats are the same, the only difference is how
 * they are being used:
 * 
 * * AppleSingle means that only one file will be created on external
 *   filesystem that will hold both the data (AKA "data fork" in Apple
 *   terminology), and the attributes (AKA "resource fork").
 * * AppleDouble means that two files will be created: a normal file
 *   that keeps the data ("data fork") is kept separately from an
 *   auxiliary file that contains attributes ("resource fork"), which
 *   is kept with the same name, but starting with an extra dot and
 *   underscore `._` to keep it hidden.
 * 
 * In modern practice (Mac OS X), Finder only uses AppleDouble to keep
 * compatibility with other OSes, as virtually nobody outside of Mac
 * understands how to access data in AppleSingle container.
 * @see {@link http://kaiser-edv.de/documents/AppleSingle_AppleDouble.pdf|Source}
 */

var AppleSingleDouble = (function() {
  AppleSingleDouble.FileType = Object.freeze({
    APPLE_SINGLE: 333312,
    APPLE_DOUBLE: 333319,

    333312: "APPLE_SINGLE",
    333319: "APPLE_DOUBLE",
  });

  function AppleSingleDouble(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  AppleSingleDouble.prototype._read = function() {
    this.magic = this._io.readU4be();
    this.version = this._io.readU4be();
    this.reserved = this._io.readBytes(16);
    this.numEntries = this._io.readU2be();
    this.entries = [];
    for (var i = 0; i < this.numEntries; i++) {
      this.entries.push(new Entry(this._io, this, this._root));
    }
  }

  var Entry = AppleSingleDouble.Entry = (function() {
    Entry.Types = Object.freeze({
      DATA_FORK: 1,
      RESOURCE_FORK: 2,
      REAL_NAME: 3,
      COMMENT: 4,
      ICON_BW: 5,
      ICON_COLOR: 6,
      FILE_DATES_INFO: 8,
      FINDER_INFO: 9,
      MACINTOSH_FILE_INFO: 10,
      PRODOS_FILE_INFO: 11,
      MSDOS_FILE_INFO: 12,
      AFP_SHORT_NAME: 13,
      AFP_FILE_INFO: 14,
      AFP_DIRECTORY_ID: 15,

      1: "DATA_FORK",
      2: "RESOURCE_FORK",
      3: "REAL_NAME",
      4: "COMMENT",
      5: "ICON_BW",
      6: "ICON_COLOR",
      8: "FILE_DATES_INFO",
      9: "FINDER_INFO",
      10: "MACINTOSH_FILE_INFO",
      11: "PRODOS_FILE_INFO",
      12: "MSDOS_FILE_INFO",
      13: "AFP_SHORT_NAME",
      14: "AFP_FILE_INFO",
      15: "AFP_DIRECTORY_ID",
    });

    function Entry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Entry.prototype._read = function() {
      this.type = this._io.readU4be();
      this.ofsBody = this._io.readU4be();
      this.lenBody = this._io.readU4be();
    }
    Object.defineProperty(Entry.prototype, 'body', {
      get: function() {
        if (this._m_body !== undefined)
          return this._m_body;
        var _pos = this._io.pos;
        this._io.seek(this.ofsBody);
        switch (this.type) {
        case AppleSingleDouble.Entry.Types.FINDER_INFO:
          this._raw__m_body = this._io.readBytes(this.lenBody);
          var _io__raw__m_body = new KaitaiStream(this._raw__m_body);
          this._m_body = new FinderInfo(_io__raw__m_body, this, this._root);
          break;
        default:
          this._m_body = this._io.readBytes(this.lenBody);
          break;
        }
        this._io.seek(_pos);
        return this._m_body;
      }
    });

    return Entry;
  })();

  /**
   * Information specific to Finder
   * @see older Inside Macintosh, Volume II page 84 or Volume IV page 104.
   */

  var FinderInfo = AppleSingleDouble.FinderInfo = (function() {
    function FinderInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FinderInfo.prototype._read = function() {
      this.fileType = this._io.readBytes(4);
      this.fileCreator = this._io.readBytes(4);
      this.flags = this._io.readU2be();
      this.location = new Point(this._io, this, this._root);
      this.folderId = this._io.readU2be();
    }

    /**
     * File icon's coordinates when displaying this folder.
     */

    /**
     * File folder ID (=window).
     */

    return FinderInfo;
  })();

  /**
   * Specifies 2D coordinate in QuickDraw grid.
   */

  var Point = AppleSingleDouble.Point = (function() {
    function Point(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Point.prototype._read = function() {
      this.x = this._io.readU2be();
      this.y = this._io.readU2be();
    }

    return Point;
  })();

  /**
   * Must be all 0.
   */

  return AppleSingleDouble;
})();
return AppleSingleDouble;
}));
