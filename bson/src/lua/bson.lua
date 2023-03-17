-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local enum = require("enum")
local str_decode = require("string_decode")

-- 
-- BSON, short for Binary JSON, is a binary-encoded serialization of JSON-like documents. Like JSON, BSON supports the embedding of documents and arrays within other documents and arrays. BSON also contains extensions that allow representation of data types that are not part of the JSON spec. For example, BSON has a Date type and a BinData type. BSON can be compared to binary interchange formats, like Protocol Buffers. BSON is more "schemaless" than Protocol Buffers, which can give it an advantage in flexibility but also a slight disadvantage in space efficiency (BSON has overhead for field names within the serialized data). BSON was designed to have the following three characteristics:
--   * Lightweight. Keeping spatial overhead to a minimum is important for any data representation format, especially when used over the network.
--   * Traversable. BSON is designed to be traversed easily. This is a vital property in its role as the primary data representation for MongoDB.
--   * Efficient. Encoding data to BSON and decoding from BSON can be performed very quickly in most languages due to the use of C data types.
Bson = class.class(KaitaiStruct)

function Bson:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Bson:_read()
  self.len = self._io:read_s4le()
  self._raw_fields = self._io:read_bytes((self.len - 5))
  local _io = KaitaiStream(stringstream(self._raw_fields))
  self.fields = Bson.ElementsList(_io, self, self._root)
  self.terminator = self._io:read_bytes(1)
  if not(self.terminator == "\000") then
    error("not equal, expected " ..  "\000" .. ", but got " .. self.terminator)
  end
end

-- 
-- Total number of bytes comprising the document.

-- 
-- Special internal type used by MongoDB replication and sharding. First 4 bytes are an increment, second 4 are a timestamp.
Bson.Timestamp = class.class(KaitaiStruct)

function Bson.Timestamp:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Bson.Timestamp:_read()
  self.increment = self._io:read_u4le()
  self.timestamp = self._io:read_u4le()
end


-- 
-- The BSON "binary" or "BinData" datatype is used to represent arrays of bytes. It is somewhat analogous to the Java notion of a ByteArray. BSON binary values have a subtype. This is used to indicate what kind of data is in the byte array. Subtypes from zero to 127 are predefined or reserved. Subtypes from 128-255 are user-defined.
Bson.BinData = class.class(KaitaiStruct)

Bson.BinData.Subtype = enum.Enum {
  generic = 0,
  function = 1,
  byte_array_deprecated = 2,
  uuid_deprecated = 3,
  uuid = 4,
  md5 = 5,
  custom = 128,
}

function Bson.BinData:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Bson.BinData:_read()
  self.len = self._io:read_s4le()
  self.subtype = Bson.BinData.Subtype(self._io:read_u1())
  local _on = self.subtype
  if _on == Bson.BinData.Subtype.byte_array_deprecated then
    self._raw_content = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = Bson.BinData.ByteArrayDeprecated(_io, self, self._root)
  else
    self.content = self._io:read_bytes(self.len)
  end
end


-- 
-- The BSON "binary" or "BinData" datatype is used to represent arrays of bytes. It is somewhat analogous to the Java notion of a ByteArray. BSON binary values have a subtype. This is used to indicate what kind of data is in the byte array. Subtypes from zero to 127 are predefined or reserved. Subtypes from 128-255 are user-defined.
Bson.BinData.ByteArrayDeprecated = class.class(KaitaiStruct)

function Bson.BinData.ByteArrayDeprecated:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Bson.BinData.ByteArrayDeprecated:_read()
  self.len = self._io:read_s4le()
  self.content = self._io:read_bytes(self.len)
end


Bson.ElementsList = class.class(KaitaiStruct)

function Bson.ElementsList:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Bson.ElementsList:_read()
  self.elements = {}
  local i = 0
  while not self._io:is_eof() do
    self.elements[i + 1] = Bson.Element(self._io, self, self._root)
    i = i + 1
  end
end


Bson.Cstring = class.class(KaitaiStruct)

function Bson.Cstring:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Bson.Cstring:_read()
  self.str = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "UTF-8")
end

-- 
-- MUST NOT contain '\x00', hence it is not full UTF-8.

Bson.String = class.class(KaitaiStruct)

function Bson.String:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Bson.String:_read()
  self.len = self._io:read_s4le()
  self.str = str_decode.decode(self._io:read_bytes((self.len - 1)), "UTF-8")
  self.terminator = self._io:read_bytes(1)
  if not(self.terminator == "\000") then
    error("not equal, expected " ..  "\000" .. ", but got " .. self.terminator)
  end
end


Bson.Element = class.class(KaitaiStruct)

Bson.Element.BsonType = enum.Enum {
  min_key = -1,
  end_of_object = 0,
  number_double = 1,
  string = 2,
  document = 3,
  array = 4,
  bin_data = 5,
  undefined = 6,
  object_id = 7,
  boolean = 8,
  utc_datetime = 9,
  jst_null = 10,
  reg_ex = 11,
  db_pointer = 12,
  javascript = 13,
  symbol = 14,
  code_with_scope = 15,
  number_int = 16,
  timestamp = 17,
  number_long = 18,
  number_decimal = 19,
  max_key = 127,
}

function Bson.Element:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Bson.Element:_read()
  self.type_byte = Bson.Element.BsonType(self._io:read_u1())
  self.name = Bson.Cstring(self._io, self, self._root)
  local _on = self.type_byte
  if _on == Bson.Element.BsonType.code_with_scope then
    self.content = Bson.CodeWithScope(self._io, self, self._root)
  elseif _on == Bson.Element.BsonType.reg_ex then
    self.content = Bson.RegEx(self._io, self, self._root)
  elseif _on == Bson.Element.BsonType.number_double then
    self.content = self._io:read_f8le()
  elseif _on == Bson.Element.BsonType.symbol then
    self.content = Bson.String(self._io, self, self._root)
  elseif _on == Bson.Element.BsonType.timestamp then
    self.content = Bson.Timestamp(self._io, self, self._root)
  elseif _on == Bson.Element.BsonType.number_int then
    self.content = self._io:read_s4le()
  elseif _on == Bson.Element.BsonType.document then
    self.content = Bson(self._io)
  elseif _on == Bson.Element.BsonType.object_id then
    self.content = Bson.ObjectId(self._io, self, self._root)
  elseif _on == Bson.Element.BsonType.javascript then
    self.content = Bson.String(self._io, self, self._root)
  elseif _on == Bson.Element.BsonType.utc_datetime then
    self.content = self._io:read_s8le()
  elseif _on == Bson.Element.BsonType.boolean then
    self.content = self._io:read_u1()
  elseif _on == Bson.Element.BsonType.number_long then
    self.content = self._io:read_s8le()
  elseif _on == Bson.Element.BsonType.bin_data then
    self.content = Bson.BinData(self._io, self, self._root)
  elseif _on == Bson.Element.BsonType.string then
    self.content = Bson.String(self._io, self, self._root)
  elseif _on == Bson.Element.BsonType.db_pointer then
    self.content = Bson.DbPointer(self._io, self, self._root)
  elseif _on == Bson.Element.BsonType.array then
    self.content = Bson(self._io)
  elseif _on == Bson.Element.BsonType.number_decimal then
    self.content = Bson.F16(self._io, self, self._root)
  end
end


Bson.DbPointer = class.class(KaitaiStruct)

function Bson.DbPointer:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Bson.DbPointer:_read()
  self.namespace = Bson.String(self._io, self, self._root)
  self.id = Bson.ObjectId(self._io, self, self._root)
end


-- 
-- Implements unsigned 24-bit (3 byte) integer.
Bson.U3 = class.class(KaitaiStruct)

function Bson.U3:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Bson.U3:_read()
  self.b1 = self._io:read_u1()
  self.b2 = self._io:read_u1()
  self.b3 = self._io:read_u1()
end

Bson.U3.property.value = {}
function Bson.U3.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = ((self.b1 | (self.b2 << 8)) | (self.b3 << 16))
  return self._m_value
end


Bson.CodeWithScope = class.class(KaitaiStruct)

function Bson.CodeWithScope:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Bson.CodeWithScope:_read()
  self.id = self._io:read_s4le()
  self.source = Bson.String(self._io, self, self._root)
  self.scope = Bson(self._io)
end

-- 
-- mapping from identifiers to values, representing the scope in which the string should be evaluated.

-- 
-- 128-bit IEEE 754-2008 decimal floating point.
Bson.F16 = class.class(KaitaiStruct)

function Bson.F16:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Bson.F16:_read()
  self.str = self._io:read_bits_int_be(1) ~= 0
  self.exponent = self._io:read_bits_int_be(15)
  self.significand_hi = self._io:read_bits_int_be(49)
  self._io:align_to_byte()
  self.significand_lo = self._io:read_u8le()
end


-- 
-- See also: Source (https://www.mongodb.com/docs/manual/reference/method/ObjectId/)
Bson.ObjectId = class.class(KaitaiStruct)

function Bson.ObjectId:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Bson.ObjectId:_read()
  self.epoch_time = self._io:read_u4le()
  self.machine_id = Bson.U3(self._io, self, self._root)
  self.process_id = self._io:read_u2le()
  self.counter = Bson.U3(self._io, self, self._root)
end

-- 
-- seconds since the Unix epoch.
-- 
-- counter, starting with a random value.

Bson.RegEx = class.class(KaitaiStruct)

function Bson.RegEx:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Bson.RegEx:_read()
  self.pattern = Bson.Cstring(self._io, self, self._root)
  self.options = Bson.Cstring(self._io, self, self._root)
end


