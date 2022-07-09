-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- Allegro library for C (mostly used for game and multimedia apps
-- programming) used its own container file format.
-- 
-- In general, it allows storage of arbitrary binary data blocks
-- bundled together with some simple key-value style metadata
-- ("properties") for every block. Allegro also pre-defines some simple
-- formats for bitmaps, fonts, MIDI music, sound samples and
-- palettes. Allegro library v4.0+ also support LZSS compression.
-- 
-- This spec applies to Allegro data files for library versions 2.2 up
-- to 4.4.
-- See also: Source (https://liballeg.org/stabledocs/en/datafile.html)
AllegroDat = class.class(KaitaiStruct)

AllegroDat.PackEnum = enum.Enum {
  unpacked = 1936484398,
}

function AllegroDat:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AllegroDat:_read()
  self.pack_magic = AllegroDat.PackEnum(self._io:read_u4be())
  self.dat_magic = self._io:read_bytes(4)
  if not(self.dat_magic == "\065\076\076\046") then
    error("not equal, expected " ..  "\065\076\076\046" .. ", but got " .. self.dat_magic)
  end
  self.num_objects = self._io:read_u4be()
  self.objects = {}
  for i = 0, self.num_objects - 1 do
    self.objects[i + 1] = AllegroDat.DatObject(self._io, self, self._root)
  end
end


-- 
-- Simple monochrome monospaced font, 95 characters, 8x16 px
-- characters.
AllegroDat.DatFont16 = class.class(KaitaiStruct)

function AllegroDat.DatFont16:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AllegroDat.DatFont16:_read()
  self.chars = {}
  for i = 0, 95 - 1 do
    self.chars[i + 1] = self._io:read_bytes(16)
  end
end


AllegroDat.DatBitmap = class.class(KaitaiStruct)

function AllegroDat.DatBitmap:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AllegroDat.DatBitmap:_read()
  self.bits_per_pixel = self._io:read_s2be()
  self.width = self._io:read_u2be()
  self.height = self._io:read_u2be()
  self.image = self._io:read_bytes_full()
end


AllegroDat.DatFont = class.class(KaitaiStruct)

function AllegroDat.DatFont:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AllegroDat.DatFont:_read()
  self.font_size = self._io:read_s2be()
  local _on = self.font_size
  if _on == 8 then
    self.body = AllegroDat.DatFont8(self._io, self, self._root)
  elseif _on == 16 then
    self.body = AllegroDat.DatFont16(self._io, self, self._root)
  elseif _on == 0 then
    self.body = AllegroDat.DatFont39(self._io, self, self._root)
  end
end


-- 
-- Simple monochrome monospaced font, 95 characters, 8x8 px
-- characters.
AllegroDat.DatFont8 = class.class(KaitaiStruct)

function AllegroDat.DatFont8:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AllegroDat.DatFont8:_read()
  self.chars = {}
  for i = 0, 95 - 1 do
    self.chars[i + 1] = self._io:read_bytes(8)
  end
end


AllegroDat.DatObject = class.class(KaitaiStruct)

function AllegroDat.DatObject:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AllegroDat.DatObject:_read()
  self.properties = {}
  local i = 0
  while true do
    local _ = AllegroDat.Property(self._io, self, self._root)
    self.properties[i + 1] = _
    if not(_.is_valid) then
      break
    end
    i = i + 1
  end
  self.len_compressed = self._io:read_s4be()
  self.len_uncompressed = self._io:read_s4be()
  local _on = self.type
  if _on == "BMP " then
    self._raw_body = self._io:read_bytes(self.len_compressed)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = AllegroDat.DatBitmap(_io, self, self._root)
  elseif _on == "RLE " then
    self._raw_body = self._io:read_bytes(self.len_compressed)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = AllegroDat.DatRleSprite(_io, self, self._root)
  elseif _on == "FONT" then
    self._raw_body = self._io:read_bytes(self.len_compressed)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = AllegroDat.DatFont(_io, self, self._root)
  else
    self.body = self._io:read_bytes(self.len_compressed)
  end
end

AllegroDat.DatObject.property.type = {}
function AllegroDat.DatObject.property.type:get()
  if self._m_type ~= nil then
    return self._m_type
  end

  self._m_type = self.properties[#self.properties].magic
  return self._m_type
end


-- 
-- New bitmap font format introduced since Allegro 3.9: allows
-- flexible designation of character ranges, 8-bit colored
-- characters, etc.
AllegroDat.DatFont39 = class.class(KaitaiStruct)

function AllegroDat.DatFont39:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AllegroDat.DatFont39:_read()
  self.num_ranges = self._io:read_s2be()
  self.ranges = {}
  for i = 0, self.num_ranges - 1 do
    self.ranges[i + 1] = AllegroDat.DatFont39.Range(self._io, self, self._root)
  end
end


AllegroDat.DatFont39.Range = class.class(KaitaiStruct)

function AllegroDat.DatFont39.Range:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AllegroDat.DatFont39.Range:_read()
  self.mono = self._io:read_u1()
  self.start_char = self._io:read_u4be()
  self.end_char = self._io:read_u4be()
  self.chars = {}
  for i = 0, ((self.end_char - self.start_char) + 1) - 1 do
    self.chars[i + 1] = AllegroDat.DatFont39.FontChar(self._io, self, self._root)
  end
end

-- 
-- First character in range.
-- 
-- Last character in range (inclusive).

AllegroDat.DatFont39.FontChar = class.class(KaitaiStruct)

function AllegroDat.DatFont39.FontChar:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AllegroDat.DatFont39.FontChar:_read()
  self.width = self._io:read_u2be()
  self.height = self._io:read_u2be()
  self.body = self._io:read_bytes((self.width * self.height))
end


AllegroDat.Property = class.class(KaitaiStruct)

function AllegroDat.Property:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AllegroDat.Property:_read()
  self.magic = str_decode.decode(self._io:read_bytes(4), "UTF-8")
  if self.is_valid then
    self.type = str_decode.decode(self._io:read_bytes(4), "UTF-8")
  end
  if self.is_valid then
    self.len_body = self._io:read_u4be()
  end
  if self.is_valid then
    self.body = str_decode.decode(self._io:read_bytes(self.len_body), "UTF-8")
  end
end

AllegroDat.Property.property.is_valid = {}
function AllegroDat.Property.property.is_valid:get()
  if self._m_is_valid ~= nil then
    return self._m_is_valid
  end

  self._m_is_valid = self.magic == "prop"
  return self._m_is_valid
end


AllegroDat.DatRleSprite = class.class(KaitaiStruct)

function AllegroDat.DatRleSprite:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AllegroDat.DatRleSprite:_read()
  self.bits_per_pixel = self._io:read_s2be()
  self.width = self._io:read_u2be()
  self.height = self._io:read_u2be()
  self.len_image = self._io:read_u4be()
  self.image = self._io:read_bytes_full()
end


