<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Scream Tracker 3 module is a tracker music file format that, as all
 * tracker music, bundles both sound samples and instructions on which
 * notes to play. It originates from a Scream Tracker 3 music editor
 * (1994) by Future Crew, derived from original Scream Tracker 2 (.stm)
 * module format.
 * 
 * Instrument descriptions in S3M format allow to use either digital
 * samples or setup and control AdLib (OPL2) synth.
 * 
 * Music is organized in so called `patterns`. "Pattern" is a generally
 * a 64-row long table, which instructs which notes to play on which
 * time measure. "Patterns" are played one-by-one in a sequence
 * determined by `orders`, which is essentially an array of pattern IDs
 * - this way it's possible to reuse certain patterns more than once
 * for repetitive musical phrases.
 */

class S3m extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \S3m $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_songName = \Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(28), 0, false);
        $this->_m_magic1 = $this->_io->ensureFixedContents("\x1A");
        $this->_m_fileType = $this->_io->readU1();
        $this->_m_reserved1 = $this->_io->readBytes(2);
        $this->_m_numOrders = $this->_io->readU2le();
        $this->_m_numInstruments = $this->_io->readU2le();
        $this->_m_numPatterns = $this->_io->readU2le();
        $this->_m_flags = $this->_io->readU2le();
        $this->_m_version = $this->_io->readU2le();
        $this->_m_samplesFormat = $this->_io->readU2le();
        $this->_m_magic2 = $this->_io->ensureFixedContents("\x53\x43\x52\x4D");
        $this->_m_globalVolume = $this->_io->readU1();
        $this->_m_initialSpeed = $this->_io->readU1();
        $this->_m_initialTempo = $this->_io->readU1();
        $this->_m_isStereo = $this->_io->readBitsInt(1) != 0;
        $this->_m_masterVolume = $this->_io->readBitsInt(7);
        $this->_io->alignToByte();
        $this->_m_ultraClickRemoval = $this->_io->readU1();
        $this->_m_hasCustomPan = $this->_io->readU1();
        $this->_m_reserved2 = $this->_io->readBytes(8);
        $this->_m_ofsSpecial = $this->_io->readU2le();
        $this->_m_channels = [];
        $n = 32;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_channels[] = new \S3m\Channel($this->_io, $this, $this->_root);
        }
        $this->_m_orders = $this->_io->readBytes($this->numOrders());
        $this->_m_instruments = [];
        $n = $this->numInstruments();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_instruments[] = new \S3m\InstrumentPtr($this->_io, $this, $this->_root);
        }
        $this->_m_patterns = [];
        $n = $this->numPatterns();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_patterns[] = new \S3m\PatternPtr($this->_io, $this, $this->_root);
        }
        if ($this->hasCustomPan() == 252) {
            $this->_m_channelPans = [];
            $n = 32;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_channelPans[] = new \S3m\ChannelPan($this->_io, $this, $this->_root);
            }
        }
    }
    protected $_m_songName;
    protected $_m_magic1;
    protected $_m_fileType;
    protected $_m_reserved1;
    protected $_m_numOrders;
    protected $_m_numInstruments;
    protected $_m_numPatterns;
    protected $_m_flags;
    protected $_m_version;
    protected $_m_samplesFormat;
    protected $_m_magic2;
    protected $_m_globalVolume;
    protected $_m_initialSpeed;
    protected $_m_initialTempo;
    protected $_m_isStereo;
    protected $_m_masterVolume;
    protected $_m_ultraClickRemoval;
    protected $_m_hasCustomPan;
    protected $_m_reserved2;
    protected $_m_ofsSpecial;
    protected $_m_channels;
    protected $_m_orders;
    protected $_m_instruments;
    protected $_m_patterns;
    protected $_m_channelPans;
    public function songName() { return $this->_m_songName; }
    public function magic1() { return $this->_m_magic1; }
    public function fileType() { return $this->_m_fileType; }
    public function reserved1() { return $this->_m_reserved1; }

    /**
     * Number of orders in a song
     */
    public function numOrders() { return $this->_m_numOrders; }

    /**
     * Number of instruments in a song
     */
    public function numInstruments() { return $this->_m_numInstruments; }

    /**
     * Number of patterns in a song
     */
    public function numPatterns() { return $this->_m_numPatterns; }
    public function flags() { return $this->_m_flags; }

    /**
     * Scream Tracker version that was used to save this file
     */
    public function version() { return $this->_m_version; }

    /**
     * 1 = signed samples, 2 = unsigned samples
     */
    public function samplesFormat() { return $this->_m_samplesFormat; }
    public function magic2() { return $this->_m_magic2; }
    public function globalVolume() { return $this->_m_globalVolume; }
    public function initialSpeed() { return $this->_m_initialSpeed; }
    public function initialTempo() { return $this->_m_initialTempo; }
    public function isStereo() { return $this->_m_isStereo; }
    public function masterVolume() { return $this->_m_masterVolume; }
    public function ultraClickRemoval() { return $this->_m_ultraClickRemoval; }
    public function hasCustomPan() { return $this->_m_hasCustomPan; }
    public function reserved2() { return $this->_m_reserved2; }

    /**
     * Offset of special data, not used by Scream Tracker directly.
     */
    public function ofsSpecial() { return $this->_m_ofsSpecial; }
    public function channels() { return $this->_m_channels; }
    public function orders() { return $this->_m_orders; }
    public function instruments() { return $this->_m_instruments; }
    public function patterns() { return $this->_m_patterns; }
    public function channelPans() { return $this->_m_channelPans; }
}

namespace \S3m;

class ChannelPan extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \S3m $parent = null, \S3m $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_reserved1 = $this->_io->readBitsInt(2);
        $this->_m_hasCustomPan = $this->_io->readBitsInt(1) != 0;
        $this->_m_reserved2 = $this->_io->readBitsInt(1) != 0;
        $this->_m_pan = $this->_io->readBitsInt(4);
    }
    protected $_m_reserved1;
    protected $_m_hasCustomPan;
    protected $_m_reserved2;
    protected $_m_pan;
    public function reserved1() { return $this->_m_reserved1; }

    /**
     * If true, then use a custom pan setting provided in the `pan`
     * field. If false, the channel would use the default setting
     * (0x7 for mono, 0x3 or 0xc for stereo).
     */
    public function hasCustomPan() { return $this->_m_hasCustomPan; }
    public function reserved2() { return $this->_m_reserved2; }
    public function pan() { return $this->_m_pan; }
}

namespace \S3m;

class PatternCell extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \S3m\PatternCells $parent = null, \S3m $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_hasFx = $this->_io->readBitsInt(1) != 0;
        $this->_m_hasVolume = $this->_io->readBitsInt(1) != 0;
        $this->_m_hasNoteAndInstrument = $this->_io->readBitsInt(1) != 0;
        $this->_m_channelNum = $this->_io->readBitsInt(5);
        $this->_io->alignToByte();
        if ($this->hasNoteAndInstrument()) {
            $this->_m_note = $this->_io->readU1();
        }
        if ($this->hasNoteAndInstrument()) {
            $this->_m_instrument = $this->_io->readU1();
        }
        if ($this->hasVolume()) {
            $this->_m_volume = $this->_io->readU1();
        }
        if ($this->hasFx()) {
            $this->_m_fxType = $this->_io->readU1();
        }
        if ($this->hasFx()) {
            $this->_m_fxValue = $this->_io->readU1();
        }
    }
    protected $_m_hasFx;
    protected $_m_hasVolume;
    protected $_m_hasNoteAndInstrument;
    protected $_m_channelNum;
    protected $_m_note;
    protected $_m_instrument;
    protected $_m_volume;
    protected $_m_fxType;
    protected $_m_fxValue;
    public function hasFx() { return $this->_m_hasFx; }
    public function hasVolume() { return $this->_m_hasVolume; }
    public function hasNoteAndInstrument() { return $this->_m_hasNoteAndInstrument; }
    public function channelNum() { return $this->_m_channelNum; }
    public function note() { return $this->_m_note; }
    public function instrument() { return $this->_m_instrument; }
    public function volume() { return $this->_m_volume; }
    public function fxType() { return $this->_m_fxType; }
    public function fxValue() { return $this->_m_fxValue; }
}

namespace \S3m;

class PatternCells extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \S3m\Pattern $parent = null, \S3m $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_cells = [];
        while (!$this->_io->isEof()) {
            $this->_m_cells[] = new \S3m\PatternCell($this->_io, $this, $this->_root);
        }
    }
    protected $_m_cells;
    public function cells() { return $this->_m_cells; }
}

namespace \S3m;

class Channel extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \S3m $parent = null, \S3m $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_isDisabled = $this->_io->readBitsInt(1) != 0;
        $this->_m_chType = $this->_io->readBitsInt(7);
    }
    protected $_m_isDisabled;
    protected $_m_chType;
    public function isDisabled() { return $this->_m_isDisabled; }

    /**
     * Channel type (0..7 = left sample channels, 8..15 = right sample channels, 16..31 = AdLib synth channels)
     */
    public function chType() { return $this->_m_chType; }
}

/**
 * Custom 3-byte integer, stored in mixed endian manner.
 */

namespace \S3m;

class SwappedU3 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \S3m\Instrument\Sampled $parent = null, \S3m $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_hi = $this->_io->readU1();
        $this->_m_lo = $this->_io->readU2le();
    }
    protected $_m_value;
    public function value() {
        if ($this->_m_value !== null)
            return $this->_m_value;
        $this->_m_value = ($this->lo() | ($this->hi() << 16));
        return $this->_m_value;
    }
    protected $_m_hi;
    protected $_m_lo;
    public function hi() { return $this->_m_hi; }
    public function lo() { return $this->_m_lo; }
}

namespace \S3m;

class Pattern extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \S3m\PatternPtr $parent = null, \S3m $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_size = $this->_io->readU2le();
        $this->_m__raw_body = $this->_io->readBytes(($this->size() - 2));
        $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
        $this->_m_body = new \S3m\PatternCells($io, $this, $this->_root);
    }
    protected $_m_size;
    protected $_m_body;
    protected $_m__raw_body;
    public function size() { return $this->_m_size; }
    public function body() { return $this->_m_body; }
    public function _raw_body() { return $this->_m__raw_body; }
}

namespace \S3m;

class PatternPtr extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \S3m $parent = null, \S3m $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_paraptr = $this->_io->readU2le();
    }
    protected $_m_body;
    public function body() {
        if ($this->_m_body !== null)
            return $this->_m_body;
        $_pos = $this->_io->pos();
        $this->_io->seek(($this->paraptr() * 16));
        $this->_m_body = new \S3m\Pattern($this->_io, $this, $this->_root);
        $this->_io->seek($_pos);
        return $this->_m_body;
    }
    protected $_m_paraptr;
    public function paraptr() { return $this->_m_paraptr; }
}

namespace \S3m;

class InstrumentPtr extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \S3m $parent = null, \S3m $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_paraptr = $this->_io->readU2le();
    }
    protected $_m_body;
    public function body() {
        if ($this->_m_body !== null)
            return $this->_m_body;
        $_pos = $this->_io->pos();
        $this->_io->seek(($this->paraptr() * 16));
        $this->_m_body = new \S3m\Instrument($this->_io, $this, $this->_root);
        $this->_io->seek($_pos);
        return $this->_m_body;
    }
    protected $_m_paraptr;
    public function paraptr() { return $this->_m_paraptr; }
}

namespace \S3m;

class Instrument extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \S3m\InstrumentPtr $parent = null, \S3m $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_type = $this->_io->readU1();
        $this->_m_filename = \Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(12), 0, false);
        switch ($this->type()) {
            case \S3m\Instrument\InstTypes::SAMPLE:
                $this->_m_body = new \S3m\Instrument\Sampled($this->_io, $this, $this->_root);
                break;
            default:
                $this->_m_body = new \S3m\Instrument\Adlib($this->_io, $this, $this->_root);
                break;
        }
        $this->_m_tuningHz = $this->_io->readU4le();
        $this->_m_reserved2 = $this->_io->readBytes(12);
        $this->_m_sampleName = \Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(28), 0, false);
        $this->_m_magic = $this->_io->ensureFixedContents("\x53\x43\x52\x53");
    }
    protected $_m_type;
    protected $_m_filename;
    protected $_m_body;
    protected $_m_tuningHz;
    protected $_m_reserved2;
    protected $_m_sampleName;
    protected $_m_magic;
    public function type() { return $this->_m_type; }
    public function filename() { return $this->_m_filename; }
    public function body() { return $this->_m_body; }
    public function tuningHz() { return $this->_m_tuningHz; }
    public function reserved2() { return $this->_m_reserved2; }
    public function sampleName() { return $this->_m_sampleName; }
    public function magic() { return $this->_m_magic; }
}

namespace \S3m\Instrument;

class Sampled extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \S3m\Instrument $parent = null, \S3m $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_paraptrSample = new \S3m\SwappedU3($this->_io, $this, $this->_root);
        $this->_m_lenSample = $this->_io->readU4le();
        $this->_m_loopBegin = $this->_io->readU4le();
        $this->_m_loopEnd = $this->_io->readU4le();
        $this->_m_defaultVolume = $this->_io->readU1();
        $this->_m_reserved1 = $this->_io->readU1();
        $this->_m_isPacked = $this->_io->readU1();
        $this->_m_flags = $this->_io->readU1();
    }
    protected $_m_sample;
    public function sample() {
        if ($this->_m_sample !== null)
            return $this->_m_sample;
        $_pos = $this->_io->pos();
        $this->_io->seek(($this->paraptrSample()->value() * 16));
        $this->_m_sample = $this->_io->readBytes($this->lenSample());
        $this->_io->seek($_pos);
        return $this->_m_sample;
    }
    protected $_m_paraptrSample;
    protected $_m_lenSample;
    protected $_m_loopBegin;
    protected $_m_loopEnd;
    protected $_m_defaultVolume;
    protected $_m_reserved1;
    protected $_m_isPacked;
    protected $_m_flags;
    public function paraptrSample() { return $this->_m_paraptrSample; }
    public function lenSample() { return $this->_m_lenSample; }
    public function loopBegin() { return $this->_m_loopBegin; }
    public function loopEnd() { return $this->_m_loopEnd; }

    /**
     * Default volume
     */
    public function defaultVolume() { return $this->_m_defaultVolume; }
    public function reserved1() { return $this->_m_reserved1; }

    /**
     * 0 = unpacked, 1 = DP30ADPCM packing
     */
    public function isPacked() { return $this->_m_isPacked; }
    public function flags() { return $this->_m_flags; }
}

namespace \S3m\Instrument;

class Adlib extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \S3m\Instrument $parent = null, \S3m $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_reserved1 = $this->_io->ensureFixedContents("\x00\x00\x00");
        $this->_m__unnamed1 = $this->_io->readBytes(16);
    }
    protected $_m_reserved1;
    protected $_m__unnamed1;
    public function reserved1() { return $this->_m_reserved1; }
    public function _unnamed1() { return $this->_m__unnamed1; }
}

namespace \S3m\Instrument;

class InstTypes {
    const SAMPLE = 1;
    const MELODIC = 2;
    const BASS_DRUM = 3;
    const SNARE_DRUM = 4;
    const TOM = 5;
    const CYMBAL = 6;
    const HIHAT = 7;
}
