-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local str_decode = require("string_decode")
local utils = require("utils")
local enum = require("enum")

-- 
-- This spec allows to parse files used by Microsoft Windows family of
-- operating systems to store parts of its "registry". "Registry" is a
-- hierarchical database that is used to store system settings (global
-- configuration, per-user, per-application configuration, etc).
-- 
-- Typically, registry files are stored in:
-- 
-- * System-wide: several files in `%SystemRoot%\System32\Config\`
-- * User-wide:
--   * `%USERPROFILE%\Ntuser.dat`
--   * `%USERPROFILE%\Local Settings\Application Data\Microsoft\Windows\Usrclass.dat` (localized, Windows 2000, Server 2003 and Windows XP)
--   * `%USERPROFILE%\AppData\Local\Microsoft\Windows\Usrclass.dat` (non-localized, Windows Vista and later)
-- 
-- Note that one typically can't access files directly on a mounted
-- filesystem with a running Windows OS.
-- See also: Source (https://github.com/libyal/libregf/blob/master/documentation/Windows%20NT%20Registry%20File%20(REGF)%20format.asciidoc)
Regf = class.class(KaitaiStruct)

function Regf:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Regf:_read()
  self.header = Regf.FileHeader(self._io, self, self._root)
  self._raw_hive_bins = {}
  self.hive_bins = {}
  local i = 0
  while not self._io:is_eof() do
    self._raw_hive_bins[i + 1] = self._io:read_bytes(4096)
    local _io = KaitaiStream(stringstream(self._raw_hive_bins[#self._raw_hive_bins]))
    self.hive_bins[i + 1] = Regf.HiveBin(_io, self, self._root)
    i = i + 1
  end
end


Regf.Filetime = class.class(KaitaiStruct)

function Regf.Filetime:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Regf.Filetime:_read()
  self.value = self._io:read_u8le()
end


Regf.HiveBin = class.class(KaitaiStruct)

function Regf.HiveBin:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Regf.HiveBin:_read()
  self.header = Regf.HiveBinHeader(self._io, self, self._root)
  self.cells = {}
  local i = 0
  while not self._io:is_eof() do
    self.cells[i + 1] = Regf.HiveBinCell(self._io, self, self._root)
    i = i + 1
  end
end


Regf.HiveBinHeader = class.class(KaitaiStruct)

function Regf.HiveBinHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Regf.HiveBinHeader:_read()
  self.signature = self._io:read_bytes(4)
  if not(self.signature == "\104\098\105\110") then
    error("not equal, expected " ..  "\104\098\105\110" .. ", but got " .. self.signature)
  end
  self.offset = self._io:read_u4le()
  self.size = self._io:read_u4le()
  self.unknown1 = self._io:read_u4le()
  self.unknown2 = self._io:read_u4le()
  self.timestamp = Regf.Filetime(self._io, self, self._root)
  self.unknown4 = self._io:read_u4le()
end

-- 
-- The offset of the hive bin, Value in bytes and relative from
-- the start of the hive bin data
-- 
-- Size of the hive bin.
-- 
-- 0 most of the time, can contain remnant data.
-- 
-- 0 most of the time, can contain remnant data.
-- 
-- Only the root (first) hive bin seems to contain a valid FILETIME.
-- 
-- Contains number of bytes.

Regf.HiveBinCell = class.class(KaitaiStruct)

function Regf.HiveBinCell:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Regf.HiveBinCell:_read()
  self.cell_size_raw = self._io:read_s4le()
  self.identifier = str_decode.decode(self._io:read_bytes(2), "ascii")
  local _on = self.identifier
  if _on == "li" then
    self._raw_data = self._io:read_bytes(((self.cell_size - 2) - 4))
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = Regf.HiveBinCell.SubKeyListLi(_io, self, self._root)
  elseif _on == "vk" then
    self._raw_data = self._io:read_bytes(((self.cell_size - 2) - 4))
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = Regf.HiveBinCell.SubKeyListVk(_io, self, self._root)
  elseif _on == "lf" then
    self._raw_data = self._io:read_bytes(((self.cell_size - 2) - 4))
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = Regf.HiveBinCell.SubKeyListLhLf(_io, self, self._root)
  elseif _on == "ri" then
    self._raw_data = self._io:read_bytes(((self.cell_size - 2) - 4))
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = Regf.HiveBinCell.SubKeyListRi(_io, self, self._root)
  elseif _on == "lh" then
    self._raw_data = self._io:read_bytes(((self.cell_size - 2) - 4))
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = Regf.HiveBinCell.SubKeyListLhLf(_io, self, self._root)
  elseif _on == "nk" then
    self._raw_data = self._io:read_bytes(((self.cell_size - 2) - 4))
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = Regf.HiveBinCell.NamedKey(_io, self, self._root)
  elseif _on == "sk" then
    self._raw_data = self._io:read_bytes(((self.cell_size - 2) - 4))
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = Regf.HiveBinCell.SubKeyListSk(_io, self, self._root)
  else
    self.data = self._io:read_bytes(((self.cell_size - 2) - 4))
  end
end

Regf.HiveBinCell.property.cell_size = {}
function Regf.HiveBinCell.property.cell_size:get()
  if self._m_cell_size ~= nil then
    return self._m_cell_size
  end

  self._m_cell_size = (utils.box_unwrap((self.cell_size_raw < 0) and utils.box_wrap(-1) or (1)) * self.cell_size_raw)
  return self._m_cell_size
end

Regf.HiveBinCell.property.is_allocated = {}
function Regf.HiveBinCell.property.is_allocated:get()
  if self._m_is_allocated ~= nil then
    return self._m_is_allocated
  end

  self._m_is_allocated = self.cell_size_raw < 0
  return self._m_is_allocated
end


Regf.HiveBinCell.SubKeyListVk = class.class(KaitaiStruct)

Regf.HiveBinCell.SubKeyListVk.DataTypeEnum = enum.Enum {
  reg_none = 0,
  reg_sz = 1,
  reg_expand_sz = 2,
  reg_binary = 3,
  reg_dword = 4,
  reg_dword_big_endian = 5,
  reg_link = 6,
  reg_multi_sz = 7,
  reg_resource_list = 8,
  reg_full_resource_descriptor = 9,
  reg_resource_requirements_list = 10,
  reg_qword = 11,
}

Regf.HiveBinCell.SubKeyListVk.VkFlags = enum.Enum {
  value_comp_name = 1,
}

function Regf.HiveBinCell.SubKeyListVk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Regf.HiveBinCell.SubKeyListVk:_read()
  self.value_name_size = self._io:read_u2le()
  self.data_size = self._io:read_u4le()
  self.data_offset = self._io:read_u4le()
  self.data_type = Regf.HiveBinCell.SubKeyListVk.DataTypeEnum(self._io:read_u4le())
  self.flags = Regf.HiveBinCell.SubKeyListVk.VkFlags(self._io:read_u2le())
  self.padding = self._io:read_u2le()
  if self.flags == Regf.HiveBinCell.SubKeyListVk.VkFlags.value_comp_name then
    self.value_name = str_decode.decode(self._io:read_bytes(self.value_name_size), "ascii")
  end
end


Regf.HiveBinCell.SubKeyListLhLf = class.class(KaitaiStruct)

function Regf.HiveBinCell.SubKeyListLhLf:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Regf.HiveBinCell.SubKeyListLhLf:_read()
  self.count = self._io:read_u2le()
  self.items = {}
  for i = 0, self.count - 1 do
    self.items[i + 1] = Regf.HiveBinCell.SubKeyListLhLf.Item(self._io, self, self._root)
  end
end


Regf.HiveBinCell.SubKeyListLhLf.Item = class.class(KaitaiStruct)

function Regf.HiveBinCell.SubKeyListLhLf.Item:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Regf.HiveBinCell.SubKeyListLhLf.Item:_read()
  self.named_key_offset = self._io:read_u4le()
  self.hash_value = self._io:read_u4le()
end


Regf.HiveBinCell.SubKeyListSk = class.class(KaitaiStruct)

function Regf.HiveBinCell.SubKeyListSk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Regf.HiveBinCell.SubKeyListSk:_read()
  self.unknown1 = self._io:read_u2le()
  self.previous_security_key_offset = self._io:read_u4le()
  self.next_security_key_offset = self._io:read_u4le()
  self.reference_count = self._io:read_u4le()
end


Regf.HiveBinCell.SubKeyListLi = class.class(KaitaiStruct)

function Regf.HiveBinCell.SubKeyListLi:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Regf.HiveBinCell.SubKeyListLi:_read()
  self.count = self._io:read_u2le()
  self.items = {}
  for i = 0, self.count - 1 do
    self.items[i + 1] = Regf.HiveBinCell.SubKeyListLi.Item(self._io, self, self._root)
  end
end


Regf.HiveBinCell.SubKeyListLi.Item = class.class(KaitaiStruct)

function Regf.HiveBinCell.SubKeyListLi.Item:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Regf.HiveBinCell.SubKeyListLi.Item:_read()
  self.named_key_offset = self._io:read_u4le()
end


Regf.HiveBinCell.NamedKey = class.class(KaitaiStruct)

Regf.HiveBinCell.NamedKey.NkFlags = enum.Enum {
  key_is_volatile = 1,
  key_hive_exit = 2,
  key_hive_entry = 4,
  key_no_delete = 8,
  key_sym_link = 16,
  key_comp_name = 32,
  key_prefef_handle = 64,
  key_virt_mirrored = 128,
  key_virt_target = 256,
  key_virtual_store = 512,
  unknown1 = 4096,
  unknown2 = 16384,
}

function Regf.HiveBinCell.NamedKey:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Regf.HiveBinCell.NamedKey:_read()
  self.flags = Regf.HiveBinCell.NamedKey.NkFlags(self._io:read_u2le())
  self.last_key_written_date_and_time = Regf.Filetime(self._io, self, self._root)
  self.unknown1 = self._io:read_u4le()
  self.parent_key_offset = self._io:read_u4le()
  self.number_of_sub_keys = self._io:read_u4le()
  self.number_of_volatile_sub_keys = self._io:read_u4le()
  self.sub_keys_list_offset = self._io:read_u4le()
  self.number_of_values = self._io:read_u4le()
  self.values_list_offset = self._io:read_u4le()
  self.security_key_offset = self._io:read_u4le()
  self.class_name_offset = self._io:read_u4le()
  self.largest_sub_key_name_size = self._io:read_u4le()
  self.largest_sub_key_class_name_size = self._io:read_u4le()
  self.largest_value_name_size = self._io:read_u4le()
  self.largest_value_data_size = self._io:read_u4le()
  self.unknown2 = self._io:read_u4le()
  self.key_name_size = self._io:read_u2le()
  self.class_name_size = self._io:read_u2le()
  self.unknown_string_size = self._io:read_u4le()
  self.unknown_string = str_decode.decode(self._io:read_bytes(self.unknown_string_size), "ascii")
end


Regf.HiveBinCell.SubKeyListRi = class.class(KaitaiStruct)

function Regf.HiveBinCell.SubKeyListRi:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Regf.HiveBinCell.SubKeyListRi:_read()
  self.count = self._io:read_u2le()
  self.items = {}
  for i = 0, self.count - 1 do
    self.items[i + 1] = Regf.HiveBinCell.SubKeyListRi.Item(self._io, self, self._root)
  end
end


Regf.HiveBinCell.SubKeyListRi.Item = class.class(KaitaiStruct)

function Regf.HiveBinCell.SubKeyListRi.Item:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Regf.HiveBinCell.SubKeyListRi.Item:_read()
  self.sub_key_list_offset = self._io:read_u4le()
end


Regf.FileHeader = class.class(KaitaiStruct)

Regf.FileHeader.FileType = enum.Enum {
  normal = 0,
  transaction_log = 1,
}

Regf.FileHeader.FileFormat = enum.Enum {
  direct_memory_load = 1,
}

function Regf.FileHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Regf.FileHeader:_read()
  self.signature = self._io:read_bytes(4)
  if not(self.signature == "\114\101\103\102") then
    error("not equal, expected " ..  "\114\101\103\102" .. ", but got " .. self.signature)
  end
  self.primary_sequence_number = self._io:read_u4le()
  self.secondary_sequence_number = self._io:read_u4le()
  self.last_modification_date_and_time = Regf.Filetime(self._io, self, self._root)
  self.major_version = self._io:read_u4le()
  self.minor_version = self._io:read_u4le()
  self.type = Regf.FileHeader.FileType(self._io:read_u4le())
  self.format = Regf.FileHeader.FileFormat(self._io:read_u4le())
  self.root_key_offset = self._io:read_u4le()
  self.hive_bins_data_size = self._io:read_u4le()
  self.clustering_factor = self._io:read_u4le()
  self.unknown1 = self._io:read_bytes(64)
  self.unknown2 = self._io:read_bytes(396)
  self.checksum = self._io:read_u4le()
  self.reserved = self._io:read_bytes(3576)
  self.boot_type = self._io:read_u4le()
  self.boot_recover = self._io:read_u4le()
end


