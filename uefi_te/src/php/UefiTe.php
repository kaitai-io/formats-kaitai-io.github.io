<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * This type of executables could be found inside the UEFI firmware. The UEFI
 * firmware is stored in SPI flash memory, which is a chip soldered on a
 * system's motherboard. UEFI firmware is very modular: it usually contains
 * dozens, if not hundreds, of executables. To store all these separates files,
 * the firmware is laid out in volumes using the Firmware File System (FFS), a
 * file system specifically designed to store firmware images. The volumes
 * contain files that are identified by GUIDs and each of these files contain
 * one or more sections holding the data. One of these sections contains the
 * actual executable image. Most of the executable images follow the PE format.
 * However, some of them follow the TE format.
 * 
 * The Terse Executable (TE) image format was created as a mechanism to reduce
 * the overhead of the PE/COFF headers in PE32/PE32+ images, resulting in a
 * corresponding reduction of image sizes for executables running in the PI
 * (Platform Initialization) Architecture environment. Reducing image size
 * provides an opportunity for use of a smaller system flash part.
 * 
 * So the TE format is basically a stripped version of PE.
 */

namespace {
    class UefiTe extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\UefiTe $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m__raw_teHdr = $this->_io->readBytes(40);
            $_io__raw_teHdr = new \Kaitai\Struct\Stream($this->_m__raw_teHdr);
            $this->_m_teHdr = new \UefiTe\TeHeader($_io__raw_teHdr, $this, $this->_root);
            $this->_m_sections = [];
            $n = $this->teHdr()->numSections();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_sections[] = new \UefiTe\Section($this->_io, $this, $this->_root);
            }
        }
        protected $_m_teHdr;
        protected $_m_sections;
        protected $_m__raw_teHdr;
        public function teHdr() { return $this->_m_teHdr; }
        public function sections() { return $this->_m_sections; }
        public function _raw_teHdr() { return $this->_m__raw_teHdr; }
    }
}

namespace UefiTe {
    class DataDir extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\UefiTe\HeaderDataDirs $_parent = null, ?\UefiTe $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_virtualAddress = $this->_io->readU4le();
            $this->_m_size = $this->_io->readU4le();
        }
        protected $_m_virtualAddress;
        protected $_m_size;
        public function virtualAddress() { return $this->_m_virtualAddress; }
        public function size() { return $this->_m_size; }
    }
}

namespace UefiTe {
    class HeaderDataDirs extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\UefiTe\TeHeader $_parent = null, ?\UefiTe $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_baseRelocationTable = new \UefiTe\DataDir($this->_io, $this, $this->_root);
            $this->_m_debug = new \UefiTe\DataDir($this->_io, $this, $this->_root);
        }
        protected $_m_baseRelocationTable;
        protected $_m_debug;
        public function baseRelocationTable() { return $this->_m_baseRelocationTable; }
        public function debug() { return $this->_m_debug; }
    }
}

namespace UefiTe {
    class Section extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\UefiTe $_parent = null, ?\UefiTe $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesStripRight($this->_io->readBytes(8), 0), "UTF-8");
            $this->_m_virtualSize = $this->_io->readU4le();
            $this->_m_virtualAddress = $this->_io->readU4le();
            $this->_m_sizeOfRawData = $this->_io->readU4le();
            $this->_m_pointerToRawData = $this->_io->readU4le();
            $this->_m_pointerToRelocations = $this->_io->readU4le();
            $this->_m_pointerToLinenumbers = $this->_io->readU4le();
            $this->_m_numRelocations = $this->_io->readU2le();
            $this->_m_numLinenumbers = $this->_io->readU2le();
            $this->_m_characteristics = $this->_io->readU4le();
        }
        protected $_m_body;
        public function body() {
            if ($this->_m_body !== null)
                return $this->_m_body;
            $_pos = $this->_io->pos();
            $this->_io->seek(($this->pointerToRawData() - $this->_root()->teHdr()->strippedSize()) + $this->_root()->teHdr()->_io()->size());
            $this->_m_body = $this->_io->readBytes($this->sizeOfRawData());
            $this->_io->seek($_pos);
            return $this->_m_body;
        }
        protected $_m_name;
        protected $_m_virtualSize;
        protected $_m_virtualAddress;
        protected $_m_sizeOfRawData;
        protected $_m_pointerToRawData;
        protected $_m_pointerToRelocations;
        protected $_m_pointerToLinenumbers;
        protected $_m_numRelocations;
        protected $_m_numLinenumbers;
        protected $_m_characteristics;
        public function name() { return $this->_m_name; }
        public function virtualSize() { return $this->_m_virtualSize; }
        public function virtualAddress() { return $this->_m_virtualAddress; }
        public function sizeOfRawData() { return $this->_m_sizeOfRawData; }
        public function pointerToRawData() { return $this->_m_pointerToRawData; }
        public function pointerToRelocations() { return $this->_m_pointerToRelocations; }
        public function pointerToLinenumbers() { return $this->_m_pointerToLinenumbers; }
        public function numRelocations() { return $this->_m_numRelocations; }
        public function numLinenumbers() { return $this->_m_numLinenumbers; }
        public function characteristics() { return $this->_m_characteristics; }
    }
}

namespace UefiTe {
    class TeHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\UefiTe $_parent = null, ?\UefiTe $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(2);
            if (!($this->_m_magic == "\x56\x5A")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x56\x5A", $this->_m_magic, $this->_io, "/types/te_header/seq/0");
            }
            $this->_m_machine = $this->_io->readU2le();
            $this->_m_numSections = $this->_io->readU1();
            $this->_m_subsystem = $this->_io->readU1();
            $this->_m_strippedSize = $this->_io->readU2le();
            $this->_m_entryPointAddr = $this->_io->readU4le();
            $this->_m_baseOfCode = $this->_io->readU4le();
            $this->_m_imageBase = $this->_io->readU8le();
            $this->_m_dataDirs = new \UefiTe\HeaderDataDirs($this->_io, $this, $this->_root);
        }
        protected $_m_magic;
        protected $_m_machine;
        protected $_m_numSections;
        protected $_m_subsystem;
        protected $_m_strippedSize;
        protected $_m_entryPointAddr;
        protected $_m_baseOfCode;
        protected $_m_imageBase;
        protected $_m_dataDirs;
        public function magic() { return $this->_m_magic; }
        public function machine() { return $this->_m_machine; }
        public function numSections() { return $this->_m_numSections; }
        public function subsystem() { return $this->_m_subsystem; }
        public function strippedSize() { return $this->_m_strippedSize; }
        public function entryPointAddr() { return $this->_m_entryPointAddr; }
        public function baseOfCode() { return $this->_m_baseOfCode; }
        public function imageBase() { return $this->_m_imageBase; }
        public function dataDirs() { return $this->_m_dataDirs; }
    }
}

namespace UefiTe\TeHeader {
    class MachineType {

        /**
         * The content of this field is assumed to be applicable to any machine type
         */
        const UNKNOWN = 0;

        /**
         * Intel 386 or later processors and compatible processors
         */
        const I386 = 332;

        /**
         * MIPS little endian
         */
        const R4000 = 358;

        /**
         * MIPS little-endian WCE v2
         */
        const WCE_MIPS_V2 = 361;

        /**
         * Alpha AXP, 32-bit address space
         */
        const ALPHA = 388;

        /**
         * Hitachi SH3
         */
        const SH3 = 418;

        /**
         * Hitachi SH3 DSP
         */
        const SH3_DSP = 419;

        /**
         * Hitachi SH4
         */
        const SH4 = 422;

        /**
         * Hitachi SH5
         */
        const SH5 = 424;

        /**
         * ARM little endian
         */
        const ARM = 448;

        /**
         * Thumb
         */
        const THUMB = 450;

        /**
         * ARM Thumb-2 little endian
         */
        const ARM_NT = 452;

        /**
         * Matsushita AM33
         */
        const AM33 = 467;

        /**
         * Power PC little endian
         */
        const POWERPC = 496;

        /**
         * Power PC with floating point support
         */
        const POWERPC_FP = 497;

        /**
         * Intel Itanium processor family
         */
        const IA64 = 512;

        /**
         * MIPS16
         */
        const MIPS16 = 614;

        /**
         * > Alpha 64, 64-bit address space
         * or
         * > AXP 64 (Same as Alpha 64)
         */
        const ALPHA64_OR_AXP64 = 644;

        /**
         * MIPS with FPU
         */
        const MIPS_FPU = 870;

        /**
         * MIPS16 with FPU
         */
        const MIPS16_FPU = 1126;

        /**
         * EFI byte code
         */
        const EBC = 3772;

        /**
         * RISC-V 32-bit address space
         */
        const RISCV32 = 20530;

        /**
         * RISC-V 64-bit address space
         */
        const RISCV64 = 20580;

        /**
         * RISC-V 128-bit address space
         */
        const RISCV128 = 20776;

        /**
         * LoongArch 32-bit processor family
         */
        const LOONGARCH32 = 25138;

        /**
         * LoongArch 64-bit processor family
         */
        const LOONGARCH64 = 25188;

        /**
         * x64
         */
        const AMD64 = 34404;

        /**
         * Mitsubishi M32R little endian
         */
        const M32R = 36929;

        /**
         * ARM64 little endian
         */
        const ARM64 = 43620;

        private const _VALUES = [0 => true, 332 => true, 358 => true, 361 => true, 388 => true, 418 => true, 419 => true, 422 => true, 424 => true, 448 => true, 450 => true, 452 => true, 467 => true, 496 => true, 497 => true, 512 => true, 614 => true, 644 => true, 870 => true, 1126 => true, 3772 => true, 20530 => true, 20580 => true, 20776 => true, 25138 => true, 25188 => true, 34404 => true, 36929 => true, 43620 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace UefiTe\TeHeader {
    class SubsystemEnum {
        const UNKNOWN = 0;
        const NATIVE = 1;
        const WINDOWS_GUI = 2;
        const WINDOWS_CUI = 3;
        const POSIX_CUI = 7;
        const WINDOWS_CE_GUI = 9;
        const EFI_APPLICATION = 10;
        const EFI_BOOT_SERVICE_DRIVER = 11;
        const EFI_RUNTIME_DRIVER = 12;
        const EFI_ROM = 13;
        const XBOX = 14;
        const WINDOWS_BOOT_APPLICATION = 16;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 7 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 14 => true, 16 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
