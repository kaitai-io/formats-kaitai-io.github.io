// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Webp || (root.Webp = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Webp_, KaitaiStream) {
/**
 * @see {@link https://developers.google.com/speed/webp/docs/riff_container|Source}
 */

var Webp = (function() {
  Webp.ChunkNames = Object.freeze({
    XMP_VAR: 5262680,
    VP8: 540561494,
    XMP: 542133592,
    EXIF: 1179211845,
    ANMF: 1179471425,
    ALPH: 1213221953,
    VP8L: 1278758998,
    FRGM: 1296519750,
    ANIM: 1296649793,
    ICCP: 1346585417,
    VP8X: 1480085590,

    5262680: "XMP_VAR",
    540561494: "VP8",
    542133592: "XMP",
    1179211845: "EXIF",
    1179471425: "ANMF",
    1213221953: "ALPH",
    1278758998: "VP8L",
    1296519750: "FRGM",
    1296649793: "ANIM",
    1346585417: "ICCP",
    1480085590: "VP8X",
  });

  Webp.CompressionMethod = Object.freeze({
    NONE: 0,
    WEBP_LOSSLESS: 1,

    0: "NONE",
    1: "WEBP_LOSSLESS",
  });

  Webp.FilteringMethod = Object.freeze({
    NONE: 0,
    HORIZONTAL: 1,
    VERTICAL: 2,
    GRADIENT: 3,

    0: "NONE",
    1: "HORIZONTAL",
    2: "VERTICAL",
    3: "GRADIENT",
  });

  Webp.Preprocessing = Object.freeze({
    NONE: 0,
    LEVEL_REDUCTION: 1,

    0: "NONE",
    1: "LEVEL_REDUCTION",
  });

  function Webp(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Webp.prototype._read = function() {
    this.magic = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([82, 73, 70, 70])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([82, 73, 70, 70]), this.magic, this._io, "/seq/0");
    }
    this.lenData = this._io.readU4le();
    this.webp = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.webp, new Uint8Array([87, 69, 66, 80])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([87, 69, 66, 80]), this.webp, this._io, "/seq/2");
    }
    this._raw_payload = this._io.readBytes(this.lenData - 4);
    var _io__raw_payload = new KaitaiStream(this._raw_payload);
    this.payload = new Chunks(_io__raw_payload, this, this._root);
  }

  var Alph = Webp.Alph = (function() {
    function Alph(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Alph.prototype._read = function() {
      this.reserved = this._io.readBitsIntBe(2);
      if (!(this.reserved == 0)) {
        throw new KaitaiStream.ValidationNotEqualError(0, this.reserved, this._io, "/types/alph/seq/0");
      }
      this.preprocessing = this._io.readBitsIntBe(2);
      if (!Object.prototype.hasOwnProperty.call(Webp.Preprocessing, this.preprocessing)) {
        throw new KaitaiStream.ValidationNotInEnumError(this.preprocessing, this._io, "/types/alph/seq/1");
      }
      this.filtering = this._io.readBitsIntBe(2);
      this.compression = this._io.readBitsIntBe(2);
      if (!Object.prototype.hasOwnProperty.call(Webp.CompressionMethod, this.compression)) {
        throw new KaitaiStream.ValidationNotInEnumError(this.compression, this._io, "/types/alph/seq/3");
      }
      this._io.alignToByte();
      this.data = this._io.readBytesFull();
    }

    return Alph;
  })();

  /**
   * @see {@link https://developers.google.com/speed/webp/docs/riff_container#animation|Source}
   */

  var Anim = Webp.Anim = (function() {
    function Anim(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Anim.prototype._read = function() {
      this.backgroundColor = new BgColor(this._io, this, this._root);
      this.loopCount = this._io.readU2le();
    }

    var BgColor = Anim.BgColor = (function() {
      function BgColor(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      BgColor.prototype._read = function() {
        this.blue = this._io.readU1();
        this.green = this._io.readU1();
        this.red = this._io.readU1();
        this.alpha = this._io.readU1();
      }

      return BgColor;
    })();

    return Anim;
  })();

  var Anmf = Webp.Anmf = (function() {
    function Anmf(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Anmf.prototype._read = function() {
      this.frameXDiv2 = this._io.readBitsIntLe(24);
      this.frameYDiv2 = this._io.readBitsIntLe(24);
      this.frameWidthMinus1 = this._io.readBitsIntLe(24);
      this.frameHeightMinus1 = this._io.readBitsIntLe(24);
      this.duration = this._io.readBitsIntLe(24);
      this.reserved = this._io.readBitsIntBe(6);
      if (!(this.reserved == 0)) {
        throw new KaitaiStream.ValidationNotEqualError(0, this.reserved, this._io, "/types/anmf/seq/5");
      }
      this.blendingMethod = this._io.readBitsIntBe(1) != 0;
      this.disposalMethod = this._io.readBitsIntBe(1) != 0;
      this._io.alignToByte();
      this.data = this._io.readBytesFull();
    }
    Object.defineProperty(Anmf.prototype, 'frameHeight', {
      get: function() {
        if (this._m_frameHeight !== undefined)
          return this._m_frameHeight;
        this._m_frameHeight = this.frameHeightMinus1 + 1;
        return this._m_frameHeight;
      }
    });
    Object.defineProperty(Anmf.prototype, 'frameWidth', {
      get: function() {
        if (this._m_frameWidth !== undefined)
          return this._m_frameWidth;
        this._m_frameWidth = this.frameWidthMinus1 + 1;
        return this._m_frameWidth;
      }
    });
    Object.defineProperty(Anmf.prototype, 'frameX', {
      get: function() {
        if (this._m_frameX !== undefined)
          return this._m_frameX;
        this._m_frameX = this.frameXDiv2 * 2;
        return this._m_frameX;
      }
    });
    Object.defineProperty(Anmf.prototype, 'frameY', {
      get: function() {
        if (this._m_frameY !== undefined)
          return this._m_frameY;
        this._m_frameY = this.frameYDiv2 * 2;
        return this._m_frameY;
      }
    });

    return Anmf;
  })();

  var Chunk = Webp.Chunk = (function() {
    function Chunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Chunk.prototype._read = function() {
      this.name = this._io.readU4le();
      if (!Object.prototype.hasOwnProperty.call(Webp.ChunkNames, this.name)) {
        throw new KaitaiStream.ValidationNotInEnumError(this.name, this._io, "/types/chunk/seq/0");
      }
      this.lenData = this._io.readU4le();
      switch (this.name) {
      case Webp.ChunkNames.ALPH:
        this._raw_data = this._io.readBytes(this.lenData);
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new Alph(_io__raw_data, this, this._root);
        break;
      case Webp.ChunkNames.ANIM:
        this._raw_data = this._io.readBytes(this.lenData);
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new Anim(_io__raw_data, this, this._root);
        break;
      case Webp.ChunkNames.ANMF:
        this._raw_data = this._io.readBytes(this.lenData);
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new Anmf(_io__raw_data, this, this._root);
        break;
      case Webp.ChunkNames.VP8:
        this._raw_data = this._io.readBytes(this.lenData);
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new Vp8(_io__raw_data, this, this._root);
        break;
      case Webp.ChunkNames.VP8L:
        this._raw_data = this._io.readBytes(this.lenData);
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new Vp8l(_io__raw_data, this, this._root);
        break;
      case Webp.ChunkNames.VP8X:
        this._raw_data = this._io.readBytes(this.lenData);
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new Vp8x(_io__raw_data, this, this._root);
        break;
      case Webp.ChunkNames.XMP:
        this._raw_data = this._io.readBytes(this.lenData);
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new Xmp(_io__raw_data, this, this._root);
        break;
      case Webp.ChunkNames.XMP_VAR:
        this._raw_data = this._io.readBytes(this.lenData);
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new Xmp(_io__raw_data, this, this._root);
        break;
      default:
        this.data = this._io.readBytes(this.lenData);
        break;
      }
      if (KaitaiStream.mod(this.lenData, 2) != 0) {
        this.padding = this._io.readBytes(1);
        if (!((KaitaiStream.byteArrayCompare(this.padding, new Uint8Array([0])) == 0))) {
          throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([0]), this.padding, this._io, "/types/chunk/seq/3");
        }
      }
    }

    return Chunk;
  })();

  var Chunks = Webp.Chunks = (function() {
    function Chunks(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Chunks.prototype._read = function() {
      this.chunks = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.chunks.push(new Chunk(this._io, this, this._root));
        i++;
      }
    }

    return Chunks;
  })();

  /**
   * @see {@link https://www.rfc-editor.org/rfc/rfc6386#section-9.1|Source}
   */

  var Vp8 = Webp.Vp8 = (function() {
    function Vp8(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Vp8.prototype._read = function() {
      this.frameType = this._io.readBitsIntLe(1) != 0;
      if (!(this.frameType == false)) {
        throw new KaitaiStream.ValidationNotEqualError(false, this.frameType, this._io, "/types/vp8/seq/0");
      }
      this.version = this._io.readBitsIntLe(3);
      if (!(this.version <= 3)) {
        throw new KaitaiStream.ValidationGreaterThanError(3, this.version, this._io, "/types/vp8/seq/1");
      }
      this.showFrame = this._io.readBitsIntLe(1) != 0;
      this.lenFirstPartition = this._io.readBitsIntLe(19);
      this._io.alignToByte();
      this.startCode = this._io.readBytes(3);
      if (!((KaitaiStream.byteArrayCompare(this.startCode, new Uint8Array([157, 1, 42])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([157, 1, 42]), this.startCode, this._io, "/types/vp8/seq/4");
      }
      this.width = this._io.readBitsIntLe(14);
      this.horizontalScale = this._io.readBitsIntLe(2);
      this.height = this._io.readBitsIntLe(14);
      this.verticalScale = this._io.readBitsIntLe(2);
      this._io.alignToByte();
      this.data = this._io.readBytesFull();
    }

    return Vp8;
  })();

  /**
   * @see {@link https://developers.google.com/speed/webp/docs/webp_lossless_bitstream_specification|Source}
   */

  var Vp8l = Webp.Vp8l = (function() {
    function Vp8l(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Vp8l.prototype._read = function() {
      this.signature = this._io.readU1();
      if (!(this.signature == 47)) {
        throw new KaitaiStream.ValidationNotEqualError(47, this.signature, this._io, "/types/vp8l/seq/0");
      }
      this.imageWidthMinus1 = this._io.readBitsIntLe(14);
      this.imageHeightMinus1 = this._io.readBitsIntLe(14);
      this.alphaIsUsed = this._io.readBitsIntLe(1) != 0;
      this.versionNumber = this._io.readBitsIntLe(3);
      if (!(this.versionNumber == 0)) {
        throw new KaitaiStream.ValidationNotEqualError(0, this.versionNumber, this._io, "/types/vp8l/seq/4");
      }
      this._io.alignToByte();
      this.data = this._io.readBytesFull();
    }
    Object.defineProperty(Vp8l.prototype, 'imageHeight', {
      get: function() {
        if (this._m_imageHeight !== undefined)
          return this._m_imageHeight;
        this._m_imageHeight = this.imageHeightMinus1 + 1;
        return this._m_imageHeight;
      }
    });
    Object.defineProperty(Vp8l.prototype, 'imageWidth', {
      get: function() {
        if (this._m_imageWidth !== undefined)
          return this._m_imageWidth;
        this._m_imageWidth = this.imageWidthMinus1 + 1;
        return this._m_imageWidth;
      }
    });

    /**
     * A hint only - it should not impact decoding. It should be `false` when
     * all alpha values are 255 in the picture, and `true` otherwise.
     */

    return Vp8l;
  })();

  var Vp8x = Webp.Vp8x = (function() {
    function Vp8x(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Vp8x.prototype._read = function() {
      this.reserved1 = this._io.readBitsIntBe(2);
      if (!(this.reserved1 == 0)) {
        throw new KaitaiStream.ValidationNotEqualError(0, this.reserved1, this._io, "/types/vp8x/seq/0");
      }
      this.iccProfile = this._io.readBitsIntBe(1) != 0;
      this.alpha = this._io.readBitsIntBe(1) != 0;
      this.exif = this._io.readBitsIntBe(1) != 0;
      this.xmp = this._io.readBitsIntBe(1) != 0;
      this.animation = this._io.readBitsIntBe(1) != 0;
      this.reserved2 = this._io.readBitsIntBe(1) != 0;
      if (!(this.reserved2 == false)) {
        throw new KaitaiStream.ValidationNotEqualError(false, this.reserved2, this._io, "/types/vp8x/seq/6");
      }
      this.reserved3 = this._io.readBitsIntBe(24);
      if (!(this.reserved3 == 0)) {
        throw new KaitaiStream.ValidationNotEqualError(0, this.reserved3, this._io, "/types/vp8x/seq/7");
      }
      this.canvasWidthMinus1 = this._io.readBitsIntLe(24);
      this.canvasHeightMinus1 = this._io.readBitsIntLe(24);
      if (!(this.canvasHeightMinus1 <= Math.floor(4294967295 / this.canvasWidth) - 1)) {
        throw new KaitaiStream.ValidationGreaterThanError(Math.floor(4294967295 / this.canvasWidth) - 1, this.canvasHeightMinus1, this._io, "/types/vp8x/seq/9");
      }
    }
    Object.defineProperty(Vp8x.prototype, 'canvasHeight', {
      get: function() {
        if (this._m_canvasHeight !== undefined)
          return this._m_canvasHeight;
        this._m_canvasHeight = this.canvasHeightMinus1 + 1;
        return this._m_canvasHeight;
      }
    });
    Object.defineProperty(Vp8x.prototype, 'canvasWidth', {
      get: function() {
        if (this._m_canvasWidth !== undefined)
          return this._m_canvasWidth;
        this._m_canvasWidth = this.canvasWidthMinus1 + 1;
        return this._m_canvasWidth;
      }
    });

    return Vp8x;
  })();

  var Xmp = Webp.Xmp = (function() {
    function Xmp(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Xmp.prototype._read = function() {
      this.data = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
    }

    return Xmp;
  })();

  return Webp;
})();
Webp_.Webp = Webp;
});
