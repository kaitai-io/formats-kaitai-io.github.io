// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Firmware image found with MediaTek MT76xx wifi chipsets.
 */

var AndesFirmware = (function() {
  function AndesFirmware(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  AndesFirmware.prototype._read = function() {
    this._raw_imageHeader = this._io.readBytes(32);
    var _io__raw_imageHeader = new KaitaiStream(this._raw_imageHeader);
    this.imageHeader = new ImageHeader(_io__raw_imageHeader, this, this._root);
    this.ilm = this._io.readBytes(this.imageHeader.ilmLen);
    this.dlm = this._io.readBytes(this.imageHeader.dlmLen);
  }

  var ImageHeader = AndesFirmware.ImageHeader = (function() {
    function ImageHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ImageHeader.prototype._read = function() {
      this.ilmLen = this._io.readU4le();
      this.dlmLen = this._io.readU4le();
      this.fwVer = this._io.readU2le();
      this.buildVer = this._io.readU2le();
      this.extra = this._io.readU4le();
      this.buildTime = KaitaiStream.bytesToStr(this._io.readBytes(16), "UTF-8");
    }

    return ImageHeader;
  })();

  return AndesFirmware;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('AndesFirmware', [], function() {
    return AndesFirmware;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = AndesFirmware;
}
