<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * The WAVE file format is a subset of Microsoft's RIFF specification for the
 * storage of multimedia files. A RIFF file starts out with a file header
 * followed by a sequence of data chunks. A WAVE file is often just a RIFF
 * file with a single "WAVE" chunk which consists of two sub-chunks --
 * a "fmt " chunk specifying the data format and a "data" chunk containing
 * the actual sample data.
 * 
 * This Kaitai implementation was written by John Byrd of Gigantic Software
 * (jbyrd@giganticsoftware.com), and it is likely to contain bugs.
 */

class Wav extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Wav $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_riffId = $this->_io->ensureFixedContents("\x52\x49\x46\x46");
        $this->_m_fileSize = $this->_io->readU4le();
        $this->_m_waveId = $this->_io->ensureFixedContents("\x57\x41\x56\x45");
        $this->_m__raw_chunks = $this->_io->readBytes(($this->fileSize() - 5));
        $io = new \Kaitai\Struct\Stream($this->_m__raw_chunks);
        $this->_m_chunks = new \Wav\ChunksType($io, $this, $this->_root);
    }
    protected $_m_formatChunk;
    public function formatChunk() {
        if ($this->_m_formatChunk !== null)
            return $this->_m_formatChunk;
        $this->_m_formatChunk = $this->chunks()->chunk()[0]->data();
        return $this->_m_formatChunk;
    }
    protected $_m_riffId;
    protected $_m_fileSize;
    protected $_m_waveId;
    protected $_m_chunks;
    protected $_m__raw_chunks;
    public function riffId() { return $this->_m_riffId; }
    public function fileSize() { return $this->_m_fileSize; }
    public function waveId() { return $this->_m_waveId; }
    public function chunks() { return $this->_m_chunks; }
    public function _raw_chunks() { return $this->_m__raw_chunks; }
}

namespace \Wav;

class SampleType extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Wav $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_sample = $this->_io->readU2le();
    }
    protected $_m_sample;
    public function sample() { return $this->_m_sample; }
}

namespace \Wav;

class FormatChunkType extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Wav\ChunkType $_parent = null, \Wav $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_wFormatTag = $this->_io->readU2le();
        $this->_m_nChannels = $this->_io->readU2le();
        $this->_m_nSamplesPerSec = $this->_io->readU4le();
        $this->_m_nAvgBytesPerSec = $this->_io->readU4le();
        $this->_m_nBlockAlign = $this->_io->readU2le();
        $this->_m_wBitsPerSample = $this->_io->readU2le();
        if (!($this->isBasicPcm())) {
            $this->_m_cbSize = $this->_io->readU2le();
        }
        if ($this->isCbSizeMeaningful()) {
            $this->_m_wValidBitsPerSample = $this->_io->readU2le();
        }
        if ($this->isExtensible()) {
            $this->_m_channelMaskAndSubformat = new \Wav\ChannelMaskAndSubformatType($this->_io, $this, $this->_root);
        }
    }
    protected $_m_isExtensible;
    public function isExtensible() {
        if ($this->_m_isExtensible !== null)
            return $this->_m_isExtensible;
        $this->_m_isExtensible = $this->wFormatTag() == \Wav\WFormatTagType::EXTENSIBLE;
        return $this->_m_isExtensible;
    }
    protected $_m_isBasicPcm;
    public function isBasicPcm() {
        if ($this->_m_isBasicPcm !== null)
            return $this->_m_isBasicPcm;
        $this->_m_isBasicPcm = $this->wFormatTag() == \Wav\WFormatTagType::PCM;
        return $this->_m_isBasicPcm;
    }
    protected $_m_isBasicFloat;
    public function isBasicFloat() {
        if ($this->_m_isBasicFloat !== null)
            return $this->_m_isBasicFloat;
        $this->_m_isBasicFloat = $this->wFormatTag() == \Wav\WFormatTagType::IEEE_FLOAT;
        return $this->_m_isBasicFloat;
    }
    protected $_m_isCbSizeMeaningful;
    public function isCbSizeMeaningful() {
        if ($this->_m_isCbSizeMeaningful !== null)
            return $this->_m_isCbSizeMeaningful;
        $this->_m_isCbSizeMeaningful =  ((!($this->isBasicPcm())) && ($this->cbSize() != 0)) ;
        return $this->_m_isCbSizeMeaningful;
    }
    protected $_m_wFormatTag;
    protected $_m_nChannels;
    protected $_m_nSamplesPerSec;
    protected $_m_nAvgBytesPerSec;
    protected $_m_nBlockAlign;
    protected $_m_wBitsPerSample;
    protected $_m_cbSize;
    protected $_m_wValidBitsPerSample;
    protected $_m_channelMaskAndSubformat;
    public function wFormatTag() { return $this->_m_wFormatTag; }
    public function nChannels() { return $this->_m_nChannels; }
    public function nSamplesPerSec() { return $this->_m_nSamplesPerSec; }
    public function nAvgBytesPerSec() { return $this->_m_nAvgBytesPerSec; }
    public function nBlockAlign() { return $this->_m_nBlockAlign; }
    public function wBitsPerSample() { return $this->_m_wBitsPerSample; }
    public function cbSize() { return $this->_m_cbSize; }
    public function wValidBitsPerSample() { return $this->_m_wValidBitsPerSample; }
    public function channelMaskAndSubformat() { return $this->_m_channelMaskAndSubformat; }
}

namespace \Wav;

class GuidType extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Wav\ChannelMaskAndSubformatType $_parent = null, \Wav $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_data1 = $this->_io->readU4le();
        $this->_m_data2 = $this->_io->readU2le();
        $this->_m_data3 = $this->_io->readU2le();
        $this->_m_data4 = $this->_io->readU4be();
        $this->_m_data4a = $this->_io->readU4be();
    }
    protected $_m_data1;
    protected $_m_data2;
    protected $_m_data3;
    protected $_m_data4;
    protected $_m_data4a;
    public function data1() { return $this->_m_data1; }
    public function data2() { return $this->_m_data2; }
    public function data3() { return $this->_m_data3; }
    public function data4() { return $this->_m_data4; }
    public function data4a() { return $this->_m_data4a; }
}

namespace \Wav;

class CuePointType extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Wav\CueChunkType $_parent = null, \Wav $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_dwName = $this->_io->readU4le();
        $this->_m_dwPosition = $this->_io->readU4le();
        $this->_m_fccChunk = $this->_io->readU4le();
        $this->_m_dwChunkStart = $this->_io->readU4le();
        $this->_m_dwBlockStart = $this->_io->readU4le();
        $this->_m_dwSampleOffset = $this->_io->readU4le();
    }
    protected $_m_dwName;
    protected $_m_dwPosition;
    protected $_m_fccChunk;
    protected $_m_dwChunkStart;
    protected $_m_dwBlockStart;
    protected $_m_dwSampleOffset;
    public function dwName() { return $this->_m_dwName; }
    public function dwPosition() { return $this->_m_dwPosition; }
    public function fccChunk() { return $this->_m_fccChunk; }
    public function dwChunkStart() { return $this->_m_dwChunkStart; }
    public function dwBlockStart() { return $this->_m_dwBlockStart; }
    public function dwSampleOffset() { return $this->_m_dwSampleOffset; }
}

namespace \Wav;

class DataChunkType extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Wav\ChunkType $_parent = null, \Wav $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_data = $this->_io->readBytesFull();
    }
    protected $_m_data;
    public function data() { return $this->_m_data; }
}

namespace \Wav;

class SamplesType extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Wav $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_samples = $this->_io->readU4le();
    }
    protected $_m_samples;
    public function samples() { return $this->_m_samples; }
}

namespace \Wav;

class ChannelMaskAndSubformatType extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Wav\FormatChunkType $_parent = null, \Wav $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_dwChannelMask = new \Wav\ChannelMaskType($this->_io, $this, $this->_root);
        $this->_m_subformat = new \Wav\GuidType($this->_io, $this, $this->_root);
    }
    protected $_m_dwChannelMask;
    protected $_m_subformat;
    public function dwChannelMask() { return $this->_m_dwChannelMask; }
    public function subformat() { return $this->_m_subformat; }
}

namespace \Wav;

class ChunksType extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Wav $_parent = null, \Wav $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_chunk = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_chunk[] = new \Wav\ChunkType($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_chunk;
    public function chunk() { return $this->_m_chunk; }
}

namespace \Wav;

class CueChunkType extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Wav\ChunkType $_parent = null, \Wav $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_dwCuePoints = $this->_io->readU4le();
        if ($this->dwCuePoints() != 0) {
            $this->_m_cuePoints = [];
            $n = $this->dwCuePoints();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_cuePoints[] = new \Wav\CuePointType($this->_io, $this, $this->_root);
            }
        }
    }
    protected $_m_dwCuePoints;
    protected $_m_cuePoints;
    public function dwCuePoints() { return $this->_m_dwCuePoints; }
    public function cuePoints() { return $this->_m_cuePoints; }
}

namespace \Wav;

class ChannelMaskType extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Wav\ChannelMaskAndSubformatType $_parent = null, \Wav $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_frontRightOfCenter = $this->_io->readBitsInt(1) != 0;
        $this->_m_frontLeftOfCenter = $this->_io->readBitsInt(1) != 0;
        $this->_m_backRight = $this->_io->readBitsInt(1) != 0;
        $this->_m_backLeft = $this->_io->readBitsInt(1) != 0;
        $this->_m_lowFrequency = $this->_io->readBitsInt(1) != 0;
        $this->_m_frontCenter = $this->_io->readBitsInt(1) != 0;
        $this->_m_frontRight = $this->_io->readBitsInt(1) != 0;
        $this->_m_frontLeft = $this->_io->readBitsInt(1) != 0;
        $this->_m_topCenter = $this->_io->readBitsInt(1) != 0;
        $this->_m_sideRight = $this->_io->readBitsInt(1) != 0;
        $this->_m_sideLeft = $this->_io->readBitsInt(1) != 0;
        $this->_m_backCenter = $this->_io->readBitsInt(1) != 0;
        $this->_m_topBackLeft = $this->_io->readBitsInt(1) != 0;
        $this->_m_topFrontRight = $this->_io->readBitsInt(1) != 0;
        $this->_m_topFrontCenter = $this->_io->readBitsInt(1) != 0;
        $this->_m_topFrontLeft = $this->_io->readBitsInt(1) != 0;
        $this->_m_unused1 = $this->_io->readBitsInt(6);
        $this->_m_topBackRight = $this->_io->readBitsInt(1) != 0;
        $this->_m_topBackCenter = $this->_io->readBitsInt(1) != 0;
        $this->_m_unused2 = $this->_io->readBitsInt(8);
    }
    protected $_m_frontRightOfCenter;
    protected $_m_frontLeftOfCenter;
    protected $_m_backRight;
    protected $_m_backLeft;
    protected $_m_lowFrequency;
    protected $_m_frontCenter;
    protected $_m_frontRight;
    protected $_m_frontLeft;
    protected $_m_topCenter;
    protected $_m_sideRight;
    protected $_m_sideLeft;
    protected $_m_backCenter;
    protected $_m_topBackLeft;
    protected $_m_topFrontRight;
    protected $_m_topFrontCenter;
    protected $_m_topFrontLeft;
    protected $_m_unused1;
    protected $_m_topBackRight;
    protected $_m_topBackCenter;
    protected $_m_unused2;
    public function frontRightOfCenter() { return $this->_m_frontRightOfCenter; }
    public function frontLeftOfCenter() { return $this->_m_frontLeftOfCenter; }
    public function backRight() { return $this->_m_backRight; }
    public function backLeft() { return $this->_m_backLeft; }
    public function lowFrequency() { return $this->_m_lowFrequency; }
    public function frontCenter() { return $this->_m_frontCenter; }
    public function frontRight() { return $this->_m_frontRight; }
    public function frontLeft() { return $this->_m_frontLeft; }
    public function topCenter() { return $this->_m_topCenter; }
    public function sideRight() { return $this->_m_sideRight; }
    public function sideLeft() { return $this->_m_sideLeft; }
    public function backCenter() { return $this->_m_backCenter; }
    public function topBackLeft() { return $this->_m_topBackLeft; }
    public function topFrontRight() { return $this->_m_topFrontRight; }
    public function topFrontCenter() { return $this->_m_topFrontCenter; }
    public function topFrontLeft() { return $this->_m_topFrontLeft; }
    public function unused1() { return $this->_m_unused1; }
    public function topBackRight() { return $this->_m_topBackRight; }
    public function topBackCenter() { return $this->_m_topBackCenter; }
    public function unused2() { return $this->_m_unused2; }
}

namespace \Wav;

class ChunkType extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Wav\ChunksType $_parent = null, \Wav $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_chunkId = $this->_io->readU4be();
        $this->_m_len = $this->_io->readU4le();
        switch ($this->chunkId()) {
            case 1684108385:
                $this->_m__raw_data = $this->_io->readBytes($this->len());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \Wav\DataChunkType($io, $this, $this->_root);
                break;
            case 1668637984:
                $this->_m__raw_data = $this->_io->readBytes($this->len());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \Wav\CueChunkType($io, $this, $this->_root);
                break;
            case 1650817140:
                $this->_m__raw_data = $this->_io->readBytes($this->len());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \Wav\BextChunkType($io, $this, $this->_root);
                break;
            case 1718449184:
                $this->_m__raw_data = $this->_io->readBytes($this->len());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \Wav\FormatChunkType($io, $this, $this->_root);
                break;
            default:
                $this->_m_data = $this->_io->readBytes($this->len());
                break;
        }
    }
    protected $_m_chunkId;
    protected $_m_len;
    protected $_m_data;
    protected $_m__raw_data;
    public function chunkId() { return $this->_m_chunkId; }
    public function len() { return $this->_m_len; }
    public function data() { return $this->_m_data; }
    public function _raw_data() { return $this->_m__raw_data; }
}

namespace \Wav;

class BextChunkType extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Wav\ChunkType $_parent = null, \Wav $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_description = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(256), "ASCII");
        $this->_m_originator = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(32), "ASCII");
        $this->_m_originatorReference = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(32), "ASCII");
        $this->_m_originationDate = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(10), "ASCII");
        $this->_m_originationTime = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(8), "ASCII");
        $this->_m_timeReferenceLow = $this->_io->readU4le();
        $this->_m_timeReferenceHigh = $this->_io->readU4le();
        $this->_m_version = $this->_io->readU2le();
        $this->_m_umid = $this->_io->readBytes(64);
        $this->_m_loudnessValue = $this->_io->readU2le();
        $this->_m_loudnessRange = $this->_io->readU2le();
        $this->_m_maxTruePeakLevel = $this->_io->readU2le();
        $this->_m_maxMomentaryLoudness = $this->_io->readU2le();
        $this->_m_maxShortTermLoudness = $this->_io->readU2le();
    }
    protected $_m_description;
    protected $_m_originator;
    protected $_m_originatorReference;
    protected $_m_originationDate;
    protected $_m_originationTime;
    protected $_m_timeReferenceLow;
    protected $_m_timeReferenceHigh;
    protected $_m_version;
    protected $_m_umid;
    protected $_m_loudnessValue;
    protected $_m_loudnessRange;
    protected $_m_maxTruePeakLevel;
    protected $_m_maxMomentaryLoudness;
    protected $_m_maxShortTermLoudness;
    public function description() { return $this->_m_description; }
    public function originator() { return $this->_m_originator; }
    public function originatorReference() { return $this->_m_originatorReference; }
    public function originationDate() { return $this->_m_originationDate; }
    public function originationTime() { return $this->_m_originationTime; }
    public function timeReferenceLow() { return $this->_m_timeReferenceLow; }
    public function timeReferenceHigh() { return $this->_m_timeReferenceHigh; }
    public function version() { return $this->_m_version; }
    public function umid() { return $this->_m_umid; }
    public function loudnessValue() { return $this->_m_loudnessValue; }
    public function loudnessRange() { return $this->_m_loudnessRange; }
    public function maxTruePeakLevel() { return $this->_m_maxTruePeakLevel; }
    public function maxMomentaryLoudness() { return $this->_m_maxMomentaryLoudness; }
    public function maxShortTermLoudness() { return $this->_m_maxShortTermLoudness; }
}

namespace \Wav;

class WFormatTagType {
    const UNKNOWN = 0;
    const PCM = 1;
    const ADPCM = 2;
    const IEEE_FLOAT = 3;
    const ALAW = 6;
    const MULAW = 7;
    const DVI_ADPCM = 17;
    const DOLBY_AC3_SPDIF = 146;
    const EXTENSIBLE = 65534;
    const DEVELOPMENT = 65535;
}

namespace \Wav;

class ChunkType {
    const FMT = 544501094;
    const BEXT = 1650817140;
    const CUE = 1668637984;
    const DATA = 1684108385;
    const MINF = 1835626086;
    const REGN = 1919248238;
    const UMID = 1970104676;
}
