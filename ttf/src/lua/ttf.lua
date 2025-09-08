-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")
local utils = require("utils")

-- 
-- A TrueType font file contains data, in table format, that comprises
-- an outline font.
-- See also: Source (https://web.archive.org/web/20160410081432/https://www.microsoft.com/typography/tt/ttf_spec/ttch02.doc)
Ttf = class.class(KaitaiStruct)

function Ttf:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ttf:_read()
  self.offset_table = Ttf.OffsetTable(self._io, self, self._root)
  self.directory_table = {}
  for i = 0, self.offset_table.num_tables - 1 do
    self.directory_table[i + 1] = Ttf.DirTableEntry(self._io, self, self._root)
  end
end


-- 
-- cmap - Character To Glyph Index Mapping Table This table defines the mapping of character codes to the glyph index values used in the font.
Ttf.Cmap = class.class(KaitaiStruct)

function Ttf.Cmap:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Cmap:_read()
  self.version_number = self._io:read_u2be()
  self.number_of_encoding_tables = self._io:read_u2be()
  self.tables = {}
  for i = 0, self.number_of_encoding_tables - 1 do
    self.tables[i + 1] = Ttf.Cmap.SubtableHeader(self._io, self, self._root)
  end
end


Ttf.Cmap.Subtable = class.class(KaitaiStruct)

Ttf.Cmap.Subtable.SubtableFormat = enum.Enum {
  byte_encoding_table = 0,
  high_byte_mapping_through_table = 2,
  segment_mapping_to_delta_values = 4,
  trimmed_table_mapping = 6,
}

function Ttf.Cmap.Subtable:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Cmap.Subtable:_read()
  self.format = Ttf.Cmap.Subtable.SubtableFormat(self._io:read_u2be())
  self.length = self._io:read_u2be()
  self.version = self._io:read_u2be()
  local _on = self.format
  if _on == Ttf.Cmap.Subtable.SubtableFormat.byte_encoding_table then
    self._raw_value = self._io:read_bytes(self.length - 6)
    local _io = KaitaiStream(stringstream(self._raw_value))
    self.value = Ttf.Cmap.Subtable.ByteEncodingTable(_io, self, self._root)
  elseif _on == Ttf.Cmap.Subtable.SubtableFormat.high_byte_mapping_through_table then
    self._raw_value = self._io:read_bytes(self.length - 6)
    local _io = KaitaiStream(stringstream(self._raw_value))
    self.value = Ttf.Cmap.Subtable.HighByteMappingThroughTable(_io, self, self._root)
  elseif _on == Ttf.Cmap.Subtable.SubtableFormat.segment_mapping_to_delta_values then
    self._raw_value = self._io:read_bytes(self.length - 6)
    local _io = KaitaiStream(stringstream(self._raw_value))
    self.value = Ttf.Cmap.Subtable.SegmentMappingToDeltaValues(_io, self, self._root)
  elseif _on == Ttf.Cmap.Subtable.SubtableFormat.trimmed_table_mapping then
    self._raw_value = self._io:read_bytes(self.length - 6)
    local _io = KaitaiStream(stringstream(self._raw_value))
    self.value = Ttf.Cmap.Subtable.TrimmedTableMapping(_io, self, self._root)
  else
    self.value = self._io:read_bytes(self.length - 6)
  end
end


Ttf.Cmap.Subtable.ByteEncodingTable = class.class(KaitaiStruct)

function Ttf.Cmap.Subtable.ByteEncodingTable:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Cmap.Subtable.ByteEncodingTable:_read()
  self.glyph_id_array = self._io:read_bytes(256)
end


Ttf.Cmap.Subtable.HighByteMappingThroughTable = class.class(KaitaiStruct)

function Ttf.Cmap.Subtable.HighByteMappingThroughTable:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Cmap.Subtable.HighByteMappingThroughTable:_read()
  self.sub_header_keys = {}
  for i = 0, 256 - 1 do
    self.sub_header_keys[i + 1] = self._io:read_u2be()
  end
end


Ttf.Cmap.Subtable.SegmentMappingToDeltaValues = class.class(KaitaiStruct)

function Ttf.Cmap.Subtable.SegmentMappingToDeltaValues:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Cmap.Subtable.SegmentMappingToDeltaValues:_read()
  self.seg_count_x2 = self._io:read_u2be()
  self.search_range = self._io:read_u2be()
  self.entry_selector = self._io:read_u2be()
  self.range_shift = self._io:read_u2be()
  self.end_count = {}
  for i = 0, self.seg_count - 1 do
    self.end_count[i + 1] = self._io:read_u2be()
  end
  self.reserved_pad = self._io:read_u2be()
  self.start_count = {}
  for i = 0, self.seg_count - 1 do
    self.start_count[i + 1] = self._io:read_u2be()
  end
  self.id_delta = {}
  for i = 0, self.seg_count - 1 do
    self.id_delta[i + 1] = self._io:read_u2be()
  end
  self.id_range_offset = {}
  for i = 0, self.seg_count - 1 do
    self.id_range_offset[i + 1] = self._io:read_u2be()
  end
  self.glyph_id_array = {}
  local i = 0
  while not self._io:is_eof() do
    self.glyph_id_array[i + 1] = self._io:read_u2be()
    i = i + 1
  end
end

Ttf.Cmap.Subtable.SegmentMappingToDeltaValues.property.seg_count = {}
function Ttf.Cmap.Subtable.SegmentMappingToDeltaValues.property.seg_count:get()
  if self._m_seg_count ~= nil then
    return self._m_seg_count
  end

  self._m_seg_count = math.floor(self.seg_count_x2 / 2)
  return self._m_seg_count
end


Ttf.Cmap.Subtable.TrimmedTableMapping = class.class(KaitaiStruct)

function Ttf.Cmap.Subtable.TrimmedTableMapping:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Cmap.Subtable.TrimmedTableMapping:_read()
  self.first_code = self._io:read_u2be()
  self.entry_count = self._io:read_u2be()
  self.glyph_id_array = {}
  for i = 0, self.entry_count - 1 do
    self.glyph_id_array[i + 1] = self._io:read_u2be()
  end
end


Ttf.Cmap.SubtableHeader = class.class(KaitaiStruct)

function Ttf.Cmap.SubtableHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Cmap.SubtableHeader:_read()
  self.platform_id = self._io:read_u2be()
  self.encoding_id = self._io:read_u2be()
  self.subtable_offset = self._io:read_u4be()
end

Ttf.Cmap.SubtableHeader.property.table = {}
function Ttf.Cmap.SubtableHeader.property.table:get()
  if self._m_table ~= nil then
    return self._m_table
  end

  local _io = self._parent._io
  local _pos = _io:pos()
  _io:seek(self.subtable_offset)
  self._m_table = Ttf.Cmap.Subtable(_io, self, self._root)
  _io:seek(_pos)
  return self._m_table
end


-- 
-- cvt  - Control Value Table This table contains a list of values that can be referenced by instructions. They can be used, among other things, to control characteristics for different glyphs.
Ttf.Cvt = class.class(KaitaiStruct)

function Ttf.Cvt:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Cvt:_read()
  self.fwords = {}
  local i = 0
  while not self._io:is_eof() do
    self.fwords[i + 1] = self._io:read_s2be()
    i = i + 1
  end
end


Ttf.DirTableEntry = class.class(KaitaiStruct)

function Ttf.DirTableEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.DirTableEntry:_read()
  self.tag = str_decode.decode(self._io:read_bytes(4), "ASCII")
  self.checksum = self._io:read_u4be()
  self.offset = self._io:read_u4be()
  self.length = self._io:read_u4be()
end

Ttf.DirTableEntry.property.value = {}
function Ttf.DirTableEntry.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.offset)
  local _on = self.tag
  if _on == "OS/2" then
    self._raw__m_value = _io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw__m_value))
    self._m_value = Ttf.Os2(_io, self, self._root)
  elseif _on == "cmap" then
    self._raw__m_value = _io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw__m_value))
    self._m_value = Ttf.Cmap(_io, self, self._root)
  elseif _on == "cvt " then
    self._raw__m_value = _io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw__m_value))
    self._m_value = Ttf.Cvt(_io, self, self._root)
  elseif _on == "fpgm" then
    self._raw__m_value = _io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw__m_value))
    self._m_value = Ttf.Fpgm(_io, self, self._root)
  elseif _on == "glyf" then
    self._raw__m_value = _io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw__m_value))
    self._m_value = Ttf.Glyf(_io, self, self._root)
  elseif _on == "head" then
    self._raw__m_value = _io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw__m_value))
    self._m_value = Ttf.Head(_io, self, self._root)
  elseif _on == "hhea" then
    self._raw__m_value = _io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw__m_value))
    self._m_value = Ttf.Hhea(_io, self, self._root)
  elseif _on == "kern" then
    self._raw__m_value = _io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw__m_value))
    self._m_value = Ttf.Kern(_io, self, self._root)
  elseif _on == "maxp" then
    self._raw__m_value = _io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw__m_value))
    self._m_value = Ttf.Maxp(_io, self, self._root)
  elseif _on == "name" then
    self._raw__m_value = _io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw__m_value))
    self._m_value = Ttf.Name(_io, self, self._root)
  elseif _on == "post" then
    self._raw__m_value = _io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw__m_value))
    self._m_value = Ttf.Post(_io, self, self._root)
  elseif _on == "prep" then
    self._raw__m_value = _io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw__m_value))
    self._m_value = Ttf.Prep(_io, self, self._root)
  else
    self._m_value = _io:read_bytes(self.length)
  end
  _io:seek(_pos)
  return self._m_value
end


Ttf.Fixed = class.class(KaitaiStruct)

function Ttf.Fixed:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Fixed:_read()
  self.major = self._io:read_u2be()
  self.minor = self._io:read_u2be()
end


Ttf.Fpgm = class.class(KaitaiStruct)

function Ttf.Fpgm:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Fpgm:_read()
  self.instructions = self._io:read_bytes_full()
end


Ttf.Glyf = class.class(KaitaiStruct)

function Ttf.Glyf:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Glyf:_read()
  self.number_of_contours = self._io:read_s2be()
  self.x_min = self._io:read_s2be()
  self.y_min = self._io:read_s2be()
  self.x_max = self._io:read_s2be()
  self.y_max = self._io:read_s2be()
  if self.number_of_contours > 0 then
    self.value = Ttf.Glyf.SimpleGlyph(self._io, self, self._root)
  end
end


Ttf.Glyf.SimpleGlyph = class.class(KaitaiStruct)

function Ttf.Glyf.SimpleGlyph:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Glyf.SimpleGlyph:_read()
  self.end_pts_of_contours = {}
  for i = 0, self._parent.number_of_contours - 1 do
    self.end_pts_of_contours[i + 1] = self._io:read_u2be()
  end
  self.instruction_length = self._io:read_u2be()
  self.instructions = self._io:read_bytes(self.instruction_length)
  self.flags = {}
  for i = 0, self.point_count - 1 do
    self.flags[i + 1] = Ttf.Glyf.SimpleGlyph.Flag(self._io, self, self._root)
  end
end

Ttf.Glyf.SimpleGlyph.property.point_count = {}
function Ttf.Glyf.SimpleGlyph.property.point_count:get()
  if self._m_point_count ~= nil then
    return self._m_point_count
  end

  self._m_point_count = utils.array_max(self.end_pts_of_contours) + 1
  return self._m_point_count
end


Ttf.Glyf.SimpleGlyph.Flag = class.class(KaitaiStruct)

function Ttf.Glyf.SimpleGlyph.Flag:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Glyf.SimpleGlyph.Flag:_read()
  self.reserved = self._io:read_bits_int_be(2)
  self.y_is_same = self._io:read_bits_int_be(1) ~= 0
  self.x_is_same = self._io:read_bits_int_be(1) ~= 0
  self.repeat = self._io:read_bits_int_be(1) ~= 0
  self.y_short_vector = self._io:read_bits_int_be(1) ~= 0
  self.x_short_vector = self._io:read_bits_int_be(1) ~= 0
  self.on_curve = self._io:read_bits_int_be(1) ~= 0
  self._io:align_to_byte()
  if self.repeat then
    self.repeat_value = self._io:read_u1()
  end
end


Ttf.Head = class.class(KaitaiStruct)

Ttf.Head.Flags = enum.Enum {
  baseline_at_y0 = 1,
  left_sidebearing_at_x0 = 2,
  flag_depend_on_point_size = 4,
  flag_force_ppem = 8,
  flag_may_advance_width = 16,
}

Ttf.Head.FontDirectionHint = enum.Enum {
  fully_mixed_directional_glyphs = 0,
  only_strongly_left_to_right = 1,
  strongly_left_to_right_and_neutrals = 2,
}

function Ttf.Head:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Head:_read()
  self.version = Ttf.Fixed(self._io, self, self._root)
  self.font_revision = Ttf.Fixed(self._io, self, self._root)
  self.checksum_adjustment = self._io:read_u4be()
  self.magic_number = self._io:read_bytes(4)
  if not(self.magic_number == "\095\015\060\245") then
    error("not equal, expected " .. "\095\015\060\245" .. ", but got " .. self.magic_number)
  end
  self.flags = Ttf.Head.Flags(self._io:read_u2be())
  self.units_per_em = self._io:read_u2be()
  self.created = self._io:read_u8be()
  self.modified = self._io:read_u8be()
  self.x_min = self._io:read_s2be()
  self.y_min = self._io:read_s2be()
  self.x_max = self._io:read_s2be()
  self.y_max = self._io:read_s2be()
  self.mac_style = self._io:read_u2be()
  self.lowest_rec_ppem = self._io:read_u2be()
  self.font_direction_hint = Ttf.Head.FontDirectionHint(self._io:read_s2be())
  self.index_to_loc_format = self._io:read_s2be()
  self.glyph_data_format = self._io:read_s2be()
end


Ttf.Hhea = class.class(KaitaiStruct)

function Ttf.Hhea:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Hhea:_read()
  self.version = Ttf.Fixed(self._io, self, self._root)
  self.ascender = self._io:read_s2be()
  self.descender = self._io:read_s2be()
  self.line_gap = self._io:read_s2be()
  self.advance_width_max = self._io:read_u2be()
  self.min_left_side_bearing = self._io:read_s2be()
  self.min_right_side_bearing = self._io:read_s2be()
  self.x_max_extend = self._io:read_s2be()
  self.caret_slope_rise = self._io:read_s2be()
  self.caret_slope_run = self._io:read_s2be()
  self.reserved = self._io:read_bytes(10)
  if not(self.reserved == "\000\000\000\000\000\000\000\000\000\000") then
    error("not equal, expected " .. "\000\000\000\000\000\000\000\000\000\000" .. ", but got " .. self.reserved)
  end
  self.metric_data_format = self._io:read_s2be()
  self.number_of_hmetrics = self._io:read_u2be()
end

-- 
-- Typographic ascent.
-- 
-- Typographic descent.
-- 
-- Typographic line gap. Negative LineGap values are treated as zero in Windows 3.1, System 6, and System 7.
-- 
-- Maximum advance width value in `hmtx` table.
-- 
-- Minimum left sidebearing value in `hmtx` table.
-- 
-- Minimum right sidebearing value; calculated as Min(aw - lsb - (xMax - xMin)).
-- 
-- Max(lsb + (xMax - xMin)).

Ttf.Kern = class.class(KaitaiStruct)

function Ttf.Kern:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Kern:_read()
  self.version = self._io:read_u2be()
  self.subtable_count = self._io:read_u2be()
  self.subtables = {}
  for i = 0, self.subtable_count - 1 do
    self.subtables[i + 1] = Ttf.Kern.Subtable(self._io, self, self._root)
  end
end


Ttf.Kern.Subtable = class.class(KaitaiStruct)

function Ttf.Kern.Subtable:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Kern.Subtable:_read()
  self.version = self._io:read_u2be()
  self.length = self._io:read_u2be()
  self.format = self._io:read_u1()
  self.reserved = self._io:read_bits_int_be(4)
  self.is_override = self._io:read_bits_int_be(1) ~= 0
  self.is_cross_stream = self._io:read_bits_int_be(1) ~= 0
  self.is_minimum = self._io:read_bits_int_be(1) ~= 0
  self.is_horizontal = self._io:read_bits_int_be(1) ~= 0
  self._io:align_to_byte()
  if self.format == 0 then
    self.format0 = Ttf.Kern.Subtable.Format0(self._io, self, self._root)
  end
end


Ttf.Kern.Subtable.Format0 = class.class(KaitaiStruct)

function Ttf.Kern.Subtable.Format0:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Kern.Subtable.Format0:_read()
  self.pair_count = self._io:read_u2be()
  self.search_range = self._io:read_u2be()
  self.entry_selector = self._io:read_u2be()
  self.range_shift = self._io:read_u2be()
  self.kerning_pairs = {}
  for i = 0, self.pair_count - 1 do
    self.kerning_pairs[i + 1] = Ttf.Kern.Subtable.Format0.KerningPair(self._io, self, self._root)
  end
end


Ttf.Kern.Subtable.Format0.KerningPair = class.class(KaitaiStruct)

function Ttf.Kern.Subtable.Format0.KerningPair:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Kern.Subtable.Format0.KerningPair:_read()
  self.left = self._io:read_u2be()
  self.right = self._io:read_u2be()
  self.value = self._io:read_s2be()
end


Ttf.Maxp = class.class(KaitaiStruct)

function Ttf.Maxp:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Maxp:_read()
  self.table_version_number = Ttf.Fixed(self._io, self, self._root)
  self.num_glyphs = self._io:read_u2be()
  if self.is_version10 then
    self.version10_body = Ttf.MaxpVersion10Body(self._io, self, self._root)
  end
end

Ttf.Maxp.property.is_version10 = {}
function Ttf.Maxp.property.is_version10:get()
  if self._m_is_version10 ~= nil then
    return self._m_is_version10
  end

  self._m_is_version10 =  ((self.table_version_number.major == 1) and (self.table_version_number.minor == 0)) 
  return self._m_is_version10
end

-- 
-- 0x00010000 for version 1.0.
-- 
-- The number of glyphs in the font.

Ttf.MaxpVersion10Body = class.class(KaitaiStruct)

function Ttf.MaxpVersion10Body:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.MaxpVersion10Body:_read()
  self.max_points = self._io:read_u2be()
  self.max_contours = self._io:read_u2be()
  self.max_composite_points = self._io:read_u2be()
  self.max_composite_contours = self._io:read_u2be()
  self.max_zones = self._io:read_u2be()
  self.max_twilight_points = self._io:read_u2be()
  self.max_storage = self._io:read_u2be()
  self.max_function_defs = self._io:read_u2be()
  self.max_instruction_defs = self._io:read_u2be()
  self.max_stack_elements = self._io:read_u2be()
  self.max_size_of_instructions = self._io:read_u2be()
  self.max_component_elements = self._io:read_u2be()
  self.max_component_depth = self._io:read_u2be()
end

-- 
-- Maximum points in a non-composite glyph.
-- 
-- Maximum contours in a non-composite glyph.
-- 
-- Maximum points in a composite glyph.
-- 
-- Maximum contours in a composite glyph.
-- 
-- 1 if instructions do not use the twilight zone (Z0), or 2 if instructions do use Z0; should be set to 2 in most cases.
-- 
-- Maximum points used in Z0.
-- 
-- Number of Storage Area locations.
-- 
-- Number of FDEFs.
-- 
-- Number of IDEFs.
-- 
-- Maximum stack depth.
-- 
-- Maximum byte count for glyph instructions.
-- 
-- Maximum number of components referenced at "top level" for any composite glyph.
-- 
-- Maximum levels of recursion; 1 for simple components.

-- 
-- Name table is meant to include human-readable string metadata
-- that describes font: name of the font, its styles, copyright &
-- trademark notices, vendor and designer info, etc.
-- 
-- The table includes a list of "name records", each of which
-- corresponds to a single metadata entry.
-- See also: Source (https://developer.apple.com/fonts/TrueType-Reference-Manual/RM06/Chap6name.html)
Ttf.Name = class.class(KaitaiStruct)

Ttf.Name.Names = enum.Enum {
  copyright = 0,
  font_family = 1,
  font_subfamily = 2,
  unique_subfamily_id = 3,
  full_font_name = 4,
  name_table_version = 5,
  postscript_font_name = 6,
  trademark = 7,
  manufacturer = 8,
  designer = 9,
  description = 10,
  url_vendor = 11,
  url_designer = 12,
  license = 13,
  url_license = 14,
  reserved_15 = 15,
  preferred_family = 16,
  preferred_subfamily = 17,
  compatible_full_name = 18,
  sample_text = 19,
}

Ttf.Name.Platforms = enum.Enum {
  unicode = 0,
  macintosh = 1,
  reserved_2 = 2,
  microsoft = 3,
}

function Ttf.Name:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Name:_read()
  self.format_selector = self._io:read_u2be()
  self.num_name_records = self._io:read_u2be()
  self.ofs_strings = self._io:read_u2be()
  self.name_records = {}
  for i = 0, self.num_name_records - 1 do
    self.name_records[i + 1] = Ttf.Name.NameRecord(self._io, self, self._root)
  end
end


Ttf.Name.NameRecord = class.class(KaitaiStruct)

function Ttf.Name.NameRecord:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Name.NameRecord:_read()
  self.platform_id = Ttf.Name.Platforms(self._io:read_u2be())
  self.encoding_id = self._io:read_u2be()
  self.language_id = self._io:read_u2be()
  self.name_id = Ttf.Name.Names(self._io:read_u2be())
  self.len_str = self._io:read_u2be()
  self.ofs_str = self._io:read_u2be()
end

Ttf.Name.NameRecord.property.ascii_value = {}
function Ttf.Name.NameRecord.property.ascii_value:get()
  if self._m_ascii_value ~= nil then
    return self._m_ascii_value
  end

  local _io = self._parent._io
  local _pos = _io:pos()
  _io:seek(self._parent.ofs_strings + self.ofs_str)
  self._m_ascii_value = str_decode.decode(_io:read_bytes(self.len_str), "ASCII")
  _io:seek(_pos)
  return self._m_ascii_value
end

Ttf.Name.NameRecord.property.unicode_value = {}
function Ttf.Name.NameRecord.property.unicode_value:get()
  if self._m_unicode_value ~= nil then
    return self._m_unicode_value
  end

  local _io = self._parent._io
  local _pos = _io:pos()
  _io:seek(self._parent.ofs_strings + self.ofs_str)
  self._m_unicode_value = str_decode.decode(_io:read_bytes(self.len_str), "UTF-16BE")
  _io:seek(_pos)
  return self._m_unicode_value
end


Ttf.OffsetTable = class.class(KaitaiStruct)

function Ttf.OffsetTable:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.OffsetTable:_read()
  self.sfnt_version = Ttf.Fixed(self._io, self, self._root)
  self.num_tables = self._io:read_u2be()
  self.search_range = self._io:read_u2be()
  self.entry_selector = self._io:read_u2be()
  self.range_shift = self._io:read_u2be()
end


-- 
-- The OS/2 table consists of a set of metrics that are required by Windows and OS/2.
Ttf.Os2 = class.class(KaitaiStruct)

Ttf.Os2.FsSelection = enum.Enum {
  italic = 1,
  underscore = 2,
  negative = 4,
  outlined = 8,
  strikeout = 16,
  bold = 32,
  regular = 64,
}

Ttf.Os2.FsType = enum.Enum {
  restricted_license_embedding = 2,
  preview_and_print_embedding = 4,
  editable_embedding = 8,
}

Ttf.Os2.WeightClass = enum.Enum {
  thin = 100,
  extra_light = 200,
  light = 300,
  normal = 400,
  medium = 500,
  semi_bold = 600,
  bold = 700,
  extra_bold = 800,
  black = 900,
}

Ttf.Os2.WidthClass = enum.Enum {
  ultra_condensed = 1,
  extra_condensed = 2,
  condensed = 3,
  semi_condensed = 4,
  normal = 5,
  semi_expanded = 6,
  expanded = 7,
  extra_expanded = 8,
  ultra_expanded = 9,
}

function Ttf.Os2:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Os2:_read()
  self.version = self._io:read_u2be()
  self.x_avg_char_width = self._io:read_s2be()
  self.weight_class = Ttf.Os2.WeightClass(self._io:read_u2be())
  self.width_class = Ttf.Os2.WidthClass(self._io:read_u2be())
  self.fs_type = Ttf.Os2.FsType(self._io:read_s2be())
  self.y_subscript_x_size = self._io:read_s2be()
  self.y_subscript_y_size = self._io:read_s2be()
  self.y_subscript_x_offset = self._io:read_s2be()
  self.y_subscript_y_offset = self._io:read_s2be()
  self.y_superscript_x_size = self._io:read_s2be()
  self.y_superscript_y_size = self._io:read_s2be()
  self.y_superscript_x_offset = self._io:read_s2be()
  self.y_superscript_y_offset = self._io:read_s2be()
  self.y_strikeout_size = self._io:read_s2be()
  self.y_strikeout_position = self._io:read_s2be()
  self.s_family_class = self._io:read_s2be()
  self.panose = Ttf.Os2.Panose(self._io, self, self._root)
  self.unicode_range = Ttf.Os2.UnicodeRange(self._io, self, self._root)
  self.ach_vend_id = str_decode.decode(self._io:read_bytes(4), "ASCII")
  self.selection = Ttf.Os2.FsSelection(self._io:read_u2be())
  self.first_char_index = self._io:read_u2be()
  self.last_char_index = self._io:read_u2be()
  self.typo_ascender = self._io:read_s2be()
  self.typo_descender = self._io:read_s2be()
  self.typo_line_gap = self._io:read_s2be()
  self.win_ascent = self._io:read_u2be()
  self.win_descent = self._io:read_u2be()
  self.code_page_range = Ttf.Os2.CodePageRange(self._io, self, self._root)
end

-- 
-- The version number for this OS/2 table.
-- 
-- The Average Character Width parameter specifies the arithmetic average of the escapement (width) of all of the 26 lowercase letters a through z of the Latin alphabet and the space character. If any of the 26 lowercase letters are not present, this parameter should equal the weighted average of all glyphs in the font. For non-UGL (platform 3, encoding 0) fonts, use the unweighted average.
-- 
-- Indicates the visual weight (degree of blackness or thickness of strokes) of the characters in the font.
-- 
-- Indicates a relative change from the normal aspect ratio (width to height ratio) as specified by a font designer for the glyphs in a font.
-- 
-- Indicates font embedding licensing rights for the font. Embeddable fonts may be stored in a document. When a document with embedded fonts is opened on a system that does not have the font installed (the remote system), the embedded font may be loaded for temporary (and in some cases, permanent) use on that system by an embedding-aware application. Embedding licensing rights are granted by the vendor of the font.
-- 
-- The recommended horizontal size in font design units for subscripts for this font.
-- 
-- The recommended vertical size in font design units for subscripts for this font.
-- 
-- The recommended horizontal offset in font design untis for subscripts for this font.
-- 
-- The recommended vertical offset in font design units from the baseline for subscripts for this font.
-- 
-- The recommended horizontal size in font design units for superscripts for this font.
-- 
-- The recommended vertical size in font design units for superscripts for this font.
-- 
-- The recommended horizontal offset in font design units for superscripts for this font.
-- 
-- The recommended vertical offset in font design units from the baseline for superscripts for this font.
-- 
-- Width of the strikeout stroke in font design units.
-- 
-- The position of the strikeout stroke relative to the baseline in font design units.
-- 
-- This parameter is a classification of font-family design.
-- 
-- The four character identifier for the vendor of the given type face.
-- 
-- Contains information concerning the nature of the font patterns.
-- 
-- The minimum Unicode index (character code) in this font, according to the cmap subtable for platform ID 3 and encoding ID 0 or 1.
-- 
-- The maximum Unicode index (character code) in this font, according to the cmap subtable for platform ID 3 and encoding ID 0 or 1.
-- 
-- The typographic ascender for this font.
-- 
-- The typographic descender for this font.
-- 
-- The typographic line gap for this font.
-- 
-- The ascender metric for Windows.
-- 
-- The descender metric for Windows.
-- 
-- This field is used to specify the code pages encompassed by the font file in the `cmap` subtable for platform 3, encoding ID 1 (Microsoft platform).

Ttf.Os2.CodePageRange = class.class(KaitaiStruct)

function Ttf.Os2.CodePageRange:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Os2.CodePageRange:_read()
  self.symbol_character_set = self._io:read_bits_int_be(1) ~= 0
  self.oem_character_set = self._io:read_bits_int_be(1) ~= 0
  self.macintosh_character_set = self._io:read_bits_int_be(1) ~= 0
  self.reserved_for_alternate_ansi_oem = self._io:read_bits_int_be(7)
  self.cp1361_korean_johab = self._io:read_bits_int_be(1) ~= 0
  self.cp950_chinese_traditional_chars_taiwan_and_hong_kong = self._io:read_bits_int_be(1) ~= 0
  self.cp949_korean_wansung = self._io:read_bits_int_be(1) ~= 0
  self.cp936_chinese_simplified_chars_prc_and_singapore = self._io:read_bits_int_be(1) ~= 0
  self.cp932_jis_japan = self._io:read_bits_int_be(1) ~= 0
  self.cp874_thai = self._io:read_bits_int_be(1) ~= 0
  self.reserved_for_alternate_ansi = self._io:read_bits_int_be(8)
  self.cp1257_windows_baltic = self._io:read_bits_int_be(1) ~= 0
  self.cp1256_arabic = self._io:read_bits_int_be(1) ~= 0
  self.cp1255_hebrew = self._io:read_bits_int_be(1) ~= 0
  self.cp1254_turkish = self._io:read_bits_int_be(1) ~= 0
  self.cp1253_greek = self._io:read_bits_int_be(1) ~= 0
  self.cp1251_cyrillic = self._io:read_bits_int_be(1) ~= 0
  self.cp1250_latin_2_eastern_europe = self._io:read_bits_int_be(1) ~= 0
  self.cp1252_latin_1 = self._io:read_bits_int_be(1) ~= 0
  self.cp437_us = self._io:read_bits_int_be(1) ~= 0
  self.cp850_we_latin_1 = self._io:read_bits_int_be(1) ~= 0
  self.cp708_arabic_asmo_708 = self._io:read_bits_int_be(1) ~= 0
  self.cp737_greek_former_437_g = self._io:read_bits_int_be(1) ~= 0
  self.cp775_ms_dos_baltic = self._io:read_bits_int_be(1) ~= 0
  self.cp852_latin_2 = self._io:read_bits_int_be(1) ~= 0
  self.cp855_ibm_cyrillic_primarily_russian = self._io:read_bits_int_be(1) ~= 0
  self.cp857_ibm_turkish = self._io:read_bits_int_be(1) ~= 0
  self.cp860_ms_dos_portuguese = self._io:read_bits_int_be(1) ~= 0
  self.cp861_ms_dos_icelandic = self._io:read_bits_int_be(1) ~= 0
  self.cp862_hebrew = self._io:read_bits_int_be(1) ~= 0
  self.cp863_ms_dos_canadian_french = self._io:read_bits_int_be(1) ~= 0
  self.cp864_arabic = self._io:read_bits_int_be(1) ~= 0
  self.cp865_ms_dos_nordic = self._io:read_bits_int_be(1) ~= 0
  self.cp866_ms_dos_russian = self._io:read_bits_int_be(1) ~= 0
  self.cp869_ibm_greek = self._io:read_bits_int_be(1) ~= 0
  self.reserved_for_oem = self._io:read_bits_int_be(16)
end


Ttf.Os2.Panose = class.class(KaitaiStruct)

Ttf.Os2.Panose.ArmStyle = enum.Enum {
  any = 0,
  no_fit = 1,
  straight_arms_horizontal = 2,
  straight_arms_wedge = 3,
  straight_arms_vertical = 4,
  straight_arms_single_serif = 5,
  straight_arms_double_serif = 6,
  non_straight_arms_horizontal = 7,
  non_straight_arms_wedge = 8,
  non_straight_arms_vertical = 9,
  non_straight_arms_single_serif = 10,
  non_straight_arms_double_serif = 11,
}

Ttf.Os2.Panose.Contrast = enum.Enum {
  any = 0,
  no_fit = 1,
  none = 2,
  very_low = 3,
  low = 4,
  medium_low = 5,
  medium = 6,
  medium_high = 7,
  high = 8,
  very_high = 9,
}

Ttf.Os2.Panose.FamilyKind = enum.Enum {
  any = 0,
  no_fit = 1,
  text_and_display = 2,
  script = 3,
  decorative = 4,
  pictorial = 5,
}

Ttf.Os2.Panose.LetterForm = enum.Enum {
  any = 0,
  no_fit = 1,
  normal_contact = 2,
  normal_weighted = 3,
  normal_boxed = 4,
  normal_flattened = 5,
  normal_rounded = 6,
  normal_off_center = 7,
  normal_square = 8,
  oblique_contact = 9,
  oblique_weighted = 10,
  oblique_boxed = 11,
  oblique_flattened = 12,
  oblique_rounded = 13,
  oblique_off_center = 14,
  oblique_square = 15,
}

Ttf.Os2.Panose.Midline = enum.Enum {
  any = 0,
  no_fit = 1,
  standard_trimmed = 2,
  standard_pointed = 3,
  standard_serifed = 4,
  high_trimmed = 5,
  high_pointed = 6,
  high_serifed = 7,
  constant_trimmed = 8,
  constant_pointed = 9,
  constant_serifed = 10,
  low_trimmed = 11,
  low_pointed = 12,
  low_serifed = 13,
}

Ttf.Os2.Panose.Proportion = enum.Enum {
  any = 0,
  no_fit = 1,
  old_style = 2,
  modern = 3,
  even_width = 4,
  expanded = 5,
  condensed = 6,
  very_expanded = 7,
  very_condensed = 8,
  monospaced = 9,
}

Ttf.Os2.Panose.SerifStyle = enum.Enum {
  any = 0,
  no_fit = 1,
  cove = 2,
  obtuse_cove = 3,
  square_cove = 4,
  obtuse_square_cove = 5,
  square = 6,
  thin = 7,
  bone = 8,
  exaggerated = 9,
  triangle = 10,
  normal_sans = 11,
  obtuse_sans = 12,
  perp_sans = 13,
  flared = 14,
  rounded = 15,
}

Ttf.Os2.Panose.StrokeVariation = enum.Enum {
  any = 0,
  no_fit = 1,
  gradual_diagonal = 2,
  gradual_transitional = 3,
  gradual_vertical = 4,
  gradual_horizontal = 5,
  rapid_vertical = 6,
  rapid_horizontal = 7,
  instant_vertical = 8,
}

Ttf.Os2.Panose.Weight = enum.Enum {
  any = 0,
  no_fit = 1,
  very_light = 2,
  light = 3,
  thin = 4,
  book = 5,
  medium = 6,
  demi = 7,
  bold = 8,
  heavy = 9,
  black = 10,
  nord = 11,
}

Ttf.Os2.Panose.XHeight = enum.Enum {
  any = 0,
  no_fit = 1,
  constant_small = 2,
  constant_standard = 3,
  constant_large = 4,
  ducking_small = 5,
  ducking_standard = 6,
  ducking_large = 7,
}

function Ttf.Os2.Panose:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Os2.Panose:_read()
  self.family_type = Ttf.Os2.Panose.FamilyKind(self._io:read_u1())
  self.serif_style = Ttf.Os2.Panose.SerifStyle(self._io:read_u1())
  self.weight = Ttf.Os2.Panose.Weight(self._io:read_u1())
  self.proportion = Ttf.Os2.Panose.Proportion(self._io:read_u1())
  self.contrast = Ttf.Os2.Panose.Contrast(self._io:read_u1())
  self.stroke_variation = Ttf.Os2.Panose.StrokeVariation(self._io:read_u1())
  self.arm_style = Ttf.Os2.Panose.ArmStyle(self._io:read_u1())
  self.letter_form = Ttf.Os2.Panose.LetterForm(self._io:read_u1())
  self.midline = Ttf.Os2.Panose.Midline(self._io:read_u1())
  self.x_height = Ttf.Os2.Panose.XHeight(self._io:read_u1())
end


Ttf.Os2.UnicodeRange = class.class(KaitaiStruct)

function Ttf.Os2.UnicodeRange:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Os2.UnicodeRange:_read()
  self.basic_latin = self._io:read_bits_int_be(1) ~= 0
  self.latin_1_supplement = self._io:read_bits_int_be(1) ~= 0
  self.latin_extended_a = self._io:read_bits_int_be(1) ~= 0
  self.latin_extended_b = self._io:read_bits_int_be(1) ~= 0
  self.ipa_extensions = self._io:read_bits_int_be(1) ~= 0
  self.spacing_modifier_letters = self._io:read_bits_int_be(1) ~= 0
  self.combining_diacritical_marks = self._io:read_bits_int_be(1) ~= 0
  self.basic_greek = self._io:read_bits_int_be(1) ~= 0
  self.greek_symbols_and_coptic = self._io:read_bits_int_be(1) ~= 0
  self.cyrillic = self._io:read_bits_int_be(1) ~= 0
  self.armenian = self._io:read_bits_int_be(1) ~= 0
  self.basic_hebrew = self._io:read_bits_int_be(1) ~= 0
  self.hebrew_extended = self._io:read_bits_int_be(1) ~= 0
  self.basic_arabic = self._io:read_bits_int_be(1) ~= 0
  self.arabic_extended = self._io:read_bits_int_be(1) ~= 0
  self.devanagari = self._io:read_bits_int_be(1) ~= 0
  self.bengali = self._io:read_bits_int_be(1) ~= 0
  self.gurmukhi = self._io:read_bits_int_be(1) ~= 0
  self.gujarati = self._io:read_bits_int_be(1) ~= 0
  self.oriya = self._io:read_bits_int_be(1) ~= 0
  self.tamil = self._io:read_bits_int_be(1) ~= 0
  self.telugu = self._io:read_bits_int_be(1) ~= 0
  self.kannada = self._io:read_bits_int_be(1) ~= 0
  self.malayalam = self._io:read_bits_int_be(1) ~= 0
  self.thai = self._io:read_bits_int_be(1) ~= 0
  self.lao = self._io:read_bits_int_be(1) ~= 0
  self.basic_georgian = self._io:read_bits_int_be(1) ~= 0
  self.georgian_extended = self._io:read_bits_int_be(1) ~= 0
  self.hangul_jamo = self._io:read_bits_int_be(1) ~= 0
  self.latin_extended_additional = self._io:read_bits_int_be(1) ~= 0
  self.greek_extended = self._io:read_bits_int_be(1) ~= 0
  self.general_punctuation = self._io:read_bits_int_be(1) ~= 0
  self.superscripts_and_subscripts = self._io:read_bits_int_be(1) ~= 0
  self.currency_symbols = self._io:read_bits_int_be(1) ~= 0
  self.combining_diacritical_marks_for_symbols = self._io:read_bits_int_be(1) ~= 0
  self.letterlike_symbols = self._io:read_bits_int_be(1) ~= 0
  self.number_forms = self._io:read_bits_int_be(1) ~= 0
  self.arrows = self._io:read_bits_int_be(1) ~= 0
  self.mathematical_operators = self._io:read_bits_int_be(1) ~= 0
  self.miscellaneous_technical = self._io:read_bits_int_be(1) ~= 0
  self.control_pictures = self._io:read_bits_int_be(1) ~= 0
  self.optical_character_recognition = self._io:read_bits_int_be(1) ~= 0
  self.enclosed_alphanumerics = self._io:read_bits_int_be(1) ~= 0
  self.box_drawing = self._io:read_bits_int_be(1) ~= 0
  self.block_elements = self._io:read_bits_int_be(1) ~= 0
  self.geometric_shapes = self._io:read_bits_int_be(1) ~= 0
  self.miscellaneous_symbols = self._io:read_bits_int_be(1) ~= 0
  self.dingbats = self._io:read_bits_int_be(1) ~= 0
  self.cjk_symbols_and_punctuation = self._io:read_bits_int_be(1) ~= 0
  self.hiragana = self._io:read_bits_int_be(1) ~= 0
  self.katakana = self._io:read_bits_int_be(1) ~= 0
  self.bopomofo = self._io:read_bits_int_be(1) ~= 0
  self.hangul_compatibility_jamo = self._io:read_bits_int_be(1) ~= 0
  self.cjk_miscellaneous = self._io:read_bits_int_be(1) ~= 0
  self.enclosed_cjk_letters_and_months = self._io:read_bits_int_be(1) ~= 0
  self.cjk_compatibility = self._io:read_bits_int_be(1) ~= 0
  self.hangul = self._io:read_bits_int_be(1) ~= 0
  self.reserved_for_unicode_subranges1 = self._io:read_bits_int_be(1) ~= 0
  self.reserved_for_unicode_subranges2 = self._io:read_bits_int_be(1) ~= 0
  self.cjk_unified_ideographs = self._io:read_bits_int_be(1) ~= 0
  self.private_use_area = self._io:read_bits_int_be(1) ~= 0
  self.cjk_compatibility_ideographs = self._io:read_bits_int_be(1) ~= 0
  self.alphabetic_presentation_forms = self._io:read_bits_int_be(1) ~= 0
  self.arabic_presentation_forms_a = self._io:read_bits_int_be(1) ~= 0
  self.combining_half_marks = self._io:read_bits_int_be(1) ~= 0
  self.cjk_compatibility_forms = self._io:read_bits_int_be(1) ~= 0
  self.small_form_variants = self._io:read_bits_int_be(1) ~= 0
  self.arabic_presentation_forms_b = self._io:read_bits_int_be(1) ~= 0
  self.halfwidth_and_fullwidth_forms = self._io:read_bits_int_be(1) ~= 0
  self.specials = self._io:read_bits_int_be(1) ~= 0
  self._io:align_to_byte()
  self.reserved = self._io:read_bytes(7)
end


Ttf.Post = class.class(KaitaiStruct)

function Ttf.Post:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Post:_read()
  self.format = Ttf.Fixed(self._io, self, self._root)
  self.italic_angle = Ttf.Fixed(self._io, self, self._root)
  self.underline_position = self._io:read_s2be()
  self.underline_thichness = self._io:read_s2be()
  self.is_fixed_pitch = self._io:read_u4be()
  self.min_mem_type42 = self._io:read_u4be()
  self.max_mem_type42 = self._io:read_u4be()
  self.min_mem_type1 = self._io:read_u4be()
  self.max_mem_type1 = self._io:read_u4be()
  if  ((self.format.major == 2) and (self.format.minor == 0))  then
    self.format20 = Ttf.Post.Format20(self._io, self, self._root)
  end
end


Ttf.Post.Format20 = class.class(KaitaiStruct)

function Ttf.Post.Format20:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Post.Format20:_read()
  self.number_of_glyphs = self._io:read_u2be()
  self.glyph_name_index = {}
  for i = 0, self.number_of_glyphs - 1 do
    self.glyph_name_index[i + 1] = self._io:read_u2be()
  end
  self.glyph_names = {}
  local i = 0
  while true do
    local _ = Ttf.Post.Format20.PascalString(self._io, self, self._root)
    self.glyph_names[i + 1] = _
    if  ((_.length == 0) or (self._io:is_eof()))  then
      break
    end
    i = i + 1
  end
end


Ttf.Post.Format20.PascalString = class.class(KaitaiStruct)

function Ttf.Post.Format20.PascalString:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Post.Format20.PascalString:_read()
  self.length = self._io:read_u1()
  if self.length ~= 0 then
    self.value = str_decode.decode(self._io:read_bytes(self.length), "ASCII")
  end
end


Ttf.Prep = class.class(KaitaiStruct)

function Ttf.Prep:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ttf.Prep:_read()
  self.instructions = self._io:read_bytes_full()
end


