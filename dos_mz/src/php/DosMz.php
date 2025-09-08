<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * DOS MZ file format is a traditional format for executables in MS-DOS
 * environment. Many modern formats (i.e. Windows PE) still maintain
 * compatibility stub with this format.
 * 
 * As opposed to .com file format (which basically sports one 64K code
 * segment of raw CPU instructions), DOS MZ .exe file format allowed
 * more flexible memory management, loading of larger programs and
 * added support for relocations.
 */

namespace {
    class DosMz extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\DosMz $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \DosMz\ExeHeader($this->_io, $this, $this->_root);
            $this->_m_body = $this->_io->readBytes($this->header()->lenBody());
        }
        protected $_m_relocations;
        public function relocations() {
            if ($this->_m_relocations !== null)
                return $this->_m_relocations;
            if ($this->header()->mz()->ofsRelocations() != 0) {
                $io = $this->header()->_io();
                $_pos = $io->pos();
                $io->seek($this->header()->mz()->ofsRelocations());
                $this->_m_relocations = [];
                $n = $this->header()->mz()->numRelocations();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_relocations[] = new \DosMz\Relocation($io, $this, $this->_root);
                }
                $io->seek($_pos);
            }
            return $this->_m_relocations;
        }
        protected $_m_header;
        protected $_m_body;
        public function header() { return $this->_m_header; }
        public function body() { return $this->_m_body; }
    }
}

namespace DosMz {
    class ExeHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DosMz $_parent = null, ?\DosMz $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_mz = new \DosMz\MzHeader($this->_io, $this, $this->_root);
            $this->_m_restOfHeader = $this->_io->readBytes($this->mz()->lenHeader() - 28);
        }
        protected $_m_lenBody;
        public function lenBody() {
            if ($this->_m_lenBody !== null)
                return $this->_m_lenBody;
            $this->_m_lenBody = ($this->mz()->lastPageExtraBytes() == 0 ? $this->mz()->numPages() * 512 : ($this->mz()->numPages() - 1) * 512 + $this->mz()->lastPageExtraBytes()) - $this->mz()->lenHeader();
            return $this->_m_lenBody;
        }
        protected $_m_mz;
        protected $_m_restOfHeader;
        public function mz() { return $this->_m_mz; }
        public function restOfHeader() { return $this->_m_restOfHeader; }
    }
}

namespace DosMz {
    class MzHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DosMz\ExeHeader $_parent = null, ?\DosMz $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(2), "ASCII");
            if (!( (($this->_m_magic == "MZ") || ($this->_m_magic == "ZM")) )) {
                throw new \Kaitai\Struct\Error\ValidationNotAnyOfError($this->_m_magic, $this->_io, "/types/mz_header/seq/0");
            }
            $this->_m_lastPageExtraBytes = $this->_io->readU2le();
            $this->_m_numPages = $this->_io->readU2le();
            $this->_m_numRelocations = $this->_io->readU2le();
            $this->_m_headerSize = $this->_io->readU2le();
            $this->_m_minAllocation = $this->_io->readU2le();
            $this->_m_maxAllocation = $this->_io->readU2le();
            $this->_m_initialSs = $this->_io->readU2le();
            $this->_m_initialSp = $this->_io->readU2le();
            $this->_m_checksum = $this->_io->readU2le();
            $this->_m_initialIp = $this->_io->readU2le();
            $this->_m_initialCs = $this->_io->readU2le();
            $this->_m_ofsRelocations = $this->_io->readU2le();
            $this->_m_overlayId = $this->_io->readU2le();
        }
        protected $_m_lenHeader;
        public function lenHeader() {
            if ($this->_m_lenHeader !== null)
                return $this->_m_lenHeader;
            $this->_m_lenHeader = $this->headerSize() * 16;
            return $this->_m_lenHeader;
        }
        protected $_m_magic;
        protected $_m_lastPageExtraBytes;
        protected $_m_numPages;
        protected $_m_numRelocations;
        protected $_m_headerSize;
        protected $_m_minAllocation;
        protected $_m_maxAllocation;
        protected $_m_initialSs;
        protected $_m_initialSp;
        protected $_m_checksum;
        protected $_m_initialIp;
        protected $_m_initialCs;
        protected $_m_ofsRelocations;
        protected $_m_overlayId;
        public function magic() { return $this->_m_magic; }
        public function lastPageExtraBytes() { return $this->_m_lastPageExtraBytes; }
        public function numPages() { return $this->_m_numPages; }
        public function numRelocations() { return $this->_m_numRelocations; }
        public function headerSize() { return $this->_m_headerSize; }
        public function minAllocation() { return $this->_m_minAllocation; }
        public function maxAllocation() { return $this->_m_maxAllocation; }
        public function initialSs() { return $this->_m_initialSs; }
        public function initialSp() { return $this->_m_initialSp; }
        public function checksum() { return $this->_m_checksum; }
        public function initialIp() { return $this->_m_initialIp; }
        public function initialCs() { return $this->_m_initialCs; }
        public function ofsRelocations() { return $this->_m_ofsRelocations; }
        public function overlayId() { return $this->_m_overlayId; }
    }
}

namespace DosMz {
    class Relocation extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DosMz $_parent = null, ?\DosMz $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ofs = $this->_io->readU2le();
            $this->_m_seg = $this->_io->readU2le();
        }
        protected $_m_ofs;
        protected $_m_seg;
        public function ofs() { return $this->_m_ofs; }
        public function seg() { return $this->_m_seg; }
    }
}
