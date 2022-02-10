// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Dcmp2 = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
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
 * @see {@link https://github.com/dgelessus/python-rsrcfork/blob/f891a6ee003b094bf4fc570832f90190260d795b/src/rsrcfork/compress/dcmp2.py|Source}
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
      this.customLookupTable = new Array(this.headerParameters.numCustomLookupTableEntries);
      for (var i = 0; i < this.headerParameters.numCustomLookupTableEntries; i++) {
        this.customLookupTable[i] = this._io.readBytes(2);
      }
    }
    switch (this.headerParameters.flags.tagged) {
    case true:
      this._raw_data = this._io.readBytes(((this._io.size - this._io.pos) - (this.isLenDecompressedOdd ? 1 : 0)));
      var _io__raw_data = new KaitaiStream(this._raw_data);
      this.data = new TaggedData(_io__raw_data, this, this._root);
      break;
    default:
      this._raw_data = this._io.readBytes(((this._io.size - this._io.pos) - (this.isLenDecompressedOdd ? 1 : 0)));
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
      this._root = _root || this;

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
        this._root = _root || this;

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
          this._m_numCustomLookupTableEntries = (this.numCustomLookupTableEntriesM1 + 1);
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
   * Compressed data in the "untagged" variant of the format.
   */

  var UntaggedData = Dcmp2.UntaggedData = (function() {
    function UntaggedData(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

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
   * Compressed data in the "tagged" variant of the format.
   */

  var TaggedData = Dcmp2.TaggedData = (function() {
    function TaggedData(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

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
        this._root = _root || this;

        this._read();
      }
      Chunk.prototype._read = function() {
        this.tag = new Array(8);
        for (var i = 0; i < 8; i++) {
          this.tag[i] = this._io.readBitsIntBe(1) != 0;
        }
        this._io.alignToByte();
        this._raw_units = []
        this.units = []
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
   * The default lookup table,
   * which is used if no custom lookup table is included with the compressed data.
   */
  Object.defineProperty(Dcmp2.prototype, 'defaultLookupTable', {
    get: function() {
      if (this._m_defaultLookupTable !== undefined)
        return this._m_defaultLookupTable;
      this._m_defaultLookupTable = [[0, 0], [0, 8], [78, 186], [32, 110], [78, 117], [0, 12], [0, 4], [112, 0], [0, 16], [0, 2], [72, 110], [255, 252], [96, 0], [0, 1], [72, 231], [47, 46], [78, 86], [0, 6], [78, 94], [47, 0], [97, 0], [255, 248], [47, 11], [255, 255], [0, 20], [0, 10], [0, 24], [32, 95], [0, 14], [32, 80], [63, 60], [255, 244], [76, 238], [48, 46], [103, 0], [76, 223], [38, 110], [0, 18], [0, 28], [66, 103], [255, 240], [48, 60], [47, 12], [0, 3], [78, 208], [0, 32], [112, 1], [0, 22], [45, 64], [72, 192], [32, 120], [114, 0], [88, 143], [102, 0], [79, 239], [66, 167], [103, 6], [255, 250], [85, 143], [40, 110], [63, 0], [255, 254], [47, 60], [103, 4], [89, 143], [32, 107], [0, 36], [32, 31], [65, 250], [129, 225], [102, 4], [103, 8], [0, 26], [78, 185], [80, 143], [32, 46], [0, 7], [78, 176], [255, 242], [61, 64], [0, 30], [32, 104], [102, 6], [255, 246], [78, 249], [8, 0], [12, 64], [61, 124], [255, 236], [0, 5], [32, 60], [255, 232], [222, 252], [74, 46], [0, 48], [0, 40], [47, 8], [32, 11], [96, 2], [66, 110], [45, 72], [32, 83], [32, 64], [24, 0], [96, 4], [65, 238], [47, 40], [47, 1], [103, 10], [72, 64], [32, 7], [102, 8], [1, 24], [47, 7], [48, 40], [63, 46], [48, 43], [34, 110], [47, 43], [0, 44], [103, 12], [34, 95], [96, 6], [0, 255], [48, 7], [255, 238], [83, 64], [0, 64], [255, 228], [74, 64], [102, 10], [0, 15], [78, 173], [112, 255], [34, 216], [72, 107], [0, 34], [32, 75], [103, 14], [74, 174], [78, 144], [255, 224], [255, 192], [0, 42], [39, 64], [103, 2], [81, 200], [2, 182], [72, 122], [34, 120], [176, 110], [255, 230], [0, 9], [50, 46], [62, 0], [72, 65], [255, 234], [67, 238], [78, 113], [116, 0], [47, 44], [32, 108], [0, 60], [0, 38], [0, 80], [24, 128], [48, 31], [34, 0], [102, 12], [255, 218], [0, 56], [102, 2], [48, 44], [32, 12], [45, 110], [66, 64], [255, 226], [169, 240], [255, 0], [55, 124], [229, 128], [255, 220], [72, 104], [89, 79], [0, 52], [62, 31], [96, 8], [47, 6], [255, 222], [96, 10], [112, 2], [0, 50], [255, 204], [0, 128], [34, 81], [16, 31], [49, 124], [160, 41], [255, 216], [82, 64], [1, 0], [103, 16], [160, 35], [255, 206], [255, 212], [32, 6], [72, 120], [0, 46], [80, 79], [67, 250], [103, 18], [118, 0], [65, 232], [74, 110], [32, 217], [0, 90], [127, 255], [81, 202], [0, 92], [46, 0], [2, 64], [72, 199], [103, 20], [12, 128], [46, 159], [255, 214], [128, 0], [16, 0], [72, 66], [74, 107], [255, 210], [0, 72], [74, 71], [78, 209], [32, 111], [0, 65], [96, 12], [42, 120], [66, 46], [50, 0], [101, 116], [103, 22], [0, 68], [72, 109], [32, 8], [72, 108], [11, 124], [38, 64], [4, 0], [0, 104], [32, 109], [0, 13], [42, 64], [0, 11], [0, 62], [2, 32]];
      return this._m_defaultLookupTable;
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
return Dcmp2;
}));
