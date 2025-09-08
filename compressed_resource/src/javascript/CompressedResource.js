// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './BytesWithIo'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./BytesWithIo'));
  } else {
    factory(root.CompressedResource || (root.CompressedResource = {}), root.KaitaiStream, root.BytesWithIo || (root.BytesWithIo = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (CompressedResource_, KaitaiStream, BytesWithIo_) {
/**
 * Compressed Macintosh resource data,
 * as stored in resources with the "compressed" attribute.
 * 
 * Resource decompression is not documented by Apple.
 * It is mostly used internally in System 7,
 * some of Apple's own applications (such as ResEdit),
 * and also by some third-party applications.
 * Later versions of Classic Mac OS make less use of resource compression,
 * but still support it fully for backwards compatibility.
 * Carbon in Mac OS X no longer supports resource compression in any way.
 * 
 * The data of all compressed resources starts with a common header,
 * followed by the compressed data.
 * The data is decompressed using code in a `'dcmp'` resource.
 * Some decompressors used by Apple are included in the System file,
 * but applications can also include custom decompressors.
 * The header of the compressed data indicates the ID of the `'dcmp'` resource used to decompress the data,
 * along with some parameters for the decompressor.
 * @see {@link http://www.alysis.us/arctechnology.htm|Source}
 * @see {@link http://preserve.mactech.com/articles/mactech/Vol.09/09.01/ResCompression/index.html|Source}
 * @see {@link https://github.com/dgelessus/python-rsrcfork/tree/f891a6e/src/rsrcfork/compress|Source}
 */

var CompressedResource = (function() {
  function CompressedResource(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  CompressedResource.prototype._read = function() {
    this.header = new Header(this._io, this, this._root);
    this.compressedData = this._io.readBytesFull();
  }

  /**
   * Compressed resource data header,
   * as stored at the start of all compressed resources.
   */

  var Header = CompressedResource.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Header.prototype._read = function() {
      this.commonPart = new CommonPart(this._io, this, this._root);
      this._raw_typeSpecificPartRawWithIo = this._io.readBytes(this.commonPart.lenHeader - 12);
      var _io__raw_typeSpecificPartRawWithIo = new KaitaiStream(this._raw_typeSpecificPartRawWithIo);
      this.typeSpecificPartRawWithIo = new BytesWithIo_.BytesWithIo(_io__raw_typeSpecificPartRawWithIo, null, null);
    }

    /**
     * The common part of a compressed resource data header.
     * The format of this part is the same for all compressed resources.
     */

    var CommonPart = Header.CommonPart = (function() {
      function CommonPart(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      CommonPart.prototype._read = function() {
        this.magic = this._io.readBytes(4);
        if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([168, 159, 101, 114])) == 0))) {
          throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([168, 159, 101, 114]), this.magic, this._io, "/types/header/types/common_part/seq/0");
        }
        this.lenHeader = this._io.readU2be();
        if (!(this.lenHeader == 18)) {
          throw new KaitaiStream.ValidationNotEqualError(18, this.lenHeader, this._io, "/types/header/types/common_part/seq/1");
        }
        this.headerType = this._io.readU1();
        this.unknown = this._io.readU1();
        if (!(this.unknown == 1)) {
          throw new KaitaiStream.ValidationNotEqualError(1, this.unknown, this._io, "/types/header/types/common_part/seq/3");
        }
        this.lenDecompressed = this._io.readU4be();
      }

      /**
       * The signature of all compressed resource data.
       * 
       * When interpreted as MacRoman, this byte sequence decodes to `®üer`.
       */

      /**
       * The byte length of the entire header (common and type-specific parts).
       * 
       * The meaning of this field is mostly a guess,
       * as all known header types result in a total length of `0x12`.
       */

      /**
       * Type of the header.
       * This determines the format of the data in the type-specific part of the header.
       * 
       * The only known header type values are `8` and `9`.
       * 
       * Every known decompressor is only compatible with one of the header types
       * (but every header type is used by more than one decompressor).
       * Apple's decompressors with IDs 0 and 1 use header type 8,
       * and those with IDs 2 and 3 use header type 9.
       */

      /**
       * The meaning of this field is not known.
       * It has the value `0x01` in all known compressed resources.
       */

      /**
       * The byte length of the data after decompression.
       */

      return CommonPart;
    })();

    /**
     * The type-specific part of a compressed resource header with header type `8`.
     */

    var TypeSpecificPartType8 = Header.TypeSpecificPartType8 = (function() {
      function TypeSpecificPartType8(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      TypeSpecificPartType8.prototype._read = function() {
        this.workingBufferFractionalSize = this._io.readU1();
        this.expansionBufferSize = this._io.readU1();
        this.decompressorId = this._io.readS2be();
        this.reserved = this._io.readU2be();
        if (!(this.reserved == 0)) {
          throw new KaitaiStream.ValidationNotEqualError(0, this.reserved, this._io, "/types/header/types/type_specific_part_type_8/seq/3");
        }
      }

      /**
       * The ratio of the compressed data size to the uncompressed data size,
       * times 256.
       * 
       * This parameter affects the amount of memory allocated by the Resource Manager during decompression,
       * but does not have a direct effect on the decompressor
       * (except that it will misbehave if insufficient memory is provided).
       * Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.
       */

      /**
       * The maximum number of bytes that the compressed data might "grow" during decompression.
       * 
       * This parameter affects the amount of memory allocated by the Resource Manager during decompression,
       * but does not have a direct effect on the decompressor
       * (except that it will misbehave if insufficient memory is provided).
       * Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.
       */

      /**
       * The ID of the `'dcmp'` resource that should be used to decompress this resource.
       */

      /**
       * The meaning of this field is not known.
       * It has the value `0` in all known compressed resources,
       * so it is most likely reserved.
       */

      return TypeSpecificPartType8;
    })();

    /**
     * The type-specific part of a compressed resource header with header type `9`.
     */

    var TypeSpecificPartType9 = Header.TypeSpecificPartType9 = (function() {
      function TypeSpecificPartType9(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      TypeSpecificPartType9.prototype._read = function() {
        this.decompressorId = this._io.readS2be();
        this._raw_decompressorSpecificParametersWithIo = this._io.readBytes(4);
        var _io__raw_decompressorSpecificParametersWithIo = new KaitaiStream(this._raw_decompressorSpecificParametersWithIo);
        this.decompressorSpecificParametersWithIo = new BytesWithIo_.BytesWithIo(_io__raw_decompressorSpecificParametersWithIo, null, null);
      }

      /**
       * Decompressor-specific parameters.
       * The exact structure and meaning of this field is different for each decompressor.
       * 
       * This field always has the same length,
       * but decompressors don't always use the entirety of the field,
       * so depending on the decompressor some parts of this field may be meaningless.
       */
      Object.defineProperty(TypeSpecificPartType9.prototype, 'decompressorSpecificParameters', {
        get: function() {
          if (this._m_decompressorSpecificParameters !== undefined)
            return this._m_decompressorSpecificParameters;
          this._m_decompressorSpecificParameters = this.decompressorSpecificParametersWithIo.data;
          return this._m_decompressorSpecificParameters;
        }
      });

      /**
       * The ID of the `'dcmp'` resource that should be used to decompress this resource.
       */

      /**
       * Use `decompressor_specific_parameters` instead,
       * unless you need access to this field's `_io`.
       */

      return TypeSpecificPartType9;
    })();

    /**
     * The type-specific part of the header,
     * parsed according to the type from the common part.
     */
    Object.defineProperty(Header.prototype, 'typeSpecificPart', {
      get: function() {
        if (this._m_typeSpecificPart !== undefined)
          return this._m_typeSpecificPart;
        var io = this.typeSpecificPartRawWithIo._io;
        var _pos = io.pos;
        io.seek(0);
        switch (this.commonPart.headerType) {
        case 8:
          this._m_typeSpecificPart = new TypeSpecificPartType8(io, this, this._root);
          break;
        case 9:
          this._m_typeSpecificPart = new TypeSpecificPartType9(io, this, this._root);
          break;
        }
        io.seek(_pos);
        return this._m_typeSpecificPart;
      }
    });

    /**
     * The type-specific part of the header,
     * as a raw byte array.
     */
    Object.defineProperty(Header.prototype, 'typeSpecificPartRaw', {
      get: function() {
        if (this._m_typeSpecificPartRaw !== undefined)
          return this._m_typeSpecificPartRaw;
        this._m_typeSpecificPartRaw = this.typeSpecificPartRawWithIo.data;
        return this._m_typeSpecificPartRaw;
      }
    });

    /**
     * The common part of the header.
     * Among other things,
     * this part contains the header type,
     * which determines the format of the data in the type-specific part of the header.
     */

    /**
     * Use `type_specific_part_raw` instead,
     * unless you need access to this field's `_io`.
     */

    return Header;
  })();

  /**
   * The header of the compressed data.
   */

  /**
   * The compressed resource data.
   * 
   * The format of this data is completely dependent on the decompressor and its parameters,
   * as specified in the header.
   * For details about the compressed data formats implemented by Apple's decompressors,
   * see the specs in the resource_compression subdirectory.
   */

  return CompressedResource;
})();
CompressedResource_.CompressedResource = CompressedResource;
});
