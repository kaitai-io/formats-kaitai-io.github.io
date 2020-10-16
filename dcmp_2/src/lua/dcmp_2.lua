-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local utils = require("utils")
local stringstream = require("string_stream")

-- 
-- Compressed resource data in `'dcmp' (2)` format,
-- as stored in compressed resources with header type `9` and decompressor ID `2`.
-- 
-- The `'dcmp' (2)` decompressor resource is included in the System file of System 7.0 and later.
-- This compression format is used for a few compressed resources in System 7.0's files
-- (such as the System file).
-- This decompressor is also included with and used by some other Apple applications,
-- such as ResEdit.
-- (Note: ResEdit includes the `'dcmp' (2)` resource,
-- but none of its resources actually use this decompressor.)
-- 
-- This compression format is based on simple dictionary coding,
-- where each byte in the compressed data expands to two bytes,
-- based on a lookup table
-- (either included in the compressed data or provided by the decompressor).
-- An alternative "tagged" compression format is also supported,
-- which allows using two-byte literals in addition to single-byte table references,
-- at the cost of requiring an extra "tag" byte every 16 output bytes,
-- to differentiate literals and table references.
-- See also: Source (https://github.com/dgelessus/python-rsrcfork/tree/master/rsrcfork/compress/dcmp2.py)
Dcmp2 = class.class(KaitaiStruct)

function Dcmp2:_init(len_decompressed, header_parameters_with_io, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.len_decompressed = len_decompressed
  self.header_parameters_with_io = header_parameters_with_io
  self:_read()
end

function Dcmp2:_read()
  if self.header_parameters.flags.has_custom_lookup_table then
    self.custom_lookup_table = {}
    for i = 0, self.header_parameters.num_custom_lookup_table_entries - 1 do
      self.custom_lookup_table[i + 1] = self._io:read_bytes(2)
    end
  end
  local _on = self.header_parameters.flags.tagged
  if _on == true then
    self._raw_data = self._io:read_bytes(((self._io:size() - self._io:pos()) - utils.box_unwrap((self.is_len_decompressed_odd) and utils.box_wrap(1) or (0))))
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = Dcmp2.TaggedData(_io, self, self._root)
  else
    self._raw_data = self._io:read_bytes(((self._io:size() - self._io:pos()) - utils.box_unwrap((self.is_len_decompressed_odd) and utils.box_wrap(1) or (0))))
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = Dcmp2.UntaggedData(_io, self, self._root)
  end
  if self.is_len_decompressed_odd then
    self.last_byte = self._io:read_bytes(1)
  end
end

-- 
-- The parsed decompressor-specific parameters from the compressed resource header.
Dcmp2.property.header_parameters = {}
function Dcmp2.property.header_parameters:get()
  if self._m_header_parameters ~= nil then
    return self._m_header_parameters
  end

  local _io = self.header_parameters_with_io._io
  local _pos = _io:pos()
  _io:seek(0)
  self._m_header_parameters = Dcmp2.HeaderParameters(_io, self, self._root)
  _io:seek(_pos)
  return self._m_header_parameters
end

-- 
-- Whether the length of the decompressed data is odd.
-- This affects the meaning of the last byte of the compressed data.
Dcmp2.property.is_len_decompressed_odd = {}
function Dcmp2.property.is_len_decompressed_odd:get()
  if self._m_is_len_decompressed_odd ~= nil then
    return self._m_is_len_decompressed_odd
  end

  self._m_is_len_decompressed_odd = (self.len_decompressed % 2) ~= 0
  return self._m_is_len_decompressed_odd
end

-- 
-- The default lookup table,
-- which is used if no custom lookup table is included with the compressed data.
Dcmp2.property.default_lookup_table = {}
function Dcmp2.property.default_lookup_table:get()
  if self._m_default_lookup_table ~= nil then
    return self._m_default_lookup_table
  end

  self._m_default_lookup_table = {"\000\000", "\000\008", "\078\186", "\032\110", "\078\117", "\000\012", "\000\004", "\112\000", "\000\016", "\000\002", "\072\110", "\255\252", "\096\000", "\000\001", "\072\231", "\047\046", "\078\086", "\000\006", "\078\094", "\047\000", "\097\000", "\255\248", "\047\011", "\255\255", "\000\020", "\000\010", "\000\024", "\032\095", "\000\014", "\032\080", "\063\060", "\255\244", "\076\238", "\048\046", "\103\000", "\076\223", "\038\110", "\000\018", "\000\028", "\066\103", "\255\240", "\048\060", "\047\012", "\000\003", "\078\208", "\000\032", "\112\001", "\000\022", "\045\064", "\072\192", "\032\120", "\114\000", "\088\143", "\102\000", "\079\239", "\066\167", "\103\006", "\255\250", "\085\143", "\040\110", "\063\000", "\255\254", "\047\060", "\103\004", "\089\143", "\032\107", "\000\036", "\032\031", "\065\250", "\129\225", "\102\004", "\103\008", "\000\026", "\078\185", "\080\143", "\032\046", "\000\007", "\078\176", "\255\242", "\061\064", "\000\030", "\032\104", "\102\006", "\255\246", "\078\249", "\008\000", "\012\064", "\061\124", "\255\236", "\000\005", "\032\060", "\255\232", "\222\252", "\074\046", "\000\048", "\000\040", "\047\008", "\032\011", "\096\002", "\066\110", "\045\072", "\032\083", "\032\064", "\024\000", "\096\004", "\065\238", "\047\040", "\047\001", "\103\010", "\072\064", "\032\007", "\102\008", "\001\024", "\047\007", "\048\040", "\063\046", "\048\043", "\034\110", "\047\043", "\000\044", "\103\012", "\034\095", "\096\006", "\000\255", "\048\007", "\255\238", "\083\064", "\000\064", "\255\228", "\074\064", "\102\010", "\000\015", "\078\173", "\112\255", "\034\216", "\072\107", "\000\034", "\032\075", "\103\014", "\074\174", "\078\144", "\255\224", "\255\192", "\000\042", "\039\064", "\103\002", "\081\200", "\002\182", "\072\122", "\034\120", "\176\110", "\255\230", "\000\009", "\050\046", "\062\000", "\072\065", "\255\234", "\067\238", "\078\113", "\116\000", "\047\044", "\032\108", "\000\060", "\000\038", "\000\080", "\024\128", "\048\031", "\034\000", "\102\012", "\255\218", "\000\056", "\102\002", "\048\044", "\032\012", "\045\110", "\066\064", "\255\226", "\169\240", "\255\000", "\055\124", "\229\128", "\255\220", "\072\104", "\089\079", "\000\052", "\062\031", "\096\008", "\047\006", "\255\222", "\096\010", "\112\002", "\000\050", "\255\204", "\000\128", "\034\081", "\016\031", "\049\124", "\160\041", "\255\216", "\082\064", "\001\000", "\103\016", "\160\035", "\255\206", "\255\212", "\032\006", "\072\120", "\000\046", "\080\079", "\067\250", "\103\018", "\118\000", "\065\232", "\074\110", "\032\217", "\000\090", "\127\255", "\081\202", "\000\092", "\046\000", "\002\064", "\072\199", "\103\020", "\012\128", "\046\159", "\255\214", "\128\000", "\016\000", "\072\066", "\074\107", "\255\210", "\000\072", "\074\071", "\078\209", "\032\111", "\000\065", "\096\012", "\042\120", "\066\046", "\050\000", "\101\116", "\103\022", "\000\068", "\072\109", "\032\008", "\072\108", "\011\124", "\038\064", "\004\000", "\000\104", "\032\109", "\000\013", "\042\064", "\000\011", "\000\062", "\002\032"}
  return self._m_default_lookup_table
end

-- 
-- The lookup table to be used for this compressed data.
Dcmp2.property.lookup_table = {}
function Dcmp2.property.lookup_table:get()
  if self._m_lookup_table ~= nil then
    return self._m_lookup_table
  end

  self._m_lookup_table = utils.box_unwrap((self.header_parameters.flags.has_custom_lookup_table) and utils.box_wrap(self.custom_lookup_table) or (self.default_lookup_table))
  return self._m_lookup_table
end

-- 
-- The custom lookup table to be used instead of the default lookup table.
-- 
-- The compressed data.
-- The structure of the data varies depending on whether the "tagged" or "untagged" variant of the compression format is used.
-- 
-- The last byte of the decompressed data,
-- stored literally.
-- Only present if the decompressed data has an odd length.
-- 
-- This special case is necessary because the compressed data is otherwise always stored in two-byte groups,
-- either literally or as table references,
-- so otherwise there would be no way to compress odd-length resources using this format.
-- 
-- The length of the decompressed data in bytes,
-- from the compressed resource header.
-- 
-- The unparsed decompressor-specific parameters,
-- from the compressed resource header.

-- 
-- Decompressor-specific parameters for this compression format,
-- as stored in the compressed resource header.
Dcmp2.HeaderParameters = class.class(KaitaiStruct)

function Dcmp2.HeaderParameters:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dcmp2.HeaderParameters:_read()
  self.unknown = self._io:read_u2be()
  self.num_custom_lookup_table_entries_m1 = self._io:read_u1()
  self.flags = Dcmp2.HeaderParameters.Flags(self._io, self, self._root)
end

-- 
-- The number of entries in the custom lookup table.
-- Only used if a custom lookup table is present.
Dcmp2.HeaderParameters.property.num_custom_lookup_table_entries = {}
function Dcmp2.HeaderParameters.property.num_custom_lookup_table_entries:get()
  if self._m_num_custom_lookup_table_entries ~= nil then
    return self._m_num_custom_lookup_table_entries
  end

  if self.flags.has_custom_lookup_table then
    self._m_num_custom_lookup_table_entries = (self.num_custom_lookup_table_entries_m1 + 1)
  end
  return self._m_num_custom_lookup_table_entries
end

-- 
-- The meaning of this field is unknown.
-- It does not appear to have any effect on the format of the compressed data or the decompression process.
-- 
-- The value of this field is usually zero and otherwise a small integer (< 10).
-- For `'lpch'` resources,
-- the value is always nonzero,
-- and sometimes larger than usual.
-- 
-- The number of entries in the custom lookup table,
-- minus one.
-- 
-- If the default lookup table is used rather than a custom one,
-- this value is zero.
-- 
-- Various flags that affect the format of the compressed data and the decompression process.

-- 
-- Flags for the decompressor,
-- as stored in the decompressor-specific parameters.
Dcmp2.HeaderParameters.Flags = class.class(KaitaiStruct)

function Dcmp2.HeaderParameters.Flags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dcmp2.HeaderParameters.Flags:_read()
  self.reserved = self._io:read_bits_int_be(6)
  self.tagged = self._io:read_bits_int_be(1)
  self.has_custom_lookup_table = self._io:read_bits_int_be(1)
end

-- 
-- The flags as a packed integer,
-- as they are stored in the data.
Dcmp2.HeaderParameters.Flags.property.as_int = {}
function Dcmp2.HeaderParameters.Flags.property.as_int:get()
  if self._m_as_int ~= nil then
    return self._m_as_int
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_as_int = self._io:read_u1()
  self._io:seek(_pos)
  return self._m_as_int
end

-- 
-- These flags have no known usage or meaning and should always be zero.
-- 
-- Whether the "tagged" variant of this compression format should be used,
-- rather than the default "untagged" variant.
-- 
-- Whether a custom lookup table is included before the compressed data,
-- which should be used instead of the default hardcoded lookup table.

-- 
-- Compressed data in the "untagged" variant of the format.
Dcmp2.UntaggedData = class.class(KaitaiStruct)

function Dcmp2.UntaggedData:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dcmp2.UntaggedData:_read()
  self.table_references = {}
  local i = 0
  while not self._io:is_eof() do
    self.table_references[i + 1] = self._io:read_u1()
    i = i + 1
  end
end

-- 
-- References into the lookup table.
-- Each reference is an integer that is expanded to two bytes by looking it up in the table.

-- 
-- Compressed data in the "tagged" variant of the format.
Dcmp2.TaggedData = class.class(KaitaiStruct)

function Dcmp2.TaggedData:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dcmp2.TaggedData:_read()
  self.chunks = {}
  local i = 0
  while not self._io:is_eof() do
    self.chunks[i + 1] = Dcmp2.TaggedData.Chunk(self._io, self, self._root)
    i = i + 1
  end
end

-- 
-- The tagged chunks that make up the compressed data.

-- 
-- A single tagged chunk of compressed data.
-- 
-- Each chunk expands to 16 bytes of decompressed data.
-- In compressed form,
-- the chunks have a variable length
-- (between 9 and 17 bytes)
-- depending on the value of the tag byte.
Dcmp2.TaggedData.Chunk = class.class(KaitaiStruct)

function Dcmp2.TaggedData.Chunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dcmp2.TaggedData.Chunk:_read()
  self.tag = {}
  for i = 0, 8 - 1 do
    self.tag[i + 1] = self._io:read_bits_int_be(1)
  end
  self._io:align_to_byte()
  self._raw_units = {}
  self.units = {}
  local i = 0
  while true do
    local _on = self.tag[i + 1]
    if _on == true then
      _ = self._io:read_u1()
      self.units[i + 1] = _
    else
      _ = self._io:read_bytes(utils.box_unwrap((self.tag[i + 1]) and utils.box_wrap(1) or (2)))
      self.units[i + 1] = _
    end
    if  ((i >= 7) or (self._io:is_eof()))  then
      break
    end
    i = i + 1
  end
end

-- 
-- The bits of the tag byte control the format and meaning of the 8 compressed data units that follow the tag byte.
-- 
-- The compressed data units in this chunk.
-- 
-- The format and meaning of each unit is controlled by the bit in the tag byte with the same index.
-- If the bit is 0 (false),
-- the unit is a pair of bytes,
-- which are literally copied to the decompressed data.
-- If the bit is 1 (true),
-- the unit is a reference into the lookup table,
-- an integer which is expanded to two bytes by looking it up in the table.

