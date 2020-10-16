-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")
local utils = require("utils")

-- 
-- MessagePack (msgpack) is a system to serialize arbitrary structured
-- data into a compact binary stream.
-- See also: Source (https://github.com/msgpack/msgpack/blob/master/spec.md)
Msgpack = class.class(KaitaiStruct)

function Msgpack:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Msgpack:_read()
  self.b1 = self._io:read_u1()
  local _on = self.b1
  if _on == 211 then
    self.int_extra = self._io:read_s8be()
  elseif _on == 209 then
    self.int_extra = self._io:read_s2be()
  elseif _on == 210 then
    self.int_extra = self._io:read_s4be()
  elseif _on == 208 then
    self.int_extra = self._io:read_s1()
  elseif _on == 205 then
    self.int_extra = self._io:read_u2be()
  elseif _on == 207 then
    self.int_extra = self._io:read_u8be()
  elseif _on == 204 then
    self.int_extra = self._io:read_u1()
  elseif _on == 206 then
    self.int_extra = self._io:read_u4be()
  end
  if self.is_float_32 then
    self.float_32_value = self._io:read_f4be()
  end
  if self.is_float_64 then
    self.float_64_value = self._io:read_f8be()
  end
  if self.is_str_8 then
    self.str_len_8 = self._io:read_u1()
  end
  if self.is_str_16 then
    self.str_len_16 = self._io:read_u2be()
  end
  if self.is_str_32 then
    self.str_len_32 = self._io:read_u4be()
  end
  if self.is_str then
    self.str_value = str_decode.decode(self._io:read_bytes(self.str_len), "UTF-8")
  end
  if self.is_array_16 then
    self.num_array_elements_16 = self._io:read_u2be()
  end
  if self.is_array_32 then
    self.num_array_elements_32 = self._io:read_u4be()
  end
  if self.is_array then
    self.array_elements = {}
    for i = 0, self.num_array_elements - 1 do
      self.array_elements[i + 1] = Msgpack(self._io)
    end
  end
  if self.is_map_16 then
    self.num_map_elements_16 = self._io:read_u2be()
  end
  if self.is_map_32 then
    self.num_map_elements_32 = self._io:read_u4be()
  end
  if self.is_map then
    self.map_elements = {}
    for i = 0, self.num_map_elements - 1 do
      self.map_elements[i + 1] = Msgpack.MapTuple(self._io, self, self._root)
    end
  end
end

-- 
-- See also: Source (https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array)
Msgpack.property.is_array_32 = {}
function Msgpack.property.is_array_32:get()
  if self._m_is_array_32 ~= nil then
    return self._m_is_array_32
  end

  self._m_is_array_32 = self.b1 == 221
  return self._m_is_array_32
end

Msgpack.property.int_value = {}
function Msgpack.property.int_value:get()
  if self._m_int_value ~= nil then
    return self._m_int_value
  end

  if self.is_int then
    self._m_int_value = utils.box_unwrap((self.is_pos_int7) and utils.box_wrap(self.pos_int7_value) or (utils.box_unwrap((self.is_neg_int5) and utils.box_wrap(self.neg_int5_value) or (4919))))
  end
  return self._m_int_value
end

Msgpack.property.str_len = {}
function Msgpack.property.str_len:get()
  if self._m_str_len ~= nil then
    return self._m_str_len
  end

  if self.is_str then
    self._m_str_len = utils.box_unwrap((self.is_fix_str) and utils.box_wrap((self.b1 & 31)) or (utils.box_unwrap((self.is_str_8) and utils.box_wrap(self.str_len_8) or (utils.box_unwrap((self.is_str_16) and utils.box_wrap(self.str_len_16) or (self.str_len_32))))))
  end
  return self._m_str_len
end

-- 
-- See also: Source (https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array)
Msgpack.property.is_fix_array = {}
function Msgpack.property.is_fix_array:get()
  if self._m_is_fix_array ~= nil then
    return self._m_is_fix_array
  end

  self._m_is_fix_array = (self.b1 & 240) == 144
  return self._m_is_fix_array
end

-- 
-- See also: Source (https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map)
Msgpack.property.is_map = {}
function Msgpack.property.is_map:get()
  if self._m_is_map ~= nil then
    return self._m_is_map
  end

  self._m_is_map =  ((self.is_fix_map) or (self.is_map_16) or (self.is_map_32)) 
  return self._m_is_map
end

-- 
-- See also: Source (https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array)
Msgpack.property.is_array = {}
function Msgpack.property.is_array:get()
  if self._m_is_array ~= nil then
    return self._m_is_array
  end

  self._m_is_array =  ((self.is_fix_array) or (self.is_array_16) or (self.is_array_32)) 
  return self._m_is_array
end

Msgpack.property.is_float = {}
function Msgpack.property.is_float:get()
  if self._m_is_float ~= nil then
    return self._m_is_float
  end

  self._m_is_float =  ((self.is_float_32) or (self.is_float_64)) 
  return self._m_is_float
end

-- 
-- See also: Source (https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str)
Msgpack.property.is_str_8 = {}
function Msgpack.property.is_str_8:get()
  if self._m_is_str_8 ~= nil then
    return self._m_is_str_8
  end

  self._m_is_str_8 = self.b1 == 217
  return self._m_is_str_8
end

-- 
-- See also: Source (https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map)
Msgpack.property.is_fix_map = {}
function Msgpack.property.is_fix_map:get()
  if self._m_is_fix_map ~= nil then
    return self._m_is_fix_map
  end

  self._m_is_fix_map = (self.b1 & 240) == 128
  return self._m_is_fix_map
end

Msgpack.property.is_int = {}
function Msgpack.property.is_int:get()
  if self._m_is_int ~= nil then
    return self._m_is_int
  end

  self._m_is_int =  ((self.is_pos_int7) or (self.is_neg_int5)) 
  return self._m_is_int
end

Msgpack.property.is_bool = {}
function Msgpack.property.is_bool:get()
  if self._m_is_bool ~= nil then
    return self._m_is_bool
  end

  self._m_is_bool =  ((self.b1 == 194) or (self.b1 == 195)) 
  return self._m_is_bool
end

-- 
-- See also: Source (https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str)
Msgpack.property.is_str_16 = {}
function Msgpack.property.is_str_16:get()
  if self._m_is_str_16 ~= nil then
    return self._m_is_str_16
  end

  self._m_is_str_16 = self.b1 == 218
  return self._m_is_str_16
end

-- 
-- See also: Source (https://github.com/msgpack/msgpack/blob/master/spec.md#formats-float)
Msgpack.property.is_float_64 = {}
function Msgpack.property.is_float_64:get()
  if self._m_is_float_64 ~= nil then
    return self._m_is_float_64
  end

  self._m_is_float_64 = self.b1 == 203
  return self._m_is_float_64
end

-- 
-- See also: Source (https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map)
Msgpack.property.is_map_16 = {}
function Msgpack.property.is_map_16:get()
  if self._m_is_map_16 ~= nil then
    return self._m_is_map_16
  end

  self._m_is_map_16 = self.b1 == 222
  return self._m_is_map_16
end

Msgpack.property.is_neg_int5 = {}
function Msgpack.property.is_neg_int5:get()
  if self._m_is_neg_int5 ~= nil then
    return self._m_is_neg_int5
  end

  self._m_is_neg_int5 = (self.b1 & 224) == 224
  return self._m_is_neg_int5
end

Msgpack.property.pos_int7_value = {}
function Msgpack.property.pos_int7_value:get()
  if self._m_pos_int7_value ~= nil then
    return self._m_pos_int7_value
  end

  if self.is_pos_int7 then
    self._m_pos_int7_value = self.b1
  end
  return self._m_pos_int7_value
end

-- 
-- See also: Source (https://github.com/msgpack/msgpack/blob/master/spec.md#formats-nil)
Msgpack.property.is_nil = {}
function Msgpack.property.is_nil:get()
  if self._m_is_nil ~= nil then
    return self._m_is_nil
  end

  self._m_is_nil = self.b1 == 192
  return self._m_is_nil
end

Msgpack.property.float_value = {}
function Msgpack.property.float_value:get()
  if self._m_float_value ~= nil then
    return self._m_float_value
  end

  if self.is_float then
    self._m_float_value = utils.box_unwrap((self.is_float_32) and utils.box_wrap(self.float_32_value) or (self.float_64_value))
  end
  return self._m_float_value
end

-- 
-- See also: Source (https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array)
Msgpack.property.num_array_elements = {}
function Msgpack.property.num_array_elements:get()
  if self._m_num_array_elements ~= nil then
    return self._m_num_array_elements
  end

  if self.is_array then
    self._m_num_array_elements = utils.box_unwrap((self.is_fix_array) and utils.box_wrap((self.b1 & 15)) or (utils.box_unwrap((self.is_array_16) and utils.box_wrap(self.num_array_elements_16) or (self.num_array_elements_32))))
  end
  return self._m_num_array_elements
end

Msgpack.property.neg_int5_value = {}
function Msgpack.property.neg_int5_value:get()
  if self._m_neg_int5_value ~= nil then
    return self._m_neg_int5_value
  end

  if self.is_neg_int5 then
    self._m_neg_int5_value = -((self.b1 & 31))
  end
  return self._m_neg_int5_value
end

-- 
-- See also: Source (https://github.com/msgpack/msgpack/blob/master/spec.md#formats-bool)
Msgpack.property.bool_value = {}
function Msgpack.property.bool_value:get()
  if self._m_bool_value ~= nil then
    return self._m_bool_value
  end

  if self.is_bool then
    self._m_bool_value = self.b1 == 195
  end
  return self._m_bool_value
end

Msgpack.property.is_pos_int7 = {}
function Msgpack.property.is_pos_int7:get()
  if self._m_is_pos_int7 ~= nil then
    return self._m_is_pos_int7
  end

  self._m_is_pos_int7 = (self.b1 & 128) == 0
  return self._m_is_pos_int7
end

-- 
-- See also: Source (https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array)
Msgpack.property.is_array_16 = {}
function Msgpack.property.is_array_16:get()
  if self._m_is_array_16 ~= nil then
    return self._m_is_array_16
  end

  self._m_is_array_16 = self.b1 == 220
  return self._m_is_array_16
end

Msgpack.property.is_str = {}
function Msgpack.property.is_str:get()
  if self._m_is_str ~= nil then
    return self._m_is_str
  end

  self._m_is_str =  ((self.is_fix_str) or (self.is_str_8) or (self.is_str_16) or (self.is_str_32)) 
  return self._m_is_str
end

-- 
-- See also: Source (https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str)
Msgpack.property.is_fix_str = {}
function Msgpack.property.is_fix_str:get()
  if self._m_is_fix_str ~= nil then
    return self._m_is_fix_str
  end

  self._m_is_fix_str = (self.b1 & 224) == 160
  return self._m_is_fix_str
end

-- 
-- See also: Source (https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str)
Msgpack.property.is_str_32 = {}
function Msgpack.property.is_str_32:get()
  if self._m_is_str_32 ~= nil then
    return self._m_is_str_32
  end

  self._m_is_str_32 = self.b1 == 219
  return self._m_is_str_32
end

-- 
-- See also: Source (https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map)
Msgpack.property.num_map_elements = {}
function Msgpack.property.num_map_elements:get()
  if self._m_num_map_elements ~= nil then
    return self._m_num_map_elements
  end

  if self.is_map then
    self._m_num_map_elements = utils.box_unwrap((self.is_fix_map) and utils.box_wrap((self.b1 & 15)) or (utils.box_unwrap((self.is_map_16) and utils.box_wrap(self.num_map_elements_16) or (self.num_map_elements_32))))
  end
  return self._m_num_map_elements
end

-- 
-- See also: Source (https://github.com/msgpack/msgpack/blob/master/spec.md#formats-float)
Msgpack.property.is_float_32 = {}
function Msgpack.property.is_float_32:get()
  if self._m_is_float_32 ~= nil then
    return self._m_is_float_32
  end

  self._m_is_float_32 = self.b1 == 202
  return self._m_is_float_32
end

-- 
-- See also: Source (https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map)
Msgpack.property.is_map_32 = {}
function Msgpack.property.is_map_32:get()
  if self._m_is_map_32 ~= nil then
    return self._m_is_map_32
  end

  self._m_is_map_32 = self.b1 == 223
  return self._m_is_map_32
end

-- 
-- First byte is msgpack message is either a piece of data by
-- itself or determines types of further, more complex data
-- structures.

Msgpack.MapTuple = class.class(KaitaiStruct)

function Msgpack.MapTuple:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Msgpack.MapTuple:_read()
  self.key = Msgpack(self._io)
  self.value = Msgpack(self._io)
end


