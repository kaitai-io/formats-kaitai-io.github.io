// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.PythonPickle = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
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
 * @see {@link https://github.com/python/cpython/blob/v3.8.1/Lib/pickletools.py|Source}
 */

var PythonPickle = (function() {
  PythonPickle.Opcode = Object.freeze({
    MARK: 40,
    EMPTY_TUPLE: 41,
    STOP: 46,
    POP: 48,
    POP_MARK: 49,
    DUP: 50,
    BINBYTES: 66,
    SHORT_BINBYTES: 67,
    FLOAT: 70,
    BINFLOAT: 71,
    INT: 73,
    BININT: 74,
    BININT1: 75,
    LONG: 76,
    BININT2: 77,
    NONE: 78,
    PERSID: 80,
    BINPERSID: 81,
    REDUCE: 82,
    STRING: 83,
    BINSTRING: 84,
    SHORT_BINSTRING: 85,
    UNICODE: 86,
    BINUNICODE: 88,
    EMPTY_LIST: 93,
    APPEND: 97,
    BUILD: 98,
    GLOBAL_OPCODE: 99,
    DICT: 100,
    APPENDS: 101,
    GET: 103,
    BINGET: 104,
    INST: 105,
    LONG_BINGET: 106,
    LIST: 108,
    OBJ: 111,
    PUT: 112,
    BINPUT: 113,
    LONG_BINPUT: 114,
    SETITEM: 115,
    TUPLE: 116,
    SETITEMS: 117,
    EMPTY_DICT: 125,
    PROTO: 128,
    NEWOBJ: 129,
    EXT1: 130,
    EXT2: 131,
    EXT4: 132,
    TUPLE1: 133,
    TUPLE2: 134,
    TUPLE3: 135,
    NEWTRUE: 136,
    NEWFALSE: 137,
    LONG1: 138,
    LONG4: 139,
    SHORT_BINUNICODE: 140,
    BINUNICODE8: 141,
    BINBYTES8: 142,
    EMPTY_SET: 143,
    ADDITEMS: 144,
    FROZENSET: 145,
    NEWOBJ_EX: 146,
    STACK_GLOBAL: 147,
    MEMOIZE: 148,
    FRAME: 149,
    BYTEARRAY8: 150,
    NEXT_BUFFER: 151,
    READONLY_BUFFER: 152,

    40: "MARK",
    41: "EMPTY_TUPLE",
    46: "STOP",
    48: "POP",
    49: "POP_MARK",
    50: "DUP",
    66: "BINBYTES",
    67: "SHORT_BINBYTES",
    70: "FLOAT",
    71: "BINFLOAT",
    73: "INT",
    74: "BININT",
    75: "BININT1",
    76: "LONG",
    77: "BININT2",
    78: "NONE",
    80: "PERSID",
    81: "BINPERSID",
    82: "REDUCE",
    83: "STRING",
    84: "BINSTRING",
    85: "SHORT_BINSTRING",
    86: "UNICODE",
    88: "BINUNICODE",
    93: "EMPTY_LIST",
    97: "APPEND",
    98: "BUILD",
    99: "GLOBAL_OPCODE",
    100: "DICT",
    101: "APPENDS",
    103: "GET",
    104: "BINGET",
    105: "INST",
    106: "LONG_BINGET",
    108: "LIST",
    111: "OBJ",
    112: "PUT",
    113: "BINPUT",
    114: "LONG_BINPUT",
    115: "SETITEM",
    116: "TUPLE",
    117: "SETITEMS",
    125: "EMPTY_DICT",
    128: "PROTO",
    129: "NEWOBJ",
    130: "EXT1",
    131: "EXT2",
    132: "EXT4",
    133: "TUPLE1",
    134: "TUPLE2",
    135: "TUPLE3",
    136: "NEWTRUE",
    137: "NEWFALSE",
    138: "LONG1",
    139: "LONG4",
    140: "SHORT_BINUNICODE",
    141: "BINUNICODE8",
    142: "BINBYTES8",
    143: "EMPTY_SET",
    144: "ADDITEMS",
    145: "FROZENSET",
    146: "NEWOBJ_EX",
    147: "STACK_GLOBAL",
    148: "MEMOIZE",
    149: "FRAME",
    150: "BYTEARRAY8",
    151: "NEXT_BUFFER",
    152: "READONLY_BUFFER",
  });

  function PythonPickle(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  PythonPickle.prototype._read = function() {
    this.ops = [];
    var i = 0;
    do {
      var _ = new Op(this._io, this, this._root);
      this.ops.push(_);
      i++;
    } while (!(_.code == PythonPickle.Opcode.STOP));
  }

  /**
   * Length prefixed string, between 0 and 2**64-1 bytes long.
   * 
   * Only a 64-bit build of Python would produce a pickle containing strings
   * large enough to need this type. Such a pickle could not be unpickled on
   * a 32-bit build of Python, because the string would be larger than
   * `sys.maxsize`.
   */

  var Unicodestring8 = PythonPickle.Unicodestring8 = (function() {
    function Unicodestring8(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Unicodestring8.prototype._read = function() {
      this.len = this._io.readU8le();
      this.val = KaitaiStream.bytesToStr(this._io.readBytes(this.len), "utf8");
    }

    return Unicodestring8;
  })();

  /**
   * Large signed integer, in the range -2**(8*255-1) to 2**(8*255-1)-1,
   * encoded as two's complement.
   */

  var Long1 = PythonPickle.Long1 = (function() {
    function Long1(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Long1.prototype._read = function() {
      this.len = this._io.readU1();
      this.val = this._io.readBytes(this.len);
    }

    return Long1;
  })();

  /**
   * Length prefixed string, between 0 and 2**64-1 bytes long.
   * 
   * Only a 64-bit build of Python would produce a pickle containing strings
   * large enough to need this type. Such a pickle could not be unpickled on
   * a 32-bit build of Python, because the string would be larger than
   * `sys.maxsize`.
   */

  var Bytes8 = PythonPickle.Bytes8 = (function() {
    function Bytes8(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Bytes8.prototype._read = function() {
      this.len = this._io.readU8le();
      this.val = this._io.readBytes(this.len);
    }

    return Bytes8;
  })();

  /**
   * Length prefixed byte string, between 0 and 255 bytes long.
   */

  var Bytes1 = PythonPickle.Bytes1 = (function() {
    function Bytes1(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Bytes1.prototype._read = function() {
      this.len = this._io.readU1();
      this.val = this._io.readBytes(this.len);
    }

    return Bytes1;
  })();

  /**
   * Length prefixed string, between 0 and 2**32-1 bytes long
   */

  var Bytes4 = PythonPickle.Bytes4 = (function() {
    function Bytes4(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Bytes4.prototype._read = function() {
      this.len = this._io.readU4le();
      this.val = this._io.readBytes(this.len);
    }

    return Bytes4;
  })();

  /**
   * Some opcodes take no argument, this empty type is used for them.
   */

  var NoArg = PythonPickle.NoArg = (function() {
    function NoArg(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    NoArg.prototype._read = function() {
    }

    return NoArg;
  })();

  /**
   * Unquoted string, does not contain string escapes.
   */

  var StringnlNoescape = PythonPickle.StringnlNoescape = (function() {
    function StringnlNoescape(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    StringnlNoescape.prototype._read = function() {
      this.val = KaitaiStream.bytesToStr(this._io.readBytesTerm(10, false, true, true), "ascii");
    }

    return StringnlNoescape;
  })();

  /**
   * Integer, encoded with the ASCII chracters [0-9-], followed by 'L'.
   */

  var DecimalnlLong = PythonPickle.DecimalnlLong = (function() {
    function DecimalnlLong(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DecimalnlLong.prototype._read = function() {
      this.val = KaitaiStream.bytesToStr(this._io.readBytesTerm(10, false, true, true), "ascii");
    }

    return DecimalnlLong;
  })();

  /**
   * Length prefixed string, between 0 and 2**32-1 bytes long
   */

  var Unicodestring4 = PythonPickle.Unicodestring4 = (function() {
    function Unicodestring4(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Unicodestring4.prototype._read = function() {
      this.len = this._io.readU4le();
      this.val = KaitaiStream.bytesToStr(this._io.readBytes(this.len), "utf8");
    }

    return Unicodestring4;
  })();

  /**
   * Unquoted string, containing Python Unicode escapes.
   */

  var Unicodestringnl = PythonPickle.Unicodestringnl = (function() {
    function Unicodestringnl(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Unicodestringnl.prototype._read = function() {
      this.val = KaitaiStream.bytesToStr(this._io.readBytesTerm(10, false, true, true), "ascii");
    }

    return Unicodestringnl;
  })();

  /**
   * Large signed integer, in the range -2**(8*2**32-1) to 2**(8*2**32-1)-1,
   * encoded as two's complement.
   */

  var Long4 = PythonPickle.Long4 = (function() {
    function Long4(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Long4.prototype._read = function() {
      this.len = this._io.readU4le();
      this.val = this._io.readBytes(this.len);
    }

    return Long4;
  })();

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
   * @see {@link https://github.com/python/cpython/blob/bb8071a4/Lib/pickle.py#L486-L495|Source}
   */

  var String1 = PythonPickle.String1 = (function() {
    function String1(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    String1.prototype._read = function() {
      this.len = this._io.readU1();
      this.val = this._io.readBytes(this.len);
    }

    return String1;
  })();

  /**
   * Length prefixed string, between 0 and 2**64-1 bytes long.
   * 
   * The contents are deserilised into a `bytearray` object.
   */

  var Bytearray8 = PythonPickle.Bytearray8 = (function() {
    function Bytearray8(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Bytearray8.prototype._read = function() {
      this.len = this._io.readU8le();
      this.val = this._io.readBytes(this.len);
    }

    return Bytearray8;
  })();

  /**
   * Integer or boolean, encoded with the ASCII characters [0-9-].
   * 
   * The values '00' and '01' encode the Python values `False` and `True`.
   * Normally a value would not contain leading '0' characters.
   */

  var DecimalnlShort = PythonPickle.DecimalnlShort = (function() {
    function DecimalnlShort(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DecimalnlShort.prototype._read = function() {
      this.val = KaitaiStream.bytesToStr(this._io.readBytesTerm(10, false, true, true), "ascii");
    }

    return DecimalnlShort;
  })();

  /**
   * Length prefixed string, between 0 and 255 bytes long
   */

  var Unicodestring1 = PythonPickle.Unicodestring1 = (function() {
    function Unicodestring1(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Unicodestring1.prototype._read = function() {
      this.len = this._io.readU1();
      this.val = KaitaiStream.bytesToStr(this._io.readBytes(this.len), "utf8");
    }

    return Unicodestring1;
  })();

  /**
   * Quoted string, possibly containing Python string escapes.
   */

  var Stringnl = PythonPickle.Stringnl = (function() {
    function Stringnl(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Stringnl.prototype._read = function() {
      this.val = KaitaiStream.bytesToStr(this._io.readBytesTerm(10, false, true, true), "ascii");
    }

    return Stringnl;
  })();

  /**
   * Pair of unquoted, unescaped strings.
   */

  var StringnlNoescapePair = PythonPickle.StringnlNoescapePair = (function() {
    function StringnlNoescapePair(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    StringnlNoescapePair.prototype._read = function() {
      this.val1 = new StringnlNoescape(this._io, this, this._root);
      this.val2 = new StringnlNoescape(this._io, this, this._root);
    }

    return StringnlNoescapePair;
  })();

  /**
   * Length prefixed string, between 0 and 2**31-1 bytes long. Encoding is
   * unspecified.
   * 
   * Although the len field is signed, any length < 0 will raise an exception
   * during unpickling.
   * 
   * See the documentation for `string1` for further detail about encodings.
   * @see {@link https://github.com/python/cpython/blob/bb8071a4/Lib/pickle.py#L486-L495|Source}
   */

  var String4 = PythonPickle.String4 = (function() {
    function String4(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    String4.prototype._read = function() {
      this.len = this._io.readS4le();
      this.val = this._io.readBytes(this.len);
    }

    return String4;
  })();

  var Op = PythonPickle.Op = (function() {
    function Op(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Op.prototype._read = function() {
      this.code = this._io.readU1();
      switch (this.code) {
      case PythonPickle.Opcode.EXT4:
        this.arg = this._io.readU4le();
        break;
      case PythonPickle.Opcode.TUPLE1:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.SETITEM:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.READONLY_BUFFER:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.STOP:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.EXT2:
        this.arg = this._io.readU2le();
        break;
      case PythonPickle.Opcode.EMPTY_TUPLE:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.NEWTRUE:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.LONG:
        this.arg = new DecimalnlLong(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.NEWOBJ:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.BYTEARRAY8:
        this.arg = new Bytearray8(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.PUT:
        this.arg = new DecimalnlShort(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.STACK_GLOBAL:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.POP_MARK:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.APPEND:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.NEWFALSE:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.BINPERSID:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.BUILD:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.EMPTY_DICT:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.TUPLE2:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.LONG4:
        this.arg = new Long4(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.NEXT_BUFFER:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.APPENDS:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.BINBYTES:
        this.arg = new Bytes4(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.DUP:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.LIST:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.PROTO:
        this.arg = this._io.readU1();
        break;
      case PythonPickle.Opcode.POP:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.FRAME:
        this.arg = this._io.readU8le();
        break;
      case PythonPickle.Opcode.STRING:
        this.arg = new Stringnl(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.BINUNICODE:
        this.arg = new Unicodestring4(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.FLOAT:
        this.arg = new Floatnl(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.REDUCE:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.GLOBAL_OPCODE:
        this.arg = new StringnlNoescapePair(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.BINPUT:
        this.arg = this._io.readU1();
        break;
      case PythonPickle.Opcode.MEMOIZE:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.PERSID:
        this.arg = new StringnlNoescape(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.EXT1:
        this.arg = this._io.readU1();
        break;
      case PythonPickle.Opcode.NONE:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.SHORT_BINUNICODE:
        this.arg = new Unicodestring1(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.OBJ:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.BINFLOAT:
        this.arg = this._io.readF8be();
        break;
      case PythonPickle.Opcode.NEWOBJ_EX:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.EMPTY_LIST:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.TUPLE:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.BINUNICODE8:
        this.arg = new Unicodestring8(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.BINGET:
        this.arg = this._io.readU1();
        break;
      case PythonPickle.Opcode.DICT:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.BINSTRING:
        this.arg = new String4(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.SETITEMS:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.BININT2:
        this.arg = this._io.readU2le();
        break;
      case PythonPickle.Opcode.BINBYTES8:
        this.arg = new Bytes8(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.BININT1:
        this.arg = this._io.readU1();
        break;
      case PythonPickle.Opcode.INST:
        this.arg = new StringnlNoescapePair(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.LONG_BINGET:
        this.arg = this._io.readU4le();
        break;
      case PythonPickle.Opcode.LONG_BINPUT:
        this.arg = this._io.readU4le();
        break;
      case PythonPickle.Opcode.INT:
        this.arg = new DecimalnlShort(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.BININT:
        this.arg = this._io.readS4le();
        break;
      case PythonPickle.Opcode.UNICODE:
        this.arg = new Unicodestringnl(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.LONG1:
        this.arg = new Long1(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.SHORT_BINSTRING:
        this.arg = new String1(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.MARK:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.FROZENSET:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.TUPLE3:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.ADDITEMS:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.GET:
        this.arg = new DecimalnlShort(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.EMPTY_SET:
        this.arg = new NoArg(this._io, this, this._root);
        break;
      case PythonPickle.Opcode.SHORT_BINBYTES:
        this.arg = new Bytes1(this._io, this, this._root);
        break;
      }
    }

    /**
     * Operation code that determines which action should be
     * performed next by the Pickle Virtual Machine. Some opcodes
     * are only available in later versions of the Pickle protocol.
     */

    /**
     * Optional argument for the operation. Data type and length
     * are determined by the value of the opcode.
     */

    return Op;
  })();

  /**
   * Double float, encoded with the ASCII characters [0-9.e+-], '-inf', 'inf',
   * or 'nan'.
   */

  var Floatnl = PythonPickle.Floatnl = (function() {
    function Floatnl(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Floatnl.prototype._read = function() {
      this.val = KaitaiStream.bytesToStr(this._io.readBytesTerm(10, false, true, true), "ascii");
    }

    return Floatnl;
  })();

  return PythonPickle;
})();
return PythonPickle;
}));
