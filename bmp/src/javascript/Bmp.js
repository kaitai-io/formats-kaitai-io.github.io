// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

var Bmp = (function() {
  Bmp.Compressions = Object.freeze({
    RGB: 0,
    RLE8: 1,
    RLE4: 2,
    BITFIELDS: 3,
    JPEG: 4,
    PNG: 5,
    CMYK: 11,
    CMYK_RLE8: 12,
    CMYK_RLE4: 13,

    0: "RGB",
    1: "RLE8",
    2: "RLE4",
    3: "BITFIELDS",
    4: "JPEG",
    5: "PNG",
    11: "CMYK",
    12: "CMYK_RLE8",
    13: "CMYK_RLE4",
  });

  function Bmp(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Bmp.prototype._read = function() {
    this.fileHdr = new FileHeader(this._io, this, this._root);
    this.lenDibHeader = this._io.readS4le();
    switch (this.lenDibHeader) {
    case 104:
      this._raw_dibHeader = this._io.readBytes((this.lenDibHeader - 4));
      var _io__raw_dibHeader = new KaitaiStream(this._raw_dibHeader);
      this.dibHeader = new BitmapCoreHeader(_io__raw_dibHeader, this, this._root);
      break;
    case 12:
      this._raw_dibHeader = this._io.readBytes((this.lenDibHeader - 4));
      var _io__raw_dibHeader = new KaitaiStream(this._raw_dibHeader);
      this.dibHeader = new BitmapCoreHeader(_io__raw_dibHeader, this, this._root);
      break;
    case 40:
      this._raw_dibHeader = this._io.readBytes((this.lenDibHeader - 4));
      var _io__raw_dibHeader = new KaitaiStream(this._raw_dibHeader);
      this.dibHeader = new BitmapInfoHeader(_io__raw_dibHeader, this, this._root);
      break;
    case 124:
      this._raw_dibHeader = this._io.readBytes((this.lenDibHeader - 4));
      var _io__raw_dibHeader = new KaitaiStream(this._raw_dibHeader);
      this.dibHeader = new BitmapCoreHeader(_io__raw_dibHeader, this, this._root);
      break;
    default:
      this.dibHeader = this._io.readBytes((this.lenDibHeader - 4));
      break;
    }
  }

  /**
   * @see {@link https://msdn.microsoft.com/en-us/library/dd183374.aspx|Source}
   */

  var FileHeader = Bmp.FileHeader = (function() {
    function FileHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FileHeader.prototype._read = function() {
      this.magic = this._io.ensureFixedContents([66, 77]);
      this.lenFile = this._io.readU4le();
      this.reserved1 = this._io.readU2le();
      this.reserved2 = this._io.readU2le();
      this.ofsBitmap = this._io.readS4le();
    }

    /**
     * Offset to actual raw pixel data of the image
     */

    return FileHeader;
  })();

  /**
   * @see {@link https://msdn.microsoft.com/en-us/library/dd183372.aspx|Source}
   */

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

    /**
     * Image width, px
     */

    /**
     * Image height, px
     */

    /**
     * Number of planes for target device, must be 1
     */

    /**
     * Number of bits per pixel that image buffer uses (1, 4, 8, or 24)
     */

    return BitmapCoreHeader;
  })();

  /**
   * @see {@link https://msdn.microsoft.com/en-us/library/dd183376.aspx|Source}
   */

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
      this.lenImage = this._io.readU4le();
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
      this._io.seek(this.fileHdr.ofsBitmap);
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
