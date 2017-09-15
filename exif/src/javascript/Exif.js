// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

if (typeof require === 'function')
  var ExifBe = require('./ExifBe.js');

if (typeof require === 'function')
  var ExifLe = require('./ExifLe.js');

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

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Exif', [], function() {
    return Exif;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Exif;
}
