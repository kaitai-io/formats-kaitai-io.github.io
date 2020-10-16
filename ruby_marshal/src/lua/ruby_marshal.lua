-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")
local utils = require("utils")

-- 
-- Ruby's Marshal module allows serialization and deserialization of
-- many standard and arbitrary Ruby objects in a compact binary
-- format. It is relatively fast, available in stdlibs standard and
-- allows conservation of language-specific properties (such as symbols
-- or encoding-aware strings).
-- 
-- Feature-wise, it is comparable to other language-specific
-- implementations, such as:
-- 
-- * Java's
--   [Serializable](https://docs.oracle.com/javase/8/docs/api/java/io/Serializable.html)
-- * .NET
--   [BinaryFormatter](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.serialization.formatters.binary.binaryformatter)
-- * Python's
--   [marshal](https://docs.python.org/3/library/marshal.html),
--   [pickle](https://docs.python.org/3/library/pickle.html) and
--   [shelve](https://docs.python.org/3/library/shelve.html)
-- 
-- From internal perspective, serialized stream consists of a simple
-- magic header and a record.
-- See also: Source (https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Stream+Format)
RubyMarshal = class.class(KaitaiStruct)

RubyMarshal.Codes = enum.Enum {
  ruby_string = 34,
  const_nil = 48,
  ruby_symbol = 58,
  ruby_symbol_link = 59,
  const_false = 70,
  instance_var = 73,
  ruby_struct = 83,
  const_true = 84,
  ruby_array = 91,
  packed_int = 105,
  bignum = 108,
  ruby_hash = 123,
}

function RubyMarshal:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RubyMarshal:_read()
  self.version = self._io:read_bytes(2)
  if not(self.version == "\004\008") then
    error("not equal, expected " ..  "\004\008" .. ", but got " .. self.version)
  end
  self.records = RubyMarshal.Record(self._io, self, self._root)
end


RubyMarshal.RubyArray = class.class(KaitaiStruct)

function RubyMarshal.RubyArray:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RubyMarshal.RubyArray:_read()
  self.num_elements = RubyMarshal.PackedInt(self._io, self, self._root)
  self.elements = {}
  for i = 0, self.num_elements.value - 1 do
    self.elements[i + 1] = RubyMarshal.Record(self._io, self, self._root)
  end
end


-- 
-- See also: Source (https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Bignum)
RubyMarshal.Bignum = class.class(KaitaiStruct)

function RubyMarshal.Bignum:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RubyMarshal.Bignum:_read()
  self.sign = self._io:read_u1()
  self.len_div_2 = RubyMarshal.PackedInt(self._io, self, self._root)
  self.body = self._io:read_bytes((self.len_div_2.value * 2))
end

-- 
-- A single byte containing `+` for a positive value or `-` for a negative value.
-- 
-- Length of bignum body, divided by 2.
-- 
-- Bytes that represent the number, see ruby-lang.org docs for reconstruction algorithm.

-- 
-- See also: Source (https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Struct)
RubyMarshal.RubyStruct = class.class(KaitaiStruct)

function RubyMarshal.RubyStruct:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RubyMarshal.RubyStruct:_read()
  self.name = RubyMarshal.Record(self._io, self, self._root)
  self.num_members = RubyMarshal.PackedInt(self._io, self, self._root)
  self.members = {}
  for i = 0, self.num_members.value - 1 do
    self.members[i + 1] = RubyMarshal.Pair(self._io, self, self._root)
  end
end

-- 
-- Symbol containing the name of the struct.
-- 
-- Number of members in a struct.

-- 
-- See also: Source (https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Symbols+and+Byte+Sequence)
RubyMarshal.RubySymbol = class.class(KaitaiStruct)

function RubyMarshal.RubySymbol:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RubyMarshal.RubySymbol:_read()
  self.len = RubyMarshal.PackedInt(self._io, self, self._root)
  self.name = str_decode.decode(self._io:read_bytes(self.len.value), "UTF-8")
end


-- 
-- Ruby uses sophisticated system to pack integers: first `code`
-- byte either determines packing scheme or carries encoded
-- immediate value (thus allowing smaller values from -123 to 122
-- (inclusive) to take only one byte. There are 11 encoding schemes
-- in total:
-- 
-- * 0 is encoded specially (as 0)
-- * 1..122 are encoded as immediate value with a shift
-- * 123..255 are encoded with code of 0x01 and 1 extra byte
-- * 0x100..0xffff are encoded with code of 0x02 and 2 extra bytes
-- * 0x10000..0xffffff are encoded with code of 0x03 and 3 extra
--   bytes
-- * 0x1000000..0xffffffff are encoded with code of 0x04 and 4
--   extra bytes
-- * -123..-1 are encoded as immediate value with another shift
-- * -256..-124 are encoded with code of 0xff and 1 extra byte
-- * -0x10000..-257 are encoded with code of 0xfe and 2 extra bytes
-- * -0x1000000..0x10001 are encoded with code of 0xfd and 3 extra
--    bytes
-- * -0x40000000..-0x1000001 are encoded with code of 0xfc and 4
--    extra bytes
-- 
-- Values beyond that are serialized as bignum (even if they
-- technically might be not Bignum class in Ruby implementation,
-- i.e. if they fit into 64 bits on a 64-bit platform).
-- See also: Source (https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Fixnum+and+long)
RubyMarshal.PackedInt = class.class(KaitaiStruct)

function RubyMarshal.PackedInt:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RubyMarshal.PackedInt:_read()
  self.code = self._io:read_u1()
  local _on = self.code
  if _on == 4 then
    self.encoded = self._io:read_u4le()
  elseif _on == 1 then
    self.encoded = self._io:read_u1()
  elseif _on == 252 then
    self.encoded = self._io:read_u4le()
  elseif _on == 253 then
    self.encoded = self._io:read_u2le()
  elseif _on == 3 then
    self.encoded = self._io:read_u2le()
  elseif _on == 2 then
    self.encoded = self._io:read_u2le()
  elseif _on == 255 then
    self.encoded = self._io:read_u1()
  elseif _on == 254 then
    self.encoded = self._io:read_u2le()
  end
  local _on = self.code
  if _on == 3 then
    self.encoded2 = self._io:read_u1()
  elseif _on == 253 then
    self.encoded2 = self._io:read_u1()
  end
end

RubyMarshal.PackedInt.property.is_immediate = {}
function RubyMarshal.PackedInt.property.is_immediate:get()
  if self._m_is_immediate ~= nil then
    return self._m_is_immediate
  end

  self._m_is_immediate =  ((self.code > 4) and (self.code < 252)) 
  return self._m_is_immediate
end

RubyMarshal.PackedInt.property.value = {}
function RubyMarshal.PackedInt.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = utils.box_unwrap((self.is_immediate) and utils.box_wrap(utils.box_unwrap((self.code < 128) and utils.box_wrap((self.code - 5)) or ((4 - (~(self.code) & 127))))) or (utils.box_unwrap((self.code == 0) and utils.box_wrap(0) or (utils.box_unwrap((self.code == 255) and utils.box_wrap((self.encoded - 256)) or (utils.box_unwrap((self.code == 254) and utils.box_wrap((self.encoded - 65536)) or (utils.box_unwrap((self.code == 253) and utils.box_wrap((((self.encoded2 << 16) | self.encoded) - 16777216)) or (utils.box_unwrap((self.code == 3) and utils.box_wrap(((self.encoded2 << 16) | self.encoded)) or (self.encoded))))))))))))
  return self._m_value
end

-- 
-- One extra byte for 3-byte integers (0x03 and 0xfd), as
-- there is no standard `u3` type in KS.

RubyMarshal.Pair = class.class(KaitaiStruct)

function RubyMarshal.Pair:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RubyMarshal.Pair:_read()
  self.key = RubyMarshal.Record(self._io, self, self._root)
  self.value = RubyMarshal.Record(self._io, self, self._root)
end


-- 
-- See also: Source (https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Instance+Variables)
RubyMarshal.InstanceVar = class.class(KaitaiStruct)

function RubyMarshal.InstanceVar:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RubyMarshal.InstanceVar:_read()
  self.obj = RubyMarshal.Record(self._io, self, self._root)
  self.num_vars = RubyMarshal.PackedInt(self._io, self, self._root)
  self.vars = {}
  for i = 0, self.num_vars.value - 1 do
    self.vars[i + 1] = RubyMarshal.Pair(self._io, self, self._root)
  end
end


-- 
-- Each record starts with a single byte that determines its type
-- (`code`) and contents. If necessary, additional info as parsed
-- as `body`, to be determined by `code`.
RubyMarshal.Record = class.class(KaitaiStruct)

function RubyMarshal.Record:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RubyMarshal.Record:_read()
  self.code = RubyMarshal.Codes(self._io:read_u1())
  local _on = self.code
  if _on == RubyMarshal.Codes.packed_int then
    self.body = RubyMarshal.PackedInt(self._io, self, self._root)
  elseif _on == RubyMarshal.Codes.bignum then
    self.body = RubyMarshal.Bignum(self._io, self, self._root)
  elseif _on == RubyMarshal.Codes.ruby_array then
    self.body = RubyMarshal.RubyArray(self._io, self, self._root)
  elseif _on == RubyMarshal.Codes.ruby_symbol_link then
    self.body = RubyMarshal.PackedInt(self._io, self, self._root)
  elseif _on == RubyMarshal.Codes.ruby_struct then
    self.body = RubyMarshal.RubyStruct(self._io, self, self._root)
  elseif _on == RubyMarshal.Codes.ruby_string then
    self.body = RubyMarshal.RubyString(self._io, self, self._root)
  elseif _on == RubyMarshal.Codes.instance_var then
    self.body = RubyMarshal.InstanceVar(self._io, self, self._root)
  elseif _on == RubyMarshal.Codes.ruby_hash then
    self.body = RubyMarshal.RubyHash(self._io, self, self._root)
  elseif _on == RubyMarshal.Codes.ruby_symbol then
    self.body = RubyMarshal.RubySymbol(self._io, self, self._root)
  end
end


-- 
-- See also: Source (https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Hash+and+Hash+with+Default+Value)
RubyMarshal.RubyHash = class.class(KaitaiStruct)

function RubyMarshal.RubyHash:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RubyMarshal.RubyHash:_read()
  self.num_pairs = RubyMarshal.PackedInt(self._io, self, self._root)
  self.pairs = {}
  for i = 0, self.num_pairs.value - 1 do
    self.pairs[i + 1] = RubyMarshal.Pair(self._io, self, self._root)
  end
end


-- 
-- See also: Source (https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-String)
RubyMarshal.RubyString = class.class(KaitaiStruct)

function RubyMarshal.RubyString:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RubyMarshal.RubyString:_read()
  self.len = RubyMarshal.PackedInt(self._io, self, self._root)
  self.body = self._io:read_bytes(self.len.value)
end


