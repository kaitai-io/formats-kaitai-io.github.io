<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * NOTICE: Many of the documentation comments (or docstrings) in this file were
 * copied from or derived from the [Portable Network Graphics (PNG) Specification
 * (Third Edition)](https://www.w3.org/TR/2025/REC-png-3-20250624/).
 * Copyright © 1996-2025 [World Wide Web Consortium](https://www.w3.org/).
 * <https://www.w3.org/copyright/software-license-2023/>
 * 
 * The full text of the license for the original W3C PNG specification is
 * provided below:
 * 
 * > ## Software and Document license - 2023 version
 * >
 * > This work is being provided by the copyright holders under the following
 * > license.
 * >
 * > ### License
 * >
 * > By obtaining and/or copying this work, you (the licensee) agree that you
 * > have read, understood, and will comply with the following terms and
 * > conditions.
 * >
 * > Permission to copy, modify, and distribute this work, with or without
 * > modification, for any purpose and without fee or royalty is hereby granted,
 * > provided that you include the following on ALL copies of the work or
 * > portions thereof, including modifications:
 * >
 * > * The full text of this NOTICE in a location viewable to users of the
 * >   redistributed or derivative work.
 * > * Any pre-existing intellectual property disclaimers, notices, or terms and
 * >   conditions. If none exist, the [W3C software and document short
 * >   notice](https://www.w3.org/Consortium/Legal/2023/copyright-software-short-notice.html)
 * >   should be included.
 * > * Notice of any changes or modifications, through a copyright statement on
 * >   the new code or document such as "This software or document includes
 * >   material copied from or derived from [title and URI of the W3C document].
 * >   Copyright © [$year-of-document] [World Wide Web
 * >   Consortium](https://www.w3.org/).
 * >   <https://www.w3.org/copyright/software-license-2023/>"
 * >
 * > ### Disclaimers
 * >
 * > THIS WORK IS PROVIDED "AS IS," AND COPYRIGHT HOLDERS MAKE NO REPRESENTATIONS
 * > OR WARRANTIES, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO, WARRANTIES
 * > OF MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF
 * > THE SOFTWARE OR DOCUMENT WILL NOT INFRINGE ANY THIRD PARTY PATENTS,
 * > COPYRIGHTS, TRADEMARKS OR OTHER RIGHTS.
 * >
 * > COPYRIGHT HOLDERS WILL NOT BE LIABLE FOR ANY DIRECT, INDIRECT, SPECIAL OR
 * > CONSEQUENTIAL DAMAGES ARISING OUT OF ANY USE OF THE SOFTWARE OR DOCUMENT.
 * >
 * > The name and trademarks of copyright holders may NOT be used in advertising
 * > or publicity pertaining to the work without specific, written prior
 * > permission. Title to copyright in this work will at all times remain with
 * > copyright holders.
 * 
 * ---
 * 
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
            $this->_m_ihdrCrc = $this->_io->readU4be();
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
    class AdobeFireworksChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m__raw_previewData = $this->_io->readBytesFull();
            $this->_m_previewData = \Kaitai\Struct\Stream::processZlib($this->_m__raw_previewData);
        }
        protected $_m_previewData;
        protected $_m__raw_previewData;
        public function previewData() { return $this->_m_previewData; }
        public function _raw_previewData() { return $this->_m__raw_previewData; }
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
         * Number of frames, must be equal to the number of `fcTL` chunks (i.e.
         * `frame_control_chunk` objects)
         */
        public function numFrames() { return $this->_m_numFrames; }

        /**
         * Number of times to loop, 0 indicates infinite looping.
         */
        public function numPlays() { return $this->_m_numPlays; }
    }
}

namespace Png {
    class AtchChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fileName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "UTF-8");
            $_ = $this->_m_fileName;
            if (!( ((strlen($_) != 0) && (\Kaitai\Struct\Stream::substring($_, 0, 1) != ".")) )) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_fileName, $this->_io, "/types/atch_chunk/seq/0");
            }
            $this->_m_compression = $this->_io->readU1();
            if (!\Png\AtchChunk\CompressionAttachMethods::isDefined($this->_m_compression)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_compression, $this->_io, "/types/atch_chunk/seq/1");
            }
            if ($this->compression() == \Png\AtchChunk\CompressionAttachMethods::NONE) {
                $this->_m_dataPlain = $this->_io->readBytesFull();
            }
            if ($this->compression() == \Png\AtchChunk\CompressionAttachMethods::ZLIB) {
                $this->_m__raw_dataZlib = $this->_io->readBytesFull();
                $this->_m_dataZlib = \Kaitai\Struct\Stream::processZlib($this->_m__raw_dataZlib);
            }
        }
        protected $_m_data;
        public function data() {
            if ($this->_m_data !== null)
                return $this->_m_data;
            $this->_m_data = ($this->compression() == \Png\AtchChunk\CompressionAttachMethods::NONE ? $this->dataPlain() : $this->dataZlib());
            return $this->_m_data;
        }
        protected $_m_fileName;
        protected $_m_compression;
        protected $_m_dataPlain;
        protected $_m_dataZlib;
        protected $_m__raw_dataZlib;

        /**
         * From the [official
         * specification](https://github.com/skeeto/scratch/tree/58470254f4a95cdf7a53888e405c851c21eb2cae/pngattach#atch-chunk-specification):
         * 
         * > The name can be any length that fits in the chunk, and should be
         * > encoded with UTF-8. It's up to each implementation to determine how
         * > to appropriately interpret the bytestring for the local system.
         * 
         * > The name must be at least one byte long, not counting the null
         * > terminator. It cannot begin with a period (`0x2e`), nor contain
         * > control bytes (anything less than `0x20`), nor slash (`0x2f`), nor
         * > backslash (`0x5c`), i.e. no directory hierarchies.
         * 
         * As of Kaitai Struct 0.11, we cannot easily check whether a string
         * contains certain characters, so we only enforce that the file name is
         * not empty and that it doesn't start with a period.
         */
        public function fileName() { return $this->_m_fileName; }
        public function compression() { return $this->_m_compression; }
        public function dataPlain() { return $this->_m_dataPlain; }
        public function dataZlib() { return $this->_m_dataZlib; }
        public function _raw_dataZlib() { return $this->_m__raw_dataZlib; }
    }
}

namespace Png\AtchChunk {
    class CompressionAttachMethods {
        const NONE = 0;
        const ZLIB = 1;

        private const _VALUES = [0 => true, 1 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
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
    class ChrmChromaticity extends \Kaitai\Struct\Struct {
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
    class ChrmChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_whitePoint = new \Png\ChrmChromaticity($this->_io, $this, $this->_root);
            $this->_m_red = new \Png\ChrmChromaticity($this->_io, $this, $this->_root);
            $this->_m_green = new \Png\ChrmChromaticity($this->_io, $this, $this->_root);
            $this->_m_blue = new \Png\ChrmChromaticity($this->_io, $this, $this->_root);
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
            $this->_m_typeRaw = $this->_io->readBytes(4);
            $_ = $this->_m_typeRaw;
            if (!( (( (( ((ord($_[0]) >= 65) && (ord($_[0]) <= 90)) ) || ( ((ord($_[0]) >= 97) && (ord($_[0]) <= 122)) )) ) && ( (( ((ord($_[1]) >= 65) && (ord($_[1]) <= 90)) ) || ( ((ord($_[1]) >= 97) && (ord($_[1]) <= 122)) )) ) && ( (( ((ord($_[2]) >= 65) && (ord($_[2]) <= 90)) ) || ( ((ord($_[2]) >= 97) && (ord($_[2]) <= 122)) )) ) && ( (( ((ord($_[3]) >= 65) && (ord($_[3]) <= 90)) ) || ( ((ord($_[3]) >= 97) && (ord($_[3]) <= 122)) )) )) )) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_typeRaw, $this->_io, "/types/chunk/seq/1");
            }
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
                case "atCh":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\AtchChunk($_io__raw_body, $this, $this->_root);
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
                case "cICP":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\CicpChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "cLLI":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\ClliChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "eXIf":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\ExifChunk($_io__raw_body, $this, $this->_root);
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
                case "hIST":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\HistChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "iCCP":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\IccpChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "iTXt":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\InternationalTextChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "mDCV":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\MdcvChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "mkBS":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\AdobeFireworksChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "mkTS":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\AdobeFireworksChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "pHYs":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\PhysChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "prVW":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\AdobeFireworksChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "sBIT":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\SbitChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "sPLT":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\SpltChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "sRGB":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\SrgbChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "skMf":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\EvernoteSkmfChunk($_io__raw_body, $this, $this->_root);
                    break;
                case "skRf":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\EvernoteSkrfChunk($_io__raw_body, $this, $this->_root);
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
                case "tRNS":
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Png\TrnsChunk($_io__raw_body, $this, $this->_root);
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
            $this->_m_crc = $this->_io->readU4be();
        }
        protected $_m_isAncillary;

        /**
         * false = critical chunk, true = ancillary chunk
         */
        public function isAncillary() {
            if ($this->_m_isAncillary !== null)
                return $this->_m_isAncillary;
            $this->_m_isAncillary = (ord($this->typeRaw()[0]) & 32) != 0;
            return $this->_m_isAncillary;
        }
        protected $_m_isPrivate;

        /**
         * false = public chunk (defined by the W3C), true = private chunk (can
         * be defined by anyone)
         */
        public function isPrivate() {
            if ($this->_m_isPrivate !== null)
                return $this->_m_isPrivate;
            $this->_m_isPrivate = (ord($this->typeRaw()[1]) & 32) != 0;
            return $this->_m_isPrivate;
        }
        protected $_m_isSafeToCopy;

        /**
         * Defines whether the chunk may be copied if the image data (i.e.
         * pixels) is modified. This tells PNG editors how to handle unknown
         * chunks - see section [14.2 Behavior of PNG
         * editors](https://www.w3.org/TR/2025/REC-png-3-20250624/#14Ordering) in
         * the official specification.
         */
        public function isSafeToCopy() {
            if ($this->_m_isSafeToCopy !== null)
                return $this->_m_isSafeToCopy;
            $this->_m_isSafeToCopy = (ord($this->typeRaw()[3]) & 32) != 0;
            return $this->_m_isSafeToCopy;
        }
        protected $_m_reservedBit;

        /**
         * Should be `false`, i.e. all chunk types should have uppercase third
         * letters (the lowercase third letter is reserved for possible future
         * extensions to the PNG standard)
         */
        public function reservedBit() {
            if ($this->_m_reservedBit !== null)
                return $this->_m_reservedBit;
            $this->_m_reservedBit = (ord($this->typeRaw()[2]) & 32) != 0;
            return $this->_m_reservedBit;
        }
        protected $_m_type;
        public function type() {
            if ($this->_m_type !== null)
                return $this->_m_type;
            $this->_m_type = \Kaitai\Struct\Stream::bytesToStr($this->typeRaw(), "ASCII");
            return $this->_m_type;
        }
        protected $_m_len;
        protected $_m_typeRaw;
        protected $_m_body;
        protected $_m_crc;
        protected $_m__raw_body;
        public function len() { return $this->_m_len; }

        /**
         * Each byte of a chunk type is restricted to the hexadecimal values
         * 0x41..0x5a and 0x61..0x7a, i.e. uppercase and lowercase ASCII letters
         * (`A-Z` and `a-z`).
         */
        public function typeRaw() { return $this->_m_typeRaw; }
        public function body() { return $this->_m_body; }
        public function crc() { return $this->_m_crc; }
        public function _raw_body() { return $this->_m__raw_body; }
    }
}

namespace Png {
    class CicpChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_colorPrimaries = $this->_io->readU1();
            $this->_m_transferFunction = $this->_io->readU1();
            $this->_m_matrixCoefficients = $this->_io->readU1();
            if (!($this->_m_matrixCoefficients == 0)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(0, $this->_m_matrixCoefficients, $this->_io, "/types/cicp_chunk/seq/2");
            }
            $this->_m_videoFullRangeFlag = $this->_io->readU1();
            if (!( (($this->_m_videoFullRangeFlag == 0) || ($this->_m_videoFullRangeFlag == 1)) )) {
                throw new \Kaitai\Struct\Error\ValidationNotAnyOfError($this->_m_videoFullRangeFlag, $this->_io, "/types/cicp_chunk/seq/3");
            }
        }
        protected $_m_colorPrimaries;
        protected $_m_transferFunction;
        protected $_m_matrixCoefficients;
        protected $_m_videoFullRangeFlag;

        /**
         * values above 22 are reserved, see
         * <https://github.com/pnggroup/pngcheck/blob/bd33ad6490269df07cac81e5305f4ebf56c2b637/pngcheck.c#L3322-L3325>
         */
        public function colorPrimaries() { return $this->_m_colorPrimaries; }

        /**
         * values above 18 are reserved, see
         * <https://github.com/pnggroup/pngcheck/blob/bd33ad6490269df07cac81e5305f4ebf56c2b637/pngcheck.c#L3326-L3329>
         */
        public function transferFunction() { return $this->_m_transferFunction; }

        /**
         * From the [official
         * specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#cICP-chunk):
         * 
         * > RGB is currently the only supported color model in PNG, and as such
         * > `Matrix Coefficients` shall be set to `0`.
         */
        public function matrixCoefficients() { return $this->_m_matrixCoefficients; }

        /**
         * From the [official
         * specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#cICP-chunk):
         * 
         * > If `Video Full Range Flag` value is `1`, then the image is a
         * > full-range image. Typically, images in the RGB color representation
         * > are stored in the full-range signal quantization, therefore the vast
         * > majority of computer graphics and web images, including those used
         * > in traditional PNG workflows, are full-range images.
         * 
         * > If `Video Full Range Flag` value is `0`, then the image is a
         * > narrow-range image.
         */
        public function videoFullRangeFlag() { return $this->_m_videoFullRangeFlag; }
    }
}

namespace Png {
    class ClliChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_maxContentLightLevelInt = $this->_io->readU4be();
            $this->_m_maxFrameAverageLightLevelInt = $this->_io->readU4be();
        }
        protected $_m_maxContentLightLevel;

        /**
         * Maximum Content Light Level (MaxCLL), in cd/m^2
         */
        public function maxContentLightLevel() {
            if ($this->_m_maxContentLightLevel !== null)
                return $this->_m_maxContentLightLevel;
            $this->_m_maxContentLightLevel = $this->maxContentLightLevelInt() * 0.0001;
            return $this->_m_maxContentLightLevel;
        }
        protected $_m_maxFrameAverageLightLevel;

        /**
         * Maximum Frame Average Light Level (MaxFALL), in cd/m^2
         */
        public function maxFrameAverageLightLevel() {
            if ($this->_m_maxFrameAverageLightLevel !== null)
                return $this->_m_maxFrameAverageLightLevel;
            $this->_m_maxFrameAverageLightLevel = $this->maxFrameAverageLightLevelInt() * 0.0001;
            return $this->_m_maxFrameAverageLightLevel;
        }
        protected $_m_maxContentLightLevelInt;
        protected $_m_maxFrameAverageLightLevelInt;
        public function maxContentLightLevelInt() { return $this->_m_maxContentLightLevelInt; }
        public function maxFrameAverageLightLevelInt() { return $this->_m_maxFrameAverageLightLevelInt; }
    }
}

namespace Png {
    class CompressedText extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\CompressedTextChunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_value = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "ISO-8859-1");
        }
        protected $_m_value;

        /**
         * Text string (the "value" of this key-value pair).
         * 
         * Although it is not null-terminated (unlike the keyword), it must not
         * contain a zero byte (U+0000 NULL character). A newline should be
         * represented by a single U+000A LINE FEED (LF) character (aka `\n`).
         * The remaining control characters (U+0001..U+0009, U+000B..0+001F,
         * U+007F..U+009F) are discouraged.
         */
        public function value() { return $this->_m_value; }
    }
}

/**
 * Compressed textual data (`zTXt`) chunk effectively allows you to store
 * key-value string pairs in the PNG container, compressing the "value" part
 * (which can be quite lengthy) with zlib compression.
 * 
 * The `zTXt` and `tEXt` chunks are semantically equivalent, but the `zTXt`
 * chunk is recommended for storing large blocks of text.
 */

namespace Png {
    class CompressedTextChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_keyword = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ISO-8859-1");
            $this->_m_compressionMethod = $this->_io->readU1();
            if (!($this->_m_compressionMethod == \Png\CompressionMethods::ZLIB)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(\Png\CompressionMethods::ZLIB, $this->_m_compressionMethod, $this->_io, "/types/compressed_text_chunk/seq/1");
            }
            $this->_m__raw__raw_text = $this->_io->readBytesFull();
            $this->_m__raw_text = \Kaitai\Struct\Stream::processZlib($this->_m__raw__raw_text);
            $_io__raw_text = new \Kaitai\Struct\Stream($this->_m__raw_text);
            $this->_m_text = new \Png\CompressedText($_io__raw_text, $this, $this->_root);
        }
        protected $_m_keyword;
        protected $_m_compressionMethod;
        protected $_m_text;
        protected $_m__raw_text;
        protected $_m__raw__raw_text;

        /**
         * Indicates the type of information represented by the text string.
         * 
         * Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
         * characters and spaces; that is, only code points 0x20-0x7E and
         * 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
         * keyword, leading spaces, trailing spaces, and consecutive spaces are
         * not permitted.
         */
        public function keyword() { return $this->_m_keyword; }
        public function compressionMethod() { return $this->_m_compressionMethod; }
        public function text() { return $this->_m_text; }
        public function _raw_text() { return $this->_m__raw_text; }
        public function _raw__raw_text() { return $this->_m__raw__raw_text; }
    }
}

namespace Png {
    class EvernoteSkmfChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_json = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
        }
        protected $_m_json;

        /**
         * JSON document with information about editable annotations (text,
         * lines, paths, etc.) in Evernote/Skitch.
         * 
         * It refers to the original image stored in the `skRf` chunk (which
         * usually follows immediately after `skMf`) via the
         * `.children[0].children[0].uri` JSON property. This has the format
         * `"skitch+uuid:///$UUID"`, where `$UUID` is a random UUIDv4 value that
         * matches the `uuid` field in `evernote_skrf_chunk` (i.e. in the first
         * 16 bytes of the `skRf` chunk).
         */
        public function json() { return $this->_m_json; }
    }
}

namespace Png {
    class EvernoteSkrfChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_uuid = $this->_io->readBytes(16);
            $this->_m_origImg = $this->_io->readBytesFull();
        }
        protected $_m_uuid;
        protected $_m_origImg;

        /**
         * Random UUIDv4 value used to identify the image. It is referenced by
         * the `skMf` chunk - see the documentation for the `json` field in
         * `evernote_skmf_chunk`.
         */
        public function uuid() { return $this->_m_uuid; }

        /**
         * The original source image without annotations. It's usually a PNG
         * image as well, but it can also be a JPEG or possibly other formats.
         */
        public function origImg() { return $this->_m_origImg; }
    }
}

/**
 * Exchangeable Image File (Exif) Profile (`eXIf`) chunk.
 * 
 * Only one `eXIf` chunk is allowed in a PNG datastream.
 * 
 * The `eXIf` chunk contains metadata concerning the original image data. If
 * the image has been edited subsequent to creation of the Exif profile, this
 * data might no longer apply to the PNG image data.
 */

namespace Png {
    class ExifChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_exif = new \Exif($this->_io);
        }
        protected $_m_exif;
        public function exif() { return $this->_m_exif; }
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
            if (!\Png\DisposeOpValues::isDefined($this->_m_disposeOp)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_disposeOp, $this->_io, "/types/frame_control_chunk/seq/7");
            }
            $this->_m_blendOp = $this->_io->readU1();
            if (!\Png\BlendOpValues::isDefined($this->_m_blendOp)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_blendOp, $this->_io, "/types/frame_control_chunk/seq/8");
            }
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
         * Sequence number of the animation chunk, starting from 0.
         * 
         * The `fcTL` and `fdAT` chunks have a 4-byte sequence number. Both chunk
         * types share the sequence. The purpose of this number is to detect (and
         * optionally correct) sequence errors in an Animated PNG, since the PNG
         * specification does not impose ordering restrictions on ancillary
         * chunks (which means that a PNG editor is technically allowed to
         * reorder them arbitrarily, see [14.2 Behavior of PNG
         * editors](https://www.w3.org/TR/png/#14Ordering) in the spec).
         * 
         * The first `fcTL` chunk must contain sequence number 0, and the
         * sequence numbers in the remaining `fcTL` and `fdAT` chunks must be in
         * ascending order, with no gaps or duplicates.
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
         * Sequence number of the animation chunk, starting from 0.
         * 
         * The `fcTL` and `fdAT` chunks have a 4-byte sequence number. Both chunk
         * types share the sequence. The purpose of this number is to detect (and
         * optionally correct) sequence errors in an Animated PNG, since the PNG
         * specification does not impose ordering restrictions on ancillary
         * chunks (which means that a PNG editor is technically allowed to
         * reorder them arbitrarily, see [14.2 Behavior of PNG
         * editors](https://www.w3.org/TR/png/#14Ordering) in the spec).
         * 
         * The first `fcTL` chunk must contain sequence number 0, and the
         * sequence numbers in the remaining `fcTL` and `fdAT` chunks must be in
         * ascending order, with no gaps or duplicates.
         */
        public function sequenceNumber() { return $this->_m_sequenceNumber; }

        /**
         * Frame data for the frame. At least one `fdAT` chunk is required for
         * each frame, except for the first frame, if that frame is represented
         * by an `IDAT` chunk. The compressed datastream for each frame is the
         * concatenation of the contents of the data fields of all the `fdAT`
         * chunks within a frame.
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
            $_ = $this->_m_gammaInt;
            if (!($_ != 0)) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_gammaInt, $this->_io, "/types/gama_chunk/seq/0");
            }
        }
        protected $_m_gamma;

        /**
         * Image gamma, typically 0.45455 = 1/2.2
         */
        public function gamma() {
            if ($this->_m_gamma !== null)
                return $this->_m_gamma;
            $this->_m_gamma = $this->gammaInt() / 100000.0;
            return $this->_m_gamma;
        }
        protected $_m_invGamma;

        /**
         * Inverse of the image gamma (1 / gamma), typically 2.2 (not considering
         * rounding)
         */
        public function invGamma() {
            if ($this->_m_invGamma !== null)
                return $this->_m_invGamma;
            $this->_m_invGamma = 100000.0 / $this->gammaInt();
            return $this->_m_invGamma;
        }
        protected $_m_gammaInt;

        /**
         * Image gamma multiplied by 100000 (a gamma value of 1/2.2 is stored as
         * 45455)
         */
        public function gammaInt() { return $this->_m_gammaInt; }
    }
}

/**
 * Image histogram (`hIST`) chunk gives the approximate usage frequency of
 * each color in the palette. A histogram chunk can appear only when a `PLTE`
 * chunk appears.
 */

namespace Png {
    class HistChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_usageFreqs = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_usageFreqs[] = $this->_io->readU2be();
                $i++;
            }
        }
        protected $_m_usageFreqs;

        /**
         * Usage frequencies of each color in the palette.
         * 
         * There must be exactly one entry for each entry in the `PLTE` chunk. Each
         * entry is proportional to the fraction of pixels in the image that have
         * that palette index; the exact scale factor is chosen by the encoder.
         * 
         * Histogram entries are approximate, with the exception that a zero
         * entry specifies that the corresponding palette entry is not used at
         * all in the image. A histogram entry must be nonzero if there are any
         * pixels of that color.
         */
        public function usageFreqs() { return $this->_m_usageFreqs; }
    }
}

/**
 * Embedded ICC profile (`iCCP`) chunk.
 * 
 * If the `iCCP` chunk is present, the image samples conform to the color
 * space represented by the embedded ICC profile as defined by the
 * International Color Consortium.
 * 
 * This chunk is ignored unless it is the [highest-precedence color
 * chunk](https://www.w3.org/TR/png/#color-chunk-precendence) understood by
 * the decoder. Unless a `cICP` chunk exists, a PNG datastream should contain
 * at most one embedded profile, whether specified explicitly with an `iCCP`
 * or implicitly with an `sRGB` chunk.
 * 
 * It is recommended that the `sRGB` and `iCCP` chunks do not appear
 * simultaneously in a PNG datastream.
 */

namespace Png {
    class IccpChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_profileName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ISO-8859-1");
            $this->_m_compressionMethod = $this->_io->readU1();
            if (!($this->_m_compressionMethod == \Png\CompressionMethods::ZLIB)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(\Png\CompressionMethods::ZLIB, $this->_m_compressionMethod, $this->_io, "/types/iccp_chunk/seq/1");
            }
            $this->_m__raw__raw_profile = $this->_io->readBytesFull();
            $this->_m__raw_profile = \Kaitai\Struct\Stream::processZlib($this->_m__raw__raw_profile);
            $_io__raw_profile = new \Kaitai\Struct\Stream($this->_m__raw_profile);
            $this->_m_profile = new \Icc4($_io__raw_profile);
        }
        protected $_m_profileName;
        protected $_m_compressionMethod;
        protected $_m_profile;
        protected $_m__raw_profile;
        protected $_m__raw__raw_profile;

        /**
         * Any convenient name for referring to the profile. It is
         * case-sensitive.
         * 
         * Profile names must contain only printable ISO-8859-1 (Latin-1)
         * characters and spaces; that is, only code points 0x20-0x7E and
         * 0xA1-0xFF are allowed. Leading, trailing, and consecutive spaces are
         * not permitted.
         */
        public function profileName() { return $this->_m_profileName; }
        public function compressionMethod() { return $this->_m_compressionMethod; }

        /**
         * Embedded ICC profile.
         * 
         * The color space of the ICC profile must be:
         * 
         * * an RGB color space for color images (color types
         *   `color_type::truecolor` = 2, `color_type::indexed` = 3, and
         *   `color_type::truecolor_alpha` = 6), or
         * * a greyscale color space for greyscale images (color types
         *   `color_type::greyscale` = 0 and `color_type::greyscale_alpha` = 4).
         * 
         * Note that the imported `icc_4.ksy` spec currently in use here supports
         * only the ICC.1 v4 specification (as the name suggests), not ICC.1 v2.
         * This means that PNG files with an embedded v2 profile (for example
         * https://github.com/web-platform-tests/wpt/blob/495d9d7716298588ff49d6e701bf27c5134bde06/css/css-color/support/swap-990000-iCCP.png)
         * will fail to parse.
         * 
         * TODO: extend `icc_4.ksy` to support both v4 and v2 profiles, rename it
         * to `icc.ksy`, and use it here.
         */
        public function profile() { return $this->_m_profile; }
        public function _raw_profile() { return $this->_m__raw_profile; }
        public function _raw__raw_profile() { return $this->_m__raw__raw_profile; }
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
            if (!($this->_m_width >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->_m_width, $this->_io, "/types/ihdr_chunk/seq/0");
            }
            $this->_m_height = $this->_io->readU4be();
            if (!($this->_m_height >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->_m_height, $this->_io, "/types/ihdr_chunk/seq/1");
            }
            $this->_m_bitDepth = $this->_io->readU1();
            if (!( (($this->_m_bitDepth == 1) || ($this->_m_bitDepth == 2) || ($this->_m_bitDepth == 4) || ($this->_m_bitDepth == 8) || ($this->_m_bitDepth == 16)) )) {
                throw new \Kaitai\Struct\Error\ValidationNotAnyOfError($this->_m_bitDepth, $this->_io, "/types/ihdr_chunk/seq/2");
            }
            $this->_m_colorType = $this->_io->readU1();
            if (!\Png\ColorType::isDefined($this->_m_colorType)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_colorType, $this->_io, "/types/ihdr_chunk/seq/3");
            }
            $this->_m_compressionMethod = $this->_io->readU1();
            if (!\Png\CompressionMethods::isDefined($this->_m_compressionMethod)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_compressionMethod, $this->_io, "/types/ihdr_chunk/seq/4");
            }
            $this->_m_filterMethod = $this->_io->readU1();
            if (!\Png\FilterMethod::isDefined($this->_m_filterMethod)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_filterMethod, $this->_io, "/types/ihdr_chunk/seq/5");
            }
            $this->_m_interlaceMethod = $this->_io->readU1();
            if (!\Png\InterlaceMethod::isDefined($this->_m_interlaceMethod)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_interlaceMethod, $this->_io, "/types/ihdr_chunk/seq/6");
            }
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

namespace Png {
    class InternationalText extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\InternationalTextChunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_value = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
        }
        protected $_m_value;

        /**
         * Text string (the "value" of this key-value pair), written in language
         * specified in `_parent.language_tag`.
         * 
         * Although it is not null-terminated (unlike other textual data in the
         * `iTXt` chunk), it must not contain a zero byte
         * (U+0000 NULL character). A newline should be represented by a single
         * U+000A LINE FEED (LF) character (aka `\n`). The remaining control
         * characters (U+0001..U+0009, U+000B..0+001F, U+007F..U+009F) are
         * discouraged.
         */
        public function value() { return $this->_m_value; }
    }
}

/**
 * International textual data (`iTXt`) chunk effectively allows you to store
 * key-value string pairs in the PNG container.
 * 
 * The "key" part (`keyword`) is restricted to printable ISO-8859-1 (Latin-1)
 * characters and spaces. The translated keyword and the "value" part
 * (`text`) are stored in UTF-8 and thus can store text in any language -
 * this language can be indicated via the language tag (`language_tag`).
 */

namespace Png {
    class InternationalTextChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_keyword = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ISO-8859-1");
            $this->_m_compressionFlag = $this->_io->readU1();
            if (!( (($this->_m_compressionFlag == 0) || ($this->_m_compressionFlag == 1)) )) {
                throw new \Kaitai\Struct\Error\ValidationNotAnyOfError($this->_m_compressionFlag, $this->_io, "/types/international_text_chunk/seq/1");
            }
            $this->_m_compressionMethod = $this->_io->readU1();
            if (!($this->_m_compressionMethod == ($this->compressionFlag() == 1 ? \Png\CompressionMethods::ZLIB : $this->compressionMethod()))) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(($this->compressionFlag() == 1 ? \Png\CompressionMethods::ZLIB : $this->compressionMethod()), $this->_m_compressionMethod, $this->_io, "/types/international_text_chunk/seq/2");
            }
            $this->_m_languageTag = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ASCII");
            $this->_m_translatedKeyword = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "UTF-8");
            if ($this->compressionFlag() == 0) {
                $this->_m__raw_textPlain = $this->_io->readBytesFull();
                $_io__raw_textPlain = new \Kaitai\Struct\Stream($this->_m__raw_textPlain);
                $this->_m_textPlain = new \Png\InternationalText($_io__raw_textPlain, $this, $this->_root);
            }
            if ($this->compressionFlag() == 1) {
                $this->_m__raw__raw_textZlib = $this->_io->readBytesFull();
                $this->_m__raw_textZlib = \Kaitai\Struct\Stream::processZlib($this->_m__raw__raw_textZlib);
                $_io__raw_textZlib = new \Kaitai\Struct\Stream($this->_m__raw_textZlib);
                $this->_m_textZlib = new \Png\InternationalText($_io__raw_textZlib, $this, $this->_root);
            }
        }
        protected $_m_text;

        /**
         * Text string (the "value" of this key-value pair), written in language
         * specified in `language_tag`.
         * 
         * Although it is not null-terminated (unlike other textual data in the
         * `iTXt` chunk), it must not contain a zero byte
         * (U+0000 NULL character). A newline should be represented by a single
         * U+000A LINE FEED (LF) character (aka `\n`). The remaining control
         * characters (U+0001..U+0009, U+000B..0+001F, U+007F..U+009F) are
         * discouraged.
         */
        public function text() {
            if ($this->_m_text !== null)
                return $this->_m_text;
            $this->_m_text = ($this->compressionFlag() == 0 ? $this->textPlain() : $this->textZlib())->value();
            return $this->_m_text;
        }
        protected $_m_keyword;
        protected $_m_compressionFlag;
        protected $_m_compressionMethod;
        protected $_m_languageTag;
        protected $_m_translatedKeyword;
        protected $_m_textPlain;
        protected $_m_textZlib;
        protected $_m__raw_textPlain;
        protected $_m__raw_textZlib;
        protected $_m__raw__raw_textZlib;

        /**
         * Indicates the type of information represented by the text string.
         * 
         * Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
         * characters and spaces; that is, only code points 0x20-0x7E and
         * 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
         * keyword, leading spaces, trailing spaces, and consecutive spaces are
         * not permitted.
         */
        public function keyword() { return $this->_m_keyword; }

        /**
         * 0 = text is uncompressed, 1 = text is compressed with a
         * method specified in `compression_method`.
         */
        public function compressionFlag() { return $this->_m_compressionFlag; }
        public function compressionMethod() { return $this->_m_compressionMethod; }

        /**
         * Human language used in the `translated_keyword` and `text` fields.
         * 
         * From the [official
         * specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#11iTXt):
         * 
         * > The language tag is a well-formed language tag defined by [RFC 5646:
         * > BCP 47: Tags for Identifying
         * > Languages](https://www.rfc-editor.org/info/rfc5646/). Unlike the
         * > keyword, the language tag is case-insensitive. Subtags must appear
         * > in the [IANA language subtag
         * > registry](https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry).
         * > If the language tag is empty, the language is unspecified. Examples
         * > of language tags include: `en`, `en-GB`, `es-419`, `zh-Hans`,
         * > `zh-Hans-CN`, `tlh-Cyrl-AQ`, `ar-AE-u-nu-latn`, and `x-private`.
         */
        public function languageTag() { return $this->_m_languageTag; }

        /**
         * The keyword (`keyword`) translated into the language specified in
         * `language_tag`.
         * 
         * It must not contain a zero byte (U+0000 NULL character). Line breaks
         * should not appear. The remaining control characters (U+0001..U+0009,
         * U+000B..0+001F, U+007F..U+009F) are discouraged.
         */
        public function translatedKeyword() { return $this->_m_translatedKeyword; }
        public function textPlain() { return $this->_m_textPlain; }
        public function textZlib() { return $this->_m_textZlib; }
        public function _raw_textPlain() { return $this->_m__raw_textPlain; }
        public function _raw_textZlib() { return $this->_m__raw_textZlib; }
        public function _raw__raw_textZlib() { return $this->_m__raw__raw_textZlib; }
    }
}

namespace Png {
    class MdcvChromaticity extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\MdcvChunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_xInt = $this->_io->readU2be();
            $this->_m_yInt = $this->_io->readU2be();
        }
        protected $_m_x;
        public function x() {
            if ($this->_m_x !== null)
                return $this->_m_x;
            $this->_m_x = $this->xInt() * 0.00002;
            return $this->_m_x;
        }
        protected $_m_y;
        public function y() {
            if ($this->_m_y !== null)
                return $this->_m_y;
            $this->_m_y = $this->yInt() * 0.00002;
            return $this->_m_y;
        }
        protected $_m_xInt;
        protected $_m_yInt;
        public function xInt() { return $this->_m_xInt; }
        public function yInt() { return $this->_m_yInt; }
    }
}

namespace Png {
    class MdcvChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_red = new \Png\MdcvChromaticity($this->_io, $this, $this->_root);
            $this->_m_green = new \Png\MdcvChromaticity($this->_io, $this, $this->_root);
            $this->_m_blue = new \Png\MdcvChromaticity($this->_io, $this, $this->_root);
            $this->_m_whitePoint = new \Png\MdcvChromaticity($this->_io, $this, $this->_root);
            $this->_m_maxLuminanceInt = $this->_io->readU4be();
            $this->_m_minLuminanceInt = $this->_io->readU4be();
        }
        protected $_m_maxLuminance;

        /**
         * Maximum luminance in cd/m^2
         */
        public function maxLuminance() {
            if ($this->_m_maxLuminance !== null)
                return $this->_m_maxLuminance;
            $this->_m_maxLuminance = $this->maxLuminanceInt() * 0.0001;
            return $this->_m_maxLuminance;
        }
        protected $_m_minLuminance;

        /**
         * Minimum luminance in cd/m^2
         */
        public function minLuminance() {
            if ($this->_m_minLuminance !== null)
                return $this->_m_minLuminance;
            $this->_m_minLuminance = $this->minLuminanceInt() * 0.0001;
            return $this->_m_minLuminance;
        }
        protected $_m_red;
        protected $_m_green;
        protected $_m_blue;
        protected $_m_whitePoint;
        protected $_m_maxLuminanceInt;
        protected $_m_minLuminanceInt;
        public function red() { return $this->_m_red; }
        public function green() { return $this->_m_green; }
        public function blue() { return $this->_m_blue; }
        public function whitePoint() { return $this->_m_whitePoint; }
        public function maxLuminanceInt() { return $this->_m_maxLuminanceInt; }
        public function minLuminanceInt() { return $this->_m_minLuminanceInt; }
    }
}

/**
 * Physical pixel dimensions (`pHYs`) chunk specifies the intended physical
 * size of the pixels (in meters) or pixel aspect ratio for display of the
 * image.
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
            if (!\Png\PhysUnit::isDefined($this->_m_unit)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_unit, $this->_io, "/types/phys_chunk/seq/2");
            }
        }
        protected $_m_dotsPerInchX;

        /**
         * Horizontal resolution (DPI)
         */
        public function dotsPerInchX() {
            if ($this->_m_dotsPerInchX !== null)
                return $this->_m_dotsPerInchX;
            if ($this->unit() == \Png\PhysUnit::METER) {
                $this->_m_dotsPerInchX = $this->pixelsPerUnitX() * 0.0254;
            }
            return $this->_m_dotsPerInchX;
        }
        protected $_m_dotsPerInchY;

        /**
         * Vertical resolution (DPI)
         */
        public function dotsPerInchY() {
            if ($this->_m_dotsPerInchY !== null)
                return $this->_m_dotsPerInchY;
            if ($this->unit() == \Png\PhysUnit::METER) {
                $this->_m_dotsPerInchY = $this->pixelsPerUnitY() * 0.0254;
            }
            return $this->_m_dotsPerInchY;
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

/**
 * Significant bits (`sBIT`) chunk stores the original number of significant
 * bits of the sample values (which can be less than or equal to the sample
 * depth). This allows PNG decoders to recover the original data losslessly
 * even if the data had a sample depth not directly supported by PNG.
 */

namespace Png {
    class SbitChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            switch ($this->_root()->ihdr()->colorType()) {
                case \Png\ColorType::GREYSCALE:
                    $this->_m_significantBits = new \Png\SbitGreyscale(false, $this->_io, $this, $this->_root);
                    break;
                case \Png\ColorType::GREYSCALE_ALPHA:
                    $this->_m_significantBits = new \Png\SbitGreyscale(true, $this->_io, $this, $this->_root);
                    break;
                case \Png\ColorType::INDEXED:
                    $this->_m_significantBits = new \Png\SbitTruecolor(false, $this->_io, $this, $this->_root);
                    break;
                case \Png\ColorType::TRUECOLOR:
                    $this->_m_significantBits = new \Png\SbitTruecolor(false, $this->_io, $this, $this->_root);
                    break;
                case \Png\ColorType::TRUECOLOR_ALPHA:
                    $this->_m_significantBits = new \Png\SbitTruecolor(true, $this->_io, $this, $this->_root);
                    break;
            }
        }
        protected $_m_sampleDepth;
        public function sampleDepth() {
            if ($this->_m_sampleDepth !== null)
                return $this->_m_sampleDepth;
            $this->_m_sampleDepth = ($this->_root()->ihdr()->colorType() == \Png\ColorType::INDEXED ? 8 : $this->_root()->ihdr()->bitDepth());
            return $this->_m_sampleDepth;
        }
        protected $_m_significantBits;
        public function significantBits() { return $this->_m_significantBits; }
    }
}

namespace Png {
    class SbitGreyscale extends \Kaitai\Struct\Struct {
        public function __construct(bool $hasAlpha, \Kaitai\Struct\Stream $_io, ?\Png\SbitChunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_hasAlpha = $hasAlpha;
            $this->_read();
        }

        private function _read() {
            $this->_m_grey = $this->_io->readU1();
            if (!($this->_m_grey >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->_m_grey, $this->_io, "/types/sbit_greyscale/seq/0");
            }
            if (!($this->_m_grey <= $this->_parent()->sampleDepth())) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError($this->_parent()->sampleDepth(), $this->_m_grey, $this->_io, "/types/sbit_greyscale/seq/0");
            }
            if ($this->hasAlpha()) {
                $this->_m_alpha = $this->_io->readU1();
                if (!($this->_m_alpha >= 1)) {
                    throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->_m_alpha, $this->_io, "/types/sbit_greyscale/seq/1");
                }
                if (!($this->_m_alpha <= $this->_parent()->sampleDepth())) {
                    throw new \Kaitai\Struct\Error\ValidationGreaterThanError($this->_parent()->sampleDepth(), $this->_m_alpha, $this->_io, "/types/sbit_greyscale/seq/1");
                }
            }
        }
        protected $_m_grey;
        protected $_m_alpha;
        protected $_m_hasAlpha;
        public function grey() { return $this->_m_grey; }
        public function alpha() { return $this->_m_alpha; }
        public function hasAlpha() { return $this->_m_hasAlpha; }
    }
}

namespace Png {
    class SbitTruecolor extends \Kaitai\Struct\Struct {
        public function __construct(bool $hasAlpha, \Kaitai\Struct\Stream $_io, ?\Png\SbitChunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_hasAlpha = $hasAlpha;
            $this->_read();
        }

        private function _read() {
            $this->_m_red = $this->_io->readU1();
            if (!($this->_m_red >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->_m_red, $this->_io, "/types/sbit_truecolor/seq/0");
            }
            if (!($this->_m_red <= $this->_parent()->sampleDepth())) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError($this->_parent()->sampleDepth(), $this->_m_red, $this->_io, "/types/sbit_truecolor/seq/0");
            }
            $this->_m_green = $this->_io->readU1();
            if (!($this->_m_green >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->_m_green, $this->_io, "/types/sbit_truecolor/seq/1");
            }
            if (!($this->_m_green <= $this->_parent()->sampleDepth())) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError($this->_parent()->sampleDepth(), $this->_m_green, $this->_io, "/types/sbit_truecolor/seq/1");
            }
            $this->_m_blue = $this->_io->readU1();
            if (!($this->_m_blue >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->_m_blue, $this->_io, "/types/sbit_truecolor/seq/2");
            }
            if (!($this->_m_blue <= $this->_parent()->sampleDepth())) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError($this->_parent()->sampleDepth(), $this->_m_blue, $this->_io, "/types/sbit_truecolor/seq/2");
            }
            if ($this->hasAlpha()) {
                $this->_m_alpha = $this->_io->readU1();
                if (!($this->_m_alpha >= 1)) {
                    throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->_m_alpha, $this->_io, "/types/sbit_truecolor/seq/3");
                }
                if (!($this->_m_alpha <= $this->_parent()->sampleDepth())) {
                    throw new \Kaitai\Struct\Error\ValidationGreaterThanError($this->_parent()->sampleDepth(), $this->_m_alpha, $this->_io, "/types/sbit_truecolor/seq/3");
                }
            }
        }
        protected $_m_red;
        protected $_m_green;
        protected $_m_blue;
        protected $_m_alpha;
        protected $_m_hasAlpha;
        public function red() { return $this->_m_red; }
        public function green() { return $this->_m_green; }
        public function blue() { return $this->_m_blue; }
        public function alpha() { return $this->_m_alpha; }
        public function hasAlpha() { return $this->_m_hasAlpha; }
    }
}

/**
 * Suggested palette (`sPLT`) chunk.
 * 
 * Multiple `sPLT` chunks are permitted, but each must have a different
 * palette name.
 */

namespace Png {
    class SpltChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_paletteName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ISO-8859-1");
            $this->_m_sampleDepth = $this->_io->readU1();
            if (!( (($this->_m_sampleDepth == 8) || ($this->_m_sampleDepth == 16)) )) {
                throw new \Kaitai\Struct\Error\ValidationNotAnyOfError($this->_m_sampleDepth, $this->_io, "/types/splt_chunk/seq/1");
            }
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Png\SpltEntry($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_paletteName;
        protected $_m_sampleDepth;
        protected $_m_entries;

        /**
         * Any convenient name for referring to the palette. It is
         * case-sensitive. The palette name may aid the choice of the appropriate
         * suggested palette when more than one appears in a PNG datastream.
         * 
         * Palette names must contain only printable ISO-8859-1 (Latin-1)
         * characters and spaces; that is, only code points 0x20-0x7E and
         * 0xA1-0xFF are allowed. Leading, trailing, and consecutive spaces are
         * not permitted.
         */
        public function paletteName() { return $this->_m_paletteName; }
        public function sampleDepth() { return $this->_m_sampleDepth; }

        /**
         * There may be any number of entries. Entries must appear "in decreasing
         * order of frequency" (note: strictly speaking, I think the W3C
         * specification actually meant "non-increasing"). There is no
         * requirement that the entries all be used by the image, nor that they
         * all be different.
         * 
         * The color samples are not premultiplied by alpha, nor are they
         * precomposited against any background.
         * 
         * Entries in `sPLT` use the same gamma value and chromaticity values as
         * the PNG image, but may fall outside the range of values used in the
         * color space of the PNG image; for example, in a greyscale PNG image,
         * each `sPLT` entry would typically have equal red, green, and blue
         * values, but this is not required. Similarly, `sPLT` entries can have
         * non-opaque alpha values even when the PNG image does not use
         * transparency.
         */
        public function entries() { return $this->_m_entries; }
    }
}

namespace Png {
    class SpltEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\SpltChunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            switch ($this->_parent()->sampleDepth()) {
                case 8:
                    $this->_m_red = $this->_io->readU1();
                    break;
                default:
                    $this->_m_red = $this->_io->readU2be();
                    break;
            }
            switch ($this->_parent()->sampleDepth()) {
                case 8:
                    $this->_m_green = $this->_io->readU1();
                    break;
                default:
                    $this->_m_green = $this->_io->readU2be();
                    break;
            }
            switch ($this->_parent()->sampleDepth()) {
                case 8:
                    $this->_m_blue = $this->_io->readU1();
                    break;
                default:
                    $this->_m_blue = $this->_io->readU2be();
                    break;
            }
            switch ($this->_parent()->sampleDepth()) {
                case 8:
                    $this->_m_alpha = $this->_io->readU1();
                    break;
                default:
                    $this->_m_alpha = $this->_io->readU2be();
                    break;
            }
            $this->_m_freq = $this->_io->readU2be();
        }
        protected $_m_red;
        protected $_m_green;
        protected $_m_blue;
        protected $_m_alpha;
        protected $_m_freq;
        public function red() { return $this->_m_red; }
        public function green() { return $this->_m_green; }
        public function blue() { return $this->_m_blue; }

        /**
         * An alpha value of 0 means fully transparent. An alpha value of 255
         * (when `_parent.sample_depth` is 8) or 65535 (when
         * `_parent.sample_depth` is 16) means fully opaque.
         */
        public function alpha() { return $this->_m_alpha; }

        /**
         * Each frequency value is proportional to the fraction of the pixels in
         * the image for which that palette entry is the closest match in RGBA
         * space, before the image has been composited against any background.
         * 
         * The exact scale factor is chosen by the PNG encoder; it is recommended
         * that the resulting range of individual values reasonably fills the
         * range 0 to 65535.
         * 
         * Zero is a valid frequency meaning that the color is "least important"
         * or that it is rarely, if ever, used. When all the frequencies are
         * zero, they are meaningless, that is to say, nothing may be inferred
         * about the actual frequencies with which the colors appear in the PNG
         * image.
         */
        public function freq() { return $this->_m_freq; }
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
            if (!\Png\SrgbChunk\Intent::isDefined($this->_m_renderIntent)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_renderIntent, $this->_io, "/types/srgb_chunk/seq/0");
            }
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
 * Textual data (`tEXt`) chunk effectively allows you to store key-value
 * string pairs in the PNG container.
 * 
 * Both the "key" (`keyword`) and "value" (`text`) parts are restricted to
 * printable ISO-8859-1 (Latin-1) characters and ASCII spaces, with the
 * exception that `text` can also contain newlines (U+000A LINE FEED (LF)
 * characters) and U+00A0 NON-BREAKING SPACE characters.
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
         * Indicates the type of information represented by the text string.
         * 
         * Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
         * characters and spaces; that is, only code points 0x20-0x7E and
         * 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
         * keyword, leading spaces, trailing spaces, and consecutive spaces are
         * not permitted.
         */
        public function keyword() { return $this->_m_keyword; }

        /**
         * Text string (the "value" of this key-value pair).
         * 
         * Although it is not null-terminated (unlike the keyword), it must not
         * contain a zero byte (U+0000 NULL character). A newline should be
         * represented by a single U+000A LINE FEED (LF) character (aka `\n`).
         * The remaining control characters (U+0001..U+0009, U+000B..0+001F,
         * U+007F..U+009F) are discouraged.
         */
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

/**
 * Transparency (`tRNS`) chunk specifies either alpha values that are
 * associated with palette entries (for indexed-color images) or a single
 * transparent color (for greyscale and truecolor images).
 * 
 * A `tRNS` chunk must not appear for color types
 * `color_type::greyscale_alpha` = 4 and `color_type::truecolor_alpha` = 6,
 * since a full alpha channel is already present in those cases.
 */

namespace Png {
    class TrnsChunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\Chunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            if ($this->_root()->ihdr()->colorType() == \Png\ColorType::INDEXED) {
                $this->_m_paletteAlphas = [];
                $i = 0;
                while (!$this->_io->isEof()) {
                    $this->_m_paletteAlphas[] = $this->_io->readU1();
                    $i++;
                }
            }
            switch ($this->_root()->ihdr()->colorType()) {
                case \Png\ColorType::GREYSCALE:
                    $this->_m_transparentColor = new \Png\TrnsGreyscaleColor($this->_io, $this, $this->_root);
                    break;
                case \Png\ColorType::TRUECOLOR:
                    $this->_m_transparentColor = new \Png\TrnsTruecolorColor($this->_io, $this, $this->_root);
                    break;
            }
        }
        protected $_m_sampleMask;
        public function sampleMask() {
            if ($this->_m_sampleMask !== null)
                return $this->_m_sampleMask;
            $this->_m_sampleMask = (1 << $this->_root()->ihdr()->bitDepth()) - 1;
            return $this->_m_sampleMask;
        }
        protected $_m_paletteAlphas;
        protected $_m_transparentColor;

        /**
         * Alpha values associated with palette entries in the `PLTE` chunk.
         * 
         * Each entry indicates that pixels of the corresponding palette index
         * shall be treated as having the specified alpha value. Alpha values
         * have the same interpretation as in an 8-bit full alpha channel: 0 is
         * fully transparent, 255 is fully opaque, regardless of image bit depth.
         * 
         * The `tRNS` chunk must not contain more alpha values than there are
         * palette entries, but it may contain fewer values than there are
         * palette entries. In this case, the alpha value for all remaining
         * palette entries is assumed to be 255. If all palette indices are
         * opaque, the `tRNS` chunk may be omitted.
         */
        public function paletteAlphas() { return $this->_m_paletteAlphas; }

        /**
         * Pixels of the specified grey sample value or RGB sample values are
         * treated as transparent (equivalent to alpha value 0); all other pixels
         * are to be treated as fully opaque (alpha value `2^{bitdepth} - 1`).
         * 
         * If the image bit depth is less than 16, the least significant bits of
         * these sample values are used. Encoders should set the other bits to 0,
         * and decoders must mask the other bits to 0 before the value is used.
         * 
         * Note: in this Kaitai Struct implementation, the bitmask used to
         * implement this masking is stored in the value instance `sample_mask`.
         */
        public function transparentColor() { return $this->_m_transparentColor; }
    }
}

namespace Png {
    class TrnsGreyscaleColor extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\TrnsChunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_greyRaw = $this->_io->readU2be();
        }
        protected $_m_grey;
        public function grey() {
            if ($this->_m_grey !== null)
                return $this->_m_grey;
            $this->_m_grey = $this->greyRaw() & $this->_parent()->sampleMask();
            return $this->_m_grey;
        }
        protected $_m_greyRaw;
        public function greyRaw() { return $this->_m_greyRaw; }
    }
}

namespace Png {
    class TrnsTruecolorColor extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Png\TrnsChunk $_parent = null, ?\Png $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_redRaw = $this->_io->readU2be();
            $this->_m_greenRaw = $this->_io->readU2be();
            $this->_m_blueRaw = $this->_io->readU2be();
        }
        protected $_m_blue;
        public function blue() {
            if ($this->_m_blue !== null)
                return $this->_m_blue;
            $this->_m_blue = $this->blueRaw() & $this->_parent()->sampleMask();
            return $this->_m_blue;
        }
        protected $_m_green;
        public function green() {
            if ($this->_m_green !== null)
                return $this->_m_green;
            $this->_m_green = $this->greenRaw() & $this->_parent()->sampleMask();
            return $this->_m_green;
        }
        protected $_m_red;
        public function red() {
            if ($this->_m_red !== null)
                return $this->_m_red;
            $this->_m_red = $this->redRaw() & $this->_parent()->sampleMask();
            return $this->_m_red;
        }
        protected $_m_redRaw;
        protected $_m_greenRaw;
        protected $_m_blueRaw;
        public function redRaw() { return $this->_m_redRaw; }
        public function greenRaw() { return $this->_m_greenRaw; }
        public function blueRaw() { return $this->_m_blueRaw; }
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
         * The frame is composited onto the output buffer based on its alpha, using
         * a simple OVER operation as described in [Alpha Channel
         * Processing](https://www.w3.org/TR/png/#13Alpha-channel-processing).
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
    class FilterMethod {

        /**
         * Single row per-byte filtering
         */
        const BASE = 0;

        private const _VALUES = [0 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Png {
    class InterlaceMethod {
        const NONE = 0;
        const ADAM7 = 1;

        private const _VALUES = [0 => true, 1 => true];

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
