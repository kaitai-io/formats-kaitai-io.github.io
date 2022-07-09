// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.PhpSerializedValue = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
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
 * @see {@link https://www.php.net/manual/en/function.serialize.php|Source}
 * @see {@link https://www.php.net/manual/en/function.serialize.php#66147|Source}
 * @see {@link https://www.php.net/manual/en/function.unserialize.php|Source}
 * @see {@link https://github.com/php/php-src/blob/php-7.3.5/ext/standard/var_unserializer.re|Source}
 * @see {@link https://github.com/php/php-src/blob/php-7.3.5/ext/standard/var.c#L822|Source}
 */

var PhpSerializedValue = (function() {
  PhpSerializedValue.ValueType = Object.freeze({
    CUSTOM_SERIALIZED_OBJECT: 67,
    NULL: 78,
    OBJECT: 79,
    VARIABLE_REFERENCE: 82,
    PHP_6_STRING: 83,
    ARRAY: 97,
    BOOL: 98,
    FLOAT: 100,
    INT: 105,
    PHP_3_OBJECT: 111,
    OBJECT_REFERENCE: 114,
    STRING: 115,

    67: "CUSTOM_SERIALIZED_OBJECT",
    78: "NULL",
    79: "OBJECT",
    82: "VARIABLE_REFERENCE",
    83: "PHP_6_STRING",
    97: "ARRAY",
    98: "BOOL",
    100: "FLOAT",
    105: "INT",
    111: "PHP_3_OBJECT",
    114: "OBJECT_REFERENCE",
    115: "STRING",
  });

  PhpSerializedValue.BoolValue = Object.freeze({
    FALSE: 48,
    TRUE: 49,

    48: "FALSE",
    49: "TRUE",
  });

  function PhpSerializedValue(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  PhpSerializedValue.prototype._read = function() {
    this.type = this._io.readU1();
    switch (this.type) {
    case PhpSerializedValue.ValueType.CUSTOM_SERIALIZED_OBJECT:
      this.contents = new CustomSerializedObjectContents(this._io, this, this._root);
      break;
    case PhpSerializedValue.ValueType.PHP_3_OBJECT:
      this.contents = new Php3ObjectContents(this._io, this, this._root);
      break;
    case PhpSerializedValue.ValueType.OBJECT:
      this.contents = new ObjectContents(this._io, this, this._root);
      break;
    case PhpSerializedValue.ValueType.VARIABLE_REFERENCE:
      this.contents = new IntContents(this._io, this, this._root);
      break;
    case PhpSerializedValue.ValueType.PHP_6_STRING:
      this.contents = new StringContents(this._io, this, this._root);
      break;
    case PhpSerializedValue.ValueType.FLOAT:
      this.contents = new FloatContents(this._io, this, this._root);
      break;
    case PhpSerializedValue.ValueType.OBJECT_REFERENCE:
      this.contents = new IntContents(this._io, this, this._root);
      break;
    case PhpSerializedValue.ValueType.NULL:
      this.contents = new NullContents(this._io, this, this._root);
      break;
    case PhpSerializedValue.ValueType.BOOL:
      this.contents = new BoolContents(this._io, this, this._root);
      break;
    case PhpSerializedValue.ValueType.INT:
      this.contents = new IntContents(this._io, this, this._root);
      break;
    case PhpSerializedValue.ValueType.ARRAY:
      this.contents = new ArrayContents(this._io, this, this._root);
      break;
    case PhpSerializedValue.ValueType.STRING:
      this.contents = new StringContents(this._io, this, this._root);
      break;
    }
  }

  /**
   * A mapping (a sequence of key-value pairs) prefixed with its size.
   */

  var CountPrefixedMapping = PhpSerializedValue.CountPrefixedMapping = (function() {
    function CountPrefixedMapping(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CountPrefixedMapping.prototype._read = function() {
      this.numEntriesDec = KaitaiStream.bytesToStr(this._io.readBytesTerm(58, false, true, true), "ASCII");
      this.openingBrace = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.openingBrace, [123]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([123], this.openingBrace, this._io, "/types/count_prefixed_mapping/seq/1");
      }
      this.entries = [];
      for (var i = 0; i < this.numEntries; i++) {
        this.entries.push(new MappingEntry(this._io, this, this._root));
      }
      this.closingBrace = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.closingBrace, [125]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([125], this.closingBrace, this._io, "/types/count_prefixed_mapping/seq/3");
      }
    }

    /**
     * The number of key-value pairs in the mapping, parsed as an integer.
     */
    Object.defineProperty(CountPrefixedMapping.prototype, 'numEntries', {
      get: function() {
        if (this._m_numEntries !== undefined)
          return this._m_numEntries;
        this._m_numEntries = Number.parseInt(this.numEntriesDec, 10);
        return this._m_numEntries;
      }
    });

    /**
     * The number of key-value pairs in the mapping, in ASCII decimal.
     */

    /**
     * The key-value pairs contained in the mapping.
     */

    return CountPrefixedMapping;
  })();

  /**
   * The contents of a floating-point value.
   */

  var FloatContents = PhpSerializedValue.FloatContents = (function() {
    function FloatContents(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FloatContents.prototype._read = function() {
      this.colon = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.colon, [58]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([58], this.colon, this._io, "/types/float_contents/seq/0");
      }
      this.valueDec = KaitaiStream.bytesToStr(this._io.readBytesTerm(59, false, true, true), "ASCII");
    }

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

    return FloatContents;
  })();

  /**
   * A quoted string prefixed with its length.
   * 
   * Despite the quotes surrounding the string data, it can contain
   * arbitrary bytes, which are never escaped in any way.
   * This does not cause any ambiguities when parsing - the bounds of
   * the string are determined only by the length field, not by the quotes.
   */

  var LengthPrefixedQuotedString = PhpSerializedValue.LengthPrefixedQuotedString = (function() {
    function LengthPrefixedQuotedString(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    LengthPrefixedQuotedString.prototype._read = function() {
      this.lenDataDec = KaitaiStream.bytesToStr(this._io.readBytesTerm(58, false, true, true), "ASCII");
      this.openingQuote = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.openingQuote, [34]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([34], this.openingQuote, this._io, "/types/length_prefixed_quoted_string/seq/1");
      }
      this.data = this._io.readBytes(this.lenData);
      this.closingQuote = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.closingQuote, [34]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([34], this.closingQuote, this._io, "/types/length_prefixed_quoted_string/seq/3");
      }
    }

    /**
     * The length of the string's contents in bytes, parsed as an integer.
     * The quotes are not counted in this size number.
     */
    Object.defineProperty(LengthPrefixedQuotedString.prototype, 'lenData', {
      get: function() {
        if (this._m_lenData !== undefined)
          return this._m_lenData;
        this._m_lenData = Number.parseInt(this.lenDataDec, 10);
        return this._m_lenData;
      }
    });

    /**
     * The length of the string's data in bytes, in ASCII decimal.
     * The quotes are not counted in this length number.
     */

    /**
     * The data contained in the string. The quotes are not included.
     */

    return LengthPrefixedQuotedString;
  })();

  /**
   * The contents of an object value serialized in the default format.
   * Unlike its PHP 3 counterpart, it contains a class name.
   */

  var ObjectContents = PhpSerializedValue.ObjectContents = (function() {
    function ObjectContents(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ObjectContents.prototype._read = function() {
      this.colon1 = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.colon1, [58]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([58], this.colon1, this._io, "/types/object_contents/seq/0");
      }
      this.className = new LengthPrefixedQuotedString(this._io, this, this._root);
      this.colon2 = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.colon2, [58]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([58], this.colon2, this._io, "/types/object_contents/seq/2");
      }
      this.properties = new CountPrefixedMapping(this._io, this, this._root);
    }

    /**
     * The name of the object's class.
     */

    /**
     * The object's properties. Keys ust be of type `string`,
     * values may have any type.
     */

    return ObjectContents;
  })();

  /**
   * The contents of an array value.
   */

  var ArrayContents = PhpSerializedValue.ArrayContents = (function() {
    function ArrayContents(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ArrayContents.prototype._read = function() {
      this.colon = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.colon, [58]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([58], this.colon, this._io, "/types/array_contents/seq/0");
      }
      this.elements = new CountPrefixedMapping(this._io, this, this._root);
    }

    /**
     * The array's elements. Keys must be of type `int` or `string`,
     * values may have any type.
     */

    return ArrayContents;
  })();

  /**
   * The contents of an object value that implements a custom
   * serialized format using `Serializable`.
   */

  var CustomSerializedObjectContents = PhpSerializedValue.CustomSerializedObjectContents = (function() {
    function CustomSerializedObjectContents(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CustomSerializedObjectContents.prototype._read = function() {
      this.colon1 = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.colon1, [58]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([58], this.colon1, this._io, "/types/custom_serialized_object_contents/seq/0");
      }
      this.className = new LengthPrefixedQuotedString(this._io, this, this._root);
      this.colon2 = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.colon2, [58]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([58], this.colon2, this._io, "/types/custom_serialized_object_contents/seq/2");
      }
      this.lenDataDec = KaitaiStream.bytesToStr(this._io.readBytesTerm(58, false, true, true), "ASCII");
      this.openingBrace = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.openingBrace, [123]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([123], this.openingBrace, this._io, "/types/custom_serialized_object_contents/seq/4");
      }
      this.data = this._io.readBytes(this.lenData);
      this.closingQuote = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.closingQuote, [125]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([125], this.closingQuote, this._io, "/types/custom_serialized_object_contents/seq/6");
      }
    }

    /**
     * The length of the serialized data in bytes, parsed as an integer.
     * The braces are not counted in this length number.
     */
    Object.defineProperty(CustomSerializedObjectContents.prototype, 'lenData', {
      get: function() {
        if (this._m_lenData !== undefined)
          return this._m_lenData;
        this._m_lenData = Number.parseInt(this.lenDataDec, 10);
        return this._m_lenData;
      }
    });

    /**
     * The name of the object's class.
     */

    /**
     * The length of the serialized data in bytes, in ASCII decimal.
     * The braces are not counted in this size number.
     */

    /**
     * The custom serialized data. The braces are not included.
     * 
     * Although the surrounding braces make it look like a regular
     * serialized object, this field is actually more similar to a string:
     * it can contain arbitrary data that is not required to follow
     * any common structure.
     */

    return CustomSerializedObjectContents;
  })();

  /**
   * The contents of a null value (`value_type::null`). This structure
   * contains no actual data, since there is only a single `NULL` value.
   */

  var NullContents = PhpSerializedValue.NullContents = (function() {
    function NullContents(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    NullContents.prototype._read = function() {
      this.semicolon = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.semicolon, [59]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([59], this.semicolon, this._io, "/types/null_contents/seq/0");
      }
    }

    return NullContents;
  })();

  /**
   * The contents of a PHP 3 object value. Unlike its counterpart in PHP 4
   * and above, it does not contain a class name.
   */

  var Php3ObjectContents = PhpSerializedValue.Php3ObjectContents = (function() {
    function Php3ObjectContents(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Php3ObjectContents.prototype._read = function() {
      this.colon = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.colon, [58]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([58], this.colon, this._io, "/types/php_3_object_contents/seq/0");
      }
      this.properties = new CountPrefixedMapping(this._io, this, this._root);
    }

    /**
     * The object's properties. Keys must be of type `string`,
     * values may have any type.
     */

    return Php3ObjectContents;
  })();

  /**
   * The contents of a boolean value (`value_type::bool`).
   */

  var BoolContents = PhpSerializedValue.BoolContents = (function() {
    function BoolContents(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BoolContents.prototype._read = function() {
      this.colon = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.colon, [58]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([58], this.colon, this._io, "/types/bool_contents/seq/0");
      }
      this.valueDec = this._io.readU1();
      this.semicolon = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.semicolon, [59]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([59], this.semicolon, this._io, "/types/bool_contents/seq/2");
      }
    }

    /**
     * The value of the `bool`, parsed as a boolean.
     */
    Object.defineProperty(BoolContents.prototype, 'value', {
      get: function() {
        if (this._m_value !== undefined)
          return this._m_value;
        this._m_value = this.valueDec == PhpSerializedValue.BoolValue.TRUE;
        return this._m_value;
      }
    });

    /**
     * The value of the `bool`: `0` for `false` or `1` for `true`.
     */

    return BoolContents;
  })();

  /**
   * The contents of a string value.
   * 
   * Note: PHP strings can contain arbitrary byte sequences.
   * They are not necessarily valid text in any specific encoding.
   */

  var StringContents = PhpSerializedValue.StringContents = (function() {
    function StringContents(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    StringContents.prototype._read = function() {
      this.colon = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.colon, [58]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([58], this.colon, this._io, "/types/string_contents/seq/0");
      }
      this.string = new LengthPrefixedQuotedString(this._io, this, this._root);
      this.semicolon = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.semicolon, [59]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([59], this.semicolon, this._io, "/types/string_contents/seq/2");
      }
    }

    /**
     * The value of the string, as a byte array.
     */
    Object.defineProperty(StringContents.prototype, 'value', {
      get: function() {
        if (this._m_value !== undefined)
          return this._m_value;
        this._m_value = this.string.data;
        return this._m_value;
      }
    });

    return StringContents;
  })();

  /**
   * The contents of an integer-like value:
   * either an actual integer (`value_type::int`) or a reference
   * (`value_type::variable_reference`, `value_type::object_reference`).
   */

  var IntContents = PhpSerializedValue.IntContents = (function() {
    function IntContents(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    IntContents.prototype._read = function() {
      this.colon = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.colon, [58]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([58], this.colon, this._io, "/types/int_contents/seq/0");
      }
      this.valueDec = KaitaiStream.bytesToStr(this._io.readBytesTerm(59, false, true, true), "ASCII");
    }

    /**
     * The value of the `int`, parsed as an integer.
     */
    Object.defineProperty(IntContents.prototype, 'value', {
      get: function() {
        if (this._m_value !== undefined)
          return this._m_value;
        this._m_value = Number.parseInt(this.valueDec, 10);
        return this._m_value;
      }
    });

    /**
     * The value of the `int`, in ASCII decimal.
     */

    return IntContents;
  })();

  /**
   * A mapping entry consisting of a key and a value.
   */

  var MappingEntry = PhpSerializedValue.MappingEntry = (function() {
    function MappingEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MappingEntry.prototype._read = function() {
      this.key = new PhpSerializedValue(this._io, this, null);
      this.value = new PhpSerializedValue(this._io, this, null);
    }

    /**
     * The key of the entry.
     */

    /**
     * The value of the entry.
     */

    return MappingEntry;
  })();

  /**
   * A single-character code indicating the type of the serialized value.
   */

  /**
   * The contents of the serialized value, which vary depending on the type.
   */

  return PhpSerializedValue;
})();
return PhpSerializedValue;
}));
