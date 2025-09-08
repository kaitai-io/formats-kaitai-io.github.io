<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Gzip is a popular and standard single-file archiving format. It
 * essentially provides a container that stores original file name,
 * timestamp and a few other things (like optional comment), basic
 * CRCs, etc, and a file compressed by a chosen compression algorithm.
 * 
 * As of 2019, there is actually only one working solution for
 * compression algorithms, so it's typically raw DEFLATE stream
 * (without zlib header) in all gzipped files.
 */

namespace {
    class Gzip extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Gzip $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(2);
            if (!($this->_m_magic == "\x1F\x8B")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x1F\x8B", $this->_m_magic, $this->_io, "/seq/0");
            }
            $this->_m_compressionMethod = $this->_io->readU1();
            $this->_m_flags = new \Gzip\Flags($this->_io, $this, $this->_root);
            $this->_m_modTime = $this->_io->readU4le();
            switch ($this->compressionMethod()) {
                case \Gzip\CompressionMethods::DEFLATE:
                    $this->_m_extraFlags = new \Gzip\ExtraFlagsDeflate($this->_io, $this, $this->_root);
                    break;
            }
            $this->_m_os = $this->_io->readU1();
            if ($this->flags()->hasExtra()) {
                $this->_m_extras = new \Gzip\Extras($this->_io, $this, $this->_root);
            }
            if ($this->flags()->hasName()) {
                $this->_m_name = $this->_io->readBytesTerm(0, false, true, true);
            }
            if ($this->flags()->hasComment()) {
                $this->_m_comment = $this->_io->readBytesTerm(0, false, true, true);
            }
            if ($this->flags()->hasHeaderCrc()) {
                $this->_m_headerCrc16 = $this->_io->readU2le();
            }
            $this->_m_body = $this->_io->readBytes(($this->_io()->size() - $this->_io()->pos()) - 8);
            $this->_m_bodyCrc32 = $this->_io->readU4le();
            $this->_m_lenUncompressed = $this->_io->readU4le();
        }
        protected $_m_magic;
        protected $_m_compressionMethod;
        protected $_m_flags;
        protected $_m_modTime;
        protected $_m_extraFlags;
        protected $_m_os;
        protected $_m_extras;
        protected $_m_name;
        protected $_m_comment;
        protected $_m_headerCrc16;
        protected $_m_body;
        protected $_m_bodyCrc32;
        protected $_m_lenUncompressed;
        public function magic() { return $this->_m_magic; }

        /**
         * Compression method used to compress file body. In practice, only
         * one method is widely used: 8 = deflate.
         */
        public function compressionMethod() { return $this->_m_compressionMethod; }
        public function flags() { return $this->_m_flags; }

        /**
         * Last modification time of a file archived in UNIX timestamp format.
         */
        public function modTime() { return $this->_m_modTime; }

        /**
         * Extra flags, specific to compression method chosen.
         */
        public function extraFlags() { return $this->_m_extraFlags; }

        /**
         * OS used to compress this file.
         */
        public function os() { return $this->_m_os; }
        public function extras() { return $this->_m_extras; }
        public function name() { return $this->_m_name; }
        public function comment() { return $this->_m_comment; }
        public function headerCrc16() { return $this->_m_headerCrc16; }

        /**
         * Compressed body of a file archived. Note that we don't make an
         * attempt to decompress it here.
         */
        public function body() { return $this->_m_body; }

        /**
         * CRC32 checksum of an uncompressed file body
         */
        public function bodyCrc32() { return $this->_m_bodyCrc32; }

        /**
         * Size of original uncompressed data in bytes (truncated to 32
         * bits).
         */
        public function lenUncompressed() { return $this->_m_lenUncompressed; }
    }
}

namespace Gzip {
    class ExtraFlagsDeflate extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gzip $_parent = null, ?\Gzip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_compressionStrength = $this->_io->readU1();
        }
        protected $_m_compressionStrength;
        public function compressionStrength() { return $this->_m_compressionStrength; }
    }
}

namespace Gzip\ExtraFlagsDeflate {
    class CompressionStrengths {
        const BEST = 2;
        const FAST = 4;

        private const _VALUES = [2 => true, 4 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Gzip {
    class Extras extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gzip $_parent = null, ?\Gzip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenSubfields = $this->_io->readU2le();
            $this->_m__raw_subfields = $this->_io->readBytes($this->lenSubfields());
            $_io__raw_subfields = new \Kaitai\Struct\Stream($this->_m__raw_subfields);
            $this->_m_subfields = new \Gzip\Subfields($_io__raw_subfields, $this, $this->_root);
        }
        protected $_m_lenSubfields;
        protected $_m_subfields;
        protected $_m__raw_subfields;
        public function lenSubfields() { return $this->_m_lenSubfields; }
        public function subfields() { return $this->_m_subfields; }
        public function _raw_subfields() { return $this->_m__raw_subfields; }
    }
}

namespace Gzip {
    class Flags extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gzip $_parent = null, ?\Gzip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reserved1 = $this->_io->readBitsIntBe(3);
            $this->_m_hasComment = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_hasName = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_hasExtra = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_hasHeaderCrc = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_isText = $this->_io->readBitsIntBe(1) != 0;
        }
        protected $_m_reserved1;
        protected $_m_hasComment;
        protected $_m_hasName;
        protected $_m_hasExtra;
        protected $_m_hasHeaderCrc;
        protected $_m_isText;
        public function reserved1() { return $this->_m_reserved1; }
        public function hasComment() { return $this->_m_hasComment; }
        public function hasName() { return $this->_m_hasName; }

        /**
         * If true, optional extra fields are present in the archive.
         */
        public function hasExtra() { return $this->_m_hasExtra; }

        /**
         * If true, this archive includes a CRC16 checksum for the header.
         */
        public function hasHeaderCrc() { return $this->_m_hasHeaderCrc; }

        /**
         * If true, file inside this archive is a text file from
         * compressor's point of view.
         */
        public function isText() { return $this->_m_isText; }
    }
}

/**
 * Every subfield follows typical [TLV scheme](https://en.wikipedia.org/wiki/Type-length-value):
 * 
 * * `id` serves role of "T"ype
 * * `len_data` serves role of "L"ength
 * * `data` serves role of "V"alue
 * 
 * This way it's possible to for arbitrary parser to skip over
 * subfields it does not support.
 */

namespace Gzip {
    class Subfield extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gzip\Subfields $_parent = null, ?\Gzip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_id = $this->_io->readU2le();
            $this->_m_lenData = $this->_io->readU2le();
            $this->_m_data = $this->_io->readBytes($this->lenData());
        }
        protected $_m_id;
        protected $_m_lenData;
        protected $_m_data;

        /**
         * Subfield ID, typically two ASCII letters.
         */
        public function id() { return $this->_m_id; }
        public function lenData() { return $this->_m_lenData; }
        public function data() { return $this->_m_data; }
    }
}

/**
 * Container for many subfields, constrained by size of stream.
 */

namespace Gzip {
    class Subfields extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Gzip\Extras $_parent = null, ?\Gzip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Gzip\Subfield($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace Gzip {
    class CompressionMethods {
        const DEFLATE = 8;

        private const _VALUES = [8 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Gzip {
    class Oses {

        /**
         * FAT filesystem (MS-DOS, OS/2, NT/Win32)
         */
        const FAT = 0;

        /**
         * Amiga
         */
        const AMIGA = 1;

        /**
         * VMS (or OpenVMS)
         */
        const VMS = 2;

        /**
         * Unix
         */
        const UNIX = 3;

        /**
         * VM/CMS
         */
        const VM_CMS = 4;

        /**
         * Atari TOS
         */
        const ATARI_TOS = 5;

        /**
         * HPFS filesystem (OS/2, NT)
         */
        const HPFS = 6;

        /**
         * Macintosh
         */
        const MACINTOSH = 7;

        /**
         * Z-System
         */
        const Z_SYSTEM = 8;

        /**
         * CP/M
         */
        const CP_M = 9;

        /**
         * TOPS-20
         */
        const TOPS_20 = 10;

        /**
         * NTFS filesystem (NT)
         */
        const NTFS = 11;

        /**
         * QDOS
         */
        const QDOS = 12;

        /**
         * Acorn RISCOS
         */
        const ACORN_RISCOS = 13;
        const UNKNOWN = 255;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 255 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
