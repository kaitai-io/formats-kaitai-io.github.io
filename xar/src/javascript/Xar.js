// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Xar = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * From [Wikipedia](https://en.wikipedia.org/wiki/Xar_(archiver)):
 * 
 * "XAR (short for eXtensible ARchive format) is an open source file archiver
 * and the archiver's file format. It was created within the OpenDarwin project
 * and is used in macOS X 10.5 and up for software installation routines, as
 * well as browser extensions in Safari 5.0 and up."
 * @see {@link https://github.com/mackyle/xar/wiki/xarformat|Source}
 */

var Xar = (function() {
  Xar.ChecksumAlgorithmsApple = Object.freeze({
    NONE: 0,
    SHA1: 1,
    MD5: 2,
    SHA256: 3,
    SHA512: 4,

    0: "NONE",
    1: "SHA1",
    2: "MD5",
    3: "SHA256",
    4: "SHA512",
  });

  function Xar(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Xar.prototype._read = function() {
    this.headerPrefix = new FileHeaderPrefix(this._io, this, this._root);
    this._raw_header = this._io.readBytes((this.headerPrefix.lenHeader - 6));
    var _io__raw_header = new KaitaiStream(this._raw_header);
    this.header = new FileHeader(_io__raw_header, this, this._root);
    this._raw__raw_toc = this._io.readBytes(this.header.lenTocCompressed);
    this._raw_toc = KaitaiStream.processZlib(this._raw__raw_toc);
    var _io__raw_toc = new KaitaiStream(this._raw_toc);
    this.toc = new TocType(_io__raw_toc, this, this._root);
  }

  var FileHeaderPrefix = Xar.FileHeaderPrefix = (function() {
    function FileHeaderPrefix(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FileHeaderPrefix.prototype._read = function() {
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [120, 97, 114, 33]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([120, 97, 114, 33], this.magic, this._io, "/types/file_header_prefix/seq/0");
      }
      this.lenHeader = this._io.readU2be();
    }

    /**
     * internal; access `_root.header.len_header` instead
     */

    return FileHeaderPrefix;
  })();

  var FileHeader = Xar.FileHeader = (function() {
    function FileHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FileHeader.prototype._read = function() {
      this.version = this._io.readU2be();
      if (!(this.version == 1)) {
        throw new KaitaiStream.ValidationNotEqualError(1, this.version, this._io, "/types/file_header/seq/0");
      }
      this.lenTocCompressed = this._io.readU8be();
      this.tocLengthUncompressed = this._io.readU8be();
      this.checksumAlgorithmInt = this._io.readU4be();
      if (this.hasChecksumAlgName) {
        this.checksumAlgName = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytesFull(), 0, false), "UTF-8");
        var _ = this.checksumAlgName;
        if (!( ((_ != "") && (_ != "none")) )) {
          throw new KaitaiStream.ValidationExprError(this.checksumAlgName, this._io, "/types/file_header/seq/4");
        }
      }
    }

    /**
     * If it is not
     * 
     * * `""` (empty string), indicating an unknown integer value (access
     *   `checksum_algorithm_int` for debugging purposes to find out
     *   what that value is), or
     * * `"none"`, indicating that the TOC checksum is not provided (in that
     *   case, the `<checksum>` property or its `style` attribute should be
     *   missing, or the `style` attribute must be set to `"none"`),
     * 
     * it must exactly match the `style` attribute value of the
     * `<checksum>` property in the root node `<toc>`. See
     * <https://github.com/mackyle/xar/blob/66d451d/xar/lib/archive.c#L345-L371>
     * for reference.
     * 
     * The `xar` (eXtensible ARchiver) program [uses OpenSSL's function
     * `EVP_get_digestbyname`](
     *   https://github.com/mackyle/xar/blob/66d451d/xar/lib/archive.c#L328
     * ) to verify this value (if it's not `""` or `"none"`, of course).
     * So it's reasonable to assume that this can only have one of the values
     * that OpenSSL recognizes.
     */
    Object.defineProperty(FileHeader.prototype, 'checksumAlgorithmName', {
      get: function() {
        if (this._m_checksumAlgorithmName !== undefined)
          return this._m_checksumAlgorithmName;
        this._m_checksumAlgorithmName = (this.hasChecksumAlgName ? this.checksumAlgName : (this.checksumAlgorithmInt == Xar.ChecksumAlgorithmsApple.NONE ? "none" : (this.checksumAlgorithmInt == Xar.ChecksumAlgorithmsApple.SHA1 ? "sha1" : (this.checksumAlgorithmInt == Xar.ChecksumAlgorithmsApple.MD5 ? "md5" : (this.checksumAlgorithmInt == Xar.ChecksumAlgorithmsApple.SHA256 ? "sha256" : (this.checksumAlgorithmInt == Xar.ChecksumAlgorithmsApple.SHA512 ? "sha512" : ""))))));
        return this._m_checksumAlgorithmName;
      }
    });
    Object.defineProperty(FileHeader.prototype, 'hasChecksumAlgName', {
      get: function() {
        if (this._m_hasChecksumAlgName !== undefined)
          return this._m_hasChecksumAlgName;
        this._m_hasChecksumAlgName =  ((this.checksumAlgorithmInt == this._root.checksumAlgorithmOther) && (this.lenHeader >= 32) && (KaitaiStream.mod(this.lenHeader, 4) == 0)) ;
        return this._m_hasChecksumAlgName;
      }
    });
    Object.defineProperty(FileHeader.prototype, 'lenHeader', {
      get: function() {
        if (this._m_lenHeader !== undefined)
          return this._m_lenHeader;
        this._m_lenHeader = this._root.headerPrefix.lenHeader;
        return this._m_lenHeader;
      }
    });

    /**
     * internal; access `checksum_algorithm_name` instead
     */

    /**
     * internal; access `checksum_algorithm_name` instead
     */

    return FileHeader;
  })();

  var TocType = Xar.TocType = (function() {
    function TocType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    TocType.prototype._read = function() {
      this.xmlString = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
    }

    return TocType;
  })();

  /**
   * @see {@link https://github.com/mackyle/xar/blob/66d451d/xar/include/xar.h.in#L85|Source}
   */
  Object.defineProperty(Xar.prototype, 'checksumAlgorithmOther', {
    get: function() {
      if (this._m_checksumAlgorithmOther !== undefined)
        return this._m_checksumAlgorithmOther;
      this._m_checksumAlgorithmOther = 3;
      return this._m_checksumAlgorithmOther;
    }
  });

  /**
   * internal; access `_root.header` instead
   */

  /**
   * zlib compressed XML further describing the content of the archive
   */

  return Xar;
})();
return Xar;
}));
