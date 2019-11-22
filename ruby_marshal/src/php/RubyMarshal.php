<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Ruby's Marshal module allows serialization and deserialization of
 * many standard and arbitrary Ruby objects in a compact binary
 * format. It is relatively fast, available in stdlibs standard and
 * allows conservation of language-specific properties (such as symbols
 * or encoding-aware strings).
 * 
 * Feature-wise, it is comparable to other language-specific
 * implementations, such as:
 * 
 * * Java's
 *   [Serializable](https://docs.oracle.com/javase/8/docs/api/java/io/Serializable.html)
 * * .NET
 *   [BinaryFormatter](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.serialization.formatters.binary.binaryformatter)
 * * Python's
 *   [marshal](https://docs.python.org/3/library/marshal.html),
 *   [pickle](https://docs.python.org/3/library/pickle.html) and
 *   [shelve](https://docs.python.org/3/library/shelve.html)
 * 
 * From internal perspective, serialized stream consists of a simple
 * magic header and a record.
 */

class RubyMarshal extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \RubyMarshal $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = $this->_io->ensureFixedContents("\x04\x08");
        $this->_m_records = new \RubyMarshal\Record($this->_io, $this, $this->_root);
    }
    protected $_m_version;
    protected $_m_records;
    public function version() { return $this->_m_version; }
    public function records() { return $this->_m_records; }
}

namespace \RubyMarshal;

class RubyArray extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \RubyMarshal\Record $_parent = null, \RubyMarshal $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_numElements = new \RubyMarshal\PackedInt($this->_io, $this, $this->_root);
        $this->_m_elements = [];
        $n = $this->numElements()->value();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_elements[] = new \RubyMarshal\Record($this->_io, $this, $this->_root);
        }
    }
    protected $_m_numElements;
    protected $_m_elements;
    public function numElements() { return $this->_m_numElements; }
    public function elements() { return $this->_m_elements; }
}

namespace \RubyMarshal;

class Bignum extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \RubyMarshal\Record $_parent = null, \RubyMarshal $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_sign = $this->_io->readU1();
        $this->_m_lenDiv2 = new \RubyMarshal\PackedInt($this->_io, $this, $this->_root);
        $this->_m_body = $this->_io->readBytes(($this->lenDiv2()->value() * 2));
    }
    protected $_m_sign;
    protected $_m_lenDiv2;
    protected $_m_body;

    /**
     * A single byte containing `+` for a positive value or `-` for a negative value.
     */
    public function sign() { return $this->_m_sign; }

    /**
     * Length of bignum body, divided by 2.
     */
    public function lenDiv2() { return $this->_m_lenDiv2; }

    /**
     * Bytes that represent the number, see ruby-lang.org docs for reconstruction algorithm.
     */
    public function body() { return $this->_m_body; }
}

namespace \RubyMarshal;

class RubyStruct extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \RubyMarshal\Record $_parent = null, \RubyMarshal $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_name = new \RubyMarshal\Record($this->_io, $this, $this->_root);
        $this->_m_numMembers = new \RubyMarshal\PackedInt($this->_io, $this, $this->_root);
        $this->_m_members = [];
        $n = $this->numMembers()->value();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_members[] = new \RubyMarshal\Pair($this->_io, $this, $this->_root);
        }
    }
    protected $_m_name;
    protected $_m_numMembers;
    protected $_m_members;

    /**
     * Symbol containing the name of the struct.
     */
    public function name() { return $this->_m_name; }

    /**
     * Number of members in a struct
     */
    public function numMembers() { return $this->_m_numMembers; }
    public function members() { return $this->_m_members; }
}

namespace \RubyMarshal;

class RubySymbol extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \RubyMarshal\Record $_parent = null, \RubyMarshal $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_len = new \RubyMarshal\PackedInt($this->_io, $this, $this->_root);
        $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->len()->value()), "UTF-8");
    }
    protected $_m_len;
    protected $_m_name;
    public function len() { return $this->_m_len; }
    public function name() { return $this->_m_name; }
}

/**
 * Ruby uses sophisticated system to pack integers: first `code`
 * byte either determines packing scheme or carries encoded
 * immediate value (thus allowing smaller values from -123 to 122
 * (inclusive) to take only one byte. There are 11 encoding schemes
 * in total:
 * 
 * * 0 is encoded specially (as 0)
 * * 1..122 are encoded as immediate value with a shift
 * * 123..255 are encoded with code of 0x01 and 1 extra byte
 * * 0x100..0xffff are encoded with code of 0x02 and 2 extra bytes
 * * 0x10000..0xffffff are encoded with code of 0x03 and 3 extra
 *   bytes
 * * 0x1000000..0xffffffff are encoded with code of 0x04 and 4
 *   extra bytes
 * * -123..-1 are encoded as immediate value with another shift
 * * -256..-124 are encoded with code of 0xff and 1 extra byte
 * * -0x10000..-257 are encoded with code of 0xfe and 2 extra bytes
 * * -0x1000000..0x10001 are encoded with code of 0xfd and 3 extra
 *    bytes
 * * -0x40000000..-0x1000001 are encoded with code of 0xfc and 4
 *    extra bytes
 * 
 * Values beyond that are serialized as bignum (even if they
 * technically might be not Bignum class in Ruby implementation,
 * i.e. if they fit into 64 bits on a 64-bit platform).
 */

namespace \RubyMarshal;

class PackedInt extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \RubyMarshal $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_code = $this->_io->readU1();
        switch ($this->code()) {
            case 4:
                $this->_m_encoded = $this->_io->readU4le();
                break;
            case 1:
                $this->_m_encoded = $this->_io->readU1();
                break;
            case 252:
                $this->_m_encoded = $this->_io->readU4le();
                break;
            case 253:
                $this->_m_encoded = $this->_io->readU2le();
                break;
            case 3:
                $this->_m_encoded = $this->_io->readU2le();
                break;
            case 2:
                $this->_m_encoded = $this->_io->readU2le();
                break;
            case 255:
                $this->_m_encoded = $this->_io->readU1();
                break;
            case 254:
                $this->_m_encoded = $this->_io->readU2le();
                break;
        }
        switch ($this->code()) {
            case 3:
                $this->_m_encoded2 = $this->_io->readU1();
                break;
            case 253:
                $this->_m_encoded2 = $this->_io->readU1();
                break;
        }
    }
    protected $_m_isImmediate;
    public function isImmediate() {
        if ($this->_m_isImmediate !== null)
            return $this->_m_isImmediate;
        $this->_m_isImmediate =  (($this->code() > 4) && ($this->code() < 252)) ;
        return $this->_m_isImmediate;
    }
    protected $_m_value;
    public function value() {
        if ($this->_m_value !== null)
            return $this->_m_value;
        $this->_m_value = ($this->isImmediate() ? ($this->code() < 128 ? ($this->code() - 5) : (4 - (~($this->code()) & 127))) : ($this->code() == 0 ? 0 : ($this->code() == 255 ? ($this->encoded() - 256) : ($this->code() == 254 ? ($this->encoded() - 65536) : ($this->code() == 253 ? ((($this->encoded2() << 16) | $this->encoded()) - 16777216) : ($this->code() == 3 ? (($this->encoded2() << 16) | $this->encoded()) : $this->encoded()))))));
        return $this->_m_value;
    }
    protected $_m_code;
    protected $_m_encoded;
    protected $_m_encoded2;
    public function code() { return $this->_m_code; }
    public function encoded() { return $this->_m_encoded; }

    /**
     * One extra byte for 3-byte integers (0x03 and 0xfd), as
     * there is no standard `u3` type in KS.
     */
    public function encoded2() { return $this->_m_encoded2; }
}

namespace \RubyMarshal;

class Pair extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \RubyMarshal $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_key = new \RubyMarshal\Record($this->_io, $this, $this->_root);
        $this->_m_value = new \RubyMarshal\Record($this->_io, $this, $this->_root);
    }
    protected $_m_key;
    protected $_m_value;
    public function key() { return $this->_m_key; }
    public function value() { return $this->_m_value; }
}

namespace \RubyMarshal;

class InstanceVar extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \RubyMarshal\Record $_parent = null, \RubyMarshal $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_obj = new \RubyMarshal\Record($this->_io, $this, $this->_root);
        $this->_m_numVars = new \RubyMarshal\PackedInt($this->_io, $this, $this->_root);
        $this->_m_vars = [];
        $n = $this->numVars()->value();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_vars[] = new \RubyMarshal\Pair($this->_io, $this, $this->_root);
        }
    }
    protected $_m_obj;
    protected $_m_numVars;
    protected $_m_vars;
    public function obj() { return $this->_m_obj; }
    public function numVars() { return $this->_m_numVars; }
    public function vars() { return $this->_m_vars; }
}

/**
 * Each record starts with a single byte that determines its type
 * (`code`) and contents. If necessary, additional info as parsed
 * as `body`, to be determined by `code`.
 */

namespace \RubyMarshal;

class Record extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \RubyMarshal $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_code = $this->_io->readU1();
        switch ($this->code()) {
            case \RubyMarshal\Codes::BIGNUM:
                $this->_m_body = new \RubyMarshal\Bignum($this->_io, $this, $this->_root);
                break;
            case \RubyMarshal\Codes::RUBY_HASH:
                $this->_m_body = new \RubyMarshal\RubyHash($this->_io, $this, $this->_root);
                break;
            case \RubyMarshal\Codes::RUBY_ARRAY:
                $this->_m_body = new \RubyMarshal\RubyArray($this->_io, $this, $this->_root);
                break;
            case \RubyMarshal\Codes::RUBY_SYMBOL:
                $this->_m_body = new \RubyMarshal\RubySymbol($this->_io, $this, $this->_root);
                break;
            case \RubyMarshal\Codes::INSTANCE_VAR:
                $this->_m_body = new \RubyMarshal\InstanceVar($this->_io, $this, $this->_root);
                break;
            case \RubyMarshal\Codes::RUBY_STRING:
                $this->_m_body = new \RubyMarshal\RubyString($this->_io, $this, $this->_root);
                break;
            case \RubyMarshal\Codes::PACKED_INT:
                $this->_m_body = new \RubyMarshal\PackedInt($this->_io, $this, $this->_root);
                break;
            case \RubyMarshal\Codes::RUBY_STRUCT:
                $this->_m_body = new \RubyMarshal\RubyStruct($this->_io, $this, $this->_root);
                break;
            case \RubyMarshal\Codes::RUBY_SYMBOL_LINK:
                $this->_m_body = new \RubyMarshal\PackedInt($this->_io, $this, $this->_root);
                break;
        }
    }
    protected $_m_code;
    protected $_m_body;
    public function code() { return $this->_m_code; }
    public function body() { return $this->_m_body; }
}

namespace \RubyMarshal;

class RubyHash extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \RubyMarshal\Record $_parent = null, \RubyMarshal $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_numPairs = new \RubyMarshal\PackedInt($this->_io, $this, $this->_root);
        $this->_m_pairs = [];
        $n = $this->numPairs()->value();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_pairs[] = new \RubyMarshal\Pair($this->_io, $this, $this->_root);
        }
    }
    protected $_m_numPairs;
    protected $_m_pairs;
    public function numPairs() { return $this->_m_numPairs; }
    public function pairs() { return $this->_m_pairs; }
}

namespace \RubyMarshal;

class RubyString extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \RubyMarshal\Record $_parent = null, \RubyMarshal $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_len = new \RubyMarshal\PackedInt($this->_io, $this, $this->_root);
        $this->_m_body = $this->_io->readBytes($this->len()->value());
    }
    protected $_m_len;
    protected $_m_body;
    public function len() { return $this->_m_len; }
    public function body() { return $this->_m_body; }
}

namespace \RubyMarshal;

class Codes {
    const RUBY_STRING = 34;
    const CONST_NIL = 48;
    const RUBY_SYMBOL = 58;
    const RUBY_SYMBOL_LINK = 59;
    const CONST_FALSE = 70;
    const INSTANCE_VAR = 73;
    const RUBY_STRUCT = 83;
    const CONST_TRUE = 84;
    const RUBY_ARRAY = 91;
    const PACKED_INT = 105;
    const BIGNUM = 108;
    const RUBY_HASH = 123;
}
