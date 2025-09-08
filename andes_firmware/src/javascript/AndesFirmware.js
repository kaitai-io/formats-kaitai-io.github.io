// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.AndesFirmware || (root.AndesFirmware = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (AndesFirmware_, KaitaiStream) {
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
      this._root = _root;

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
AndesFirmware_.AndesFirmware = AndesFirmware;
});
