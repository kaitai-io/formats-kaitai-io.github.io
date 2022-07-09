// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './DosDatetime'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./DosDatetime'));
  } else {
    root.Zip = factory(root.KaitaiStream, root.DosDatetime);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream, DosDatetime) {
/**
 * ZIP is a popular archive file format, introduced in 1989 by Phil Katz
 * and originally implemented in PKZIP utility by PKWARE.
 * 
 * Thanks to solid support of it in most desktop environments and
 * operating systems, and algorithms / specs availability in public
 * domain, it quickly became tool of choice for implementing file
 * containers.
 * 
 * For example, Java .jar files, OpenDocument, Office Open XML, EPUB files
 * are actually ZIP archives.
 * @see {@link https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT|Source}
 * @see {@link https://users.cs.jmu.edu/buchhofp/forensics/formats/pkzip.html|Source}
 */

var Zip = (function() {
  Zip.Compression = Object.freeze({
    NONE: 0,
    SHRUNK: 1,
    REDUCED_1: 2,
    REDUCED_2: 3,
    REDUCED_3: 4,
    REDUCED_4: 5,
    IMPLODED: 6,
    DEFLATED: 8,
    ENHANCED_DEFLATED: 9,
    PKWARE_DCL_IMPLODED: 10,
    BZIP2: 12,
    LZMA: 14,
    IBM_TERSE: 18,
    IBM_LZ77_Z: 19,
    ZSTANDARD: 93,
    MP3: 94,
    XZ: 95,
    JPEG: 96,
    WAVPACK: 97,
    PPMD: 98,
    AEX_ENCRYPTION_MARKER: 99,

    0: "NONE",
    1: "SHRUNK",
    2: "REDUCED_1",
    3: "REDUCED_2",
    4: "REDUCED_3",
    5: "REDUCED_4",
    6: "IMPLODED",
    8: "DEFLATED",
    9: "ENHANCED_DEFLATED",
    10: "PKWARE_DCL_IMPLODED",
    12: "BZIP2",
    14: "LZMA",
    18: "IBM_TERSE",
    19: "IBM_LZ77_Z",
    93: "ZSTANDARD",
    94: "MP3",
    95: "XZ",
    96: "JPEG",
    97: "WAVPACK",
    98: "PPMD",
    99: "AEX_ENCRYPTION_MARKER",
  });

  Zip.ExtraCodes = Object.freeze({
    ZIP64: 1,
    AV_INFO: 7,
    OS2: 9,
    NTFS: 10,
    OPENVMS: 12,
    PKWARE_UNIX: 13,
    FILE_STREAM_AND_FORK_DESCRIPTORS: 14,
    PATCH_DESCRIPTOR: 15,
    PKCS7: 20,
    X509_CERT_ID_AND_SIGNATURE_FOR_FILE: 21,
    X509_CERT_ID_FOR_CENTRAL_DIR: 22,
    STRONG_ENCRYPTION_HEADER: 23,
    RECORD_MANAGEMENT_CONTROLS: 24,
    PKCS7_ENC_RECIP_CERT_LIST: 25,
    IBM_S390_UNCOMP: 101,
    IBM_S390_COMP: 102,
    POSZIP_4690: 18064,
    EXTENDED_TIMESTAMP: 21589,
    BEOS: 25922,
    ASI_UNIX: 30062,
    INFOZIP_UNIX: 30805,
    INFOZIP_UNIX_VAR_SIZE: 30837,
    AEX_ENCRYPTION: 39169,
    APACHE_COMMONS_COMPRESS: 41246,
    MICROSOFT_OPEN_PACKAGING_GROWTH_HINT: 41504,
    SMS_QDOS: 64842,

    1: "ZIP64",
    7: "AV_INFO",
    9: "OS2",
    10: "NTFS",
    12: "OPENVMS",
    13: "PKWARE_UNIX",
    14: "FILE_STREAM_AND_FORK_DESCRIPTORS",
    15: "PATCH_DESCRIPTOR",
    20: "PKCS7",
    21: "X509_CERT_ID_AND_SIGNATURE_FOR_FILE",
    22: "X509_CERT_ID_FOR_CENTRAL_DIR",
    23: "STRONG_ENCRYPTION_HEADER",
    24: "RECORD_MANAGEMENT_CONTROLS",
    25: "PKCS7_ENC_RECIP_CERT_LIST",
    101: "IBM_S390_UNCOMP",
    102: "IBM_S390_COMP",
    18064: "POSZIP_4690",
    21589: "EXTENDED_TIMESTAMP",
    25922: "BEOS",
    30062: "ASI_UNIX",
    30805: "INFOZIP_UNIX",
    30837: "INFOZIP_UNIX_VAR_SIZE",
    39169: "AEX_ENCRYPTION",
    41246: "APACHE_COMMONS_COMPRESS",
    41504: "MICROSOFT_OPEN_PACKAGING_GROWTH_HINT",
    64842: "SMS_QDOS",
  });

  function Zip(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Zip.prototype._read = function() {
    this.sections = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.sections.push(new PkSection(this._io, this, this._root));
      i++;
    }
  }

  var LocalFile = Zip.LocalFile = (function() {
    function LocalFile(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    LocalFile.prototype._read = function() {
      this.header = new LocalFileHeader(this._io, this, this._root);
      this.body = this._io.readBytes(this.header.lenBodyCompressed);
    }

    return LocalFile;
  })();

  var DataDescriptor = Zip.DataDescriptor = (function() {
    function DataDescriptor(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DataDescriptor.prototype._read = function() {
      this.crc32 = this._io.readU4le();
      this.lenBodyCompressed = this._io.readU4le();
      this.lenBodyUncompressed = this._io.readU4le();
    }

    return DataDescriptor;
  })();

  var ExtraField = Zip.ExtraField = (function() {
    function ExtraField(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ExtraField.prototype._read = function() {
      this.code = this._io.readU2le();
      this.lenBody = this._io.readU2le();
      switch (this.code) {
      case Zip.ExtraCodes.NTFS:
        this._raw_body = this._io.readBytes(this.lenBody);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new Ntfs(_io__raw_body, this, this._root);
        break;
      case Zip.ExtraCodes.EXTENDED_TIMESTAMP:
        this._raw_body = this._io.readBytes(this.lenBody);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new ExtendedTimestamp(_io__raw_body, this, this._root);
        break;
      case Zip.ExtraCodes.INFOZIP_UNIX_VAR_SIZE:
        this._raw_body = this._io.readBytes(this.lenBody);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new InfozipUnixVarSize(_io__raw_body, this, this._root);
        break;
      default:
        this.body = this._io.readBytes(this.lenBody);
        break;
      }
    }

    /**
     * @see {@link https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L191|Source}
     */

    var Ntfs = ExtraField.Ntfs = (function() {
      function Ntfs(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Ntfs.prototype._read = function() {
        this.reserved = this._io.readU4le();
        this.attributes = [];
        var i = 0;
        while (!this._io.isEof()) {
          this.attributes.push(new Attribute(this._io, this, this._root));
          i++;
        }
      }

      var Attribute = Ntfs.Attribute = (function() {
        function Attribute(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        Attribute.prototype._read = function() {
          this.tag = this._io.readU2le();
          this.lenBody = this._io.readU2le();
          switch (this.tag) {
          case 1:
            this._raw_body = this._io.readBytes(this.lenBody);
            var _io__raw_body = new KaitaiStream(this._raw_body);
            this.body = new Attribute1(_io__raw_body, this, this._root);
            break;
          default:
            this.body = this._io.readBytes(this.lenBody);
            break;
          }
        }

        return Attribute;
      })();

      var Attribute1 = Ntfs.Attribute1 = (function() {
        function Attribute1(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        Attribute1.prototype._read = function() {
          this.lastModTime = this._io.readU8le();
          this.lastAccessTime = this._io.readU8le();
          this.creationTime = this._io.readU8le();
        }

        return Attribute1;
      })();

      return Ntfs;
    })();

    /**
     * @see {@link https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L817|Source}
     */

    var ExtendedTimestamp = ExtraField.ExtendedTimestamp = (function() {
      function ExtendedTimestamp(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      ExtendedTimestamp.prototype._read = function() {
        this._raw_flags = this._io.readBytes(1);
        var _io__raw_flags = new KaitaiStream(this._raw_flags);
        this.flags = new InfoFlags(_io__raw_flags, this, this._root);
        if (this.flags.hasModTime) {
          this.modTime = this._io.readU4le();
        }
        if (this.flags.hasAccessTime) {
          this.accessTime = this._io.readU4le();
        }
        if (this.flags.hasCreateTime) {
          this.createTime = this._io.readU4le();
        }
      }

      var InfoFlags = ExtendedTimestamp.InfoFlags = (function() {
        function InfoFlags(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        InfoFlags.prototype._read = function() {
          this.hasModTime = this._io.readBitsIntLe(1) != 0;
          this.hasAccessTime = this._io.readBitsIntLe(1) != 0;
          this.hasCreateTime = this._io.readBitsIntLe(1) != 0;
          this.reserved = this._io.readBitsIntLe(5);
        }

        return InfoFlags;
      })();

      /**
       * Unix timestamp
       */

      /**
       * Unix timestamp
       */

      /**
       * Unix timestamp
       */

      return ExtendedTimestamp;
    })();

    /**
     * @see {@link https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L1339|Source}
     */

    var InfozipUnixVarSize = ExtraField.InfozipUnixVarSize = (function() {
      function InfozipUnixVarSize(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      InfozipUnixVarSize.prototype._read = function() {
        this.version = this._io.readU1();
        this.lenUid = this._io.readU1();
        this.uid = this._io.readBytes(this.lenUid);
        this.lenGid = this._io.readU1();
        this.gid = this._io.readBytes(this.lenGid);
      }

      /**
       * Version of this extra field, currently 1
       */

      /**
       * Size of UID field
       */

      /**
       * UID (User ID) for a file
       */

      /**
       * Size of GID field
       */

      /**
       * GID (Group ID) for a file
       */

      return InfozipUnixVarSize;
    })();

    return ExtraField;
  })();

  /**
   * @see {@link https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT|- 4.3.12}
   */

  var CentralDirEntry = Zip.CentralDirEntry = (function() {
    function CentralDirEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CentralDirEntry.prototype._read = function() {
      this.versionMadeBy = this._io.readU2le();
      this.versionNeededToExtract = this._io.readU2le();
      this.flags = this._io.readU2le();
      this.compressionMethod = this._io.readU2le();
      this._raw_fileModTime = this._io.readBytes(4);
      var _io__raw_fileModTime = new KaitaiStream(this._raw_fileModTime);
      this.fileModTime = new DosDatetime(_io__raw_fileModTime, this, null);
      this.crc32 = this._io.readU4le();
      this.lenBodyCompressed = this._io.readU4le();
      this.lenBodyUncompressed = this._io.readU4le();
      this.lenFileName = this._io.readU2le();
      this.lenExtra = this._io.readU2le();
      this.lenComment = this._io.readU2le();
      this.diskNumberStart = this._io.readU2le();
      this.intFileAttr = this._io.readU2le();
      this.extFileAttr = this._io.readU4le();
      this.ofsLocalHeader = this._io.readS4le();
      this.fileName = KaitaiStream.bytesToStr(this._io.readBytes(this.lenFileName), "UTF-8");
      this._raw_extra = this._io.readBytes(this.lenExtra);
      var _io__raw_extra = new KaitaiStream(this._raw_extra);
      this.extra = new Extras(_io__raw_extra, this, this._root);
      this.comment = KaitaiStream.bytesToStr(this._io.readBytes(this.lenComment), "UTF-8");
    }
    Object.defineProperty(CentralDirEntry.prototype, 'localHeader', {
      get: function() {
        if (this._m_localHeader !== undefined)
          return this._m_localHeader;
        var _pos = this._io.pos;
        this._io.seek(this.ofsLocalHeader);
        this._m_localHeader = new PkSection(this._io, this, this._root);
        this._io.seek(_pos);
        return this._m_localHeader;
      }
    });

    return CentralDirEntry;
  })();

  var PkSection = Zip.PkSection = (function() {
    function PkSection(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PkSection.prototype._read = function() {
      this.magic = this._io.readBytes(2);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [80, 75]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([80, 75], this.magic, this._io, "/types/pk_section/seq/0");
      }
      this.sectionType = this._io.readU2le();
      switch (this.sectionType) {
      case 513:
        this.body = new CentralDirEntry(this._io, this, this._root);
        break;
      case 1027:
        this.body = new LocalFile(this._io, this, this._root);
        break;
      case 1541:
        this.body = new EndOfCentralDir(this._io, this, this._root);
        break;
      case 2055:
        this.body = new DataDescriptor(this._io, this, this._root);
        break;
      }
    }

    return PkSection;
  })();

  var Extras = Zip.Extras = (function() {
    function Extras(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Extras.prototype._read = function() {
      this.entries = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.entries.push(new ExtraField(this._io, this, this._root));
        i++;
      }
    }

    return Extras;
  })();

  var LocalFileHeader = Zip.LocalFileHeader = (function() {
    function LocalFileHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    LocalFileHeader.prototype._read = function() {
      this.version = this._io.readU2le();
      this._raw_flags = this._io.readBytes(2);
      var _io__raw_flags = new KaitaiStream(this._raw_flags);
      this.flags = new GpFlags(_io__raw_flags, this, this._root);
      this.compressionMethod = this._io.readU2le();
      this._raw_fileModTime = this._io.readBytes(4);
      var _io__raw_fileModTime = new KaitaiStream(this._raw_fileModTime);
      this.fileModTime = new DosDatetime(_io__raw_fileModTime, this, null);
      this.crc32 = this._io.readU4le();
      this.lenBodyCompressed = this._io.readU4le();
      this.lenBodyUncompressed = this._io.readU4le();
      this.lenFileName = this._io.readU2le();
      this.lenExtra = this._io.readU2le();
      this.fileName = KaitaiStream.bytesToStr(this._io.readBytes(this.lenFileName), "UTF-8");
      this._raw_extra = this._io.readBytes(this.lenExtra);
      var _io__raw_extra = new KaitaiStream(this._raw_extra);
      this.extra = new Extras(_io__raw_extra, this, this._root);
    }

    /**
     * @see {@link https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT|- 4.4.4}
     * @see {@link https://users.cs.jmu.edu/buchhofp/forensics/formats/pkzip.html|Local file headers}
     */

    var GpFlags = LocalFileHeader.GpFlags = (function() {
      GpFlags.DeflateMode = Object.freeze({
        NORMAL: 0,
        MAXIMUM: 1,
        FAST: 2,
        SUPER_FAST: 3,

        0: "NORMAL",
        1: "MAXIMUM",
        2: "FAST",
        3: "SUPER_FAST",
      });

      function GpFlags(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      GpFlags.prototype._read = function() {
        this.fileEncrypted = this._io.readBitsIntLe(1) != 0;
        this.compOptionsRaw = this._io.readBitsIntLe(2);
        this.hasDataDescriptor = this._io.readBitsIntLe(1) != 0;
        this.reserved1 = this._io.readBitsIntLe(1) != 0;
        this.compPatchedData = this._io.readBitsIntLe(1) != 0;
        this.strongEncrypt = this._io.readBitsIntLe(1) != 0;
        this.reserved2 = this._io.readBitsIntLe(4);
        this.langEncoding = this._io.readBitsIntLe(1) != 0;
        this.reserved3 = this._io.readBitsIntLe(1) != 0;
        this.maskHeaderValues = this._io.readBitsIntLe(1) != 0;
        this.reserved4 = this._io.readBitsIntLe(2);
      }
      Object.defineProperty(GpFlags.prototype, 'deflatedMode', {
        get: function() {
          if (this._m_deflatedMode !== undefined)
            return this._m_deflatedMode;
          if ( ((this._parent.compressionMethod == Zip.Compression.DEFLATED) || (this._parent.compressionMethod == Zip.Compression.ENHANCED_DEFLATED)) ) {
            this._m_deflatedMode = this.compOptionsRaw;
          }
          return this._m_deflatedMode;
        }
      });

      /**
       * 8KiB or 4KiB in bytes
       */
      Object.defineProperty(GpFlags.prototype, 'implodedDictByteSize', {
        get: function() {
          if (this._m_implodedDictByteSize !== undefined)
            return this._m_implodedDictByteSize;
          if (this._parent.compressionMethod == Zip.Compression.IMPLODED) {
            this._m_implodedDictByteSize = (((this.compOptionsRaw & 1) != 0 ? 8 : 4) * 1024);
          }
          return this._m_implodedDictByteSize;
        }
      });
      Object.defineProperty(GpFlags.prototype, 'implodedNumSfTrees', {
        get: function() {
          if (this._m_implodedNumSfTrees !== undefined)
            return this._m_implodedNumSfTrees;
          if (this._parent.compressionMethod == Zip.Compression.IMPLODED) {
            this._m_implodedNumSfTrees = ((this.compOptionsRaw & 2) != 0 ? 3 : 2);
          }
          return this._m_implodedNumSfTrees;
        }
      });
      Object.defineProperty(GpFlags.prototype, 'lzmaHasEosMarker', {
        get: function() {
          if (this._m_lzmaHasEosMarker !== undefined)
            return this._m_lzmaHasEosMarker;
          if (this._parent.compressionMethod == Zip.Compression.LZMA) {
            this._m_lzmaHasEosMarker = (this.compOptionsRaw & 1) != 0;
          }
          return this._m_lzmaHasEosMarker;
        }
      });

      /**
       * internal; access derived value instances instead
       */

      return GpFlags;
    })();

    return LocalFileHeader;
  })();

  var EndOfCentralDir = Zip.EndOfCentralDir = (function() {
    function EndOfCentralDir(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    EndOfCentralDir.prototype._read = function() {
      this.diskOfEndOfCentralDir = this._io.readU2le();
      this.diskOfCentralDir = this._io.readU2le();
      this.numCentralDirEntriesOnDisk = this._io.readU2le();
      this.numCentralDirEntriesTotal = this._io.readU2le();
      this.lenCentralDir = this._io.readU4le();
      this.ofsCentralDir = this._io.readU4le();
      this.lenComment = this._io.readU2le();
      this.comment = KaitaiStream.bytesToStr(this._io.readBytes(this.lenComment), "UTF-8");
    }

    return EndOfCentralDir;
  })();

  return Zip;
})();
return Zip;
}));
