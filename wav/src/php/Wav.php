<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * The WAVE file format is a subset of Microsoft's RIFF specification for the
 * storage of multimedia files. A RIFF file starts out with a file header
 * followed by a sequence of data chunks. A WAVE file is often just a RIFF
 * file with a single "WAVE" chunk which consists of two sub-chunks --
 * a "fmt " chunk specifying the data format and a "data" chunk containing
 * the actual sample data, although other chunks exist and are used.
 * 
 * An extension of the file format is the Broadcast Wave Format (BWF) for radio
 * broadcasts. Sample files can be found at:
 * 
 * <https://www.bbc.co.uk/rd/publications/saqas>
 * 
 * This Kaitai implementation was written by John Byrd of Gigantic Software
 * (jbyrd@giganticsoftware.com), and it is likely to contain bugs.
 */

namespace {
    class Wav extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Wav $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_chunk = new \Riff\Chunk($this->_io);
        }
        protected $_m_chunkId;
        public function chunkId() {
            if ($this->_m_chunkId !== null)
                return $this->_m_chunkId;
            $this->_m_chunkId = $this->chunk()->id();
            return $this->_m_chunkId;
        }
        protected $_m_formType;
        public function formType() {
            if ($this->_m_formType !== null)
                return $this->_m_formType;
            $this->_m_formType = $this->parentChunkData()->formType();
            return $this->_m_formType;
        }
        protected $_m_isFormTypeWave;
        public function isFormTypeWave() {
            if ($this->_m_isFormTypeWave !== null)
                return $this->_m_isFormTypeWave;
            $this->_m_isFormTypeWave =  (($this->isRiffChunk()) && ($this->formType() == \Wav\Fourcc::WAVE)) ;
            return $this->_m_isFormTypeWave;
        }
        protected $_m_isRiffChunk;
        public function isRiffChunk() {
            if ($this->_m_isRiffChunk !== null)
                return $this->_m_isRiffChunk;
            $this->_m_isRiffChunk = $this->chunkId() == \Wav\Fourcc::RIFF;
            return $this->_m_isRiffChunk;
        }
        protected $_m_parentChunkData;
        public function parentChunkData() {
            if ($this->_m_parentChunkData !== null)
                return $this->_m_parentChunkData;
            if ($this->isRiffChunk()) {
                $io = $this->chunk()->dataSlot()->_io();
                $_pos = $io->pos();
                $io->seek(0);
                $this->_m_parentChunkData = new \Riff\ParentChunkData($io);
                $io->seek($_pos);
            }
            return $this->_m_parentChunkData;
        }
        protected $_m_subchunks;
        public function subchunks() {
            if ($this->_m_subchunks !== null)
                return $this->_m_subchunks;
            if ($this->isFormTypeWave()) {
                $io = $this->parentChunkData()->subchunksSlot()->_io();
                $_pos = $io->pos();
                $io->seek(0);
                $this->_m_subchunks = [];
                $i = 0;
                while (!$io->isEof()) {
                    $this->_m_subchunks[] = new \Wav\ChunkType($io, $this, $this->_root);
                    $i++;
                }
                $io->seek($_pos);
            }
            return $this->_m_subchunks;
        }
        protected $_m_chunk;
        public function chunk() { return $this->_m_chunk; }
    }
}

namespace Wav {
    class AfspChunkType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Wav\ChunkType $_parent = null, ?\Wav $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->_m_magic == "\x41\x46\x73\x70")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x41\x46\x73\x70", $this->_m_magic, $this->_io, "/types/afsp_chunk_type/seq/0");
            }
            $this->_m_infoRecords = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_infoRecords[] = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ASCII");
                $i++;
            }
        }
        protected $_m_magic;
        protected $_m_infoRecords;
        public function magic() { return $this->_m_magic; }

        /**
         * An array of AFsp information records, in the `<field_name>: <value>`
         * format (e.g. "`program: CopyAudio`"). The list of existing information
         * record types are available in the `doc-ref` links.
         */
        public function infoRecords() { return $this->_m_infoRecords; }
    }
}

namespace Wav {
    class AxmlChunkType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Wav\ChunkType $_parent = null, ?\Wav $_root = null) {
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

namespace Wav {
    class BextChunkType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Wav\ChunkType $_parent = null, ?\Wav $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_description = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(256), 0, false), "ASCII");
            $this->_m_originator = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(32), 0, false), "ASCII");
            $this->_m_originatorReference = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(32), 0, false), "ASCII");
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
}

namespace Wav {
    class ChannelMaskAndSubformatType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Wav\FormatChunkType $_parent = null, ?\Wav $_root = null) {
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
}

namespace Wav {
    class ChannelMaskType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Wav\ChannelMaskAndSubformatType $_parent = null, ?\Wav $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_frontRightOfCenter = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_frontLeftOfCenter = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_backRight = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_backLeft = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_lowFrequency = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_frontCenter = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_frontRight = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_frontLeft = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_topCenter = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_sideRight = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_sideLeft = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_backCenter = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_topBackLeft = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_topFrontRight = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_topFrontCenter = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_topFrontLeft = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_unused1 = $this->_io->readBitsIntBe(6);
            $this->_m_topBackRight = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_topBackCenter = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_unused2 = $this->_io->readBitsIntBe(8);
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
}

namespace Wav {
    class ChunkType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Wav $_parent = null, ?\Wav $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_chunk = new \Riff\Chunk($this->_io);
        }
        protected $_m_chunkData;
        public function chunkData() {
            if ($this->_m_chunkData !== null)
                return $this->_m_chunkData;
            $io = $this->chunk()->dataSlot()->_io();
            $_pos = $io->pos();
            $io->seek(0);
            switch ($this->chunkId()) {
                case \Wav\Fourcc::AFSP:
                    $this->_m_chunkData = new \Wav\AfspChunkType($io, $this, $this->_root);
                    break;
                case \Wav\Fourcc::AXML:
                    $this->_m_chunkData = new \Wav\AxmlChunkType($io, $this, $this->_root);
                    break;
                case \Wav\Fourcc::BEXT:
                    $this->_m_chunkData = new \Wav\BextChunkType($io, $this, $this->_root);
                    break;
                case \Wav\Fourcc::CUE:
                    $this->_m_chunkData = new \Wav\CueChunkType($io, $this, $this->_root);
                    break;
                case \Wav\Fourcc::DATA:
                    $this->_m_chunkData = new \Wav\DataChunkType($io, $this, $this->_root);
                    break;
                case \Wav\Fourcc::FACT:
                    $this->_m_chunkData = new \Wav\FactChunkType($io, $this, $this->_root);
                    break;
                case \Wav\Fourcc::FMT:
                    $this->_m_chunkData = new \Wav\FormatChunkType($io, $this, $this->_root);
                    break;
                case \Wav\Fourcc::IXML:
                    $this->_m_chunkData = new \Wav\IxmlChunkType($io, $this, $this->_root);
                    break;
                case \Wav\Fourcc::LIST:
                    $this->_m_chunkData = new \Wav\ListChunkType($io, $this, $this->_root);
                    break;
                case \Wav\Fourcc::PMX:
                    $this->_m_chunkData = new \Wav\PmxChunkType($io, $this, $this->_root);
                    break;
            }
            $io->seek($_pos);
            return $this->_m_chunkData;
        }
        protected $_m_chunkId;
        public function chunkId() {
            if ($this->_m_chunkId !== null)
                return $this->_m_chunkId;
            $this->_m_chunkId = $this->chunk()->id();
            return $this->_m_chunkId;
        }
        protected $_m_chunk;
        public function chunk() { return $this->_m_chunk; }
    }
}

namespace Wav {
    class CueChunkType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Wav\ChunkType $_parent = null, ?\Wav $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_dwCuePoints = $this->_io->readU4le();
            $this->_m_cuePoints = [];
            $n = $this->dwCuePoints();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_cuePoints[] = new \Wav\CuePointType($this->_io, $this, $this->_root);
            }
        }
        protected $_m_dwCuePoints;
        protected $_m_cuePoints;
        public function dwCuePoints() { return $this->_m_dwCuePoints; }
        public function cuePoints() { return $this->_m_cuePoints; }
    }
}

namespace Wav {
    class CuePointType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Wav\CueChunkType $_parent = null, ?\Wav $_root = null) {
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
}

namespace Wav {
    class DataChunkType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Wav\ChunkType $_parent = null, ?\Wav $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_data = $this->_io->readBytesFull();
        }
        protected $_m_data;
        public function data() { return $this->_m_data; }
    }
}

/**
 * required for all non-PCM formats
 * (`w_format_tag != w_format_tag_type::pcm` or `not is_basic_pcm` in
 * `format_chunk_type` context)
 */

namespace Wav {
    class FactChunkType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Wav\ChunkType $_parent = null, ?\Wav $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numSamplesPerChannel = $this->_io->readU4le();
        }
        protected $_m_numSamplesPerChannel;
        public function numSamplesPerChannel() { return $this->_m_numSamplesPerChannel; }
    }
}

namespace Wav {
    class FormatChunkType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Wav\ChunkType $_parent = null, ?\Wav $_root = null) {
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
        protected $_m_isBasicFloat;
        public function isBasicFloat() {
            if ($this->_m_isBasicFloat !== null)
                return $this->_m_isBasicFloat;
            $this->_m_isBasicFloat = $this->wFormatTag() == \Wav\WFormatTagType::IEEE_FLOAT;
            return $this->_m_isBasicFloat;
        }
        protected $_m_isBasicPcm;
        public function isBasicPcm() {
            if ($this->_m_isBasicPcm !== null)
                return $this->_m_isBasicPcm;
            $this->_m_isBasicPcm = $this->wFormatTag() == \Wav\WFormatTagType::PCM;
            return $this->_m_isBasicPcm;
        }
        protected $_m_isCbSizeMeaningful;
        public function isCbSizeMeaningful() {
            if ($this->_m_isCbSizeMeaningful !== null)
                return $this->_m_isCbSizeMeaningful;
            $this->_m_isCbSizeMeaningful =  ((!($this->isBasicPcm())) && ($this->cbSize() != 0)) ;
            return $this->_m_isCbSizeMeaningful;
        }
        protected $_m_isExtensible;
        public function isExtensible() {
            if ($this->_m_isExtensible !== null)
                return $this->_m_isExtensible;
            $this->_m_isExtensible = $this->wFormatTag() == \Wav\WFormatTagType::EXTENSIBLE;
            return $this->_m_isExtensible;
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
}

namespace Wav {
    class GuidType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Wav\ChannelMaskAndSubformatType $_parent = null, ?\Wav $_root = null) {
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
}

namespace Wav {
    class InfoChunkType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Wav\ListChunkType $_parent = null, ?\Wav $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_chunk = new \Riff\Chunk($this->_io);
        }
        protected $_m_chunkData;
        public function chunkData() {
            if ($this->_m_chunkData !== null)
                return $this->_m_chunkData;
            $io = $this->chunk()->dataSlot()->_io();
            $_pos = $io->pos();
            $io->seek(0);
            $this->_m_chunkData = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, true), "ASCII");
            $io->seek($_pos);
            return $this->_m_chunkData;
        }
        protected $_m_chunk;
        public function chunk() { return $this->_m_chunk; }
    }
}

namespace Wav {
    class IxmlChunkType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Wav\ChunkType $_parent = null, ?\Wav $_root = null) {
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

namespace Wav {
    class ListChunkType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Wav\ChunkType $_parent = null, ?\Wav $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_parentChunkData = new \Riff\ParentChunkData($this->_io);
        }
        protected $_m_formType;
        public function formType() {
            if ($this->_m_formType !== null)
                return $this->_m_formType;
            $this->_m_formType = $this->parentChunkData()->formType();
            return $this->_m_formType;
        }
        protected $_m_subchunks;
        public function subchunks() {
            if ($this->_m_subchunks !== null)
                return $this->_m_subchunks;
            $io = $this->parentChunkData()->subchunksSlot()->_io();
            $_pos = $io->pos();
            $io->seek(0);
            $this->_m_subchunks = [];
            $i = 0;
            while (!$io->isEof()) {
                switch ($this->formType()) {
                    case \Wav\Fourcc::INFO:
                        $this->_m_subchunks[] = new \Wav\InfoChunkType($io, $this, $this->_root);
                        break;
                }
                $i++;
            }
            $io->seek($_pos);
            return $this->_m_subchunks;
        }
        protected $_m_parentChunkData;
        public function parentChunkData() { return $this->_m_parentChunkData; }
    }
}

namespace Wav {
    class PmxChunkType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Wav\ChunkType $_parent = null, ?\Wav $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_data = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
        }
        protected $_m_data;

        /**
         * XMP data
         */
        public function data() { return $this->_m_data; }
    }
}

namespace Wav {
    class SampleType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Wav $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_sample = $this->_io->readU2le();
        }
        protected $_m_sample;
        public function sample() { return $this->_m_sample; }
    }
}

namespace Wav {
    class SamplesType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Wav $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_samples = $this->_io->readU4le();
        }
        protected $_m_samples;
        public function samples() { return $this->_m_samples; }
    }
}

namespace Wav {
    class Fourcc {
        const ID3 = 540238953;
        const CUE = 543520099;
        const FMT = 544501094;
        const WAVE = 1163280727;
        const RIFF = 1179011410;
        const PEAK = 1262568784;
        const IXML = 1280137321;
        const INFO = 1330007625;
        const LIST = 1414744396;
        const PMX = 1481461855;

        /**
         * Audio definition model
         */
        const CHNA = 1634625635;
        const DATA = 1635017060;
        const UMID = 1684630901;
        const MINF = 1718511981;
        const AXML = 1819113569;
        const REGN = 1852269938;

        /**
         * AFsp metadata
         */
        const AFSP = 1886611041;
        const FACT = 1952670054;
        const BEXT = 1954047330;

        private const _VALUES = [540238953 => true, 543520099 => true, 544501094 => true, 1163280727 => true, 1179011410 => true, 1262568784 => true, 1280137321 => true, 1330007625 => true, 1414744396 => true, 1481461855 => true, 1634625635 => true, 1635017060 => true, 1684630901 => true, 1718511981 => true, 1819113569 => true, 1852269938 => true, 1886611041 => true, 1952670054 => true, 1954047330 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Wav {
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
        const FRANCE_TELECOM_G729 = 41251;
        const CODIAN = 41252;
        const FLAC = 61868;
        const EXTENSIBLE = 65534;
        const DEVELOPMENT = 65535;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 16 => true, 17 => true, 18 => true, 19 => true, 20 => true, 21 => true, 22 => true, 23 => true, 24 => true, 25 => true, 26 => true, 32 => true, 33 => true, 34 => true, 35 => true, 36 => true, 37 => true, 38 => true, 39 => true, 40 => true, 48 => true, 49 => true, 50 => true, 51 => true, 52 => true, 53 => true, 54 => true, 55 => true, 56 => true, 57 => true, 58 => true, 59 => true, 60 => true, 61 => true, 64 => true, 65 => true, 66 => true, 67 => true, 68 => true, 69 => true, 80 => true, 82 => true, 83 => true, 85 => true, 89 => true, 96 => true, 97 => true, 98 => true, 99 => true, 100 => true, 101 => true, 102 => true, 103 => true, 105 => true, 112 => true, 113 => true, 114 => true, 115 => true, 116 => true, 117 => true, 118 => true, 119 => true, 120 => true, 121 => true, 122 => true, 123 => true, 128 => true, 129 => true, 130 => true, 131 => true, 132 => true, 133 => true, 134 => true, 136 => true, 137 => true, 138 => true, 139 => true, 140 => true, 141 => true, 145 => true, 146 => true, 147 => true, 148 => true, 151 => true, 152 => true, 153 => true, 160 => true, 161 => true, 162 => true, 163 => true, 164 => true, 176 => true, 255 => true, 256 => true, 257 => true, 273 => true, 274 => true, 288 => true, 289 => true, 291 => true, 293 => true, 304 => true, 305 => true, 306 => true, 307 => true, 308 => true, 309 => true, 310 => true, 320 => true, 321 => true, 322 => true, 336 => true, 337 => true, 341 => true, 352 => true, 353 => true, 354 => true, 355 => true, 356 => true, 368 => true, 369 => true, 370 => true, 371 => true, 372 => true, 373 => true, 374 => true, 375 => true, 376 => true, 384 => true, 400 => true, 512 => true, 514 => true, 515 => true, 528 => true, 533 => true, 534 => true, 544 => true, 560 => true, 576 => true, 577 => true, 585 => true, 592 => true, 593 => true, 608 => true, 624 => true, 625 => true, 626 => true, 627 => true, 640 => true, 641 => true, 645 => true, 768 => true, 848 => true, 849 => true, 1024 => true, 1025 => true, 1026 => true, 1104 => true, 1280 => true, 1281 => true, 1664 => true, 1665 => true, 2222 => true, 4096 => true, 4097 => true, 4098 => true, 4099 => true, 4100 => true, 4352 => true, 4353 => true, 4354 => true, 4355 => true, 4356 => true, 5120 => true, 5121 => true, 5376 => true, 5632 => true, 5633 => true, 5634 => true, 5640 => true, 5641 => true, 5642 => true, 5643 => true, 5648 => true, 6172 => true, 6513 => true, 6521 => true, 7175 => true, 7180 => true, 7939 => true, 8132 => true, 8192 => true, 8193 => true, 13075 => true, 16707 => true, 16897 => true, 16963 => true, 17228 => true, 22092 => true, 22358 => true, 26447 => true, 26448 => true, 26449 => true, 26479 => true, 26480 => true, 26481 => true, 28672 => true, 28781 => true, 29537 => true, 29538 => true, 29539 => true, 31265 => true, 31266 => true, 41216 => true, 41217 => true, 41218 => true, 41219 => true, 41220 => true, 41221 => true, 41222 => true, 41223 => true, 41224 => true, 41225 => true, 41226 => true, 41227 => true, 41228 => true, 41229 => true, 41230 => true, 41231 => true, 41232 => true, 41233 => true, 41234 => true, 41235 => true, 41236 => true, 41237 => true, 41238 => true, 41239 => true, 41240 => true, 41241 => true, 41242 => true, 41243 => true, 41244 => true, 41245 => true, 41246 => true, 41247 => true, 41248 => true, 41249 => true, 41250 => true, 41251 => true, 41252 => true, 61868 => true, 65534 => true, 65535 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
