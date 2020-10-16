// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Regf = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * This spec allows to parse files used by Microsoft Windows family of
 * operating systems to store parts of its "registry". "Registry" is a
 * hierarchical database that is used to store system settings (global
 * configuration, per-user, per-application configuration, etc).
 * 
 * Typically, registry files are stored in:
 * 
 * * System-wide: several files in `%SystemRoot%\System32\Config\`
 * * User-wide:
 *   * `%USERPROFILE%\Ntuser.dat`
 *   * `%USERPROFILE%\Local Settings\Application Data\Microsoft\Windows\Usrclass.dat` (localized, Windows 2000, Server 2003 and Windows XP)
 *   * `%USERPROFILE%\AppData\Local\Microsoft\Windows\Usrclass.dat` (non-localized, Windows Vista and later)
 * 
 * Note that one typically can't access files directly on a mounted
 * filesystem with a running Windows OS.
 * @see {@link https://github.com/libyal/libregf/blob/master/documentation/Windows%20NT%20Registry%20File%20(REGF)%20format.asciidoc|Source}
 */

var Regf = (function() {
  function Regf(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Regf.prototype._read = function() {
    this.header = new FileHeader(this._io, this, this._root);
    this._raw_hiveBins = [];
    this.hiveBins = [];
    var i = 0;
    while (!this._io.isEof()) {
      this._raw_hiveBins.push(this._io.readBytes(4096));
      var _io__raw_hiveBins = new KaitaiStream(this._raw_hiveBins[this._raw_hiveBins.length - 1]);
      this.hiveBins.push(new HiveBin(_io__raw_hiveBins, this, this._root));
      i++;
    }
  }

  var Filetime = Regf.Filetime = (function() {
    function Filetime(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Filetime.prototype._read = function() {
      this.value = this._io.readU8le();
    }

    return Filetime;
  })();

  var HiveBin = Regf.HiveBin = (function() {
    function HiveBin(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    HiveBin.prototype._read = function() {
      this.header = new HiveBinHeader(this._io, this, this._root);
      this.cells = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.cells.push(new HiveBinCell(this._io, this, this._root));
        i++;
      }
    }

    return HiveBin;
  })();

  var HiveBinHeader = Regf.HiveBinHeader = (function() {
    function HiveBinHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    HiveBinHeader.prototype._read = function() {
      this.signature = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.signature, [104, 98, 105, 110]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([104, 98, 105, 110], this.signature, this._io, "/types/hive_bin_header/seq/0");
      }
      this.offset = this._io.readU4le();
      this.size = this._io.readU4le();
      this.unknown1 = this._io.readU4le();
      this.unknown2 = this._io.readU4le();
      this.timestamp = new Filetime(this._io, this, this._root);
      this.unknown4 = this._io.readU4le();
    }

    /**
     * The offset of the hive bin, Value in bytes and relative from
     * the start of the hive bin data
     */

    /**
     * Size of the hive bin
     */

    /**
     * 0 most of the time, can contain remnant data
     */

    /**
     * 0 most of the time, can contain remnant data
     */

    /**
     * Only the root (first) hive bin seems to contain a valid FILETIME
     */

    /**
     * Contains number of bytes
     */

    return HiveBinHeader;
  })();

  var HiveBinCell = Regf.HiveBinCell = (function() {
    function HiveBinCell(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    HiveBinCell.prototype._read = function() {
      this.cellSizeRaw = this._io.readS4le();
      this.identifier = KaitaiStream.bytesToStr(this._io.readBytes(2), "ascii");
      switch (this.identifier) {
      case "li":
        this._raw_data = this._io.readBytes(((this.cellSize - 2) - 4));
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new SubKeyListLi(_io__raw_data, this, this._root);
        break;
      case "vk":
        this._raw_data = this._io.readBytes(((this.cellSize - 2) - 4));
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new SubKeyListVk(_io__raw_data, this, this._root);
        break;
      case "lf":
        this._raw_data = this._io.readBytes(((this.cellSize - 2) - 4));
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new SubKeyListLhLf(_io__raw_data, this, this._root);
        break;
      case "ri":
        this._raw_data = this._io.readBytes(((this.cellSize - 2) - 4));
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new SubKeyListRi(_io__raw_data, this, this._root);
        break;
      case "lh":
        this._raw_data = this._io.readBytes(((this.cellSize - 2) - 4));
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new SubKeyListLhLf(_io__raw_data, this, this._root);
        break;
      case "nk":
        this._raw_data = this._io.readBytes(((this.cellSize - 2) - 4));
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new NamedKey(_io__raw_data, this, this._root);
        break;
      case "sk":
        this._raw_data = this._io.readBytes(((this.cellSize - 2) - 4));
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new SubKeyListSk(_io__raw_data, this, this._root);
        break;
      default:
        this.data = this._io.readBytes(((this.cellSize - 2) - 4));
        break;
      }
    }

    var SubKeyListVk = HiveBinCell.SubKeyListVk = (function() {
      SubKeyListVk.DataTypeEnum = Object.freeze({
        REG_NONE: 0,
        REG_SZ: 1,
        REG_EXPAND_SZ: 2,
        REG_BINARY: 3,
        REG_DWORD: 4,
        REG_DWORD_BIG_ENDIAN: 5,
        REG_LINK: 6,
        REG_MULTI_SZ: 7,
        REG_RESOURCE_LIST: 8,
        REG_FULL_RESOURCE_DESCRIPTOR: 9,
        REG_RESOURCE_REQUIREMENTS_LIST: 10,
        REG_QWORD: 11,

        0: "REG_NONE",
        1: "REG_SZ",
        2: "REG_EXPAND_SZ",
        3: "REG_BINARY",
        4: "REG_DWORD",
        5: "REG_DWORD_BIG_ENDIAN",
        6: "REG_LINK",
        7: "REG_MULTI_SZ",
        8: "REG_RESOURCE_LIST",
        9: "REG_FULL_RESOURCE_DESCRIPTOR",
        10: "REG_RESOURCE_REQUIREMENTS_LIST",
        11: "REG_QWORD",
      });

      SubKeyListVk.VkFlags = Object.freeze({
        VALUE_COMP_NAME: 1,

        1: "VALUE_COMP_NAME",
      });

      function SubKeyListVk(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SubKeyListVk.prototype._read = function() {
        this.valueNameSize = this._io.readU2le();
        this.dataSize = this._io.readU4le();
        this.dataOffset = this._io.readU4le();
        this.dataType = this._io.readU4le();
        this.flags = this._io.readU2le();
        this.padding = this._io.readU2le();
        if (this.flags == Regf.HiveBinCell.SubKeyListVk.VkFlags.VALUE_COMP_NAME) {
          this.valueName = KaitaiStream.bytesToStr(this._io.readBytes(this.valueNameSize), "ascii");
        }
      }

      return SubKeyListVk;
    })();

    var SubKeyListLhLf = HiveBinCell.SubKeyListLhLf = (function() {
      function SubKeyListLhLf(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SubKeyListLhLf.prototype._read = function() {
        this.count = this._io.readU2le();
        this.items = new Array(this.count);
        for (var i = 0; i < this.count; i++) {
          this.items[i] = new Item(this._io, this, this._root);
        }
      }

      var Item = SubKeyListLhLf.Item = (function() {
        function Item(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        Item.prototype._read = function() {
          this.namedKeyOffset = this._io.readU4le();
          this.hashValue = this._io.readU4le();
        }

        return Item;
      })();

      return SubKeyListLhLf;
    })();

    var SubKeyListSk = HiveBinCell.SubKeyListSk = (function() {
      function SubKeyListSk(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SubKeyListSk.prototype._read = function() {
        this.unknown1 = this._io.readU2le();
        this.previousSecurityKeyOffset = this._io.readU4le();
        this.nextSecurityKeyOffset = this._io.readU4le();
        this.referenceCount = this._io.readU4le();
      }

      return SubKeyListSk;
    })();

    var SubKeyListLi = HiveBinCell.SubKeyListLi = (function() {
      function SubKeyListLi(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SubKeyListLi.prototype._read = function() {
        this.count = this._io.readU2le();
        this.items = new Array(this.count);
        for (var i = 0; i < this.count; i++) {
          this.items[i] = new Item(this._io, this, this._root);
        }
      }

      var Item = SubKeyListLi.Item = (function() {
        function Item(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        Item.prototype._read = function() {
          this.namedKeyOffset = this._io.readU4le();
        }

        return Item;
      })();

      return SubKeyListLi;
    })();

    var NamedKey = HiveBinCell.NamedKey = (function() {
      NamedKey.NkFlags = Object.freeze({
        KEY_IS_VOLATILE: 1,
        KEY_HIVE_EXIT: 2,
        KEY_HIVE_ENTRY: 4,
        KEY_NO_DELETE: 8,
        KEY_SYM_LINK: 16,
        KEY_COMP_NAME: 32,
        KEY_PREFEF_HANDLE: 64,
        KEY_VIRT_MIRRORED: 128,
        KEY_VIRT_TARGET: 256,
        KEY_VIRTUAL_STORE: 512,
        UNKNOWN1: 4096,
        UNKNOWN2: 16384,

        1: "KEY_IS_VOLATILE",
        2: "KEY_HIVE_EXIT",
        4: "KEY_HIVE_ENTRY",
        8: "KEY_NO_DELETE",
        16: "KEY_SYM_LINK",
        32: "KEY_COMP_NAME",
        64: "KEY_PREFEF_HANDLE",
        128: "KEY_VIRT_MIRRORED",
        256: "KEY_VIRT_TARGET",
        512: "KEY_VIRTUAL_STORE",
        4096: "UNKNOWN1",
        16384: "UNKNOWN2",
      });

      function NamedKey(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      NamedKey.prototype._read = function() {
        this.flags = this._io.readU2le();
        this.lastKeyWrittenDateAndTime = new Filetime(this._io, this, this._root);
        this.unknown1 = this._io.readU4le();
        this.parentKeyOffset = this._io.readU4le();
        this.numberOfSubKeys = this._io.readU4le();
        this.numberOfVolatileSubKeys = this._io.readU4le();
        this.subKeysListOffset = this._io.readU4le();
        this.numberOfValues = this._io.readU4le();
        this.valuesListOffset = this._io.readU4le();
        this.securityKeyOffset = this._io.readU4le();
        this.classNameOffset = this._io.readU4le();
        this.largestSubKeyNameSize = this._io.readU4le();
        this.largestSubKeyClassNameSize = this._io.readU4le();
        this.largestValueNameSize = this._io.readU4le();
        this.largestValueDataSize = this._io.readU4le();
        this.unknown2 = this._io.readU4le();
        this.keyNameSize = this._io.readU2le();
        this.classNameSize = this._io.readU2le();
        this.unknownStringSize = this._io.readU4le();
        this.unknownString = KaitaiStream.bytesToStr(this._io.readBytes(this.unknownStringSize), "ascii");
      }

      return NamedKey;
    })();

    var SubKeyListRi = HiveBinCell.SubKeyListRi = (function() {
      function SubKeyListRi(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SubKeyListRi.prototype._read = function() {
        this.count = this._io.readU2le();
        this.items = new Array(this.count);
        for (var i = 0; i < this.count; i++) {
          this.items[i] = new Item(this._io, this, this._root);
        }
      }

      var Item = SubKeyListRi.Item = (function() {
        function Item(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        Item.prototype._read = function() {
          this.subKeyListOffset = this._io.readU4le();
        }

        return Item;
      })();

      return SubKeyListRi;
    })();
    Object.defineProperty(HiveBinCell.prototype, 'cellSize', {
      get: function() {
        if (this._m_cellSize !== undefined)
          return this._m_cellSize;
        this._m_cellSize = ((this.cellSizeRaw < 0 ? -1 : 1) * this.cellSizeRaw);
        return this._m_cellSize;
      }
    });
    Object.defineProperty(HiveBinCell.prototype, 'isAllocated', {
      get: function() {
        if (this._m_isAllocated !== undefined)
          return this._m_isAllocated;
        this._m_isAllocated = this.cellSizeRaw < 0;
        return this._m_isAllocated;
      }
    });

    return HiveBinCell;
  })();

  var FileHeader = Regf.FileHeader = (function() {
    FileHeader.FileType = Object.freeze({
      NORMAL: 0,
      TRANSACTION_LOG: 1,

      0: "NORMAL",
      1: "TRANSACTION_LOG",
    });

    FileHeader.FileFormat = Object.freeze({
      DIRECT_MEMORY_LOAD: 1,

      1: "DIRECT_MEMORY_LOAD",
    });

    function FileHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FileHeader.prototype._read = function() {
      this.signature = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.signature, [114, 101, 103, 102]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([114, 101, 103, 102], this.signature, this._io, "/types/file_header/seq/0");
      }
      this.primarySequenceNumber = this._io.readU4le();
      this.secondarySequenceNumber = this._io.readU4le();
      this.lastModificationDateAndTime = new Filetime(this._io, this, this._root);
      this.majorVersion = this._io.readU4le();
      this.minorVersion = this._io.readU4le();
      this.type = this._io.readU4le();
      this.format = this._io.readU4le();
      this.rootKeyOffset = this._io.readU4le();
      this.hiveBinsDataSize = this._io.readU4le();
      this.clusteringFactor = this._io.readU4le();
      this.unknown1 = this._io.readBytes(64);
      this.unknown2 = this._io.readBytes(396);
      this.checksum = this._io.readU4le();
      this.reserved = this._io.readBytes(3576);
      this.bootType = this._io.readU4le();
      this.bootRecover = this._io.readU4le();
    }

    return FileHeader;
  })();

  return Regf;
})();
return Regf;
}));
