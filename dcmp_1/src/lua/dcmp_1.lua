-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local utils = require("utils")

require("dcmp_variable_length_integer")
-- 
-- Compressed resource data in `'dcmp' (1)` format,
-- as stored in compressed resources with header type `8` and decompressor ID `1`.
-- 
-- The `'dcmp' (1)` decompressor resource is included in the System file of System 7.0 and later.
-- This compression format is used for a few compressed resources in System 7.0's files
-- (such as the Finder Help file).
-- This decompressor is also included with and used by some other Apple applications,
-- such as ResEdit.
-- (Note: ResEdit includes the `'dcmp' (1)` resource,
-- but none of its resources actually use this decompressor.)
-- 
-- This compression format supports some basic general-purpose compression schemes,
-- including backreferences to previous data and run-length encoding.
-- It also includes some types of compression tailored specifically to Mac OS resources,
-- including a set of single-byte codes that correspond to entries in a hard-coded lookup table.
-- 
-- The `'dcmp' (0)` compression format (see dcmp_0.ksy) is very similar to this format,
-- with the main difference that it operates mostly on units of 2 or 4 bytes.
-- This makes the ``dcmp' (0)` format more suitable for word-aligned data,
-- such as executable code, bitmaps, sounds, etc.
-- The `'dcmp' (0)` format also appears to be generally preferred over `'dcmp' (1)`,
-- with the latter only being used in resource files that contain mostly unaligned data,
-- such as text.
-- See also: Source (https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp1.py)
Dcmp1 = class.class(KaitaiStruct)

function Dcmp1:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dcmp1:_read()
  self.chunks = {}
  local i = 0
  while true do
    _ = Dcmp1.Chunk(self._io, self, self._root)
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
Dcmp1.Chunk = class.class(KaitaiStruct)

Dcmp1.Chunk.TagKind = enum.Enum {
invalid = -1,
literal = 0,
backreference = 1,
table_lookup = 2,
extended = 3,
end = 4,
}

function Dcmp1.Chunk:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Dcmp1.Chunk:_read()
self.tag = self._io:read_u1()
local _on = utils.box_unwrap(( ((self.tag >= 0) and (self.tag <= 31)) ) and utils.box_wrap(Dcmp1.Chunk.TagKind.literal) or (utils.box_unwrap(( ((self.tag >= 32) and (self.tag <= 207)) ) and utils.box_wrap(Dcmp1.Chunk.TagKind.backreference) or (utils.box_unwrap(( ((self.tag >= 208) and (self.tag <= 209)) ) and utils.box_wrap(Dcmp1.Chunk.TagKind.literal) or (utils.box_unwrap((self.tag == 210) and utils.box_wrap(Dcmp1.Chunk.TagKind.backreference) or (utils.box_unwrap(( ((self.tag >= 213) and (self.tag <= 253)) ) and utils.box_wrap(Dcmp1.Chunk.TagKind.table_lookup) or (utils.box_unwrap((self.tag == 254) and utils.box_wrap(Dcmp1.Chunk.TagKind.extended) or (utils.box_unwrap((self.tag == 255) and utils.box_wrap(Dcmp1.Chunk.TagKind.end) or (Dcmp1.Chunk.TagKind.invalid))))))))))))))
if _on == Dcmp1.Chunk.TagKind.extended then
  self.body = Dcmp1.Chunk.ExtendedBody(self._io, self, self._root)
elseif _on == Dcmp1.Chunk.TagKind.literal then
  self.body = Dcmp1.Chunk.LiteralBody(self.tag, self._io, self, self._root)
elseif _on == Dcmp1.Chunk.TagKind.end then
  self.body = Dcmp1.Chunk.EndBody(self._io, self, self._root)
elseif _on == Dcmp1.Chunk.TagKind.table_lookup then
  self.body = Dcmp1.Chunk.TableLookupBody(self.tag, self._io, self, self._root)
elseif _on == Dcmp1.Chunk.TagKind.backreference then
  self.body = Dcmp1.Chunk.BackreferenceBody(self.tag, self._io, self, self._root)
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
Dcmp1.Chunk.LiteralBody = class.class(KaitaiStruct)

function Dcmp1.Chunk.LiteralBody:_init(tag, io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self.tag = tag
self:_read()
end

function Dcmp1.Chunk.LiteralBody:_read()
if self.is_len_literal_separate then
  self.len_literal_separate = self._io:read_u1()
end
self.literal = self._io:read_bytes(self.len_literal)
end

-- 
-- Whether this literal should be stored for use by future backreference chunks.
-- 
-- See the documentation of the `backreference_body` type for details about backreference chunks.
Dcmp1.Chunk.LiteralBody.property.do_store = {}
function Dcmp1.Chunk.LiteralBody.property.do_store:get()
if self._m_do_store ~= nil then
  return self._m_do_store
end

self._m_do_store = utils.box_unwrap((self.is_len_literal_separate) and utils.box_wrap(self.tag == 209) or ((self.tag & 16) ~= 0))
return self._m_do_store
end

-- 
-- The part of the tag byte that indicates the length of the literal data,
-- in bytes,
-- minus one.
-- 
-- If the tag byte is 0xd0 or 0xd1,
-- the length is stored in a separate byte after the tag byte and before the literal data.
Dcmp1.Chunk.LiteralBody.property.len_literal_m1_in_tag = {}
function Dcmp1.Chunk.LiteralBody.property.len_literal_m1_in_tag:get()
if self._m_len_literal_m1_in_tag ~= nil then
  return self._m_len_literal_m1_in_tag
end

if not(self.is_len_literal_separate) then
  self._m_len_literal_m1_in_tag = (self.tag & 15)
end
return self._m_len_literal_m1_in_tag
end

-- 
-- Whether the length of the literal is stored separately from the tag.
Dcmp1.Chunk.LiteralBody.property.is_len_literal_separate = {}
function Dcmp1.Chunk.LiteralBody.property.is_len_literal_separate:get()
if self._m_is_len_literal_separate ~= nil then
  return self._m_is_len_literal_separate
end

self._m_is_len_literal_separate = self.tag >= 208
return self._m_is_len_literal_separate
end

-- 
-- The length of the literal data,
-- in bytes.
-- 
-- In practice,
-- this value is always greater than zero,
-- as there is no use in storing a zero-length literal.
Dcmp1.Chunk.LiteralBody.property.len_literal = {}
function Dcmp1.Chunk.LiteralBody.property.len_literal:get()
if self._m_len_literal ~= nil then
  return self._m_len_literal
end

self._m_len_literal = utils.box_unwrap((self.is_len_literal_separate) and utils.box_wrap(self.len_literal_separate) or ((self.len_literal_m1_in_tag + 1)))
return self._m_len_literal
end

-- 
-- The length of the literal data,
-- in bytes.
-- 
-- This field is only present if the tag byte is 0xd0 or 0xd1.
-- In practice,
-- this only happens if the length is 0x11 or greater,
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
Dcmp1.Chunk.BackreferenceBody = class.class(KaitaiStruct)

function Dcmp1.Chunk.BackreferenceBody:_init(tag, io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self.tag = tag
self:_read()
end

function Dcmp1.Chunk.BackreferenceBody:_read()
if self.is_index_separate then
  self.index_separate_minus = self._io:read_u1()
end
end

-- 
-- Whether the index is stored separately from the tag.
Dcmp1.Chunk.BackreferenceBody.property.is_index_separate = {}
function Dcmp1.Chunk.BackreferenceBody.property.is_index_separate:get()
if self._m_is_index_separate ~= nil then
  return self._m_is_index_separate
end

self._m_is_index_separate = self.tag == 210
return self._m_is_index_separate
end

-- 
-- The index of the referenced literal chunk,
-- as stored in the tag byte.
Dcmp1.Chunk.BackreferenceBody.property.index_in_tag = {}
function Dcmp1.Chunk.BackreferenceBody.property.index_in_tag:get()
if self._m_index_in_tag ~= nil then
  return self._m_index_in_tag
end

self._m_index_in_tag = (self.tag - 32)
return self._m_index_in_tag
end

-- 
-- The index of the referenced literal chunk,
-- as stored separately from the tag byte,
-- with the implicit offset corrected for.
Dcmp1.Chunk.BackreferenceBody.property.index_separate = {}
function Dcmp1.Chunk.BackreferenceBody.property.index_separate:get()
if self._m_index_separate ~= nil then
  return self._m_index_separate
end

if self.is_index_separate then
  self._m_index_separate = (self.index_separate_minus + 176)
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
Dcmp1.Chunk.BackreferenceBody.property.index = {}
function Dcmp1.Chunk.BackreferenceBody.property.index:get()
if self._m_index ~= nil then
  return self._m_index
end

self._m_index = utils.box_unwrap((self.is_index_separate) and utils.box_wrap(self.index_separate) or (self.index_in_tag))
return self._m_index
end

-- 
-- The index of the referenced literal chunk,
-- stored separately from the tag.
-- The value in this field is stored minus 0xb0.
-- 
-- This field is only present if the tag byte is 0xd2.
-- For other tag bytes,
-- the index is encoded in the tag byte.
-- Values smaller than 0xb0 cannot be stored in this field,
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
Dcmp1.Chunk.TableLookupBody = class.class(KaitaiStruct)

function Dcmp1.Chunk.TableLookupBody:_init(tag, io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self.tag = tag
self:_read()
end

function Dcmp1.Chunk.TableLookupBody:_read()
end

-- 
-- Fixed lookup table that maps tag byte numbers to two bytes each.
-- 
-- The entries in the lookup table are offset -
-- index 0 stands for tag 0xd5, 1 for 0xd6, etc.
Dcmp1.Chunk.TableLookupBody.property.lookup_table = {}
function Dcmp1.Chunk.TableLookupBody.property.lookup_table:get()
if self._m_lookup_table ~= nil then
  return self._m_lookup_table
end

self._m_lookup_table = {"\000\000", "\000\001", "\000\002", "\000\003", "\046\001", "\062\001", "\001\001", "\030\001", "\255\255", "\014\001", "\049\000", "\017\018", "\001\007", "\051\050", "\018\057", "\237\016", "\001\039", "\035\034", "\001\055", "\007\006", "\001\023", "\001\035", "\000\255", "\000\047", "\007\014", "\253\060", "\001\053", "\001\021", "\001\002", "\000\007", "\000\062", "\005\213", "\002\001", "\006\007", "\007\008", "\048\001", "\001\051", "\000\016", "\023\022", "\055\062", "\054\055"}
return self._m_lookup_table
end

-- 
-- The two bytes that the tag byte expands to,
-- based on the fixed lookup table.
Dcmp1.Chunk.TableLookupBody.property.value = {}
function Dcmp1.Chunk.TableLookupBody.property.value:get()
if self._m_value ~= nil then
  return self._m_value
end

self._m_value = self.lookup_table[(self.tag - 213) + 1]
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
Dcmp1.Chunk.EndBody = class.class(KaitaiStruct)

function Dcmp1.Chunk.EndBody:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Dcmp1.Chunk.EndBody:_read()
end


-- 
-- The body of an extended chunk.
-- The meaning of this chunk depends on the extended tag byte stored in the chunk data.
Dcmp1.Chunk.ExtendedBody = class.class(KaitaiStruct)

function Dcmp1.Chunk.ExtendedBody:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Dcmp1.Chunk.ExtendedBody:_read()
self.tag = self._io:read_u1()
local _on = self.tag
if _on == 2 then
  self.body = Dcmp1.Chunk.ExtendedBody.RepeatBody(self._io, self, self._root)
end
end

-- 
-- The chunk's extended tag byte.
-- This controls the structure of the body and the meaning of the chunk.
-- 
-- The chunk's body.

-- 
-- The body of a repeat chunk.
-- 
-- This chunk expands to the same byte repeated a number of times,
-- i. e. it implements a form of run-length encoding.
Dcmp1.Chunk.ExtendedBody.RepeatBody = class.class(KaitaiStruct)

function Dcmp1.Chunk.ExtendedBody.RepeatBody:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Dcmp1.Chunk.ExtendedBody.RepeatBody:_read()
self.to_repeat_raw = DcmpVariableLengthInteger(self._io)
self.repeat_count_m1_raw = DcmpVariableLengthInteger(self._io)
end

-- 
-- The value to repeat.
-- 
-- Although it is stored as a variable-length integer,
-- this value must fit into an unsigned 8-bit integer.
Dcmp1.Chunk.ExtendedBody.RepeatBody.property.to_repeat = {}
function Dcmp1.Chunk.ExtendedBody.RepeatBody.property.to_repeat:get()
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
Dcmp1.Chunk.ExtendedBody.RepeatBody.property.repeat_count_m1 = {}
function Dcmp1.Chunk.ExtendedBody.RepeatBody.property.repeat_count_m1:get()
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
Dcmp1.Chunk.ExtendedBody.RepeatBody.property.repeat_count = {}
function Dcmp1.Chunk.ExtendedBody.RepeatBody.property.repeat_count:get()
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

