<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class Vfat extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Vfat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_bootSector = new \Vfat\BootSector($this->_io, $this, $this->_root);
        }
        protected $_m_fats;
        public function fats() {
            if ($this->_m_fats !== null)
                return $this->_m_fats;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->bootSector()->posFats());
            $this->_m_fats = [];
            $n = $this->bootSector()->bpb()->numFats();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_fats[] = $this->_io->readBytes($this->bootSector()->sizeFat());
            }
            $this->_io->seek($_pos);
            return $this->_m_fats;
        }
        protected $_m_rootDir;
        public function rootDir() {
            if ($this->_m_rootDir !== null)
                return $this->_m_rootDir;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->bootSector()->posRootDir());
            $this->_m__raw_rootDir = $this->_io->readBytes($this->bootSector()->sizeRootDir());
            $_io__raw_rootDir = new \Kaitai\Struct\Stream($this->_m__raw_rootDir);
            $this->_m_rootDir = new \Vfat\RootDirectory($_io__raw_rootDir, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_rootDir;
        }
        protected $_m_bootSector;
        protected $_m__raw_rootDir;
        public function bootSector() { return $this->_m_bootSector; }
        public function _raw_rootDir() { return $this->_m__raw_rootDir; }
    }
}

/**
 * Extended BIOS Parameter Block for FAT32
 */

namespace Vfat {
    class ExtBiosParamBlockFat32 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Vfat\BootSector $_parent = null, \Vfat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lsPerFat = $this->_io->readU4le();
            $this->_m_hasActiveFat = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_reserved1 = $this->_io->readBitsIntBe(3);
            $this->_m_activeFatId = $this->_io->readBitsIntBe(4);
            $this->_io->alignToByte();
            $this->_m_reserved2 = $this->_io->readBytes(1);
            if (!($this->reserved2() == "\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00", $this->reserved2(), $this->_io(), "/types/ext_bios_param_block_fat32/seq/4");
            }
            $this->_m_fatVersion = $this->_io->readU2le();
            $this->_m_rootDirStartClus = $this->_io->readU4le();
            $this->_m_lsFsInfo = $this->_io->readU2le();
            $this->_m_bootSectorsCopyStartLs = $this->_io->readU2le();
            $this->_m_reserved3 = $this->_io->readBytes(12);
            $this->_m_physDriveNum = $this->_io->readU1();
            $this->_m_reserved4 = $this->_io->readU1();
            $this->_m_extBootSign = $this->_io->readU1();
            $this->_m_volumeId = $this->_io->readBytes(4);
            $this->_m_partitionVolumeLabel = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesStripRight($this->_io->readBytes(11), 32), "ASCII");
            $this->_m_fsTypeStr = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesStripRight($this->_io->readBytes(8), 32), "ASCII");
        }
        protected $_m_lsPerFat;
        protected $_m_hasActiveFat;
        protected $_m_reserved1;
        protected $_m_activeFatId;
        protected $_m_reserved2;
        protected $_m_fatVersion;
        protected $_m_rootDirStartClus;
        protected $_m_lsFsInfo;
        protected $_m_bootSectorsCopyStartLs;
        protected $_m_reserved3;
        protected $_m_physDriveNum;
        protected $_m_reserved4;
        protected $_m_extBootSign;
        protected $_m_volumeId;
        protected $_m_partitionVolumeLabel;
        protected $_m_fsTypeStr;

        /**
         * Logical sectors per file allocation table (corresponds with
         * the old entry `ls_per_fat` in the DOS 2.0 BPB).
         */
        public function lsPerFat() { return $this->_m_lsPerFat; }

        /**
         * If true, then there is "active" FAT, which is designated in
         * `active_fat` attribute. If false, all FATs are mirrored as
         * usual.
         */
        public function hasActiveFat() { return $this->_m_hasActiveFat; }
        public function reserved1() { return $this->_m_reserved1; }

        /**
         * Zero-based number of active FAT, if `has_active_fat`
         * attribute is true.
         */
        public function activeFatId() { return $this->_m_activeFatId; }
        public function reserved2() { return $this->_m_reserved2; }
        public function fatVersion() { return $this->_m_fatVersion; }

        /**
         * Cluster number of root directory start, typically 2 if it
         * contains no bad sector. (Microsoft's FAT32 implementation
         * imposes an artificial limit of 65,535 entries per directory,
         * whilst many third-party implementations do not.)
         */
        public function rootDirStartClus() { return $this->_m_rootDirStartClus; }

        /**
         * Logical sector number of FS Information Sector, typically 1,
         * i.e., the second of the three FAT32 boot sectors. Values
         * like 0 and 0xFFFF are used by some FAT32 implementations to
         * designate abscence of FS Information Sector.
         */
        public function lsFsInfo() { return $this->_m_lsFsInfo; }

        /**
         * First logical sector number of a copy of the three FAT32
         * boot sectors, typically 6.
         */
        public function bootSectorsCopyStartLs() { return $this->_m_bootSectorsCopyStartLs; }
        public function reserved3() { return $this->_m_reserved3; }

        /**
         * Physical drive number (0x00 for (first) removable media,
         * 0x80 for (first) fixed disk as per INT 13h).
         */
        public function physDriveNum() { return $this->_m_physDriveNum; }
        public function reserved4() { return $this->_m_reserved4; }

        /**
         * Should be 0x29 to indicate that an EBPB with the following 3
         * entries exists.
         */
        public function extBootSign() { return $this->_m_extBootSign; }

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
        public function volumeId() { return $this->_m_volumeId; }
        public function partitionVolumeLabel() { return $this->_m_partitionVolumeLabel; }
        public function fsTypeStr() { return $this->_m_fsTypeStr; }
    }
}

namespace Vfat {
    class BootSector extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Vfat $_parent = null, \Vfat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_jmpInstruction = $this->_io->readBytes(3);
            $this->_m_oemName = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesStripRight($this->_io->readBytes(8), 32), "ASCII");
            $this->_m_bpb = new \Vfat\BiosParamBlock($this->_io, $this, $this->_root);
            if (!($this->isFat32())) {
                $this->_m_ebpbFat16 = new \Vfat\ExtBiosParamBlockFat16($this->_io, $this, $this->_root);
            }
            if ($this->isFat32()) {
                $this->_m_ebpbFat32 = new \Vfat\ExtBiosParamBlockFat32($this->_io, $this, $this->_root);
            }
        }
        protected $_m_posFats;

        /**
         * Offset of FATs in bytes from start of filesystem
         */
        public function posFats() {
            if ($this->_m_posFats !== null)
                return $this->_m_posFats;
            $this->_m_posFats = ($this->bpb()->bytesPerLs() * $this->bpb()->numReservedLs());
            return $this->_m_posFats;
        }
        protected $_m_lsPerFat;
        public function lsPerFat() {
            if ($this->_m_lsPerFat !== null)
                return $this->_m_lsPerFat;
            $this->_m_lsPerFat = ($this->isFat32() ? $this->ebpbFat32()->lsPerFat() : $this->bpb()->lsPerFat());
            return $this->_m_lsPerFat;
        }
        protected $_m_lsPerRootDir;

        /**
         * Size of root directory in logical sectors
         */
        public function lsPerRootDir() {
            if ($this->_m_lsPerRootDir !== null)
                return $this->_m_lsPerRootDir;
            $this->_m_lsPerRootDir = intval(((($this->bpb()->maxRootDirRec() * 32) + $this->bpb()->bytesPerLs()) - 1) / $this->bpb()->bytesPerLs());
            return $this->_m_lsPerRootDir;
        }
        protected $_m_isFat32;

        /**
         * Determines if filesystem is FAT32 (true) or FAT12/16 (false)
         * by analyzing some preliminary conditions in BPB. Used to
         * determine whether we should parse post-BPB data as
         * `ext_bios_param_block_fat16` or `ext_bios_param_block_fat32`.
         */
        public function isFat32() {
            if ($this->_m_isFat32 !== null)
                return $this->_m_isFat32;
            $this->_m_isFat32 = $this->bpb()->maxRootDirRec() == 0;
            return $this->_m_isFat32;
        }
        protected $_m_sizeFat;

        /**
         * Size of one FAT in bytes
         */
        public function sizeFat() {
            if ($this->_m_sizeFat !== null)
                return $this->_m_sizeFat;
            $this->_m_sizeFat = ($this->bpb()->bytesPerLs() * $this->lsPerFat());
            return $this->_m_sizeFat;
        }
        protected $_m_posRootDir;

        /**
         * Offset of root directory in bytes from start of filesystem
         */
        public function posRootDir() {
            if ($this->_m_posRootDir !== null)
                return $this->_m_posRootDir;
            $this->_m_posRootDir = ($this->bpb()->bytesPerLs() * ($this->bpb()->numReservedLs() + ($this->lsPerFat() * $this->bpb()->numFats())));
            return $this->_m_posRootDir;
        }
        protected $_m_sizeRootDir;

        /**
         * Size of root directory in bytes
         */
        public function sizeRootDir() {
            if ($this->_m_sizeRootDir !== null)
                return $this->_m_sizeRootDir;
            $this->_m_sizeRootDir = ($this->lsPerRootDir() * $this->bpb()->bytesPerLs());
            return $this->_m_sizeRootDir;
        }
        protected $_m_jmpInstruction;
        protected $_m_oemName;
        protected $_m_bpb;
        protected $_m_ebpbFat16;
        protected $_m_ebpbFat32;
        public function jmpInstruction() { return $this->_m_jmpInstruction; }
        public function oemName() { return $this->_m_oemName; }

        /**
         * Basic BIOS parameter block, present in all versions of FAT
         */
        public function bpb() { return $this->_m_bpb; }

        /**
         * FAT12/16-specific extended BIOS parameter block
         */
        public function ebpbFat16() { return $this->_m_ebpbFat16; }

        /**
         * FAT32-specific extended BIOS parameter block
         */
        public function ebpbFat32() { return $this->_m_ebpbFat32; }
    }
}

namespace Vfat {
    class BiosParamBlock extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Vfat\BootSector $_parent = null, \Vfat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_bytesPerLs = $this->_io->readU2le();
            $this->_m_lsPerClus = $this->_io->readU1();
            $this->_m_numReservedLs = $this->_io->readU2le();
            $this->_m_numFats = $this->_io->readU1();
            $this->_m_maxRootDirRec = $this->_io->readU2le();
            $this->_m_totalLs2 = $this->_io->readU2le();
            $this->_m_mediaCode = $this->_io->readU1();
            $this->_m_lsPerFat = $this->_io->readU2le();
            $this->_m_psPerTrack = $this->_io->readU2le();
            $this->_m_numHeads = $this->_io->readU2le();
            $this->_m_numHiddenSectors = $this->_io->readU4le();
            $this->_m_totalLs4 = $this->_io->readU4le();
        }
        protected $_m_bytesPerLs;
        protected $_m_lsPerClus;
        protected $_m_numReservedLs;
        protected $_m_numFats;
        protected $_m_maxRootDirRec;
        protected $_m_totalLs2;
        protected $_m_mediaCode;
        protected $_m_lsPerFat;
        protected $_m_psPerTrack;
        protected $_m_numHeads;
        protected $_m_numHiddenSectors;
        protected $_m_totalLs4;

        /**
         * Bytes per logical sector
         */
        public function bytesPerLs() { return $this->_m_bytesPerLs; }

        /**
         * Logical sectors per cluster
         */
        public function lsPerClus() { return $this->_m_lsPerClus; }

        /**
         * Count of reserved logical sectors. The number of logical
         * sectors before the first FAT in the file system image.
         */
        public function numReservedLs() { return $this->_m_numReservedLs; }

        /**
         * Number of File Allocation Tables
         */
        public function numFats() { return $this->_m_numFats; }

        /**
         * Maximum number of FAT12 or FAT16 root directory entries. 0
         * for FAT32, where the root directory is stored in ordinary
         * data clusters.
         */
        public function maxRootDirRec() { return $this->_m_maxRootDirRec; }

        /**
         * Total logical sectors (if zero, use total_ls_4)
         */
        public function totalLs2() { return $this->_m_totalLs2; }

        /**
         * Media descriptor
         */
        public function mediaCode() { return $this->_m_mediaCode; }

        /**
         * Logical sectors per File Allocation Table for
         * FAT12/FAT16. FAT32 sets this to 0 and uses the 32-bit value
         * at offset 0x024 instead.
         */
        public function lsPerFat() { return $this->_m_lsPerFat; }

        /**
         * Physical sectors per track for disks with INT 13h CHS
         * geometry, e.g., 15 for a “1.20 MB” (1200 KB) floppy. A zero
         * entry indicates that this entry is reserved, but not used.
         */
        public function psPerTrack() { return $this->_m_psPerTrack; }

        /**
         * Number of heads for disks with INT 13h CHS geometry,[9]
         * e.g., 2 for a double sided floppy.
         */
        public function numHeads() { return $this->_m_numHeads; }

        /**
         * Number of hidden sectors preceding the partition that
         * contains this FAT volume. This field should always be zero
         * on media that are not partitioned. This DOS 3.0 entry is
         * incompatible with a similar entry at offset 0x01C in BPBs
         * since DOS 3.31.  It must not be used if the logical sectors
         * entry at offset 0x013 is zero.
         */
        public function numHiddenSectors() { return $this->_m_numHiddenSectors; }

        /**
         * Total logical sectors including hidden sectors. This DOS 3.2
         * entry is incompatible with a similar entry at offset 0x020
         * in BPBs since DOS 3.31. It must not be used if the logical
         * sectors entry at offset 0x013 is zero.
         */
        public function totalLs4() { return $this->_m_totalLs4; }
    }
}

namespace Vfat {
    class RootDirectoryRec extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Vfat\RootDirectory $_parent = null, \Vfat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fileName = $this->_io->readBytes(11);
            $this->_m_attribute = $this->_io->readU1();
            $this->_m_reserved = $this->_io->readBytes(10);
            $this->_m_time = $this->_io->readU2le();
            $this->_m_date = $this->_io->readU2le();
            $this->_m_startClus = $this->_io->readU2le();
            $this->_m_fileSize = $this->_io->readU4le();
        }
        protected $_m_fileName;
        protected $_m_attribute;
        protected $_m_reserved;
        protected $_m_time;
        protected $_m_date;
        protected $_m_startClus;
        protected $_m_fileSize;
        public function fileName() { return $this->_m_fileName; }
        public function attribute() { return $this->_m_attribute; }
        public function reserved() { return $this->_m_reserved; }
        public function time() { return $this->_m_time; }
        public function date() { return $this->_m_date; }
        public function startClus() { return $this->_m_startClus; }
        public function fileSize() { return $this->_m_fileSize; }
    }
}

namespace Vfat {
    class RootDirectory extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Vfat $_parent = null, \Vfat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_records = [];
            $n = $this->_root()->bootSector()->bpb()->maxRootDirRec();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_records[] = new \Vfat\RootDirectoryRec($this->_io, $this, $this->_root);
            }
        }
        protected $_m_records;
        public function records() { return $this->_m_records; }
    }
}

/**
 * Extended BIOS Parameter Block (DOS 4.0+, OS/2 1.0+). Used only
 * for FAT12 and FAT16.
 */

namespace Vfat {
    class ExtBiosParamBlockFat16 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Vfat\BootSector $_parent = null, \Vfat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_physDriveNum = $this->_io->readU1();
            $this->_m_reserved1 = $this->_io->readU1();
            $this->_m_extBootSign = $this->_io->readU1();
            $this->_m_volumeId = $this->_io->readBytes(4);
            $this->_m_partitionVolumeLabel = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesStripRight($this->_io->readBytes(11), 32), "ASCII");
            $this->_m_fsTypeStr = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesStripRight($this->_io->readBytes(8), 32), "ASCII");
        }
        protected $_m_physDriveNum;
        protected $_m_reserved1;
        protected $_m_extBootSign;
        protected $_m_volumeId;
        protected $_m_partitionVolumeLabel;
        protected $_m_fsTypeStr;

        /**
         * Physical drive number (0x00 for (first) removable media,
         * 0x80 for (first) fixed disk as per INT 13h).
         */
        public function physDriveNum() { return $this->_m_physDriveNum; }
        public function reserved1() { return $this->_m_reserved1; }

        /**
         * Should be 0x29 to indicate that an EBPB with the following 3
         * entries exists.
         */
        public function extBootSign() { return $this->_m_extBootSign; }

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
        public function volumeId() { return $this->_m_volumeId; }
        public function partitionVolumeLabel() { return $this->_m_partitionVolumeLabel; }
        public function fsTypeStr() { return $this->_m_fsTypeStr; }
    }
}
