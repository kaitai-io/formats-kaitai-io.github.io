-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")

ShapefileIndex = class.class(KaitaiStruct)

ShapefileIndex.ShapeType = enum.Enum {
  null_shape = 0,
  point = 1,
  poly_line = 3,
  polygon = 5,
  multi_point = 8,
  point_z = 11,
  poly_line_z = 13,
  polygon_z = 15,
  multi_point_z = 18,
  point_m = 21,
  poly_line_m = 23,
  polygon_m = 25,
  multi_point_m = 28,
  multi_patch = 31,
}

function ShapefileIndex:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ShapefileIndex:_read()
  self.header = ShapefileIndex.FileHeader(self._io, self, self._root)
  self.records = {}
  local i = 0
  while not self._io:is_eof() do
    self.records[i + 1] = ShapefileIndex.Record(self._io, self, self._root)
    i = i + 1
  end
end

-- 
-- the size of this section of the file in bytes must equal (header.file_length * 2) - 100.

ShapefileIndex.BoundingBoxXYZM = class.class(KaitaiStruct)

function ShapefileIndex.BoundingBoxXYZM:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileIndex.BoundingBoxXYZM:_read()
  self.x = ShapefileIndex.BoundsMinMax(self._io, self, self._root)
  self.y = ShapefileIndex.BoundsMinMax(self._io, self, self._root)
  self.z = ShapefileIndex.BoundsMinMax(self._io, self, self._root)
  self.m = ShapefileIndex.BoundsMinMax(self._io, self, self._root)
end


ShapefileIndex.BoundsMinMax = class.class(KaitaiStruct)

function ShapefileIndex.BoundsMinMax:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileIndex.BoundsMinMax:_read()
  self.min = self._io:read_f8be()
  self.max = self._io:read_f8be()
end


ShapefileIndex.FileHeader = class.class(KaitaiStruct)

function ShapefileIndex.FileHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileIndex.FileHeader:_read()
  self.file_code = self._io:read_bytes(4)
  if not(self.file_code == "\000\000\039\010") then
    error("not equal, expected " .. "\000\000\039\010" .. ", but got " .. self.file_code)
  end
  self.unused_field_1 = self._io:read_bytes(4)
  if not(self.unused_field_1 == "\000\000\000\000") then
    error("not equal, expected " .. "\000\000\000\000" .. ", but got " .. self.unused_field_1)
  end
  self.unused_field_2 = self._io:read_bytes(4)
  if not(self.unused_field_2 == "\000\000\000\000") then
    error("not equal, expected " .. "\000\000\000\000" .. ", but got " .. self.unused_field_2)
  end
  self.unused_field_3 = self._io:read_bytes(4)
  if not(self.unused_field_3 == "\000\000\000\000") then
    error("not equal, expected " .. "\000\000\000\000" .. ", but got " .. self.unused_field_3)
  end
  self.unused_field_4 = self._io:read_bytes(4)
  if not(self.unused_field_4 == "\000\000\000\000") then
    error("not equal, expected " .. "\000\000\000\000" .. ", but got " .. self.unused_field_4)
  end
  self.unused_field_5 = self._io:read_bytes(4)
  if not(self.unused_field_5 == "\000\000\000\000") then
    error("not equal, expected " .. "\000\000\000\000" .. ", but got " .. self.unused_field_5)
  end
  self.file_length = self._io:read_s4be()
  self.version = self._io:read_bytes(4)
  if not(self.version == "\232\003\000\000") then
    error("not equal, expected " .. "\232\003\000\000" .. ", but got " .. self.version)
  end
  self.shape_type = ShapefileIndex.ShapeType(self._io:read_s4le())
  self.bounding_box = ShapefileIndex.BoundingBoxXYZM(self._io, self, self._root)
end

-- 
-- corresponds to s4be value of 9994.
-- 
-- corresponds to s4le value of 1000.

ShapefileIndex.Record = class.class(KaitaiStruct)

function ShapefileIndex.Record:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileIndex.Record:_read()
  self.offset = self._io:read_s4be()
  self.content_length = self._io:read_s4be()
end


