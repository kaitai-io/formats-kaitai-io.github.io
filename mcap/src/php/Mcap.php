<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * MCAP is a modular container format and logging library for pub/sub messages with
 * arbitrary message serialization. It is primarily intended for use in robotics
 * applications, and works well under various workloads, resource constraints, and
 * durability requirements.
 * 
 * Time values (`log_time`, `publish_time`, `create_time`) are represented in
 * nanoseconds since a user-understood epoch (i.e. Unix epoch, robot boot time,
 * etc.)
 */

namespace {
    class Mcap extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_headerMagic = new \Mcap\Magic($this->_io, $this, $this->_root);
            $this->_m_records = [];
            $i = 0;
            do {
                $_ = new \Mcap\Record($this->_io, $this, $this->_root);
                $this->_m_records[] = $_;
                $i++;
            } while (!($_->op() == \Mcap\Opcode::FOOTER));
            $this->_m_footerMagic = new \Mcap\Magic($this->_io, $this, $this->_root);
        }
        protected $_m_footer;
        public function footer() {
            if ($this->_m_footer !== null)
                return $this->_m_footer;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsFooter());
            $this->_m__raw_footer = $this->_io->readBytesFull();
            $_io__raw_footer = new \Kaitai\Struct\Stream($this->_m__raw_footer);
            $this->_m_footer = new \Mcap\Record($_io__raw_footer, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_footer;
        }
        protected $_m_ofsFooter;
        public function ofsFooter() {
            if ($this->_m_ofsFooter !== null)
                return $this->_m_ofsFooter;
            $this->_m_ofsFooter = ((($this->_io()->size() - 1) - 8) - 20) - 8;
            return $this->_m_ofsFooter;
        }
        protected $_m_headerMagic;
        protected $_m_records;
        protected $_m_footerMagic;
        protected $_m__raw_footer;
        public function headerMagic() { return $this->_m_headerMagic; }
        public function records() { return $this->_m_records; }
        public function footerMagic() { return $this->_m_footerMagic; }
        public function _raw_footer() { return $this->_m__raw_footer; }
    }
}

namespace Mcap {
    class Attachment extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\Record $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_logTime = $this->_io->readU8le();
            $this->_m_createTime = $this->_io->readU8le();
            $this->_m_name = new \Mcap\PrefixedStr($this->_io, $this, $this->_root);
            $this->_m_contentType = new \Mcap\PrefixedStr($this->_io, $this, $this->_root);
            $this->_m_lenData = $this->_io->readU8le();
            $this->_m_data = $this->_io->readBytes($this->lenData());
            if ($this->crc32InputEnd() >= 0) {
                $this->_m_invokeCrc32InputEnd = $this->_io->readBytes(0);
            }
            $this->_m_crc32 = $this->_io->readU4le();
        }
        protected $_m_crc32Input;
        public function crc32Input() {
            if ($this->_m_crc32Input !== null)
                return $this->_m_crc32Input;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_crc32Input = $this->_io->readBytes($this->crc32InputEnd());
            $this->_io->seek($_pos);
            return $this->_m_crc32Input;
        }
        protected $_m_crc32InputEnd;
        public function crc32InputEnd() {
            if ($this->_m_crc32InputEnd !== null)
                return $this->_m_crc32InputEnd;
            $this->_m_crc32InputEnd = $this->_io()->pos();
            return $this->_m_crc32InputEnd;
        }
        protected $_m_logTime;
        protected $_m_createTime;
        protected $_m_name;
        protected $_m_contentType;
        protected $_m_lenData;
        protected $_m_data;
        protected $_m_invokeCrc32InputEnd;
        protected $_m_crc32;
        public function logTime() { return $this->_m_logTime; }
        public function createTime() { return $this->_m_createTime; }
        public function name() { return $this->_m_name; }
        public function contentType() { return $this->_m_contentType; }
        public function lenData() { return $this->_m_lenData; }
        public function data() { return $this->_m_data; }
        public function invokeCrc32InputEnd() { return $this->_m_invokeCrc32InputEnd; }

        /**
         * CRC-32 checksum of preceding fields in the record. A value of zero indicates that
         * CRC validation should not be performed.
         */
        public function crc32() { return $this->_m_crc32; }
    }
}

namespace Mcap {
    class AttachmentIndex extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\Record $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ofsAttachment = $this->_io->readU8le();
            $this->_m_lenAttachment = $this->_io->readU8le();
            $this->_m_logTime = $this->_io->readU8le();
            $this->_m_createTime = $this->_io->readU8le();
            $this->_m_dataSize = $this->_io->readU8le();
            $this->_m_name = new \Mcap\PrefixedStr($this->_io, $this, $this->_root);
            $this->_m_contentType = new \Mcap\PrefixedStr($this->_io, $this, $this->_root);
        }
        protected $_m_attachment;
        public function attachment() {
            if ($this->_m_attachment !== null)
                return $this->_m_attachment;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsAttachment());
            $this->_m__raw_attachment = $io->readBytes($this->lenAttachment());
            $_io__raw_attachment = new \Kaitai\Struct\Stream($this->_m__raw_attachment);
            $this->_m_attachment = new \Mcap\Record($_io__raw_attachment, $this, $this->_root);
            $io->seek($_pos);
            return $this->_m_attachment;
        }
        protected $_m_ofsAttachment;
        protected $_m_lenAttachment;
        protected $_m_logTime;
        protected $_m_createTime;
        protected $_m_dataSize;
        protected $_m_name;
        protected $_m_contentType;
        protected $_m__raw_attachment;
        public function ofsAttachment() { return $this->_m_ofsAttachment; }
        public function lenAttachment() { return $this->_m_lenAttachment; }
        public function logTime() { return $this->_m_logTime; }
        public function createTime() { return $this->_m_createTime; }
        public function dataSize() { return $this->_m_dataSize; }
        public function name() { return $this->_m_name; }
        public function contentType() { return $this->_m_contentType; }
        public function _raw_attachment() { return $this->_m__raw_attachment; }
    }
}

namespace Mcap {
    class Channel extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\Record $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_id = $this->_io->readU2le();
            $this->_m_schemaId = $this->_io->readU2le();
            $this->_m_topic = new \Mcap\PrefixedStr($this->_io, $this, $this->_root);
            $this->_m_messageEncoding = new \Mcap\PrefixedStr($this->_io, $this, $this->_root);
            $this->_m_metadata = new \Mcap\MapStrStr($this->_io, $this, $this->_root);
        }
        protected $_m_id;
        protected $_m_schemaId;
        protected $_m_topic;
        protected $_m_messageEncoding;
        protected $_m_metadata;
        public function id() { return $this->_m_id; }
        public function schemaId() { return $this->_m_schemaId; }
        public function topic() { return $this->_m_topic; }
        public function messageEncoding() { return $this->_m_messageEncoding; }
        public function metadata() { return $this->_m_metadata; }
    }
}

namespace Mcap {
    class Chunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\Record $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_messageStartTime = $this->_io->readU8le();
            $this->_m_messageEndTime = $this->_io->readU8le();
            $this->_m_uncompressedSize = $this->_io->readU8le();
            $this->_m_uncompressedCrc32 = $this->_io->readU4le();
            $this->_m_compression = new \Mcap\PrefixedStr($this->_io, $this, $this->_root);
            $this->_m_lenRecords = $this->_io->readU8le();
            switch ($this->compression()->str()) {
                case "":
                    $this->_m__raw_records = $this->_io->readBytes($this->lenRecords());
                    $_io__raw_records = new \Kaitai\Struct\Stream($this->_m__raw_records);
                    $this->_m_records = new \Mcap\Records($_io__raw_records, $this, $this->_root);
                    break;
                default:
                    $this->_m_records = $this->_io->readBytes($this->lenRecords());
                    break;
            }
        }
        protected $_m_messageStartTime;
        protected $_m_messageEndTime;
        protected $_m_uncompressedSize;
        protected $_m_uncompressedCrc32;
        protected $_m_compression;
        protected $_m_lenRecords;
        protected $_m_records;
        protected $_m__raw_records;
        public function messageStartTime() { return $this->_m_messageStartTime; }
        public function messageEndTime() { return $this->_m_messageEndTime; }
        public function uncompressedSize() { return $this->_m_uncompressedSize; }

        /**
         * CRC-32 checksum of uncompressed `records` field. A value of zero indicates that
         * CRC validation should not be performed.
         */
        public function uncompressedCrc32() { return $this->_m_uncompressedCrc32; }
        public function compression() { return $this->_m_compression; }
        public function lenRecords() { return $this->_m_lenRecords; }
        public function records() { return $this->_m_records; }
        public function _raw_records() { return $this->_m__raw_records; }
    }
}

namespace Mcap {
    class ChunkIndex extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\Record $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_messageStartTime = $this->_io->readU8le();
            $this->_m_messageEndTime = $this->_io->readU8le();
            $this->_m_ofsChunk = $this->_io->readU8le();
            $this->_m_lenChunk = $this->_io->readU8le();
            $this->_m_lenMessageIndexOffsets = $this->_io->readU4le();
            $this->_m__raw_messageIndexOffsets = $this->_io->readBytes($this->lenMessageIndexOffsets());
            $_io__raw_messageIndexOffsets = new \Kaitai\Struct\Stream($this->_m__raw_messageIndexOffsets);
            $this->_m_messageIndexOffsets = new \Mcap\ChunkIndex\MessageIndexOffsets($_io__raw_messageIndexOffsets, $this, $this->_root);
            $this->_m_messageIndexLength = $this->_io->readU8le();
            $this->_m_compression = new \Mcap\PrefixedStr($this->_io, $this, $this->_root);
            $this->_m_compressedSize = $this->_io->readU8le();
            $this->_m_uncompressedSize = $this->_io->readU8le();
        }
        protected $_m_chunk;
        public function chunk() {
            if ($this->_m_chunk !== null)
                return $this->_m_chunk;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsChunk());
            $this->_m__raw_chunk = $io->readBytes($this->lenChunk());
            $_io__raw_chunk = new \Kaitai\Struct\Stream($this->_m__raw_chunk);
            $this->_m_chunk = new \Mcap\Record($_io__raw_chunk, $this, $this->_root);
            $io->seek($_pos);
            return $this->_m_chunk;
        }
        protected $_m_messageStartTime;
        protected $_m_messageEndTime;
        protected $_m_ofsChunk;
        protected $_m_lenChunk;
        protected $_m_lenMessageIndexOffsets;
        protected $_m_messageIndexOffsets;
        protected $_m_messageIndexLength;
        protected $_m_compression;
        protected $_m_compressedSize;
        protected $_m_uncompressedSize;
        protected $_m__raw_messageIndexOffsets;
        protected $_m__raw_chunk;
        public function messageStartTime() { return $this->_m_messageStartTime; }
        public function messageEndTime() { return $this->_m_messageEndTime; }
        public function ofsChunk() { return $this->_m_ofsChunk; }
        public function lenChunk() { return $this->_m_lenChunk; }
        public function lenMessageIndexOffsets() { return $this->_m_lenMessageIndexOffsets; }
        public function messageIndexOffsets() { return $this->_m_messageIndexOffsets; }
        public function messageIndexLength() { return $this->_m_messageIndexLength; }
        public function compression() { return $this->_m_compression; }
        public function compressedSize() { return $this->_m_compressedSize; }
        public function uncompressedSize() { return $this->_m_uncompressedSize; }
        public function _raw_messageIndexOffsets() { return $this->_m__raw_messageIndexOffsets; }
        public function _raw_chunk() { return $this->_m__raw_chunk; }
    }
}

namespace Mcap\ChunkIndex {
    class MessageIndexOffset extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\ChunkIndex\MessageIndexOffsets $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_channelId = $this->_io->readU2le();
            $this->_m_offset = $this->_io->readU8le();
        }
        protected $_m_channelId;
        protected $_m_offset;
        public function channelId() { return $this->_m_channelId; }
        public function offset() { return $this->_m_offset; }
    }
}

namespace Mcap\ChunkIndex {
    class MessageIndexOffsets extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\ChunkIndex $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Mcap\ChunkIndex\MessageIndexOffset($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace Mcap {
    class DataEnd extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\Record $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_dataSectionCrc32 = $this->_io->readU4le();
        }
        protected $_m_dataSectionCrc32;

        /**
         * CRC-32 of all bytes in the data section. A value of 0 indicates the CRC-32 is not
         * available.
         */
        public function dataSectionCrc32() { return $this->_m_dataSectionCrc32; }
    }
}

namespace Mcap {
    class Footer extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\Record $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ofsSummarySection = $this->_io->readU8le();
            $this->_m_ofsSummaryOffsetSection = $this->_io->readU8le();
            $this->_m_summaryCrc32 = $this->_io->readU4le();
        }
        protected $_m_ofsSummaryCrc32Input;
        public function ofsSummaryCrc32Input() {
            if ($this->_m_ofsSummaryCrc32Input !== null)
                return $this->_m_ofsSummaryCrc32Input;
            $this->_m_ofsSummaryCrc32Input = ($this->ofsSummarySection() != 0 ? $this->ofsSummarySection() : $this->_root()->ofsFooter());
            return $this->_m_ofsSummaryCrc32Input;
        }
        protected $_m_summaryCrc32Input;
        public function summaryCrc32Input() {
            if ($this->_m_summaryCrc32Input !== null)
                return $this->_m_summaryCrc32Input;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsSummaryCrc32Input());
            $this->_m_summaryCrc32Input = $io->readBytes((($this->_root()->_io()->size() - $this->ofsSummaryCrc32Input()) - 8) - 4);
            $io->seek($_pos);
            return $this->_m_summaryCrc32Input;
        }
        protected $_m_summaryOffsetSection;
        public function summaryOffsetSection() {
            if ($this->_m_summaryOffsetSection !== null)
                return $this->_m_summaryOffsetSection;
            if ($this->ofsSummaryOffsetSection() != 0) {
                $io = $this->_root()->_io();
                $_pos = $io->pos();
                $io->seek($this->ofsSummaryOffsetSection());
                $this->_m__raw_summaryOffsetSection = $io->readBytes($this->_root()->ofsFooter() - $this->ofsSummaryOffsetSection());
                $_io__raw_summaryOffsetSection = new \Kaitai\Struct\Stream($this->_m__raw_summaryOffsetSection);
                $this->_m_summaryOffsetSection = new \Mcap\Records($_io__raw_summaryOffsetSection, $this, $this->_root);
                $io->seek($_pos);
            }
            return $this->_m_summaryOffsetSection;
        }
        protected $_m_summarySection;
        public function summarySection() {
            if ($this->_m_summarySection !== null)
                return $this->_m_summarySection;
            if ($this->ofsSummarySection() != 0) {
                $io = $this->_root()->_io();
                $_pos = $io->pos();
                $io->seek($this->ofsSummarySection());
                $this->_m__raw_summarySection = $io->readBytes(($this->ofsSummaryOffsetSection() != 0 ? $this->ofsSummaryOffsetSection() : $this->_root()->ofsFooter()) - $this->ofsSummarySection());
                $_io__raw_summarySection = new \Kaitai\Struct\Stream($this->_m__raw_summarySection);
                $this->_m_summarySection = new \Mcap\Records($_io__raw_summarySection, $this, $this->_root);
                $io->seek($_pos);
            }
            return $this->_m_summarySection;
        }
        protected $_m_ofsSummarySection;
        protected $_m_ofsSummaryOffsetSection;
        protected $_m_summaryCrc32;
        protected $_m__raw_summaryOffsetSection;
        protected $_m__raw_summarySection;
        public function ofsSummarySection() { return $this->_m_ofsSummarySection; }
        public function ofsSummaryOffsetSection() { return $this->_m_ofsSummaryOffsetSection; }

        /**
         * A CRC-32 of all bytes from the start of the Summary section up through and
         * including the end of the previous field (summary_offset_start) in the footer
         * record. A value of 0 indicates the CRC-32 is not available.
         */
        public function summaryCrc32() { return $this->_m_summaryCrc32; }
        public function _raw_summaryOffsetSection() { return $this->_m__raw_summaryOffsetSection; }
        public function _raw_summarySection() { return $this->_m__raw_summarySection; }
    }
}

namespace Mcap {
    class Header extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\Record $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_profile = new \Mcap\PrefixedStr($this->_io, $this, $this->_root);
            $this->_m_library = new \Mcap\PrefixedStr($this->_io, $this, $this->_root);
        }
        protected $_m_profile;
        protected $_m_library;
        public function profile() { return $this->_m_profile; }
        public function library() { return $this->_m_library; }
    }
}

namespace Mcap {
    class Magic extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(8);
            if (!($this->_m_magic == "\x89\x4D\x43\x41\x50\x30\x0D\x0A")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x89\x4D\x43\x41\x50\x30\x0D\x0A", $this->_m_magic, $this->_io, "/types/magic/seq/0");
            }
        }
        protected $_m_magic;
        public function magic() { return $this->_m_magic; }
    }
}

namespace Mcap {
    class MapStrStr extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenEntries = $this->_io->readU4le();
            $this->_m__raw_entries = $this->_io->readBytes($this->lenEntries());
            $_io__raw_entries = new \Kaitai\Struct\Stream($this->_m__raw_entries);
            $this->_m_entries = new \Mcap\MapStrStr\Entries($_io__raw_entries, $this, $this->_root);
        }
        protected $_m_lenEntries;
        protected $_m_entries;
        protected $_m__raw_entries;
        public function lenEntries() { return $this->_m_lenEntries; }
        public function entries() { return $this->_m_entries; }
        public function _raw_entries() { return $this->_m__raw_entries; }
    }
}

namespace Mcap\MapStrStr {
    class Entries extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\MapStrStr $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Mcap\TupleStrStr($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace Mcap {
    class Message extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\Record $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_channelId = $this->_io->readU2le();
            $this->_m_sequence = $this->_io->readU4le();
            $this->_m_logTime = $this->_io->readU8le();
            $this->_m_publishTime = $this->_io->readU8le();
            $this->_m_data = $this->_io->readBytesFull();
        }
        protected $_m_channelId;
        protected $_m_sequence;
        protected $_m_logTime;
        protected $_m_publishTime;
        protected $_m_data;
        public function channelId() { return $this->_m_channelId; }
        public function sequence() { return $this->_m_sequence; }
        public function logTime() { return $this->_m_logTime; }
        public function publishTime() { return $this->_m_publishTime; }
        public function data() { return $this->_m_data; }
    }
}

namespace Mcap {
    class MessageIndex extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\Record $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_channelId = $this->_io->readU2le();
            $this->_m_lenRecords = $this->_io->readU4le();
            $this->_m__raw_records = $this->_io->readBytes($this->lenRecords());
            $_io__raw_records = new \Kaitai\Struct\Stream($this->_m__raw_records);
            $this->_m_records = new \Mcap\MessageIndex\MessageIndexEntries($_io__raw_records, $this, $this->_root);
        }
        protected $_m_channelId;
        protected $_m_lenRecords;
        protected $_m_records;
        protected $_m__raw_records;
        public function channelId() { return $this->_m_channelId; }
        public function lenRecords() { return $this->_m_lenRecords; }
        public function records() { return $this->_m_records; }
        public function _raw_records() { return $this->_m__raw_records; }
    }
}

namespace Mcap\MessageIndex {
    class MessageIndexEntries extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\MessageIndex $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Mcap\MessageIndex\MessageIndexEntry($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace Mcap\MessageIndex {
    class MessageIndexEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\MessageIndex\MessageIndexEntries $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_logTime = $this->_io->readU8le();
            $this->_m_offset = $this->_io->readU8le();
        }
        protected $_m_logTime;
        protected $_m_offset;
        public function logTime() { return $this->_m_logTime; }
        public function offset() { return $this->_m_offset; }
    }
}

namespace Mcap {
    class Metadata extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\Record $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_name = new \Mcap\PrefixedStr($this->_io, $this, $this->_root);
            $this->_m_metadata = new \Mcap\MapStrStr($this->_io, $this, $this->_root);
        }
        protected $_m_name;
        protected $_m_metadata;
        public function name() { return $this->_m_name; }
        public function metadata() { return $this->_m_metadata; }
    }
}

namespace Mcap {
    class MetadataIndex extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\Record $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ofsMetadata = $this->_io->readU8le();
            $this->_m_lenMetadata = $this->_io->readU8le();
            $this->_m_name = new \Mcap\PrefixedStr($this->_io, $this, $this->_root);
        }
        protected $_m_metadata;
        public function metadata() {
            if ($this->_m_metadata !== null)
                return $this->_m_metadata;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsMetadata());
            $this->_m__raw_metadata = $io->readBytes($this->lenMetadata());
            $_io__raw_metadata = new \Kaitai\Struct\Stream($this->_m__raw_metadata);
            $this->_m_metadata = new \Mcap\Record($_io__raw_metadata, $this, $this->_root);
            $io->seek($_pos);
            return $this->_m_metadata;
        }
        protected $_m_ofsMetadata;
        protected $_m_lenMetadata;
        protected $_m_name;
        protected $_m__raw_metadata;
        public function ofsMetadata() { return $this->_m_ofsMetadata; }
        public function lenMetadata() { return $this->_m_lenMetadata; }
        public function name() { return $this->_m_name; }
        public function _raw_metadata() { return $this->_m__raw_metadata; }
    }
}

namespace Mcap {
    class PrefixedStr extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenStr = $this->_io->readU4le();
            $this->_m_str = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenStr()), "UTF-8");
        }
        protected $_m_lenStr;
        protected $_m_str;
        public function lenStr() { return $this->_m_lenStr; }
        public function str() { return $this->_m_str; }
    }
}

namespace Mcap {
    class Record extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_op = $this->_io->readU1();
            $this->_m_lenBody = $this->_io->readU8le();
            switch ($this->op()) {
                case \Mcap\Opcode::ATTACHMENT:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Mcap\Attachment($_io__raw_body, $this, $this->_root);
                    break;
                case \Mcap\Opcode::ATTACHMENT_INDEX:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Mcap\AttachmentIndex($_io__raw_body, $this, $this->_root);
                    break;
                case \Mcap\Opcode::CHANNEL:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Mcap\Channel($_io__raw_body, $this, $this->_root);
                    break;
                case \Mcap\Opcode::CHUNK:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Mcap\Chunk($_io__raw_body, $this, $this->_root);
                    break;
                case \Mcap\Opcode::CHUNK_INDEX:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Mcap\ChunkIndex($_io__raw_body, $this, $this->_root);
                    break;
                case \Mcap\Opcode::DATA_END:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Mcap\DataEnd($_io__raw_body, $this, $this->_root);
                    break;
                case \Mcap\Opcode::FOOTER:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Mcap\Footer($_io__raw_body, $this, $this->_root);
                    break;
                case \Mcap\Opcode::HEADER:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Mcap\Header($_io__raw_body, $this, $this->_root);
                    break;
                case \Mcap\Opcode::MESSAGE:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Mcap\Message($_io__raw_body, $this, $this->_root);
                    break;
                case \Mcap\Opcode::MESSAGE_INDEX:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Mcap\MessageIndex($_io__raw_body, $this, $this->_root);
                    break;
                case \Mcap\Opcode::METADATA:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Mcap\Metadata($_io__raw_body, $this, $this->_root);
                    break;
                case \Mcap\Opcode::METADATA_INDEX:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Mcap\MetadataIndex($_io__raw_body, $this, $this->_root);
                    break;
                case \Mcap\Opcode::SCHEMA:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Mcap\Schema($_io__raw_body, $this, $this->_root);
                    break;
                case \Mcap\Opcode::STATISTICS:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Mcap\Statistics($_io__raw_body, $this, $this->_root);
                    break;
                case \Mcap\Opcode::SUMMARY_OFFSET:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Mcap\SummaryOffset($_io__raw_body, $this, $this->_root);
                    break;
                default:
                    $this->_m_body = $this->_io->readBytes($this->lenBody());
                    break;
            }
        }
        protected $_m_op;
        protected $_m_lenBody;
        protected $_m_body;
        protected $_m__raw_body;
        public function op() { return $this->_m_op; }
        public function lenBody() { return $this->_m_lenBody; }
        public function body() { return $this->_m_body; }
        public function _raw_body() { return $this->_m__raw_body; }
    }
}

namespace Mcap {
    class Records extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_records = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_records[] = new \Mcap\Record($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_records;
        public function records() { return $this->_m_records; }
    }
}

namespace Mcap {
    class Schema extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\Record $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_id = $this->_io->readU2le();
            $this->_m_name = new \Mcap\PrefixedStr($this->_io, $this, $this->_root);
            $this->_m_encoding = new \Mcap\PrefixedStr($this->_io, $this, $this->_root);
            $this->_m_lenData = $this->_io->readU4le();
            $this->_m_data = $this->_io->readBytes($this->lenData());
        }
        protected $_m_id;
        protected $_m_name;
        protected $_m_encoding;
        protected $_m_lenData;
        protected $_m_data;
        public function id() { return $this->_m_id; }
        public function name() { return $this->_m_name; }
        public function encoding() { return $this->_m_encoding; }
        public function lenData() { return $this->_m_lenData; }
        public function data() { return $this->_m_data; }
    }
}

namespace Mcap {
    class Statistics extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\Record $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_messageCount = $this->_io->readU8le();
            $this->_m_schemaCount = $this->_io->readU2le();
            $this->_m_channelCount = $this->_io->readU4le();
            $this->_m_attachmentCount = $this->_io->readU4le();
            $this->_m_metadataCount = $this->_io->readU4le();
            $this->_m_chunkCount = $this->_io->readU4le();
            $this->_m_messageStartTime = $this->_io->readU8le();
            $this->_m_messageEndTime = $this->_io->readU8le();
            $this->_m_lenChannelMessageCounts = $this->_io->readU4le();
            $this->_m__raw_channelMessageCounts = $this->_io->readBytes($this->lenChannelMessageCounts());
            $_io__raw_channelMessageCounts = new \Kaitai\Struct\Stream($this->_m__raw_channelMessageCounts);
            $this->_m_channelMessageCounts = new \Mcap\Statistics\ChannelMessageCounts($_io__raw_channelMessageCounts, $this, $this->_root);
        }
        protected $_m_messageCount;
        protected $_m_schemaCount;
        protected $_m_channelCount;
        protected $_m_attachmentCount;
        protected $_m_metadataCount;
        protected $_m_chunkCount;
        protected $_m_messageStartTime;
        protected $_m_messageEndTime;
        protected $_m_lenChannelMessageCounts;
        protected $_m_channelMessageCounts;
        protected $_m__raw_channelMessageCounts;
        public function messageCount() { return $this->_m_messageCount; }
        public function schemaCount() { return $this->_m_schemaCount; }
        public function channelCount() { return $this->_m_channelCount; }
        public function attachmentCount() { return $this->_m_attachmentCount; }
        public function metadataCount() { return $this->_m_metadataCount; }
        public function chunkCount() { return $this->_m_chunkCount; }
        public function messageStartTime() { return $this->_m_messageStartTime; }
        public function messageEndTime() { return $this->_m_messageEndTime; }
        public function lenChannelMessageCounts() { return $this->_m_lenChannelMessageCounts; }
        public function channelMessageCounts() { return $this->_m_channelMessageCounts; }
        public function _raw_channelMessageCounts() { return $this->_m__raw_channelMessageCounts; }
    }
}

namespace Mcap\Statistics {
    class ChannelMessageCount extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\Statistics\ChannelMessageCounts $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_channelId = $this->_io->readU2le();
            $this->_m_messageCount = $this->_io->readU8le();
        }
        protected $_m_channelId;
        protected $_m_messageCount;
        public function channelId() { return $this->_m_channelId; }
        public function messageCount() { return $this->_m_messageCount; }
    }
}

namespace Mcap\Statistics {
    class ChannelMessageCounts extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\Statistics $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Mcap\Statistics\ChannelMessageCount($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace Mcap {
    class SummaryOffset extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\Record $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_groupOpcode = $this->_io->readU1();
            $this->_m_ofsGroup = $this->_io->readU8le();
            $this->_m_lenGroup = $this->_io->readU8le();
        }
        protected $_m_group;
        public function group() {
            if ($this->_m_group !== null)
                return $this->_m_group;
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsGroup());
            $this->_m__raw_group = $io->readBytes($this->lenGroup());
            $_io__raw_group = new \Kaitai\Struct\Stream($this->_m__raw_group);
            $this->_m_group = new \Mcap\Records($_io__raw_group, $this, $this->_root);
            $io->seek($_pos);
            return $this->_m_group;
        }
        protected $_m_groupOpcode;
        protected $_m_ofsGroup;
        protected $_m_lenGroup;
        protected $_m__raw_group;
        public function groupOpcode() { return $this->_m_groupOpcode; }
        public function ofsGroup() { return $this->_m_ofsGroup; }
        public function lenGroup() { return $this->_m_lenGroup; }
        public function _raw_group() { return $this->_m__raw_group; }
    }
}

namespace Mcap {
    class TupleStrStr extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Mcap\MapStrStr\Entries $_parent = null, ?\Mcap $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_key = new \Mcap\PrefixedStr($this->_io, $this, $this->_root);
            $this->_m_value = new \Mcap\PrefixedStr($this->_io, $this, $this->_root);
        }
        protected $_m_key;
        protected $_m_value;
        public function key() { return $this->_m_key; }
        public function value() { return $this->_m_value; }
    }
}

namespace Mcap {
    class Opcode {
        const HEADER = 1;
        const FOOTER = 2;
        const SCHEMA = 3;
        const CHANNEL = 4;
        const MESSAGE = 5;
        const CHUNK = 6;
        const MESSAGE_INDEX = 7;
        const CHUNK_INDEX = 8;
        const ATTACHMENT = 9;
        const ATTACHMENT_INDEX = 10;
        const STATISTICS = 11;
        const METADATA = 12;
        const METADATA_INDEX = 13;
        const SUMMARY_OFFSET = 14;
        const DATA_END = 15;

        private const _VALUES = [1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 14 => true, 15 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
