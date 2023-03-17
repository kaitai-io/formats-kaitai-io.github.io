<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * BSON, short for Binary JSON, is a binary-encoded serialization of JSON-like documents. Like JSON, BSON supports the embedding of documents and arrays within other documents and arrays. BSON also contains extensions that allow representation of data types that are not part of the JSON spec. For example, BSON has a Date type and a BinData type. BSON can be compared to binary interchange formats, like Protocol Buffers. BSON is more "schemaless" than Protocol Buffers, which can give it an advantage in flexibility but also a slight disadvantage in space efficiency (BSON has overhead for field names within the serialized data). BSON was designed to have the following three characteristics:
 *   * Lightweight. Keeping spatial overhead to a minimum is important for any data representation format, especially when used over the network.
 *   * Traversable. BSON is designed to be traversed easily. This is a vital property in its role as the primary data representation for MongoDB.
 *   * Efficient. Encoding data to BSON and decoding from BSON can be performed very quickly in most languages due to the use of C data types.
 */

namespace {
    class Bson extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Bson $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_len = $this->_io->readS4le();
            $this->_m__raw_fields = $this->_io->readBytes(($this->len() - 5));
            $_io__raw_fields = new \Kaitai\Struct\Stream($this->_m__raw_fields);
            $this->_m_fields = new \Bson\ElementsList($_io__raw_fields, $this, $this->_root);
            $this->_m_terminator = $this->_io->readBytes(1);
            if (!($this->terminator() == "\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00", $this->terminator(), $this->_io(), "/seq/2");
            }
        }
        protected $_m_len;
        protected $_m_fields;
        protected $_m_terminator;
        protected $_m__raw_fields;

        /**
         * Total number of bytes comprising the document.
         */
        public function len() { return $this->_m_len; }
        public function fields() { return $this->_m_fields; }
        public function terminator() { return $this->_m_terminator; }
        public function _raw_fields() { return $this->_m__raw_fields; }
    }
}

/**
 * Special internal type used by MongoDB replication and sharding. First 4 bytes are an increment, second 4 are a timestamp.
 */

namespace Bson {
    class Timestamp extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Bson\Element $_parent = null, \Bson $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_increment = $this->_io->readU4le();
            $this->_m_timestamp = $this->_io->readU4le();
        }
        protected $_m_increment;
        protected $_m_timestamp;
        public function increment() { return $this->_m_increment; }
        public function timestamp() { return $this->_m_timestamp; }
    }
}

/**
 * The BSON "binary" or "BinData" datatype is used to represent arrays of bytes. It is somewhat analogous to the Java notion of a ByteArray. BSON binary values have a subtype. This is used to indicate what kind of data is in the byte array. Subtypes from zero to 127 are predefined or reserved. Subtypes from 128-255 are user-defined.
 */

namespace Bson {
    class BinData extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Bson\Element $_parent = null, \Bson $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_len = $this->_io->readS4le();
            $this->_m_subtype = $this->_io->readU1();
            switch ($this->subtype()) {
                case \Bson\BinData\Subtype::BYTE_ARRAY_DEPRECATED:
                    $this->_m__raw_content = $this->_io->readBytes($this->len());
                    $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                    $this->_m_content = new \Bson\BinData\ByteArrayDeprecated($_io__raw_content, $this, $this->_root);
                    break;
                default:
                    $this->_m_content = $this->_io->readBytes($this->len());
                    break;
            }
        }
        protected $_m_len;
        protected $_m_subtype;
        protected $_m_content;
        protected $_m__raw_content;
        public function len() { return $this->_m_len; }
        public function subtype() { return $this->_m_subtype; }
        public function content() { return $this->_m_content; }
        public function _raw_content() { return $this->_m__raw_content; }
    }
}

/**
 * The BSON "binary" or "BinData" datatype is used to represent arrays of bytes. It is somewhat analogous to the Java notion of a ByteArray. BSON binary values have a subtype. This is used to indicate what kind of data is in the byte array. Subtypes from zero to 127 are predefined or reserved. Subtypes from 128-255 are user-defined.
 */

namespace Bson\BinData {
    class ByteArrayDeprecated extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Bson\BinData $_parent = null, \Bson $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_len = $this->_io->readS4le();
            $this->_m_content = $this->_io->readBytes($this->len());
        }
        protected $_m_len;
        protected $_m_content;
        public function len() { return $this->_m_len; }
        public function content() { return $this->_m_content; }
    }
}

namespace Bson\BinData {
    class Subtype {
        const GENERIC = 0;
        const FUNCTION = 1;
        const BYTE_ARRAY_DEPRECATED = 2;
        const UUID_DEPRECATED = 3;
        const UUID = 4;
        const MD5 = 5;
        const CUSTOM = 128;
    }
}

namespace Bson {
    class ElementsList extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Bson $_parent = null, \Bson $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_elements = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_elements[] = new \Bson\Element($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_elements;
        public function elements() { return $this->_m_elements; }
    }
}

namespace Bson {
    class Cstring extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Bson $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_str = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "UTF-8");
        }
        protected $_m_str;

        /**
         * MUST NOT contain '\x00', hence it is not full UTF-8.
         */
        public function str() { return $this->_m_str; }
    }
}

namespace Bson {
    class String extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Bson $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_len = $this->_io->readS4le();
            $this->_m_str = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(($this->len() - 1)), "UTF-8");
            $this->_m_terminator = $this->_io->readBytes(1);
            if (!($this->terminator() == "\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x00", $this->terminator(), $this->_io(), "/types/string/seq/2");
            }
        }
        protected $_m_len;
        protected $_m_str;
        protected $_m_terminator;
        public function len() { return $this->_m_len; }
        public function str() { return $this->_m_str; }
        public function terminator() { return $this->_m_terminator; }
    }
}

namespace Bson {
    class Element extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Bson\ElementsList $_parent = null, \Bson $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_typeByte = $this->_io->readU1();
            $this->_m_name = new \Bson\Cstring($this->_io, $this, $this->_root);
            switch ($this->typeByte()) {
                case \Bson\Element\BsonType::CODE_WITH_SCOPE:
                    $this->_m_content = new \Bson\CodeWithScope($this->_io, $this, $this->_root);
                    break;
                case \Bson\Element\BsonType::REG_EX:
                    $this->_m_content = new \Bson\RegEx($this->_io, $this, $this->_root);
                    break;
                case \Bson\Element\BsonType::NUMBER_DOUBLE:
                    $this->_m_content = $this->_io->readF8le();
                    break;
                case \Bson\Element\BsonType::SYMBOL:
                    $this->_m_content = new \Bson\String($this->_io, $this, $this->_root);
                    break;
                case \Bson\Element\BsonType::TIMESTAMP:
                    $this->_m_content = new \Bson\Timestamp($this->_io, $this, $this->_root);
                    break;
                case \Bson\Element\BsonType::NUMBER_INT:
                    $this->_m_content = $this->_io->readS4le();
                    break;
                case \Bson\Element\BsonType::DOCUMENT:
                    $this->_m_content = new \Bson($this->_io);
                    break;
                case \Bson\Element\BsonType::OBJECT_ID:
                    $this->_m_content = new \Bson\ObjectId($this->_io, $this, $this->_root);
                    break;
                case \Bson\Element\BsonType::JAVASCRIPT:
                    $this->_m_content = new \Bson\String($this->_io, $this, $this->_root);
                    break;
                case \Bson\Element\BsonType::UTC_DATETIME:
                    $this->_m_content = $this->_io->readS8le();
                    break;
                case \Bson\Element\BsonType::BOOLEAN:
                    $this->_m_content = $this->_io->readU1();
                    break;
                case \Bson\Element\BsonType::NUMBER_LONG:
                    $this->_m_content = $this->_io->readS8le();
                    break;
                case \Bson\Element\BsonType::BIN_DATA:
                    $this->_m_content = new \Bson\BinData($this->_io, $this, $this->_root);
                    break;
                case \Bson\Element\BsonType::STRING:
                    $this->_m_content = new \Bson\String($this->_io, $this, $this->_root);
                    break;
                case \Bson\Element\BsonType::DB_POINTER:
                    $this->_m_content = new \Bson\DbPointer($this->_io, $this, $this->_root);
                    break;
                case \Bson\Element\BsonType::ARRAY:
                    $this->_m_content = new \Bson($this->_io);
                    break;
                case \Bson\Element\BsonType::NUMBER_DECIMAL:
                    $this->_m_content = new \Bson\F16($this->_io, $this, $this->_root);
                    break;
            }
        }
        protected $_m_typeByte;
        protected $_m_name;
        protected $_m_content;
        public function typeByte() { return $this->_m_typeByte; }
        public function name() { return $this->_m_name; }
        public function content() { return $this->_m_content; }
    }
}

namespace Bson\Element {
    class BsonType {
        const MIN_KEY = -1;
        const END_OF_OBJECT = 0;
        const NUMBER_DOUBLE = 1;
        const STRING = 2;
        const DOCUMENT = 3;
        const ARRAY = 4;
        const BIN_DATA = 5;
        const UNDEFINED = 6;
        const OBJECT_ID = 7;
        const BOOLEAN = 8;
        const UTC_DATETIME = 9;
        const JST_NULL = 10;
        const REG_EX = 11;
        const DB_POINTER = 12;
        const JAVASCRIPT = 13;
        const SYMBOL = 14;
        const CODE_WITH_SCOPE = 15;
        const NUMBER_INT = 16;
        const TIMESTAMP = 17;
        const NUMBER_LONG = 18;
        const NUMBER_DECIMAL = 19;
        const MAX_KEY = 127;
    }
}

namespace Bson {
    class DbPointer extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Bson\Element $_parent = null, \Bson $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_namespace = new \Bson\String($this->_io, $this, $this->_root);
            $this->_m_id = new \Bson\ObjectId($this->_io, $this, $this->_root);
        }
        protected $_m_namespace;
        protected $_m_id;
        public function namespace() { return $this->_m_namespace; }
        public function id() { return $this->_m_id; }
    }
}

/**
 * Implements unsigned 24-bit (3 byte) integer.
 */

namespace Bson {
    class U3 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Bson\ObjectId $_parent = null, \Bson $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_b1 = $this->_io->readU1();
            $this->_m_b2 = $this->_io->readU1();
            $this->_m_b3 = $this->_io->readU1();
        }
        protected $_m_value;
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $this->_m_value = (($this->b1() | ($this->b2() << 8)) | ($this->b3() << 16));
            return $this->_m_value;
        }
        protected $_m_b1;
        protected $_m_b2;
        protected $_m_b3;
        public function b1() { return $this->_m_b1; }
        public function b2() { return $this->_m_b2; }
        public function b3() { return $this->_m_b3; }
    }
}

namespace Bson {
    class CodeWithScope extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Bson\Element $_parent = null, \Bson $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_id = $this->_io->readS4le();
            $this->_m_source = new \Bson\String($this->_io, $this, $this->_root);
            $this->_m_scope = new \Bson($this->_io);
        }
        protected $_m_id;
        protected $_m_source;
        protected $_m_scope;
        public function id() { return $this->_m_id; }
        public function source() { return $this->_m_source; }

        /**
         * mapping from identifiers to values, representing the scope in which the string should be evaluated.
         */
        public function scope() { return $this->_m_scope; }
    }
}

/**
 * 128-bit IEEE 754-2008 decimal floating point
 */

namespace Bson {
    class F16 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Bson\Element $_parent = null, \Bson $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_str = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_exponent = $this->_io->readBitsIntBe(15);
            $this->_m_significandHi = $this->_io->readBitsIntBe(49);
            $this->_io->alignToByte();
            $this->_m_significandLo = $this->_io->readU8le();
        }
        protected $_m_str;
        protected $_m_exponent;
        protected $_m_significandHi;
        protected $_m_significandLo;
        public function str() { return $this->_m_str; }
        public function exponent() { return $this->_m_exponent; }
        public function significandHi() { return $this->_m_significandHi; }
        public function significandLo() { return $this->_m_significandLo; }
    }
}

namespace Bson {
    class ObjectId extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Bson $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_epochTime = $this->_io->readU4le();
            $this->_m_machineId = new \Bson\U3($this->_io, $this, $this->_root);
            $this->_m_processId = $this->_io->readU2le();
            $this->_m_counter = new \Bson\U3($this->_io, $this, $this->_root);
        }
        protected $_m_epochTime;
        protected $_m_machineId;
        protected $_m_processId;
        protected $_m_counter;

        /**
         * seconds since the Unix epoch
         */
        public function epochTime() { return $this->_m_epochTime; }
        public function machineId() { return $this->_m_machineId; }
        public function processId() { return $this->_m_processId; }

        /**
         * counter, starting with a random value.
         */
        public function counter() { return $this->_m_counter; }
    }
}

namespace Bson {
    class RegEx extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Bson\Element $_parent = null, \Bson $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_pattern = new \Bson\Cstring($this->_io, $this, $this->_root);
            $this->_m_options = new \Bson\Cstring($this->_io, $this, $this->_root);
        }
        protected $_m_pattern;
        protected $_m_options;
        public function pattern() { return $this->_m_pattern; }
        public function options() { return $this->_m_options; }
    }
}
