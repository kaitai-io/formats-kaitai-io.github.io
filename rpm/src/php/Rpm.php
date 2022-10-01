<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * This parser is for the RPM version 3 file format which is the current version
 * of the file format used by RPM 2.1 and later (including RPM version 4.x, which
 * is the current version of the RPM tool). There are historical versions of the
 * RPM file format, as well as a currently abandoned fork (rpm5). These formats
 * are not covered by this specification.
 */

namespace {
    class Rpm extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Rpm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lead = new \Rpm\Lead($this->_io, $this, $this->_root);
            $this->_m_signature = new \Rpm\Header(true, $this->_io, $this, $this->_root);
            $this->_m_signaturePadding = $this->_io->readBytes(\Kaitai\Struct\Stream::mod(-($this->_io()->pos()), 8));
            if ($this->ofsHeader() < 0) {
                $this->_m__unnamed3 = $this->_io->readBytes(0);
            }
            $this->_m_header = new \Rpm\Header(false, $this->_io, $this, $this->_root);
            if ($this->ofsPayload() < 0) {
                $this->_m__unnamed5 = $this->_io->readBytes(0);
            }
            $this->_m_signatureTagsSteps = [];
            $n = $this->signature()->headerRecord()->numIndexRecords();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_signatureTagsSteps[] = new \Rpm\SignatureTagsStep($i, ($i < 1 ? -1 : $this->signatureTagsSteps()[($i - 1)]->sizeTagIdx()), $this->_io, $this, $this->_root);
            }
        }
        protected $_m_hasSignatureSizeTag;
        public function hasSignatureSizeTag() {
            if ($this->_m_hasSignatureSizeTag !== null)
                return $this->_m_hasSignatureSizeTag;
            $this->_m_hasSignatureSizeTag = $this->signatureTagsSteps()[count($this->signatureTagsSteps()) - 1]->sizeTagIdx() != -1;
            return $this->_m_hasSignatureSizeTag;
        }
        protected $_m_signatureSizeTag;
        public function signatureSizeTag() {
            if ($this->_m_signatureSizeTag !== null)
                return $this->_m_signatureSizeTag;
            if ($this->hasSignatureSizeTag()) {
                $this->_m_signatureSizeTag = $this->signature()->indexRecords()[$this->signatureTagsSteps()[count($this->signatureTagsSteps()) - 1]->sizeTagIdx()];
            }
            return $this->_m_signatureSizeTag;
        }
        protected $_m_lenPayload;
        public function lenPayload() {
            if ($this->_m_lenPayload !== null)
                return $this->_m_lenPayload;
            if ($this->hasSignatureSizeTag()) {
                $this->_m_lenPayload = ($this->signatureSizeTag()->body()->values()[0] - $this->lenHeader());
            }
            return $this->_m_lenPayload;
        }
        protected $_m_payload;
        public function payload() {
            if ($this->_m_payload !== null)
                return $this->_m_payload;
            if ($this->hasSignatureSizeTag()) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->ofsPayload());
                $this->_m_payload = $this->_io->readBytes($this->lenPayload());
                $this->_io->seek($_pos);
            }
            return $this->_m_payload;
        }
        protected $_m_lenHeader;
        public function lenHeader() {
            if ($this->_m_lenHeader !== null)
                return $this->_m_lenHeader;
            $this->_m_lenHeader = ($this->ofsPayload() - $this->ofsHeader());
            return $this->_m_lenHeader;
        }
        protected $_m_ofsHeader;
        public function ofsHeader() {
            if ($this->_m_ofsHeader !== null)
                return $this->_m_ofsHeader;
            $this->_m_ofsHeader = $this->_io()->pos();
            return $this->_m_ofsHeader;
        }
        protected $_m_ofsPayload;
        public function ofsPayload() {
            if ($this->_m_ofsPayload !== null)
                return $this->_m_ofsPayload;
            $this->_m_ofsPayload = $this->_io()->pos();
            return $this->_m_ofsPayload;
        }
        protected $_m_lead;
        protected $_m_signature;
        protected $_m_signaturePadding;
        protected $_m__unnamed3;
        protected $_m_header;
        protected $_m__unnamed5;
        protected $_m_signatureTagsSteps;
        public function lead() { return $this->_m_lead; }
        public function signature() { return $this->_m_signature; }
        public function signaturePadding() { return $this->_m_signaturePadding; }
        public function _unnamed3() { return $this->_m__unnamed3; }
        public function header() { return $this->_m_header; }
        public function _unnamed5() { return $this->_m__unnamed5; }
        public function signatureTagsSteps() { return $this->_m_signatureTagsSteps; }
    }
}

namespace Rpm {
    class RecordTypeStringArray extends \Kaitai\Struct\Struct {
        public function __construct(int $numValues, \Kaitai\Struct\Stream $_io, \Rpm\HeaderIndexRecord $_parent = null, \Rpm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_numValues = $numValues;
            $this->_read();
        }

        private function _read() {
            $this->_m_values = [];
            $n = $this->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "UTF-8");
            }
        }
        protected $_m_values;
        protected $_m_numValues;
        public function values() { return $this->_m_values; }
        public function numValues() { return $this->_m_numValues; }
    }
}

/**
 * In 2021, Panu Matilainen (a RPM developer) [described this
 * structure](https://github.com/kaitai-io/kaitai_struct_formats/pull/469#discussion_r718288192)
 * as follows:
 * 
 * > The lead as a structure is 25 years obsolete, the data there is
 * > meaningless. Seriously. Except to check for the magic to detect that
 * > it's an rpm file in the first place, just ignore everything in it.
 * > Literally everything.
 * 
 * The fields with `valid` constraints are important, because these are the
 * same validations that RPM does (which means that any valid `.rpm` file
 * must pass them), but otherwise you should not make decisions based on the
 * values given here.
 */

namespace Rpm {
    class Lead extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Rpm $_parent = null, \Rpm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->magic() == "\xED\xAB\xEE\xDB")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\xED\xAB\xEE\xDB", $this->magic(), $this->_io(), "/types/lead/seq/0");
            }
            $this->_m_version = new \Rpm\RpmVersion($this->_io, $this, $this->_root);
            $this->_m_type = $this->_io->readU2be();
            $this->_m_architecture = $this->_io->readU2be();
            $this->_m_packageName = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(66), 0, false), "UTF-8");
            $this->_m_os = $this->_io->readU2be();
            $this->_m_signatureType = $this->_io->readU2be();
            if (!($this->signatureType() == 5)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(5, $this->signatureType(), $this->_io(), "/types/lead/seq/6");
            }
            $this->_m_reserved = $this->_io->readBytes(16);
        }
        protected $_m_magic;
        protected $_m_version;
        protected $_m_type;
        protected $_m_architecture;
        protected $_m_packageName;
        protected $_m_os;
        protected $_m_signatureType;
        protected $_m_reserved;
        public function magic() { return $this->_m_magic; }
        public function version() { return $this->_m_version; }
        public function type() { return $this->_m_type; }
        public function architecture() { return $this->_m_architecture; }
        public function packageName() { return $this->_m_packageName; }
        public function os() { return $this->_m_os; }
        public function signatureType() { return $this->_m_signatureType; }
        public function reserved() { return $this->_m_reserved; }
    }
}

namespace Rpm {
    class RecordTypeString extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Rpm\HeaderIndexRecord $_parent = null, \Rpm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_values = [];
            $n = 1;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "UTF-8");
            }
        }
        protected $_m_values;
        public function values() { return $this->_m_values; }
    }
}

namespace Rpm {
    class SignatureTagsStep extends \Kaitai\Struct\Struct {
        public function __construct(int $idx, int $prevSizeTagIdx, \Kaitai\Struct\Stream $_io, \Rpm $_parent = null, \Rpm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_idx = $idx;
            $this->_m_prevSizeTagIdx = $prevSizeTagIdx;
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_sizeTagIdx;
        public function sizeTagIdx() {
            if ($this->_m_sizeTagIdx !== null)
                return $this->_m_sizeTagIdx;
            $this->_m_sizeTagIdx = ($this->prevSizeTagIdx() != -1 ? $this->prevSizeTagIdx() : ( (($this->_parent()->signature()->indexRecords()[$this->idx()]->signatureTag() == \Rpm\SignatureTags::SIZE) && ($this->_parent()->signature()->indexRecords()[$this->idx()]->recordType() == \Rpm\RecordTypes::UINT32) && ($this->_parent()->signature()->indexRecords()[$this->idx()]->numValues() >= 1))  ? $this->idx() : -1));
            return $this->_m_sizeTagIdx;
        }
        protected $_m_idx;
        protected $_m_prevSizeTagIdx;
        public function idx() { return $this->_m_idx; }
        public function prevSizeTagIdx() { return $this->_m_prevSizeTagIdx; }
    }
}

namespace Rpm {
    class RecordTypeUint32 extends \Kaitai\Struct\Struct {
        public function __construct(int $numValues, \Kaitai\Struct\Stream $_io, \Rpm\HeaderIndexRecord $_parent = null, \Rpm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_numValues = $numValues;
            $this->_read();
        }

        private function _read() {
            $this->_m_values = [];
            $n = $this->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = $this->_io->readU4be();
            }
        }
        protected $_m_values;
        protected $_m_numValues;
        public function values() { return $this->_m_values; }
        public function numValues() { return $this->_m_numValues; }
    }
}

namespace Rpm {
    class RecordTypeUint16 extends \Kaitai\Struct\Struct {
        public function __construct(int $numValues, \Kaitai\Struct\Stream $_io, \Rpm\HeaderIndexRecord $_parent = null, \Rpm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_numValues = $numValues;
            $this->_read();
        }

        private function _read() {
            $this->_m_values = [];
            $n = $this->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = $this->_io->readU2be();
            }
        }
        protected $_m_values;
        protected $_m_numValues;
        public function values() { return $this->_m_values; }
        public function numValues() { return $this->_m_numValues; }
    }
}

namespace Rpm {
    class HeaderIndexRecord extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Rpm\Header $_parent = null, \Rpm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_tagRaw = $this->_io->readU4be();
            $this->_m_recordType = $this->_io->readU4be();
            $this->_m_ofsBody = $this->_io->readU4be();
            $this->_m_count = $this->_io->readU4be();
        }
        protected $_m_numValues;
        public function numValues() {
            if ($this->_m_numValues !== null)
                return $this->_m_numValues;
            if ($this->recordType() != \Rpm\RecordTypes::BIN) {
                $this->_m_numValues = $this->count();
            }
            return $this->_m_numValues;
        }
        protected $_m_body;
        public function body() {
            if ($this->_m_body !== null)
                return $this->_m_body;
            $io = $this->_parent()->storageSection()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsBody());
            switch ($this->recordType()) {
                case \Rpm\RecordTypes::UINT32:
                    $this->_m_body = new \Rpm\RecordTypeUint32($this->numValues(), $io, $this, $this->_root);
                    break;
                case \Rpm\RecordTypes::UINT64:
                    $this->_m_body = new \Rpm\RecordTypeUint64($this->numValues(), $io, $this, $this->_root);
                    break;
                case \Rpm\RecordTypes::BIN:
                    $this->_m_body = new \Rpm\RecordTypeBin($this->lenValue(), $io, $this, $this->_root);
                    break;
                case \Rpm\RecordTypes::STRING:
                    $this->_m_body = new \Rpm\RecordTypeString($io, $this, $this->_root);
                    break;
                case \Rpm\RecordTypes::UINT8:
                    $this->_m_body = new \Rpm\RecordTypeUint8($this->numValues(), $io, $this, $this->_root);
                    break;
                case \Rpm\RecordTypes::I18N_STRING:
                    $this->_m_body = new \Rpm\RecordTypeStringArray($this->numValues(), $io, $this, $this->_root);
                    break;
                case \Rpm\RecordTypes::UINT16:
                    $this->_m_body = new \Rpm\RecordTypeUint16($this->numValues(), $io, $this, $this->_root);
                    break;
                case \Rpm\RecordTypes::CHAR:
                    $this->_m_body = new \Rpm\RecordTypeUint8($this->numValues(), $io, $this, $this->_root);
                    break;
                case \Rpm\RecordTypes::STRING_ARRAY:
                    $this->_m_body = new \Rpm\RecordTypeStringArray($this->numValues(), $io, $this, $this->_root);
                    break;
            }
            $io->seek($_pos);
            return $this->_m_body;
        }
        protected $_m_signatureTag;
        public function signatureTag() {
            if ($this->_m_signatureTag !== null)
                return $this->_m_signatureTag;
            if ($this->_parent()->isSignature()) {
                $this->_m_signatureTag = $this->tagRaw();
            }
            return $this->_m_signatureTag;
        }
        protected $_m_lenValue;
        public function lenValue() {
            if ($this->_m_lenValue !== null)
                return $this->_m_lenValue;
            if ($this->recordType() == \Rpm\RecordTypes::BIN) {
                $this->_m_lenValue = $this->count();
            }
            return $this->_m_lenValue;
        }
        protected $_m_headerTag;
        public function headerTag() {
            if ($this->_m_headerTag !== null)
                return $this->_m_headerTag;
            if ($this->_parent()->isHeader()) {
                $this->_m_headerTag = $this->tagRaw();
            }
            return $this->_m_headerTag;
        }
        protected $_m_tagRaw;
        protected $_m_recordType;
        protected $_m_ofsBody;
        protected $_m_count;

        /**
         * prefer to access `signature_tag` and `header_tag` instead
         */
        public function tagRaw() { return $this->_m_tagRaw; }
        public function recordType() { return $this->_m_recordType; }
        public function ofsBody() { return $this->_m_ofsBody; }

        /**
         * internal; access `num_values` and `len_value` instead
         */
        public function count() { return $this->_m_count; }
    }
}

namespace Rpm {
    class RpmVersion extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Rpm\Lead $_parent = null, \Rpm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_major = $this->_io->readU1();
            if (!($this->major() >= 3)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(3, $this->major(), $this->_io(), "/types/rpm_version/seq/0");
            }
            if (!($this->major() <= 4)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(4, $this->major(), $this->_io(), "/types/rpm_version/seq/0");
            }
            $this->_m_minor = $this->_io->readU1();
        }
        protected $_m_major;
        protected $_m_minor;
        public function major() { return $this->_m_major; }
        public function minor() { return $this->_m_minor; }
    }
}

namespace Rpm {
    class Dummy extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Rpm\Header $_parent = null, \Rpm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
        }
    }
}

namespace Rpm {
    class RecordTypeUint8 extends \Kaitai\Struct\Struct {
        public function __construct(int $numValues, \Kaitai\Struct\Stream $_io, \Rpm\HeaderIndexRecord $_parent = null, \Rpm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_numValues = $numValues;
            $this->_read();
        }

        private function _read() {
            $this->_m_values = [];
            $n = $this->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = $this->_io->readU1();
            }
        }
        protected $_m_values;
        protected $_m_numValues;
        public function values() { return $this->_m_values; }
        public function numValues() { return $this->_m_numValues; }
    }
}

namespace Rpm {
    class RecordTypeUint64 extends \Kaitai\Struct\Struct {
        public function __construct(int $numValues, \Kaitai\Struct\Stream $_io, \Rpm\HeaderIndexRecord $_parent = null, \Rpm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_numValues = $numValues;
            $this->_read();
        }

        private function _read() {
            $this->_m_values = [];
            $n = $this->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = $this->_io->readU8be();
            }
        }
        protected $_m_values;
        protected $_m_numValues;
        public function values() { return $this->_m_values; }
        public function numValues() { return $this->_m_numValues; }
    }
}

namespace Rpm {
    class RecordTypeBin extends \Kaitai\Struct\Struct {
        public function __construct(int $lenValue, \Kaitai\Struct\Stream $_io, \Rpm\HeaderIndexRecord $_parent = null, \Rpm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_lenValue = $lenValue;
            $this->_read();
        }

        private function _read() {
            $this->_m_values = [];
            $n = 1;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = $this->_io->readBytes($this->lenValue());
            }
        }
        protected $_m_values;
        protected $_m_lenValue;
        public function values() { return $this->_m_values; }
        public function lenValue() { return $this->_m_lenValue; }
    }
}

namespace Rpm {
    class HeaderRecord extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Rpm\Header $_parent = null, \Rpm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->magic() == "\x8E\xAD\xE8\x01")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x8E\xAD\xE8\x01", $this->magic(), $this->_io(), "/types/header_record/seq/0");
            }
            $this->_m_reserved = $this->_io->readBytes(4);
            if (!($this->reserved() == "\x00\x00\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00\x00\x00\x00", $this->reserved(), $this->_io(), "/types/header_record/seq/1");
            }
            $this->_m_numIndexRecords = $this->_io->readU4be();
            if (!($this->numIndexRecords() >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->numIndexRecords(), $this->_io(), "/types/header_record/seq/2");
            }
            $this->_m_lenStorageSection = $this->_io->readU4be();
        }
        protected $_m_magic;
        protected $_m_reserved;
        protected $_m_numIndexRecords;
        protected $_m_lenStorageSection;
        public function magic() { return $this->_m_magic; }
        public function reserved() { return $this->_m_reserved; }
        public function numIndexRecords() { return $this->_m_numIndexRecords; }

        /**
         * Size of the storage area for the data
         * pointed to by the Index Records.
         */
        public function lenStorageSection() { return $this->_m_lenStorageSection; }
    }
}

/**
 * header structure used for both the "header" and "signature", but some tag
 * values have different meanings in signature and header (hence they use
 * different enums)
 */

namespace Rpm {
    class Header extends \Kaitai\Struct\Struct {
        public function __construct(bool $isSignature, \Kaitai\Struct\Stream $_io, \Rpm $_parent = null, \Rpm $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_isSignature = $isSignature;
            $this->_read();
        }

        private function _read() {
            $this->_m_headerRecord = new \Rpm\HeaderRecord($this->_io, $this, $this->_root);
            $this->_m_indexRecords = [];
            $n = $this->headerRecord()->numIndexRecords();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_indexRecords[] = new \Rpm\HeaderIndexRecord($this->_io, $this, $this->_root);
            }
            $this->_m__raw_storageSection = $this->_io->readBytes($this->headerRecord()->lenStorageSection());
            $_io__raw_storageSection = new \Kaitai\Struct\Stream($this->_m__raw_storageSection);
            $this->_m_storageSection = new \Rpm\Dummy($_io__raw_storageSection, $this, $this->_root);
        }
        protected $_m_isHeader;
        public function isHeader() {
            if ($this->_m_isHeader !== null)
                return $this->_m_isHeader;
            $this->_m_isHeader = !($this->isSignature());
            return $this->_m_isHeader;
        }
        protected $_m_headerRecord;
        protected $_m_indexRecords;
        protected $_m_storageSection;
        protected $_m_isSignature;
        protected $_m__raw_storageSection;
        public function headerRecord() { return $this->_m_headerRecord; }
        public function indexRecords() { return $this->_m_indexRecords; }
        public function storageSection() { return $this->_m_storageSection; }
        public function isSignature() { return $this->_m_isSignature; }
        public function _raw_storageSection() { return $this->_m__raw_storageSection; }
    }
}

namespace Rpm {
    class OperatingSystems {
        const LINUX = 1;
        const IRIX = 2;

        /**
         * This value is pretty much a guess, based on that `archnum` and `osnum`
         * values are handled by the same function `getMachineInfo()` (see
         * `doc-ref` link) which uses 255 for an unknown value. Value
         * `architectures::no_arch` can be verified with the magic file of
         * `file(1)` and `.rpm` files that have `noarch` in their name, so it seems
         * reasonable that `no_os` (or "`noos`" originally) follows the same
         * pattern.
         * 
         * Moreover, this value is actually used in practice, see this sample file:
         * <https://github.com/craigwblake/redline/blob/15afff5/src/test/resources/rpm-3-1.0-1.somearch.rpm>
         */
        const NO_OS = 255;
    }
}

namespace Rpm {
    class SignatureTags {
        const SIGNATURES = 62;
        const HEADER_IMMUTABLE = 63;
        const I18N_TABLE = 100;
        const BAD_SHA1_1_OBSOLETE = 264;
        const BAD_SHA1_2_OBSOLETE = 265;
        const DSA = 267;
        const RSA = 268;
        const SHA1 = 269;
        const LONG_SIZE = 270;
        const LONG_ARCHIVE_SIZE = 271;
        const SHA256 = 273;
        const FILE_SIGNATURES = 274;
        const FILE_SIGNATURE_LENGTH = 275;
        const VERITY_SIGNATURES = 276;
        const VERITY_SIGNATURE_ALGO = 277;

        /**
         * Header + payload size (32bit) in bytes.
         */
        const SIZE = 1000;

        /**
         * MD5 broken on big-endian machines, take 1
         */
        const LE_MD5_1_OBSOLETE = 1001;

        /**
         * PGP 2.6.3 signature.
         */
        const PGP = 1002;

        /**
         * MD5 broken on big-endian machines, take 2
         */
        const LE_MD5_2_OBSOLETE = 1003;

        /**
         * MD5 signature
         */
        const MD5 = 1004;

        /**
         * GnuPG signature
         */
        const GPG = 1005;
        const PGP5_OBSOLETE = 1006;

        /**
         * Uncompressed payload size (32bit) in bytes.
         */
        const PAYLOAD_SIZE = 1007;

        /**
         * Space reserved for signatures
         */
        const RESERVED_SPACE = 1008;
    }
}

namespace Rpm {
    class RecordTypes {
        const NOT_IMPLEMENTED = 0;
        const CHAR = 1;
        const UINT8 = 2;
        const UINT16 = 3;
        const UINT32 = 4;
        const UINT64 = 5;
        const STRING = 6;
        const BIN = 7;
        const STRING_ARRAY = 8;
        const I18N_STRING = 9;
    }
}

namespace Rpm {
    class HeaderTags {
        const SIGNATURES = 62;
        const HEADER_IMMUTABLE = 63;
        const I18N_TABLE = 100;

        /**
         * Specifies the name of the package.
         */
        const NAME = 1000;

        /**
         * Specifies the version of the package.
         */
        const VERSION = 1001;

        /**
         * Specifies the release of the package.
         */
        const RELEASE = 1002;
        const EPOCH = 1003;

        /**
         * Specifies the summary description of the package. The summary
         * value pointed to by this index record contains a one line
         * description of the package.
         */
        const SUMMARY = 1004;

        /**
         * Specifies the description of the package. The description value
         * pointed to by this index record contains a full desription of
         * the package.
         */
        const DESCRIPTION = 1005;

        /**
         * Specifies the time as seconds since the epoch
         * at which the package was built.
         */
        const BUILD_TIME = 1006;

        /**
         * Specifies the hostname of the system on which the package was built.
         */
        const BUILD_HOST = 1007;
        const INSTALL_TIME = 1008;

        /**
         * Specifies the sum of the sizes of the regular files in the archive.
         */
        const SIZE = 1009;

        /**
         * Contains the name of the distribution on which the package was built.
         */
        const DISTRIBUTION = 1010;

        /**
         * Contains the name of the organization that produced the package.
         */
        const VENDOR = 1011;
        const GIF_OBSOLETE = 1012;
        const XPM_OBSOLETE = 1013;

        /**
         * Specifies the license which applies to this package.
         */
        const LICENSE = 1014;

        /**
         * Identifies the tool used to build the package.
         */
        const PACKAGER = 1015;

        /**
         * Specifies the administrative group to which this package belongs.
         */
        const GROUP = 1016;
        const CHANGELOG_INTERNAL = 1017;
        const SOURCE = 1018;
        const PATCH = 1019;

        /**
         * Generic package information URL.
         */
        const URL = 1020;

        /**
         * Specifies the OS of the package.
         */
        const OS = 1021;

        /**
         * Specifies the architecture of the package.
         */
        const ARCH = 1022;

        /**
         * Specifies the preinstall scriptlet. If present, then
         * `::pre_install_interpreter` shall also be present.
         */
        const PRE_INSTALL_SCRIPTLET = 1023;

        /**
         * Specifies the postinstall scriptlet. If present, then
         * `::post_install_interpreter` shall also be present.
         */
        const POST_INSTALL_SCRIPTLET = 1024;

        /**
         * Specifies the preuninstall scriptlet. If present, then
         * `::pre_uninstall_interpreter` shall also be present.
         */
        const PRE_UNINSTALL_SCRIPTLET = 1025;

        /**
         * Specifies the postuninstall scriptlet. If present, then
         * `::post_uninstall_interpreter` shall also be present.
         */
        const POST_UNINSTALL_SCRIPTLET = 1026;
        const OLD_FILE_NAMES_OBSOLETE = 1027;

        /**
         * Specifies the size of each file in the archive.
         */
        const FILE_SIZES = 1028;
        const FILE_STATES = 1029;

        /**
         * The mode of each file in the archive.
         */
        const FILE_MODES = 1030;
        const FILE_UIDS_INTERNAL = 1031;
        const FILE_GIDS_INTERNAL = 1032;

        /**
         * The device number from which the file was copied.
         */
        const DEVICE_NUMBER = 1033;

        /**
         * The modification time in seconds since the epoch
         * of each file in the archive.
         */
        const MTIMES = 1034;

        /**
         * The ASCII representation of the MD5 sum of the corresponding
         * file contents. This value is empty if the corresponding archive
         * entry is not a regular file.
         */
        const FILE_DIGESTS = 1035;

        /**
         * The target for a symlink, otherwise NULL.
         */
        const LINK_TOS = 1036;

        /**
         * Specifies the bit(s) to classify and control how files
         * are to be installed.
         */
        const FILE_FLAGS = 1037;
        const ROOT_INTERNAL = 1038;

        /**
         * Specifies the owner of the corresponding file.
         */
        const FILE_OWNER = 1039;

        /**
         * Specifies the group of the corresponding file.
         */
        const FILE_GROUP = 1040;
        const EXCLUDE_INTERNAL = 1041;
        const EXCLUSIVE_INTERNAL = 1042;
        const ICON_OBSOLETE = 1043;

        /**
         * Specifies the name of the source RPM.
         */
        const SOURCE_RPM = 1044;

        /**
         * Specifies the bit(s) to control how files are to be verified
         * after install, specifying which checks should be performed.
         */
        const FILE_VERIFY_FLAGS = 1045;

        /**
         * Specifies the uncompressed size of the Payload archive,
         * including the cpio headers.
         */
        const ARCHIVE_SIZE = 1046;

        /**
         * The name of the dependency provided by this package.
         */
        const PROVIDE_NAME = 1047;

        /**
         * Bits(s) to specify the dependency range and context.
         */
        const REQUIRE_FLAGS = 1048;

        /**
         * Indicates the dependencies for this package.
         */
        const REQUIRE_NAME = 1049;

        /**
         * Indicates the versions associated with the values found
         * in the require_name index.
         */
        const REQUIRE_VERSION = 1050;
        const NO_SOURCE = 1051;
        const NO_PATCH = 1052;

        /**
         * Bits(s) to specify the conflict range and context.
         */
        const CONFLICT_FLAGS = 1053;

        /**
         * Indicates the conflicting dependencies for this package.
         */
        const CONFLICT_NAME = 1054;

        /**
         * Indicates the versions associated with the
         * values found in the conflict_name index.
         */
        const CONFLICT_VERSION = 1055;
        const DEFAULT_PREFIX_INTERNAL = 1056;
        const BUILD_ROOT_INTERNAL = 1057;
        const INSTALL_PREFIX_INTERNAL = 1058;
        const EXCLUDE_ARCH = 1059;
        const EXCLUDE_OS = 1060;
        const EXCLUSIVE_ARCH = 1061;
        const EXCLUSIVE_OS = 1062;
        const AUTOREQPROV_INTERNAL = 1063;

        /**
         * Indicates the version of RPM tool used to build this package.
         */
        const RPM_VERSION = 1064;
        const TRIGGER_SCRIPTS = 1065;
        const TRIGGER_NAME = 1066;
        const TRIGGER_VERSION = 1067;
        const TRIGGER_FLAGS = 1068;
        const TRIGGER_INDEX = 1069;
        const VERIFY_SCRIPT = 1079;

        /**
         * Specifies the Unix time in seconds since the epoch
         * associated with each entry in the Changelog file.
         */
        const CHANGELOG_TIME = 1080;

        /**
         * Specifies the name of who made a change to this package.
         */
        const CHANGELOG_NAME = 1081;

        /**
         * Specifies the changes asssociated with a changelog entry.
         */
        const CHANGELOG_TEXT = 1082;
        const BROKEN_MD5_INTERNAL = 1083;
        const PREREQ_INTERNAL = 1084;

        /**
         * Specifies the name of the interpreter to which the preinstall
         * scriptlet will be passed. The interpreter pointed to by this
         * index record shall be `/bin/sh`.
         */
        const PRE_INSTALL_INTERPRETER = 1085;

        /**
         * Specifies the name of the interpreter to which the postinstall
         * scriptlet will be passed. The intepreter pointed to by this
         * index record shall be `/bin/sh`.
         */
        const POST_INSTALL_INTERPRETER = 1086;

        /**
         * Specifies the name of the interpreter to which the preuninstall
         * scriptlet will be passed. The interpreter pointed to by this index
         * record shall be `/bin/sh`.
         */
        const PRE_UNINSTALL_INTERPRETER = 1087;

        /**
         * Specifies the name of the interpreter to which the postuninstall
         * scriptlet will be passed. The interpreter pointed to by this index
         * record shall be `/bin/sh`.
         */
        const POST_UNINSTALL_INTERPRETER = 1088;
        const BUILD_ARCHS = 1089;

        /**
         * Indicates the obsoleted dependencies for this package.
         */
        const OBSOLETE_NAME = 1090;
        const VERIFY_SCRIPT_PROG = 1091;
        const TRIGGER_SCRIPT_PROG = 1092;
        const DOC_DIR_INTERNAL = 1093;

        /**
         * Contains an opaque string whose contents are undefined.
         */
        const COOKIE = 1094;

        /**
         * Specifies the 16 bit device number from which the file was copied.
         */
        const FILE_DEVICES = 1095;

        /**
         * Specifies the inode value from the original file system
         * on the the system on which it was built.
         */
        const FILE_INODES = 1096;

        /**
         * Specifies a per-file locale marker used to install only locale
         * specific subsets of files when the package is installed.
         */
        const FILE_LANGS = 1097;
        const PREFIXES = 1098;
        const INSTALL_PREFIXES = 1099;
        const TRIGGER_INSTALL_INTERNAL = 1100;
        const TRIGGER_UNINSTALL_INTERNAL = 1101;
        const TRIGGER_POST_UNINSTALL_INTERNAL = 1102;
        const AUTOREQ_INTERNAL = 1103;
        const AUTOPROV_INTERNAL = 1104;
        const CAPABILITY_INTERNAL = 1105;
        const SOURCE_PACKAGE = 1106;
        const OLD_ORIG_FILENAMES_INTERNAL = 1107;
        const BUILD_PREREQ_INTERNAL = 1108;
        const BUILD_REQUIRES_INTERNAL = 1109;
        const BUILD_CONFLICTS_INTERNAL = 1110;
        const BUILD_MACROS_INTERNAL = 1111;

        /**
         * Bits(s) to specify the conflict range and context.
         */
        const PROVIDE_FLAGS = 1112;

        /**
         * Indicates the versions associated with the values found
         * in the provide_name index.
         */
        const PROVIDE_VERSION = 1113;
        const OBSOLETE_FLAGS = 1114;
        const OBSOLETE_VERSION = 1115;
        const DIR_INDEXES = 1116;
        const BASE_NAMES = 1117;
        const DIR_NAMES = 1118;
        const ORIG_DIR_INDEXES = 1119;
        const ORIG_BASE_NAMES = 1120;
        const ORIG_DIR_NAMES = 1121;
        const OPT_FLAGS = 1122;
        const DIST_URL = 1123;
        const PAYLOAD_FORMAT = 1124;
        const PAYLOAD_COMPRESSOR = 1125;
        const PAYLOAD_FLAGS = 1126;
        const INSTALL_COLOR = 1127;
        const INSTALL_TID = 1128;
        const REMOVE_TID_OBSOLETE = 1129;
        const SHA1_RHN_INTERNAL = 1130;
        const RHN_PLATFORM_INTERNAL = 1131;
        const PLATFORM = 1132;
        const PATCHES_NAME_OBSOLETE = 1133;
        const PATCHES_FLAGS_OBSOLETE = 1134;
        const PATCHES_VERSION_OBSOLETE = 1135;
        const CACHE_CTIME_INTERNAL = 1136;
        const CACHE_PKG_PATH_INTERNAL = 1137;
        const CACHE_PKG_SIZE_INTERNAL = 1138;
        const CACHE_PKG_MTIME_INTERNAL = 1139;
        const FILE_COLORS = 1140;
        const FILE_CLASS = 1141;
        const CLASS_DICT = 1142;

        /**
         * Index into `::depends_dict` denoting start of this file's dependencies.
         */
        const FILE_DEPENDS_IDX = 1143;

        /**
         * Number of file dependencies in `::depends_dict`, starting from `::file_depends_idx`
         */
        const FILE_DEPENDS_NUM = 1144;
        const DEPENDS_DICT = 1145;
        const SOURCE_PKGID = 1146;
        const FILE_CONTEXTS_OBSOLETE = 1147;
        const FS_CONTEXTS_OBSOLETE = 1148;
        const RE_CONTEXTS_OBSOLETE = 1149;
        const POLICIES = 1150;
        const PRE_TRANS = 1151;
        const POST_TRANS = 1152;
        const PRE_TRANS_PROG = 1153;
        const POST_TRANS_PROG = 1154;
        const DIST_TAG = 1155;
        const OLD_SUGGESTS_NAME_OBSOLETE = 1156;
        const OLD_SUGGESTS_VERSION_OBSOLETE = 1157;
        const OLD_SUGGESTS_FLAGS_OBSOLETE = 1158;
        const OLD_ENHANCES_NAME_OBSOLETE = 1159;
        const OLD_ENHANCES_VERSION_OBSOLETE = 1160;
        const OLD_ENHANCES_FLAGS_OBSOLETE = 1161;
        const PRIORITY_UNIMPLEMENTED = 1162;
        const CVSID_UNIMPLEMENTED = 1163;
        const BLINK_PKGID_UNIMPLEMENTED = 1164;
        const BLINK_HDRID_UNIMPLEMENTED = 1165;
        const BLINK_NEVRA_UNIMPLEMENTED = 1166;
        const FLINK_PKGID_UNIMPLEMENTED = 1167;
        const FLINK_HDRID_UNIMPLEMENTED = 1168;
        const FLINK_NEVRA_UNIMPLEMENTED = 1169;
        const PACKAGE_ORIGIN_UNIMPLEMENTED = 1170;
        const TRIGGER_PRE_INSTALL_INTERNAL = 1171;
        const BUILD_SUGGESTS_UNIMPLEMENTED = 1172;
        const BUILD_ENHANCES_UNIMPLEMENTED = 1173;
        const SCRIPT_STATES_UNIMPLEMENTED = 1174;
        const SCRIPT_METRICS_UNIMPLEMENTED = 1175;
        const BUILD_CPU_CLOCK_UNIMPLEMENTED = 1176;
        const FILE_DIGEST_ALGOS_UNIMPLEMENTED = 1177;
        const VARIANTS_UNIMPLEMENTED = 1178;
        const XMAJOR_UNIMPLEMENTED = 1179;
        const XMINOR_UNIMPLEMENTED = 1180;
        const REPO_TAG_UNIMPLEMENTED = 1181;
        const KEYWORDS_UNIMPLEMENTED = 1182;
        const BUILD_PLATFORMS_UNIMPLEMENTED = 1183;
        const PACKAGE_COLOR_UNIMPLEMENTED = 1184;
        const PACKAGE_PREF_COLOR_UNIMPLEMENTED = 1185;
        const XATTRS_DICT_UNIMPLEMENTED = 1186;
        const FILEX_ATTRSX_UNIMPLEMENTED = 1187;
        const DEP_ATTRS_DICT_UNIMPLEMENTED = 1188;
        const CONFLICT_ATTRSX_UNIMPLEMENTED = 1189;
        const OBSOLETE_ATTRSX_UNIMPLEMENTED = 1190;
        const PROVIDE_ATTRSX_UNIMPLEMENTED = 1191;
        const REQUIRE_ATTRSX_UNIMPLEMENTED = 1192;
        const BUILD_PROVIDES_UNIMPLEMENTED = 1193;
        const BUILD_OBSOLETES_UNIMPLEMENTED = 1194;
        const DB_INSTANCE = 1195;
        const NVRA = 1196;
        const FILE_NAMES = 5000;
        const FILE_PROVIDE = 5001;
        const FILE_REQUIRE = 5002;
        const FS_NAMES_UNIMPLEMENTED = 5003;
        const FS_SIZES_UNIMPLEMENTED = 5004;
        const TRIGGER_CONDS = 5005;
        const TRIGGER_TYPE = 5006;
        const ORIG_FILE_NAMES = 5007;
        const LONG_FILE_SIZES = 5008;
        const LONG_SIZE = 5009;
        const FILE_CAPS = 5010;

        /**
         * File digest algorithm
         */
        const FILE_DIGEST_ALGO = 5011;
        const BUG_URL = 5012;
        const EVR = 5013;
        const NVR = 5014;
        const NEVR = 5015;
        const NEVRA = 5016;
        const HEADER_COLOR = 5017;
        const VERBOSE = 5018;
        const EPOCH_NUM = 5019;
        const PRE_INSTALL_FLAGS = 5020;
        const POST_INSTALL_FLAGS = 5021;
        const PRE_UNINSTALL_FLAGS = 5022;
        const POST_UNINSTALL_FLAGS = 5023;
        const PRE_TRANS_FLAGS = 5024;
        const POST_TRANS_FLAGS = 5025;
        const VERIFY_SCRIPT_FLAGS = 5026;
        const TRIGGER_SCRIPT_FLAGS = 5027;
        const COLLECTIONS_UNIMPLEMENTED = 5029;
        const POLICY_NAMES = 5030;
        const POLICY_TYPES = 5031;
        const POLICY_TYPES_INDEXES = 5032;
        const POLICY_FLAGS = 5033;
        const VCS = 5034;
        const ORDER_NAME = 5035;
        const ORDER_VERSION = 5036;
        const ORDER_FLAGS = 5037;
        const MSSF_MANIFEST_UNIMPLEMENTED = 5038;
        const MSSF_DOMAIN_UNIMPLEMENTED = 5039;
        const INST_FILE_NAMES = 5040;
        const REQUIRE_NEVRS = 5041;
        const PROVIDE_NEVRS = 5042;
        const OBSOLETE_NEVRS = 5043;
        const CONFLICT_NEVRS = 5044;
        const FILE_NLINKS = 5045;
        const RECOMMEND_NAME = 5046;
        const RECOMMEND_VERSION = 5047;
        const RECOMMEND_FLAGS = 5048;
        const SUGGEST_NAME = 5049;
        const SUGGEST_VERSION = 5050;
        const SUGGEST_FLAGS = 5051;
        const SUPPLEMENT_NAME = 5052;
        const SUPPLEMENT_VERSION = 5053;
        const SUPPLEMENT_FLAGS = 5054;
        const ENHANCE_NAME = 5055;
        const ENHANCE_VERSION = 5056;
        const ENHANCE_FLAGS = 5057;
        const RECOMMEND_NEVRS = 5058;
        const SUGGEST_NEVRS = 5059;
        const SUPPLEMENT_NEVRS = 5060;
        const ENHANCE_NEVRS = 5061;
        const ENCODING = 5062;
        const FILE_TRIGGER_INSTALL_INTERNAL = 5063;
        const FILE_TRIGGER_UNINSTALL_INTERNAL = 5064;
        const FILE_TRIGGER_POST_UNINSTALL_INTERNAL = 5065;
        const FILE_TRIGGER_SCRIPTS = 5066;
        const FILE_TRIGGER_SCRIPT_PROG = 5067;
        const FILE_TRIGGER_SCRIPT_FLAGS = 5068;
        const FILE_TRIGGER_NAME = 5069;
        const FILE_TRIGGER_INDEX = 5070;
        const FILE_TRIGGER_VERSION = 5071;
        const FILE_TRIGGER_FLAGS = 5072;
        const TRANS_FILE_TRIGGER_INSTALL_INTERNAL = 5073;
        const TRANS_FILE_TRIGGER_UNINSTALL_INTERNAL = 5074;
        const TRANS_FILE_TRIGGER_POST_UNINSTALL_INTERNAL = 5075;
        const TRANS_FILE_TRIGGER_SCRIPTS = 5076;
        const TRANS_FILE_TRIGGER_SCRIPT_PROG = 5077;
        const TRANS_FILE_TRIGGER_SCRIPT_FLAGS = 5078;
        const TRANS_FILE_TRIGGER_NAME = 5079;
        const TRANS_FILE_TRIGGER_INDEX = 5080;
        const TRANS_FILE_TRIGGER_VERSION = 5081;
        const TRANS_FILE_TRIGGER_FLAGS = 5082;
        const REMOVE_PATH_POSTFIXES_INTERNAL = 5083;
        const FILE_TRIGGER_PRIORITIES = 5084;
        const TRANS_FILE_TRIGGER_PRIORITIES = 5085;
        const FILE_TRIGGER_CONDS = 5086;
        const FILE_TRIGGER_TYPE = 5087;
        const TRANS_FILE_TRIGGER_CONDS = 5088;
        const TRANS_FILE_TRIGGER_TYPE = 5089;
        const FILE_SIGNATURES = 5090;
        const FILE_SIGNATURE_LENGTH = 5091;
        const PAYLOAD_DIGEST = 5092;
        const PAYLOAD_DIGEST_ALGO = 5093;
        const AUTO_INSTALLED_UNIMPLEMENTED = 5094;
        const IDENTITY_UNIMPLEMENTED = 5095;
        const MODULARITY_LABEL = 5096;
        const PAYLOAD_DIGEST_ALT = 5097;
        const ARCH_SUFFIX = 5098;
        const SPEC = 5099;
        const TRANSLATION_URL = 5100;
        const UPSTREAM_RELEASES = 5101;
        const SOURCE_LICENSE_INTERNAL = 5102;
    }
}

namespace Rpm {
    class RpmTypes {
        const BINARY = 0;
        const SOURCE = 1;
    }
}

namespace Rpm {
    class Architectures {

        /**
         * x86 or x86_64
         */
        const X86 = 1;

        /**
         * Alpha or Sparc64
         */
        const ALPHA = 2;
        const SPARC = 3;
        const MIPS = 4;
        const PPC = 5;
        const M68K = 6;

        /**
         * SGI Inhouse Processors (IP)
         */
        const SGI = 7;
        const RS6000 = 8;
        const IA64 = 9;
        const SPARC64 = 10;
        const MIPS64 = 11;
        const ARM = 12;
        const M68K_MINT = 13;
        const S390 = 14;
        const S390X = 15;
        const PPC64 = 16;
        const SH = 17;
        const XTENSA = 18;
        const AARCH64 = 19;
        const MIPS_R6 = 20;
        const MIPS64_R6 = 21;
        const RISCV = 22;
        const LOONGARCH64 = 23;

        /**
         * can be installed on any architecture
         */
        const NO_ARCH = 255;
    }
}
