<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class Avi extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Avi $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic1 = $this->_io->readBytes(4);
            if (!($this->magic1() == "\x52\x49\x46\x46")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x52\x49\x46\x46", $this->magic1(), $this->_io(), "/seq/0");
            }
            $this->_m_fileSize = $this->_io->readU4le();
            $this->_m_magic2 = $this->_io->readBytes(4);
            if (!($this->magic2() == "\x41\x56\x49\x20")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x41\x56\x49\x20", $this->magic2(), $this->_io(), "/seq/2");
            }
            $this->_m__raw_data = $this->_io->readBytes(($this->fileSize() - 4));
            $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
            $this->_m_data = new \Avi\Blocks($_io__raw_data, $this, $this->_root);
        }
        protected $_m_magic1;
        protected $_m_fileSize;
        protected $_m_magic2;
        protected $_m_data;
        protected $_m__raw_data;
        public function magic1() { return $this->_m_magic1; }
        public function fileSize() { return $this->_m_fileSize; }
        public function magic2() { return $this->_m_magic2; }
        public function data() { return $this->_m_data; }
        public function _raw_data() { return $this->_m__raw_data; }
    }
}

namespace Avi {
    class ListBody extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Avi\Block $_parent = null, \Avi $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_listType = $this->_io->readU4le();
            $this->_m_data = new \Avi\Blocks($this->_io, $this, $this->_root);
        }
        protected $_m_listType;
        protected $_m_data;
        public function listType() { return $this->_m_listType; }
        public function data() { return $this->_m_data; }
    }
}

namespace Avi {
    class Rect extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Avi\StrhBody $_parent = null, \Avi $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_left = $this->_io->readS2le();
            $this->_m_top = $this->_io->readS2le();
            $this->_m_right = $this->_io->readS2le();
            $this->_m_bottom = $this->_io->readS2le();
        }
        protected $_m_left;
        protected $_m_top;
        protected $_m_right;
        protected $_m_bottom;
        public function left() { return $this->_m_left; }
        public function top() { return $this->_m_top; }
        public function right() { return $this->_m_right; }
        public function bottom() { return $this->_m_bottom; }
    }
}

namespace Avi {
    class Blocks extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Avi $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Avi\Block($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

/**
 * Main header of an AVI file, defined as AVIMAINHEADER structure
 */

namespace Avi {
    class AvihBody extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Avi\Block $_parent = null, \Avi $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_microSecPerFrame = $this->_io->readU4le();
            $this->_m_maxBytesPerSec = $this->_io->readU4le();
            $this->_m_paddingGranularity = $this->_io->readU4le();
            $this->_m_flags = $this->_io->readU4le();
            $this->_m_totalFrames = $this->_io->readU4le();
            $this->_m_initialFrames = $this->_io->readU4le();
            $this->_m_streams = $this->_io->readU4le();
            $this->_m_suggestedBufferSize = $this->_io->readU4le();
            $this->_m_width = $this->_io->readU4le();
            $this->_m_height = $this->_io->readU4le();
            $this->_m_reserved = $this->_io->readBytes(16);
        }
        protected $_m_microSecPerFrame;
        protected $_m_maxBytesPerSec;
        protected $_m_paddingGranularity;
        protected $_m_flags;
        protected $_m_totalFrames;
        protected $_m_initialFrames;
        protected $_m_streams;
        protected $_m_suggestedBufferSize;
        protected $_m_width;
        protected $_m_height;
        protected $_m_reserved;
        public function microSecPerFrame() { return $this->_m_microSecPerFrame; }
        public function maxBytesPerSec() { return $this->_m_maxBytesPerSec; }
        public function paddingGranularity() { return $this->_m_paddingGranularity; }
        public function flags() { return $this->_m_flags; }
        public function totalFrames() { return $this->_m_totalFrames; }
        public function initialFrames() { return $this->_m_initialFrames; }
        public function streams() { return $this->_m_streams; }
        public function suggestedBufferSize() { return $this->_m_suggestedBufferSize; }
        public function width() { return $this->_m_width; }
        public function height() { return $this->_m_height; }
        public function reserved() { return $this->_m_reserved; }
    }
}

namespace Avi {
    class Block extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Avi\Blocks $_parent = null, \Avi $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fourCc = $this->_io->readU4le();
            $this->_m_blockSize = $this->_io->readU4le();
            switch ($this->fourCc()) {
                case \Avi\ChunkType::LIST:
                    $this->_m__raw_data = $this->_io->readBytes($this->blockSize());
                    $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                    $this->_m_data = new \Avi\ListBody($_io__raw_data, $this, $this->_root);
                    break;
                case \Avi\ChunkType::AVIH:
                    $this->_m__raw_data = $this->_io->readBytes($this->blockSize());
                    $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                    $this->_m_data = new \Avi\AvihBody($_io__raw_data, $this, $this->_root);
                    break;
                case \Avi\ChunkType::STRH:
                    $this->_m__raw_data = $this->_io->readBytes($this->blockSize());
                    $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                    $this->_m_data = new \Avi\StrhBody($_io__raw_data, $this, $this->_root);
                    break;
                default:
                    $this->_m_data = $this->_io->readBytes($this->blockSize());
                    break;
            }
        }
        protected $_m_fourCc;
        protected $_m_blockSize;
        protected $_m_data;
        protected $_m__raw_data;
        public function fourCc() { return $this->_m_fourCc; }
        public function blockSize() { return $this->_m_blockSize; }
        public function data() { return $this->_m_data; }
        public function _raw_data() { return $this->_m__raw_data; }
    }
}

/**
 * Stream header (one header per stream), defined as AVISTREAMHEADER structure
 */

namespace Avi {
    class StrhBody extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Avi\Block $_parent = null, \Avi $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fccType = $this->_io->readU4le();
            $this->_m_fccHandler = $this->_io->readU4le();
            $this->_m_flags = $this->_io->readU4le();
            $this->_m_priority = $this->_io->readU2le();
            $this->_m_language = $this->_io->readU2le();
            $this->_m_initialFrames = $this->_io->readU4le();
            $this->_m_scale = $this->_io->readU4le();
            $this->_m_rate = $this->_io->readU4le();
            $this->_m_start = $this->_io->readU4le();
            $this->_m_length = $this->_io->readU4le();
            $this->_m_suggestedBufferSize = $this->_io->readU4le();
            $this->_m_quality = $this->_io->readU4le();
            $this->_m_sampleSize = $this->_io->readU4le();
            $this->_m_frame = new \Avi\Rect($this->_io, $this, $this->_root);
        }
        protected $_m_fccType;
        protected $_m_fccHandler;
        protected $_m_flags;
        protected $_m_priority;
        protected $_m_language;
        protected $_m_initialFrames;
        protected $_m_scale;
        protected $_m_rate;
        protected $_m_start;
        protected $_m_length;
        protected $_m_suggestedBufferSize;
        protected $_m_quality;
        protected $_m_sampleSize;
        protected $_m_frame;

        /**
         * Type of the data contained in the stream
         */
        public function fccType() { return $this->_m_fccType; }

        /**
         * Type of preferred data handler for the stream (specifies codec for audio / video streams)
         */
        public function fccHandler() { return $this->_m_fccHandler; }
        public function flags() { return $this->_m_flags; }
        public function priority() { return $this->_m_priority; }
        public function language() { return $this->_m_language; }
        public function initialFrames() { return $this->_m_initialFrames; }
        public function scale() { return $this->_m_scale; }
        public function rate() { return $this->_m_rate; }
        public function start() { return $this->_m_start; }
        public function length() { return $this->_m_length; }
        public function suggestedBufferSize() { return $this->_m_suggestedBufferSize; }
        public function quality() { return $this->_m_quality; }
        public function sampleSize() { return $this->_m_sampleSize; }
        public function frame() { return $this->_m_frame; }
    }
}

/**
 * Stream format description
 */

namespace Avi {
    class StrfBody extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Avi $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
        }
    }
}

namespace Avi {
    class ChunkType {
        const IDX1 = 829973609;
        const JUNK = 1263424842;
        const INFO = 1330007625;
        const ISFT = 1413894985;
        const LIST = 1414744396;
        const STRF = 1718776947;
        const AVIH = 1751742049;
        const STRH = 1752331379;
        const MOVI = 1769369453;
        const HDRL = 1819436136;
        const STRL = 1819440243;
    }
}

namespace Avi {
    class StreamType {
        const MIDS = 1935960429;
        const VIDS = 1935960438;
        const AUDS = 1935963489;
        const TXTS = 1937012852;
    }
}

namespace Avi {
    class HandlerType {
        const MP3 = 85;
        const AC3 = 8192;
        const DTS = 8193;
        const CVID = 1684633187;
        const XVID = 1684633208;
    }
}
