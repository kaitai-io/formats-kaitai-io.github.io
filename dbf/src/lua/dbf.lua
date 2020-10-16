-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

Dbf = class.class(KaitaiStruct)

function Dbf:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dbf:_read()
  self.header1 = Dbf.Header1(self._io, self, self._root)
  self._raw_header2 = self._io:read_bytes((self.header1.len_header - 12))
  local _io = KaitaiStream(stringstream(self._raw_header2))
  self.header2 = Dbf.Header2(_io, self, self._root)
  self.records = {}
  for i = 0, self.header1.num_records - 1 do
    self.records[i + 1] = self._io:read_bytes(self.header1.len_record)
  end
end


Dbf.Header2 = class.class(KaitaiStruct)

function Dbf.Header2:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dbf.Header2:_read()
  if self._root.header1.dbase_level == 3 then
    self.header_dbase_3 = Dbf.HeaderDbase3(self._io, self, self._root)
  end
  if self._root.header1.dbase_level == 7 then
    self.header_dbase_7 = Dbf.HeaderDbase7(self._io, self, self._root)
  end
  self.fields = {}
  for i = 0, 11 - 1 do
    self.fields[i + 1] = Dbf.Field(self._io, self, self._root)
  end
end


Dbf.Field = class.class(KaitaiStruct)

function Dbf.Field:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dbf.Field:_read()
  self.name = str_decode.decode(self._io:read_bytes(11), "ASCII")
  self.datatype = self._io:read_u1()
  self.data_address = self._io:read_u4le()
  self.length = self._io:read_u1()
  self.decimal_count = self._io:read_u1()
  self.reserved1 = self._io:read_bytes(2)
  self.work_area_id = self._io:read_u1()
  self.reserved2 = self._io:read_bytes(2)
  self.set_fields_flag = self._io:read_u1()
  self.reserved3 = self._io:read_bytes(8)
end


-- 
-- See also: - section 1.1 (http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm)
Dbf.Header1 = class.class(KaitaiStruct)

function Dbf.Header1:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dbf.Header1:_read()
  self.version = self._io:read_u1()
  self.last_update_y = self._io:read_u1()
  self.last_update_m = self._io:read_u1()
  self.last_update_d = self._io:read_u1()
  self.num_records = self._io:read_u4le()
  self.len_header = self._io:read_u2le()
  self.len_record = self._io:read_u2le()
end

Dbf.Header1.property.dbase_level = {}
function Dbf.Header1.property.dbase_level:get()
  if self._m_dbase_level ~= nil then
    return self._m_dbase_level
  end

  self._m_dbase_level = (self.version & 7)
  return self._m_dbase_level
end


Dbf.HeaderDbase3 = class.class(KaitaiStruct)

function Dbf.HeaderDbase3:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dbf.HeaderDbase3:_read()
  self.reserved1 = self._io:read_bytes(3)
  self.reserved2 = self._io:read_bytes(13)
  self.reserved3 = self._io:read_bytes(4)
end


Dbf.HeaderDbase7 = class.class(KaitaiStruct)

function Dbf.HeaderDbase7:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dbf.HeaderDbase7:_read()
  self.reserved1 = self._io:read_bytes(2)
  if not(self.reserved1 == "\000\000") then
    error("not equal, expected " ..  "\000\000" .. ", but got " .. self.reserved1)
  end
  self.has_incomplete_transaction = self._io:read_u1()
  self.dbase_iv_encryption = self._io:read_u1()
  self.reserved2 = self._io:read_bytes(12)
  self.production_mdx = self._io:read_u1()
  self.language_driver_id = self._io:read_u1()
  self.reserved3 = self._io:read_bytes(2)
  if not(self.reserved3 == "\000\000") then
    error("not equal, expected " ..  "\000\000" .. ", but got " .. self.reserved3)
  end
  self.language_driver_name = self._io:read_bytes(32)
  self.reserved4 = self._io:read_bytes(4)
end


