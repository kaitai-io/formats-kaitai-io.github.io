-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")

-- 
-- See also: Source (http://fileformats.archiveteam.org/wiki/TIM_(PlayStation_graphics))
-- See also: Source (https://mrclick.zophar.net/TilEd/download/timgfx.txt)
-- See also: Source (https://www.romhacking.net/documents/31/)
PsxTim = class.class(KaitaiStruct)

PsxTim.BppType = enum.Enum {
  bpp_4 = 0,
  bpp_8 = 1,
  bpp_16 = 2,
  bpp_24 = 3,
}

function PsxTim:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PsxTim:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\016\000\000\000") then
    error("not equal, expected " ..  "\016\000\000\000" .. ", but got " .. self.magic)
  end
  self.flags = self._io:read_u4le()
  if self.has_clut then
    self.clut = PsxTim.Bitmap(self._io, self, self._root)
  end
  self.img = PsxTim.Bitmap(self._io, self, self._root)
end

PsxTim.property.has_clut = {}
function PsxTim.property.has_clut:get()
  if self._m_has_clut ~= nil then
    return self._m_has_clut
  end

  self._m_has_clut = (self.flags & 8) ~= 0
  return self._m_has_clut
end

PsxTim.property.bpp = {}
function PsxTim.property.bpp:get()
  if self._m_bpp ~= nil then
    return self._m_bpp
  end

  self._m_bpp = (self.flags & 3)
  return self._m_bpp
end

-- 
-- Encodes bits-per-pixel and whether CLUT is present in a file or not.
-- 
-- CLUT (Color LookUp Table), one or several palettes for indexed color image, represented as a.

PsxTim.Bitmap = class.class(KaitaiStruct)

function PsxTim.Bitmap:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PsxTim.Bitmap:_read()
  self.len = self._io:read_u4le()
  self.origin_x = self._io:read_u2le()
  self.origin_y = self._io:read_u2le()
  self.width = self._io:read_u2le()
  self.height = self._io:read_u2le()
  self.body = self._io:read_bytes((self.len - 12))
end


