-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local utils = require("utils")
local stringstream = require("string_stream")

-- 
-- .trd file is a raw dump of TR-DOS (ZX-Spectrum) floppy. .trd files are
-- headerless and contain consequent "logical tracks", each logical track
-- consists of 16 256-byte sectors.
-- 
-- Logical tracks are defined the same way as used by TR-DOS: for single-side
-- floppies it's just a physical track number, for two-side floppies sides are
-- interleaved, i.e. logical_track_num = (physical_track_num << 1) | side
-- 
-- So, this format definition is more for TR-DOS filesystem than for .trd files,
-- which are formatless.
-- 
-- Strings (file names, disk label, disk password) are padded with spaces and use
-- ZX Spectrum character set, including UDGs, block drawing chars and Basic
-- tokens. ASCII range is mostly standard ASCII, with few characters (^, `, DEL)
-- replaced with (up arrow, pound, copyright symbol).
-- 
-- .trd file can be smaller than actual floppy disk, if last logical tracks are
-- empty (contain no file data) they can be omitted.
TrDosImage = class.class(KaitaiStruct)

TrDosImage.DiskType = enum.Enum {
  type_80_tracks_double_side = 22,
  type_40_tracks_double_side = 23,
  type_80_tracks_single_side = 24,
  type_40_tracks_single_side = 25,
}

function TrDosImage:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TrDosImage:_read()
  self.files = {}
  local i = 0
  while true do
    local _ = TrDosImage.File(self._io, self, self._root)
    self.files[i + 1] = _
    if _.is_terminator then
      break
    end
    i = i + 1
  end
end

TrDosImage.property.volume_info = {}
function TrDosImage.property.volume_info:get()
  if self._m_volume_info ~= nil then
    return self._m_volume_info
  end

  local _pos = self._io:pos()
  self._io:seek(2048)
  self._m_volume_info = TrDosImage.VolumeInfo(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_volume_info
end


TrDosImage.VolumeInfo = class.class(KaitaiStruct)

function TrDosImage.VolumeInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TrDosImage.VolumeInfo:_read()
  self.catalog_end = self._io:read_bytes(1)
  if not(self.catalog_end == "\000") then
    error("not equal, expected " ..  "\000" .. ", but got " .. self.catalog_end)
  end
  self.unused = self._io:read_bytes(224)
  self.first_free_sector_sector = self._io:read_u1()
  self.first_free_sector_track = self._io:read_u1()
  self.disk_type = TrDosImage.DiskType(self._io:read_u1())
  self.num_files = self._io:read_u1()
  self.num_free_sectors = self._io:read_u2le()
  self.tr_dos_id = self._io:read_bytes(1)
  if not(self.tr_dos_id == "\016") then
    error("not equal, expected " ..  "\016" .. ", but got " .. self.tr_dos_id)
  end
  self.unused_2 = self._io:read_bytes(2)
  self.password = self._io:read_bytes(9)
  self.unused_3 = self._io:read_bytes(1)
  self.num_deleted_files = self._io:read_u1()
  self.label = self._io:read_bytes(8)
  self.unused_4 = self._io:read_bytes(3)
end

TrDosImage.VolumeInfo.property.num_tracks = {}
function TrDosImage.VolumeInfo.property.num_tracks:get()
  if self._m_num_tracks ~= nil then
    return self._m_num_tracks
  end

  self._m_num_tracks = utils.box_unwrap(((self.disk_type.value & 1) ~= 0) and utils.box_wrap(40) or (80))
  return self._m_num_tracks
end

TrDosImage.VolumeInfo.property.num_sides = {}
function TrDosImage.VolumeInfo.property.num_sides:get()
  if self._m_num_sides ~= nil then
    return self._m_num_sides
  end

  self._m_num_sides = utils.box_unwrap(((self.disk_type.value & 8) ~= 0) and utils.box_wrap(1) or (2))
  return self._m_num_sides
end

-- 
-- track number is logical, for double-sided disks it's
-- (physical_track << 1) | side, the same way that tracks are stored
-- sequentially in .trd file
-- 
-- Number of non-deleted files. Directory can have more than
-- number_of_files entries due to deleted files

TrDosImage.PositionAndLengthCode = class.class(KaitaiStruct)

function TrDosImage.PositionAndLengthCode:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TrDosImage.PositionAndLengthCode:_read()
  self.start_address = self._io:read_u2le()
  self.length = self._io:read_u2le()
end

-- 
-- Default memory address to load this byte array into.

TrDosImage.Filename = class.class(KaitaiStruct)

function TrDosImage.Filename:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TrDosImage.Filename:_read()
  self.name = self._io:read_bytes(8)
end

TrDosImage.Filename.property.first_byte = {}
function TrDosImage.Filename.property.first_byte:get()
  if self._m_first_byte ~= nil then
    return self._m_first_byte
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_first_byte = self._io:read_u1()
  self._io:seek(_pos)
  return self._m_first_byte
end


TrDosImage.PositionAndLengthPrint = class.class(KaitaiStruct)

function TrDosImage.PositionAndLengthPrint:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TrDosImage.PositionAndLengthPrint:_read()
  self.extent_no = self._io:read_u1()
  self.reserved = self._io:read_u1()
  self.length = self._io:read_u2le()
end


TrDosImage.PositionAndLengthGeneric = class.class(KaitaiStruct)

function TrDosImage.PositionAndLengthGeneric:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TrDosImage.PositionAndLengthGeneric:_read()
  self.reserved = self._io:read_u2le()
  self.length = self._io:read_u2le()
end


TrDosImage.PositionAndLengthBasic = class.class(KaitaiStruct)

function TrDosImage.PositionAndLengthBasic:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TrDosImage.PositionAndLengthBasic:_read()
  self.program_and_data_length = self._io:read_u2le()
  self.program_length = self._io:read_u2le()
end


TrDosImage.File = class.class(KaitaiStruct)

function TrDosImage.File:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TrDosImage.File:_read()
  self._raw_name = self._io:read_bytes(8)
  local _io = KaitaiStream(stringstream(self._raw_name))
  self.name = TrDosImage.Filename(_io, self, self._root)
  self.extension = self._io:read_u1()
  local _on = self.extension
  if _on == 66 then
    self.position_and_length = TrDosImage.PositionAndLengthBasic(self._io, self, self._root)
  elseif _on == 67 then
    self.position_and_length = TrDosImage.PositionAndLengthCode(self._io, self, self._root)
  elseif _on == 35 then
    self.position_and_length = TrDosImage.PositionAndLengthPrint(self._io, self, self._root)
  else
    self.position_and_length = TrDosImage.PositionAndLengthGeneric(self._io, self, self._root)
  end
  self.length_sectors = self._io:read_u1()
  self.starting_sector = self._io:read_u1()
  self.starting_track = self._io:read_u1()
end

TrDosImage.File.property.is_deleted = {}
function TrDosImage.File.property.is_deleted:get()
  if self._m_is_deleted ~= nil then
    return self._m_is_deleted
  end

  self._m_is_deleted = self.name.first_byte == 1
  return self._m_is_deleted
end

TrDosImage.File.property.is_terminator = {}
function TrDosImage.File.property.is_terminator:get()
  if self._m_is_terminator ~= nil then
    return self._m_is_terminator
  end

  self._m_is_terminator = self.name.first_byte == 0
  return self._m_is_terminator
end

TrDosImage.File.property.contents = {}
function TrDosImage.File.property.contents:get()
  if self._m_contents ~= nil then
    return self._m_contents
  end

  local _pos = self._io:pos()
  self._io:seek((((self.starting_track * 256) * 16) + (self.starting_sector * 256)))
  self._m_contents = self._io:read_bytes((self.length_sectors * 256))
  self._io:seek(_pos)
  return self._m_contents
end


