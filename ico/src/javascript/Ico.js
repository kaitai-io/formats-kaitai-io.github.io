// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Ico || (root.Ico = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Ico_, KaitaiStream) {
/**
 * Microsoft Windows uses specific file format to store applications
 * icons - ICO. This is a container that contains one or more image
 * files (effectively, DIB parts of BMP files or full PNG files are
 * contained inside).
 * @see {@link https://learn.microsoft.com/en-us/previous-versions/ms997538(v=msdn.10)|Source}
 */

var Ico = (function() {
  function Ico(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Ico.prototype._read = function() {
    this.magic = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([0, 0, 1, 0])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([0, 0, 1, 0]), this.magic, this._io, "/seq/0");
    }
    this.numImages = this._io.readU2le();
    this.images = [];
    for (var i = 0; i < this.numImages; i++) {
      this.images.push(new IconDirEntry(this._io, this, this._root));
    }
  }

  var IconDirEntry = Ico.IconDirEntry = (function() {
    function IconDirEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    IconDirEntry.prototype._read = function() {
      this.width = this._io.readU1();
      this.height = this._io.readU1();
      this.numColors = this._io.readU1();
      this.reserved = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.reserved, new Uint8Array([0])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([0]), this.reserved, this._io, "/types/icon_dir_entry/seq/3");
      }
      this.numPlanes = this._io.readU2le();
      this.bpp = this._io.readU2le();
      this.lenImg = this._io.readU4le();
      this.ofsImg = this._io.readU4le();
    }

    /**
     * Raw image data. Use `is_png` to determine whether this is an
     * embedded PNG file (true) or a DIB bitmap (false) and call a
     * relevant parser, if needed to parse image data further.
     */
    Object.defineProperty(IconDirEntry.prototype, 'img', {
      get: function() {
        if (this._m_img !== undefined)
          return this._m_img;
        var _pos = this._io.pos;
        this._io.seek(this.ofsImg);
        this._m_img = this._io.readBytes(this.lenImg);
        this._io.seek(_pos);
        return this._m_img;
      }
    });

    /**
     * True if this image is in PNG format.
     */
    Object.defineProperty(IconDirEntry.prototype, 'isPng', {
      get: function() {
        if (this._m_isPng !== undefined)
          return this._m_isPng;
        this._m_isPng = (KaitaiStream.byteArrayCompare(this.pngHeader, new Uint8Array([137, 80, 78, 71, 13, 10, 26, 10])) == 0);
        return this._m_isPng;
      }
    });

    /**
     * Pre-reads first 8 bytes of the image to determine if it's an
     * embedded PNG file.
     */
    Object.defineProperty(IconDirEntry.prototype, 'pngHeader', {
      get: function() {
        if (this._m_pngHeader !== undefined)
          return this._m_pngHeader;
        var _pos = this._io.pos;
        this._io.seek(this.ofsImg);
        this._m_pngHeader = this._io.readBytes(8);
        this._io.seek(_pos);
        return this._m_pngHeader;
      }
    });

    /**
     * Width of image, px
     */

    /**
     * Height of image, px
     */

    /**
     * Number of colors in palette of the image or 0 if image has
     * no palette (i.e. RGB, RGBA, etc)
     */

    /**
     * Number of color planes
     */

    /**
     * Bits per pixel in the image
     */

    /**
     * Size of the image data
     */

    /**
     * Absolute offset of the image data start in the file
     */

    return IconDirEntry;
  })();

  /**
   * Number of images contained in this file
   */

  return Ico;
})();
Ico_.Ico = Ico;
});
