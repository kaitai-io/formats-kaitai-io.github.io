// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Xwd = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * xwd is a file format written by eponymous X11 screen capture
 * application (xwd stands for "X Window Dump"). Typically, an average
 * user transforms xwd format into something more widespread by any of
 * `xwdtopnm` and `pnmto...` utilities right away.
 * 
 * xwd format itself provides a raw uncompressed bitmap with some
 * metainformation, like pixel format, width, height, bit depth,
 * etc. Note that technically format includes machine-dependent fields
 * and thus is probably a poor choice for true cross-platform usage.
 */

var Xwd = (function() {
  Xwd.PixmapFormat = Object.freeze({
    X_Y_BITMAP: 0,
    X_Y_PIXMAP: 1,
    Z_PIXMAP: 2,

    0: "X_Y_BITMAP",
    1: "X_Y_PIXMAP",
    2: "Z_PIXMAP",
  });

  Xwd.ByteOrder = Object.freeze({
    LE: 0,
    BE: 1,

    0: "LE",
    1: "BE",
  });

  Xwd.VisualClass = Object.freeze({
    STATIC_GRAY: 0,
    GRAY_SCALE: 1,
    STATIC_COLOR: 2,
    PSEUDO_COLOR: 3,
    TRUE_COLOR: 4,
    DIRECT_COLOR: 5,

    0: "STATIC_GRAY",
    1: "GRAY_SCALE",
    2: "STATIC_COLOR",
    3: "PSEUDO_COLOR",
    4: "TRUE_COLOR",
    5: "DIRECT_COLOR",
  });

  function Xwd(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Xwd.prototype._read = function() {
    this.lenHeader = this._io.readU4be();
    this._raw_hdr = this._io.readBytes((this.lenHeader - 4));
    var _io__raw_hdr = new KaitaiStream(this._raw_hdr);
    this.hdr = new Header(_io__raw_hdr, this, this._root);
    this._raw_colorMap = [];
    this.colorMap = [];
    for (var i = 0; i < this.hdr.colorMapEntries; i++) {
      this._raw_colorMap.push(this._io.readBytes(12));
      var _io__raw_colorMap = new KaitaiStream(this._raw_colorMap[i]);
      this.colorMap.push(new ColorMapEntry(_io__raw_colorMap, this, this._root));
    }
  }

  var Header = Xwd.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.fileVersion = this._io.readU4be();
      this.pixmapFormat = this._io.readU4be();
      this.pixmapDepth = this._io.readU4be();
      this.pixmapWidth = this._io.readU4be();
      this.pixmapHeight = this._io.readU4be();
      this.xOffset = this._io.readU4be();
      this.byteOrder = this._io.readU4be();
      this.bitmapUnit = this._io.readU4be();
      this.bitmapBitOrder = this._io.readU4be();
      this.bitmapPad = this._io.readU4be();
      this.bitsPerPixel = this._io.readU4be();
      this.bytesPerLine = this._io.readU4be();
      this.visualClass = this._io.readU4be();
      this.redMask = this._io.readU4be();
      this.greenMask = this._io.readU4be();
      this.blueMask = this._io.readU4be();
      this.bitsPerRgb = this._io.readU4be();
      this.numberOfColors = this._io.readU4be();
      this.colorMapEntries = this._io.readU4be();
      this.windowWidth = this._io.readU4be();
      this.windowHeight = this._io.readU4be();
      this.windowX = this._io.readS4be();
      this.windowY = this._io.readS4be();
      this.windowBorderWidth = this._io.readU4be();
      this.creator = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "UTF-8");
    }

    /**
     * X11WD file version (always 07h)
     */

    /**
     * Format of the image data
     */

    /**
     * Pixmap depth in pixels - in practice, bits per pixel
     */

    /**
     * Pixmap width in pixels
     */

    /**
     * Pixmap height in pixels
     */

    /**
     * Bitmap X offset (number of pixels to ignore at the beginning of each scan-line)
     */

    /**
     * Byte order of image data
     */

    /**
     * Bitmap base data size
     */

    /**
     * Bit-order of image data
     */

    /**
     * Bitmap scan-line pad
     */

    /**
     * Bits per pixel
     */

    /**
     * Bytes per scan-line
     */

    /**
     * Class of the image
     */

    /**
     * Red mask
     */

    /**
     * Green mask
     */

    /**
     * Blue mask
     */

    /**
     * Size of each color mask in bits
     */

    /**
     * Number of colors in image
     */

    /**
     * Number of entries in color map
     */

    /**
     * Window width
     */

    /**
     * Window height
     */

    /**
     * Window upper left X coordinate
     */

    /**
     * Window upper left Y coordinate
     */

    /**
     * Window border width
     */

    /**
     * Program that created this xwd file
     */

    return Header;
  })();

  var ColorMapEntry = Xwd.ColorMapEntry = (function() {
    function ColorMapEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ColorMapEntry.prototype._read = function() {
      this.entryNumber = this._io.readU4be();
      this.red = this._io.readU2be();
      this.green = this._io.readU2be();
      this.blue = this._io.readU2be();
      this.flags = this._io.readU1();
      this.padding = this._io.readU1();
    }

    /**
     * Number of the color map entry
     */

    return ColorMapEntry;
  })();

  /**
   * Size of the header in bytes
   */

  return Xwd;
})();
return Xwd;
}));
