-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- xwd is a file format written by eponymous X11 screen capture
-- application (xwd stands for "X Window Dump"). Typically, an average
-- user transforms xwd format into something more widespread by any of
-- `xwdtopnm` and `pnmto...` utilities right away.
-- 
-- xwd format itself provides a raw uncompressed bitmap with some
-- metainformation, like pixel format, width, height, bit depth,
-- etc. Note that technically format includes machine-dependent fields
-- and thus is probably a poor choice for true cross-platform usage.
Xwd = class.class(KaitaiStruct)

Xwd.ByteOrder = enum.Enum {
  le = 0,
  be = 1,
}

Xwd.PixmapFormat = enum.Enum {
  x_y_bitmap = 0,
  x_y_pixmap = 1,
  z_pixmap = 2,
}

Xwd.VisualClass = enum.Enum {
  static_gray = 0,
  gray_scale = 1,
  static_color = 2,
  pseudo_color = 3,
  true_color = 4,
  direct_color = 5,
}

function Xwd:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Xwd:_read()
  self.len_header = self._io:read_u4be()
  self._raw_hdr = self._io:read_bytes(self.len_header - 4)
  local _io = KaitaiStream(stringstream(self._raw_hdr))
  self.hdr = Xwd.Header(_io, self, self._root)
  self._raw_color_map = {}
  self.color_map = {}
  for i = 0, self.hdr.color_map_entries - 1 do
    self._raw_color_map[i + 1] = self._io:read_bytes(12)
    local _io = KaitaiStream(stringstream(self._raw_color_map[i + 1]))
    self.color_map[i + 1] = Xwd.ColorMapEntry(_io, self, self._root)
  end
end

-- 
-- Size of the header in bytes.

Xwd.ColorMapEntry = class.class(KaitaiStruct)

function Xwd.ColorMapEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Xwd.ColorMapEntry:_read()
  self.entry_number = self._io:read_u4be()
  self.red = self._io:read_u2be()
  self.green = self._io:read_u2be()
  self.blue = self._io:read_u2be()
  self.flags = self._io:read_u1()
  self.padding = self._io:read_u1()
end

-- 
-- Number of the color map entry.

Xwd.Header = class.class(KaitaiStruct)

function Xwd.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Xwd.Header:_read()
  self.file_version = self._io:read_u4be()
  self.pixmap_format = Xwd.PixmapFormat(self._io:read_u4be())
  self.pixmap_depth = self._io:read_u4be()
  self.pixmap_width = self._io:read_u4be()
  self.pixmap_height = self._io:read_u4be()
  self.x_offset = self._io:read_u4be()
  self.byte_order = Xwd.ByteOrder(self._io:read_u4be())
  self.bitmap_unit = self._io:read_u4be()
  self.bitmap_bit_order = self._io:read_u4be()
  self.bitmap_pad = self._io:read_u4be()
  self.bits_per_pixel = self._io:read_u4be()
  self.bytes_per_line = self._io:read_u4be()
  self.visual_class = Xwd.VisualClass(self._io:read_u4be())
  self.red_mask = self._io:read_u4be()
  self.green_mask = self._io:read_u4be()
  self.blue_mask = self._io:read_u4be()
  self.bits_per_rgb = self._io:read_u4be()
  self.number_of_colors = self._io:read_u4be()
  self.color_map_entries = self._io:read_u4be()
  self.window_width = self._io:read_u4be()
  self.window_height = self._io:read_u4be()
  self.window_x = self._io:read_s4be()
  self.window_y = self._io:read_s4be()
  self.window_border_width = self._io:read_u4be()
  self.creator = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "UTF-8")
end

-- 
-- X11WD file version (always 07h).
-- 
-- Format of the image data.
-- 
-- Pixmap depth in pixels - in practice, bits per pixel.
-- 
-- Pixmap width in pixels.
-- 
-- Pixmap height in pixels.
-- 
-- Bitmap X offset (number of pixels to ignore at the beginning of each scan-line).
-- 
-- Byte order of image data.
-- 
-- Bitmap base data size.
-- 
-- Bit-order of image data.
-- 
-- Bitmap scan-line pad.
-- 
-- Bits per pixel.
-- 
-- Bytes per scan-line.
-- 
-- Class of the image.
-- 
-- Red mask.
-- 
-- Green mask.
-- 
-- Blue mask.
-- 
-- Size of each color mask in bits.
-- 
-- Number of colors in image.
-- 
-- Number of entries in color map.
-- 
-- Window width.
-- 
-- Window height.
-- 
-- Window upper left X coordinate.
-- 
-- Window upper left Y coordinate.
-- 
-- Window border width.
-- 
-- Program that created this xwd file.

