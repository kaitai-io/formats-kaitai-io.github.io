-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local utils = require("utils")

-- 
-- The Portable Image Format (PIF) is a basic, bitmap-like image format with the
-- focus on ease of use (implementation) and small size for embedded
-- applications.
-- 
-- See <https://github.com/gfcwfzkm/PIF-Image-Format> for more info.
-- See also: Source (https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf)
-- See also: Source (https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/C%20Library/pifdec.c#L300)
Pif = class.class(KaitaiStruct)

Pif.CompressionType = enum.Enum {
  none = 0,
  rle = 32222,
}

Pif.ImageType = enum.Enum {
  rgb332 = 7763,
  rgb888 = 17212,
  indexed_rgb332 = 18754,
  indexed_rgb565 = 18759,
  indexed_rgb888 = 18770,
  black_white = 32170,
  rgb16c = 47253,
  rgb565 = 58821,
}

function Pif:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Pif:_read()
  self.file_header = Pif.PifHeader(self._io, self, self._root)
  self.info_header = Pif.InformationHeader(self._io, self, self._root)
  if self.info_header.uses_indexed_mode then
    self._raw_color_table = self._io:read_bytes(self.info_header.len_color_table)
    local _io = KaitaiStream(stringstream(self._raw_color_table))
    self.color_table = Pif.ColorTableData(_io, self, self._root)
  end
end

Pif.property.image_data = {}
function Pif.property.image_data:get()
  if self._m_image_data ~= nil then
    return self._m_image_data
  end

  local _pos = self._io:pos()
  self._io:seek(self.file_header.ofs_image_data)
  self._m_image_data = self._io:read_bytes(self.info_header.len_image_data)
  self._io:seek(_pos)
  return self._m_image_data
end


Pif.ColorTableData = class.class(KaitaiStruct)

function Pif.ColorTableData:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Pif.ColorTableData:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    local _on = self._root.info_header.image_type
    if _on == Pif.ImageType.indexed_rgb332 then
      self.entries[i + 1] = self._io:read_bits_int_le(8)
    elseif _on == Pif.ImageType.indexed_rgb565 then
      self.entries[i + 1] = self._io:read_bits_int_le(16)
    elseif _on == Pif.ImageType.indexed_rgb888 then
      self.entries[i + 1] = self._io:read_bits_int_le(24)
    end
    i = i + 1
  end
end


Pif.InformationHeader = class.class(KaitaiStruct)

function Pif.InformationHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Pif.InformationHeader:_read()
  self.image_type = Pif.ImageType(self._io:read_u2le())
  if not( ((self.image_type == Pif.ImageType.rgb888) or (self.image_type == Pif.ImageType.rgb565) or (self.image_type == Pif.ImageType.rgb332) or (self.image_type == Pif.ImageType.rgb16c) or (self.image_type == Pif.ImageType.black_white) or (self.image_type == Pif.ImageType.indexed_rgb888) or (self.image_type == Pif.ImageType.indexed_rgb565) or (self.image_type == Pif.ImageType.indexed_rgb332)) ) then
    error("ValidationNotAnyOfError")
  end
  self.bits_per_pixel = self._io:read_u2le()
  local _ = self.bits_per_pixel
  if not(utils.box_unwrap((self.image_type == Pif.ImageType.rgb888) and utils.box_wrap(_ == 24) or (utils.box_unwrap((self.image_type == Pif.ImageType.rgb565) and utils.box_wrap(_ == 16) or (utils.box_unwrap((self.image_type == Pif.ImageType.rgb332) and utils.box_wrap(_ == 8) or (utils.box_unwrap((self.image_type == Pif.ImageType.rgb16c) and utils.box_wrap(_ == 4) or (utils.box_unwrap((self.image_type == Pif.ImageType.black_white) and utils.box_wrap(_ == 1) or (utils.box_unwrap((self.uses_indexed_mode) and utils.box_wrap(_ <= 8) or (true))))))))))))) then
    error("ValidationExprError")
  end
  self.width = self._io:read_u2le()
  self.height = self._io:read_u2le()
  self.len_image_data = self._io:read_u4le()
  if not(self.len_image_data <= self._root.file_header.len_file - self._root.file_header.ofs_image_data) then
    error("ValidationGreaterThanError")
  end
  self.len_color_table = self._io:read_u2le()
  if not(self.len_color_table >= utils.box_unwrap((self.uses_indexed_mode) and utils.box_wrap(self.len_color_table_entry * 1) or (0))) then
    error("ValidationLessThanError")
  end
  if not(self.len_color_table <= utils.box_unwrap((self.uses_indexed_mode) and utils.box_wrap(utils.box_unwrap((self.len_color_table_max < self.len_color_table_full) and utils.box_wrap(self.len_color_table_max) or (self.len_color_table_full))) or (0))) then
    error("ValidationGreaterThanError")
  end
  self.compression = Pif.CompressionType(self._io:read_u2le())
  if not( ((self.compression == Pif.CompressionType.none) or (self.compression == Pif.CompressionType.rle)) ) then
    error("ValidationNotAnyOfError")
  end
end

Pif.InformationHeader.property.len_color_table_entry = {}
function Pif.InformationHeader.property.len_color_table_entry:get()
  if self._m_len_color_table_entry ~= nil then
    return self._m_len_color_table_entry
  end

  self._m_len_color_table_entry = utils.box_unwrap((self.image_type == Pif.ImageType.indexed_rgb888) and utils.box_wrap(3) or (utils.box_unwrap((self.image_type == Pif.ImageType.indexed_rgb565) and utils.box_wrap(2) or (utils.box_unwrap((self.image_type == Pif.ImageType.indexed_rgb332) and utils.box_wrap(1) or (0))))))
  return self._m_len_color_table_entry
end

Pif.InformationHeader.property.len_color_table_full = {}
function Pif.InformationHeader.property.len_color_table_full:get()
  if self._m_len_color_table_full ~= nil then
    return self._m_len_color_table_full
  end

  self._m_len_color_table_full = self.len_color_table_entry * (1 << self.bits_per_pixel)
  return self._m_len_color_table_full
end

Pif.InformationHeader.property.len_color_table_max = {}
function Pif.InformationHeader.property.len_color_table_max:get()
  if self._m_len_color_table_max ~= nil then
    return self._m_len_color_table_max
  end

  self._m_len_color_table_max = self._root.file_header.ofs_image_data - self._root.file_header.ofs_image_data_min
  return self._m_len_color_table_max
end

Pif.InformationHeader.property.uses_indexed_mode = {}
function Pif.InformationHeader.property.uses_indexed_mode:get()
  if self._m_uses_indexed_mode ~= nil then
    return self._m_uses_indexed_mode
  end

  self._m_uses_indexed_mode = self.len_color_table_entry ~= 0
  return self._m_uses_indexed_mode
end

-- 
-- See <https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf>:
-- 
-- > Bits per Pixel: Bit size that each Pixel occupies. Bit size for an
-- > Indexed Image cannot go beyond 8 bits.
-- 
-- See <https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf>:
-- 
-- > Color Table Size: (...), only used in Indexed mode, otherwise zero.
-- ---
-- > **Note**: The presence of the Color Table is mandatory when Bits per
-- > Pixel <= 8, unless Image Type states RGB332, RGB16C or B/W
-- ---
-- > **Color Table** (semi-optional)
-- >
-- > (...) The amount of Colors has to be same or less than [Bits per
-- > Pixel] allow, otherwise the image is invalid.

Pif.PifHeader = class.class(KaitaiStruct)

function Pif.PifHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Pif.PifHeader:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\080\073\070\000") then
    error("not equal, expected " .. "\080\073\070\000" .. ", but got " .. self.magic)
  end
  self.len_file = self._io:read_u4le()
  if not(self.len_file >= self.ofs_image_data_min) then
    error("ValidationLessThanError")
  end
  self.ofs_image_data = self._io:read_u4le()
  if not(self.ofs_image_data >= self.ofs_image_data_min) then
    error("ValidationLessThanError")
  end
  if not(self.ofs_image_data <= self.len_file) then
    error("ValidationGreaterThanError")
  end
end

Pif.PifHeader.property.ofs_image_data_min = {}
function Pif.PifHeader.property.ofs_image_data_min:get()
  if self._m_ofs_image_data_min ~= nil then
    return self._m_ofs_image_data_min
  end

  self._m_ofs_image_data_min = 12 + 16
  return self._m_ofs_image_data_min
end


