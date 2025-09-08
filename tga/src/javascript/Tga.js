// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Tga || (root.Tga = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Tga_, KaitaiStream) {
/**
 * TGA (AKA Truevision TGA, AKA TARGA), is a raster image file format created by Truevision. It supports up to 32 bits per pixel (three 8-bit RGB channels + 8-bit alpha channel), color mapping and optional lossless RLE compression.
 * @see {@link https://www.dca.fee.unicamp.br/~martino/disciplinas/ea978/tgaffs.pdf|Source}
 */

var Tga = (function() {
  Tga.ColorMapEnum = Object.freeze({
    NO_COLOR_MAP: 0,
    HAS_COLOR_MAP: 1,

    0: "NO_COLOR_MAP",
    1: "HAS_COLOR_MAP",
  });

  Tga.ImageTypeEnum = Object.freeze({
    NO_IMAGE_DATA: 0,
    UNCOMP_COLOR_MAPPED: 1,
    UNCOMP_TRUE_COLOR: 2,
    UNCOMP_BW: 3,
    RLE_COLOR_MAPPED: 9,
    RLE_TRUE_COLOR: 10,
    RLE_BW: 11,

    0: "NO_IMAGE_DATA",
    1: "UNCOMP_COLOR_MAPPED",
    2: "UNCOMP_TRUE_COLOR",
    3: "UNCOMP_BW",
    9: "RLE_COLOR_MAPPED",
    10: "RLE_TRUE_COLOR",
    11: "RLE_BW",
  });

  function Tga(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Tga.prototype._read = function() {
    this.imageIdLen = this._io.readU1();
    this.colorMapType = this._io.readU1();
    this.imageType = this._io.readU1();
    this.colorMapOfs = this._io.readU2le();
    this.numColorMap = this._io.readU2le();
    this.colorMapDepth = this._io.readU1();
    this.xOffset = this._io.readU2le();
    this.yOffset = this._io.readU2le();
    this.width = this._io.readU2le();
    this.height = this._io.readU2le();
    this.imageDepth = this._io.readU1();
    this.imgDescriptor = this._io.readU1();
    this.imageId = this._io.readBytes(this.imageIdLen);
    if (this.colorMapType == Tga.ColorMapEnum.HAS_COLOR_MAP) {
      this.colorMap = [];
      for (var i = 0; i < this.numColorMap; i++) {
        this.colorMap.push(this._io.readBytes(Math.floor((this.colorMapDepth + 7) / 8)));
      }
    }
  }

  var TgaExtArea = Tga.TgaExtArea = (function() {
    function TgaExtArea(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    TgaExtArea.prototype._read = function() {
      this.extAreaSize = this._io.readU2le();
      this.authorName = KaitaiStream.bytesToStr(this._io.readBytes(41), "ASCII");
      this.comments = [];
      for (var i = 0; i < 4; i++) {
        this.comments.push(KaitaiStream.bytesToStr(this._io.readBytes(81), "ASCII"));
      }
      this.timestamp = this._io.readBytes(12);
      this.jobId = KaitaiStream.bytesToStr(this._io.readBytes(41), "ASCII");
      this.jobTime = KaitaiStream.bytesToStr(this._io.readBytes(6), "ASCII");
      this.softwareId = KaitaiStream.bytesToStr(this._io.readBytes(41), "ASCII");
      this.softwareVersion = this._io.readBytes(3);
      this.keyColor = this._io.readU4le();
      this.pixelAspectRatio = this._io.readU4le();
      this.gammaValue = this._io.readU4le();
      this.colorCorrOfs = this._io.readU4le();
      this.postageStampOfs = this._io.readU4le();
      this.scanLineOfs = this._io.readU4le();
      this.attributes = this._io.readU1();
    }

    /**
     * Extension area size in bytes (always 495)
     */

    /**
     * Comments, organized as four lines, each consisting of 80 characters plus a NULL
     */

    /**
     * Image creation date / time
     */

    /**
     * Internal job ID, to be used in image workflow systems
     */

    /**
     * Hours, minutes and seconds spent creating the file (for billing, etc.)
     */

    /**
     * The application that created the file.
     */

    /**
     * Number of bytes from the beginning of the file to the color correction table if present
     */

    /**
     * Number of bytes from the beginning of the file to the postage stamp image if present
     */

    /**
     * Number of bytes from the beginning of the file to the scan lines table if present
     */

    /**
     * Specifies the alpha channel
     */

    return TgaExtArea;
  })();

  var TgaFooter = Tga.TgaFooter = (function() {
    function TgaFooter(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    TgaFooter.prototype._read = function() {
      this.extAreaOfs = this._io.readU4le();
      this.devDirOfs = this._io.readU4le();
      this.versionMagic = this._io.readBytes(18);
    }
    Object.defineProperty(TgaFooter.prototype, 'extArea', {
      get: function() {
        if (this._m_extArea !== undefined)
          return this._m_extArea;
        if (this.isValid) {
          var _pos = this._io.pos;
          this._io.seek(this.extAreaOfs);
          this._m_extArea = new TgaExtArea(this._io, this, this._root);
          this._io.seek(_pos);
        }
        return this._m_extArea;
      }
    });
    Object.defineProperty(TgaFooter.prototype, 'isValid', {
      get: function() {
        if (this._m_isValid !== undefined)
          return this._m_isValid;
        this._m_isValid = (KaitaiStream.byteArrayCompare(this.versionMagic, new Uint8Array([84, 82, 85, 69, 86, 73, 83, 73, 79, 78, 45, 88, 70, 73, 76, 69, 46, 0])) == 0);
        return this._m_isValid;
      }
    });

    /**
     * Offset to extension area
     */

    /**
     * Offset to developer directory
     */

    return TgaFooter;
  })();
  Object.defineProperty(Tga.prototype, 'footer', {
    get: function() {
      if (this._m_footer !== undefined)
        return this._m_footer;
      var _pos = this._io.pos;
      this._io.seek(this._io.size - 26);
      this._m_footer = new TgaFooter(this._io, this, this._root);
      this._io.seek(_pos);
      return this._m_footer;
    }
  });

  /**
   * Number of entries in a color map
   */

  /**
   * Number of bits in a each color maps entry
   */

  /**
   * Width of the image, in pixels
   */

  /**
   * Height of the image, in pixels
   */

  /**
   * Arbitrary application-specific information that is used to
   * identify image. May contain text or some binary data.
   */

  /**
   * Color map
   */

  return Tga;
})();
Tga_.Tga = Tga;
});
