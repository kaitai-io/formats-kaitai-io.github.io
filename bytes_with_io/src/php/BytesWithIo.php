<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Helper type to work around Kaitai Struct not providing an `_io` member for plain byte arrays.
 */

namespace {
    class BytesWithIo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\BytesWithIo $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_data = $this->_io->readBytesFull();
        }
        protected $_m_data;

        /**
         * The actual data.
         */
        public function data() { return $this->_m_data; }
    }
}
