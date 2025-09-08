// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.RubyMarshal || (root.RubyMarshal = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (RubyMarshal_, KaitaiStream) {
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
 *   [BinaryFormatter](https://learn.microsoft.com/en-us/dotnet/api/system.runtime.serialization.formatters.binary.binaryformatter?view=net-7.0)
 * * Python's
 *   [marshal](https://docs.python.org/3/library/marshal.html),
 *   [pickle](https://docs.python.org/3/library/pickle.html) and
 *   [shelve](https://docs.python.org/3/library/shelve.html)
 * 
 * From internal perspective, serialized stream consists of a simple
 * magic header and a record.
 * @see {@link https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Stream+Format|Source}
 */

var RubyMarshal = (function() {
  RubyMarshal.Codes = Object.freeze({
    RUBY_STRING: 34,
    CONST_NIL: 48,
    RUBY_SYMBOL: 58,
    RUBY_SYMBOL_LINK: 59,
    RUBY_OBJECT_LINK: 64,
    CONST_FALSE: 70,
    INSTANCE_VAR: 73,
    RUBY_STRUCT: 83,
    CONST_TRUE: 84,
    RUBY_ARRAY: 91,
    PACKED_INT: 105,
    BIGNUM: 108,
    RUBY_HASH: 123,

    34: "RUBY_STRING",
    48: "CONST_NIL",
    58: "RUBY_SYMBOL",
    59: "RUBY_SYMBOL_LINK",
    64: "RUBY_OBJECT_LINK",
    70: "CONST_FALSE",
    73: "INSTANCE_VAR",
    83: "RUBY_STRUCT",
    84: "CONST_TRUE",
    91: "RUBY_ARRAY",
    105: "PACKED_INT",
    108: "BIGNUM",
    123: "RUBY_HASH",
  });

  function RubyMarshal(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  RubyMarshal.prototype._read = function() {
    this.version = this._io.readBytes(2);
    if (!((KaitaiStream.byteArrayCompare(this.version, new Uint8Array([4, 8])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([4, 8]), this.version, this._io, "/seq/0");
    }
    this.records = new Record(this._io, this, this._root);
  }

  /**
   * @see {@link https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Bignum|Source}
   */

  var Bignum = RubyMarshal.Bignum = (function() {
    function Bignum(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Bignum.prototype._read = function() {
      this.sign = this._io.readU1();
      this.lenDiv2 = new PackedInt(this._io, this, this._root);
      this.body = this._io.readBytes(this.lenDiv2.value * 2);
    }

    /**
     * A single byte containing `+` for a positive value or `-` for a negative value.
     */

    /**
     * Length of bignum body, divided by 2.
     */

    /**
     * Bytes that represent the number, see ruby-lang.org docs for reconstruction algorithm.
     */

    return Bignum;
  })();

  /**
   * @see {@link https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Instance+Variables|Source}
   */

  var InstanceVar = RubyMarshal.InstanceVar = (function() {
    function InstanceVar(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    InstanceVar.prototype._read = function() {
      this.obj = new Record(this._io, this, this._root);
      this.numVars = new PackedInt(this._io, this, this._root);
      this.vars = [];
      for (var i = 0; i < this.numVars.value; i++) {
        this.vars.push(new Pair(this._io, this, this._root));
      }
    }

    return InstanceVar;
  })();

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
   * @see {@link https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Fixnum+and+long|Source}
   */

  var PackedInt = RubyMarshal.PackedInt = (function() {
    function PackedInt(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    PackedInt.prototype._read = function() {
      this.code = this._io.readU1();
      switch (this.code) {
      case 1:
        this.encoded = this._io.readU1();
        break;
      case 2:
        this.encoded = this._io.readU2le();
        break;
      case 252:
        this.encoded = this._io.readU4le();
        break;
      case 253:
        this.encoded = this._io.readU2le();
        break;
      case 254:
        this.encoded = this._io.readU2le();
        break;
      case 255:
        this.encoded = this._io.readU1();
        break;
      case 3:
        this.encoded = this._io.readU2le();
        break;
      case 4:
        this.encoded = this._io.readU4le();
        break;
      }
      switch (this.code) {
      case 253:
        this.encoded2 = this._io.readU1();
        break;
      case 3:
        this.encoded2 = this._io.readU1();
        break;
      }
    }
    Object.defineProperty(PackedInt.prototype, 'isImmediate', {
      get: function() {
        if (this._m_isImmediate !== undefined)
          return this._m_isImmediate;
        this._m_isImmediate =  ((this.code > 4) && (this.code < 252)) ;
        return this._m_isImmediate;
      }
    });
    Object.defineProperty(PackedInt.prototype, 'value', {
      get: function() {
        if (this._m_value !== undefined)
          return this._m_value;
        this._m_value = (this.isImmediate ? (this.code < 128 ? this.code - 5 : 4 - (~(this.code) & 127)) : (this.code == 0 ? 0 : (this.code == 255 ? this.encoded - 256 : (this.code == 254 ? this.encoded - 65536 : (this.code == 253 ? (this.encoded2 << 16 | this.encoded) - 16777216 : (this.code == 3 ? this.encoded2 << 16 | this.encoded : this.encoded))))));
        return this._m_value;
      }
    });

    /**
     * One extra byte for 3-byte integers (0x03 and 0xfd), as
     * there is no standard `u3` type in KS.
     */

    return PackedInt;
  })();

  var Pair = RubyMarshal.Pair = (function() {
    function Pair(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Pair.prototype._read = function() {
      this.key = new Record(this._io, this, this._root);
      this.value = new Record(this._io, this, this._root);
    }

    return Pair;
  })();

  /**
   * Each record starts with a single byte that determines its type
   * (`code`) and contents. If necessary, additional info as parsed
   * as `body`, to be determined by `code`.
   */

  var Record = RubyMarshal.Record = (function() {
    function Record(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Record.prototype._read = function() {
      this.code = this._io.readU1();
      switch (this.code) {
      case RubyMarshal.Codes.BIGNUM:
        this.body = new Bignum(this._io, this, this._root);
        break;
      case RubyMarshal.Codes.INSTANCE_VAR:
        this.body = new InstanceVar(this._io, this, this._root);
        break;
      case RubyMarshal.Codes.PACKED_INT:
        this.body = new PackedInt(this._io, this, this._root);
        break;
      case RubyMarshal.Codes.RUBY_ARRAY:
        this.body = new RubyArray(this._io, this, this._root);
        break;
      case RubyMarshal.Codes.RUBY_HASH:
        this.body = new RubyHash(this._io, this, this._root);
        break;
      case RubyMarshal.Codes.RUBY_OBJECT_LINK:
        this.body = new PackedInt(this._io, this, this._root);
        break;
      case RubyMarshal.Codes.RUBY_STRING:
        this.body = new RubyString(this._io, this, this._root);
        break;
      case RubyMarshal.Codes.RUBY_STRUCT:
        this.body = new RubyStruct(this._io, this, this._root);
        break;
      case RubyMarshal.Codes.RUBY_SYMBOL:
        this.body = new RubySymbol(this._io, this, this._root);
        break;
      case RubyMarshal.Codes.RUBY_SYMBOL_LINK:
        this.body = new PackedInt(this._io, this, this._root);
        break;
      }
    }

    return Record;
  })();

  var RubyArray = RubyMarshal.RubyArray = (function() {
    function RubyArray(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    RubyArray.prototype._read = function() {
      this.numElements = new PackedInt(this._io, this, this._root);
      this.elements = [];
      for (var i = 0; i < this.numElements.value; i++) {
        this.elements.push(new Record(this._io, this, this._root));
      }
    }

    return RubyArray;
  })();

  /**
   * @see {@link https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Hash+and+Hash+with+Default+Value|Source}
   */

  var RubyHash = RubyMarshal.RubyHash = (function() {
    function RubyHash(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    RubyHash.prototype._read = function() {
      this.numPairs = new PackedInt(this._io, this, this._root);
      this.pairs = [];
      for (var i = 0; i < this.numPairs.value; i++) {
        this.pairs.push(new Pair(this._io, this, this._root));
      }
    }

    return RubyHash;
  })();

  /**
   * @see {@link https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-String|Source}
   */

  var RubyString = RubyMarshal.RubyString = (function() {
    function RubyString(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    RubyString.prototype._read = function() {
      this.len = new PackedInt(this._io, this, this._root);
      this.body = this._io.readBytes(this.len.value);
    }

    return RubyString;
  })();

  /**
   * @see {@link https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Struct|Source}
   */

  var RubyStruct = RubyMarshal.RubyStruct = (function() {
    function RubyStruct(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    RubyStruct.prototype._read = function() {
      this.name = new Record(this._io, this, this._root);
      this.numMembers = new PackedInt(this._io, this, this._root);
      this.members = [];
      for (var i = 0; i < this.numMembers.value; i++) {
        this.members.push(new Pair(this._io, this, this._root));
      }
    }

    /**
     * Symbol containing the name of the struct.
     */

    /**
     * Number of members in a struct
     */

    return RubyStruct;
  })();

  /**
   * @see {@link https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Symbols+and+Byte+Sequence|Source}
   */

  var RubySymbol = RubyMarshal.RubySymbol = (function() {
    function RubySymbol(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    RubySymbol.prototype._read = function() {
      this.len = new PackedInt(this._io, this, this._root);
      this.name = KaitaiStream.bytesToStr(this._io.readBytes(this.len.value), "UTF-8");
    }

    return RubySymbol;
  })();

  return RubyMarshal;
})();
RubyMarshal_.RubyMarshal = RubyMarshal;
});
