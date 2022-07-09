-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")

-- 
-- Windows resource file (.res) are binary bundles of
-- "resources". Resource has some sort of ID (numerical or string),
-- type (predefined or user-defined), and raw value. Resource files can
-- be seen standalone (as .res file), or embedded inside PE executable
-- (.exe, .dll) files.
-- 
-- Typical use cases include:
-- 
-- * providing information about the application (such as title, copyrights, etc)
-- * embedding icon(s) to be displayed in file managers into .exe
-- * adding non-code data into the binary, such as menus, dialog forms,
--   cursor images, fonts, various misc bitmaps, and locale-aware
--   strings
-- 
-- Windows provides special API to access "resources" from a binary.
-- 
-- Normally, resources files are created with `rc` compiler: it takes a
-- .rc file (so called "resource-definition script") + all the raw
-- resource binary files for input, and outputs .res file. That .res
-- file can be linked into an .exe / .dll afterwards using a linker.
-- 
-- Internally, resource file is just a sequence of individual resource
-- definitions. RC tool ensures that first resource (#0) is always
-- empty.
WindowsResourceFile = class.class(KaitaiStruct)

function WindowsResourceFile:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function WindowsResourceFile:_read()
  self.resources = {}
  local i = 0
  while not self._io:is_eof() do
    self.resources[i + 1] = WindowsResourceFile.Resource(self._io, self, self._root)
    i = i + 1
  end
end


-- 
-- Each resource has a `type` and a `name`, which can be used to
-- identify it, and a `value`. Both `type` and `name` can be a
-- number or a string.
-- See also: Source (https://docs.microsoft.com/en-us/windows/win32/menurc/resourceheader)
WindowsResourceFile.Resource = class.class(KaitaiStruct)

WindowsResourceFile.Resource.PredefTypes = enum.Enum {
  cursor = 1,
  bitmap = 2,
  icon = 3,
  menu = 4,
  dialog = 5,
  string = 6,
  fontdir = 7,
  font = 8,
  accelerator = 9,
  rcdata = 10,
  messagetable = 11,
  group_cursor = 12,
  group_icon = 14,
  version = 16,
  dlginclude = 17,
  plugplay = 19,
  vxd = 20,
  anicursor = 21,
  aniicon = 22,
  html = 23,
  manifest = 24,
}

function WindowsResourceFile.Resource:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function WindowsResourceFile.Resource:_read()
  self.value_size = self._io:read_u4le()
  self.header_size = self._io:read_u4le()
  self.type = WindowsResourceFile.UnicodeOrId(self._io, self, self._root)
  self.name = WindowsResourceFile.UnicodeOrId(self._io, self, self._root)
  self.padding1 = self._io:read_bytes(((4 - self._io:pos()) % 4))
  self.format_version = self._io:read_u4le()
  self.flags = self._io:read_u2le()
  self.language = self._io:read_u2le()
  self.value_version = self._io:read_u4le()
  self.characteristics = self._io:read_u4le()
  self.value = self._io:read_bytes(self.value_size)
  self.padding2 = self._io:read_bytes(((4 - self._io:pos()) % 4))
end

-- 
-- Numeric type IDs in range of [0..0xff] are reserved for
-- system usage in Windows, and there are some predefined,
-- well-known values in that range. This instance allows to get
-- it as enum value, if applicable.
WindowsResourceFile.Resource.property.type_as_predef = {}
function WindowsResourceFile.Resource.property.type_as_predef:get()
  if self._m_type_as_predef ~= nil then
    return self._m_type_as_predef
  end

  if  ((not(self.type.is_string)) and (self.type.as_numeric <= 255))  then
    self._m_type_as_predef = WindowsResourceFile.Resource.PredefTypes(self.type.as_numeric)
  end
  return self._m_type_as_predef
end

-- 
-- Size of resource value that follows the header.
-- 
-- Size of this header (i.e. every field except `value` and an
-- optional padding after it)
-- 
-- Version for value, as specified by a user.
-- 
-- Extra 4 bytes that can be used by user for any purpose.

-- 
-- Resources use a special serialization of names and types: they
-- can be either a number or a string.
-- 
-- Use `is_string` to check which kind we've got here, and then use
-- `as_numeric` or `as_string` to get relevant value.
WindowsResourceFile.UnicodeOrId = class.class(KaitaiStruct)

function WindowsResourceFile.UnicodeOrId:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function WindowsResourceFile.UnicodeOrId:_read()
  if self.save_pos1 >= 0 then
    self.first = self._io:read_u2le()
  end
  if not(self.is_string) then
    self.as_numeric = self._io:read_u2le()
  end
  if self.is_string then
    self.rest = {}
    local i = 0
    while true do
      local _ = self._io:read_u2le()
      self.rest[i + 1] = _
      if _ == 0 then
        break
      end
      i = i + 1
    end
  end
  if  ((self.is_string) and (self.save_pos2 >= 0))  then
    self.noop = self._io:read_bytes(0)
  end
end

WindowsResourceFile.UnicodeOrId.property.save_pos1 = {}
function WindowsResourceFile.UnicodeOrId.property.save_pos1:get()
  if self._m_save_pos1 ~= nil then
    return self._m_save_pos1
  end

  self._m_save_pos1 = self._io:pos()
  return self._m_save_pos1
end

WindowsResourceFile.UnicodeOrId.property.save_pos2 = {}
function WindowsResourceFile.UnicodeOrId.property.save_pos2:get()
  if self._m_save_pos2 ~= nil then
    return self._m_save_pos2
  end

  self._m_save_pos2 = self._io:pos()
  return self._m_save_pos2
end

WindowsResourceFile.UnicodeOrId.property.is_string = {}
function WindowsResourceFile.UnicodeOrId.property.is_string:get()
  if self._m_is_string ~= nil then
    return self._m_is_string
  end

  self._m_is_string = self.first ~= 65535
  return self._m_is_string
end

WindowsResourceFile.UnicodeOrId.property.as_string = {}
function WindowsResourceFile.UnicodeOrId.property.as_string:get()
  if self._m_as_string ~= nil then
    return self._m_as_string
  end

  if self.is_string then
    local _pos = self._io:pos()
    self._io:seek(self.save_pos1)
    self._m_as_string = str_decode.decode(self._io:read_bytes(((self.save_pos2 - self.save_pos1) - 2)), "UTF-16LE")
    self._io:seek(_pos)
  end
  return self._m_as_string
end


