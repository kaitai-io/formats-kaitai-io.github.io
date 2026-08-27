<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class Zchunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Zchunk $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lead = new \Zchunk\HeaderLead($this->_io, $this, $this->_root);
            $this->_m__raw_headerRest = $this->_io->readBytes($this->lead()->lenHeaderRest()->value());
            $_io__raw_headerRest = new \Kaitai\Struct\Stream($this->_m__raw_headerRest);
            $this->_m_headerRest = new \Zchunk\HeaderWithoutLead($_io__raw_headerRest, $this, $this->_root);
            $this->_m_dict = $this->_io->readBytes($this->headerRest()->index()->lenDict()->value());
            if (!($this->lead()->isDetachedHeader())) {
                $this->_m_chunks = [];
                $n = count($this->headerRest()->index()->chunksMetadata());
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_chunks[] = $this->_io->readBytes($this->headerRest()->index()->chunksMetadata()[$i]->lenChunk()->value());
                }
            }
        }
        protected $_m_lead;
        protected $_m_headerRest;
        protected $_m_dict;
        protected $_m_chunks;
        protected $_m__raw_headerRest;
        public function lead() { return $this->_m_lead; }
        public function headerRest() { return $this->_m_headerRest; }

        /**
         * Custom dictionary used when compressing each chunk. It's compressed itself
         * without a dictionary.
         * 
         * The official zchunk specification calls this section "Compressed Dict".
         * It's also called a "dictionary chunk". `zck_read_header -c` presents it as
         * "chunk 0" (which is always shown in the chunk table, but can have size 0
         * if the dictionary is not in use).
         */
        public function dict() { return $this->_m_dict; }

        /**
         * Chunks of data, each compressed with the custom dictionary `dict` (if
         * applicable).
         * 
         * They are not included in a detached header (`.zhr`) file. Detached headers
         * contain the dictionary, but none of the data chunks.
         */
        public function chunks() { return $this->_m_chunks; }
        public function _raw_headerRest() { return $this->_m__raw_headerRest; }
    }
}

namespace Zchunk {
    class ChecksumType extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Zchunk $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_raw = new \Zchunk\CompressedInteger($this->_io, $this, $this->_root);
            $_ = $this->_m_raw;
            if (!($this->lenChecksum() != 0)) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_raw, $this->_io, "/types/checksum_type/seq/0");
            }
        }
        protected $_m_lenChecksum;
        public function lenChecksum() {
            if ($this->_m_lenChecksum !== null)
                return $this->_m_lenChecksum;
            $this->_m_lenChecksum = ($this->value() == \Zchunk\ChecksumTypes::SHA1 ? 20 : ($this->value() == \Zchunk\ChecksumTypes::SHA256 ? 32 : ($this->value() == \Zchunk\ChecksumTypes::SHA512 ? 64 : ($this->value() == \Zchunk\ChecksumTypes::SHA512_128 ? 16 : 0))));
            return $this->_m_lenChecksum;
        }
        protected $_m_value;
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $this->_m_value = $this->raw()->value();
            return $this->_m_value;
        }
        protected $_m_raw;

        /**
         * Raw integer, don't read this field - access `value` instead.
         */
        public function raw() { return $this->_m_raw; }
    }
}

namespace Zchunk {
    class Chunk extends \Kaitai\Struct\Struct {
        public function __construct(int $lenChecksum, bool $hasDataStreams, bool $hasUncompressedSource, \Kaitai\Struct\Stream $_io, ?\Zchunk\Index $_parent = null, ?\Zchunk $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_lenChecksum = $lenChecksum;
            $this->_m_hasDataStreams = $hasDataStreams;
            $this->_m_hasUncompressedSource = $hasUncompressedSource;
            $this->_read();
        }

        private function _read() {
            if ($this->hasDataStreams()) {
                $this->_m_chunkStream = new \Zchunk\CompressedInteger($this->_io, $this, $this->_root);
            }
            $this->_m_chunkChecksum = $this->_io->readBytes($this->lenChecksum());
            if ($this->hasUncompressedSource()) {
                $this->_m_uncompressedChunkChecksum = $this->_io->readBytes($this->lenChecksum());
            }
            $this->_m_lenChunk = new \Zchunk\CompressedInteger($this->_io, $this, $this->_root);
            $this->_m_lenUncompressedChunk = new \Zchunk\CompressedInteger($this->_io, $this, $this->_root);
        }
        protected $_m_chunkStream;
        protected $_m_chunkChecksum;
        protected $_m_uncompressedChunkChecksum;
        protected $_m_lenChunk;
        protected $_m_lenUncompressedChunk;
        protected $_m_lenChecksum;
        protected $_m_hasDataStreams;
        protected $_m_hasUncompressedSource;
        public function chunkStream() { return $this->_m_chunkStream; }
        public function chunkChecksum() { return $this->_m_chunkChecksum; }

        /**
         * Checksum of the uncompressed chunk. Used to detect whether a chunk
         * from an uncompressed source is identical to the compressed chunk.
         */
        public function uncompressedChunkChecksum() { return $this->_m_uncompressedChunkChecksum; }
        public function lenChunk() { return $this->_m_lenChunk; }
        public function lenUncompressedChunk() { return $this->_m_lenUncompressedChunk; }
        public function lenChecksum() { return $this->_m_lenChecksum; }
        public function hasDataStreams() { return $this->_m_hasDataStreams; }
        public function hasUncompressedSource() { return $this->_m_hasUncompressedSource; }
    }
}

/**
 * Like `/common/vlq_base128_le` (LEB128), but the logic of the
 * "continuation" flag in the most significant bit is inverted, so instead of
 * `has_next`, it is called `is_last` (if the highest bit is set to zero, it
 * means "continue", whereas in standard LEB128, the highest bit set to
 * **one** means "continue"). Therefore, we cannot simply import
 * `/common/vlq_base128_le` and use it, because it is incompatible.
 */

namespace Zchunk {
    class CompressedInteger extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Zchunk $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_groups = [];
            $i = 0;
            do {
                $_ = new \Zchunk\CompressedInteger\Group($i, $this->_io, $this, $this->_root);
                $this->_m_groups[] = $_;
                $i++;
            } while (!($_->isLast()));
        }
        protected $_m_len;
        public function len() {
            if ($this->_m_len !== null)
                return $this->_m_len;
            $this->_m_len = count($this->groups());
            return $this->_m_len;
        }
        protected $_m_value;

        /**
         * Resulting unsigned value as normal integer
         */
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $this->_m_value = ((((((((($this->groups()[0]->value() | ($this->len() >= 2 ? $this->groups()[1]->value() << 7 : 0)) | ($this->len() >= 3 ? $this->groups()[2]->value() << 14 : 0)) | ($this->len() >= 4 ? $this->groups()[3]->value() << 21 : 0)) | ($this->len() >= 5 ? $this->groups()[4]->value() << 28 : 0)) | ($this->len() >= 6 ? $this->groups()[5]->value() << 35 : 0)) | ($this->len() >= 7 ? $this->groups()[6]->value() << 42 : 0)) | ($this->len() >= 8 ? $this->groups()[7]->value() << 49 : 0)) | ($this->len() >= 9 ? $this->groups()[8]->value() << 56 : 0)) | ($this->len() >= 10 ? $this->groups()[9]->value() << 63 : 0));
            return $this->_m_value;
        }
        protected $_m_groups;
        public function groups() { return $this->_m_groups; }
    }
}

/**
 * One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
 */

namespace Zchunk\CompressedInteger {
    class Group extends \Kaitai\Struct\Struct {
        public function __construct(int $idx, \Kaitai\Struct\Stream $_io, ?\Zchunk\CompressedInteger $_parent = null, ?\Zchunk $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_idx = $idx;
            $this->_read();
        }

        private function _read() {
            $this->_m_isLast = $this->_io->readBitsIntBe(1) != 0;
            if (!($this->_m_isLast == ($this->idx() == 9 ? true : $this->isLast()))) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(($this->idx() == 9 ? true : $this->isLast()), $this->_m_isLast, $this->_io, "/types/compressed_integer/types/group/seq/0");
            }
            $this->_m_value = $this->_io->readBitsIntBe(7);
            if (!($this->_m_value <= ($this->idx() == 9 ? 1 : 127))) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(($this->idx() == 9 ? 1 : 127), $this->_m_value, $this->_io, "/types/compressed_integer/types/group/seq/1");
            }
        }
        protected $_m_isLast;
        protected $_m_value;
        protected $_m_idx;

        /**
         * If `true`, then this is the last byte of the compressed integer.
         * 
         * Since this implementation only supports serialized values up to 10
         * bytes, this must be `true` in the 10th group (`groups[9]`).
         */
        public function isLast() { return $this->_m_isLast; }

        /**
         * The 7-bit (base128) numeric value chunk of this group
         * 
         * Since this implementation only supports integer values up to 64 bits,
         * the `value` in the 10th group (`groups[9]`) can only be `0` or `1`
         * (otherwise the width of the represented value would be 65 bits or
         * more, which is not supported).
         */
        public function value() { return $this->_m_value; }
        public function idx() { return $this->_m_idx; }
    }
}

namespace Zchunk {
    class HeaderLead extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Zchunk $_parent = null, ?\Zchunk $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(5);
            if (!( (($this->_m_magic == "\x00\x5A\x43\x4B\x31") || ($this->_m_magic == "\x00\x5A\x48\x52\x31")) )) {
                throw new \Kaitai\Struct\Error\ValidationNotAnyOfError($this->_m_magic, $this->_io, "/types/header_lead/seq/0");
            }
            $this->_m_overallChecksumType = new \Zchunk\ChecksumType($this->_io, $this, $this->_root);
            $this->_m_lenHeaderRest = new \Zchunk\CompressedInteger($this->_io, $this, $this->_root);
            $this->_m_headerChecksum = $this->_io->readBytes($this->overallChecksumType()->lenChecksum());
        }
        protected $_m_isDetachedHeader;

        /**
         * Determines whether this file is a zchunk detached header (`.zhr`). If
         * not, it is a complete zchunk file (`.zck`).
         */
        public function isDetachedHeader() {
            if ($this->_m_isDetachedHeader !== null)
                return $this->_m_isDetachedHeader;
            $this->_m_isDetachedHeader = ord($this->magic()[2]) == 72;
            return $this->_m_isDetachedHeader;
        }
        protected $_m_magic;
        protected $_m_overallChecksumType;
        protected $_m_lenHeaderRest;
        protected $_m_headerChecksum;

        /**
         * There are two valid magic numbers for zchunk files:
         * 
         * * `'\0ZCK1'` identifies a zchunk version 1 file (`.zck`)
         * * `'\0ZHR1'` identifies a zchunk version 1 detached header file (`.zhr`)
         */
        public function magic() { return $this->_m_magic; }

        /**
         * Type of the checksum used for `header_checksum` and
         * `_root.header_rest.preface.data_checksum`.
         */
        public function overallChecksumType() { return $this->_m_overallChecksumType; }

        /**
         * Size of the header, not including the lead
         */
        public function lenHeaderRest() { return $this->_m_lenHeaderRest; }

        /**
         * Checksum of the entire header, which consists of `_root.lead` and
         * `_root.header_rest` (i.e. everything from the beginning of the file to
         * the end of `_root.header_rest`), not including the `header_checksum`
         * field itself (i.e. the input for the checksum algorithm is a
         * concatenation of the bytes preceding the `header_checksum` field with
         * the bytes following it).
         * 
         * For detached headers, the checksum is calculated as if the `magic`
         * field were set to `'\0ZCK1'`, so that it matches the checksum in the
         * full zchunk file.
         */
        public function headerChecksum() { return $this->_m_headerChecksum; }
    }
}

namespace Zchunk {
    class HeaderWithoutLead extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Zchunk $_parent = null, ?\Zchunk $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_preface = new \Zchunk\Preface($this->_io, $this, $this->_root);
            $this->_m_lenIndex = new \Zchunk\CompressedInteger($this->_io, $this, $this->_root);
            $this->_m__raw_index = $this->_io->readBytes($this->lenIndex()->value());
            $_io__raw_index = new \Kaitai\Struct\Stream($this->_m__raw_index);
            $this->_m_index = new \Zchunk\Index($_io__raw_index, $this, $this->_root);
            $this->_m_numSignatures = new \Zchunk\CompressedInteger($this->_io, $this, $this->_root);
            $_ = $this->_m_numSignatures;
            if (!($_->value() == 0)) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_numSignatures, $this->_io, "/types/header_without_lead/seq/3");
            }
        }
        protected $_m_preface;
        protected $_m_lenIndex;
        protected $_m_index;
        protected $_m_numSignatures;
        protected $_m__raw_index;
        public function preface() { return $this->_m_preface; }
        public function lenIndex() { return $this->_m_lenIndex; }
        public function index() { return $this->_m_index; }

        /**
         * Must be 0. The reference implementation also rejects any file with a
         * non-zero "Signature count", throwing a fatal error stating "Signatures
         * aren't supported yet" - see
         * [`src/lib/header.c:259-264`](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/src/lib/header.c#L259-L264).
         * 
         * Although the structure of signatures is defined [in the official
         * textual
         * specification](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L219-L252),
         * no signature types are defined, and as of this writing no publicly
         * known implementation generates or interprets these signatures.
         * Therefore, we've decided not to implement them here either.
         * 
         * For more details, see
         * <https://github.com/kaitai-io/kaitai_struct_formats/pull/539#discussion_r3713109887>.
         */
        public function numSignatures() { return $this->_m_numSignatures; }
        public function _raw_index() { return $this->_m__raw_index; }
    }
}

namespace Zchunk {
    class Index extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Zchunk\HeaderWithoutLead $_parent = null, ?\Zchunk $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_chunkChecksumType = new \Zchunk\ChecksumType($this->_io, $this, $this->_root);
            $this->_m_numChunks = new \Zchunk\CompressedInteger($this->_io, $this, $this->_root);
            $_ = $this->_m_numChunks;
            if (!($_->value() >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_numChunks, $this->_io, "/types/index/seq/1");
            }
            if ($this->_parent()->preface()->hasDataStreams()) {
                $this->_m_dictStream = new \Zchunk\CompressedInteger($this->_io, $this, $this->_root);
                $_ = $this->_m_dictStream;
                if (!($_->value() == 0)) {
                    throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_dictStream, $this->_io, "/types/index/seq/2");
                }
            }
            $this->_m_dictChecksum = $this->_io->readBytes($this->chunkChecksumType()->lenChecksum());
            if ($this->_parent()->preface()->hasUncompressedSource()) {
                $this->_m_uncompressedDictChecksum = $this->_io->readBytes($this->chunkChecksumType()->lenChecksum());
            }
            $this->_m_lenDict = new \Zchunk\CompressedInteger($this->_io, $this, $this->_root);
            $this->_m_lenUncompressedDict = new \Zchunk\CompressedInteger($this->_io, $this, $this->_root);
            $this->_m_chunksMetadata = [];
            $n = $this->numDataChunks();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_chunksMetadata[] = new \Zchunk\Chunk($this->chunkChecksumType()->lenChecksum(), $this->_parent()->preface()->hasDataStreams(), $this->_parent()->preface()->hasUncompressedSource(), $this->_io, $this, $this->_root);
            }
        }
        protected $_m_numDataChunks;

        /**
         * Number of data chunks. `num_chunks` counts the dictionary as chunk 0,
         * so it is one greater than this number.
         */
        public function numDataChunks() {
            if ($this->_m_numDataChunks !== null)
                return $this->_m_numDataChunks;
            $this->_m_numDataChunks = $this->numChunks()->value() - 1;
            return $this->_m_numDataChunks;
        }
        protected $_m_chunkChecksumType;
        protected $_m_numChunks;
        protected $_m_dictStream;
        protected $_m_dictChecksum;
        protected $_m_uncompressedDictChecksum;
        protected $_m_lenDict;
        protected $_m_lenUncompressedDict;
        protected $_m_chunksMetadata;

        /**
         * Type of the checksum used for `dict_checksum` and for all
         * `chunks_metadata[...].chunk_checksum` and
         * `chunks_metadata[...].uncompressed_chunk_checksum`.
         */
        public function chunkChecksumType() { return $this->_m_chunkChecksumType; }

        /**
         * Number of chunks, **including** the dictionary chunk.
         * 
         * Must be at least 1, because the dictionary chunk is always present,
         * even if it is empty. The reference implementation also fails when the
         * number of chunks is 0, see
         * [`src/lib/index/index_read.c:181-184`](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/src/lib/index/index_read.c#L181-L184).
         */
        public function numChunks() { return $this->_m_numChunks; }

        /**
         * If present, it must always be 0.
         */
        public function dictStream() { return $this->_m_dictStream; }
        public function dictChecksum() { return $this->_m_dictChecksum; }

        /**
         * Checksum of the uncompressed dictionary. It has no real use, as the
         * uncompressed source won't have a dictionary.
         */
        public function uncompressedDictChecksum() { return $this->_m_uncompressedDictChecksum; }
        public function lenDict() { return $this->_m_lenDict; }
        public function lenUncompressedDict() { return $this->_m_lenUncompressedDict; }

        /**
         * Metadata of the data chunks. The dictionary is chunk 0 and its
         * metadata is stored in the `*dict*` fields above, so there is one fewer
         * entry here than indicated by `num_chunks`.
         */
        public function chunksMetadata() { return $this->_m_chunksMetadata; }
    }
}

namespace Zchunk {
    class OptionalElement extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Zchunk\Preface $_parent = null, ?\Zchunk $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_elementId = new \Zchunk\CompressedInteger($this->_io, $this, $this->_root);
            $this->_m_lenData = new \Zchunk\CompressedInteger($this->_io, $this, $this->_root);
            $this->_m_data = $this->_io->readBytes($this->lenData()->value());
        }
        protected $_m_elementId;
        protected $_m_lenData;
        protected $_m_data;
        public function elementId() { return $this->_m_elementId; }
        public function lenData() { return $this->_m_lenData; }
        public function data() { return $this->_m_data; }
    }
}

namespace Zchunk {
    class Preface extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Zchunk\HeaderWithoutLead $_parent = null, ?\Zchunk $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_dataChecksum = $this->_io->readBytes($this->_root()->lead()->overallChecksumType()->lenChecksum());
            $this->_m_flags = new \Zchunk\CompressedInteger($this->_io, $this, $this->_root);
            $_ = $this->_m_flags;
            if (!($_->value() <= 7)) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_flags, $this->_io, "/types/preface/seq/1");
            }
            $this->_m_compressionTypeInt = new \Zchunk\CompressedInteger($this->_io, $this, $this->_root);
            $_ = $this->_m_compressionTypeInt;
            if (!( (($_->value() == \Zchunk\CompressionTypes::NONE) || ($_->value() == \Zchunk\CompressionTypes::ZSTD)) )) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_compressionTypeInt, $this->_io, "/types/preface/seq/2");
            }
            if ($this->hasOptionalElements()) {
                $this->_m_numOptionalElements = new \Zchunk\CompressedInteger($this->_io, $this, $this->_root);
                $_ = $this->_m_numOptionalElements;
                if (!($_->value() >= 1)) {
                    throw new \Kaitai\Struct\Error\ValidationExprError($this->_m_numOptionalElements, $this->_io, "/types/preface/seq/3");
                }
            }
            if ($this->hasOptionalElements()) {
                $this->_m_optionalElements = [];
                $n = $this->numOptionalElements()->value();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_optionalElements[] = new \Zchunk\OptionalElement($this->_io, $this, $this->_root);
                }
            }
        }
        protected $_m_compressionType;
        public function compressionType() {
            if ($this->_m_compressionType !== null)
                return $this->_m_compressionType;
            $this->_m_compressionType = $this->compressionTypeInt()->value();
            return $this->_m_compressionType;
        }
        protected $_m_hasDataStreams;
        public function hasDataStreams() {
            if ($this->_m_hasDataStreams !== null)
                return $this->_m_hasDataStreams;
            $this->_m_hasDataStreams = ($this->flags()->value() & 1) != 0;
            return $this->_m_hasDataStreams;
        }
        protected $_m_hasOptionalElements;
        public function hasOptionalElements() {
            if ($this->_m_hasOptionalElements !== null)
                return $this->_m_hasOptionalElements;
            $this->_m_hasOptionalElements = ($this->flags()->value() & 2) != 0;
            return $this->_m_hasOptionalElements;
        }
        protected $_m_hasUncompressedSource;

        /**
         * The file may be applied against an uncompressed source. This adds an
         * uncompressed checksum to every index entry, including the dictionary.
         */
        public function hasUncompressedSource() {
            if ($this->_m_hasUncompressedSource !== null)
                return $this->_m_hasUncompressedSource;
            $this->_m_hasUncompressedSource = ($this->flags()->value() & 4) != 0;
            return $this->_m_hasUncompressedSource;
        }
        protected $_m_dataChecksum;
        protected $_m_flags;
        protected $_m_compressionTypeInt;
        protected $_m_numOptionalElements;
        protected $_m_optionalElements;

        /**
         * Total data checksum. Checksum of everything after the header,
         * including the compressed dictionary (`_root.dict`) and all compressed
         * chunks (`_root.chunks`). The type of this checksum is
         * `_root.lead.overall_checksum_type.value`.
         * 
         * If `has_uncompressed_source` is true, this checksum must not be
         * checked and should not be generated. In that case, the reference
         * implementation writes it as all zeros - see the sample file
         * [`mini-uncomp-cksums.zck`](https://github.com/kaitai-io/kaitai_struct_samples/blob/1d2fe11c971fb7e86f343b77a1ed341a0217e86a/archive/zchunk/README.md#mini-uncomp-cksumszck).
         */
        public function dataChecksum() { return $this->_m_dataChecksum; }

        /**
         * Compressed integer containing a bitmask of the flags. All unused flags
         * MUST be set to 0. If a decoder sees a flag set that it doesn't
         * recognize, it MUST exit with an error.
         */
        public function flags() { return $this->_m_flags; }

        /**
         * Raw integer, don't read this field - access `compression_type`
         * instead.
         */
        public function compressionTypeInt() { return $this->_m_compressionTypeInt; }

        /**
         * If present, it must be at least 1. This is because if there are no
         * optional elements, `has_optional_elements` must be false, and then
         * neither this field nor `optional_elements` is present.
         */
        public function numOptionalElements() { return $this->_m_numOptionalElements; }
        public function optionalElements() { return $this->_m_optionalElements; }
    }
}

namespace Zchunk {
    class ChecksumTypes {
        const SHA1 = 0;
        const SHA256 = 1;
        const SHA512 = 2;
        const SHA512_128 = 3;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Zchunk {
    class CompressionTypes {
        const NONE = 0;
        const ZSTD = 2;

        private const _VALUES = [0 => true, 2 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
