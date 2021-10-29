<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Python Pickle format serializes Python objects to a byte stream, as a sequence
 * of operations to run on the Pickle Virtual Machine.
 * 
 * The format is mostly implementation defined, there is no formal specification.
 * Pickle data types are closely coupled to the Python object model.
 * Python singletons, and most builtin types (e.g. `None`, `int`,`dict`, `list`)
 * are serialised using dedicated Pickle opcodes.
 * Other builtin types, and all classes  (e.g. `set`, `datetime.datetime`) are
 * serialised by encoding the name of a constructor callable.
 * They are deserialised by importing that constructor, and calling it.
 * So, unpickling an arbitrary pickle, using the Python's stdlib pickle module
 * can cause arbitrary code execution.
 * 
 * Pickle format has evolved with Python, later protocols add opcodes & types.
 * Later Python releases can pickle to or unpickle from any earlier protocol.
 * 
 * * Protocol 0: ASCII clean, no explicit version, fields are '\n' terminated.
 * * Protocol 1: Binary, no explicit version, first length prefixed types.
 * * Protocol 2: Python 2.3+. Explicit versioning, more length prefixed types.
 *   https://www.python.org/dev/peps/pep-0307/
 * * Protocol 3: Python 3.0+. Dedicated opcodes for `bytes` objects.
 * * Protocol 4: Python 3.4+. Opcodes for 64 bit strings, framing, `set`.
 *   https://www.python.org/dev/peps/pep-3154/
 * * Protocol 5: Python 3.8+: Opcodes for `bytearray` and out of band data
 *   https://www.python.org/dev/peps/pep-0574/
 */

namespace {
    class PythonPickle extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ops = [];
            $i = 0;
            do {
                $_ = new \PythonPickle\Op($this->_io, $this, $this->_root);
                $this->_m_ops[] = $_;
                $i++;
            } while (!($_->code() == \PythonPickle\Opcode::STOP));
        }
        protected $_m_ops;
        public function ops() { return $this->_m_ops; }
    }
}

/**
 * Length prefixed string, between 0 and 2**64-1 bytes long.
 * 
 * Only a 64-bit build of Python would produce a pickle containing strings
 * large enough to need this type. Such a pickle could not be unpickled on
 * a 32-bit build of Python, because the string would be larger than
 * `sys.maxsize`.
 */

namespace PythonPickle {
    class Unicodestring8 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PythonPickle\Op $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_len = $this->_io->readU8le();
            $this->_m_val = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->len()), "utf8");
        }
        protected $_m_len;
        protected $_m_val;
        public function len() { return $this->_m_len; }
        public function val() { return $this->_m_val; }
    }
}

/**
 * Large signed integer, in the range -2**(8*255-1) to 2**(8*255-1)-1,
 * encoded as two's complement.
 */

namespace PythonPickle {
    class Long1 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PythonPickle\Op $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_len = $this->_io->readU1();
            $this->_m_val = $this->_io->readBytes($this->len());
        }
        protected $_m_len;
        protected $_m_val;
        public function len() { return $this->_m_len; }
        public function val() { return $this->_m_val; }
    }
}

/**
 * Length prefixed string, between 0 and 2**64-1 bytes long.
 * 
 * Only a 64-bit build of Python would produce a pickle containing strings
 * large enough to need this type. Such a pickle could not be unpickled on
 * a 32-bit build of Python, because the string would be larger than
 * `sys.maxsize`.
 */

namespace PythonPickle {
    class Bytes8 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PythonPickle\Op $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_len = $this->_io->readU8le();
            $this->_m_val = $this->_io->readBytes($this->len());
        }
        protected $_m_len;
        protected $_m_val;
        public function len() { return $this->_m_len; }
        public function val() { return $this->_m_val; }
    }
}

/**
 * Length prefixed byte string, between 0 and 255 bytes long.
 */

namespace PythonPickle {
    class Bytes1 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PythonPickle\Op $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_len = $this->_io->readU1();
            $this->_m_val = $this->_io->readBytes($this->len());
        }
        protected $_m_len;
        protected $_m_val;
        public function len() { return $this->_m_len; }
        public function val() { return $this->_m_val; }
    }
}

/**
 * Length prefixed string, between 0 and 2**32-1 bytes long
 */

namespace PythonPickle {
    class Bytes4 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PythonPickle\Op $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_len = $this->_io->readU4le();
            $this->_m_val = $this->_io->readBytes($this->len());
        }
        protected $_m_len;
        protected $_m_val;
        public function len() { return $this->_m_len; }
        public function val() { return $this->_m_val; }
    }
}

/**
 * Some opcodes take no argument, this empty type is used for them.
 */

namespace PythonPickle {
    class NoArg extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PythonPickle\Op $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
        }
    }
}

/**
 * Unquoted string, does not contain string escapes.
 */

namespace PythonPickle {
    class StringnlNoescape extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_val = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(10, false, true, true), "ascii");
        }
        protected $_m_val;
        public function val() { return $this->_m_val; }
    }
}

/**
 * Integer, encoded with the ASCII chracters [0-9-], followed by 'L'.
 */

namespace PythonPickle {
    class DecimalnlLong extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PythonPickle\Op $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_val = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(10, false, true, true), "ascii");
        }
        protected $_m_val;
        public function val() { return $this->_m_val; }
    }
}

/**
 * Length prefixed string, between 0 and 2**32-1 bytes long
 */

namespace PythonPickle {
    class Unicodestring4 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PythonPickle\Op $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_len = $this->_io->readU4le();
            $this->_m_val = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->len()), "utf8");
        }
        protected $_m_len;
        protected $_m_val;
        public function len() { return $this->_m_len; }
        public function val() { return $this->_m_val; }
    }
}

/**
 * Unquoted string, containing Python Unicode escapes.
 */

namespace PythonPickle {
    class Unicodestringnl extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PythonPickle\Op $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_val = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(10, false, true, true), "ascii");
        }
        protected $_m_val;
        public function val() { return $this->_m_val; }
    }
}

/**
 * Large signed integer, in the range -2**(8*2**32-1) to 2**(8*2**32-1)-1,
 * encoded as two's complement.
 */

namespace PythonPickle {
    class Long4 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PythonPickle\Op $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_len = $this->_io->readU4le();
            $this->_m_val = $this->_io->readBytes($this->len());
        }
        protected $_m_len;
        protected $_m_val;
        public function len() { return $this->_m_len; }
        public function val() { return $this->_m_val; }
    }
}

/**
 * Length prefixed string, between 0 and 255 bytes long. Encoding is
 * unspecified.
 * 
 * The default Python 2.x string type (`str`) is a sequence of bytes.
 * These are pickled as `string1` or `string4`, when protocol == 2.
 * The bytes are written directly, no explicit encoding is performed.
 * 
 * Python 3.x will not pickle an object as `string1` or `string4`.
 * Instead, opcodes and types with a known encoding are used.
 * When unpickling
 * 
 * - `pickle.Unpickler` objects default to ASCII, which can be overriden
 * - `pickletools.dis` uses latin1, and cannot be overriden
 */

namespace PythonPickle {
    class String1 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PythonPickle\Op $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_len = $this->_io->readU1();
            $this->_m_val = $this->_io->readBytes($this->len());
        }
        protected $_m_len;
        protected $_m_val;
        public function len() { return $this->_m_len; }
        public function val() { return $this->_m_val; }
    }
}

/**
 * Length prefixed string, between 0 and 2**64-1 bytes long.
 * 
 * The contents are deserilised into a `bytearray` object.
 */

namespace PythonPickle {
    class Bytearray8 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PythonPickle\Op $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_len = $this->_io->readU8le();
            $this->_m_val = $this->_io->readBytes($this->len());
        }
        protected $_m_len;
        protected $_m_val;
        public function len() { return $this->_m_len; }
        public function val() { return $this->_m_val; }
    }
}

/**
 * Integer or boolean, encoded with the ASCII characters [0-9-].
 * 
 * The values '00' and '01' encode the Python values `False` and `True`.
 * Normally a value would not contain leading '0' characters.
 */

namespace PythonPickle {
    class DecimalnlShort extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PythonPickle\Op $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_val = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(10, false, true, true), "ascii");
        }
        protected $_m_val;
        public function val() { return $this->_m_val; }
    }
}

/**
 * Length prefixed string, between 0 and 255 bytes long
 */

namespace PythonPickle {
    class Unicodestring1 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PythonPickle\Op $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_len = $this->_io->readU1();
            $this->_m_val = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->len()), "utf8");
        }
        protected $_m_len;
        protected $_m_val;
        public function len() { return $this->_m_len; }
        public function val() { return $this->_m_val; }
    }
}

/**
 * Quoted string, possibly containing Python string escapes.
 */

namespace PythonPickle {
    class Stringnl extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PythonPickle\Op $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_val = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(10, false, true, true), "ascii");
        }
        protected $_m_val;
        public function val() { return $this->_m_val; }
    }
}

/**
 * Pair of unquoted, unescaped strings.
 */

namespace PythonPickle {
    class StringnlNoescapePair extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PythonPickle\Op $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_val1 = new \PythonPickle\StringnlNoescape($this->_io, $this, $this->_root);
            $this->_m_val2 = new \PythonPickle\StringnlNoescape($this->_io, $this, $this->_root);
        }
        protected $_m_val1;
        protected $_m_val2;
        public function val1() { return $this->_m_val1; }
        public function val2() { return $this->_m_val2; }
    }
}

/**
 * Length prefixed string, between 0 and 2**31-1 bytes long. Encoding is
 * unspecified.
 * 
 * Although the len field is signed, any length < 0 will raise an exception
 * during unpickling.
 * 
 * See the documentation for `string1` for further detail about encodings.
 */

namespace PythonPickle {
    class String4 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PythonPickle\Op $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_len = $this->_io->readS4le();
            $this->_m_val = $this->_io->readBytes($this->len());
        }
        protected $_m_len;
        protected $_m_val;
        public function len() { return $this->_m_len; }
        public function val() { return $this->_m_val; }
    }
}

namespace PythonPickle {
    class Op extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PythonPickle $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_code = $this->_io->readU1();
            switch ($this->code()) {
                case \PythonPickle\Opcode::EXT4:
                    $this->_m_arg = $this->_io->readU4le();
                    break;
                case \PythonPickle\Opcode::TUPLE1:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::SETITEM:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::READONLY_BUFFER:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::STOP:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::EXT2:
                    $this->_m_arg = $this->_io->readU2le();
                    break;
                case \PythonPickle\Opcode::EMPTY_TUPLE:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::NEWTRUE:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::LONG:
                    $this->_m_arg = new \PythonPickle\DecimalnlLong($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::NEWOBJ:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::BYTEARRAY8:
                    $this->_m_arg = new \PythonPickle\Bytearray8($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::PUT:
                    $this->_m_arg = new \PythonPickle\DecimalnlShort($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::STACK_GLOBAL:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::POP_MARK:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::APPEND:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::NEWFALSE:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::BINPERSID:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::BUILD:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::EMPTY_DICT:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::TUPLE2:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::LONG4:
                    $this->_m_arg = new \PythonPickle\Long4($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::NEXT_BUFFER:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::APPENDS:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::BINBYTES:
                    $this->_m_arg = new \PythonPickle\Bytes4($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::DUP:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::LIST:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::PROTO:
                    $this->_m_arg = $this->_io->readU1();
                    break;
                case \PythonPickle\Opcode::POP:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::FRAME:
                    $this->_m_arg = $this->_io->readU8le();
                    break;
                case \PythonPickle\Opcode::STRING:
                    $this->_m_arg = new \PythonPickle\Stringnl($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::BINUNICODE:
                    $this->_m_arg = new \PythonPickle\Unicodestring4($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::FLOAT:
                    $this->_m_arg = new \PythonPickle\Floatnl($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::REDUCE:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::GLOBAL_OPCODE:
                    $this->_m_arg = new \PythonPickle\StringnlNoescapePair($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::BINPUT:
                    $this->_m_arg = $this->_io->readU1();
                    break;
                case \PythonPickle\Opcode::MEMOIZE:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::PERSID:
                    $this->_m_arg = new \PythonPickle\StringnlNoescape($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::EXT1:
                    $this->_m_arg = $this->_io->readU1();
                    break;
                case \PythonPickle\Opcode::NONE:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::SHORT_BINUNICODE:
                    $this->_m_arg = new \PythonPickle\Unicodestring1($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::OBJ:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::BINFLOAT:
                    $this->_m_arg = $this->_io->readF8be();
                    break;
                case \PythonPickle\Opcode::NEWOBJ_EX:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::EMPTY_LIST:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::TUPLE:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::BINUNICODE8:
                    $this->_m_arg = new \PythonPickle\Unicodestring8($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::BINGET:
                    $this->_m_arg = $this->_io->readU1();
                    break;
                case \PythonPickle\Opcode::DICT:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::BINSTRING:
                    $this->_m_arg = new \PythonPickle\String4($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::SETITEMS:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::BININT2:
                    $this->_m_arg = $this->_io->readU2le();
                    break;
                case \PythonPickle\Opcode::BINBYTES8:
                    $this->_m_arg = new \PythonPickle\Bytes8($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::BININT1:
                    $this->_m_arg = $this->_io->readU1();
                    break;
                case \PythonPickle\Opcode::INST:
                    $this->_m_arg = new \PythonPickle\StringnlNoescapePair($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::LONG_BINGET:
                    $this->_m_arg = $this->_io->readU4le();
                    break;
                case \PythonPickle\Opcode::LONG_BINPUT:
                    $this->_m_arg = $this->_io->readU4le();
                    break;
                case \PythonPickle\Opcode::INT:
                    $this->_m_arg = new \PythonPickle\DecimalnlShort($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::BININT:
                    $this->_m_arg = $this->_io->readS4le();
                    break;
                case \PythonPickle\Opcode::UNICODE:
                    $this->_m_arg = new \PythonPickle\Unicodestringnl($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::LONG1:
                    $this->_m_arg = new \PythonPickle\Long1($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::SHORT_BINSTRING:
                    $this->_m_arg = new \PythonPickle\String1($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::MARK:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::FROZENSET:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::TUPLE3:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::ADDITEMS:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::GET:
                    $this->_m_arg = new \PythonPickle\DecimalnlShort($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::EMPTY_SET:
                    $this->_m_arg = new \PythonPickle\NoArg($this->_io, $this, $this->_root);
                    break;
                case \PythonPickle\Opcode::SHORT_BINBYTES:
                    $this->_m_arg = new \PythonPickle\Bytes1($this->_io, $this, $this->_root);
                    break;
            }
        }
        protected $_m_code;
        protected $_m_arg;

        /**
         * Operation code that determines which action should be
         * performed next by the Pickle Virtual Machine. Some opcodes
         * are only available in later versions of the Pickle protocol.
         */
        public function code() { return $this->_m_code; }

        /**
         * Optional argument for the operation. Data type and length
         * are determined by the value of the opcode.
         */
        public function arg() { return $this->_m_arg; }
    }
}

/**
 * Double float, encoded with the ASCII characters [0-9.e+-], '-inf', 'inf',
 * or 'nan'.
 */

namespace PythonPickle {
    class Floatnl extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PythonPickle\Op $_parent = null, \PythonPickle $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_val = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(10, false, true, true), "ascii");
        }
        protected $_m_val;
        public function val() { return $this->_m_val; }
    }
}

namespace PythonPickle {
    class Opcode {

        /**
         * push special markobject on stack
         */
        const MARK = 40;

        /**
         * push empty tuple
         */
        const EMPTY_TUPLE = 41;

        /**
         * every pickle ends with STOP
         */
        const STOP = 46;

        /**
         * discard topmost stack item
         */
        const POP = 48;

        /**
         * discard stack top through topmost markobject
         */
        const POP_MARK = 49;

        /**
         * duplicate top stack item
         */
        const DUP = 50;

        /**
         * push bytes; counted binary string argument
         */
        const BINBYTES = 66;

        /**
         * push bytes; counted binary string argument < 256 bytes
         */
        const SHORT_BINBYTES = 67;

        /**
         * push float object; decimal string argument
         */
        const FLOAT = 70;

        /**
         * push float; arg is 8-byte float encoding
         */
        const BINFLOAT = 71;

        /**
         * push integer or bool; decimal string argument
         */
        const INT = 73;

        /**
         * push four-byte signed int
         */
        const BININT = 74;

        /**
         * push 1-byte unsigned int
         */
        const BININT1 = 75;

        /**
         * push long; decimal string argument
         */
        const LONG = 76;

        /**
         * push 2-byte unsigned int
         */
        const BININT2 = 77;

        /**
         * push None
         */
        const NONE = 78;

        /**
         * push persistent object; id is taken from string arg
         */
        const PERSID = 80;

        /**
         * push persistent object; id is taken from stack
         */
        const BINPERSID = 81;

        /**
         * apply callable to argtuple, both on stack
         */
        const REDUCE = 82;

        /**
         * push string; NL-terminated string argument
         */
        const STRING = 83;

        /**
         * push string; counted binary string argument
         */
        const BINSTRING = 84;

        /**
         * push string; counted binary string argument 256 bytes
         */
        const SHORT_BINSTRING = 85;

        /**
         * push Unicode string; raw-unicode-escaped argument
         */
        const UNICODE = 86;

        /**
         * push Unicode string; counted UTF-8 string argument
         */
        const BINUNICODE = 88;

        /**
         * push empty list
         */
        const EMPTY_LIST = 93;

        /**
         * append stack top to list below it
         */
        const APPEND = 97;

        /**
         * call __setstate__ or __dict__.update()
         */
        const BUILD = 98;

        /**
         * push self.find_class(modname, name); 2 string args
         * 
         * As of KSC 0.9, this enum key can't be called `global` because it would
         * cause a syntax error in Python (it is a keyword).
         */
        const GLOBAL_OPCODE = 99;

        /**
         * build a dict from stack items
         */
        const DICT = 100;

        /**
         * extend list on stack by topmost stack slice
         */
        const APPENDS = 101;

        /**
         * push item from memo on stack; index is string arg
         */
        const GET = 103;

        /**
         * push item from memo on stack; index is 1-byte arg
         */
        const BINGET = 104;

        /**
         * build & push class instance
         */
        const INST = 105;

        /**
         * push item from memo on stack; index is 4-byte arg
         */
        const LONG_BINGET = 106;

        /**
         * build list from topmost stack items
         */
        const LIST = 108;

        /**
         * build & push class instance
         */
        const OBJ = 111;

        /**
         * store stack top in memo; index is string arg
         */
        const PUT = 112;

        /**
         * store stack top in memo; index is 1-byte arg
         */
        const BINPUT = 113;

        /**
         * store stack top in memo; index is 4-byte arg
         */
        const LONG_BINPUT = 114;

        /**
         * add key+value pair to dict
         */
        const SETITEM = 115;

        /**
         * build tuple from topmost stack items
         */
        const TUPLE = 116;

        /**
         * modify dict by adding topmost key+value pairs
         */
        const SETITEMS = 117;

        /**
         * push empty dict
         */
        const EMPTY_DICT = 125;

        /**
         * identify pickle protocol
         */
        const PROTO = 128;

        /**
         * build object by applying cls.__new__ to argtuple
         */
        const NEWOBJ = 129;

        /**
         * push object from extension registry; 1-byte index
         */
        const EXT1 = 130;

        /**
         * ditto, but 2-byte index
         */
        const EXT2 = 131;

        /**
         * ditto, but 4-byte index
         */
        const EXT4 = 132;

        /**
         * build 1-tuple from stack top
         */
        const TUPLE1 = 133;

        /**
         * build 2-tuple from two topmost stack items
         */
        const TUPLE2 = 134;

        /**
         * build 3-tuple from three topmost stack items
         */
        const TUPLE3 = 135;

        /**
         * push True
         */
        const NEWTRUE = 136;

        /**
         * push False
         */
        const NEWFALSE = 137;

        /**
         * push long from < 256 bytes
         */
        const LONG1 = 138;

        /**
         * push really big long
         */
        const LONG4 = 139;

        /**
         * push short string; UTF-8 length < 256 bytes
         */
        const SHORT_BINUNICODE = 140;

        /**
         * push very long string
         */
        const BINUNICODE8 = 141;

        /**
         * push very long bytes string
         */
        const BINBYTES8 = 142;

        /**
         * push empty set on the stack
         */
        const EMPTY_SET = 143;

        /**
         * modify set by adding topmost stack items
         */
        const ADDITEMS = 144;

        /**
         * build frozenset from topmost stack items
         */
        const FROZENSET = 145;

        /**
         * like NEWOBJ but work with keyword only arguments
         */
        const NEWOBJ_EX = 146;

        /**
         * same as GLOBAL but using names on the stacks
         */
        const STACK_GLOBAL = 147;

        /**
         * store top of the stack in memo
         */
        const MEMOIZE = 148;

        /**
         * indicate the beginning of a new frame
         */
        const FRAME = 149;

        /**
         * push bytearray
         */
        const BYTEARRAY8 = 150;

        /**
         * push next out-of-band buffer
         */
        const NEXT_BUFFER = 151;

        /**
         * make top of stack readonly
         */
        const READONLY_BUFFER = 152;
    }
}
