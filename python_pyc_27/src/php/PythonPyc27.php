<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Python interpreter runs .py files in 2 step process: first, it
 * produces bytecode, which it then executes. Translation of .py source
 * into bytecode is time-consuming, so Python dumps compiled bytecode
 * into .pyc files, to be reused from cache at later time if possible.
 * 
 * .pyc file is essentially a raw dump of `py_object` (see `body`) with
 * a simple header prepended.
 */

class PythonPyc27 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \PythonPyc27 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_versionMagic = $this->_io->readU2le();
        $this->_m_crlf = $this->_io->readU2le();
        $this->_m_modificationTimestamp = $this->_io->readU4le();
        $this->_m_body = new \PythonPyc27\PyObject($this->_io, $this, $this->_root);
    }
    protected $_m_versionMagic;
    protected $_m_crlf;
    protected $_m_modificationTimestamp;
    protected $_m_body;
    public function versionMagic() { return $this->_m_versionMagic; }
    public function crlf() { return $this->_m_crlf; }
    public function modificationTimestamp() { return $this->_m_modificationTimestamp; }
    public function body() { return $this->_m_body; }
}

namespace \PythonPyc27;

class CodeObject extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \PythonPyc27\PyObject $_parent = null, \PythonPyc27 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_argCount = $this->_io->readU4le();
        $this->_m_localCount = $this->_io->readU4le();
        $this->_m_stackSize = $this->_io->readU4le();
        $this->_m_flags = $this->_io->readU4le();
        $this->_m_code = new \PythonPyc27\Assembly($this->_io, $this, $this->_root);
        $this->_m_consts = new \PythonPyc27\PyObject($this->_io, $this, $this->_root);
        $this->_m_names = new \PythonPyc27\PyObject($this->_io, $this, $this->_root);
        $this->_m_varNames = new \PythonPyc27\PyObject($this->_io, $this, $this->_root);
        $this->_m_freeVars = new \PythonPyc27\PyObject($this->_io, $this, $this->_root);
        $this->_m_cellVars = new \PythonPyc27\PyObject($this->_io, $this, $this->_root);
        $this->_m_filename = new \PythonPyc27\PyObject($this->_io, $this, $this->_root);
        $this->_m_name = new \PythonPyc27\PyObject($this->_io, $this, $this->_root);
        $this->_m_firstLineNo = $this->_io->readU4le();
        $this->_m_lnotab = new \PythonPyc27\PyObject($this->_io, $this, $this->_root);
    }
    protected $_m_argCount;
    protected $_m_localCount;
    protected $_m_stackSize;
    protected $_m_flags;
    protected $_m_code;
    protected $_m_consts;
    protected $_m_names;
    protected $_m_varNames;
    protected $_m_freeVars;
    protected $_m_cellVars;
    protected $_m_filename;
    protected $_m_name;
    protected $_m_firstLineNo;
    protected $_m_lnotab;
    public function argCount() { return $this->_m_argCount; }
    public function localCount() { return $this->_m_localCount; }
    public function stackSize() { return $this->_m_stackSize; }
    public function flags() { return $this->_m_flags; }
    public function code() { return $this->_m_code; }
    public function consts() { return $this->_m_consts; }
    public function names() { return $this->_m_names; }
    public function varNames() { return $this->_m_varNames; }
    public function freeVars() { return $this->_m_freeVars; }
    public function cellVars() { return $this->_m_cellVars; }
    public function filename() { return $this->_m_filename; }
    public function name() { return $this->_m_name; }
    public function firstLineNo() { return $this->_m_firstLineNo; }
    public function lnotab() { return $this->_m_lnotab; }
}

namespace \PythonPyc27\CodeObject;

class FlagsEnum {
    const HAS_ARGS = 4;
    const HAS_KWARGS = 8;
    const GENERATOR = 32;
}

namespace \PythonPyc27;

class Assembly extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \PythonPyc27\CodeObject $_parent = null, \PythonPyc27 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_stringMagic = $this->_io->ensureFixedContents("\x73");
        $this->_m_length = $this->_io->readU4le();
        $this->_m__raw_items = $this->_io->readBytes($this->length());
        $io = new \Kaitai\Struct\Stream($this->_m__raw_items);
        $this->_m_items = new \PythonPyc27\OpArgs($io, $this, $this->_root);
    }
    protected $_m_stringMagic;
    protected $_m_length;
    protected $_m_items;
    protected $_m__raw_items;
    public function stringMagic() { return $this->_m_stringMagic; }
    public function length() { return $this->_m_length; }
    public function items() { return $this->_m_items; }
    public function _raw_items() { return $this->_m__raw_items; }
}

namespace \PythonPyc27;

class OpArg extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \PythonPyc27\OpArgs $_parent = null, \PythonPyc27 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_opCode = $this->_io->readU1();
        if ($this->opCode() >= \PythonPyc27\OpArg\OpCodeEnum::STORE_NAME) {
            $this->_m_arg = $this->_io->readU2le();
        }
    }
    protected $_m_opCode;
    protected $_m_arg;
    public function opCode() { return $this->_m_opCode; }
    public function arg() { return $this->_m_arg; }
}

namespace \PythonPyc27\OpArg;

class OpCodeEnum {
    const STOP_CODE = 0;
    const POP_TOP = 1;
    const ROT_TWO = 2;
    const ROT_THREE = 3;
    const DUP_TOP = 4;
    const ROT_FOUR = 5;
    const NOP = 9;
    const UNARY_POSITIVE = 10;
    const UNARY_NEGATIVE = 11;
    const UNARY_NOT = 12;
    const UNARY_CONVERT = 13;
    const UNARY_INVERT = 15;
    const BINARY_POWER = 19;
    const BINARY_MULTIPLY = 20;
    const BINARY_DIVIDE = 21;
    const BINARY_MODULO = 22;
    const BINARY_ADD = 23;
    const BINARY_SUBTRACT = 24;
    const BINARY_SUBSCR = 25;
    const BINARY_FLOOR_DIVIDE = 26;
    const BINARY_TRUE_DIVIDE = 27;
    const INPLACE_FLOOR_DIVIDE = 28;
    const INPLACE_TRUE_DIVIDE = 29;
    const SLICE_0 = 30;
    const SLICE_1 = 31;
    const SLICE_2 = 32;
    const SLICE_3 = 33;
    const STORE_SLICE_0 = 40;
    const STORE_SLICE_1 = 41;
    const STORE_SLICE_2 = 42;
    const STORE_SLICE_3 = 43;
    const DELETE_SLICE_0 = 50;
    const DELETE_SLICE_1 = 51;
    const DELETE_SLICE_2 = 52;
    const DELETE_SLICE_3 = 53;
    const STORE_MAP = 54;
    const INPLACE_ADD = 55;
    const INPLACE_SUBTRACT = 56;
    const INPLACE_MULTIPLY = 57;
    const INPLACE_DIVIDE = 58;
    const INPLACE_MODULO = 59;
    const STORE_SUBSCR = 60;
    const DELETE_SUBSCR = 61;
    const BINARY_LSHIFT = 62;
    const BINARY_RSHIFT = 63;
    const BINARY_AND = 64;
    const BINARY_XOR = 65;
    const BINARY_OR = 66;
    const INPLACE_POWER = 67;
    const GET_ITER = 68;
    const PRINT_EXPR = 70;
    const PRINT_ITEM = 71;
    const PRINT_NEWLINE = 72;
    const PRINT_ITEM_TO = 73;
    const PRINT_NEWLINE_TO = 74;
    const INPLACE_LSHIFT = 75;
    const INPLACE_RSHIFT = 76;
    const INPLACE_AND = 77;
    const INPLACE_XOR = 78;
    const INPLACE_OR = 79;
    const BREAK_LOOP = 80;
    const WITH_CLEANUP = 81;
    const LOAD_LOCALS = 82;
    const RETURN_VALUE = 83;
    const IMPORT_STAR = 84;
    const EXEC_STMT = 85;
    const YIELD_VALUE = 86;
    const POP_BLOCK = 87;
    const END_FINALLY = 88;
    const BUILD_CLASS = 89;
    const STORE_NAME = 90;
    const DELETE_NAME = 91;
    const UNPACK_SEQUENCE = 92;
    const FOR_ITER = 93;
    const LIST_APPEND = 94;
    const STORE_ATTR = 95;
    const DELETE_ATTR = 96;
    const STORE_GLOBAL = 97;
    const DELETE_GLOBAL = 98;
    const DUP_TOPX = 99;
    const LOAD_CONST = 100;
    const LOAD_NAME = 101;
    const BUILD_TUPLE = 102;
    const BUILD_LIST = 103;
    const BUILD_SET = 104;
    const BUILD_MAP = 105;
    const LOAD_ATTR = 106;
    const COMPARE_OP = 107;
    const IMPORT_NAME = 108;
    const IMPORT_FROM = 109;
    const JUMP_FORWARD = 110;
    const JUMP_IF_FALSE_OR_POP = 111;
    const JUMP_IF_TRUE_OR_POP = 112;
    const JUMP_ABSOLUTE = 113;
    const POP_JUMP_IF_FALSE = 114;
    const POP_JUMP_IF_TRUE = 115;
    const LOAD_GLOBAL = 116;
    const CONTINUE_LOOP = 119;
    const SETUP_LOOP = 120;
    const SETUP_EXCEPT = 121;
    const SETUP_FINALLY = 122;
    const LOAD_FAST = 124;
    const STORE_FAST = 125;
    const DELETE_FAST = 126;
    const RAISE_VARARGS = 130;
    const CALL_FUNCTION = 131;
    const MAKE_FUNCTION = 132;
    const BUILD_SLICE = 133;
    const MAKE_CLOSURE = 134;
    const LOAD_CLOSURE = 135;
    const LOAD_DEREF = 136;
    const STORE_DEREF = 137;
    const CALL_FUNCTION_VAR = 140;
    const CALL_FUNCTION_KW = 141;
    const CALL_FUNCTION_VAR_KW = 142;
    const SETUP_WITH = 143;
    const EXTENDED_ARG = 145;
    const SET_ADD = 146;
    const MAP_ADD = 147;
}

namespace \PythonPyc27;

class PyObject extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \PythonPyc27 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_type = $this->_io->readU1();
        switch ($this->type()) {
            case \PythonPyc27\PyObject\ObjectType::NONE:
                $this->_m_value = new \PythonPyc27\PyObject\PyNone($this->_io, $this, $this->_root);
                break;
            case \PythonPyc27\PyObject\ObjectType::CODE_OBJECT:
                $this->_m_value = new \PythonPyc27\CodeObject($this->_io, $this, $this->_root);
                break;
            case \PythonPyc27\PyObject\ObjectType::INT:
                $this->_m_value = $this->_io->readU4le();
                break;
            case \PythonPyc27\PyObject\ObjectType::STRING_REF:
                $this->_m_value = new \PythonPyc27\PyObject\StringRef($this->_io, $this, $this->_root);
                break;
            case \PythonPyc27\PyObject\ObjectType::STRING:
                $this->_m_value = new \PythonPyc27\PyObject\PyString($this->_io, $this, $this->_root);
                break;
            case \PythonPyc27\PyObject\ObjectType::PY_FALSE:
                $this->_m_value = new \PythonPyc27\PyObject\PyFalse($this->_io, $this, $this->_root);
                break;
            case \PythonPyc27\PyObject\ObjectType::INTERNED:
                $this->_m_value = new \PythonPyc27\PyObject\InternedString($this->_io, $this, $this->_root);
                break;
            case \PythonPyc27\PyObject\ObjectType::TUPLE:
                $this->_m_value = new \PythonPyc27\PyObject\Tuple($this->_io, $this, $this->_root);
                break;
            case \PythonPyc27\PyObject\ObjectType::PY_TRUE:
                $this->_m_value = new \PythonPyc27\PyObject\PyTrue($this->_io, $this, $this->_root);
                break;
        }
    }
    protected $_m_type;
    protected $_m_value;
    public function type() { return $this->_m_type; }
    public function value() { return $this->_m_value; }
}

namespace \PythonPyc27\PyObject;

class PyNone extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \PythonPyc27\PyObject $_parent = null, \PythonPyc27 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
    }
}

namespace \PythonPyc27\PyObject;

class PyFalse extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \PythonPyc27\PyObject $_parent = null, \PythonPyc27 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
    }
}

namespace \PythonPyc27\PyObject;

class StringRef extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \PythonPyc27\PyObject $_parent = null, \PythonPyc27 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_internedListIndex = $this->_io->readU4le();
    }
    protected $_m_internedListIndex;
    public function internedListIndex() { return $this->_m_internedListIndex; }
}

namespace \PythonPyc27\PyObject;

class PyTrue extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \PythonPyc27\PyObject $_parent = null, \PythonPyc27 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
    }
}

namespace \PythonPyc27\PyObject;

class Tuple extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \PythonPyc27\PyObject $_parent = null, \PythonPyc27 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_count = $this->_io->readU4le();
        $this->_m_items = [];
        $n = $this->count();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_items[] = new \PythonPyc27\PyObject($this->_io, $this, $this->_root);
        }
    }
    protected $_m_count;
    protected $_m_items;
    public function count() { return $this->_m_count; }
    public function items() { return $this->_m_items; }
}

namespace \PythonPyc27\PyObject;

class UnicodeString extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \PythonPyc27 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_length = $this->_io->readU4le();
        $this->_m_data = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->length()), "utf-8");
    }
    protected $_m_length;
    protected $_m_data;
    public function length() { return $this->_m_length; }
    public function data() { return $this->_m_data; }
}

namespace \PythonPyc27\PyObject;

class InternedString extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \PythonPyc27\PyObject $_parent = null, \PythonPyc27 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_length = $this->_io->readU4le();
        $this->_m_data = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->length()), "utf-8");
    }
    protected $_m_length;
    protected $_m_data;
    public function length() { return $this->_m_length; }
    public function data() { return $this->_m_data; }
}

namespace \PythonPyc27\PyObject;

class PyString extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \PythonPyc27\PyObject $_parent = null, \PythonPyc27 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_length = $this->_io->readU4le();
        $this->_m_data = $this->_io->readBytes($this->length());
    }
    protected $_m_length;
    protected $_m_data;
    public function length() { return $this->_m_length; }
    public function data() { return $this->_m_data; }
}

namespace \PythonPyc27\PyObject;

class ObjectType {
    const TUPLE = 40;
    const PY_FALSE = 70;
    const NONE = 78;
    const STRING_REF = 82;
    const PY_TRUE = 84;
    const CODE_OBJECT = 99;
    const INT = 105;
    const STRING = 115;
    const INTERNED = 116;
    const UNICODE_STRING = 117;
}

namespace \PythonPyc27;

class OpArgs extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \PythonPyc27\Assembly $_parent = null, \PythonPyc27 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_items = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_items[] = new \PythonPyc27\OpArg($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_items;
    public function items() { return $this->_m_items; }
}

namespace \PythonPyc27;

class Version {
    const V15 = 20121;
    const V16 = 50428;
    const V20 = 50823;
    const V21 = 60202;
    const V22 = 60717;
    const V23_A0 = 62011;
    const V23_A0B = 62021;
    const V24_A0 = 62041;
    const V24_A3 = 62051;
    const V24_B1 = 62061;
    const V25_A0 = 62071;
    const V25_A0B = 62081;
    const V25_A0C = 62091;
    const V25_A0D = 62092;
    const V25_B3 = 62101;
    const V25_B3B = 62111;
    const V25_C1 = 62121;
    const V25_C2 = 62131;
    const V26_A0 = 62151;
    const V26_A1 = 62161;
    const V27_A0 = 62171;
    const V27_A0B = 62181;
    const V27_A0C = 62191;
    const V27_A0D = 62201;
    const V27_A0E = 62211;
}
