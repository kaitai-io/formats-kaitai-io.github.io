-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")

Pcx = class.class(KaitaiStruct)

Pcx.Versions = enum.Enum {
  v2_5 = 0,
  v2_8_with_palette = 2,
  v2_8_without_palette = 3,
  paintbrush_for_windows = 4,
  v3_0 = 5,
}

Pcx.Encodings = enum.Enum {
  rle = 1,
}

function Pcx:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Pcx:_read()
  self._raw_hdr = self._io:read_bytes(128)
  local _io = KaitaiStream(stringstream(self._raw_hdr))
  self.hdr = Pcx.Header(_io, self, self._root)
end

-- 
-- See also: - "VGA 256 Color Palette Information" (http://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt)
Pcx.property.palette_256 = {}
function Pcx.property.palette_256:get()
  if self._m_palette_256 ~= nil then
    return self._m_palette_256
  end

  if  ((self.hdr.version == Pcx.Versions.v3_0) and (self.hdr.bits_per_pixel == 8) and (self.hdr.num_planes == 1))  then
    local _pos = self._io:pos()
    self._io:seek((self._io:size() - 769))
    self._m_palette_256 = Pcx.TPalette256(self._io, self, self._root)
    self._io:seek(_pos)
  end
  return self._m_palette_256
end


-- 
-- See also: - "ZSoft .PCX FILE HEADER FORMAT" (http://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt)
Pcx.Header = class.class(KaitaiStruct)

function Pcx.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Pcx.Header:_read()
  self.magic = self._io:read_bytes(1)
  if not(self.magic == "\010") then
    error("not equal, expected " ..  "\010" .. ", but got " .. self.magic)
  end
  self.version = Pcx.Versions(self._io:read_u1())
  self.encoding = Pcx.Encodings(self._io:read_u1())
  self.bits_per_pixel = self._io:read_u1()
  self.img_x_min = self._io:read_u2le()
  self.img_y_min = self._io:read_u2le()
  self.img_x_max = self._io:read_u2le()
  self.img_y_max = self._io:read_u2le()
  self.hdpi = self._io:read_u2le()
  self.vdpi = self._io:read_u2le()
  self.palette_16 = self._io:read_bytes(48)
  self.reserved = self._io:read_bytes(1)
  if not(self.reserved == "\000") then
    error("not equal, expected " ..  "\000" .. ", but got " .. self.reserved)
  end
  self.num_planes = self._io:read_u1()
  self.bytes_per_line = self._io:read_u2le()
  self.palette_info = self._io:read_u2le()
  self.h_screen_size = self._io:read_u2le()
  self.v_screen_size = self._io:read_u2le()
end

-- 
-- Technically, this field was supposed to be "manufacturer"
-- mark to distinguish between various software vendors, and
-- 0x0a was supposed to mean "ZSoft", but everyone else ended
-- up writing a 0x0a into this field, so that's what majority
-- of modern software expects to have in this attribute.

Pcx.TPalette256 = class.class(KaitaiStruct)

function Pcx.TPalette256:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Pcx.TPalette256:_read()
  self.magic = self._io:read_bytes(1)
  if not(self.magic == "\012") then
    error("not equal, expected " ..  "\012" .. ", but got " .. self.magic)
  end
  self.colors = {}
  for i = 0, 256 - 1 do
    self.colors[i + 1] = Pcx.Rgb(self._io, self, self._root)
  end
end


Pcx.Rgb = class.class(KaitaiStruct)

function Pcx.Rgb:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Pcx.Rgb:_read()
  self.r = self._io:read_u1()
  self.g = self._io:read_u1()
  self.b = self._io:read_u1()
end


