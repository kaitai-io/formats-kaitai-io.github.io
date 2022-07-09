// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Utf8String = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * UTF-8 is a popular character encoding scheme that allows to
 * represent strings as sequence of code points defined in Unicode
 * standard. Its features are:
 * 
 * * variable width (i.e. one code point might be represented by 1 to 4
 *   bytes)
 * * backward compatiblity with ASCII
 * * basic validity checking (and thus distinguishing from other legacy
 *   8-bit encodings)
 * * maintaining sort order of codepoints if sorted as a byte array
 * 
 * WARNING: For the vast majority of practical purposes of format
 * definitions in Kaitai Struct, you'd likely NOT want to use this and
 * rather just use `type: str` with `encoding: utf-8`. That will use
 * native string implementations, which are most likely more efficient
 * and will give you native language strings, rather than an array of
 * individual codepoints.  This format definition is provided mostly
 * for educational / research purposes.
 */

var Utf8String = (function() {
  function Utf8String(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Utf8String.prototype._read = function() {
    this.codepoints = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.codepoints.push(new Utf8Codepoint(this._io, this, this._root, this._io.pos));
      i++;
    }
  }

  var Utf8Codepoint = Utf8String.Utf8Codepoint = (function() {
    function Utf8Codepoint(_io, _parent, _root, ofs) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.ofs = ofs;

      this._read();
    }
    Utf8Codepoint.prototype._read = function() {
      this.bytes = this._io.readBytes(this.lenBytes);
    }
    Object.defineProperty(Utf8Codepoint.prototype, 'raw1', {
      get: function() {
        if (this._m_raw1 !== undefined)
          return this._m_raw1;
        if (this.lenBytes >= 2) {
          this._m_raw1 = (this.bytes[1] & 63);
        }
        return this._m_raw1;
      }
    });
    Object.defineProperty(Utf8Codepoint.prototype, 'lenBytes', {
      get: function() {
        if (this._m_lenBytes !== undefined)
          return this._m_lenBytes;
        this._m_lenBytes = ((this.byte0 & 128) == 0 ? 1 : ((this.byte0 & 224) == 192 ? 2 : ((this.byte0 & 240) == 224 ? 3 : ((this.byte0 & 248) == 240 ? 4 : -1))));
        return this._m_lenBytes;
      }
    });
    Object.defineProperty(Utf8Codepoint.prototype, 'raw3', {
      get: function() {
        if (this._m_raw3 !== undefined)
          return this._m_raw3;
        if (this.lenBytes >= 4) {
          this._m_raw3 = (this.bytes[3] & 63);
        }
        return this._m_raw3;
      }
    });
    Object.defineProperty(Utf8Codepoint.prototype, 'valueAsInt', {
      get: function() {
        if (this._m_valueAsInt !== undefined)
          return this._m_valueAsInt;
        this._m_valueAsInt = (this.lenBytes == 1 ? this.raw0 : (this.lenBytes == 2 ? ((this.raw0 << 6) | this.raw1) : (this.lenBytes == 3 ? (((this.raw0 << 12) | (this.raw1 << 6)) | this.raw2) : (this.lenBytes == 4 ? ((((this.raw0 << 18) | (this.raw1 << 12)) | (this.raw2 << 6)) | this.raw3) : -1))));
        return this._m_valueAsInt;
      }
    });
    Object.defineProperty(Utf8Codepoint.prototype, 'raw0', {
      get: function() {
        if (this._m_raw0 !== undefined)
          return this._m_raw0;
        this._m_raw0 = (this.bytes[0] & (this.lenBytes == 1 ? 127 : (this.lenBytes == 2 ? 31 : (this.lenBytes == 3 ? 15 : (this.lenBytes == 4 ? 7 : 0)))));
        return this._m_raw0;
      }
    });
    Object.defineProperty(Utf8Codepoint.prototype, 'byte0', {
      get: function() {
        if (this._m_byte0 !== undefined)
          return this._m_byte0;
        var _pos = this._io.pos;
        this._io.seek(this.ofs);
        this._m_byte0 = this._io.readU1();
        this._io.seek(_pos);
        return this._m_byte0;
      }
    });
    Object.defineProperty(Utf8Codepoint.prototype, 'raw2', {
      get: function() {
        if (this._m_raw2 !== undefined)
          return this._m_raw2;
        if (this.lenBytes >= 3) {
          this._m_raw2 = (this.bytes[2] & 63);
        }
        return this._m_raw2;
      }
    });

    return Utf8Codepoint;
  })();

  return Utf8String;
})();
return Utf8String;
}));
