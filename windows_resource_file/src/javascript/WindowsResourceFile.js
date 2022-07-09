// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.WindowsResourceFile = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * Windows resource file (.res) are binary bundles of
 * "resources". Resource has some sort of ID (numerical or string),
 * type (predefined or user-defined), and raw value. Resource files can
 * be seen standalone (as .res file), or embedded inside PE executable
 * (.exe, .dll) files.
 * 
 * Typical use cases include:
 * 
 * * providing information about the application (such as title, copyrights, etc)
 * * embedding icon(s) to be displayed in file managers into .exe
 * * adding non-code data into the binary, such as menus, dialog forms,
 *   cursor images, fonts, various misc bitmaps, and locale-aware
 *   strings
 * 
 * Windows provides special API to access "resources" from a binary.
 * 
 * Normally, resources files are created with `rc` compiler: it takes a
 * .rc file (so called "resource-definition script") + all the raw
 * resource binary files for input, and outputs .res file. That .res
 * file can be linked into an .exe / .dll afterwards using a linker.
 * 
 * Internally, resource file is just a sequence of individual resource
 * definitions. RC tool ensures that first resource (#0) is always
 * empty.
 */

var WindowsResourceFile = (function() {
  function WindowsResourceFile(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  WindowsResourceFile.prototype._read = function() {
    this.resources = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.resources.push(new Resource(this._io, this, this._root));
      i++;
    }
  }

  /**
   * Each resource has a `type` and a `name`, which can be used to
   * identify it, and a `value`. Both `type` and `name` can be a
   * number or a string.
   * @see {@link https://docs.microsoft.com/en-us/windows/win32/menurc/resourceheader|Source}
   */

  var Resource = WindowsResourceFile.Resource = (function() {
    Resource.PredefTypes = Object.freeze({
      CURSOR: 1,
      BITMAP: 2,
      ICON: 3,
      MENU: 4,
      DIALOG: 5,
      STRING: 6,
      FONTDIR: 7,
      FONT: 8,
      ACCELERATOR: 9,
      RCDATA: 10,
      MESSAGETABLE: 11,
      GROUP_CURSOR: 12,
      GROUP_ICON: 14,
      VERSION: 16,
      DLGINCLUDE: 17,
      PLUGPLAY: 19,
      VXD: 20,
      ANICURSOR: 21,
      ANIICON: 22,
      HTML: 23,
      MANIFEST: 24,

      1: "CURSOR",
      2: "BITMAP",
      3: "ICON",
      4: "MENU",
      5: "DIALOG",
      6: "STRING",
      7: "FONTDIR",
      8: "FONT",
      9: "ACCELERATOR",
      10: "RCDATA",
      11: "MESSAGETABLE",
      12: "GROUP_CURSOR",
      14: "GROUP_ICON",
      16: "VERSION",
      17: "DLGINCLUDE",
      19: "PLUGPLAY",
      20: "VXD",
      21: "ANICURSOR",
      22: "ANIICON",
      23: "HTML",
      24: "MANIFEST",
    });

    function Resource(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Resource.prototype._read = function() {
      this.valueSize = this._io.readU4le();
      this.headerSize = this._io.readU4le();
      this.type = new UnicodeOrId(this._io, this, this._root);
      this.name = new UnicodeOrId(this._io, this, this._root);
      this.padding1 = this._io.readBytes(KaitaiStream.mod((4 - this._io.pos), 4));
      this.formatVersion = this._io.readU4le();
      this.flags = this._io.readU2le();
      this.language = this._io.readU2le();
      this.valueVersion = this._io.readU4le();
      this.characteristics = this._io.readU4le();
      this.value = this._io.readBytes(this.valueSize);
      this.padding2 = this._io.readBytes(KaitaiStream.mod((4 - this._io.pos), 4));
    }

    /**
     * Numeric type IDs in range of [0..0xff] are reserved for
     * system usage in Windows, and there are some predefined,
     * well-known values in that range. This instance allows to get
     * it as enum value, if applicable.
     */
    Object.defineProperty(Resource.prototype, 'typeAsPredef', {
      get: function() {
        if (this._m_typeAsPredef !== undefined)
          return this._m_typeAsPredef;
        if ( ((!(this.type.isString)) && (this.type.asNumeric <= 255)) ) {
          this._m_typeAsPredef = this.type.asNumeric;
        }
        return this._m_typeAsPredef;
      }
    });

    /**
     * Size of resource value that follows the header
     */

    /**
     * Size of this header (i.e. every field except `value` and an
     * optional padding after it)
     */

    /**
     * Version for value, as specified by a user.
     */

    /**
     * Extra 4 bytes that can be used by user for any purpose.
     */

    return Resource;
  })();

  /**
   * Resources use a special serialization of names and types: they
   * can be either a number or a string.
   * 
   * Use `is_string` to check which kind we've got here, and then use
   * `as_numeric` or `as_string` to get relevant value.
   */

  var UnicodeOrId = WindowsResourceFile.UnicodeOrId = (function() {
    function UnicodeOrId(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    UnicodeOrId.prototype._read = function() {
      if (this.savePos1 >= 0) {
        this.first = this._io.readU2le();
      }
      if (!(this.isString)) {
        this.asNumeric = this._io.readU2le();
      }
      if (this.isString) {
        this.rest = [];
        var i = 0;
        do {
          var _ = this._io.readU2le();
          this.rest.push(_);
          i++;
        } while (!(_ == 0));
      }
      if ( ((this.isString) && (this.savePos2 >= 0)) ) {
        this.noop = this._io.readBytes(0);
      }
    }
    Object.defineProperty(UnicodeOrId.prototype, 'savePos1', {
      get: function() {
        if (this._m_savePos1 !== undefined)
          return this._m_savePos1;
        this._m_savePos1 = this._io.pos;
        return this._m_savePos1;
      }
    });
    Object.defineProperty(UnicodeOrId.prototype, 'savePos2', {
      get: function() {
        if (this._m_savePos2 !== undefined)
          return this._m_savePos2;
        this._m_savePos2 = this._io.pos;
        return this._m_savePos2;
      }
    });
    Object.defineProperty(UnicodeOrId.prototype, 'isString', {
      get: function() {
        if (this._m_isString !== undefined)
          return this._m_isString;
        this._m_isString = this.first != 65535;
        return this._m_isString;
      }
    });
    Object.defineProperty(UnicodeOrId.prototype, 'asString', {
      get: function() {
        if (this._m_asString !== undefined)
          return this._m_asString;
        if (this.isString) {
          var _pos = this._io.pos;
          this._io.seek(this.savePos1);
          this._m_asString = KaitaiStream.bytesToStr(this._io.readBytes(((this.savePos2 - this.savePos1) - 2)), "UTF-16LE");
          this._io.seek(_pos);
        }
        return this._m_asString;
      }
    });

    return UnicodeOrId;
  })();

  return WindowsResourceFile;
})();
return WindowsResourceFile;
}));
