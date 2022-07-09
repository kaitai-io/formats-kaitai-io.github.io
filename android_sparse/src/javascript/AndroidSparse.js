// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.AndroidSparse = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * The Android sparse format is a format to more efficiently store files
 * for for example firmware updates to save on bandwidth. Files in sparse
 * format first have to be converted back to their original format.
 * 
 * A tool to create images for testing can be found in the Android source code tree:
 * 
 * <https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse> - `img2simg.c`
 * 
 * Note: this is not the same as the Android sparse data image format.
 * @see {@link https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_format.h|Source}
 * @see {@link https://source.android.com/devices/bootloader/images#sparse-image-format|Source}
 */

var AndroidSparse = (function() {
  AndroidSparse.ChunkTypes = Object.freeze({
    RAW: 51905,
    FILL: 51906,
    DONT_CARE: 51907,
    CRC32: 51908,

    51905: "RAW",
    51906: "FILL",
    51907: "DONT_CARE",
    51908: "CRC32",
  });

  function AndroidSparse(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  AndroidSparse.prototype._read = function() {
    this.headerPrefix = new FileHeaderPrefix(this._io, this, this._root);
    this._raw_header = this._io.readBytes((this.headerPrefix.lenHeader - 10));
    var _io__raw_header = new KaitaiStream(this._raw_header);
    this.header = new FileHeader(_io__raw_header, this, this._root);
    this.chunks = [];
    for (var i = 0; i < this.header.numChunks; i++) {
      this.chunks.push(new Chunk(this._io, this, this._root));
    }
  }

  var FileHeaderPrefix = AndroidSparse.FileHeaderPrefix = (function() {
    function FileHeaderPrefix(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FileHeaderPrefix.prototype._read = function() {
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [58, 255, 38, 237]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([58, 255, 38, 237], this.magic, this._io, "/types/file_header_prefix/seq/0");
      }
      this.version = new Version(this._io, this, this._root);
      this.lenHeader = this._io.readU2le();
    }

    /**
     * internal; access `_root.header.version` instead
     */

    /**
     * internal; access `_root.header.len_header` instead
     */

    return FileHeaderPrefix;
  })();

  var FileHeader = AndroidSparse.FileHeader = (function() {
    function FileHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FileHeader.prototype._read = function() {
      this.lenChunkHeader = this._io.readU2le();
      this.blockSize = this._io.readU4le();
      var _ = this.blockSize;
      if (!(KaitaiStream.mod(_, 4) == 0)) {
        throw new KaitaiStream.ValidationExprError(this.blockSize, this._io, "/types/file_header/seq/1");
      }
      this.numBlocks = this._io.readU4le();
      this.numChunks = this._io.readU4le();
      this.checksum = this._io.readU4le();
    }
    Object.defineProperty(FileHeader.prototype, 'version', {
      get: function() {
        if (this._m_version !== undefined)
          return this._m_version;
        this._m_version = this._root.headerPrefix.version;
        return this._m_version;
      }
    });

    /**
     * size of file header, should be 28
     */
    Object.defineProperty(FileHeader.prototype, 'lenHeader', {
      get: function() {
        if (this._m_lenHeader !== undefined)
          return this._m_lenHeader;
        this._m_lenHeader = this._root.headerPrefix.lenHeader;
        return this._m_lenHeader;
      }
    });

    /**
     * size of chunk header, should be 12
     */

    /**
     * block size in bytes, must be a multiple of 4
     */

    /**
     * blocks in the original data
     */

    /**
     * CRC32 checksum of the original data
     * 
     * In practice always 0; if checksum writing is requested, a CRC32 chunk is written
     * at the end of the file instead. The canonical `libsparse` implementation does this
     * and other implementations tend to follow it, see
     * <https://gitlab.com/teskje/android-sparse-rs/-/blob/57c2577/src/write.rs#L112-114>
     */

    return FileHeader;
  })();

  var Chunk = AndroidSparse.Chunk = (function() {
    function Chunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Chunk.prototype._read = function() {
      this._raw_header = this._io.readBytes(this._root.header.lenChunkHeader);
      var _io__raw_header = new KaitaiStream(this._raw_header);
      this.header = new ChunkHeader(_io__raw_header, this, this._root);
      switch (this.header.chunkType) {
      case AndroidSparse.ChunkTypes.CRC32:
        this.body = this._io.readU4le();
        break;
      default:
        this.body = this._io.readBytes(this.header.lenBody);
        break;
      }
    }

    var ChunkHeader = Chunk.ChunkHeader = (function() {
      function ChunkHeader(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      ChunkHeader.prototype._read = function() {
        this.chunkType = this._io.readU2le();
        this.reserved1 = this._io.readU2le();
        this.numBodyBlocks = this._io.readU4le();
        this.lenChunk = this._io.readU4le();
        if (!(this.lenChunk == (this.lenBodyExpected != -1 ? (this._root.header.lenChunkHeader + this.lenBodyExpected) : this.lenChunk))) {
          throw new KaitaiStream.ValidationNotEqualError((this.lenBodyExpected != -1 ? (this._root.header.lenChunkHeader + this.lenBodyExpected) : this.lenChunk), this.lenChunk, this._io, "/types/chunk/types/chunk_header/seq/3");
        }
      }
      Object.defineProperty(ChunkHeader.prototype, 'lenBody', {
        get: function() {
          if (this._m_lenBody !== undefined)
            return this._m_lenBody;
          this._m_lenBody = (this.lenChunk - this._root.header.lenChunkHeader);
          return this._m_lenBody;
        }
      });

      /**
       * @see {@link https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#184|Source}
       * @see {@link https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#215|Source}
       * @see {@link https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#249|Source}
       * @see {@link https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#270|Source}
       */
      Object.defineProperty(ChunkHeader.prototype, 'lenBodyExpected', {
        get: function() {
          if (this._m_lenBodyExpected !== undefined)
            return this._m_lenBodyExpected;
          this._m_lenBodyExpected = (this.chunkType == AndroidSparse.ChunkTypes.RAW ? (this._root.header.blockSize * this.numBodyBlocks) : (this.chunkType == AndroidSparse.ChunkTypes.FILL ? 4 : (this.chunkType == AndroidSparse.ChunkTypes.DONT_CARE ? 0 : (this.chunkType == AndroidSparse.ChunkTypes.CRC32 ? 4 : -1))));
          return this._m_lenBodyExpected;
        }
      });

      /**
       * size of the chunk body in blocks in output image
       */

      /**
       * in bytes of chunk input file including chunk header and data
       */

      return ChunkHeader;
    })();

    return Chunk;
  })();

  var Version = AndroidSparse.Version = (function() {
    function Version(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Version.prototype._read = function() {
      this.major = this._io.readU2le();
      if (!(this.major == 1)) {
        throw new KaitaiStream.ValidationNotEqualError(1, this.major, this._io, "/types/version/seq/0");
      }
      this.minor = this._io.readU2le();
    }

    return Version;
  })();

  /**
   * internal; access `_root.header` instead
   */

  return AndroidSparse;
})();
return AndroidSparse;
}));
