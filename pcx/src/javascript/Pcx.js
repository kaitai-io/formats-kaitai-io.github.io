// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

var Pcx = (function() {
  function Pcx(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Pcx.prototype._read = function() {
    this._raw_hdr = this._io.readBytes(128);
    var _io__raw_hdr = new KaitaiStream(this._raw_hdr);
    this.hdr = new Header(_io__raw_hdr, this, this._root);
  }

  var Header = Pcx.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.manufacturer = this._io.readU1();
      this.version = this._io.readU1();
      this.encoding = this._io.readU1();
      this.bitsPerPixel = this._io.readU1();
      this.imgXMin = this._io.readU2le();
      this.imgYMin = this._io.readU2le();
      this.imgXMax = this._io.readU2le();
      this.imgYMax = this._io.readU2le();
      this.hdpi = this._io.readU2le();
      this.vdpi = this._io.readU2le();
      this.colormap = this._io.readBytes(48);
      this.reserved = this._io.readBytes(1);
      this.numPlanes = this._io.readU1();
      this.bytesPerLine = this._io.readU2le();
      this.paletteInfo = this._io.readU2le();
      this.hScreenSize = this._io.readU2le();
      this.vScreenSize = this._io.readU2le();
    }

    return Header;
  })();

  return Pcx;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Pcx', [], function() {
    return Pcx;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Pcx;
}
