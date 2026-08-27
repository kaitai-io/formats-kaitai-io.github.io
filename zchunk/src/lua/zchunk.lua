-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local utils = require("utils")

-- 
-- See also: Source (https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt)
Zchunk = class.class(KaitaiStruct)

Zchunk.ChecksumTypes = enum.Enum {
  sha1 = 0,
  sha256 = 1,
  sha512 = 2,
  sha512_128 = 3,
}

Zchunk.CompressionTypes = enum.Enum {
  none = 0,
  zstd = 2,
}

function Zchunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Zchunk:_read()
  self.lead = Zchunk.HeaderLead(self._io, self, self._root)
  self._raw_header_rest = self._io:read_bytes(self.lead.len_header_rest.value)
  local _io = KaitaiStream(stringstream(self._raw_header_rest))
  self.header_rest = Zchunk.HeaderWithoutLead(_io, self, self._root)
  self.dict = self._io:read_bytes(self.header_rest.index.len_dict.value)
  if not(self.lead.is_detached_header) then
    self.chunks = {}
    for i = 0, #self.header_rest.index.chunks_metadata - 1 do
      self.chunks[i + 1] = self._io:read_bytes(self.header_rest.index.chunks_metadata[i + 1].len_chunk.value)
    end
  end
end

-- 
-- Custom dictionary used when compressing each chunk. It's compressed itself
-- without a dictionary.
-- 
-- The official zchunk specification calls this section "Compressed Dict".
-- It's also called a "dictionary chunk". `zck_read_header -c` presents it as
-- "chunk 0" (which is always shown in the chunk table, but can have size 0
-- if the dictionary is not in use).
-- 
-- Chunks of data, each compressed with the custom dictionary `dict` (if
-- applicable).
-- 
-- They are not included in a detached header (`.zhr`) file. Detached headers
-- contain the dictionary, but none of the data chunks.

Zchunk.ChecksumType = class.class(KaitaiStruct)

function Zchunk.ChecksumType:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Zchunk.ChecksumType:_read()
  self.raw = Zchunk.CompressedInteger(self._io, self, self._root)
  local _ = self.raw
  if not(self.len_checksum ~= 0) then
    error("ValidationExprError")
  end
end

Zchunk.ChecksumType.property.len_checksum = {}
function Zchunk.ChecksumType.property.len_checksum:get()
  if self._m_len_checksum ~= nil then
    return self._m_len_checksum
  end

  self._m_len_checksum = utils.box_unwrap((self.value == Zchunk.ChecksumTypes.sha1) and utils.box_wrap(20) or (utils.box_unwrap((self.value == Zchunk.ChecksumTypes.sha256) and utils.box_wrap(32) or (utils.box_unwrap((self.value == Zchunk.ChecksumTypes.sha512) and utils.box_wrap(64) or (utils.box_unwrap((self.value == Zchunk.ChecksumTypes.sha512_128) and utils.box_wrap(16) or (0))))))))
  return self._m_len_checksum
end

Zchunk.ChecksumType.property.value = {}
function Zchunk.ChecksumType.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = Zchunk.ChecksumTypes(self.raw.value)
  return self._m_value
end

-- 
-- Raw integer, don't read this field - access `value` instead.

Zchunk.Chunk = class.class(KaitaiStruct)

function Zchunk.Chunk:_init(len_checksum, has_data_streams, has_uncompressed_source, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self.len_checksum = len_checksum
  self.has_data_streams = has_data_streams
  self.has_uncompressed_source = has_uncompressed_source
  self:_read()
end

function Zchunk.Chunk:_read()
  if self.has_data_streams then
    self.chunk_stream = Zchunk.CompressedInteger(self._io, self, self._root)
  end
  self.chunk_checksum = self._io:read_bytes(self.len_checksum)
  if self.has_uncompressed_source then
    self.uncompressed_chunk_checksum = self._io:read_bytes(self.len_checksum)
  end
  self.len_chunk = Zchunk.CompressedInteger(self._io, self, self._root)
  self.len_uncompressed_chunk = Zchunk.CompressedInteger(self._io, self, self._root)
end

-- 
-- Checksum of the uncompressed chunk. Used to detect whether a chunk
-- from an uncompressed source is identical to the compressed chunk.

-- 
-- Like `/common/vlq_base128_le` (LEB128), but the logic of the
-- "continuation" flag in the most significant bit is inverted, so instead of
-- `has_next`, it is called `is_last` (if the highest bit is set to zero, it
-- means "continue", whereas in standard LEB128, the highest bit set to
-- **one** means "continue"). Therefore, we cannot simply import
-- `/common/vlq_base128_le` and use it, because it is incompatible.
Zchunk.CompressedInteger = class.class(KaitaiStruct)

function Zchunk.CompressedInteger:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Zchunk.CompressedInteger:_read()
  self.groups = {}
  local i = 0
  while true do
    local _ = Zchunk.CompressedInteger.Group(i, self._io, self, self._root)
    self.groups[i + 1] = _
    if _.is_last then
      break
    end
    i = i + 1
  end
end

Zchunk.CompressedInteger.property.len = {}
function Zchunk.CompressedInteger.property.len:get()
  if self._m_len ~= nil then
    return self._m_len
  end

  self._m_len = #self.groups
  return self._m_len
end

-- 
-- Resulting unsigned value as normal integer.
Zchunk.CompressedInteger.property.value = {}
function Zchunk.CompressedInteger.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = (((((((((self.groups[0 + 1].value | utils.box_unwrap((self.len >= 2) and utils.box_wrap(self.groups[1 + 1].value << 7) or (0))) | utils.box_unwrap((self.len >= 3) and utils.box_wrap(self.groups[2 + 1].value << 14) or (0))) | utils.box_unwrap((self.len >= 4) and utils.box_wrap(self.groups[3 + 1].value << 21) or (0))) | utils.box_unwrap((self.len >= 5) and utils.box_wrap(self.groups[4 + 1].value << 28) or (0))) | utils.box_unwrap((self.len >= 6) and utils.box_wrap(self.groups[5 + 1].value << 35) or (0))) | utils.box_unwrap((self.len >= 7) and utils.box_wrap(self.groups[6 + 1].value << 42) or (0))) | utils.box_unwrap((self.len >= 8) and utils.box_wrap(self.groups[7 + 1].value << 49) or (0))) | utils.box_unwrap((self.len >= 9) and utils.box_wrap(self.groups[8 + 1].value << 56) or (0))) | utils.box_unwrap((self.len >= 10) and utils.box_wrap(self.groups[9 + 1].value << 63) or (0)))
  return self._m_value
end


-- 
-- One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
Zchunk.CompressedInteger.Group = class.class(KaitaiStruct)

function Zchunk.CompressedInteger.Group:_init(idx, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self.idx = idx
  self:_read()
end

function Zchunk.CompressedInteger.Group:_read()
  self.is_last = self._io:read_bits_int_be(1) ~= 0
  if not(self.is_last == utils.box_unwrap((self.idx == 9) and utils.box_wrap(true) or (self.is_last))) then
    error("not equal, expected " .. utils.box_unwrap((self.idx == 9) and utils.box_wrap(true) or (self.is_last)) .. ", but got " .. self.is_last)
  end
  self.value = self._io:read_bits_int_be(7)
  if not(self.value <= utils.box_unwrap((self.idx == 9) and utils.box_wrap(1) or (127))) then
    error("ValidationGreaterThanError")
  end
end

-- 
-- If `true`, then this is the last byte of the compressed integer.
-- 
-- Since this implementation only supports serialized values up to 10
-- bytes, this must be `true` in the 10th group (`groups[9]`).
-- 
-- The 7-bit (base128) numeric value chunk of this group
-- 
-- Since this implementation only supports integer values up to 64 bits,
-- the `value` in the 10th group (`groups[9]`) can only be `0` or `1`
-- (otherwise the width of the represented value would be 65 bits or
-- more, which is not supported).

Zchunk.HeaderLead = class.class(KaitaiStruct)

function Zchunk.HeaderLead:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Zchunk.HeaderLead:_read()
  self.magic = self._io:read_bytes(5)
  if not( ((self.magic == "\000\090\067\075\049") or (self.magic == "\000\090\072\082\049")) ) then
    error("ValidationNotAnyOfError")
  end
  self.overall_checksum_type = Zchunk.ChecksumType(self._io, self, self._root)
  self.len_header_rest = Zchunk.CompressedInteger(self._io, self, self._root)
  self.header_checksum = self._io:read_bytes(self.overall_checksum_type.len_checksum)
end

-- 
-- Determines whether this file is a zchunk detached header (`.zhr`). If
-- not, it is a complete zchunk file (`.zck`).
Zchunk.HeaderLead.property.is_detached_header = {}
function Zchunk.HeaderLead.property.is_detached_header:get()
  if self._m_is_detached_header ~= nil then
    return self._m_is_detached_header
  end

  self._m_is_detached_header = string.byte(self.magic, 2 + 1) == 72
  return self._m_is_detached_header
end

-- 
-- There are two valid magic numbers for zchunk files:
-- 
-- * `'\0ZCK1'` identifies a zchunk version 1 file (`.zck`)
-- * `'\0ZHR1'` identifies a zchunk version 1 detached header file (`.zhr`)
-- 
-- Type of the checksum used for `header_checksum` and
-- `_root.header_rest.preface.data_checksum`.
-- 
-- Size of the header, not including the lead.
-- 
-- Checksum of the entire header, which consists of `_root.lead` and
-- `_root.header_rest` (i.e. everything from the beginning of the file to
-- the end of `_root.header_rest`), not including the `header_checksum`
-- field itself (i.e. the input for the checksum algorithm is a
-- concatenation of the bytes preceding the `header_checksum` field with
-- the bytes following it).
-- 
-- For detached headers, the checksum is calculated as if the `magic`
-- field were set to `'\0ZCK1'`, so that it matches the checksum in the
-- full zchunk file.

Zchunk.HeaderWithoutLead = class.class(KaitaiStruct)

function Zchunk.HeaderWithoutLead:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Zchunk.HeaderWithoutLead:_read()
  self.preface = Zchunk.Preface(self._io, self, self._root)
  self.len_index = Zchunk.CompressedInteger(self._io, self, self._root)
  self._raw_index = self._io:read_bytes(self.len_index.value)
  local _io = KaitaiStream(stringstream(self._raw_index))
  self.index = Zchunk.Index(_io, self, self._root)
  self.num_signatures = Zchunk.CompressedInteger(self._io, self, self._root)
  local _ = self.num_signatures
  if not(_.value == 0) then
    error("ValidationExprError")
  end
end

-- 
-- Must be 0. The reference implementation also rejects any file with a
-- non-zero "Signature count", throwing a fatal error stating "Signatures
-- aren't supported yet" - see
-- [`src/lib/header.c:259-264`](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/src/lib/header.c#L259-L264).
-- 
-- Although the structure of signatures is defined [in the official
-- textual
-- specification](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L219-L252),
-- no signature types are defined, and as of this writing no publicly
-- known implementation generates or interprets these signatures.
-- Therefore, we've decided not to implement them here either.
-- 
-- For more details, see
-- <https://github.com/kaitai-io/kaitai_struct_formats/pull/539#discussion_r3713109887>.

Zchunk.Index = class.class(KaitaiStruct)

function Zchunk.Index:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Zchunk.Index:_read()
  self.chunk_checksum_type = Zchunk.ChecksumType(self._io, self, self._root)
  self.num_chunks = Zchunk.CompressedInteger(self._io, self, self._root)
  local _ = self.num_chunks
  if not(_.value >= 1) then
    error("ValidationExprError")
  end
  if self._parent.preface.has_data_streams then
    self.dict_stream = Zchunk.CompressedInteger(self._io, self, self._root)
    local _ = self.dict_stream
    if not(_.value == 0) then
      error("ValidationExprError")
    end
  end
  self.dict_checksum = self._io:read_bytes(self.chunk_checksum_type.len_checksum)
  if self._parent.preface.has_uncompressed_source then
    self.uncompressed_dict_checksum = self._io:read_bytes(self.chunk_checksum_type.len_checksum)
  end
  self.len_dict = Zchunk.CompressedInteger(self._io, self, self._root)
  self.len_uncompressed_dict = Zchunk.CompressedInteger(self._io, self, self._root)
  self.chunks_metadata = {}
  for i = 0, self.num_data_chunks - 1 do
    self.chunks_metadata[i + 1] = Zchunk.Chunk(self.chunk_checksum_type.len_checksum, self._parent.preface.has_data_streams, self._parent.preface.has_uncompressed_source, self._io, self, self._root)
  end
end

-- 
-- Number of data chunks. `num_chunks` counts the dictionary as chunk 0,
-- so it is one greater than this number.
Zchunk.Index.property.num_data_chunks = {}
function Zchunk.Index.property.num_data_chunks:get()
  if self._m_num_data_chunks ~= nil then
    return self._m_num_data_chunks
  end

  self._m_num_data_chunks = self.num_chunks.value - 1
  return self._m_num_data_chunks
end

-- 
-- Type of the checksum used for `dict_checksum` and for all
-- `chunks_metadata[...].chunk_checksum` and
-- `chunks_metadata[...].uncompressed_chunk_checksum`.
-- 
-- Number of chunks, **including** the dictionary chunk.
-- 
-- Must be at least 1, because the dictionary chunk is always present,
-- even if it is empty. The reference implementation also fails when the
-- number of chunks is 0, see
-- [`src/lib/index/index_read.c:181-184`](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/src/lib/index/index_read.c#L181-L184).
-- 
-- If present, it must always be 0.
-- See also: Source (https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L159-L162)
-- 
-- Checksum of the uncompressed dictionary. It has no real use, as the
-- uncompressed source won't have a dictionary.
-- 
-- Metadata of the data chunks. The dictionary is chunk 0 and its
-- metadata is stored in the `*dict*` fields above, so there is one fewer
-- entry here than indicated by `num_chunks`.

Zchunk.OptionalElement = class.class(KaitaiStruct)

function Zchunk.OptionalElement:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Zchunk.OptionalElement:_read()
  self.element_id = Zchunk.CompressedInteger(self._io, self, self._root)
  self.len_data = Zchunk.CompressedInteger(self._io, self, self._root)
  self.data = self._io:read_bytes(self.len_data.value)
end


Zchunk.Preface = class.class(KaitaiStruct)

function Zchunk.Preface:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Zchunk.Preface:_read()
  self.data_checksum = self._io:read_bytes(self._root.lead.overall_checksum_type.len_checksum)
  self.flags = Zchunk.CompressedInteger(self._io, self, self._root)
  local _ = self.flags
  if not(_.value <= 7) then
    error("ValidationExprError")
  end
  self.compression_type_int = Zchunk.CompressedInteger(self._io, self, self._root)
  local _ = self.compression_type_int
  if not( ((_.value == Zchunk.CompressionTypes.none.value) or (_.value == Zchunk.CompressionTypes.zstd.value)) ) then
    error("ValidationExprError")
  end
  if self.has_optional_elements then
    self.num_optional_elements = Zchunk.CompressedInteger(self._io, self, self._root)
    local _ = self.num_optional_elements
    if not(_.value >= 1) then
      error("ValidationExprError")
    end
  end
  if self.has_optional_elements then
    self.optional_elements = {}
    for i = 0, self.num_optional_elements.value - 1 do
      self.optional_elements[i + 1] = Zchunk.OptionalElement(self._io, self, self._root)
    end
  end
end

Zchunk.Preface.property.compression_type = {}
function Zchunk.Preface.property.compression_type:get()
  if self._m_compression_type ~= nil then
    return self._m_compression_type
  end

  self._m_compression_type = Zchunk.CompressionTypes(self.compression_type_int.value)
  return self._m_compression_type
end

Zchunk.Preface.property.has_data_streams = {}
function Zchunk.Preface.property.has_data_streams:get()
  if self._m_has_data_streams ~= nil then
    return self._m_has_data_streams
  end

  self._m_has_data_streams = self.flags.value & 1 ~= 0
  return self._m_has_data_streams
end

Zchunk.Preface.property.has_optional_elements = {}
function Zchunk.Preface.property.has_optional_elements:get()
  if self._m_has_optional_elements ~= nil then
    return self._m_has_optional_elements
  end

  self._m_has_optional_elements = self.flags.value & 2 ~= 0
  return self._m_has_optional_elements
end

-- 
-- The file may be applied against an uncompressed source. This adds an
-- uncompressed checksum to every index entry, including the dictionary.
Zchunk.Preface.property.has_uncompressed_source = {}
function Zchunk.Preface.property.has_uncompressed_source:get()
  if self._m_has_uncompressed_source ~= nil then
    return self._m_has_uncompressed_source
  end

  self._m_has_uncompressed_source = self.flags.value & 4 ~= 0
  return self._m_has_uncompressed_source
end

-- 
-- Total data checksum. Checksum of everything after the header,
-- including the compressed dictionary (`_root.dict`) and all compressed
-- chunks (`_root.chunks`). The type of this checksum is
-- `_root.lead.overall_checksum_type.value`.
-- 
-- If `has_uncompressed_source` is true, this checksum must not be
-- checked and should not be generated. In that case, the reference
-- implementation writes it as all zeros - see the sample file
-- [`mini-uncomp-cksums.zck`](https://github.com/kaitai-io/kaitai_struct_samples/blob/1d2fe11c971fb7e86f343b77a1ed341a0217e86a/archive/zchunk/README.md#mini-uncomp-cksumszck).
-- 
-- Compressed integer containing a bitmask of the flags. All unused flags
-- MUST be set to 0. If a decoder sees a flag set that it doesn't
-- recognize, it MUST exit with an error.
-- See also: Source (https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L78-L81)
-- 
-- Raw integer, don't read this field - access `compression_type`
-- instead.
-- 
-- If present, it must be at least 1. This is because if there are no
-- optional elements, `has_optional_elements` must be false, and then
-- neither this field nor `optional_elements` is present.
-- See also: Source (https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L99-L102)

