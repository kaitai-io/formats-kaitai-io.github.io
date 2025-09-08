<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class PsxTim extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\PsxTim $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->_m_magic == "\x10\x00\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x10\x00\x00\x00", $this->_m_magic, $this->_io, "/seq/0");
            }
            $this->_m_flags = $this->_io->readU4le();
            if ($this->hasClut()) {
                $this->_m_clut = new \PsxTim\Bitmap($this->_io, $this, $this->_root);
            }
            $this->_m_img = new \PsxTim\Bitmap($this->_io, $this, $this->_root);
        }
        protected $_m_bpp;
        public function bpp() {
            if ($this->_m_bpp !== null)
                return $this->_m_bpp;
            $this->_m_bpp = $this->flags() & 3;
            return $this->_m_bpp;
        }
        protected $_m_hasClut;
        public function hasClut() {
            if ($this->_m_hasClut !== null)
                return $this->_m_hasClut;
            $this->_m_hasClut = ($this->flags() & 8) != 0;
            return $this->_m_hasClut;
        }
        protected $_m_magic;
        protected $_m_flags;
        protected $_m_clut;
        protected $_m_img;
        public function magic() { return $this->_m_magic; }

        /**
         * Encodes bits-per-pixel and whether CLUT is present in a file or not
         */
        public function flags() { return $this->_m_flags; }

        /**
         * CLUT (Color LookUp Table), one or several palettes for indexed color image, represented as a
         */
        public function clut() { return $this->_m_clut; }
        public function img() { return $this->_m_img; }
    }
}

namespace PsxTim {
    class Bitmap extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\PsxTim $_parent = null, ?\PsxTim $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_len = $this->_io->readU4le();
            $this->_m_originX = $this->_io->readU2le();
            $this->_m_originY = $this->_io->readU2le();
            $this->_m_width = $this->_io->readU2le();
            $this->_m_height = $this->_io->readU2le();
            $this->_m_body = $this->_io->readBytes($this->len() - 12);
        }
        protected $_m_len;
        protected $_m_originX;
        protected $_m_originY;
        protected $_m_width;
        protected $_m_height;
        protected $_m_body;
        public function len() { return $this->_m_len; }
        public function originX() { return $this->_m_originX; }
        public function originY() { return $this->_m_originY; }
        public function width() { return $this->_m_width; }
        public function height() { return $this->_m_height; }
        public function body() { return $this->_m_body; }
    }
}

namespace PsxTim {
    class BppType {
        const BPP_4 = 0;
        const BPP_8 = 1;
        const BPP_16 = 2;
        const BPP_24 = 3;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
