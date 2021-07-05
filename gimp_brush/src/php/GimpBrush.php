<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * GIMP brush format is native to the GIMP image editor for storing a brush or a texture.
 * It can be used in all [Paint Tools](https://docs.gimp.org/2.10/en/gimp-tools-paint.html),
 * for example Pencil and Paintbrush. It works by repeating the brush bitmap as you move
 * the tool. The Spacing parameter sets the distance between the brush marks as a percentage
 * of brush width. Its default value can be set in the brush file.
 * 
 * You can also use GIMP to create new brushes in this format. Custom brushes can be loaded
 * into GIMP for use in the paint tools by copying them into one of the Brush Folders -
 * select **Edit** > **Preferences** in the menu bar, expand the **Folders** section
 * and choose **Brushes** to see the recognized Brush Folders or to add new ones.
 */

namespace {
    class GimpBrush extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \GimpBrush $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenHeader = $this->_io->readU4be();
            $this->_m__raw_header = $this->_io->readBytes(($this->lenHeader() - 4));
            $_io__raw_header = new \Kaitai\Struct\Stream($this->_m__raw_header);
            $this->_m_header = new \GimpBrush\Header($_io__raw_header, $this, $this->_root);
        }
        protected $_m_lenBody;
        public function lenBody() {
            if ($this->_m_lenBody !== null)
                return $this->_m_lenBody;
            $this->_m_lenBody = (($this->header()->width() * $this->header()->height()) * $this->header()->bytesPerPixel());
            return $this->_m_lenBody;
        }
        protected $_m_body;
        public function body() {
            if ($this->_m_body !== null)
                return $this->_m_body;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->lenHeader());
            $this->_m_body = $this->_io->readBytes($this->lenBody());
            $this->_io->seek($_pos);
            return $this->_m_body;
        }
        protected $_m_lenHeader;
        protected $_m_header;
        protected $_m__raw_header;
        public function lenHeader() { return $this->_m_lenHeader; }
        public function header() { return $this->_m_header; }
        public function _raw_header() { return $this->_m__raw_header; }
    }
}

namespace GimpBrush {
    class Header extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \GimpBrush $_parent = null, \GimpBrush $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_version = $this->_io->readU4be();
            if (!($this->version() == 2)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(2, $this->version(), $this->_io(), "/types/header/seq/0");
            }
            $this->_m_width = $this->_io->readU4be();
            if (!($this->width() >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->width(), $this->_io(), "/types/header/seq/1");
            }
            if (!($this->width() <= 10000)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(10000, $this->width(), $this->_io(), "/types/header/seq/1");
            }
            $this->_m_height = $this->_io->readU4be();
            if (!($this->height() >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->height(), $this->_io(), "/types/header/seq/2");
            }
            if (!($this->height() <= 10000)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(10000, $this->height(), $this->_io(), "/types/header/seq/2");
            }
            $this->_m_bytesPerPixel = $this->_io->readU4be();
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->magic() == "\x47\x49\x4D\x50")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x47\x49\x4D\x50", $this->magic(), $this->_io(), "/types/header/seq/4");
            }
            $this->_m_spacing = $this->_io->readU4be();
            $this->_m_brushName = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytesFull(), 0, false), "UTF-8");
        }
        protected $_m_version;
        protected $_m_width;
        protected $_m_height;
        protected $_m_bytesPerPixel;
        protected $_m_magic;
        protected $_m_spacing;
        protected $_m_brushName;
        public function version() { return $this->_m_version; }
        public function width() { return $this->_m_width; }
        public function height() { return $this->_m_height; }
        public function bytesPerPixel() { return $this->_m_bytesPerPixel; }
        public function magic() { return $this->_m_magic; }

        /**
         * Default spacing to be used for brush. Percentage of brush width.
         */
        public function spacing() { return $this->_m_spacing; }
        public function brushName() { return $this->_m_brushName; }
    }
}

namespace GimpBrush {
    class Bitmap extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \GimpBrush $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_rows = [];
            $n = $this->_root()->header()->height();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_rows[] = new \GimpBrush\Row($this->_io, $this, $this->_root);
            }
        }
        protected $_m_rows;
        public function rows() { return $this->_m_rows; }
    }
}

namespace GimpBrush {
    class Row extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \GimpBrush $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_pixels = [];
            $n = $this->_root()->header()->width();
            for ($i = 0; $i < $n; $i++) {
                switch ($this->_root()->header()->bytesPerPixel()) {
                    case \GimpBrush\ColorDepth::GRAYSCALE:
                        $this->_m_pixels[] = new \GimpBrush\Row\PixelGray($this->_io, $this, $this->_root);
                        break;
                    case \GimpBrush\ColorDepth::RGBA:
                        $this->_m_pixels[] = new \GimpBrush\Row\PixelRgba($this->_io, $this, $this->_root);
                        break;
                }
            }
        }
        protected $_m_pixels;
        public function pixels() { return $this->_m_pixels; }
    }
}

namespace GimpBrush\Row {
    class PixelGray extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \GimpBrush $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_gray = $this->_io->readU1();
        }
        protected $_m_red;
        public function red() {
            if ($this->_m_red !== null)
                return $this->_m_red;
            $this->_m_red = 0;
            return $this->_m_red;
        }
        protected $_m_green;
        public function green() {
            if ($this->_m_green !== null)
                return $this->_m_green;
            $this->_m_green = 0;
            return $this->_m_green;
        }
        protected $_m_blue;
        public function blue() {
            if ($this->_m_blue !== null)
                return $this->_m_blue;
            $this->_m_blue = 0;
            return $this->_m_blue;
        }
        protected $_m_alpha;
        public function alpha() {
            if ($this->_m_alpha !== null)
                return $this->_m_alpha;
            $this->_m_alpha = $this->gray();
            return $this->_m_alpha;
        }
        protected $_m_gray;
        public function gray() { return $this->_m_gray; }
    }
}

namespace GimpBrush\Row {
    class PixelRgba extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \GimpBrush $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_red = $this->_io->readU1();
            $this->_m_green = $this->_io->readU1();
            $this->_m_blue = $this->_io->readU1();
            $this->_m_alpha = $this->_io->readU1();
        }
        protected $_m_red;
        protected $_m_green;
        protected $_m_blue;
        protected $_m_alpha;
        public function red() { return $this->_m_red; }
        public function green() { return $this->_m_green; }
        public function blue() { return $this->_m_blue; }
        public function alpha() { return $this->_m_alpha; }
    }
}

namespace GimpBrush {
    class ColorDepth {
        const GRAYSCALE = 1;
        const RGBA = 4;
    }
}
