// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Respack = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * Resource file found in CPB firmware archives, mostly used on older CoolPad
 * phones and/or tablets. The only observed files are called "ResPack.cfg".
 */

var Respack = (function() {
  function Respack(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Respack.prototype._read = function() {
    this.header = new Header(this._io, this, this._root);
    this.json = KaitaiStream.bytesToStr(this._io.readBytes(this.header.lenJson), "UTF-8");
  }

  var Header = Respack.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.magic = this._io.readBytes(2);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [82, 83]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([82, 83], this.magic, this._io, "/types/header/seq/0");
      }
      this.unknown = this._io.readBytes(8);
      this.lenJson = this._io.readU4le();
      this.md5 = KaitaiStream.bytesToStr(this._io.readBytes(32), "UTF-8");
    }

    /**
     * MD5 of data that follows the header
     */

    return Header;
  })();

  return Respack;
})();
return Respack;
}));
