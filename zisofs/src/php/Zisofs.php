<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * zisofs is a compression format for files on ISO9660 file system. It has
 * limited support across operating systems, mainly Linux kernel. Typically a
 * directory tree is first preprocessed by mkzftree (from the zisofs-tools
 * package before being turned into an ISO9660 image by mkisofs, genisoimage
 * or similar tool. The data is zlib compressed.
 * 
 * The specification here describes the structure of a file that has been
 * preprocessed by mkzftree, not of a full ISO9660 ziso. Data is not
 * decompressed, as blocks with length 0 have a special meaning. Decompression
 * and deconstruction of this data should be done outside of Kaitai Struct.
 */

namespace {
    class Zisofs extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Zisofs $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m__raw_header = $this->_io->readBytes(16);
            $_io__raw_header = new \Kaitai\Struct\Stream($this->_m__raw_header);
            $this->_m_header = new \Zisofs\Header($_io__raw_header, $this, $this->_root);
            $this->_m_blockPointers = [];
            $n = $this->header()->numBlocks() + 1;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_blockPointers[] = $this->_io->readU4le();
            }
        }
        protected $_m_blocks;
        public function blocks() {
            if ($this->_m_blocks !== null)
                return $this->_m_blocks;
            $this->_m_blocks = [];
            $n = $this->header()->numBlocks();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_blocks[] = new \Zisofs\Block($this->blockPointers()[$i], $this->blockPointers()[$i + 1], $this->_io, $this, $this->_root);
            }
            return $this->_m_blocks;
        }
        protected $_m_header;
        protected $_m_blockPointers;
        protected $_m__raw_header;
        public function header() { return $this->_m_header; }

        /**
         * The final pointer (`block_pointers[header.num_blocks]`) indicates the end
         * of the last block. Typically this is also the end of the file data.
         */
        public function blockPointers() { return $this->_m_blockPointers; }
        public function _raw_header() { return $this->_m__raw_header; }
    }
}

namespace Zisofs {
    class Block extends \Kaitai\Struct\Struct {
        public function __construct(int $ofsStart, int $ofsEnd, \Kaitai\Struct\Stream $_io, ?\Zisofs $_parent = null, ?\Zisofs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_ofsStart = $ofsStart;
            $this->_m_ofsEnd = $ofsEnd;
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_data;
        public function data() {
            if ($this->_m_data !== null)
                return $this->_m_data;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsStart());
            $this->_m_data = $io->readBytes($this->lenData());
            $io->seek($_pos);
            return $this->_m_data;
        }
        protected $_m_lenData;
        public function lenData() {
            if ($this->_m_lenData !== null)
                return $this->_m_lenData;
            $this->_m_lenData = $this->ofsEnd() - $this->ofsStart();
            return $this->_m_lenData;
        }
        protected $_m_ofsStart;
        protected $_m_ofsEnd;
        public function ofsStart() { return $this->_m_ofsStart; }
        public function ofsEnd() { return $this->_m_ofsEnd; }
    }
}

namespace Zisofs {
    class Header extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Zisofs $_parent = null, ?\Zisofs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(8);
            if (!($this->_m_magic == "\x37\xE4\x53\x96\xC9\xDB\xD6\x07")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x37\xE4\x53\x96\xC9\xDB\xD6\x07", $this->_m_magic, $this->_io, "/types/header/seq/0");
            }
            $this->_m_uncompressedSize = $this->_io->readU4le();
            $this->_m_lenHeader = $this->_io->readU1();
            if (!($this->_m_lenHeader == 4)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(4, $this->_m_lenHeader, $this->_io, "/types/header/seq/2");
            }
            $this->_m_blockSizeLog2 = $this->_io->readU1();
            if (!( (($this->_m_blockSizeLog2 == 15) || ($this->_m_blockSizeLog2 == 16) || ($this->_m_blockSizeLog2 == 17)) )) {
                throw new \Kaitai\Struct\Error\ValidationNotAnyOfError($this->_m_blockSizeLog2, $this->_io, "/types/header/seq/3");
            }
            $this->_m_reserved = $this->_io->readBytes(2);
            if (!($this->_m_reserved == "\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00\x00", $this->_m_reserved, $this->_io, "/types/header/seq/4");
            }
        }
        protected $_m_blockSize;
        public function blockSize() {
            if ($this->_m_blockSize !== null)
                return $this->_m_blockSize;
            $this->_m_blockSize = 1 << $this->blockSizeLog2();
            return $this->_m_blockSize;
        }
        protected $_m_numBlocks;

        /**
         * ceil(uncompressed_size / block_size)
         */
        public function numBlocks() {
            if ($this->_m_numBlocks !== null)
                return $this->_m_numBlocks;
            $this->_m_numBlocks = intval($this->uncompressedSize() / $this->blockSize()) + (\Kaitai\Struct\Stream::mod($this->uncompressedSize(), $this->blockSize()) != 0 ? 1 : 0);
            return $this->_m_numBlocks;
        }
        protected $_m_magic;
        protected $_m_uncompressedSize;
        protected $_m_lenHeader;
        protected $_m_blockSizeLog2;
        protected $_m_reserved;
        public function magic() { return $this->_m_magic; }

        /**
         * Size of the original uncompressed file
         */
        public function uncompressedSize() { return $this->_m_uncompressedSize; }

        /**
         * header_size >> 2 (currently 4)
         */
        public function lenHeader() { return $this->_m_lenHeader; }
        public function blockSizeLog2() { return $this->_m_blockSizeLog2; }
        public function reserved() { return $this->_m_reserved; }
    }
}
