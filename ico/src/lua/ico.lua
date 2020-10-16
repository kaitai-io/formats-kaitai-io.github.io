-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

-- 
-- Microsoft Windows uses specific file format to store applications
-- icons - ICO. This is a container that contains one or more image
-- files (effectively, DIB parts of BMP files or full PNG files are
-- contained inside).
-- See also: Source (https://msdn.microsoft.com/en-us/library/ms997538.aspx)
Ico = class.class(KaitaiStruct)

function Ico:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ico:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\000\000\001\000") then
    error("not equal, expected " ..  "\000\000\001\000" .. ", but got " .. self.magic)
  end
  self.num_images = self._io:read_u2le()
  self.images = {}
  for i = 0, self.num_images - 1 do
    self.images[i + 1] = Ico.IconDirEntry(self._io, self, self._root)
  end
end

-- 
-- Number of images contained in this file.

Ico.IconDirEntry = class.class(KaitaiStruct)

function Ico.IconDirEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ico.IconDirEntry:_read()
  self.width = self._io:read_u1()
  self.height = self._io:read_u1()
  self.num_colors = self._io:read_u1()
  self.reserved = self._io:read_bytes(1)
  if not(self.reserved == "\000") then
    error("not equal, expected " ..  "\000" .. ", but got " .. self.reserved)
  end
  self.num_planes = self._io:read_u2le()
  self.bpp = self._io:read_u2le()
  self.len_img = self._io:read_u4le()
  self.ofs_img = self._io:read_u4le()
end

-- 
-- Raw image data. Use `is_png` to determine whether this is an
-- embedded PNG file (true) or a DIB bitmap (false) and call a
-- relevant parser, if needed to parse image data further.
Ico.IconDirEntry.property.img = {}
function Ico.IconDirEntry.property.img:get()
  if self._m_img ~= nil then
    return self._m_img
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_img)
  self._m_img = self._io:read_bytes(self.len_img)
  self._io:seek(_pos)
  return self._m_img
end

-- 
-- Pre-reads first 8 bytes of the image to determine if it's an
-- embedded PNG file.
Ico.IconDirEntry.property.png_header = {}
function Ico.IconDirEntry.property.png_header:get()
  if self._m_png_header ~= nil then
    return self._m_png_header
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_img)
  self._m_png_header = self._io:read_bytes(8)
  self._io:seek(_pos)
  return self._m_png_header
end

-- 
-- True if this image is in PNG format.
Ico.IconDirEntry.property.is_png = {}
function Ico.IconDirEntry.property.is_png:get()
  if self._m_is_png ~= nil then
    return self._m_is_png
  end

  self._m_is_png = self.png_header == "\137\080\078\071\013\010\026\010"
  return self._m_is_png
end

-- 
-- Width of image, px.
-- 
-- Height of image, px.
-- 
-- Number of colors in palette of the image or 0 if image has
-- no palette (i.e. RGB, RGBA, etc)
-- 
-- Number of color planes.
-- 
-- Bits per pixel in the image.
-- 
-- Size of the image data.
-- 
-- Absolute offset of the image data start in the file.

