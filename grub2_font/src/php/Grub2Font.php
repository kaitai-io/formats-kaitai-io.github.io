<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Bitmap font format for the GRUB 2 bootloader.
 */

namespace {
    class Grub2Font extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Grub2Font $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(12);
            if (!($this->magic() == "\x46\x49\x4C\x45\x00\x00\x00\x04\x50\x46\x46\x32")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x46\x49\x4C\x45\x00\x00\x00\x04\x50\x46\x46\x32", $this->magic(), $this->_io(), "/seq/0");
            }
            $this->_m_sections = [];
            $i = 0;
            do {
                $_ = new \Grub2Font\Section($this->_io, $this, $this->_root);
                $this->_m_sections[] = $_;
                $i++;
            } while (!($_->sectionType() == "DATA"));
        }
        protected $_m_magic;
        protected $_m_sections;
        public function magic() { return $this->_m_magic; }

        /**
         * The "DATA" section acts as a terminator. The documentation says:
         * "A marker that indicates the remainder of the file is data accessed
         * via the character index (CHIX) section. When reading this font file,
         * the rest of the file can be ignored when scanning the sections."
         */
        public function sections() { return $this->_m_sections; }
    }
}

namespace Grub2Font {
    class PtszSection extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Grub2Font\Section $_parent = null, \Grub2Font $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fontPointSize = $this->_io->readU2be();
        }
        protected $_m_fontPointSize;
        public function fontPointSize() { return $this->_m_fontPointSize; }
    }
}

namespace Grub2Font {
    class FamiSection extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Grub2Font\Section $_parent = null, \Grub2Font $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fontFamilyName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ASCII");
        }
        protected $_m_fontFamilyName;
        public function fontFamilyName() { return $this->_m_fontFamilyName; }
    }
}

namespace Grub2Font {
    class WeigSection extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Grub2Font\Section $_parent = null, \Grub2Font $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fontWeight = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ASCII");
        }
        protected $_m_fontWeight;
        public function fontWeight() { return $this->_m_fontWeight; }
    }
}

namespace Grub2Font {
    class MaxwSection extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Grub2Font\Section $_parent = null, \Grub2Font $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_maximumCharacterWidth = $this->_io->readU2be();
        }
        protected $_m_maximumCharacterWidth;
        public function maximumCharacterWidth() { return $this->_m_maximumCharacterWidth; }
    }
}

namespace Grub2Font {
    class DescSection extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Grub2Font\Section $_parent = null, \Grub2Font $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_descentInPixels = $this->_io->readU2be();
        }
        protected $_m_descentInPixels;
        public function descentInPixels() { return $this->_m_descentInPixels; }
    }
}

namespace Grub2Font {
    class Section extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Grub2Font $_parent = null, \Grub2Font $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_sectionType = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ASCII");
            $this->_m_lenBody = $this->_io->readU4be();
            if ($this->sectionType() != "DATA") {
                switch ($this->sectionType()) {
                    case "MAXH":
                        $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                        $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                        $this->_m_body = new \Grub2Font\MaxhSection($_io__raw_body, $this, $this->_root);
                        break;
                    case "FAMI":
                        $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                        $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                        $this->_m_body = new \Grub2Font\FamiSection($_io__raw_body, $this, $this->_root);
                        break;
                    case "PTSZ":
                        $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                        $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                        $this->_m_body = new \Grub2Font\PtszSection($_io__raw_body, $this, $this->_root);
                        break;
                    case "MAXW":
                        $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                        $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                        $this->_m_body = new \Grub2Font\MaxwSection($_io__raw_body, $this, $this->_root);
                        break;
                    case "SLAN":
                        $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                        $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                        $this->_m_body = new \Grub2Font\SlanSection($_io__raw_body, $this, $this->_root);
                        break;
                    case "WEIG":
                        $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                        $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                        $this->_m_body = new \Grub2Font\WeigSection($_io__raw_body, $this, $this->_root);
                        break;
                    case "CHIX":
                        $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                        $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                        $this->_m_body = new \Grub2Font\ChixSection($_io__raw_body, $this, $this->_root);
                        break;
                    case "DESC":
                        $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                        $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                        $this->_m_body = new \Grub2Font\DescSection($_io__raw_body, $this, $this->_root);
                        break;
                    case "NAME":
                        $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                        $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                        $this->_m_body = new \Grub2Font\NameSection($_io__raw_body, $this, $this->_root);
                        break;
                    case "ASCE":
                        $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                        $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                        $this->_m_body = new \Grub2Font\AsceSection($_io__raw_body, $this, $this->_root);
                        break;
                    default:
                        $this->_m_body = $this->_io->readBytes($this->lenBody());
                        break;
                }
            }
        }
        protected $_m_sectionType;
        protected $_m_lenBody;
        protected $_m_body;
        protected $_m__raw_body;
        public function sectionType() { return $this->_m_sectionType; }

        /**
         * Should be set to `0xFFFF_FFFF` for `section_type != "DATA"`
         */
        public function lenBody() { return $this->_m_lenBody; }
        public function body() { return $this->_m_body; }
        public function _raw_body() { return $this->_m__raw_body; }
    }
}

namespace Grub2Font {
    class AsceSection extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Grub2Font\Section $_parent = null, \Grub2Font $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ascentInPixels = $this->_io->readU2be();
        }
        protected $_m_ascentInPixels;
        public function ascentInPixels() { return $this->_m_ascentInPixels; }
    }
}

namespace Grub2Font {
    class ChixSection extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Grub2Font\Section $_parent = null, \Grub2Font $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_characters = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_characters[] = new \Grub2Font\ChixSection\Character($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_characters;
        public function characters() { return $this->_m_characters; }
    }
}

namespace Grub2Font\ChixSection {
    class Character extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Grub2Font\ChixSection $_parent = null, \Grub2Font $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_codePoint = $this->_io->readU4be();
            $this->_m_flags = $this->_io->readU1();
            $this->_m_ofsDefinition = $this->_io->readU4be();
        }
        protected $_m_definition;
        public function definition() {
            if ($this->_m_definition !== null)
                return $this->_m_definition;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsDefinition());
            $this->_m_definition = new \Grub2Font\ChixSection\CharacterDefinition($io, $this, $this->_root);
            $io->seek($_pos);
            return $this->_m_definition;
        }
        protected $_m_codePoint;
        protected $_m_flags;
        protected $_m_ofsDefinition;

        /**
         * Unicode code point
         */
        public function codePoint() { return $this->_m_codePoint; }
        public function flags() { return $this->_m_flags; }
        public function ofsDefinition() { return $this->_m_ofsDefinition; }
    }
}

namespace Grub2Font\ChixSection {
    class CharacterDefinition extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Grub2Font\ChixSection\Character $_parent = null, \Grub2Font $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_width = $this->_io->readU2be();
            $this->_m_height = $this->_io->readU2be();
            $this->_m_xOffset = $this->_io->readS2be();
            $this->_m_yOffset = $this->_io->readS2be();
            $this->_m_deviceWidth = $this->_io->readS2be();
            $this->_m_bitmapData = $this->_io->readBytes(intval((($this->width() * $this->height()) + 7) / 8));
        }
        protected $_m_width;
        protected $_m_height;
        protected $_m_xOffset;
        protected $_m_yOffset;
        protected $_m_deviceWidth;
        protected $_m_bitmapData;
        public function width() { return $this->_m_width; }
        public function height() { return $this->_m_height; }
        public function xOffset() { return $this->_m_xOffset; }
        public function yOffset() { return $this->_m_yOffset; }
        public function deviceWidth() { return $this->_m_deviceWidth; }

        /**
         * A two-dimensional bitmap, one bit per pixel. It is organized as
         * row-major, top-down, left-to-right. The most significant bit of
         * each byte corresponds to the leftmost or uppermost pixel from all
         * bits of the byte. If a bit is set (1, `true`), the pixel is set to
         * the font color, if a bit is clear (0, `false`), the pixel is
         * transparent.
         * 
         * Rows are **not** padded to byte boundaries (i.e., a
         * single byte may contain bits belonging to multiple rows). The last
         * byte of the bitmap _is_ padded with zero bits at all unused least
         * significant bit positions so that the bitmap ends on a byte
         * boundary.
         */
        public function bitmapData() { return $this->_m_bitmapData; }
    }
}

namespace Grub2Font {
    class MaxhSection extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Grub2Font\Section $_parent = null, \Grub2Font $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_maximumCharacterHeight = $this->_io->readU2be();
        }
        protected $_m_maximumCharacterHeight;
        public function maximumCharacterHeight() { return $this->_m_maximumCharacterHeight; }
    }
}

namespace Grub2Font {
    class NameSection extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Grub2Font\Section $_parent = null, \Grub2Font $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fontName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ASCII");
        }
        protected $_m_fontName;
        public function fontName() { return $this->_m_fontName; }
    }
}

namespace Grub2Font {
    class SlanSection extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Grub2Font\Section $_parent = null, \Grub2Font $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fontSlant = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ASCII");
        }
        protected $_m_fontSlant;
        public function fontSlant() { return $this->_m_fontSlant; }
    }
}
