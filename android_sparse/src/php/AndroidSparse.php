<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * The Android sparse format is a format to more efficiently store files
 * for for example firmware updates to save on bandwidth. Files in sparse
 * format first have to be converted back to their original format.
 * 
 * A tool to create images for testing can be found in the Android source code tree:
 * 
 * <https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse> - `img2simg.c`
 * 
 * Note: this is not the same as the Android sparse data image format.
 */

namespace {
    class AndroidSparse extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\AndroidSparse $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_headerPrefix = new \AndroidSparse\FileHeaderPrefix($this->_io, $this, $this->_root);
            $this->_m__raw_header = $this->_io->readBytes($this->headerPrefix()->lenHeader() - 10);
            $_io__raw_header = new \Kaitai\Struct\Stream($this->_m__raw_header);
            $this->_m_header = new \AndroidSparse\FileHeader($_io__raw_header, $this, $this->_root);
            $this->_m_chunks = [];
            $n = $this->header()->numChunks();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_chunks[] = new \AndroidSparse\Chunk($this->_io, $this, $this->_root);
            }
        }
        protected $_m_headerPrefix;
        protected $_m_header;
        protected $_m_chunks;
        protected $_m__raw_header;

        /**
         * internal; access `_root.header` instead
         */
        public function headerPrefix() { return $this->_m_headerPrefix; }
        public function header() { return $this->_m_header; }
        public function chunks() { return $this->_m_chunks; }
        public function _raw_header() { return $this->_m__raw_header; }
    }
}

namespace AndroidSparse {
    class Chunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AndroidSparse $_parent = null, ?\AndroidSparse $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m__raw_header = $this->_io->readBytes($this->_root()->header()->lenChunkHeader());
            $_io__raw_header = new \Kaitai\Struct\Stream($this->_m__raw_header);
            $this->_m_header = new \AndroidSparse\Chunk\ChunkHeader($_io__raw_header, $this, $this->_root);
            switch ($this->header()->chunkType()) {
                case \AndroidSparse\ChunkTypes::CRC32:
                    $this->_m_body = $this->_io->readU4le();
                    break;
                default:
                    $this->_m_body = $this->_io->readBytes($this->header()->lenBody());
                    break;
            }
        }
        protected $_m_header;
        protected $_m_body;
        protected $_m__raw_header;
        public function header() { return $this->_m_header; }
        public function body() { return $this->_m_body; }
        public function _raw_header() { return $this->_m__raw_header; }
    }
}

namespace AndroidSparse\Chunk {
    class ChunkHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AndroidSparse\Chunk $_parent = null, ?\AndroidSparse $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_chunkType = $this->_io->readU2le();
            $this->_m_reserved1 = $this->_io->readU2le();
            $this->_m_numBodyBlocks = $this->_io->readU4le();
            $this->_m_lenChunk = $this->_io->readU4le();
            if (!($this->_m_lenChunk == ($this->lenBodyExpected() != -1 ? $this->_root()->header()->lenChunkHeader() + $this->lenBodyExpected() : $this->lenChunk()))) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(($this->lenBodyExpected() != -1 ? $this->_root()->header()->lenChunkHeader() + $this->lenBodyExpected() : $this->lenChunk()), $this->_m_lenChunk, $this->_io, "/types/chunk/types/chunk_header/seq/3");
            }
        }
        protected $_m_lenBody;
        public function lenBody() {
            if ($this->_m_lenBody !== null)
                return $this->_m_lenBody;
            $this->_m_lenBody = $this->lenChunk() - $this->_root()->header()->lenChunkHeader();
            return $this->_m_lenBody;
        }
        protected $_m_lenBodyExpected;
        public function lenBodyExpected() {
            if ($this->_m_lenBodyExpected !== null)
                return $this->_m_lenBodyExpected;
            $this->_m_lenBodyExpected = ($this->chunkType() == \AndroidSparse\ChunkTypes::RAW ? $this->_root()->header()->blockSize() * $this->numBodyBlocks() : ($this->chunkType() == \AndroidSparse\ChunkTypes::FILL ? 4 : ($this->chunkType() == \AndroidSparse\ChunkTypes::DONT_CARE ? 0 : ($this->chunkType() == \AndroidSparse\ChunkTypes::CRC32 ? 4 : -1))));
            return $this->_m_lenBodyExpected;
        }
        protected $_m_chunkType;
        protected $_m_reserved1;
        protected $_m_numBodyBlocks;
        protected $_m_lenChunk;
        public function chunkType() { return $this->_m_chunkType; }
        public function reserved1() { return $this->_m_reserved1; }

        /**
         * size of the chunk body in blocks in output image
         */
        public function numBodyBlocks() { return $this->_m_numBodyBlocks; }

        /**
         * in bytes of chunk input file including chunk header and data
         */
        public function lenChunk() { return $this->_m_lenChunk; }
    }
}

namespace AndroidSparse {
    class FileHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AndroidSparse $_parent = null, ?\AndroidSparse $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenChunkHeader = $this->_io->readU2le();
            $this->_m_blockSize = $this->_io->readU4le();
            $_ = $this->_m_blockSize;
            if (!(\Kaitai\Struct\Stream::mod($_, 4) == 0)) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_blockSize, $this->_io, "/types/file_header/seq/1");
            }
            $this->_m_numBlocks = $this->_io->readU4le();
            $this->_m_numChunks = $this->_io->readU4le();
            $this->_m_checksum = $this->_io->readU4le();
        }
        protected $_m_lenHeader;

        /**
         * size of file header, should be 28
         */
        public function lenHeader() {
            if ($this->_m_lenHeader !== null)
                return $this->_m_lenHeader;
            $this->_m_lenHeader = $this->_root()->headerPrefix()->lenHeader();
            return $this->_m_lenHeader;
        }
        protected $_m_version;
        public function version() {
            if ($this->_m_version !== null)
                return $this->_m_version;
            $this->_m_version = $this->_root()->headerPrefix()->version();
            return $this->_m_version;
        }
        protected $_m_lenChunkHeader;
        protected $_m_blockSize;
        protected $_m_numBlocks;
        protected $_m_numChunks;
        protected $_m_checksum;

        /**
         * size of chunk header, should be 12
         */
        public function lenChunkHeader() { return $this->_m_lenChunkHeader; }

        /**
         * block size in bytes, must be a multiple of 4
         */
        public function blockSize() { return $this->_m_blockSize; }

        /**
         * blocks in the original data
         */
        public function numBlocks() { return $this->_m_numBlocks; }
        public function numChunks() { return $this->_m_numChunks; }

        /**
         * CRC32 checksum of the original data
         * 
         * In practice always 0; if checksum writing is requested, a CRC32 chunk is written
         * at the end of the file instead. The canonical `libsparse` implementation does this
         * and other implementations tend to follow it, see
         * <https://gitlab.com/teskje/android-sparse-rs/-/blob/57c2577/src/write.rs#L112-114>
         */
        public function checksum() { return $this->_m_checksum; }
    }
}

namespace AndroidSparse {
    class FileHeaderPrefix extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AndroidSparse $_parent = null, ?\AndroidSparse $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->_m_magic == "\x3A\xFF\x26\xED")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x3A\xFF\x26\xED", $this->_m_magic, $this->_io, "/types/file_header_prefix/seq/0");
            }
            $this->_m_version = new \AndroidSparse\Version($this->_io, $this, $this->_root);
            $this->_m_lenHeader = $this->_io->readU2le();
        }
        protected $_m_magic;
        protected $_m_version;
        protected $_m_lenHeader;
        public function magic() { return $this->_m_magic; }

        /**
         * internal; access `_root.header.version` instead
         */
        public function version() { return $this->_m_version; }

        /**
         * internal; access `_root.header.len_header` instead
         */
        public function lenHeader() { return $this->_m_lenHeader; }
    }
}

namespace AndroidSparse {
    class Version extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AndroidSparse\FileHeaderPrefix $_parent = null, ?\AndroidSparse $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_major = $this->_io->readU2le();
            if (!($this->_m_major == 1)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(1, $this->_m_major, $this->_io, "/types/version/seq/0");
            }
            $this->_m_minor = $this->_io->readU2le();
        }
        protected $_m_major;
        protected $_m_minor;
        public function major() { return $this->_m_major; }
        public function minor() { return $this->_m_minor; }
    }
}

namespace AndroidSparse {
    class ChunkTypes {
        const RAW = 51905;
        const FILL = 51906;
        const DONT_CARE = 51907;
        const CRC32 = 51908;

        private const _VALUES = [51905 => true, 51906 => true, 51907 => true, 51908 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
