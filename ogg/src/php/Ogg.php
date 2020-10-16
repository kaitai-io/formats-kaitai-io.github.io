<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Ogg is a popular media container format, which provides basic
 * streaming / buffering mechanisms and is content-agnostic. Most
 * popular codecs that are used within Ogg streams are Vorbis (thus
 * making Ogg/Vorbis streams) and Theora (Ogg/Theora).
 * 
 * Ogg stream is a sequence Ogg pages. They can be read sequentially,
 * or one can jump into arbitrary stream location and scan for "OggS"
 * sync code to find the beginning of a new Ogg page and continue
 * decoding the stream contents from that one.
 */

namespace {
    class Ogg extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Ogg $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_pages = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_pages[] = new \Ogg\Page($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_pages;
        public function pages() { return $this->_m_pages; }
    }
}

/**
 * Ogg page is a basic unit of data in an Ogg bitstream, usually
 * it's around 4-8 KB, with a maximum size of 65307 bytes.
 */

namespace Ogg {
    class Page extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Ogg $_parent = null, \Ogg $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_syncCode = $this->_io->readBytes(4);
            if (!($this->syncCode() == "\x4F\x67\x67\x53")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x4F\x67\x67\x53", $this->syncCode(), $this->_io(), "/types/page/seq/0");
            }
            $this->_m_version = $this->_io->readBytes(1);
            if (!($this->version() == "\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00", $this->version(), $this->_io(), "/types/page/seq/1");
            }
            $this->_m_reserved1 = $this->_io->readBitsIntBe(5);
            $this->_m_isEndOfStream = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_isBeginningOfStream = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_isContinuation = $this->_io->readBitsIntBe(1) != 0;
            $this->_io->alignToByte();
            $this->_m_granulePos = $this->_io->readU8le();
            $this->_m_bitstreamSerial = $this->_io->readU4le();
            $this->_m_pageSeqNum = $this->_io->readU4le();
            $this->_m_crc32 = $this->_io->readU4le();
            $this->_m_numSegments = $this->_io->readU1();
            $this->_m_lenSegments = [];
            $n = $this->numSegments();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_lenSegments[] = $this->_io->readU1();
            }
            $this->_m_segments = [];
            $n = $this->numSegments();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_segments[] = $this->_io->readBytes($this->lenSegments()[$i]);
            }
        }
        protected $_m_syncCode;
        protected $_m_version;
        protected $_m_reserved1;
        protected $_m_isEndOfStream;
        protected $_m_isBeginningOfStream;
        protected $_m_isContinuation;
        protected $_m_granulePos;
        protected $_m_bitstreamSerial;
        protected $_m_pageSeqNum;
        protected $_m_crc32;
        protected $_m_numSegments;
        protected $_m_lenSegments;
        protected $_m_segments;
        public function syncCode() { return $this->_m_syncCode; }

        /**
         * Version of the Ogg bitstream format. Currently must be 0.
         */
        public function version() { return $this->_m_version; }
        public function reserved1() { return $this->_m_reserved1; }

        /**
         * EOS (End Of Stream) mark. This page is the last page in the
         * logical bitstream. The EOS flag must be set on the final page of
         * every logical bitstream, and must not be set on any other page.
         */
        public function isEndOfStream() { return $this->_m_isEndOfStream; }

        /**
         * BOS (Beginning Of Stream) mark. This page is the first page in
         * the logical bitstream. The BOS flag must be set on the first
         * page of every logical bitstream, and must not be set on any
         * other page.    
         */
        public function isBeginningOfStream() { return $this->_m_isBeginningOfStream; }

        /**
         * The first packet on this page is a continuation of the previous
         * packet in the logical bitstream.
         */
        public function isContinuation() { return $this->_m_isContinuation; }

        /**
         * "Granule position" is the time marker in Ogg files. It is an
         * abstract value, whose meaning is determined by the codec. It
         * may, for example, be a count of the number of samples, the
         * number of frames or a more complex scheme.
         */
        public function granulePos() { return $this->_m_granulePos; }

        /**
         * Serial number that identifies a page as belonging to a
         * particular logical bitstream. Each logical bitstream in a file
         * has a unique value, and this field allows implementations to
         * deliver the pages to the appropriate decoder. In a typical
         * Vorbis and Theora file, one stream is the audio (Vorbis), and
         * the other is the video (Theora).
         */
        public function bitstreamSerial() { return $this->_m_bitstreamSerial; }

        /**
         * Sequential number of page, guaranteed to be monotonically
         * increasing for each logical bitstream. The first page is 0, the
         * second 1, etc. This allows implementations to detect when data
         * has been lost.
         */
        public function pageSeqNum() { return $this->_m_pageSeqNum; }

        /**
         * This field provides a CRC32 checksum of the data in the entire
         * page (including the page header, calculated with the checksum
         * field set to 0). This allows verification that the data has not
         * been corrupted since it was created. Pages that fail the
         * checksum should be discarded. The checksum is generated using a
         * polynomial value of 0x04C11DB7.
         */
        public function crc32() { return $this->_m_crc32; }

        /**
         * The number of segments that exist in this page. There can be a
         * maximum of 255 segments in any one page.
         */
        public function numSegments() { return $this->_m_numSegments; }

        /**
         * Table of lengths of segments.
         */
        public function lenSegments() { return $this->_m_lenSegments; }

        /**
         * Segment content bytes make up the rest of the Ogg page.
         */
        public function segments() { return $this->_m_segments; }
    }
}
