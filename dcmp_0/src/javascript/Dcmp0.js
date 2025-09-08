// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './DcmpVariableLengthInteger'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./DcmpVariableLengthInteger'));
  } else {
    factory(root.Dcmp0 || (root.Dcmp0 = {}), root.KaitaiStream, root.DcmpVariableLengthInteger || (root.DcmpVariableLengthInteger = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Dcmp0_, KaitaiStream, DcmpVariableLengthInteger_) {
/**
 * Compressed resource data in `'dcmp' (0)` format,
 * as stored in compressed resources with header type `8` and decompressor ID `0`.
 * 
 * The `'dcmp' (0)` decompressor resource is included in the System file of System 7.0 and later.
 * This compression format is used for most compressed resources in System 7.0's files.
 * This decompressor is also included with and used by some other Apple applications,
 * such as ResEdit.
 * 
 * This compression format supports some basic general-purpose compression schemes,
 * including backreferences to previous data,
 * run-length encoding,
 * and delta encoding.
 * It also includes some types of compression tailored specifically to Mac OS resources,
 * including a set of single-byte codes that correspond to entries in a hard-coded lookup table,
 * and a specialized kind of delta encoding for segment loader jump tables.
 * 
 * Almost all parts of this compression format operate on units of 2 or 4 bytes.
 * As a result,
 * it is nearly impossible to store data with an odd length in this format.
 * To work around this limitation,
 * odd-length resources are padded with an extra byte before compressing them with this format.
 * This extra byte is ignored after decompression,
 * as the real (odd) length of the resource is stored in the compressed resource header.
 * 
 * The `'dcmp' (1)` compression format (see dcmp_1.ksy) is very similar to this format,
 * with the main difference that it operates mostly on single bytes rather than two-byte units.
 * @see {@link https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp0.py|Source}
 */

var Dcmp0 = (function() {
  function Dcmp0(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Dcmp0.prototype._read = function() {
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

  var Chunk = Dcmp0.Chunk = (function() {
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
      this._root = _root;

      this._read();
    }
    Chunk.prototype._read = function() {
      this.tag = this._io.readU1();
      switch (( ((this.tag >= 0) && (this.tag <= 31))  ? Dcmp0.Chunk.TagKind.LITERAL : ( ((this.tag >= 32) && (this.tag <= 74))  ? Dcmp0.Chunk.TagKind.BACKREFERENCE : ( ((this.tag >= 75) && (this.tag <= 253))  ? Dcmp0.Chunk.TagKind.TABLE_LOOKUP : (this.tag == 254 ? Dcmp0.Chunk.TagKind.EXTENDED : (this.tag == 255 ? Dcmp0.Chunk.TagKind.END : Dcmp0.Chunk.TagKind.INVALID)))))) {
      case Dcmp0.Chunk.TagKind.BACKREFERENCE:
        this.body = new BackreferenceBody(this._io, this, this._root, this.tag);
        break;
      case Dcmp0.Chunk.TagKind.END:
        this.body = new EndBody(this._io, this, this._root);
        break;
      case Dcmp0.Chunk.TagKind.EXTENDED:
        this.body = new ExtendedBody(this._io, this, this._root);
        break;
      case Dcmp0.Chunk.TagKind.LITERAL:
        this.body = new LiteralBody(this._io, this, this._root, this.tag);
        break;
      case Dcmp0.Chunk.TagKind.TABLE_LOOKUP:
        this.body = new TableLookupBody(this._io, this, this._root, this.tag);
        break;
      }
    }

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
        this._root = _root;
        this.tag = tag;

        this._read();
      }
      BackreferenceBody.prototype._read = function() {
        if (this.isIndexSeparate) {
          switch (this.tag) {
          case 32:
            this.indexSeparateMinus = this._io.readU1();
            break;
          case 33:
            this.indexSeparateMinus = this._io.readU1();
            break;
          case 34:
            this.indexSeparateMinus = this._io.readU2be();
            break;
          }
        }
      }

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
       * as stored in the tag byte.
       */
      Object.defineProperty(BackreferenceBody.prototype, 'indexInTag', {
        get: function() {
          if (this._m_indexInTag !== undefined)
            return this._m_indexInTag;
          this._m_indexInTag = this.tag - 35;
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
            this._m_indexSeparate = (this.indexSeparateMinus + 40) + (this.tag == 33 ? 256 : 0);
          }
          return this._m_indexSeparate;
        }
      });

      /**
       * Whether the index is stored separately from the tag.
       */
      Object.defineProperty(BackreferenceBody.prototype, 'isIndexSeparate', {
        get: function() {
          if (this._m_isIndexSeparate !== undefined)
            return this._m_isIndexSeparate;
          this._m_isIndexSeparate =  ((this.tag >= 32) && (this.tag <= 34)) ;
          return this._m_isIndexSeparate;
        }
      });

      /**
       * The index of the referenced literal chunk,
       * stored separately from the tag.
       * The value in this field is stored minus 0x28.
       * If the tag byte is 0x21,
       * the value is also stored minus 0x100,
       * *on top of* the regular offset
       * (i. e. minus 0x128 in total).
       * 
       * In other words,
       * for tag bytes 0x20 and 0x21,
       * the index is actually 9 bits large,
       * with the low 8 bits stored separately and the highest bit stored in the lowest bit of the tag byte.
       * 
       * This field is only present if the tag byte is 0x20 through 0x22.
       * For higher tag bytes,
       * the index is encoded in the tag byte.
       * Values smaller than 0x28 cannot be stored in this field,
       * they must always be encoded in the tag byte.
       */

      /**
       * The tag byte preceding this chunk body.
       */

      return BackreferenceBody;
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
        this._root = _root;

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
        this._root = _root;

        this._read();
      }
      ExtendedBody.prototype._read = function() {
        this.tag = this._io.readU1();
        switch (this.tag) {
        case 0:
          this.body = new JumpTableBody(this._io, this, this._root);
          break;
        case 2:
          this.body = new RepeatBody(this._io, this, this._root, this.tag);
          break;
        case 3:
          this.body = new RepeatBody(this._io, this, this._root, this.tag);
          break;
        case 4:
          this.body = new DeltaEncoding16BitBody(this._io, this, this._root);
          break;
        case 6:
          this.body = new DeltaEncoding32BitBody(this._io, this, this._root);
          break;
        }
      }

      /**
       * The body of a 16-bit delta encoding chunk.
       * 
       * This chunk expands to a sequence of 16-bit big-endian integer values.
       * The first value is stored literally.
       * All following values are stored as deltas relative to the previous value.
       */

      var DeltaEncoding16BitBody = ExtendedBody.DeltaEncoding16BitBody = (function() {
        function DeltaEncoding16BitBody(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root;

          this._read();
        }
        DeltaEncoding16BitBody.prototype._read = function() {
          this.firstValueRaw = new DcmpVariableLengthInteger_.DcmpVariableLengthInteger(this._io, null, null);
          this.numDeltasRaw = new DcmpVariableLengthInteger_.DcmpVariableLengthInteger(this._io, null, null);
          this.deltas = [];
          for (var i = 0; i < this.numDeltas; i++) {
            this.deltas.push(this._io.readS1());
          }
        }

        /**
         * The first value in the sequence.
         * 
         * Although it is stored as a variable-length integer,
         * this value must be in the range `-0x8000 <= x <= 0x7fff`,
         * i. e. a signed 16-bit integer.
         */
        Object.defineProperty(DeltaEncoding16BitBody.prototype, 'firstValue', {
          get: function() {
            if (this._m_firstValue !== undefined)
              return this._m_firstValue;
            this._m_firstValue = this.firstValueRaw.value;
            return this._m_firstValue;
          }
        });

        /**
         * The number of deltas stored in this chunk.
         * 
         * This number must not be negative.
         */
        Object.defineProperty(DeltaEncoding16BitBody.prototype, 'numDeltas', {
          get: function() {
            if (this._m_numDeltas !== undefined)
              return this._m_numDeltas;
            this._m_numDeltas = this.numDeltasRaw.value;
            return this._m_numDeltas;
          }
        });

        /**
         * Raw variable-length integer representation of `first_value`.
         */

        /**
         * Raw variable-length integer representation of `num_deltas`.
         */

        /**
         * The deltas for each value relative to the previous value.
         * 
         * Each of these deltas is a signed 8-bit value.
         * When adding the delta to the previous value,
         * 16-bit integer wraparound is performed if necessary,
         * so that the resulting value always fits into a 16-bit signed integer.
         */

        return DeltaEncoding16BitBody;
      })();

      /**
       * The body of a 32-bit delta encoding chunk.
       * 
       * This chunk expands to a sequence of 32-bit big-endian integer values.
       * The first value is stored literally.
       * All following values are stored as deltas relative to the previous value.
       */

      var DeltaEncoding32BitBody = ExtendedBody.DeltaEncoding32BitBody = (function() {
        function DeltaEncoding32BitBody(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root;

          this._read();
        }
        DeltaEncoding32BitBody.prototype._read = function() {
          this.firstValueRaw = new DcmpVariableLengthInteger_.DcmpVariableLengthInteger(this._io, null, null);
          this.numDeltasRaw = new DcmpVariableLengthInteger_.DcmpVariableLengthInteger(this._io, null, null);
          this.deltasRaw = [];
          for (var i = 0; i < this.numDeltas; i++) {
            this.deltasRaw.push(new DcmpVariableLengthInteger_.DcmpVariableLengthInteger(this._io, null, null));
          }
        }

        /**
         * The first value in the sequence.
         */
        Object.defineProperty(DeltaEncoding32BitBody.prototype, 'firstValue', {
          get: function() {
            if (this._m_firstValue !== undefined)
              return this._m_firstValue;
            this._m_firstValue = this.firstValueRaw.value;
            return this._m_firstValue;
          }
        });

        /**
         * The number of deltas stored in this chunk.
         * 
         * This number must not be negative.
         */
        Object.defineProperty(DeltaEncoding32BitBody.prototype, 'numDeltas', {
          get: function() {
            if (this._m_numDeltas !== undefined)
              return this._m_numDeltas;
            this._m_numDeltas = this.numDeltasRaw.value;
            return this._m_numDeltas;
          }
        });

        /**
         * Raw variable-length integer representation of `first_value`.
         */

        /**
         * Raw variable-length integer representation of `num_deltas`.
         */

        /**
         * The deltas for each value relative to the previous value,
         * stored as variable-length integers.
         * 
         * Each of these deltas is a signed value.
         * When adding the delta to the previous value,
         * 32-bit integer wraparound is performed if necessary,
         * so that the resulting value always fits into a 32-bit signed integer.
         */

        return DeltaEncoding32BitBody;
      })();

      /**
       * The body of a jump table chunk.
       * 
       * This chunk generates parts of a segment loader jump table,
       * in the format found in `'CODE' (0)` resources.
       * It expands to the following data,
       * with all non-constant numbers encoded as unsigned 16-bit big-endian integers:
       * 
       * * `0x3f 0x3c` (push following segment number onto stack)
       * * The segment number
       * * `0xa9 0xf0` (`_LoadSeg` trap)
       * * For each address:
       *   * The address
       *   * `0x3f 0x3c` (push following segment number onto stack)
       *   * The segment number
       *   * `0xa9 0xf0` (`_LoadSeg` trap)
       * 
       * Note that this generates one jump table entry without an address before it,
       * meaning that this address needs to be generated by the preceding chunk.
       * All following jump table entries are generated with the addresses encoded in this chunk.
       */

      var JumpTableBody = ExtendedBody.JumpTableBody = (function() {
        function JumpTableBody(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root;

          this._read();
        }
        JumpTableBody.prototype._read = function() {
          this.segmentNumberRaw = new DcmpVariableLengthInteger_.DcmpVariableLengthInteger(this._io, null, null);
          this.numAddressesRaw = new DcmpVariableLengthInteger_.DcmpVariableLengthInteger(this._io, null, null);
          this.addressesRaw = [];
          for (var i = 0; i < this.numAddresses; i++) {
            this.addressesRaw.push(new DcmpVariableLengthInteger_.DcmpVariableLengthInteger(this._io, null, null));
          }
        }

        /**
         * The number of addresses stored in this chunk.
         * 
         * This number must be greater than 0.
         */
        Object.defineProperty(JumpTableBody.prototype, 'numAddresses', {
          get: function() {
            if (this._m_numAddresses !== undefined)
              return this._m_numAddresses;
            this._m_numAddresses = this.numAddressesRaw.value;
            return this._m_numAddresses;
          }
        });

        /**
         * The segment number for all of the generated jump table entries.
         * 
         * Although it is stored as a variable-length integer,
         * the segment number must be in the range `0x0 <= x <= 0xffff`,
         * i. e. an unsigned 16-bit integer.
         */
        Object.defineProperty(JumpTableBody.prototype, 'segmentNumber', {
          get: function() {
            if (this._m_segmentNumber !== undefined)
              return this._m_segmentNumber;
            this._m_segmentNumber = this.segmentNumberRaw.value;
            return this._m_segmentNumber;
          }
        });

        /**
         * Raw variable-length integer representation of `segment_number`.
         */

        /**
         * Raw variable-length integer representation of `num_addresses`.
         */

        /**
         * The addresses for each generated jump table entry,
         * stored as variable-length integers.
         * 
         * The first address is stored literally and must be in the range `0x0 <= x <= 0xffff`,
         * i. e. an unsigned 16-bit integer.
         * 
         * All following addresses are stored as deltas relative to the previous address.
         * Each of these deltas is stored plus 6;
         * this value needs to be subtracted before (or after) adding it to the previous address.
         * 
         * Each delta (after subtracting 6) should be positive,
         * and adding it to the previous address should not result in a value larger than `0xffff`,
         * i. e. there should be no 16-bit unsigned integer wraparound.
         * These conditions are always met in all known jump table chunks,
         * so it is not known how the original decompressor behaves otherwise.
         */

        return JumpTableBody;
      })();

      /**
       * The body of a repeat chunk.
       * 
       * This chunk expands to a 1-byte or 2-byte value repeated a number of times,
       * i. e. it implements a form of run-length encoding.
       */

      var RepeatBody = ExtendedBody.RepeatBody = (function() {
        function RepeatBody(_io, _parent, _root, tag) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root;
          this.tag = tag;

          this._read();
        }
        RepeatBody.prototype._read = function() {
          this.toRepeatRaw = new DcmpVariableLengthInteger_.DcmpVariableLengthInteger(this._io, null, null);
          this.repeatCountM1Raw = new DcmpVariableLengthInteger_.DcmpVariableLengthInteger(this._io, null, null);
        }

        /**
         * The length in bytes of the value to be repeated.
         * Regardless of the byte count,
         * the value to be repeated is stored as a variable-length integer.
         */
        Object.defineProperty(RepeatBody.prototype, 'byteCount', {
          get: function() {
            if (this._m_byteCount !== undefined)
              return this._m_byteCount;
            this._m_byteCount = (this.tag == 2 ? 1 : (this.tag == 3 ? 2 : -1));
            return this._m_byteCount;
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
            this._m_repeatCount = this.repeatCountM1 + 1;
            return this._m_repeatCount;
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
         * The value to repeat.
         * 
         * Although it is stored as a variable-length integer,
         * this value must fit into an unsigned big-endian integer that is as long as `byte_count`,
         * i. e. either 8 or 16 bits.
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
         * Raw variable-length integer representation of `to_repeat`.
         */

        /**
         * Raw variable-length integer representation of `repeat_count_m1`.
         */

        /**
         * The extended tag byte preceding this chunk body.
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
     * The body of a literal data chunk.
     * 
     * The data that this chunk expands to is stored literally in the body (`literal`).
     * Optionally,
     * the literal data may also be stored for use by future backreference chunks (`do_store`).
     * 
     * The length of the literal data is stored as a number of two-byte units.
     * This means that the literal data always has an even length in bytes.
     */

    var LiteralBody = Chunk.LiteralBody = (function() {
      function LiteralBody(_io, _parent, _root, tag) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this.tag = tag;

        this._read();
      }
      LiteralBody.prototype._read = function() {
        if (this.isLenLiteralDiv2Separate) {
          this.lenLiteralDiv2Separate = this._io.readU1();
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
          this._m_doStore = (this.tag & 16) != 0;
          return this._m_doStore;
        }
      });

      /**
       * Whether the length of the literal is stored separately from the tag.
       */
      Object.defineProperty(LiteralBody.prototype, 'isLenLiteralDiv2Separate', {
        get: function() {
          if (this._m_isLenLiteralDiv2Separate !== undefined)
            return this._m_isLenLiteralDiv2Separate;
          this._m_isLenLiteralDiv2Separate = this.lenLiteralDiv2InTag == 0;
          return this._m_isLenLiteralDiv2Separate;
        }
      });

      /**
       * The length of the literal data,
       * in bytes.
       */
      Object.defineProperty(LiteralBody.prototype, 'lenLiteral', {
        get: function() {
          if (this._m_lenLiteral !== undefined)
            return this._m_lenLiteral;
          this._m_lenLiteral = this.lenLiteralDiv2 * 2;
          return this._m_lenLiteral;
        }
      });

      /**
       * The length of the literal data,
       * in two-byte units.
       * 
       * In practice,
       * this value is always greater than zero,
       * as there is no use in storing a zero-length literal.
       */
      Object.defineProperty(LiteralBody.prototype, 'lenLiteralDiv2', {
        get: function() {
          if (this._m_lenLiteralDiv2 !== undefined)
            return this._m_lenLiteralDiv2;
          this._m_lenLiteralDiv2 = (this.isLenLiteralDiv2Separate ? this.lenLiteralDiv2Separate : this.lenLiteralDiv2InTag);
          return this._m_lenLiteralDiv2;
        }
      });

      /**
       * The part of the tag byte that indicates the length of the literal data,
       * in two-byte units.
       * If this value is 0,
       * the length is stored in a separate byte after the tag byte and before the literal data.
       */
      Object.defineProperty(LiteralBody.prototype, 'lenLiteralDiv2InTag', {
        get: function() {
          if (this._m_lenLiteralDiv2InTag !== undefined)
            return this._m_lenLiteralDiv2InTag;
          this._m_lenLiteralDiv2InTag = this.tag & 15;
          return this._m_lenLiteralDiv2InTag;
        }
      });

      /**
       * The length of the literal data,
       * in two-byte units.
       * 
       * This field is only present if the tag byte's low nibble is zero.
       * In practice,
       * this only happens if the length is 0x10 or greater,
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
        this._root = _root;
        this.tag = tag;

        this._read();
      }
      TableLookupBody.prototype._read = function() {
      }

      /**
       * Fixed lookup table that maps tag byte numbers to two bytes each.
       * 
       * The entries in the lookup table are offset -
       * index 0 stands for tag 0x4b, 1 for 0x4c, etc.
       */
      Object.defineProperty(TableLookupBody.prototype, 'lookupTable', {
        get: function() {
          if (this._m_lookupTable !== undefined)
            return this._m_lookupTable;
          this._m_lookupTable = [new Uint8Array([0, 0]), new Uint8Array([78, 186]), new Uint8Array([0, 8]), new Uint8Array([78, 117]), new Uint8Array([0, 12]), new Uint8Array([78, 173]), new Uint8Array([32, 83]), new Uint8Array([47, 11]), new Uint8Array([97, 0]), new Uint8Array([0, 16]), new Uint8Array([112, 0]), new Uint8Array([47, 0]), new Uint8Array([72, 110]), new Uint8Array([32, 80]), new Uint8Array([32, 110]), new Uint8Array([47, 46]), new Uint8Array([255, 252]), new Uint8Array([72, 231]), new Uint8Array([63, 60]), new Uint8Array([0, 4]), new Uint8Array([255, 248]), new Uint8Array([47, 12]), new Uint8Array([32, 6]), new Uint8Array([78, 237]), new Uint8Array([78, 86]), new Uint8Array([32, 104]), new Uint8Array([78, 94]), new Uint8Array([0, 1]), new Uint8Array([88, 143]), new Uint8Array([79, 239]), new Uint8Array([0, 2]), new Uint8Array([0, 24]), new Uint8Array([96, 0]), new Uint8Array([255, 255]), new Uint8Array([80, 143]), new Uint8Array([78, 144]), new Uint8Array([0, 6]), new Uint8Array([38, 110]), new Uint8Array([0, 20]), new Uint8Array([255, 244]), new Uint8Array([76, 238]), new Uint8Array([0, 10]), new Uint8Array([0, 14]), new Uint8Array([65, 238]), new Uint8Array([76, 223]), new Uint8Array([72, 192]), new Uint8Array([255, 240]), new Uint8Array([45, 64]), new Uint8Array([0, 18]), new Uint8Array([48, 46]), new Uint8Array([112, 1]), new Uint8Array([47, 40]), new Uint8Array([32, 84]), new Uint8Array([103, 0]), new Uint8Array([0, 32]), new Uint8Array([0, 28]), new Uint8Array([32, 95]), new Uint8Array([24, 0]), new Uint8Array([38, 111]), new Uint8Array([72, 120]), new Uint8Array([0, 22]), new Uint8Array([65, 250]), new Uint8Array([48, 60]), new Uint8Array([40, 64]), new Uint8Array([114, 0]), new Uint8Array([40, 110]), new Uint8Array([32, 12]), new Uint8Array([102, 0]), new Uint8Array([32, 107]), new Uint8Array([47, 7]), new Uint8Array([85, 143]), new Uint8Array([0, 40]), new Uint8Array([255, 254]), new Uint8Array([255, 236]), new Uint8Array([34, 216]), new Uint8Array([32, 11]), new Uint8Array([0, 15]), new Uint8Array([89, 143]), new Uint8Array([47, 60]), new Uint8Array([255, 0]), new Uint8Array([1, 24]), new Uint8Array([129, 225]), new Uint8Array([74, 0]), new Uint8Array([78, 176]), new Uint8Array([255, 232]), new Uint8Array([72, 199]), new Uint8Array([0, 3]), new Uint8Array([0, 34]), new Uint8Array([0, 7]), new Uint8Array([0, 26]), new Uint8Array([103, 6]), new Uint8Array([103, 8]), new Uint8Array([78, 249]), new Uint8Array([0, 36]), new Uint8Array([32, 120]), new Uint8Array([8, 0]), new Uint8Array([102, 4]), new Uint8Array([0, 42]), new Uint8Array([78, 208]), new Uint8Array([48, 40]), new Uint8Array([38, 95]), new Uint8Array([103, 4]), new Uint8Array([0, 48]), new Uint8Array([67, 238]), new Uint8Array([63, 0]), new Uint8Array([32, 31]), new Uint8Array([0, 30]), new Uint8Array([255, 246]), new Uint8Array([32, 46]), new Uint8Array([66, 167]), new Uint8Array([32, 7]), new Uint8Array([255, 250]), new Uint8Array([96, 2]), new Uint8Array([61, 64]), new Uint8Array([12, 64]), new Uint8Array([102, 6]), new Uint8Array([0, 38]), new Uint8Array([45, 72]), new Uint8Array([47, 1]), new Uint8Array([112, 255]), new Uint8Array([96, 4]), new Uint8Array([24, 128]), new Uint8Array([74, 64]), new Uint8Array([0, 64]), new Uint8Array([0, 44]), new Uint8Array([47, 8]), new Uint8Array([0, 17]), new Uint8Array([255, 228]), new Uint8Array([33, 64]), new Uint8Array([38, 64]), new Uint8Array([255, 242]), new Uint8Array([66, 110]), new Uint8Array([78, 185]), new Uint8Array([61, 124]), new Uint8Array([0, 56]), new Uint8Array([0, 13]), new Uint8Array([96, 6]), new Uint8Array([66, 46]), new Uint8Array([32, 60]), new Uint8Array([103, 12]), new Uint8Array([45, 104]), new Uint8Array([102, 8]), new Uint8Array([74, 46]), new Uint8Array([74, 174]), new Uint8Array([0, 46]), new Uint8Array([72, 64]), new Uint8Array([34, 95]), new Uint8Array([34, 0]), new Uint8Array([103, 10]), new Uint8Array([48, 7]), new Uint8Array([66, 103]), new Uint8Array([0, 50]), new Uint8Array([32, 40]), new Uint8Array([0, 9]), new Uint8Array([72, 122]), new Uint8Array([2, 0]), new Uint8Array([47, 43]), new Uint8Array([0, 5]), new Uint8Array([34, 110]), new Uint8Array([102, 2]), new Uint8Array([229, 128]), new Uint8Array([103, 14]), new Uint8Array([102, 10]), new Uint8Array([0, 80]), new Uint8Array([62, 0]), new Uint8Array([102, 12]), new Uint8Array([46, 0]), new Uint8Array([255, 238]), new Uint8Array([32, 109]), new Uint8Array([32, 64]), new Uint8Array([255, 224]), new Uint8Array([83, 64]), new Uint8Array([96, 8]), new Uint8Array([4, 128]), new Uint8Array([0, 104]), new Uint8Array([11, 124]), new Uint8Array([68, 0]), new Uint8Array([65, 232]), new Uint8Array([72, 65])];
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
          this._m_value = this.lookupTable[this.tag - 75];
          return this._m_value;
        }
      });

      /**
       * The tag byte preceding this chunk body.
       */

      return TableLookupBody;
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

  return Dcmp0;
})();
Dcmp0_.Dcmp0 = Dcmp0;
});
