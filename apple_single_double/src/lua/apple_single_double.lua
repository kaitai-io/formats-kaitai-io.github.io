-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")

-- 
-- AppleSingle and AppleDouble files are used by certain Mac
-- applications (e.g. Finder) to store Mac-specific file attributes on
-- filesystems that do not support that.
-- 
-- Syntactically, both formats are the same, the only difference is how
-- they are being used:
-- 
-- * AppleSingle means that only one file will be created on external
--   filesystem that will hold both the data (AKA "data fork" in Apple
--   terminology), and the attributes (AKA "resource fork").
-- * AppleDouble means that two files will be created: a normal file
--   that keeps the data ("data fork") is kept separately from an
--   auxiliary file that contains attributes ("resource fork"), which
--   is kept with the same name, but starting with an extra dot and
--   underscore `._` to keep it hidden.
-- 
-- In modern practice (Mac OS X), Finder only uses AppleDouble to keep
-- compatibility with other OSes, as virtually nobody outside of Mac
-- understands how to access data in AppleSingle container.
-- See also: Source (http://kaiser-edv.de/documents/AppleSingle_AppleDouble.pdf)
AppleSingleDouble = class.class(KaitaiStruct)

AppleSingleDouble.FileType = enum.Enum {
  apple_single = 333312,
  apple_double = 333319,
}

function AppleSingleDouble:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AppleSingleDouble:_read()
  self.magic = AppleSingleDouble.FileType(self._io:read_u4be())
  self.version = self._io:read_u4be()
  self.reserved = self._io:read_bytes(16)
  self.num_entries = self._io:read_u2be()
  self.entries = {}
  for i = 0, self.num_entries - 1 do
    self.entries[i + 1] = AppleSingleDouble.Entry(self._io, self, self._root)
  end
end

-- 
-- Must be all 0.

AppleSingleDouble.Entry = class.class(KaitaiStruct)

AppleSingleDouble.Entry.Types = enum.Enum {
  data_fork = 1,
  resource_fork = 2,
  real_name = 3,
  comment = 4,
  icon_bw = 5,
  icon_color = 6,
  file_dates_info = 8,
  finder_info = 9,
  macintosh_file_info = 10,
  prodos_file_info = 11,
  msdos_file_info = 12,
  afp_short_name = 13,
  afp_file_info = 14,
  afp_directory_id = 15,
}

function AppleSingleDouble.Entry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AppleSingleDouble.Entry:_read()
  self.type = AppleSingleDouble.Entry.Types(self._io:read_u4be())
  self.ofs_body = self._io:read_u4be()
  self.len_body = self._io:read_u4be()
end

AppleSingleDouble.Entry.property.body = {}
function AppleSingleDouble.Entry.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_body)
  local _on = self.type
  if _on == AppleSingleDouble.Entry.Types.finder_info then
    self._raw__m_body = self._io:read_bytes(self.len_body)
    local _io = KaitaiStream(stringstream(self._raw__m_body))
    self._m_body = AppleSingleDouble.FinderInfo(_io, self, self._root)
  else
    self._m_body = self._io:read_bytes(self.len_body)
  end
  self._io:seek(_pos)
  return self._m_body
end


-- 
-- Information specific to Finder.
-- See also: older Inside Macintosh, Volume II page 84 or Volume IV page 104.
AppleSingleDouble.FinderInfo = class.class(KaitaiStruct)

function AppleSingleDouble.FinderInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AppleSingleDouble.FinderInfo:_read()
  self.file_type = self._io:read_bytes(4)
  self.file_creator = self._io:read_bytes(4)
  self.flags = self._io:read_u2be()
  self.location = AppleSingleDouble.Point(self._io, self, self._root)
  self.folder_id = self._io:read_u2be()
end

-- 
-- File icon's coordinates when displaying this folder.
-- 
-- File folder ID (=window).

-- 
-- Specifies 2D coordinate in QuickDraw grid.
AppleSingleDouble.Point = class.class(KaitaiStruct)

function AppleSingleDouble.Point:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AppleSingleDouble.Point:_read()
  self.x = self._io:read_u2be()
  self.y = self._io:read_u2be()
end


