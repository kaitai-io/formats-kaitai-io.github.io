<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class Webp extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Webp $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->_m_magic == "\x52\x49\x46\x46")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x52\x49\x46\x46", $this->_m_magic, $this->_io, "/seq/0");
            }
            $this->_m_lenData = $this->_io->readU4le();
            $this->_m_webp = $this->_io->readBytes(4);
            if (!($this->_m_webp == "\x57\x45\x42\x50")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x57\x45\x42\x50", $this->_m_webp, $this->_io, "/seq/2");
            }
            $this->_m__raw_payload = $this->_io->readBytes($this->lenData() - 4);
            $_io__raw_payload = new \Kaitai\Struct\Stream($this->_m__raw_payload);
            $this->_m_payload = new \Webp\Chunks($_io__raw_payload, $this, $this->_root);
        }
        protected $_m_magic;
        protected $_m_lenData;
        protected $_m_webp;
        protected $_m_payload;
        protected $_m__raw_payload;
        public function magic() { return $this->_m_magic; }
        public function lenData() { return $this->_m_lenData; }
        public function webp() { return $this->_m_webp; }
        public function payload() { return $this->_m_payload; }
        public function _raw_payload() { return $this->_m__raw_payload; }
    }
}

namespace Webp {
    class Alph extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Webp\Chunk $_parent = null, ?\Webp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reserved = $this->_io->readBitsIntBe(2);
            if (!($this->_m_reserved == 0)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(0, $this->_m_reserved, $this->_io, "/types/alph/seq/0");
            }
            $this->_m_preprocessing = $this->_io->readBitsIntBe(2);
            if (!\Webp\Preprocessing::isDefined($this->_m_preprocessing)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_preprocessing, $this->_io, "/types/alph/seq/1");
            }
            $this->_m_filtering = $this->_io->readBitsIntBe(2);
            $this->_m_compression = $this->_io->readBitsIntBe(2);
            if (!\Webp\CompressionMethod::isDefined($this->_m_compression)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_compression, $this->_io, "/types/alph/seq/3");
            }
            $this->_io->alignToByte();
            $this->_m_data = $this->_io->readBytesFull();
        }
        protected $_m_reserved;
        protected $_m_preprocessing;
        protected $_m_filtering;
        protected $_m_compression;
        protected $_m_data;
        public function reserved() { return $this->_m_reserved; }
        public function preprocessing() { return $this->_m_preprocessing; }
        public function filtering() { return $this->_m_filtering; }
        public function compression() { return $this->_m_compression; }
        public function data() { return $this->_m_data; }
    }
}

namespace Webp {
    class Anim extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Webp\Chunk $_parent = null, ?\Webp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_backgroundColor = new \Webp\Anim\BgColor($this->_io, $this, $this->_root);
            $this->_m_loopCount = $this->_io->readU2le();
        }
        protected $_m_backgroundColor;
        protected $_m_loopCount;
        public function backgroundColor() { return $this->_m_backgroundColor; }
        public function loopCount() { return $this->_m_loopCount; }
    }
}

namespace Webp\Anim {
    class BgColor extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Webp\Anim $_parent = null, ?\Webp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_blue = $this->_io->readU1();
            $this->_m_green = $this->_io->readU1();
            $this->_m_red = $this->_io->readU1();
            $this->_m_alpha = $this->_io->readU1();
        }
        protected $_m_blue;
        protected $_m_green;
        protected $_m_red;
        protected $_m_alpha;
        public function blue() { return $this->_m_blue; }
        public function green() { return $this->_m_green; }
        public function red() { return $this->_m_red; }
        public function alpha() { return $this->_m_alpha; }
    }
}

namespace Webp {
    class Anmf extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Webp\Chunk $_parent = null, ?\Webp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_frameXDiv2 = $this->_io->readBitsIntLe(24);
            $this->_m_frameYDiv2 = $this->_io->readBitsIntLe(24);
            $this->_m_frameWidthMinus1 = $this->_io->readBitsIntLe(24);
            $this->_m_frameHeightMinus1 = $this->_io->readBitsIntLe(24);
            $this->_m_duration = $this->_io->readBitsIntLe(24);
            $this->_m_reserved = $this->_io->readBitsIntBe(6);
            if (!($this->_m_reserved == 0)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(0, $this->_m_reserved, $this->_io, "/types/anmf/seq/5");
            }
            $this->_m_blendingMethod = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_disposalMethod = $this->_io->readBitsIntBe(1) != 0;
            $this->_io->alignToByte();
            $this->_m_data = $this->_io->readBytesFull();
        }
        protected $_m_frameHeight;
        public function frameHeight() {
            if ($this->_m_frameHeight !== null)
                return $this->_m_frameHeight;
            $this->_m_frameHeight = $this->frameHeightMinus1() + 1;
            return $this->_m_frameHeight;
        }
        protected $_m_frameWidth;
        public function frameWidth() {
            if ($this->_m_frameWidth !== null)
                return $this->_m_frameWidth;
            $this->_m_frameWidth = $this->frameWidthMinus1() + 1;
            return $this->_m_frameWidth;
        }
        protected $_m_frameX;
        public function frameX() {
            if ($this->_m_frameX !== null)
                return $this->_m_frameX;
            $this->_m_frameX = $this->frameXDiv2() * 2;
            return $this->_m_frameX;
        }
        protected $_m_frameY;
        public function frameY() {
            if ($this->_m_frameY !== null)
                return $this->_m_frameY;
            $this->_m_frameY = $this->frameYDiv2() * 2;
            return $this->_m_frameY;
        }
        protected $_m_frameXDiv2;
        protected $_m_frameYDiv2;
        protected $_m_frameWidthMinus1;
        protected $_m_frameHeightMinus1;
        protected $_m_duration;
        protected $_m_reserved;
        protected $_m_blendingMethod;
        protected $_m_disposalMethod;
        protected $_m_data;
        public function frameXDiv2() { return $this->_m_frameXDiv2; }
        public function frameYDiv2() { return $this->_m_frameYDiv2; }
        public function frameWidthMinus1() { return $this->_m_frameWidthMinus1; }
        public function frameHeightMinus1() { return $this->_m_frameHeightMinus1; }
        public function duration() { return $this->_m_duration; }
        public function reserved() { return $this->_m_reserved; }
        public function blendingMethod() { return $this->_m_blendingMethod; }
        public function disposalMethod() { return $this->_m_disposalMethod; }
        public function data() { return $this->_m_data; }
    }
}

namespace Webp {
    class Chunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Webp\Chunks $_parent = null, ?\Webp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_name = $this->_io->readU4le();
            if (!\Webp\ChunkNames::isDefined($this->_m_name)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_name, $this->_io, "/types/chunk/seq/0");
            }
            $this->_m_lenData = $this->_io->readU4le();
            switch ($this->name()) {
                case \Webp\ChunkNames::ALPH:
                    $this->_m__raw_data = $this->_io->readBytes($this->lenData());
                    $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                    $this->_m_data = new \Webp\Alph($_io__raw_data, $this, $this->_root);
                    break;
                case \Webp\ChunkNames::ANIM:
                    $this->_m__raw_data = $this->_io->readBytes($this->lenData());
                    $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                    $this->_m_data = new \Webp\Anim($_io__raw_data, $this, $this->_root);
                    break;
                case \Webp\ChunkNames::ANMF:
                    $this->_m__raw_data = $this->_io->readBytes($this->lenData());
                    $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                    $this->_m_data = new \Webp\Anmf($_io__raw_data, $this, $this->_root);
                    break;
                case \Webp\ChunkNames::VP8:
                    $this->_m__raw_data = $this->_io->readBytes($this->lenData());
                    $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                    $this->_m_data = new \Webp\Vp8($_io__raw_data, $this, $this->_root);
                    break;
                case \Webp\ChunkNames::VP8L:
                    $this->_m__raw_data = $this->_io->readBytes($this->lenData());
                    $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                    $this->_m_data = new \Webp\Vp8l($_io__raw_data, $this, $this->_root);
                    break;
                case \Webp\ChunkNames::VP8X:
                    $this->_m__raw_data = $this->_io->readBytes($this->lenData());
                    $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                    $this->_m_data = new \Webp\Vp8x($_io__raw_data, $this, $this->_root);
                    break;
                case \Webp\ChunkNames::XMP:
                    $this->_m__raw_data = $this->_io->readBytes($this->lenData());
                    $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                    $this->_m_data = new \Webp\Xmp($_io__raw_data, $this, $this->_root);
                    break;
                case \Webp\ChunkNames::XMP_VAR:
                    $this->_m__raw_data = $this->_io->readBytes($this->lenData());
                    $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                    $this->_m_data = new \Webp\Xmp($_io__raw_data, $this, $this->_root);
                    break;
                default:
                    $this->_m_data = $this->_io->readBytes($this->lenData());
                    break;
            }
            if (\Kaitai\Struct\Stream::mod($this->lenData(), 2) != 0) {
                $this->_m_padding = $this->_io->readBytes(1);
                if (!($this->_m_padding == "\x00")) {
                    throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00", $this->_m_padding, $this->_io, "/types/chunk/seq/3");
                }
            }
        }
        protected $_m_name;
        protected $_m_lenData;
        protected $_m_data;
        protected $_m_padding;
        protected $_m__raw_data;
        public function name() { return $this->_m_name; }
        public function lenData() { return $this->_m_lenData; }
        public function data() { return $this->_m_data; }
        public function padding() { return $this->_m_padding; }
        public function _raw_data() { return $this->_m__raw_data; }
    }
}

namespace Webp {
    class Chunks extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Webp $_parent = null, ?\Webp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_chunks = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_chunks[] = new \Webp\Chunk($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_chunks;
        public function chunks() { return $this->_m_chunks; }
    }
}

namespace Webp {
    class Vp8 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Webp\Chunk $_parent = null, ?\Webp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_frameType = $this->_io->readBitsIntLe(1) != 0;
            if (!($this->_m_frameType == false)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(false, $this->_m_frameType, $this->_io, "/types/vp8/seq/0");
            }
            $this->_m_version = $this->_io->readBitsIntLe(3);
            if (!($this->_m_version <= 3)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(3, $this->_m_version, $this->_io, "/types/vp8/seq/1");
            }
            $this->_m_showFrame = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_lenFirstPartition = $this->_io->readBitsIntLe(19);
            $this->_io->alignToByte();
            $this->_m_startCode = $this->_io->readBytes(3);
            if (!($this->_m_startCode == "\x9D\x01\x2A")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x9D\x01\x2A", $this->_m_startCode, $this->_io, "/types/vp8/seq/4");
            }
            $this->_m_width = $this->_io->readBitsIntLe(14);
            $this->_m_horizontalScale = $this->_io->readBitsIntLe(2);
            $this->_m_height = $this->_io->readBitsIntLe(14);
            $this->_m_verticalScale = $this->_io->readBitsIntLe(2);
            $this->_io->alignToByte();
            $this->_m_data = $this->_io->readBytesFull();
        }
        protected $_m_frameType;
        protected $_m_version;
        protected $_m_showFrame;
        protected $_m_lenFirstPartition;
        protected $_m_startCode;
        protected $_m_width;
        protected $_m_horizontalScale;
        protected $_m_height;
        protected $_m_verticalScale;
        protected $_m_data;
        public function frameType() { return $this->_m_frameType; }
        public function version() { return $this->_m_version; }
        public function showFrame() { return $this->_m_showFrame; }
        public function lenFirstPartition() { return $this->_m_lenFirstPartition; }
        public function startCode() { return $this->_m_startCode; }
        public function width() { return $this->_m_width; }
        public function horizontalScale() { return $this->_m_horizontalScale; }
        public function height() { return $this->_m_height; }
        public function verticalScale() { return $this->_m_verticalScale; }
        public function data() { return $this->_m_data; }
    }
}

namespace Webp {
    class Vp8l extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Webp\Chunk $_parent = null, ?\Webp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_signature = $this->_io->readU1();
            if (!($this->_m_signature == 47)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(47, $this->_m_signature, $this->_io, "/types/vp8l/seq/0");
            }
            $this->_m_imageWidthMinus1 = $this->_io->readBitsIntLe(14);
            $this->_m_imageHeightMinus1 = $this->_io->readBitsIntLe(14);
            $this->_m_alphaIsUsed = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_versionNumber = $this->_io->readBitsIntLe(3);
            if (!($this->_m_versionNumber == 0)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(0, $this->_m_versionNumber, $this->_io, "/types/vp8l/seq/4");
            }
            $this->_io->alignToByte();
            $this->_m_data = $this->_io->readBytesFull();
        }
        protected $_m_imageHeight;
        public function imageHeight() {
            if ($this->_m_imageHeight !== null)
                return $this->_m_imageHeight;
            $this->_m_imageHeight = $this->imageHeightMinus1() + 1;
            return $this->_m_imageHeight;
        }
        protected $_m_imageWidth;
        public function imageWidth() {
            if ($this->_m_imageWidth !== null)
                return $this->_m_imageWidth;
            $this->_m_imageWidth = $this->imageWidthMinus1() + 1;
            return $this->_m_imageWidth;
        }
        protected $_m_signature;
        protected $_m_imageWidthMinus1;
        protected $_m_imageHeightMinus1;
        protected $_m_alphaIsUsed;
        protected $_m_versionNumber;
        protected $_m_data;
        public function signature() { return $this->_m_signature; }
        public function imageWidthMinus1() { return $this->_m_imageWidthMinus1; }
        public function imageHeightMinus1() { return $this->_m_imageHeightMinus1; }

        /**
         * A hint only - it should not impact decoding. It should be `false` when
         * all alpha values are 255 in the picture, and `true` otherwise.
         */
        public function alphaIsUsed() { return $this->_m_alphaIsUsed; }
        public function versionNumber() { return $this->_m_versionNumber; }
        public function data() { return $this->_m_data; }
    }
}

namespace Webp {
    class Vp8x extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Webp\Chunk $_parent = null, ?\Webp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reserved1 = $this->_io->readBitsIntBe(2);
            if (!($this->_m_reserved1 == 0)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(0, $this->_m_reserved1, $this->_io, "/types/vp8x/seq/0");
            }
            $this->_m_iccProfile = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_alpha = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_exif = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_xmp = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_animation = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_reserved2 = $this->_io->readBitsIntBe(1) != 0;
            if (!($this->_m_reserved2 == false)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(false, $this->_m_reserved2, $this->_io, "/types/vp8x/seq/6");
            }
            $this->_m_reserved3 = $this->_io->readBitsIntBe(24);
            if (!($this->_m_reserved3 == 0)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(0, $this->_m_reserved3, $this->_io, "/types/vp8x/seq/7");
            }
            $this->_m_canvasWidthMinus1 = $this->_io->readBitsIntLe(24);
            $this->_m_canvasHeightMinus1 = $this->_io->readBitsIntLe(24);
            if (!($this->_m_canvasHeightMinus1 <= intval(4294967295 / $this->canvasWidth()) - 1)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(intval(4294967295 / $this->canvasWidth()) - 1, $this->_m_canvasHeightMinus1, $this->_io, "/types/vp8x/seq/9");
            }
        }
        protected $_m_canvasHeight;
        public function canvasHeight() {
            if ($this->_m_canvasHeight !== null)
                return $this->_m_canvasHeight;
            $this->_m_canvasHeight = $this->canvasHeightMinus1() + 1;
            return $this->_m_canvasHeight;
        }
        protected $_m_canvasWidth;
        public function canvasWidth() {
            if ($this->_m_canvasWidth !== null)
                return $this->_m_canvasWidth;
            $this->_m_canvasWidth = $this->canvasWidthMinus1() + 1;
            return $this->_m_canvasWidth;
        }
        protected $_m_reserved1;
        protected $_m_iccProfile;
        protected $_m_alpha;
        protected $_m_exif;
        protected $_m_xmp;
        protected $_m_animation;
        protected $_m_reserved2;
        protected $_m_reserved3;
        protected $_m_canvasWidthMinus1;
        protected $_m_canvasHeightMinus1;
        public function reserved1() { return $this->_m_reserved1; }
        public function iccProfile() { return $this->_m_iccProfile; }
        public function alpha() { return $this->_m_alpha; }
        public function exif() { return $this->_m_exif; }
        public function xmp() { return $this->_m_xmp; }
        public function animation() { return $this->_m_animation; }
        public function reserved2() { return $this->_m_reserved2; }
        public function reserved3() { return $this->_m_reserved3; }
        public function canvasWidthMinus1() { return $this->_m_canvasWidthMinus1; }
        public function canvasHeightMinus1() { return $this->_m_canvasHeightMinus1; }
    }
}

namespace Webp {
    class Xmp extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Webp\Chunk $_parent = null, ?\Webp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_data = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
        }
        protected $_m_data;
        public function data() { return $this->_m_data; }
    }
}

namespace Webp {
    class ChunkNames {
        const XMP_VAR = 5262680;
        const VP8 = 540561494;
        const XMP = 542133592;
        const EXIF = 1179211845;
        const ANMF = 1179471425;
        const ALPH = 1213221953;
        const VP8L = 1278758998;
        const FRGM = 1296519750;
        const ANIM = 1296649793;
        const ICCP = 1346585417;
        const VP8X = 1480085590;

        private const _VALUES = [5262680 => true, 540561494 => true, 542133592 => true, 1179211845 => true, 1179471425 => true, 1213221953 => true, 1278758998 => true, 1296519750 => true, 1296649793 => true, 1346585417 => true, 1480085590 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Webp {
    class CompressionMethod {
        const NONE = 0;
        const WEBP_LOSSLESS = 1;

        private const _VALUES = [0 => true, 1 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Webp {
    class FilteringMethod {
        const NONE = 0;
        const HORIZONTAL = 1;
        const VERTICAL = 2;
        const GRADIENT = 3;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Webp {
    class Preprocessing {
        const NONE = 0;
        const LEVEL_REDUCTION = 1;

        private const _VALUES = [0 => true, 1 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
