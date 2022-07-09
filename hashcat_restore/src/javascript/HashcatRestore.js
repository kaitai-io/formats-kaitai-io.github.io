// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.HashcatRestore = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * @see {@link https://hashcat.net/wiki/doku.php?id=restore|Source}
 */

var HashcatRestore = (function() {
  function HashcatRestore(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  HashcatRestore.prototype._read = function() {
    this.version = this._io.readU4le();
    this.cwd = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(256), 0, false), "UTF-8");
    this.dictsPos = this._io.readU4le();
    this.masksPos = this._io.readU4le();
    this.padding = this._io.readBytes(4);
    this.currentRestorePoint = this._io.readU8le();
    this.argc = this._io.readU4le();
    this.padding2 = this._io.readBytes(12);
    this.argv = [];
    for (var i = 0; i < this.argc; i++) {
      this.argv.push(KaitaiStream.bytesToStr(this._io.readBytesTerm(10, false, true, true), "UTF-8"));
    }
  }

  return HashcatRestore;
})();
return HashcatRestore;
}));
