-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")

-- 
-- TGA (AKA Truevision TGA, AKA TARGA), is a raster image file format created by Truevision. It supports up to 32 bits per pixel (three 8-bit RGB channels + 8-bit alpha channel), color mapping and optional lossless RLE compression.
-- See also: Source (https://www.dca.fee.unicamp.br/~martino/disciplinas/ea978/tgaffs.pdf)
Tga = class.class(KaitaiStruct)

Tga.ColorMapEnum = enum.Enum {
  no_color_map = 0,
  has_color_map = 1,
}

Tga.ImageTypeEnum = enum.Enum {
  no_image_data = 0,
  uncomp_color_mapped = 1,
  uncomp_true_color = 2,
  uncomp_bw = 3,
  rle_color_mapped = 9,
  rle_true_color = 10,
  rle_bw = 11,
}

function Tga:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Tga:_read()
  self.image_id_len = self._io:read_u1()
  self.color_map_type = Tga.ColorMapEnum(self._io:read_u1())
  self.image_type = Tga.ImageTypeEnum(self._io:read_u1())
  self.color_map_ofs = self._io:read_u2le()
  self.num_color_map = self._io:read_u2le()
  self.color_map_depth = self._io:read_u1()
  self.x_offset = self._io:read_u2le()
  self.y_offset = self._io:read_u2le()
  self.width = self._io:read_u2le()
  self.height = self._io:read_u2le()
  self.image_depth = self._io:read_u1()
  self.img_descriptor = self._io:read_u1()
  self.image_id = self._io:read_bytes(self.image_id_len)
  if self.color_map_type == Tga.ColorMapEnum.has_color_map then
    self.color_map = {}
    for i = 0, self.num_color_map - 1 do
      self.color_map[i + 1] = self._io:read_bytes(math.floor((self.color_map_depth + 7) / 8))
    end
  end
end

Tga.property.footer = {}
function Tga.property.footer:get()
  if self._m_footer ~= nil then
    return self._m_footer
  end

  local _pos = self._io:pos()
  self._io:seek(self._io:size() - 26)
  self._m_footer = Tga.TgaFooter(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_footer
end

-- 
-- Number of entries in a color map.
-- 
-- Number of bits in a each color maps entry.
-- 
-- Width of the image, in pixels.
-- 
-- Height of the image, in pixels.
-- 
-- Arbitrary application-specific information that is used to
-- identify image. May contain text or some binary data.
-- 
-- Color map.

Tga.TgaExtArea = class.class(KaitaiStruct)

function Tga.TgaExtArea:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Tga.TgaExtArea:_read()
  self.ext_area_size = self._io:read_u2le()
  self.author_name = str_decode.decode(self._io:read_bytes(41), "ASCII")
  self.comments = {}
  for i = 0, 4 - 1 do
    self.comments[i + 1] = str_decode.decode(self._io:read_bytes(81), "ASCII")
  end
  self.timestamp = self._io:read_bytes(12)
  self.job_id = str_decode.decode(self._io:read_bytes(41), "ASCII")
  self.job_time = str_decode.decode(self._io:read_bytes(6), "ASCII")
  self.software_id = str_decode.decode(self._io:read_bytes(41), "ASCII")
  self.software_version = self._io:read_bytes(3)
  self.key_color = self._io:read_u4le()
  self.pixel_aspect_ratio = self._io:read_u4le()
  self.gamma_value = self._io:read_u4le()
  self.color_corr_ofs = self._io:read_u4le()
  self.postage_stamp_ofs = self._io:read_u4le()
  self.scan_line_ofs = self._io:read_u4le()
  self.attributes = self._io:read_u1()
end

-- 
-- Extension area size in bytes (always 495).
-- 
-- Comments, organized as four lines, each consisting of 80 characters plus a NULL.
-- 
-- Image creation date / time.
-- 
-- Internal job ID, to be used in image workflow systems.
-- 
-- Hours, minutes and seconds spent creating the file (for billing, etc.).
-- 
-- The application that created the file.
-- 
-- Number of bytes from the beginning of the file to the color correction table if present.
-- 
-- Number of bytes from the beginning of the file to the postage stamp image if present.
-- 
-- Number of bytes from the beginning of the file to the scan lines table if present.
-- 
-- Specifies the alpha channel.

Tga.TgaFooter = class.class(KaitaiStruct)

function Tga.TgaFooter:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Tga.TgaFooter:_read()
  self.ext_area_ofs = self._io:read_u4le()
  self.dev_dir_ofs = self._io:read_u4le()
  self.version_magic = self._io:read_bytes(18)
end

Tga.TgaFooter.property.ext_area = {}
function Tga.TgaFooter.property.ext_area:get()
  if self._m_ext_area ~= nil then
    return self._m_ext_area
  end

  if self.is_valid then
    local _pos = self._io:pos()
    self._io:seek(self.ext_area_ofs)
    self._m_ext_area = Tga.TgaExtArea(self._io, self, self._root)
    self._io:seek(_pos)
  end
  return self._m_ext_area
end

Tga.TgaFooter.property.is_valid = {}
function Tga.TgaFooter.property.is_valid:get()
  if self._m_is_valid ~= nil then
    return self._m_is_valid
  end

  self._m_is_valid = self.version_magic == "\084\082\085\069\086\073\083\073\079\078\045\088\070\073\076\069\046\000"
  return self._m_is_valid
end

-- 
-- Offset to extension area.
-- 
-- Offset to developer directory.

