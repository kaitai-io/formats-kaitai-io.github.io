<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Sound resources were introduced in Classic MacOS with the Sound Manager program.
 * They can contain sound commands to generate sounds with given frequencies as well as sampled sound data.
 * They are mostly found in resource forks, but can occasionally appear standalone or embedded in other files.
 */

namespace {
    class MacOsResourceSnd extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\MacOsResourceSnd $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_format = $this->_io->readU2be();
            if ($this->format() == 1) {
                $this->_m_numDataFormats = $this->_io->readU2be();
            }
            if ($this->format() == 1) {
                $this->_m_dataFormats = [];
                $n = $this->numDataFormats();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_dataFormats[] = new \MacOsResourceSnd\DataFormat($this->_io, $this, $this->_root);
                }
            }
            if ($this->format() == 2) {
                $this->_m_referenceCount = $this->_io->readU2be();
            }
            $this->_m_numSoundCommands = $this->_io->readU2be();
            $this->_m_soundCommands = [];
            $n = $this->numSoundCommands();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_soundCommands[] = new \MacOsResourceSnd\SoundCommand($this->_io, $this, $this->_root);
            }
        }
        protected $_m_midiNoteToFrequency;

        /**
         * Lookup table to convert a MIDI note into a frequency in Hz
         * The lookup table represents the formula (2 ** ((midi_note - 69) / 12)) * 440
         */
        public function midiNoteToFrequency() {
            if ($this->_m_midiNoteToFrequency !== null)
                return $this->_m_midiNoteToFrequency;
            $this->_m_midiNoteToFrequency = [8.18, 8.66, 9.18, 9.72, 10.30, 10.91, 11.56, 12.25, 12.98, 13.75, 14.57, 15.43, 16.35, 17.32, 18.35, 19.45, 20.60, 21.83, 23.12, 24.50, 25.96, 27.50, 29.14, 30.87, 32.70, 34.65, 36.71, 38.89, 41.20, 43.65, 46.25, 49.00, 51.91, 55.00, 58.27, 61.74, 65.41, 69.30, 73.42, 77.78, 82.41, 87.31, 92.50, 98.00, 103.83, 110.00, 116.54, 123.47, 130.81, 138.59, 146.83, 155.56, 164.81, 174.61, 185.00, 196.00, 207.65, 220.00, 233.08, 246.94, 261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25, 554.37, 587.33, 622.25, 659.26, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77, 1046.50, 1108.73, 1174.66, 1244.51, 1318.51, 1396.91, 1479.98, 1567.98, 1661.22, 1760.00, 1864.66, 1975.53, 2093.00, 2217.46, 2349.32, 2489.02, 2637.02, 2793.83, 2959.96, 3135.96, 3322.44, 3520.00, 3729.31, 3951.07, 4186.01, 4434.92, 4698.64, 4978.03, 5274.04, 5587.65, 5919.91, 6271.93, 6644.88, 7040.00, 7458.62, 7902.13, 8372.02, 8869.84, 9397.27, 9956.06, 10548.08, 11175.30, 11839.82, 12543.85];
            return $this->_m_midiNoteToFrequency;
        }
        protected $_m_format;
        protected $_m_numDataFormats;
        protected $_m_dataFormats;
        protected $_m_referenceCount;
        protected $_m_numSoundCommands;
        protected $_m_soundCommands;
        public function format() { return $this->_m_format; }
        public function numDataFormats() { return $this->_m_numDataFormats; }
        public function dataFormats() { return $this->_m_dataFormats; }
        public function referenceCount() { return $this->_m_referenceCount; }
        public function numSoundCommands() { return $this->_m_numSoundCommands; }
        public function soundCommands() { return $this->_m_soundCommands; }
    }
}

namespace MacOsResourceSnd {
    class Compressed extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MacOsResourceSnd\ExtendedOrCompressed $_parent = null, ?\MacOsResourceSnd $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_format = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ASCII");
            $this->_m_reserved = $this->_io->readBytes(4);
            $this->_m_stateVarsPtr = $this->_io->readU4be();
            $this->_m_leftOverSamplesPtr = $this->_io->readU4be();
            $this->_m_compressionId = $this->_io->readS2be();
            $this->_m_packetSize = $this->_io->readU2be();
            $this->_m_synthesizerId = $this->_io->readU2be();
        }
        protected $_m_compressionType;
        public function compressionType() {
            if ($this->_m_compressionType !== null)
                return $this->_m_compressionType;
            $this->_m_compressionType = $this->compressionId();
            return $this->_m_compressionType;
        }
        protected $_m_format;
        protected $_m_reserved;
        protected $_m_stateVarsPtr;
        protected $_m_leftOverSamplesPtr;
        protected $_m_compressionId;
        protected $_m_packetSize;
        protected $_m_synthesizerId;

        /**
         * data format type
         */
        public function format() { return $this->_m_format; }
        public function reserved() { return $this->_m_reserved; }

        /**
         * pointer to StateBlock
         */
        public function stateVarsPtr() { return $this->_m_stateVarsPtr; }

        /**
         * pointer to LeftOverBlock
         */
        public function leftOverSamplesPtr() { return $this->_m_leftOverSamplesPtr; }

        /**
         * ID of compression algorithm
         */
        public function compressionId() { return $this->_m_compressionId; }

        /**
         * number of bits per packet
         */
        public function packetSize() { return $this->_m_packetSize; }

        /**
         * Latest Sound Manager documentation specifies this field as:
         * This field is unused. You should set it to 0.
         * Inside Macintosh (Volume VI, 1991) specifies it as:
         * Indicates the resource ID number of the 'snth' resource that was used to compress the packets contained in the compressed sound header.
         */
        public function synthesizerId() { return $this->_m_synthesizerId; }
    }
}

namespace MacOsResourceSnd {
    class DataFormat extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MacOsResourceSnd $_parent = null, ?\MacOsResourceSnd $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_id = $this->_io->readU2be();
            $this->_m_options = $this->_io->readU4be();
        }
        protected $_m_compInit;
        public function compInit() {
            if ($this->_m_compInit !== null)
                return $this->_m_compInit;
            $this->_m_compInit = $this->options() & $this->initCompMask();
            return $this->_m_compInit;
        }
        protected $_m_initCompMask;

        /**
         * mask for compression IDs
         */
        public function initCompMask() {
            if ($this->_m_initCompMask !== null)
                return $this->_m_initCompMask;
            $this->_m_initCompMask = 65280;
            return $this->_m_initCompMask;
        }
        protected $_m_initPanMask;

        /**
         * mask for right/left pan values
         */
        public function initPanMask() {
            if ($this->_m_initPanMask !== null)
                return $this->_m_initPanMask;
            $this->_m_initPanMask = 3;
            return $this->_m_initPanMask;
        }
        protected $_m_initStereoMask;

        /**
         * mask for mono/stereo values
         */
        public function initStereoMask() {
            if ($this->_m_initStereoMask !== null)
                return $this->_m_initStereoMask;
            $this->_m_initStereoMask = 192;
            return $this->_m_initStereoMask;
        }
        protected $_m_panInit;
        public function panInit() {
            if ($this->_m_panInit !== null)
                return $this->_m_panInit;
            $this->_m_panInit = $this->options() & $this->initPanMask();
            return $this->_m_panInit;
        }
        protected $_m_stereoInit;
        public function stereoInit() {
            if ($this->_m_stereoInit !== null)
                return $this->_m_stereoInit;
            $this->_m_stereoInit = $this->options() & $this->initStereoMask();
            return $this->_m_stereoInit;
        }
        protected $_m_waveInit;
        public function waveInit() {
            if ($this->_m_waveInit !== null)
                return $this->_m_waveInit;
            if ($this->id() == \MacOsResourceSnd\DataType::WAVE_TABLE_SYNTH) {
                $this->_m_waveInit = $this->options() & $this->waveInitChannelMask();
            }
            return $this->_m_waveInit;
        }
        protected $_m_waveInitChannelMask;

        /**
         * wave table only, Sound Manager 2.0 and earlier
         */
        public function waveInitChannelMask() {
            if ($this->_m_waveInitChannelMask !== null)
                return $this->_m_waveInitChannelMask;
            $this->_m_waveInitChannelMask = 7;
            return $this->_m_waveInitChannelMask;
        }
        protected $_m_id;
        protected $_m_options;
        public function id() { return $this->_m_id; }

        /**
         * contains initialisation options for the SndNewChannel function
         */
        public function options() { return $this->_m_options; }
    }
}

namespace MacOsResourceSnd {
    class Extended extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MacOsResourceSnd\ExtendedOrCompressed $_parent = null, ?\MacOsResourceSnd $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_instrumentChunkPtr = $this->_io->readU4be();
            $this->_m_aesRecordingPtr = $this->_io->readU4be();
        }
        protected $_m_instrumentChunkPtr;
        protected $_m_aesRecordingPtr;

        /**
         * pointer to instrument info
         */
        public function instrumentChunkPtr() { return $this->_m_instrumentChunkPtr; }

        /**
         * pointer to audio info
         */
        public function aesRecordingPtr() { return $this->_m_aesRecordingPtr; }
    }
}

namespace MacOsResourceSnd {
    class ExtendedOrCompressed extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MacOsResourceSnd\SoundHeader $_parent = null, ?\MacOsResourceSnd $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numFrames = $this->_io->readU4be();
            $this->_m_aiffSampleRate = $this->_io->readBytes(10);
            $this->_m_markerChunk = $this->_io->readU4be();
            if ($this->_parent()->soundHeaderType() == \MacOsResourceSnd\SoundHeaderType::EXTENDED) {
                $this->_m_extended = new \MacOsResourceSnd\Extended($this->_io, $this, $this->_root);
            }
            if ($this->_parent()->soundHeaderType() == \MacOsResourceSnd\SoundHeaderType::COMPRESSED) {
                $this->_m_compressed = new \MacOsResourceSnd\Compressed($this->_io, $this, $this->_root);
            }
            $this->_m_bitsPerSample = $this->_io->readU2be();
            if ($this->_parent()->soundHeaderType() == \MacOsResourceSnd\SoundHeaderType::EXTENDED) {
                $this->_m_reserved = $this->_io->readBytes(14);
            }
        }
        protected $_m_numFrames;
        protected $_m_aiffSampleRate;
        protected $_m_markerChunk;
        protected $_m_extended;
        protected $_m_compressed;
        protected $_m_bitsPerSample;
        protected $_m_reserved;
        public function numFrames() { return $this->_m_numFrames; }

        /**
         * rate of original sample (Extended80)
         */
        public function aiffSampleRate() { return $this->_m_aiffSampleRate; }

        /**
         * reserved
         */
        public function markerChunk() { return $this->_m_markerChunk; }
        public function extended() { return $this->_m_extended; }
        public function compressed() { return $this->_m_compressed; }

        /**
         * number of bits per sample
         */
        public function bitsPerSample() { return $this->_m_bitsPerSample; }

        /**
         * reserved
         */
        public function reserved() { return $this->_m_reserved; }
    }
}

namespace MacOsResourceSnd {
    class SoundCommand extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MacOsResourceSnd $_parent = null, ?\MacOsResourceSnd $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_isDataOffset = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_cmd = $this->_io->readBitsIntBe(15);
            $this->_io->alignToByte();
            $this->_m_param1 = $this->_io->readU2be();
            $this->_m_param2 = $this->_io->readU4be();
        }
        protected $_m_soundHeader;
        public function soundHeader() {
            if ($this->_m_soundHeader !== null)
                return $this->_m_soundHeader;
            if ( (($this->isDataOffset()) && ($this->cmd() == \MacOsResourceSnd\CmdType::BUFFER_CMD)) ) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->param2());
                $this->_m_soundHeader = new \MacOsResourceSnd\SoundHeader($this->_io, $this, $this->_root);
                $this->_io->seek($_pos);
            }
            return $this->_m_soundHeader;
        }
        protected $_m_isDataOffset;
        protected $_m_cmd;
        protected $_m_param1;
        protected $_m_param2;
        public function isDataOffset() { return $this->_m_isDataOffset; }
        public function cmd() { return $this->_m_cmd; }
        public function param1() { return $this->_m_param1; }
        public function param2() { return $this->_m_param2; }
    }
}

namespace MacOsResourceSnd {
    class SoundHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MacOsResourceSnd\SoundCommand $_parent = null, ?\MacOsResourceSnd $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            if ($this->startOfs() < 0) {
                $this->_m__unnamed0 = $this->_io->readBytes(0);
            }
            $this->_m_samplePtr = $this->_io->readU4be();
            if ($this->soundHeaderType() == \MacOsResourceSnd\SoundHeaderType::STANDARD) {
                $this->_m_numSamples = $this->_io->readU4be();
            }
            if ( (($this->soundHeaderType() == \MacOsResourceSnd\SoundHeaderType::EXTENDED) || ($this->soundHeaderType() == \MacOsResourceSnd\SoundHeaderType::COMPRESSED)) ) {
                $this->_m_numChannels = $this->_io->readU4be();
            }
            $this->_m_sampleRate = new \MacOsResourceSnd\UnsignedFixedPoint($this->_io, $this, $this->_root);
            $this->_m_loopStart = $this->_io->readU4be();
            $this->_m_loopEnd = $this->_io->readU4be();
            $this->_m_encode = $this->_io->readU1();
            $this->_m_midiNote = $this->_io->readU1();
            if ( (($this->soundHeaderType() == \MacOsResourceSnd\SoundHeaderType::EXTENDED) || ($this->soundHeaderType() == \MacOsResourceSnd\SoundHeaderType::COMPRESSED)) ) {
                $this->_m_extendedOrCompressed = new \MacOsResourceSnd\ExtendedOrCompressed($this->_io, $this, $this->_root);
            }
            if ($this->samplePtr() == 0) {
                $this->_m_sampleArea = $this->_io->readBytes(($this->soundHeaderType() == \MacOsResourceSnd\SoundHeaderType::STANDARD ? $this->numSamples() : ($this->soundHeaderType() == \MacOsResourceSnd\SoundHeaderType::EXTENDED ? intval((($this->extendedOrCompressed()->numFrames() * $this->numChannels()) * $this->extendedOrCompressed()->bitsPerSample()) / 8) : $this->_io()->size() - $this->_io()->pos())));
            }
        }
        protected $_m_baseFreqeuncy;

        /**
         * base frequency of sample in Hz
         * Calculated with the formula (2 ** ((midi_note - 69) / 12)) * 440
         */
        public function baseFreqeuncy() {
            if ($this->_m_baseFreqeuncy !== null)
                return $this->_m_baseFreqeuncy;
            if ( (($this->midiNote() >= 0) && ($this->midiNote() < 128)) ) {
                $this->_m_baseFreqeuncy = $this->_root()->midiNoteToFrequency()[$this->midiNote()];
            }
            return $this->_m_baseFreqeuncy;
        }
        protected $_m_soundHeaderType;
        public function soundHeaderType() {
            if ($this->_m_soundHeaderType !== null)
                return $this->_m_soundHeaderType;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->startOfs() + 20);
            $this->_m_soundHeaderType = $this->_io->readU1();
            $this->_io->seek($_pos);
            return $this->_m_soundHeaderType;
        }
        protected $_m_startOfs;
        public function startOfs() {
            if ($this->_m_startOfs !== null)
                return $this->_m_startOfs;
            $this->_m_startOfs = $this->_io()->pos();
            return $this->_m_startOfs;
        }
        protected $_m__unnamed0;
        protected $_m_samplePtr;
        protected $_m_numSamples;
        protected $_m_numChannels;
        protected $_m_sampleRate;
        protected $_m_loopStart;
        protected $_m_loopEnd;
        protected $_m_encode;
        protected $_m_midiNote;
        protected $_m_extendedOrCompressed;
        protected $_m_sampleArea;
        public function _unnamed0() { return $this->_m__unnamed0; }

        /**
         * pointer to samples (or 0 if samples follow data structure)
         */
        public function samplePtr() { return $this->_m_samplePtr; }

        /**
         * number of samples
         */
        public function numSamples() { return $this->_m_numSamples; }

        /**
         * number of channels in sample
         */
        public function numChannels() { return $this->_m_numChannels; }

        /**
         * The rate at which the sample was originally recorded.
         */
        public function sampleRate() { return $this->_m_sampleRate; }

        /**
         * loop point beginning
         */
        public function loopStart() { return $this->_m_loopStart; }

        /**
         * loop point ending
         */
        public function loopEnd() { return $this->_m_loopEnd; }

        /**
         * sample's encoding option
         */
        public function encode() { return $this->_m_encode; }

        /**
         * base frequency of sample, expressed as MIDI note values, 60 is middle C
         */
        public function midiNote() { return $this->_m_midiNote; }
        public function extendedOrCompressed() { return $this->_m_extendedOrCompressed; }

        /**
         * sampled-sound data
         */
        public function sampleArea() { return $this->_m_sampleArea; }
    }
}

namespace MacOsResourceSnd {
    class UnsignedFixedPoint extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\MacOsResourceSnd\SoundHeader $_parent = null, ?\MacOsResourceSnd $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_integerPart = $this->_io->readU2be();
            $this->_m_fractionPart = $this->_io->readU2be();
        }
        protected $_m_value;
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $this->_m_value = $this->integerPart() + $this->fractionPart() / 65535.0;
            return $this->_m_value;
        }
        protected $_m_integerPart;
        protected $_m_fractionPart;
        public function integerPart() { return $this->_m_integerPart; }
        public function fractionPart() { return $this->_m_fractionPart; }
    }
}

namespace MacOsResourceSnd {
    class CmdType {

        /**
         * do nothing
         */
        const NULL_CMD = 0;

        /**
         * stop a sound that is playing
         */
        const QUIET_CMD = 3;

        /**
         * flush a sound channel
         */
        const FLUSH_CMD = 4;

        /**
         * reinitialize a sound channel
         */
        const RE_INIT_CMD = 5;

        /**
         * suspend processing in a channel
         */
        const WAIT_CMD = 10;

        /**
         * pause processing in a channel
         */
        const PAUSE_CMD = 11;

        /**
         * resume processing in a channel
         */
        const RESUME_CMD = 12;

        /**
         * execute a callback procedure
         */
        const CALL_BACK_CMD = 13;

        /**
         * synchronize channels
         */
        const SYNC_CMD = 14;

        /**
         * If no other commands are pending in the sound channel after a
         * resumeCmd command, the Sound Manager sends an emptyCmd command.
         * The emptyCmd command is sent only by the Sound Manager and
         * should not be issued by your application.
         */
        const EMPTY_CMD = 15;

        /**
         * see if initialization options are supported
         */
        const AVAILABLE_CMD = 24;

        /**
         * determine version
         */
        const VERSION_CMD = 25;

        /**
         * report total CPU load
         */
        const TOTAL_LOAD_CMD = 26;

        /**
         * report CPU load for a new channel
         */
        const LOAD_CMD = 27;

        /**
         * play a note for a duration
         */
        const FREQ_DURATION_CMD = 40;

        /**
         * rest a channel for a duration
         */
        const REST_CMD = 41;

        /**
         * change the pitch of a sound
         */
        const FREQ_CMD = 42;

        /**
         * change the amplitude of a sound
         */
        const AMP_CMD = 43;

        /**
         * change the timbre of a sound
         */
        const TIMBRE_CMD = 44;

        /**
         * get the amplitude of a sound
         */
        const GET_AMP_CMD = 45;

        /**
         * set volume
         */
        const VOLUME_CMD = 46;

        /**
         * get volume
         */
        const GET_VOLUME_CMD = 47;

        /**
         * install a wave table as a voice
         */
        const WAVE_TABLE_CMD = 60;

        /**
         * Not documented
         */
        const PHASE_CMD = 61;

        /**
         * install a sampled sound as a voice
         */
        const SOUND_CMD = 80;

        /**
         * play a sampled sound
         */
        const BUFFER_CMD = 81;

        /**
         * set the pitch of a sampled sound
         */
        const RATE_CMD = 82;

        /**
         * get the pitch of a sampled sound
         */
        const GET_RATE_CMD = 85;

        private const _VALUES = [0 => true, 3 => true, 4 => true, 5 => true, 10 => true, 11 => true, 12 => true, 13 => true, 14 => true, 15 => true, 24 => true, 25 => true, 26 => true, 27 => true, 40 => true, 41 => true, 42 => true, 43 => true, 44 => true, 45 => true, 46 => true, 47 => true, 60 => true, 61 => true, 80 => true, 81 => true, 82 => true, 85 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace MacOsResourceSnd {
    class CompressionTypeEnum {
        const VARIABLE_COMPRESSION = -2;
        const FIXED_COMPRESSION = -1;
        const NOT_COMPRESSED = 0;
        const TWO_TO_ONE = 1;
        const EIGHT_TO_THREE = 2;
        const THREE_TO_ONE = 3;
        const SIX_TO_ONE = 4;

        private const _VALUES = [-2 => true, -1 => true, 0 => true, 1 => true, 2 => true, 3 => true, 4 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace MacOsResourceSnd {
    class DataType {
        const SQUARE_WAVE_SYNTH = 1;
        const WAVE_TABLE_SYNTH = 3;
        const SAMPLED_SYNTH = 5;

        private const _VALUES = [1 => true, 3 => true, 5 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace MacOsResourceSnd {
    class InitOption {

        /**
         * left stereo channel
         */
        const CHAN_LEFT = 2;

        /**
         * right stereo channel
         */
        const CHAN_RIGHT = 3;

        /**
         * no linear interpolation
         */
        const NO_INTERP = 4;

        /**
         * no drop-sample conversion
         */
        const NO_DROP = 8;

        /**
         * monophonic channel
         */
        const MONO = 128;

        /**
         * stereo channel
         */
        const STEREO = 192;

        /**
         * MACE 3:1
         */
        const MACE3 = 768;

        /**
         * MACE 6:1
         */
        const MACE6 = 1024;

        private const _VALUES = [2 => true, 3 => true, 4 => true, 8 => true, 128 => true, 192 => true, 768 => true, 1024 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace MacOsResourceSnd {
    class SoundHeaderType {
        const STANDARD = 0;
        const COMPRESSED = 254;
        const EXTENDED = 255;

        private const _VALUES = [0 => true, 254 => true, 255 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace MacOsResourceSnd {
    class WaveInitOption {

        /**
         * Play sounds through the first wave-table channel
         */
        const CHANNEL0 = 4;

        /**
         * Play sounds through the second wave-table channel
         */
        const CHANNEL1 = 5;

        /**
         * Play sounds through the third wave-table channel
         */
        const CHANNEL2 = 6;

        /**
         * Play sounds through the fourth wave-table channel
         */
        const CHANNEL3 = 7;

        private const _VALUES = [4 => true, 5 => true, 6 => true, 7 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
