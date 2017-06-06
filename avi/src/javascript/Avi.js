// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * @see {@link https://msdn.microsoft.com/en-us/library/ms779636.aspx|Source}
 */

var Avi = (function() {
  Avi.ChunkType = Object.freeze({
    IDX1: 829973609,
    JUNK: 1263424842,
    INFO: 1330007625,
    ISFT: 1413894985,
    LIST: 1414744396,
    STRF: 1718776947,
    AVIH: 1751742049,
    STRH: 1752331379,
    MOVI: 1769369453,
    HDRL: 1819436136,
    STRL: 1819440243,

    829973609: "IDX1",
    1263424842: "JUNK",
    1330007625: "INFO",
    1413894985: "ISFT",
    1414744396: "LIST",
    1718776947: "STRF",
    1751742049: "AVIH",
    1752331379: "STRH",
    1769369453: "MOVI",
    1819436136: "HDRL",
    1819440243: "STRL",
  });

  Avi.StreamType = Object.freeze({
    MIDS: 1935960429,
    VIDS: 1935960438,
    AUDS: 1935963489,
    TXTS: 1937012852,

    1935960429: "MIDS",
    1935960438: "VIDS",
    1935963489: "AUDS",
    1937012852: "TXTS",
  });

  Avi.HandlerType = Object.freeze({
    MP3: 85,
    AC3: 8192,
    DTS: 8193,
    CVID: 1684633187,
    XVID: 1684633208,

    85: "MP3",
    8192: "AC3",
    8193: "DTS",
    1684633187: "CVID",
    1684633208: "XVID",
  });

  function Avi(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Avi.prototype._read = function() {
    this.magic1 = this._io.ensureFixedContents([82, 73, 70, 70]);
    this.fileSize = this._io.readU4le();
    this.magic2 = this._io.ensureFixedContents([65, 86, 73, 32]);
    this._raw_data = this._io.readBytes((this.fileSize - 4));
    var _io__raw_data = new KaitaiStream(this._raw_data);
    this.data = new Blocks(_io__raw_data, this, this._root);
  }

  var ListBody = Avi.ListBody = (function() {
    function ListBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ListBody.prototype._read = function() {
      this.listType = this._io.readU4le();
      this.data = new Blocks(this._io, this, this._root);
    }

    return ListBody;
  })();

  var Rect = Avi.Rect = (function() {
    function Rect(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Rect.prototype._read = function() {
      this.left = this._io.readS2le();
      this.top = this._io.readS2le();
      this.right = this._io.readS2le();
      this.bottom = this._io.readS2le();
    }

    return Rect;
  })();

  var Blocks = Avi.Blocks = (function() {
    function Blocks(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Blocks.prototype._read = function() {
      this.entries = [];
      while (!this._io.isEof()) {
        this.entries.push(new Block(this._io, this, this._root));
      }
    }

    return Blocks;
  })();

  /**
   * Main header of an AVI file, defined as AVIMAINHEADER structure
   * @see {@link https://msdn.microsoft.com/en-us/library/ms779632.aspx|Source}
   */

  var AvihBody = Avi.AvihBody = (function() {
    function AvihBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    AvihBody.prototype._read = function() {
      this.microSecPerFrame = this._io.readU4le();
      this.maxBytesPerSec = this._io.readU4le();
      this.paddingGranularity = this._io.readU4le();
      this.flags = this._io.readU4le();
      this.totalFrames = this._io.readU4le();
      this.initialFrames = this._io.readU4le();
      this.streams = this._io.readU4le();
      this.suggestedBufferSize = this._io.readU4le();
      this.width = this._io.readU4le();
      this.height = this._io.readU4le();
      this.reserved = this._io.readBytes(16);
    }

    return AvihBody;
  })();

  var Block = Avi.Block = (function() {
    function Block(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Block.prototype._read = function() {
      this.fourCc = this._io.readU4le();
      this.blockSize = this._io.readU4le();
      switch (this.fourCc) {
      case Avi.ChunkType.LIST:
        this._raw_data = this._io.readBytes(this.blockSize);
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new ListBody(_io__raw_data, this, this._root);
        break;
      case Avi.ChunkType.AVIH:
        this._raw_data = this._io.readBytes(this.blockSize);
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new AvihBody(_io__raw_data, this, this._root);
        break;
      case Avi.ChunkType.STRH:
        this._raw_data = this._io.readBytes(this.blockSize);
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new StrhBody(_io__raw_data, this, this._root);
        break;
      default:
        this.data = this._io.readBytes(this.blockSize);
        break;
      }
    }

    return Block;
  })();

  /**
   * Stream header (one header per stream), defined as AVISTREAMHEADER structure
   * @see {@link https://msdn.microsoft.com/en-us/library/ms779638.aspx|Source}
   */

  var StrhBody = Avi.StrhBody = (function() {
    function StrhBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    StrhBody.prototype._read = function() {
      this.fccType = this._io.readU4le();
      this.fccHandler = this._io.readU4le();
      this.flags = this._io.readU4le();
      this.priority = this._io.readU2le();
      this.language = this._io.readU2le();
      this.initialFrames = this._io.readU4le();
      this.scale = this._io.readU4le();
      this.rate = this._io.readU4le();
      this.start = this._io.readU4le();
      this.length = this._io.readU4le();
      this.suggestedBufferSize = this._io.readU4le();
      this.quality = this._io.readU4le();
      this.sampleSize = this._io.readU4le();
      this.frame = new Rect(this._io, this, this._root);
    }

    /**
     * Type of the data contained in the stream
     */

    /**
     * Type of preferred data handler for the stream (specifies codec for audio / video streams)
     */

    return StrhBody;
  })();

  /**
   * Stream format description
   */

  var StrfBody = Avi.StrfBody = (function() {
    function StrfBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    StrfBody.prototype._read = function() {
    }

    return StrfBody;
  })();

  return Avi;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Avi', [], function() {
    return Avi;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Avi;
}
