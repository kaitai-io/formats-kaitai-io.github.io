// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Vfat = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
var Vfat = (function() {
  function Vfat(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Vfat.prototype._read = function() {
    this.bootSector = new BootSector(this._io, this, this._root);
  }

  /**
   * Extended BIOS Parameter Block for FAT32
   */

  var ExtBiosParamBlockFat32 = Vfat.ExtBiosParamBlockFat32 = (function() {
    function ExtBiosParamBlockFat32(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ExtBiosParamBlockFat32.prototype._read = function() {
      this.lsPerFat = this._io.readU4le();
      this.hasActiveFat = this._io.readBitsInt(1) != 0;
      this.reserved1 = this._io.readBitsInt(3);
      this.activeFatId = this._io.readBitsInt(4);
      this._io.alignToByte();
      this.reserved2 = this._io.ensureFixedContents([0]);
      this.fatVersion = this._io.readU2le();
      this.rootDirStartClus = this._io.readU4le();
      this.lsFsInfo = this._io.readU2le();
      this.bootSectorsCopyStartLs = this._io.readU2le();
      this.reserved3 = this._io.readBytes(12);
      this.physDriveNum = this._io.readU1();
      this.reserved4 = this._io.readU1();
      this.extBootSign = this._io.readU1();
      this.volumeId = this._io.readBytes(4);
      this.partitionVolumeLabel = KaitaiStream.bytesToStr(KaitaiStream.bytesStripRight(this._io.readBytes(11), 32), "ASCII");
      this.fsTypeStr = KaitaiStream.bytesToStr(KaitaiStream.bytesStripRight(this._io.readBytes(8), 32), "ASCII");
    }

    /**
     * Logical sectors per file allocation table (corresponds with
     * the old entry `ls_per_fat` in the DOS 2.0 BPB).
     */

    /**
     * If true, then there is "active" FAT, which is designated in
     * `active_fat` attribute. If false, all FATs are mirrored as
     * usual.
     */

    /**
     * Zero-based number of active FAT, if `has_active_fat`
     * attribute is true.
     */

    /**
     * Cluster number of root directory start, typically 2 if it
     * contains no bad sector. (Microsoft's FAT32 implementation
     * imposes an artificial limit of 65,535 entries per directory,
     * whilst many third-party implementations do not.)
     */

    /**
     * Logical sector number of FS Information Sector, typically 1,
     * i.e., the second of the three FAT32 boot sectors. Values
     * like 0 and 0xFFFF are used by some FAT32 implementations to
     * designate abscence of FS Information Sector.
     */

    /**
     * First logical sector number of a copy of the three FAT32
     * boot sectors, typically 6.
     */

    /**
     * Physical drive number (0x00 for (first) removable media,
     * 0x80 for (first) fixed disk as per INT 13h).
     */

    /**
     * Should be 0x29 to indicate that an EBPB with the following 3
     * entries exists.
     */

    /**
     * Volume ID (serial number).
     * 
     * Typically the serial number "xxxx-xxxx" is created by a
     * 16-bit addition of both DX values returned by INT 21h/AH=2Ah
     * (get system date) and INT 21h/AH=2Ch (get system time) for
     * the high word and another 16-bit addition of both CX values
     * for the low word of the serial number. Alternatively, some
     * DR-DOS disk utilities provide a /# option to generate a
     * human-readable time stamp "mmdd-hhmm" build from BCD-encoded
     * 8-bit values for the month, day, hour and minute instead of
     * a serial number.
     */

    return ExtBiosParamBlockFat32;
  })();

  var BootSector = Vfat.BootSector = (function() {
    function BootSector(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BootSector.prototype._read = function() {
      this.jmpInstruction = this._io.readBytes(3);
      this.oemName = KaitaiStream.bytesToStr(KaitaiStream.bytesStripRight(this._io.readBytes(8), 32), "ASCII");
      this.bpb = new BiosParamBlock(this._io, this, this._root);
      if (!(this.isFat32)) {
        this.ebpbFat16 = new ExtBiosParamBlockFat16(this._io, this, this._root);
      }
      if (this.isFat32) {
        this.ebpbFat32 = new ExtBiosParamBlockFat32(this._io, this, this._root);
      }
    }

    /**
     * Offset of FATs in bytes from start of filesystem
     */
    Object.defineProperty(BootSector.prototype, 'posFats', {
      get: function() {
        if (this._m_posFats !== undefined)
          return this._m_posFats;
        this._m_posFats = (this.bpb.bytesPerLs * this.bpb.numReservedLs);
        return this._m_posFats;
      }
    });
    Object.defineProperty(BootSector.prototype, 'lsPerFat', {
      get: function() {
        if (this._m_lsPerFat !== undefined)
          return this._m_lsPerFat;
        this._m_lsPerFat = (this.isFat32 ? this.ebpbFat32.lsPerFat : this.bpb.lsPerFat);
        return this._m_lsPerFat;
      }
    });

    /**
     * Size of root directory in logical sectors
     * @see FAT: General Overview of On-Disk Format, section "FAT Data Structure"
     */
    Object.defineProperty(BootSector.prototype, 'lsPerRootDir', {
      get: function() {
        if (this._m_lsPerRootDir !== undefined)
          return this._m_lsPerRootDir;
        this._m_lsPerRootDir = Math.floor((((this.bpb.maxRootDirRec * 32) + this.bpb.bytesPerLs) - 1) / this.bpb.bytesPerLs);
        return this._m_lsPerRootDir;
      }
    });

    /**
     * Determines if filesystem is FAT32 (true) or FAT12/16 (false)
     * by analyzing some preliminary conditions in BPB. Used to
     * determine whether we should parse post-BPB data as
     * `ext_bios_param_block_fat16` or `ext_bios_param_block_fat32`.
     */
    Object.defineProperty(BootSector.prototype, 'isFat32', {
      get: function() {
        if (this._m_isFat32 !== undefined)
          return this._m_isFat32;
        this._m_isFat32 = this.bpb.maxRootDirRec == 0;
        return this._m_isFat32;
      }
    });

    /**
     * Size of one FAT in bytes
     */
    Object.defineProperty(BootSector.prototype, 'sizeFat', {
      get: function() {
        if (this._m_sizeFat !== undefined)
          return this._m_sizeFat;
        this._m_sizeFat = (this.bpb.bytesPerLs * this.lsPerFat);
        return this._m_sizeFat;
      }
    });

    /**
     * Offset of root directory in bytes from start of filesystem
     */
    Object.defineProperty(BootSector.prototype, 'posRootDir', {
      get: function() {
        if (this._m_posRootDir !== undefined)
          return this._m_posRootDir;
        this._m_posRootDir = (this.bpb.bytesPerLs * (this.bpb.numReservedLs + (this.lsPerFat * this.bpb.numFats)));
        return this._m_posRootDir;
      }
    });

    /**
     * Size of root directory in bytes
     */
    Object.defineProperty(BootSector.prototype, 'sizeRootDir', {
      get: function() {
        if (this._m_sizeRootDir !== undefined)
          return this._m_sizeRootDir;
        this._m_sizeRootDir = (this.lsPerRootDir * this.bpb.bytesPerLs);
        return this._m_sizeRootDir;
      }
    });

    /**
     * Basic BIOS parameter block, present in all versions of FAT
     */

    /**
     * FAT12/16-specific extended BIOS parameter block
     */

    /**
     * FAT32-specific extended BIOS parameter block
     */

    return BootSector;
  })();

  var BiosParamBlock = Vfat.BiosParamBlock = (function() {
    function BiosParamBlock(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BiosParamBlock.prototype._read = function() {
      this.bytesPerLs = this._io.readU2le();
      this.lsPerClus = this._io.readU1();
      this.numReservedLs = this._io.readU2le();
      this.numFats = this._io.readU1();
      this.maxRootDirRec = this._io.readU2le();
      this.totalLs2 = this._io.readU2le();
      this.mediaCode = this._io.readU1();
      this.lsPerFat = this._io.readU2le();
      this.psPerTrack = this._io.readU2le();
      this.numHeads = this._io.readU2le();
      this.numHiddenSectors = this._io.readU4le();
      this.totalLs4 = this._io.readU4le();
    }

    /**
     * Bytes per logical sector
     */

    /**
     * Logical sectors per cluster
     */

    /**
     * Count of reserved logical sectors. The number of logical
     * sectors before the first FAT in the file system image.
     */

    /**
     * Number of File Allocation Tables
     */

    /**
     * Maximum number of FAT12 or FAT16 root directory entries. 0
     * for FAT32, where the root directory is stored in ordinary
     * data clusters.
     */

    /**
     * Total logical sectors (if zero, use total_ls_4)
     */

    /**
     * Media descriptor
     */

    /**
     * Logical sectors per File Allocation Table for
     * FAT12/FAT16. FAT32 sets this to 0 and uses the 32-bit value
     * at offset 0x024 instead.
     */

    /**
     * Physical sectors per track for disks with INT 13h CHS
     * geometry, e.g., 15 for a ???1.20 MB??? (1200 KB) floppy. A zero
     * entry indicates that this entry is reserved, but not used.
     */

    /**
     * Number of heads for disks with INT 13h CHS geometry,[9]
     * e.g., 2 for a double sided floppy.
     */

    /**
     * Number of hidden sectors preceding the partition that
     * contains this FAT volume. This field should always be zero
     * on media that are not partitioned. This DOS 3.0 entry is
     * incompatible with a similar entry at offset 0x01C in BPBs
     * since DOS 3.31.  It must not be used if the logical sectors
     * entry at offset 0x013 is zero.
     */

    /**
     * Total logical sectors including hidden sectors. This DOS 3.2
     * entry is incompatible with a similar entry at offset 0x020
     * in BPBs since DOS 3.31. It must not be used if the logical
     * sectors entry at offset 0x013 is zero.
     */

    return BiosParamBlock;
  })();

  var RootDirectoryRec = Vfat.RootDirectoryRec = (function() {
    function RootDirectoryRec(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RootDirectoryRec.prototype._read = function() {
      this.fileName = this._io.readBytes(11);
      this.attribute = this._io.readU1();
      this.reserved = this._io.readBytes(10);
      this.time = this._io.readU2le();
      this.date = this._io.readU2le();
      this.startClus = this._io.readU2le();
      this.fileSize = this._io.readU4le();
    }

    return RootDirectoryRec;
  })();

  var RootDirectory = Vfat.RootDirectory = (function() {
    function RootDirectory(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RootDirectory.prototype._read = function() {
      this.records = new Array(this._root.bootSector.bpb.maxRootDirRec);
      for (var i = 0; i < this._root.bootSector.bpb.maxRootDirRec; i++) {
        this.records[i] = new RootDirectoryRec(this._io, this, this._root);
      }
    }

    return RootDirectory;
  })();

  /**
   * Extended BIOS Parameter Block (DOS 4.0+, OS/2 1.0+). Used only
   * for FAT12 and FAT16.
   */

  var ExtBiosParamBlockFat16 = Vfat.ExtBiosParamBlockFat16 = (function() {
    function ExtBiosParamBlockFat16(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ExtBiosParamBlockFat16.prototype._read = function() {
      this.physDriveNum = this._io.readU1();
      this.reserved1 = this._io.readU1();
      this.extBootSign = this._io.readU1();
      this.volumeId = this._io.readBytes(4);
      this.partitionVolumeLabel = KaitaiStream.bytesToStr(KaitaiStream.bytesStripRight(this._io.readBytes(11), 32), "ASCII");
      this.fsTypeStr = KaitaiStream.bytesToStr(KaitaiStream.bytesStripRight(this._io.readBytes(8), 32), "ASCII");
    }

    /**
     * Physical drive number (0x00 for (first) removable media,
     * 0x80 for (first) fixed disk as per INT 13h).
     */

    /**
     * Should be 0x29 to indicate that an EBPB with the following 3
     * entries exists.
     */

    /**
     * Volume ID (serial number).
     * 
     * Typically the serial number "xxxx-xxxx" is created by a
     * 16-bit addition of both DX values returned by INT 21h/AH=2Ah
     * (get system date) and INT 21h/AH=2Ch (get system time) for
     * the high word and another 16-bit addition of both CX values
     * for the low word of the serial number. Alternatively, some
     * DR-DOS disk utilities provide a /# option to generate a
     * human-readable time stamp "mmdd-hhmm" build from BCD-encoded
     * 8-bit values for the month, day, hour and minute instead of
     * a serial number.
     */

    return ExtBiosParamBlockFat16;
  })();
  Object.defineProperty(Vfat.prototype, 'fats', {
    get: function() {
      if (this._m_fats !== undefined)
        return this._m_fats;
      var _pos = this._io.pos;
      this._io.seek(this.bootSector.posFats);
      this._m_fats = new Array(this.bootSector.bpb.numFats);
      for (var i = 0; i < this.bootSector.bpb.numFats; i++) {
        this._m_fats[i] = this._io.readBytes(this.bootSector.sizeFat);
      }
      this._io.seek(_pos);
      return this._m_fats;
    }
  });
  Object.defineProperty(Vfat.prototype, 'rootDir', {
    get: function() {
      if (this._m_rootDir !== undefined)
        return this._m_rootDir;
      var _pos = this._io.pos;
      this._io.seek(this.bootSector.posRootDir);
      this._raw__m_rootDir = this._io.readBytes(this.bootSector.sizeRootDir);
      var _io__raw__m_rootDir = new KaitaiStream(this._raw__m_rootDir);
      this._m_rootDir = new RootDirectory(_io__raw__m_rootDir, this, this._root);
      this._io.seek(_pos);
      return this._m_rootDir;
    }
  });

  return Vfat;
})();
return Vfat;
}));
