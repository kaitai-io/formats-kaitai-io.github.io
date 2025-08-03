<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class Elf extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Elf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->magic() == "\x7F\x45\x4C\x46")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x7F\x45\x4C\x46", $this->magic(), $this->_io(), "/seq/0");
            }
            $this->_m_bits = $this->_io->readU1();
            $this->_m_endian = $this->_io->readU1();
            $this->_m_eiVersion = $this->_io->readU1();
            if (!($this->eiVersion() == 1)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(1, $this->eiVersion(), $this->_io(), "/seq/3");
            }
            $this->_m_abi = $this->_io->readU1();
            $this->_m_abiVersion = $this->_io->readU1();
            $this->_m_pad = $this->_io->readBytes(7);
            if (!($this->pad() == "\x00\x00\x00\x00\x00\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00\x00\x00\x00\x00\x00\x00", $this->pad(), $this->_io(), "/seq/6");
            }
            $this->_m_header = new \Elf\EndianElf($this->_io, $this, $this->_root);
        }
        protected $_m_shIdxLoOs;
        public function shIdxLoOs() {
            if ($this->_m_shIdxLoOs !== null)
                return $this->_m_shIdxLoOs;
            $this->_m_shIdxLoOs = 65312;
            return $this->_m_shIdxLoOs;
        }
        protected $_m_shIdxLoReserved;
        public function shIdxLoReserved() {
            if ($this->_m_shIdxLoReserved !== null)
                return $this->_m_shIdxLoReserved;
            $this->_m_shIdxLoReserved = 65280;
            return $this->_m_shIdxLoReserved;
        }
        protected $_m_shIdxHiProc;
        public function shIdxHiProc() {
            if ($this->_m_shIdxHiProc !== null)
                return $this->_m_shIdxHiProc;
            $this->_m_shIdxHiProc = 65311;
            return $this->_m_shIdxHiProc;
        }
        protected $_m_shIdxLoProc;
        public function shIdxLoProc() {
            if ($this->_m_shIdxLoProc !== null)
                return $this->_m_shIdxLoProc;
            $this->_m_shIdxLoProc = 65280;
            return $this->_m_shIdxLoProc;
        }
        protected $_m_shIdxHiOs;
        public function shIdxHiOs() {
            if ($this->_m_shIdxHiOs !== null)
                return $this->_m_shIdxHiOs;
            $this->_m_shIdxHiOs = 65343;
            return $this->_m_shIdxHiOs;
        }
        protected $_m_shIdxHiReserved;
        public function shIdxHiReserved() {
            if ($this->_m_shIdxHiReserved !== null)
                return $this->_m_shIdxHiReserved;
            $this->_m_shIdxHiReserved = 65535;
            return $this->_m_shIdxHiReserved;
        }
        protected $_m_magic;
        protected $_m_bits;
        protected $_m_endian;
        protected $_m_eiVersion;
        protected $_m_abi;
        protected $_m_abiVersion;
        protected $_m_pad;
        protected $_m_header;

        /**
         * File identification, must be 0x7f + "ELF".
         */
        public function magic() { return $this->_m_magic; }

        /**
         * File class: designates target machine word size (32 or 64
         * bits). The size of many integer fields in this format will
         * depend on this setting.
         */
        public function bits() { return $this->_m_bits; }

        /**
         * Endianness used for all integers.
         */
        public function endian() { return $this->_m_endian; }

        /**
         * ELF header version.
         */
        public function eiVersion() { return $this->_m_eiVersion; }

        /**
         * Specifies which OS- and ABI-related extensions will be used
         * in this ELF file.
         */
        public function abi() { return $this->_m_abi; }

        /**
         * Version of ABI targeted by this ELF file. Interpretation
         * depends on `abi` attribute.
         */
        public function abiVersion() { return $this->_m_abiVersion; }
        public function pad() { return $this->_m_pad; }
        public function header() { return $this->_m_header; }
    }
}

namespace Elf {
    class EndianElf extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, \Elf $_parent = null, \Elf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            switch ($this->_root()->endian()) {
                case \Elf\Endian::LE:
                    $this->_m__is_le = true;
                    break;
                case \Elf\Endian::BE:
                    $this->_m__is_le = false;
                    break;
            }

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_eType = $this->_io->readU2le();
            $this->_m_machine = $this->_io->readU2le();
            $this->_m_eVersion = $this->_io->readU4le();
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_entryPoint = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_entryPoint = $this->_io->readU8le();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_ofsProgramHeaders = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_ofsProgramHeaders = $this->_io->readU8le();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_ofsSectionHeaders = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_ofsSectionHeaders = $this->_io->readU8le();
                    break;
            }
            $this->_m_flags = $this->_io->readBytes(4);
            $this->_m_eEhsize = $this->_io->readU2le();
            $this->_m_programHeaderSize = $this->_io->readU2le();
            $this->_m_numProgramHeaders = $this->_io->readU2le();
            $this->_m_sectionHeaderSize = $this->_io->readU2le();
            $this->_m_numSectionHeaders = $this->_io->readU2le();
            $this->_m_sectionNamesIdx = $this->_io->readU2le();
        }

        private function _readBE() {
            $this->_m_eType = $this->_io->readU2be();
            $this->_m_machine = $this->_io->readU2be();
            $this->_m_eVersion = $this->_io->readU4be();
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_entryPoint = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_entryPoint = $this->_io->readU8be();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_ofsProgramHeaders = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_ofsProgramHeaders = $this->_io->readU8be();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_ofsSectionHeaders = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_ofsSectionHeaders = $this->_io->readU8be();
                    break;
            }
            $this->_m_flags = $this->_io->readBytes(4);
            $this->_m_eEhsize = $this->_io->readU2be();
            $this->_m_programHeaderSize = $this->_io->readU2be();
            $this->_m_numProgramHeaders = $this->_io->readU2be();
            $this->_m_sectionHeaderSize = $this->_io->readU2be();
            $this->_m_numSectionHeaders = $this->_io->readU2be();
            $this->_m_sectionNamesIdx = $this->_io->readU2be();
        }
        protected $_m_programHeaders;
        public function programHeaders() {
            if ($this->_m_programHeaders !== null)
                return $this->_m_programHeaders;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsProgramHeaders());
            if ($this->_m__is_le) {
                $this->_m__raw_programHeaders = [];
                $this->_m_programHeaders = [];
                $n = $this->numProgramHeaders();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m__raw_programHeaders[] = $this->_io->readBytes($this->programHeaderSize());
                    $_io__raw_programHeaders = new \Kaitai\Struct\Stream(end($this->_m__raw_programHeaders));
                    $this->_m_programHeaders[] = new \Elf\EndianElf\ProgramHeader($_io__raw_programHeaders, $this, $this->_root, $this->_m__is_le);
                }
            } else {
                $this->_m__raw_programHeaders = [];
                $this->_m_programHeaders = [];
                $n = $this->numProgramHeaders();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m__raw_programHeaders[] = $this->_io->readBytes($this->programHeaderSize());
                    $_io__raw_programHeaders = new \Kaitai\Struct\Stream(end($this->_m__raw_programHeaders));
                    $this->_m_programHeaders[] = new \Elf\EndianElf\ProgramHeader($_io__raw_programHeaders, $this, $this->_root, $this->_m__is_le);
                }
            }
            $this->_io->seek($_pos);
            return $this->_m_programHeaders;
        }
        protected $_m_sectionHeaders;
        public function sectionHeaders() {
            if ($this->_m_sectionHeaders !== null)
                return $this->_m_sectionHeaders;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsSectionHeaders());
            if ($this->_m__is_le) {
                $this->_m__raw_sectionHeaders = [];
                $this->_m_sectionHeaders = [];
                $n = $this->numSectionHeaders();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m__raw_sectionHeaders[] = $this->_io->readBytes($this->sectionHeaderSize());
                    $_io__raw_sectionHeaders = new \Kaitai\Struct\Stream(end($this->_m__raw_sectionHeaders));
                    $this->_m_sectionHeaders[] = new \Elf\EndianElf\SectionHeader($_io__raw_sectionHeaders, $this, $this->_root, $this->_m__is_le);
                }
            } else {
                $this->_m__raw_sectionHeaders = [];
                $this->_m_sectionHeaders = [];
                $n = $this->numSectionHeaders();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m__raw_sectionHeaders[] = $this->_io->readBytes($this->sectionHeaderSize());
                    $_io__raw_sectionHeaders = new \Kaitai\Struct\Stream(end($this->_m__raw_sectionHeaders));
                    $this->_m_sectionHeaders[] = new \Elf\EndianElf\SectionHeader($_io__raw_sectionHeaders, $this, $this->_root, $this->_m__is_le);
                }
            }
            $this->_io->seek($_pos);
            return $this->_m_sectionHeaders;
        }
        protected $_m_sectionNames;
        public function sectionNames() {
            if ($this->_m_sectionNames !== null)
                return $this->_m_sectionNames;
            if ( (($this->sectionNamesIdx() != \Elf\SectionHeaderIdxSpecial::UNDEFINED) && ($this->sectionNamesIdx() < $this->_root()->header()->numSectionHeaders())) ) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->sectionHeaders()[$this->sectionNamesIdx()]->ofsBody());
                if ($this->_m__is_le) {
                    $this->_m__raw_sectionNames = $this->_io->readBytes($this->sectionHeaders()[$this->sectionNamesIdx()]->lenBody());
                    $_io__raw_sectionNames = new \Kaitai\Struct\Stream($this->_m__raw_sectionNames);
                    $this->_m_sectionNames = new \Elf\EndianElf\StringsStruct($_io__raw_sectionNames, $this, $this->_root, $this->_m__is_le);
                } else {
                    $this->_m__raw_sectionNames = $this->_io->readBytes($this->sectionHeaders()[$this->sectionNamesIdx()]->lenBody());
                    $_io__raw_sectionNames = new \Kaitai\Struct\Stream($this->_m__raw_sectionNames);
                    $this->_m_sectionNames = new \Elf\EndianElf\StringsStruct($_io__raw_sectionNames, $this, $this->_root, $this->_m__is_le);
                }
                $this->_io->seek($_pos);
            }
            return $this->_m_sectionNames;
        }
        protected $_m_eType;
        protected $_m_machine;
        protected $_m_eVersion;
        protected $_m_entryPoint;
        protected $_m_ofsProgramHeaders;
        protected $_m_ofsSectionHeaders;
        protected $_m_flags;
        protected $_m_eEhsize;
        protected $_m_programHeaderSize;
        protected $_m_numProgramHeaders;
        protected $_m_sectionHeaderSize;
        protected $_m_numSectionHeaders;
        protected $_m_sectionNamesIdx;
        protected $_m__raw_programHeaders;
        protected $_m__raw_sectionHeaders;
        protected $_m__raw_sectionNames;
        public function eType() { return $this->_m_eType; }
        public function machine() { return $this->_m_machine; }
        public function eVersion() { return $this->_m_eVersion; }
        public function entryPoint() { return $this->_m_entryPoint; }
        public function ofsProgramHeaders() { return $this->_m_ofsProgramHeaders; }
        public function ofsSectionHeaders() { return $this->_m_ofsSectionHeaders; }
        public function flags() { return $this->_m_flags; }
        public function eEhsize() { return $this->_m_eEhsize; }
        public function programHeaderSize() { return $this->_m_programHeaderSize; }
        public function numProgramHeaders() { return $this->_m_numProgramHeaders; }
        public function sectionHeaderSize() { return $this->_m_sectionHeaderSize; }
        public function numSectionHeaders() { return $this->_m_numSectionHeaders; }
        public function sectionNamesIdx() { return $this->_m_sectionNamesIdx; }
        public function _raw_programHeaders() { return $this->_m__raw_programHeaders; }
        public function _raw_sectionHeaders() { return $this->_m__raw_sectionHeaders; }
        public function _raw_sectionNames() { return $this->_m__raw_sectionNames; }
    }
}

namespace Elf\EndianElf {
    class NoteSection extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, \Elf\EndianElf\SectionHeader $_parent = null, \Elf $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Elf\EndianElf\NoteSectionEntry($this->_io, $this, $this->_root, $this->_m__is_le);
                $i++;
            }
        }

        private function _readBE() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Elf\EndianElf\NoteSectionEntry($this->_io, $this, $this->_root, $this->_m__is_le);
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace Elf\EndianElf {
    class ProgramHeader extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, \Elf\EndianElf $_parent = null, \Elf $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_type = $this->_io->readU4le();
            if ($this->_root()->bits() == \Elf\Bits::B64) {
                $this->_m_flags64 = $this->_io->readU4le();
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_offset = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_offset = $this->_io->readU8le();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_vaddr = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_vaddr = $this->_io->readU8le();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_paddr = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_paddr = $this->_io->readU8le();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_filesz = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_filesz = $this->_io->readU8le();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_memsz = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_memsz = $this->_io->readU8le();
                    break;
            }
            if ($this->_root()->bits() == \Elf\Bits::B32) {
                $this->_m_flags32 = $this->_io->readU4le();
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_align = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_align = $this->_io->readU8le();
                    break;
            }
        }

        private function _readBE() {
            $this->_m_type = $this->_io->readU4be();
            if ($this->_root()->bits() == \Elf\Bits::B64) {
                $this->_m_flags64 = $this->_io->readU4be();
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_offset = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_offset = $this->_io->readU8be();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_vaddr = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_vaddr = $this->_io->readU8be();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_paddr = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_paddr = $this->_io->readU8be();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_filesz = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_filesz = $this->_io->readU8be();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_memsz = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_memsz = $this->_io->readU8be();
                    break;
            }
            if ($this->_root()->bits() == \Elf\Bits::B32) {
                $this->_m_flags32 = $this->_io->readU4be();
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_align = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_align = $this->_io->readU8be();
                    break;
            }
        }
        protected $_m_flagsObj;
        public function flagsObj() {
            if ($this->_m_flagsObj !== null)
                return $this->_m_flagsObj;
            if ($this->_m__is_le) {
                switch ($this->_root()->bits()) {
                    case \Elf\Bits::B32:
                        $this->_m_flagsObj = new \Elf\PhdrTypeFlags($this->flags32(), $this->_io, $this, $this->_root);
                        break;
                    case \Elf\Bits::B64:
                        $this->_m_flagsObj = new \Elf\PhdrTypeFlags($this->flags64(), $this->_io, $this, $this->_root);
                        break;
                }
            } else {
                switch ($this->_root()->bits()) {
                    case \Elf\Bits::B32:
                        $this->_m_flagsObj = new \Elf\PhdrTypeFlags($this->flags32(), $this->_io, $this, $this->_root);
                        break;
                    case \Elf\Bits::B64:
                        $this->_m_flagsObj = new \Elf\PhdrTypeFlags($this->flags64(), $this->_io, $this, $this->_root);
                        break;
                }
            }
            return $this->_m_flagsObj;
        }
        protected $_m_type;
        protected $_m_flags64;
        protected $_m_offset;
        protected $_m_vaddr;
        protected $_m_paddr;
        protected $_m_filesz;
        protected $_m_memsz;
        protected $_m_flags32;
        protected $_m_align;
        public function type() { return $this->_m_type; }
        public function flags64() { return $this->_m_flags64; }
        public function offset() { return $this->_m_offset; }
        public function vaddr() { return $this->_m_vaddr; }
        public function paddr() { return $this->_m_paddr; }
        public function filesz() { return $this->_m_filesz; }
        public function memsz() { return $this->_m_memsz; }
        public function flags32() { return $this->_m_flags32; }
        public function align() { return $this->_m_align; }
    }
}

namespace Elf\EndianElf {
    class DynamicSectionEntry extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, \Elf\EndianElf\DynamicSection $_parent = null, \Elf $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_tag = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_tag = $this->_io->readU8le();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_valueOrPtr = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_valueOrPtr = $this->_io->readU8le();
                    break;
            }
        }

        private function _readBE() {
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_tag = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_tag = $this->_io->readU8be();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_valueOrPtr = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_valueOrPtr = $this->_io->readU8be();
                    break;
            }
        }
        protected $_m_flag1Values;
        public function flag1Values() {
            if ($this->_m_flag1Values !== null)
                return $this->_m_flag1Values;
            if ($this->tagEnum() == \Elf\DynamicArrayTags::FLAGS_1) {
                if ($this->_m__is_le) {
                    $this->_m_flag1Values = new \Elf\DtFlag1Values($this->valueOrPtr(), $this->_io, $this, $this->_root);
                } else {
                    $this->_m_flag1Values = new \Elf\DtFlag1Values($this->valueOrPtr(), $this->_io, $this, $this->_root);
                }
            }
            return $this->_m_flag1Values;
        }
        protected $_m_valueStr;
        public function valueStr() {
            if ($this->_m_valueStr !== null)
                return $this->_m_valueStr;
            if ( (($this->isValueStr()) && ($this->_parent()->isStringTableLinked())) ) {
                $io = $this->_parent()->_parent()->linkedSection()->body()->_io();
                $_pos = $io->pos();
                $io->seek($this->valueOrPtr());
                if ($this->_m__is_le) {
                    $this->_m_valueStr = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, true), "ASCII");
                } else {
                    $this->_m_valueStr = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, true), "ASCII");
                }
                $io->seek($_pos);
            }
            return $this->_m_valueStr;
        }
        protected $_m_tagEnum;
        public function tagEnum() {
            if ($this->_m_tagEnum !== null)
                return $this->_m_tagEnum;
            $this->_m_tagEnum = $this->tag();
            return $this->_m_tagEnum;
        }
        protected $_m_flagValues;
        public function flagValues() {
            if ($this->_m_flagValues !== null)
                return $this->_m_flagValues;
            if ($this->tagEnum() == \Elf\DynamicArrayTags::FLAGS) {
                if ($this->_m__is_le) {
                    $this->_m_flagValues = new \Elf\DtFlagValues($this->valueOrPtr(), $this->_io, $this, $this->_root);
                } else {
                    $this->_m_flagValues = new \Elf\DtFlagValues($this->valueOrPtr(), $this->_io, $this, $this->_root);
                }
            }
            return $this->_m_flagValues;
        }
        protected $_m_isValueStr;
        public function isValueStr() {
            if ($this->_m_isValueStr !== null)
                return $this->_m_isValueStr;
            $this->_m_isValueStr =  (($this->valueOrPtr() != 0) && ( (($this->tagEnum() == \Elf\DynamicArrayTags::NEEDED) || ($this->tagEnum() == \Elf\DynamicArrayTags::SONAME) || ($this->tagEnum() == \Elf\DynamicArrayTags::RPATH) || ($this->tagEnum() == \Elf\DynamicArrayTags::RUNPATH) || ($this->tagEnum() == \Elf\DynamicArrayTags::SUNW_AUXILIARY) || ($this->tagEnum() == \Elf\DynamicArrayTags::SUNW_FILTER) || ($this->tagEnum() == \Elf\DynamicArrayTags::AUXILIARY) || ($this->tagEnum() == \Elf\DynamicArrayTags::FILTER) || ($this->tagEnum() == \Elf\DynamicArrayTags::CONFIG) || ($this->tagEnum() == \Elf\DynamicArrayTags::DEPAUDIT) || ($this->tagEnum() == \Elf\DynamicArrayTags::AUDIT)) )) ;
            return $this->_m_isValueStr;
        }
        protected $_m_tag;
        protected $_m_valueOrPtr;
        public function tag() { return $this->_m_tag; }
        public function valueOrPtr() { return $this->_m_valueOrPtr; }
    }
}

namespace Elf\EndianElf {
    class SectionHeader extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, \Elf\EndianElf $_parent = null, \Elf $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_ofsName = $this->_io->readU4le();
            $this->_m_type = $this->_io->readU4le();
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_flags = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_flags = $this->_io->readU8le();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_addr = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_addr = $this->_io->readU8le();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_ofsBody = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_ofsBody = $this->_io->readU8le();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_lenBody = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_lenBody = $this->_io->readU8le();
                    break;
            }
            $this->_m_linkedSectionIdx = $this->_io->readU4le();
            $this->_m_info = $this->_io->readBytes(4);
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_align = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_align = $this->_io->readU8le();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_entrySize = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_entrySize = $this->_io->readU8le();
                    break;
            }
        }

        private function _readBE() {
            $this->_m_ofsName = $this->_io->readU4be();
            $this->_m_type = $this->_io->readU4be();
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_flags = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_flags = $this->_io->readU8be();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_addr = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_addr = $this->_io->readU8be();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_ofsBody = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_ofsBody = $this->_io->readU8be();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_lenBody = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_lenBody = $this->_io->readU8be();
                    break;
            }
            $this->_m_linkedSectionIdx = $this->_io->readU4be();
            $this->_m_info = $this->_io->readBytes(4);
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_align = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_align = $this->_io->readU8be();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_entrySize = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_entrySize = $this->_io->readU8be();
                    break;
            }
        }
        protected $_m_body;
        public function body() {
            if ($this->_m_body !== null)
                return $this->_m_body;
            if ($this->type() != \Elf\ShType::NOBITS) {
                $io = $this->_root()->_io();
                $_pos = $io->pos();
                $io->seek($this->ofsBody());
                if ($this->_m__is_le) {
                    switch ($this->type()) {
                        case \Elf\ShType::REL:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\RelocationSection(false, $_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::NOTE:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\NoteSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::SYMTAB:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\DynsymSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::STRTAB:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\StringsStruct($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::DYNAMIC:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\DynamicSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::DYNSYM:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\DynsymSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::RELA:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\RelocationSection(true, $_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        default:
                            $this->_m_body = $io->readBytes($this->lenBody());
                            break;
                    }
                } else {
                    switch ($this->type()) {
                        case \Elf\ShType::REL:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\RelocationSection(false, $_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::NOTE:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\NoteSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::SYMTAB:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\DynsymSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::STRTAB:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\StringsStruct($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::DYNAMIC:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\DynamicSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::DYNSYM:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\DynsymSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::RELA:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\RelocationSection(true, $_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        default:
                            $this->_m_body = $io->readBytes($this->lenBody());
                            break;
                    }
                }
                $io->seek($_pos);
            }
            return $this->_m_body;
        }
        protected $_m_linkedSection;

        /**
         * may reference a later section header, so don't try to access too early (use only lazy `instances`)
         */
        public function linkedSection() {
            if ($this->_m_linkedSection !== null)
                return $this->_m_linkedSection;
            if ( (($this->linkedSectionIdx() != \Elf\SectionHeaderIdxSpecial::UNDEFINED) && ($this->linkedSectionIdx() < $this->_root()->header()->numSectionHeaders())) ) {
                $this->_m_linkedSection = $this->_root()->header()->sectionHeaders()[$this->linkedSectionIdx()];
            }
            return $this->_m_linkedSection;
        }
        protected $_m_name;
        public function name() {
            if ($this->_m_name !== null)
                return $this->_m_name;
            $io = $this->_root()->header()->sectionNames()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsName());
            if ($this->_m__is_le) {
                $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, true), "ASCII");
            } else {
                $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, true), "ASCII");
            }
            $io->seek($_pos);
            return $this->_m_name;
        }
        protected $_m_flagsObj;
        public function flagsObj() {
            if ($this->_m_flagsObj !== null)
                return $this->_m_flagsObj;
            if ($this->_m__is_le) {
                $this->_m_flagsObj = new \Elf\SectionHeaderFlags($this->flags(), $this->_io, $this, $this->_root);
            } else {
                $this->_m_flagsObj = new \Elf\SectionHeaderFlags($this->flags(), $this->_io, $this, $this->_root);
            }
            return $this->_m_flagsObj;
        }
        protected $_m_ofsName;
        protected $_m_type;
        protected $_m_flags;
        protected $_m_addr;
        protected $_m_ofsBody;
        protected $_m_lenBody;
        protected $_m_linkedSectionIdx;
        protected $_m_info;
        protected $_m_align;
        protected $_m_entrySize;
        protected $_m__raw_body;
        public function ofsName() { return $this->_m_ofsName; }
        public function type() { return $this->_m_type; }
        public function flags() { return $this->_m_flags; }
        public function addr() { return $this->_m_addr; }
        public function ofsBody() { return $this->_m_ofsBody; }
        public function lenBody() { return $this->_m_lenBody; }
        public function linkedSectionIdx() { return $this->_m_linkedSectionIdx; }
        public function info() { return $this->_m_info; }
        public function align() { return $this->_m_align; }
        public function entrySize() { return $this->_m_entrySize; }
        public function _raw_body() { return $this->_m__raw_body; }
    }
}

namespace Elf\EndianElf {
    class RelocationSection extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(bool $hasAddend, \Kaitai\Struct\Stream $_io, \Elf\EndianElf\SectionHeader $_parent = null, \Elf $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_m_hasAddend = $hasAddend;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Elf\EndianElf\RelocationSectionEntry($this->_io, $this, $this->_root, $this->_m__is_le);
                $i++;
            }
        }

        private function _readBE() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Elf\EndianElf\RelocationSectionEntry($this->_io, $this, $this->_root, $this->_m__is_le);
                $i++;
            }
        }
        protected $_m_entries;
        protected $_m_hasAddend;
        public function entries() { return $this->_m_entries; }
        public function hasAddend() { return $this->_m_hasAddend; }
    }
}

namespace Elf\EndianElf {
    class DynamicSection extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, \Elf\EndianElf\SectionHeader $_parent = null, \Elf $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Elf\EndianElf\DynamicSectionEntry($this->_io, $this, $this->_root, $this->_m__is_le);
                $i++;
            }
        }

        private function _readBE() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Elf\EndianElf\DynamicSectionEntry($this->_io, $this, $this->_root, $this->_m__is_le);
                $i++;
            }
        }
        protected $_m_isStringTableLinked;
        public function isStringTableLinked() {
            if ($this->_m_isStringTableLinked !== null)
                return $this->_m_isStringTableLinked;
            $this->_m_isStringTableLinked = $this->_parent()->linkedSection()->type() == \Elf\ShType::STRTAB;
            return $this->_m_isStringTableLinked;
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace Elf\EndianElf {
    class DynsymSection extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, \Elf\EndianElf\SectionHeader $_parent = null, \Elf $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Elf\EndianElf\DynsymSectionEntry($this->_io, $this, $this->_root, $this->_m__is_le);
                $i++;
            }
        }

        private function _readBE() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Elf\EndianElf\DynsymSectionEntry($this->_io, $this, $this->_root, $this->_m__is_le);
                $i++;
            }
        }
        protected $_m_isStringTableLinked;
        public function isStringTableLinked() {
            if ($this->_m_isStringTableLinked !== null)
                return $this->_m_isStringTableLinked;
            $this->_m_isStringTableLinked = $this->_parent()->linkedSection()->type() == \Elf\ShType::STRTAB;
            return $this->_m_isStringTableLinked;
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace Elf\EndianElf {
    class RelocationSectionEntry extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, \Elf\EndianElf\RelocationSection $_parent = null, \Elf $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_offset = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_offset = $this->_io->readU8le();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_info = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_info = $this->_io->readU8le();
                    break;
            }
            if ($this->_parent()->hasAddend()) {
                switch ($this->_root()->bits()) {
                    case \Elf\Bits::B32:
                        $this->_m_addend = $this->_io->readS4le();
                        break;
                    case \Elf\Bits::B64:
                        $this->_m_addend = $this->_io->readS8le();
                        break;
                }
            }
        }

        private function _readBE() {
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_offset = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_offset = $this->_io->readU8be();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_info = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_info = $this->_io->readU8be();
                    break;
            }
            if ($this->_parent()->hasAddend()) {
                switch ($this->_root()->bits()) {
                    case \Elf\Bits::B32:
                        $this->_m_addend = $this->_io->readS4be();
                        break;
                    case \Elf\Bits::B64:
                        $this->_m_addend = $this->_io->readS8be();
                        break;
                }
            }
        }
        protected $_m_offset;
        protected $_m_info;
        protected $_m_addend;
        public function offset() { return $this->_m_offset; }
        public function info() { return $this->_m_info; }
        public function addend() { return $this->_m_addend; }
    }
}

namespace Elf\EndianElf {
    class DynsymSectionEntry extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, \Elf\EndianElf\DynsymSection $_parent = null, \Elf $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_ofsName = $this->_io->readU4le();
            if ($this->_root()->bits() == \Elf\Bits::B32) {
                $this->_m_valueB32 = $this->_io->readU4le();
            }
            if ($this->_root()->bits() == \Elf\Bits::B32) {
                $this->_m_sizeB32 = $this->_io->readU4le();
            }
            $this->_m_bind = $this->_io->readBitsIntBe(4);
            $this->_m_type = $this->_io->readBitsIntBe(4);
            $this->_io->alignToByte();
            $this->_m_other = $this->_io->readU1();
            $this->_m_shIdx = $this->_io->readU2le();
            if ($this->_root()->bits() == \Elf\Bits::B64) {
                $this->_m_valueB64 = $this->_io->readU8le();
            }
            if ($this->_root()->bits() == \Elf\Bits::B64) {
                $this->_m_sizeB64 = $this->_io->readU8le();
            }
        }

        private function _readBE() {
            $this->_m_ofsName = $this->_io->readU4be();
            if ($this->_root()->bits() == \Elf\Bits::B32) {
                $this->_m_valueB32 = $this->_io->readU4be();
            }
            if ($this->_root()->bits() == \Elf\Bits::B32) {
                $this->_m_sizeB32 = $this->_io->readU4be();
            }
            $this->_m_bind = $this->_io->readBitsIntBe(4);
            $this->_m_type = $this->_io->readBitsIntBe(4);
            $this->_io->alignToByte();
            $this->_m_other = $this->_io->readU1();
            $this->_m_shIdx = $this->_io->readU2be();
            if ($this->_root()->bits() == \Elf\Bits::B64) {
                $this->_m_valueB64 = $this->_io->readU8be();
            }
            if ($this->_root()->bits() == \Elf\Bits::B64) {
                $this->_m_sizeB64 = $this->_io->readU8be();
            }
        }
        protected $_m_isShIdxReserved;
        public function isShIdxReserved() {
            if ($this->_m_isShIdxReserved !== null)
                return $this->_m_isShIdxReserved;
            $this->_m_isShIdxReserved =  (($this->shIdx() >= $this->_root()->shIdxLoReserved()) && ($this->shIdx() <= $this->_root()->shIdxHiReserved())) ;
            return $this->_m_isShIdxReserved;
        }
        protected $_m_isShIdxOs;
        public function isShIdxOs() {
            if ($this->_m_isShIdxOs !== null)
                return $this->_m_isShIdxOs;
            $this->_m_isShIdxOs =  (($this->shIdx() >= $this->_root()->shIdxLoOs()) && ($this->shIdx() <= $this->_root()->shIdxHiOs())) ;
            return $this->_m_isShIdxOs;
        }
        protected $_m_isShIdxProc;
        public function isShIdxProc() {
            if ($this->_m_isShIdxProc !== null)
                return $this->_m_isShIdxProc;
            $this->_m_isShIdxProc =  (($this->shIdx() >= $this->_root()->shIdxLoProc()) && ($this->shIdx() <= $this->_root()->shIdxHiProc())) ;
            return $this->_m_isShIdxProc;
        }
        protected $_m_size;
        public function size() {
            if ($this->_m_size !== null)
                return $this->_m_size;
            $this->_m_size = ($this->_root()->bits() == \Elf\Bits::B32 ? $this->sizeB32() : ($this->_root()->bits() == \Elf\Bits::B64 ? $this->sizeB64() : 0));
            return $this->_m_size;
        }
        protected $_m_visibility;
        public function visibility() {
            if ($this->_m_visibility !== null)
                return $this->_m_visibility;
            $this->_m_visibility = ($this->other() & 3);
            return $this->_m_visibility;
        }
        protected $_m_value;
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $this->_m_value = ($this->_root()->bits() == \Elf\Bits::B32 ? $this->valueB32() : ($this->_root()->bits() == \Elf\Bits::B64 ? $this->valueB64() : 0));
            return $this->_m_value;
        }
        protected $_m_name;
        public function name() {
            if ($this->_m_name !== null)
                return $this->_m_name;
            if ( (($this->ofsName() != 0) && ($this->_parent()->isStringTableLinked())) ) {
                $io = $this->_parent()->_parent()->linkedSection()->body()->_io();
                $_pos = $io->pos();
                $io->seek($this->ofsName());
                if ($this->_m__is_le) {
                    $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, true), "UTF-8");
                } else {
                    $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, true), "UTF-8");
                }
                $io->seek($_pos);
            }
            return $this->_m_name;
        }
        protected $_m_shIdxSpecial;
        public function shIdxSpecial() {
            if ($this->_m_shIdxSpecial !== null)
                return $this->_m_shIdxSpecial;
            $this->_m_shIdxSpecial = $this->shIdx();
            return $this->_m_shIdxSpecial;
        }
        protected $_m_ofsName;
        protected $_m_valueB32;
        protected $_m_sizeB32;
        protected $_m_bind;
        protected $_m_type;
        protected $_m_other;
        protected $_m_shIdx;
        protected $_m_valueB64;
        protected $_m_sizeB64;
        public function ofsName() { return $this->_m_ofsName; }
        public function valueB32() { return $this->_m_valueB32; }
        public function sizeB32() { return $this->_m_sizeB32; }
        public function bind() { return $this->_m_bind; }
        public function type() { return $this->_m_type; }

        /**
         * don't read this field, access `visibility` instead
         */
        public function other() { return $this->_m_other; }

        /**
         * section header index
         */
        public function shIdx() { return $this->_m_shIdx; }
        public function valueB64() { return $this->_m_valueB64; }
        public function sizeB64() { return $this->_m_sizeB64; }
    }
}

namespace Elf\EndianElf {
    class NoteSectionEntry extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, \Elf\EndianElf\NoteSection $_parent = null, \Elf $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_lenName = $this->_io->readU4le();
            $this->_m_lenDescriptor = $this->_io->readU4le();
            $this->_m_type = $this->_io->readU4le();
            $this->_m_name = \Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes($this->lenName()), 0, false);
            $this->_m_namePadding = $this->_io->readBytes(\Kaitai\Struct\Stream::mod(-($this->lenName()), 4));
            $this->_m_descriptor = $this->_io->readBytes($this->lenDescriptor());
            $this->_m_descriptorPadding = $this->_io->readBytes(\Kaitai\Struct\Stream::mod(-($this->lenDescriptor()), 4));
        }

        private function _readBE() {
            $this->_m_lenName = $this->_io->readU4be();
            $this->_m_lenDescriptor = $this->_io->readU4be();
            $this->_m_type = $this->_io->readU4be();
            $this->_m_name = \Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes($this->lenName()), 0, false);
            $this->_m_namePadding = $this->_io->readBytes(\Kaitai\Struct\Stream::mod(-($this->lenName()), 4));
            $this->_m_descriptor = $this->_io->readBytes($this->lenDescriptor());
            $this->_m_descriptorPadding = $this->_io->readBytes(\Kaitai\Struct\Stream::mod(-($this->lenDescriptor()), 4));
        }
        protected $_m_lenName;
        protected $_m_lenDescriptor;
        protected $_m_type;
        protected $_m_name;
        protected $_m_namePadding;
        protected $_m_descriptor;
        protected $_m_descriptorPadding;
        public function lenName() { return $this->_m_lenName; }
        public function lenDescriptor() { return $this->_m_lenDescriptor; }
        public function type() { return $this->_m_type; }

        /**
         * Although the ELF specification seems to hint that the `note_name` field
         * is ASCII this isn't the case for Linux binaries that have a
         * `.gnu.build.attributes` section.
         */
        public function name() { return $this->_m_name; }
        public function namePadding() { return $this->_m_namePadding; }
        public function descriptor() { return $this->_m_descriptor; }
        public function descriptorPadding() { return $this->_m_descriptorPadding; }
    }
}

namespace Elf\EndianElf {
    class StringsStruct extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Elf $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "UTF-8");
                $i++;
            }
        }

        private function _readBE() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "UTF-8");
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace Elf {
    class DtFlag1Values extends \Kaitai\Struct\Struct {
        public function __construct(int $value, \Kaitai\Struct\Stream $_io, \Elf\EndianElf\DynamicSectionEntry $_parent = null, \Elf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_value = $value;
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_singleton;

        /**
         * Singleton symbols are used.
         */
        public function singleton() {
            if ($this->_m_singleton !== null)
                return $this->_m_singleton;
            $this->_m_singleton = ($this->value() & 33554432) != 0;
            return $this->_m_singleton;
        }
        protected $_m_ignmuldef;
        public function ignmuldef() {
            if ($this->_m_ignmuldef !== null)
                return $this->_m_ignmuldef;
            $this->_m_ignmuldef = ($this->value() & 262144) != 0;
            return $this->_m_ignmuldef;
        }
        protected $_m_loadfltr;

        /**
         * Trigger filtee loading at runtime.
         */
        public function loadfltr() {
            if ($this->_m_loadfltr !== null)
                return $this->_m_loadfltr;
            $this->_m_loadfltr = ($this->value() & 16) != 0;
            return $this->_m_loadfltr;
        }
        protected $_m_initfirst;

        /**
         * Set RTLD_INITFIRST for this object
         */
        public function initfirst() {
            if ($this->_m_initfirst !== null)
                return $this->_m_initfirst;
            $this->_m_initfirst = ($this->value() & 32) != 0;
            return $this->_m_initfirst;
        }
        protected $_m_symintpose;

        /**
         * Object has individual interposers.
         */
        public function symintpose() {
            if ($this->_m_symintpose !== null)
                return $this->_m_symintpose;
            $this->_m_symintpose = ($this->value() & 8388608) != 0;
            return $this->_m_symintpose;
        }
        protected $_m_noreloc;
        public function noreloc() {
            if ($this->_m_noreloc !== null)
                return $this->_m_noreloc;
            $this->_m_noreloc = ($this->value() & 4194304) != 0;
            return $this->_m_noreloc;
        }
        protected $_m_confalt;

        /**
         * Configuration alternative created.
         */
        public function confalt() {
            if ($this->_m_confalt !== null)
                return $this->_m_confalt;
            $this->_m_confalt = ($this->value() & 8192) != 0;
            return $this->_m_confalt;
        }
        protected $_m_dispreldne;

        /**
         * Disp reloc applied at build time.
         */
        public function dispreldne() {
            if ($this->_m_dispreldne !== null)
                return $this->_m_dispreldne;
            $this->_m_dispreldne = ($this->value() & 32768) != 0;
            return $this->_m_dispreldne;
        }
        protected $_m_rtldGlobal;

        /**
         * Set RTLD_GLOBAL for this object.
         */
        public function rtldGlobal() {
            if ($this->_m_rtldGlobal !== null)
                return $this->_m_rtldGlobal;
            $this->_m_rtldGlobal = ($this->value() & 2) != 0;
            return $this->_m_rtldGlobal;
        }
        protected $_m_nodelete;

        /**
         * Set RTLD_NODELETE for this object.
         */
        public function nodelete() {
            if ($this->_m_nodelete !== null)
                return $this->_m_nodelete;
            $this->_m_nodelete = ($this->value() & 8) != 0;
            return $this->_m_nodelete;
        }
        protected $_m_trans;
        public function trans() {
            if ($this->_m_trans !== null)
                return $this->_m_trans;
            $this->_m_trans = ($this->value() & 512) != 0;
            return $this->_m_trans;
        }
        protected $_m_origin;

        /**
         * $ORIGIN must be handled.
         */
        public function origin() {
            if ($this->_m_origin !== null)
                return $this->_m_origin;
            $this->_m_origin = ($this->value() & 128) != 0;
            return $this->_m_origin;
        }
        protected $_m_now;

        /**
         * Set RTLD_NOW for this object.
         */
        public function now() {
            if ($this->_m_now !== null)
                return $this->_m_now;
            $this->_m_now = ($this->value() & 1) != 0;
            return $this->_m_now;
        }
        protected $_m_nohdr;
        public function nohdr() {
            if ($this->_m_nohdr !== null)
                return $this->_m_nohdr;
            $this->_m_nohdr = ($this->value() & 1048576) != 0;
            return $this->_m_nohdr;
        }
        protected $_m_endfiltee;

        /**
         * Filtee terminates filters search.
         */
        public function endfiltee() {
            if ($this->_m_endfiltee !== null)
                return $this->_m_endfiltee;
            $this->_m_endfiltee = ($this->value() & 16384) != 0;
            return $this->_m_endfiltee;
        }
        protected $_m_nodirect;

        /**
         * Object has no-direct binding.
         */
        public function nodirect() {
            if ($this->_m_nodirect !== null)
                return $this->_m_nodirect;
            $this->_m_nodirect = ($this->value() & 131072) != 0;
            return $this->_m_nodirect;
        }
        protected $_m_globaudit;

        /**
         * Global auditing required.
         */
        public function globaudit() {
            if ($this->_m_globaudit !== null)
                return $this->_m_globaudit;
            $this->_m_globaudit = ($this->value() & 16777216) != 0;
            return $this->_m_globaudit;
        }
        protected $_m_noksyms;
        public function noksyms() {
            if ($this->_m_noksyms !== null)
                return $this->_m_noksyms;
            $this->_m_noksyms = ($this->value() & 524288) != 0;
            return $this->_m_noksyms;
        }
        protected $_m_interpose;

        /**
         * Object is used to interpose.
         */
        public function interpose() {
            if ($this->_m_interpose !== null)
                return $this->_m_interpose;
            $this->_m_interpose = ($this->value() & 1024) != 0;
            return $this->_m_interpose;
        }
        protected $_m_nodump;

        /**
         * Object can't be dldump'ed.
         */
        public function nodump() {
            if ($this->_m_nodump !== null)
                return $this->_m_nodump;
            $this->_m_nodump = ($this->value() & 4096) != 0;
            return $this->_m_nodump;
        }
        protected $_m_disprelpnd;

        /**
         * Disp reloc applied at run-time.
         */
        public function disprelpnd() {
            if ($this->_m_disprelpnd !== null)
                return $this->_m_disprelpnd;
            $this->_m_disprelpnd = ($this->value() & 65536) != 0;
            return $this->_m_disprelpnd;
        }
        protected $_m_noopen;

        /**
         * Set RTLD_NOOPEN for this object.
         */
        public function noopen() {
            if ($this->_m_noopen !== null)
                return $this->_m_noopen;
            $this->_m_noopen = ($this->value() & 64) != 0;
            return $this->_m_noopen;
        }
        protected $_m_stub;
        public function stub() {
            if ($this->_m_stub !== null)
                return $this->_m_stub;
            $this->_m_stub = ($this->value() & 67108864) != 0;
            return $this->_m_stub;
        }
        protected $_m_direct;

        /**
         * Direct binding enabled.
         */
        public function direct() {
            if ($this->_m_direct !== null)
                return $this->_m_direct;
            $this->_m_direct = ($this->value() & 256) != 0;
            return $this->_m_direct;
        }
        protected $_m_edited;

        /**
         * Object is modified after built.
         */
        public function edited() {
            if ($this->_m_edited !== null)
                return $this->_m_edited;
            $this->_m_edited = ($this->value() & 2097152) != 0;
            return $this->_m_edited;
        }
        protected $_m_group;

        /**
         * Set RTLD_GROUP for this object.
         */
        public function group() {
            if ($this->_m_group !== null)
                return $this->_m_group;
            $this->_m_group = ($this->value() & 4) != 0;
            return $this->_m_group;
        }
        protected $_m_pie;
        public function pie() {
            if ($this->_m_pie !== null)
                return $this->_m_pie;
            $this->_m_pie = ($this->value() & 134217728) != 0;
            return $this->_m_pie;
        }
        protected $_m_nodeflib;

        /**
         * Ignore default lib search path.
         */
        public function nodeflib() {
            if ($this->_m_nodeflib !== null)
                return $this->_m_nodeflib;
            $this->_m_nodeflib = ($this->value() & 2048) != 0;
            return $this->_m_nodeflib;
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace Elf {
    class SectionHeaderFlags extends \Kaitai\Struct\Struct {
        public function __construct(int $value, \Kaitai\Struct\Stream $_io, \Elf\EndianElf\SectionHeader $_parent = null, \Elf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_value = $value;
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_merge;

        /**
         * might be merged
         */
        public function merge() {
            if ($this->_m_merge !== null)
                return $this->_m_merge;
            $this->_m_merge = ($this->value() & 16) != 0;
            return $this->_m_merge;
        }
        protected $_m_maskOs;

        /**
         * OS-specific
         */
        public function maskOs() {
            if ($this->_m_maskOs !== null)
                return $this->_m_maskOs;
            $this->_m_maskOs = ($this->value() & 267386880) != 0;
            return $this->_m_maskOs;
        }
        protected $_m_exclude;

        /**
         * section is excluded unless referenced or allocated (Solaris)
         */
        public function exclude() {
            if ($this->_m_exclude !== null)
                return $this->_m_exclude;
            $this->_m_exclude = ($this->value() & 134217728) != 0;
            return $this->_m_exclude;
        }
        protected $_m_maskProc;

        /**
         * Processor-specific
         */
        public function maskProc() {
            if ($this->_m_maskProc !== null)
                return $this->_m_maskProc;
            $this->_m_maskProc = ($this->value() & 4026531840) != 0;
            return $this->_m_maskProc;
        }
        protected $_m_strings;

        /**
         * contains nul-terminated strings
         */
        public function strings() {
            if ($this->_m_strings !== null)
                return $this->_m_strings;
            $this->_m_strings = ($this->value() & 32) != 0;
            return $this->_m_strings;
        }
        protected $_m_osNonConforming;

        /**
         * non-standard OS specific handling required
         */
        public function osNonConforming() {
            if ($this->_m_osNonConforming !== null)
                return $this->_m_osNonConforming;
            $this->_m_osNonConforming = ($this->value() & 256) != 0;
            return $this->_m_osNonConforming;
        }
        protected $_m_alloc;

        /**
         * occupies memory during execution
         */
        public function alloc() {
            if ($this->_m_alloc !== null)
                return $this->_m_alloc;
            $this->_m_alloc = ($this->value() & 2) != 0;
            return $this->_m_alloc;
        }
        protected $_m_execInstr;

        /**
         * executable
         */
        public function execInstr() {
            if ($this->_m_execInstr !== null)
                return $this->_m_execInstr;
            $this->_m_execInstr = ($this->value() & 4) != 0;
            return $this->_m_execInstr;
        }
        protected $_m_infoLink;

        /**
         * 'sh_info' contains SHT index
         */
        public function infoLink() {
            if ($this->_m_infoLink !== null)
                return $this->_m_infoLink;
            $this->_m_infoLink = ($this->value() & 64) != 0;
            return $this->_m_infoLink;
        }
        protected $_m_write;

        /**
         * writable
         */
        public function write() {
            if ($this->_m_write !== null)
                return $this->_m_write;
            $this->_m_write = ($this->value() & 1) != 0;
            return $this->_m_write;
        }
        protected $_m_linkOrder;

        /**
         * preserve order after combining
         */
        public function linkOrder() {
            if ($this->_m_linkOrder !== null)
                return $this->_m_linkOrder;
            $this->_m_linkOrder = ($this->value() & 128) != 0;
            return $this->_m_linkOrder;
        }
        protected $_m_ordered;

        /**
         * special ordering requirement (Solaris)
         */
        public function ordered() {
            if ($this->_m_ordered !== null)
                return $this->_m_ordered;
            $this->_m_ordered = ($this->value() & 67108864) != 0;
            return $this->_m_ordered;
        }
        protected $_m_tls;

        /**
         * section hold thread-local data
         */
        public function tls() {
            if ($this->_m_tls !== null)
                return $this->_m_tls;
            $this->_m_tls = ($this->value() & 1024) != 0;
            return $this->_m_tls;
        }
        protected $_m_group;

        /**
         * section is member of a group
         */
        public function group() {
            if ($this->_m_group !== null)
                return $this->_m_group;
            $this->_m_group = ($this->value() & 512) != 0;
            return $this->_m_group;
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace Elf {
    class PhdrTypeFlags extends \Kaitai\Struct\Struct {
        public function __construct(int $value, \Kaitai\Struct\Stream $_io, \Elf\EndianElf\ProgramHeader $_parent = null, \Elf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_value = $value;
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_read;
        public function read() {
            if ($this->_m_read !== null)
                return $this->_m_read;
            $this->_m_read = ($this->value() & 4) != 0;
            return $this->_m_read;
        }
        protected $_m_write;
        public function write() {
            if ($this->_m_write !== null)
                return $this->_m_write;
            $this->_m_write = ($this->value() & 2) != 0;
            return $this->_m_write;
        }
        protected $_m_execute;
        public function execute() {
            if ($this->_m_execute !== null)
                return $this->_m_execute;
            $this->_m_execute = ($this->value() & 1) != 0;
            return $this->_m_execute;
        }
        protected $_m_maskProc;
        public function maskProc() {
            if ($this->_m_maskProc !== null)
                return $this->_m_maskProc;
            $this->_m_maskProc = ($this->value() & 4026531840) != 0;
            return $this->_m_maskProc;
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace Elf {
    class DtFlagValues extends \Kaitai\Struct\Struct {
        public function __construct(int $value, \Kaitai\Struct\Stream $_io, \Elf\EndianElf\DynamicSectionEntry $_parent = null, \Elf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_value = $value;
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_bindNow;

        /**
         * all relocations for this object must be processed before returning
         * control to the program
         */
        public function bindNow() {
            if ($this->_m_bindNow !== null)
                return $this->_m_bindNow;
            $this->_m_bindNow = ($this->value() & 8) != 0;
            return $this->_m_bindNow;
        }
        protected $_m_origin;

        /**
         * object may reference the $ORIGIN substitution string
         */
        public function origin() {
            if ($this->_m_origin !== null)
                return $this->_m_origin;
            $this->_m_origin = ($this->value() & 1) != 0;
            return $this->_m_origin;
        }
        protected $_m_textrel;

        /**
         * relocation entries might request modifications to a non-writable segment
         */
        public function textrel() {
            if ($this->_m_textrel !== null)
                return $this->_m_textrel;
            $this->_m_textrel = ($this->value() & 4) != 0;
            return $this->_m_textrel;
        }
        protected $_m_staticTls;

        /**
         * object uses static thread-local storage scheme
         */
        public function staticTls() {
            if ($this->_m_staticTls !== null)
                return $this->_m_staticTls;
            $this->_m_staticTls = ($this->value() & 16) != 0;
            return $this->_m_staticTls;
        }
        protected $_m_symbolic;

        /**
         * symbolic linking
         */
        public function symbolic() {
            if ($this->_m_symbolic !== null)
                return $this->_m_symbolic;
            $this->_m_symbolic = ($this->value() & 2) != 0;
            return $this->_m_symbolic;
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace Elf {
    class SymbolVisibility {
        const DEFAULT = 0;
        const INTERNAL = 1;
        const HIDDEN = 2;
        const PROTECTED = 3;
        const EXPORTED = 4;
        const SINGLETON = 5;
        const ELIMINATE = 6;
    }
}

namespace Elf {
    class SymbolBinding {

        /**
         * not visible outside the object file containing their definition
         */
        const LOCAL = 0;

        /**
         * visible to all object files being combined
         * 
         * As of KSC 0.9, this enum key can't be called `global` because it would
         * cause a syntax error in Python (it is a keyword).
         */
        const GLOBAL_SYMBOL = 1;

        /**
         * like `symbol_binding::global_symbol`, but their definitions have lower precedence
         */
        const WEAK = 2;

        /**
         * reserved for operating system-specific semantics
         */
        const OS10 = 10;

        /**
         * reserved for operating system-specific semantics
         */
        const OS11 = 11;

        /**
         * reserved for operating system-specific semantics
         */
        const OS12 = 12;

        /**
         * reserved for processor-specific semantics
         */
        const PROC13 = 13;

        /**
         * reserved for processor-specific semantics
         */
        const PROC14 = 14;

        /**
         * reserved for processor-specific semantics
         */
        const PROC15 = 15;
    }
}

namespace Elf {
    class Endian {
        const LE = 1;
        const BE = 2;
    }
}

namespace Elf {
    class ShType {
        const NULL_TYPE = 0;
        const PROGBITS = 1;
        const SYMTAB = 2;
        const STRTAB = 3;
        const RELA = 4;
        const HASH = 5;
        const DYNAMIC = 6;
        const NOTE = 7;
        const NOBITS = 8;
        const REL = 9;
        const SHLIB = 10;
        const DYNSYM = 11;
        const INIT_ARRAY = 14;
        const FINI_ARRAY = 15;
        const PREINIT_ARRAY = 16;
        const GROUP = 17;
        const SYMTAB_SHNDX = 18;
        const RELR = 19;
        const SUNW_SYMNSORT = 1879048172;
        const SUNW_PHNAME = 1879048173;
        const SUNW_ANCILLARY = 1879048174;
        const SUNW_CAPCHAIN = 1879048175;
        const SUNW_CAPINFO = 1879048176;
        const SUNW_SYMSORT = 1879048177;
        const SUNW_TLSSORT = 1879048178;
        const SUNW_LDYNSYM = 1879048179;
        const SUNW_DOF = 1879048180;
        const SUNW_CAP = 1879048181;
        const SUNW_SIGNATURE = 1879048182;
        const SUNW_ANNOTATE = 1879048183;
        const SUNW_DEBUGSTR = 1879048184;
        const SUNW_DEBUG = 1879048185;
        const SUNW_MOVE = 1879048186;
        const SUNW_COMDAT = 1879048187;
        const SUNW_SYMINFO = 1879048188;
        const SUNW_VERDEF = 1879048189;
        const SUNW_VERNEED = 1879048190;
        const SUNW_VERSYM = 1879048191;
        const SPARC_GOTDATA = 1879048192;
        const AMD64_UNWIND = 1879048193;
        const ARM_PREEMPTMAP = 1879048194;
        const ARM_ATTRIBUTES = 1879048195;
        const ARM_DEBUGOVERLAY = 1879048196;
        const ARM_OVERLAYSECTION = 1879048197;
    }
}

namespace Elf {
    class OsAbi {
        const SYSTEM_V = 0;
        const HP_UX = 1;
        const NETBSD = 2;
        const GNU = 3;
        const SOLARIS = 6;
        const AIX = 7;
        const IRIX = 8;
        const FREEBSD = 9;
        const TRU64 = 10;
        const MODESTO = 11;
        const OPENBSD = 12;
        const OPENVMS = 13;
        const NSK = 14;
        const AROS = 15;
        const FENIXOS = 16;
        const CLOUDABI = 17;
        const OPENVOS = 18;
    }
}

namespace Elf {
    class Machine {

        /**
         * No machine
         */
        const NO_MACHINE = 0;

        /**
         * AT&T WE 32100
         */
        const M32 = 1;

        /**
         * Sun SPARC
         */
        const SPARC = 2;

        /**
         * Intel 80386
         */
        const X86 = 3;

        /**
         * Motorola m68k family
         */
        const M68K = 4;

        /**
         * Motorola m88k family
         */
        const M88K = 5;

        /**
         * Intel MCU
         * 
         * was assigned to `EM_486` (for Intel i486), but that value was deprecated
         * and replaced with this one
         */
        const IAMCU = 6;

        /**
         * Intel 80860
         */
        const I860 = 7;

        /**
         * MIPS R3000 big-endian
         */
        const MIPS = 8;

        /**
         * IBM System/370
         */
        const S370 = 9;

        /**
         * MIPS R3000 little-endian
         */
        const MIPS_RS3_LE = 10;

        /**
         * Hewlett-Packard PA-RISC
         */
        const PARISC = 15;

        /**
         * Fujitsu VPP500
         */
        const VPP500 = 17;

        /**
         * Sun's "v8plus"
         */
        const SPARC32PLUS = 18;

        /**
         * Intel 80960
         */
        const I960 = 19;

        /**
         * PowerPC
         */
        const POWERPC = 20;

        /**
         * PowerPC 64-bit
         */
        const POWERPC64 = 21;

        /**
         * IBM System/390
         */
        const S390 = 22;

        /**
         * IBM SPU/SPC
         */
        const SPU = 23;

        /**
         * NEC V800 series
         */
        const V800 = 36;

        /**
         * Fujitsu FR20
         */
        const FR20 = 37;

        /**
         * TRW RH-32
         */
        const RH32 = 38;

        /**
         * Motorola RCE
         */
        const RCE = 39;

        /**
         * ARM
         */
        const ARM = 40;

        /**
         * DEC Alpha
         */
        const OLD_ALPHA = 41;

        /**
         * Hitachi SH
         */
        const SUPERH = 42;

        /**
         * SPARC v9 64-bit
         */
        const SPARC_V9 = 43;

        /**
         * Siemens TriCore
         */
        const TRICORE = 44;

        /**
         * Argonaut RISC Core
         */
        const ARC = 45;

        /**
         * Hitachi H8/300
         */
        const H8_300 = 46;

        /**
         * Hitachi H8/300H
         */
        const H8_300H = 47;

        /**
         * Hitachi H8S
         */
        const H8S = 48;

        /**
         * Hitachi H8/500
         */
        const H8_500 = 49;

        /**
         * Intel IA-64 processor architecture
         */
        const IA_64 = 50;

        /**
         * Stanford MIPS-X
         */
        const MIPS_X = 51;

        /**
         * Motorola ColdFire
         */
        const COLDFIRE = 52;

        /**
         * Motorola M68HC12
         */
        const M68HC12 = 53;

        /**
         * Fujitsu MMA Multimedia Accelerator
         */
        const MMA = 54;

        /**
         * Siemens PCP
         */
        const PCP = 55;

        /**
         * Sony nCPU embedded RISC processor
         */
        const NCPU = 56;

        /**
         * Denso NDR1 microprocessor
         */
        const NDR1 = 57;

        /**
         * Motorola Star*Core processor
         */
        const STARCORE = 58;

        /**
         * Toyota ME16 processor
         */
        const ME16 = 59;

        /**
         * STMicroelectronics ST100 processor
         */
        const ST100 = 60;

        /**
         * Advanced Logic Corp. TinyJ embedded processor family
         */
        const TINYJ = 61;

        /**
         * AMD x86-64 architecture
         */
        const X86_64 = 62;

        /**
         * Sony DSP Processor
         */
        const PDSP = 63;

        /**
         * Digital Equipment Corp. PDP-10
         */
        const PDP10 = 64;

        /**
         * Digital Equipment Corp. PDP-11
         */
        const PDP11 = 65;

        /**
         * Siemens FX66 microcontroller
         */
        const FX66 = 66;

        /**
         * STMicroelectronics ST9+ 8/16 bit microcontroller
         */
        const ST9PLUS = 67;

        /**
         * STMicroelectronics ST7 8-bit microcontroller
         */
        const ST7 = 68;

        /**
         * Motorola MC68HC16 microcontroller
         */
        const MC68HC16 = 69;

        /**
         * Motorola MC68HC11 microcontroller
         */
        const MC68HC11 = 70;

        /**
         * Motorola MC68HC08 microcontroller
         */
        const MC68HC08 = 71;

        /**
         * Motorola MC68HC05 microcontroller
         */
        const MC68HC05 = 72;

        /**
         * Silicon Graphics SVx
         */
        const SVX = 73;

        /**
         * STMicroelectronics ST19 8-bit microcontroller
         */
        const ST19 = 74;

        /**
         * Digital VAX
         */
        const VAX = 75;

        /**
         * Axis Communications 32-bit embedded processor
         */
        const CRIS = 76;

        /**
         * Infineon Technologies 32-bit embedded processor
         */
        const JAVELIN = 77;

        /**
         * Element 14 64-bit DSP Processor
         */
        const FIREPATH = 78;

        /**
         * LSI Logic 16-bit DSP Processor
         */
        const ZSP = 79;

        /**
         * Donald Knuth's educational 64-bit processor
         */
        const MMIX = 80;

        /**
         * Harvard University machine-independent object files
         */
        const HUANY = 81;

        /**
         * SiTera Prism
         */
        const PRISM = 82;

        /**
         * Atmel AVR 8-bit microcontroller
         */
        const AVR = 83;

        /**
         * Fujitsu FR30
         */
        const FR30 = 84;

        /**
         * Mitsubishi D10V
         */
        const D10V = 85;

        /**
         * Mitsubishi D30V
         */
        const D30V = 86;

        /**
         * NEC v850
         */
        const V850 = 87;

        /**
         * Mitsubishi M32R
         */
        const M32R = 88;

        /**
         * Matsushita MN10300
         */
        const MN10300 = 89;

        /**
         * Matsushita MN10200
         */
        const MN10200 = 90;

        /**
         * picoJava
         */
        const PICOJAVA = 91;

        /**
         * OpenRISC 32-bit embedded processor
         */
        const OPENRISC = 92;

        /**
         * ARC International ARCompact processor (old spelling/synonym: EM_ARC_A5)
         */
        const ARC_COMPACT = 93;

        /**
         * Tensilica Xtensa Architecture
         */
        const XTENSA = 94;

        /**
         * Alphamosaic VideoCore processor
         */
        const VIDEOCORE = 95;

        /**
         * Thompson Multimedia General Purpose Processor
         */
        const TMM_GPP = 96;

        /**
         * National Semiconductor 32000 series
         */
        const NS32K = 97;

        /**
         * Tenor Network TPC processor
         */
        const TPC = 98;

        /**
         * Trebia SNP 1000 processor
         */
        const SNP1K = 99;

        /**
         * STMicroelectronics ST200
         */
        const ST200 = 100;

        /**
         * Ubicom IP2xxx microcontroller family
         */
        const IP2K = 101;

        /**
         * MAX processor
         */
        const MAX = 102;

        /**
         * National Semiconductor CompactRISC microprocessor
         */
        const COMPACT_RISC = 103;

        /**
         * Fujitsu F2MC16
         */
        const F2MC16 = 104;

        /**
         * Texas Instruments embedded microcontroller MSP430
         */
        const MSP430 = 105;

        /**
         * Analog Devices Blackfin (DSP) processor
         */
        const BLACKFIN = 106;

        /**
         * Seiko Epson S1C33 family
         */
        const SE_C33 = 107;

        /**
         * Sharp embedded microprocessor
         */
        const SEP = 108;

        /**
         * Arca RISC microprocessor
         */
        const ARCA = 109;

        /**
         * microprocessor series from PKU-Unity Ltd. and MPRC of Peking University
         */
        const UNICORE = 110;

        /**
         * eXcess: 16/32/64-bit configurable embedded CPU
         */
        const EXCESS = 111;

        /**
         * Icera Semiconductor Inc. Deep Execution Processor
         */
        const DXP = 112;

        /**
         * Altera Nios II soft-core processor
         */
        const ALTERA_NIOS2 = 113;

        /**
         * National Semiconductor CompactRISC CRX microprocessor
         */
        const CRX = 114;

        /**
         * Motorola XGATE embedded processor
         */
        const XGATE = 115;

        /**
         * Infineon C16x/XC16x processor
         */
        const C166 = 116;

        /**
         * Renesas M16C series microprocessors
         */
        const M16C = 117;

        /**
         * Microchip Technology dsPIC30F Digital Signal Controller
         */
        const DSPIC30F = 118;

        /**
         * Freescale Communication Engine RISC core
         */
        const FREESCALE_CE = 119;

        /**
         * Renesas M32C series microprocessors
         */
        const M32C = 120;

        /**
         * Altium TSK3000 core
         */
        const TSK3000 = 131;

        /**
         * Freescale RS08 embedded processor
         */
        const RS08 = 132;

        /**
         * Analog Devices SHARC family of 32-bit DSP processors
         */
        const SHARC = 133;

        /**
         * Cyan Technology eCOG2 microprocessor
         */
        const ECOG2 = 134;

        /**
         * Sunplus S+core7 RISC processor
         */
        const SCORE7 = 135;

        /**
         * New Japan Radio (NJR) 24-bit DSP Processor
         */
        const DSP24 = 136;

        /**
         * Broadcom VideoCore III processor
         */
        const VIDEOCORE3 = 137;

        /**
         * RISC processor for Lattice FPGA architecture
         */
        const LATTICEMICO32 = 138;

        /**
         * Seiko Epson C17 family
         */
        const SE_C17 = 139;

        /**
         * Texas Instruments TMS320C6000 DSP family
         */
        const TI_C6000 = 140;

        /**
         * Texas Instruments TMS320C2000 DSP family
         */
        const TI_C2000 = 141;

        /**
         * Texas Instruments TMS320C55x DSP family
         */
        const TI_C5500 = 142;

        /**
         * Texas Instruments Application Specific RISC Processor, 32bit fetch
         */
        const TI_ARP32 = 143;

        /**
         * Texas Instruments Programmable Realtime Unit
         */
        const TI_PRU = 144;

        /**
         * STMicroelectronics 64bit VLIW Data Signal Processor
         */
        const MMDSP_PLUS = 160;

        /**
         * Cypress M8C microprocessor
         */
        const CYPRESS_M8C = 161;

        /**
         * Renesas R32C series microprocessors
         */
        const R32C = 162;

        /**
         * NXP Semiconductors TriMedia architecture family
         */
        const TRIMEDIA = 163;

        /**
         * Qualcomm Hexagon processor
         */
        const QDSP6 = 164;

        /**
         * Intel 8051 and variants
         */
        const I8051 = 165;

        /**
         * STMicroelectronics STxP7x family of configurable and extensible RISC processors
         */
        const STXP7X = 166;

        /**
         * Andes Technology compact code size embedded RISC processor family
         */
        const NDS32 = 167;

        /**
         * Cyan Technology eCOG1X family
         */
        const ECOG1X = 168;

        /**
         * Dallas Semiconductor MAXQ30 Core Micro-controllers
         */
        const MAXQ30 = 169;

        /**
         * New Japan Radio (NJR) 16-bit DSP Processor
         */
        const XIMO16 = 170;

        /**
         * M2000 Reconfigurable RISC Microprocessor
         */
        const MANIK = 171;

        /**
         * Cray Inc. NV2 vector architecture
         */
        const CRAYNV2 = 172;

        /**
         * Renesas RX family
         */
        const RX = 173;

        /**
         * Imagination Technologies META processor architecture
         */
        const METAG = 174;

        /**
         * MCST Elbrus general purpose hardware architecture
         */
        const MCST_ELBRUS = 175;

        /**
         * Cyan Technology eCOG16 family
         */
        const ECOG16 = 176;

        /**
         * National Semiconductor CompactRISC CR16 16-bit microprocessor
         */
        const CR16 = 177;

        /**
         * Freescale Extended Time Processing Unit
         */
        const ETPU = 178;

        /**
         * Infineon Technologies SLE9X core
         */
        const SLE9X = 179;

        /**
         * Intel L10M
         */
        const L10M = 180;

        /**
         * Intel K10M
         */
        const K10M = 181;

        /**
         * ARM AArch64
         */
        const AARCH64 = 183;

        /**
         * Atmel Corporation 32-bit microprocessor family
         */
        const AVR32 = 185;

        /**
         * STMicroeletronics STM8 8-bit microcontroller
         */
        const STM8 = 186;

        /**
         * Tilera TILE64 multicore architecture family
         */
        const TILE64 = 187;

        /**
         * Tilera TILEPro multicore architecture family
         */
        const TILEPRO = 188;

        /**
         * Xilinx MicroBlaze 32-bit RISC soft processor core
         */
        const MICROBLAZE = 189;

        /**
         * NVIDIA CUDA architecture
         */
        const CUDA = 190;

        /**
         * Tilera TILE-Gx multicore architecture family
         */
        const TILEGX = 191;

        /**
         * CloudShield architecture family
         */
        const CLOUDSHIELD = 192;

        /**
         * KIPO-KAIST Core-A 1st generation processor family
         */
        const COREA_1ST = 193;

        /**
         * KIPO-KAIST Core-A 2nd generation processor family
         */
        const COREA_2ND = 194;

        /**
         * Synopsys ARCv2 ISA
         */
        const ARCV2 = 195;

        /**
         * Open8 8-bit RISC soft processor core
         */
        const OPEN8 = 196;

        /**
         * Renesas RL78 family
         */
        const RL78 = 197;

        /**
         * Broadcom VideoCore V processor
         */
        const VIDEOCORE5 = 198;

        /**
         * Renesas 78KOR family
         */
        const RENESAS_78KOR = 199;

        /**
         * Freescale 56800EX Digital Signal Controller (DSC)
         */
        const FREESCALE_56800EX = 200;

        /**
         * Beyond BA1 CPU architecture
         */
        const BA1 = 201;

        /**
         * Beyond BA2 CPU architecture
         */
        const BA2 = 202;

        /**
         * XMOS xCORE processor family
         */
        const XCORE = 203;

        /**
         * Microchip 8-bit PIC(r) family
         */
        const MCHP_PIC = 204;

        /**
         * Intel Graphics Technology
         */
        const INTELGT = 205;

        /**
         * Reserved by Intel
         */
        const INTEL206 = 206;

        /**
         * Reserved by Intel
         */
        const INTEL207 = 207;

        /**
         * Reserved by Intel
         */
        const INTEL208 = 208;

        /**
         * Reserved by Intel
         */
        const INTEL209 = 209;

        /**
         * KM211 KM32 32-bit processor
         */
        const KM32 = 210;

        /**
         * KM211 KMX32 32-bit processor
         */
        const KMX32 = 211;

        /**
         * KM211 KMX16 16-bit processor
         */
        const KMX16 = 212;

        /**
         * KM211 KMX8 8-bit processor
         */
        const KMX8 = 213;

        /**
         * KM211 KVARC processor
         */
        const KVARC = 214;

        /**
         * Paneve CDP architecture family
         */
        const CDP = 215;

        /**
         * Cognitive Smart Memory Processor
         */
        const COGE = 216;

        /**
         * Bluechip Systems CoolEngine
         */
        const COOL = 217;

        /**
         * Nanoradio Optimized RISC
         */
        const NORC = 218;

        /**
         * CSR Kalimba architecture family
         */
        const CSR_KALIMBA = 219;

        /**
         * Zilog Z80
         */
        const Z80 = 220;

        /**
         * Controls and Data Services VISIUMcore
         */
        const VISIUM = 221;

        /**
         * FTDI Chip FT32
         */
        const FT32 = 222;

        /**
         * Moxie processor
         */
        const MOXIE = 223;

        /**
         * AMD GPU architecture
         */
        const AMD_GPU = 224;

        /**
         * RISC-V
         */
        const RISCV = 243;

        /**
         * Lanai 32-bit processor
         */
        const LANAI = 244;

        /**
         * CEVA Processor Architecture Family
         */
        const CEVA = 245;

        /**
         * CEVA X2 Processor Family
         */
        const CEVA_X2 = 246;

        /**
         * Linux BPF - in-kernel virtual machine
         */
        const BPF = 247;

        /**
         * Graphcore Intelligent Processing Unit
         */
        const GRAPHCORE_IPU = 248;

        /**
         * Imagination Technologies
         */
        const IMG1 = 249;

        /**
         * Netronome Flow Processor (NFP)
         */
        const NFP = 250;

        /**
         * NEC SX-Aurora Vector Engine (VE) processor
         */
        const VE = 251;

        /**
         * C-SKY 32-bit processor
         */
        const CSKY = 252;

        /**
         * Synopsys ARCv3 64-bit ISA/HS6x cores
         */
        const ARC_COMPACT3_64 = 253;

        /**
         * MOS Technology MCS 6502 processor
         */
        const MCS6502 = 254;

        /**
         * Synopsys ARCv3 32-bit
         */
        const ARC_COMPACT3 = 255;

        /**
         * Kalray VLIW core of the MPPA processor family
         */
        const KVX = 256;

        /**
         * WDC 65816/65C816
         */
        const WDC65816 = 257;

        /**
         * LoongArch
         */
        const LOONGARCH = 258;

        /**
         * ChipON KungFu32
         */
        const KF32 = 259;

        /**
         * LAPIS nX-U16/U8
         */
        const U16_U8CORE = 260;

        /**
         * Tachyum
         */
        const TACHYUM = 261;

        /**
         * NXP 56800EF Digital Signal Controller (DSC)
         */
        const NXP_56800EF = 262;
        const AVR_OLD = 4183;
        const MSP430_OLD = 4185;

        /**
         * Adapteva's Epiphany architecture.
         */
        const ADAPTEVA_EPIPHANY = 4643;

        /**
         * Morpho MT
         */
        const MT = 9520;
        const CYGNUS_FR30 = 13104;

        /**
         * Unofficial value for Web Assembly binaries, as used by LLVM.
         */
        const WEBASSEMBLY = 16727;

        /**
         * Infineon Technologies 16-bit microcontroller with C166-V2 core
         */
        const XC16X = 18056;

        /**
         * The Freescale toolchain generates elf files with this value.
         */
        const S12Z = 19951;
        const CYGNUS_FRV = 21569;

        /**
         * openDLX
         */
        const DLX = 23205;
        const CYGNUS_D10V = 30288;
        const CYGNUS_D30V = 30326;
        const IP2K_OLD = 33303;
        const CYGNUS_POWERPC = 36901;
        const ALPHA = 36902;
        const CYGNUS_M32R = 36929;
        const CYGNUS_V850 = 36992;
        const S390_OLD = 41872;
        const XTENSA_OLD = 43975;
        const XSTORMY16 = 44357;
        const MICROBLAZE_OLD = 47787;
        const CYGNUS_MN10300 = 48879;
        const CYGNUS_MN10200 = 57005;

        /**
         * Toshiba MeP
         */
        const CYGNUS_MEP = 61453;

        /**
         * Renesas M32C and M16C
         */
        const M32C_OLD = 65200;

        /**
         * Vitesse IQ2000
         */
        const IQ2000 = 65210;
        const NIOS32 = 65211;

        /**
         * Old, unofficial value for Moxie
         */
        const MOXIE_OLD = 65261;
    }
}

namespace Elf {
    class SymbolType {
        const NO_TYPE = 0;

        /**
         * associated with a data object, such as a variable, an array, and so on
         */
        const OBJECT = 1;

        /**
         * associated with a function or other executable code
         */
        const FUNC = 2;

        /**
         * associated with a section
         */
        const SECTION = 3;

        /**
         * symbol's name gives the name of the source file associated with the object file
         */
        const FILE = 4;

        /**
         * labels an uninitialized common block
         */
        const COMMON = 5;

        /**
         * specifies a thread-local storage entity
         */
        const TLS = 6;

        /**
         * complex relocation expression
         */
        const RELC = 8;

        /**
         * signed complex relocation expression
         */
        const SRELC = 9;

        /**
         * reserved for OS-specific semantics
         * 
         * `STT_GNU_IFUNC` is a GNU extension to ELF format that adds support for "indirect functions"
         */
        const GNU_IFUNC = 10;

        /**
         * reserved for OS-specific semantics
         */
        const OS11 = 11;

        /**
         * reserved for OS-specific semantics
         */
        const OS12 = 12;

        /**
         * reserved for processor-specific semantics
         */
        const PROC13 = 13;

        /**
         * reserved for processor-specific semantics
         */
        const PROC14 = 14;

        /**
         * reserved for processor-specific semantics
         */
        const PROC15 = 15;
    }
}

namespace Elf {
    class DynamicArrayTags {
        const NULL = 0;
        const NEEDED = 1;
        const PLTRELSZ = 2;
        const PLTGOT = 3;
        const HASH = 4;
        const STRTAB = 5;
        const SYMTAB = 6;
        const RELA = 7;
        const RELASZ = 8;
        const RELAENT = 9;
        const STRSZ = 10;
        const SYMENT = 11;
        const INIT = 12;
        const FINI = 13;
        const SONAME = 14;
        const RPATH = 15;
        const SYMBOLIC = 16;
        const REL = 17;
        const RELSZ = 18;
        const RELENT = 19;
        const PLTREL = 20;
        const DEBUG = 21;
        const TEXTREL = 22;
        const JMPREL = 23;
        const BIND_NOW = 24;
        const INIT_ARRAY = 25;
        const FINI_ARRAY = 26;
        const INIT_ARRAYSZ = 27;
        const FINI_ARRAYSZ = 28;
        const RUNPATH = 29;
        const FLAGS = 30;
        const PREINIT_ARRAY = 32;
        const PREINIT_ARRAYSZ = 33;
        const SYMTAB_SHNDX = 34;
        const RELRSZ = 35;
        const RELR = 36;
        const RELRENT = 37;

        /**
         * DT_SPARC_REGISTER was originally assigned 0x7000001. It is processor
         * specific, and should have been in the range DT_LOPROC-DT_HIPROC
         * instead of here. When the error was fixed,
         * DT_DEPRECATED_SPARC_REGISTER was created to maintain backward
         * compatability.
         */
        const DEPRECATED_SPARC_REGISTER = 117440513;
        const SUNW_AUXILIARY = 1610612749;
        const SUNW_RTLDINF = 1610612750;

        /**
         * Note: <https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html#GUID-4336A69A-D905-4FCE-A398-80375A9E6464__CHAPTER6-TBL-52>
         * states that `DT_SUNW_FILTER` has the value `0x6000000e`, but this is
         * apparently only a human error - that would make the value collide with
         * the previous one (`DT_SUNW_RTLDINF`) and there is not even a single
         * source supporting this other than verbatim copies of the same table.
         */
        const SUNW_FILTER = 1610612751;
        const SUNW_CAP = 1610612752;
        const SUNW_SYMTAB = 1610612753;
        const SUNW_SYMSZ = 1610612754;
        const SUNW_SORTENT = 1610612755;
        const SUNW_SYMSORT = 1610612756;
        const SUNW_SYMSORTSZ = 1610612757;
        const SUNW_TLSSORT = 1610612758;
        const SUNW_TLSSORTSZ = 1610612759;
        const SUNW_CAPINFO = 1610612760;
        const SUNW_STRPAD = 1610612761;
        const SUNW_CAPCHAIN = 1610612762;
        const SUNW_LDMACH = 1610612763;
        const SUNW_SYMTAB_SHNDX = 1610612764;
        const SUNW_CAPCHAINENT = 1610612765;
        const SUNW_DEFERRED = 1610612766;
        const SUNW_CAPCHAINSZ = 1610612767;
        const SUNW_PHNAME = 1610612768;
        const SUNW_PARENT = 1610612769;
        const SUNW_SX_ASLR = 1610612771;
        const SUNW_RELAX = 1610612773;
        const SUNW_KMOD = 1610612775;
        const SUNW_SX_NXHEAP = 1610612777;
        const SUNW_SX_NXSTACK = 1610612779;
        const SUNW_SX_ADIHEAP = 1610612781;
        const SUNW_SX_ADISTACK = 1610612783;
        const SUNW_SX_SSBD = 1610612785;
        const SUNW_SYMNSORT = 1610612786;
        const SUNW_SYMNSORTSZ = 1610612787;
        const GNU_FLAGS_1 = 1879047668;
        const GNU_PRELINKED = 1879047669;
        const GNU_CONFLICTSZ = 1879047670;
        const GNU_LIBLISTSZ = 1879047671;
        const CHECKSUM = 1879047672;
        const PLTPADSZ = 1879047673;
        const MOVEENT = 1879047674;
        const MOVESZ = 1879047675;
        const FEATURE_1 = 1879047676;
        const POSFLAG_1 = 1879047677;
        const SYMINSZ = 1879047678;
        const SYMINENT = 1879047679;
        const GNU_HASH = 1879047925;
        const TLSDESC_PLT = 1879047926;
        const TLSDESC_GOT = 1879047927;
        const GNU_CONFLICT = 1879047928;
        const GNU_LIBLIST = 1879047929;
        const CONFIG = 1879047930;
        const DEPAUDIT = 1879047931;
        const AUDIT = 1879047932;
        const PLTPAD = 1879047933;
        const MOVETAB = 1879047934;
        const SYMINFO = 1879047935;
        const VERSYM = 1879048176;
        const RELACOUNT = 1879048185;
        const RELCOUNT = 1879048186;
        const FLAGS_1 = 1879048187;
        const VERDEF = 1879048188;
        const VERDEFNUM = 1879048189;
        const VERNEED = 1879048190;
        const VERNEEDNUM = 1879048191;
        const SPARC_REGISTER = 1879048193;
        const AUXILIARY = 2147483645;
        const USED = 2147483646;
        const FILTER = 2147483647;
    }
}

namespace Elf {
    class Bits {
        const B32 = 1;
        const B64 = 2;
    }
}

namespace Elf {
    class PhType {
        const NULL_TYPE = 0;
        const LOAD = 1;
        const DYNAMIC = 2;
        const INTERP = 3;
        const NOTE = 4;
        const SHLIB = 5;
        const PHDR = 6;
        const TLS = 7;
        const GNU_EH_FRAME = 1685382480;
        const GNU_STACK = 1685382481;
        const GNU_RELRO = 1685382482;
        const GNU_PROPERTY = 1685382483;
        const PAX_FLAGS = 1694766464;
        const ARM_EXIDX = 1879048193;
    }
}

namespace Elf {
    class ObjType {
        const NO_FILE_TYPE = 0;
        const RELOCATABLE = 1;
        const EXECUTABLE = 2;
        const SHARED = 3;
        const CORE = 4;
    }
}

namespace Elf {
    class SectionHeaderIdxSpecial {
        const UNDEFINED = 0;
        const BEFORE = 65280;
        const AFTER = 65281;
        const AMD64_LCOMMON = 65282;
        const SUNW_IGNORE = 65343;
        const ABS = 65521;
        const COMMON = 65522;
        const XINDEX = 65535;
    }
}
