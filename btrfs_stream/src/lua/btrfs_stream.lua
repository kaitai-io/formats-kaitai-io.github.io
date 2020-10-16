-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- Btrfs is a copy on write file system based on B-trees focusing on fault tolerance, repair and easy
-- administration. Btrfs is intended to address the lack of pooling, snapshots, checksums, and
-- integral multi-device spanning in Linux file systems.
-- Given any pair of subvolumes (or snapshots), Btrfs can generate a binary diff between them by
-- using the `btrfs send` command that can be replayed later by using `btrfs receive`, possibly on a
-- different Btrfs file system. The `btrfs send` command creates a set of data modifications required
-- for converting one subvolume into another.
-- This spec can be used to disassemble the binary diff created by the `btrfs send` command.
-- If you want a text representation you may want to checkout `btrfs receive --dump` instead.
-- See also: Source (https://btrfs.wiki.kernel.org/index.php/Design_notes_on_Send/Receive)
BtrfsStream = class.class(KaitaiStruct)

BtrfsStream.Command = enum.Enum {
  unspec = 0,
  subvol = 1,
  snapshot = 2,
  mkfile = 3,
  mkdir = 4,
  mknod = 5,
  mkfifo = 6,
  mksock = 7,
  symlink = 8,
  rename = 9,
  link = 10,
  unlink = 11,
  rmdir = 12,
  set_xattr = 13,
  remove_xattr = 14,
  write = 15,
  clone = 16,
  truncate = 17,
  chmod = 18,
  chown = 19,
  utimes = 20,
  end = 21,
  update_extent = 22,
}

BtrfsStream.Attribute = enum.Enum {
  unspec = 0,
  uuid = 1,
  ctransid = 2,
  ino = 3,
  size = 4,
  mode = 5,
  uid = 6,
  gid = 7,
  rdev = 8,
  ctime = 9,
  mtime = 10,
  atime = 11,
  otime = 12,
  xattr_name = 13,
  xattr_data = 14,
  path = 15,
  path_to = 16,
  path_link = 17,
  file_offset = 18,
  data = 19,
  clone_uuid = 20,
  clone_ctransid = 21,
  clone_path = 22,
  clone_offset = 23,
  clone_len = 24,
}

function BtrfsStream:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BtrfsStream:_read()
  self.header = BtrfsStream.SendStreamHeader(self._io, self, self._root)
  self.commands = {}
  local i = 0
  while not self._io:is_eof() do
    self.commands[i + 1] = BtrfsStream.SendCommand(self._io, self, self._root)
    i = i + 1
  end
end


BtrfsStream.SendStreamHeader = class.class(KaitaiStruct)

function BtrfsStream.SendStreamHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BtrfsStream.SendStreamHeader:_read()
  self.magic = self._io:read_bytes(13)
  if not(self.magic == "\098\116\114\102\115\045\115\116\114\101\097\109\000") then
    error("not equal, expected " ..  "\098\116\114\102\115\045\115\116\114\101\097\109\000" .. ", but got " .. self.magic)
  end
  self.version = self._io:read_u4le()
end


BtrfsStream.SendCommand = class.class(KaitaiStruct)

function BtrfsStream.SendCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BtrfsStream.SendCommand:_read()
  self.len_data = self._io:read_u4le()
  self.type = BtrfsStream.Command(self._io:read_u2le())
  self.checksum = self._io:read_bytes(4)
  self._raw_data = self._io:read_bytes(self.len_data)
  local _io = KaitaiStream(stringstream(self._raw_data))
  self.data = BtrfsStream.SendCommand.Tlvs(_io, self, self._root)
end

-- 
-- CRC32 checksum of a whole send command, including the header, with this attribute set to 0.

BtrfsStream.SendCommand.Tlv = class.class(KaitaiStruct)

function BtrfsStream.SendCommand.Tlv:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BtrfsStream.SendCommand.Tlv:_read()
  self.type = BtrfsStream.Attribute(self._io:read_u2le())
  self.length = self._io:read_u2le()
  local _on = self.type
  if _on == BtrfsStream.Attribute.ctransid then
    self.value = self._io:read_u8le()
  elseif _on == BtrfsStream.Attribute.size then
    self.value = self._io:read_u8le()
  elseif _on == BtrfsStream.Attribute.clone_uuid then
    self._raw_value = self._io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw_value))
    self.value = BtrfsStream.SendCommand.Uuid(_io, self, self._root)
  elseif _on == BtrfsStream.Attribute.file_offset then
    self.value = self._io:read_u8le()
  elseif _on == BtrfsStream.Attribute.otime then
    self._raw_value = self._io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw_value))
    self.value = BtrfsStream.SendCommand.Timespec(_io, self, self._root)
  elseif _on == BtrfsStream.Attribute.uid then
    self.value = self._io:read_u8le()
  elseif _on == BtrfsStream.Attribute.atime then
    self._raw_value = self._io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw_value))
    self.value = BtrfsStream.SendCommand.Timespec(_io, self, self._root)
  elseif _on == BtrfsStream.Attribute.ctime then
    self._raw_value = self._io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw_value))
    self.value = BtrfsStream.SendCommand.Timespec(_io, self, self._root)
  elseif _on == BtrfsStream.Attribute.uuid then
    self._raw_value = self._io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw_value))
    self.value = BtrfsStream.SendCommand.Uuid(_io, self, self._root)
  elseif _on == BtrfsStream.Attribute.clone_len then
    self.value = self._io:read_u8le()
  elseif _on == BtrfsStream.Attribute.xattr_name then
    self._raw_value = self._io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw_value))
    self.value = BtrfsStream.SendCommand.String(_io, self, self._root)
  elseif _on == BtrfsStream.Attribute.clone_ctransid then
    self.value = self._io:read_u8le()
  elseif _on == BtrfsStream.Attribute.mode then
    self.value = self._io:read_u8le()
  elseif _on == BtrfsStream.Attribute.mtime then
    self._raw_value = self._io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw_value))
    self.value = BtrfsStream.SendCommand.Timespec(_io, self, self._root)
  elseif _on == BtrfsStream.Attribute.path_link then
    self._raw_value = self._io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw_value))
    self.value = BtrfsStream.SendCommand.String(_io, self, self._root)
  elseif _on == BtrfsStream.Attribute.rdev then
    self.value = self._io:read_u8le()
  elseif _on == BtrfsStream.Attribute.path_to then
    self._raw_value = self._io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw_value))
    self.value = BtrfsStream.SendCommand.String(_io, self, self._root)
  elseif _on == BtrfsStream.Attribute.path then
    self._raw_value = self._io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw_value))
    self.value = BtrfsStream.SendCommand.String(_io, self, self._root)
  elseif _on == BtrfsStream.Attribute.clone_offset then
    self.value = self._io:read_u8le()
  elseif _on == BtrfsStream.Attribute.gid then
    self.value = self._io:read_u8le()
  elseif _on == BtrfsStream.Attribute.clone_path then
    self._raw_value = self._io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw_value))
    self.value = BtrfsStream.SendCommand.String(_io, self, self._root)
  else
    self.value = self._io:read_bytes(self.length)
  end
end


BtrfsStream.SendCommand.Uuid = class.class(KaitaiStruct)

function BtrfsStream.SendCommand.Uuid:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BtrfsStream.SendCommand.Uuid:_read()
  self.uuid = self._io:read_bytes(16)
end


BtrfsStream.SendCommand.Tlvs = class.class(KaitaiStruct)

function BtrfsStream.SendCommand.Tlvs:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BtrfsStream.SendCommand.Tlvs:_read()
  self.tlv = {}
  local i = 0
  while not self._io:is_eof() do
    self.tlv[i + 1] = BtrfsStream.SendCommand.Tlv(self._io, self, self._root)
    i = i + 1
  end
end


BtrfsStream.SendCommand.String = class.class(KaitaiStruct)

function BtrfsStream.SendCommand.String:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BtrfsStream.SendCommand.String:_read()
  self.string = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end


BtrfsStream.SendCommand.Timespec = class.class(KaitaiStruct)

function BtrfsStream.SendCommand.Timespec:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BtrfsStream.SendCommand.Timespec:_read()
  self.ts_sec = self._io:read_s8le()
  self.ts_nsec = self._io:read_s4le()
end


