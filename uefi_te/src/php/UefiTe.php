<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * This type of executables could be found inside the UEFI firmware. The UEFI
 * firmware is stored in SPI flash memory, which is a chip soldered on a
 * system’s motherboard. UEFI firmware is very modular: it usually contains
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
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \UefiTe $_root = null) {
            parent::__construct($_io, $_parent, $_root);
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
    class TeHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \UefiTe $_parent = null, \UefiTe $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(2);
            if (!($this->magic() == "\x56\x5A")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x56\x5A", $this->magic(), $this->_io(), "/types/te_header/seq/0");
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
        const UNKNOWN = 0;
        const I386 = 332;
        const R4000 = 358;
        const WCEMIPSV2 = 361;
        const ALPHA = 388;
        const SH3 = 418;
        const SH3DSP = 419;
        const SH4 = 422;
        const SH5 = 424;
        const ARM = 448;
        const THUMB = 450;
        const ARMNT = 452;
        const AM33 = 467;
        const POWERPC = 496;
        const POWERPCFP = 497;
        const IA64 = 512;
        const MIPS16 = 614;
        const MIPSFPU = 870;
        const MIPSFPU16 = 1126;
        const EBC = 3772;
        const RISCV32 = 20530;
        const RISCV64 = 20580;
        const RISCV128 = 20776;
        const AMD64 = 34404;
        const M32R = 36929;
        const ARM64 = 43620;
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
    }
}

namespace UefiTe {
    class HeaderDataDirs extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \UefiTe\TeHeader $_parent = null, \UefiTe $_root = null) {
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
    class DataDir extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \UefiTe\HeaderDataDirs $_parent = null, \UefiTe $_root = null) {
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
    class Section extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \UefiTe $_parent = null, \UefiTe $_root = null) {
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
            $this->_io->seek((($this->pointerToRawData() - $this->_root()->teHdr()->strippedSize()) + $this->_root()->teHdr()->_io()->size()));
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
