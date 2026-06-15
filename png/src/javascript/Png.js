// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Png || (root.Png = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Png_, KaitaiStream) {
/**
 * Test files for APNG can be found at the following locations:
 * 
 *   * <https://philip.html5.org/tests/apng/tests.html>
 *   * <http://littlesvr.ca/apng/>
 */

var Png = (function() {
  Png.BlendOpValues = Object.freeze({
    SOURCE: 0,
    OVER: 1,

    0: "SOURCE",
    1: "OVER",
  });

  Png.ColorType = Object.freeze({
    GREYSCALE: 0,
    TRUECOLOR: 2,
    INDEXED: 3,
    GREYSCALE_ALPHA: 4,
    TRUECOLOR_ALPHA: 6,

    0: "GREYSCALE",
    2: "TRUECOLOR",
    3: "INDEXED",
    4: "GREYSCALE_ALPHA",
    6: "TRUECOLOR_ALPHA",
  });

  Png.CompressionMethods = Object.freeze({
    ZLIB: 0,

    0: "ZLIB",
  });

  Png.DisposeOpValues = Object.freeze({
    NONE: 0,
    BACKGROUND: 1,
    PREVIOUS: 2,

    0: "NONE",
    1: "BACKGROUND",
    2: "PREVIOUS",
  });

  Png.PhysUnit = Object.freeze({
    UNKNOWN: 0,
    METER: 1,

    0: "UNKNOWN",
    1: "METER",
  });

  function Png(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Png.prototype._read = function() {
    this.magic = this._io.readBytes(8);
    if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([137, 80, 78, 71, 13, 10, 26, 10])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([137, 80, 78, 71, 13, 10, 26, 10]), this.magic, this._io, "/seq/0");
    }
    this.ihdrLen = this._io.readU4be();
    if (!(this.ihdrLen == 13)) {
      throw new KaitaiStream.ValidationNotEqualError(13, this.ihdrLen, this._io, "/seq/1");
    }
    this.ihdrType = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.ihdrType, new Uint8Array([73, 72, 68, 82])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([73, 72, 68, 82]), this.ihdrType, this._io, "/seq/2");
    }
    this.ihdr = new IhdrChunk(this._io, this, this._root);
    this.ihdrCrc = this._io.readBytes(4);
    this.chunks = [];
    var i = 0;
    do {
      var _ = new Chunk(this._io, this, this._root);
      this.chunks.push(_);
      i++;
    } while (!( ((_.type == "IEND") || (this._io.isEof())) ));
  }

  /**
   * @see {@link https://stackoverflow.com/questions/4242402/the-fireworks-png-format-any-insight-any-libs/51683285#51683285|Source}
   */

  var AdobeFireworksChunk = Png.AdobeFireworksChunk = (function() {
    function AdobeFireworksChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    AdobeFireworksChunk.prototype._read = function() {
      this._raw_previewData = this._io.readBytesFull();
      this.previewData = KaitaiStream.processZlib(this._raw_previewData);
    }

    return AdobeFireworksChunk;
  })();

  /**
   * @see {@link https://wiki.mozilla.org/APNG_Specification#.60acTL.60:_The_Animation_Control_Chunk|Source}
   */

  var AnimationControlChunk = Png.AnimationControlChunk = (function() {
    function AnimationControlChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    AnimationControlChunk.prototype._read = function() {
      this.numFrames = this._io.readU4be();
      this.numPlays = this._io.readU4be();
    }

    /**
     * Number of frames, must be equal to the number of `frame_control_chunk`s
     */

    /**
     * Number of times to loop, 0 indicates infinite looping.
     */

    return AnimationControlChunk;
  })();

  /**
   * @see {@link https://github.com/skeeto/scratch/tree/58470254f4a95cdf7a53888e405c851c21eb2cae/pngattach|Source}
   * @see {@link https://nullprogram.com/blog/2021/12/31/|A new protocol and tool for PNG file attachments}
   */

  var AtchChunk = Png.AtchChunk = (function() {
    AtchChunk.CompressionAttachMethods = Object.freeze({
      NONE: 0,
      ZLIB: 1,

      0: "NONE",
      1: "ZLIB",
    });

    function AtchChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    AtchChunk.prototype._read = function() {
      this.fileName = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "UTF-8");
      var _ = this.fileName;
      if (!( ((_.length != 0) && (_.substring(0, 1) != ".")) )) {
        throw new KaitaiStream.ValidationExprError(this.fileName, this._io, "/types/atch_chunk/seq/0");
      }
      this.compression = this._io.readU1();
      if (!Object.prototype.hasOwnProperty.call(Png.AtchChunk.CompressionAttachMethods, this.compression)) {
        throw new KaitaiStream.ValidationNotInEnumError(this.compression, this._io, "/types/atch_chunk/seq/1");
      }
      if (this.compression == Png.AtchChunk.CompressionAttachMethods.NONE) {
        this.dataPlain = this._io.readBytesFull();
      }
      if (this.compression == Png.AtchChunk.CompressionAttachMethods.ZLIB) {
        this._raw_dataZlib = this._io.readBytesFull();
        this.dataZlib = KaitaiStream.processZlib(this._raw_dataZlib);
      }
    }
    Object.defineProperty(AtchChunk.prototype, 'data', {
      get: function() {
        if (this._m_data !== undefined)
          return this._m_data;
        this._m_data = (this.compression == Png.AtchChunk.CompressionAttachMethods.NONE ? this.dataPlain : this.dataZlib);
        return this._m_data;
      }
    });

    /**
     * From the [official
     * specification](https://github.com/skeeto/scratch/tree/58470254f4a95cdf7a53888e405c851c21eb2cae/pngattach#atch-chunk-specification):
     * 
     * > The name can be any length that fits in the chunk, and should be
     * > encoded with UTF-8. It's up to each implementation to determine how
     * > to appropriately interpret the bytestring for the local system.
     * 
     * > The name must be at least one byte long, not counting the null
     * > terminator. It cannot begin with a period (`0x2e`), nor contain
     * > control bytes (anything less than `0x20`), nor slash (`0x2f`), nor
     * > backslash (`0x5c`), i.e. no directory hierarchies.
     * 
     * As of Kaitai Struct 0.11, we cannot easily check whether a string
     * contains certain characters, so we only enforce that the file name is
     * not empty and that it doesn't start with a period.
     */

    return AtchChunk;
  })();

  /**
   * Background chunk stores default background color to display this
   * image against. Contents depend on `color_type` of the image.
   * @see {@link https://www.w3.org/TR/png/#11bKGD|Source}
   */

  var BkgdChunk = Png.BkgdChunk = (function() {
    function BkgdChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    BkgdChunk.prototype._read = function() {
      switch (this._root.ihdr.colorType) {
      case Png.ColorType.GREYSCALE:
        this.bkgd = new BkgdGreyscale(this._io, this, this._root);
        break;
      case Png.ColorType.GREYSCALE_ALPHA:
        this.bkgd = new BkgdGreyscale(this._io, this, this._root);
        break;
      case Png.ColorType.INDEXED:
        this.bkgd = new BkgdIndexed(this._io, this, this._root);
        break;
      case Png.ColorType.TRUECOLOR:
        this.bkgd = new BkgdTruecolor(this._io, this, this._root);
        break;
      case Png.ColorType.TRUECOLOR_ALPHA:
        this.bkgd = new BkgdTruecolor(this._io, this, this._root);
        break;
      }
    }

    return BkgdChunk;
  })();

  /**
   * Background chunk for greyscale images.
   */

  var BkgdGreyscale = Png.BkgdGreyscale = (function() {
    function BkgdGreyscale(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    BkgdGreyscale.prototype._read = function() {
      this.value = this._io.readU2be();
    }

    return BkgdGreyscale;
  })();

  /**
   * Background chunk for images with indexed palette.
   */

  var BkgdIndexed = Png.BkgdIndexed = (function() {
    function BkgdIndexed(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    BkgdIndexed.prototype._read = function() {
      this.paletteIndex = this._io.readU1();
    }

    return BkgdIndexed;
  })();

  /**
   * Background chunk for truecolor images.
   */

  var BkgdTruecolor = Png.BkgdTruecolor = (function() {
    function BkgdTruecolor(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    BkgdTruecolor.prototype._read = function() {
      this.red = this._io.readU2be();
      this.green = this._io.readU2be();
      this.blue = this._io.readU2be();
    }

    return BkgdTruecolor;
  })();

  var ChrmChromaticity = Png.ChrmChromaticity = (function() {
    function ChrmChromaticity(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ChrmChromaticity.prototype._read = function() {
      this.xInt = this._io.readU4be();
      this.yInt = this._io.readU4be();
    }
    Object.defineProperty(ChrmChromaticity.prototype, 'x', {
      get: function() {
        if (this._m_x !== undefined)
          return this._m_x;
        this._m_x = this.xInt / 100000.0;
        return this._m_x;
      }
    });
    Object.defineProperty(ChrmChromaticity.prototype, 'y', {
      get: function() {
        if (this._m_y !== undefined)
          return this._m_y;
        this._m_y = this.yInt / 100000.0;
        return this._m_y;
      }
    });

    return ChrmChromaticity;
  })();

  /**
   * @see {@link https://www.w3.org/TR/png/#11cHRM|Source}
   */

  var ChrmChunk = Png.ChrmChunk = (function() {
    function ChrmChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ChrmChunk.prototype._read = function() {
      this.whitePoint = new ChrmChromaticity(this._io, this, this._root);
      this.red = new ChrmChromaticity(this._io, this, this._root);
      this.green = new ChrmChromaticity(this._io, this, this._root);
      this.blue = new ChrmChromaticity(this._io, this, this._root);
    }

    return ChrmChunk;
  })();

  var Chunk = Png.Chunk = (function() {
    function Chunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Chunk.prototype._read = function() {
      this.len = this._io.readU4be();
      this.type = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
      var _ = this.type;
      if (!(this.type != "\x00\x00\x00\x00")) {
        throw new KaitaiStream.ValidationExprError(this.type, this._io, "/types/chunk/seq/1");
      }
      switch (this.type) {
      case "PLTE":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new PlteChunk(_io__raw_body, this, this._root);
        break;
      case "acTL":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new AnimationControlChunk(_io__raw_body, this, this._root);
        break;
      case "atCh":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new AtchChunk(_io__raw_body, this, this._root);
        break;
      case "bKGD":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new BkgdChunk(_io__raw_body, this, this._root);
        break;
      case "cHRM":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new ChrmChunk(_io__raw_body, this, this._root);
        break;
      case "cICP":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new CicpChunk(_io__raw_body, this, this._root);
        break;
      case "cLLI":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new ClliChunk(_io__raw_body, this, this._root);
        break;
      case "fcTL":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new FrameControlChunk(_io__raw_body, this, this._root);
        break;
      case "fdAT":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new FrameDataChunk(_io__raw_body, this, this._root);
        break;
      case "gAMA":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new GamaChunk(_io__raw_body, this, this._root);
        break;
      case "iTXt":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new InternationalTextChunk(_io__raw_body, this, this._root);
        break;
      case "mDCV":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new MdcvChunk(_io__raw_body, this, this._root);
        break;
      case "mkBS":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new AdobeFireworksChunk(_io__raw_body, this, this._root);
        break;
      case "mkTS":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new AdobeFireworksChunk(_io__raw_body, this, this._root);
        break;
      case "pHYs":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new PhysChunk(_io__raw_body, this, this._root);
        break;
      case "prVW":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new AdobeFireworksChunk(_io__raw_body, this, this._root);
        break;
      case "sRGB":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new SrgbChunk(_io__raw_body, this, this._root);
        break;
      case "skMf":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new EvernoteSkmfChunk(_io__raw_body, this, this._root);
        break;
      case "skRf":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new EvernoteSkrfChunk(_io__raw_body, this, this._root);
        break;
      case "tEXt":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new TextChunk(_io__raw_body, this, this._root);
        break;
      case "tIME":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new TimeChunk(_io__raw_body, this, this._root);
        break;
      case "zTXt":
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new CompressedTextChunk(_io__raw_body, this, this._root);
        break;
      default:
        this.body = this._io.readBytes(this.len);
        break;
      }
      this.crc = this._io.readBytes(4);
    }

    return Chunk;
  })();

  /**
   * @see {@link https://www.w3.org/TR/png/#cICP-chunk|Source}
   * @see {@link https://w3c.github.io/png/Implementation_Report_3e/#cicp|Source}
   */

  var CicpChunk = Png.CicpChunk = (function() {
    function CicpChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    CicpChunk.prototype._read = function() {
      this.colorPrimaries = this._io.readU1();
      this.transferFunction = this._io.readU1();
      this.matrixCoefficients = this._io.readU1();
      if (!(this.matrixCoefficients == 0)) {
        throw new KaitaiStream.ValidationNotEqualError(0, this.matrixCoefficients, this._io, "/types/cicp_chunk/seq/2");
      }
      this.videoFullRangeFlag = this._io.readU1();
      if (!( ((this.videoFullRangeFlag == 0) || (this.videoFullRangeFlag == 1)) )) {
        throw new KaitaiStream.ValidationNotAnyOfError(this.videoFullRangeFlag, this._io, "/types/cicp_chunk/seq/3");
      }
    }

    /**
     * values above 22 are reserved, see
     * <https://github.com/pnggroup/pngcheck/blob/bd33ad6490269df07cac81e5305f4ebf56c2b637/pngcheck.c#L3322-L3325>
     */

    /**
     * values above 18 are reserved, see
     * <https://github.com/pnggroup/pngcheck/blob/bd33ad6490269df07cac81e5305f4ebf56c2b637/pngcheck.c#L3326-L3329>
     */

    /**
     * From the [official
     * specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#cICP-chunk):
     * 
     * > RGB is currently the only supported color model in PNG, and as such
     * > `Matrix Coefficients` shall be set to `0`.
     */

    /**
     * From the [official
     * specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#cICP-chunk):
     * 
     * > If `Video Full Range Flag` value is `1`, then the image is a
     * > full-range image. Typically, images in the RGB color representation
     * > are stored in the full-range signal quantization, therefore the vast
     * > majority of computer graphics and web images, including those used
     * > in traditional PNG workflows, are full-range images.
     * 
     * > If `Video Full Range Flag` value is `0`, then the image is a
     * > narrow-range image.
     */

    return CicpChunk;
  })();

  /**
   * @see {@link https://www.w3.org/TR/png/#cLLI-chunk|Source}
   * @see {@link https://w3c.github.io/png/Implementation_Report_3e/#light|Source}
   */

  var ClliChunk = Png.ClliChunk = (function() {
    function ClliChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ClliChunk.prototype._read = function() {
      this.maxContentLightLevelInt = this._io.readU4be();
      this.maxFrameAverageLightLevelInt = this._io.readU4be();
    }

    /**
     * Maximum Content Light Level (MaxCLL), in cd/m^2
     */
    Object.defineProperty(ClliChunk.prototype, 'maxContentLightLevel', {
      get: function() {
        if (this._m_maxContentLightLevel !== undefined)
          return this._m_maxContentLightLevel;
        this._m_maxContentLightLevel = this.maxContentLightLevelInt * 0.0001;
        return this._m_maxContentLightLevel;
      }
    });

    /**
     * Maximum Frame Average Light Level (MaxFALL), in cd/m^2
     */
    Object.defineProperty(ClliChunk.prototype, 'maxFrameAverageLightLevel', {
      get: function() {
        if (this._m_maxFrameAverageLightLevel !== undefined)
          return this._m_maxFrameAverageLightLevel;
        this._m_maxFrameAverageLightLevel = this.maxFrameAverageLightLevelInt * 0.0001;
        return this._m_maxFrameAverageLightLevel;
      }
    });

    return ClliChunk;
  })();

  /**
   * Compressed text chunk effectively allows to store key-value
   * string pairs in PNG container, compressing "value" part (which
   * can be quite lengthy) with zlib compression.
   * @see {@link https://www.w3.org/TR/png/#11zTXt|Source}
   */

  var CompressedTextChunk = Png.CompressedTextChunk = (function() {
    function CompressedTextChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    CompressedTextChunk.prototype._read = function() {
      this.keyword = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "UTF-8");
      this.compressionMethod = this._io.readU1();
      this._raw_textDatastream = this._io.readBytesFull();
      this.textDatastream = KaitaiStream.processZlib(this._raw_textDatastream);
    }

    /**
     * Indicates purpose of the following text data.
     */

    return CompressedTextChunk;
  })();

  /**
   * @see {@link https://web.archive.org/web/20210302212148/https://discussion.evernote.com/forums/topic/88532-how-to-extract-annotation-information-from-annotated-evernoteskitch-images/#comment-451501|Source}
   */

  var EvernoteSkmfChunk = Png.EvernoteSkmfChunk = (function() {
    function EvernoteSkmfChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    EvernoteSkmfChunk.prototype._read = function() {
      this.json = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
    }

    /**
     * JSON document with information about editable annotations (text,
     * lines, paths, etc.) in Evernote/Skitch.
     * 
     * It refers to the original image stored in the `skRf` chunk (which
     * usually follows immediately after `skMf`) via the
     * `.children[0].children[0].uri` JSON property. This has the format
     * `"skitch+uuid:///$UUID"`, where `$UUID` is a random UUIDv4 value that
     * matches the `uuid` field in `evernote_skrf_chunk` (i.e. in the first
     * 16 bytes of the `skRf` chunk).
     */

    return EvernoteSkmfChunk;
  })();

  /**
   * @see {@link https://web.archive.org/web/20210302212148/https://discussion.evernote.com/forums/topic/88532-how-to-extract-annotation-information-from-annotated-evernoteskitch-images/#comment-451501|Source}
   */

  var EvernoteSkrfChunk = Png.EvernoteSkrfChunk = (function() {
    function EvernoteSkrfChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    EvernoteSkrfChunk.prototype._read = function() {
      this.uuid = this._io.readBytes(16);
      this.origImg = this._io.readBytesFull();
    }

    /**
     * Random UUIDv4 value used to identify the image. It is referenced by
     * the `skMf` chunk - see the documentation for the `json` field in
     * `evernote_skmf_chunk`.
     */

    /**
     * The original source image without annotations. It's usually a PNG
     * image as well, but it can also be a JPEG or possibly other formats.
     */

    return EvernoteSkrfChunk;
  })();

  /**
   * @see {@link https://wiki.mozilla.org/APNG_Specification#.60fcTL.60:_The_Frame_Control_Chunk|Source}
   */

  var FrameControlChunk = Png.FrameControlChunk = (function() {
    function FrameControlChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    FrameControlChunk.prototype._read = function() {
      this.sequenceNumber = this._io.readU4be();
      this.width = this._io.readU4be();
      if (!(this.width >= 1)) {
        throw new KaitaiStream.ValidationLessThanError(1, this.width, this._io, "/types/frame_control_chunk/seq/1");
      }
      if (!(this.width <= this._root.ihdr.width)) {
        throw new KaitaiStream.ValidationGreaterThanError(this._root.ihdr.width, this.width, this._io, "/types/frame_control_chunk/seq/1");
      }
      this.height = this._io.readU4be();
      if (!(this.height >= 1)) {
        throw new KaitaiStream.ValidationLessThanError(1, this.height, this._io, "/types/frame_control_chunk/seq/2");
      }
      if (!(this.height <= this._root.ihdr.height)) {
        throw new KaitaiStream.ValidationGreaterThanError(this._root.ihdr.height, this.height, this._io, "/types/frame_control_chunk/seq/2");
      }
      this.xOffset = this._io.readU4be();
      if (!(this.xOffset <= this._root.ihdr.width - this.width)) {
        throw new KaitaiStream.ValidationGreaterThanError(this._root.ihdr.width - this.width, this.xOffset, this._io, "/types/frame_control_chunk/seq/3");
      }
      this.yOffset = this._io.readU4be();
      if (!(this.yOffset <= this._root.ihdr.height - this.height)) {
        throw new KaitaiStream.ValidationGreaterThanError(this._root.ihdr.height - this.height, this.yOffset, this._io, "/types/frame_control_chunk/seq/4");
      }
      this.delayNum = this._io.readU2be();
      this.delayDen = this._io.readU2be();
      this.disposeOp = this._io.readU1();
      this.blendOp = this._io.readU1();
    }

    /**
     * Time to display this frame, in seconds
     */
    Object.defineProperty(FrameControlChunk.prototype, 'delay', {
      get: function() {
        if (this._m_delay !== undefined)
          return this._m_delay;
        this._m_delay = this.delayNum / (this.delayDen == 0 ? 100.0 : this.delayDen);
        return this._m_delay;
      }
    });

    /**
     * Sequence number of the animation chunk
     */

    /**
     * Width of the following frame
     */

    /**
     * Height of the following frame
     */

    /**
     * X position at which to render the following frame
     */

    /**
     * Y position at which to render the following frame
     */

    /**
     * Frame delay fraction numerator
     */

    /**
     * Frame delay fraction denominator
     */

    /**
     * Type of frame area disposal to be done after rendering this frame
     */

    /**
     * Type of frame area rendering for this frame
     */

    return FrameControlChunk;
  })();

  /**
   * @see {@link https://wiki.mozilla.org/APNG_Specification#.60fdAT.60:_The_Frame_Data_Chunk|Source}
   */

  var FrameDataChunk = Png.FrameDataChunk = (function() {
    function FrameDataChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    FrameDataChunk.prototype._read = function() {
      this.sequenceNumber = this._io.readU4be();
      this.frameData = this._io.readBytesFull();
    }

    /**
     * Sequence number of the animation chunk. The fcTL and fdAT chunks
     * have a 4 byte sequence number. Both chunk types share the sequence.
     * The first fcTL chunk must contain sequence number 0, and the sequence
     * numbers in the remaining fcTL and fdAT chunks must be in order, with
     * no gaps or duplicates.
     */

    /**
     * Frame data for the frame. At least one fdAT chunk is required for
     * each frame. The compressed datastream is the concatenation of the
     * contents of the data fields of all the fdAT chunks within a frame.
     */

    return FrameDataChunk;
  })();

  /**
   * @see {@link https://www.w3.org/TR/png/#11gAMA|Source}
   */

  var GamaChunk = Png.GamaChunk = (function() {
    function GamaChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    GamaChunk.prototype._read = function() {
      this.gammaInt = this._io.readU4be();
    }
    Object.defineProperty(GamaChunk.prototype, 'gammaRatio', {
      get: function() {
        if (this._m_gammaRatio !== undefined)
          return this._m_gammaRatio;
        this._m_gammaRatio = 100000.0 / this.gammaInt;
        return this._m_gammaRatio;
      }
    });

    return GamaChunk;
  })();

  /**
   * @see {@link https://www.w3.org/TR/png/#11IHDR|Source}
   */

  var IhdrChunk = Png.IhdrChunk = (function() {
    function IhdrChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    IhdrChunk.prototype._read = function() {
      this.width = this._io.readU4be();
      if (!(this.width >= 1)) {
        throw new KaitaiStream.ValidationLessThanError(1, this.width, this._io, "/types/ihdr_chunk/seq/0");
      }
      this.height = this._io.readU4be();
      if (!(this.height >= 1)) {
        throw new KaitaiStream.ValidationLessThanError(1, this.height, this._io, "/types/ihdr_chunk/seq/1");
      }
      this.bitDepth = this._io.readU1();
      if (!( ((this.bitDepth == 1) || (this.bitDepth == 2) || (this.bitDepth == 4) || (this.bitDepth == 8) || (this.bitDepth == 16)) )) {
        throw new KaitaiStream.ValidationNotAnyOfError(this.bitDepth, this._io, "/types/ihdr_chunk/seq/2");
      }
      this.colorType = this._io.readU1();
      this.compressionMethod = this._io.readU1();
      this.filterMethod = this._io.readU1();
      this.interlaceMethod = this._io.readU1();
    }

    return IhdrChunk;
  })();

  var InternationalText = Png.InternationalText = (function() {
    function InternationalText(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    InternationalText.prototype._read = function() {
      this.text = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
    }

    /**
     * Text contents ("value" of this key-value pair), written in
     * language specified in `language_tag`. Line breaks are
     * allowed.
     */

    return InternationalText;
  })();

  /**
   * International text chunk effectively allows to store key-value string pairs in
   * PNG container. Both "key" (keyword) and "value" (text) parts are
   * given in pre-defined subset of iso8859-1 without control
   * characters.
   * @see {@link https://www.w3.org/TR/png/#11iTXt|Source}
   */

  var InternationalTextChunk = Png.InternationalTextChunk = (function() {
    function InternationalTextChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    InternationalTextChunk.prototype._read = function() {
      this.keyword = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "UTF-8");
      this.compressionFlag = this._io.readU1();
      if (!( ((this.compressionFlag == 0) || (this.compressionFlag == 1)) )) {
        throw new KaitaiStream.ValidationNotAnyOfError(this.compressionFlag, this._io, "/types/international_text_chunk/seq/1");
      }
      this.compressionMethod = this._io.readU1();
      this.languageTag = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "ASCII");
      this.translatedKeyword = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "UTF-8");
      if (this.compressionFlag == 0) {
        this._raw_textPlain = this._io.readBytesFull();
        var _io__raw_textPlain = new KaitaiStream(this._raw_textPlain);
        this.textPlain = new InternationalText(_io__raw_textPlain, this, this._root);
      }
      if (this.compressionFlag == 1) {
        this._raw__raw_textZlib = this._io.readBytesFull();
        this._raw_textZlib = KaitaiStream.processZlib(this._raw__raw_textZlib);
        var _io__raw_textZlib = new KaitaiStream(this._raw_textZlib);
        this.textZlib = new InternationalText(_io__raw_textZlib, this, this._root);
      }
    }

    /**
     * Text contents ("value" of this key-value pair), written in
     * language specified in `language_tag`. Line breaks are
     * allowed.
     */
    Object.defineProperty(InternationalTextChunk.prototype, 'text', {
      get: function() {
        if (this._m_text !== undefined)
          return this._m_text;
        this._m_text = (this.compressionFlag == 0 ? this.textPlain : this.textZlib).text;
        return this._m_text;
      }
    });

    /**
     * Indicates purpose of the following text data.
     */

    /**
     * 0 = text is uncompressed, 1 = text is compressed with a
     * method specified in `compression_method`.
     */

    /**
     * Human language used in `translated_keyword` and `text`
     * attributes - should be a language code conforming to ISO
     * 646.IRV:1991.
     */

    /**
     * Keyword translated into language specified in
     * `language_tag`. Line breaks are not allowed.
     */

    return InternationalTextChunk;
  })();

  var MdcvChromaticity = Png.MdcvChromaticity = (function() {
    function MdcvChromaticity(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    MdcvChromaticity.prototype._read = function() {
      this.xInt = this._io.readU2be();
      this.yInt = this._io.readU2be();
    }
    Object.defineProperty(MdcvChromaticity.prototype, 'x', {
      get: function() {
        if (this._m_x !== undefined)
          return this._m_x;
        this._m_x = this.xInt * 0.00002;
        return this._m_x;
      }
    });
    Object.defineProperty(MdcvChromaticity.prototype, 'y', {
      get: function() {
        if (this._m_y !== undefined)
          return this._m_y;
        this._m_y = this.yInt * 0.00002;
        return this._m_y;
      }
    });

    return MdcvChromaticity;
  })();

  /**
   * @see {@link https://www.w3.org/TR/png/#mDCV-chunk|Source}
   * @see {@link https://w3c.github.io/png/Implementation_Report_3e/#mastering|Source}
   */

  var MdcvChunk = Png.MdcvChunk = (function() {
    function MdcvChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    MdcvChunk.prototype._read = function() {
      this.red = new MdcvChromaticity(this._io, this, this._root);
      this.green = new MdcvChromaticity(this._io, this, this._root);
      this.blue = new MdcvChromaticity(this._io, this, this._root);
      this.whitePoint = new MdcvChromaticity(this._io, this, this._root);
      this.maxLuminanceInt = this._io.readU4be();
      this.minLuminanceInt = this._io.readU4be();
    }

    /**
     * Maximum luminance in cd/m^2
     */
    Object.defineProperty(MdcvChunk.prototype, 'maxLuminance', {
      get: function() {
        if (this._m_maxLuminance !== undefined)
          return this._m_maxLuminance;
        this._m_maxLuminance = this.maxLuminanceInt * 0.0001;
        return this._m_maxLuminance;
      }
    });

    /**
     * Minimum luminance in cd/m^2
     */
    Object.defineProperty(MdcvChunk.prototype, 'minLuminance', {
      get: function() {
        if (this._m_minLuminance !== undefined)
          return this._m_minLuminance;
        this._m_minLuminance = this.minLuminanceInt * 0.0001;
        return this._m_minLuminance;
      }
    });

    return MdcvChunk;
  })();

  /**
   * "Physical size" chunk stores data that allows to translate
   * logical pixels into physical units (meters, etc) and vice-versa.
   * @see {@link https://www.w3.org/TR/png/#11pHYs|Source}
   */

  var PhysChunk = Png.PhysChunk = (function() {
    function PhysChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    PhysChunk.prototype._read = function() {
      this.pixelsPerUnitX = this._io.readU4be();
      this.pixelsPerUnitY = this._io.readU4be();
      this.unit = this._io.readU1();
    }

    /**
     * Number of pixels per physical unit (typically, 1 meter) by X
     * axis.
     */

    /**
     * Number of pixels per physical unit (typically, 1 meter) by Y
     * axis.
     */

    return PhysChunk;
  })();

  /**
   * @see {@link https://www.w3.org/TR/png/#11PLTE|Source}
   */

  var PlteChunk = Png.PlteChunk = (function() {
    function PlteChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    PlteChunk.prototype._read = function() {
      this.entries = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.entries.push(new Rgb(this._io, this, this._root));
        i++;
      }
    }

    return PlteChunk;
  })();

  var Rgb = Png.Rgb = (function() {
    function Rgb(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Rgb.prototype._read = function() {
      this.r = this._io.readU1();
      this.g = this._io.readU1();
      this.b = this._io.readU1();
    }

    return Rgb;
  })();

  /**
   * @see {@link https://www.w3.org/TR/png/#11sRGB|Source}
   */

  var SrgbChunk = Png.SrgbChunk = (function() {
    SrgbChunk.Intent = Object.freeze({
      PERCEPTUAL: 0,
      RELATIVE_COLORIMETRIC: 1,
      SATURATION: 2,
      ABSOLUTE_COLORIMETRIC: 3,

      0: "PERCEPTUAL",
      1: "RELATIVE_COLORIMETRIC",
      2: "SATURATION",
      3: "ABSOLUTE_COLORIMETRIC",
    });

    function SrgbChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    SrgbChunk.prototype._read = function() {
      this.renderIntent = this._io.readU1();
    }

    return SrgbChunk;
  })();

  /**
   * Text chunk effectively allows to store key-value string pairs in
   * PNG container. Both "key" (keyword) and "value" (text) parts are
   * given in pre-defined subset of iso8859-1 without control
   * characters.
   * @see {@link https://www.w3.org/TR/png/#11tEXt|Source}
   */

  var TextChunk = Png.TextChunk = (function() {
    function TextChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    TextChunk.prototype._read = function() {
      this.keyword = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "ISO-8859-1");
      this.text = KaitaiStream.bytesToStr(this._io.readBytesFull(), "ISO-8859-1");
    }

    /**
     * Indicates purpose of the following text data.
     */

    return TextChunk;
  })();

  /**
   * Time chunk stores time stamp of last modification of this image,
   * up to 1 second precision in UTC timezone.
   * @see {@link https://www.w3.org/TR/png/#11tIME|Source}
   */

  var TimeChunk = Png.TimeChunk = (function() {
    function TimeChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    TimeChunk.prototype._read = function() {
      this.year = this._io.readU2be();
      this.month = this._io.readU1();
      this.day = this._io.readU1();
      this.hour = this._io.readU1();
      this.minute = this._io.readU1();
      this.second = this._io.readU1();
    }

    return TimeChunk;
  })();

  return Png;
})();
Png_.Png = Png;
});
