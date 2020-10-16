-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local enum = require("enum")
local str_decode = require("string_decode")

MicrosoftCfb = class.class(KaitaiStruct)

function MicrosoftCfb:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MicrosoftCfb:_read()
  self.header = MicrosoftCfb.CfbHeader(self._io, self, self._root)
end

MicrosoftCfb.property.sector_size = {}
function MicrosoftCfb.property.sector_size:get()
  if self._m_sector_size ~= nil then
    return self._m_sector_size
  end

  self._m_sector_size = (1 << self.header.sector_shift)
  return self._m_sector_size
end

MicrosoftCfb.property.fat = {}
function MicrosoftCfb.property.fat:get()
  if self._m_fat ~= nil then
    return self._m_fat
  end

  local _pos = self._io:pos()
  self._io:seek(self.sector_size)
  self._raw__m_fat = self._io:read_bytes((self.header.size_fat * self.sector_size))
  local _io = KaitaiStream(stringstream(self._raw__m_fat))
  self._m_fat = MicrosoftCfb.FatEntries(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_fat
end

MicrosoftCfb.property.dir = {}
function MicrosoftCfb.property.dir:get()
  if self._m_dir ~= nil then
    return self._m_dir
  end

  local _pos = self._io:pos()
  self._io:seek(((self.header.ofs_dir + 1) * self.sector_size))
  self._m_dir = MicrosoftCfb.DirEntry(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_dir
end


MicrosoftCfb.CfbHeader = class.class(KaitaiStruct)

function MicrosoftCfb.CfbHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MicrosoftCfb.CfbHeader:_read()
  self.signature = self._io:read_bytes(8)
  if not(self.signature == "\208\207\017\224\161\177\026\225") then
    error("not equal, expected " ..  "\208\207\017\224\161\177\026\225" .. ", but got " .. self.signature)
  end
  self.clsid = self._io:read_bytes(16)
  if not(self.clsid == "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000") then
    error("not equal, expected " ..  "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000" .. ", but got " .. self.clsid)
  end
  self.version_minor = self._io:read_u2le()
  self.version_major = self._io:read_u2le()
  self.byte_order = self._io:read_bytes(2)
  if not(self.byte_order == "\254\255") then
    error("not equal, expected " ..  "\254\255" .. ", but got " .. self.byte_order)
  end
  self.sector_shift = self._io:read_u2le()
  self.mini_sector_shift = self._io:read_u2le()
  self.reserved1 = self._io:read_bytes(6)
  self.size_dir = self._io:read_s4le()
  self.size_fat = self._io:read_s4le()
  self.ofs_dir = self._io:read_s4le()
  self.transaction_seq = self._io:read_s4le()
  self.mini_stream_cutoff_size = self._io:read_s4le()
  self.ofs_mini_fat = self._io:read_s4le()
  self.size_mini_fat = self._io:read_s4le()
  self.ofs_difat = self._io:read_s4le()
  self.size_difat = self._io:read_s4le()
  self.difat = {}
  for i = 0, 109 - 1 do
    self.difat[i + 1] = self._io:read_s4le()
  end
end

-- 
-- Magic bytes that confirm that this is a CFB file.
-- 
-- Reserved class ID field, must be all 0.
-- 
-- In theory, specifies a byte order. In practice, no other values besides FE FF (which imply little endian order) are used.
-- 
-- For major version 3, must be 0x9 (sector size = 512 bytes). For major version 4, must be 0xc (sector size = 4096 bytes).
-- 
-- Number of directory sectors in this file. For major version 3, must be 0.
-- 
-- Number of FAT sectors in this file.
-- 
-- Starting sector number for directory stream.
-- 
-- A transaction sequence number, which is incremented each time the file is saved if transactions are implemented, 0 otherwise.
-- 
-- Starting sector number for mini FAT.
-- 
-- Number of mini FAT sectors in this file.
-- 
-- Starting sector number for DIFAT.
-- 
-- Number of DIFAT sectors in this file.

MicrosoftCfb.FatEntries = class.class(KaitaiStruct)

function MicrosoftCfb.FatEntries:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MicrosoftCfb.FatEntries:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = self._io:read_s4le()
    i = i + 1
  end
end


MicrosoftCfb.DirEntry = class.class(KaitaiStruct)

MicrosoftCfb.DirEntry.ObjType = enum.Enum {
  unknown = 0,
  storage = 1,
  stream = 2,
  root_storage = 5,
}

MicrosoftCfb.DirEntry.RbColor = enum.Enum {
  red = 0,
  black = 1,
}

function MicrosoftCfb.DirEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MicrosoftCfb.DirEntry:_read()
  self.name = str_decode.decode(self._io:read_bytes(64), "UTF-16LE")
  self.name_len = self._io:read_u2le()
  self.object_type = MicrosoftCfb.DirEntry.ObjType(self._io:read_u1())
  self.color_flag = MicrosoftCfb.DirEntry.RbColor(self._io:read_u1())
  self.left_sibling_id = self._io:read_s4le()
  self.right_sibling_id = self._io:read_s4le()
  self.child_id = self._io:read_s4le()
  self.clsid = self._io:read_bytes(16)
  self.state = self._io:read_u4le()
  self.time_create = self._io:read_u8le()
  self.time_mod = self._io:read_u8le()
  self.ofs = self._io:read_s4le()
  self.size = self._io:read_u8le()
end

MicrosoftCfb.DirEntry.property.mini_stream = {}
function MicrosoftCfb.DirEntry.property.mini_stream:get()
  if self._m_mini_stream ~= nil then
    return self._m_mini_stream
  end

  if self.object_type == MicrosoftCfb.DirEntry.ObjType.root_storage then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek(((self.ofs + 1) * self._root.sector_size))
    self._m_mini_stream = _io:read_bytes(self.size)
    _io:seek(_pos)
  end
  return self._m_mini_stream
end

MicrosoftCfb.DirEntry.property.child = {}
function MicrosoftCfb.DirEntry.property.child:get()
  if self._m_child ~= nil then
    return self._m_child
  end

  if self.child_id ~= -1 then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek((((self._root.header.ofs_dir + 1) * self._root.sector_size) + (self.child_id * 128)))
    self._m_child = MicrosoftCfb.DirEntry(_io, self, self._root)
    _io:seek(_pos)
  end
  return self._m_child
end

MicrosoftCfb.DirEntry.property.left_sibling = {}
function MicrosoftCfb.DirEntry.property.left_sibling:get()
  if self._m_left_sibling ~= nil then
    return self._m_left_sibling
  end

  if self.left_sibling_id ~= -1 then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek((((self._root.header.ofs_dir + 1) * self._root.sector_size) + (self.left_sibling_id * 128)))
    self._m_left_sibling = MicrosoftCfb.DirEntry(_io, self, self._root)
    _io:seek(_pos)
  end
  return self._m_left_sibling
end

MicrosoftCfb.DirEntry.property.right_sibling = {}
function MicrosoftCfb.DirEntry.property.right_sibling:get()
  if self._m_right_sibling ~= nil then
    return self._m_right_sibling
  end

  if self.right_sibling_id ~= -1 then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek((((self._root.header.ofs_dir + 1) * self._root.sector_size) + (self.right_sibling_id * 128)))
    self._m_right_sibling = MicrosoftCfb.DirEntry(_io, self, self._root)
    _io:seek(_pos)
  end
  return self._m_right_sibling
end

-- 
-- User-defined flags for storage or root storage objects.
-- 
-- Creation time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC).
-- 
-- Modification time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC).
-- 
-- For stream object, number of starting sector. For a root storage object, first sector of the mini stream, if the mini stream exists.
-- 
-- For stream object, size of user-defined data in bytes. For a root storage object, size of the mini stream.

