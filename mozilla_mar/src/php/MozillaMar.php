<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Mozilla ARchive file is Mozilla's own archive format to distribute software updates.
 * Test files can be found on Mozilla's FTP site, for example:
 * 
 * <http://ftp.mozilla.org/pub/firefox/nightly/partials/>
 */

namespace {
    class MozillaMar extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\MozillaMar $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->_m_magic == "\x4D\x41\x52\x31")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x4D\x41\x52\x31", $this->_m_magic, $this->_io, "/seq/0");
            }
            $this->_m_ofsIndex = $this->_io->readU4be();
            $this->_m_fileSize = $this->_io->readU8be();
            $this->_m_lenSignatures = $this->_io->readU4be();
            $this->_m_signatures = [];
            $n = $this->lenSignatures();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_signatures[] = new \MozillaMar\Signature($this->_io, $this, $this->_root);
            }
            $this->_m_lenAdditionalSections = $this->_io->readU4be();
            $this->_m_additionalSections = [];
            $n = $this->lenAdditionalSections();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_additionalSections[] = new \MozillaMar\AdditionalSection($this->_io, $this, $this->_root);
            }
        }
        protected $_m_index;
        public function index() {
            if ($this->_m_index !== null)
                return $this->_m_index;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsIndex());
            $this->_m_index = new \MozillaMar\MarIndex($this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_index;
        }
        protected $_m_magic;
        protected $_m_ofsIndex;
        protected $_m_fileSize;
        protected $_m_lenSignatures;
        protected $_m_signatures;
        protected $_m_lenAdditionalSections;
        protected $_m_additionalSections;
        public function magic() { return $this->_m_magic; }
        public function ofsIndex() { return $this->_m_ofsIndex; }
        public function fileSize() { return $this->_m_fileSize; }
        public function lenSignatures() { return $this->_m_lenSignatures; }
        public function signatures() { return $this->_m_signatures; }
        public function lenAdditionalSections() { return $this->_m_lenAdditionalSections; }
        public function additionalSections() { return $this->_m_additionalSections; }
    }
}

namespace MozillaMar {
    class AdditionalSection extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MozillaMar $_parent = null, ?\MozillaMar $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenBlock = $this->_io->readU4be();
            $this->_m_blockIdentifier = $this->_io->readU4be();
            switch ($this->blockIdentifier()) {
                case \MozillaMar\BlockIdentifiers::PRODUCT_INFORMATION:
                    $this->_m__raw_bytes = $this->_io->readBytes(($this->lenBlock() - 4) - 4);
                    $_io__raw_bytes = new \Kaitai\Struct\Stream($this->_m__raw_bytes);
                    $this->_m_bytes = new \MozillaMar\ProductInformationBlock($_io__raw_bytes, $this, $this->_root);
                    break;
                default:
                    $this->_m_bytes = $this->_io->readBytes(($this->lenBlock() - 4) - 4);
                    break;
            }
        }
        protected $_m_lenBlock;
        protected $_m_blockIdentifier;
        protected $_m_bytes;
        protected $_m__raw_bytes;
        public function lenBlock() { return $this->_m_lenBlock; }
        public function blockIdentifier() { return $this->_m_blockIdentifier; }
        public function bytes() { return $this->_m_bytes; }
        public function _raw_bytes() { return $this->_m__raw_bytes; }
    }
}

namespace MozillaMar {
    class IndexEntries extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MozillaMar\MarIndex $_parent = null, ?\MozillaMar $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_indexEntry = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_indexEntry[] = new \MozillaMar\IndexEntry($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_indexEntry;
        public function indexEntry() { return $this->_m_indexEntry; }
    }
}

namespace MozillaMar {
    class IndexEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MozillaMar\IndexEntries $_parent = null, ?\MozillaMar $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ofsContent = $this->_io->readU4be();
            $this->_m_lenContent = $this->_io->readU4be();
            $this->_m_flags = $this->_io->readU4be();
            $this->_m_fileName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "UTF-8");
        }
        protected $_m_body;
        public function body() {
            if ($this->_m_body !== null)
                return $this->_m_body;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsContent());
            $this->_m_body = $io->readBytes($this->lenContent());
            $io->seek($_pos);
            return $this->_m_body;
        }
        protected $_m_ofsContent;
        protected $_m_lenContent;
        protected $_m_flags;
        protected $_m_fileName;
        public function ofsContent() { return $this->_m_ofsContent; }
        public function lenContent() { return $this->_m_lenContent; }

        /**
         * File permission bits (in standard unix-style format).
         */
        public function flags() { return $this->_m_flags; }
        public function fileName() { return $this->_m_fileName; }
    }
}

namespace MozillaMar {
    class MarIndex extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MozillaMar $_parent = null, ?\MozillaMar $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenIndex = $this->_io->readU4be();
            $this->_m__raw_indexEntries = $this->_io->readBytes($this->lenIndex());
            $_io__raw_indexEntries = new \Kaitai\Struct\Stream($this->_m__raw_indexEntries);
            $this->_m_indexEntries = new \MozillaMar\IndexEntries($_io__raw_indexEntries, $this, $this->_root);
        }
        protected $_m_lenIndex;
        protected $_m_indexEntries;
        protected $_m__raw_indexEntries;
        public function lenIndex() { return $this->_m_lenIndex; }
        public function indexEntries() { return $this->_m_indexEntries; }
        public function _raw_indexEntries() { return $this->_m__raw_indexEntries; }
    }
}

namespace MozillaMar {
    class ProductInformationBlock extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MozillaMar\AdditionalSection $_parent = null, ?\MozillaMar $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_marChannelName = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(64), 0, false), "UTF-8");
            $this->_m_productVersion = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(32), 0, false), "UTF-8");
        }
        protected $_m_marChannelName;
        protected $_m_productVersion;
        public function marChannelName() { return $this->_m_marChannelName; }
        public function productVersion() { return $this->_m_productVersion; }
    }
}

namespace MozillaMar {
    class Signature extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MozillaMar $_parent = null, ?\MozillaMar $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_algorithm = $this->_io->readU4be();
            $this->_m_lenSignature = $this->_io->readU4be();
            $this->_m_signature = $this->_io->readBytes($this->lenSignature());
        }
        protected $_m_algorithm;
        protected $_m_lenSignature;
        protected $_m_signature;
        public function algorithm() { return $this->_m_algorithm; }
        public function lenSignature() { return $this->_m_lenSignature; }
        public function signature() { return $this->_m_signature; }
    }
}

namespace MozillaMar {
    class BlockIdentifiers {
        const PRODUCT_INFORMATION = 1;

        private const _VALUES = [1 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace MozillaMar {
    class SignatureAlgorithms {
        const RSA_PKCS1_SHA1 = 1;
        const RSA_PKCS1_SHA384 = 2;

        private const _VALUES = [1 => true, 2 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
