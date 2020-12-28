<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Header and a footer for stock firmwares used on some ASUS routers. trx files not necessarily contain these headers.
 */

namespace {
    class AsusTrx extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \AsusTrx $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_header;
        public function header() {
            if ($this->_m_header !== null)
                return $this->_m_header;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_header = new \AsusTrx\Header($this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_header;
        }
        protected $_m_tail;
        public function tail() {
            if ($this->_m_tail !== null)
                return $this->_m_tail;
            $_pos = $this->_io->pos();
            $this->_io->seek(($this->_io()->size() - 64));
            $this->_m_tail = new \AsusTrx\Tail($this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_tail;
        }
    }
}

namespace AsusTrx {
    class Revision extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \AsusTrx\Tail\HwCompInfo $_parent = null, \AsusTrx $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_major = $this->_io->readU1();
            $this->_m_minor = $this->_io->readU1();
        }
        protected $_m_major;
        protected $_m_minor;
        public function major() { return $this->_m_major; }
        public function minor() { return $this->_m_minor; }
    }
}

namespace AsusTrx {
    class Version extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \AsusTrx\Tail $_parent = null, \AsusTrx $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_major = $this->_io->readU1();
            $this->_m_minor = $this->_io->readU1();
            $this->_m_patch = $this->_io->readU1();
            $this->_m_tweak = $this->_io->readU1();
        }
        protected $_m_major;
        protected $_m_minor;
        protected $_m_patch;
        protected $_m_tweak;
        public function major() { return $this->_m_major; }
        public function minor() { return $this->_m_minor; }
        public function patch() { return $this->_m_patch; }
        public function tweak() { return $this->_m_tweak; }
    }
}

/**
 * A safeguard against installation of firmware to an incompatible device
 */

namespace AsusTrx {
    class Tail extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \AsusTrx $_parent = null, \AsusTrx $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_version = new \AsusTrx\Version($this->_io, $this, $this->_root);
            $this->_m_productId = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(12), 0, false), "utf-8");
            $this->_m_compHw = [];
            $n = 4;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_compHw[] = new \AsusTrx\Tail\HwCompInfo($this->_io, $this, $this->_root);
            }
            $this->_m_reserved = $this->_io->readBytes(32);
        }
        protected $_m_version;
        protected $_m_productId;
        protected $_m_compHw;
        protected $_m_reserved;

        /**
         * 1.9.2.7 by default
         */
        public function version() { return $this->_m_version; }
        public function productId() { return $this->_m_productId; }

        /**
         * 0.02 - 2.99
         */
        public function compHw() { return $this->_m_compHw; }
        public function reserved() { return $this->_m_reserved; }
    }
}

namespace AsusTrx\Tail {
    class HwCompInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \AsusTrx\Tail $_parent = null, \AsusTrx $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_min = new \AsusTrx\Revision($this->_io, $this, $this->_root);
            $this->_m_max = new \AsusTrx\Revision($this->_io, $this, $this->_root);
        }
        protected $_m_min;
        protected $_m_max;
        public function min() { return $this->_m_min; }
        public function max() { return $this->_m_max; }
    }
}

namespace AsusTrx {
    class Header extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \AsusTrx $_parent = null, \AsusTrx $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_signature = $this->_io->readBytes(4);
            if (!($this->signature() == "\x48\x44\x52\x30")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x48\x44\x52\x30", $this->signature(), $this->_io(), "/types/header/seq/0");
            }
            $this->_m_len = $this->_io->readU4le();
            $this->_m_crc32 = $this->_io->readU4le();
            $this->_m_version = $this->_io->readU2le();
            $this->_m_flags = new \AsusTrx\Header\Flags($this->_io, $this, $this->_root);
            $this->_m_partitions = [];
            $i = 0;
            do {
                $_ = new \AsusTrx\Header\Partition($i, $this->_io, $this, $this->_root);
                $this->_m_partitions[] = $_;
                $i++;
            } while (!( (($i >= 4) || (!($_->present()))) ));
        }
        protected $_m_signature;
        protected $_m_len;
        protected $_m_crc32;
        protected $_m_version;
        protected $_m_flags;
        protected $_m_partitions;
        public function signature() { return $this->_m_signature; }

        /**
         * Length of file including header
         */
        public function len() { return $this->_m_len; }

        /**
         * CRC from `version` (??? todo: see the original and disambiguate) to end of file
         */
        public function crc32() { return $this->_m_crc32; }
        public function version() { return $this->_m_version; }
        public function flags() { return $this->_m_flags; }

        /**
         * Offsets of partitions from start of header
         */
        public function partitions() { return $this->_m_partitions; }
    }
}

namespace AsusTrx\Header {
    class Partition extends \Kaitai\Struct\Struct {
        public function __construct(int $idx, \Kaitai\Struct\Stream $_io, \AsusTrx\Header $_parent = null, \AsusTrx $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_idx = $idx;
            $this->_read();
        }

        private function _read() {
            $this->_m_offset = $this->_io->readU4le();
        }
        protected $_m_present;
        public function present() {
            if ($this->_m_present !== null)
                return $this->_m_present;
            $this->_m_present = $this->offset() != 0;
            return $this->_m_present;
        }
        protected $_m_isLast;
        public function isLast() {
            if ($this->_m_isLast !== null)
                return $this->_m_isLast;
            if ($this->present()) {
                $this->_m_isLast =  (($this->idx() == (count($this->_parent()->partitions()) - 1)) || (!($this->_parent()->partitions()[($this->idx() + 1)]->present()))) ;
            }
            return $this->_m_isLast;
        }
        protected $_m_size;
        public function size() {
            if ($this->_m_size !== null)
                return $this->_m_size;
            if ($this->present()) {
                $this->_m_size = ($this->isLast() ? ($this->_root()->_io()->size() - $this->offset()) : $this->_parent()->partitions()[($this->idx() + 1)]->offset());
            }
            return $this->_m_size;
        }
        protected $_m_partition;
        public function partition() {
            if ($this->_m_partition !== null)
                return $this->_m_partition;
            if ($this->present()) {
                $io = $this->_root()->_io();
                $_pos = $io->pos();
                $io->seek($this->offset());
                $this->_m_partition = $io->readBytes($this->size());
                $io->seek($_pos);
            }
            return $this->_m_partition;
        }
        protected $_m_offset;
        protected $_m_idx;
        public function offset() { return $this->_m_offset; }
        public function idx() { return $this->_m_idx; }
    }
}

namespace AsusTrx\Header {
    class Flags extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \AsusTrx\Header $_parent = null, \AsusTrx $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_flags = [];
            $n = 16;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_flags[] = $this->_io->readBitsIntLe(1) != 0;
            }
        }
        protected $_m_flags;
        public function flags() { return $this->_m_flags; }
    }
}
