-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")

-- 
-- systemd, a popular user-space system/service management suite on Linux,
-- offers logging functionality, storing incoming logs in a binary journal
-- format.
-- 
-- On live Linux system running systemd, these journals are typically located at:
-- 
-- * /run/log/journal/machine-id/*.journal (volatile, lost after reboot)
-- * /var/log/journal/machine-id/*.journal (persistent, but disabled by default on Debian / Ubuntu)
-- See also: Source (https://www.freedesktop.org/wiki/Software/systemd/journal-files/)
SystemdJournal = class.class(KaitaiStruct)

SystemdJournal.State = enum.Enum {
  offline = 0,
  online = 1,
  archived = 2,
}

function SystemdJournal:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SystemdJournal:_read()
  self._raw_header = self._io:read_bytes(self.len_header)
  local _io = KaitaiStream(stringstream(self._raw_header))
  self.header = SystemdJournal.Header(_io, self, self._root)
  self.objects = {}
  for i = 0, self.header.num_objects - 1 do
    self.objects[i + 1] = SystemdJournal.JournalObject(self._io, self, self._root)
  end
end

SystemdJournal.property.data_hash_table = {}
function SystemdJournal.property.data_hash_table:get()
  if self._m_data_hash_table ~= nil then
    return self._m_data_hash_table
  end

  local _pos = self._io:pos()
  self._io:seek(self.header.ofs_data_hash_table)
  self._m_data_hash_table = self._io:read_bytes(self.header.len_data_hash_table)
  self._io:seek(_pos)
  return self._m_data_hash_table
end

SystemdJournal.property.field_hash_table = {}
function SystemdJournal.property.field_hash_table:get()
  if self._m_field_hash_table ~= nil then
    return self._m_field_hash_table
  end

  local _pos = self._io:pos()
  self._io:seek(self.header.ofs_field_hash_table)
  self._m_field_hash_table = self._io:read_bytes(self.header.len_field_hash_table)
  self._io:seek(_pos)
  return self._m_field_hash_table
end

-- 
-- Header length is used to set substream size, as it thus required
-- prior to declaration of header.
SystemdJournal.property.len_header = {}
function SystemdJournal.property.len_header:get()
  if self._m_len_header ~= nil then
    return self._m_len_header
  end

  local _pos = self._io:pos()
  self._io:seek(88)
  self._m_len_header = self._io:read_u8le()
  self._io:seek(_pos)
  return self._m_len_header
end


-- 
-- Data objects are designed to carry log payload, typically in
-- form of a "key=value" string in `payload` attribute.
-- See also: Source (https://www.freedesktop.org/wiki/Software/systemd/journal-files/#dataobjects)
SystemdJournal.DataObject = class.class(KaitaiStruct)

function SystemdJournal.DataObject:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function SystemdJournal.DataObject:_read()
  self.hash = self._io:read_u8le()
  self.ofs_next_hash = self._io:read_u8le()
  self.ofs_head_field = self._io:read_u8le()
  self.ofs_entry = self._io:read_u8le()
  self.ofs_entry_array = self._io:read_u8le()
  self.num_entries = self._io:read_u8le()
  self.payload = self._io:read_bytes_full()
end

SystemdJournal.DataObject.property.entry = {}
function SystemdJournal.DataObject.property.entry:get()
  if self._m_entry ~= nil then
    return self._m_entry
  end

  if self.ofs_entry ~= 0 then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek(self.ofs_entry)
    self._m_entry = SystemdJournal.JournalObject(_io, self, self._root)
    _io:seek(_pos)
  end
  return self._m_entry
end

SystemdJournal.DataObject.property.entry_array = {}
function SystemdJournal.DataObject.property.entry_array:get()
  if self._m_entry_array ~= nil then
    return self._m_entry_array
  end

  if self.ofs_entry_array ~= 0 then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek(self.ofs_entry_array)
    self._m_entry_array = SystemdJournal.JournalObject(_io, self, self._root)
    _io:seek(_pos)
  end
  return self._m_entry_array
end

SystemdJournal.DataObject.property.head_field = {}
function SystemdJournal.DataObject.property.head_field:get()
  if self._m_head_field ~= nil then
    return self._m_head_field
  end

  if self.ofs_head_field ~= 0 then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek(self.ofs_head_field)
    self._m_head_field = SystemdJournal.JournalObject(_io, self, self._root)
    _io:seek(_pos)
  end
  return self._m_head_field
end

SystemdJournal.DataObject.property.next_hash = {}
function SystemdJournal.DataObject.property.next_hash:get()
  if self._m_next_hash ~= nil then
    return self._m_next_hash
  end

  if self.ofs_next_hash ~= 0 then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek(self.ofs_next_hash)
    self._m_next_hash = SystemdJournal.JournalObject(_io, self, self._root)
    _io:seek(_pos)
  end
  return self._m_next_hash
end


SystemdJournal.Header = class.class(KaitaiStruct)

function SystemdJournal.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function SystemdJournal.Header:_read()
  self.signature = self._io:read_bytes(8)
  if not(self.signature == "\076\080\075\083\072\072\082\072") then
    error("not equal, expected " .. "\076\080\075\083\072\072\082\072" .. ", but got " .. self.signature)
  end
  self.compatible_flags = self._io:read_u4le()
  self.incompatible_flags = self._io:read_u4le()
  self.state = SystemdJournal.State(self._io:read_u1())
  self.reserved = self._io:read_bytes(7)
  self.file_id = self._io:read_bytes(16)
  self.machine_id = self._io:read_bytes(16)
  self.boot_id = self._io:read_bytes(16)
  self.seqnum_id = self._io:read_bytes(16)
  self.len_header = self._io:read_u8le()
  self.len_arena = self._io:read_u8le()
  self.ofs_data_hash_table = self._io:read_u8le()
  self.len_data_hash_table = self._io:read_u8le()
  self.ofs_field_hash_table = self._io:read_u8le()
  self.len_field_hash_table = self._io:read_u8le()
  self.ofs_tail_object = self._io:read_u8le()
  self.num_objects = self._io:read_u8le()
  self.num_entries = self._io:read_u8le()
  self.tail_entry_seqnum = self._io:read_u8le()
  self.head_entry_seqnum = self._io:read_u8le()
  self.ofs_entry_array = self._io:read_u8le()
  self.head_entry_realtime = self._io:read_u8le()
  self.tail_entry_realtime = self._io:read_u8le()
  self.tail_entry_monotonic = self._io:read_u8le()
  if not(self._io:is_eof()) then
    self.num_data = self._io:read_u8le()
  end
  if not(self._io:is_eof()) then
    self.num_fields = self._io:read_u8le()
  end
  if not(self._io:is_eof()) then
    self.num_tags = self._io:read_u8le()
  end
  if not(self._io:is_eof()) then
    self.num_entry_arrays = self._io:read_u8le()
  end
end


-- 
-- See also: Source (https://www.freedesktop.org/wiki/Software/systemd/journal-files/#objects)
SystemdJournal.JournalObject = class.class(KaitaiStruct)

SystemdJournal.JournalObject.ObjectTypes = enum.Enum {
  unused = 0,
  data = 1,
  field = 2,
  entry = 3,
  data_hash_table = 4,
  field_hash_table = 5,
  entry_array = 6,
  tag = 7,
}

function SystemdJournal.JournalObject:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function SystemdJournal.JournalObject:_read()
  self.padding = self._io:read_bytes((8 - self._io:pos()) % 8)
  self.object_type = SystemdJournal.JournalObject.ObjectTypes(self._io:read_u1())
  self.flags = self._io:read_u1()
  self.reserved = self._io:read_bytes(6)
  self.len_object = self._io:read_u8le()
  local _on = self.object_type
  if _on == SystemdJournal.JournalObject.ObjectTypes.data then
    self._raw_payload = self._io:read_bytes(self.len_object - 16)
    local _io = KaitaiStream(stringstream(self._raw_payload))
    self.payload = SystemdJournal.DataObject(_io, self, self._root)
  else
    self.payload = self._io:read_bytes(self.len_object - 16)
  end
end


