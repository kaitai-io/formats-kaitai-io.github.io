-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")

-- 
-- A serialized PHP value, in the format used by PHP's built-in `serialize` and
-- `unserialize` functions. This format closely mirrors PHP's data model:
-- it supports all of PHP's scalar types (`NULL`, booleans, numbers, strings),
-- associative arrays, objects, and recursive data structures using references.
-- The only PHP values not supported by this format are *resources*,
-- which usually correspond to native file or connection handles and cannot be
-- meaningfully serialized.
-- 
-- There is no official documentation for this data format;
-- this spec was created based on the PHP source code and the behavior of
-- `serialize`/`unserialize`. PHP makes no guarantees about compatibility of
-- serialized data between PHP versions, but in practice, the format has
-- remained fully backwards-compatible - values serialized by an older
-- PHP version can be unserialized on any newer PHP version.
-- This spec supports serialized values from PHP 7.3 or any earlier version.
-- See also: Source (https://www.php.net/manual/en/function.serialize.php)
-- See also: Source (https://www.php.net/manual/en/function.serialize.php#66147)
-- See also: Source (https://www.php.net/manual/en/function.unserialize.php)
-- See also: Source (https://github.com/php/php-src/blob/php-7.3.5/ext/standard/var_unserializer.re)
-- See also: Source (https://github.com/php/php-src/blob/php-7.3.5/ext/standard/var.c#L822)
PhpSerializedValue = class.class(KaitaiStruct)

PhpSerializedValue.ValueType = enum.Enum {
  custom_serialized_object = 67,
  null = 78,
  object = 79,
  variable_reference = 82,
  php_6_string = 83,
  array = 97,
  bool = 98,
  float = 100,
  int = 105,
  php_3_object = 111,
  object_reference = 114,
  string = 115,
}

PhpSerializedValue.BoolValue = enum.Enum {
  false = 48,
  true = 49,
}

function PhpSerializedValue:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PhpSerializedValue:_read()
  self.type = PhpSerializedValue.ValueType(self._io:read_u1())
  local _on = self.type
  if _on == PhpSerializedValue.ValueType.custom_serialized_object then
    self.contents = PhpSerializedValue.CustomSerializedObjectContents(self._io, self, self._root)
  elseif _on == PhpSerializedValue.ValueType.php_3_object then
    self.contents = PhpSerializedValue.Php3ObjectContents(self._io, self, self._root)
  elseif _on == PhpSerializedValue.ValueType.object then
    self.contents = PhpSerializedValue.ObjectContents(self._io, self, self._root)
  elseif _on == PhpSerializedValue.ValueType.variable_reference then
    self.contents = PhpSerializedValue.IntContents(self._io, self, self._root)
  elseif _on == PhpSerializedValue.ValueType.php_6_string then
    self.contents = PhpSerializedValue.StringContents(self._io, self, self._root)
  elseif _on == PhpSerializedValue.ValueType.float then
    self.contents = PhpSerializedValue.FloatContents(self._io, self, self._root)
  elseif _on == PhpSerializedValue.ValueType.object_reference then
    self.contents = PhpSerializedValue.IntContents(self._io, self, self._root)
  elseif _on == PhpSerializedValue.ValueType.null then
    self.contents = PhpSerializedValue.NullContents(self._io, self, self._root)
  elseif _on == PhpSerializedValue.ValueType.bool then
    self.contents = PhpSerializedValue.BoolContents(self._io, self, self._root)
  elseif _on == PhpSerializedValue.ValueType.int then
    self.contents = PhpSerializedValue.IntContents(self._io, self, self._root)
  elseif _on == PhpSerializedValue.ValueType.array then
    self.contents = PhpSerializedValue.ArrayContents(self._io, self, self._root)
  elseif _on == PhpSerializedValue.ValueType.string then
    self.contents = PhpSerializedValue.StringContents(self._io, self, self._root)
  end
end

-- 
-- A single-character code indicating the type of the serialized value.
-- 
-- The contents of the serialized value, which vary depending on the type.

-- 
-- A mapping (a sequence of key-value pairs) prefixed with its size.
PhpSerializedValue.CountPrefixedMapping = class.class(KaitaiStruct)

function PhpSerializedValue.CountPrefixedMapping:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PhpSerializedValue.CountPrefixedMapping:_read()
  self.num_entries_dec = str_decode.decode(self._io:read_bytes_term(58, false, true, true), "ASCII")
  self.opening_brace = self._io:read_bytes(1)
  if not(self.opening_brace == "\123") then
    error("not equal, expected " ..  "\123" .. ", but got " .. self.opening_brace)
  end
  self.entries = {}
  for i = 0, self.num_entries - 1 do
    self.entries[i + 1] = PhpSerializedValue.MappingEntry(self._io, self, self._root)
  end
  self.closing_brace = self._io:read_bytes(1)
  if not(self.closing_brace == "\125") then
    error("not equal, expected " ..  "\125" .. ", but got " .. self.closing_brace)
  end
end

-- 
-- The number of key-value pairs in the mapping, parsed as an integer.
PhpSerializedValue.CountPrefixedMapping.property.num_entries = {}
function PhpSerializedValue.CountPrefixedMapping.property.num_entries:get()
  if self._m_num_entries ~= nil then
    return self._m_num_entries
  end

  self._m_num_entries = tonumber(self.num_entries_dec)
  return self._m_num_entries
end

-- 
-- The number of key-value pairs in the mapping, in ASCII decimal.
-- 
-- The key-value pairs contained in the mapping.

-- 
-- The contents of a floating-point value.
PhpSerializedValue.FloatContents = class.class(KaitaiStruct)

function PhpSerializedValue.FloatContents:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PhpSerializedValue.FloatContents:_read()
  self.colon = self._io:read_bytes(1)
  if not(self.colon == "\058") then
    error("not equal, expected " ..  "\058" .. ", but got " .. self.colon)
  end
  self.value_dec = str_decode.decode(self._io:read_bytes_term(59, false, true, true), "ASCII")
end

-- 
-- The value of the `float`, in ASCII decimal, as generated by PHP's
-- usual double-to-string conversion. In particular, this means that:
-- 
-- * A decimal point may not be included (for integral numbers)
-- * The number may use exponent notation (e. g. `1.0E+16`)
-- * Positive and negative infinity are represented as `INF`
--   and `-INF`, respectively
-- * Not-a-number is represented as `NAN`

-- 
-- A quoted string prefixed with its length.
-- 
-- Despite the quotes surrounding the string data, it can contain
-- arbitrary bytes, which are never escaped in any way.
-- This does not cause any ambiguities when parsing - the bounds of
-- the string are determined only by the length field, not by the quotes.
PhpSerializedValue.LengthPrefixedQuotedString = class.class(KaitaiStruct)

function PhpSerializedValue.LengthPrefixedQuotedString:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PhpSerializedValue.LengthPrefixedQuotedString:_read()
  self.len_data_dec = str_decode.decode(self._io:read_bytes_term(58, false, true, true), "ASCII")
  self.opening_quote = self._io:read_bytes(1)
  if not(self.opening_quote == "\034") then
    error("not equal, expected " ..  "\034" .. ", but got " .. self.opening_quote)
  end
  self.data = self._io:read_bytes(self.len_data)
  self.closing_quote = self._io:read_bytes(1)
  if not(self.closing_quote == "\034") then
    error("not equal, expected " ..  "\034" .. ", but got " .. self.closing_quote)
  end
end

-- 
-- The length of the string's contents in bytes, parsed as an integer.
-- The quotes are not counted in this size number.
PhpSerializedValue.LengthPrefixedQuotedString.property.len_data = {}
function PhpSerializedValue.LengthPrefixedQuotedString.property.len_data:get()
  if self._m_len_data ~= nil then
    return self._m_len_data
  end

  self._m_len_data = tonumber(self.len_data_dec)
  return self._m_len_data
end

-- 
-- The length of the string's data in bytes, in ASCII decimal.
-- The quotes are not counted in this length number.
-- 
-- The data contained in the string. The quotes are not included.

-- 
-- The contents of an object value serialized in the default format.
-- Unlike its PHP 3 counterpart, it contains a class name.
PhpSerializedValue.ObjectContents = class.class(KaitaiStruct)

function PhpSerializedValue.ObjectContents:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PhpSerializedValue.ObjectContents:_read()
  self.colon1 = self._io:read_bytes(1)
  if not(self.colon1 == "\058") then
    error("not equal, expected " ..  "\058" .. ", but got " .. self.colon1)
  end
  self.class_name = PhpSerializedValue.LengthPrefixedQuotedString(self._io, self, self._root)
  self.colon2 = self._io:read_bytes(1)
  if not(self.colon2 == "\058") then
    error("not equal, expected " ..  "\058" .. ", but got " .. self.colon2)
  end
  self.properties = PhpSerializedValue.CountPrefixedMapping(self._io, self, self._root)
end

-- 
-- The name of the object's class.
-- 
-- The object's properties. Keys ust be of type `string`,
-- values may have any type.

-- 
-- The contents of an array value.
PhpSerializedValue.ArrayContents = class.class(KaitaiStruct)

function PhpSerializedValue.ArrayContents:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PhpSerializedValue.ArrayContents:_read()
  self.colon = self._io:read_bytes(1)
  if not(self.colon == "\058") then
    error("not equal, expected " ..  "\058" .. ", but got " .. self.colon)
  end
  self.elements = PhpSerializedValue.CountPrefixedMapping(self._io, self, self._root)
end

-- 
-- The array's elements. Keys must be of type `int` or `string`,
-- values may have any type.

-- 
-- The contents of an object value that implements a custom
-- serialized format using `Serializable`.
PhpSerializedValue.CustomSerializedObjectContents = class.class(KaitaiStruct)

function PhpSerializedValue.CustomSerializedObjectContents:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PhpSerializedValue.CustomSerializedObjectContents:_read()
  self.colon1 = self._io:read_bytes(1)
  if not(self.colon1 == "\058") then
    error("not equal, expected " ..  "\058" .. ", but got " .. self.colon1)
  end
  self.class_name = PhpSerializedValue.LengthPrefixedQuotedString(self._io, self, self._root)
  self.colon2 = self._io:read_bytes(1)
  if not(self.colon2 == "\058") then
    error("not equal, expected " ..  "\058" .. ", but got " .. self.colon2)
  end
  self.len_data_dec = str_decode.decode(self._io:read_bytes_term(58, false, true, true), "ASCII")
  self.opening_brace = self._io:read_bytes(1)
  if not(self.opening_brace == "\123") then
    error("not equal, expected " ..  "\123" .. ", but got " .. self.opening_brace)
  end
  self.data = self._io:read_bytes(self.len_data)
  self.closing_quote = self._io:read_bytes(1)
  if not(self.closing_quote == "\125") then
    error("not equal, expected " ..  "\125" .. ", but got " .. self.closing_quote)
  end
end

-- 
-- The length of the serialized data in bytes, parsed as an integer.
-- The braces are not counted in this length number.
PhpSerializedValue.CustomSerializedObjectContents.property.len_data = {}
function PhpSerializedValue.CustomSerializedObjectContents.property.len_data:get()
  if self._m_len_data ~= nil then
    return self._m_len_data
  end

  self._m_len_data = tonumber(self.len_data_dec)
  return self._m_len_data
end

-- 
-- The name of the object's class.
-- 
-- The length of the serialized data in bytes, in ASCII decimal.
-- The braces are not counted in this size number.
-- 
-- The custom serialized data. The braces are not included.
-- 
-- Although the surrounding braces make it look like a regular
-- serialized object, this field is actually more similar to a string:
-- it can contain arbitrary data that is not required to follow
-- any common structure.

-- 
-- The contents of a null value (`value_type::null`). This structure
-- contains no actual data, since there is only a single `NULL` value.
PhpSerializedValue.NullContents = class.class(KaitaiStruct)

function PhpSerializedValue.NullContents:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PhpSerializedValue.NullContents:_read()
  self.semicolon = self._io:read_bytes(1)
  if not(self.semicolon == "\059") then
    error("not equal, expected " ..  "\059" .. ", but got " .. self.semicolon)
  end
end


-- 
-- The contents of a PHP 3 object value. Unlike its counterpart in PHP 4
-- and above, it does not contain a class name.
PhpSerializedValue.Php3ObjectContents = class.class(KaitaiStruct)

function PhpSerializedValue.Php3ObjectContents:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PhpSerializedValue.Php3ObjectContents:_read()
  self.colon = self._io:read_bytes(1)
  if not(self.colon == "\058") then
    error("not equal, expected " ..  "\058" .. ", but got " .. self.colon)
  end
  self.properties = PhpSerializedValue.CountPrefixedMapping(self._io, self, self._root)
end

-- 
-- The object's properties. Keys must be of type `string`,
-- values may have any type.

-- 
-- The contents of a boolean value (`value_type::bool`).
PhpSerializedValue.BoolContents = class.class(KaitaiStruct)

function PhpSerializedValue.BoolContents:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PhpSerializedValue.BoolContents:_read()
  self.colon = self._io:read_bytes(1)
  if not(self.colon == "\058") then
    error("not equal, expected " ..  "\058" .. ", but got " .. self.colon)
  end
  self.value_dec = PhpSerializedValue.BoolValue(self._io:read_u1())
  self.semicolon = self._io:read_bytes(1)
  if not(self.semicolon == "\059") then
    error("not equal, expected " ..  "\059" .. ", but got " .. self.semicolon)
  end
end

-- 
-- The value of the `bool`, parsed as a boolean.
PhpSerializedValue.BoolContents.property.value = {}
function PhpSerializedValue.BoolContents.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = self.value_dec == PhpSerializedValue.BoolValue.true
  return self._m_value
end

-- 
-- The value of the `bool`: `0` for `false` or `1` for `true`.

-- 
-- The contents of a string value.
-- 
-- Note: PHP strings can contain arbitrary byte sequences.
-- They are not necessarily valid text in any specific encoding.
PhpSerializedValue.StringContents = class.class(KaitaiStruct)

function PhpSerializedValue.StringContents:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PhpSerializedValue.StringContents:_read()
  self.colon = self._io:read_bytes(1)
  if not(self.colon == "\058") then
    error("not equal, expected " ..  "\058" .. ", but got " .. self.colon)
  end
  self.string = PhpSerializedValue.LengthPrefixedQuotedString(self._io, self, self._root)
  self.semicolon = self._io:read_bytes(1)
  if not(self.semicolon == "\059") then
    error("not equal, expected " ..  "\059" .. ", but got " .. self.semicolon)
  end
end

-- 
-- The value of the string, as a byte array.
PhpSerializedValue.StringContents.property.value = {}
function PhpSerializedValue.StringContents.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = self.string.data
  return self._m_value
end


-- 
-- The contents of an integer-like value:
-- either an actual integer (`value_type::int`) or a reference
-- (`value_type::variable_reference`, `value_type::object_reference`).
PhpSerializedValue.IntContents = class.class(KaitaiStruct)

function PhpSerializedValue.IntContents:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PhpSerializedValue.IntContents:_read()
  self.colon = self._io:read_bytes(1)
  if not(self.colon == "\058") then
    error("not equal, expected " ..  "\058" .. ", but got " .. self.colon)
  end
  self.value_dec = str_decode.decode(self._io:read_bytes_term(59, false, true, true), "ASCII")
end

-- 
-- The value of the `int`, parsed as an integer.
PhpSerializedValue.IntContents.property.value = {}
function PhpSerializedValue.IntContents.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = tonumber(self.value_dec)
  return self._m_value
end

-- 
-- The value of the `int`, in ASCII decimal.

-- 
-- A mapping entry consisting of a key and a value.
PhpSerializedValue.MappingEntry = class.class(KaitaiStruct)

function PhpSerializedValue.MappingEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PhpSerializedValue.MappingEntry:_read()
  self.key = PhpSerializedValue(self._io)
  self.value = PhpSerializedValue(self._io)
end

-- 
-- The key of the entry.
-- 
-- The value of the entry.

