<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * MessagePack (msgpack) is a system to serialize arbitrary structured
 * data into a compact binary stream.
 */

namespace {
    class Msgpack extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Msgpack $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_b1 = $this->_io->readU1();
            switch ($this->b1()) {
                case 211:
                    $this->_m_intExtra = $this->_io->readS8be();
                    break;
                case 209:
                    $this->_m_intExtra = $this->_io->readS2be();
                    break;
                case 210:
                    $this->_m_intExtra = $this->_io->readS4be();
                    break;
                case 208:
                    $this->_m_intExtra = $this->_io->readS1();
                    break;
                case 205:
                    $this->_m_intExtra = $this->_io->readU2be();
                    break;
                case 207:
                    $this->_m_intExtra = $this->_io->readU8be();
                    break;
                case 204:
                    $this->_m_intExtra = $this->_io->readU1();
                    break;
                case 206:
                    $this->_m_intExtra = $this->_io->readU4be();
                    break;
            }
            if ($this->isFloat32()) {
                $this->_m_float32Value = $this->_io->readF4be();
            }
            if ($this->isFloat64()) {
                $this->_m_float64Value = $this->_io->readF8be();
            }
            if ($this->isStr8()) {
                $this->_m_strLen8 = $this->_io->readU1();
            }
            if ($this->isStr16()) {
                $this->_m_strLen16 = $this->_io->readU2be();
            }
            if ($this->isStr32()) {
                $this->_m_strLen32 = $this->_io->readU4be();
            }
            if ($this->isStr()) {
                $this->_m_strValue = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->strLen()), "UTF-8");
            }
            if ($this->isArray16()) {
                $this->_m_numArrayElements16 = $this->_io->readU2be();
            }
            if ($this->isArray32()) {
                $this->_m_numArrayElements32 = $this->_io->readU4be();
            }
            if ($this->isArray()) {
                $this->_m_arrayElements = [];
                $n = $this->numArrayElements();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_arrayElements[] = new \Msgpack($this->_io);
                }
            }
            if ($this->isMap16()) {
                $this->_m_numMapElements16 = $this->_io->readU2be();
            }
            if ($this->isMap32()) {
                $this->_m_numMapElements32 = $this->_io->readU4be();
            }
            if ($this->isMap()) {
                $this->_m_mapElements = [];
                $n = $this->numMapElements();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_mapElements[] = new \Msgpack\MapTuple($this->_io, $this, $this->_root);
                }
            }
        }
        protected $_m_isArray32;
        public function isArray32() {
            if ($this->_m_isArray32 !== null)
                return $this->_m_isArray32;
            $this->_m_isArray32 = $this->b1() == 221;
            return $this->_m_isArray32;
        }
        protected $_m_intValue;
        public function intValue() {
            if ($this->_m_intValue !== null)
                return $this->_m_intValue;
            if ($this->isInt()) {
                $this->_m_intValue = ($this->isPosInt7() ? $this->posInt7Value() : ($this->isNegInt5() ? $this->negInt5Value() : 4919));
            }
            return $this->_m_intValue;
        }
        protected $_m_strLen;
        public function strLen() {
            if ($this->_m_strLen !== null)
                return $this->_m_strLen;
            if ($this->isStr()) {
                $this->_m_strLen = ($this->isFixStr() ? ($this->b1() & 31) : ($this->isStr8() ? $this->strLen8() : ($this->isStr16() ? $this->strLen16() : $this->strLen32())));
            }
            return $this->_m_strLen;
        }
        protected $_m_isFixArray;
        public function isFixArray() {
            if ($this->_m_isFixArray !== null)
                return $this->_m_isFixArray;
            $this->_m_isFixArray = ($this->b1() & 240) == 144;
            return $this->_m_isFixArray;
        }
        protected $_m_isMap;
        public function isMap() {
            if ($this->_m_isMap !== null)
                return $this->_m_isMap;
            $this->_m_isMap =  (($this->isFixMap()) || ($this->isMap16()) || ($this->isMap32())) ;
            return $this->_m_isMap;
        }
        protected $_m_isArray;
        public function isArray() {
            if ($this->_m_isArray !== null)
                return $this->_m_isArray;
            $this->_m_isArray =  (($this->isFixArray()) || ($this->isArray16()) || ($this->isArray32())) ;
            return $this->_m_isArray;
        }
        protected $_m_isFloat;
        public function isFloat() {
            if ($this->_m_isFloat !== null)
                return $this->_m_isFloat;
            $this->_m_isFloat =  (($this->isFloat32()) || ($this->isFloat64())) ;
            return $this->_m_isFloat;
        }
        protected $_m_isStr8;
        public function isStr8() {
            if ($this->_m_isStr8 !== null)
                return $this->_m_isStr8;
            $this->_m_isStr8 = $this->b1() == 217;
            return $this->_m_isStr8;
        }
        protected $_m_isFixMap;
        public function isFixMap() {
            if ($this->_m_isFixMap !== null)
                return $this->_m_isFixMap;
            $this->_m_isFixMap = ($this->b1() & 240) == 128;
            return $this->_m_isFixMap;
        }
        protected $_m_isInt;
        public function isInt() {
            if ($this->_m_isInt !== null)
                return $this->_m_isInt;
            $this->_m_isInt =  (($this->isPosInt7()) || ($this->isNegInt5())) ;
            return $this->_m_isInt;
        }
        protected $_m_isBool;
        public function isBool() {
            if ($this->_m_isBool !== null)
                return $this->_m_isBool;
            $this->_m_isBool =  (($this->b1() == 194) || ($this->b1() == 195)) ;
            return $this->_m_isBool;
        }
        protected $_m_isStr16;
        public function isStr16() {
            if ($this->_m_isStr16 !== null)
                return $this->_m_isStr16;
            $this->_m_isStr16 = $this->b1() == 218;
            return $this->_m_isStr16;
        }
        protected $_m_isFloat64;
        public function isFloat64() {
            if ($this->_m_isFloat64 !== null)
                return $this->_m_isFloat64;
            $this->_m_isFloat64 = $this->b1() == 203;
            return $this->_m_isFloat64;
        }
        protected $_m_isMap16;
        public function isMap16() {
            if ($this->_m_isMap16 !== null)
                return $this->_m_isMap16;
            $this->_m_isMap16 = $this->b1() == 222;
            return $this->_m_isMap16;
        }
        protected $_m_isNegInt5;
        public function isNegInt5() {
            if ($this->_m_isNegInt5 !== null)
                return $this->_m_isNegInt5;
            $this->_m_isNegInt5 = ($this->b1() & 224) == 224;
            return $this->_m_isNegInt5;
        }
        protected $_m_posInt7Value;
        public function posInt7Value() {
            if ($this->_m_posInt7Value !== null)
                return $this->_m_posInt7Value;
            if ($this->isPosInt7()) {
                $this->_m_posInt7Value = $this->b1();
            }
            return $this->_m_posInt7Value;
        }
        protected $_m_isNil;
        public function isNil() {
            if ($this->_m_isNil !== null)
                return $this->_m_isNil;
            $this->_m_isNil = $this->b1() == 192;
            return $this->_m_isNil;
        }
        protected $_m_floatValue;
        public function floatValue() {
            if ($this->_m_floatValue !== null)
                return $this->_m_floatValue;
            if ($this->isFloat()) {
                $this->_m_floatValue = ($this->isFloat32() ? $this->float32Value() : $this->float64Value());
            }
            return $this->_m_floatValue;
        }
        protected $_m_numArrayElements;
        public function numArrayElements() {
            if ($this->_m_numArrayElements !== null)
                return $this->_m_numArrayElements;
            if ($this->isArray()) {
                $this->_m_numArrayElements = ($this->isFixArray() ? ($this->b1() & 15) : ($this->isArray16() ? $this->numArrayElements16() : $this->numArrayElements32()));
            }
            return $this->_m_numArrayElements;
        }
        protected $_m_negInt5Value;
        public function negInt5Value() {
            if ($this->_m_negInt5Value !== null)
                return $this->_m_negInt5Value;
            if ($this->isNegInt5()) {
                $this->_m_negInt5Value = -(($this->b1() & 31));
            }
            return $this->_m_negInt5Value;
        }
        protected $_m_boolValue;
        public function boolValue() {
            if ($this->_m_boolValue !== null)
                return $this->_m_boolValue;
            if ($this->isBool()) {
                $this->_m_boolValue = $this->b1() == 195;
            }
            return $this->_m_boolValue;
        }
        protected $_m_isPosInt7;
        public function isPosInt7() {
            if ($this->_m_isPosInt7 !== null)
                return $this->_m_isPosInt7;
            $this->_m_isPosInt7 = ($this->b1() & 128) == 0;
            return $this->_m_isPosInt7;
        }
        protected $_m_isArray16;
        public function isArray16() {
            if ($this->_m_isArray16 !== null)
                return $this->_m_isArray16;
            $this->_m_isArray16 = $this->b1() == 220;
            return $this->_m_isArray16;
        }
        protected $_m_isStr;
        public function isStr() {
            if ($this->_m_isStr !== null)
                return $this->_m_isStr;
            $this->_m_isStr =  (($this->isFixStr()) || ($this->isStr8()) || ($this->isStr16()) || ($this->isStr32())) ;
            return $this->_m_isStr;
        }
        protected $_m_isFixStr;
        public function isFixStr() {
            if ($this->_m_isFixStr !== null)
                return $this->_m_isFixStr;
            $this->_m_isFixStr = ($this->b1() & 224) == 160;
            return $this->_m_isFixStr;
        }
        protected $_m_isStr32;
        public function isStr32() {
            if ($this->_m_isStr32 !== null)
                return $this->_m_isStr32;
            $this->_m_isStr32 = $this->b1() == 219;
            return $this->_m_isStr32;
        }
        protected $_m_numMapElements;
        public function numMapElements() {
            if ($this->_m_numMapElements !== null)
                return $this->_m_numMapElements;
            if ($this->isMap()) {
                $this->_m_numMapElements = ($this->isFixMap() ? ($this->b1() & 15) : ($this->isMap16() ? $this->numMapElements16() : $this->numMapElements32()));
            }
            return $this->_m_numMapElements;
        }
        protected $_m_isFloat32;
        public function isFloat32() {
            if ($this->_m_isFloat32 !== null)
                return $this->_m_isFloat32;
            $this->_m_isFloat32 = $this->b1() == 202;
            return $this->_m_isFloat32;
        }
        protected $_m_isMap32;
        public function isMap32() {
            if ($this->_m_isMap32 !== null)
                return $this->_m_isMap32;
            $this->_m_isMap32 = $this->b1() == 223;
            return $this->_m_isMap32;
        }
        protected $_m_b1;
        protected $_m_intExtra;
        protected $_m_float32Value;
        protected $_m_float64Value;
        protected $_m_strLen8;
        protected $_m_strLen16;
        protected $_m_strLen32;
        protected $_m_strValue;
        protected $_m_numArrayElements16;
        protected $_m_numArrayElements32;
        protected $_m_arrayElements;
        protected $_m_numMapElements16;
        protected $_m_numMapElements32;
        protected $_m_mapElements;

        /**
         * First byte is msgpack message is either a piece of data by
         * itself or determines types of further, more complex data
         * structures.
         */
        public function b1() { return $this->_m_b1; }
        public function intExtra() { return $this->_m_intExtra; }
        public function float32Value() { return $this->_m_float32Value; }
        public function float64Value() { return $this->_m_float64Value; }
        public function strLen8() { return $this->_m_strLen8; }
        public function strLen16() { return $this->_m_strLen16; }
        public function strLen32() { return $this->_m_strLen32; }
        public function strValue() { return $this->_m_strValue; }
        public function numArrayElements16() { return $this->_m_numArrayElements16; }
        public function numArrayElements32() { return $this->_m_numArrayElements32; }
        public function arrayElements() { return $this->_m_arrayElements; }
        public function numMapElements16() { return $this->_m_numMapElements16; }
        public function numMapElements32() { return $this->_m_numMapElements32; }
        public function mapElements() { return $this->_m_mapElements; }
    }
}

namespace Msgpack {
    class MapTuple extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Msgpack $_parent = null, \Msgpack $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_key = new \Msgpack($this->_io);
            $this->_m_value = new \Msgpack($this->_io);
        }
        protected $_m_key;
        protected $_m_value;
        public function key() { return $this->_m_key; }
        public function value() { return $this->_m_value; }
    }
}
