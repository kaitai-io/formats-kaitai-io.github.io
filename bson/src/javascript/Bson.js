// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Bson = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * BSON, short for Binary JSON, is a binary-encoded serialization of JSON-like documents. Like JSON, BSON supports the embedding of documents and arrays within other documents and arrays. BSON also contains extensions that allow representation of data types that are not part of the JSON spec. For example, BSON has a Date type and a BinData type. BSON can be compared to binary interchange formats, like Protocol Buffers. BSON is more "schemaless" than Protocol Buffers, which can give it an advantage in flexibility but also a slight disadvantage in space efficiency (BSON has overhead for field names within the serialized data). BSON was designed to have the following three characteristics:
 *   * Lightweight. Keeping spatial overhead to a minimum is important for any data representation format, especially when used over the network.
 *   * Traversable. BSON is designed to be traversed easily. This is a vital property in its role as the primary data representation for MongoDB.
 *   * Efficient. Encoding data to BSON and decoding from BSON can be performed very quickly in most languages due to the use of C data types.
 */

var Bson = (function() {
  function Bson(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Bson.prototype._read = function() {
    this.len = this._io.readS4le();
    this._raw_fields = this._io.readBytes((this.len - 5));
    var _io__raw_fields = new KaitaiStream(this._raw_fields);
    this.fields = new ElementsList(_io__raw_fields, this, this._root);
    this.terminator = this._io.ensureFixedContents([0]);
  }

  /**
   * Special internal type used by MongoDB replication and sharding. First 4 bytes are an increment, second 4 are a timestamp.
   */

  var Timestamp = Bson.Timestamp = (function() {
    function Timestamp(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Timestamp.prototype._read = function() {
      this.increment = this._io.readU4le();
      this.timestamp = this._io.readU4le();
    }

    return Timestamp;
  })();

  /**
   * The BSON "binary" or "BinData" datatype is used to represent arrays of bytes. It is somewhat analogous to the Java notion of a ByteArray. BSON binary values have a subtype. This is used to indicate what kind of data is in the byte array. Subtypes from zero to 127 are predefined or reserved. Subtypes from 128-255 are user-defined.
   */

  var BinData = Bson.BinData = (function() {
    BinData.Subtype = Object.freeze({
      GENERIC: 0,
      FUNCTION: 1,
      BYTE_ARRAY_DEPRECATED: 2,
      UUID_DEPRECATED: 3,
      UUID: 4,
      MD5: 5,
      CUSTOM: 128,

      0: "GENERIC",
      1: "FUNCTION",
      2: "BYTE_ARRAY_DEPRECATED",
      3: "UUID_DEPRECATED",
      4: "UUID",
      5: "MD5",
      128: "CUSTOM",
    });

    function BinData(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BinData.prototype._read = function() {
      this.len = this._io.readS4le();
      this.subtype = this._io.readU1();
      switch (this.subtype) {
      case Bson.BinData.Subtype.BYTE_ARRAY_DEPRECATED:
        this._raw_content = this._io.readBytes(this.len);
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new ByteArrayDeprecated(_io__raw_content, this, this._root);
        break;
      default:
        this.content = this._io.readBytes(this.len);
        break;
      }
    }

    /**
     * The BSON "binary" or "BinData" datatype is used to represent arrays of bytes. It is somewhat analogous to the Java notion of a ByteArray. BSON binary values have a subtype. This is used to indicate what kind of data is in the byte array. Subtypes from zero to 127 are predefined or reserved. Subtypes from 128-255 are user-defined.
     */

    var ByteArrayDeprecated = BinData.ByteArrayDeprecated = (function() {
      function ByteArrayDeprecated(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      ByteArrayDeprecated.prototype._read = function() {
        this.len = this._io.readS4le();
        this.content = this._io.readBytes(this.len);
      }

      return ByteArrayDeprecated;
    })();

    return BinData;
  })();

  var ElementsList = Bson.ElementsList = (function() {
    function ElementsList(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ElementsList.prototype._read = function() {
      this.elements = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.elements.push(new Element(this._io, this, this._root));
        i++;
      }
    }

    return ElementsList;
  })();

  var Cstring = Bson.Cstring = (function() {
    function Cstring(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Cstring.prototype._read = function() {
      this.str = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "UTF-8");
    }

    /**
     * MUST NOT contain '\x00', hence it is not full UTF-8.
     */

    return Cstring;
  })();

  var String = Bson.String = (function() {
    function String(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    String.prototype._read = function() {
      this.len = this._io.readS4le();
      this.str = KaitaiStream.bytesToStr(this._io.readBytes((this.len - 1)), "UTF-8");
      this.terminator = this._io.ensureFixedContents([0]);
    }

    return String;
  })();

  var Element = Bson.Element = (function() {
    Element.BsonType = Object.freeze({
      MIN_KEY: -1,
      END_OF_OBJECT: 0,
      NUMBER_DOUBLE: 1,
      STRING: 2,
      DOCUMENT: 3,
      ARRAY: 4,
      BIN_DATA: 5,
      UNDEFINED: 6,
      OBJECT_ID: 7,
      BOOLEAN: 8,
      UTC_DATETIME: 9,
      JST_NULL: 10,
      REG_EX: 11,
      DB_POINTER: 12,
      JAVASCRIPT: 13,
      SYMBOL: 14,
      CODE_WITH_SCOPE: 15,
      NUMBER_INT: 16,
      TIMESTAMP: 17,
      NUMBER_LONG: 18,
      NUMBER_DECIMAL: 19,
      MAX_KEY: 127,

      "-1": "MIN_KEY",
      0: "END_OF_OBJECT",
      1: "NUMBER_DOUBLE",
      2: "STRING",
      3: "DOCUMENT",
      4: "ARRAY",
      5: "BIN_DATA",
      6: "UNDEFINED",
      7: "OBJECT_ID",
      8: "BOOLEAN",
      9: "UTC_DATETIME",
      10: "JST_NULL",
      11: "REG_EX",
      12: "DB_POINTER",
      13: "JAVASCRIPT",
      14: "SYMBOL",
      15: "CODE_WITH_SCOPE",
      16: "NUMBER_INT",
      17: "TIMESTAMP",
      18: "NUMBER_LONG",
      19: "NUMBER_DECIMAL",
      127: "MAX_KEY",
    });

    function Element(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Element.prototype._read = function() {
      this.typeByte = this._io.readU1();
      this.name = new Cstring(this._io, this, this._root);
      switch (this.typeByte) {
      case Bson.Element.BsonType.CODE_WITH_SCOPE:
        this.content = new CodeWithScope(this._io, this, this._root);
        break;
      case Bson.Element.BsonType.REG_EX:
        this.content = new RegEx(this._io, this, this._root);
        break;
      case Bson.Element.BsonType.NUMBER_DOUBLE:
        this.content = this._io.readF8le();
        break;
      case Bson.Element.BsonType.SYMBOL:
        this.content = new String(this._io, this, this._root);
        break;
      case Bson.Element.BsonType.TIMESTAMP:
        this.content = new Timestamp(this._io, this, this._root);
        break;
      case Bson.Element.BsonType.NUMBER_INT:
        this.content = this._io.readS4le();
        break;
      case Bson.Element.BsonType.DOCUMENT:
        this.content = new Bson(this._io, this, null);
        break;
      case Bson.Element.BsonType.OBJECT_ID:
        this.content = new ObjectId(this._io, this, this._root);
        break;
      case Bson.Element.BsonType.JAVASCRIPT:
        this.content = new String(this._io, this, this._root);
        break;
      case Bson.Element.BsonType.UTC_DATETIME:
        this.content = this._io.readS8le();
        break;
      case Bson.Element.BsonType.BOOLEAN:
        this.content = this._io.readU1();
        break;
      case Bson.Element.BsonType.NUMBER_LONG:
        this.content = this._io.readS8le();
        break;
      case Bson.Element.BsonType.BIN_DATA:
        this.content = new BinData(this._io, this, this._root);
        break;
      case Bson.Element.BsonType.STRING:
        this.content = new String(this._io, this, this._root);
        break;
      case Bson.Element.BsonType.DB_POINTER:
        this.content = new DbPointer(this._io, this, this._root);
        break;
      case Bson.Element.BsonType.ARRAY:
        this.content = new Bson(this._io, this, null);
        break;
      case Bson.Element.BsonType.NUMBER_DECIMAL:
        this.content = new F16(this._io, this, this._root);
        break;
      }
    }

    return Element;
  })();

  var DbPointer = Bson.DbPointer = (function() {
    function DbPointer(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DbPointer.prototype._read = function() {
      this.namespace = new String(this._io, this, this._root);
      this.id = new ObjectId(this._io, this, this._root);
    }

    return DbPointer;
  })();

  /**
   * Implements unsigned 24-bit (3 byte) integer.
   */

  var U3 = Bson.U3 = (function() {
    function U3(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    U3.prototype._read = function() {
      this.b1 = this._io.readU1();
      this.b2 = this._io.readU1();
      this.b3 = this._io.readU1();
    }
    Object.defineProperty(U3.prototype, 'value', {
      get: function() {
        if (this._m_value !== undefined)
          return this._m_value;
        this._m_value = ((this.b1 | (this.b2 << 8)) | (this.b3 << 16));
        return this._m_value;
      }
    });

    return U3;
  })();

  var CodeWithScope = Bson.CodeWithScope = (function() {
    function CodeWithScope(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CodeWithScope.prototype._read = function() {
      this.id = this._io.readS4le();
      this.source = new String(this._io, this, this._root);
      this.scope = new Bson(this._io, this, null);
    }

    /**
     * mapping from identifiers to values, representing the scope in which the string should be evaluated.
     */

    return CodeWithScope;
  })();

  /**
   * 128-bit IEEE 754-2008 decimal floating point
   */

  var F16 = Bson.F16 = (function() {
    function F16(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    F16.prototype._read = function() {
      this.str = this._io.readBitsInt(1) != 0;
      this.exponent = this._io.readBitsInt(15);
      this.significandHi = this._io.readBitsInt(49);
      this._io.alignToByte();
      this.significandLo = this._io.readU8le();
    }

    return F16;
  })();

  /**
   * https://docs.mongodb.com/manual/reference/method/ObjectId/
   */

  var ObjectId = Bson.ObjectId = (function() {
    function ObjectId(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ObjectId.prototype._read = function() {
      this.epochTime = this._io.readU4le();
      this.machineId = new U3(this._io, this, this._root);
      this.processId = this._io.readU2le();
      this.counter = new U3(this._io, this, this._root);
    }

    /**
     * seconds since the Unix epoch
     */

    /**
     * counter, starting with a random value.
     */

    return ObjectId;
  })();

  var RegEx = Bson.RegEx = (function() {
    function RegEx(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RegEx.prototype._read = function() {
      this.pattern = new Cstring(this._io, this, this._root);
      this.options = new Cstring(this._io, this, this._root);
    }

    return RegEx;
  })();

  /**
   * Total number of bytes comprising the document.
   */

  return Bson;
})();
return Bson;
}));
