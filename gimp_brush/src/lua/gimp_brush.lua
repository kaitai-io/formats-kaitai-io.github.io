-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- GIMP brush format is native to the GIMP image editor for storing a brush or a texture.
-- It can be used in all [Paint Tools](https://docs.gimp.org/2.10/en/gimp-tools-paint.html),
-- for example Pencil and Paintbrush. It works by repeating the brush bitmap as you move
-- the tool. The Spacing parameter sets the distance between the brush marks as a percentage
-- of brush width. Its default value can be set in the brush file.
-- 
-- You can also use GIMP to create new brushes in this format. Custom brushes can be loaded
-- into GIMP for use in the paint tools by copying them into one of the Brush Folders -
-- select **Edit** > **Preferences** in the menu bar, expand the **Folders** section
-- and choose **Brushes** to see the recognized Brush Folders or to add new ones.
-- See also: Source (https://gitlab.gnome.org/GNOME/gimp/-/raw/4416313/devel-docs/gbr.txt)
GimpBrush = class.class(KaitaiStruct)

GimpBrush.ColorDepth = enum.Enum {
  grayscale = 1,
  rgba = 4,
}

function GimpBrush:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GimpBrush:_read()
  self.len_header = self._io:read_u4be()
  self._raw_header = self._io:read_bytes((self.len_header - 4))
  local _io = KaitaiStream(stringstream(self._raw_header))
  self.header = GimpBrush.Header(_io, self, self._root)
end

GimpBrush.property.len_body = {}
function GimpBrush.property.len_body:get()
  if self._m_len_body ~= nil then
    return self._m_len_body
  end

  self._m_len_body = ((self.header.width * self.header.height) * self.header.bytes_per_pixel.value)
  return self._m_len_body
end

GimpBrush.property.body = {}
function GimpBrush.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  local _pos = self._io:pos()
  self._io:seek(self.len_header)
  self._m_body = self._io:read_bytes(self.len_body)
  self._io:seek(_pos)
  return self._m_body
end


GimpBrush.Header = class.class(KaitaiStruct)

function GimpBrush.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GimpBrush.Header:_read()
  self.version = self._io:read_u4be()
  if not(self.version == 2) then
    error("not equal, expected " ..  2 .. ", but got " .. self.version)
  end
  self.width = self._io:read_u4be()
  if not(self.width >= 1) then
    error("ValidationLessThanError")
  end
  if not(self.width <= 10000) then
    error("ValidationGreaterThanError")
  end
  self.height = self._io:read_u4be()
  if not(self.height >= 1) then
    error("ValidationLessThanError")
  end
  if not(self.height <= 10000) then
    error("ValidationGreaterThanError")
  end
  self.bytes_per_pixel = GimpBrush.ColorDepth(self._io:read_u4be())
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\071\073\077\080") then
    error("not equal, expected " ..  "\071\073\077\080" .. ", but got " .. self.magic)
  end
  self.spacing = self._io:read_u4be()
  self.brush_name = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes_full(), 0, false), "UTF-8")
end

-- 
-- See also: Source (https://github.com/GNOME/gimp/blob/9b6d59f/app/core/gimpbrush-load.c#L170)
-- See also: Source (https://github.com/GNOME/gimp/blob/9b6d59f/app/core/gimpbrush-header.h#L24)
-- 
-- See also: Source (https://github.com/GNOME/gimp/blob/9b6d59f/app/core/gimpbrush-load.c#L177)
-- See also: Source (https://github.com/GNOME/gimp/blob/9b6d59f/app/core/gimpbrush-header.h#L24)
-- 
-- Default spacing to be used for brush. Percentage of brush width.

GimpBrush.Bitmap = class.class(KaitaiStruct)

function GimpBrush.Bitmap:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GimpBrush.Bitmap:_read()
  self.rows = {}
  for i = 0, self._root.header.height - 1 do
    self.rows[i + 1] = GimpBrush.Row(self._io, self, self._root)
  end
end


GimpBrush.Row = class.class(KaitaiStruct)

function GimpBrush.Row:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GimpBrush.Row:_read()
  self.pixels = {}
  for i = 0, self._root.header.width - 1 do
    local _on = self._root.header.bytes_per_pixel
    if _on == GimpBrush.ColorDepth.grayscale then
      self.pixels[i + 1] = GimpBrush.Row.PixelGray(self._io, self, self._root)
    elseif _on == GimpBrush.ColorDepth.rgba then
      self.pixels[i + 1] = GimpBrush.Row.PixelRgba(self._io, self, self._root)
    end
  end
end


GimpBrush.Row.PixelGray = class.class(KaitaiStruct)

function GimpBrush.Row.PixelGray:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GimpBrush.Row.PixelGray:_read()
  self.gray = self._io:read_u1()
end

GimpBrush.Row.PixelGray.property.red = {}
function GimpBrush.Row.PixelGray.property.red:get()
  if self._m_red ~= nil then
    return self._m_red
  end

  self._m_red = 0
  return self._m_red
end

GimpBrush.Row.PixelGray.property.green = {}
function GimpBrush.Row.PixelGray.property.green:get()
  if self._m_green ~= nil then
    return self._m_green
  end

  self._m_green = 0
  return self._m_green
end

GimpBrush.Row.PixelGray.property.blue = {}
function GimpBrush.Row.PixelGray.property.blue:get()
  if self._m_blue ~= nil then
    return self._m_blue
  end

  self._m_blue = 0
  return self._m_blue
end

GimpBrush.Row.PixelGray.property.alpha = {}
function GimpBrush.Row.PixelGray.property.alpha:get()
  if self._m_alpha ~= nil then
    return self._m_alpha
  end

  self._m_alpha = self.gray
  return self._m_alpha
end


GimpBrush.Row.PixelRgba = class.class(KaitaiStruct)

function GimpBrush.Row.PixelRgba:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GimpBrush.Row.PixelRgba:_read()
  self.red = self._io:read_u1()
  self.green = self._io:read_u1()
  self.blue = self._io:read_u1()
  self.alpha = self._io:read_u1()
end


