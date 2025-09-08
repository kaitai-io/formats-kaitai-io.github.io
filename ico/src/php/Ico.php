<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Microsoft Windows uses specific file format to store applications
 * icons - ICO. This is a container that contains one or more image
 * files (effectively, DIB parts of BMP files or full PNG files are
 * contained inside).
 */

namespace {
    class Ico extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Ico $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->_m_magic == "\x00\x00\x01\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00\x00\x01\x00", $this->_m_magic, $this->_io, "/seq/0");
            }
            $this->_m_numImages = $this->_io->readU2le();
            $this->_m_images = [];
            $n = $this->numImages();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_images[] = new \Ico\IconDirEntry($this->_io, $this, $this->_root);
            }
        }
        protected $_m_magic;
        protected $_m_numImages;
        protected $_m_images;
        public function magic() { return $this->_m_magic; }

        /**
         * Number of images contained in this file
         */
        public function numImages() { return $this->_m_numImages; }
        public function images() { return $this->_m_images; }
    }
}

namespace Ico {
    class IconDirEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Ico $_parent = null, ?\Ico $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_width = $this->_io->readU1();
            $this->_m_height = $this->_io->readU1();
            $this->_m_numColors = $this->_io->readU1();
            $this->_m_reserved = $this->_io->readBytes(1);
            if (!($this->_m_reserved == "\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00", $this->_m_reserved, $this->_io, "/types/icon_dir_entry/seq/3");
            }
            $this->_m_numPlanes = $this->_io->readU2le();
            $this->_m_bpp = $this->_io->readU2le();
            $this->_m_lenImg = $this->_io->readU4le();
            $this->_m_ofsImg = $this->_io->readU4le();
        }
        protected $_m_img;

        /**
         * Raw image data. Use `is_png` to determine whether this is an
         * embedded PNG file (true) or a DIB bitmap (false) and call a
         * relevant parser, if needed to parse image data further.
         */
        public function img() {
            if ($this->_m_img !== null)
                return $this->_m_img;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsImg());
            $this->_m_img = $this->_io->readBytes($this->lenImg());
            $this->_io->seek($_pos);
            return $this->_m_img;
        }
        protected $_m_isPng;

        /**
         * True if this image is in PNG format.
         */
        public function isPng() {
            if ($this->_m_isPng !== null)
                return $this->_m_isPng;
            $this->_m_isPng = $this->pngHeader() == "\x89\x50\x4E\x47\x0D\x0A\x1A\x0A";
            return $this->_m_isPng;
        }
        protected $_m_pngHeader;

        /**
         * Pre-reads first 8 bytes of the image to determine if it's an
         * embedded PNG file.
         */
        public function pngHeader() {
            if ($this->_m_pngHeader !== null)
                return $this->_m_pngHeader;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsImg());
            $this->_m_pngHeader = $this->_io->readBytes(8);
            $this->_io->seek($_pos);
            return $this->_m_pngHeader;
        }
        protected $_m_width;
        protected $_m_height;
        protected $_m_numColors;
        protected $_m_reserved;
        protected $_m_numPlanes;
        protected $_m_bpp;
        protected $_m_lenImg;
        protected $_m_ofsImg;

        /**
         * Width of image, px
         */
        public function width() { return $this->_m_width; }

        /**
         * Height of image, px
         */
        public function height() { return $this->_m_height; }

        /**
         * Number of colors in palette of the image or 0 if image has
         * no palette (i.e. RGB, RGBA, etc)
         */
        public function numColors() { return $this->_m_numColors; }
        public function reserved() { return $this->_m_reserved; }

        /**
         * Number of color planes
         */
        public function numPlanes() { return $this->_m_numPlanes; }

        /**
         * Bits per pixel in the image
         */
        public function bpp() { return $this->_m_bpp; }

        /**
         * Size of the image data
         */
        public function lenImg() { return $this->_m_lenImg; }

        /**
         * Absolute offset of the image data start in the file
         */
        public function ofsImg() { return $this->_m_ofsImg; }
    }
}
