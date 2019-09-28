<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * XM (standing for eXtended Module) is a popular module music file
 * format, that was introduced in 1994 in FastTracker2 by Triton demo
 * group. Akin to MOD files, it bundles both digital samples
 * (instruments) and instructions on which note to play at what time
 * (patterns), which provides good audio quality with relatively small
 * file size. Audio is reproducible without relying on the sound of
 * particular hardware samplers or synths.
 */

class FasttrackerXmModule extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \FasttrackerXmModule $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_preheader = new \FasttrackerXmModule\Preheader($this->_io, $this, $this->_root);
        $this->_m__raw_header = $this->_io->readBytes(($this->preheader()->headerSize() - 4));
        $_io__raw_header = new \Kaitai\Struct\Stream($this->_m__raw_header);
        $this->_m_header = new \FasttrackerXmModule\Header($_io__raw_header, $this, $this->_root);
        $this->_m_patterns = [];
        $n = $this->header()->numPatterns();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_patterns[] = new \FasttrackerXmModule\Pattern($this->_io, $this, $this->_root);
        }
        $this->_m_instruments = [];
        $n = $this->header()->numInstruments();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_instruments[] = new \FasttrackerXmModule\Instrument($this->_io, $this, $this->_root);
        }
    }
    protected $_m_preheader;
    protected $_m_header;
    protected $_m_patterns;
    protected $_m_instruments;
    protected $_m__raw_header;
    public function preheader() { return $this->_m_preheader; }
    public function header() { return $this->_m_header; }
    public function patterns() { return $this->_m_patterns; }
    public function instruments() { return $this->_m_instruments; }
    public function _raw_header() { return $this->_m__raw_header; }
}

namespace \FasttrackerXmModule;

class Preheader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \FasttrackerXmModule $_parent = null, \FasttrackerXmModule $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_signature0 = $this->_io->ensureFixedContents("\x45\x78\x74\x65\x6E\x64\x65\x64\x20\x4D\x6F\x64\x75\x6C\x65\x3A\x20");
        $this->_m_moduleName = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(20), 0, false), "utf-8");
        $this->_m_signature1 = $this->_io->ensureFixedContents("\x1A");
        $this->_m_trackerName = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(20), 0, false), "utf-8");
        $this->_m_versionNumber = new \FasttrackerXmModule\Preheader\Version($this->_io, $this, $this->_root);
        $this->_m_headerSize = $this->_io->readU4le();
    }
    protected $_m_signature0;
    protected $_m_moduleName;
    protected $_m_signature1;
    protected $_m_trackerName;
    protected $_m_versionNumber;
    protected $_m_headerSize;
    public function signature0() { return $this->_m_signature0; }

    /**
     * Module name, padded with zeroes
     */
    public function moduleName() { return $this->_m_moduleName; }
    public function signature1() { return $this->_m_signature1; }

    /**
     * Tracker name
     */
    public function trackerName() { return $this->_m_trackerName; }

    /**
     * Format versions below [0x01, 0x04] have a LOT of differences. Check this field!
     */
    public function versionNumber() { return $this->_m_versionNumber; }

    /**
     * Header size << Calculated FROM THIS OFFSET, not from the beginning of the file! >>
     */
    public function headerSize() { return $this->_m_headerSize; }
}

namespace \FasttrackerXmModule\Preheader;

class Version extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \FasttrackerXmModule\Preheader $_parent = null, \FasttrackerXmModule $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_minor = $this->_io->readU1();
        $this->_m_major = $this->_io->readU1();
    }
    protected $_m_value;
    public function value() {
        if ($this->_m_value !== null)
            return $this->_m_value;
        $this->_m_value = (($this->major() << 8) | $this->minor());
        return $this->_m_value;
    }
    protected $_m_minor;
    protected $_m_major;

    /**
     * currently 0x04
     */
    public function minor() { return $this->_m_minor; }

    /**
     * currently 0x01
     */
    public function major() { return $this->_m_major; }
}

namespace \FasttrackerXmModule;

class Pattern extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \FasttrackerXmModule $_parent = null, \FasttrackerXmModule $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_header = new \FasttrackerXmModule\Pattern\Header($this->_io, $this, $this->_root);
        $this->_m_packedData = $this->_io->readBytes($this->header()->main()->lenPackedPattern());
    }
    protected $_m_header;
    protected $_m_packedData;
    public function header() { return $this->_m_header; }
    public function packedData() { return $this->_m_packedData; }
}

namespace \FasttrackerXmModule\Pattern;

class Header extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \FasttrackerXmModule\Pattern $_parent = null, \FasttrackerXmModule $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_headerLength = $this->_io->readU4le();
        $this->_m__raw_main = $this->_io->readBytes(($this->headerLength() - 4));
        $_io__raw_main = new \Kaitai\Struct\Stream($this->_m__raw_main);
        $this->_m_main = new \FasttrackerXmModule\Pattern\Header\HeaderMain($_io__raw_main, $this, $this->_root);
    }
    protected $_m_headerLength;
    protected $_m_main;
    protected $_m__raw_main;

    /**
     * Pattern header length
     */
    public function headerLength() { return $this->_m_headerLength; }
    public function main() { return $this->_m_main; }
    public function _raw_main() { return $this->_m__raw_main; }
}

namespace \FasttrackerXmModule\Pattern\Header;

class HeaderMain extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \FasttrackerXmModule\Pattern\Header $_parent = null, \FasttrackerXmModule $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_packingType = $this->_io->readU1();
        switch ($this->_root()->preheader()->versionNumber()->value()) {
            case 258:
                $this->_m_numRowsRaw = $this->_io->readU1();
                break;
            default:
                $this->_m_numRowsRaw = $this->_io->readU2le();
                break;
        }
        $this->_m_lenPackedPattern = $this->_io->readU2le();
    }
    protected $_m_numRows;
    public function numRows() {
        if ($this->_m_numRows !== null)
            return $this->_m_numRows;
        $this->_m_numRows = ($this->numRowsRaw() + ($this->_root()->preheader()->versionNumber()->value() == 258 ? 1 : 0));
        return $this->_m_numRows;
    }
    protected $_m_packingType;
    protected $_m_numRowsRaw;
    protected $_m_lenPackedPattern;

    /**
     * Packing type (always 0)
     */
    public function packingType() { return $this->_m_packingType; }

    /**
     * Number of rows in pattern (1..256)
     */
    public function numRowsRaw() { return $this->_m_numRowsRaw; }

    /**
     * Packed pattern data size
     */
    public function lenPackedPattern() { return $this->_m_lenPackedPattern; }
}

namespace \FasttrackerXmModule;

class Flags extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \FasttrackerXmModule\Header $_parent = null, \FasttrackerXmModule $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_reserved = $this->_io->readBitsInt(15);
        $this->_m_freqTableType = $this->_io->readBitsInt(1) != 0;
    }
    protected $_m_reserved;
    protected $_m_freqTableType;
    public function reserved() { return $this->_m_reserved; }

    /**
     * 0 = Amiga frequency table (see below); 1 = Linear frequency table
     */
    public function freqTableType() { return $this->_m_freqTableType; }
}

namespace \FasttrackerXmModule;

class Header extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \FasttrackerXmModule $_parent = null, \FasttrackerXmModule $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_songLength = $this->_io->readU2le();
        $this->_m_restartPosition = $this->_io->readU2le();
        $this->_m_numChannels = $this->_io->readU2le();
        $this->_m_numPatterns = $this->_io->readU2le();
        $this->_m_numInstruments = $this->_io->readU2le();
        $this->_m_flags = new \FasttrackerXmModule\Flags($this->_io, $this, $this->_root);
        $this->_m_defaultTempo = $this->_io->readU2le();
        $this->_m_defaultBpm = $this->_io->readU2le();
        $this->_m_patternOrderTable = [];
        $n = 256;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_patternOrderTable[] = $this->_io->readU1();
        }
    }
    protected $_m_songLength;
    protected $_m_restartPosition;
    protected $_m_numChannels;
    protected $_m_numPatterns;
    protected $_m_numInstruments;
    protected $_m_flags;
    protected $_m_defaultTempo;
    protected $_m_defaultBpm;
    protected $_m_patternOrderTable;

    /**
     * Song length (in pattern order table)
     */
    public function songLength() { return $this->_m_songLength; }
    public function restartPosition() { return $this->_m_restartPosition; }

    /**
     * (2,4,6,8,10,...,32)
     */
    public function numChannels() { return $this->_m_numChannels; }

    /**
     * (max 256)
     */
    public function numPatterns() { return $this->_m_numPatterns; }

    /**
     * (max 128)
     */
    public function numInstruments() { return $this->_m_numInstruments; }
    public function flags() { return $this->_m_flags; }
    public function defaultTempo() { return $this->_m_defaultTempo; }
    public function defaultBpm() { return $this->_m_defaultBpm; }

    /**
     * max 256
     */
    public function patternOrderTable() { return $this->_m_patternOrderTable; }
}

/**
 * XM's notion of "instrument" typically constitutes of a
 * instrument metadata and one or several samples. Metadata
 * includes:
 * 
 * * instrument's name
 * * instruction of which sample to use for which note
 * * volume and panning envelopes and looping instructions
 * * vibrato settings
 */

namespace \FasttrackerXmModule;

class Instrument extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \FasttrackerXmModule $_parent = null, \FasttrackerXmModule $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_headerSize = $this->_io->readU4le();
        $this->_m__raw_header = $this->_io->readBytes(($this->headerSize() - 4));
        $_io__raw_header = new \Kaitai\Struct\Stream($this->_m__raw_header);
        $this->_m_header = new \FasttrackerXmModule\Instrument\Header($_io__raw_header, $this, $this->_root);
        $this->_m_samplesHeaders = [];
        $n = $this->header()->numSamples();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_samplesHeaders[] = new \FasttrackerXmModule\Instrument\SampleHeader($this->_io, $this, $this->_root);
        }
        $this->_m_samples = [];
        $n = $this->header()->numSamples();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_samples[] = new \FasttrackerXmModule\Instrument\SamplesData($this->samplesHeaders()[$i], $this->_io, $this, $this->_root);
        }
    }
    protected $_m_headerSize;
    protected $_m_header;
    protected $_m_samplesHeaders;
    protected $_m_samples;
    protected $_m__raw_header;

    /**
     * Instrument size << header that is >>
     * << "Instrument Size" field tends to be more than the actual size of the structure documented here (it includes also the extended instrument sample header above). So remember to check it and skip the additional bytes before the first sample header >>
     */
    public function headerSize() { return $this->_m_headerSize; }
    public function header() { return $this->_m_header; }
    public function samplesHeaders() { return $this->_m_samplesHeaders; }
    public function samples() { return $this->_m_samples; }
    public function _raw_header() { return $this->_m__raw_header; }
}

namespace \FasttrackerXmModule\Instrument;

class Header extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \FasttrackerXmModule\Instrument $_parent = null, \FasttrackerXmModule $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_name = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(22), 0, false), "utf-8");
        $this->_m_type = $this->_io->readU1();
        $this->_m_numSamples = $this->_io->readU2le();
        if ($this->numSamples() > 0) {
            $this->_m_extraHeader = new \FasttrackerXmModule\Instrument\ExtraHeader($this->_io, $this, $this->_root);
        }
    }
    protected $_m_name;
    protected $_m_type;
    protected $_m_numSamples;
    protected $_m_extraHeader;
    public function name() { return $this->_m_name; }

    /**
     * Usually zero, but this seems pretty random, don't assume it's zero
     */
    public function type() { return $this->_m_type; }
    public function numSamples() { return $this->_m_numSamples; }
    public function extraHeader() { return $this->_m_extraHeader; }
}

namespace \FasttrackerXmModule\Instrument;

class ExtraHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \FasttrackerXmModule\Instrument\Header $_parent = null, \FasttrackerXmModule $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lenSampleHeader = $this->_io->readU4le();
        $this->_m_idxSamplePerNote = [];
        $n = 96;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_idxSamplePerNote[] = $this->_io->readU1();
        }
        $this->_m_volumePoints = [];
        $n = 12;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_volumePoints[] = new \FasttrackerXmModule\Instrument\ExtraHeader\EnvelopePoint($this->_io, $this, $this->_root);
        }
        $this->_m_panningPoints = [];
        $n = 12;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_panningPoints[] = new \FasttrackerXmModule\Instrument\ExtraHeader\EnvelopePoint($this->_io, $this, $this->_root);
        }
        $this->_m_numVolumePoints = $this->_io->readU1();
        $this->_m_numPanningPoints = $this->_io->readU1();
        $this->_m_volumeSustainPoint = $this->_io->readU1();
        $this->_m_volumeLoopStartPoint = $this->_io->readU1();
        $this->_m_volumeLoopEndPoint = $this->_io->readU1();
        $this->_m_panningSustainPoint = $this->_io->readU1();
        $this->_m_panningLoopStartPoint = $this->_io->readU1();
        $this->_m_panningLoopEndPoint = $this->_io->readU1();
        $this->_m_volumeType = $this->_io->readU1();
        $this->_m_panningType = $this->_io->readU1();
        $this->_m_vibratoType = $this->_io->readU1();
        $this->_m_vibratoSweep = $this->_io->readU1();
        $this->_m_vibratoDepth = $this->_io->readU1();
        $this->_m_vibratoRate = $this->_io->readU1();
        $this->_m_volumeFadeout = $this->_io->readU2le();
        $this->_m_reserved = $this->_io->readU2le();
    }
    protected $_m_lenSampleHeader;
    protected $_m_idxSamplePerNote;
    protected $_m_volumePoints;
    protected $_m_panningPoints;
    protected $_m_numVolumePoints;
    protected $_m_numPanningPoints;
    protected $_m_volumeSustainPoint;
    protected $_m_volumeLoopStartPoint;
    protected $_m_volumeLoopEndPoint;
    protected $_m_panningSustainPoint;
    protected $_m_panningLoopStartPoint;
    protected $_m_panningLoopEndPoint;
    protected $_m_volumeType;
    protected $_m_panningType;
    protected $_m_vibratoType;
    protected $_m_vibratoSweep;
    protected $_m_vibratoDepth;
    protected $_m_vibratoRate;
    protected $_m_volumeFadeout;
    protected $_m_reserved;
    public function lenSampleHeader() { return $this->_m_lenSampleHeader; }

    /**
     * Index of sample that should be used for any particular
     * note. In the simplest case, where it's only one sample
     * is available, it's an array of full of zeroes.
     */
    public function idxSamplePerNote() { return $this->_m_idxSamplePerNote; }

    /**
     * Points for volume envelope. Only `num_volume_points` will be actually used.
     */
    public function volumePoints() { return $this->_m_volumePoints; }

    /**
     * Points for panning envelope. Only `num_panning_points` will be actually used.
     */
    public function panningPoints() { return $this->_m_panningPoints; }
    public function numVolumePoints() { return $this->_m_numVolumePoints; }
    public function numPanningPoints() { return $this->_m_numPanningPoints; }
    public function volumeSustainPoint() { return $this->_m_volumeSustainPoint; }
    public function volumeLoopStartPoint() { return $this->_m_volumeLoopStartPoint; }
    public function volumeLoopEndPoint() { return $this->_m_volumeLoopEndPoint; }
    public function panningSustainPoint() { return $this->_m_panningSustainPoint; }
    public function panningLoopStartPoint() { return $this->_m_panningLoopStartPoint; }
    public function panningLoopEndPoint() { return $this->_m_panningLoopEndPoint; }
    public function volumeType() { return $this->_m_volumeType; }
    public function panningType() { return $this->_m_panningType; }
    public function vibratoType() { return $this->_m_vibratoType; }
    public function vibratoSweep() { return $this->_m_vibratoSweep; }
    public function vibratoDepth() { return $this->_m_vibratoDepth; }
    public function vibratoRate() { return $this->_m_vibratoRate; }
    public function volumeFadeout() { return $this->_m_volumeFadeout; }
    public function reserved() { return $this->_m_reserved; }
}

/**
 * Envelope frame-counters work in range 0..FFFFh (0..65535 dec).
 * BUT! FT2 only itself supports only range 0..FFh (0..255 dec).
 * Some other trackers (like SoundTracker for Unix), however, can use the full range 0..FFFF, so it should be supported.
 * !!TIP: This is also a good way to detect if the module has been made with FT2 or not. (In case the tracker name is brain- deadly left unchanged!)
 * Of course it does not help if all instruments have the values inside FT2 supported range.
 * The value-field of the envelope point is ranged between 00..3Fh (0..64 dec).
 */

namespace \FasttrackerXmModule\Instrument\ExtraHeader;

class EnvelopePoint extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \FasttrackerXmModule\Instrument\ExtraHeader $_parent = null, \FasttrackerXmModule $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_x = $this->_io->readU2le();
        $this->_m_y = $this->_io->readU2le();
    }
    protected $_m_x;
    protected $_m_y;

    /**
     * Frame number of the point
     */
    public function x() { return $this->_m_x; }

    /**
     * Value of the point
     */
    public function y() { return $this->_m_y; }
}

namespace \FasttrackerXmModule\Instrument\ExtraHeader;

class Type {
    const TRUE = 0;
    const SUSTAIN = 1;
    const LOOP = 2;
}

/**
 * The saved data uses simple delta-encoding to achieve better compression ratios (when compressed with pkzip, etc.)
 * Pseudocode for converting the delta-coded data to normal data,
 * old = 0;
 * for i in range(data_len):
 *   new = sample[i] + old;
 *   sample[i] = new;
 *   old = new;
 */

namespace \FasttrackerXmModule\Instrument;

class SamplesData extends \Kaitai\Struct\Struct {
    public function __construct(\FasttrackerXmModule\Instrument\SampleHeader $header, \Kaitai\Struct\Stream $_io, \FasttrackerXmModule\Instrument $_parent = null, \FasttrackerXmModule $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_m_header = $header;
        $this->_read();
    }

    private function _read() {
        $this->_m_data = $this->_io->readBytes(($this->header()->sampleLength() * ($this->header()->type()->isSampleData16Bit() ? 2 : 1)));
    }
    protected $_m_data;
    protected $_m_header;
    public function data() { return $this->_m_data; }
    public function header() { return $this->_m_header; }
}

namespace \FasttrackerXmModule\Instrument;

class SampleHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \FasttrackerXmModule\Instrument $_parent = null, \FasttrackerXmModule $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_sampleLength = $this->_io->readU4le();
        $this->_m_sampleLoopStart = $this->_io->readU4le();
        $this->_m_sampleLoopLength = $this->_io->readU4le();
        $this->_m_volume = $this->_io->readU1();
        $this->_m_fineTune = $this->_io->readS1();
        $this->_m_type = new \FasttrackerXmModule\Instrument\SampleHeader\LoopType($this->_io, $this, $this->_root);
        $this->_m_panning = $this->_io->readU1();
        $this->_m_relativeNoteNumber = $this->_io->readS1();
        $this->_m_reserved = $this->_io->readU1();
        $this->_m_name = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(22), 0, false), "utf-8");
    }
    protected $_m_sampleLength;
    protected $_m_sampleLoopStart;
    protected $_m_sampleLoopLength;
    protected $_m_volume;
    protected $_m_fineTune;
    protected $_m_type;
    protected $_m_panning;
    protected $_m_relativeNoteNumber;
    protected $_m_reserved;
    protected $_m_name;
    public function sampleLength() { return $this->_m_sampleLength; }
    public function sampleLoopStart() { return $this->_m_sampleLoopStart; }
    public function sampleLoopLength() { return $this->_m_sampleLoopLength; }
    public function volume() { return $this->_m_volume; }

    /**
     * -16..+15
     */
    public function fineTune() { return $this->_m_fineTune; }
    public function type() { return $this->_m_type; }

    /**
     * (0-255)
     */
    public function panning() { return $this->_m_panning; }
    public function relativeNoteNumber() { return $this->_m_relativeNoteNumber; }
    public function reserved() { return $this->_m_reserved; }
    public function name() { return $this->_m_name; }
}

namespace \FasttrackerXmModule\Instrument\SampleHeader;

class LoopType extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \FasttrackerXmModule\Instrument\SampleHeader $_parent = null, \FasttrackerXmModule $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_reserved0 = $this->_io->readBitsInt(3);
        $this->_m_isSampleData16Bit = $this->_io->readBitsInt(1) != 0;
        $this->_m_reserved1 = $this->_io->readBitsInt(2);
        $this->_m_loopType = $this->_io->readBitsInt(2);
    }
    protected $_m_reserved0;
    protected $_m_isSampleData16Bit;
    protected $_m_reserved1;
    protected $_m_loopType;
    public function reserved0() { return $this->_m_reserved0; }
    public function isSampleData16Bit() { return $this->_m_isSampleData16Bit; }
    public function reserved1() { return $this->_m_reserved1; }
    public function loopType() { return $this->_m_loopType; }
}

namespace \FasttrackerXmModule\Instrument\SampleHeader\LoopType;

class LoopType {
    const NONE = 0;
    const FORWARD = 1;
    const PING_PONG = 2;
}
