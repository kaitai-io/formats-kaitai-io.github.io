// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Zchunk || (root.Zchunk = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Zchunk_, KaitaiStream) {
/**
 * @see {@link https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt|Source}
 */

var Zchunk = (function() {
  Zchunk.ChecksumTypes = Object.freeze({
    SHA1: 0,
    SHA256: 1,
    SHA512: 2,
    SHA512_128: 3,

    0: "SHA1",
    1: "SHA256",
    2: "SHA512",
    3: "SHA512_128",
  });

  Zchunk.CompressionTypes = Object.freeze({
    NONE: 0,
    ZSTD: 2,

    0: "NONE",
    2: "ZSTD",
  });

  function Zchunk(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Zchunk.prototype._read = function() {
    this.lead = new HeaderLead(this._io, this, this._root);
    this._raw_headerRest = this._io.readBytes(this.lead.lenHeaderRest.value);
    var _io__raw_headerRest = new KaitaiStream(this._raw_headerRest);
    this.headerRest = new HeaderWithoutLead(_io__raw_headerRest, this, this._root);
    this.dict = this._io.readBytes(this.headerRest.index.lenDict.value);
    if (!(this.lead.isDetachedHeader)) {
      this.chunks = [];
      for (var i = 0; i < this.headerRest.index.chunksMetadata.length; i++) {
        this.chunks.push(this._io.readBytes(this.headerRest.index.chunksMetadata[i].lenChunk.value));
      }
    }
  }

  var ChecksumType = Zchunk.ChecksumType = (function() {
    function ChecksumType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ChecksumType.prototype._read = function() {
      this.raw = new CompressedInteger(this._io, this, this._root);
      var _ = this.raw;
      if (!(this.lenChecksum != 0)) {
        throw new KaitaiStream.ValidationExprError(this.raw, this._io, "/types/checksum_type/seq/0");
      }
    }
    Object.defineProperty(ChecksumType.prototype, 'lenChecksum', {
      get: function() {
        if (this._m_lenChecksum !== undefined)
          return this._m_lenChecksum;
        this._m_lenChecksum = (this.value == Zchunk.ChecksumTypes.SHA1 ? 20 : (this.value == Zchunk.ChecksumTypes.SHA256 ? 32 : (this.value == Zchunk.ChecksumTypes.SHA512 ? 64 : (this.value == Zchunk.ChecksumTypes.SHA512_128 ? 16 : 0))));
        return this._m_lenChecksum;
      }
    });
    Object.defineProperty(ChecksumType.prototype, 'value', {
      get: function() {
        if (this._m_value !== undefined)
          return this._m_value;
        this._m_value = this.raw.value;
        return this._m_value;
      }
    });

    /**
     * Raw integer, don't read this field - access `value` instead.
     */

    return ChecksumType;
  })();

  var Chunk = Zchunk.Chunk = (function() {
    function Chunk(_io, _parent, _root, lenChecksum, hasDataStreams, hasUncompressedSource) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;
      this.lenChecksum = lenChecksum;
      this.hasDataStreams = hasDataStreams;
      this.hasUncompressedSource = hasUncompressedSource;

      this._read();
    }
    Chunk.prototype._read = function() {
      if (this.hasDataStreams) {
        this.chunkStream = new CompressedInteger(this._io, this, this._root);
      }
      this.chunkChecksum = this._io.readBytes(this.lenChecksum);
      if (this.hasUncompressedSource) {
        this.uncompressedChunkChecksum = this._io.readBytes(this.lenChecksum);
      }
      this.lenChunk = new CompressedInteger(this._io, this, this._root);
      this.lenUncompressedChunk = new CompressedInteger(this._io, this, this._root);
    }

    /**
     * Checksum of the uncompressed chunk. Used to detect whether a chunk
     * from an uncompressed source is identical to the compressed chunk.
     */

    return Chunk;
  })();

  /**
   * Like `/common/vlq_base128_le` (LEB128), but the logic of the
   * "continuation" flag in the most significant bit is inverted, so instead of
   * `has_next`, it is called `is_last` (if the highest bit is set to zero, it
   * means "continue", whereas in standard LEB128, the highest bit set to
   * **one** means "continue"). Therefore, we cannot simply import
   * `/common/vlq_base128_le` and use it, because it is incompatible.
   */

  var CompressedInteger = Zchunk.CompressedInteger = (function() {
    function CompressedInteger(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    CompressedInteger.prototype._read = function() {
      this.groups = [];
      var i = 0;
      do {
        var _ = new Group(this._io, this, this._root, i);
        this.groups.push(_);
        i++;
      } while (!(_.isLast));
    }

    /**
     * One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
     */

    var Group = CompressedInteger.Group = (function() {
      function Group(_io, _parent, _root, idx) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this.idx = idx;

        this._read();
      }
      Group.prototype._read = function() {
        this.isLast = this._io.readBitsIntBe(1) != 0;
        if (!(this.isLast == (this.idx == 9 ? true : this.isLast))) {
          throw new KaitaiStream.ValidationNotEqualError((this.idx == 9 ? true : this.isLast), this.isLast, this._io, "/types/compressed_integer/types/group/seq/0");
        }
        this.value = this._io.readBitsIntBe(7);
        if (!(this.value <= (this.idx == 9 ? 1 : 127))) {
          throw new KaitaiStream.ValidationGreaterThanError((this.idx == 9 ? 1 : 127), this.value, this._io, "/types/compressed_integer/types/group/seq/1");
        }
      }

      /**
       * If `true`, then this is the last byte of the compressed integer.
       * 
       * Since this implementation only supports serialized values up to 10
       * bytes, this must be `true` in the 10th group (`groups[9]`).
       */

      /**
       * The 7-bit (base128) numeric value chunk of this group
       * 
       * Since this implementation only supports integer values up to 64 bits,
       * the `value` in the 10th group (`groups[9]`) can only be `0` or `1`
       * (otherwise the width of the represented value would be 65 bits or
       * more, which is not supported).
       */

      return Group;
    })();
    Object.defineProperty(CompressedInteger.prototype, 'len', {
      get: function() {
        if (this._m_len !== undefined)
          return this._m_len;
        this._m_len = this.groups.length;
        return this._m_len;
      }
    });

    /**
     * Resulting unsigned value as normal integer
     */
    Object.defineProperty(CompressedInteger.prototype, 'value', {
      get: function() {
        if (this._m_value !== undefined)
          return this._m_value;
        this._m_value = (((((((((this.groups[0].value | (this.len >= 2 ? this.groups[1].value << 7 : 0)) | (this.len >= 3 ? this.groups[2].value << 14 : 0)) | (this.len >= 4 ? this.groups[3].value << 21 : 0)) | (this.len >= 5 ? this.groups[4].value << 28 : 0)) | (this.len >= 6 ? this.groups[5].value << 35 : 0)) | (this.len >= 7 ? this.groups[6].value << 42 : 0)) | (this.len >= 8 ? this.groups[7].value << 49 : 0)) | (this.len >= 9 ? this.groups[8].value << 56 : 0)) | (this.len >= 10 ? this.groups[9].value << 63 : 0));
        return this._m_value;
      }
    });

    return CompressedInteger;
  })();

  var HeaderLead = Zchunk.HeaderLead = (function() {
    function HeaderLead(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    HeaderLead.prototype._read = function() {
      this.magic = this._io.readBytes(5);
      if (!( (((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([0, 90, 67, 75, 49])) == 0)) || ((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([0, 90, 72, 82, 49])) == 0))) )) {
        throw new KaitaiStream.ValidationNotAnyOfError(this.magic, this._io, "/types/header_lead/seq/0");
      }
      this.overallChecksumType = new ChecksumType(this._io, this, this._root);
      this.lenHeaderRest = new CompressedInteger(this._io, this, this._root);
      this.headerChecksum = this._io.readBytes(this.overallChecksumType.lenChecksum);
    }

    /**
     * Determines whether this file is a zchunk detached header (`.zhr`). If
     * not, it is a complete zchunk file (`.zck`).
     */
    Object.defineProperty(HeaderLead.prototype, 'isDetachedHeader', {
      get: function() {
        if (this._m_isDetachedHeader !== undefined)
          return this._m_isDetachedHeader;
        this._m_isDetachedHeader = this.magic[2] == 72;
        return this._m_isDetachedHeader;
      }
    });

    /**
     * There are two valid magic numbers for zchunk files:
     * 
     * * `'\0ZCK1'` identifies a zchunk version 1 file (`.zck`)
     * * `'\0ZHR1'` identifies a zchunk version 1 detached header file (`.zhr`)
     */

    /**
     * Type of the checksum used for `header_checksum` and
     * `_root.header_rest.preface.data_checksum`.
     */

    /**
     * Size of the header, not including the lead
     */

    /**
     * Checksum of the entire header, which consists of `_root.lead` and
     * `_root.header_rest` (i.e. everything from the beginning of the file to
     * the end of `_root.header_rest`), not including the `header_checksum`
     * field itself (i.e. the input for the checksum algorithm is a
     * concatenation of the bytes preceding the `header_checksum` field with
     * the bytes following it).
     * 
     * For detached headers, the checksum is calculated as if the `magic`
     * field were set to `'\0ZCK1'`, so that it matches the checksum in the
     * full zchunk file.
     */

    return HeaderLead;
  })();

  var HeaderWithoutLead = Zchunk.HeaderWithoutLead = (function() {
    function HeaderWithoutLead(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    HeaderWithoutLead.prototype._read = function() {
      this.preface = new Preface(this._io, this, this._root);
      this.lenIndex = new CompressedInteger(this._io, this, this._root);
      this._raw_index = this._io.readBytes(this.lenIndex.value);
      var _io__raw_index = new KaitaiStream(this._raw_index);
      this.index = new Index(_io__raw_index, this, this._root);
      this.numSignatures = new CompressedInteger(this._io, this, this._root);
      var _ = this.numSignatures;
      if (!(_.value == 0)) {
        throw new KaitaiStream.ValidationExprError(this.numSignatures, this._io, "/types/header_without_lead/seq/3");
      }
    }

    /**
     * Must be 0. The reference implementation also rejects any file with a
     * non-zero "Signature count", throwing a fatal error stating "Signatures
     * aren't supported yet" - see
     * [`src/lib/header.c:259-264`](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/src/lib/header.c#L259-L264).
     * 
     * Although the structure of signatures is defined [in the official
     * textual
     * specification](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L219-L252),
     * no signature types are defined, and as of this writing no publicly
     * known implementation generates or interprets these signatures.
     * Therefore, we've decided not to implement them here either.
     * 
     * For more details, see
     * <https://github.com/kaitai-io/kaitai_struct_formats/pull/539#discussion_r3713109887>.
     */

    return HeaderWithoutLead;
  })();

  var Index = Zchunk.Index = (function() {
    function Index(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Index.prototype._read = function() {
      this.chunkChecksumType = new ChecksumType(this._io, this, this._root);
      this.numChunks = new CompressedInteger(this._io, this, this._root);
      var _ = this.numChunks;
      if (!(_.value >= 1)) {
        throw new KaitaiStream.ValidationExprError(this.numChunks, this._io, "/types/index/seq/1");
      }
      if (this._parent.preface.hasDataStreams) {
        this.dictStream = new CompressedInteger(this._io, this, this._root);
        var _ = this.dictStream;
        if (!(_.value == 0)) {
          throw new KaitaiStream.ValidationExprError(this.dictStream, this._io, "/types/index/seq/2");
        }
      }
      this.dictChecksum = this._io.readBytes(this.chunkChecksumType.lenChecksum);
      if (this._parent.preface.hasUncompressedSource) {
        this.uncompressedDictChecksum = this._io.readBytes(this.chunkChecksumType.lenChecksum);
      }
      this.lenDict = new CompressedInteger(this._io, this, this._root);
      this.lenUncompressedDict = new CompressedInteger(this._io, this, this._root);
      this.chunksMetadata = [];
      for (var i = 0; i < this.numDataChunks; i++) {
        this.chunksMetadata.push(new Chunk(this._io, this, this._root, this.chunkChecksumType.lenChecksum, this._parent.preface.hasDataStreams, this._parent.preface.hasUncompressedSource));
      }
    }

    /**
     * Number of data chunks. `num_chunks` counts the dictionary as chunk 0,
     * so it is one greater than this number.
     */
    Object.defineProperty(Index.prototype, 'numDataChunks', {
      get: function() {
        if (this._m_numDataChunks !== undefined)
          return this._m_numDataChunks;
        this._m_numDataChunks = this.numChunks.value - 1;
        return this._m_numDataChunks;
      }
    });

    /**
     * Type of the checksum used for `dict_checksum` and for all
     * `chunks_metadata[...].chunk_checksum` and
     * `chunks_metadata[...].uncompressed_chunk_checksum`.
     */

    /**
     * Number of chunks, **including** the dictionary chunk.
     * 
     * Must be at least 1, because the dictionary chunk is always present,
     * even if it is empty. The reference implementation also fails when the
     * number of chunks is 0, see
     * [`src/lib/index/index_read.c:181-184`](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/src/lib/index/index_read.c#L181-L184).
     */

    /**
     * If present, it must always be 0.
     * @see {@link https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L159-L162|Source}
     */

    /**
     * Checksum of the uncompressed dictionary. It has no real use, as the
     * uncompressed source won't have a dictionary.
     */

    /**
     * Metadata of the data chunks. The dictionary is chunk 0 and its
     * metadata is stored in the `*dict*` fields above, so there is one fewer
     * entry here than indicated by `num_chunks`.
     */

    return Index;
  })();

  var OptionalElement = Zchunk.OptionalElement = (function() {
    function OptionalElement(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    OptionalElement.prototype._read = function() {
      this.elementId = new CompressedInteger(this._io, this, this._root);
      this.lenData = new CompressedInteger(this._io, this, this._root);
      this.data = this._io.readBytes(this.lenData.value);
    }

    return OptionalElement;
  })();

  var Preface = Zchunk.Preface = (function() {
    function Preface(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Preface.prototype._read = function() {
      this.dataChecksum = this._io.readBytes(this._root.lead.overallChecksumType.lenChecksum);
      this.flags = new CompressedInteger(this._io, this, this._root);
      var _ = this.flags;
      if (!(_.value <= 7)) {
        throw new KaitaiStream.ValidationExprError(this.flags, this._io, "/types/preface/seq/1");
      }
      this.compressionTypeInt = new CompressedInteger(this._io, this, this._root);
      var _ = this.compressionTypeInt;
      if (!( ((_.value == Zchunk.CompressionTypes.NONE) || (_.value == Zchunk.CompressionTypes.ZSTD)) )) {
        throw new KaitaiStream.ValidationExprError(this.compressionTypeInt, this._io, "/types/preface/seq/2");
      }
      if (this.hasOptionalElements) {
        this.numOptionalElements = new CompressedInteger(this._io, this, this._root);
        var _ = this.numOptionalElements;
        if (!(_.value >= 1)) {
          throw new KaitaiStream.ValidationExprError(this.numOptionalElements, this._io, "/types/preface/seq/3");
        }
      }
      if (this.hasOptionalElements) {
        this.optionalElements = [];
        for (var i = 0; i < this.numOptionalElements.value; i++) {
          this.optionalElements.push(new OptionalElement(this._io, this, this._root));
        }
      }
    }
    Object.defineProperty(Preface.prototype, 'compressionType', {
      get: function() {
        if (this._m_compressionType !== undefined)
          return this._m_compressionType;
        this._m_compressionType = this.compressionTypeInt.value;
        return this._m_compressionType;
      }
    });
    Object.defineProperty(Preface.prototype, 'hasDataStreams', {
      get: function() {
        if (this._m_hasDataStreams !== undefined)
          return this._m_hasDataStreams;
        this._m_hasDataStreams = (this.flags.value & 1) != 0;
        return this._m_hasDataStreams;
      }
    });
    Object.defineProperty(Preface.prototype, 'hasOptionalElements', {
      get: function() {
        if (this._m_hasOptionalElements !== undefined)
          return this._m_hasOptionalElements;
        this._m_hasOptionalElements = (this.flags.value & 2) != 0;
        return this._m_hasOptionalElements;
      }
    });

    /**
     * The file may be applied against an uncompressed source. This adds an
     * uncompressed checksum to every index entry, including the dictionary.
     */
    Object.defineProperty(Preface.prototype, 'hasUncompressedSource', {
      get: function() {
        if (this._m_hasUncompressedSource !== undefined)
          return this._m_hasUncompressedSource;
        this._m_hasUncompressedSource = (this.flags.value & 4) != 0;
        return this._m_hasUncompressedSource;
      }
    });

    /**
     * Total data checksum. Checksum of everything after the header,
     * including the compressed dictionary (`_root.dict`) and all compressed
     * chunks (`_root.chunks`). The type of this checksum is
     * `_root.lead.overall_checksum_type.value`.
     * 
     * If `has_uncompressed_source` is true, this checksum must not be
     * checked and should not be generated. In that case, the reference
     * implementation writes it as all zeros - see the sample file
     * [`mini-uncomp-cksums.zck`](https://github.com/kaitai-io/kaitai_struct_samples/blob/1d2fe11c971fb7e86f343b77a1ed341a0217e86a/archive/zchunk/README.md#mini-uncomp-cksumszck).
     */

    /**
     * Compressed integer containing a bitmask of the flags. All unused flags
     * MUST be set to 0. If a decoder sees a flag set that it doesn't
     * recognize, it MUST exit with an error.
     * @see {@link https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L78-L81|Source}
     */

    /**
     * Raw integer, don't read this field - access `compression_type`
     * instead.
     */

    /**
     * If present, it must be at least 1. This is because if there are no
     * optional elements, `has_optional_elements` must be false, and then
     * neither this field nor `optional_elements` is present.
     * @see {@link https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L99-L102|Source}
     */

    return Preface;
  })();

  /**
   * Custom dictionary used when compressing each chunk. It's compressed itself
   * without a dictionary.
   * 
   * The official zchunk specification calls this section "Compressed Dict".
   * It's also called a "dictionary chunk". `zck_read_header -c` presents it as
   * "chunk 0" (which is always shown in the chunk table, but can have size 0
   * if the dictionary is not in use).
   */

  /**
   * Chunks of data, each compressed with the custom dictionary `dict` (if
   * applicable).
   * 
   * They are not included in a detached header (`.zhr`) file. Detached headers
   * contain the dictionary, but none of the data chunks.
   */

  return Zchunk;
})();
Zchunk_.Zchunk = Zchunk;
});
