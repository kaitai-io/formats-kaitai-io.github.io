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
        $this->_m__raw_chunks = $this->_io->readBytes(($this->fileSize() - 4));
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
    const VSELP = 4;
    const IBM_CVSD = 5;
    const ALAW = 6;
    const MULAW = 7;
    const DTS = 8;
    const DRM = 9;
    const WMAVOICE9 = 10;
    const WMAVOICE10 = 11;
    const OKI_ADPCM = 16;
    const DVI_ADPCM = 17;
    const MEDIASPACE_ADPCM = 18;
    const SIERRA_ADPCM = 19;
    const G723_ADPCM = 20;
    const DIGISTD = 21;
    const DIGIFIX = 22;
    const DIALOGIC_OKI_ADPCM = 23;
    const MEDIAVISION_ADPCM = 24;
    const CU_CODEC = 25;
    const HP_DYN_VOICE = 26;
    const YAMAHA_ADPCM = 32;
    const SONARC = 33;
    const DSPGROUP_TRUESPEECH = 34;
    const ECHOSC1 = 35;
    const AUDIOFILE_AF36 = 36;
    const APTX = 37;
    const AUDIOFILE_AF10 = 38;
    const PROSODY_1612 = 39;
    const LRC = 40;
    const DOLBY_AC2 = 48;
    const GSM610 = 49;
    const MSNAUDIO = 50;
    const ANTEX_ADPCME = 51;
    const CONTROL_RES_VQLPC = 52;
    const DIGIREAL = 53;
    const DIGIADPCM = 54;
    const CONTROL_RES_CR10 = 55;
    const NMS_VBXADPCM = 56;
    const CS_IMAADPCM = 57;
    const ECHOSC3 = 58;
    const ROCKWELL_ADPCM = 59;
    const ROCKWELL_DIGITALK = 60;
    const XEBEC = 61;
    const G721_ADPCM = 64;
    const G728_CELP = 65;
    const MSG723 = 66;
    const INTEL_G723_1 = 67;
    const INTEL_G729 = 68;
    const SHARP_G726 = 69;
    const MPEG = 80;
    const RT24 = 82;
    const PAC = 83;
    const MPEGLAYER3 = 85;
    const LUCENT_G723 = 89;
    const CIRRUS = 96;
    const ESPCM = 97;
    const VOXWARE = 98;
    const CANOPUS_ATRAC = 99;
    const G726_ADPCM = 100;
    const G722_ADPCM = 101;
    const DSAT = 102;
    const DSAT_DISPLAY = 103;
    const VOXWARE_BYTE_ALIGNED = 105;
    const VOXWARE_AC8 = 112;
    const VOXWARE_AC10 = 113;
    const VOXWARE_AC16 = 114;
    const VOXWARE_AC20 = 115;
    const VOXWARE_RT24 = 116;
    const VOXWARE_RT29 = 117;
    const VOXWARE_RT29HW = 118;
    const VOXWARE_VR12 = 119;
    const VOXWARE_VR18 = 120;
    const VOXWARE_TQ40 = 121;
    const VOXWARE_SC3 = 122;
    const VOXWARE_SC3_1 = 123;
    const SOFTSOUND = 128;
    const VOXWARE_TQ60 = 129;
    const MSRT24 = 130;
    const G729A = 131;
    const MVI_MVI2 = 132;
    const DF_G726 = 133;
    const DF_GSM610 = 134;
    const ISIAUDIO = 136;
    const ONLIVE = 137;
    const MULTITUDE_FT_SX20 = 138;
    const INFOCOM_ITS_G721_ADPCM = 139;
    const CONVEDIA_G729 = 140;
    const CONGRUENCY = 141;
    const SBC24 = 145;
    const DOLBY_AC3_SPDIF = 146;
    const MEDIASONIC_G723 = 147;
    const PROSODY_8KBPS = 148;
    const ZYXEL_ADPCM = 151;
    const PHILIPS_LPCBB = 152;
    const PACKED = 153;
    const MALDEN_PHONYTALK = 160;
    const RACAL_RECORDER_GSM = 161;
    const RACAL_RECORDER_G720_A = 162;
    const RACAL_RECORDER_G723_1 = 163;
    const RACAL_RECORDER_TETRA_ACELP = 164;
    const NEC_AAC = 176;
    const RAW_AAC1 = 255;
    const RHETOREX_ADPCM = 256;
    const IRAT = 257;
    const VIVO_G723 = 273;
    const VIVO_SIREN = 274;
    const PHILIPS_CELP = 288;
    const PHILIPS_GRUNDIG = 289;
    const DIGITAL_G723 = 291;
    const SANYO_LD_ADPCM = 293;
    const SIPROLAB_ACEPLNET = 304;
    const SIPROLAB_ACELP4800 = 305;
    const SIPROLAB_ACELP8V3 = 306;
    const SIPROLAB_G729 = 307;
    const SIPROLAB_G729A = 308;
    const SIPROLAB_KELVIN = 309;
    const VOICEAGE_AMR = 310;
    const G726ADPCM = 320;
    const DICTAPHONE_CELP68 = 321;
    const DICTAPHONE_CELP54 = 322;
    const QUALCOMM_PUREVOICE = 336;
    const QUALCOMM_HALFRATE = 337;
    const TUBGSM = 341;
    const MSAUDIO1 = 352;
    const WMAUDIO2 = 353;
    const WMAUDIO3 = 354;
    const WMAUDIO_LOSSLESS = 355;
    const WMASPDIF = 356;
    const UNISYS_NAP_ADPCM = 368;
    const UNISYS_NAP_ULAW = 369;
    const UNISYS_NAP_ALAW = 370;
    const UNISYS_NAP_16K = 371;
    const SYCOM_ACM_SYC008 = 372;
    const SYCOM_ACM_SYC701_G726L = 373;
    const SYCOM_ACM_SYC701_CELP54 = 374;
    const SYCOM_ACM_SYC701_CELP68 = 375;
    const KNOWLEDGE_ADVENTURE_ADPCM = 376;
    const FRAUNHOFER_IIS_MPEG2_AAC = 384;
    const DTS_DS = 400;
    const CREATIVE_ADPCM = 512;
    const CREATIVE_FASTSPEECH8 = 514;
    const CREATIVE_FASTSPEECH10 = 515;
    const UHER_ADPCM = 528;
    const ULEAD_DV_AUDIO = 533;
    const ULEAD_DV_AUDIO_1 = 534;
    const QUARTERDECK = 544;
    const ILINK_VC = 560;
    const RAW_SPORT = 576;
    const ESST_AC3 = 577;
    const GENERIC_PASSTHRU = 585;
    const IPI_HSX = 592;
    const IPI_RPELP = 593;
    const CS2 = 608;
    const SONY_SCX = 624;
    const SONY_SCY = 625;
    const SONY_ATRAC3 = 626;
    const SONY_SPC = 627;
    const TELUM_AUDIO = 640;
    const TELUM_IA_AUDIO = 641;
    const NORCOM_VOICE_SYSTEMS_ADPCM = 645;
    const FM_TOWNS_SND = 768;
    const MICRONAS = 848;
    const MICRONAS_CELP833 = 849;
    const BTV_DIGITAL = 1024;
    const INTEL_MUSIC_CODER = 1025;
    const INDEO_AUDIO = 1026;
    const QDESIGN_MUSIC = 1104;
    const ON2_VP7_AUDIO = 1280;
    const ON2_VP6_AUDIO = 1281;
    const VME_VMPCM = 1664;
    const TPC = 1665;
    const LIGHTWAVE_LOSSLESS = 2222;
    const OLIGSM = 4096;
    const OLIADPCM = 4097;
    const OLICELP = 4098;
    const OLISBC = 4099;
    const OLIOPR = 4100;
    const LH_CODEC = 4352;
    const LH_CODEC_CELP = 4353;
    const LH_CODEC_SBC8 = 4354;
    const LH_CODEC_SBC12 = 4355;
    const LH_CODEC_SBC16 = 4356;
    const NORRIS = 5120;
    const ISIAUDIO_2 = 5121;
    const SOUNDSPACE_MUSICOMPRESS = 5376;
    const MPEG_ADTS_AAC = 5632;
    const MPEG_RAW_AAC = 5633;
    const MPEG_LOAS = 5634;
    const NOKIA_MPEG_ADTS_AAC = 5640;
    const NOKIA_MPEG_RAW_AAC = 5641;
    const VODAFONE_MPEG_ADTS_AAC = 5642;
    const VODAFONE_MPEG_RAW_AAC = 5643;
    const MPEG_HEAAC = 5648;
    const VOXWARE_RT24_SPEECH = 6172;
    const SONICFOUNDRY_LOSSLESS = 6513;
    const INNINGS_TELECOM_ADPCM = 6521;
    const LUCENT_SX8300P = 7175;
    const LUCENT_SX5363S = 7180;
    const CUSEEME = 7939;
    const NTCSOFT_ALF2CM_ACM = 8132;
    const DVM = 8192;
    const DTS2 = 8193;
    const MAKEAVIS = 13075;
    const DIVIO_MPEG4_AAC = 16707;
    const NOKIA_ADAPTIVE_MULTIRATE = 16897;
    const DIVIO_G726 = 16963;
    const LEAD_SPEECH = 17228;
    const LEAD_VORBIS = 22092;
    const WAVPACK_AUDIO = 22358;
    const OGG_VORBIS_MODE_1 = 26447;
    const OGG_VORBIS_MODE_2 = 26448;
    const OGG_VORBIS_MODE_3 = 26449;
    const OGG_VORBIS_MODE_1_PLUS = 26479;
    const OGG_VORBIS_MODE_2_PLUS = 26480;
    const OGG_VORBIS_MODE_3_PLUS = 26481;
    const THREECOM_NBX = 28672;
    const FAAD_AAC = 28781;
    const AMR_NB = 29537;
    const AMR_WB = 29538;
    const AMR_WP = 29539;
    const GSM_AMR_CBR = 31265;
    const GSM_AMR_VBR_SID = 31266;
    const COMVERSE_INFOSYS_G723_1 = 41216;
    const COMVERSE_INFOSYS_AVQSBC = 41217;
    const COMVERSE_INFOSYS_SBC = 41218;
    const SYMBOL_G729_A = 41219;
    const VOICEAGE_AMR_WB = 41220;
    const INGENIENT_G726 = 41221;
    const MPEG4_AAC = 41222;
    const ENCORE_G726 = 41223;
    const ZOLL_ASAO = 41224;
    const SPEEX_VOICE = 41225;
    const VIANIX_MASC = 41226;
    const WM9_SPECTRUM_ANALYZER = 41227;
    const WMF_SPECTRUM_ANAYZER = 41228;
    const GSM_610 = 41229;
    const GSM_620 = 41230;
    const GSM_660 = 41231;
    const GSM_690 = 41232;
    const GSM_ADAPTIVE_MULTIRATE_WB = 41233;
    const POLYCOM_G722 = 41234;
    const POLYCOM_G728 = 41235;
    const POLYCOM_G729_A = 41236;
    const POLYCOM_SIREN = 41237;
    const GLOBAL_IP_ILBC = 41238;
    const RADIOTIME_TIME_SHIFT_RADIO = 41239;
    const NICE_ACA = 41240;
    const NICE_ADPCM = 41241;
    const VOCORD_G721 = 41242;
    const VOCORD_G726 = 41243;
    const VOCORD_G722_1 = 41244;
    const VOCORD_G728 = 41245;
    const VOCORD_G729 = 41246;
    const VOCORD_G729_A = 41247;
    const VOCORD_G723_1 = 41248;
    const VOCORD_LBC = 41249;
    const NICE_G728 = 41250;
    const FRACE_TELECOM_G729 = 41251;
    const CODIAN = 41252;
    const FLAC = 61868;
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
