<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * SWF files are used by Adobe Flash (AKA Shockwave Flash, Macromedia
 * Flash) to encode rich interactive multimedia content and are,
 * essentially, a container for special bytecode instructions to play
 * back that content. In early 2000s, it was dominant rich multimedia
 * web format (.swf files were integrated into web pages and played
 * back with a browser plugin), but its usage largely declined in
 * 2010s, as HTML5 and performant browser-native solutions
 * (i.e. JavaScript engines and graphical approaches, such as WebGL)
 * emerged.
 * 
 * There are a lot of versions of SWF (~36), format is somewhat
 * documented by Adobe.
 */

namespace {
    class Swf extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Swf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_compression = $this->_io->readU1();
            $this->_m_signature = $this->_io->readBytes(2);
            if (!($this->signature() == "\x57\x53")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x57\x53", $this->signature(), $this->_io(), "/seq/1");
            }
            $this->_m_version = $this->_io->readU1();
            $this->_m_lenFile = $this->_io->readU4le();
            if ($this->compression() == \Swf\Compressions::NONE) {
                $this->_m__raw_plainBody = $this->_io->readBytesFull();
                $_io__raw_plainBody = new \Kaitai\Struct\Stream($this->_m__raw_plainBody);
                $this->_m_plainBody = new \Swf\SwfBody($_io__raw_plainBody, $this, $this->_root);
            }
            if ($this->compression() == \Swf\Compressions::ZLIB) {
                $this->_m__raw__raw_zlibBody = $this->_io->readBytesFull();
                $this->_m__raw_zlibBody = \Kaitai\Struct\Stream::processZlib($this->_m__raw__raw_zlibBody);
                $_io__raw_zlibBody = new \Kaitai\Struct\Stream($this->_m__raw_zlibBody);
                $this->_m_zlibBody = new \Swf\SwfBody($_io__raw_zlibBody, $this, $this->_root);
            }
        }
        protected $_m_compression;
        protected $_m_signature;
        protected $_m_version;
        protected $_m_lenFile;
        protected $_m_plainBody;
        protected $_m_zlibBody;
        protected $_m__raw_plainBody;
        protected $_m__raw_zlibBody;
        protected $_m__raw__raw_zlibBody;
        public function compression() { return $this->_m_compression; }
        public function signature() { return $this->_m_signature; }
        public function version() { return $this->_m_version; }
        public function lenFile() { return $this->_m_lenFile; }
        public function plainBody() { return $this->_m_plainBody; }
        public function zlibBody() { return $this->_m_zlibBody; }
        public function _raw_plainBody() { return $this->_m__raw_plainBody; }
        public function _raw_zlibBody() { return $this->_m__raw_zlibBody; }
        public function _raw__raw_zlibBody() { return $this->_m__raw__raw_zlibBody; }
    }
}

namespace Swf {
    class Rgb extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Swf\Tag $_parent = null, \Swf $_root = null) {
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

namespace Swf {
    class DoAbcBody extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Swf\Tag $_parent = null, \Swf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_flags = $this->_io->readU4le();
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ASCII");
            $this->_m_abcdata = $this->_io->readBytesFull();
        }
        protected $_m_flags;
        protected $_m_name;
        protected $_m_abcdata;
        public function flags() { return $this->_m_flags; }
        public function name() { return $this->_m_name; }
        public function abcdata() { return $this->_m_abcdata; }
    }
}

namespace Swf {
    class SwfBody extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Swf $_parent = null, \Swf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_rect = new \Swf\Rect($this->_io, $this, $this->_root);
            $this->_m_frameRate = $this->_io->readU2le();
            $this->_m_frameCount = $this->_io->readU2le();
            if ($this->_root()->version() >= 8) {
                $this->_m_fileAttributesTag = new \Swf\Tag($this->_io, $this, $this->_root);
            }
            $this->_m_tags = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_tags[] = new \Swf\Tag($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_rect;
        protected $_m_frameRate;
        protected $_m_frameCount;
        protected $_m_fileAttributesTag;
        protected $_m_tags;
        public function rect() { return $this->_m_rect; }
        public function frameRate() { return $this->_m_frameRate; }
        public function frameCount() { return $this->_m_frameCount; }
        public function fileAttributesTag() { return $this->_m_fileAttributesTag; }
        public function tags() { return $this->_m_tags; }
    }
}

namespace Swf {
    class Rect extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Swf\SwfBody $_parent = null, \Swf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_b1 = $this->_io->readU1();
            $this->_m_skip = $this->_io->readBytes($this->numBytes());
        }
        protected $_m_numBits;
        public function numBits() {
            if ($this->_m_numBits !== null)
                return $this->_m_numBits;
            $this->_m_numBits = ($this->b1() >> 3);
            return $this->_m_numBits;
        }
        protected $_m_numBytes;
        public function numBytes() {
            if ($this->_m_numBytes !== null)
                return $this->_m_numBytes;
            $this->_m_numBytes = intval(((($this->numBits() * 4) - 3) + 7) / 8);
            return $this->_m_numBytes;
        }
        protected $_m_b1;
        protected $_m_skip;
        public function b1() { return $this->_m_b1; }
        public function skip() { return $this->_m_skip; }
    }
}

namespace Swf {
    class Tag extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Swf\SwfBody $_parent = null, \Swf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_recordHeader = new \Swf\RecordHeader($this->_io, $this, $this->_root);
            switch ($this->recordHeader()->tagType()) {
                case \Swf\TagType::DEFINE_SOUND:
                    $this->_m__raw_tagBody = $this->_io->readBytes($this->recordHeader()->len());
                    $_io__raw_tagBody = new \Kaitai\Struct\Stream($this->_m__raw_tagBody);
                    $this->_m_tagBody = new \Swf\DefineSoundBody($_io__raw_tagBody, $this, $this->_root);
                    break;
                case \Swf\TagType::SET_BACKGROUND_COLOR:
                    $this->_m__raw_tagBody = $this->_io->readBytes($this->recordHeader()->len());
                    $_io__raw_tagBody = new \Kaitai\Struct\Stream($this->_m__raw_tagBody);
                    $this->_m_tagBody = new \Swf\Rgb($_io__raw_tagBody, $this, $this->_root);
                    break;
                case \Swf\TagType::SCRIPT_LIMITS:
                    $this->_m__raw_tagBody = $this->_io->readBytes($this->recordHeader()->len());
                    $_io__raw_tagBody = new \Kaitai\Struct\Stream($this->_m__raw_tagBody);
                    $this->_m_tagBody = new \Swf\ScriptLimitsBody($_io__raw_tagBody, $this, $this->_root);
                    break;
                case \Swf\TagType::DO_ABC:
                    $this->_m__raw_tagBody = $this->_io->readBytes($this->recordHeader()->len());
                    $_io__raw_tagBody = new \Kaitai\Struct\Stream($this->_m__raw_tagBody);
                    $this->_m_tagBody = new \Swf\DoAbcBody($_io__raw_tagBody, $this, $this->_root);
                    break;
                case \Swf\TagType::EXPORT_ASSETS:
                    $this->_m__raw_tagBody = $this->_io->readBytes($this->recordHeader()->len());
                    $_io__raw_tagBody = new \Kaitai\Struct\Stream($this->_m__raw_tagBody);
                    $this->_m_tagBody = new \Swf\SymbolClassBody($_io__raw_tagBody, $this, $this->_root);
                    break;
                case \Swf\TagType::SYMBOL_CLASS:
                    $this->_m__raw_tagBody = $this->_io->readBytes($this->recordHeader()->len());
                    $_io__raw_tagBody = new \Kaitai\Struct\Stream($this->_m__raw_tagBody);
                    $this->_m_tagBody = new \Swf\SymbolClassBody($_io__raw_tagBody, $this, $this->_root);
                    break;
                default:
                    $this->_m_tagBody = $this->_io->readBytes($this->recordHeader()->len());
                    break;
            }
        }
        protected $_m_recordHeader;
        protected $_m_tagBody;
        protected $_m__raw_tagBody;
        public function recordHeader() { return $this->_m_recordHeader; }
        public function tagBody() { return $this->_m_tagBody; }
        public function _raw_tagBody() { return $this->_m__raw_tagBody; }
    }
}

namespace Swf {
    class SymbolClassBody extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Swf\Tag $_parent = null, \Swf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numSymbols = $this->_io->readU2le();
            $this->_m_symbols = [];
            $n = $this->numSymbols();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_symbols[] = new \Swf\SymbolClassBody\Symbol($this->_io, $this, $this->_root);
            }
        }
        protected $_m_numSymbols;
        protected $_m_symbols;
        public function numSymbols() { return $this->_m_numSymbols; }
        public function symbols() { return $this->_m_symbols; }
    }
}

namespace Swf\SymbolClassBody {
    class Symbol extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Swf\SymbolClassBody $_parent = null, \Swf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_tag = $this->_io->readU2le();
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ASCII");
        }
        protected $_m_tag;
        protected $_m_name;
        public function tag() { return $this->_m_tag; }
        public function name() { return $this->_m_name; }
    }
}

namespace Swf {
    class DefineSoundBody extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Swf\Tag $_parent = null, \Swf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_id = $this->_io->readU2le();
            $this->_m_format = $this->_io->readBitsIntBe(4);
            $this->_m_samplingRate = $this->_io->readBitsIntBe(2);
            $this->_m_bitsPerSample = $this->_io->readBitsIntBe(1);
            $this->_m_numChannels = $this->_io->readBitsIntBe(1);
            $this->_io->alignToByte();
            $this->_m_numSamples = $this->_io->readU4le();
        }
        protected $_m_id;
        protected $_m_format;
        protected $_m_samplingRate;
        protected $_m_bitsPerSample;
        protected $_m_numChannels;
        protected $_m_numSamples;
        public function id() { return $this->_m_id; }
        public function format() { return $this->_m_format; }

        /**
         * Sound sampling rate, as per enum. Ignored for Nellymoser and Speex codecs.
         */
        public function samplingRate() { return $this->_m_samplingRate; }
        public function bitsPerSample() { return $this->_m_bitsPerSample; }
        public function numChannels() { return $this->_m_numChannels; }
        public function numSamples() { return $this->_m_numSamples; }
    }
}

namespace Swf\DefineSoundBody {
    class SamplingRates {
        const RATE_5_5_KHZ = 0;
        const RATE_11_KHZ = 1;
        const RATE_22_KHZ = 2;
        const RATE_44_KHZ = 3;
    }
}

namespace Swf\DefineSoundBody {
    class Bps {
        const SOUND_8_BIT = 0;
        const SOUND_16_BIT = 1;
    }
}

namespace Swf\DefineSoundBody {
    class Channels {
        const MONO = 0;
        const STEREO = 1;
    }
}

namespace Swf {
    class RecordHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Swf\Tag $_parent = null, \Swf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_tagCodeAndLength = $this->_io->readU2le();
            if ($this->smallLen() == 63) {
                $this->_m_bigLen = $this->_io->readS4le();
            }
        }
        protected $_m_tagType;
        public function tagType() {
            if ($this->_m_tagType !== null)
                return $this->_m_tagType;
            $this->_m_tagType = ($this->tagCodeAndLength() >> 6);
            return $this->_m_tagType;
        }
        protected $_m_smallLen;
        public function smallLen() {
            if ($this->_m_smallLen !== null)
                return $this->_m_smallLen;
            $this->_m_smallLen = ($this->tagCodeAndLength() & 63);
            return $this->_m_smallLen;
        }
        protected $_m_len;
        public function len() {
            if ($this->_m_len !== null)
                return $this->_m_len;
            $this->_m_len = ($this->smallLen() == 63 ? $this->bigLen() : $this->smallLen());
            return $this->_m_len;
        }
        protected $_m_tagCodeAndLength;
        protected $_m_bigLen;
        public function tagCodeAndLength() { return $this->_m_tagCodeAndLength; }
        public function bigLen() { return $this->_m_bigLen; }
    }
}

namespace Swf {
    class ScriptLimitsBody extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Swf\Tag $_parent = null, \Swf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_maxRecursionDepth = $this->_io->readU2le();
            $this->_m_scriptTimeoutSeconds = $this->_io->readU2le();
        }
        protected $_m_maxRecursionDepth;
        protected $_m_scriptTimeoutSeconds;
        public function maxRecursionDepth() { return $this->_m_maxRecursionDepth; }
        public function scriptTimeoutSeconds() { return $this->_m_scriptTimeoutSeconds; }
    }
}

namespace Swf {
    class Compressions {
        const ZLIB = 67;
        const NONE = 70;
        const LZMA = 90;
    }
}

namespace Swf {
    class TagType {
        const END_OF_FILE = 0;
        const PLACE_OBJECT = 4;
        const REMOVE_OBJECT = 5;
        const SET_BACKGROUND_COLOR = 9;
        const DEFINE_SOUND = 14;
        const PLACE_OBJECT2 = 26;
        const REMOVE_OBJECT2 = 28;
        const FRAME_LABEL = 43;
        const EXPORT_ASSETS = 56;
        const SCRIPT_LIMITS = 65;
        const FILE_ATTRIBUTES = 69;
        const PLACE_OBJECT3 = 70;
        const SYMBOL_CLASS = 76;
        const METADATA = 77;
        const DEFINE_SCALING_GRID = 78;
        const DO_ABC = 82;
        const DEFINE_SCENE_AND_FRAME_LABEL_DATA = 86;
    }
}
