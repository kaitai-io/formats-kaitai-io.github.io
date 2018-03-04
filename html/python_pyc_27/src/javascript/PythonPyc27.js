// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.PythonPyc27 = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * Python interpreter runs .py files in 2 step process: first, it
 * produces bytecode, which it then executes. Translation of .py source
 * into bytecode is time-consuming, so Python dumps compiled bytecode
 * into .pyc files, to be reused from cache at later time if possible.
 * 
 * .pyc file is essentially a raw dump of `py_object` (see `body`) with
 * a simple header prepended.
 */

var PythonPyc27 = (function() {
  PythonPyc27.Version = Object.freeze({
    V15: 20121,
    V16: 50428,
    V20: 50823,
    V21: 60202,
    V22: 60717,
    V23_A0: 62011,
    V23_A0B: 62021,
    V24_A0: 62041,
    V24_A3: 62051,
    V24_B1: 62061,
    V25_A0: 62071,
    V25_A0B: 62081,
    V25_A0C: 62091,
    V25_A0D: 62092,
    V25_B3: 62101,
    V25_B3B: 62111,
    V25_C1: 62121,
    V25_C2: 62131,
    V26_A0: 62151,
    V26_A1: 62161,
    V27_A0: 62171,
    V27_A0B: 62181,
    V27_A0C: 62191,
    V27_A0D: 62201,
    V27_A0E: 62211,

    20121: "V15",
    50428: "V16",
    50823: "V20",
    60202: "V21",
    60717: "V22",
    62011: "V23_A0",
    62021: "V23_A0B",
    62041: "V24_A0",
    62051: "V24_A3",
    62061: "V24_B1",
    62071: "V25_A0",
    62081: "V25_A0B",
    62091: "V25_A0C",
    62092: "V25_A0D",
    62101: "V25_B3",
    62111: "V25_B3B",
    62121: "V25_C1",
    62131: "V25_C2",
    62151: "V26_A0",
    62161: "V26_A1",
    62171: "V27_A0",
    62181: "V27_A0B",
    62191: "V27_A0C",
    62201: "V27_A0D",
    62211: "V27_A0E",
  });

  function PythonPyc27(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  PythonPyc27.prototype._read = function() {
    this.versionMagic = this._io.readU2le();
    this.crlf = this._io.readU2le();
    this.modificationTimestamp = this._io.readU4le();
    this.body = new PyObject(this._io, this, this._root);
  }

  var CodeObject = PythonPyc27.CodeObject = (function() {
    CodeObject.FlagsEnum = Object.freeze({
      HAS_ARGS: 4,
      HAS_KWARGS: 8,
      GENERATOR: 32,

      4: "HAS_ARGS",
      8: "HAS_KWARGS",
      32: "GENERATOR",
    });

    function CodeObject(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CodeObject.prototype._read = function() {
      this.argCount = this._io.readU4le();
      this.localCount = this._io.readU4le();
      this.stackSize = this._io.readU4le();
      this.flags = this._io.readU4le();
      this.code = new Assembly(this._io, this, this._root);
      this.consts = new PyObject(this._io, this, this._root);
      this.names = new PyObject(this._io, this, this._root);
      this.varNames = new PyObject(this._io, this, this._root);
      this.freeVars = new PyObject(this._io, this, this._root);
      this.cellVars = new PyObject(this._io, this, this._root);
      this.filename = new PyObject(this._io, this, this._root);
      this.name = new PyObject(this._io, this, this._root);
      this.firstLineNo = this._io.readU4le();
      this.lnotab = new PyObject(this._io, this, this._root);
    }

    return CodeObject;
  })();

  var Assembly = PythonPyc27.Assembly = (function() {
    function Assembly(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Assembly.prototype._read = function() {
      this.stringMagic = this._io.ensureFixedContents([115]);
      this.length = this._io.readU4le();
      this._raw_items = this._io.readBytes(this.length);
      var _io__raw_items = new KaitaiStream(this._raw_items);
      this.items = new OpArgs(_io__raw_items, this, this._root);
    }

    return Assembly;
  })();

  var OpArg = PythonPyc27.OpArg = (function() {
    OpArg.OpCodeEnum = Object.freeze({
      STOP_CODE: 0,
      POP_TOP: 1,
      ROT_TWO: 2,
      ROT_THREE: 3,
      DUP_TOP: 4,
      ROT_FOUR: 5,
      NOP: 9,
      UNARY_POSITIVE: 10,
      UNARY_NEGATIVE: 11,
      UNARY_NOT: 12,
      UNARY_CONVERT: 13,
      UNARY_INVERT: 15,
      BINARY_POWER: 19,
      BINARY_MULTIPLY: 20,
      BINARY_DIVIDE: 21,
      BINARY_MODULO: 22,
      BINARY_ADD: 23,
      BINARY_SUBTRACT: 24,
      BINARY_SUBSCR: 25,
      BINARY_FLOOR_DIVIDE: 26,
      BINARY_TRUE_DIVIDE: 27,
      INPLACE_FLOOR_DIVIDE: 28,
      INPLACE_TRUE_DIVIDE: 29,
      SLICE_0: 30,
      SLICE_1: 31,
      SLICE_2: 32,
      SLICE_3: 33,
      STORE_SLICE_0: 40,
      STORE_SLICE_1: 41,
      STORE_SLICE_2: 42,
      STORE_SLICE_3: 43,
      DELETE_SLICE_0: 50,
      DELETE_SLICE_1: 51,
      DELETE_SLICE_2: 52,
      DELETE_SLICE_3: 53,
      STORE_MAP: 54,
      INPLACE_ADD: 55,
      INPLACE_SUBTRACT: 56,
      INPLACE_MULTIPLY: 57,
      INPLACE_DIVIDE: 58,
      INPLACE_MODULO: 59,
      STORE_SUBSCR: 60,
      DELETE_SUBSCR: 61,
      BINARY_LSHIFT: 62,
      BINARY_RSHIFT: 63,
      BINARY_AND: 64,
      BINARY_XOR: 65,
      BINARY_OR: 66,
      INPLACE_POWER: 67,
      GET_ITER: 68,
      PRINT_EXPR: 70,
      PRINT_ITEM: 71,
      PRINT_NEWLINE: 72,
      PRINT_ITEM_TO: 73,
      PRINT_NEWLINE_TO: 74,
      INPLACE_LSHIFT: 75,
      INPLACE_RSHIFT: 76,
      INPLACE_AND: 77,
      INPLACE_XOR: 78,
      INPLACE_OR: 79,
      BREAK_LOOP: 80,
      WITH_CLEANUP: 81,
      LOAD_LOCALS: 82,
      RETURN_VALUE: 83,
      IMPORT_STAR: 84,
      EXEC_STMT: 85,
      YIELD_VALUE: 86,
      POP_BLOCK: 87,
      END_FINALLY: 88,
      BUILD_CLASS: 89,
      STORE_NAME: 90,
      DELETE_NAME: 91,
      UNPACK_SEQUENCE: 92,
      FOR_ITER: 93,
      LIST_APPEND: 94,
      STORE_ATTR: 95,
      DELETE_ATTR: 96,
      STORE_GLOBAL: 97,
      DELETE_GLOBAL: 98,
      DUP_TOPX: 99,
      LOAD_CONST: 100,
      LOAD_NAME: 101,
      BUILD_TUPLE: 102,
      BUILD_LIST: 103,
      BUILD_SET: 104,
      BUILD_MAP: 105,
      LOAD_ATTR: 106,
      COMPARE_OP: 107,
      IMPORT_NAME: 108,
      IMPORT_FROM: 109,
      JUMP_FORWARD: 110,
      JUMP_IF_FALSE_OR_POP: 111,
      JUMP_IF_TRUE_OR_POP: 112,
      JUMP_ABSOLUTE: 113,
      POP_JUMP_IF_FALSE: 114,
      POP_JUMP_IF_TRUE: 115,
      LOAD_GLOBAL: 116,
      CONTINUE_LOOP: 119,
      SETUP_LOOP: 120,
      SETUP_EXCEPT: 121,
      SETUP_FINALLY: 122,
      LOAD_FAST: 124,
      STORE_FAST: 125,
      DELETE_FAST: 126,
      RAISE_VARARGS: 130,
      CALL_FUNCTION: 131,
      MAKE_FUNCTION: 132,
      BUILD_SLICE: 133,
      MAKE_CLOSURE: 134,
      LOAD_CLOSURE: 135,
      LOAD_DEREF: 136,
      STORE_DEREF: 137,
      CALL_FUNCTION_VAR: 140,
      CALL_FUNCTION_KW: 141,
      CALL_FUNCTION_VAR_KW: 142,
      SETUP_WITH: 143,
      EXTENDED_ARG: 145,
      SET_ADD: 146,
      MAP_ADD: 147,

      0: "STOP_CODE",
      1: "POP_TOP",
      2: "ROT_TWO",
      3: "ROT_THREE",
      4: "DUP_TOP",
      5: "ROT_FOUR",
      9: "NOP",
      10: "UNARY_POSITIVE",
      11: "UNARY_NEGATIVE",
      12: "UNARY_NOT",
      13: "UNARY_CONVERT",
      15: "UNARY_INVERT",
      19: "BINARY_POWER",
      20: "BINARY_MULTIPLY",
      21: "BINARY_DIVIDE",
      22: "BINARY_MODULO",
      23: "BINARY_ADD",
      24: "BINARY_SUBTRACT",
      25: "BINARY_SUBSCR",
      26: "BINARY_FLOOR_DIVIDE",
      27: "BINARY_TRUE_DIVIDE",
      28: "INPLACE_FLOOR_DIVIDE",
      29: "INPLACE_TRUE_DIVIDE",
      30: "SLICE_0",
      31: "SLICE_1",
      32: "SLICE_2",
      33: "SLICE_3",
      40: "STORE_SLICE_0",
      41: "STORE_SLICE_1",
      42: "STORE_SLICE_2",
      43: "STORE_SLICE_3",
      50: "DELETE_SLICE_0",
      51: "DELETE_SLICE_1",
      52: "DELETE_SLICE_2",
      53: "DELETE_SLICE_3",
      54: "STORE_MAP",
      55: "INPLACE_ADD",
      56: "INPLACE_SUBTRACT",
      57: "INPLACE_MULTIPLY",
      58: "INPLACE_DIVIDE",
      59: "INPLACE_MODULO",
      60: "STORE_SUBSCR",
      61: "DELETE_SUBSCR",
      62: "BINARY_LSHIFT",
      63: "BINARY_RSHIFT",
      64: "BINARY_AND",
      65: "BINARY_XOR",
      66: "BINARY_OR",
      67: "INPLACE_POWER",
      68: "GET_ITER",
      70: "PRINT_EXPR",
      71: "PRINT_ITEM",
      72: "PRINT_NEWLINE",
      73: "PRINT_ITEM_TO",
      74: "PRINT_NEWLINE_TO",
      75: "INPLACE_LSHIFT",
      76: "INPLACE_RSHIFT",
      77: "INPLACE_AND",
      78: "INPLACE_XOR",
      79: "INPLACE_OR",
      80: "BREAK_LOOP",
      81: "WITH_CLEANUP",
      82: "LOAD_LOCALS",
      83: "RETURN_VALUE",
      84: "IMPORT_STAR",
      85: "EXEC_STMT",
      86: "YIELD_VALUE",
      87: "POP_BLOCK",
      88: "END_FINALLY",
      89: "BUILD_CLASS",
      90: "STORE_NAME",
      91: "DELETE_NAME",
      92: "UNPACK_SEQUENCE",
      93: "FOR_ITER",
      94: "LIST_APPEND",
      95: "STORE_ATTR",
      96: "DELETE_ATTR",
      97: "STORE_GLOBAL",
      98: "DELETE_GLOBAL",
      99: "DUP_TOPX",
      100: "LOAD_CONST",
      101: "LOAD_NAME",
      102: "BUILD_TUPLE",
      103: "BUILD_LIST",
      104: "BUILD_SET",
      105: "BUILD_MAP",
      106: "LOAD_ATTR",
      107: "COMPARE_OP",
      108: "IMPORT_NAME",
      109: "IMPORT_FROM",
      110: "JUMP_FORWARD",
      111: "JUMP_IF_FALSE_OR_POP",
      112: "JUMP_IF_TRUE_OR_POP",
      113: "JUMP_ABSOLUTE",
      114: "POP_JUMP_IF_FALSE",
      115: "POP_JUMP_IF_TRUE",
      116: "LOAD_GLOBAL",
      119: "CONTINUE_LOOP",
      120: "SETUP_LOOP",
      121: "SETUP_EXCEPT",
      122: "SETUP_FINALLY",
      124: "LOAD_FAST",
      125: "STORE_FAST",
      126: "DELETE_FAST",
      130: "RAISE_VARARGS",
      131: "CALL_FUNCTION",
      132: "MAKE_FUNCTION",
      133: "BUILD_SLICE",
      134: "MAKE_CLOSURE",
      135: "LOAD_CLOSURE",
      136: "LOAD_DEREF",
      137: "STORE_DEREF",
      140: "CALL_FUNCTION_VAR",
      141: "CALL_FUNCTION_KW",
      142: "CALL_FUNCTION_VAR_KW",
      143: "SETUP_WITH",
      145: "EXTENDED_ARG",
      146: "SET_ADD",
      147: "MAP_ADD",
    });

    function OpArg(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    OpArg.prototype._read = function() {
      this.opCode = this._io.readU1();
      if (this.opCode >= PythonPyc27.OpArg.OpCodeEnum.STORE_NAME) {
        this.arg = this._io.readU2le();
      }
    }

    return OpArg;
  })();

  var PyObject = PythonPyc27.PyObject = (function() {
    PyObject.ObjectType = Object.freeze({
      TUPLE: 40,
      PY_FALSE: 70,
      NONE: 78,
      STRING_REF: 82,
      PY_TRUE: 84,
      CODE_OBJECT: 99,
      INT: 105,
      STRING: 115,
      INTERNED: 116,
      UNICODE_STRING: 117,

      40: "TUPLE",
      70: "PY_FALSE",
      78: "NONE",
      82: "STRING_REF",
      84: "PY_TRUE",
      99: "CODE_OBJECT",
      105: "INT",
      115: "STRING",
      116: "INTERNED",
      117: "UNICODE_STRING",
    });

    function PyObject(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PyObject.prototype._read = function() {
      this.type = this._io.readU1();
      switch (this.type) {
      case PythonPyc27.PyObject.ObjectType.NONE:
        this.value = new PyNone(this._io, this, this._root);
        break;
      case PythonPyc27.PyObject.ObjectType.CODE_OBJECT:
        this.value = new CodeObject(this._io, this, this._root);
        break;
      case PythonPyc27.PyObject.ObjectType.INT:
        this.value = this._io.readU4le();
        break;
      case PythonPyc27.PyObject.ObjectType.STRING_REF:
        this.value = new StringRef(this._io, this, this._root);
        break;
      case PythonPyc27.PyObject.ObjectType.STRING:
        this.value = new PyString(this._io, this, this._root);
        break;
      case PythonPyc27.PyObject.ObjectType.PY_FALSE:
        this.value = new PyFalse(this._io, this, this._root);
        break;
      case PythonPyc27.PyObject.ObjectType.INTERNED:
        this.value = new InternedString(this._io, this, this._root);
        break;
      case PythonPyc27.PyObject.ObjectType.TUPLE:
        this.value = new Tuple(this._io, this, this._root);
        break;
      case PythonPyc27.PyObject.ObjectType.PY_TRUE:
        this.value = new PyTrue(this._io, this, this._root);
        break;
      }
    }

    var PyNone = PyObject.PyNone = (function() {
      function PyNone(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      PyNone.prototype._read = function() {
      }

      return PyNone;
    })();

    var PyFalse = PyObject.PyFalse = (function() {
      function PyFalse(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      PyFalse.prototype._read = function() {
      }

      return PyFalse;
    })();

    var StringRef = PyObject.StringRef = (function() {
      function StringRef(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      StringRef.prototype._read = function() {
        this.internedListIndex = this._io.readU4le();
      }

      return StringRef;
    })();

    var PyTrue = PyObject.PyTrue = (function() {
      function PyTrue(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      PyTrue.prototype._read = function() {
      }

      return PyTrue;
    })();

    var Tuple = PyObject.Tuple = (function() {
      function Tuple(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Tuple.prototype._read = function() {
        this.count = this._io.readU4le();
        this.items = new Array(this.count);
        for (var i = 0; i < this.count; i++) {
          this.items[i] = new PyObject(this._io, this, this._root);
        }
      }

      return Tuple;
    })();

    var UnicodeString = PyObject.UnicodeString = (function() {
      function UnicodeString(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      UnicodeString.prototype._read = function() {
        this.length = this._io.readU4le();
        this.data = KaitaiStream.bytesToStr(this._io.readBytes(this.length), "utf-8");
      }

      return UnicodeString;
    })();

    var InternedString = PyObject.InternedString = (function() {
      function InternedString(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      InternedString.prototype._read = function() {
        this.length = this._io.readU4le();
        this.data = KaitaiStream.bytesToStr(this._io.readBytes(this.length), "utf-8");
      }

      return InternedString;
    })();

    var PyString = PyObject.PyString = (function() {
      function PyString(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      PyString.prototype._read = function() {
        this.length = this._io.readU4le();
        this.data = this._io.readBytes(this.length);
      }

      return PyString;
    })();

    return PyObject;
  })();

  var OpArgs = PythonPyc27.OpArgs = (function() {
    function OpArgs(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    OpArgs.prototype._read = function() {
      this.items = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.items.push(new OpArg(this._io, this, this._root));
        i++;
      }
    }

    return OpArgs;
  })();

  return PythonPyc27;
})();
return PythonPyc27;
}));
