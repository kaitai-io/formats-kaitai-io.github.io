// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './PhpSerializedValue'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./PhpSerializedValue'));
  } else {
    root.PharWithoutStub = factory(root.KaitaiStream, root.PhpSerializedValue);
  }
}(this, function (KaitaiStream, PhpSerializedValue) {
/**
 * A phar (PHP archive) file. The phar format is a custom archive format
 * from the PHP ecosystem that is used to package a complete PHP library
 * or application into a single self-contained archive.
 * All phar archives start with an executable PHP stub, which can be used to
 * allow executing or including phar files as if they were regular PHP scripts.
 * PHP 5.3 and later include the phar extension, which adds native support for
 * reading and manipulating phar files.
 * 
 * The phar format was originally developed as part of the PEAR library
 * PHP_Archive, first released in 2005. Later, a native PHP extension
 * named "phar" was developed, which was first released on PECL in 2007,
 * and is included with PHP 5.3 and later. The phar extension has effectively
 * superseded the PHP_Archive library, which has not been updated since 2010.
 * The phar extension is also no longer released independently on PECL;
 * it is now developed and released as part of PHP itself.
 * 
 * Because of current limitations in Kaitai Struct
 * (seekaitai-io/kaitai_struct#158 and kaitai-io/kaitai_struct#538),
 * the executable PHP stub that precedes the rest of the archive is not handled
 * by this spec. Before parsing a phar using this spec, the stub must be
 * removed manually.
 * 
 * A phar's stub is terminated by the special token `__HALT_COMPILER();`
 * (which may be followed by at most one space, the PHP tag end `?>`,
 * and an optional line terminator). The stub termination sequence is
 * immediately followed by the remaining parts of the phar format,
 * as described in this spec.
 * 
 * The phar stub usually contains code that loads the phar and runs
 * a contained PHP file, but this is not required. A minimal valid phar stub
 * is `<?php __HALT_COMPILER();` - such a stub makes it impossible to execute
 * the phar directly, but still allows loading or manipulating it using the
 * phar extension.
 * 
 * Note: The phar format does not specify any encoding for text fields
 * (stub, alias name, and all file names), so these fields may contain arbitrary
 * binary data. The actual text encoding used in a specific phar file usually
 * depends on the application that created the phar, and on the
 * standard encoding of the system on which the phar was created.
 * @see {@link https://www.php.net/manual/en/phar.fileformat.php|Source}
 * @see {@link https://github.com/php/php-src/tree/master/ext/phar|Source}
 * @see {@link https://svn.php.net/viewvc/pecl/phar/|Source}
 * @see {@link https://svn.php.net/viewvc/pear/packages/PHP_Archive/|Source}
 */

var PharWithoutStub = (function() {
  PharWithoutStub.SignatureType = Object.freeze({
    MD5: 1,
    SHA1: 2,
    SHA256: 4,
    SHA512: 8,
    OPENSSL: 16,

    1: "MD5",
    2: "SHA1",
    4: "SHA256",
    8: "SHA512",
    16: "OPENSSL",
  });

  function PharWithoutStub(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  PharWithoutStub.prototype._read = function() {
    this.manifest = new Manifest(this._io, this, this._root);
    this.files = new Array(this.manifest.numFiles);
    for (var i = 0; i < this.manifest.numFiles; i++) {
      this.files[i] = this._io.readBytes(this.manifest.fileEntries[i].lenDataCompressed);
    }
    if (this.manifest.flags.hasSignature) {
      this._raw_signature = this._io.readBytesFull();
      var _io__raw_signature = new KaitaiStream(this._raw_signature);
      this.signature = new Signature(_io__raw_signature, this, this._root);
    }
  }

  var SerializedValue = PharWithoutStub.SerializedValue = (function() {
    function SerializedValue(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SerializedValue.prototype._read = function() {
      this.raw = this._io.readBytesFull();
    }

    /**
     * The serialized value, parsed as a structure.
     */
    Object.defineProperty(SerializedValue.prototype, 'parsed', {
      get: function() {
        if (this._m_parsed !== undefined)
          return this._m_parsed;
        var _pos = this._io.pos;
        this._io.seek(0);
        this._m_parsed = new PhpSerializedValue(this._io, this, null);
        this._io.seek(_pos);
        return this._m_parsed;
      }
    });

    /**
     * The serialized value, as a raw byte array.
     */

    return SerializedValue;
  })();

  var Signature = PharWithoutStub.Signature = (function() {
    function Signature(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Signature.prototype._read = function() {
      this.data = this._io.readBytes(((this._io.size - this._io.pos) - 8));
      this.type = this._io.readU4le();
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [71, 66, 77, 66]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([71, 66, 77, 66], this.magic, this._io, "/types/signature/seq/2");
      }
    }

    /**
     * The signature data. The size and contents depend on the
     * signature type.
     */

    /**
     * The signature type.
     */

    return Signature;
  })();

  var FileFlags = PharWithoutStub.FileFlags = (function() {
    function FileFlags(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FileFlags.prototype._read = function() {
      this.value = this._io.readU4le();
    }

    /**
     * The file's permission bits.
     */
    Object.defineProperty(FileFlags.prototype, 'permissions', {
      get: function() {
        if (this._m_permissions !== undefined)
          return this._m_permissions;
        this._m_permissions = (this.value & 511);
        return this._m_permissions;
      }
    });

    /**
     * Whether this file's data is stored using zlib compression.
     */
    Object.defineProperty(FileFlags.prototype, 'zlibCompressed', {
      get: function() {
        if (this._m_zlibCompressed !== undefined)
          return this._m_zlibCompressed;
        this._m_zlibCompressed = (this.value & 4096) != 0;
        return this._m_zlibCompressed;
      }
    });

    /**
     * Whether this file's data is stored using bzip2 compression.
     */
    Object.defineProperty(FileFlags.prototype, 'bzip2Compressed', {
      get: function() {
        if (this._m_bzip2Compressed !== undefined)
          return this._m_bzip2Compressed;
        this._m_bzip2Compressed = (this.value & 8192) != 0;
        return this._m_bzip2Compressed;
      }
    });

    /**
     * The unparsed flag bits.
     */

    return FileFlags;
  })();

  /**
   * A phar API version number. This version number is meant to indicate
   * which features are used in a specific phar, so that tools reading
   * the phar can easily check that they support all necessary features.
   * 
   * The following API versions exist so far:
   * 
   * * 0.5, 0.6, 0.7, 0.7.1: The first official API versions. At this point,
   *   the phar format was only used by the PHP_Archive library, and the
   *   API version numbers were identical to the PHP_Archive versions that
   *   supported them. Development of the native phar extension started around
   *   API version 0.7. These API versions could only be queried using the
   *   `PHP_Archive::APIversion()` method, but were not stored physically
   *   in archives. These API versions are not supported by this spec.
   * * 0.8.0: Used by PHP_Archive 0.8.0 (released 2006-07-18) and
   *   later development versions of the phar extension. This is the first
   *   version number to be physically stored in archives. This API version
   *   is not supported by this spec.
   * * 0.9.0: Used by later development/early beta versions of the
   *   phar extension. Also temporarily used by PHP_Archive 0.9.0
   *   (released 2006-12-15), but reverted back to API version 0.8.0 in
   *   PHP_Archive 0.9.1 (released 2007-01-05).
   * * 1.0.0: Supported since PHP_Archive 0.10.0 (released 2007-05-29)
   *   and phar extension 1.0.0 (released 2007-03-28). This is the first
   *   stable, forwards-compatible and documented version of the format.
   * * 1.1.0: Supported since PHP_Archive 0.12.0 (released 2015-07-06)
   *   and phar extension 1.1.0 (released 2007-04-12). Adds SHA-256 and
   *   SHA-512 signature types.
   * * 1.1.1: Supported since phar extension 2.0.0 (released 2009-07-29 and
   *   included with PHP 5.3 and later). (PHP_Archive 0.12.0 also supports
   *   all features from API verison 1.1.1, but it reports API version 1.1.0.)
   *   Adds the OpenSSL signature type and support for storing
   *   empty directories.
   */

  var ApiVersion = PharWithoutStub.ApiVersion = (function() {
    function ApiVersion(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ApiVersion.prototype._read = function() {
      this.release = this._io.readBitsIntBe(4);
      this.major = this._io.readBitsIntBe(4);
      this.minor = this._io.readBitsIntBe(4);
      this.unused = this._io.readBitsIntBe(4);
    }

    return ApiVersion;
  })();

  var GlobalFlags = PharWithoutStub.GlobalFlags = (function() {
    function GlobalFlags(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    GlobalFlags.prototype._read = function() {
      this.value = this._io.readU4le();
    }

    /**
     * Whether any of the files in this phar are stored using
     * zlib compression.
     */
    Object.defineProperty(GlobalFlags.prototype, 'anyZlibCompressed', {
      get: function() {
        if (this._m_anyZlibCompressed !== undefined)
          return this._m_anyZlibCompressed;
        this._m_anyZlibCompressed = (this.value & 4096) != 0;
        return this._m_anyZlibCompressed;
      }
    });

    /**
     * Whether any of the files in this phar are stored using
     * bzip2 compression.
     */
    Object.defineProperty(GlobalFlags.prototype, 'anyBzip2Compressed', {
      get: function() {
        if (this._m_anyBzip2Compressed !== undefined)
          return this._m_anyBzip2Compressed;
        this._m_anyBzip2Compressed = (this.value & 8192) != 0;
        return this._m_anyBzip2Compressed;
      }
    });

    /**
     * Whether this phar contains a signature.
     */
    Object.defineProperty(GlobalFlags.prototype, 'hasSignature', {
      get: function() {
        if (this._m_hasSignature !== undefined)
          return this._m_hasSignature;
        this._m_hasSignature = (this.value & 65536) != 0;
        return this._m_hasSignature;
      }
    });

    /**
     * The unparsed flag bits.
     */

    return GlobalFlags;
  })();

  var Manifest = PharWithoutStub.Manifest = (function() {
    function Manifest(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Manifest.prototype._read = function() {
      this.lenManifest = this._io.readU4le();
      this.numFiles = this._io.readU4le();
      this.apiVersion = new ApiVersion(this._io, this, this._root);
      this.flags = new GlobalFlags(this._io, this, this._root);
      this.lenAlias = this._io.readU4le();
      this.alias = this._io.readBytes(this.lenAlias);
      this.lenMetadata = this._io.readU4le();
      if (this.lenMetadata != 0) {
        this._raw_metadata = this._io.readBytes(this.lenMetadata);
        var _io__raw_metadata = new KaitaiStream(this._raw_metadata);
        this.metadata = new SerializedValue(_io__raw_metadata, this, this._root);
      }
      this.fileEntries = new Array(this.numFiles);
      for (var i = 0; i < this.numFiles; i++) {
        this.fileEntries[i] = new FileEntry(this._io, this, this._root);
      }
    }

    /**
     * The length of the manifest, in bytes.
     * 
     * Note: The phar extension does not allow reading manifests
     * larger than 100 MiB.
     */

    /**
     * The number of files in this phar.
     */

    /**
     * The API version used by this phar manifest.
     */

    /**
     * Global flags for this phar.
     */

    /**
     * The length of the alias, in bytes.
     */

    /**
     * The phar's alias, i. e. the name under which it is loaded into PHP.
     */

    /**
     * The size of the metadata, in bytes, or 0 if there is none.
     */

    /**
     * Metadata for this phar, in the format used by PHP's
     * `serialize` function. The meaning of the serialized data is not
     * specified further, it may be used to store arbitrary custom data
     * about the archive.
     */

    /**
     * Manifest entries for the files contained in this phar.
     */

    return Manifest;
  })();

  var FileEntry = PharWithoutStub.FileEntry = (function() {
    function FileEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FileEntry.prototype._read = function() {
      this.lenFilename = this._io.readU4le();
      this.filename = this._io.readBytes(this.lenFilename);
      this.lenDataUncompressed = this._io.readU4le();
      this.timestamp = this._io.readU4le();
      this.lenDataCompressed = this._io.readU4le();
      this.crc32 = this._io.readU4le();
      this.flags = new FileFlags(this._io, this, this._root);
      this.lenMetadata = this._io.readU4le();
      if (this.lenMetadata != 0) {
        this._raw_metadata = this._io.readBytes(this.lenMetadata);
        var _io__raw_metadata = new KaitaiStream(this._raw_metadata);
        this.metadata = new SerializedValue(_io__raw_metadata, this, this._root);
      }
    }

    /**
     * The length of the file name, in bytes.
     */

    /**
     * The name of this file. If the name ends with a slash, this entry
     * represents a directory, otherwise a regular file. Directory entries
     * are supported since phar API version 1.1.1.
     * (Explicit directory entries are only needed for empty directories.
     * Non-empty directories are implied by the files located inside them.)
     */

    /**
     * The length of the file's data when uncompressed, in bytes.
     */

    /**
     * The time at which the file was added or last updated, as a
     * Unix timestamp.
     */

    /**
     * The length of the file's data when compressed, in bytes.
     */

    /**
     * The CRC32 checksum of the file's uncompressed data.
     */

    /**
     * Flags for this file.
     */

    /**
     * The length of the metadata, in bytes, or 0 if there is none.
     */

    /**
     * Metadata for this file, in the format used by PHP's
     * `serialize` function. The meaning of the serialized data is not
     * specified further, it may be used to store arbitrary custom data
     * about the file.
     */

    return FileEntry;
  })();

  /**
   * The archive's manifest, containing general metadata about the archive
   * and its files.
   */

  /**
   * The contents of each file in the archive (possibly compressed,
   * as indicated by the file's flags in the manifest). The files are stored
   * in the same order as they appear in the manifest.
   */

  /**
   * The archive's signature - a digest of all archive data before
   * the signature itself.
   * 
   * Note: Almost all of the available "signature" types are actually hashes,
   * not signatures, and cannot be used to verify that the archive has not
   * been tampered with. Only the OpenSSL signature type is a true
   * cryptographic signature.
   */

  return PharWithoutStub;
})();
return PharWithoutStub;
}));
