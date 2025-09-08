-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("vlq_base128_be")
local enum = require("enum")
local utils = require("utils")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- SQLite3 is a popular serverless SQL engine, implemented as a library
-- to be used within other applications. It keeps its databases as
-- regular disk files.
-- 
-- Every database file is segmented into pages. First page (starting at
-- the very beginning) is special: it contains a file-global header
-- which specifies some data relevant to proper parsing (i.e. format
-- versions, size of page, etc). After the header, normal contents of
-- the first page follow.
-- 
-- Each page would be of some type, and generally, they would be
-- reached via the links starting from the first page. First page type
-- (`root_page`) is always "btree_page".
-- See also: Source (https://www.sqlite.org/fileformat.html)
Sqlite3 = class.class(KaitaiStruct)

Sqlite3.Encodings = enum.Enum {
  utf_8 = 1,
  utf_16le = 2,
  utf_16be = 3,
}

Sqlite3.Versions = enum.Enum {
  legacy = 1,
  wal = 2,
}

function Sqlite3:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Sqlite3:_read()
  self.magic = self._io:read_bytes(16)
  if not(self.magic == "\083\081\076\105\116\101\032\102\111\114\109\097\116\032\051\000") then
    error("not equal, expected " .. "\083\081\076\105\116\101\032\102\111\114\109\097\116\032\051\000" .. ", but got " .. self.magic)
  end
  self.len_page_mod = self._io:read_u2be()
  self.write_version = Sqlite3.Versions(self._io:read_u1())
  self.read_version = Sqlite3.Versions(self._io:read_u1())
  self.reserved_space = self._io:read_u1()
  self.max_payload_frac = self._io:read_u1()
  self.min_payload_frac = self._io:read_u1()
  self.leaf_payload_frac = self._io:read_u1()
  self.file_change_counter = self._io:read_u4be()
  self.num_pages = self._io:read_u4be()
  self.first_freelist_trunk_page = self._io:read_u4be()
  self.num_freelist_pages = self._io:read_u4be()
  self.schema_cookie = self._io:read_u4be()
  self.schema_format = self._io:read_u4be()
  self.def_page_cache_size = self._io:read_u4be()
  self.largest_root_page = self._io:read_u4be()
  self.text_encoding = Sqlite3.Encodings(self._io:read_u4be())
  self.user_version = self._io:read_u4be()
  self.is_incremental_vacuum = self._io:read_u4be()
  self.application_id = self._io:read_u4be()
  self.reserved = self._io:read_bytes(20)
  self.version_valid_for = self._io:read_u4be()
  self.sqlite_version_number = self._io:read_u4be()
  self.root_page = Sqlite3.BtreePage(self._io, self, self._root)
end

Sqlite3.property.len_page = {}
function Sqlite3.property.len_page:get()
  if self._m_len_page ~= nil then
    return self._m_len_page
  end

  self._m_len_page = utils.box_unwrap((self.len_page_mod == 1) and utils.box_wrap(65536) or (self.len_page_mod))
  return self._m_len_page
end

-- 
-- The database page size in bytes. Must be a power of two between
-- 512 and 32768 inclusive, or the value 1 representing a page size
-- of 65536.
-- 
-- Bytes of unused "reserved" space at the end of each page. Usually 0.
-- 
-- Maximum embedded payload fraction. Must be 64.
-- 
-- Minimum embedded payload fraction. Must be 32.
-- 
-- Leaf payload fraction. Must be 32.
-- 
-- Size of the database file in pages. The "in-header database size".
-- 
-- Page number of the first freelist trunk page.
-- 
-- Total number of freelist pages.
-- 
-- The schema format number. Supported schema formats are 1, 2, 3, and 4.
-- 
-- Default page cache size.
-- 
-- The page number of the largest root b-tree page when in auto-vacuum or incremental-vacuum modes, or zero otherwise.
-- 
-- The database text encoding. A value of 1 means UTF-8. A value of 2 means UTF-16le. A value of 3 means UTF-16be.
-- 
-- The "user version" as read and set by the user_version pragma.
-- 
-- True (non-zero) for incremental-vacuum mode. False (zero) otherwise.
-- 
-- The "Application ID" set by PRAGMA application_id.

Sqlite3.BtreePage = class.class(KaitaiStruct)

function Sqlite3.BtreePage:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Sqlite3.BtreePage:_read()
  self.page_type = self._io:read_u1()
  self.first_freeblock = self._io:read_u2be()
  self.num_cells = self._io:read_u2be()
  self.ofs_cells = self._io:read_u2be()
  self.num_frag_free_bytes = self._io:read_u1()
  if  ((self.page_type == 2) or (self.page_type == 5))  then
    self.right_ptr = self._io:read_u4be()
  end
  self.cells = {}
  for i = 0, self.num_cells - 1 do
    self.cells[i + 1] = Sqlite3.RefCell(self._io, self, self._root)
  end
end


-- 
-- See also: Source (https://www.sqlite.org/fileformat.html#b_tree_pages)
Sqlite3.CellIndexInterior = class.class(KaitaiStruct)

function Sqlite3.CellIndexInterior:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Sqlite3.CellIndexInterior:_read()
  self.left_child_page = self._io:read_u4be()
  self.len_payload = VlqBase128Be(self._io)
  self._raw_payload = self._io:read_bytes(self.len_payload.value)
  local _io = KaitaiStream(stringstream(self._raw_payload))
  self.payload = Sqlite3.CellPayload(_io, self, self._root)
end


-- 
-- See also: Source (https://www.sqlite.org/fileformat.html#b_tree_pages)
Sqlite3.CellIndexLeaf = class.class(KaitaiStruct)

function Sqlite3.CellIndexLeaf:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Sqlite3.CellIndexLeaf:_read()
  self.len_payload = VlqBase128Be(self._io)
  self._raw_payload = self._io:read_bytes(self.len_payload.value)
  local _io = KaitaiStream(stringstream(self._raw_payload))
  self.payload = Sqlite3.CellPayload(_io, self, self._root)
end


-- 
-- See also: Source (https://sqlite.org/fileformat2.html#record_format)
Sqlite3.CellPayload = class.class(KaitaiStruct)

function Sqlite3.CellPayload:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Sqlite3.CellPayload:_read()
  self.len_header_and_len = VlqBase128Be(self._io)
  self._raw_column_serials = self._io:read_bytes(self.len_header_and_len.value - 1)
  local _io = KaitaiStream(stringstream(self._raw_column_serials))
  self.column_serials = Sqlite3.Serials(_io, self, self._root)
  self.column_contents = {}
  for i = 0, #self.column_serials.entries - 1 do
    self.column_contents[i + 1] = Sqlite3.ColumnContent(self.column_serials.entries[i + 1], self._io, self, self._root)
  end
end


-- 
-- See also: Source (https://www.sqlite.org/fileformat.html#b_tree_pages)
Sqlite3.CellTableInterior = class.class(KaitaiStruct)

function Sqlite3.CellTableInterior:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Sqlite3.CellTableInterior:_read()
  self.left_child_page = self._io:read_u4be()
  self.row_id = VlqBase128Be(self._io)
end


-- 
-- See also: Source (https://www.sqlite.org/fileformat.html#b_tree_pages)
Sqlite3.CellTableLeaf = class.class(KaitaiStruct)

function Sqlite3.CellTableLeaf:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Sqlite3.CellTableLeaf:_read()
  self.len_payload = VlqBase128Be(self._io)
  self.row_id = VlqBase128Be(self._io)
  self._raw_payload = self._io:read_bytes(self.len_payload.value)
  local _io = KaitaiStream(stringstream(self._raw_payload))
  self.payload = Sqlite3.CellPayload(_io, self, self._root)
end


Sqlite3.ColumnContent = class.class(KaitaiStruct)

function Sqlite3.ColumnContent:_init(serial_type, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self.serial_type = serial_type
  self:_read()
end

function Sqlite3.ColumnContent:_read()
  if  ((self.serial_type.code.value >= 1) and (self.serial_type.code.value <= 6))  then
    local _on = self.serial_type.code.value
    if _on == 1 then
      self.as_int = self._io:read_u1()
    elseif _on == 2 then
      self.as_int = self._io:read_u2be()
    elseif _on == 3 then
      self.as_int = self._io:read_bits_int_be(24)
    elseif _on == 4 then
      self.as_int = self._io:read_u4be()
    elseif _on == 5 then
      self.as_int = self._io:read_bits_int_be(48)
    elseif _on == 6 then
      self.as_int = self._io:read_u8be()
    end
  end
  if self.serial_type.code.value == 7 then
    self.as_float = self._io:read_f8be()
  end
  if self.serial_type.is_blob then
    self.as_blob = self._io:read_bytes(self.serial_type.len_content)
  end
  self.as_str = str_decode.decode(self._io:read_bytes(self.serial_type.len_content), "UTF-8")
end


Sqlite3.RefCell = class.class(KaitaiStruct)

function Sqlite3.RefCell:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Sqlite3.RefCell:_read()
  self.ofs_body = self._io:read_u2be()
end

Sqlite3.RefCell.property.body = {}
function Sqlite3.RefCell.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_body)
  local _on = self._parent.page_type
  if _on == 10 then
    self._m_body = Sqlite3.CellIndexLeaf(self._io, self, self._root)
  elseif _on == 13 then
    self._m_body = Sqlite3.CellTableLeaf(self._io, self, self._root)
  elseif _on == 2 then
    self._m_body = Sqlite3.CellIndexInterior(self._io, self, self._root)
  elseif _on == 5 then
    self._m_body = Sqlite3.CellTableInterior(self._io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_body
end


Sqlite3.Serial = class.class(KaitaiStruct)

function Sqlite3.Serial:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Sqlite3.Serial:_read()
  self.code = VlqBase128Be(self._io)
end

Sqlite3.Serial.property.is_blob = {}
function Sqlite3.Serial.property.is_blob:get()
  if self._m_is_blob ~= nil then
    return self._m_is_blob
  end

  self._m_is_blob =  ((self.code.value >= 12) and (self.code.value % 2 == 0)) 
  return self._m_is_blob
end

Sqlite3.Serial.property.is_string = {}
function Sqlite3.Serial.property.is_string:get()
  if self._m_is_string ~= nil then
    return self._m_is_string
  end

  self._m_is_string =  ((self.code.value >= 13) and (self.code.value % 2 == 1)) 
  return self._m_is_string
end

Sqlite3.Serial.property.len_content = {}
function Sqlite3.Serial.property.len_content:get()
  if self._m_len_content ~= nil then
    return self._m_len_content
  end

  if self.code.value >= 12 then
    self._m_len_content = math.floor((self.code.value - 12) / 2)
  end
  return self._m_len_content
end


Sqlite3.Serials = class.class(KaitaiStruct)

function Sqlite3.Serials:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Sqlite3.Serials:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Sqlite3.Serial(self._io, self, self._root)
    i = i + 1
  end
end


