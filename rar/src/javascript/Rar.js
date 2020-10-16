// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Rar = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * RAR is a archive format used by popular proprietary RAR archiver,
 * created by Eugene Roshal. There are two major versions of format
 * (v1.5-4.0 and RAR v5+).
 * 
 * File format essentially consists of a linear sequence of
 * blocks. Each block has fixed header and custom body (that depends on
 * block type), so it's possible to skip block even if one doesn't know
 * how to process a certain block type.
 * @see {@link http://acritum.com/winrar/rar-format|}
 */

var Rar = (function() {
  Rar.BlockTypes = Object.freeze({
    MARKER: 114,
    ARCHIVE_HEADER: 115,
    FILE_HEADER: 116,
    OLD_STYLE_COMMENT_HEADER: 117,
    OLD_STYLE_AUTHENTICITY_INFO_76: 118,
    OLD_STYLE_SUBBLOCK: 119,
    OLD_STYLE_RECOVERY_RECORD: 120,
    OLD_STYLE_AUTHENTICITY_INFO_79: 121,
    SUBBLOCK: 122,
    TERMINATOR: 123,

    114: "MARKER",
    115: "ARCHIVE_HEADER",
    116: "FILE_HEADER",
    117: "OLD_STYLE_COMMENT_HEADER",
    118: "OLD_STYLE_AUTHENTICITY_INFO_76",
    119: "OLD_STYLE_SUBBLOCK",
    120: "OLD_STYLE_RECOVERY_RECORD",
    121: "OLD_STYLE_AUTHENTICITY_INFO_79",
    122: "SUBBLOCK",
    123: "TERMINATOR",
  });

  Rar.Oses = Object.freeze({
    MS_DOS: 0,
    OS_2: 1,
    WINDOWS: 2,
    UNIX: 3,
    MAC_OS: 4,
    BEOS: 5,

    0: "MS_DOS",
    1: "OS_2",
    2: "WINDOWS",
    3: "UNIX",
    4: "MAC_OS",
    5: "BEOS",
  });

  Rar.Methods = Object.freeze({
    STORE: 48,
    FASTEST: 49,
    FAST: 50,
    NORMAL: 51,
    GOOD: 52,
    BEST: 53,

    48: "STORE",
    49: "FASTEST",
    50: "FAST",
    51: "NORMAL",
    52: "GOOD",
    53: "BEST",
  });

  function Rar(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Rar.prototype._read = function() {
    this.magic = new MagicSignature(this._io, this, this._root);
    this.blocks = [];
    var i = 0;
    while (!this._io.isEof()) {
      switch (this.magic.version) {
      case 0:
        this.blocks.push(new Block(this._io, this, this._root));
        break;
      case 1:
        this.blocks.push(new BlockV5(this._io, this, this._root));
        break;
      }
      i++;
    }
  }

  var BlockV5 = Rar.BlockV5 = (function() {
    function BlockV5(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BlockV5.prototype._read = function() {
    }

    return BlockV5;
  })();

  /**
   * Basic block that RAR files consist of. There are several block
   * types (see `block_type`), which have different `body` and
   * `add_body`.
   */

  var Block = Rar.Block = (function() {
    function Block(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Block.prototype._read = function() {
      this.crc16 = this._io.readU2le();
      this.blockType = this._io.readU1();
      this.flags = this._io.readU2le();
      this.blockSize = this._io.readU2le();
      if (this.hasAdd) {
        this.addSize = this._io.readU4le();
      }
      switch (this.blockType) {
      case Rar.BlockTypes.FILE_HEADER:
        this._raw_body = this._io.readBytes(this.bodySize);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new BlockFileHeader(_io__raw_body, this, this._root);
        break;
      default:
        this.body = this._io.readBytes(this.bodySize);
        break;
      }
      if (this.hasAdd) {
        this.addBody = this._io.readBytes(this.addSize);
      }
    }

    /**
     * True if block has additional content attached to it
     */
    Object.defineProperty(Block.prototype, 'hasAdd', {
      get: function() {
        if (this._m_hasAdd !== undefined)
          return this._m_hasAdd;
        this._m_hasAdd = (this.flags & 32768) != 0;
        return this._m_hasAdd;
      }
    });
    Object.defineProperty(Block.prototype, 'headerSize', {
      get: function() {
        if (this._m_headerSize !== undefined)
          return this._m_headerSize;
        this._m_headerSize = (this.hasAdd ? 11 : 7);
        return this._m_headerSize;
      }
    });
    Object.defineProperty(Block.prototype, 'bodySize', {
      get: function() {
        if (this._m_bodySize !== undefined)
          return this._m_bodySize;
        this._m_bodySize = (this.blockSize - this.headerSize);
        return this._m_bodySize;
      }
    });

    /**
     * CRC16 of whole block or some part of it (depends on block type)
     */

    /**
     * Size of block (header + body, but without additional content)
     */

    /**
     * Size of additional content in this block
     */

    /**
     * Additional content in this block
     */

    return Block;
  })();

  var BlockFileHeader = Rar.BlockFileHeader = (function() {
    function BlockFileHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BlockFileHeader.prototype._read = function() {
      this.lowUnpSize = this._io.readU4le();
      this.hostOs = this._io.readU1();
      this.fileCrc32 = this._io.readU4le();
      this.fileTime = new DosTime(this._io, this, this._root);
      this.rarVersion = this._io.readU1();
      this.method = this._io.readU1();
      this.nameSize = this._io.readU2le();
      this.attr = this._io.readU4le();
      if ((this._parent.flags & 256) != 0) {
        this.highPackSize = this._io.readU4le();
      }
      this.fileName = this._io.readBytes(this.nameSize);
      if ((this._parent.flags & 1024) != 0) {
        this.salt = this._io.readU8le();
      }
    }

    /**
     * Uncompressed file size (lower 32 bits, if 64-bit header flag is present)
     */

    /**
     * Operating system used for archiving
     */

    /**
     * Date and time in standard MS DOS format
     */

    /**
     * RAR version needed to extract file (Version number is encoded as 10 * Major version + minor version.)
     */

    /**
     * Compression method
     */

    /**
     * File name size
     */

    /**
     * File attributes
     */

    /**
     * Compressed file size, high 32 bits, only if 64-bit header flag is present
     */

    return BlockFileHeader;
  })();

  /**
   * RAR uses either 7-byte magic for RAR versions 1.5 to 4.0, and
   * 8-byte magic (and pretty different block format) for v5+. This
   * type would parse and validate both versions of signature. Note
   * that actually this signature is a valid RAR "block": in theory,
   * one can omit signature reading at all, and read this normally,
   * as a block, if exact RAR version is known (and thus it's
   * possible to choose correct block format).
   */

  var MagicSignature = Rar.MagicSignature = (function() {
    function MagicSignature(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MagicSignature.prototype._read = function() {
      this.magic1 = this._io.readBytes(6);
      if (!((KaitaiStream.byteArrayCompare(this.magic1, [82, 97, 114, 33, 26, 7]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([82, 97, 114, 33, 26, 7], this.magic1, this._io, "/types/magic_signature/seq/0");
      }
      this.version = this._io.readU1();
      if (this.version == 1) {
        this.magic3 = this._io.readBytes(1);
        if (!((KaitaiStream.byteArrayCompare(this.magic3, [0]) == 0))) {
          throw new KaitaiStream.ValidationNotEqualError([0], this.magic3, this._io, "/types/magic_signature/seq/2");
        }
      }
    }

    /**
     * Fixed part of file's magic signature that doesn't change with RAR version
     */

    /**
     * Variable part of magic signature: 0 means old (RAR 1.5-4.0)
     * format, 1 means new (RAR 5+) format
     */

    /**
     * New format (RAR 5+) magic contains extra byte
     */

    return MagicSignature;
  })();

  var DosTime = Rar.DosTime = (function() {
    function DosTime(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DosTime.prototype._read = function() {
      this.time = this._io.readU2le();
      this.date = this._io.readU2le();
    }
    Object.defineProperty(DosTime.prototype, 'month', {
      get: function() {
        if (this._m_month !== undefined)
          return this._m_month;
        this._m_month = ((this.date & 480) >>> 5);
        return this._m_month;
      }
    });
    Object.defineProperty(DosTime.prototype, 'seconds', {
      get: function() {
        if (this._m_seconds !== undefined)
          return this._m_seconds;
        this._m_seconds = ((this.time & 31) * 2);
        return this._m_seconds;
      }
    });
    Object.defineProperty(DosTime.prototype, 'year', {
      get: function() {
        if (this._m_year !== undefined)
          return this._m_year;
        this._m_year = (((this.date & 65024) >>> 9) + 1980);
        return this._m_year;
      }
    });
    Object.defineProperty(DosTime.prototype, 'minutes', {
      get: function() {
        if (this._m_minutes !== undefined)
          return this._m_minutes;
        this._m_minutes = ((this.time & 2016) >>> 5);
        return this._m_minutes;
      }
    });
    Object.defineProperty(DosTime.prototype, 'day', {
      get: function() {
        if (this._m_day !== undefined)
          return this._m_day;
        this._m_day = (this.date & 31);
        return this._m_day;
      }
    });
    Object.defineProperty(DosTime.prototype, 'hours', {
      get: function() {
        if (this._m_hours !== undefined)
          return this._m_hours;
        this._m_hours = ((this.time & 63488) >>> 11);
        return this._m_hours;
      }
    });

    return DosTime;
  })();

  /**
   * File format signature to validate that it is indeed a RAR archive
   */

  /**
   * Sequence of blocks that constitute the RAR file
   */

  return Rar;
})();
return Rar;
}));
