// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './ExifBe', './ExifLe'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./ExifBe'), require('./ExifLe'));
  } else {
    root.Exif = factory(root.KaitaiStream, root.ExifBe, root.ExifLe);
  }
}(this, function (KaitaiStream, ExifBe, ExifLe) {
var Exif = (function() {
  function Exif(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Exif.prototype._read = function() {
    this.endianness = this._io.readU2le();
    switch (this.endianness) {
    case 18761:
      this.body = new ExifLe(this._io, this, null);
      break;
    case 19789:
      this.body = new ExifBe(this._io, this, null);
      break;
    }
  }

  return Exif;
})();
return Exif;
}));
