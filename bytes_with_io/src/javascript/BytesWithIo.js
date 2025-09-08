// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.BytesWithIo || (root.BytesWithIo = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (BytesWithIo_, KaitaiStream) {
/**
 * Helper type to work around Kaitai Struct not providing an `_io` member for plain byte arrays.
 */

var BytesWithIo = (function() {
  function BytesWithIo(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  BytesWithIo.prototype._read = function() {
    this.data = this._io.readBytesFull();
  }

  /**
   * The actual data.
   */

  return BytesWithIo;
})();
BytesWithIo_.BytesWithIo = BytesWithIo;
});
