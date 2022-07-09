-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")

-- 
-- Windows Shell Items (AKA "shellbags") is an undocumented set of
-- structures used internally within Windows to identify paths in
-- Windows Folder Hierarchy. It is widely used in Windows Shell (and
-- most visible in File Explorer), both as in-memory and in-file
-- structures. Some formats embed them, namely:
-- 
-- * Windows Shell link files (.lnk) Windows registry
-- * Windows registry "ShellBags" keys
-- 
-- The format is mostly undocumented, and is known to vary between
-- various Windows versions.
-- See also: Source (https://github.com/libyal/libfwsi/blob/master/documentation/Windows%20Shell%20Item%20format.asciidoc)
WindowsShellItems = class.class(KaitaiStruct)

function WindowsShellItems:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function WindowsShellItems:_read()
  self.items = {}
  local i = 0
  while true do
    local _ = WindowsShellItems.ShellItem(self._io, self, self._root)
    self.items[i + 1] = _
    if _.len_data == 0 then
      break
    end
    i = i + 1
  end
end

-- 
-- See also: Section 2.2.1 (https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf)

WindowsShellItems.ShellItemData = class.class(KaitaiStruct)

function WindowsShellItems.ShellItemData:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function WindowsShellItems.ShellItemData:_read()
  self.code = self._io:read_u1()
  local _on = self.code
  if _on == 31 then
    self.body1 = WindowsShellItems.RootFolderBody(self._io, self, self._root)
  end
  local _on = (self.code & 112)
  if _on == 32 then
    self.body2 = WindowsShellItems.VolumeBody(self._io, self, self._root)
  elseif _on == 48 then
    self.body2 = WindowsShellItems.FileEntryBody(self._io, self, self._root)
  end
end


-- 
-- See also: Section 2.2.2 (https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf)
WindowsShellItems.ShellItem = class.class(KaitaiStruct)

function WindowsShellItems.ShellItem:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function WindowsShellItems.ShellItem:_read()
  self.len_data = self._io:read_u2le()
  if self.len_data >= 2 then
    self._raw_data = self._io:read_bytes((self.len_data - 2))
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = WindowsShellItems.ShellItemData(_io, self, self._root)
  end
end


-- 
-- See also: Source (https://github.com/libyal/libfwsi/blob/master/documentation/Windows%20Shell%20Item%20format.asciidoc#32-root-folder-shell-item)
WindowsShellItems.RootFolderBody = class.class(KaitaiStruct)

function WindowsShellItems.RootFolderBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function WindowsShellItems.RootFolderBody:_read()
  self.sort_index = self._io:read_u1()
  self.shell_folder_id = self._io:read_bytes(16)
end


-- 
-- See also: Source (https://github.com/libyal/libfwsi/blob/master/documentation/Windows%20Shell%20Item%20format.asciidoc#33-volume-shell-item)
WindowsShellItems.VolumeBody = class.class(KaitaiStruct)

function WindowsShellItems.VolumeBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function WindowsShellItems.VolumeBody:_read()
  self.flags = self._io:read_u1()
end


-- 
-- See also: Source (https://github.com/libyal/libfwsi/blob/master/documentation/Windows%20Shell%20Item%20format.asciidoc#34-file-entry-shell-item)
WindowsShellItems.FileEntryBody = class.class(KaitaiStruct)

function WindowsShellItems.FileEntryBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function WindowsShellItems.FileEntryBody:_read()
  self._unnamed0 = self._io:read_u1()
  self.file_size = self._io:read_u4le()
  self.last_mod_time = self._io:read_u4le()
  self.file_attrs = self._io:read_u2le()
end

WindowsShellItems.FileEntryBody.property.is_dir = {}
function WindowsShellItems.FileEntryBody.property.is_dir:get()
  if self._m_is_dir ~= nil then
    return self._m_is_dir
  end

  self._m_is_dir = (self._parent.code & 1) ~= 0
  return self._m_is_dir
end

WindowsShellItems.FileEntryBody.property.is_file = {}
function WindowsShellItems.FileEntryBody.property.is_file:get()
  if self._m_is_file ~= nil then
    return self._m_is_file
  end

  self._m_is_file = (self._parent.code & 2) ~= 0
  return self._m_is_file
end


