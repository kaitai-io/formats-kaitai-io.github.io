<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Portable Compiled Format (PCF) font is a bitmap font format
 * originating from X11 Window System. It matches BDF format (which is
 * text-based) closely, but instead being binary and
 * platform-independent (as opposed to previously used SNF binary
 * format) due to introduced features to handle different endianness
 * and bit order.
 * 
 * The overall composition of the format is straightforward: it's more
 * or less classic directory of type-offset-size pointers, pointing to
 * what PCF format calls "tables". Each table carries a certain
 * piece of information related to the font (metadata properties,
 * metrics, bitmaps, mapping of glyphs to characters, etc).
 */

namespace {
    class PcfFont extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \PcfFont $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->magic() == "\x01\x66\x63\x70")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x01\x66\x63\x70", $this->magic(), $this->_io(), "/seq/0");
            }
            $this->_m_numTables = $this->_io->readU4le();
            $this->_m_tables = [];
            $n = $this->numTables();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_tables[] = new \PcfFont\Table($this->_io, $this, $this->_root);
            }
        }
        protected $_m_magic;
        protected $_m_numTables;
        protected $_m_tables;
        public function magic() { return $this->_m_magic; }
        public function numTables() { return $this->_m_numTables; }
        public function tables() { return $this->_m_tables; }
    }
}

/**
 * Table offers a offset + length pointer to a particular
 * table. "Type" of table references certain enum. Applications can
 * ignore enum values which they don't support.
 */

namespace PcfFont {
    class Table extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PcfFont $_parent = null, \PcfFont $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_type = $this->_io->readU4le();
            $this->_m_format = new \PcfFont\Format($this->_io, $this, $this->_root);
            $this->_m_lenBody = $this->_io->readU4le();
            $this->_m_ofsBody = $this->_io->readU4le();
        }
        protected $_m_body;
        public function body() {
            if ($this->_m_body !== null)
                return $this->_m_body;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsBody());
            switch ($this->type()) {
                case \PcfFont\Types::PROPERTIES:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \PcfFont\Table\Properties($_io__raw_body, $this, $this->_root);
                    break;
                case \PcfFont\Types::BDF_ENCODINGS:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \PcfFont\Table\BdfEncodings($_io__raw_body, $this, $this->_root);
                    break;
                case \PcfFont\Types::SWIDTHS:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \PcfFont\Table\Swidths($_io__raw_body, $this, $this->_root);
                    break;
                case \PcfFont\Types::GLYPH_NAMES:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \PcfFont\Table\GlyphNames($_io__raw_body, $this, $this->_root);
                    break;
                case \PcfFont\Types::BITMAPS:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \PcfFont\Table\Bitmaps($_io__raw_body, $this, $this->_root);
                    break;
                default:
                    $this->_m_body = $this->_io->readBytes($this->lenBody());
                    break;
            }
            $this->_io->seek($_pos);
            return $this->_m_body;
        }
        protected $_m_type;
        protected $_m_format;
        protected $_m_lenBody;
        protected $_m_ofsBody;
        protected $_m__raw_body;
        public function type() { return $this->_m_type; }
        public function format() { return $this->_m_format; }
        public function lenBody() { return $this->_m_lenBody; }
        public function ofsBody() { return $this->_m_ofsBody; }
        public function _raw_body() { return $this->_m__raw_body; }
    }
}

/**
 * Table containing scalable widths of characters.
 */

namespace PcfFont\Table {
    class Swidths extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PcfFont\Table $_parent = null, \PcfFont $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_format = new \PcfFont\Format($this->_io, $this, $this->_root);
            $this->_m_numGlyphs = $this->_io->readU4le();
            $this->_m_swidths = [];
            $n = $this->numGlyphs();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_swidths[] = $this->_io->readU4le();
            }
        }
        protected $_m_format;
        protected $_m_numGlyphs;
        protected $_m_swidths;
        public function format() { return $this->_m_format; }
        public function numGlyphs() { return $this->_m_numGlyphs; }

        /**
         * The scalable width of a character is the width of the corresponding
         * PostScript character in em-units (1/1000ths of an em).
         */
        public function swidths() { return $this->_m_swidths; }
    }
}

/**
 * Array of properties (key-value pairs), used to convey different X11
 * settings of a font. Key is always an X font atom.
 */

namespace PcfFont\Table {
    class Properties extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PcfFont\Table $_parent = null, \PcfFont $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_format = new \PcfFont\Format($this->_io, $this, $this->_root);
            $this->_m_numProps = $this->_io->readU4le();
            $this->_m_props = [];
            $n = $this->numProps();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_props[] = new \PcfFont\Table\Properties\Prop($this->_io, $this, $this->_root);
            }
            $this->_m_padding = $this->_io->readBytes((($this->numProps() & 3) == 0 ? 0 : (4 - ($this->numProps() & 3))));
            $this->_m_lenStrings = $this->_io->readU4le();
            $this->_m__raw_strings = $this->_io->readBytes($this->lenStrings());
            $_io__raw_strings = new \Kaitai\Struct\Stream($this->_m__raw_strings);
            $this->_m_strings = new \BytesWithIo($_io__raw_strings);
        }
        protected $_m_format;
        protected $_m_numProps;
        protected $_m_props;
        protected $_m_padding;
        protected $_m_lenStrings;
        protected $_m_strings;
        protected $_m__raw_strings;
        public function format() { return $this->_m_format; }
        public function numProps() { return $this->_m_numProps; }
        public function props() { return $this->_m_props; }
        public function padding() { return $this->_m_padding; }
        public function lenStrings() { return $this->_m_lenStrings; }

        /**
         * Strings buffer. Never used directly, but instead is
         * addressed by offsets from the properties.
         */
        public function strings() { return $this->_m_strings; }
        public function _raw_strings() { return $this->_m__raw_strings; }
    }
}

/**
 * Property is a key-value pair, "key" being always a
 * string and "value" being either a string or a 32-bit
 * integer based on an additinal flag (`is_string`).
 * 
 * Simple offset-based mechanism is employed to keep this
 * type's sequence fixed-sized and thus have simple access
 * to property key/value by index.
 */

namespace PcfFont\Table\Properties {
    class Prop extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PcfFont\Table\Properties $_parent = null, \PcfFont $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ofsName = $this->_io->readU4le();
            $this->_m_isString = $this->_io->readU1();
            $this->_m_valueOrOfsValue = $this->_io->readU4le();
        }
        protected $_m_name;

        /**
         * Name of the property addressed in the strings buffer.
         */
        public function name() {
            if ($this->_m_name !== null)
                return $this->_m_name;
            $io = $this->_parent()->strings()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsName());
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, true), "UTF-8");
            $io->seek($_pos);
            return $this->_m_name;
        }
        protected $_m_strValue;

        /**
         * Value of the property addressed in the strings
         * buffer, if this is a string value.
         */
        public function strValue() {
            if ($this->_m_strValue !== null)
                return $this->_m_strValue;
            if ($this->isString() != 0) {
                $io = $this->_parent()->strings()->_io();
                $_pos = $io->pos();
                $io->seek($this->valueOrOfsValue());
                $this->_m_strValue = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, true), "UTF-8");
                $io->seek($_pos);
            }
            return $this->_m_strValue;
        }
        protected $_m_intValue;

        /**
         * Value of the property, if this is an integer value.
         */
        public function intValue() {
            if ($this->_m_intValue !== null)
                return $this->_m_intValue;
            if ($this->isString() == 0) {
                $this->_m_intValue = $this->valueOrOfsValue();
            }
            return $this->_m_intValue;
        }
        protected $_m_ofsName;
        protected $_m_isString;
        protected $_m_valueOrOfsValue;

        /**
         * Offset to name in the strings buffer.
         */
        public function ofsName() { return $this->_m_ofsName; }

        /**
         * Designates if value is an integer (zero) or a string (non-zero).
         */
        public function isString() { return $this->_m_isString; }

        /**
         * If the value is an integer (`is_string` is false),
         * then it's stored here. If the value is a string
         * (`is_string` is true), then it stores offset to the
         * value in the strings buffer.
         */
        public function valueOrOfsValue() { return $this->_m_valueOrOfsValue; }
    }
}

/**
 * Table that allows mapping of character codes to glyphs present in the
 * font. Supports 1-byte and 2-byte character codes.
 * 
 * Note that this mapping is agnostic to character encoding itself - it
 * can represent ASCII, Unicode (ISO/IEC 10646), various single-byte
 * national encodings, etc. If application cares about it, normally
 * encoding will be specified in `properties` table, in the properties named
 * `CHARSET_REGISTRY` / `CHARSET_ENCODING`.
 */

namespace PcfFont\Table {
    class BdfEncodings extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PcfFont\Table $_parent = null, \PcfFont $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_format = new \PcfFont\Format($this->_io, $this, $this->_root);
            $this->_m_minCharOrByte2 = $this->_io->readU2le();
            $this->_m_maxCharOrByte2 = $this->_io->readU2le();
            $this->_m_minByte1 = $this->_io->readU2le();
            $this->_m_maxByte1 = $this->_io->readU2le();
            $this->_m_defaultChar = $this->_io->readU2le();
            $this->_m_glyphIndexes = [];
            $n = ((($this->maxCharOrByte2() - $this->minCharOrByte2()) + 1) * (($this->maxByte1() - $this->minByte1()) + 1));
            for ($i = 0; $i < $n; $i++) {
                $this->_m_glyphIndexes[] = $this->_io->readU2le();
            }
        }
        protected $_m_format;
        protected $_m_minCharOrByte2;
        protected $_m_maxCharOrByte2;
        protected $_m_minByte1;
        protected $_m_maxByte1;
        protected $_m_defaultChar;
        protected $_m_glyphIndexes;
        public function format() { return $this->_m_format; }
        public function minCharOrByte2() { return $this->_m_minCharOrByte2; }
        public function maxCharOrByte2() { return $this->_m_maxCharOrByte2; }
        public function minByte1() { return $this->_m_minByte1; }
        public function maxByte1() { return $this->_m_maxByte1; }
        public function defaultChar() { return $this->_m_defaultChar; }
        public function glyphIndexes() { return $this->_m_glyphIndexes; }
    }
}

/**
 * Table containing character names for every glyph.
 */

namespace PcfFont\Table {
    class GlyphNames extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PcfFont\Table $_parent = null, \PcfFont $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_format = new \PcfFont\Format($this->_io, $this, $this->_root);
            $this->_m_numGlyphs = $this->_io->readU4le();
            $this->_m_names = [];
            $n = $this->numGlyphs();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_names[] = new \PcfFont\Table\GlyphNames\StringRef($this->_io, $this, $this->_root);
            }
            $this->_m_lenStrings = $this->_io->readU4le();
            $this->_m__raw_strings = $this->_io->readBytes($this->lenStrings());
            $_io__raw_strings = new \Kaitai\Struct\Stream($this->_m__raw_strings);
            $this->_m_strings = new \BytesWithIo($_io__raw_strings);
        }
        protected $_m_format;
        protected $_m_numGlyphs;
        protected $_m_names;
        protected $_m_lenStrings;
        protected $_m_strings;
        protected $_m__raw_strings;
        public function format() { return $this->_m_format; }
        public function numGlyphs() { return $this->_m_numGlyphs; }

        /**
         * Glyph names are represented as string references in strings buffer.
         */
        public function names() { return $this->_m_names; }
        public function lenStrings() { return $this->_m_lenStrings; }

        /**
         * Strings buffer which contains all glyph names.
         */
        public function strings() { return $this->_m_strings; }
        public function _raw_strings() { return $this->_m__raw_strings; }
    }
}

namespace PcfFont\Table\GlyphNames {
    class StringRef extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PcfFont\Table\GlyphNames $_parent = null, \PcfFont $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ofsString = $this->_io->readU4le();
        }
        protected $_m_value;
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $io = $this->_parent()->strings()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsString());
            $this->_m_value = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, true), "UTF-8");
            $io->seek($_pos);
            return $this->_m_value;
        }
        protected $_m_ofsString;
        public function ofsString() { return $this->_m_ofsString; }
    }
}

/**
 * Table containing uncompressed glyph bitmaps.
 */

namespace PcfFont\Table {
    class Bitmaps extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PcfFont\Table $_parent = null, \PcfFont $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_format = new \PcfFont\Format($this->_io, $this, $this->_root);
            $this->_m_numGlyphs = $this->_io->readU4le();
            $this->_m_offsets = [];
            $n = $this->numGlyphs();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_offsets[] = $this->_io->readU4le();
            }
            $this->_m_bitmapSizes = [];
            $n = 4;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_bitmapSizes[] = $this->_io->readU4le();
            }
        }
        protected $_m_format;
        protected $_m_numGlyphs;
        protected $_m_offsets;
        protected $_m_bitmapSizes;
        public function format() { return $this->_m_format; }
        public function numGlyphs() { return $this->_m_numGlyphs; }
        public function offsets() { return $this->_m_offsets; }
        public function bitmapSizes() { return $this->_m_bitmapSizes; }
    }
}

/**
 * Table format specifier, always 4 bytes. Original implementation treats
 * it as always little-endian and makes liberal use of bitmasking to parse
 * various parts of it.
 * 
 * TODO: this format specification recognizes endianness and bit
 * order format bits, but it does not really takes any parsing
 * decisions based on them.
 */

namespace PcfFont {
    class Format extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \PcfFont $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_padding1 = $this->_io->readBitsIntBe(2);
            $this->_m_scanUnitMask = $this->_io->readBitsIntBe(2);
            $this->_m_isMostSignificantBitFirst = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_isBigEndian = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_glyphPadMask = $this->_io->readBitsIntBe(2);
            $this->_io->alignToByte();
            $this->_m_format = $this->_io->readU1();
            $this->_m_padding = $this->_io->readU2le();
        }
        protected $_m_padding1;
        protected $_m_scanUnitMask;
        protected $_m_isMostSignificantBitFirst;
        protected $_m_isBigEndian;
        protected $_m_glyphPadMask;
        protected $_m_format;
        protected $_m_padding;
        public function padding1() { return $this->_m_padding1; }
        public function scanUnitMask() { return $this->_m_scanUnitMask; }
        public function isMostSignificantBitFirst() { return $this->_m_isMostSignificantBitFirst; }

        /**
         * If set, then all integers in the table are treated as big-endian
         */
        public function isBigEndian() { return $this->_m_isBigEndian; }
        public function glyphPadMask() { return $this->_m_glyphPadMask; }
        public function format() { return $this->_m_format; }
        public function padding() { return $this->_m_padding; }
    }
}

namespace PcfFont {
    class Types {
        const PROPERTIES = 1;
        const ACCELERATORS = 2;
        const METRICS = 4;
        const BITMAPS = 8;
        const INK_METRICS = 16;
        const BDF_ENCODINGS = 32;
        const SWIDTHS = 64;
        const GLYPH_NAMES = 128;
        const BDF_ACCELERATORS = 256;
    }
}
