-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- See also: Source (https://developers.google.com/speed/webp/docs/riff_container)
Webp = class.class(KaitaiStruct)

Webp.ChunkNames = enum.Enum {
  xmp_var = 5262680,
  vp8 = 540561494,
  xmp = 542133592,
  exif = 1179211845,
  anmf = 1179471425,
  alph = 1213221953,
  vp8l = 1278758998,
  frgm = 1296519750,
  anim = 1296649793,
  iccp = 1346585417,
  vp8x = 1480085590,
}

Webp.CompressionMethod = enum.Enum {
  none = 0,
  webp_lossless = 1,
}

Webp.FilteringMethod = enum.Enum {
  none = 0,
  horizontal = 1,
  vertical = 2,
  gradient = 3,
}

Webp.Preprocessing = enum.Enum {
  none = 0,
  level_reduction = 1,
}

function Webp:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Webp:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\082\073\070\070") then
    error("not equal, expected " .. "\082\073\070\070" .. ", but got " .. self.magic)
  end
  self.len_data = self._io:read_u4le()
  self.webp = self._io:read_bytes(4)
  if not(self.webp == "\087\069\066\080") then
    error("not equal, expected " .. "\087\069\066\080" .. ", but got " .. self.webp)
  end
  self._raw_payload = self._io:read_bytes(self.len_data - 4)
  local _io = KaitaiStream(stringstream(self._raw_payload))
  self.payload = Webp.Chunks(_io, self, self._root)
end


Webp.Alph = class.class(KaitaiStruct)

function Webp.Alph:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Webp.Alph:_read()
  self.reserved = self._io:read_bits_int_be(2)
  if not(self.reserved == 0) then
    error("not equal, expected " .. 0 .. ", but got " .. self.reserved)
  end
  self.preprocessing = Webp.Preprocessing(self._io:read_bits_int_be(2))
  if self.preprocessing == nil then
    error("ValidationNotInEnumError")
  end
  self.filtering = Webp.FilteringMethod(self._io:read_bits_int_be(2))
  self.compression = Webp.CompressionMethod(self._io:read_bits_int_be(2))
  if self.compression == nil then
    error("ValidationNotInEnumError")
  end
  self._io:align_to_byte()
  self.data = self._io:read_bytes_full()
end


-- 
-- See also: Source (https://developers.google.com/speed/webp/docs/riff_container#animation)
Webp.Anim = class.class(KaitaiStruct)

function Webp.Anim:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Webp.Anim:_read()
  self.background_color = Webp.Anim.BgColor(self._io, self, self._root)
  self.loop_count = self._io:read_u2le()
end


Webp.Anim.BgColor = class.class(KaitaiStruct)

function Webp.Anim.BgColor:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Webp.Anim.BgColor:_read()
  self.blue = self._io:read_u1()
  self.green = self._io:read_u1()
  self.red = self._io:read_u1()
  self.alpha = self._io:read_u1()
end


Webp.Anmf = class.class(KaitaiStruct)

function Webp.Anmf:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Webp.Anmf:_read()
  self.frame_x_div_2 = self._io:read_bits_int_le(24)
  self.frame_y_div_2 = self._io:read_bits_int_le(24)
  self.frame_width_minus_1 = self._io:read_bits_int_le(24)
  self.frame_height_minus_1 = self._io:read_bits_int_le(24)
  self.duration = self._io:read_bits_int_le(24)
  self.reserved = self._io:read_bits_int_be(6)
  if not(self.reserved == 0) then
    error("not equal, expected " .. 0 .. ", but got " .. self.reserved)
  end
  self.blending_method = self._io:read_bits_int_be(1) ~= 0
  self.disposal_method = self._io:read_bits_int_be(1) ~= 0
  self._io:align_to_byte()
  self.data = self._io:read_bytes_full()
end

Webp.Anmf.property.frame_height = {}
function Webp.Anmf.property.frame_height:get()
  if self._m_frame_height ~= nil then
    return self._m_frame_height
  end

  self._m_frame_height = self.frame_height_minus_1 + 1
  return self._m_frame_height
end

Webp.Anmf.property.frame_width = {}
function Webp.Anmf.property.frame_width:get()
  if self._m_frame_width ~= nil then
    return self._m_frame_width
  end

  self._m_frame_width = self.frame_width_minus_1 + 1
  return self._m_frame_width
end

Webp.Anmf.property.frame_x = {}
function Webp.Anmf.property.frame_x:get()
  if self._m_frame_x ~= nil then
    return self._m_frame_x
  end

  self._m_frame_x = self.frame_x_div_2 * 2
  return self._m_frame_x
end

Webp.Anmf.property.frame_y = {}
function Webp.Anmf.property.frame_y:get()
  if self._m_frame_y ~= nil then
    return self._m_frame_y
  end

  self._m_frame_y = self.frame_y_div_2 * 2
  return self._m_frame_y
end


Webp.Chunk = class.class(KaitaiStruct)

function Webp.Chunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Webp.Chunk:_read()
  self.name = Webp.ChunkNames(self._io:read_u4le())
  if self.name == nil then
    error("ValidationNotInEnumError")
  end
  self.len_data = self._io:read_u4le()
  local _on = self.name
  if _on == Webp.ChunkNames.alph then
    self._raw_data = self._io:read_bytes(self.len_data)
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = Webp.Alph(_io, self, self._root)
  elseif _on == Webp.ChunkNames.anim then
    self._raw_data = self._io:read_bytes(self.len_data)
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = Webp.Anim(_io, self, self._root)
  elseif _on == Webp.ChunkNames.anmf then
    self._raw_data = self._io:read_bytes(self.len_data)
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = Webp.Anmf(_io, self, self._root)
  elseif _on == Webp.ChunkNames.vp8 then
    self._raw_data = self._io:read_bytes(self.len_data)
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = Webp.Vp8(_io, self, self._root)
  elseif _on == Webp.ChunkNames.vp8l then
    self._raw_data = self._io:read_bytes(self.len_data)
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = Webp.Vp8l(_io, self, self._root)
  elseif _on == Webp.ChunkNames.vp8x then
    self._raw_data = self._io:read_bytes(self.len_data)
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = Webp.Vp8x(_io, self, self._root)
  elseif _on == Webp.ChunkNames.xmp then
    self._raw_data = self._io:read_bytes(self.len_data)
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = Webp.Xmp(_io, self, self._root)
  elseif _on == Webp.ChunkNames.xmp_var then
    self._raw_data = self._io:read_bytes(self.len_data)
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = Webp.Xmp(_io, self, self._root)
  else
    self.data = self._io:read_bytes(self.len_data)
  end
  if self.len_data % 2 ~= 0 then
    self.padding = self._io:read_bytes(1)
    if not(self.padding == "\000") then
      error("not equal, expected " .. "\000" .. ", but got " .. self.padding)
    end
  end
end


Webp.Chunks = class.class(KaitaiStruct)

function Webp.Chunks:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Webp.Chunks:_read()
  self.chunks = {}
  local i = 0
  while not self._io:is_eof() do
    self.chunks[i + 1] = Webp.Chunk(self._io, self, self._root)
    i = i + 1
  end
end


-- 
-- See also: Source (https://www.rfc-editor.org/rfc/rfc6386#section-9.1)
Webp.Vp8 = class.class(KaitaiStruct)

function Webp.Vp8:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Webp.Vp8:_read()
  self.frame_type = self._io:read_bits_int_le(1) ~= 0
  if not(self.frame_type == false) then
    error("not equal, expected " .. false .. ", but got " .. self.frame_type)
  end
  self.version = self._io:read_bits_int_le(3)
  if not(self.version <= 3) then
    error("ValidationGreaterThanError")
  end
  self.show_frame = self._io:read_bits_int_le(1) ~= 0
  self.len_first_partition = self._io:read_bits_int_le(19)
  self._io:align_to_byte()
  self.start_code = self._io:read_bytes(3)
  if not(self.start_code == "\157\001\042") then
    error("not equal, expected " .. "\157\001\042" .. ", but got " .. self.start_code)
  end
  self.width = self._io:read_bits_int_le(14)
  self.horizontal_scale = self._io:read_bits_int_le(2)
  self.height = self._io:read_bits_int_le(14)
  self.vertical_scale = self._io:read_bits_int_le(2)
  self._io:align_to_byte()
  self.data = self._io:read_bytes_full()
end


-- 
-- See also: Source (https://developers.google.com/speed/webp/docs/webp_lossless_bitstream_specification)
Webp.Vp8l = class.class(KaitaiStruct)

function Webp.Vp8l:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Webp.Vp8l:_read()
  self.signature = self._io:read_u1()
  if not(self.signature == 47) then
    error("not equal, expected " .. 47 .. ", but got " .. self.signature)
  end
  self.image_width_minus_1 = self._io:read_bits_int_le(14)
  self.image_height_minus_1 = self._io:read_bits_int_le(14)
  self.alpha_is_used = self._io:read_bits_int_le(1) ~= 0
  self.version_number = self._io:read_bits_int_le(3)
  if not(self.version_number == 0) then
    error("not equal, expected " .. 0 .. ", but got " .. self.version_number)
  end
  self._io:align_to_byte()
  self.data = self._io:read_bytes_full()
end

Webp.Vp8l.property.image_height = {}
function Webp.Vp8l.property.image_height:get()
  if self._m_image_height ~= nil then
    return self._m_image_height
  end

  self._m_image_height = self.image_height_minus_1 + 1
  return self._m_image_height
end

Webp.Vp8l.property.image_width = {}
function Webp.Vp8l.property.image_width:get()
  if self._m_image_width ~= nil then
    return self._m_image_width
  end

  self._m_image_width = self.image_width_minus_1 + 1
  return self._m_image_width
end

-- 
-- A hint only - it should not impact decoding. It should be `false` when
-- all alpha values are 255 in the picture, and `true` otherwise.

Webp.Vp8x = class.class(KaitaiStruct)

function Webp.Vp8x:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Webp.Vp8x:_read()
  self.reserved1 = self._io:read_bits_int_be(2)
  if not(self.reserved1 == 0) then
    error("not equal, expected " .. 0 .. ", but got " .. self.reserved1)
  end
  self.icc_profile = self._io:read_bits_int_be(1) ~= 0
  self.alpha = self._io:read_bits_int_be(1) ~= 0
  self.exif = self._io:read_bits_int_be(1) ~= 0
  self.xmp = self._io:read_bits_int_be(1) ~= 0
  self.animation = self._io:read_bits_int_be(1) ~= 0
  self.reserved2 = self._io:read_bits_int_be(1) ~= 0
  if not(self.reserved2 == false) then
    error("not equal, expected " .. false .. ", but got " .. self.reserved2)
  end
  self.reserved3 = self._io:read_bits_int_be(24)
  if not(self.reserved3 == 0) then
    error("not equal, expected " .. 0 .. ", but got " .. self.reserved3)
  end
  self.canvas_width_minus_1 = self._io:read_bits_int_le(24)
  self.canvas_height_minus_1 = self._io:read_bits_int_le(24)
  if not(self.canvas_height_minus_1 <= math.floor(4294967295 / self.canvas_width) - 1) then
    error("ValidationGreaterThanError")
  end
end

Webp.Vp8x.property.canvas_height = {}
function Webp.Vp8x.property.canvas_height:get()
  if self._m_canvas_height ~= nil then
    return self._m_canvas_height
  end

  self._m_canvas_height = self.canvas_height_minus_1 + 1
  return self._m_canvas_height
end

Webp.Vp8x.property.canvas_width = {}
function Webp.Vp8x.property.canvas_width:get()
  if self._m_canvas_width ~= nil then
    return self._m_canvas_width
  end

  self._m_canvas_width = self.canvas_width_minus_1 + 1
  return self._m_canvas_width
end


Webp.Xmp = class.class(KaitaiStruct)

function Webp.Xmp:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Webp.Xmp:_read()
  self.data = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end


