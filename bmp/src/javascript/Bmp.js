// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

var Bmp = (function() {
  function Bmp(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Bmp.prototype._read = function() {
    this.fileHdr = new FileHeader(this._io, this, this._root);
    this.dibHdr = new DibHeader(this._io, this, this._root);
  }

  var FileHeader = Bmp.FileHeader = (function() {
    function FileHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FileHeader.prototype._read = function() {
      this.fileType = this._io.readBytes(2);
      this.fileSize = this._io.readU4le();
      this.reserved1 = this._io.readU2le();
      this.reserved2 = this._io.readU2le();
      this.bitmapOfs = this._io.readS4le();
    }

    return FileHeader;
  })();

  var DibHeader = Bmp.DibHeader = (function() {
    function DibHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DibHeader.prototype._read = function() {
      this.dibHeaderSize = this._io.readS4le();
      if (this.dibHeaderSize == 12) {
        this._raw_bitmapCoreHeader = this._io.readBytes((this.dibHeaderSize - 4));
        var _io__raw_bitmapCoreHeader = new KaitaiStream(this._raw_bitmapCoreHeader);
        this.bitmapCoreHeader = new BitmapCoreHeader(_io__raw_bitmapCoreHeader, this, this._root);
      }
      if (this.dibHeaderSize == 40) {
        this._raw_bitmapInfoHeader = this._io.readBytes((this.dibHeaderSize - 4));
        var _io__raw_bitmapInfoHeader = new KaitaiStream(this._raw_bitmapInfoHeader);
        this.bitmapInfoHeader = new BitmapInfoHeader(_io__raw_bitmapInfoHeader, this, this._root);
      }
      if (this.dibHeaderSize == 124) {
        this._raw_bitmapV5Header = this._io.readBytes((this.dibHeaderSize - 4));
        var _io__raw_bitmapV5Header = new KaitaiStream(this._raw_bitmapV5Header);
        this.bitmapV5Header = new BitmapCoreHeader(_io__raw_bitmapV5Header, this, this._root);
      }
      if ( ((this.dibHeaderSize != 12) && (this.dibHeaderSize != 40) && (this.dibHeaderSize != 124)) ) {
        this.dibHeaderBody = this._io.readBytes((this.dibHeaderSize - 4));
      }
    }

    return DibHeader;
  })();

  var BitmapCoreHeader = Bmp.BitmapCoreHeader = (function() {
    function BitmapCoreHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BitmapCoreHeader.prototype._read = function() {
      this.imageWidth = this._io.readU2le();
      this.imageHeight = this._io.readU2le();
      this.numPlanes = this._io.readU2le();
      this.bitsPerPixel = this._io.readU2le();
    }

    return BitmapCoreHeader;
  })();

  var BitmapInfoHeader = Bmp.BitmapInfoHeader = (function() {
    function BitmapInfoHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BitmapInfoHeader.prototype._read = function() {
      this.imageWidth = this._io.readU4le();
      this.imageHeight = this._io.readU4le();
      this.numPlanes = this._io.readU2le();
      this.bitsPerPixel = this._io.readU2le();
      this.compression = this._io.readU4le();
      this.sizeImage = this._io.readU4le();
      this.xPxPerM = this._io.readU4le();
      this.yPxPerM = this._io.readU4le();
      this.numColorsUsed = this._io.readU4le();
      this.numColorsImportant = this._io.readU4le();
    }

    return BitmapInfoHeader;
  })();
  Object.defineProperty(Bmp.prototype, 'image', {
    get: function() {
      if (this._m_image !== undefined)
        return this._m_image;
      var _pos = this._io.pos;
      this._io.seek(this.fileHdr.bitmapOfs);
      this._m_image = this._io.readBytesFull();
      this._io.seek(_pos);
      return this._m_image;
    }
  });

  return Bmp;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Bmp', [], function() {
    return Bmp;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Bmp;
}
