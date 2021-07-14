<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * The NeXT/Sun audio file format.
 * 
 * Sample files:
 * 
 * * <https://github.com/python/cpython/tree/b8a7daf077da/Lib/test/sndhdrdata>
 * * <ftp://ftp-ccrma.stanford.edu/pub/Lisp/sf.tar.gz>
 * * <http://www-mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/Samples.html>
 */

namespace {
    class Au extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Au $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->magic() == "\x2E\x73\x6E\x64")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x2E\x73\x6E\x64", $this->magic(), $this->_io(), "/seq/0");
            }
            $this->_m_ofsData = $this->_io->readU4be();
            $this->_m__raw_header = $this->_io->readBytes((($this->ofsData() - 4) - 4));
            $_io__raw_header = new \Kaitai\Struct\Stream($this->_m__raw_header);
            $this->_m_header = new \Au\Header($_io__raw_header, $this, $this->_root);
        }
        protected $_m_lenData;
        public function lenData() {
            if ($this->_m_lenData !== null)
                return $this->_m_lenData;
            $this->_m_lenData = ($this->header()->dataSize() == 4294967295 ? ($this->_io()->size() - $this->ofsData()) : $this->header()->dataSize());
            return $this->_m_lenData;
        }
        protected $_m_magic;
        protected $_m_ofsData;
        protected $_m_header;
        protected $_m__raw_header;
        public function magic() { return $this->_m_magic; }
        public function ofsData() { return $this->_m_ofsData; }
        public function header() { return $this->_m_header; }
        public function _raw_header() { return $this->_m__raw_header; }
    }
}

namespace Au {
    class Header extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Au $_parent = null, \Au $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_dataSize = $this->_io->readU4be();
            $this->_m_encoding = $this->_io->readU4be();
            $this->_m_sampleRate = $this->_io->readU4be();
            $this->_m_numChannels = $this->_io->readU4be();
            if (!($this->numChannels() >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->numChannels(), $this->_io(), "/types/header/seq/3");
            }
            $this->_m_comment = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytesFull(), 0, false), "ASCII");
        }
        protected $_m_dataSize;
        protected $_m_encoding;
        protected $_m_sampleRate;
        protected $_m_numChannels;
        protected $_m_comment;

        /**
         * don't read this field, access `_root.len_data` instead
         * 
         * value `0xffff_ffff` means unspecified size
         */
        public function dataSize() { return $this->_m_dataSize; }
        public function encoding() { return $this->_m_encoding; }
        public function sampleRate() { return $this->_m_sampleRate; }

        /**
         * number of interleaved channels
         */
        public function numChannels() { return $this->_m_numChannels; }

        /**
         * Most resources claim that this field must be at least 4 bytes long.
         * However, most programs don't enforce it, and [Audacity](
         * https://www.audacityteam.org/) even generates .au files with this field
         * being 0-byte long. According to <https://nixdoc.net/man-pages/IRIX/man4/dmedia/next.4.html>,
         * "NeXT files require that this chunk be at least 4 bytes (chars) long,
         * whereas this chunk may be zerolength in a Sun .au file."
         * 
         * By convention, size should be a multiple of 4 -
         * see <https://github.com/chirlu/sox/blob/dd8b63bd/src/au.c#L132-L133>.
         * Page <http://soundfile.sapp.org/doc/NextFormat/> also mentions that for some
         * sound playing programs, this field must have an even byte size. So a multiple
         * of 4 is probably best for compatibility.
         * 
         * Must be null-terminated. It is usually an ASCII text string, but this space
         * might be also used to store application-specific binary (i.e. non-ASCII) data.
         */
        public function comment() { return $this->_m_comment; }
    }
}

namespace Au {
    class Encodings {

        /**
         * 8-bit G.711 mu-law
         */
        const MULAW_8 = 1;

        /**
         * 8-bit signed linear PCM
         */
        const LINEAR_8 = 2;

        /**
         * 16-bit signed linear PCM
         */
        const LINEAR_16 = 3;

        /**
         * 24-bit signed linear PCM
         */
        const LINEAR_24 = 4;

        /**
         * 32-bit signed linear PCM
         */
        const LINEAR_32 = 5;

        /**
         * 32-bit IEEE floating point
         */
        const FLOAT = 6;

        /**
         * 64-bit IEEE double-precision floating point
         */
        const DOUBLE = 7;

        /**
         * sampled data which has become fragmented due to editing
         */
        const FRAGMENTED = 8;

        /**
         * multiple sound structures
         */
        const NESTED = 9;

        /**
         * a loadable DSP core program
         */
        const DSP_CORE = 10;
        const FIXED_POINT_8 = 11;
        const FIXED_POINT_16 = 12;
        const FIXED_POINT_24 = 13;
        const FIXED_POINT_32 = 14;

        /**
         * non-audio display data used by the Sound Kit's `SoundView` class, can't be played
         */
        const DISPLAY = 16;

        /**
         * 8-bit mu-law with run-length encoding of silence
         */
        const MULAW_SQUELCH = 17;

        /**
         * 16-bit linear with emphasis
         */
        const EMPHASIZED = 18;

        /**
         * 16-bit linear with NeXT compression
         */
        const COMPRESSED = 19;

        /**
         * 16-bit linear with emphasis and NeXT compression
         */
        const COMPRESSED_EMPHASIZED = 20;

        /**
         * Music Kit DSP commands
         */
        const DSP_COMMANDS = 21;

        /**
         * Music Kit DSP samples
         */
        const DSP_COMMANDS_SAMPLES = 22;

        /**
         * 4-bit G.721 ADPCM (32 kb/s)
         */
        const ADPCM_G721 = 23;

        /**
         * G.722 ADPCM
         */
        const ADPCM_G722 = 24;

        /**
         * 3-bit G.723 ADPCM (24 kb/s)
         */
        const ADPCM_G723_3 = 25;

        /**
         * 5-bit G.723 ADPCM (40 kb/s)
         */
        const ADPCM_G723_5 = 26;

        /**
         * 8-bit G.711 A-law
         */
        const ALAW_8 = 27;
        const AES = 28;
        const DELTA_MULAW_8 = 29;
    }
}
