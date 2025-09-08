<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * ASN.1 (Abstract Syntax Notation One) DER (Distinguished Encoding
 * Rules) is a standard-backed serialization scheme used in many
 * different use-cases. Particularly popular usage scenarios are X.509
 * certificates and some telecommunication / networking protocols.
 * 
 * DER is self-describing encoding scheme which allows representation
 * of simple, atomic data elements, such as strings and numbers, and
 * complex objects, such as sequences of other elements.
 * 
 * DER is a subset of BER (Basic Encoding Rules), with an emphasis on
 * being non-ambiguous: there's always exactly one canonical way to
 * encode a data structure defined in terms of ASN.1 using DER.
 * 
 * This spec allows full parsing of format syntax, but to understand
 * the semantics, one would typically require a dictionary of Object
 * Identifiers (OIDs), to match OID bodies against some human-readable
 * list of constants. OIDs are covered by many different standards,
 * so typically it's simpler to use a pre-compiled list of them, such
 * as:
 * 
 * * <https://www.cs.auckland.ac.nz/~pgut001/dumpasn1.cfg>
 * * <http://oid-info.com/>
 * * <https://www.alvestrand.no/objectid/top.html>
 */

namespace {
    class Asn1Der extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Asn1Der $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_typeTag = $this->_io->readU1();
            $this->_m_len = new \Asn1Der\LenEncoded($this->_io, $this, $this->_root);
            switch ($this->typeTag()) {
                case \Asn1Der\TypeTag::OBJECT_ID:
                    $this->_m__raw_body = $this->_io->readBytes($this->len()->result());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Asn1Der\BodyObjectId($_io__raw_body, $this, $this->_root);
                    break;
                case \Asn1Der\TypeTag::PRINTABLE_STRING:
                    $this->_m__raw_body = $this->_io->readBytes($this->len()->result());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Asn1Der\BodyPrintableString($_io__raw_body, $this, $this->_root);
                    break;
                case \Asn1Der\TypeTag::SEQUENCE_10:
                    $this->_m__raw_body = $this->_io->readBytes($this->len()->result());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Asn1Der\BodySequence($_io__raw_body, $this, $this->_root);
                    break;
                case \Asn1Der\TypeTag::SEQUENCE_30:
                    $this->_m__raw_body = $this->_io->readBytes($this->len()->result());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Asn1Der\BodySequence($_io__raw_body, $this, $this->_root);
                    break;
                case \Asn1Der\TypeTag::SET:
                    $this->_m__raw_body = $this->_io->readBytes($this->len()->result());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Asn1Der\BodySequence($_io__raw_body, $this, $this->_root);
                    break;
                case \Asn1Der\TypeTag::UTF8STRING:
                    $this->_m__raw_body = $this->_io->readBytes($this->len()->result());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Asn1Der\BodyUtf8string($_io__raw_body, $this, $this->_root);
                    break;
                default:
                    $this->_m_body = $this->_io->readBytes($this->len()->result());
                    break;
            }
        }
        protected $_m_typeTag;
        protected $_m_len;
        protected $_m_body;
        protected $_m__raw_body;
        public function typeTag() { return $this->_m_typeTag; }
        public function len() { return $this->_m_len; }
        public function body() { return $this->_m_body; }
        public function _raw_body() { return $this->_m__raw_body; }
    }
}

namespace Asn1Der {
    class BodyObjectId extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Asn1Der $_parent = null, ?\Asn1Der $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_firstAndSecond = $this->_io->readU1();
            $this->_m_rest = $this->_io->readBytesFull();
        }
        protected $_m_first;
        public function first() {
            if ($this->_m_first !== null)
                return $this->_m_first;
            $this->_m_first = intval($this->firstAndSecond() / 40);
            return $this->_m_first;
        }
        protected $_m_second;
        public function second() {
            if ($this->_m_second !== null)
                return $this->_m_second;
            $this->_m_second = \Kaitai\Struct\Stream::mod($this->firstAndSecond(), 40);
            return $this->_m_second;
        }
        protected $_m_firstAndSecond;
        protected $_m_rest;
        public function firstAndSecond() { return $this->_m_firstAndSecond; }
        public function rest() { return $this->_m_rest; }
    }
}

namespace Asn1Der {
    class BodyPrintableString extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Asn1Der $_parent = null, ?\Asn1Der $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_str = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "ASCII");
        }
        protected $_m_str;
        public function str() { return $this->_m_str; }
    }
}

namespace Asn1Der {
    class BodySequence extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Asn1Der $_parent = null, ?\Asn1Der $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Asn1Der($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace Asn1Der {
    class BodyUtf8string extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Asn1Der $_parent = null, ?\Asn1Der $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_str = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
        }
        protected $_m_str;
        public function str() { return $this->_m_str; }
    }
}

namespace Asn1Der {
    class LenEncoded extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Asn1Der $_parent = null, ?\Asn1Der $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_b1 = $this->_io->readU1();
            if ($this->b1() == 130) {
                $this->_m_int2 = $this->_io->readU2be();
            }
            if ($this->b1() == 129) {
                $this->_m_int1 = $this->_io->readU1();
            }
        }
        protected $_m_result;
        public function result() {
            if ($this->_m_result !== null)
                return $this->_m_result;
            $this->_m_result = ($this->b1() == 129 ? $this->int1() : ($this->b1() == 130 ? $this->int2() : $this->b1()));
            return $this->_m_result;
        }
        protected $_m_b1;
        protected $_m_int2;
        protected $_m_int1;
        public function b1() { return $this->_m_b1; }
        public function int2() { return $this->_m_int2; }
        public function int1() { return $this->_m_int1; }
    }
}

namespace Asn1Der {
    class TypeTag {
        const END_OF_CONTENT = 0;
        const BOOLEAN = 1;
        const INTEGER = 2;
        const BIT_STRING = 3;
        const OCTET_STRING = 4;
        const NULL_VALUE = 5;
        const OBJECT_ID = 6;
        const OBJECT_DESCRIPTOR = 7;
        const EXTERNAL = 8;
        const REAL = 9;
        const ENUMERATED = 10;
        const EMBEDDED_PDV = 11;
        const UTF8STRING = 12;
        const RELATIVE_OID = 13;
        const SEQUENCE_10 = 16;
        const PRINTABLE_STRING = 19;
        const IA5STRING = 22;
        const SEQUENCE_30 = 48;
        const SET = 49;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 16 => true, 19 => true, 22 => true, 48 => true, 49 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
