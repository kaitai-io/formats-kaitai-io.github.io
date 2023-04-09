// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Pif = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * The Portable Image Format (PIF) is a basic, bitmap-like image format with the
 * focus on ease of use (implementation) and small size for embedded
 * applications.
 * 
 * See <https://github.com/gfcwfzkm/PIF-Image-Format> for more info.
 * @see {@link https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf|Source}
 * @see {@link https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/C%20Library/pifdec.c#L300|Source}
 */

var Pif = (function() {
  Pif.ImageType = Object.freeze({
    RGB332: 7763,
    RGB888: 17212,
    INDEXED_RGB332: 18754,
    INDEXED_RGB565: 18759,
    INDEXED_RGB888: 18770,
    BLACK_WHITE: 32170,
    RGB16C: 47253,
    RGB565: 58821,

    7763: "RGB332",
    17212: "RGB888",
    18754: "INDEXED_RGB332",
    18759: "INDEXED_RGB565",
    18770: "INDEXED_RGB888",
    32170: "BLACK_WHITE",
    47253: "RGB16C",
    58821: "RGB565",
  });

  Pif.CompressionType = Object.freeze({
    NONE: 0,
    RLE: 32222,

    0: "NONE",
    32222: "RLE",
  });

  function Pif(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Pif.prototype._read = function() {
    this.fileHeader = new PifHeader(this._io, this, this._root);
    this.infoHeader = new InformationHeader(this._io, this, this._root);
    if (this.infoHeader.usesIndexedMode) {
      this._raw_colorTable = this._io.readBytes(this.infoHeader.lenColorTable);
      var _io__raw_colorTable = new KaitaiStream(this._raw_colorTable);
      this.colorTable = new ColorTableData(_io__raw_colorTable, this, this._root);
    }
  }

  var PifHeader = Pif.PifHeader = (function() {
    function PifHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PifHeader.prototype._read = function() {
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [80, 73, 70, 0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([80, 73, 70, 0], this.magic, this._io, "/types/pif_header/seq/0");
      }
      this.lenFile = this._io.readU4le();
      if (!(this.lenFile >= this.ofsImageDataMin)) {
        throw new KaitaiStream.ValidationLessThanError(this.ofsImageDataMin, this.lenFile, this._io, "/types/pif_header/seq/1");
      }
      this.ofsImageData = this._io.readU4le();
      if (!(this.ofsImageData >= this.ofsImageDataMin)) {
        throw new KaitaiStream.ValidationLessThanError(this.ofsImageDataMin, this.ofsImageData, this._io, "/types/pif_header/seq/2");
      }
      if (!(this.ofsImageData <= this.lenFile)) {
        throw new KaitaiStream.ValidationGreaterThanError(this.lenFile, this.ofsImageData, this._io, "/types/pif_header/seq/2");
      }
    }
    Object.defineProperty(PifHeader.prototype, 'ofsImageDataMin', {
      get: function() {
        if (this._m_ofsImageDataMin !== undefined)
          return this._m_ofsImageDataMin;
        this._m_ofsImageDataMin = (12 + 16);
        return this._m_ofsImageDataMin;
      }
    });

    return PifHeader;
  })();

  var InformationHeader = Pif.InformationHeader = (function() {
    function InformationHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    InformationHeader.prototype._read = function() {
      this.imageType = this._io.readU2le();
      if (!( ((this.imageType == Pif.ImageType.RGB888) || (this.imageType == Pif.ImageType.RGB565) || (this.imageType == Pif.ImageType.RGB332) || (this.imageType == Pif.ImageType.RGB16C) || (this.imageType == Pif.ImageType.BLACK_WHITE) || (this.imageType == Pif.ImageType.INDEXED_RGB888) || (this.imageType == Pif.ImageType.INDEXED_RGB565) || (this.imageType == Pif.ImageType.INDEXED_RGB332)) )) {
        throw new KaitaiStream.ValidationNotAnyOfError(this.imageType, this._io, "/types/information_header/seq/0");
      }
      this.bitsPerPixel = this._io.readU2le();
      var _ = this.bitsPerPixel;
      if (!((this.imageType == Pif.ImageType.RGB888 ? _ == 24 : (this.imageType == Pif.ImageType.RGB565 ? _ == 16 : (this.imageType == Pif.ImageType.RGB332 ? _ == 8 : (this.imageType == Pif.ImageType.RGB16C ? _ == 4 : (this.imageType == Pif.ImageType.BLACK_WHITE ? _ == 1 : (this.usesIndexedMode ? _ <= 8 : true)))))))) {
        throw new KaitaiStream.ValidationExprError(this.bitsPerPixel, this._io, "/types/information_header/seq/1");
      }
      this.width = this._io.readU2le();
      this.height = this._io.readU2le();
      this.lenImageData = this._io.readU4le();
      if (!(this.lenImageData <= (this._root.fileHeader.lenFile - this._root.fileHeader.ofsImageData))) {
        throw new KaitaiStream.ValidationGreaterThanError((this._root.fileHeader.lenFile - this._root.fileHeader.ofsImageData), this.lenImageData, this._io, "/types/information_header/seq/4");
      }
      this.lenColorTable = this._io.readU2le();
      if (!(this.lenColorTable >= (this.usesIndexedMode ? (this.lenColorTableEntry * 1) : 0))) {
        throw new KaitaiStream.ValidationLessThanError((this.usesIndexedMode ? (this.lenColorTableEntry * 1) : 0), this.lenColorTable, this._io, "/types/information_header/seq/5");
      }
      if (!(this.lenColorTable <= (this.usesIndexedMode ? (this.lenColorTableMax < this.lenColorTableFull ? this.lenColorTableMax : this.lenColorTableFull) : 0))) {
        throw new KaitaiStream.ValidationGreaterThanError((this.usesIndexedMode ? (this.lenColorTableMax < this.lenColorTableFull ? this.lenColorTableMax : this.lenColorTableFull) : 0), this.lenColorTable, this._io, "/types/information_header/seq/5");
      }
      this.compression = this._io.readU2le();
      if (!( ((this.compression == Pif.CompressionType.NONE) || (this.compression == Pif.CompressionType.RLE)) )) {
        throw new KaitaiStream.ValidationNotAnyOfError(this.compression, this._io, "/types/information_header/seq/6");
      }
    }
    Object.defineProperty(InformationHeader.prototype, 'lenColorTableEntry', {
      get: function() {
        if (this._m_lenColorTableEntry !== undefined)
          return this._m_lenColorTableEntry;
        this._m_lenColorTableEntry = (this.imageType == Pif.ImageType.INDEXED_RGB888 ? 3 : (this.imageType == Pif.ImageType.INDEXED_RGB565 ? 2 : (this.imageType == Pif.ImageType.INDEXED_RGB332 ? 1 : 0)));
        return this._m_lenColorTableEntry;
      }
    });
    Object.defineProperty(InformationHeader.prototype, 'lenColorTableFull', {
      get: function() {
        if (this._m_lenColorTableFull !== undefined)
          return this._m_lenColorTableFull;
        this._m_lenColorTableFull = (this.lenColorTableEntry * (1 << this.bitsPerPixel));
        return this._m_lenColorTableFull;
      }
    });
    Object.defineProperty(InformationHeader.prototype, 'lenColorTableMax', {
      get: function() {
        if (this._m_lenColorTableMax !== undefined)
          return this._m_lenColorTableMax;
        this._m_lenColorTableMax = (this._root.fileHeader.ofsImageData - this._root.fileHeader.ofsImageDataMin);
        return this._m_lenColorTableMax;
      }
    });
    Object.defineProperty(InformationHeader.prototype, 'usesIndexedMode', {
      get: function() {
        if (this._m_usesIndexedMode !== undefined)
          return this._m_usesIndexedMode;
        this._m_usesIndexedMode = this.lenColorTableEntry != 0;
        return this._m_usesIndexedMode;
      }
    });

    /**
     * See <https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf>:
     * 
     * > Bits per Pixel: Bit size that each Pixel occupies. Bit size for an
     * > Indexed Image cannot go beyond 8 bits.
     */

    /**
     * See <https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf>:
     * 
     * > Color Table Size: (...), only used in Indexed mode, otherwise zero.
     * ---
     * > **Note**: The presence of the Color Table is mandatory when Bits per
     * > Pixel <= 8, unless Image Type states RGB332, RGB16C or B/W
     * ---
     * > **Color Table** (semi-optional)
     * >
     * > (...) The amount of Colors has to be same or less than [Bits per
     * > Pixel] allow, otherwise the image is invalid.
     */

    return InformationHeader;
  })();

  var ColorTableData = Pif.ColorTableData = (function() {
    function ColorTableData(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ColorTableData.prototype._read = function() {
      this.entries = [];
      var i = 0;
      while (!this._io.isEof()) {
        switch (this._root.infoHeader.imageType) {
        case Pif.ImageType.INDEXED_RGB888:
          this.entries.push(this._io.readBitsIntLe(24));
          break;
        case Pif.ImageType.INDEXED_RGB565:
          this.entries.push(this._io.readBitsIntLe(16));
          break;
        case Pif.ImageType.INDEXED_RGB332:
          this.entries.push(this._io.readBitsIntLe(8));
          break;
        }
        i++;
      }
    }

    return ColorTableData;
  })();
  Object.defineProperty(Pif.prototype, 'imageData', {
    get: function() {
      if (this._m_imageData !== undefined)
        return this._m_imageData;
      var _pos = this._io.pos;
      this._io.seek(this.fileHeader.ofsImageData);
      this._m_imageData = this._io.readBytes(this.infoHeader.lenImageData);
      this._io.seek(_pos);
      return this._m_imageData;
    }
  });

  return Pif;
})();
return Pif;
}));
