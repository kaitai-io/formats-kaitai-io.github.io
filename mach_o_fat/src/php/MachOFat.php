<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * This is a simple container format that encapsulates multiple Mach-O files,
 * each generally for a different architecture. XNU can execute these files just
 * like single-arch Mach-Os and will pick the appropriate entry.
 */

namespace {
    class MachOFat extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\MachOFat $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->_m_magic == "\xCA\xFE\xBA\xBE")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\xCA\xFE\xBA\xBE", $this->_m_magic, $this->_io, "/seq/0");
            }
            $this->_m_numFatArch = $this->_io->readU4be();
            $this->_m_fatArchs = [];
            $n = $this->numFatArch();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_fatArchs[] = new \MachOFat\FatArch($this->_io, $this, $this->_root);
            }
        }
        protected $_m_magic;
        protected $_m_numFatArch;
        protected $_m_fatArchs;
        public function magic() { return $this->_m_magic; }
        public function numFatArch() { return $this->_m_numFatArch; }
        public function fatArchs() { return $this->_m_fatArchs; }
    }
}

namespace MachOFat {
    class FatArch extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MachOFat $_parent = null, ?\MachOFat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_cpuType = $this->_io->readU4be();
            $this->_m_cpuSubtype = $this->_io->readU4be();
            $this->_m_ofsObject = $this->_io->readU4be();
            $this->_m_lenObject = $this->_io->readU4be();
            $this->_m_align = $this->_io->readU4be();
        }
        protected $_m_object;
        public function object() {
            if ($this->_m_object !== null)
                return $this->_m_object;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsObject());
            $this->_m__raw_object = $this->_io->readBytes($this->lenObject());
            $_io__raw_object = new \Kaitai\Struct\Stream($this->_m__raw_object);
            $this->_m_object = new \MachO($_io__raw_object);
            $this->_io->seek($_pos);
            return $this->_m_object;
        }
        protected $_m_cpuType;
        protected $_m_cpuSubtype;
        protected $_m_ofsObject;
        protected $_m_lenObject;
        protected $_m_align;
        protected $_m__raw_object;
        public function cpuType() { return $this->_m_cpuType; }
        public function cpuSubtype() { return $this->_m_cpuSubtype; }
        public function ofsObject() { return $this->_m_ofsObject; }
        public function lenObject() { return $this->_m_lenObject; }
        public function align() { return $this->_m_align; }
        public function _raw_object() { return $this->_m__raw_object; }
    }
}
