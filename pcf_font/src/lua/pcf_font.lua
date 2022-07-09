-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local utils = require("utils")
local str_decode = require("string_decode")

require("bytes_with_io")
-- 
-- Portable Compiled Format (PCF) font is a bitmap font format
-- originating from X11 Window System. It matches BDF format (which is
-- text-based) closely, but instead being binary and
-- platform-independent (as opposed to previously used SNF binary
-- format) due to introduced features to handle different endianness
-- and bit order.
-- 
-- The overall composition of the format is straightforward: it's more
-- or less classic directory of type-offset-size pointers, pointing to
-- what PCF format calls "tables". Each table carries a certain
-- piece of information related to the font (metadata properties,
-- metrics, bitmaps, mapping of glyphs to characters, etc).
-- See also: Source (https://fontforge.org/docs/techref/pcf-format.html)
PcfFont = class.class(KaitaiStruct)

PcfFont.Types = enum.Enum {
  properties = 1,
  accelerators = 2,
  metrics = 4,
  bitmaps = 8,
  ink_metrics = 16,
  bdf_encodings = 32,
  swidths = 64,
  glyph_names = 128,
  bdf_accelerators = 256,
}

function PcfFont:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PcfFont:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\001\102\099\112") then
    error("not equal, expected " ..  "\001\102\099\112" .. ", but got " .. self.magic)
  end
  self.num_tables = self._io:read_u4le()
  self.tables = {}
  for i = 0, self.num_tables - 1 do
    self.tables[i + 1] = PcfFont.Table(self._io, self, self._root)
  end
end


-- 
-- Table offers a offset + length pointer to a particular
-- table. "Type" of table references certain enum. Applications can
-- ignore enum values which they don't support.
PcfFont.Table = class.class(KaitaiStruct)

function PcfFont.Table:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PcfFont.Table:_read()
  self.type = PcfFont.Types(self._io:read_u4le())
  self.format = PcfFont.Format(self._io, self, self._root)
  self.len_body = self._io:read_u4le()
  self.ofs_body = self._io:read_u4le()
end

PcfFont.Table.property.body = {}
function PcfFont.Table.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_body)
  local _on = self.type
  if _on == PcfFont.Types.properties then
    self._raw__m_body = self._io:read_bytes(self.len_body)
    local _io = KaitaiStream(stringstream(self._raw__m_body))
    self._m_body = PcfFont.Table.Properties(_io, self, self._root)
  elseif _on == PcfFont.Types.bdf_encodings then
    self._raw__m_body = self._io:read_bytes(self.len_body)
    local _io = KaitaiStream(stringstream(self._raw__m_body))
    self._m_body = PcfFont.Table.BdfEncodings(_io, self, self._root)
  elseif _on == PcfFont.Types.swidths then
    self._raw__m_body = self._io:read_bytes(self.len_body)
    local _io = KaitaiStream(stringstream(self._raw__m_body))
    self._m_body = PcfFont.Table.Swidths(_io, self, self._root)
  elseif _on == PcfFont.Types.glyph_names then
    self._raw__m_body = self._io:read_bytes(self.len_body)
    local _io = KaitaiStream(stringstream(self._raw__m_body))
    self._m_body = PcfFont.Table.GlyphNames(_io, self, self._root)
  elseif _on == PcfFont.Types.bitmaps then
    self._raw__m_body = self._io:read_bytes(self.len_body)
    local _io = KaitaiStream(stringstream(self._raw__m_body))
    self._m_body = PcfFont.Table.Bitmaps(_io, self, self._root)
  else
    self._m_body = self._io:read_bytes(self.len_body)
  end
  self._io:seek(_pos)
  return self._m_body
end


-- 
-- Table containing scalable widths of characters.
-- See also: Source (https://fontforge.org/docs/techref/pcf-format.html#the-scalable-widths-table)
PcfFont.Table.Swidths = class.class(KaitaiStruct)

function PcfFont.Table.Swidths:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PcfFont.Table.Swidths:_read()
  self.format = PcfFont.Format(self._io, self, self._root)
  self.num_glyphs = self._io:read_u4le()
  self.swidths = {}
  for i = 0, self.num_glyphs - 1 do
    self.swidths[i + 1] = self._io:read_u4le()
  end
end

-- 
-- The scalable width of a character is the width of the corresponding
-- PostScript character in em-units (1/1000ths of an em).

-- 
-- Array of properties (key-value pairs), used to convey different X11
-- settings of a font. Key is always an X font atom.
-- See also: Source (https://fontforge.org/docs/techref/pcf-format.html#properties-table)
PcfFont.Table.Properties = class.class(KaitaiStruct)

function PcfFont.Table.Properties:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PcfFont.Table.Properties:_read()
  self.format = PcfFont.Format(self._io, self, self._root)
  self.num_props = self._io:read_u4le()
  self.props = {}
  for i = 0, self.num_props - 1 do
    self.props[i + 1] = PcfFont.Table.Properties.Prop(self._io, self, self._root)
  end
  self.padding = self._io:read_bytes(utils.box_unwrap(((self.num_props & 3) == 0) and utils.box_wrap(0) or ((4 - (self.num_props & 3)))))
  self.len_strings = self._io:read_u4le()
  self._raw_strings = self._io:read_bytes(self.len_strings)
  local _io = KaitaiStream(stringstream(self._raw_strings))
  self.strings = BytesWithIo(_io)
end

-- 
-- Strings buffer. Never used directly, but instead is
-- addressed by offsets from the properties.

-- 
-- Property is a key-value pair, "key" being always a
-- string and "value" being either a string or a 32-bit
-- integer based on an additinal flag (`is_string`).
-- 
-- Simple offset-based mechanism is employed to keep this
-- type's sequence fixed-sized and thus have simple access
-- to property key/value by index.
PcfFont.Table.Properties.Prop = class.class(KaitaiStruct)

function PcfFont.Table.Properties.Prop:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PcfFont.Table.Properties.Prop:_read()
  self.ofs_name = self._io:read_u4le()
  self.is_string = self._io:read_u1()
  self.value_or_ofs_value = self._io:read_u4le()
end

-- 
-- Name of the property addressed in the strings buffer.
PcfFont.Table.Properties.Prop.property.name = {}
function PcfFont.Table.Properties.Prop.property.name:get()
  if self._m_name ~= nil then
    return self._m_name
  end

  local _io = self._parent.strings._io
  local _pos = _io:pos()
  _io:seek(self.ofs_name)
  self._m_name = str_decode.decode(_io:read_bytes_term(0, false, true, true), "UTF-8")
  _io:seek(_pos)
  return self._m_name
end

-- 
-- Value of the property addressed in the strings
-- buffer, if this is a string value.
PcfFont.Table.Properties.Prop.property.str_value = {}
function PcfFont.Table.Properties.Prop.property.str_value:get()
  if self._m_str_value ~= nil then
    return self._m_str_value
  end

  if self.is_string ~= 0 then
    local _io = self._parent.strings._io
    local _pos = _io:pos()
    _io:seek(self.value_or_ofs_value)
    self._m_str_value = str_decode.decode(_io:read_bytes_term(0, false, true, true), "UTF-8")
    _io:seek(_pos)
  end
  return self._m_str_value
end

-- 
-- Value of the property, if this is an integer value.
PcfFont.Table.Properties.Prop.property.int_value = {}
function PcfFont.Table.Properties.Prop.property.int_value:get()
  if self._m_int_value ~= nil then
    return self._m_int_value
  end

  if self.is_string == 0 then
    self._m_int_value = self.value_or_ofs_value
  end
  return self._m_int_value
end

-- 
-- Offset to name in the strings buffer.
-- 
-- Designates if value is an integer (zero) or a string (non-zero).
-- 
-- If the value is an integer (`is_string` is false),
-- then it's stored here. If the value is a string
-- (`is_string` is true), then it stores offset to the
-- value in the strings buffer.

-- 
-- Table that allows mapping of character codes to glyphs present in the
-- font. Supports 1-byte and 2-byte character codes.
-- 
-- Note that this mapping is agnostic to character encoding itself - it
-- can represent ASCII, Unicode (ISO/IEC 10646), various single-byte
-- national encodings, etc. If application cares about it, normally
-- encoding will be specified in `properties` table, in the properties named
-- `CHARSET_REGISTRY` / `CHARSET_ENCODING`.
-- See also: Source (https://fontforge.org/docs/techref/pcf-format.html#the-encoding-table)
PcfFont.Table.BdfEncodings = class.class(KaitaiStruct)

function PcfFont.Table.BdfEncodings:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PcfFont.Table.BdfEncodings:_read()
  self.format = PcfFont.Format(self._io, self, self._root)
  self.min_char_or_byte2 = self._io:read_u2le()
  self.max_char_or_byte2 = self._io:read_u2le()
  self.min_byte1 = self._io:read_u2le()
  self.max_byte1 = self._io:read_u2le()
  self.default_char = self._io:read_u2le()
  self.glyph_indexes = {}
  for i = 0, (((self.max_char_or_byte2 - self.min_char_or_byte2) + 1) * ((self.max_byte1 - self.min_byte1) + 1)) - 1 do
    self.glyph_indexes[i + 1] = self._io:read_u2le()
  end
end


-- 
-- Table containing character names for every glyph.
-- See also: Source (https://fontforge.org/docs/techref/pcf-format.html#the-glyph-names-table)
PcfFont.Table.GlyphNames = class.class(KaitaiStruct)

function PcfFont.Table.GlyphNames:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PcfFont.Table.GlyphNames:_read()
  self.format = PcfFont.Format(self._io, self, self._root)
  self.num_glyphs = self._io:read_u4le()
  self.names = {}
  for i = 0, self.num_glyphs - 1 do
    self.names[i + 1] = PcfFont.Table.GlyphNames.StringRef(self._io, self, self._root)
  end
  self.len_strings = self._io:read_u4le()
  self._raw_strings = self._io:read_bytes(self.len_strings)
  local _io = KaitaiStream(stringstream(self._raw_strings))
  self.strings = BytesWithIo(_io)
end

-- 
-- Glyph names are represented as string references in strings buffer.
-- 
-- Strings buffer which contains all glyph names.

PcfFont.Table.GlyphNames.StringRef = class.class(KaitaiStruct)

function PcfFont.Table.GlyphNames.StringRef:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PcfFont.Table.GlyphNames.StringRef:_read()
  self.ofs_string = self._io:read_u4le()
end

PcfFont.Table.GlyphNames.StringRef.property.value = {}
function PcfFont.Table.GlyphNames.StringRef.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  local _io = self._parent.strings._io
  local _pos = _io:pos()
  _io:seek(self.ofs_string)
  self._m_value = str_decode.decode(_io:read_bytes_term(0, false, true, true), "UTF-8")
  _io:seek(_pos)
  return self._m_value
end


-- 
-- Table containing uncompressed glyph bitmaps.
-- See also: Source (https://fontforge.org/docs/techref/pcf-format.html#the-bitmap-table)
PcfFont.Table.Bitmaps = class.class(KaitaiStruct)

function PcfFont.Table.Bitmaps:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PcfFont.Table.Bitmaps:_read()
  self.format = PcfFont.Format(self._io, self, self._root)
  self.num_glyphs = self._io:read_u4le()
  self.offsets = {}
  for i = 0, self.num_glyphs - 1 do
    self.offsets[i + 1] = self._io:read_u4le()
  end
  self.bitmap_sizes = {}
  for i = 0, 4 - 1 do
    self.bitmap_sizes[i + 1] = self._io:read_u4le()
  end
end


-- 
-- Table format specifier, always 4 bytes. Original implementation treats
-- it as always little-endian and makes liberal use of bitmasking to parse
-- various parts of it.
-- 
-- TODO: this format specification recognizes endianness and bit
-- order format bits, but it does not really takes any parsing
-- decisions based on them.
-- See also: Source (https://fontforge.org/docs/techref/pcf-format.html#file-header)
PcfFont.Format = class.class(KaitaiStruct)

function PcfFont.Format:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PcfFont.Format:_read()
  self.padding1 = self._io:read_bits_int_be(2)
  self.scan_unit_mask = self._io:read_bits_int_be(2)
  self.is_most_significant_bit_first = self._io:read_bits_int_be(1) ~= 0
  self.is_big_endian = self._io:read_bits_int_be(1) ~= 0
  self.glyph_pad_mask = self._io:read_bits_int_be(2)
  self._io:align_to_byte()
  self.format = self._io:read_u1()
  self.padding = self._io:read_u2le()
end

-- 
-- If set, then all integers in the table are treated as big-endian.

