<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Test files for APNG can be found at the following locations:
 * 
 *   * <https://philip.html5.org/tests/apng/tests.html>
 *   * <http://littlesvr.ca/apng/>
 */

namespace {
    class Png extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(8);
            if (!($this->_m_magic == "\x89\x50\x4E\x47\x0D\x0A\x1A\x0A")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x89\x50\x4E\x47\x0D\x0A\x1A\x0A", $this->_m_magic, $this->_io, "/seq/0");
            }
            $this->_m_ihdrLen = $this->_io->readU4be();
            if (!($this->_m_ihdrLen == 13)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(13, $this->_m_ihdrLen, $this->_io, "/seq/1");
            }
            $this->_m_ihdrType = $this->_io->readBytes(4);
            if (!($this->_m_ihdrType == "\x49\x48\x44\x52")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x49\x48\x44\x52", $this->_m_ihdrType, $this->_io, "/seq/2");
            }
            $this->_m_ihdr = new \Png\IhdrChunk($this->_io, $this, $this->_root);
            $this->_m_ihdrCrc = $this->_io->readBytes(4);
            $this->_m_chunks = [];
            $i = 0;
            do {
                $_ = new \Png\Chunk($this->_io, $this, $this->_root);
                $this->_m_chunks[] = $_;
                $i++;
            } while (!( (($_->type() == "IEND") || ($this->_io()->isEof())) ));
        }
        protected $_m_magic;
        protected $_m_ihdrLen;
        protected $_m_ihdrType;
        protected $_m_ihdr;
        protected $_m_ihdrCrc;
        protected $_m_chunks;
        public function magic() { return $this->_m_magic; }
        public function ihdrLen() { return $this->_m_ihdrLen; }
        public function ihdrType() { return $this->_m_ihdrType; }
        public function ihdr() { return $this->_m_ihdr; }
        public function ihdrCrc() { return $this->_m_ihdrCrc; }
        public function chunks() { return $this->_m_chunks; }
    }
}

namespace Png {
    class AnimationControlChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numFrames = $this->_io->readU4be();
            $this->_m_numPlays = $this->_io->readU4be();
        }
        protected $_m_numFrames;
        protected $_m_numPlays;

        /**
         * Number of frames, must be equal to the number of `frame_control_chunk`s
         */
        public function numFrames() { return $this->_m_numFrames; }

        /**
         * Number of times to loop, 0 indicates infinite looping.
         */
        public function numPlays() { return $this->_m_numPlays; }
    }
}

/**
 * Background chunk stores default background color to display this
 * image against. Contents depend on `color_type` of the image.
 */

namespace Png {
    class BkgdChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            switch ($this->_root()->ihdr()->colorType()) {
                case \Png\ColorType::GREYSCALE:
                    $this->_m_bkgd = new \Png\BkgdGreyscale($this->_io, $this, $this->_root);
                    break;
                case \Png\ColorType::GREYSCALE_ALPHA:
                    $this->_m_bkgd = new \Png\BkgdGreyscale($this->_io, $this, $this->_root);
                    break;
                case \Png\ColorType::INDEXED:
                    $this->_m_bkgd = new \Png\BkgdIndexed($this->_io, $this, $this->_root);
                    break;
                case \Png\ColorType::TRUECOLOR:
                    $this->_m_bkgd = new \Png\BkgdTruecolor($this->_io, $this, $this->_root);
                    break;
                case \Png\ColorType::TRUECOLOR_ALPHA:
                    $this->_m_bkgd = new \Png\BkgdTruecolor($this->_io, $this, $this->_root);
                    break;
            }
        }
        protected $_m_bkgd;
        public function bkgd() { return $this->_m_bkgd; }
    }
}

/**
 * Background chunk for greyscale images.
 */

namespace Png {
    class BkgdGreyscale extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\BkgdChunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_value = $this->_io->readU2be();
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

/**
 * Background chunk for images with indexed palette.
 */

namespace Png {
    class BkgdIndexed extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\BkgdChunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_paletteIndex = $this->_io->readU1();
        }
        protected $_m_paletteIndex;
        public function paletteIndex() { return $this->_m_paletteIndex; }
    }
}

/**
 * Background chunk for truecolor images.
 */

namespace Png {
    class BkgdTruecolor extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\BkgdChunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_red = $this->_io->readU2be();
            $this->_m_green = $this->_io->readU2be();
            $this->_m_blue = $this->_io->readU2be();
        }
        protected $_m_red;
        protected $_m_green;
        protected $_m_blue;
        public function red() { return $this->_m_red; }
        public function green() { return $this->_m_green; }
        public function blue() { return $this->_m_blue; }
    }
}

namespace Png {
    class ChrmChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_whitePoint = new \Png\Point($this->_io, $this, $this->_root);
            $this->_m_red = new \Png\Point($this->_io, $this, $this->_root);
            $this->_m_green = new \Png\Point($this->_io, $this, $this->_root);
            $this->_m_blue = new \Png\Point($this->_io, $this, $this->_root);
        }
        protected $_m_whitePoint;
        protected $_m_red;
        protected $_m_green;
        protected $_m_blue;
        public function whitePoint() { return $this->_m_whitePoint; }
        public function red() { return $this->_m_red; }
        public function green() { return $this->_m_green; }
        public function blue() { return $this->_m_blue; }
    }
}

namespace Png {
    class Chunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_len = $this->_io->readU4be();
            $this->_m_type = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
            switch ($this->type()) {
                case "PLTE":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\PlteChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "acTL":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\AnimationControlChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "bKGD":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\BkgdChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "cHRM":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\ChrmChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "fcTL":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\FrameControlChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "fdAT":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\FrameDataChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "gAMA":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\GamaChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "iTXt":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\InternationalTextChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "pHYs":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\PhysChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "sRGB":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\SrgbChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "tEXt":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\TextChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "tIME":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\TimeChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "zTXt":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\CompressedTextChunk($_io__raw_body, $this, $this->_root);
                    break;
                default:
                    $this->_m_body = $this->_io->readBytes($this->len());
                    break;
            }
            $this->_m_crc = $this->_io->readBytes(4);
        }
        protected $_m_len;
        protected $_m_type;
        protected $_m_body;
        protected $_m_crc;
        protected $_m__raw_body;
        public function len() { return $this->_m_len; }
        public function type() { return $this->_m_type; }
        public function body() { return $this->_m_body; }
        public function crc() { return $this->_m_crc; }
        public function _raw_body() { return $this->_m__raw_body; }
    }
}

/**
 * Compressed text chunk effectively allows to store key-value
 * string pairs in PNG container, compressing "value" part (which
 * can be quite lengthy) with zlib compression.
 */

namespace Png {
    class CompressedTextChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_keyword = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "UTF-8");
            $this->_m_compressionMethod = $this->_io->readU1();
            $this->_m__raw_textDatastream = $this->_io->readBytesFull();
            $this->_m_textDatastream = \Kaitai\Struct\Stream::processZlib($this->_m__raw_textDatastream);
        }
        protected $_m_keyword;
        protected $_m_compressionMethod;
        protected $_m_textDatastream;
        protected $_m__raw_textDatastream;

        /**
         * Indicates purpose of the following text data.
         */
        public function keyword() { return $this->_m_keyword; }
        public function compressionMethod() { return $this->_m_compressionMethod; }
        public function textDatastream() { return $this->_m_textDatastream; }
        public function _raw_textDatastream() { return $this->_m__raw_textDatastream; }
    }
}

namespace Png {
    class FrameControlChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_sequenceNumber = $this->_io->readU4be();
            $this->_m_width = $this->_io->readU4be();
            if (!($this->_m_width >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->_m_width, $this->_io, "/types/frame_control_chunk/seq/1");
            }
            if (!($this->_m_width <= $this->_root()->ihdr()->width())) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError($this->_root()->ihdr()->width(), $this->_m_width, $this->_io, "/types/frame_control_chunk/seq/1");
            }
            $this->_m_height = $this->_io->readU4be();
            if (!($this->_m_height >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->_m_height, $this->_io, "/types/frame_control_chunk/seq/2");
            }
            if (!($this->_m_height <= $this->_root()->ihdr()->height())) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError($this->_root()->ihdr()->height(), $this->_m_height, $this->_io, "/types/frame_control_chunk/seq/2");
            }
            $this->_m_xOffset = $this->_io->readU4be();
            if (!($this->_m_xOffset <= $this->_root()->ihdr()->width() - $this->width())) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError($this->_root()->ihdr()->width() - $this->width(), $this->_m_xOffset, $this->_io, "/types/frame_control_chunk/seq/3");
            }
            $this->_m_yOffset = $this->_io->readU4be();
            if (!($this->_m_yOffset <= $this->_root()->ihdr()->height() - $this->height())) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError($this->_root()->ihdr()->height() - $this->height(), $this->_m_yOffset, $this->_io, "/types/frame_control_chunk/seq/4");
            }
            $this->_m_delayNum = $this->_io->readU2be();
            $this->_m_delayDen = $this->_io->readU2be();
            $this->_m_disposeOp = $this->_io->readU1();
            $this->_m_blendOp = $this->_io->readU1();
        }
        protected $_m_delay;

        /**
         * Time to display this frame, in seconds
         */
        public function delay() {
            if ($this->_m_delay !== null)
                return $this->_m_delay;
            $this->_m_delay = $this->delayNum() / ($this->delayDen() == 0 ? 100.0 : $this->delayDen());
            return $this->_m_delay;
        }
        protected $_m_sequenceNumber;
        protected $_m_width;
        protected $_m_height;
        protected $_m_xOffset;
        protected $_m_yOffset;
        protected $_m_delayNum;
        protected $_m_delayDen;
        protected $_m_disposeOp;
        protected $_m_blendOp;

        /**
         * Sequence number of the animation chunk
         */
        public function sequenceNumber() { return $this->_m_sequenceNumber; }

        /**
         * Width of the following frame
         */
        public function width() { return $this->_m_width; }

        /**
         * Height of the following frame
         */
        public function height() { return $this->_m_height; }

        /**
         * X position at which to render the following frame
         */
        public function xOffset() { return $this->_m_xOffset; }

        /**
         * Y position at which to render the following frame
         */
        public function yOffset() { return $this->_m_yOffset; }

        /**
         * Frame delay fraction numerator
         */
        public function delayNum() { return $this->_m_delayNum; }

        /**
         * Frame delay fraction denominator
         */
        public function delayDen() { return $this->_m_delayDen; }

        /**
         * Type of frame area disposal to be done after rendering this frame
         */
        public function disposeOp() { return $this->_m_disposeOp; }

        /**
         * Type of frame area rendering for this frame
         */
        public function blendOp() { return $this->_m_blendOp; }
    }
}

namespace Png {
    class FrameDataChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_sequenceNumber = $this->_io->readU4be();
            $this->_m_frameData = $this->_io->readBytesFull();
        }
        protected $_m_sequenceNumber;
        protected $_m_frameData;

        /**
         * Sequence number of the animation chunk. The fcTL and fdAT chunks
         * have a 4 byte sequence number. Both chunk types share the sequence.
         * The first fcTL chunk must contain sequence number 0, and the sequence
         * numbers in the remaining fcTL and fdAT chunks must be in order, with
         * no gaps or duplicates.
         */
        public function sequenceNumber() { return $this->_m_sequenceNumber; }

        /**
         * Frame data for the frame. At least one fdAT chunk is required for
         * each frame. The compressed datastream is the concatenation of the
         * contents of the data fields of all the fdAT chunks within a frame.
         */
        public function frameData() { return $this->_m_frameData; }
    }
}

namespace Png {
    class GamaChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_gammaInt = $this->_io->readU4be();
        }
        protected $_m_gammaRatio;
        public function gammaRatio() {
            if ($this->_m_gammaRatio !== null)
                return $this->_m_gammaRatio;
            $this->_m_gammaRatio = 100000.0 / $this->gammaInt();
            return $this->_m_gammaRatio;
        }
        protected $_m_gammaInt;
        public function gammaInt() { return $this->_m_gammaInt; }
    }
}

namespace Png {
    class IhdrChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_width = $this->_io->readU4be();
            $this->_m_height = $this->_io->readU4be();
            $this->_m_bitDepth = $this->_io->readU1();
            $this->_m_colorType = $this->_io->readU1();
            $this->_m_compressionMethod = $this->_io->readU1();
            $this->_m_filterMethod = $this->_io->readU1();
            $this->_m_interlaceMethod = $this->_io->readU1();
        }
        protected $_m_width;
        protected $_m_height;
        protected $_m_bitDepth;
        protected $_m_colorType;
        protected $_m_compressionMethod;
        protected $_m_filterMethod;
        protected $_m_interlaceMethod;
        public function width() { return $this->_m_width; }
        public function height() { return $this->_m_height; }
        public function bitDepth() { return $this->_m_bitDepth; }
        public function colorType() { return $this->_m_colorType; }
        public function compressionMethod() { return $this->_m_compressionMethod; }
        public function filterMethod() { return $this->_m_filterMethod; }
        public function interlaceMethod() { return $this->_m_interlaceMethod; }
    }
}

/**
 * International text chunk effectively allows to store key-value string pairs in
 * PNG container. Both "key" (keyword) and "value" (text) parts are
 * given in pre-defined subset of iso8859-1 without control
 * characters.
 */

namespace Png {
    class InternationalTextChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_keyword = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "UTF-8");
            $this->_m_compressionFlag = $this->_io->readU1();
            $this->_m_compressionMethod = $this->_io->readU1();
            $this->_m_languageTag = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ASCII");
            $this->_m_translatedKeyword = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "UTF-8");
            $this->_m_text = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
        }
        protected $_m_keyword;
        protected $_m_compressionFlag;
        protected $_m_compressionMethod;
        protected $_m_languageTag;
        protected $_m_translatedKeyword;
        protected $_m_text;

        /**
         * Indicates purpose of the following text data.
         */
        public function keyword() { return $this->_m_keyword; }

        /**
         * 0 = text is uncompressed, 1 = text is compressed with a
         * method specified in `compression_method`.
         */
        public function compressionFlag() { return $this->_m_compressionFlag; }
        public function compressionMethod() { return $this->_m_compressionMethod; }

        /**
         * Human language used in `translated_keyword` and `text`
         * attributes - should be a language code conforming to ISO
         * 646.IRV:1991.
         */
        public function languageTag() { return $this->_m_languageTag; }

        /**
         * Keyword translated into language specified in
         * `language_tag`. Line breaks are not allowed.
         */
        public function translatedKeyword() { return $this->_m_translatedKeyword; }

        /**
         * Text contents ("value" of this key-value pair), written in
         * language specified in `language_tag`. Line breaks are
         * allowed.
         */
        public function text() { return $this->_m_text; }
    }
}

/**
 * "Physical size" chunk stores data that allows to translate
 * logical pixels into physical units (meters, etc) and vice-versa.
 */

namespace Png {
    class PhysChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_pixelsPerUnitX = $this->_io->readU4be();
            $this->_m_pixelsPerUnitY = $this->_io->readU4be();
            $this->_m_unit = $this->_io->readU1();
        }
        protected $_m_pixelsPerUnitX;
        protected $_m_pixelsPerUnitY;
        protected $_m_unit;

        /**
         * Number of pixels per physical unit (typically, 1 meter) by X
         * axis.
         */
        public function pixelsPerUnitX() { return $this->_m_pixelsPerUnitX; }

        /**
         * Number of pixels per physical unit (typically, 1 meter) by Y
         * axis.
         */
        public function pixelsPerUnitY() { return $this->_m_pixelsPerUnitY; }
        public function unit() { return $this->_m_unit; }
    }
}

namespace Png {
    class PlteChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Png\Rgb($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace Png {
    class Point extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\ChrmChunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_xInt = $this->_io->readU4be();
            $this->_m_yInt = $this->_io->readU4be();
        }
        protected $_m_x;
        public function x() {
            if ($this->_m_x !== null)
                return $this->_m_x;
            $this->_m_x = $this->xInt() / 100000.0;
            return $this->_m_x;
        }
        protected $_m_y;
        public function y() {
            if ($this->_m_y !== null)
                return $this->_m_y;
            $this->_m_y = $this->yInt() / 100000.0;
            return $this->_m_y;
        }
        protected $_m_xInt;
        protected $_m_yInt;
        public function xInt() { return $this->_m_xInt; }
        public function yInt() { return $this->_m_yInt; }
    }
}

namespace Png {
    class Rgb extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\PlteChunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_r = $this->_io->readU1();
            $this->_m_g = $this->_io->readU1();
            $this->_m_b = $this->_io->readU1();
        }
        protected $_m_r;
        protected $_m_g;
        protected $_m_b;
        public function r() { return $this->_m_r; }
        public function g() { return $this->_m_g; }
        public function b() { return $this->_m_b; }
    }
}

namespace Png {
    class SrgbChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_renderIntent = $this->_io->readU1();
        }
        protected $_m_renderIntent;
        public function renderIntent() { return $this->_m_renderIntent; }
    }
}

namespace Png\SrgbChunk {
    class Intent {
        const PERCEPTUAL = 0;
        const RELATIVE_COLORIMETRIC = 1;
        const SATURATION = 2;
        const ABSOLUTE_COLORIMETRIC = 3;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

/**
 * Text chunk effectively allows to store key-value string pairs in
 * PNG container. Both "key" (keyword) and "value" (text) parts are
 * given in pre-defined subset of iso8859-1 without control
 * characters.
 */

namespace Png {
    class TextChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_keyword = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ISO-8859-1");
            $this->_m_text = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "ISO-8859-1");
        }
        protected $_m_keyword;
        protected $_m_text;

        /**
         * Indicates purpose of the following text data.
         */
        public function keyword() { return $this->_m_keyword; }
        public function text() { return $this->_m_text; }
    }
}

/**
 * Time chunk stores time stamp of last modification of this image,
 * up to 1 second precision in UTC timezone.
 */

namespace Png {
    class TimeChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_year = $this->_io->readU2be();
            $this->_m_month = $this->_io->readU1();
            $this->_m_day = $this->_io->readU1();
            $this->_m_hour = $this->_io->readU1();
            $this->_m_minute = $this->_io->readU1();
            $this->_m_second = $this->_io->readU1();
        }
        protected $_m_year;
        protected $_m_month;
        protected $_m_day;
        protected $_m_hour;
        protected $_m_minute;
        protected $_m_second;
        public function year() { return $this->_m_year; }
        public function month() { return $this->_m_month; }
        public function day() { return $this->_m_day; }
        public function hour() { return $this->_m_hour; }
        public function minute() { return $this->_m_minute; }
        public function second() { return $this->_m_second; }
    }
}

namespace Png {
    class BlendOpValues {

        /**
         * All color components of the frame, including alpha,
         * overwrite the current contents of the frame's output buffer region.
         */
        const SOURCE = 0;

        /**
         * The frame is composited onto the output buffer based on its alpha
         */
        const OVER = 1;

        private const _VALUES = [0 => true, 1 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Png {
    class ColorType {
        const GREYSCALE = 0;
        const TRUECOLOR = 2;
        const INDEXED = 3;
        const GREYSCALE_ALPHA = 4;
        const TRUECOLOR_ALPHA = 6;

        private const _VALUES = [0 => true, 2 => true, 3 => true, 4 => true, 6 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Png {
    class CompressionMethods {
        const ZLIB = 0;

        private const _VALUES = [0 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Png {
    class DisposeOpValues {

        /**
         * No disposal is done on this frame before rendering the next;
         * the contents of the output buffer are left as is.
         */
        const NONE = 0;

        /**
         * The frame's region of the output buffer is to be cleared to
         * fully transparent black before rendering the next frame.
         */
        const BACKGROUND = 1;

        /**
         * The frame's region of the output buffer is to be reverted
         * to the previous contents before rendering the next frame.
         */
        const PREVIOUS = 2;

        private const _VALUES = [0 => true, 1 => true, 2 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Png {
    class PhysUnit {
        const UNKNOWN = 0;
        const METER = 1;

        private const _VALUES = [0 => true, 1 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
