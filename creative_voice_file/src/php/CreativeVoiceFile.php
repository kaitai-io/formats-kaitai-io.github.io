<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Creative Voice File is a container file format for digital audio
 * wave data. Initial revisions were able to support only unsigned
 * 8-bit PCM and ADPCM data, later versions were revised to add support
 * for 16-bit PCM and a-law / u-law formats.
 * 
 * This format was actively used in 1990s, around the advent of
 * Creative's sound cards (Sound Blaster family). It was a popular
 * choice for a digital sound container in lots of games and multimedia
 * software due to simplicity and availability of Creative's recording
 * / editing tools.
 */

class CreativeVoiceFile extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \CreativeVoiceFile $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x43\x72\x65\x61\x74\x69\x76\x65\x20\x56\x6F\x69\x63\x65\x20\x46\x69\x6C\x65\x1A");
        $this->_m_headerSize = $this->_io->readU2le();
        $this->_m_version = $this->_io->readU2le();
        $this->_m_checksum = $this->_io->readU2le();
        $this->_m_blocks = [];
        while (!$this->_io->isEof()) {
            $this->_m_blocks[] = new \CreativeVoiceFile\Block($this->_io, $this, $this->_root);
        }
    }
    protected $_m_magic;
    protected $_m_headerSize;
    protected $_m_version;
    protected $_m_checksum;
    protected $_m_blocks;
    public function magic() { return $this->_m_magic; }

    /**
     * Total size of this main header (usually 0x001A)
     */
    public function headerSize() { return $this->_m_headerSize; }
    public function version() { return $this->_m_version; }

    /**
     * Checksum: this must be equal to ~version + 0x1234
     */
    public function checksum() { return $this->_m_checksum; }

    /**
     * Series of blocks that contain the actual audio data
     */
    public function blocks() { return $this->_m_blocks; }
}

namespace \CreativeVoiceFile;

class BlockMarker extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \CreativeVoiceFile\Block $parent = null, \CreativeVoiceFile $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_markerId = $this->_io->readU2le();
    }
    protected $_m_markerId;

    /**
     * Marker ID
     */
    public function markerId() { return $this->_m_markerId; }
}

namespace \CreativeVoiceFile;

class BlockSilence extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \CreativeVoiceFile\Block $parent = null, \CreativeVoiceFile $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_durationSamples = $this->_io->readU2le();
        $this->_m_freqDiv = $this->_io->readU1();
    }
    protected $_m_sampleRate;
    public function sampleRate() {
        if ($this->_m_sampleRate !== null)
            return $this->_m_sampleRate;
        $this->_m_sampleRate = (1000000.0 / (256 - $this->freqDiv()));
        return $this->_m_sampleRate;
    }
    protected $_m_durationSec;

    /**
     * Duration of silence, in seconds
     */
    public function durationSec() {
        if ($this->_m_durationSec !== null)
            return $this->_m_durationSec;
        $this->_m_durationSec = ($this->durationSamples() / $this->sampleRate());
        return $this->_m_durationSec;
    }
    protected $_m_durationSamples;
    protected $_m_freqDiv;

    /**
     * Duration of silence, in samples
     */
    public function durationSamples() { return $this->_m_durationSamples; }

    /**
     * Frequency divisor, used to determine sample rate
     */
    public function freqDiv() { return $this->_m_freqDiv; }
}

namespace \CreativeVoiceFile;

class BlockSoundDataNew extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \CreativeVoiceFile\Block $parent = null, \CreativeVoiceFile $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_sampleRate = $this->_io->readU4le();
        $this->_m_bitsPerSample = $this->_io->readU1();
        $this->_m_numChannels = $this->_io->readU1();
        $this->_m_codec = $this->_io->readU2le();
        $this->_m_reserved = $this->_io->readBytes(4);
        $this->_m_wave = $this->_io->readBytesFull();
    }
    protected $_m_sampleRate;
    protected $_m_bitsPerSample;
    protected $_m_numChannels;
    protected $_m_codec;
    protected $_m_reserved;
    protected $_m_wave;
    public function sampleRate() { return $this->_m_sampleRate; }
    public function bitsPerSample() { return $this->_m_bitsPerSample; }
    public function numChannels() { return $this->_m_numChannels; }
    public function codec() { return $this->_m_codec; }
    public function reserved() { return $this->_m_reserved; }
    public function wave() { return $this->_m_wave; }
}

namespace \CreativeVoiceFile;

class Block extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \CreativeVoiceFile $parent = null, \CreativeVoiceFile $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_blockType = $this->_io->readU1();
        if ($this->blockType() != \CreativeVoiceFile\BlockTypes::TERMINATOR) {
            $this->_m_bodySize1 = $this->_io->readU2le();
        }
        if ($this->blockType() != \CreativeVoiceFile\BlockTypes::TERMINATOR) {
            $this->_m_bodySize2 = $this->_io->readU1();
        }
        if ($this->blockType() != \CreativeVoiceFile\BlockTypes::TERMINATOR) {
            switch ($this->blockType()) {
                case \CreativeVoiceFile\BlockTypes::SILENCE:
                    $this->_m__raw_body = $this->_io->readBytes($this->bodySize());
                    $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \CreativeVoiceFile\BlockSilence($io, $this, $this->_root);
                    break;
                case \CreativeVoiceFile\BlockTypes::SOUND_DATA:
                    $this->_m__raw_body = $this->_io->readBytes($this->bodySize());
                    $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \CreativeVoiceFile\BlockSoundData($io, $this, $this->_root);
                    break;
                case \CreativeVoiceFile\BlockTypes::MARKER:
                    $this->_m__raw_body = $this->_io->readBytes($this->bodySize());
                    $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \CreativeVoiceFile\BlockMarker($io, $this, $this->_root);
                    break;
                case \CreativeVoiceFile\BlockTypes::SOUND_DATA_NEW:
                    $this->_m__raw_body = $this->_io->readBytes($this->bodySize());
                    $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \CreativeVoiceFile\BlockSoundDataNew($io, $this, $this->_root);
                    break;
                case \CreativeVoiceFile\BlockTypes::REPEAT_START:
                    $this->_m__raw_body = $this->_io->readBytes($this->bodySize());
                    $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \CreativeVoiceFile\BlockRepeatStart($io, $this, $this->_root);
                    break;
                case \CreativeVoiceFile\BlockTypes::EXTRA_INFO:
                    $this->_m__raw_body = $this->_io->readBytes($this->bodySize());
                    $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \CreativeVoiceFile\BlockExtraInfo($io, $this, $this->_root);
                    break;
                default:
                    $this->_m_body = $this->_io->readBytes($this->bodySize());
                    break;
            }
        }
    }
    protected $_m_bodySize;

    /**
     * body_size is a 24-bit little-endian integer, so we're
     * emulating that by adding two standard-sized integers
     * (body_size1 and body_size2).
     */
    public function bodySize() {
        if ($this->_m_bodySize !== null)
            return $this->_m_bodySize;
        if ($this->blockType() != \CreativeVoiceFile\BlockTypes::TERMINATOR) {
            $this->_m_bodySize = ($this->bodySize1() + ($this->bodySize2() << 16));
        }
        return $this->_m_bodySize;
    }
    protected $_m_blockType;
    protected $_m_bodySize1;
    protected $_m_bodySize2;
    protected $_m_body;
    protected $_m__raw_body;

    /**
     * Byte that determines type of block content
     */
    public function blockType() { return $this->_m_blockType; }
    public function bodySize1() { return $this->_m_bodySize1; }
    public function bodySize2() { return $this->_m_bodySize2; }

    /**
     * Block body, type depends on block type byte
     */
    public function body() { return $this->_m_body; }
    public function _raw_body() { return $this->_m__raw_body; }
}

namespace \CreativeVoiceFile;

class BlockRepeatStart extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \CreativeVoiceFile\Block $parent = null, \CreativeVoiceFile $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_repeatCount1 = $this->_io->readU2le();
    }
    protected $_m_repeatCount1;

    /**
     * Number of repetitions minus 1; 0xffff means infinite repetitions
     */
    public function repeatCount1() { return $this->_m_repeatCount1; }
}

namespace \CreativeVoiceFile;

class BlockSoundData extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \CreativeVoiceFile\Block $parent = null, \CreativeVoiceFile $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_freqDiv = $this->_io->readU1();
        $this->_m_codec = $this->_io->readU1();
        $this->_m_wave = $this->_io->readBytesFull();
    }
    protected $_m_sampleRate;
    public function sampleRate() {
        if ($this->_m_sampleRate !== null)
            return $this->_m_sampleRate;
        $this->_m_sampleRate = (1000000.0 / (256 - $this->freqDiv()));
        return $this->_m_sampleRate;
    }
    protected $_m_freqDiv;
    protected $_m_codec;
    protected $_m_wave;

    /**
     * Frequency divisor, used to determine sample rate
     */
    public function freqDiv() { return $this->_m_freqDiv; }
    public function codec() { return $this->_m_codec; }
    public function wave() { return $this->_m_wave; }
}

namespace \CreativeVoiceFile;

class BlockExtraInfo extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \CreativeVoiceFile\Block $parent = null, \CreativeVoiceFile $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_freqDiv = $this->_io->readU2le();
        $this->_m_codec = $this->_io->readU1();
        $this->_m_numChannels1 = $this->_io->readU1();
    }
    protected $_m_numChannels;

    /**
     * Number of channels (1 = mono, 2 = stereo)
     */
    public function numChannels() {
        if ($this->_m_numChannels !== null)
            return $this->_m_numChannels;
        $this->_m_numChannels = ($this->numChannels1() + 1);
        return $this->_m_numChannels;
    }
    protected $_m_sampleRate;
    public function sampleRate() {
        if ($this->_m_sampleRate !== null)
            return $this->_m_sampleRate;
        $this->_m_sampleRate = (256000000.0 / ($this->numChannels() * (65536 - $this->freqDiv())));
        return $this->_m_sampleRate;
    }
    protected $_m_freqDiv;
    protected $_m_codec;
    protected $_m_numChannels1;

    /**
     * Frequency divisor
     */
    public function freqDiv() { return $this->_m_freqDiv; }
    public function codec() { return $this->_m_codec; }

    /**
     * Number of channels minus 1 (0 = mono, 1 = stereo)
     */
    public function numChannels1() { return $this->_m_numChannels1; }
}

namespace \CreativeVoiceFile;

class BlockTypes {
    const TERMINATOR = 0;
    const SOUND_DATA = 1;
    const SOUND_DATA_CONT = 2;
    const SILENCE = 3;
    const MARKER = 4;
    const TEXT = 5;
    const REPEAT_START = 6;
    const REPEAT_END = 7;
    const EXTRA_INFO = 8;
    const SOUND_DATA_NEW = 9;
}

namespace \CreativeVoiceFile;

class Codecs {
    const PCM_8BIT_UNSIGNED = 0;
    const ADPCM_4BIT = 1;
    const ADPCM_2_6BIT = 2;
    const ADPCM_2_BIT = 3;
    const PCM_16BIT_SIGNED = 4;
    const ALAW = 6;
    const ULAW = 7;
    const ADPCM_4_TO_16BIT = 512;
}
