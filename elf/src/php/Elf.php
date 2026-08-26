<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class Elf extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Elf $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->_m_magic == "\x7F\x45\x4C\x46")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x7F\x45\x4C\x46", $this->_m_magic, $this->_io, "/seq/0");
            }
            $this->_m_bits = $this->_io->readU1();
            $this->_m_endian = $this->_io->readU1();
            $this->_m_eiVersion = $this->_io->readU1();
            if (!($this->_m_eiVersion == 1)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(1, $this->_m_eiVersion, $this->_io, "/seq/3");
            }
            $this->_m_abi = $this->_io->readU1();
            $this->_m_abiVersion = $this->_io->readU1();
            $this->_m_pad = $this->_io->readBytes(7);
            if (!($this->_m_pad == "\x00\x00\x00\x00\x00\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00\x00\x00\x00\x00\x00\x00", $this->_m_pad, $this->_io, "/seq/6");
            }
            $this->_m_header = new \Elf\EndianElf($this->_io, $this, $this->_root);
        }
        protected $_m_shIdxHiOs;
        public function shIdxHiOs() {
            if ($this->_m_shIdxHiOs !== null)
                return $this->_m_shIdxHiOs;
            $this->_m_shIdxHiOs = 65343;
            return $this->_m_shIdxHiOs;
        }
        protected $_m_shIdxHiProc;
        public function shIdxHiProc() {
            if ($this->_m_shIdxHiProc !== null)
                return $this->_m_shIdxHiProc;
            $this->_m_shIdxHiProc = 65311;
            return $this->_m_shIdxHiProc;
        }
        protected $_m_shIdxHiReserved;
        public function shIdxHiReserved() {
            if ($this->_m_shIdxHiReserved !== null)
                return $this->_m_shIdxHiReserved;
            $this->_m_shIdxHiReserved = 65535;
            return $this->_m_shIdxHiReserved;
        }
        protected $_m_shIdxLoOs;
        public function shIdxLoOs() {
            if ($this->_m_shIdxLoOs !== null)
                return $this->_m_shIdxLoOs;
            $this->_m_shIdxLoOs = 65312;
            return $this->_m_shIdxLoOs;
        }
        protected $_m_shIdxLoProc;
        public function shIdxLoProc() {
            if ($this->_m_shIdxLoProc !== null)
                return $this->_m_shIdxLoProc;
            $this->_m_shIdxLoProc = 65280;
            return $this->_m_shIdxLoProc;
        }
        protected $_m_shIdxLoReserved;
        public function shIdxLoReserved() {
            if ($this->_m_shIdxLoReserved !== null)
                return $this->_m_shIdxLoReserved;
            $this->_m_shIdxLoReserved = 65280;
            return $this->_m_shIdxLoReserved;
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
    class DtFlag1Values extends \Kaitai\Struct\Struct {
        public function __construct(int $value, \Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Elf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_value = $value;
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_confAlt;

        /**
         * Configuration alternative created.
         */
        public function confAlt() {
            if ($this->_m_confAlt !== null)
                return $this->_m_confAlt;
            $this->_m_confAlt = ($this->value() & 8192) != 0;
            return $this->_m_confAlt;
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
        protected $_m_dispRelDne;

        /**
         * Displacement relocation done (applied at build time).
         */
        public function dispRelDne() {
            if ($this->_m_dispRelDne !== null)
                return $this->_m_dispRelDne;
            $this->_m_dispRelDne = ($this->value() & 32768) != 0;
            return $this->_m_dispRelDne;
        }
        protected $_m_dispRelPnd;

        /**
         * Displacement relocation pending (applied at runtime).
         */
        public function dispRelPnd() {
            if ($this->_m_dispRelPnd !== null)
                return $this->_m_dispRelPnd;
            $this->_m_dispRelPnd = ($this->value() & 65536) != 0;
            return $this->_m_dispRelPnd;
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
        protected $_m_endFiltee;

        /**
         * Filtee terminates filters search.
         */
        public function endFiltee() {
            if ($this->_m_endFiltee !== null)
                return $this->_m_endFiltee;
            $this->_m_endFiltee = ($this->value() & 16384) != 0;
            return $this->_m_endFiltee;
        }
        protected $_m_globAudit;

        /**
         * Global auditing required.
         */
        public function globAudit() {
            if ($this->_m_globAudit !== null)
                return $this->_m_globAudit;
            $this->_m_globAudit = ($this->value() & 16777216) != 0;
            return $this->_m_globAudit;
        }
        protected $_m_group;

        /**
         * Set `RTLD_GROUP` for this object.
         */
        public function group() {
            if ($this->_m_group !== null)
                return $this->_m_group;
            $this->_m_group = ($this->value() & 4) != 0;
            return $this->_m_group;
        }
        protected $_m_ignMulDef;
        public function ignMulDef() {
            if ($this->_m_ignMulDef !== null)
                return $this->_m_ignMulDef;
            $this->_m_ignMulDef = ($this->value() & 262144) != 0;
            return $this->_m_ignMulDef;
        }
        protected $_m_initFirst;

        /**
         * Set `RTLD_INITFIRST` for this object.
         */
        public function initFirst() {
            if ($this->_m_initFirst !== null)
                return $this->_m_initFirst;
            $this->_m_initFirst = ($this->value() & 32) != 0;
            return $this->_m_initFirst;
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
        protected $_m_kmod;

        /**
         * Object is a kernel module.
         */
        public function kmod() {
            if ($this->_m_kmod !== null)
                return $this->_m_kmod;
            $this->_m_kmod = ($this->value() & 268435456) != 0;
            return $this->_m_kmod;
        }
        protected $_m_loadFltr;

        /**
         * Trigger filtee loading at runtime.
         */
        public function loadFltr() {
            if ($this->_m_loadFltr !== null)
                return $this->_m_loadFltr;
            $this->_m_loadFltr = ($this->value() & 16) != 0;
            return $this->_m_loadFltr;
        }
        protected $_m_noCommon;

        /**
         * No COMMON symbols exist.
         */
        public function noCommon() {
            if ($this->_m_noCommon !== null)
                return $this->_m_noCommon;
            $this->_m_noCommon = ($this->value() & 1073741824) != 0;
            return $this->_m_noCommon;
        }
        protected $_m_noDefLib;

        /**
         * Ignore the default library search path.
         */
        public function noDefLib() {
            if ($this->_m_noDefLib !== null)
                return $this->_m_noDefLib;
            $this->_m_noDefLib = ($this->value() & 2048) != 0;
            return $this->_m_noDefLib;
        }
        protected $_m_noDelete;

        /**
         * Set `RTLD_NODELETE` for this object.
         */
        public function noDelete() {
            if ($this->_m_noDelete !== null)
                return $this->_m_noDelete;
            $this->_m_noDelete = ($this->value() & 8) != 0;
            return $this->_m_noDelete;
        }
        protected $_m_noDirect;

        /**
         * Object contains non-direct bindings.
         */
        public function noDirect() {
            if ($this->_m_noDirect !== null)
                return $this->_m_noDirect;
            $this->_m_noDirect = ($this->value() & 131072) != 0;
            return $this->_m_noDirect;
        }
        protected $_m_noDump;

        /**
         * Object can't be dldump'ed.
         */
        public function noDump() {
            if ($this->_m_noDump !== null)
                return $this->_m_noDump;
            $this->_m_noDump = ($this->value() & 4096) != 0;
            return $this->_m_noDump;
        }
        protected $_m_noHdr;
        public function noHdr() {
            if ($this->_m_noHdr !== null)
                return $this->_m_noHdr;
            $this->_m_noHdr = ($this->value() & 1048576) != 0;
            return $this->_m_noHdr;
        }
        protected $_m_noKsyms;
        public function noKsyms() {
            if ($this->_m_noKsyms !== null)
                return $this->_m_noKsyms;
            $this->_m_noKsyms = ($this->value() & 524288) != 0;
            return $this->_m_noKsyms;
        }
        protected $_m_noOpen;

        /**
         * Set `RTLD_NOOPEN` for this object.
         */
        public function noOpen() {
            if ($this->_m_noOpen !== null)
                return $this->_m_noOpen;
            $this->_m_noOpen = ($this->value() & 64) != 0;
            return $this->_m_noOpen;
        }
        protected $_m_noReloc;
        public function noReloc() {
            if ($this->_m_noReloc !== null)
                return $this->_m_noReloc;
            $this->_m_noReloc = ($this->value() & 4194304) != 0;
            return $this->_m_noReloc;
        }
        protected $_m_now;

        /**
         * Set `RTLD_NOW` for this object.
         */
        public function now() {
            if ($this->_m_now !== null)
                return $this->_m_now;
            $this->_m_now = ($this->value() & 1) != 0;
            return $this->_m_now;
        }
        protected $_m_origin;

        /**
         * `$ORIGIN` must be handled.
         */
        public function origin() {
            if ($this->_m_origin !== null)
                return $this->_m_origin;
            $this->_m_origin = ($this->value() & 128) != 0;
            return $this->_m_origin;
        }
        protected $_m_pie;

        /**
         * Object is a Position Independent Executable (PIE).
         */
        public function pie() {
            if ($this->_m_pie !== null)
                return $this->_m_pie;
            $this->_m_pie = ($this->value() & 134217728) != 0;
            return $this->_m_pie;
        }
        protected $_m_rtldGlobal;

        /**
         * Set `RTLD_GLOBAL` for this object.
         */
        public function rtldGlobal() {
            if ($this->_m_rtldGlobal !== null)
                return $this->_m_rtldGlobal;
            $this->_m_rtldGlobal = ($this->value() & 2) != 0;
            return $this->_m_rtldGlobal;
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
        protected $_m_stub;

        /**
         * Object is a stub.
         * See [Stub Objects](https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/stub-objects.html).
         */
        public function stub() {
            if ($this->_m_stub !== null)
                return $this->_m_stub;
            $this->_m_stub = ($this->value() & 67108864) != 0;
            return $this->_m_stub;
        }
        protected $_m_symIntpose;

        /**
         * Object has individual symbol interposers.
         */
        public function symIntpose() {
            if ($this->_m_symIntpose !== null)
                return $this->_m_symIntpose;
            $this->_m_symIntpose = ($this->value() & 8388608) != 0;
            return $this->_m_symIntpose;
        }
        protected $_m_trans;
        public function trans() {
            if ($this->_m_trans !== null)
                return $this->_m_trans;
            $this->_m_trans = ($this->value() & 512) != 0;
            return $this->_m_trans;
        }
        protected $_m_weakFilter;

        /**
         * Object is a weak standard filter.
         */
        public function weakFilter() {
            if ($this->_m_weakFilter !== null)
                return $this->_m_weakFilter;
            $this->_m_weakFilter = ($this->value() & 536870912) != 0;
            return $this->_m_weakFilter;
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace Elf {
    class DtFlagValues extends \Kaitai\Struct\Struct {
        public function __construct(int $value, \Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Elf $_root = null) {
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
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace Elf {
    class EndianElf extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Elf $_parent = null, ?\Elf $_root = null) {
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
            if (!\Elf\Machine::isDefined($this->_m_machine)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_machine, $this->_io, "/types/endian_elf/seq/1");
            }
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
            if (!\Elf\Machine::isDefined($this->_m_machine)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_machine, $this->_io, "/types/endian_elf/seq/1");
            }
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
    class DynsymSection extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Elf\EndianElf\SectionHeader $_parent = null, ?\Elf $_root = null, $is_le = null) {
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
    class DynsymSectionEntry extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Elf\EndianElf\DynsymSection $_parent = null, ?\Elf $_root = null, $is_le = null) {
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
        protected $_m_isShIdxReserved;
        public function isShIdxReserved() {
            if ($this->_m_isShIdxReserved !== null)
                return $this->_m_isShIdxReserved;
            $this->_m_isShIdxReserved =  (($this->shIdx() >= $this->_root()->shIdxLoReserved()) && ($this->shIdx() <= $this->_root()->shIdxHiReserved())) ;
            return $this->_m_isShIdxReserved;
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
        protected $_m_size;
        public function size() {
            if ($this->_m_size !== null)
                return $this->_m_size;
            $this->_m_size = ($this->_root()->bits() == \Elf\Bits::B32 ? $this->sizeB32() : ($this->_root()->bits() == \Elf\Bits::B64 ? $this->sizeB64() : 0));
            return $this->_m_size;
        }
        protected $_m_value;
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $this->_m_value = ($this->_root()->bits() == \Elf\Bits::B32 ? $this->valueB32() : ($this->_root()->bits() == \Elf\Bits::B64 ? $this->valueB64() : 0));
            return $this->_m_value;
        }
        protected $_m_visibility;
        public function visibility() {
            if ($this->_m_visibility !== null)
                return $this->_m_visibility;
            $this->_m_visibility = $this->other() & 7;
            return $this->_m_visibility;
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
    class NoteSection extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Elf $_root = null, $is_le = null) {
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
    class NoteSectionEntry extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Elf\EndianElf\NoteSection $_parent = null, ?\Elf $_root = null, $is_le = null) {
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

/**
 * Same type as `sh_dynamic_section`, but it does not use
 * `_parent.linked_section`, which is available only in section headers
 * (i.e. when `_parent` is of type `section_header`). This allows it to
 * be used in program headers (i.e. from the `program_header` type).
 * 
 * The inability to access `linked_section` means that offsets in the
 * string table (which should be stored in the `.dynstr` section) will
 * not be resolved to strings and will be provided only in raw form in
 * the `value_or_ptr` field. In other words, the
 * `ph_dynamic_section_entry` type has no `value_str` instance, unlike
 * the `sh_dynamic_section_entry` type.
 * 
 * There is another way to find the string table referenced by the
 * dynamic section entries that does not rely on `linked_section`, but is
 * a bit more complex (and is therefore considered out of scope of this
 * .ksy spec): the mandatory dynamic tag `dynamic_array_tags::strtab`
 * (`DT_STRTAB`) specifies the virtual address of the string table, and
 * `dynamic_array_tags::strsz` (`DT_STRSZ`) specifies its size in bytes.
 * The virtual address can be converted to a file offset by reading the
 * program headers - see the source code for the `readelf` command:
 * 
 * 1. [`offset_from_vma` call site with an address from `DT_STRTAB` as an
 *   argument](https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L13018)
 * 2. [`offset_from_vma` function
 *   definition](https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L7788)
 */

namespace Elf\EndianElf {
    class PhDynamicSection extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Elf\EndianElf\ProgramHeader $_parent = null, ?\Elf $_root = null, $is_le = null) {
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
            do {
                $_ = new \Elf\EndianElf\PhDynamicSectionEntry($this->_io, $this, $this->_root, $this->_m__is_le);
                $this->_m_entries[] = $_;
                $i++;
            } while (!($_->tagEnum() == \Elf\DynamicArrayTags::NULL));
        }

        private function _readBE() {
            $this->_m_entries = [];
            $i = 0;
            do {
                $_ = new \Elf\EndianElf\PhDynamicSectionEntry($this->_io, $this, $this->_root, $this->_m__is_le);
                $this->_m_entries[] = $_;
                $i++;
            } while (!($_->tagEnum() == \Elf\DynamicArrayTags::NULL));
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

/**
 * Same type as `sh_dynamic_section_entry`, but without the `value_str`
 * instance - see the documentation for `ph_dynamic_section` for more
 * details.
 */

namespace Elf\EndianElf {
    class PhDynamicSectionEntry extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Elf\EndianElf\PhDynamicSection $_parent = null, ?\Elf $_root = null, $is_le = null) {
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
        protected $_m_tagEnum;
        public function tagEnum() {
            if ($this->_m_tagEnum !== null)
                return $this->_m_tagEnum;
            $this->_m_tagEnum = $this->tag();
            return $this->_m_tagEnum;
        }
        protected $_m_tag;
        protected $_m_valueOrPtr;
        public function tag() { return $this->_m_tag; }
        public function valueOrPtr() { return $this->_m_valueOrPtr; }
    }
}

namespace Elf\EndianElf {
    class ProgramHeader extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Elf\EndianElf $_parent = null, ?\Elf $_root = null, $is_le = null) {
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
                    $this->_m_ofsBody = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_ofsBody = $this->_io->readU8le();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_virtAddr = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_virtAddr = $this->_io->readU8le();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_physAddr = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_physAddr = $this->_io->readU8le();
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
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_memorySize = $this->_io->readU4le();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_memorySize = $this->_io->readU8le();
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
                    $this->_m_ofsBody = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_ofsBody = $this->_io->readU8be();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_virtAddr = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_virtAddr = $this->_io->readU8be();
                    break;
            }
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_physAddr = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_physAddr = $this->_io->readU8be();
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
            switch ($this->_root()->bits()) {
                case \Elf\Bits::B32:
                    $this->_m_memorySize = $this->_io->readU4be();
                    break;
                case \Elf\Bits::B64:
                    $this->_m_memorySize = $this->_io->readU8be();
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
        protected $_m_body;

        /**
         * Note: a program header may not have a valid body in the same ELF
         * file, so accessing `body` may result in reading garbage or
         * triggering EOF errors.
         * 
         * In particular, `*.debug` files produced by elfutils'
         * `eu-strip --strip-debug` (as used by Fedora/RHEL and other
         * RPM-based distros for their `*-debuginfo` packages, e.g.
         * `glibc-debuginfo`) copy the original binary's program header table
         * verbatim, including `ofs_body`/`len_body` (i.e.
         * `p_offset`/`p_filesz`), while dropping the actual contents of most
         * segments. Such segments can be recognized by the fact that the
         * corresponding section headers have type `sh_type::nobits`
         * (`SHT_NOBITS`). However, this Kaitai Struct implementation doesn't
         * know the mapping between program headers and section headers, so
         * this must be handled externally.
         * 
         * `*.debug` files from Debian/Ubuntu `*-dbg` packages (e.g.
         * `libc6-dbg`) are usually not affected by this issue, because they
         * are produced using GNU Binutils (`objcopy --only-keep-debug`),
         * which zeroes `len_body` for segments whose contents were omitted
         * (which reliably tells us that there is no `body`).
         */
        public function body() {
            if ($this->_m_body !== null)
                return $this->_m_body;
            if ($this->lenBody() != 0) {
                $io = $this->_root()->_io();
                $_pos = $io->pos();
                $io->seek($this->ofsBody());
                if ($this->_m__is_le) {
                    switch ($this->type()) {
                        case \Elf\PhType::DYNAMIC:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\PhDynamicSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\PhType::INTERP:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\ProgramHeader\PhInterpreter($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\PhType::NOTE:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\NoteSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        default:
                            $this->_m_body = $io->readBytes($this->lenBody());
                            break;
                    }
                } else {
                    switch ($this->type()) {
                        case \Elf\PhType::DYNAMIC:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\PhDynamicSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\PhType::INTERP:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\ProgramHeader\PhInterpreter($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\PhType::NOTE:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\NoteSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
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
        protected $_m_ofsBody;
        protected $_m_virtAddr;
        protected $_m_physAddr;
        protected $_m_lenBody;
        protected $_m_memorySize;
        protected $_m_flags32;
        protected $_m_align;
        protected $_m__raw_body;
        public function type() { return $this->_m_type; }
        public function flags64() { return $this->_m_flags64; }
        public function ofsBody() { return $this->_m_ofsBody; }
        public function virtAddr() { return $this->_m_virtAddr; }
        public function physAddr() { return $this->_m_physAddr; }
        public function lenBody() { return $this->_m_lenBody; }
        public function memorySize() { return $this->_m_memorySize; }
        public function flags32() { return $this->_m_flags32; }
        public function align() { return $this->_m_align; }
        public function _raw_body() { return $this->_m__raw_body; }
    }
}

namespace Elf\EndianElf\ProgramHeader {
    class PhInterpreter extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Elf\EndianElf\ProgramHeader $_parent = null, ?\Elf $_root = null, $is_le = null) {
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
            $this->_m_pathName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ASCII");
        }

        private function _readBE() {
            $this->_m_pathName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ASCII");
        }
        protected $_m_pathName;
        public function pathName() { return $this->_m_pathName; }
    }
}

namespace Elf\EndianElf {
    class RelocationSection extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(bool $hasAddend, \Kaitai\Struct\Stream $_io, ?\Elf\EndianElf\SectionHeader $_parent = null, ?\Elf $_root = null, $is_le = null) {
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
    class RelocationSectionEntry extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Elf\EndianElf\RelocationSection $_parent = null, ?\Elf $_root = null, $is_le = null) {
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
    class SectionHeader extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Elf\EndianElf $_parent = null, ?\Elf $_root = null, $is_le = null) {
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
            $this->_m_info = $this->_io->readU4le();
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
            $this->_m_info = $this->_io->readU4be();
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
                        case \Elf\ShType::DYNAMIC:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\ShDynamicSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::DYNSYM:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\DynsymSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::GNU_VERDEF:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\VerdefSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::GNU_VERNEED:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\VerneedSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::GNU_VERSYM:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\VersymSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::NOTE:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\NoteSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::REL:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\RelocationSection(false, $_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::RELA:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\RelocationSection(true, $_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::STRTAB:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\StringsStruct($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::SYMTAB:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\DynsymSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        default:
                            $this->_m_body = $io->readBytes($this->lenBody());
                            break;
                    }
                } else {
                    switch ($this->type()) {
                        case \Elf\ShType::DYNAMIC:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\ShDynamicSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::DYNSYM:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\DynsymSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::GNU_VERDEF:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\VerdefSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::GNU_VERNEED:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\VerneedSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::GNU_VERSYM:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\VersymSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::NOTE:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\NoteSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::REL:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\RelocationSection(false, $_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::RELA:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\RelocationSection(true, $_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::STRTAB:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\StringsStruct($_io__raw_body, $this, $this->_root, $this->_m__is_le);
                            break;
                        case \Elf\ShType::SYMTAB:
                            $this->_m__raw_body = $io->readBytes($this->lenBody());
                            $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                            $this->_m_body = new \Elf\EndianElf\DynsymSection($_io__raw_body, $this, $this->_root, $this->_m__is_le);
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

/**
 * Same type as `ph_dynamic_section`, but it depends on
 * `_parent.linked_section`, so it can be used only in the
 * `section_header` type. See the documentation for `ph_dynamic_section`
 * for more details.
 */

namespace Elf\EndianElf {
    class ShDynamicSection extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Elf\EndianElf\SectionHeader $_parent = null, ?\Elf $_root = null, $is_le = null) {
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
            do {
                $_ = new \Elf\EndianElf\ShDynamicSectionEntry($this->_io, $this, $this->_root, $this->_m__is_le);
                $this->_m_entries[] = $_;
                $i++;
            } while (!($_->tagEnum() == \Elf\DynamicArrayTags::NULL));
        }

        private function _readBE() {
            $this->_m_entries = [];
            $i = 0;
            do {
                $_ = new \Elf\EndianElf\ShDynamicSectionEntry($this->_io, $this, $this->_root, $this->_m__is_le);
                $this->_m_entries[] = $_;
                $i++;
            } while (!($_->tagEnum() == \Elf\DynamicArrayTags::NULL));
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

/**
 * Same type as `ph_dynamic_section_entry`, but with the `value_str`
 * instance - see the documentation for `ph_dynamic_section` for more
 * details.
 */

namespace Elf\EndianElf {
    class ShDynamicSectionEntry extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Elf\EndianElf\ShDynamicSection $_parent = null, ?\Elf $_root = null, $is_le = null) {
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
        protected $_m_tagEnum;
        public function tagEnum() {
            if ($this->_m_tagEnum !== null)
                return $this->_m_tagEnum;
            $this->_m_tagEnum = $this->tag();
            return $this->_m_tagEnum;
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
        protected $_m_tag;
        protected $_m_valueOrPtr;
        public function tag() { return $this->_m_tag; }
        public function valueOrPtr() { return $this->_m_valueOrPtr; }
    }
}

namespace Elf\EndianElf {
    class StringsStruct extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Elf $_root = null, $is_le = null) {
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

namespace Elf\EndianElf {
    class VerdauxEntry extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Elf\EndianElf\VerdefSection $_parent = null, ?\Elf $_root = null, $is_le = null) {
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
            if ($this->ofsStart() < 0) {
                $this->_m__unnamed0 = $this->_io->readBytes(0);
            }
            $this->_m_ofsName = $this->_io->readU4le();
            $this->_m_ofsNext = $this->_io->readU4le();
            $_ = $this->_m_ofsNext;
            if (!( (($_ == 0) || ($_ >= 8)) )) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_ofsNext, $this->_io, "/types/endian_elf/types/verdaux_entry/seq/2");
            }
        }

        private function _readBE() {
            if ($this->ofsStart() < 0) {
                $this->_m__unnamed0 = $this->_io->readBytes(0);
            }
            $this->_m_ofsName = $this->_io->readU4be();
            $this->_m_ofsNext = $this->_io->readU4be();
            $_ = $this->_m_ofsNext;
            if (!( (($_ == 0) || ($_ >= 8)) )) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_ofsNext, $this->_io, "/types/endian_elf/types/verdaux_entry/seq/2");
            }
        }
        protected $_m_name;
        public function name() {
            if ($this->_m_name !== null)
                return $this->_m_name;
            if ($this->_parent()->isStringTableLinked()) {
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
        protected $_m_next;
        public function next() {
            if ($this->_m_next !== null)
                return $this->_m_next;
            if ($this->ofsNext() != 0) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->ofsStart() + $this->ofsNext());
                if ($this->_m__is_le) {
                    $this->_m_next = new \Elf\EndianElf\VerdauxEntry($this->_io, $this->_parent(), $this->_root, $this->_m__is_le);
                } else {
                    $this->_m_next = new \Elf\EndianElf\VerdauxEntry($this->_io, $this->_parent(), $this->_root, $this->_m__is_le);
                }
                $this->_io->seek($_pos);
            }
            return $this->_m_next;
        }
        protected $_m_ofsStart;
        public function ofsStart() {
            if ($this->_m_ofsStart !== null)
                return $this->_m_ofsStart;
            $this->_m_ofsStart = $this->_io()->pos();
            return $this->_m_ofsStart;
        }
        protected $_m__unnamed0;
        protected $_m_ofsName;
        protected $_m_ofsNext;
        public function _unnamed0() { return $this->_m__unnamed0; }

        /**
         * Byte offset to the version or dependency name string in the linked
         * string table.
         */
        public function ofsName() { return $this->_m_ofsName; }

        /**
         * Byte offset to the next verdaux entry, relative to the start of
         * this `verdaux_entry`. A value of zero means that there is no next
         * entry.
         */
        public function ofsNext() { return $this->_m_ofsNext; }
    }
}

/**
 * Version Definitions, contained in the special section named
 * `.gnu.version_d` with the section type `sh_type::gnu_verdef`
 * (`SHT_GNU_verdef`).
 * 
 * The number of entries in this section must match the value of the
 * dynamic tag `dynamic_array_tags::verdefnum` (`DT_VERDEFNUM`) in the
 * Dynamic Section (`.dynamic`).
 * 
 * `_parent.linked_section` must be the string table that contains the
 * strings referenced by this section. Specifically, the string table in
 * the `.dynstr` section should be used (side note: the `readelf` command
 * doesn't even check which string table `sh_link` points to, and always
 * uses `.dynstr` for the lookups - see
 * <https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L13787>).
 * 
 * The `is_string_table_linked` value instance indicates whether the
 * string table is linked. If it is not, version names (the `name`
 * instance in the `verdaux_entry` type) will not be available.
 */

namespace Elf\EndianElf {
    class VerdefSection extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Elf\EndianElf\SectionHeader $_parent = null, ?\Elf $_root = null, $is_le = null) {
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
            $this->_m_firstEntry = new \Elf\EndianElf\VerdefSectionEntry($this->_io, $this, $this->_root, $this->_m__is_le);
        }

        private function _readBE() {
            $this->_m_firstEntry = new \Elf\EndianElf\VerdefSectionEntry($this->_io, $this, $this->_root, $this->_m__is_le);
        }
        protected $_m_isStringTableLinked;

        /**
         * Indicates whether a string table is linked. This should always be
         * `true` in spec-compliant ELF files. If it is `false`, the string
         * offsets in this section will not be resolved to strings.
         */
        public function isStringTableLinked() {
            if ($this->_m_isStringTableLinked !== null)
                return $this->_m_isStringTableLinked;
            $this->_m_isStringTableLinked = $this->_parent()->linkedSection()->type() == \Elf\ShType::STRTAB;
            return $this->_m_isStringTableLinked;
        }
        protected $_m_numEntries;

        /**
         * Number of entries (version definitions)
         */
        public function numEntries() {
            if ($this->_m_numEntries !== null)
                return $this->_m_numEntries;
            $this->_m_numEntries = $this->_parent()->info();
            return $this->_m_numEntries;
        }
        protected $_m_firstEntry;
        public function firstEntry() { return $this->_m_firstEntry; }
    }
}

namespace Elf\EndianElf {
    class VerdefSectionEntry extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Elf\EndianElf\VerdefSection $_parent = null, ?\Elf $_root = null, $is_le = null) {
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
            if ($this->ofsStart() < 0) {
                $this->_m__unnamed0 = $this->_io->readBytes(0);
            }
            $this->_m_version = $this->_io->readU2le();
            if (!($this->_m_version == 1)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(1, $this->_m_version, $this->_io, "/types/endian_elf/types/verdef_section_entry/seq/1");
            }
            $this->_m_flags = $this->_io->readU2le();
            $this->_m_versionIndex = $this->_io->readU2le();
            $_ = $this->_m_versionIndex;
            if (!(($_ & 32768) == 0)) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_versionIndex, $this->_io, "/types/endian_elf/types/verdef_section_entry/seq/3");
            }
            $this->_m_numAuxEntries = $this->_io->readU2le();
            if (!($this->_m_numAuxEntries >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->_m_numAuxEntries, $this->_io, "/types/endian_elf/types/verdef_section_entry/seq/4");
            }
            $this->_m_hash = $this->_io->readU4le();
            $this->_m_ofsFirstAux = $this->_io->readU4le();
            if (!($this->_m_ofsFirstAux >= 20)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(20, $this->_m_ofsFirstAux, $this->_io, "/types/endian_elf/types/verdef_section_entry/seq/6");
            }
            $this->_m_ofsNext = $this->_io->readU4le();
            $_ = $this->_m_ofsNext;
            if (!( (($_ == 0) || ($_ >= 20)) )) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_ofsNext, $this->_io, "/types/endian_elf/types/verdef_section_entry/seq/7");
            }
        }

        private function _readBE() {
            if ($this->ofsStart() < 0) {
                $this->_m__unnamed0 = $this->_io->readBytes(0);
            }
            $this->_m_version = $this->_io->readU2be();
            if (!($this->_m_version == 1)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(1, $this->_m_version, $this->_io, "/types/endian_elf/types/verdef_section_entry/seq/1");
            }
            $this->_m_flags = $this->_io->readU2be();
            $this->_m_versionIndex = $this->_io->readU2be();
            $_ = $this->_m_versionIndex;
            if (!(($_ & 32768) == 0)) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_versionIndex, $this->_io, "/types/endian_elf/types/verdef_section_entry/seq/3");
            }
            $this->_m_numAuxEntries = $this->_io->readU2be();
            if (!($this->_m_numAuxEntries >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->_m_numAuxEntries, $this->_io, "/types/endian_elf/types/verdef_section_entry/seq/4");
            }
            $this->_m_hash = $this->_io->readU4be();
            $this->_m_ofsFirstAux = $this->_io->readU4be();
            if (!($this->_m_ofsFirstAux >= 20)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(20, $this->_m_ofsFirstAux, $this->_io, "/types/endian_elf/types/verdef_section_entry/seq/6");
            }
            $this->_m_ofsNext = $this->_io->readU4be();
            $_ = $this->_m_ofsNext;
            if (!( (($_ == 0) || ($_ >= 20)) )) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_ofsNext, $this->_io, "/types/endian_elf/types/verdef_section_entry/seq/7");
            }
        }
        protected $_m_firstAux;

        /**
         * First auxiliary entry of type `verdaux_entry` (`Elfxx_Verdaux`).
         * The rest follow its `next` instance.
         */
        public function firstAux() {
            if ($this->_m_firstAux !== null)
                return $this->_m_firstAux;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsStart() + $this->ofsFirstAux());
            if ($this->_m__is_le) {
                $this->_m_firstAux = new \Elf\EndianElf\VerdauxEntry($this->_io, $this->_parent(), $this->_root, $this->_m__is_le);
            } else {
                $this->_m_firstAux = new \Elf\EndianElf\VerdauxEntry($this->_io, $this->_parent(), $this->_root, $this->_m__is_le);
            }
            $this->_io->seek($_pos);
            return $this->_m_firstAux;
        }
        protected $_m_flagsObj;
        public function flagsObj() {
            if ($this->_m_flagsObj !== null)
                return $this->_m_flagsObj;
            if ($this->_m__is_le) {
                $this->_m_flagsObj = new \Elf\EndianElf\VersionFlags($this->flags(), $this->_io, $this, $this->_root, $this->_m__is_le);
            } else {
                $this->_m_flagsObj = new \Elf\EndianElf\VersionFlags($this->flags(), $this->_io, $this, $this->_root, $this->_m__is_le);
            }
            return $this->_m_flagsObj;
        }
        protected $_m_next;
        public function next() {
            if ($this->_m_next !== null)
                return $this->_m_next;
            if ($this->ofsNext() != 0) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->ofsStart() + $this->ofsNext());
                if ($this->_m__is_le) {
                    $this->_m_next = new \Elf\EndianElf\VerdefSectionEntry($this->_io, $this->_parent(), $this->_root, $this->_m__is_le);
                } else {
                    $this->_m_next = new \Elf\EndianElf\VerdefSectionEntry($this->_io, $this->_parent(), $this->_root, $this->_m__is_le);
                }
                $this->_io->seek($_pos);
            }
            return $this->_m_next;
        }
        protected $_m_ofsStart;
        public function ofsStart() {
            if ($this->_m_ofsStart !== null)
                return $this->_m_ofsStart;
            $this->_m_ofsStart = $this->_io()->pos();
            return $this->_m_ofsStart;
        }
        protected $_m_versionIndexSpecial;
        public function versionIndexSpecial() {
            if ($this->_m_versionIndexSpecial !== null)
                return $this->_m_versionIndexSpecial;
            $this->_m_versionIndexSpecial = $this->versionIndex();
            return $this->_m_versionIndexSpecial;
        }
        protected $_m__unnamed0;
        protected $_m_version;
        protected $_m_flags;
        protected $_m_versionIndex;
        protected $_m_numAuxEntries;
        protected $_m_hash;
        protected $_m_ofsFirstAux;
        protected $_m_ofsNext;
        public function _unnamed0() { return $this->_m__unnamed0; }

        /**
         * Version of the structure. Must be set to 1.
         */
        public function version() { return $this->_m_version; }

        /**
         * Version information flag bitmask. Access `flags_obj` instead.
         */
        public function flags() { return $this->_m_flags; }

        /**
         * Version index assigned to this version definition. A unique index
         * that entries in the Symbol Version Table (the `versym_section`
         * type) use to reference the corresponding version definition.
         */
        public function versionIndex() { return $this->_m_versionIndex; }

        /**
         * Number of associated auxiliary entries.
         */
        public function numAuxEntries() { return $this->_m_numAuxEntries; }

        /**
         * Version name hash value (ELF hash function).
         */
        public function hash() { return $this->_m_hash; }

        /**
         * Byte offset to the first `verdaux_entry` (`Elfxx_Verdaux`)
         * associated with this version definition. The offset is relative to
         * the start of this `verdef_section_entry`.
         */
        public function ofsFirstAux() { return $this->_m_ofsFirstAux; }

        /**
         * Byte offset to the next verdef entry, relative to the start of
         * this `verdef_section_entry`. A value of zero means that there is
         * no next entry.
         */
        public function ofsNext() { return $this->_m_ofsNext; }
    }
}

namespace Elf\EndianElf {
    class VernauxEntry extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Elf\EndianElf\VerneedSection $_parent = null, ?\Elf $_root = null, $is_le = null) {
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
            if ($this->ofsStart() < 0) {
                $this->_m__unnamed0 = $this->_io->readBytes(0);
            }
            $this->_m_hash = $this->_io->readU4le();
            $this->_m_flags = $this->_io->readU2le();
            $this->_m_versionIndex = new \Elf\EndianElf\VersionIndex($this->_io, $this, $this->_root, $this->_m__is_le);
            $this->_m_ofsName = $this->_io->readU4le();
            $this->_m_ofsNext = $this->_io->readU4le();
            $_ = $this->_m_ofsNext;
            if (!( (($_ == 0) || ($_ >= 16)) )) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_ofsNext, $this->_io, "/types/endian_elf/types/vernaux_entry/seq/5");
            }
        }

        private function _readBE() {
            if ($this->ofsStart() < 0) {
                $this->_m__unnamed0 = $this->_io->readBytes(0);
            }
            $this->_m_hash = $this->_io->readU4be();
            $this->_m_flags = $this->_io->readU2be();
            $this->_m_versionIndex = new \Elf\EndianElf\VersionIndex($this->_io, $this, $this->_root, $this->_m__is_le);
            $this->_m_ofsName = $this->_io->readU4be();
            $this->_m_ofsNext = $this->_io->readU4be();
            $_ = $this->_m_ofsNext;
            if (!( (($_ == 0) || ($_ >= 16)) )) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_ofsNext, $this->_io, "/types/endian_elf/types/vernaux_entry/seq/5");
            }
        }
        protected $_m_flagsObj;
        public function flagsObj() {
            if ($this->_m_flagsObj !== null)
                return $this->_m_flagsObj;
            if ($this->_m__is_le) {
                $this->_m_flagsObj = new \Elf\EndianElf\VersionFlags($this->flags(), $this->_io, $this, $this->_root, $this->_m__is_le);
            } else {
                $this->_m_flagsObj = new \Elf\EndianElf\VersionFlags($this->flags(), $this->_io, $this, $this->_root, $this->_m__is_le);
            }
            return $this->_m_flagsObj;
        }
        protected $_m_name;
        public function name() {
            if ($this->_m_name !== null)
                return $this->_m_name;
            if ($this->_parent()->isStringTableLinked()) {
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
        protected $_m_next;
        public function next() {
            if ($this->_m_next !== null)
                return $this->_m_next;
            if ($this->ofsNext() != 0) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->ofsStart() + $this->ofsNext());
                if ($this->_m__is_le) {
                    $this->_m_next = new \Elf\EndianElf\VernauxEntry($this->_io, $this->_parent(), $this->_root, $this->_m__is_le);
                } else {
                    $this->_m_next = new \Elf\EndianElf\VernauxEntry($this->_io, $this->_parent(), $this->_root, $this->_m__is_le);
                }
                $this->_io->seek($_pos);
            }
            return $this->_m_next;
        }
        protected $_m_ofsStart;
        public function ofsStart() {
            if ($this->_m_ofsStart !== null)
                return $this->_m_ofsStart;
            $this->_m_ofsStart = $this->_io()->pos();
            return $this->_m_ofsStart;
        }
        protected $_m__unnamed0;
        protected $_m_hash;
        protected $_m_flags;
        protected $_m_versionIndex;
        protected $_m_ofsName;
        protected $_m_ofsNext;
        public function _unnamed0() { return $this->_m__unnamed0; }

        /**
         * Dependency name hash value (ELF hash function).
         */
        public function hash() { return $this->_m_hash; }

        /**
         * Dependency information flag bitmask. Access `flags_obj` instead.
         */
        public function flags() { return $this->_m_flags; }

        /**
         * Version index assigned to this dependency version. A unique index
         * that entries in the Symbol Version Table (the `versym_section`
         * type) use to reference the corresponding dependency version.
         */
        public function versionIndex() { return $this->_m_versionIndex; }

        /**
         * Byte offset to the dependency name string in the linked string
         * table.
         */
        public function ofsName() { return $this->_m_ofsName; }

        /**
         * Byte offset to the next vernaux entry, relative to the start of
         * this `vernaux_entry`. A value of zero means that there is no next
         * entry.
         */
        public function ofsNext() { return $this->_m_ofsNext; }
    }
}

/**
 * Version Requirements, contained in the special section named
 * `.gnu.version_r` with the section type `sh_type::gnu_verneed`
 * (`SHT_GNU_verneed`). This section defines the required versions of
 * dynamic symbols from other shared objects.
 * 
 * The number of entries in this section must match the value of the
 * dynamic tag `dynamic_array_tags::verneednum` (`DT_VERNEEDNUM`) in the
 * Dynamic Section (`.dynamic`).
 * 
 * `_parent.linked_section` must be the string table that contains the
 * strings referenced by this section. Specifically, the string table in
 * the `.dynstr` section should be used (side note: the `readelf` command
 * doesn't even check which string table `sh_link` points to, and always
 * uses `.dynstr` for the lookups - see
 * <https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L13941>).
 * 
 * The `is_string_table_linked` value instance indicates whether the
 * string table is linked. If it is not, file names (the `file_name`
 * instance in the `verneed_section_entry` type) or version names (the
 * `name` instance in the `vernaux_entry` type) will not be available.
 */

namespace Elf\EndianElf {
    class VerneedSection extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Elf\EndianElf\SectionHeader $_parent = null, ?\Elf $_root = null, $is_le = null) {
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
            $this->_m_firstEntry = new \Elf\EndianElf\VerneedSectionEntry($this->_io, $this, $this->_root, $this->_m__is_le);
        }

        private function _readBE() {
            $this->_m_firstEntry = new \Elf\EndianElf\VerneedSectionEntry($this->_io, $this, $this->_root, $this->_m__is_le);
        }
        protected $_m_isStringTableLinked;

        /**
         * Indicates whether a string table is linked. This should always be
         * `true` in spec-compliant ELF files. If it is `false`, the string
         * offsets in this section will not be resolved to strings.
         */
        public function isStringTableLinked() {
            if ($this->_m_isStringTableLinked !== null)
                return $this->_m_isStringTableLinked;
            $this->_m_isStringTableLinked = $this->_parent()->linkedSection()->type() == \Elf\ShType::STRTAB;
            return $this->_m_isStringTableLinked;
        }
        protected $_m_numEntries;

        /**
         * Number of entries (dependency versions)
         */
        public function numEntries() {
            if ($this->_m_numEntries !== null)
                return $this->_m_numEntries;
            $this->_m_numEntries = $this->_parent()->info();
            return $this->_m_numEntries;
        }
        protected $_m_firstEntry;
        public function firstEntry() { return $this->_m_firstEntry; }
    }
}

namespace Elf\EndianElf {
    class VerneedSectionEntry extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Elf\EndianElf\VerneedSection $_parent = null, ?\Elf $_root = null, $is_le = null) {
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
            if ($this->ofsStart() < 0) {
                $this->_m__unnamed0 = $this->_io->readBytes(0);
            }
            $this->_m_version = $this->_io->readU2le();
            if (!($this->_m_version == 1)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(1, $this->_m_version, $this->_io, "/types/endian_elf/types/verneed_section_entry/seq/1");
            }
            $this->_m_numAuxEntries = $this->_io->readU2le();
            if (!($this->_m_numAuxEntries >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->_m_numAuxEntries, $this->_io, "/types/endian_elf/types/verneed_section_entry/seq/2");
            }
            $this->_m_ofsFileName = $this->_io->readU4le();
            $this->_m_ofsFirstAux = $this->_io->readU4le();
            if (!($this->_m_ofsFirstAux >= 16)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(16, $this->_m_ofsFirstAux, $this->_io, "/types/endian_elf/types/verneed_section_entry/seq/4");
            }
            $this->_m_ofsNext = $this->_io->readU4le();
            $_ = $this->_m_ofsNext;
            if (!( (($_ == 0) || ($_ >= 16)) )) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_ofsNext, $this->_io, "/types/endian_elf/types/verneed_section_entry/seq/5");
            }
        }

        private function _readBE() {
            if ($this->ofsStart() < 0) {
                $this->_m__unnamed0 = $this->_io->readBytes(0);
            }
            $this->_m_version = $this->_io->readU2be();
            if (!($this->_m_version == 1)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(1, $this->_m_version, $this->_io, "/types/endian_elf/types/verneed_section_entry/seq/1");
            }
            $this->_m_numAuxEntries = $this->_io->readU2be();
            if (!($this->_m_numAuxEntries >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->_m_numAuxEntries, $this->_io, "/types/endian_elf/types/verneed_section_entry/seq/2");
            }
            $this->_m_ofsFileName = $this->_io->readU4be();
            $this->_m_ofsFirstAux = $this->_io->readU4be();
            if (!($this->_m_ofsFirstAux >= 16)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(16, $this->_m_ofsFirstAux, $this->_io, "/types/endian_elf/types/verneed_section_entry/seq/4");
            }
            $this->_m_ofsNext = $this->_io->readU4be();
            $_ = $this->_m_ofsNext;
            if (!( (($_ == 0) || ($_ >= 16)) )) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_ofsNext, $this->_io, "/types/endian_elf/types/verneed_section_entry/seq/5");
            }
        }
        protected $_m_fileName;
        public function fileName() {
            if ($this->_m_fileName !== null)
                return $this->_m_fileName;
            if ($this->_parent()->isStringTableLinked()) {
                $io = $this->_parent()->_parent()->linkedSection()->body()->_io();
                $_pos = $io->pos();
                $io->seek($this->ofsFileName());
                if ($this->_m__is_le) {
                    $this->_m_fileName = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, true), "UTF-8");
                } else {
                    $this->_m_fileName = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, true), "UTF-8");
                }
                $io->seek($_pos);
            }
            return $this->_m_fileName;
        }
        protected $_m_firstAux;

        /**
         * First auxiliary entry of type `vernaux_entry` (`Elfxx_Vernaux`).
         * The rest follow its `next` instance.
         */
        public function firstAux() {
            if ($this->_m_firstAux !== null)
                return $this->_m_firstAux;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsStart() + $this->ofsFirstAux());
            if ($this->_m__is_le) {
                $this->_m_firstAux = new \Elf\EndianElf\VernauxEntry($this->_io, $this->_parent(), $this->_root, $this->_m__is_le);
            } else {
                $this->_m_firstAux = new \Elf\EndianElf\VernauxEntry($this->_io, $this->_parent(), $this->_root, $this->_m__is_le);
            }
            $this->_io->seek($_pos);
            return $this->_m_firstAux;
        }
        protected $_m_next;
        public function next() {
            if ($this->_m_next !== null)
                return $this->_m_next;
            if ($this->ofsNext() != 0) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->ofsStart() + $this->ofsNext());
                if ($this->_m__is_le) {
                    $this->_m_next = new \Elf\EndianElf\VerneedSectionEntry($this->_io, $this->_parent(), $this->_root, $this->_m__is_le);
                } else {
                    $this->_m_next = new \Elf\EndianElf\VerneedSectionEntry($this->_io, $this->_parent(), $this->_root, $this->_m__is_le);
                }
                $this->_io->seek($_pos);
            }
            return $this->_m_next;
        }
        protected $_m_ofsStart;
        public function ofsStart() {
            if ($this->_m_ofsStart !== null)
                return $this->_m_ofsStart;
            $this->_m_ofsStart = $this->_io()->pos();
            return $this->_m_ofsStart;
        }
        protected $_m__unnamed0;
        protected $_m_version;
        protected $_m_numAuxEntries;
        protected $_m_ofsFileName;
        protected $_m_ofsFirstAux;
        protected $_m_ofsNext;
        public function _unnamed0() { return $this->_m__unnamed0; }

        /**
         * Version of the structure. Must be set to 1.
         */
        public function version() { return $this->_m_version; }

        /**
         * Number of associated auxiliary entries.
         */
        public function numAuxEntries() { return $this->_m_numAuxEntries; }

        /**
         * Byte offset to the file name string in the linked string table.
         */
        public function ofsFileName() { return $this->_m_ofsFileName; }

        /**
         * Byte offset to the first associated `vernaux_entry`
         * (`Elfxx_Vernaux`). The offset is relative to the start of this
         * `verneed_section_entry`.
         */
        public function ofsFirstAux() { return $this->_m_ofsFirstAux; }

        /**
         * Byte offset to the next verneed entry, relative to the start of
         * this `verneed_section_entry`. A value of zero means that there is
         * no next entry.
         */
        public function ofsNext() { return $this->_m_ofsNext; }
    }
}

/**
 * Version information flag bitmask, shared by the `flags` (`vd_flags`)
 * field of `verdef_section_entry` (`Elfxx_Verdef`) and the `flags`
 * (`vna_flags`) field of `vernaux_entry` (`Elfxx_Vernaux`).
 */

namespace Elf\EndianElf {
    class VersionFlags extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(int $value, \Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Elf $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_m_value = $value;
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
        }

        private function _readBE() {
        }
        protected $_m_base;

        /**
         * Version definition of the file itself (the base definition).
         */
        public function base() {
            if ($this->_m_base !== null)
                return $this->_m_base;
            $this->_m_base = ($this->value() & 1) != 0;
            return $this->_m_base;
        }
        protected $_m_info;

        /**
         * Version reference exists for informational purposes and does not
         * need to be validated at runtime.
         */
        public function info() {
            if ($this->_m_info !== null)
                return $this->_m_info;
            $this->_m_info = ($this->value() & 4) != 0;
            return $this->_m_info;
        }
        protected $_m_weak;

        /**
         * Weak version identifier.
         * 
         * A weak version definition has no symbols associated with the
         * version. See [Creating a Weak Version
         * Definition](https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/creating-weak-version-definition.html).
         */
        public function weak() {
            if ($this->_m_weak !== null)
                return $this->_m_weak;
            $this->_m_weak = ($this->value() & 2) != 0;
            return $this->_m_weak;
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace Elf\EndianElf {
    class VersionIndex extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Elf $_root = null, $is_le = null) {
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
            $this->_m_raw = $this->_io->readU2le();
        }

        private function _readBE() {
            $this->_m_raw = $this->_io->readU2be();
        }
        protected $_m_isHidden;

        /**
         * This bit is set if the symbol is hidden, and is only visible with
         * an explicit version number. This is a GNU extension.
         */
        public function isHidden() {
            if ($this->_m_isHidden !== null)
                return $this->_m_isHidden;
            $this->_m_isHidden = ($this->raw() & 32768) != 0;
            return $this->_m_isHidden;
        }
        protected $_m_value;

        /**
         * The values `version_index_special::local` (0) and
         * `version_index_special::global_symbol` (1) have special meanings.
         * The `version_index_special` value instance converts the integer
         * value to the `version_index_special` enum.
         */
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $this->_m_value = $this->raw() & 32767;
            return $this->_m_value;
        }
        protected $_m_versionIndexSpecial;

        /**
         * Note: we match special constants against the full 16-bit integer
         * value (called `raw` in this .ksy implementation), because that's
         * what the `readelf` command does when deciding whether to print
         * `0 (*local*)` or `1 (*global*)` in the `.gnu.version`
         * (`SHT_GNU_versym`) section - see
         * <https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L14079>.
         * 
         * Besides, `version_index_special::eliminate` (`VER_NDX_ELIMINATE`)
         * has a value of `0xff01`, which is a 16-bit value. If we matched
         * against `value` instead, `version_index_special::eliminate` would
         * be unreachable, because `value` contains only the lower 15 bits,
         * so its maximum possible value is `0x7fff`.
         */
        public function versionIndexSpecial() {
            if ($this->_m_versionIndexSpecial !== null)
                return $this->_m_versionIndexSpecial;
            $this->_m_versionIndexSpecial = $this->raw();
            return $this->_m_versionIndexSpecial;
        }
        protected $_m_raw;

        /**
         * Raw value, don't read this field - access `value`,
         * `version_index_special` and `is_hidden` instead.
         */
        public function raw() { return $this->_m_raw; }
    }
}

/**
 * Symbol Version Table, contained in the special section named
 * `.gnu.version` with the section type `sh_type::gnu_versym`
 * (`SHT_GNU_versym`).
 * 
 * This section must have the same number of entries as the Dynamic
 * Symbol Table in the `.dynsym` section (section type `sh_type::dynsym`
 * / `SHT_DYNSYM`). Each entry specifies the version defined for or
 * required by the corresponding symbol in the Dynamic Symbol Table.
 */

namespace Elf\EndianElf {
    class VersymSection extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Elf\EndianElf\SectionHeader $_parent = null, ?\Elf $_root = null, $is_le = null) {
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
                $this->_m_entries[] = new \Elf\EndianElf\VersionIndex($this->_io, $this, $this->_root, $this->_m__is_le);
                $i++;
            }
        }

        private function _readBE() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Elf\EndianElf\VersionIndex($this->_io, $this, $this->_root, $this->_m__is_le);
                $i++;
            }
        }
        protected $_m_entries;

        /**
         * Version indexes for the corresponding symbols in the Dynamic
         * Symbol Table (`.dynsym` section).
         * 
         * These values are not the versions themselves: they are keys that
         * are matched against the `version_index` (`vd_ndx`) field of the
         * `verdef_section_entry` (`Elfxx_Verdef`) type if the symbol is
         * defined in this object, or the `version_index` (`vna_other`) field
         * of the `vernaux_entry` (`Elfxx_Vernaux`) type if the symbol is
         * required from another object. The `name` instance of the matched
         * entry specifies the version of the symbol.
         */
        public function entries() { return $this->_m_entries; }
    }
}

namespace Elf {
    class PhdrTypeFlags extends \Kaitai\Struct\Struct {
        public function __construct(int $value, \Kaitai\Struct\Stream $_io, ?\Elf\EndianElf\ProgramHeader $_parent = null, ?\Elf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_value = $value;
            $this->_read();
        }

        private function _read() {
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
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace Elf {
    class SectionHeaderFlags extends \Kaitai\Struct\Struct {
        public function __construct(int $value, \Kaitai\Struct\Stream $_io, ?\Elf\EndianElf\SectionHeader $_parent = null, ?\Elf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_value = $value;
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_alloc;

        /**
         * Occupies memory during execution
         */
        public function alloc() {
            if ($this->_m_alloc !== null)
                return $this->_m_alloc;
            $this->_m_alloc = ($this->value() & 2) != 0;
            return $this->_m_alloc;
        }
        protected $_m_compressed;

        /**
         * Section with compressed data
         */
        public function compressed() {
            if ($this->_m_compressed !== null)
                return $this->_m_compressed;
            $this->_m_compressed = ($this->value() & 2048) != 0;
            return $this->_m_compressed;
        }
        protected $_m_exclude;

        /**
         * Section is excluded unless referenced or allocated (Solaris)
         */
        public function exclude() {
            if ($this->_m_exclude !== null)
                return $this->_m_exclude;
            $this->_m_exclude = ($this->value() & 2147483648) != 0;
            return $this->_m_exclude;
        }
        protected $_m_execInstr;

        /**
         * Executable machine instructions
         */
        public function execInstr() {
            if ($this->_m_execInstr !== null)
                return $this->_m_execInstr;
            $this->_m_execInstr = ($this->value() & 4) != 0;
            return $this->_m_execInstr;
        }
        protected $_m_gnuMbind;

        /**
         * Mbind section
         */
        public function gnuMbind() {
            if ($this->_m_gnuMbind !== null)
                return $this->_m_gnuMbind;
            $this->_m_gnuMbind = ($this->value() & 16777216) != 0;
            return $this->_m_gnuMbind;
        }
        protected $_m_group;

        /**
         * Member of a section group
         */
        public function group() {
            if ($this->_m_group !== null)
                return $this->_m_group;
            $this->_m_group = ($this->value() & 512) != 0;
            return $this->_m_group;
        }
        protected $_m_infoLink;

        /**
         * Section header's `sh_info` field holds a section header table index
         */
        public function infoLink() {
            if ($this->_m_infoLink !== null)
                return $this->_m_infoLink;
            $this->_m_infoLink = ($this->value() & 64) != 0;
            return $this->_m_infoLink;
        }
        protected $_m_linkOrder;

        /**
         * Preserve section ordering when linking
         */
        public function linkOrder() {
            if ($this->_m_linkOrder !== null)
                return $this->_m_linkOrder;
            $this->_m_linkOrder = ($this->value() & 128) != 0;
            return $this->_m_linkOrder;
        }
        protected $_m_maskOs;

        /**
         * OS-specific semantics
         */
        public function maskOs() {
            if ($this->_m_maskOs !== null)
                return $this->_m_maskOs;
            $this->_m_maskOs = ($this->value() & 267386880) != 0;
            return $this->_m_maskOs;
        }
        protected $_m_maskProc;

        /**
         * Processor-specific semantics
         */
        public function maskProc() {
            if ($this->_m_maskProc !== null)
                return $this->_m_maskProc;
            $this->_m_maskProc = ($this->value() & 4026531840) != 0;
            return $this->_m_maskProc;
        }
        protected $_m_merge;

        /**
         * Data in this section can be merged to eliminate duplication
         */
        public function merge() {
            if ($this->_m_merge !== null)
                return $this->_m_merge;
            $this->_m_merge = ($this->value() & 16) != 0;
            return $this->_m_merge;
        }
        protected $_m_ordered;

        /**
         * Special ordering requirement (Solaris)
         * 
         * From <https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-10675>:
         * 
         * > `SHF_ORDERED` is an older version of the functionality provided by
         * > `SHF_LINK_ORDER`, and has been superseded by `SHF_LINK_ORDER`.
         * > `SHF_ORDERED` is no longer supported.
         */
        public function ordered() {
            if ($this->_m_ordered !== null)
                return $this->_m_ordered;
            $this->_m_ordered = ($this->value() & 1073741824) != 0;
            return $this->_m_ordered;
        }
        protected $_m_osNonconforming;

        /**
         * Special OS-specific handling required
         */
        public function osNonconforming() {
            if ($this->_m_osNonconforming !== null)
                return $this->_m_osNonconforming;
            $this->_m_osNonconforming = ($this->value() & 256) != 0;
            return $this->_m_osNonconforming;
        }
        protected $_m_retain;

        /**
         * Section should not be garbage collected by the linker
         */
        public function retain() {
            if ($this->_m_retain !== null)
                return $this->_m_retain;
            $this->_m_retain = ($this->value() & 2097152) != 0;
            return $this->_m_retain;
        }
        protected $_m_strings;

        /**
         * Contains null-terminated character strings
         */
        public function strings() {
            if ($this->_m_strings !== null)
                return $this->_m_strings;
            $this->_m_strings = ($this->value() & 32) != 0;
            return $this->_m_strings;
        }
        protected $_m_tls;

        /**
         * Thread-local storage section (`.tbss` or `.tdata` according to [ELF
         * Handling For Thread-Local
         * Storage](https://www.akkadia.org/drepper/tls.pdf))
         */
        public function tls() {
            if ($this->_m_tls !== null)
                return $this->_m_tls;
            $this->_m_tls = ($this->value() & 1024) != 0;
            return $this->_m_tls;
        }
        protected $_m_write;

        /**
         * Writable during execution
         */
        public function write() {
            if ($this->_m_write !== null)
                return $this->_m_write;
            $this->_m_write = ($this->value() & 1) != 0;
            return $this->_m_write;
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace Elf {
    class Bits {
        const B32 = 1;
        const B64 = 2;

        private const _VALUES = [1 => true, 2 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Elf {
    class DynamicArrayTags {

        /**
         * Marks end of dynamic section
         */
        const NULL = 0;
        const NEEDED = 1;
        const PLTRELSZ = 2;
        const PLTGOT = 3;
        const HASH = 4;

        /**
         * Address of string table
         */
        const STRTAB = 5;
        const SYMTAB = 6;
        const RELA = 7;
        const RELASZ = 8;
        const RELAENT = 9;

        /**
         * Size of string table
         */
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
         * compatibility.
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

        /**
         * Number of version definitions
         */
        const VERDEFNUM = 1879048189;
        const VERNEED = 1879048190;

        /**
         * Number of dependency versions
         */
        const VERNEEDNUM = 1879048191;
        const SPARC_REGISTER = 1879048193;
        const AUXILIARY = 2147483645;
        const USED = 2147483646;
        const FILTER = 2147483647;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 14 => true, 15 => true, 16 => true, 17 => true, 18 => true, 19 => true, 20 => true, 21 => true, 22 => true, 23 => true, 24 => true, 25 => true, 26 => true, 27 => true, 28 => true, 29 => true, 30 => true, 32 => true, 33 => true, 34 => true, 35 => true, 36 => true, 37 => true, 117440513 => true, 1610612749 => true, 1610612750 => true, 1610612751 => true, 1610612752 => true, 1610612753 => true, 1610612754 => true, 1610612755 => true, 1610612756 => true, 1610612757 => true, 1610612758 => true, 1610612759 => true, 1610612760 => true, 1610612761 => true, 1610612762 => true, 1610612763 => true, 1610612764 => true, 1610612765 => true, 1610612766 => true, 1610612767 => true, 1610612768 => true, 1610612769 => true, 1610612771 => true, 1610612773 => true, 1610612775 => true, 1610612777 => true, 1610612779 => true, 1610612781 => true, 1610612783 => true, 1610612785 => true, 1610612786 => true, 1610612787 => true, 1879047668 => true, 1879047669 => true, 1879047670 => true, 1879047671 => true, 1879047672 => true, 1879047673 => true, 1879047674 => true, 1879047675 => true, 1879047676 => true, 1879047677 => true, 1879047678 => true, 1879047679 => true, 1879047925 => true, 1879047926 => true, 1879047927 => true, 1879047928 => true, 1879047929 => true, 1879047930 => true, 1879047931 => true, 1879047932 => true, 1879047933 => true, 1879047934 => true, 1879047935 => true, 1879048176 => true, 1879048185 => true, 1879048186 => true, 1879048187 => true, 1879048188 => true, 1879048189 => true, 1879048190 => true, 1879048191 => true, 1879048193 => true, 2147483645 => true, 2147483646 => true, 2147483647 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Elf {
    class Endian {
        const LE = 1;
        const BE = 2;

        private const _VALUES = [1 => true, 2 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
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
        const I386 = 3;

        /**
         * Motorola m68k family
         */
        const M68K = 4;

        /**
         * Motorola m88k family
         */
        const M88K = 5;

        /**
         * Intel MCU.
         * 
         * This value was originally assigned as `EM_486` (for Intel i486), but was
         * likely never used in that sense, or only briefly (in
         * <https://www.sco.com/developers/gabi/2001-04-24/ch4.eheader.html>, it is
         * marked as "Reserved for future use (was `EM_486`)" and there is an HTML
         * comment `<!-- before 1994, was EM_486, Intel 80486 -->`). See also
         * <https://landley.net/notes-2009.html#08-11-2009>. In 2015, this number
         * was repurposed to `EM_IAMCU`, see
         * <https://groups.google.com/g/generic-abi/c/pXfB_RXGY8Q/m/QntbSjBX7GkJ>.
         */
        const IAMCU = 6;

        /**
         * Intel 80860
         */
        const I860 = 7;

        /**
         * MIPS I architecture.
         * 
         * Note: some sources describe this as "MIPS RS3000 big-endian", but that's
         * outdated - in practice, it is used for little-endian binaries as well,
         * see <https://github.com/radareorg/radare2/issues/2078>. Historically,
         * there was a value `EM_MIPS_RS3_LE`, which stood for
         * "MIPS R3000 little-endian", but it has long since fallen out of use
         * (it's unclear whether it was ever used in practice at all).
         */
        const MIPS = 8;

        /**
         * IBM System/370 (S/370)
         */
        const S370 = 9;

        /**
         * MIPS R3000 little-endian (Oct 4 1999 Draft). Deprecated.
         * 
         * The Linux kernel source code (Git tag "v7.1") has the [following
         * comment](https://github.com/torvalds/linux/blob/8cd9520d35a6c38db6567e97dd93b1f11f185dc6/include/uapi/linux/elf-em.h#L15-L19):
         * 
         * > Next two are historical and binaries and modules of these types will
         * > be rejected by Linux.
         * 
         * <https://github.com/radareorg/radare2/issues/2078> shows that the
         * `EM_MIPS` value is also used for little-endian binaries (not just
         * big-endian).
         */
        const MIPS_RS3_LE = 10;

        /**
         * Old version of Sparc v9, from before the ABI. Deprecated.
         */
        const OLD_SPARC_V9 = 11;

        /**
         * Hewlett-Packard PA-RISC (HP/PA or HPPA)
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
         * 32-bit PowerPC
         */
        const POWERPC = 20;

        /**
         * 64-bit PowerPC
         */
        const POWERPC64 = 21;

        /**
         * IBM System/390 (S/390)
         */
        const S390 = 22;

        /**
         * STI (Sony, Toshiba and IBM) Cell BE SPU
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
         * TRW RH32
         */
        const RH32 = 38;

        /**
         * Motorola M*Core (also spelled as MCore or M-Core)
         * 
         * `EM_RCE` is "Old name for MCore" according to
         * <https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L152>
         */
        const MCORE = 39;

        /**
         * ARM 32-bit architecture (AArch32)
         */
        const ARM = 40;

        /**
         * DEC Alpha
         */
        const OLD_ALPHA = 41;

        /**
         * Renesas (formerly Hitachi) SuperH SH
         */
        const SUPERH = 42;

        /**
         * SPARC v9 64-bit
         */
        const SPARC_V9 = 43;

        /**
         * Siemens TriCore embedded processor
         */
        const TRICORE = 44;

        /**
         * Argonaut RISC Core
         */
        const ARC = 45;

        /**
         * Renesas (formerly Hitachi) H8/300
         */
        const H8_300 = 46;

        /**
         * Renesas (formerly Hitachi) H8/300H
         */
        const H8_300H = 47;

        /**
         * Renesas (formerly Hitachi) H8S
         */
        const H8S = 48;

        /**
         * Renesas (formerly Hitachi) H8/500
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
        const M68HC16 = 69;

        /**
         * Motorola MC68HC11 microcontroller
         */
        const M68HC11 = 70;

        /**
         * Motorola MC68HC08 microcontroller
         */
        const M68HC08 = 71;

        /**
         * Motorola MC68HC05 microcontroller
         */
        const M68HC05 = 72;

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
         * Renesas V850 (formerly NEC V850)
         */
        const V850 = 87;

        /**
         * Renesas M32R (formerly Mitsubishi M32R)
         */
        const M32R = 88;

        /**
         * Panasonic MN10300 (formerly Matsushita MN10300)
         */
        const MN10300 = 89;

        /**
         * Panasonic MN10200 (formerly Matsushita MN10200)
         */
        const MN10200 = 90;

        /**
         * picoJava
         */
        const PICOJAVA = 91;

        /**
         * OpenRISC 1000 32-bit embedded processor
         */
        const OR1K = 92;

        /**
         * ARC International ARCompact processor
         */
        const ARC_COMPACT = 93;

        /**
         * Tensilica Xtensa architecture
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
         * STMicroelectronics ST200 microcontroller
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
        const CR = 103;

        /**
         * Fujitsu F2MC16
         */
        const F2MC16 = 104;

        /**
         * Texas Instruments embedded microcontroller MSP430
         */
        const MSP430 = 105;

        /**
         * Analog Devices, Inc. (ADI) Blackfin
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
         * Microprocessor series from PKU-Unity Ltd. and MPRC of Peking University
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
         * Analog Devices, Inc. (ADI) SHARC family of 32-bit DSP processors
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
         * Qualcomm Hexagon (QDSP6) processor
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
        const CRAY_NV2 = 172;

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
         * Intel L1OM
         */
        const L1OM = 180;

        /**
         * Intel K1OM
         */
        const K1OM = 181;

        /**
         * Reserved by Intel
         */
        const INTEL182 = 182;

        /**
         * ARM 64-bit architecture
         */
        const AARCH64 = 183;

        /**
         * Reserved by ARM
         */
        const ARM184 = 184;

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
         * Synopsys ARCompact V2 (ARCv2)
         */
        const ARC_COMPACT2 = 195;

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
         * Renesas 78K0R family
         */
        const RENESAS_78K0R = 199;

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
         * Controls and Data Services VISIUMcore processor
         */
        const VISIUM = 221;

        /**
         * FTDI Chip FT32 high performance 32-bit RISC architecture
         */
        const FT32 = 222;

        /**
         * Moxie processor family
         */
        const MOXIE = 223;

        /**
         * AMD GPU architecture
         */
        const AMDGPU = 224;

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
         * C-SKY 32-bit processor family
         */
        const CSKY = 252;

        /**
         * Synopsys ARCv3 64-bit.
         * 
         * Note: in the [official
         * registry](https://gabi.xinuos.com/v42/elf/a-emachine.html), this is
         * labeled "Synopsys ARCv2.3 64-bit". Nearly all implementations of the ELF
         * format have adopted this description verbatim without verification.
         * However, it seems that there is no such thing as "ARCv2.3". The only
         * correct and official name from Synopsys is "ARCv3" - see the
         * [ARCv3 ELF ABI specification](https://github.com/foss-for-synopsys-dwc-arc-processors/arc-ABI-manual/blob/8db91b9b7b92222cfb8972293b6d714ee2959248/arcv3-elf.md#-file-header):
         * 
         * > * e_machine: Identifies the machine this ELF file targets. Always
         * >   contains:
         * >   * EM_ARC_COMPACT3_64 (253 - 0xfd) for Synopsys ARCv3 64-bit
         * >   * EM_ARC_COMPACT3 (255 - 0xff) for Synopsys ARCv3 32-bit
         * 
         * One of the few projects that recognized and fixed this error is the
         * `file` command, see
         * <https://github.com/file/file/commit/70200102a0be50d409dca5ef76d9cbc3703a0753>
         */
        const ARC_COMPACT3_64 = 253;

        /**
         * MOS Technology MCS 6502 processor
         */
        const MCS6502 = 254;

        /**
         * Synopsys ARCv3 32-bit.
         * 
         * Note: in the [official
         * registry](https://gabi.xinuos.com/v42/elf/a-emachine.html), this is
         * labeled "Synopsys ARCv2.3 32-bit". Nearly all implementations of the ELF
         * format have adopted this description verbatim without verification.
         * However, it seems that there is no such thing as "ARCv2.3". The only
         * correct and official name from Synopsys is "ARCv3" - see the
         * [ARCv3 ELF ABI specification](https://github.com/foss-for-synopsys-dwc-arc-processors/arc-ABI-manual/blob/8db91b9b7b92222cfb8972293b6d714ee2959248/arcv3-elf.md#-file-header):
         * 
         * > * e_machine: Identifies the machine this ELF file targets. Always
         * >   contains:
         * >   * EM_ARC_COMPACT3_64 (253 - 0xfd) for Synopsys ARCv3 64-bit
         * >   * EM_ARC_COMPACT3 (255 - 0xff) for Synopsys ARCv3 32-bit
         * 
         * One of the few projects that recognized and fixed this error is the
         * `file` command, see
         * <https://github.com/file/file/commit/70200102a0be50d409dca5ef76d9cbc3703a0753>.
         */
        const ARC_COMPACT3 = 255;

        /**
         * Kalray VLIW core of the MPPA processor family
         */
        const KVX = 256;

        /**
         * WDC 65816/65C816
         */
        const WDC_65816 = 257;

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

        /**
         * Solana Bytecode Format
         */
        const SBF = 263;

        /**
         * AMD/Xilinx AI Engine architecture
         */
        const AI_ENGINE = 264;

        /**
         * SiMa MLA
         */
        const SIMA_MLA = 265;

        /**
         * Cambricon BANG
         */
        const BANG = 266;

        /**
         * Loongson LoongGPU
         */
        const LOONGGPU = 267;

        /**
         * Wuxi Institute of Advanced Technology SW64
         */
        const SW64 = 268;

        /**
         * AMD/Xilinx AI Engine ctrlcode
         */
        const AI_ENGINE_CTRLCODE = 269;

        /**
         * T-Head PPU
         */
        const PPU = 270;
        const AVR_OLD = 4183;
        const MSP430_OLD = 4185;

        /**
         * Adapteva's Epiphany architecture
         */
        const ADAPTEVA_EPIPHANY = 4643;

        /**
         * Morpho MT
         */
        const MT = 9520;
        const CYGNUS_FR30 = 13104;

        /**
         * Unofficial value for WebAssembly (Wasm) binaries, as used by LLVM.
         */
        const WEBASSEMBLY = 16727;

        /**
         * Infineon Technologies 16-bit microcontroller with C166-V2 core
         */
        const XC16X = 18056;

        /**
         * Freescale S12Z. The Freescale toolchain generates ELF files with this value.
         */
        const S12Z = 19951;
        const CYGNUS_FRV = 21569;

        /**
         * openDLX
         */
        const DLX = 23205;
        const CYGNUS_D10V = 30288;
        const CYGNUS_D30V = 30326;

        /**
         * Ubicom IP2xxx (old)
         */
        const IP2K_OLD = 33303;

        /**
         * Cygnus PowerPC
         */
        const CYGNUS_POWERPC = 36901;
        const ALPHA = 36902;

        /**
         * Cygnus M32R.
         * 
         * According to the Linux kernel (Git tag "v7.1") -
         * <https://github.com/torvalds/linux/blob/8cd9520d35a6c38db6567e97dd93b1f11f185dc6/include/uapi/linux/elf-em.h#L63>:
         * 
         * > Bogus old m32r magic number, used by old tools.
         */
        const CYGNUS_M32R = 36929;
        const CYGNUS_V850 = 36992;
        const S390_OLD = 41872;

        /**
         * Old, unofficial value for Xtensa
         */
        const XTENSA_OLD = 43975;
        const XSTORMY16 = 44357;

        /**
         * Old MicroBlaze
         */
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

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 15 => true, 17 => true, 18 => true, 19 => true, 20 => true, 21 => true, 22 => true, 23 => true, 36 => true, 37 => true, 38 => true, 39 => true, 40 => true, 41 => true, 42 => true, 43 => true, 44 => true, 45 => true, 46 => true, 47 => true, 48 => true, 49 => true, 50 => true, 51 => true, 52 => true, 53 => true, 54 => true, 55 => true, 56 => true, 57 => true, 58 => true, 59 => true, 60 => true, 61 => true, 62 => true, 63 => true, 64 => true, 65 => true, 66 => true, 67 => true, 68 => true, 69 => true, 70 => true, 71 => true, 72 => true, 73 => true, 74 => true, 75 => true, 76 => true, 77 => true, 78 => true, 79 => true, 80 => true, 81 => true, 82 => true, 83 => true, 84 => true, 85 => true, 86 => true, 87 => true, 88 => true, 89 => true, 90 => true, 91 => true, 92 => true, 93 => true, 94 => true, 95 => true, 96 => true, 97 => true, 98 => true, 99 => true, 100 => true, 101 => true, 102 => true, 103 => true, 104 => true, 105 => true, 106 => true, 107 => true, 108 => true, 109 => true, 110 => true, 111 => true, 112 => true, 113 => true, 114 => true, 115 => true, 116 => true, 117 => true, 118 => true, 119 => true, 120 => true, 131 => true, 132 => true, 133 => true, 134 => true, 135 => true, 136 => true, 137 => true, 138 => true, 139 => true, 140 => true, 141 => true, 142 => true, 143 => true, 144 => true, 160 => true, 161 => true, 162 => true, 163 => true, 164 => true, 165 => true, 166 => true, 167 => true, 168 => true, 169 => true, 170 => true, 171 => true, 172 => true, 173 => true, 174 => true, 175 => true, 176 => true, 177 => true, 178 => true, 179 => true, 180 => true, 181 => true, 182 => true, 183 => true, 184 => true, 185 => true, 186 => true, 187 => true, 188 => true, 189 => true, 190 => true, 191 => true, 192 => true, 193 => true, 194 => true, 195 => true, 196 => true, 197 => true, 198 => true, 199 => true, 200 => true, 201 => true, 202 => true, 203 => true, 204 => true, 205 => true, 206 => true, 207 => true, 208 => true, 209 => true, 210 => true, 211 => true, 212 => true, 213 => true, 214 => true, 215 => true, 216 => true, 217 => true, 218 => true, 219 => true, 220 => true, 221 => true, 222 => true, 223 => true, 224 => true, 243 => true, 244 => true, 245 => true, 246 => true, 247 => true, 248 => true, 249 => true, 250 => true, 251 => true, 252 => true, 253 => true, 254 => true, 255 => true, 256 => true, 257 => true, 258 => true, 259 => true, 260 => true, 261 => true, 262 => true, 263 => true, 264 => true, 265 => true, 266 => true, 267 => true, 268 => true, 269 => true, 270 => true, 4183 => true, 4185 => true, 4643 => true, 9520 => true, 13104 => true, 16727 => true, 18056 => true, 19951 => true, 21569 => true, 23205 => true, 30288 => true, 30326 => true, 33303 => true, 36901 => true, 36902 => true, 36929 => true, 36992 => true, 41872 => true, 43975 => true, 44357 => true, 47787 => true, 48879 => true, 57005 => true, 61453 => true, 65200 => true, 65210 => true, 65211 => true, 65261 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Elf {
    class ObjType {
        const NO_FILE_TYPE = 0;
        const RELOCATABLE = 1;
        const EXECUTABLE = 2;
        const SHARED = 3;
        const CORE = 4;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Elf {
    class OsAbi {

        /**
         * UNIX System V ABI
         */
        const SYSTEM_V = 0;

        /**
         * HP-UX
         */
        const HP_UX = 1;

        /**
         * NetBSD
         */
        const NETBSD = 2;

        /**
         * Object uses GNU ELF extensions.
         */
        const GNU = 3;

        /**
         * Solaris
         */
        const SOLARIS = 6;

        /**
         * IBM AIX
         */
        const AIX = 7;

        /**
         * IRIX by Silicon Graphics (SGI)
         */
        const IRIX = 8;

        /**
         * FreeBSD
         */
        const FREEBSD = 9;

        /**
         * Compaq TRU64 UNIX
         */
        const TRU64 = 10;

        /**
         * Novell Modesto
         */
        const MODESTO = 11;

        /**
         * OpenBSD
         */
        const OPENBSD = 12;

        /**
         * OpenVMS
         */
        const OPENVMS = 13;

        /**
         * Hewlett-Packard NonStop Kernel
         */
        const NSK = 14;

        /**
         * AROS Research Operating System
         */
        const AROS = 15;

        /**
         * FenixOS
         */
        const FENIXOS = 16;

        /**
         * Nuxi CloudABI
         */
        const CLOUDABI = 17;

        /**
         * Stratus Technologies OpenVOS
         */
        const OPENVOS = 18;

        /**
         * NVIDIA CUDA architecture
         */
        const CUDA = 51;

        /**
         * ARM EABI (symbol versioning extensions)
         */
        const ARM_AEABI = 64;

        /**
         * ARM FDPIC
         */
        const ARM_FDPIC = 65;

        /**
         * AMD GCN GPUs (GFX6+) for MESA runtime
         */
        const AMDGPU_MESA3D = 66;

        /**
         * ARM
         */
        const ARM = 97;

        /**
         * Standalone (embedded) application
         */
        const STANDALONE = 255;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 14 => true, 15 => true, 16 => true, 17 => true, 18 => true, 51 => true, 64 => true, 65 => true, 66 => true, 97 => true, 255 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Elf {
    class PhType {

        /**
         * Program header table entry unused
         */
        const NULL_TYPE = 0;

        /**
         * Loadable program segment
         */
        const LOAD = 1;

        /**
         * Dynamic linking information
         */
        const DYNAMIC = 2;

        /**
         * Program interpreter (i.e. runtime/dynamic linker)
         */
        const INTERP = 3;

        /**
         * Auxiliary information
         */
        const NOTE = 4;

        /**
         * Reserved
         */
        const SHLIB = 5;

        /**
         * Segment for the program header table itself
         */
        const PHDR = 6;

        /**
         * Thread-local storage segment
         */
        const TLS = 7;

        /**
         * Equivalent to `PT_SUNW_EH_FRAME` (`ph_type::gnu_eh_frame`)
         */
        const SUNW_UNWIND = 1684333904;

        /**
         * Exception unwind tables (`.eh_frame_hdr` section)
         */
        const GNU_EH_FRAME = 1685382480;

        /**
         * Indicates stack executability
         */
        const GNU_STACK = 1685382481;

        /**
         * Read-only after relocation
         */
        const GNU_RELRO = 1685382482;

        /**
         * Segment containing the `.note.gnu.property` section
         */
        const GNU_PROPERTY = 1685382483;

        /**
         * GNU SFrame stack trace segment (`.sframe` section)
         */
        const GNU_SFRAME = 1685382484;

        /**
         * PaX flags
         */
        const PAX_FLAGS = 1694766464;

        /**
         * Like bss, but not immutable
         */
        const OPENBSD_MUTABLE = 1705237477;

        /**
         * Fill with random data
         */
        const OPENBSD_RANDOMIZE = 1705237478;

        /**
         * Program does W^X violations
         */
        const OPENBSD_WXNEEDED = 1705237479;

        /**
         * No branch target CFI
         */
        const OPENBSD_NOBTCFI = 1705237480;

        /**
         * System call sites
         */
        const OPENBSD_SYSCALLS = 1705237481;

        /**
         * Section for boot arguments
         */
        const OPENBSD_BOOTDATA = 1705253862;

        /**
         * Reserved for internal use
         */
        const SUNW_SYSSTAT_ZONE = 1879048183;

        /**
         * Reserved for internal use
         */
        const SUNW_SYSSTAT = 1879048184;

        /**
         * Memory reservation
         */
        const SUNW_RESERVE = 1879048185;
        const SUNW_BSS = 1879048186;

        /**
         * Describes the stack segment
         */
        const SUNW_STACK = 1879048187;

        /**
         * Reserved for internal use by `dtrace(8)`
         */
        const SUNW_DTRACE = 1879048188;

        /**
         * Capability requirements
         */
        const SUNW_CAP = 1879048189;

        /**
         * Platform architecture compatibility information
         */
        const ARM_ARCHEXT = 1879048192;

        /**
         * Exception unwind tables
         */
        const ARM_EXIDX = 1879048193;

        /**
         * MTE memory tags
         */
        const AARCH64_MEMTAG_MTE = 1879048194;

        /**
         * RISC-V ELF attribute section (deprecated)
         */
        const RISCV_ATTRIBUTES = 1879048195;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 1684333904 => true, 1685382480 => true, 1685382481 => true, 1685382482 => true, 1685382483 => true, 1685382484 => true, 1694766464 => true, 1705237477 => true, 1705237478 => true, 1705237479 => true, 1705237480 => true, 1705237481 => true, 1705253862 => true, 1879048183 => true, 1879048184 => true, 1879048185 => true, 1879048186 => true, 1879048187 => true, 1879048188 => true, 1879048189 => true, 1879048192 => true, 1879048193 => true, 1879048194 => true, 1879048195 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
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

        private const _VALUES = [0 => true, 65280 => true, 65281 => true, 65282 => true, 65343 => true, 65521 => true, 65522 => true, 65535 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Elf {
    class ShType {

        /**
         * Section header table entry unused
         */
        const NULL_TYPE = 0;

        /**
         * Program specific (private) data
         */
        const PROGBITS = 1;

        /**
         * Link editing symbol table
         */
        const SYMTAB = 2;

        /**
         * String table
         */
        const STRTAB = 3;

        /**
         * Relocation entries with addends
         */
        const RELA = 4;

        /**
         * Symbol hash table
         */
        const HASH = 5;

        /**
         * Dynamic linking information
         */
        const DYNAMIC = 6;

        /**
         * Information that marks the file in some way
         */
        const NOTE = 7;

        /**
         * Section occupies no space in file
         */
        const NOBITS = 8;

        /**
         * Relocation entries, no addends
         */
        const REL = 9;

        /**
         * Reserved, unspecified semantics
         */
        const SHLIB = 10;

        /**
         * Dynamic linking symbol table
         */
        const DYNSYM = 11;

        /**
         * Pointers to initialization functions
         */
        const INIT_ARRAY = 14;

        /**
         * Pointers to termination functions
         */
        const FINI_ARRAY = 15;

        /**
         * Pointers to pre-init functions
         */
        const PREINIT_ARRAY = 16;

        /**
         * Section contains a section group
         */
        const GROUP = 17;

        /**
         * Indices for `SHN_XINDEX` entries
         */
        const SYMTAB_SHNDX = 18;

        /**
         * Relative relocations (only offsets)
         */
        const RELR = 19;

        /**
         * Android packed relocation entries, no addends
         */
        const ANDROID_REL = 1610612737;

        /**
         * Android packed relocation entries with addends
         */
        const ANDROID_RELA = 1610612738;

        /**
         * Incremental build data
         */
        const GNU_INCREMENTAL_INPUTS = 1879000832;

        /**
         * LLVM ODR table
         */
        const LLVM_ODRTAB = 1879002112;

        /**
         * LLVM Linker Options
         */
        const LLVM_LINKER_OPTIONS = 1879002113;

        /**
         * List of address-significant symbols for safe ICF
         */
        const LLVM_ADDRSIG = 1879002115;

        /**
         * LLVM Dependent Library Specifiers
         */
        const LLVM_DEPENDENT_LIBRARIES = 1879002116;

        /**
         * Symbol partition specification
         */
        const LLVM_SYMPART = 1879002117;

        /**
         * ELF header for loadable partition
         */
        const LLVM_PART_EHDR = 1879002118;

        /**
         * Phdrs for loadable partition
         */
        const LLVM_PART_PHDR = 1879002119;

        /**
         * LLVM Basic Block Address Map, version 0.
         * 
         * Superseded by `sh_type::llvm_bb_addr_map` (`SHT_LLVM_BB_ADDR_MAP`).
         * LLVM 21.1.0 removed support for this value - see
         * <https://github.com/llvm/llvm-project/commit/6b623a6622707ea47d84ab0069f766215a6fec44>
         * and [LLVM 21.1.0 Release Notes](https://releases.llvm.org/21.1.0/docs/ReleaseNotes.html#changes-to-the-llvm-tools).
         */
        const LLVM_BB_ADDR_MAP_V0 = 1879002120;

        /**
         * LLVM Call Graph Profile
         */
        const LLVM_CALL_GRAPH_PROFILE = 1879002121;

        /**
         * LLVM Basic Block Address Map
         */
        const LLVM_BB_ADDR_MAP = 1879002122;

        /**
         * LLVM device offloading data
         */
        const LLVM_OFFLOADING = 1879002123;

        /**
         * `.llvm.lto` section for fat LTO
         */
        const LLVM_LTO = 1879002124;

        /**
         * LLVM jump tables sizes
         */
        const LLVM_JT_SIZES = 1879002125;

        /**
         * LLVM CFI jump table
         */
        const LLVM_CFI_JUMP_TABLE = 1879002126;

        /**
         * LLVM Call Graph Section
         */
        const LLVM_CALL_GRAPH = 1879002127;

        /**
         * LLVM Dynamic Debugging ELF
         */
        const LLVM_DYNDBG_ELF = 1879002128;
        const ANDROID_RELR = 1879047936;
        const SUNW_CTF = 1879048171;
        const SUNW_SYMNSORT = 1879048172;
        const SUNW_PHNAME = 1879048173;
        const SUNW_ANCILLARY = 1879048174;
        const SUNW_CAPCHAIN = 1879048175;
        const SUNW_CAPINFO = 1879048176;
        const SUNW_SYMSORT = 1879048177;
        const SUNW_TLSSORT = 1879048178;
        const SUNW_LDYNSYM = 1879048179;

        /**
         * SFrame stack trace information (added in GNU Binutils 2.45)
         */
        const GNU_SFRAME = 1879048180;

        /**
         * Object attributes
         */
        const GNU_ATTRIBUTES = 1879048181;

        /**
         * GNU style symbol hash table
         */
        const GNU_HASH = 1879048182;

        /**
         * List of prelink dependencies
         */
        const GNU_LIBLIST = 1879048183;

        /**
         * Checksum for DSO content
         */
        const CHECKSUM = 1879048184;

        /**
         * Object only
         */
        const GNU_OBJECT_ONLY = 1879048185;
        const SUNW_MOVE = 1879048186;
        const SUNW_COMDAT = 1879048187;
        const SUNW_SYMINFO = 1879048188;

        /**
         * Versions defined by file
         */
        const GNU_VERDEF = 1879048189;

        /**
         * Versions needed by file
         */
        const GNU_VERNEED = 1879048190;

        /**
         * Symbol versions
         */
        const GNU_VERSYM = 1879048191;
        const SPARC_GOTDATA = 1879048192;

        /**
         * Unwind information
         */
        const X86_64_UNWIND = 1879048193;

        /**
         * Preemption details
         */
        const ARM_PREEMPTMAP = 1879048194;

        /**
         * ARM build attributes
         */
        const ARM_ATTRIBUTES = 1879048195;

        /**
         * Overlay debug info
         */
        const ARM_DEBUGOVERLAY = 1879048196;

        /**
         * GDB and overlay integration info
         */
        const ARM_OVERLAYSECTION = 1879048197;
        const AARCH64_MEMTAG_GLOBALS_STATIC = 1879048199;
        const AARCH64_MEMTAG_GLOBALS_DYNAMIC = 1879048200;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 14 => true, 15 => true, 16 => true, 17 => true, 18 => true, 19 => true, 1610612737 => true, 1610612738 => true, 1879000832 => true, 1879002112 => true, 1879002113 => true, 1879002115 => true, 1879002116 => true, 1879002117 => true, 1879002118 => true, 1879002119 => true, 1879002120 => true, 1879002121 => true, 1879002122 => true, 1879002123 => true, 1879002124 => true, 1879002125 => true, 1879002126 => true, 1879002127 => true, 1879002128 => true, 1879047936 => true, 1879048171 => true, 1879048172 => true, 1879048173 => true, 1879048174 => true, 1879048175 => true, 1879048176 => true, 1879048177 => true, 1879048178 => true, 1879048179 => true, 1879048180 => true, 1879048181 => true, 1879048182 => true, 1879048183 => true, 1879048184 => true, 1879048185 => true, 1879048186 => true, 1879048187 => true, 1879048188 => true, 1879048189 => true, 1879048190 => true, 1879048191 => true, 1879048192 => true, 1879048193 => true, 1879048194 => true, 1879048195 => true, 1879048196 => true, 1879048197 => true, 1879048199 => true, 1879048200 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
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

        private const _VALUES = [0 => true, 1 => true, 2 => true, 10 => true, 11 => true, 12 => true, 13 => true, 14 => true, 15 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
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

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 14 => true, 15 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
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

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Elf {
    class VersionIndexSpecial {

        /**
         * The symbol is local, not available outside the object.
         */
        const LOCAL = 0;

        /**
         * The symbol is defined in this object and is globally available. It's
         * assigned to the base version definition. This value is used for
         * unversioned symbols.
         * 
         * As of KSC 0.9, this enum key can't be called `global` because it would
         * cause a syntax error in Python (it is a keyword).
         */
        const GLOBAL_SYMBOL = 1;

        /**
         * Symbol is to be eliminated.
         * 
         * This appears to be a Solaris-specific value - as far as I know, no GNU
         * software (such as glibc or binutils) uses it.
         */
        const ELIMINATE = 65281;

        private const _VALUES = [0 => true, 1 => true, 65281 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
