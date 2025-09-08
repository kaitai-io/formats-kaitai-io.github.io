<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class AndroidImg extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\AndroidImg $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(8);
            if (!($this->_m_magic == "\x41\x4E\x44\x52\x4F\x49\x44\x21")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x41\x4E\x44\x52\x4F\x49\x44\x21", $this->_m_magic, $this->_io, "/seq/0");
            }
            $this->_m_kernel = new \AndroidImg\Load($this->_io, $this, $this->_root);
            $this->_m_ramdisk = new \AndroidImg\Load($this->_io, $this, $this->_root);
            $this->_m_second = new \AndroidImg\Load($this->_io, $this, $this->_root);
            $this->_m_tagsLoad = $this->_io->readU4le();
            $this->_m_pageSize = $this->_io->readU4le();
            $this->_m_headerVersion = $this->_io->readU4le();
            $this->_m_osVersion = new \AndroidImg\OsVersion($this->_io, $this, $this->_root);
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(16), 0, false), "ASCII");
            $this->_m_cmdline = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(512), 0, false), "ASCII");
            $this->_m_sha = $this->_io->readBytes(32);
            $this->_m_extraCmdline = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(1024), 0, false), "ASCII");
            if ($this->headerVersion() > 0) {
                $this->_m_recoveryDtbo = new \AndroidImg\SizeOffset($this->_io, $this, $this->_root);
            }
            if ($this->headerVersion() > 0) {
                $this->_m_bootHeaderSize = $this->_io->readU4le();
            }
            if ($this->headerVersion() > 1) {
                $this->_m_dtb = new \AndroidImg\LoadLong($this->_io, $this, $this->_root);
            }
        }
        protected $_m_base;

        /**
         * base loading address
         */
        public function base() {
            if ($this->_m_base !== null)
                return $this->_m_base;
            $this->_m_base = $this->kernel()->addr() - 32768;
            return $this->_m_base;
        }
        protected $_m_dtbImg;
        public function dtbImg() {
            if ($this->_m_dtbImg !== null)
                return $this->_m_dtbImg;
            if ( (($this->headerVersion() > 1) && ($this->dtb()->size() > 0)) ) {
                $_pos = $this->_io->pos();
                $this->_io->seek(intval((((((($this->pageSize() + $this->kernel()->size()) + $this->ramdisk()->size()) + $this->second()->size()) + $this->recoveryDtbo()->size()) + $this->pageSize()) - 1) / $this->pageSize()) * $this->pageSize());
                $this->_m_dtbImg = $this->_io->readBytes($this->dtb()->size());
                $this->_io->seek($_pos);
            }
            return $this->_m_dtbImg;
        }
        protected $_m_dtbOffset;

        /**
         * dtb offset from base
         */
        public function dtbOffset() {
            if ($this->_m_dtbOffset !== null)
                return $this->_m_dtbOffset;
            if ($this->headerVersion() > 1) {
                $this->_m_dtbOffset = ($this->dtb()->addr() > 0 ? $this->dtb()->addr() - $this->base() : 0);
            }
            return $this->_m_dtbOffset;
        }
        protected $_m_kernelImg;
        public function kernelImg() {
            if ($this->_m_kernelImg !== null)
                return $this->_m_kernelImg;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->pageSize());
            $this->_m_kernelImg = $this->_io->readBytes($this->kernel()->size());
            $this->_io->seek($_pos);
            return $this->_m_kernelImg;
        }
        protected $_m_kernelOffset;

        /**
         * kernel offset from base
         */
        public function kernelOffset() {
            if ($this->_m_kernelOffset !== null)
                return $this->_m_kernelOffset;
            $this->_m_kernelOffset = $this->kernel()->addr() - $this->base();
            return $this->_m_kernelOffset;
        }
        protected $_m_ramdiskImg;
        public function ramdiskImg() {
            if ($this->_m_ramdiskImg !== null)
                return $this->_m_ramdiskImg;
            if ($this->ramdisk()->size() > 0) {
                $_pos = $this->_io->pos();
                $this->_io->seek(intval(((($this->pageSize() + $this->kernel()->size()) + $this->pageSize()) - 1) / $this->pageSize()) * $this->pageSize());
                $this->_m_ramdiskImg = $this->_io->readBytes($this->ramdisk()->size());
                $this->_io->seek($_pos);
            }
            return $this->_m_ramdiskImg;
        }
        protected $_m_ramdiskOffset;

        /**
         * ramdisk offset from base
         */
        public function ramdiskOffset() {
            if ($this->_m_ramdiskOffset !== null)
                return $this->_m_ramdiskOffset;
            $this->_m_ramdiskOffset = ($this->ramdisk()->addr() > 0 ? $this->ramdisk()->addr() - $this->base() : 0);
            return $this->_m_ramdiskOffset;
        }
        protected $_m_recoveryDtboImg;
        public function recoveryDtboImg() {
            if ($this->_m_recoveryDtboImg !== null)
                return $this->_m_recoveryDtboImg;
            if ( (($this->headerVersion() > 0) && ($this->recoveryDtbo()->size() > 0)) ) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->recoveryDtbo()->offset());
                $this->_m_recoveryDtboImg = $this->_io->readBytes($this->recoveryDtbo()->size());
                $this->_io->seek($_pos);
            }
            return $this->_m_recoveryDtboImg;
        }
        protected $_m_secondImg;
        public function secondImg() {
            if ($this->_m_secondImg !== null)
                return $this->_m_secondImg;
            if ($this->second()->size() > 0) {
                $_pos = $this->_io->pos();
                $this->_io->seek(intval((((($this->pageSize() + $this->kernel()->size()) + $this->ramdisk()->size()) + $this->pageSize()) - 1) / $this->pageSize()) * $this->pageSize());
                $this->_m_secondImg = $this->_io->readBytes($this->second()->size());
                $this->_io->seek($_pos);
            }
            return $this->_m_secondImg;
        }
        protected $_m_secondOffset;

        /**
         * 2nd bootloader offset from base
         */
        public function secondOffset() {
            if ($this->_m_secondOffset !== null)
                return $this->_m_secondOffset;
            $this->_m_secondOffset = ($this->second()->addr() > 0 ? $this->second()->addr() - $this->base() : 0);
            return $this->_m_secondOffset;
        }
        protected $_m_tagsOffset;

        /**
         * tags offset from base
         */
        public function tagsOffset() {
            if ($this->_m_tagsOffset !== null)
                return $this->_m_tagsOffset;
            $this->_m_tagsOffset = $this->tagsLoad() - $this->base();
            return $this->_m_tagsOffset;
        }
        protected $_m_magic;
        protected $_m_kernel;
        protected $_m_ramdisk;
        protected $_m_second;
        protected $_m_tagsLoad;
        protected $_m_pageSize;
        protected $_m_headerVersion;
        protected $_m_osVersion;
        protected $_m_name;
        protected $_m_cmdline;
        protected $_m_sha;
        protected $_m_extraCmdline;
        protected $_m_recoveryDtbo;
        protected $_m_bootHeaderSize;
        protected $_m_dtb;
        public function magic() { return $this->_m_magic; }
        public function kernel() { return $this->_m_kernel; }
        public function ramdisk() { return $this->_m_ramdisk; }
        public function second() { return $this->_m_second; }
        public function tagsLoad() { return $this->_m_tagsLoad; }
        public function pageSize() { return $this->_m_pageSize; }
        public function headerVersion() { return $this->_m_headerVersion; }
        public function osVersion() { return $this->_m_osVersion; }
        public function name() { return $this->_m_name; }
        public function cmdline() { return $this->_m_cmdline; }
        public function sha() { return $this->_m_sha; }
        public function extraCmdline() { return $this->_m_extraCmdline; }
        public function recoveryDtbo() { return $this->_m_recoveryDtbo; }
        public function bootHeaderSize() { return $this->_m_bootHeaderSize; }
        public function dtb() { return $this->_m_dtb; }
    }
}

namespace AndroidImg {
    class Load extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AndroidImg $_parent = null, ?\AndroidImg $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_size = $this->_io->readU4le();
            $this->_m_addr = $this->_io->readU4le();
        }
        protected $_m_size;
        protected $_m_addr;
        public function size() { return $this->_m_size; }
        public function addr() { return $this->_m_addr; }
    }
}

namespace AndroidImg {
    class LoadLong extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AndroidImg $_parent = null, ?\AndroidImg $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_size = $this->_io->readU4le();
            $this->_m_addr = $this->_io->readU8le();
        }
        protected $_m_size;
        protected $_m_addr;
        public function size() { return $this->_m_size; }
        public function addr() { return $this->_m_addr; }
    }
}

namespace AndroidImg {
    class OsVersion extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AndroidImg $_parent = null, ?\AndroidImg $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_version = $this->_io->readU4le();
        }
        protected $_m_major;
        public function major() {
            if ($this->_m_major !== null)
                return $this->_m_major;
            $this->_m_major = $this->version() >> 25 & 127;
            return $this->_m_major;
        }
        protected $_m_minor;
        public function minor() {
            if ($this->_m_minor !== null)
                return $this->_m_minor;
            $this->_m_minor = $this->version() >> 18 & 127;
            return $this->_m_minor;
        }
        protected $_m_month;
        public function month() {
            if ($this->_m_month !== null)
                return $this->_m_month;
            $this->_m_month = $this->version() & 15;
            return $this->_m_month;
        }
        protected $_m_patch;
        public function patch() {
            if ($this->_m_patch !== null)
                return $this->_m_patch;
            $this->_m_patch = $this->version() >> 11 & 127;
            return $this->_m_patch;
        }
        protected $_m_year;
        public function year() {
            if ($this->_m_year !== null)
                return $this->_m_year;
            $this->_m_year = ($this->version() >> 4 & 127) + 2000;
            return $this->_m_year;
        }
        protected $_m_version;
        public function version() { return $this->_m_version; }
    }
}

namespace AndroidImg {
    class SizeOffset extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AndroidImg $_parent = null, ?\AndroidImg $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_size = $this->_io->readU4le();
            $this->_m_offset = $this->_io->readU8le();
        }
        protected $_m_size;
        protected $_m_offset;
        public function size() { return $this->_m_size; }
        public function offset() { return $this->_m_offset; }
    }
}
