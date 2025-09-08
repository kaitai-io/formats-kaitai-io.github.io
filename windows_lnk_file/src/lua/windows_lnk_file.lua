-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("windows_shell_items")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- Windows .lnk files (AKA "shell link" file) are most frequently used
-- in Windows shell to create "shortcuts" to another files, usually for
-- purposes of running a program from some other directory, sometimes
-- with certain preconfigured arguments and some other options.
-- See also: Source (https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf)
WindowsLnkFile = class.class(KaitaiStruct)

WindowsLnkFile.DriveTypes = enum.Enum {
  unknown = 0,
  no_root_dir = 1,
  removable = 2,
  fixed = 3,
  remote = 4,
  cdrom = 5,
  ramdisk = 6,
}

WindowsLnkFile.WindowState = enum.Enum {
  normal = 1,
  maximized = 3,
  min_no_active = 7,
}

function WindowsLnkFile:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function WindowsLnkFile:_read()
  self.header = WindowsLnkFile.FileHeader(self._io, self, self._root)
  if self.header.flags.has_link_target_id_list then
    self.target_id_list = WindowsLnkFile.LinkTargetIdList(self._io, self, self._root)
  end
  if self.header.flags.has_link_info then
    self.info = WindowsLnkFile.LinkInfo(self._io, self, self._root)
  end
  if self.header.flags.has_name then
    self.name = WindowsLnkFile.StringData(self._io, self, self._root)
  end
  if self.header.flags.has_rel_path then
    self.rel_path = WindowsLnkFile.StringData(self._io, self, self._root)
  end
  if self.header.flags.has_work_dir then
    self.work_dir = WindowsLnkFile.StringData(self._io, self, self._root)
  end
  if self.header.flags.has_arguments then
    self.arguments = WindowsLnkFile.StringData(self._io, self, self._root)
  end
  if self.header.flags.has_icon_location then
    self.icon_location = WindowsLnkFile.StringData(self._io, self, self._root)
  end
end


-- 
-- See also: Section 2.1 (https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf)
WindowsLnkFile.FileHeader = class.class(KaitaiStruct)

function WindowsLnkFile.FileHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsLnkFile.FileHeader:_read()
  self.len_header = self._io:read_bytes(4)
  if not(self.len_header == "\076\000\000\000") then
    error("not equal, expected " .. "\076\000\000\000" .. ", but got " .. self.len_header)
  end
  self.link_clsid = self._io:read_bytes(16)
  if not(self.link_clsid == "\001\020\002\000\000\000\000\000\192\000\000\000\000\000\000\070") then
    error("not equal, expected " .. "\001\020\002\000\000\000\000\000\192\000\000\000\000\000\000\070" .. ", but got " .. self.link_clsid)
  end
  self._raw_flags = self._io:read_bytes(4)
  local _io = KaitaiStream(stringstream(self._raw_flags))
  self.flags = WindowsLnkFile.LinkFlags(_io, self, self._root)
  self.file_attrs = self._io:read_u4le()
  self.time_creation = self._io:read_u8le()
  self.time_access = self._io:read_u8le()
  self.time_write = self._io:read_u8le()
  self.target_file_size = self._io:read_u4le()
  self.icon_index = self._io:read_s4le()
  self.show_command = WindowsLnkFile.WindowState(self._io:read_u4le())
  self.hotkey = self._io:read_u2le()
  self.reserved = self._io:read_bytes(10)
  if not(self.reserved == "\000\000\000\000\000\000\000\000\000\000") then
    error("not equal, expected " .. "\000\000\000\000\000\000\000\000\000\000" .. ", but got " .. self.reserved)
  end
end

-- 
-- Technically, a size of the header, but in reality, it's
-- fixed by standard.
-- 
-- 16-byte class identified (CLSID), reserved for Windows shell
-- link files.
-- 
-- Lower 32 bits of the size of the file that this link targets.
-- 
-- Index of an icon to use from target file.
-- 
-- Window state to set after the launch of target executable.

-- 
-- See also: Section 2.1.1 (https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf)
WindowsLnkFile.LinkFlags = class.class(KaitaiStruct)

function WindowsLnkFile.LinkFlags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsLnkFile.LinkFlags:_read()
  self.is_unicode = self._io:read_bits_int_be(1) ~= 0
  self.has_icon_location = self._io:read_bits_int_be(1) ~= 0
  self.has_arguments = self._io:read_bits_int_be(1) ~= 0
  self.has_work_dir = self._io:read_bits_int_be(1) ~= 0
  self.has_rel_path = self._io:read_bits_int_be(1) ~= 0
  self.has_name = self._io:read_bits_int_be(1) ~= 0
  self.has_link_info = self._io:read_bits_int_be(1) ~= 0
  self.has_link_target_id_list = self._io:read_bits_int_be(1) ~= 0
  self._unnamed8 = self._io:read_bits_int_be(16)
  self.reserved = self._io:read_bits_int_be(5)
  self.keep_local_id_list_for_unc_target = self._io:read_bits_int_be(1) ~= 0
  self._unnamed11 = self._io:read_bits_int_be(2)
end


-- 
-- See also: Section 2.3 (https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf)
WindowsLnkFile.LinkInfo = class.class(KaitaiStruct)

function WindowsLnkFile.LinkInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsLnkFile.LinkInfo:_read()
  self.len_all = self._io:read_u4le()
  self._raw_all = self._io:read_bytes(self.len_all - 4)
  local _io = KaitaiStream(stringstream(self._raw_all))
  self.all = WindowsLnkFile.LinkInfo.All(_io, self, self._root)
end


-- 
-- See also: Section 2.3 (https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf)
WindowsLnkFile.LinkInfo.All = class.class(KaitaiStruct)

function WindowsLnkFile.LinkInfo.All:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsLnkFile.LinkInfo.All:_read()
  self.len_header = self._io:read_u4le()
  self._raw_header = self._io:read_bytes(self.len_header - 8)
  local _io = KaitaiStream(stringstream(self._raw_header))
  self.header = WindowsLnkFile.LinkInfo.Header(_io, self, self._root)
end

WindowsLnkFile.LinkInfo.All.property.local_base_path = {}
function WindowsLnkFile.LinkInfo.All.property.local_base_path:get()
  if self._m_local_base_path ~= nil then
    return self._m_local_base_path
  end

  if self.header.flags.has_volume_id_and_local_base_path then
    local _pos = self._io:pos()
    self._io:seek(self.header.ofs_local_base_path - 4)
    self._m_local_base_path = self._io:read_bytes_term(0, false, true, true)
    self._io:seek(_pos)
  end
  return self._m_local_base_path
end

WindowsLnkFile.LinkInfo.All.property.volume_id = {}
function WindowsLnkFile.LinkInfo.All.property.volume_id:get()
  if self._m_volume_id ~= nil then
    return self._m_volume_id
  end

  if self.header.flags.has_volume_id_and_local_base_path then
    local _pos = self._io:pos()
    self._io:seek(self.header.ofs_volume_id - 4)
    self._m_volume_id = WindowsLnkFile.LinkInfo.VolumeIdSpec(self._io, self, self._root)
    self._io:seek(_pos)
  end
  return self._m_volume_id
end


-- 
-- See also: Section 2.3 (https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf)
WindowsLnkFile.LinkInfo.Header = class.class(KaitaiStruct)

function WindowsLnkFile.LinkInfo.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsLnkFile.LinkInfo.Header:_read()
  self.flags = WindowsLnkFile.LinkInfo.LinkInfoFlags(self._io, self, self._root)
  self.ofs_volume_id = self._io:read_u4le()
  self.ofs_local_base_path = self._io:read_u4le()
  self.ofs_common_net_rel_link = self._io:read_u4le()
  self.ofs_common_path_suffix = self._io:read_u4le()
  if not(self._io:is_eof()) then
    self.ofs_local_base_path_unicode = self._io:read_u4le()
  end
  if not(self._io:is_eof()) then
    self.ofs_common_path_suffix_unicode = self._io:read_u4le()
  end
end


-- 
-- See also: Section 2.3 (https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf)
WindowsLnkFile.LinkInfo.LinkInfoFlags = class.class(KaitaiStruct)

function WindowsLnkFile.LinkInfo.LinkInfoFlags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsLnkFile.LinkInfo.LinkInfoFlags:_read()
  self.reserved1 = self._io:read_bits_int_be(6)
  self.has_common_net_rel_link = self._io:read_bits_int_be(1) ~= 0
  self.has_volume_id_and_local_base_path = self._io:read_bits_int_be(1) ~= 0
  self.reserved2 = self._io:read_bits_int_be(24)
end


-- 
-- See also: Section 2.3.1 (https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf)
WindowsLnkFile.LinkInfo.VolumeIdBody = class.class(KaitaiStruct)

function WindowsLnkFile.LinkInfo.VolumeIdBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsLnkFile.LinkInfo.VolumeIdBody:_read()
  self.drive_type = WindowsLnkFile.DriveTypes(self._io:read_u4le())
  self.drive_serial_number = self._io:read_u4le()
  self.ofs_volume_label = self._io:read_u4le()
  if self.is_unicode then
    self.ofs_volume_label_unicode = self._io:read_u4le()
  end
end

WindowsLnkFile.LinkInfo.VolumeIdBody.property.is_unicode = {}
function WindowsLnkFile.LinkInfo.VolumeIdBody.property.is_unicode:get()
  if self._m_is_unicode ~= nil then
    return self._m_is_unicode
  end

  self._m_is_unicode = self.ofs_volume_label == 20
  return self._m_is_unicode
end

WindowsLnkFile.LinkInfo.VolumeIdBody.property.volume_label_ansi = {}
function WindowsLnkFile.LinkInfo.VolumeIdBody.property.volume_label_ansi:get()
  if self._m_volume_label_ansi ~= nil then
    return self._m_volume_label_ansi
  end

  if not(self.is_unicode) then
    local _pos = self._io:pos()
    self._io:seek(self.ofs_volume_label - 4)
    self._m_volume_label_ansi = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "IBM437")
    self._io:seek(_pos)
  end
  return self._m_volume_label_ansi
end


-- 
-- See also: Section 2.3.1 (https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf)
WindowsLnkFile.LinkInfo.VolumeIdSpec = class.class(KaitaiStruct)

function WindowsLnkFile.LinkInfo.VolumeIdSpec:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsLnkFile.LinkInfo.VolumeIdSpec:_read()
  self.len_all = self._io:read_u4le()
  self._raw_body = self._io:read_bytes(self.len_all - 4)
  local _io = KaitaiStream(stringstream(self._raw_body))
  self.body = WindowsLnkFile.LinkInfo.VolumeIdBody(_io, self, self._root)
end


-- 
-- See also: Section 2.2 (https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf)
WindowsLnkFile.LinkTargetIdList = class.class(KaitaiStruct)

function WindowsLnkFile.LinkTargetIdList:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsLnkFile.LinkTargetIdList:_read()
  self.len_id_list = self._io:read_u2le()
  self._raw_id_list = self._io:read_bytes(self.len_id_list)
  local _io = KaitaiStream(stringstream(self._raw_id_list))
  self.id_list = WindowsShellItems(_io)
end


WindowsLnkFile.StringData = class.class(KaitaiStruct)

function WindowsLnkFile.StringData:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsLnkFile.StringData:_read()
  self.chars_str = self._io:read_u2le()
  self.str = str_decode.decode(self._io:read_bytes(self.chars_str * 2), "UTF-16LE")
end


