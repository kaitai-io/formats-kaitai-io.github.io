<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Format for Android DTB/DTBO partitions. It's kind of archive with
 * dtb/dtbo files. Used only when there is a separate unique partition
 * (dtb, dtbo) on an android device to organize device tree files.
 * The format consists of a header with info about size and number
 * of device tree entries and the entries themselves. This format
 * description could be used to extract device tree entries from a
 * partition images and decompile them with dtc (device tree compiler).
 */

namespace {
    class AndroidDto extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \AndroidDto $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \AndroidDto\DtTableHeader($this->_io, $this, $this->_root);
            $this->_m_entries = [];
            $n = $this->header()->dtEntryCount();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_entries[] = new \AndroidDto\DtTableEntry($this->_io, $this, $this->_root);
            }
        }
        protected $_m_header;
        protected $_m_entries;
        public function header() { return $this->_m_header; }
        public function entries() { return $this->_m_entries; }
    }
}

namespace AndroidDto {
    class DtTableHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \AndroidDto $_parent = null, \AndroidDto $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->magic() == "\xD7\xB7\xAB\x1E")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\xD7\xB7\xAB\x1E", $this->magic(), $this->_io(), "/types/dt_table_header/seq/0");
            }
            $this->_m_totalSize = $this->_io->readU4be();
            $this->_m_headerSize = $this->_io->readU4be();
            $this->_m_dtEntrySize = $this->_io->readU4be();
            $this->_m_dtEntryCount = $this->_io->readU4be();
            $this->_m_dtEntriesOffset = $this->_io->readU4be();
            $this->_m_pageSize = $this->_io->readU4be();
            $this->_m_version = $this->_io->readU4be();
        }
        protected $_m_magic;
        protected $_m_totalSize;
        protected $_m_headerSize;
        protected $_m_dtEntrySize;
        protected $_m_dtEntryCount;
        protected $_m_dtEntriesOffset;
        protected $_m_pageSize;
        protected $_m_version;
        public function magic() { return $this->_m_magic; }

        /**
         * includes dt_table_header + all dt_table_entry and all dtb/dtbo
         */
        public function totalSize() { return $this->_m_totalSize; }

        /**
         * sizeof(dt_table_header)
         */
        public function headerSize() { return $this->_m_headerSize; }

        /**
         * sizeof(dt_table_entry)
         */
        public function dtEntrySize() { return $this->_m_dtEntrySize; }

        /**
         * number of dt_table_entry
         */
        public function dtEntryCount() { return $this->_m_dtEntryCount; }

        /**
         * offset to the first dt_table_entry from head of dt_table_header
         */
        public function dtEntriesOffset() { return $this->_m_dtEntriesOffset; }

        /**
         * flash page size
         */
        public function pageSize() { return $this->_m_pageSize; }

        /**
         * DTBO image version
         */
        public function version() { return $this->_m_version; }
    }
}

namespace AndroidDto {
    class DtTableEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \AndroidDto $_parent = null, \AndroidDto $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_dtSize = $this->_io->readU4be();
            $this->_m_dtOffset = $this->_io->readU4be();
            $this->_m_id = $this->_io->readU4be();
            $this->_m_rev = $this->_io->readU4be();
            $this->_m_custom = [];
            $n = 4;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_custom[] = $this->_io->readU4be();
            }
        }
        protected $_m_body;

        /**
         * DTB/DTBO file
         */
        public function body() {
            if ($this->_m_body !== null)
                return $this->_m_body;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->dtOffset());
            $this->_m_body = $io->readBytes($this->dtSize());
            $io->seek($_pos);
            return $this->_m_body;
        }
        protected $_m_dtSize;
        protected $_m_dtOffset;
        protected $_m_id;
        protected $_m_rev;
        protected $_m_custom;

        /**
         * size of this entry
         */
        public function dtSize() { return $this->_m_dtSize; }

        /**
         * offset from head of dt_table_header
         */
        public function dtOffset() { return $this->_m_dtOffset; }

        /**
         * optional, must be zero if unused
         */
        public function id() { return $this->_m_id; }

        /**
         * optional, must be zero if unused
         */
        public function rev() { return $this->_m_rev; }

        /**
         * optional, must be zero if unused
         */
        public function custom() { return $this->_m_custom; }
    }
}
