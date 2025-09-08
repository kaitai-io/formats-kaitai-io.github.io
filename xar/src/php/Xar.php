<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * From [Wikipedia](https://en.wikipedia.org/wiki/Xar_(archiver)):
 * 
 * "XAR (short for eXtensible ARchive format) is an open source file archiver
 * and the archiver's file format. It was created within the OpenDarwin project
 * and is used in macOS X 10.5 and up for software installation routines, as
 * well as browser extensions in Safari 5.0 and up."
 */

namespace {
    class Xar extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Xar $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_headerPrefix = new \Xar\FileHeaderPrefix($this->_io, $this, $this->_root);
            $this->_m__raw_header = $this->_io->readBytes($this->headerPrefix()->lenHeader() - 6);
            $_io__raw_header = new \Kaitai\Struct\Stream($this->_m__raw_header);
            $this->_m_header = new \Xar\FileHeader($_io__raw_header, $this, $this->_root);
            $this->_m__raw__raw_toc = $this->_io->readBytes($this->header()->lenTocCompressed());
            $this->_m__raw_toc = \Kaitai\Struct\Stream::processZlib($this->_m__raw__raw_toc);
            $_io__raw_toc = new \Kaitai\Struct\Stream($this->_m__raw_toc);
            $this->_m_toc = new \Xar\TocType($_io__raw_toc, $this, $this->_root);
        }
        protected $_m_checksumAlgorithmOther;
        public function checksumAlgorithmOther() {
            if ($this->_m_checksumAlgorithmOther !== null)
                return $this->_m_checksumAlgorithmOther;
            $this->_m_checksumAlgorithmOther = 3;
            return $this->_m_checksumAlgorithmOther;
        }
        protected $_m_headerPrefix;
        protected $_m_header;
        protected $_m_toc;
        protected $_m__raw_header;
        protected $_m__raw_toc;
        protected $_m__raw__raw_toc;

        /**
         * internal; access `_root.header` instead
         */
        public function headerPrefix() { return $this->_m_headerPrefix; }
        public function header() { return $this->_m_header; }

        /**
         * zlib compressed XML further describing the content of the archive
         */
        public function toc() { return $this->_m_toc; }
        public function _raw_header() { return $this->_m__raw_header; }
        public function _raw_toc() { return $this->_m__raw_toc; }
        public function _raw__raw_toc() { return $this->_m__raw__raw_toc; }
    }
}

namespace Xar {
    class FileHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Xar $_parent = null, ?\Xar $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_version = $this->_io->readU2be();
            if (!($this->_m_version == 1)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(1, $this->_m_version, $this->_io, "/types/file_header/seq/0");
            }
            $this->_m_lenTocCompressed = $this->_io->readU8be();
            $this->_m_tocLengthUncompressed = $this->_io->readU8be();
            $this->_m_checksumAlgorithmInt = $this->_io->readU4be();
            if ($this->hasChecksumAlgName()) {
                $this->_m_checksumAlgName = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytesFull(), 0, false), "UTF-8");
                $_ = $this->_m_checksumAlgName;
                if (!( (($_ != "") && ($_ != "none")) )) {
                    throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_checksumAlgName, $this->_io, "/types/file_header/seq/4");
                }
            }
        }
        protected $_m_checksumAlgorithmName;

        /**
         * If it is not
         * 
         * * `""` (empty string), indicating an unknown integer value (access
         *   `checksum_algorithm_int` for debugging purposes to find out
         *   what that value is), or
         * * `"none"`, indicating that the TOC checksum is not provided (in that
         *   case, the `<checksum>` property or its `style` attribute should be
         *   missing, or the `style` attribute must be set to `"none"`),
         * 
         * it must exactly match the `style` attribute value of the
         * `<checksum>` property in the root node `<toc>`. See
         * <https://github.com/mackyle/xar/blob/66d451d/xar/lib/archive.c#L345-L371>
         * for reference.
         * 
         * The `xar` (eXtensible ARchiver) program [uses OpenSSL's function
         * `EVP_get_digestbyname`](
         *   https://github.com/mackyle/xar/blob/66d451d/xar/lib/archive.c#L328
         * ) to verify this value (if it's not `""` or `"none"`, of course).
         * So it's reasonable to assume that this can only have one of the values
         * that OpenSSL recognizes.
         */
        public function checksumAlgorithmName() {
            if ($this->_m_checksumAlgorithmName !== null)
                return $this->_m_checksumAlgorithmName;
            $this->_m_checksumAlgorithmName = ($this->hasChecksumAlgName() ? $this->checksumAlgName() : ($this->checksumAlgorithmInt() == \Xar\ChecksumAlgorithmsApple::NONE ? "none" : ($this->checksumAlgorithmInt() == \Xar\ChecksumAlgorithmsApple::SHA1 ? "sha1" : ($this->checksumAlgorithmInt() == \Xar\ChecksumAlgorithmsApple::MD5 ? "md5" : ($this->checksumAlgorithmInt() == \Xar\ChecksumAlgorithmsApple::SHA256 ? "sha256" : ($this->checksumAlgorithmInt() == \Xar\ChecksumAlgorithmsApple::SHA512 ? "sha512" : ""))))));
            return $this->_m_checksumAlgorithmName;
        }
        protected $_m_hasChecksumAlgName;
        public function hasChecksumAlgName() {
            if ($this->_m_hasChecksumAlgName !== null)
                return $this->_m_hasChecksumAlgName;
            $this->_m_hasChecksumAlgName =  (($this->checksumAlgorithmInt() == $this->_root()->checksumAlgorithmOther()) && ($this->lenHeader() >= 32) && (\Kaitai\Struct\Stream::mod($this->lenHeader(), 4) == 0)) ;
            return $this->_m_hasChecksumAlgName;
        }
        protected $_m_lenHeader;
        public function lenHeader() {
            if ($this->_m_lenHeader !== null)
                return $this->_m_lenHeader;
            $this->_m_lenHeader = $this->_root()->headerPrefix()->lenHeader();
            return $this->_m_lenHeader;
        }
        protected $_m_version;
        protected $_m_lenTocCompressed;
        protected $_m_tocLengthUncompressed;
        protected $_m_checksumAlgorithmInt;
        protected $_m_checksumAlgName;
        public function version() { return $this->_m_version; }
        public function lenTocCompressed() { return $this->_m_lenTocCompressed; }
        public function tocLengthUncompressed() { return $this->_m_tocLengthUncompressed; }

        /**
         * internal; access `checksum_algorithm_name` instead
         */
        public function checksumAlgorithmInt() { return $this->_m_checksumAlgorithmInt; }

        /**
         * internal; access `checksum_algorithm_name` instead
         */
        public function checksumAlgName() { return $this->_m_checksumAlgName; }
    }
}

namespace Xar {
    class FileHeaderPrefix extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Xar $_parent = null, ?\Xar $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->_m_magic == "\x78\x61\x72\x21")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x78\x61\x72\x21", $this->_m_magic, $this->_io, "/types/file_header_prefix/seq/0");
            }
            $this->_m_lenHeader = $this->_io->readU2be();
        }
        protected $_m_magic;
        protected $_m_lenHeader;
        public function magic() { return $this->_m_magic; }

        /**
         * internal; access `_root.header.len_header` instead
         */
        public function lenHeader() { return $this->_m_lenHeader; }
    }
}

namespace Xar {
    class TocType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Xar $_parent = null, ?\Xar $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_xmlString = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
        }
        protected $_m_xmlString;
        public function xmlString() { return $this->_m_xmlString; }
    }
}

namespace Xar {
    class ChecksumAlgorithmsApple {
        const NONE = 0;
        const SHA1 = 1;
        const MD5 = 2;
        const SHA256 = 3;
        const SHA512 = 4;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
