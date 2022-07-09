// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.BytesWithIo = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
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
return BytesWithIo;
}));
