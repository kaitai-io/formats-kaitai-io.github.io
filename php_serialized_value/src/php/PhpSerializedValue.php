<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * A serialized PHP value, in the format used by PHP's built-in `serialize` and
 * `unserialize` functions. This format closely mirrors PHP's data model:
 * it supports all of PHP's scalar types (`NULL`, booleans, numbers, strings),
 * associative arrays, objects, and recursive data structures using references.
 * The only PHP values not supported by this format are *resources*,
 * which usually correspond to native file or connection handles and cannot be
 * meaningfully serialized.
 * 
 * There is no official documentation for this data format;
 * this spec was created based on the PHP source code and the behavior of
 * `serialize`/`unserialize`. PHP makes no guarantees about compatibility of
 * serialized data between PHP versions, but in practice, the format has
 * remained fully backwards-compatible - values serialized by an older
 * PHP version can be unserialized on any newer PHP version.
 * This spec supports serialized values from PHP 7.3 or any earlier version.
 */

namespace {
    class PhpSerializedValue extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \PhpSerializedValue $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_type = $this->_io->readU1();
            switch ($this->type()) {
                case \PhpSerializedValue\ValueType::CUSTOM_SERIALIZED_OBJECT:
                    $this->_m_contents = new \PhpSerializedValue\CustomSerializedObjectContents($this->_io, $this, $this->_root);
                    break;
                case \PhpSerializedValue\ValueType::PHP_3_OBJECT:
                    $this->_m_contents = new \PhpSerializedValue\Php3ObjectContents($this->_io, $this, $this->_root);
                    break;
                case \PhpSerializedValue\ValueType::OBJECT:
                    $this->_m_contents = new \PhpSerializedValue\ObjectContents($this->_io, $this, $this->_root);
                    break;
                case \PhpSerializedValue\ValueType::VARIABLE_REFERENCE:
                    $this->_m_contents = new \PhpSerializedValue\IntContents($this->_io, $this, $this->_root);
                    break;
                case \PhpSerializedValue\ValueType::PHP_6_STRING:
                    $this->_m_contents = new \PhpSerializedValue\StringContents($this->_io, $this, $this->_root);
                    break;
                case \PhpSerializedValue\ValueType::FLOAT:
                    $this->_m_contents = new \PhpSerializedValue\FloatContents($this->_io, $this, $this->_root);
                    break;
                case \PhpSerializedValue\ValueType::OBJECT_REFERENCE:
                    $this->_m_contents = new \PhpSerializedValue\IntContents($this->_io, $this, $this->_root);
                    break;
                case \PhpSerializedValue\ValueType::NULL:
                    $this->_m_contents = new \PhpSerializedValue\NullContents($this->_io, $this, $this->_root);
                    break;
                case \PhpSerializedValue\ValueType::BOOL:
                    $this->_m_contents = new \PhpSerializedValue\BoolContents($this->_io, $this, $this->_root);
                    break;
                case \PhpSerializedValue\ValueType::INT:
                    $this->_m_contents = new \PhpSerializedValue\IntContents($this->_io, $this, $this->_root);
                    break;
                case \PhpSerializedValue\ValueType::ARRAY:
                    $this->_m_contents = new \PhpSerializedValue\ArrayContents($this->_io, $this, $this->_root);
                    break;
                case \PhpSerializedValue\ValueType::STRING:
                    $this->_m_contents = new \PhpSerializedValue\StringContents($this->_io, $this, $this->_root);
                    break;
            }
        }
        protected $_m_type;
        protected $_m_contents;

        /**
         * A single-character code indicating the type of the serialized value.
         */
        public function type() { return $this->_m_type; }

        /**
         * The contents of the serialized value, which vary depending on the type.
         */
        public function contents() { return $this->_m_contents; }
    }
}

/**
 * A mapping (a sequence of key-value pairs) prefixed with its size.
 */

namespace PhpSerializedValue {
    class CountPrefixedMapping extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \PhpSerializedValue $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numEntriesDec = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(58, false, true, true), "ASCII");
            $this->_m_openingBrace = $this->_io->readBytes(1);
            if (!($this->openingBrace() == "\x7B")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x7B", $this->openingBrace(), $this->_io(), "/types/count_prefixed_mapping/seq/1");
            }
            $this->_m_entries = [];
            $n = $this->numEntries();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_entries[] = new \PhpSerializedValue\MappingEntry($this->_io, $this, $this->_root);
            }
            $this->_m_closingBrace = $this->_io->readBytes(1);
            if (!($this->closingBrace() == "\x7D")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x7D", $this->closingBrace(), $this->_io(), "/types/count_prefixed_mapping/seq/3");
            }
        }
        protected $_m_numEntries;

        /**
         * The number of key-value pairs in the mapping, parsed as an integer.
         */
        public function numEntries() {
            if ($this->_m_numEntries !== null)
                return $this->_m_numEntries;
            $this->_m_numEntries = intval($this->numEntriesDec(), 10);
            return $this->_m_numEntries;
        }
        protected $_m_numEntriesDec;
        protected $_m_openingBrace;
        protected $_m_entries;
        protected $_m_closingBrace;

        /**
         * The number of key-value pairs in the mapping, in ASCII decimal.
         */
        public function numEntriesDec() { return $this->_m_numEntriesDec; }
        public function openingBrace() { return $this->_m_openingBrace; }

        /**
         * The key-value pairs contained in the mapping.
         */
        public function entries() { return $this->_m_entries; }
        public function closingBrace() { return $this->_m_closingBrace; }
    }
}

/**
 * The contents of a floating-point value.
 */

namespace PhpSerializedValue {
    class FloatContents extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PhpSerializedValue $_parent = null, \PhpSerializedValue $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_colon = $this->_io->readBytes(1);
            if (!($this->colon() == "\x3A")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x3A", $this->colon(), $this->_io(), "/types/float_contents/seq/0");
            }
            $this->_m_valueDec = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(59, false, true, true), "ASCII");
        }
        protected $_m_colon;
        protected $_m_valueDec;
        public function colon() { return $this->_m_colon; }

        /**
         * The value of the `float`, in ASCII decimal, as generated by PHP's
         * usual double-to-string conversion. In particular, this means that:
         * 
         * * A decimal point may not be included (for integral numbers)
         * * The number may use exponent notation (e. g. `1.0E+16`)
         * * Positive and negative infinity are represented as `INF`
         *   and `-INF`, respectively
         * * Not-a-number is represented as `NAN`
         */
        public function valueDec() { return $this->_m_valueDec; }
    }
}

/**
 * A quoted string prefixed with its length.
 * 
 * Despite the quotes surrounding the string data, it can contain
 * arbitrary bytes, which are never escaped in any way.
 * This does not cause any ambiguities when parsing - the bounds of
 * the string are determined only by the length field, not by the quotes.
 */

namespace PhpSerializedValue {
    class LengthPrefixedQuotedString extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \PhpSerializedValue $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenDataDec = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(58, false, true, true), "ASCII");
            $this->_m_openingQuote = $this->_io->readBytes(1);
            if (!($this->openingQuote() == "\x22")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x22", $this->openingQuote(), $this->_io(), "/types/length_prefixed_quoted_string/seq/1");
            }
            $this->_m_data = $this->_io->readBytes($this->lenData());
            $this->_m_closingQuote = $this->_io->readBytes(1);
            if (!($this->closingQuote() == "\x22")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x22", $this->closingQuote(), $this->_io(), "/types/length_prefixed_quoted_string/seq/3");
            }
        }
        protected $_m_lenData;

        /**
         * The length of the string's contents in bytes, parsed as an integer.
         * The quotes are not counted in this size number.
         */
        public function lenData() {
            if ($this->_m_lenData !== null)
                return $this->_m_lenData;
            $this->_m_lenData = intval($this->lenDataDec(), 10);
            return $this->_m_lenData;
        }
        protected $_m_lenDataDec;
        protected $_m_openingQuote;
        protected $_m_data;
        protected $_m_closingQuote;

        /**
         * The length of the string's data in bytes, in ASCII decimal.
         * The quotes are not counted in this length number.
         */
        public function lenDataDec() { return $this->_m_lenDataDec; }
        public function openingQuote() { return $this->_m_openingQuote; }

        /**
         * The data contained in the string. The quotes are not included.
         */
        public function data() { return $this->_m_data; }
        public function closingQuote() { return $this->_m_closingQuote; }
    }
}

/**
 * The contents of an object value serialized in the default format.
 * Unlike its PHP 3 counterpart, it contains a class name.
 */

namespace PhpSerializedValue {
    class ObjectContents extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PhpSerializedValue $_parent = null, \PhpSerializedValue $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_colon1 = $this->_io->readBytes(1);
            if (!($this->colon1() == "\x3A")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x3A", $this->colon1(), $this->_io(), "/types/object_contents/seq/0");
            }
            $this->_m_className = new \PhpSerializedValue\LengthPrefixedQuotedString($this->_io, $this, $this->_root);
            $this->_m_colon2 = $this->_io->readBytes(1);
            if (!($this->colon2() == "\x3A")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x3A", $this->colon2(), $this->_io(), "/types/object_contents/seq/2");
            }
            $this->_m_properties = new \PhpSerializedValue\CountPrefixedMapping($this->_io, $this, $this->_root);
        }
        protected $_m_colon1;
        protected $_m_className;
        protected $_m_colon2;
        protected $_m_properties;
        public function colon1() { return $this->_m_colon1; }

        /**
         * The name of the object's class.
         */
        public function className() { return $this->_m_className; }
        public function colon2() { return $this->_m_colon2; }

        /**
         * The object's properties. Keys ust be of type `string`,
         * values may have any type.
         */
        public function properties() { return $this->_m_properties; }
    }
}

/**
 * The contents of an array value.
 */

namespace PhpSerializedValue {
    class ArrayContents extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PhpSerializedValue $_parent = null, \PhpSerializedValue $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_colon = $this->_io->readBytes(1);
            if (!($this->colon() == "\x3A")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x3A", $this->colon(), $this->_io(), "/types/array_contents/seq/0");
            }
            $this->_m_elements = new \PhpSerializedValue\CountPrefixedMapping($this->_io, $this, $this->_root);
        }
        protected $_m_colon;
        protected $_m_elements;
        public function colon() { return $this->_m_colon; }

        /**
         * The array's elements. Keys must be of type `int` or `string`,
         * values may have any type.
         */
        public function elements() { return $this->_m_elements; }
    }
}

/**
 * The contents of an object value that implements a custom
 * serialized format using `Serializable`.
 */

namespace PhpSerializedValue {
    class CustomSerializedObjectContents extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PhpSerializedValue $_parent = null, \PhpSerializedValue $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_colon1 = $this->_io->readBytes(1);
            if (!($this->colon1() == "\x3A")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x3A", $this->colon1(), $this->_io(), "/types/custom_serialized_object_contents/seq/0");
            }
            $this->_m_className = new \PhpSerializedValue\LengthPrefixedQuotedString($this->_io, $this, $this->_root);
            $this->_m_colon2 = $this->_io->readBytes(1);
            if (!($this->colon2() == "\x3A")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x3A", $this->colon2(), $this->_io(), "/types/custom_serialized_object_contents/seq/2");
            }
            $this->_m_lenDataDec = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(58, false, true, true), "ASCII");
            $this->_m_openingBrace = $this->_io->readBytes(1);
            if (!($this->openingBrace() == "\x7B")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x7B", $this->openingBrace(), $this->_io(), "/types/custom_serialized_object_contents/seq/4");
            }
            $this->_m_data = $this->_io->readBytes($this->lenData());
            $this->_m_closingQuote = $this->_io->readBytes(1);
            if (!($this->closingQuote() == "\x7D")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x7D", $this->closingQuote(), $this->_io(), "/types/custom_serialized_object_contents/seq/6");
            }
        }
        protected $_m_lenData;

        /**
         * The length of the serialized data in bytes, parsed as an integer.
         * The braces are not counted in this length number.
         */
        public function lenData() {
            if ($this->_m_lenData !== null)
                return $this->_m_lenData;
            $this->_m_lenData = intval($this->lenDataDec(), 10);
            return $this->_m_lenData;
        }
        protected $_m_colon1;
        protected $_m_className;
        protected $_m_colon2;
        protected $_m_lenDataDec;
        protected $_m_openingBrace;
        protected $_m_data;
        protected $_m_closingQuote;
        public function colon1() { return $this->_m_colon1; }

        /**
         * The name of the object's class.
         */
        public function className() { return $this->_m_className; }
        public function colon2() { return $this->_m_colon2; }

        /**
         * The length of the serialized data in bytes, in ASCII decimal.
         * The braces are not counted in this size number.
         */
        public function lenDataDec() { return $this->_m_lenDataDec; }
        public function openingBrace() { return $this->_m_openingBrace; }

        /**
         * The custom serialized data. The braces are not included.
         * 
         * Although the surrounding braces make it look like a regular
         * serialized object, this field is actually more similar to a string:
         * it can contain arbitrary data that is not required to follow
         * any common structure.
         */
        public function data() { return $this->_m_data; }
        public function closingQuote() { return $this->_m_closingQuote; }
    }
}

/**
 * The contents of a null value (`value_type::null`). This structure
 * contains no actual data, since there is only a single `NULL` value.
 */

namespace PhpSerializedValue {
    class NullContents extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PhpSerializedValue $_parent = null, \PhpSerializedValue $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_semicolon = $this->_io->readBytes(1);
            if (!($this->semicolon() == "\x3B")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x3B", $this->semicolon(), $this->_io(), "/types/null_contents/seq/0");
            }
        }
        protected $_m_semicolon;
        public function semicolon() { return $this->_m_semicolon; }
    }
}

/**
 * The contents of a PHP 3 object value. Unlike its counterpart in PHP 4
 * and above, it does not contain a class name.
 */

namespace PhpSerializedValue {
    class Php3ObjectContents extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PhpSerializedValue $_parent = null, \PhpSerializedValue $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_colon = $this->_io->readBytes(1);
            if (!($this->colon() == "\x3A")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x3A", $this->colon(), $this->_io(), "/types/php_3_object_contents/seq/0");
            }
            $this->_m_properties = new \PhpSerializedValue\CountPrefixedMapping($this->_io, $this, $this->_root);
        }
        protected $_m_colon;
        protected $_m_properties;
        public function colon() { return $this->_m_colon; }

        /**
         * The object's properties. Keys must be of type `string`,
         * values may have any type.
         */
        public function properties() { return $this->_m_properties; }
    }
}

/**
 * The contents of a boolean value (`value_type::bool`).
 */

namespace PhpSerializedValue {
    class BoolContents extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PhpSerializedValue $_parent = null, \PhpSerializedValue $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_colon = $this->_io->readBytes(1);
            if (!($this->colon() == "\x3A")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x3A", $this->colon(), $this->_io(), "/types/bool_contents/seq/0");
            }
            $this->_m_valueDec = $this->_io->readU1();
            $this->_m_semicolon = $this->_io->readBytes(1);
            if (!($this->semicolon() == "\x3B")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x3B", $this->semicolon(), $this->_io(), "/types/bool_contents/seq/2");
            }
        }
        protected $_m_value;

        /**
         * The value of the `bool`, parsed as a boolean.
         */
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $this->_m_value = $this->valueDec() == \PhpSerializedValue\BoolValue::TRUE;
            return $this->_m_value;
        }
        protected $_m_colon;
        protected $_m_valueDec;
        protected $_m_semicolon;
        public function colon() { return $this->_m_colon; }

        /**
         * The value of the `bool`: `0` for `false` or `1` for `true`.
         */
        public function valueDec() { return $this->_m_valueDec; }
        public function semicolon() { return $this->_m_semicolon; }
    }
}

/**
 * The contents of a string value.
 * 
 * Note: PHP strings can contain arbitrary byte sequences.
 * They are not necessarily valid text in any specific encoding.
 */

namespace PhpSerializedValue {
    class StringContents extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PhpSerializedValue $_parent = null, \PhpSerializedValue $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_colon = $this->_io->readBytes(1);
            if (!($this->colon() == "\x3A")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x3A", $this->colon(), $this->_io(), "/types/string_contents/seq/0");
            }
            $this->_m_string = new \PhpSerializedValue\LengthPrefixedQuotedString($this->_io, $this, $this->_root);
            $this->_m_semicolon = $this->_io->readBytes(1);
            if (!($this->semicolon() == "\x3B")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x3B", $this->semicolon(), $this->_io(), "/types/string_contents/seq/2");
            }
        }
        protected $_m_value;

        /**
         * The value of the string, as a byte array.
         */
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $this->_m_value = $this->string()->data();
            return $this->_m_value;
        }
        protected $_m_colon;
        protected $_m_string;
        protected $_m_semicolon;
        public function colon() { return $this->_m_colon; }
        public function string() { return $this->_m_string; }
        public function semicolon() { return $this->_m_semicolon; }
    }
}

/**
 * The contents of an integer-like value:
 * either an actual integer (`value_type::int`) or a reference
 * (`value_type::variable_reference`, `value_type::object_reference`).
 */

namespace PhpSerializedValue {
    class IntContents extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PhpSerializedValue $_parent = null, \PhpSerializedValue $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_colon = $this->_io->readBytes(1);
            if (!($this->colon() == "\x3A")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x3A", $this->colon(), $this->_io(), "/types/int_contents/seq/0");
            }
            $this->_m_valueDec = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(59, false, true, true), "ASCII");
        }
        protected $_m_value;

        /**
         * The value of the `int`, parsed as an integer.
         */
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $this->_m_value = intval($this->valueDec(), 10);
            return $this->_m_value;
        }
        protected $_m_colon;
        protected $_m_valueDec;
        public function colon() { return $this->_m_colon; }

        /**
         * The value of the `int`, in ASCII decimal.
         */
        public function valueDec() { return $this->_m_valueDec; }
    }
}

/**
 * A mapping entry consisting of a key and a value.
 */

namespace PhpSerializedValue {
    class MappingEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PhpSerializedValue\CountPrefixedMapping $_parent = null, \PhpSerializedValue $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_key = new \PhpSerializedValue($this->_io);
            $this->_m_value = new \PhpSerializedValue($this->_io);
        }
        protected $_m_key;
        protected $_m_value;

        /**
         * The key of the entry.
         */
        public function key() { return $this->_m_key; }

        /**
         * The value of the entry.
         */
        public function value() { return $this->_m_value; }
    }
}

namespace PhpSerializedValue {
    class ValueType {

        /**
         * An `object` whose class implements a custom serialized format using
         * `Serializable`. Available since PHP 5.1.
         */
        const CUSTOM_SERIALIZED_OBJECT = 67;

        /**
         * A `NULL` value.
         */
        const NULL = 78;

        /**
         * An `object` value (including its class name) serialized in the
         * default format. Available since PHP 4.
         */
        const OBJECT = 79;

        /**
         * An additional reference to a value that has already appeared earlier.
         * Available since PHP 4.0.4.
         */
        const VARIABLE_REFERENCE = 82;

        /**
         * A `string` value from PHP 6. PHP 6 was never released, but support for
         * deserializing PHP 6 strings was added in PHP 5.2.1 and is still present
         * as of PHP 7.3. In all versions that support them (other than PHP 6),
         * they are deserialized exactly like regular strings.
         */
        const PHP_6_STRING = 83;

        /**
         * An `array` value.
         */
        const ARRAY = 97;

        /**
         * A `bool` value. Available since PHP 4.
         */
        const BOOL = 98;

        /**
         * A `float` value.
         */
        const FLOAT = 100;

        /**
         * An `int` value.
         */
        const INT = 105;

        /**
         * An `object` value (without a class name), as serialized by PHP 3.
         * 
         * PHP 4 through 7.3 included code to deserialize PHP 3 objects,
         * which has now been removed from the development repo and will likely
         * no longer be included in PHP 7.4. However, apparently this code
         * has been broken ever since it was added - it cannot even deserialize
         * a simple PHP 3 object like `o:0:{}`. If the code worked, PHP 3 objects
         * deserialized under PHP 4 and higher would have the class `stdClass`.
         */
        const PHP_3_OBJECT = 111;

        /**
         * An `object` value which shares its identity with another `object`
         * that has already appeared earlier. Available since PHP 5.
         */
        const OBJECT_REFERENCE = 114;

        /**
         * A `string` value.
         */
        const STRING = 115;
    }
}

namespace PhpSerializedValue {
    class BoolValue {
        const FALSE = 48;
        const TRUE = 49;
    }
}
