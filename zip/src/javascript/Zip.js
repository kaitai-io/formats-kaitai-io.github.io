// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Zip = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
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
    PPMD: 98,

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
    98: "PPMD",
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
    INFOZIP_UNIX: 30805,
    INFOZIP_UNIX_VAR_SIZE: 30837,

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
    30805: "INFOZIP_UNIX",
    30837: "INFOZIP_UNIX_VAR_SIZE",
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
     * @see {@link https://github.com/LuaDist/zip/blob/master/proginfo/extrafld.txt#L191|Source}
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
     * @see {@link https://github.com/LuaDist/zip/blob/master/proginfo/extrafld.txt#L817|Source}
     */

    var ExtendedTimestamp = ExtraField.ExtendedTimestamp = (function() {
      function ExtendedTimestamp(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      ExtendedTimestamp.prototype._read = function() {
        this.flags = this._io.readU1();
        this.modTime = this._io.readU4le();
        if (!(this._io.isEof())) {
          this.accessTime = this._io.readU4le();
        }
        if (!(this._io.isEof())) {
          this.createTime = this._io.readU4le();
        }
      }

      return ExtendedTimestamp;
    })();

    /**
     * @see {@link https://github.com/LuaDist/zip/blob/master/proginfo/extrafld.txt#L1339|Source}
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
      this.lastModFileTime = this._io.readU2le();
      this.lastModFileDate = this._io.readU2le();
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
      this.flags = this._io.readU2le();
      this.compressionMethod = this._io.readU2le();
      this.fileModTime = this._io.readU2le();
      this.fileModDate = this._io.readU2le();
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
