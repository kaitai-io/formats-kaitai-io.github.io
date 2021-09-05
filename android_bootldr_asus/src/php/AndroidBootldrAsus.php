<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * A bootloader image which only seems to have been used on a few ASUS
 * devices. The encoding is ASCII, because the `releasetools.py` script
 * is written using Python 2, where the default encoding is ASCII.
 * 
 * A test file can be found in the firmware files for the "fugu" device,
 * which can be downloaded from <https://developers.google.com/android/images>
 */

namespace {
    class AndroidBootldrAsus extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \AndroidBootldrAsus $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(8);
            if (!($this->magic() == "\x42\x4F\x4F\x54\x4C\x44\x52\x21")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x42\x4F\x4F\x54\x4C\x44\x52\x21", $this->magic(), $this->_io(), "/seq/0");
            }
            $this->_m_revision = $this->_io->readU2le();
            if (!($this->revision() >= 2)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(2, $this->revision(), $this->_io(), "/seq/1");
            }
            $this->_m_reserved1 = $this->_io->readU2le();
            $this->_m_reserved2 = $this->_io->readU4le();
            $this->_m_images = [];
            $n = 3;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_images[] = new \AndroidBootldrAsus\Image($this->_io, $this, $this->_root);
            }
        }
        protected $_m_magic;
        protected $_m_revision;
        protected $_m_reserved1;
        protected $_m_reserved2;
        protected $_m_images;
        public function magic() { return $this->_m_magic; }
        public function revision() { return $this->_m_revision; }
        public function reserved1() { return $this->_m_reserved1; }
        public function reserved2() { return $this->_m_reserved2; }

        /**
         * Only three images are included: `ifwi.bin`, `droidboot.img`
         * and `splashscreen.img`
         */
        public function images() { return $this->_m_images; }
    }
}

namespace AndroidBootldrAsus {
    class Image extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \AndroidBootldrAsus $_parent = null, \AndroidBootldrAsus $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_chunkId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(8), "ASCII");
            if (!( (($this->chunkId() == "IFWI!!!!") || ($this->chunkId() == "DROIDBT!") || ($this->chunkId() == "SPLASHS!")) )) {
                throw new \Kaitai\Struct\Error\ValidationNotAnyOfError($this->chunkId(), $this->_io(), "/types/image/seq/0");
            }
            $this->_m_lenBody = $this->_io->readU4le();
            $this->_m_flags = $this->_io->readU1();
            $_ = $this->flags();
            if (!(($_ & 1) != 0)) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->flags(), $this->_io(), "/types/image/seq/2");
            }
            $this->_m_reserved1 = $this->_io->readU1();
            $this->_m_reserved2 = $this->_io->readU1();
            $this->_m_reserved3 = $this->_io->readU1();
            $this->_m_body = $this->_io->readBytes($this->lenBody());
        }
        protected $_m_fileName;
        public function fileName() {
            if ($this->_m_fileName !== null)
                return $this->_m_fileName;
            $this->_m_fileName = ($this->chunkId() == "IFWI!!!!" ? "ifwi.bin" : ($this->chunkId() == "DROIDBT!" ? "droidboot.img" : ($this->chunkId() == "SPLASHS!" ? "splashscreen.img" : "")));
            return $this->_m_fileName;
        }
        protected $_m_chunkId;
        protected $_m_lenBody;
        protected $_m_flags;
        protected $_m_reserved1;
        protected $_m_reserved2;
        protected $_m_reserved3;
        protected $_m_body;
        public function chunkId() { return $this->_m_chunkId; }
        public function lenBody() { return $this->_m_lenBody; }
        public function flags() { return $this->_m_flags; }
        public function reserved1() { return $this->_m_reserved1; }
        public function reserved2() { return $this->_m_reserved2; }
        public function reserved3() { return $this->_m_reserved3; }
        public function body() { return $this->_m_body; }
    }
}
