-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local utils = require("utils")
local str_decode = require("string_decode")

-- 
-- GGUF is the file format of the [ggml](https://github.com/ggml-org/ggml)
-- tensor library for storing machine learning models, used for example by
-- [llama.cpp](https://github.com/ggml-org/llama.cpp) for inference. It
-- replaced the older GGML, GGMF and GGJT formats.
-- 
-- A GGUF file consists of a header with metadata as key-value pairs (model
-- architecture, hyperparameters, tokenizer, etc.), a description of each
-- tensor (name, dimensions, type and offset), and finally the tensor data.
-- See also: Git tag "v0.27.0" (https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md)
Gguf = class.class(KaitaiStruct)

Gguf.GgmlType = enum.Enum {
  f32 = 0,
  f16 = 1,
  q4_0 = 2,
  q4_1 = 3,
  q4_2 = 4,
  q4_3 = 5,
  q5_0 = 6,
  q5_1 = 7,
  q8_0 = 8,
  q8_1 = 9,
  q2_k = 10,
  q3_k = 11,
  q4_k = 12,
  q5_k = 13,
  q6_k = 14,
  q8_k = 15,
  iq2_xxs = 16,
  iq2_xs = 17,
  iq3_xxs = 18,
  iq1_s = 19,
  iq4_nl = 20,
  iq3_s = 21,
  iq2_s = 22,
  iq4_xs = 23,
  i8 = 24,
  i16 = 25,
  i32 = 26,
  i64 = 27,
  f64 = 28,
  iq1_m = 29,
  bf16 = 30,
  q4_0_4_4 = 31,
  q4_0_4_8 = 32,
  q4_0_8_8 = 33,
  tq1_0 = 34,
  tq2_0 = 35,
  iq4_nl_4_4 = 36,
  iq4_nl_4_8 = 37,
  iq4_nl_8_8 = 38,
  mxfp4 = 39,
  nvfp4 = 40,
  q1_0 = 41,
  q2_0 = 42,
}

Gguf.GgufType = enum.Enum {
  uint8 = 0,
  int8 = 1,
  uint16 = 2,
  int16 = 3,
  uint32 = 4,
  int32 = 5,
  float32 = 6,
  bool = 7,
  string = 8,
  array = 9,
  uint64 = 10,
  int64 = 11,
  float64 = 12,
}

function Gguf:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gguf:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\071\071\085\070") then
    error("not equal, expected " .. "\071\071\085\070" .. ", but got " .. self.magic)
  end
  self.body = Gguf.GgufBody(self._io, self, self._root)
end

Gguf.property.is_big_endian = {}
function Gguf.property.is_big_endian:get()
  if self._m_is_big_endian ~= nil then
    return self._m_is_big_endian
  end

  self._m_is_big_endian = self.version_le & 65535 == 0
  return self._m_is_big_endian
end

-- 
-- Length of the file (computed from the header), including the padding after
-- the last tensor's data.
-- 
-- This Kaitai Struct implementation stops parsing where the tensor data
-- starts (which is read lazily, i.e. only on demand). Without reading the
-- tensor data, you can use this expected file size to check whether the file
-- has been truncated, to carve the file out of a larger one, etc.
Gguf.property.len_file = {}
function Gguf.property.len_file:get()
  if self._m_len_file ~= nil then
    return self._m_len_file
  end

  self._m_len_file = (self.body.ofs_tensor_data + utils.box_unwrap((self.body.num_tensor_infos ~= 0) and utils.box_wrap(self.body.tensor_infos[#self.body.tensor_infos].expected_next_offset) or (0)))
  return self._m_len_file
end

Gguf.property.version_le = {}
function Gguf.property.version_le:get()
  if self._m_version_le ~= nil then
    return self._m_version_le
  end

  local _pos = self._io:pos()
  self._io:seek(4)
  self._m_version_le = self._io:read_u4le()
  self._io:seek(_pos)
  return self._m_version_le
end

-- 
-- GGUF file magic.

Gguf.GgufBody = class.class(KaitaiStruct)

function Gguf.GgufBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Gguf.GgufBody:_read()
  local _on = self._root.is_big_endian
  if _on == true then
    self._is_le = false
  elseif _on == false then
    self._is_le = true
  end

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Gguf.GgufBody:_read_le()
  self.version = self._io:read_u4le()
  if not(self.version >= 2) then
    error("ValidationLessThanError")
  end
  if not(self.version <= 3) then
    error("ValidationGreaterThanError")
  end
  self.num_tensor_infos = self._io:read_u8le()
  self.num_kv_pairs = self._io:read_u8le()
  self.kv_pairs = {}
  for i = 0, self.num_kv_pairs - 1 do
    self.kv_pairs[i + 1] = Gguf.GgufBody.GgufKv(utils.box_unwrap((i ~= 0) and utils.box_wrap(self.kv_pairs[(i - 1) + 1].alignment) or (32)), self._io, self, self._root, self._is_le)
  end
  self.tensor_infos = {}
  for i = 0, self.num_tensor_infos - 1 do
    self.tensor_infos[i + 1] = Gguf.GgufBody.GgufTensorInfo(utils.box_unwrap((i ~= 0) and utils.box_wrap(self.tensor_infos[(i - 1) + 1].expected_next_offset) or (0)), self._io, self, self._root, self._is_le)
  end
  if self.num_tensor_infos ~= 0 then
    self.padding = self._io:read_bytes((self.alignment - self._io:pos() % self.alignment) % self.alignment)
  end
  if self.ofs_tensor_data < 0 then
    self._unnamed6 = self._io:read_bytes(0)
  end
end

function Gguf.GgufBody:_read_be()
  self.version = self._io:read_u4be()
  if not(self.version >= 2) then
    error("ValidationLessThanError")
  end
  if not(self.version <= 3) then
    error("ValidationGreaterThanError")
  end
  self.num_tensor_infos = self._io:read_u8be()
  self.num_kv_pairs = self._io:read_u8be()
  self.kv_pairs = {}
  for i = 0, self.num_kv_pairs - 1 do
    self.kv_pairs[i + 1] = Gguf.GgufBody.GgufKv(utils.box_unwrap((i ~= 0) and utils.box_wrap(self.kv_pairs[(i - 1) + 1].alignment) or (32)), self._io, self, self._root, self._is_le)
  end
  self.tensor_infos = {}
  for i = 0, self.num_tensor_infos - 1 do
    self.tensor_infos[i + 1] = Gguf.GgufBody.GgufTensorInfo(utils.box_unwrap((i ~= 0) and utils.box_wrap(self.tensor_infos[(i - 1) + 1].expected_next_offset) or (0)), self._io, self, self._root, self._is_le)
  end
  if self.num_tensor_infos ~= 0 then
    self.padding = self._io:read_bytes((self.alignment - self._io:pos() % self.alignment) % self.alignment)
  end
  if self.ofs_tensor_data < 0 then
    self._unnamed6 = self._io:read_bytes(0)
  end
end

-- 
-- Global alignment - from the `general.alignment` key, or 32 if there's no
-- such key.
-- See also: Git tag "v0.27.0" (https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L622-L630)
Gguf.GgufBody.property.alignment = {}
function Gguf.GgufBody.property.alignment:get()
  if self._m_alignment ~= nil then
    return self._m_alignment
  end

  self._m_alignment = utils.box_unwrap((#self.kv_pairs ~= 0) and utils.box_wrap(self.kv_pairs[#self.kv_pairs].alignment) or (32))
  return self._m_alignment
end

-- 
-- Offset of the tensor data. Each tensor's `offset` is relative to this
-- position.
Gguf.GgufBody.property.ofs_tensor_data = {}
function Gguf.GgufBody.property.ofs_tensor_data:get()
  if self._m_ofs_tensor_data ~= nil then
    return self._m_ofs_tensor_data
  end

  self._m_ofs_tensor_data = self._io:pos()
  return self._m_ofs_tensor_data
end

-- 
-- File format version. Version 1 used 32-bit counts and lengths, which
-- this Kaitai Struct implementation doesn't support, and neither does
-- ggml.
-- 
-- The number of tensors in the file.
-- 
-- The number of key-value pairs in the file header.
-- 
-- Key-value pairs. ggml (v0.27.0)
-- [rejects](https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L575-L578)
-- duplicate keys, but this Kaitai Struct implementation can't detect
-- them. If there are multiple `general.alignment` keys, the last one is
-- used for the `alignment` value instance.
-- 
-- Tensor metadata. ggml (v0.27.0)
-- [rejects](https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L664-L669)
-- duplicate tensor names, but this Kaitai Struct implementation can't
-- detect them.
-- 
-- See also: Git tag "v0.27.0" (https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L780-L785)

-- 
-- Nested arrays are supported. Although ggml (v0.27.0) doesn't support them,
-- they are explicitly allowed by `gguf.md` - see
-- <https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L221>.
Gguf.GgufBody.GgufArray = class.class(KaitaiStruct)

function Gguf.GgufBody.GgufArray:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Gguf.GgufBody.GgufArray:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Gguf.GgufBody.GgufArray:_read_le()
  self.type = Gguf.GgufType(self._io:read_u4le())
  if self.type == nil then
    error("ValidationNotInEnumError")
  end
  self.num_elems = self._io:read_u8le()
  self.elems = {}
  for i = 0, self.num_elems - 1 do
    self.elems[i + 1] = Gguf.GgufBody.GgufValue(self.type, self._io, self, self._root, self._is_le)
  end
end

function Gguf.GgufBody.GgufArray:_read_be()
  self.type = Gguf.GgufType(self._io:read_u4be())
  if self.type == nil then
    error("ValidationNotInEnumError")
  end
  self.num_elems = self._io:read_u8be()
  self.elems = {}
  for i = 0, self.num_elems - 1 do
    self.elems[i + 1] = Gguf.GgufBody.GgufValue(self.type, self._io, self, self._root, self._is_le)
  end
end


Gguf.GgufBody.GgufBool = class.class(KaitaiStruct)

function Gguf.GgufBody.GgufBool:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Gguf.GgufBody.GgufBool:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Gguf.GgufBody.GgufBool:_read_le()
  self.value_raw = self._io:read_u1()
  if not(self.value_raw <= 1) then
    error("ValidationGreaterThanError")
  end
end

function Gguf.GgufBody.GgufBool:_read_be()
  self.value_raw = self._io:read_u1()
  if not(self.value_raw <= 1) then
    error("ValidationGreaterThanError")
  end
end

-- 
-- See also: Git tag "v0.27.0" (https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L321)
Gguf.GgufBody.GgufBool.property.value = {}
function Gguf.GgufBody.GgufBool.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = self.value_raw ~= 0
  return self._m_value
end


Gguf.GgufBody.GgufFloat32 = class.class(KaitaiStruct)

function Gguf.GgufBody.GgufFloat32:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Gguf.GgufBody.GgufFloat32:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Gguf.GgufBody.GgufFloat32:_read_le()
  self.value = self._io:read_f4le()
end

function Gguf.GgufBody.GgufFloat32:_read_be()
  self.value = self._io:read_f4be()
end


Gguf.GgufBody.GgufFloat64 = class.class(KaitaiStruct)

function Gguf.GgufBody.GgufFloat64:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Gguf.GgufBody.GgufFloat64:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Gguf.GgufBody.GgufFloat64:_read_le()
  self.value = self._io:read_f8le()
end

function Gguf.GgufBody.GgufFloat64:_read_be()
  self.value = self._io:read_f8be()
end


Gguf.GgufBody.GgufInt16 = class.class(KaitaiStruct)

function Gguf.GgufBody.GgufInt16:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Gguf.GgufBody.GgufInt16:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Gguf.GgufBody.GgufInt16:_read_le()
  self.value = self._io:read_s2le()
end

function Gguf.GgufBody.GgufInt16:_read_be()
  self.value = self._io:read_s2be()
end


Gguf.GgufBody.GgufInt32 = class.class(KaitaiStruct)

function Gguf.GgufBody.GgufInt32:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Gguf.GgufBody.GgufInt32:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Gguf.GgufBody.GgufInt32:_read_le()
  self.value = self._io:read_s4le()
end

function Gguf.GgufBody.GgufInt32:_read_be()
  self.value = self._io:read_s4be()
end


Gguf.GgufBody.GgufInt64 = class.class(KaitaiStruct)

function Gguf.GgufBody.GgufInt64:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Gguf.GgufBody.GgufInt64:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Gguf.GgufBody.GgufInt64:_read_le()
  self.value = self._io:read_s8le()
end

function Gguf.GgufBody.GgufInt64:_read_be()
  self.value = self._io:read_s8be()
end


Gguf.GgufBody.GgufInt8 = class.class(KaitaiStruct)

function Gguf.GgufBody.GgufInt8:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Gguf.GgufBody.GgufInt8:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Gguf.GgufBody.GgufInt8:_read_le()
  self.value = self._io:read_s1()
end

function Gguf.GgufBody.GgufInt8:_read_be()
  self.value = self._io:read_s1()
end


-- 
-- See also: Git tag "v0.27.0" (https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L262-L275)
Gguf.GgufBody.GgufKv = class.class(KaitaiStruct)

function Gguf.GgufBody.GgufKv:_init(prev_alignment, io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self.prev_alignment = prev_alignment
  self:_read()
end

function Gguf.GgufBody.GgufKv:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Gguf.GgufBody.GgufKv:_read_le()
  self.key = Gguf.GgufBody.GgufStr(self._io, self, self._root, self._is_le)
  local _ = self.key
  if not(_.len_value ~= 0) then
    error("ValidationExprError")
  end
  self.type = Gguf.GgufType(self._io:read_u4le())
  if self.type == nil then
    error("ValidationNotInEnumError")
  end
  self.value = Gguf.GgufBody.GgufValue(self.type, self._io, self, self._root, self._is_le)
  local _ = self.value
  if not(utils.box_unwrap((self.key.value == "general.alignment") and utils.box_wrap( ((self.type == Gguf.GgufType.uint32) and (_.value.value ~= 0) and (_.value.value & _.value.value - 1 == 0)) ) or (true))) then
    error("ValidationExprError")
  end
end

function Gguf.GgufBody.GgufKv:_read_be()
  self.key = Gguf.GgufBody.GgufStr(self._io, self, self._root, self._is_le)
  local _ = self.key
  if not(_.len_value ~= 0) then
    error("ValidationExprError")
  end
  self.type = Gguf.GgufType(self._io:read_u4be())
  if self.type == nil then
    error("ValidationNotInEnumError")
  end
  self.value = Gguf.GgufBody.GgufValue(self.type, self._io, self, self._root, self._is_le)
  local _ = self.value
  if not(utils.box_unwrap((self.key.value == "general.alignment") and utils.box_wrap( ((self.type == Gguf.GgufType.uint32) and (_.value.value ~= 0) and (_.value.value & _.value.value - 1 == 0)) ) or (true))) then
    error("ValidationExprError")
  end
end

Gguf.GgufBody.GgufKv.property.alignment = {}
function Gguf.GgufBody.GgufKv.property.alignment:get()
  if self._m_alignment ~= nil then
    return self._m_alignment
  end

  self._m_alignment = utils.box_unwrap((self.key.value == "general.alignment") and utils.box_wrap(self.value.value.value) or (self.prev_alignment))
  return self._m_alignment
end


-- 
-- See also: Git tag "v0.27.0" (https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L232-L237)
Gguf.GgufBody.GgufStr = class.class(KaitaiStruct)

function Gguf.GgufBody.GgufStr:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Gguf.GgufBody.GgufStr:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Gguf.GgufBody.GgufStr:_read_le()
  self.len_value = self._io:read_u8le()
  self.value = str_decode.decode(self._io:read_bytes(self.len_value), "UTF-8")
end

function Gguf.GgufBody.GgufStr:_read_be()
  self.len_value = self._io:read_u8be()
  self.value = str_decode.decode(self._io:read_bytes(self.len_value), "UTF-8")
end


-- 
-- See also: Git tag "v0.27.0" (https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L305-L325)
Gguf.GgufBody.GgufTensorInfo = class.class(KaitaiStruct)

function Gguf.GgufBody.GgufTensorInfo:_init(expected_offset, io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self.expected_offset = expected_offset
  self:_read()
end

function Gguf.GgufBody.GgufTensorInfo:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Gguf.GgufBody.GgufTensorInfo:_read_le()
  self.name = Gguf.GgufBody.GgufStr(self._io, self, self._root, self._is_le)
  local _ = self.name
  if not(_.len_value < 64) then
    error("ValidationExprError")
  end
  self.num_dims = self._io:read_u4le()
  if not(self.num_dims <= 4) then
    error("ValidationGreaterThanError")
  end
  self.dims = {}
  for i = 0, self.num_dims - 1 do
    self.dims[i + 1] = self._io:read_s8le()
    if not(self.dims[i + 1] >= 0) then
      error("ValidationLessThanError")
    end
  end
  self.type = Gguf.GgmlType(self._io:read_u4le())
  local _ = self.type
  if not( ((_.value < 43) and (self.num_elements_per_block ~= 0) and (utils.box_unwrap((self.num_dims > 0) and utils.box_wrap(self.dims[0 + 1]) or (1)) % self.num_elements_per_block == 0)) ) then
    error("ValidationExprError")
  end
  self.offset = self._io:read_u8le()
  if not(self.offset == self.expected_offset) then
    error("not equal, expected " .. self.expected_offset .. ", but got " .. self.offset)
  end
end

function Gguf.GgufBody.GgufTensorInfo:_read_be()
  self.name = Gguf.GgufBody.GgufStr(self._io, self, self._root, self._is_le)
  local _ = self.name
  if not(_.len_value < 64) then
    error("ValidationExprError")
  end
  self.num_dims = self._io:read_u4be()
  if not(self.num_dims <= 4) then
    error("ValidationGreaterThanError")
  end
  self.dims = {}
  for i = 0, self.num_dims - 1 do
    self.dims[i + 1] = self._io:read_s8be()
    if not(self.dims[i + 1] >= 0) then
      error("ValidationLessThanError")
    end
  end
  self.type = Gguf.GgmlType(self._io:read_u4be())
  local _ = self.type
  if not( ((_.value < 43) and (self.num_elements_per_block ~= 0) and (utils.box_unwrap((self.num_dims > 0) and utils.box_wrap(self.dims[0 + 1]) or (1)) % self.num_elements_per_block == 0)) ) then
    error("ValidationExprError")
  end
  self.offset = self._io:read_u8be()
  if not(self.offset == self.expected_offset) then
    error("not equal, expected " .. self.expected_offset .. ", but got " .. self.offset)
  end
end

Gguf.GgufBody.GgufTensorInfo.property.data = {}
function Gguf.GgufBody.GgufTensorInfo.property.data:get()
  if self._m_data ~= nil then
    return self._m_data
  end

  local _pos = self._io:pos()
  self._io:seek(self._parent.ofs_tensor_data + self.offset)
  if self._is_le then
    self._m_data = self._io:read_bytes(self.len_data)
  else
    self._m_data = self._io:read_bytes(self.len_data)
  end
  self._io:seek(_pos)
  return self._m_data
end

-- 
-- `dims` joined with the string `" x "`. This is necessary for
-- `-webide-representation`, which cannot format `dims` directly -
-- see <https://github.com/kaitai-io/kaitai_struct_webide/issues/160>.
Gguf.GgufBody.GgufTensorInfo.property.dump_dims = {}
function Gguf.GgufBody.GgufTensorInfo.property.dump_dims:get()
  if self._m_dump_dims ~= nil then
    return self._m_dump_dims
  end

  self._m_dump_dims = utils.box_unwrap((self.num_dims > 0) and utils.box_wrap(tostring(self.dims[0 + 1])) or ("")) .. utils.box_unwrap((self.num_dims > 1) and utils.box_wrap(" x " .. tostring(self.dims[1 + 1])) or ("")) .. utils.box_unwrap((self.num_dims > 2) and utils.box_wrap(" x " .. tostring(self.dims[2 + 1])) or ("")) .. utils.box_unwrap((self.num_dims > 3) and utils.box_wrap(" x " .. tostring(self.dims[3 + 1])) or (""))
  return self._m_dump_dims
end

-- 
-- `offset` that the next tensor must have.
Gguf.GgufBody.GgufTensorInfo.property.expected_next_offset = {}
function Gguf.GgufBody.GgufTensorInfo.property.expected_next_offset:get()
  if self._m_expected_next_offset ~= nil then
    return self._m_expected_next_offset
  end

  self._m_expected_next_offset = ((self.offset + self.len_data) + self.len_padding)
  return self._m_expected_next_offset
end

-- 
-- Size of a block in bytes.
Gguf.GgufBody.GgufTensorInfo.property.len_block = {}
function Gguf.GgufBody.GgufTensorInfo.property.len_block:get()
  if self._m_len_block ~= nil then
    return self._m_len_block
  end

  self._m_len_block = {4, 2, 18, 20, 0, 0, 22, 24, 34, 36, 84, 110, 144, 176, 210, 292, 66, 74, 98, 50, 18, 110, 82, 136, 1, 2, 4, 8, 8, 56, 2, 0, 0, 0, 54, 66, 0, 0, 0, 17, 36, 18, 18}[self.type.value + 1]
  return self._m_len_block
end

Gguf.GgufBody.GgufTensorInfo.property.len_data = {}
function Gguf.GgufBody.GgufTensorInfo.property.len_data:get()
  if self._m_len_data ~= nil then
    return self._m_len_data
  end

  self._m_len_data = (self.len_block * self.num_blocks)
  return self._m_len_data
end

-- 
-- Number of padding bytes after the data.
Gguf.GgufBody.GgufTensorInfo.property.len_padding = {}
function Gguf.GgufBody.GgufTensorInfo.property.len_padding:get()
  if self._m_len_padding ~= nil then
    return self._m_len_padding
  end

  self._m_len_padding = (self._parent.alignment - self.len_data % self._parent.alignment) % self._parent.alignment
  return self._m_len_padding
end

Gguf.GgufBody.GgufTensorInfo.property.num_blocks = {}
function Gguf.GgufBody.GgufTensorInfo.property.num_blocks:get()
  if self._m_num_blocks ~= nil then
    return self._m_num_blocks
  end

  self._m_num_blocks = math.floor(self.num_elements / self.num_elements_per_block)
  return self._m_num_blocks
end

Gguf.GgufBody.GgufTensorInfo.property.num_elements = {}
function Gguf.GgufBody.GgufTensorInfo.property.num_elements:get()
  if self._m_num_elements ~= nil then
    return self._m_num_elements
  end

  self._m_num_elements = (((utils.box_unwrap((self.num_dims > 0) and utils.box_wrap(self.dims[0 + 1]) or (1)) * utils.box_unwrap((self.num_dims > 1) and utils.box_wrap(self.dims[1 + 1]) or (1))) * utils.box_unwrap((self.num_dims > 2) and utils.box_wrap(self.dims[2 + 1]) or (1))) * utils.box_unwrap((self.num_dims > 3) and utils.box_wrap(self.dims[3 + 1]) or (1)))
  return self._m_num_elements
end

-- 
-- Number of elements in a block.
Gguf.GgufBody.GgufTensorInfo.property.num_elements_per_block = {}
function Gguf.GgufBody.GgufTensorInfo.property.num_elements_per_block:get()
  if self._m_num_elements_per_block ~= nil then
    return self._m_num_elements_per_block
  end

  self._m_num_elements_per_block = {1, 1, 32, 32, 0, 0, 32, 32, 32, 32, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 32, 256, 256, 256, 1, 1, 1, 1, 1, 256, 1, 0, 0, 0, 256, 256, 0, 0, 0, 32, 64, 128, 64}[self.type.value + 1]
  return self._m_num_elements_per_block
end

-- 
-- Padding after the data. ggml requires it even after the last tensor
-- when reading the tensor data.
-- See also: Git tag "v0.27.0" (https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L884-L893)
Gguf.GgufBody.GgufTensorInfo.property.padding = {}
function Gguf.GgufBody.GgufTensorInfo.property.padding:get()
  if self._m_padding ~= nil then
    return self._m_padding
  end

  local _pos = self._io:pos()
  self._io:seek((self._parent.ofs_tensor_data + self.offset) + self.len_data)
  if self._is_le then
    self._m_padding = self._io:read_bytes(self.len_padding)
  else
    self._m_padding = self._io:read_bytes(self.len_padding)
  end
  self._io:seek(_pos)
  return self._m_padding
end

-- 
-- Offset of the tensor's data, relative to `_parent.ofs_tensor_data`.

Gguf.GgufBody.GgufUint16 = class.class(KaitaiStruct)

function Gguf.GgufBody.GgufUint16:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Gguf.GgufBody.GgufUint16:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Gguf.GgufBody.GgufUint16:_read_le()
  self.value = self._io:read_u2le()
end

function Gguf.GgufBody.GgufUint16:_read_be()
  self.value = self._io:read_u2be()
end


Gguf.GgufBody.GgufUint32 = class.class(KaitaiStruct)

function Gguf.GgufBody.GgufUint32:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Gguf.GgufBody.GgufUint32:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Gguf.GgufBody.GgufUint32:_read_le()
  self.value = self._io:read_u4le()
end

function Gguf.GgufBody.GgufUint32:_read_be()
  self.value = self._io:read_u4be()
end


Gguf.GgufBody.GgufUint64 = class.class(KaitaiStruct)

function Gguf.GgufBody.GgufUint64:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Gguf.GgufBody.GgufUint64:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Gguf.GgufBody.GgufUint64:_read_le()
  self.value = self._io:read_u8le()
end

function Gguf.GgufBody.GgufUint64:_read_be()
  self.value = self._io:read_u8be()
end


Gguf.GgufBody.GgufUint8 = class.class(KaitaiStruct)

function Gguf.GgufBody.GgufUint8:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Gguf.GgufBody.GgufUint8:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Gguf.GgufBody.GgufUint8:_read_le()
  self.value = self._io:read_u1()
end

function Gguf.GgufBody.GgufUint8:_read_be()
  self.value = self._io:read_u1()
end


-- 
-- See also: Git tag "v0.27.0" (https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L239-L260)
Gguf.GgufBody.GgufValue = class.class(KaitaiStruct)

function Gguf.GgufBody.GgufValue:_init(type, io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self.type = type
  self:_read()
end

function Gguf.GgufBody.GgufValue:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Gguf.GgufBody.GgufValue:_read_le()
  local _on = self.type
  if _on == Gguf.GgufType.array then
    self.value = Gguf.GgufBody.GgufArray(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.bool then
    self.value = Gguf.GgufBody.GgufBool(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.float32 then
    self.value = Gguf.GgufBody.GgufFloat32(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.float64 then
    self.value = Gguf.GgufBody.GgufFloat64(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.int16 then
    self.value = Gguf.GgufBody.GgufInt16(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.int32 then
    self.value = Gguf.GgufBody.GgufInt32(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.int64 then
    self.value = Gguf.GgufBody.GgufInt64(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.int8 then
    self.value = Gguf.GgufBody.GgufInt8(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.string then
    self.value = Gguf.GgufBody.GgufStr(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.uint16 then
    self.value = Gguf.GgufBody.GgufUint16(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.uint32 then
    self.value = Gguf.GgufBody.GgufUint32(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.uint64 then
    self.value = Gguf.GgufBody.GgufUint64(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.uint8 then
    self.value = Gguf.GgufBody.GgufUint8(self._io, self, self._root, self._is_le)
  end
end

function Gguf.GgufBody.GgufValue:_read_be()
  local _on = self.type
  if _on == Gguf.GgufType.array then
    self.value = Gguf.GgufBody.GgufArray(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.bool then
    self.value = Gguf.GgufBody.GgufBool(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.float32 then
    self.value = Gguf.GgufBody.GgufFloat32(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.float64 then
    self.value = Gguf.GgufBody.GgufFloat64(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.int16 then
    self.value = Gguf.GgufBody.GgufInt16(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.int32 then
    self.value = Gguf.GgufBody.GgufInt32(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.int64 then
    self.value = Gguf.GgufBody.GgufInt64(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.int8 then
    self.value = Gguf.GgufBody.GgufInt8(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.string then
    self.value = Gguf.GgufBody.GgufStr(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.uint16 then
    self.value = Gguf.GgufBody.GgufUint16(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.uint32 then
    self.value = Gguf.GgufBody.GgufUint32(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.uint64 then
    self.value = Gguf.GgufBody.GgufUint64(self._io, self, self._root, self._is_le)
  elseif _on == Gguf.GgufType.uint8 then
    self.value = Gguf.GgufBody.GgufUint8(self._io, self, self._root, self._is_le)
  end
end


