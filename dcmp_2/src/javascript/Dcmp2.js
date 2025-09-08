// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './BytesWithIo'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./BytesWithIo'));
  } else {
    factory(root.Dcmp2 || (root.Dcmp2 = {}), root.KaitaiStream, root.BytesWithIo || (root.BytesWithIo = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Dcmp2_, KaitaiStream, BytesWithIo_) {
/**
 * Compressed resource data in `'dcmp' (2)` format,
 * as stored in compressed resources with header type `9` and decompressor ID `2`.
 * 
 * The `'dcmp' (2)` decompressor resource is included in the System file of System 7.0 and later.
 * This compression format is used for a few compressed resources in System 7.0's files
 * (such as the System file).
 * This decompressor is also included with and used by some other Apple applications,
 * such as ResEdit.
 * (Note: ResEdit includes the `'dcmp' (2)` resource,
 * but none of its resources actually use this decompressor.)
 * 
 * This compression format is based on simple dictionary coding,
 * where each byte in the compressed data expands to two bytes,
 * based on a lookup table
 * (either included in the compressed data or provided by the decompressor).
 * An alternative "tagged" compression format is also supported,
 * which allows using two-byte literals in addition to single-byte table references,
 * at the cost of requiring an extra "tag" byte every 16 output bytes,
 * to differentiate literals and table references.
 * @see {@link https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp2.py|Source}
 */

var Dcmp2 = (function() {
  function Dcmp2(_io, _parent, _root, lenDecompressed, headerParametersWithIo) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;
    this.lenDecompressed = lenDecompressed;
    this.headerParametersWithIo = headerParametersWithIo;

    this._read();
  }
  Dcmp2.prototype._read = function() {
    if (this.headerParameters.flags.hasCustomLookupTable) {
      this.customLookupTable = [];
      for (var i = 0; i < this.headerParameters.numCustomLookupTableEntries; i++) {
        this.customLookupTable.push(this._io.readBytes(2));
      }
    }
    switch (this.headerParameters.flags.tagged) {
    case true:
      this._raw_data = this._io.readBytes((this._io.size - this._io.pos) - (this.isLenDecompressedOdd ? 1 : 0));
      var _io__raw_data = new KaitaiStream(this._raw_data);
      this.data = new TaggedData(_io__raw_data, this, this._root);
      break;
    default:
      this._raw_data = this._io.readBytes((this._io.size - this._io.pos) - (this.isLenDecompressedOdd ? 1 : 0));
      var _io__raw_data = new KaitaiStream(this._raw_data);
      this.data = new UntaggedData(_io__raw_data, this, this._root);
      break;
    }
    if (this.isLenDecompressedOdd) {
      this.lastByte = this._io.readBytes(1);
    }
  }

  /**
   * Decompressor-specific parameters for this compression format,
   * as stored in the compressed resource header.
   */

  var HeaderParameters = Dcmp2.HeaderParameters = (function() {
    function HeaderParameters(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    HeaderParameters.prototype._read = function() {
      this.unknown = this._io.readU2be();
      this.numCustomLookupTableEntriesM1 = this._io.readU1();
      this.flags = new Flags(this._io, this, this._root);
    }

    /**
     * Flags for the decompressor,
     * as stored in the decompressor-specific parameters.
     */

    var Flags = HeaderParameters.Flags = (function() {
      function Flags(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      Flags.prototype._read = function() {
        this.reserved = this._io.readBitsIntBe(6);
        this.tagged = this._io.readBitsIntBe(1) != 0;
        this.hasCustomLookupTable = this._io.readBitsIntBe(1) != 0;
      }

      /**
       * The flags as a packed integer,
       * as they are stored in the data.
       */
      Object.defineProperty(Flags.prototype, 'asInt', {
        get: function() {
          if (this._m_asInt !== undefined)
            return this._m_asInt;
          var _pos = this._io.pos;
          this._io.seek(0);
          this._m_asInt = this._io.readU1();
          this._io.seek(_pos);
          return this._m_asInt;
        }
      });

      /**
       * These flags have no known usage or meaning and should always be zero.
       */

      /**
       * Whether the "tagged" variant of this compression format should be used,
       * rather than the default "untagged" variant.
       */

      /**
       * Whether a custom lookup table is included before the compressed data,
       * which should be used instead of the default hardcoded lookup table.
       */

      return Flags;
    })();

    /**
     * The number of entries in the custom lookup table.
     * Only used if a custom lookup table is present.
     */
    Object.defineProperty(HeaderParameters.prototype, 'numCustomLookupTableEntries', {
      get: function() {
        if (this._m_numCustomLookupTableEntries !== undefined)
          return this._m_numCustomLookupTableEntries;
        if (this.flags.hasCustomLookupTable) {
          this._m_numCustomLookupTableEntries = this.numCustomLookupTableEntriesM1 + 1;
        }
        return this._m_numCustomLookupTableEntries;
      }
    });

    /**
     * The meaning of this field is unknown.
     * It does not appear to have any effect on the format of the compressed data or the decompression process.
     * 
     * The value of this field is usually zero and otherwise a small integer (< 10).
     * For `'lpch'` resources,
     * the value is always nonzero,
     * and sometimes larger than usual.
     */

    /**
     * The number of entries in the custom lookup table,
     * minus one.
     * 
     * If the default lookup table is used rather than a custom one,
     * this value is zero.
     */

    /**
     * Various flags that affect the format of the compressed data and the decompression process.
     */

    return HeaderParameters;
  })();

  /**
   * Compressed data in the "tagged" variant of the format.
   */

  var TaggedData = Dcmp2.TaggedData = (function() {
    function TaggedData(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    TaggedData.prototype._read = function() {
      this.chunks = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.chunks.push(new Chunk(this._io, this, this._root));
        i++;
      }
    }

    /**
     * A single tagged chunk of compressed data.
     * 
     * Each chunk expands to 16 bytes of decompressed data.
     * In compressed form,
     * the chunks have a variable length
     * (between 9 and 17 bytes)
     * depending on the value of the tag byte.
     */

    var Chunk = TaggedData.Chunk = (function() {
      function Chunk(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      Chunk.prototype._read = function() {
        this.tag = [];
        for (var i = 0; i < 8; i++) {
          this.tag.push(this._io.readBitsIntBe(1) != 0);
        }
        this._io.alignToByte();
        this.units = [];
        var i = 0;
        do {
          switch (this.tag[i]) {
          case true:
            var _ = this._io.readU1();
            this.units.push(_);
            break;
          default:
            var _ = this._io.readBytes((this.tag[i] ? 1 : 2));
            this.units.push(_);
            break;
          }
          i++;
        } while (!( ((i >= 7) || (this._io.isEof())) ));
      }

      /**
       * The bits of the tag byte control the format and meaning of the 8 compressed data units that follow the tag byte.
       */

      /**
       * The compressed data units in this chunk.
       * 
       * The format and meaning of each unit is controlled by the bit in the tag byte with the same index.
       * If the bit is 0 (false),
       * the unit is a pair of bytes,
       * which are literally copied to the decompressed data.
       * If the bit is 1 (true),
       * the unit is a reference into the lookup table,
       * an integer which is expanded to two bytes by looking it up in the table.
       */

      return Chunk;
    })();

    /**
     * The tagged chunks that make up the compressed data.
     */

    return TaggedData;
  })();

  /**
   * Compressed data in the "untagged" variant of the format.
   */

  var UntaggedData = Dcmp2.UntaggedData = (function() {
    function UntaggedData(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    UntaggedData.prototype._read = function() {
      this.tableReferences = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.tableReferences.push(this._io.readU1());
        i++;
      }
    }

    /**
     * References into the lookup table.
     * Each reference is an integer that is expanded to two bytes by looking it up in the table.
     */

    return UntaggedData;
  })();

  /**
   * The default lookup table,
   * which is used if no custom lookup table is included with the compressed data.
   */
  Object.defineProperty(Dcmp2.prototype, 'defaultLookupTable', {
    get: function() {
      if (this._m_defaultLookupTable !== undefined)
        return this._m_defaultLookupTable;
      this._m_defaultLookupTable = [new Uint8Array([0, 0]), new Uint8Array([0, 8]), new Uint8Array([78, 186]), new Uint8Array([32, 110]), new Uint8Array([78, 117]), new Uint8Array([0, 12]), new Uint8Array([0, 4]), new Uint8Array([112, 0]), new Uint8Array([0, 16]), new Uint8Array([0, 2]), new Uint8Array([72, 110]), new Uint8Array([255, 252]), new Uint8Array([96, 0]), new Uint8Array([0, 1]), new Uint8Array([72, 231]), new Uint8Array([47, 46]), new Uint8Array([78, 86]), new Uint8Array([0, 6]), new Uint8Array([78, 94]), new Uint8Array([47, 0]), new Uint8Array([97, 0]), new Uint8Array([255, 248]), new Uint8Array([47, 11]), new Uint8Array([255, 255]), new Uint8Array([0, 20]), new Uint8Array([0, 10]), new Uint8Array([0, 24]), new Uint8Array([32, 95]), new Uint8Array([0, 14]), new Uint8Array([32, 80]), new Uint8Array([63, 60]), new Uint8Array([255, 244]), new Uint8Array([76, 238]), new Uint8Array([48, 46]), new Uint8Array([103, 0]), new Uint8Array([76, 223]), new Uint8Array([38, 110]), new Uint8Array([0, 18]), new Uint8Array([0, 28]), new Uint8Array([66, 103]), new Uint8Array([255, 240]), new Uint8Array([48, 60]), new Uint8Array([47, 12]), new Uint8Array([0, 3]), new Uint8Array([78, 208]), new Uint8Array([0, 32]), new Uint8Array([112, 1]), new Uint8Array([0, 22]), new Uint8Array([45, 64]), new Uint8Array([72, 192]), new Uint8Array([32, 120]), new Uint8Array([114, 0]), new Uint8Array([88, 143]), new Uint8Array([102, 0]), new Uint8Array([79, 239]), new Uint8Array([66, 167]), new Uint8Array([103, 6]), new Uint8Array([255, 250]), new Uint8Array([85, 143]), new Uint8Array([40, 110]), new Uint8Array([63, 0]), new Uint8Array([255, 254]), new Uint8Array([47, 60]), new Uint8Array([103, 4]), new Uint8Array([89, 143]), new Uint8Array([32, 107]), new Uint8Array([0, 36]), new Uint8Array([32, 31]), new Uint8Array([65, 250]), new Uint8Array([129, 225]), new Uint8Array([102, 4]), new Uint8Array([103, 8]), new Uint8Array([0, 26]), new Uint8Array([78, 185]), new Uint8Array([80, 143]), new Uint8Array([32, 46]), new Uint8Array([0, 7]), new Uint8Array([78, 176]), new Uint8Array([255, 242]), new Uint8Array([61, 64]), new Uint8Array([0, 30]), new Uint8Array([32, 104]), new Uint8Array([102, 6]), new Uint8Array([255, 246]), new Uint8Array([78, 249]), new Uint8Array([8, 0]), new Uint8Array([12, 64]), new Uint8Array([61, 124]), new Uint8Array([255, 236]), new Uint8Array([0, 5]), new Uint8Array([32, 60]), new Uint8Array([255, 232]), new Uint8Array([222, 252]), new Uint8Array([74, 46]), new Uint8Array([0, 48]), new Uint8Array([0, 40]), new Uint8Array([47, 8]), new Uint8Array([32, 11]), new Uint8Array([96, 2]), new Uint8Array([66, 110]), new Uint8Array([45, 72]), new Uint8Array([32, 83]), new Uint8Array([32, 64]), new Uint8Array([24, 0]), new Uint8Array([96, 4]), new Uint8Array([65, 238]), new Uint8Array([47, 40]), new Uint8Array([47, 1]), new Uint8Array([103, 10]), new Uint8Array([72, 64]), new Uint8Array([32, 7]), new Uint8Array([102, 8]), new Uint8Array([1, 24]), new Uint8Array([47, 7]), new Uint8Array([48, 40]), new Uint8Array([63, 46]), new Uint8Array([48, 43]), new Uint8Array([34, 110]), new Uint8Array([47, 43]), new Uint8Array([0, 44]), new Uint8Array([103, 12]), new Uint8Array([34, 95]), new Uint8Array([96, 6]), new Uint8Array([0, 255]), new Uint8Array([48, 7]), new Uint8Array([255, 238]), new Uint8Array([83, 64]), new Uint8Array([0, 64]), new Uint8Array([255, 228]), new Uint8Array([74, 64]), new Uint8Array([102, 10]), new Uint8Array([0, 15]), new Uint8Array([78, 173]), new Uint8Array([112, 255]), new Uint8Array([34, 216]), new Uint8Array([72, 107]), new Uint8Array([0, 34]), new Uint8Array([32, 75]), new Uint8Array([103, 14]), new Uint8Array([74, 174]), new Uint8Array([78, 144]), new Uint8Array([255, 224]), new Uint8Array([255, 192]), new Uint8Array([0, 42]), new Uint8Array([39, 64]), new Uint8Array([103, 2]), new Uint8Array([81, 200]), new Uint8Array([2, 182]), new Uint8Array([72, 122]), new Uint8Array([34, 120]), new Uint8Array([176, 110]), new Uint8Array([255, 230]), new Uint8Array([0, 9]), new Uint8Array([50, 46]), new Uint8Array([62, 0]), new Uint8Array([72, 65]), new Uint8Array([255, 234]), new Uint8Array([67, 238]), new Uint8Array([78, 113]), new Uint8Array([116, 0]), new Uint8Array([47, 44]), new Uint8Array([32, 108]), new Uint8Array([0, 60]), new Uint8Array([0, 38]), new Uint8Array([0, 80]), new Uint8Array([24, 128]), new Uint8Array([48, 31]), new Uint8Array([34, 0]), new Uint8Array([102, 12]), new Uint8Array([255, 218]), new Uint8Array([0, 56]), new Uint8Array([102, 2]), new Uint8Array([48, 44]), new Uint8Array([32, 12]), new Uint8Array([45, 110]), new Uint8Array([66, 64]), new Uint8Array([255, 226]), new Uint8Array([169, 240]), new Uint8Array([255, 0]), new Uint8Array([55, 124]), new Uint8Array([229, 128]), new Uint8Array([255, 220]), new Uint8Array([72, 104]), new Uint8Array([89, 79]), new Uint8Array([0, 52]), new Uint8Array([62, 31]), new Uint8Array([96, 8]), new Uint8Array([47, 6]), new Uint8Array([255, 222]), new Uint8Array([96, 10]), new Uint8Array([112, 2]), new Uint8Array([0, 50]), new Uint8Array([255, 204]), new Uint8Array([0, 128]), new Uint8Array([34, 81]), new Uint8Array([16, 31]), new Uint8Array([49, 124]), new Uint8Array([160, 41]), new Uint8Array([255, 216]), new Uint8Array([82, 64]), new Uint8Array([1, 0]), new Uint8Array([103, 16]), new Uint8Array([160, 35]), new Uint8Array([255, 206]), new Uint8Array([255, 212]), new Uint8Array([32, 6]), new Uint8Array([72, 120]), new Uint8Array([0, 46]), new Uint8Array([80, 79]), new Uint8Array([67, 250]), new Uint8Array([103, 18]), new Uint8Array([118, 0]), new Uint8Array([65, 232]), new Uint8Array([74, 110]), new Uint8Array([32, 217]), new Uint8Array([0, 90]), new Uint8Array([127, 255]), new Uint8Array([81, 202]), new Uint8Array([0, 92]), new Uint8Array([46, 0]), new Uint8Array([2, 64]), new Uint8Array([72, 199]), new Uint8Array([103, 20]), new Uint8Array([12, 128]), new Uint8Array([46, 159]), new Uint8Array([255, 214]), new Uint8Array([128, 0]), new Uint8Array([16, 0]), new Uint8Array([72, 66]), new Uint8Array([74, 107]), new Uint8Array([255, 210]), new Uint8Array([0, 72]), new Uint8Array([74, 71]), new Uint8Array([78, 209]), new Uint8Array([32, 111]), new Uint8Array([0, 65]), new Uint8Array([96, 12]), new Uint8Array([42, 120]), new Uint8Array([66, 46]), new Uint8Array([50, 0]), new Uint8Array([101, 116]), new Uint8Array([103, 22]), new Uint8Array([0, 68]), new Uint8Array([72, 109]), new Uint8Array([32, 8]), new Uint8Array([72, 108]), new Uint8Array([11, 124]), new Uint8Array([38, 64]), new Uint8Array([4, 0]), new Uint8Array([0, 104]), new Uint8Array([32, 109]), new Uint8Array([0, 13]), new Uint8Array([42, 64]), new Uint8Array([0, 11]), new Uint8Array([0, 62]), new Uint8Array([2, 32])];
      return this._m_defaultLookupTable;
    }
  });

  /**
   * The parsed decompressor-specific parameters from the compressed resource header.
   */
  Object.defineProperty(Dcmp2.prototype, 'headerParameters', {
    get: function() {
      if (this._m_headerParameters !== undefined)
        return this._m_headerParameters;
      var io = this.headerParametersWithIo._io;
      var _pos = io.pos;
      io.seek(0);
      this._m_headerParameters = new HeaderParameters(io, this, this._root);
      io.seek(_pos);
      return this._m_headerParameters;
    }
  });

  /**
   * Whether the length of the decompressed data is odd.
   * This affects the meaning of the last byte of the compressed data.
   */
  Object.defineProperty(Dcmp2.prototype, 'isLenDecompressedOdd', {
    get: function() {
      if (this._m_isLenDecompressedOdd !== undefined)
        return this._m_isLenDecompressedOdd;
      this._m_isLenDecompressedOdd = KaitaiStream.mod(this.lenDecompressed, 2) != 0;
      return this._m_isLenDecompressedOdd;
    }
  });

  /**
   * The lookup table to be used for this compressed data.
   */
  Object.defineProperty(Dcmp2.prototype, 'lookupTable', {
    get: function() {
      if (this._m_lookupTable !== undefined)
        return this._m_lookupTable;
      this._m_lookupTable = (this.headerParameters.flags.hasCustomLookupTable ? this.customLookupTable : this.defaultLookupTable);
      return this._m_lookupTable;
    }
  });

  /**
   * The custom lookup table to be used instead of the default lookup table.
   */

  /**
   * The compressed data.
   * The structure of the data varies depending on whether the "tagged" or "untagged" variant of the compression format is used.
   */

  /**
   * The last byte of the decompressed data,
   * stored literally.
   * Only present if the decompressed data has an odd length.
   * 
   * This special case is necessary because the compressed data is otherwise always stored in two-byte groups,
   * either literally or as table references,
   * so otherwise there would be no way to compress odd-length resources using this format.
   */

  /**
   * The length of the decompressed data in bytes,
   * from the compressed resource header.
   */

  /**
   * The unparsed decompressor-specific parameters,
   * from the compressed resource header.
   */

  return Dcmp2;
})();
Dcmp2_.Dcmp2 = Dcmp2;
});
