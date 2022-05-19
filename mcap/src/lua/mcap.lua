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
-- MCAP is a modular container format and logging library for pub/sub messages with
-- arbitrary message serialization. It is primarily intended for use in robotics
-- applications, and works well under various workloads, resource constraints, and
-- durability requirements.
-- 
-- Time values (`log_time`, `publish_time`, `create_time`) are represented in
-- nanoseconds since a user-understood epoch (i.e. Unix epoch, robot boot time,
-- etc.)
-- See also: Source (https://github.com/foxglove/mcap/tree/c1cc51d/docs/specification#readme)
Mcap = class.class(KaitaiStruct)

Mcap.Opcode = enum.Enum {
  header = 1,
  footer = 2,
  schema = 3,
  channel = 4,
  message = 5,
  chunk = 6,
  message_index = 7,
  chunk_index = 8,
  attachment = 9,
  attachment_index = 10,
  statistics = 11,
  metadata = 12,
  metadata_index = 13,
  summary_offset = 14,
  data_end = 15,
}

function Mcap:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Mcap:_read()
  self.header_magic = Mcap.Magic(self._io, self, self._root)
  self.records = {}
  local i = 0
  while true do
    _ = Mcap.Record(self._io, self, self._root)
    self.records[i + 1] = _
    if _.op == Mcap.Opcode.footer then
      break
    end
    i = i + 1
  end
self.footer_magic = Mcap.Magic(self._io, self, self._root)
end

Mcap.property.footer = {}
function Mcap.property.footer:get()
if self._m_footer ~= nil then
  return self._m_footer
end

local _pos = self._io:pos()
self._io:seek(self.ofs_footer)
self._raw__m_footer = self._io:read_bytes_full()
local _io = KaitaiStream(stringstream(self._raw__m_footer))
self._m_footer = Mcap.Record(_io, self, self._root)
self._io:seek(_pos)
return self._m_footer
end

Mcap.property.ofs_footer = {}
function Mcap.property.ofs_footer:get()
if self._m_ofs_footer ~= nil then
  return self._m_ofs_footer
end

self._m_ofs_footer = ((((self._io:size() - 1) - 8) - 20) - 8)
return self._m_ofs_footer
end


Mcap.PrefixedStr = class.class(KaitaiStruct)

function Mcap.PrefixedStr:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.PrefixedStr:_read()
self.len_str = self._io:read_u4le()
self.str = str_decode.decode(self._io:read_bytes(self.len_str), "UTF-8")
end


Mcap.Chunk = class.class(KaitaiStruct)

function Mcap.Chunk:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.Chunk:_read()
self.message_start_time = self._io:read_u8le()
self.message_end_time = self._io:read_u8le()
self.uncompressed_size = self._io:read_u8le()
self.uncompressed_crc32 = self._io:read_u4le()
self.compression = Mcap.PrefixedStr(self._io, self, self._root)
self.len_records = self._io:read_u8le()
local _on = self.compression.str
if _on == "" then
  self._raw_records = self._io:read_bytes(self.len_records)
  local _io = KaitaiStream(stringstream(self._raw_records))
  self.records = Mcap.Records(_io, self, self._root)
else
  self.records = self._io:read_bytes(self.len_records)
end
end

-- 
-- CRC-32 checksum of uncompressed `records` field. A value of zero indicates that
-- CRC validation should not be performed.

Mcap.DataEnd = class.class(KaitaiStruct)

function Mcap.DataEnd:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.DataEnd:_read()
self.data_section_crc32 = self._io:read_u4le()
end

-- 
-- CRC-32 of all bytes in the data section. A value of 0 indicates the CRC-32 is not
-- available.

Mcap.Channel = class.class(KaitaiStruct)

function Mcap.Channel:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.Channel:_read()
self.id = self._io:read_u2le()
self.schema_id = self._io:read_u2le()
self.topic = Mcap.PrefixedStr(self._io, self, self._root)
self.message_encoding = Mcap.PrefixedStr(self._io, self, self._root)
self.metadata = Mcap.MapStrStr(self._io, self, self._root)
end


Mcap.MessageIndex = class.class(KaitaiStruct)

function Mcap.MessageIndex:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.MessageIndex:_read()
self.channel_id = self._io:read_u2le()
self.len_records = self._io:read_u4le()
self._raw_records = self._io:read_bytes(self.len_records)
local _io = KaitaiStream(stringstream(self._raw_records))
self.records = Mcap.MessageIndex.MessageIndexEntries(_io, self, self._root)
end


Mcap.MessageIndex.MessageIndexEntry = class.class(KaitaiStruct)

function Mcap.MessageIndex.MessageIndexEntry:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.MessageIndex.MessageIndexEntry:_read()
self.log_time = self._io:read_u8le()
self.offset = self._io:read_u8le()
end


Mcap.MessageIndex.MessageIndexEntries = class.class(KaitaiStruct)

function Mcap.MessageIndex.MessageIndexEntries:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.MessageIndex.MessageIndexEntries:_read()
self.entries = {}
local i = 0
while not self._io:is_eof() do
  self.entries[i + 1] = Mcap.MessageIndex.MessageIndexEntry(self._io, self, self._root)
  i = i + 1
end
end


Mcap.Statistics = class.class(KaitaiStruct)

function Mcap.Statistics:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.Statistics:_read()
self.message_count = self._io:read_u8le()
self.schema_count = self._io:read_u2le()
self.channel_count = self._io:read_u4le()
self.attachment_count = self._io:read_u4le()
self.metadata_count = self._io:read_u4le()
self.chunk_count = self._io:read_u4le()
self.message_start_time = self._io:read_u8le()
self.message_end_time = self._io:read_u8le()
self.len_channel_message_counts = self._io:read_u4le()
self._raw_channel_message_counts = self._io:read_bytes(self.len_channel_message_counts)
local _io = KaitaiStream(stringstream(self._raw_channel_message_counts))
self.channel_message_counts = Mcap.Statistics.ChannelMessageCounts(_io, self, self._root)
end


Mcap.Statistics.ChannelMessageCounts = class.class(KaitaiStruct)

function Mcap.Statistics.ChannelMessageCounts:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.Statistics.ChannelMessageCounts:_read()
self.entries = {}
local i = 0
while not self._io:is_eof() do
  self.entries[i + 1] = Mcap.Statistics.ChannelMessageCount(self._io, self, self._root)
  i = i + 1
end
end


Mcap.Statistics.ChannelMessageCount = class.class(KaitaiStruct)

function Mcap.Statistics.ChannelMessageCount:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.Statistics.ChannelMessageCount:_read()
self.channel_id = self._io:read_u2le()
self.message_count = self._io:read_u8le()
end


Mcap.AttachmentIndex = class.class(KaitaiStruct)

function Mcap.AttachmentIndex:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.AttachmentIndex:_read()
self.ofs_attachment = self._io:read_u8le()
self.len_attachment = self._io:read_u8le()
self.log_time = self._io:read_u8le()
self.create_time = self._io:read_u8le()
self.data_size = self._io:read_u8le()
self.name = Mcap.PrefixedStr(self._io, self, self._root)
self.content_type = Mcap.PrefixedStr(self._io, self, self._root)
end

Mcap.AttachmentIndex.property.attachment = {}
function Mcap.AttachmentIndex.property.attachment:get()
if self._m_attachment ~= nil then
  return self._m_attachment
end

local _io = self._root._io
local _pos = _io:pos()
_io:seek(self.ofs_attachment)
self._raw__m_attachment = _io:read_bytes(self.len_attachment)
local _io = KaitaiStream(stringstream(self._raw__m_attachment))
self._m_attachment = Mcap.Record(_io, self, self._root)
_io:seek(_pos)
return self._m_attachment
end


Mcap.Schema = class.class(KaitaiStruct)

function Mcap.Schema:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.Schema:_read()
self.id = self._io:read_u2le()
self.name = Mcap.PrefixedStr(self._io, self, self._root)
self.encoding = Mcap.PrefixedStr(self._io, self, self._root)
self.len_data = self._io:read_u4le()
self.data = self._io:read_bytes(self.len_data)
end


Mcap.MapStrStr = class.class(KaitaiStruct)

function Mcap.MapStrStr:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.MapStrStr:_read()
self.len_entries = self._io:read_u4le()
self._raw_entries = self._io:read_bytes(self.len_entries)
local _io = KaitaiStream(stringstream(self._raw_entries))
self.entries = Mcap.MapStrStr.Entries(_io, self, self._root)
end


Mcap.MapStrStr.Entries = class.class(KaitaiStruct)

function Mcap.MapStrStr.Entries:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.MapStrStr.Entries:_read()
self.entries = {}
local i = 0
while not self._io:is_eof() do
  self.entries[i + 1] = Mcap.TupleStrStr(self._io, self, self._root)
  i = i + 1
end
end


Mcap.SummaryOffset = class.class(KaitaiStruct)

function Mcap.SummaryOffset:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.SummaryOffset:_read()
self.group_opcode = Mcap.Opcode(self._io:read_u1())
self.ofs_group = self._io:read_u8le()
self.len_group = self._io:read_u8le()
end

Mcap.SummaryOffset.property.group = {}
function Mcap.SummaryOffset.property.group:get()
if self._m_group ~= nil then
  return self._m_group
end

local _io = self._root._io
local _pos = _io:pos()
_io:seek(self.ofs_group)
self._raw__m_group = _io:read_bytes(self.len_group)
local _io = KaitaiStream(stringstream(self._raw__m_group))
self._m_group = Mcap.Records(_io, self, self._root)
_io:seek(_pos)
return self._m_group
end


Mcap.Attachment = class.class(KaitaiStruct)

function Mcap.Attachment:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.Attachment:_read()
self.log_time = self._io:read_u8le()
self.create_time = self._io:read_u8le()
self.name = Mcap.PrefixedStr(self._io, self, self._root)
self.content_type = Mcap.PrefixedStr(self._io, self, self._root)
self.len_data = self._io:read_u8le()
self.data = self._io:read_bytes(self.len_data)
if self.crc32_input_end >= 0 then
  self.invoke_crc32_input_end = self._io:read_bytes(0)
end
self.crc32 = self._io:read_u4le()
end

Mcap.Attachment.property.crc32_input_end = {}
function Mcap.Attachment.property.crc32_input_end:get()
if self._m_crc32_input_end ~= nil then
  return self._m_crc32_input_end
end

self._m_crc32_input_end = self._io:pos()
return self._m_crc32_input_end
end

Mcap.Attachment.property.crc32_input = {}
function Mcap.Attachment.property.crc32_input:get()
if self._m_crc32_input ~= nil then
  return self._m_crc32_input
end

local _pos = self._io:pos()
self._io:seek(0)
self._m_crc32_input = self._io:read_bytes(self.crc32_input_end)
self._io:seek(_pos)
return self._m_crc32_input
end

-- 
-- CRC-32 checksum of preceding fields in the record. A value of zero indicates that
-- CRC validation should not be performed.

Mcap.Metadata = class.class(KaitaiStruct)

function Mcap.Metadata:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.Metadata:_read()
self.name = Mcap.PrefixedStr(self._io, self, self._root)
self.metadata = Mcap.MapStrStr(self._io, self, self._root)
end


Mcap.Header = class.class(KaitaiStruct)

function Mcap.Header:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.Header:_read()
self.profile = Mcap.PrefixedStr(self._io, self, self._root)
self.library = Mcap.PrefixedStr(self._io, self, self._root)
end


Mcap.Message = class.class(KaitaiStruct)

function Mcap.Message:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.Message:_read()
self.channel_id = self._io:read_u2le()
self.sequence = self._io:read_u4le()
self.log_time = self._io:read_u8le()
self.publish_time = self._io:read_u8le()
self.data = self._io:read_bytes_full()
end


Mcap.TupleStrStr = class.class(KaitaiStruct)

function Mcap.TupleStrStr:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.TupleStrStr:_read()
self.key = Mcap.PrefixedStr(self._io, self, self._root)
self.value = Mcap.PrefixedStr(self._io, self, self._root)
end


Mcap.MetadataIndex = class.class(KaitaiStruct)

function Mcap.MetadataIndex:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.MetadataIndex:_read()
self.ofs_metadata = self._io:read_u8le()
self.len_metadata = self._io:read_u8le()
self.name = Mcap.PrefixedStr(self._io, self, self._root)
end

Mcap.MetadataIndex.property.metadata = {}
function Mcap.MetadataIndex.property.metadata:get()
if self._m_metadata ~= nil then
  return self._m_metadata
end

local _io = self._root._io
local _pos = _io:pos()
_io:seek(self.ofs_metadata)
self._raw__m_metadata = _io:read_bytes(self.len_metadata)
local _io = KaitaiStream(stringstream(self._raw__m_metadata))
self._m_metadata = Mcap.Record(_io, self, self._root)
_io:seek(_pos)
return self._m_metadata
end


Mcap.Magic = class.class(KaitaiStruct)

function Mcap.Magic:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.Magic:_read()
self.magic = self._io:read_bytes(8)
if not(self.magic == "\137\077\067\065\080\048\013\010") then
  error("not equal, expected " ..  "\137\077\067\065\080\048\013\010" .. ", but got " .. self.magic)
end
end


Mcap.Records = class.class(KaitaiStruct)

function Mcap.Records:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.Records:_read()
self.records = {}
local i = 0
while not self._io:is_eof() do
  self.records[i + 1] = Mcap.Record(self._io, self, self._root)
  i = i + 1
end
end


Mcap.Footer = class.class(KaitaiStruct)

function Mcap.Footer:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.Footer:_read()
self.ofs_summary_section = self._io:read_u8le()
self.ofs_summary_offset_section = self._io:read_u8le()
self.summary_crc32 = self._io:read_u4le()
end

Mcap.Footer.property.summary_section = {}
function Mcap.Footer.property.summary_section:get()
if self._m_summary_section ~= nil then
  return self._m_summary_section
end

if self.ofs_summary_section ~= 0 then
  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.ofs_summary_section)
  self._raw__m_summary_section = _io:read_bytes((utils.box_unwrap((self.ofs_summary_offset_section ~= 0) and utils.box_wrap(self.ofs_summary_offset_section) or (self._root.ofs_footer)) - self.ofs_summary_section))
  local _io = KaitaiStream(stringstream(self._raw__m_summary_section))
  self._m_summary_section = Mcap.Records(_io, self, self._root)
  _io:seek(_pos)
end
return self._m_summary_section
end

Mcap.Footer.property.summary_offset_section = {}
function Mcap.Footer.property.summary_offset_section:get()
if self._m_summary_offset_section ~= nil then
  return self._m_summary_offset_section
end

if self.ofs_summary_offset_section ~= 0 then
  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.ofs_summary_offset_section)
  self._raw__m_summary_offset_section = _io:read_bytes((self._root.ofs_footer - self.ofs_summary_offset_section))
  local _io = KaitaiStream(stringstream(self._raw__m_summary_offset_section))
  self._m_summary_offset_section = Mcap.Records(_io, self, self._root)
  _io:seek(_pos)
end
return self._m_summary_offset_section
end

Mcap.Footer.property.ofs_summary_crc32_input = {}
function Mcap.Footer.property.ofs_summary_crc32_input:get()
if self._m_ofs_summary_crc32_input ~= nil then
  return self._m_ofs_summary_crc32_input
end

self._m_ofs_summary_crc32_input = utils.box_unwrap((self.ofs_summary_section ~= 0) and utils.box_wrap(self.ofs_summary_section) or (self._root.ofs_footer))
return self._m_ofs_summary_crc32_input
end

Mcap.Footer.property.summary_crc32_input = {}
function Mcap.Footer.property.summary_crc32_input:get()
if self._m_summary_crc32_input ~= nil then
  return self._m_summary_crc32_input
end

local _io = self._root._io
local _pos = _io:pos()
_io:seek(self.ofs_summary_crc32_input)
self._m_summary_crc32_input = _io:read_bytes((((self._root._io:size() - self.ofs_summary_crc32_input) - 8) - 4))
_io:seek(_pos)
return self._m_summary_crc32_input
end

-- 
-- A CRC-32 of all bytes from the start of the Summary section up through and
-- including the end of the previous field (summary_offset_start) in the footer
-- record. A value of 0 indicates the CRC-32 is not available.

Mcap.Record = class.class(KaitaiStruct)

function Mcap.Record:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.Record:_read()
self.op = Mcap.Opcode(self._io:read_u1())
self.len_body = self._io:read_u8le()
local _on = self.op
if _on == Mcap.Opcode.message then
  self._raw_body = self._io:read_bytes(self.len_body)
  local _io = KaitaiStream(stringstream(self._raw_body))
  self.body = Mcap.Message(_io, self, self._root)
elseif _on == Mcap.Opcode.metadata_index then
  self._raw_body = self._io:read_bytes(self.len_body)
  local _io = KaitaiStream(stringstream(self._raw_body))
  self.body = Mcap.MetadataIndex(_io, self, self._root)
elseif _on == Mcap.Opcode.chunk then
  self._raw_body = self._io:read_bytes(self.len_body)
  local _io = KaitaiStream(stringstream(self._raw_body))
  self.body = Mcap.Chunk(_io, self, self._root)
elseif _on == Mcap.Opcode.schema then
  self._raw_body = self._io:read_bytes(self.len_body)
  local _io = KaitaiStream(stringstream(self._raw_body))
  self.body = Mcap.Schema(_io, self, self._root)
elseif _on == Mcap.Opcode.chunk_index then
  self._raw_body = self._io:read_bytes(self.len_body)
  local _io = KaitaiStream(stringstream(self._raw_body))
  self.body = Mcap.ChunkIndex(_io, self, self._root)
elseif _on == Mcap.Opcode.data_end then
  self._raw_body = self._io:read_bytes(self.len_body)
  local _io = KaitaiStream(stringstream(self._raw_body))
  self.body = Mcap.DataEnd(_io, self, self._root)
elseif _on == Mcap.Opcode.attachment_index then
  self._raw_body = self._io:read_bytes(self.len_body)
  local _io = KaitaiStream(stringstream(self._raw_body))
  self.body = Mcap.AttachmentIndex(_io, self, self._root)
elseif _on == Mcap.Opcode.statistics then
  self._raw_body = self._io:read_bytes(self.len_body)
  local _io = KaitaiStream(stringstream(self._raw_body))
  self.body = Mcap.Statistics(_io, self, self._root)
elseif _on == Mcap.Opcode.message_index then
  self._raw_body = self._io:read_bytes(self.len_body)
  local _io = KaitaiStream(stringstream(self._raw_body))
  self.body = Mcap.MessageIndex(_io, self, self._root)
elseif _on == Mcap.Opcode.channel then
  self._raw_body = self._io:read_bytes(self.len_body)
  local _io = KaitaiStream(stringstream(self._raw_body))
  self.body = Mcap.Channel(_io, self, self._root)
elseif _on == Mcap.Opcode.metadata then
  self._raw_body = self._io:read_bytes(self.len_body)
  local _io = KaitaiStream(stringstream(self._raw_body))
  self.body = Mcap.Metadata(_io, self, self._root)
elseif _on == Mcap.Opcode.attachment then
  self._raw_body = self._io:read_bytes(self.len_body)
  local _io = KaitaiStream(stringstream(self._raw_body))
  self.body = Mcap.Attachment(_io, self, self._root)
elseif _on == Mcap.Opcode.header then
  self._raw_body = self._io:read_bytes(self.len_body)
  local _io = KaitaiStream(stringstream(self._raw_body))
  self.body = Mcap.Header(_io, self, self._root)
elseif _on == Mcap.Opcode.footer then
  self._raw_body = self._io:read_bytes(self.len_body)
  local _io = KaitaiStream(stringstream(self._raw_body))
  self.body = Mcap.Footer(_io, self, self._root)
elseif _on == Mcap.Opcode.summary_offset then
  self._raw_body = self._io:read_bytes(self.len_body)
  local _io = KaitaiStream(stringstream(self._raw_body))
  self.body = Mcap.SummaryOffset(_io, self, self._root)
else
  self.body = self._io:read_bytes(self.len_body)
end
end


Mcap.ChunkIndex = class.class(KaitaiStruct)

function Mcap.ChunkIndex:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.ChunkIndex:_read()
self.message_start_time = self._io:read_u8le()
self.message_end_time = self._io:read_u8le()
self.ofs_chunk = self._io:read_u8le()
self.len_chunk = self._io:read_u8le()
self.len_message_index_offsets = self._io:read_u4le()
self._raw_message_index_offsets = self._io:read_bytes(self.len_message_index_offsets)
local _io = KaitaiStream(stringstream(self._raw_message_index_offsets))
self.message_index_offsets = Mcap.ChunkIndex.MessageIndexOffsets(_io, self, self._root)
self.message_index_length = self._io:read_u8le()
self.compression = Mcap.PrefixedStr(self._io, self, self._root)
self.compressed_size = self._io:read_u8le()
self.uncompressed_size = self._io:read_u8le()
end

Mcap.ChunkIndex.property.chunk = {}
function Mcap.ChunkIndex.property.chunk:get()
if self._m_chunk ~= nil then
  return self._m_chunk
end

local _io = self._root._io
local _pos = _io:pos()
_io:seek(self.ofs_chunk)
self._raw__m_chunk = _io:read_bytes(self.len_chunk)
local _io = KaitaiStream(stringstream(self._raw__m_chunk))
self._m_chunk = Mcap.Record(_io, self, self._root)
_io:seek(_pos)
return self._m_chunk
end


Mcap.ChunkIndex.MessageIndexOffset = class.class(KaitaiStruct)

function Mcap.ChunkIndex.MessageIndexOffset:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.ChunkIndex.MessageIndexOffset:_read()
self.channel_id = self._io:read_u2le()
self.offset = self._io:read_u8le()
end


Mcap.ChunkIndex.MessageIndexOffsets = class.class(KaitaiStruct)

function Mcap.ChunkIndex.MessageIndexOffsets:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function Mcap.ChunkIndex.MessageIndexOffsets:_read()
self.entries = {}
local i = 0
while not self._io:is_eof() do
  self.entries[i + 1] = Mcap.ChunkIndex.MessageIndexOffset(self._io, self, self._root)
  i = i + 1
end
end


