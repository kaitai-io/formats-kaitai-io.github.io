-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local utils = require("utils")

require("dcmp_variable_length_integer")
-- 
-- Compressed resource data in `'dcmp' (0)` format,
-- as stored in compressed resources with header type `8` and decompressor ID `0`.
-- 
-- The `'dcmp' (0)` decompressor resource is included in the System file of System 7.0 and later.
-- This compression format is used for most compressed resources in System 7.0's files.
-- This decompressor is also included with and used by some other Apple applications,
-- such as ResEdit.
-- 
-- This compression format supports some basic general-purpose compression schemes,
-- including backreferences to previous data,
-- run-length encoding,
-- and delta encoding.
-- It also includes some types of compression tailored specifically to Mac OS resources,
-- including a set of single-byte codes that correspond to entries in a hard-coded lookup table,
-- and a specialized kind of delta encoding for segment loader jump tables.
-- 
-- Almost all parts of this compression format operate on units of 2 or 4 bytes.
-- As a result,
-- it is nearly impossible to store data with an odd length in this format.
-- To work around this limitation,
-- odd-length resources are padded with an extra byte before compressing them with this format.
-- This extra byte is ignored after decompression,
-- as the real (odd) length of the resource is stored in the compressed resource header.
-- 
-- The `'dcmp' (1)` compression format (see dcmp_1.ksy) is very similar to this format,
-- with the main difference that it operates mostly on single bytes rather than two-byte units.
-- See also: Source (https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp0.py)
Dcmp0 = class.class(KaitaiStruct)

function Dcmp0:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dcmp0:_read()
  self.chunks = {}
  local i = 0
  while true do
    _ = Dcmp0.Chunk(self._io, self, self._root)
    self.chunks[i + 1] = _
    if _.tag == 255 then
      break
    end
    i = i + 1
  end
end

-- 
-- The sequence of chunks that make up the compressed data.

-- 
-- A single chunk of compressed data.
-- Each chunk in the compressed data expands to a sequence of bytes in the uncompressed data,
-- except when `tag == 0xff`,
-- which marks the end of the data and does not correspond to any bytes in the uncompressed data.
-- 
-- Most chunks are stateless and always expand to the same data,
-- regardless of where the chunk appears in the sequence.
-- However,
-- some chunks affect the behavior of future chunks,
-- or expand to different data depending on which chunks came before them.
Dcmp0.Chunk = class.class(KaitaiStruct)

Dcmp0.Chunk.TagKind = enum.Enum {
invalid = -1,
literal = 0,
backreference = 1,
table_lookup = 2,
extended = 3,
end = 4,
}

function Dcmp0.Chunk:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Dcmp0.Chunk:_read()
self.tag = self._io:read_u1()
local _on = utils.box_unwrap(( ((self.tag >= 0) and (self.tag <= 31)) ) and utils.box_wrap(Dcmp0.Chunk.TagKind.literal) or (utils.box_unwrap(( ((self.tag >= 32) and (self.tag <= 74)) ) and utils.box_wrap(Dcmp0.Chunk.TagKind.backreference) or (utils.box_unwrap(( ((self.tag >= 75) and (self.tag <= 253)) ) and utils.box_wrap(Dcmp0.Chunk.TagKind.table_lookup) or (utils.box_unwrap((self.tag == 254) and utils.box_wrap(Dcmp0.Chunk.TagKind.extended) or (utils.box_unwrap((self.tag == 255) and utils.box_wrap(Dcmp0.Chunk.TagKind.end) or (Dcmp0.Chunk.TagKind.invalid))))))))))
if _on == Dcmp0.Chunk.TagKind.extended then
  self.body = Dcmp0.Chunk.ExtendedBody(self._io, self, self._root)
elseif _on == Dcmp0.Chunk.TagKind.literal then
  self.body = Dcmp0.Chunk.LiteralBody(self.tag, self._io, self, self._root)
elseif _on == Dcmp0.Chunk.TagKind.end then
  self.body = Dcmp0.Chunk.EndBody(self._io, self, self._root)
elseif _on == Dcmp0.Chunk.TagKind.table_lookup then
  self.body = Dcmp0.Chunk.TableLookupBody(self.tag, self._io, self, self._root)
elseif _on == Dcmp0.Chunk.TagKind.backreference then
  self.body = Dcmp0.Chunk.BackreferenceBody(self.tag, self._io, self, self._root)
end
end

-- 
-- The chunk's tag byte.
-- This controls the structure of the body and the meaning of the chunk.
-- 
-- The chunk's body.
-- 
-- Certain chunks do not have any data following the tag byte.
-- In this case,
-- the body is a zero-length structure.

-- 
-- The body of a literal data chunk.
-- 
-- The data that this chunk expands to is stored literally in the body (`literal`).
-- Optionally,
-- the literal data may also be stored for use by future backreference chunks (`do_store`).
-- 
-- The length of the literal data is stored as a number of two-byte units.
-- This means that the literal data always has an even length in bytes.
Dcmp0.Chunk.LiteralBody = class.class(KaitaiStruct)

function Dcmp0.Chunk.LiteralBody:_init(tag, io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self.tag = tag
self:_read()
end

function Dcmp0.Chunk.LiteralBody:_read()
if self.is_len_literal_div2_separate then
  self.len_literal_div2_separate = self._io:read_u1()
end
self.literal = self._io:read_bytes(self.len_literal)
end

-- 
-- Whether this literal should be stored for use by future backreference chunks.
-- 
-- See the documentation of the `backreference_body` type for details about backreference chunks.
Dcmp0.Chunk.LiteralBody.property.do_store = {}
function Dcmp0.Chunk.LiteralBody.property.do_store:get()
if self._m_do_store ~= nil then
  return self._m_do_store
end

self._m_do_store = (self.tag & 16) ~= 0
return self._m_do_store
end

-- 
-- The length of the literal data,
-- in two-byte units.
-- 
-- In practice,
-- this value is always greater than zero,
-- as there is no use in storing a zero-length literal.
Dcmp0.Chunk.LiteralBody.property.len_literal_div2 = {}
function Dcmp0.Chunk.LiteralBody.property.len_literal_div2:get()
if self._m_len_literal_div2 ~= nil then
  return self._m_len_literal_div2
end

self._m_len_literal_div2 = utils.box_unwrap((self.is_len_literal_div2_separate) and utils.box_wrap(self.len_literal_div2_separate) or (self.len_literal_div2_in_tag))
return self._m_len_literal_div2
end

-- 
-- The length of the literal data,
-- in bytes.
Dcmp0.Chunk.LiteralBody.property.len_literal = {}
function Dcmp0.Chunk.LiteralBody.property.len_literal:get()
if self._m_len_literal ~= nil then
  return self._m_len_literal
end

self._m_len_literal = (self.len_literal_div2 * 2)
return self._m_len_literal
end

-- 
-- The part of the tag byte that indicates the length of the literal data,
-- in two-byte units.
-- If this value is 0,
-- the length is stored in a separate byte after the tag byte and before the literal data.
Dcmp0.Chunk.LiteralBody.property.len_literal_div2_in_tag = {}
function Dcmp0.Chunk.LiteralBody.property.len_literal_div2_in_tag:get()
if self._m_len_literal_div2_in_tag ~= nil then
  return self._m_len_literal_div2_in_tag
end

self._m_len_literal_div2_in_tag = (self.tag & 15)
return self._m_len_literal_div2_in_tag
end

-- 
-- Whether the length of the literal is stored separately from the tag.
Dcmp0.Chunk.LiteralBody.property.is_len_literal_div2_separate = {}
function Dcmp0.Chunk.LiteralBody.property.is_len_literal_div2_separate:get()
if self._m_is_len_literal_div2_separate ~= nil then
  return self._m_is_len_literal_div2_separate
end

self._m_is_len_literal_div2_separate = self.len_literal_div2_in_tag == 0
return self._m_is_len_literal_div2_separate
end

-- 
-- The length of the literal data,
-- in two-byte units.
-- 
-- This field is only present if the tag byte's low nibble is zero.
-- In practice,
-- this only happens if the length is 0x10 or greater,
-- because smaller lengths can be encoded into the tag byte.
-- 
-- The literal data.
-- 
-- The tag byte preceding this chunk body.

-- 
-- The body of a backreference chunk.
-- 
-- This chunk expands to the data stored in a preceding literal chunk,
-- indicated by an index number (`index`).
Dcmp0.Chunk.BackreferenceBody = class.class(KaitaiStruct)

function Dcmp0.Chunk.BackreferenceBody:_init(tag, io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self.tag = tag
self:_read()
end

function Dcmp0.Chunk.BackreferenceBody:_read()
if self.is_index_separate then
  local _on = self.tag
  if _on == 32 then
    self.index_separate_minus = self._io:read_u1()
  elseif _on == 33 then
    self.index_separate_minus = self._io:read_u1()
  elseif _on == 34 then
    self.index_separate_minus = self._io:read_u2be()
  end
end
end

-- 
-- Whether the index is stored separately from the tag.
Dcmp0.Chunk.BackreferenceBody.property.is_index_separate = {}
function Dcmp0.Chunk.BackreferenceBody.property.is_index_separate:get()
if self._m_is_index_separate ~= nil then
  return self._m_is_index_separate
end

self._m_is_index_separate =  ((self.tag >= 32) and (self.tag <= 34)) 
return self._m_is_index_separate
end

-- 
-- The index of the referenced literal chunk,
-- as stored in the tag byte.
Dcmp0.Chunk.BackreferenceBody.property.index_in_tag = {}
function Dcmp0.Chunk.BackreferenceBody.property.index_in_tag:get()
if self._m_index_in_tag ~= nil then
  return self._m_index_in_tag
end

self._m_index_in_tag = (self.tag - 35)
return self._m_index_in_tag
end

-- 
-- The index of the referenced literal chunk,
-- as stored separately from the tag byte,
-- with the implicit offset corrected for.
Dcmp0.Chunk.BackreferenceBody.property.index_separate = {}
function Dcmp0.Chunk.BackreferenceBody.property.index_separate:get()
if self._m_index_separate ~= nil then
  return self._m_index_separate
end

if self.is_index_separate then
  self._m_index_separate = ((self.index_separate_minus + 40) + utils.box_unwrap((self.tag == 33) and utils.box_wrap(256) or (0)))
end
return self._m_index_separate
end

-- 
-- The index of the referenced literal chunk.
-- 
-- Stored literals are assigned index numbers in the order in which they appear in the compressed data,
-- starting at 0.
-- Non-stored literals are not counted in the numbering and cannot be referenced using backreferences.
-- Once an index is assigned to a stored literal,
-- it is never changed or unassigned for the entire length of the compressed data.
-- 
-- As the name indicates,
-- a backreference can only reference stored literal chunks found *before* the backreference,
-- not ones that come after it.
Dcmp0.Chunk.BackreferenceBody.property.index = {}
function Dcmp0.Chunk.BackreferenceBody.property.index:get()
if self._m_index ~= nil then
  return self._m_index
end

self._m_index = utils.box_unwrap((self.is_index_separate) and utils.box_wrap(self.index_separate) or (self.index_in_tag))
return self._m_index
end

-- 
-- The index of the referenced literal chunk,
-- stored separately from the tag.
-- The value in this field is stored minus 0x28.
-- If the tag byte is 0x21,
-- the value is also stored minus 0x100,
-- *on top of* the regular offset
-- (i. e. minus 0x128 in total).
-- 
-- In other words,
-- for tag bytes 0x20 and 0x21,
-- the index is actually 9 bits large,
-- with the low 8 bits stored separately and the highest bit stored in the lowest bit of the tag byte.
-- 
-- This field is only present if the tag byte is 0x20 through 0x22.
-- For higher tag bytes,
-- the index is encoded in the tag byte.
-- Values smaller than 0x28 cannot be stored in this field,
-- they must always be encoded in the tag byte.
-- 
-- The tag byte preceding this chunk body.

-- 
-- The body of a table lookup chunk.
-- This body is always empty.
-- 
-- This chunk always expands to two bytes (`value`),
-- determined from the tag byte using a fixed lookup table (`lookup_table`).
-- This lookup table is hardcoded in the decompressor and always the same for all compressed data.
Dcmp0.Chunk.TableLookupBody = class.class(KaitaiStruct)

function Dcmp0.Chunk.TableLookupBody:_init(tag, io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self.tag = tag
self:_read()
end

function Dcmp0.Chunk.TableLookupBody:_read()
end

-- 
-- Fixed lookup table that maps tag byte numbers to two bytes each.
-- 
-- The entries in the lookup table are offset -
-- index 0 stands for tag 0x4b, 1 for 0x4c, etc.
Dcmp0.Chunk.TableLookupBody.property.lookup_table = {}
function Dcmp0.Chunk.TableLookupBody.property.lookup_table:get()
if self._m_lookup_table ~= nil then
  return self._m_lookup_table
end

self._m_lookup_table = {"\000\000", "\078\186", "\000\008", "\078\117", "\000\012", "\078\173", "\032\083", "\047\011", "\097\000", "\000\016", "\112\000", "\047\000", "\072\110", "\032\080", "\032\110", "\047\046", "\255\252", "\072\231", "\063\060", "\000\004", "\255\248", "\047\012", "\032\006", "\078\237", "\078\086", "\032\104", "\078\094", "\000\001", "\088\143", "\079\239", "\000\002", "\000\024", "\096\000", "\255\255", "\080\143", "\078\144", "\000\006", "\038\110", "\000\020", "\255\244", "\076\238", "\000\010", "\000\014", "\065\238", "\076\223", "\072\192", "\255\240", "\045\064", "\000\018", "\048\046", "\112\001", "\047\040", "\032\084", "\103\000", "\000\032", "\000\028", "\032\095", "\024\000", "\038\111", "\072\120", "\000\022", "\065\250", "\048\060", "\040\064", "\114\000", "\040\110", "\032\012", "\102\000", "\032\107", "\047\007", "\085\143", "\000\040", "\255\254", "\255\236", "\034\216", "\032\011", "\000\015", "\089\143", "\047\060", "\255\000", "\001\024", "\129\225", "\074\000", "\078\176", "\255\232", "\072\199", "\000\003", "\000\034", "\000\007", "\000\026", "\103\006", "\103\008", "\078\249", "\000\036", "\032\120", "\008\000", "\102\004", "\000\042", "\078\208", "\048\040", "\038\095", "\103\004", "\000\048", "\067\238", "\063\000", "\032\031", "\000\030", "\255\246", "\032\046", "\066\167", "\032\007", "\255\250", "\096\002", "\061\064", "\012\064", "\102\006", "\000\038", "\045\072", "\047\001", "\112\255", "\096\004", "\024\128", "\074\064", "\000\064", "\000\044", "\047\008", "\000\017", "\255\228", "\033\064", "\038\064", "\255\242", "\066\110", "\078\185", "\061\124", "\000\056", "\000\013", "\096\006", "\066\046", "\032\060", "\103\012", "\045\104", "\102\008", "\074\046", "\074\174", "\000\046", "\072\064", "\034\095", "\034\000", "\103\010", "\048\007", "\066\103", "\000\050", "\032\040", "\000\009", "\072\122", "\002\000", "\047\043", "\000\005", "\034\110", "\102\002", "\229\128", "\103\014", "\102\010", "\000\080", "\062\000", "\102\012", "\046\000", "\255\238", "\032\109", "\032\064", "\255\224", "\083\064", "\096\008", "\004\128", "\000\104", "\011\124", "\068\000", "\065\232", "\072\065"}
return self._m_lookup_table
end

-- 
-- The two bytes that the tag byte expands to,
-- based on the fixed lookup table.
Dcmp0.Chunk.TableLookupBody.property.value = {}
function Dcmp0.Chunk.TableLookupBody.property.value:get()
if self._m_value ~= nil then
  return self._m_value
end

self._m_value = self.lookup_table[(self.tag - 75) + 1]
return self._m_value
end

-- 
-- The tag byte preceding this chunk body.

-- 
-- The body of an end chunk.
-- This body is always empty.
-- 
-- The last chunk in the compressed data must always be an end chunk.
-- An end chunk cannot appear elsewhere in the compressed data.
Dcmp0.Chunk.EndBody = class.class(KaitaiStruct)

function Dcmp0.Chunk.EndBody:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Dcmp0.Chunk.EndBody:_read()
end


-- 
-- The body of an extended chunk.
-- The meaning of this chunk depends on the extended tag byte stored in the chunk data.
Dcmp0.Chunk.ExtendedBody = class.class(KaitaiStruct)

function Dcmp0.Chunk.ExtendedBody:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Dcmp0.Chunk.ExtendedBody:_read()
self.tag = self._io:read_u1()
local _on = self.tag
if _on == 0 then
  self.body = Dcmp0.Chunk.ExtendedBody.JumpTableBody(self._io, self, self._root)
elseif _on == 4 then
  self.body = Dcmp0.Chunk.ExtendedBody.DeltaEncoding16BitBody(self._io, self, self._root)
elseif _on == 6 then
  self.body = Dcmp0.Chunk.ExtendedBody.DeltaEncoding32BitBody(self._io, self, self._root)
elseif _on == 3 then
  self.body = Dcmp0.Chunk.ExtendedBody.RepeatBody(self.tag, self._io, self, self._root)
elseif _on == 2 then
  self.body = Dcmp0.Chunk.ExtendedBody.RepeatBody(self.tag, self._io, self, self._root)
end
end

-- 
-- The chunk's extended tag byte.
-- This controls the structure of the body and the meaning of the chunk.
-- 
-- The chunk's body.

-- 
-- The body of a jump table chunk.
-- 
-- This chunk generates parts of a segment loader jump table,
-- in the format found in `'CODE' (0)` resources.
-- It expands to the following data,
-- with all non-constant numbers encoded as unsigned 16-bit big-endian integers:
-- 
-- * `0x3f 0x3c` (push following segment number onto stack)
-- * The segment number
-- * `0xa9 0xf0` (`_LoadSeg` trap)
-- * For each address:
--   * The address
--   * `0x3f 0x3c` (push following segment number onto stack)
--   * The segment number
--   * `0xa9 0xf0` (`_LoadSeg` trap)
-- 
-- Note that this generates one jump table entry without an address before it,
-- meaning that this address needs to be generated by the preceding chunk.
-- All following jump table entries are generated with the addresses encoded in this chunk.
Dcmp0.Chunk.ExtendedBody.JumpTableBody = class.class(KaitaiStruct)

function Dcmp0.Chunk.ExtendedBody.JumpTableBody:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Dcmp0.Chunk.ExtendedBody.JumpTableBody:_read()
self.segment_number_raw = DcmpVariableLengthInteger(self._io)
self.num_addresses_raw = DcmpVariableLengthInteger(self._io)
self.addresses_raw = {}
for i = 0, self.num_addresses - 1 do
  self.addresses_raw[i + 1] = DcmpVariableLengthInteger(self._io)
end
end

-- 
-- The segment number for all of the generated jump table entries.
-- 
-- Although it is stored as a variable-length integer,
-- the segment number must be in the range `0x0 <= x <= 0xffff`,
-- i. e. an unsigned 16-bit integer.
Dcmp0.Chunk.ExtendedBody.JumpTableBody.property.segment_number = {}
function Dcmp0.Chunk.ExtendedBody.JumpTableBody.property.segment_number:get()
if self._m_segment_number ~= nil then
  return self._m_segment_number
end

self._m_segment_number = self.segment_number_raw.value
return self._m_segment_number
end

-- 
-- The number of addresses stored in this chunk.
-- 
-- This number must be greater than 0.
Dcmp0.Chunk.ExtendedBody.JumpTableBody.property.num_addresses = {}
function Dcmp0.Chunk.ExtendedBody.JumpTableBody.property.num_addresses:get()
if self._m_num_addresses ~= nil then
  return self._m_num_addresses
end

self._m_num_addresses = self.num_addresses_raw.value
return self._m_num_addresses
end

-- 
-- Raw variable-length integer representation of `segment_number`.
-- 
-- Raw variable-length integer representation of `num_addresses`.
-- 
-- The addresses for each generated jump table entry,
-- stored as variable-length integers.
-- 
-- The first address is stored literally and must be in the range `0x0 <= x <= 0xffff`,
-- i. e. an unsigned 16-bit integer.
-- 
-- All following addresses are stored as deltas relative to the previous address.
-- Each of these deltas is stored plus 6;
-- this value needs to be subtracted before (or after) adding it to the previous address.
-- 
-- Each delta (after subtracting 6) should be positive,
-- and adding it to the previous address should not result in a value larger than `0xffff`,
-- i. e. there should be no 16-bit unsigned integer wraparound.
-- These conditions are always met in all known jump table chunks,
-- so it is not known how the original decompressor behaves otherwise.

-- 
-- The body of a repeat chunk.
-- 
-- This chunk expands to a 1-byte or 2-byte value repeated a number of times,
-- i. e. it implements a form of run-length encoding.
Dcmp0.Chunk.ExtendedBody.RepeatBody = class.class(KaitaiStruct)

function Dcmp0.Chunk.ExtendedBody.RepeatBody:_init(tag, io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self.tag = tag
self:_read()
end

function Dcmp0.Chunk.ExtendedBody.RepeatBody:_read()
self.to_repeat_raw = DcmpVariableLengthInteger(self._io)
self.repeat_count_m1_raw = DcmpVariableLengthInteger(self._io)
end

-- 
-- The length in bytes of the value to be repeated.
-- Regardless of the byte count,
-- the value to be repeated is stored as a variable-length integer.
Dcmp0.Chunk.ExtendedBody.RepeatBody.property.byte_count = {}
function Dcmp0.Chunk.ExtendedBody.RepeatBody.property.byte_count:get()
if self._m_byte_count ~= nil then
  return self._m_byte_count
end

self._m_byte_count = utils.box_unwrap((self.tag == 2) and utils.box_wrap(1) or (utils.box_unwrap((self.tag == 3) and utils.box_wrap(2) or (-1))))
return self._m_byte_count
end

-- 
-- The value to repeat.
-- 
-- Although it is stored as a variable-length integer,
-- this value must fit into an unsigned big-endian integer that is as long as `byte_count`,
-- i. e. either 8 or 16 bits.
Dcmp0.Chunk.ExtendedBody.RepeatBody.property.to_repeat = {}
function Dcmp0.Chunk.ExtendedBody.RepeatBody.property.to_repeat:get()
if self._m_to_repeat ~= nil then
  return self._m_to_repeat
end

self._m_to_repeat = self.to_repeat_raw.value
return self._m_to_repeat
end

-- 
-- The number of times to repeat the value,
-- minus one.
-- 
-- This value must not be negative.
Dcmp0.Chunk.ExtendedBody.RepeatBody.property.repeat_count_m1 = {}
function Dcmp0.Chunk.ExtendedBody.RepeatBody.property.repeat_count_m1:get()
if self._m_repeat_count_m1 ~= nil then
  return self._m_repeat_count_m1
end

self._m_repeat_count_m1 = self.repeat_count_m1_raw.value
return self._m_repeat_count_m1
end

-- 
-- The number of times to repeat the value.
-- 
-- This value must be positive.
Dcmp0.Chunk.ExtendedBody.RepeatBody.property.repeat_count = {}
function Dcmp0.Chunk.ExtendedBody.RepeatBody.property.repeat_count:get()
if self._m_repeat_count ~= nil then
  return self._m_repeat_count
end

self._m_repeat_count = (self.repeat_count_m1 + 1)
return self._m_repeat_count
end

-- 
-- Raw variable-length integer representation of `to_repeat`.
-- 
-- Raw variable-length integer representation of `repeat_count_m1`.
-- 
-- The extended tag byte preceding this chunk body.

-- 
-- The body of a 16-bit delta encoding chunk.
-- 
-- This chunk expands to a sequence of 16-bit big-endian integer values.
-- The first value is stored literally.
-- All following values are stored as deltas relative to the previous value.
Dcmp0.Chunk.ExtendedBody.DeltaEncoding16BitBody = class.class(KaitaiStruct)

function Dcmp0.Chunk.ExtendedBody.DeltaEncoding16BitBody:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Dcmp0.Chunk.ExtendedBody.DeltaEncoding16BitBody:_read()
self.first_value_raw = DcmpVariableLengthInteger(self._io)
self.num_deltas_raw = DcmpVariableLengthInteger(self._io)
self.deltas = {}
for i = 0, self.num_deltas - 1 do
  self.deltas[i + 1] = self._io:read_s1()
end
end

-- 
-- The first value in the sequence.
-- 
-- Although it is stored as a variable-length integer,
-- this value must be in the range `-0x8000 <= x <= 0x7fff`,
-- i. e. a signed 16-bit integer.
Dcmp0.Chunk.ExtendedBody.DeltaEncoding16BitBody.property.first_value = {}
function Dcmp0.Chunk.ExtendedBody.DeltaEncoding16BitBody.property.first_value:get()
if self._m_first_value ~= nil then
  return self._m_first_value
end

self._m_first_value = self.first_value_raw.value
return self._m_first_value
end

-- 
-- The number of deltas stored in this chunk.
-- 
-- This number must not be negative.
Dcmp0.Chunk.ExtendedBody.DeltaEncoding16BitBody.property.num_deltas = {}
function Dcmp0.Chunk.ExtendedBody.DeltaEncoding16BitBody.property.num_deltas:get()
if self._m_num_deltas ~= nil then
  return self._m_num_deltas
end

self._m_num_deltas = self.num_deltas_raw.value
return self._m_num_deltas
end

-- 
-- Raw variable-length integer representation of `first_value`.
-- 
-- Raw variable-length integer representation of `num_deltas`.
-- 
-- The deltas for each value relative to the previous value.
-- 
-- Each of these deltas is a signed 8-bit value.
-- When adding the delta to the previous value,
-- 16-bit integer wraparound is performed if necessary,
-- so that the resulting value always fits into a 16-bit signed integer.

-- 
-- The body of a 32-bit delta encoding chunk.
-- 
-- This chunk expands to a sequence of 32-bit big-endian integer values.
-- The first value is stored literally.
-- All following values are stored as deltas relative to the previous value.
Dcmp0.Chunk.ExtendedBody.DeltaEncoding32BitBody = class.class(KaitaiStruct)

function Dcmp0.Chunk.ExtendedBody.DeltaEncoding32BitBody:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Dcmp0.Chunk.ExtendedBody.DeltaEncoding32BitBody:_read()
self.first_value_raw = DcmpVariableLengthInteger(self._io)
self.num_deltas_raw = DcmpVariableLengthInteger(self._io)
self.deltas_raw = {}
for i = 0, self.num_deltas - 1 do
  self.deltas_raw[i + 1] = DcmpVariableLengthInteger(self._io)
end
end

-- 
-- The first value in the sequence.
Dcmp0.Chunk.ExtendedBody.DeltaEncoding32BitBody.property.first_value = {}
function Dcmp0.Chunk.ExtendedBody.DeltaEncoding32BitBody.property.first_value:get()
if self._m_first_value ~= nil then
  return self._m_first_value
end

self._m_first_value = self.first_value_raw.value
return self._m_first_value
end

-- 
-- The number of deltas stored in this chunk.
-- 
-- This number must not be negative.
Dcmp0.Chunk.ExtendedBody.DeltaEncoding32BitBody.property.num_deltas = {}
function Dcmp0.Chunk.ExtendedBody.DeltaEncoding32BitBody.property.num_deltas:get()
if self._m_num_deltas ~= nil then
  return self._m_num_deltas
end

self._m_num_deltas = self.num_deltas_raw.value
return self._m_num_deltas
end

-- 
-- Raw variable-length integer representation of `first_value`.
-- 
-- Raw variable-length integer representation of `num_deltas`.
-- 
-- The deltas for each value relative to the previous value,
-- stored as variable-length integers.
-- 
-- Each of these deltas is a signed value.
-- When adding the delta to the previous value,
-- 32-bit integer wraparound is performed if necessary,
-- so that the resulting value always fits into a 32-bit signed integer.

