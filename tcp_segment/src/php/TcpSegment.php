<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * TCP is one of the core Internet protocols on transport layer (AKA
 * OSI layer 4), providing stateful connections with error checking,
 * guarantees of delivery, order of segments and avoidance of duplicate
 * delivery.
 */

namespace {
    class TcpSegment extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \TcpSegment $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_srcPort = $this->_io->readU2be();
            $this->_m_dstPort = $this->_io->readU2be();
            $this->_m_seqNum = $this->_io->readU4be();
            $this->_m_ackNum = $this->_io->readU4be();
            $this->_m_dataOffset = $this->_io->readBitsIntBe(4);
            $this->_m_reserved = $this->_io->readBitsIntBe(4);
            $this->_io->alignToByte();
            $this->_m_flags = new \TcpSegment\Flags($this->_io, $this, $this->_root);
            $this->_m_windowSize = $this->_io->readU2be();
            $this->_m_checksum = $this->_io->readU2be();
            $this->_m_urgentPointer = $this->_io->readU2be();
            if ((($this->dataOffset() * 4) - 20) != 0) {
                $this->_m_options = $this->_io->readBytes((($this->dataOffset() * 4) - 20));
            }
            $this->_m_body = $this->_io->readBytesFull();
        }
        protected $_m_srcPort;
        protected $_m_dstPort;
        protected $_m_seqNum;
        protected $_m_ackNum;
        protected $_m_dataOffset;
        protected $_m_reserved;
        protected $_m_flags;
        protected $_m_windowSize;
        protected $_m_checksum;
        protected $_m_urgentPointer;
        protected $_m_options;
        protected $_m_body;

        /**
         * Source port
         */
        public function srcPort() { return $this->_m_srcPort; }

        /**
         * Destination port
         */
        public function dstPort() { return $this->_m_dstPort; }

        /**
         * Sequence number
         */
        public function seqNum() { return $this->_m_seqNum; }

        /**
         * Acknowledgment number
         */
        public function ackNum() { return $this->_m_ackNum; }

        /**
         * Data offset (in 32-bit words from the beginning of this type, normally 32 or can be extended if there are any TCP options or padding is present)
         */
        public function dataOffset() { return $this->_m_dataOffset; }
        public function reserved() { return $this->_m_reserved; }
        public function flags() { return $this->_m_flags; }
        public function windowSize() { return $this->_m_windowSize; }
        public function checksum() { return $this->_m_checksum; }
        public function urgentPointer() { return $this->_m_urgentPointer; }
        public function options() { return $this->_m_options; }
        public function body() { return $this->_m_body; }
    }
}

/**
 * TCP header flags as defined "TCP Header Flags" registry.
 */

namespace TcpSegment {
    class Flags extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \TcpSegment $_parent = null, \TcpSegment $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_cwr = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_ece = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_urg = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_ack = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_psh = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_rst = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_syn = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_fin = $this->_io->readBitsIntBe(1) != 0;
        }
        protected $_m_cwr;
        protected $_m_ece;
        protected $_m_urg;
        protected $_m_ack;
        protected $_m_psh;
        protected $_m_rst;
        protected $_m_syn;
        protected $_m_fin;

        /**
         * Congestion Window Reduced
         */
        public function cwr() { return $this->_m_cwr; }

        /**
         * ECN-Echo
         */
        public function ece() { return $this->_m_ece; }

        /**
         * Urgent pointer field is significant
         */
        public function urg() { return $this->_m_urg; }

        /**
         * Acknowledgment field is significant
         */
        public function ack() { return $this->_m_ack; }

        /**
         * Push function
         */
        public function psh() { return $this->_m_psh; }

        /**
         * Reset the connection
         */
        public function rst() { return $this->_m_rst; }

        /**
         * Synchronize sequence numbers
         */
        public function syn() { return $this->_m_syn; }

        /**
         * No more data from sender
         */
        public function fin() { return $this->_m_fin; }
    }
}
