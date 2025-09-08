<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Direct Internet Message Encapsulation (DIME)
 * is an old Microsoft specification for sending and receiving
 * SOAP messages along with additional attachments,
 * like binary files, XML fragments, and even other
 * SOAP messages, using standard transport protocols like HTTP.
 * 
 * Sample file: `curl -LO
 * https://github.com/kaitai-io/kaitai_struct_formats/files/5894723/scanner_withoptions.dump.gz
 * && gunzip scanner_withoptions.dump.gz`
 */

namespace {
    class DimeMessage extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\DimeMessage $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_records = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_records[] = new \DimeMessage\Record($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_records;
        public function records() { return $this->_m_records; }
    }
}

/**
 * one element of the option field
 */

namespace DimeMessage {
    class OptionElement extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DimeMessage\OptionField $_parent = null, ?\DimeMessage $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_elementFormat = $this->_io->readU2be();
            $this->_m_lenElement = $this->_io->readU2be();
            $this->_m_elementData = $this->_io->readBytes($this->lenElement());
        }
        protected $_m_elementFormat;
        protected $_m_lenElement;
        protected $_m_elementData;
        public function elementFormat() { return $this->_m_elementFormat; }
        public function lenElement() { return $this->_m_lenElement; }
        public function elementData() { return $this->_m_elementData; }
    }
}

/**
 * the option field of the record
 */

namespace DimeMessage {
    class OptionField extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DimeMessage\Record $_parent = null, ?\DimeMessage $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_optionElements = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_optionElements[] = new \DimeMessage\OptionElement($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_optionElements;
        public function optionElements() { return $this->_m_optionElements; }
    }
}

/**
 * padding to the next 4-byte boundary
 */

namespace DimeMessage {
    class Padding extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DimeMessage\Record $_parent = null, ?\DimeMessage $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_boundaryPadding = $this->_io->readBytes(\Kaitai\Struct\Stream::mod(-($this->_io()->pos()), 4));
        }
        protected $_m_boundaryPadding;
        public function boundaryPadding() { return $this->_m_boundaryPadding; }
    }
}

/**
 * each individual fragment of the message
 */

namespace DimeMessage {
    class Record extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\DimeMessage $_parent = null, ?\DimeMessage $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_version = $this->_io->readBitsIntBe(5);
            $this->_m_isFirstRecord = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_isLastRecord = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_isChunkRecord = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_typeFormat = $this->_io->readBitsIntBe(4);
            $this->_m_reserved = $this->_io->readBitsIntBe(4);
            $this->_io->alignToByte();
            $this->_m_lenOptions = $this->_io->readU2be();
            $this->_m_lenId = $this->_io->readU2be();
            $this->_m_lenType = $this->_io->readU2be();
            $this->_m_lenData = $this->_io->readU4be();
            $this->_m__raw_options = $this->_io->readBytes($this->lenOptions());
            $_io__raw_options = new \Kaitai\Struct\Stream($this->_m__raw_options);
            $this->_m_options = new \DimeMessage\OptionField($_io__raw_options, $this, $this->_root);
            $this->_m_optionsPadding = new \DimeMessage\Padding($this->_io, $this, $this->_root);
            $this->_m_id = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenId()), "ASCII");
            $this->_m_idPadding = new \DimeMessage\Padding($this->_io, $this, $this->_root);
            $this->_m_type = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenType()), "ASCII");
            $this->_m_typePadding = new \DimeMessage\Padding($this->_io, $this, $this->_root);
            $this->_m_data = $this->_io->readBytes($this->lenData());
            $this->_m_dataPadding = new \DimeMessage\Padding($this->_io, $this, $this->_root);
        }
        protected $_m_version;
        protected $_m_isFirstRecord;
        protected $_m_isLastRecord;
        protected $_m_isChunkRecord;
        protected $_m_typeFormat;
        protected $_m_reserved;
        protected $_m_lenOptions;
        protected $_m_lenId;
        protected $_m_lenType;
        protected $_m_lenData;
        protected $_m_options;
        protected $_m_optionsPadding;
        protected $_m_id;
        protected $_m_idPadding;
        protected $_m_type;
        protected $_m_typePadding;
        protected $_m_data;
        protected $_m_dataPadding;
        protected $_m__raw_options;

        /**
         * DIME format version (always 1)
         */
        public function version() { return $this->_m_version; }

        /**
         * Set if this is the first record in the message
         */
        public function isFirstRecord() { return $this->_m_isFirstRecord; }

        /**
         * Set if this is the last record in the message
         */
        public function isLastRecord() { return $this->_m_isLastRecord; }

        /**
         * Set if the file contained in this record is chunked into multiple records
         */
        public function isChunkRecord() { return $this->_m_isChunkRecord; }

        /**
         * Indicates the structure and format of the value of the TYPE field
         */
        public function typeFormat() { return $this->_m_typeFormat; }

        /**
         * Reserved for future use
         */
        public function reserved() { return $this->_m_reserved; }

        /**
         * Length of the Options field
         */
        public function lenOptions() { return $this->_m_lenOptions; }

        /**
         * Length of the ID field
         */
        public function lenId() { return $this->_m_lenId; }

        /**
         * Length of the Type field
         */
        public function lenType() { return $this->_m_lenType; }

        /**
         * Length of the Data field
         */
        public function lenData() { return $this->_m_lenData; }
        public function options() { return $this->_m_options; }
        public function optionsPadding() { return $this->_m_optionsPadding; }

        /**
         * Unique identifier of the file (set in the first record of file)
         */
        public function id() { return $this->_m_id; }
        public function idPadding() { return $this->_m_idPadding; }

        /**
         * Specified type in the format set with type_format
         */
        public function type() { return $this->_m_type; }
        public function typePadding() { return $this->_m_typePadding; }

        /**
         * The file data
         */
        public function data() { return $this->_m_data; }
        public function dataPadding() { return $this->_m_dataPadding; }
        public function _raw_options() { return $this->_m__raw_options; }
    }
}

namespace DimeMessage {
    class TypeFormats {
        const UNCHANGED = 0;
        const MEDIA_TYPE = 1;
        const ABSOLUTE_URI = 2;
        const UNKNOWN = 3;
        const NONE = 4;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
