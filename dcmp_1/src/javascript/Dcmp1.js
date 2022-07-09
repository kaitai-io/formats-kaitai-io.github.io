// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './DcmpVariableLengthInteger'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./DcmpVariableLengthInteger'));
  } else {
    root.Dcmp1 = factory(root.KaitaiStream, root.DcmpVariableLengthInteger);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream, DcmpVariableLengthInteger) {
/**
 * Compressed resource data in `'dcmp' (1)` format,
 * as stored in compressed resources with header type `8` and decompressor ID `1`.
 * 
 * The `'dcmp' (1)` decompressor resource is included in the System file of System 7.0 and later.
 * This compression format is used for a few compressed resources in System 7.0's files
 * (such as the Finder Help file).
 * This decompressor is also included with and used by some other Apple applications,
 * such as ResEdit.
 * (Note: ResEdit includes the `'dcmp' (1)` resource,
 * but none of its resources actually use this decompressor.)
 * 
 * This compression format supports some basic general-purpose compression schemes,
 * including backreferences to previous data and run-length encoding.
 * It also includes some types of compression tailored specifically to Mac OS resources,
 * including a set of single-byte codes that correspond to entries in a hard-coded lookup table.
 * 
 * The `'dcmp' (0)` compression format (see dcmp_0.ksy) is very similar to this format,
 * with the main difference that it operates mostly on units of 2 or 4 bytes.
 * This makes the ``dcmp' (0)` format more suitable for word-aligned data,
 * such as executable code, bitmaps, sounds, etc.
 * The `'dcmp' (0)` format also appears to be generally preferred over `'dcmp' (1)`,
 * with the latter only being used in resource files that contain mostly unaligned data,
 * such as text.
 * @see {@link https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp1.py|Source}
 */

var Dcmp1 = (function() {
  function Dcmp1(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Dcmp1.prototype._read = function() {
    this.chunks = [];
    var i = 0;
    do {
      var _ = new Chunk(this._io, this, this._root);
      this.chunks.push(_);
      i++;
    } while (!(_.tag == 255));
  }

  /**
   * A single chunk of compressed data.
   * Each chunk in the compressed data expands to a sequence of bytes in the uncompressed data,
   * except when `tag == 0xff`,
   * which marks the end of the data and does not correspond to any bytes in the uncompressed data.
   * 
   * Most chunks are stateless and always expand to the same data,
   * regardless of where the chunk appears in the sequence.
   * However,
   * some chunks affect the behavior of future chunks,
   * or expand to different data depending on which chunks came before them.
   */

  var Chunk = Dcmp1.Chunk = (function() {
    Chunk.TagKind = Object.freeze({
      INVALID: -1,
      LITERAL: 0,
      BACKREFERENCE: 1,
      TABLE_LOOKUP: 2,
      EXTENDED: 3,
      END: 4,

      "-1": "INVALID",
      0: "LITERAL",
      1: "BACKREFERENCE",
      2: "TABLE_LOOKUP",
      3: "EXTENDED",
      4: "END",
    });

    function Chunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Chunk.prototype._read = function() {
      this.tag = this._io.readU1();
      switch (( ((this.tag >= 0) && (this.tag <= 31))  ? Dcmp1.Chunk.TagKind.LITERAL : ( ((this.tag >= 32) && (this.tag <= 207))  ? Dcmp1.Chunk.TagKind.BACKREFERENCE : ( ((this.tag >= 208) && (this.tag <= 209))  ? Dcmp1.Chunk.TagKind.LITERAL : (this.tag == 210 ? Dcmp1.Chunk.TagKind.BACKREFERENCE : ( ((this.tag >= 213) && (this.tag <= 253))  ? Dcmp1.Chunk.TagKind.TABLE_LOOKUP : (this.tag == 254 ? Dcmp1.Chunk.TagKind.EXTENDED : (this.tag == 255 ? Dcmp1.Chunk.TagKind.END : Dcmp1.Chunk.TagKind.INVALID)))))))) {
      case Dcmp1.Chunk.TagKind.EXTENDED:
        this.body = new ExtendedBody(this._io, this, this._root);
        break;
      case Dcmp1.Chunk.TagKind.LITERAL:
        this.body = new LiteralBody(this._io, this, this._root, this.tag);
        break;
      case Dcmp1.Chunk.TagKind.END:
        this.body = new EndBody(this._io, this, this._root);
        break;
      case Dcmp1.Chunk.TagKind.TABLE_LOOKUP:
        this.body = new TableLookupBody(this._io, this, this._root, this.tag);
        break;
      case Dcmp1.Chunk.TagKind.BACKREFERENCE:
        this.body = new BackreferenceBody(this._io, this, this._root, this.tag);
        break;
      }
    }

    /**
     * The body of a literal data chunk.
     * 
     * The data that this chunk expands to is stored literally in the body (`literal`).
     * Optionally,
     * the literal data may also be stored for use by future backreference chunks (`do_store`).
     */

    var LiteralBody = Chunk.LiteralBody = (function() {
      function LiteralBody(_io, _parent, _root, tag) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;
        this.tag = tag;

        this._read();
      }
      LiteralBody.prototype._read = function() {
        if (this.isLenLiteralSeparate) {
          this.lenLiteralSeparate = this._io.readU1();
        }
        this.literal = this._io.readBytes(this.lenLiteral);
      }

      /**
       * Whether this literal should be stored for use by future backreference chunks.
       * 
       * See the documentation of the `backreference_body` type for details about backreference chunks.
       */
      Object.defineProperty(LiteralBody.prototype, 'doStore', {
        get: function() {
          if (this._m_doStore !== undefined)
            return this._m_doStore;
          this._m_doStore = (this.isLenLiteralSeparate ? this.tag == 209 : (this.tag & 16) != 0);
          return this._m_doStore;
        }
      });

      /**
       * The part of the tag byte that indicates the length of the literal data,
       * in bytes,
       * minus one.
       * 
       * If the tag byte is 0xd0 or 0xd1,
       * the length is stored in a separate byte after the tag byte and before the literal data.
       */
      Object.defineProperty(LiteralBody.prototype, 'lenLiteralM1InTag', {
        get: function() {
          if (this._m_lenLiteralM1InTag !== undefined)
            return this._m_lenLiteralM1InTag;
          if (!(this.isLenLiteralSeparate)) {
            this._m_lenLiteralM1InTag = (this.tag & 15);
          }
          return this._m_lenLiteralM1InTag;
        }
      });

      /**
       * Whether the length of the literal is stored separately from the tag.
       */
      Object.defineProperty(LiteralBody.prototype, 'isLenLiteralSeparate', {
        get: function() {
          if (this._m_isLenLiteralSeparate !== undefined)
            return this._m_isLenLiteralSeparate;
          this._m_isLenLiteralSeparate = this.tag >= 208;
          return this._m_isLenLiteralSeparate;
        }
      });

      /**
       * The length of the literal data,
       * in bytes.
       * 
       * In practice,
       * this value is always greater than zero,
       * as there is no use in storing a zero-length literal.
       */
      Object.defineProperty(LiteralBody.prototype, 'lenLiteral', {
        get: function() {
          if (this._m_lenLiteral !== undefined)
            return this._m_lenLiteral;
          this._m_lenLiteral = (this.isLenLiteralSeparate ? this.lenLiteralSeparate : (this.lenLiteralM1InTag + 1));
          return this._m_lenLiteral;
        }
      });

      /**
       * The length of the literal data,
       * in bytes.
       * 
       * This field is only present if the tag byte is 0xd0 or 0xd1.
       * In practice,
       * this only happens if the length is 0x11 or greater,
       * because smaller lengths can be encoded into the tag byte.
       */

      /**
       * The literal data.
       */

      /**
       * The tag byte preceding this chunk body.
       */

      return LiteralBody;
    })();

    /**
     * The body of a backreference chunk.
     * 
     * This chunk expands to the data stored in a preceding literal chunk,
     * indicated by an index number (`index`).
     */

    var BackreferenceBody = Chunk.BackreferenceBody = (function() {
      function BackreferenceBody(_io, _parent, _root, tag) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;
        this.tag = tag;

        this._read();
      }
      BackreferenceBody.prototype._read = function() {
        if (this.isIndexSeparate) {
          this.indexSeparateMinus = this._io.readU1();
        }
      }

      /**
       * Whether the index is stored separately from the tag.
       */
      Object.defineProperty(BackreferenceBody.prototype, 'isIndexSeparate', {
        get: function() {
          if (this._m_isIndexSeparate !== undefined)
            return this._m_isIndexSeparate;
          this._m_isIndexSeparate = this.tag == 210;
          return this._m_isIndexSeparate;
        }
      });

      /**
       * The index of the referenced literal chunk,
       * as stored in the tag byte.
       */
      Object.defineProperty(BackreferenceBody.prototype, 'indexInTag', {
        get: function() {
          if (this._m_indexInTag !== undefined)
            return this._m_indexInTag;
          this._m_indexInTag = (this.tag - 32);
          return this._m_indexInTag;
        }
      });

      /**
       * The index of the referenced literal chunk,
       * as stored separately from the tag byte,
       * with the implicit offset corrected for.
       */
      Object.defineProperty(BackreferenceBody.prototype, 'indexSeparate', {
        get: function() {
          if (this._m_indexSeparate !== undefined)
            return this._m_indexSeparate;
          if (this.isIndexSeparate) {
            this._m_indexSeparate = (this.indexSeparateMinus + 176);
          }
          return this._m_indexSeparate;
        }
      });

      /**
       * The index of the referenced literal chunk.
       * 
       * Stored literals are assigned index numbers in the order in which they appear in the compressed data,
       * starting at 0.
       * Non-stored literals are not counted in the numbering and cannot be referenced using backreferences.
       * Once an index is assigned to a stored literal,
       * it is never changed or unassigned for the entire length of the compressed data.
       * 
       * As the name indicates,
       * a backreference can only reference stored literal chunks found *before* the backreference,
       * not ones that come after it.
       */
      Object.defineProperty(BackreferenceBody.prototype, 'index', {
        get: function() {
          if (this._m_index !== undefined)
            return this._m_index;
          this._m_index = (this.isIndexSeparate ? this.indexSeparate : this.indexInTag);
          return this._m_index;
        }
      });

      /**
       * The index of the referenced literal chunk,
       * stored separately from the tag.
       * The value in this field is stored minus 0xb0.
       * 
       * This field is only present if the tag byte is 0xd2.
       * For other tag bytes,
       * the index is encoded in the tag byte.
       * Values smaller than 0xb0 cannot be stored in this field,
       * they must always be encoded in the tag byte.
       */

      /**
       * The tag byte preceding this chunk body.
       */

      return BackreferenceBody;
    })();

    /**
     * The body of a table lookup chunk.
     * This body is always empty.
     * 
     * This chunk always expands to two bytes (`value`),
     * determined from the tag byte using a fixed lookup table (`lookup_table`).
     * This lookup table is hardcoded in the decompressor and always the same for all compressed data.
     */

    var TableLookupBody = Chunk.TableLookupBody = (function() {
      function TableLookupBody(_io, _parent, _root, tag) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;
        this.tag = tag;

        this._read();
      }
      TableLookupBody.prototype._read = function() {
      }

      /**
       * Fixed lookup table that maps tag byte numbers to two bytes each.
       * 
       * The entries in the lookup table are offset -
       * index 0 stands for tag 0xd5, 1 for 0xd6, etc.
       */
      Object.defineProperty(TableLookupBody.prototype, 'lookupTable', {
        get: function() {
          if (this._m_lookupTable !== undefined)
            return this._m_lookupTable;
          this._m_lookupTable = [[0, 0], [0, 1], [0, 2], [0, 3], [46, 1], [62, 1], [1, 1], [30, 1], [255, 255], [14, 1], [49, 0], [17, 18], [1, 7], [51, 50], [18, 57], [237, 16], [1, 39], [35, 34], [1, 55], [7, 6], [1, 23], [1, 35], [0, 255], [0, 47], [7, 14], [253, 60], [1, 53], [1, 21], [1, 2], [0, 7], [0, 62], [5, 213], [2, 1], [6, 7], [7, 8], [48, 1], [1, 51], [0, 16], [23, 22], [55, 62], [54, 55]];
          return this._m_lookupTable;
        }
      });

      /**
       * The two bytes that the tag byte expands to,
       * based on the fixed lookup table.
       */
      Object.defineProperty(TableLookupBody.prototype, 'value', {
        get: function() {
          if (this._m_value !== undefined)
            return this._m_value;
          this._m_value = this.lookupTable[(this.tag - 213)];
          return this._m_value;
        }
      });

      /**
       * The tag byte preceding this chunk body.
       */

      return TableLookupBody;
    })();

    /**
     * The body of an end chunk.
     * This body is always empty.
     * 
     * The last chunk in the compressed data must always be an end chunk.
     * An end chunk cannot appear elsewhere in the compressed data.
     */

    var EndBody = Chunk.EndBody = (function() {
      function EndBody(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      EndBody.prototype._read = function() {
      }

      return EndBody;
    })();

    /**
     * The body of an extended chunk.
     * The meaning of this chunk depends on the extended tag byte stored in the chunk data.
     */

    var ExtendedBody = Chunk.ExtendedBody = (function() {
      function ExtendedBody(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      ExtendedBody.prototype._read = function() {
        this.tag = this._io.readU1();
        switch (this.tag) {
        case 2:
          this.body = new RepeatBody(this._io, this, this._root);
          break;
        }
      }

      /**
       * The body of a repeat chunk.
       * 
       * This chunk expands to the same byte repeated a number of times,
       * i. e. it implements a form of run-length encoding.
       */

      var RepeatBody = ExtendedBody.RepeatBody = (function() {
        function RepeatBody(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        RepeatBody.prototype._read = function() {
          this.toRepeatRaw = new DcmpVariableLengthInteger(this._io, this, null);
          this.repeatCountM1Raw = new DcmpVariableLengthInteger(this._io, this, null);
        }

        /**
         * The value to repeat.
         * 
         * Although it is stored as a variable-length integer,
         * this value must fit into an unsigned 8-bit integer.
         */
        Object.defineProperty(RepeatBody.prototype, 'toRepeat', {
          get: function() {
            if (this._m_toRepeat !== undefined)
              return this._m_toRepeat;
            this._m_toRepeat = this.toRepeatRaw.value;
            return this._m_toRepeat;
          }
        });

        /**
         * The number of times to repeat the value,
         * minus one.
         * 
         * This value must not be negative.
         */
        Object.defineProperty(RepeatBody.prototype, 'repeatCountM1', {
          get: function() {
            if (this._m_repeatCountM1 !== undefined)
              return this._m_repeatCountM1;
            this._m_repeatCountM1 = this.repeatCountM1Raw.value;
            return this._m_repeatCountM1;
          }
        });

        /**
         * The number of times to repeat the value.
         * 
         * This value must be positive.
         */
        Object.defineProperty(RepeatBody.prototype, 'repeatCount', {
          get: function() {
            if (this._m_repeatCount !== undefined)
              return this._m_repeatCount;
            this._m_repeatCount = (this.repeatCountM1 + 1);
            return this._m_repeatCount;
          }
        });

        /**
         * Raw variable-length integer representation of `to_repeat`.
         */

        /**
         * Raw variable-length integer representation of `repeat_count_m1`.
         */

        return RepeatBody;
      })();

      /**
       * The chunk's extended tag byte.
       * This controls the structure of the body and the meaning of the chunk.
       */

      /**
       * The chunk's body.
       */

      return ExtendedBody;
    })();

    /**
     * The chunk's tag byte.
     * This controls the structure of the body and the meaning of the chunk.
     */

    /**
     * The chunk's body.
     * 
     * Certain chunks do not have any data following the tag byte.
     * In this case,
     * the body is a zero-length structure.
     */

    return Chunk;
  })();

  /**
   * The sequence of chunks that make up the compressed data.
   */

  return Dcmp1;
})();
return Dcmp1;
}));
