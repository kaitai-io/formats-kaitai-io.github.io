<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Allegro library for C (mostly used for game and multimedia apps
 * programming) used its own container file format.
 * 
 * In general, it allows storage of arbitrary binary data blocks
 * bundled together with some simple key-value style metadata
 * ("properties") for every block. Allegro also pre-defines some simple
 * formats for bitmaps, fonts, MIDI music, sound samples and
 * palettes. Allegro library v4.0+ also support LZSS compression.
 * 
 * This spec applies to Allegro data files for library versions 2.2 up
 * to 4.4.
 */

namespace {
    class AllegroDat extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\AllegroDat $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_packMagic = $this->_io->readU4be();
            $this->_m_datMagic = $this->_io->readBytes(4);
            if (!($this->_m_datMagic == "\x41\x4C\x4C\x2E")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x41\x4C\x4C\x2E", $this->_m_datMagic, $this->_io, "/seq/1");
            }
            $this->_m_numObjects = $this->_io->readU4be();
            $this->_m_objects = [];
            $n = $this->numObjects();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_objects[] = new \AllegroDat\DatObject($this->_io, $this, $this->_root);
            }
        }
        protected $_m_packMagic;
        protected $_m_datMagic;
        protected $_m_numObjects;
        protected $_m_objects;
        public function packMagic() { return $this->_m_packMagic; }
        public function datMagic() { return $this->_m_datMagic; }
        public function numObjects() { return $this->_m_numObjects; }
        public function objects() { return $this->_m_objects; }
    }
}

namespace AllegroDat {
    class DatBitmap extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AllegroDat\DatObject $_parent = null, ?\AllegroDat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_bitsPerPixel = $this->_io->readS2be();
            $this->_m_width = $this->_io->readU2be();
            $this->_m_height = $this->_io->readU2be();
            $this->_m_image = $this->_io->readBytesFull();
        }
        protected $_m_bitsPerPixel;
        protected $_m_width;
        protected $_m_height;
        protected $_m_image;
        public function bitsPerPixel() { return $this->_m_bitsPerPixel; }
        public function width() { return $this->_m_width; }
        public function height() { return $this->_m_height; }
        public function image() { return $this->_m_image; }
    }
}

namespace AllegroDat {
    class DatFont extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AllegroDat\DatObject $_parent = null, ?\AllegroDat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fontSize = $this->_io->readS2be();
            switch ($this->fontSize()) {
                case 0:
                    $this->_m_body = new \AllegroDat\DatFont39($this->_io, $this, $this->_root);
                    break;
                case 16:
                    $this->_m_body = new \AllegroDat\DatFont16($this->_io, $this, $this->_root);
                    break;
                case 8:
                    $this->_m_body = new \AllegroDat\DatFont8($this->_io, $this, $this->_root);
                    break;
            }
        }
        protected $_m_fontSize;
        protected $_m_body;
        public function fontSize() { return $this->_m_fontSize; }
        public function body() { return $this->_m_body; }
    }
}

/**
 * Simple monochrome monospaced font, 95 characters, 8x16 px
 * characters.
 */

namespace AllegroDat {
    class DatFont16 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AllegroDat\DatFont $_parent = null, ?\AllegroDat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_chars = [];
            $n = 95;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_chars[] = $this->_io->readBytes(16);
            }
        }
        protected $_m_chars;
        public function chars() { return $this->_m_chars; }
    }
}

/**
 * New bitmap font format introduced since Allegro 3.9: allows
 * flexible designation of character ranges, 8-bit colored
 * characters, etc.
 */

namespace AllegroDat {
    class DatFont39 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AllegroDat\DatFont $_parent = null, ?\AllegroDat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numRanges = $this->_io->readS2be();
            $this->_m_ranges = [];
            $n = $this->numRanges();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_ranges[] = new \AllegroDat\DatFont39\Range($this->_io, $this, $this->_root);
            }
        }
        protected $_m_numRanges;
        protected $_m_ranges;
        public function numRanges() { return $this->_m_numRanges; }
        public function ranges() { return $this->_m_ranges; }
    }
}

namespace AllegroDat\DatFont39 {
    class FontChar extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AllegroDat\DatFont39\Range $_parent = null, ?\AllegroDat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_width = $this->_io->readU2be();
            $this->_m_height = $this->_io->readU2be();
            $this->_m_body = $this->_io->readBytes($this->width() * $this->height());
        }
        protected $_m_width;
        protected $_m_height;
        protected $_m_body;
        public function width() { return $this->_m_width; }
        public function height() { return $this->_m_height; }
        public function body() { return $this->_m_body; }
    }
}

namespace AllegroDat\DatFont39 {
    class Range extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AllegroDat\DatFont39 $_parent = null, ?\AllegroDat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_mono = $this->_io->readU1();
            $this->_m_startChar = $this->_io->readU4be();
            $this->_m_endChar = $this->_io->readU4be();
            $this->_m_chars = [];
            $n = ($this->endChar() - $this->startChar()) + 1;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_chars[] = new \AllegroDat\DatFont39\FontChar($this->_io, $this, $this->_root);
            }
        }
        protected $_m_mono;
        protected $_m_startChar;
        protected $_m_endChar;
        protected $_m_chars;
        public function mono() { return $this->_m_mono; }

        /**
         * First character in range
         */
        public function startChar() { return $this->_m_startChar; }

        /**
         * Last character in range (inclusive)
         */
        public function endChar() { return $this->_m_endChar; }
        public function chars() { return $this->_m_chars; }
    }
}

/**
 * Simple monochrome monospaced font, 95 characters, 8x8 px
 * characters.
 */

namespace AllegroDat {
    class DatFont8 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AllegroDat\DatFont $_parent = null, ?\AllegroDat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_chars = [];
            $n = 95;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_chars[] = $this->_io->readBytes(8);
            }
        }
        protected $_m_chars;
        public function chars() { return $this->_m_chars; }
    }
}

namespace AllegroDat {
    class DatObject extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AllegroDat $_parent = null, ?\AllegroDat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_properties = [];
            $i = 0;
            do {
                $_ = new \AllegroDat\Property($this->_io, $this, $this->_root);
                $this->_m_properties[] = $_;
                $i++;
            } while (!(!($_->isValid())));
            $this->_m_lenCompressed = $this->_io->readS4be();
            $this->_m_lenUncompressed = $this->_io->readS4be();
            switch ($this->type()) {
                case "BMP ":
                    $this->_m__raw_body = $this->_io->readBytes($this->lenCompressed());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \AllegroDat\DatBitmap($_io__raw_body, $this, $this->_root);
                    break;
                case "FONT":
                    $this->_m__raw_body = $this->_io->readBytes($this->lenCompressed());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \AllegroDat\DatFont($_io__raw_body, $this, $this->_root);
                    break;
                case "RLE ":
                    $this->_m__raw_body = $this->_io->readBytes($this->lenCompressed());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \AllegroDat\DatRleSprite($_io__raw_body, $this, $this->_root);
                    break;
                default:
                    $this->_m_body = $this->_io->readBytes($this->lenCompressed());
                    break;
            }
        }
        protected $_m_type;
        public function type() {
            if ($this->_m_type !== null)
                return $this->_m_type;
            $this->_m_type = $this->properties()[count($this->properties()) - 1]->magic();
            return $this->_m_type;
        }
        protected $_m_properties;
        protected $_m_lenCompressed;
        protected $_m_lenUncompressed;
        protected $_m_body;
        protected $_m__raw_body;
        public function properties() { return $this->_m_properties; }
        public function lenCompressed() { return $this->_m_lenCompressed; }
        public function lenUncompressed() { return $this->_m_lenUncompressed; }
        public function body() { return $this->_m_body; }
        public function _raw_body() { return $this->_m__raw_body; }
    }
}

namespace AllegroDat {
    class DatRleSprite extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AllegroDat\DatObject $_parent = null, ?\AllegroDat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_bitsPerPixel = $this->_io->readS2be();
            $this->_m_width = $this->_io->readU2be();
            $this->_m_height = $this->_io->readU2be();
            $this->_m_lenImage = $this->_io->readU4be();
            $this->_m_image = $this->_io->readBytesFull();
        }
        protected $_m_bitsPerPixel;
        protected $_m_width;
        protected $_m_height;
        protected $_m_lenImage;
        protected $_m_image;
        public function bitsPerPixel() { return $this->_m_bitsPerPixel; }
        public function width() { return $this->_m_width; }
        public function height() { return $this->_m_height; }
        public function lenImage() { return $this->_m_lenImage; }
        public function image() { return $this->_m_image; }
    }
}

namespace AllegroDat {
    class Property extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AllegroDat\DatObject $_parent = null, ?\AllegroDat $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
            if ($this->isValid()) {
                $this->_m_type = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
            }
            if ($this->isValid()) {
                $this->_m_lenBody = $this->_io->readU4be();
            }
            if ($this->isValid()) {
                $this->_m_body = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenBody()), "UTF-8");
            }
        }
        protected $_m_isValid;
        public function isValid() {
            if ($this->_m_isValid !== null)
                return $this->_m_isValid;
            $this->_m_isValid = $this->magic() == "prop";
            return $this->_m_isValid;
        }
        protected $_m_magic;
        protected $_m_type;
        protected $_m_lenBody;
        protected $_m_body;
        public function magic() { return $this->_m_magic; }
        public function type() { return $this->_m_type; }
        public function lenBody() { return $this->_m_lenBody; }
        public function body() { return $this->_m_body; }
    }
}

namespace AllegroDat {
    class PackEnum {
        const UNPACKED = 1936484398;

        private const _VALUES = [1936484398 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
