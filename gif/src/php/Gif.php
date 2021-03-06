<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * GIF (Graphics Interchange Format) is an image file format, developed
 * in 1987. It became popular in 1990s as one of the main image formats
 * used in World Wide Web.
 * 
 * GIF format allows encoding of palette-based images up to 256 colors
 * (each of the colors can be chosen from a 24-bit RGB
 * colorspace). Image data stream uses LZW (Lempel-Ziv-Welch) lossless
 * compression.
 * 
 * Over the years, several version of the format were published and
 * several extensions to it were made, namely, a popular Netscape
 * extension that allows to store several images in one file, switching
 * between them, which produces crude form of animation.
 * 
 * Structurally, format consists of several mandatory headers and then
 * a stream of blocks follows. Blocks can carry additional
 * metainformation or image data.
 */

namespace {
    class Gif extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Gif $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_hdr = new \Gif\Header($this->_io, $this, $this->_root);
            $this->_m_logicalScreenDescriptor = new \Gif\LogicalScreenDescriptorStruct($this->_io, $this, $this->_root);
            if ($this->logicalScreenDescriptor()->hasColorTable()) {
                $this->_m__raw_globalColorTable = $this->_io->readBytes(($this->logicalScreenDescriptor()->colorTableSize() * 3));
                $_io__raw_globalColorTable = new \Kaitai\Struct\Stream($this->_m__raw_globalColorTable);
                $this->_m_globalColorTable = new \Gif\ColorTable($_io__raw_globalColorTable, $this, $this->_root);
            }
            $this->_m_blocks = [];
            $i = 0;
            do {
                $_ = new \Gif\Block($this->_io, $this, $this->_root);
                $this->_m_blocks[] = $_;
                $i++;
            } while (!( (($this->_io()->isEof()) || ($_->blockType() == \Gif\BlockType::END_OF_FILE)) ));
        }
        protected $_m_hdr;
        protected $_m_logicalScreenDescriptor;
        protected $_m_globalColorTable;
        protected $_m_blocks;
        protected $_m__raw_globalColorTable;
        public function hdr() { return $this->_m_hdr; }
        public function logicalScreenDescriptor() { return $this->_m_logicalScreenDescriptor; }
        public function globalColorTable() { return $this->_m_globalColorTable; }
        public function blocks() { return $this->_m_blocks; }
        public function _raw_globalColorTable() { return $this->_m__raw_globalColorTable; }
    }
}

namespace Gif {
    class ImageData extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Gif\LocalImageDescriptor $_parent = null, \Gif $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lzwMinCodeSize = $this->_io->readU1();
            $this->_m_subblocks = new \Gif\Subblocks($this->_io, $this, $this->_root);
        }
        protected $_m_lzwMinCodeSize;
        protected $_m_subblocks;
        public function lzwMinCodeSize() { return $this->_m_lzwMinCodeSize; }
        public function subblocks() { return $this->_m_subblocks; }
    }
}

namespace Gif {
    class ColorTableEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Gif\ColorTable $_parent = null, \Gif $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_red = $this->_io->readU1();
            $this->_m_green = $this->_io->readU1();
            $this->_m_blue = $this->_io->readU1();
        }
        protected $_m_red;
        protected $_m_green;
        protected $_m_blue;
        public function red() { return $this->_m_red; }
        public function green() { return $this->_m_green; }
        public function blue() { return $this->_m_blue; }
    }
}

namespace Gif {
    class LogicalScreenDescriptorStruct extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Gif $_parent = null, \Gif $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_screenWidth = $this->_io->readU2le();
            $this->_m_screenHeight = $this->_io->readU2le();
            $this->_m_flags = $this->_io->readU1();
            $this->_m_bgColorIndex = $this->_io->readU1();
            $this->_m_pixelAspectRatio = $this->_io->readU1();
        }
        protected $_m_hasColorTable;
        public function hasColorTable() {
            if ($this->_m_hasColorTable !== null)
                return $this->_m_hasColorTable;
            $this->_m_hasColorTable = ($this->flags() & 128) != 0;
            return $this->_m_hasColorTable;
        }
        protected $_m_colorTableSize;
        public function colorTableSize() {
            if ($this->_m_colorTableSize !== null)
                return $this->_m_colorTableSize;
            $this->_m_colorTableSize = (2 << ($this->flags() & 7));
            return $this->_m_colorTableSize;
        }
        protected $_m_screenWidth;
        protected $_m_screenHeight;
        protected $_m_flags;
        protected $_m_bgColorIndex;
        protected $_m_pixelAspectRatio;
        public function screenWidth() { return $this->_m_screenWidth; }
        public function screenHeight() { return $this->_m_screenHeight; }
        public function flags() { return $this->_m_flags; }
        public function bgColorIndex() { return $this->_m_bgColorIndex; }
        public function pixelAspectRatio() { return $this->_m_pixelAspectRatio; }
    }
}

namespace Gif {
    class LocalImageDescriptor extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Gif\Block $_parent = null, \Gif $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_left = $this->_io->readU2le();
            $this->_m_top = $this->_io->readU2le();
            $this->_m_width = $this->_io->readU2le();
            $this->_m_height = $this->_io->readU2le();
            $this->_m_flags = $this->_io->readU1();
            if ($this->hasColorTable()) {
                $this->_m__raw_localColorTable = $this->_io->readBytes(($this->colorTableSize() * 3));
                $_io__raw_localColorTable = new \Kaitai\Struct\Stream($this->_m__raw_localColorTable);
                $this->_m_localColorTable = new \Gif\ColorTable($_io__raw_localColorTable, $this, $this->_root);
            }
            $this->_m_imageData = new \Gif\ImageData($this->_io, $this, $this->_root);
        }
        protected $_m_hasColorTable;
        public function hasColorTable() {
            if ($this->_m_hasColorTable !== null)
                return $this->_m_hasColorTable;
            $this->_m_hasColorTable = ($this->flags() & 128) != 0;
            return $this->_m_hasColorTable;
        }
        protected $_m_hasInterlace;
        public function hasInterlace() {
            if ($this->_m_hasInterlace !== null)
                return $this->_m_hasInterlace;
            $this->_m_hasInterlace = ($this->flags() & 64) != 0;
            return $this->_m_hasInterlace;
        }
        protected $_m_hasSortedColorTable;
        public function hasSortedColorTable() {
            if ($this->_m_hasSortedColorTable !== null)
                return $this->_m_hasSortedColorTable;
            $this->_m_hasSortedColorTable = ($this->flags() & 32) != 0;
            return $this->_m_hasSortedColorTable;
        }
        protected $_m_colorTableSize;
        public function colorTableSize() {
            if ($this->_m_colorTableSize !== null)
                return $this->_m_colorTableSize;
            $this->_m_colorTableSize = (2 << ($this->flags() & 7));
            return $this->_m_colorTableSize;
        }
        protected $_m_left;
        protected $_m_top;
        protected $_m_width;
        protected $_m_height;
        protected $_m_flags;
        protected $_m_localColorTable;
        protected $_m_imageData;
        protected $_m__raw_localColorTable;
        public function left() { return $this->_m_left; }
        public function top() { return $this->_m_top; }
        public function width() { return $this->_m_width; }
        public function height() { return $this->_m_height; }
        public function flags() { return $this->_m_flags; }
        public function localColorTable() { return $this->_m_localColorTable; }
        public function imageData() { return $this->_m_imageData; }
        public function _raw_localColorTable() { return $this->_m__raw_localColorTable; }
    }
}

namespace Gif {
    class Block extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Gif $_parent = null, \Gif $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_blockType = $this->_io->readU1();
            switch ($this->blockType()) {
                case \Gif\BlockType::EXTENSION:
                    $this->_m_body = new \Gif\Extension($this->_io, $this, $this->_root);
                    break;
                case \Gif\BlockType::LOCAL_IMAGE_DESCRIPTOR:
                    $this->_m_body = new \Gif\LocalImageDescriptor($this->_io, $this, $this->_root);
                    break;
            }
        }
        protected $_m_blockType;
        protected $_m_body;
        public function blockType() { return $this->_m_blockType; }
        public function body() { return $this->_m_body; }
    }
}

namespace Gif {
    class ColorTable extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Gif $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Gif\ColorTableEntry($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace Gif {
    class Header extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Gif $_parent = null, \Gif $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(3);
            if (!($this->magic() == "\x47\x49\x46")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x47\x49\x46", $this->magic(), $this->_io(), "/types/header/seq/0");
            }
            $this->_m_version = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "ASCII");
        }
        protected $_m_magic;
        protected $_m_version;
        public function magic() { return $this->_m_magic; }
        public function version() { return $this->_m_version; }
    }
}

namespace Gif {
    class ExtGraphicControl extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Gif\Extension $_parent = null, \Gif $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_blockSize = $this->_io->readBytes(1);
            if (!($this->blockSize() == "\x04")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x04", $this->blockSize(), $this->_io(), "/types/ext_graphic_control/seq/0");
            }
            $this->_m_flags = $this->_io->readU1();
            $this->_m_delayTime = $this->_io->readU2le();
            $this->_m_transparentIdx = $this->_io->readU1();
            $this->_m_terminator = $this->_io->readBytes(1);
            if (!($this->terminator() == "\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00", $this->terminator(), $this->_io(), "/types/ext_graphic_control/seq/4");
            }
        }
        protected $_m_transparentColorFlag;
        public function transparentColorFlag() {
            if ($this->_m_transparentColorFlag !== null)
                return $this->_m_transparentColorFlag;
            $this->_m_transparentColorFlag = ($this->flags() & 1) != 0;
            return $this->_m_transparentColorFlag;
        }
        protected $_m_userInputFlag;
        public function userInputFlag() {
            if ($this->_m_userInputFlag !== null)
                return $this->_m_userInputFlag;
            $this->_m_userInputFlag = ($this->flags() & 2) != 0;
            return $this->_m_userInputFlag;
        }
        protected $_m_blockSize;
        protected $_m_flags;
        protected $_m_delayTime;
        protected $_m_transparentIdx;
        protected $_m_terminator;
        public function blockSize() { return $this->_m_blockSize; }
        public function flags() { return $this->_m_flags; }
        public function delayTime() { return $this->_m_delayTime; }
        public function transparentIdx() { return $this->_m_transparentIdx; }
        public function terminator() { return $this->_m_terminator; }
    }
}

namespace Gif {
    class Subblock extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Gif $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenBytes = $this->_io->readU1();
            $this->_m_bytes = $this->_io->readBytes($this->lenBytes());
        }
        protected $_m_lenBytes;
        protected $_m_bytes;
        public function lenBytes() { return $this->_m_lenBytes; }
        public function bytes() { return $this->_m_bytes; }
    }
}

namespace Gif {
    class ApplicationId extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Gif\ExtApplication $_parent = null, \Gif $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenBytes = $this->_io->readU1();
            if (!($this->lenBytes() == 11)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(11, $this->lenBytes(), $this->_io(), "/types/application_id/seq/0");
            }
            $this->_m_applicationIdentifier = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(8), "ASCII");
            $this->_m_applicationAuthCode = $this->_io->readBytes(3);
        }
        protected $_m_lenBytes;
        protected $_m_applicationIdentifier;
        protected $_m_applicationAuthCode;
        public function lenBytes() { return $this->_m_lenBytes; }
        public function applicationIdentifier() { return $this->_m_applicationIdentifier; }
        public function applicationAuthCode() { return $this->_m_applicationAuthCode; }
    }
}

namespace Gif {
    class ExtApplication extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Gif\Extension $_parent = null, \Gif $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_applicationId = new \Gif\ApplicationId($this->_io, $this, $this->_root);
            $this->_m_subblocks = [];
            $i = 0;
            do {
                $_ = new \Gif\Subblock($this->_io, $this, $this->_root);
                $this->_m_subblocks[] = $_;
                $i++;
            } while (!($_->lenBytes() == 0));
        }
        protected $_m_applicationId;
        protected $_m_subblocks;
        public function applicationId() { return $this->_m_applicationId; }
        public function subblocks() { return $this->_m_subblocks; }
    }
}

namespace Gif {
    class Subblocks extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Gif $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            do {
                $_ = new \Gif\Subblock($this->_io, $this, $this->_root);
                $this->_m_entries[] = $_;
                $i++;
            } while (!($_->lenBytes() == 0));
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace Gif {
    class Extension extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Gif\Block $_parent = null, \Gif $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_label = $this->_io->readU1();
            switch ($this->label()) {
                case \Gif\ExtensionLabel::APPLICATION:
                    $this->_m_body = new \Gif\ExtApplication($this->_io, $this, $this->_root);
                    break;
                case \Gif\ExtensionLabel::COMMENT:
                    $this->_m_body = new \Gif\Subblocks($this->_io, $this, $this->_root);
                    break;
                case \Gif\ExtensionLabel::GRAPHIC_CONTROL:
                    $this->_m_body = new \Gif\ExtGraphicControl($this->_io, $this, $this->_root);
                    break;
                default:
                    $this->_m_body = new \Gif\Subblocks($this->_io, $this, $this->_root);
                    break;
            }
        }
        protected $_m_label;
        protected $_m_body;
        public function label() { return $this->_m_label; }
        public function body() { return $this->_m_body; }
    }
}

namespace Gif {
    class BlockType {
        const EXTENSION = 33;
        const LOCAL_IMAGE_DESCRIPTOR = 44;
        const END_OF_FILE = 59;
    }
}

namespace Gif {
    class ExtensionLabel {
        const GRAPHIC_CONTROL = 249;
        const COMMENT = 254;
        const APPLICATION = 255;
    }
}
