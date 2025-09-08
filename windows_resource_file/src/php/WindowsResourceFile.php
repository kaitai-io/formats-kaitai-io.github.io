<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Windows resource file (.res) are binary bundles of
 * "resources". Resource has some sort of ID (numerical or string),
 * type (predefined or user-defined), and raw value. Resource files can
 * be seen standalone (as .res file), or embedded inside PE executable
 * (.exe, .dll) files.
 * 
 * Typical use cases include:
 * 
 * * providing information about the application (such as title, copyrights, etc)
 * * embedding icon(s) to be displayed in file managers into .exe
 * * adding non-code data into the binary, such as menus, dialog forms,
 *   cursor images, fonts, various misc bitmaps, and locale-aware
 *   strings
 * 
 * Windows provides special API to access "resources" from a binary.
 * 
 * Normally, resources files are created with `rc` compiler: it takes a
 * .rc file (so called "resource-definition script") + all the raw
 * resource binary files for input, and outputs .res file. That .res
 * file can be linked into an .exe / .dll afterwards using a linker.
 * 
 * Internally, resource file is just a sequence of individual resource
 * definitions. RC tool ensures that first resource (#0) is always
 * empty.
 */

namespace {
    class WindowsResourceFile extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\WindowsResourceFile $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_resources = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_resources[] = new \WindowsResourceFile\Resource($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_resources;
        public function resources() { return $this->_m_resources; }
    }
}

/**
 * Each resource has a `type` and a `name`, which can be used to
 * identify it, and a `value`. Both `type` and `name` can be a
 * number or a string.
 */

namespace WindowsResourceFile {
    class Resource extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\WindowsResourceFile $_parent = null, ?\WindowsResourceFile $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_valueSize = $this->_io->readU4le();
            $this->_m_headerSize = $this->_io->readU4le();
            $this->_m_type = new \WindowsResourceFile\UnicodeOrId($this->_io, $this, $this->_root);
            $this->_m_name = new \WindowsResourceFile\UnicodeOrId($this->_io, $this, $this->_root);
            $this->_m_padding1 = $this->_io->readBytes(\Kaitai\Struct\Stream::mod(4 - $this->_io()->pos(), 4));
            $this->_m_formatVersion = $this->_io->readU4le();
            $this->_m_flags = $this->_io->readU2le();
            $this->_m_language = $this->_io->readU2le();
            $this->_m_valueVersion = $this->_io->readU4le();
            $this->_m_characteristics = $this->_io->readU4le();
            $this->_m_value = $this->_io->readBytes($this->valueSize());
            $this->_m_padding2 = $this->_io->readBytes(\Kaitai\Struct\Stream::mod(4 - $this->_io()->pos(), 4));
        }
        protected $_m_typeAsPredef;

        /**
         * Numeric type IDs in range of [0..0xff] are reserved for
         * system usage in Windows, and there are some predefined,
         * well-known values in that range. This instance allows to get
         * it as enum value, if applicable.
         */
        public function typeAsPredef() {
            if ($this->_m_typeAsPredef !== null)
                return $this->_m_typeAsPredef;
            if ( ((!($this->type()->isString())) && ($this->type()->asNumeric() <= 255)) ) {
                $this->_m_typeAsPredef = $this->type()->asNumeric();
            }
            return $this->_m_typeAsPredef;
        }
        protected $_m_valueSize;
        protected $_m_headerSize;
        protected $_m_type;
        protected $_m_name;
        protected $_m_padding1;
        protected $_m_formatVersion;
        protected $_m_flags;
        protected $_m_language;
        protected $_m_valueVersion;
        protected $_m_characteristics;
        protected $_m_value;
        protected $_m_padding2;

        /**
         * Size of resource value that follows the header
         */
        public function valueSize() { return $this->_m_valueSize; }

        /**
         * Size of this header (i.e. every field except `value` and an
         * optional padding after it)
         */
        public function headerSize() { return $this->_m_headerSize; }
        public function type() { return $this->_m_type; }
        public function name() { return $this->_m_name; }
        public function padding1() { return $this->_m_padding1; }
        public function formatVersion() { return $this->_m_formatVersion; }
        public function flags() { return $this->_m_flags; }
        public function language() { return $this->_m_language; }

        /**
         * Version for value, as specified by a user.
         */
        public function valueVersion() { return $this->_m_valueVersion; }

        /**
         * Extra 4 bytes that can be used by user for any purpose.
         */
        public function characteristics() { return $this->_m_characteristics; }
        public function value() { return $this->_m_value; }
        public function padding2() { return $this->_m_padding2; }
    }
}

namespace WindowsResourceFile\Resource {
    class PredefTypes {
        const CURSOR = 1;
        const BITMAP = 2;
        const ICON = 3;
        const MENU = 4;
        const DIALOG = 5;
        const STRING = 6;
        const FONTDIR = 7;
        const FONT = 8;
        const ACCELERATOR = 9;
        const RCDATA = 10;
        const MESSAGETABLE = 11;
        const GROUP_CURSOR = 12;
        const GROUP_ICON = 14;
        const VERSION = 16;
        const DLGINCLUDE = 17;
        const PLUGPLAY = 19;
        const VXD = 20;
        const ANICURSOR = 21;
        const ANIICON = 22;
        const HTML = 23;
        const MANIFEST = 24;

        private const _VALUES = [1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 14 => true, 16 => true, 17 => true, 19 => true, 20 => true, 21 => true, 22 => true, 23 => true, 24 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

/**
 * Resources use a special serialization of names and types: they
 * can be either a number or a string.
 * 
 * Use `is_string` to check which kind we've got here, and then use
 * `as_numeric` or `as_string` to get relevant value.
 */

namespace WindowsResourceFile {
    class UnicodeOrId extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\WindowsResourceFile\Resource $_parent = null, ?\WindowsResourceFile $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            if ($this->savePos1() >= 0) {
                $this->_m_first = $this->_io->readU2le();
            }
            if (!($this->isString())) {
                $this->_m_asNumeric = $this->_io->readU2le();
            }
            if ($this->isString()) {
                $this->_m_rest = [];
                $i = 0;
                do {
                    $_ = $this->_io->readU2le();
                    $this->_m_rest[] = $_;
                    $i++;
                } while (!($_ == 0));
            }
            if ( (($this->isString()) && ($this->savePos2() >= 0)) ) {
                $this->_m_noop = $this->_io->readBytes(0);
            }
        }
        protected $_m_asString;
        public function asString() {
            if ($this->_m_asString !== null)
                return $this->_m_asString;
            if ($this->isString()) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->savePos1());
                $this->_m_asString = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(($this->savePos2() - $this->savePos1()) - 2), "UTF-16LE");
                $this->_io->seek($_pos);
            }
            return $this->_m_asString;
        }
        protected $_m_isString;
        public function isString() {
            if ($this->_m_isString !== null)
                return $this->_m_isString;
            $this->_m_isString = $this->first() != 65535;
            return $this->_m_isString;
        }
        protected $_m_savePos1;
        public function savePos1() {
            if ($this->_m_savePos1 !== null)
                return $this->_m_savePos1;
            $this->_m_savePos1 = $this->_io()->pos();
            return $this->_m_savePos1;
        }
        protected $_m_savePos2;
        public function savePos2() {
            if ($this->_m_savePos2 !== null)
                return $this->_m_savePos2;
            $this->_m_savePos2 = $this->_io()->pos();
            return $this->_m_savePos2;
        }
        protected $_m_first;
        protected $_m_asNumeric;
        protected $_m_rest;
        protected $_m_noop;
        public function first() { return $this->_m_first; }
        public function asNumeric() { return $this->_m_asNumeric; }
        public function rest() { return $this->_m_rest; }
        public function noop() { return $this->_m_noop; }
    }
}
