-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")

ShapefileMain = class.class(KaitaiStruct)

ShapefileMain.PartType = enum.Enum {
  triangle_strip = 0,
  triangle_fan = 1,
  outer_ring = 2,
  inner_ring = 3,
  first_ring = 4,
  ring = 5,
}

ShapefileMain.ShapeType = enum.Enum {
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

function ShapefileMain:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ShapefileMain:_read()
  self.header = ShapefileMain.FileHeader(self._io, self, self._root)
  self.records = {}
  local i = 0
  while not self._io:is_eof() do
    self.records[i + 1] = ShapefileMain.Record(self._io, self, self._root)
    i = i + 1
  end
end

-- 
-- the size of this section of the file in bytes must equal (header.file_length * 2) - 100.

ShapefileMain.BoundingBoxXY = class.class(KaitaiStruct)

function ShapefileMain.BoundingBoxXY:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileMain.BoundingBoxXY:_read()
  self.x = ShapefileMain.BoundsMinMax(self._io, self, self._root)
  self.y = ShapefileMain.BoundsMinMax(self._io, self, self._root)
end


ShapefileMain.BoundingBoxXYZM = class.class(KaitaiStruct)

function ShapefileMain.BoundingBoxXYZM:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileMain.BoundingBoxXYZM:_read()
  self.x = ShapefileMain.BoundsMinMax(self._io, self, self._root)
  self.y = ShapefileMain.BoundsMinMax(self._io, self, self._root)
  self.z = ShapefileMain.BoundsMinMax(self._io, self, self._root)
  self.m = ShapefileMain.BoundsMinMax(self._io, self, self._root)
end


ShapefileMain.BoundsMinMax = class.class(KaitaiStruct)

function ShapefileMain.BoundsMinMax:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileMain.BoundsMinMax:_read()
  self.min = self._io:read_f8le()
  self.max = self._io:read_f8le()
end


ShapefileMain.FileHeader = class.class(KaitaiStruct)

function ShapefileMain.FileHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileMain.FileHeader:_read()
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
  self.shape_type = ShapefileMain.ShapeType(self._io:read_s4le())
  self.bounding_box = ShapefileMain.BoundingBoxXYZM(self._io, self, self._root)
end

-- 
-- corresponds to s4be value of 9994.
-- 
-- corresponds to s4le value of 1000.

ShapefileMain.MultiPatch = class.class(KaitaiStruct)

function ShapefileMain.MultiPatch:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileMain.MultiPatch:_read()
  self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
  self.number_of_parts = self._io:read_s4le()
  self.number_of_points = self._io:read_s4le()
  self.parts = {}
  for i = 0, self.number_of_parts - 1 do
    self.parts[i + 1] = self._io:read_s4le()
  end
  self.part_types = {}
  for i = 0, self.number_of_parts - 1 do
    self.part_types[i + 1] = ShapefileMain.PartType(self._io:read_s4le())
  end
  self.points = {}
  for i = 0, self.number_of_points - 1 do
    self.points[i + 1] = ShapefileMain.Point(self._io, self, self._root)
  end
  self.z_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
  self.z_values = {}
  for i = 0, self.number_of_points - 1 do
    self.z_values[i + 1] = self._io:read_f8le()
  end
  self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
  self.m_values = {}
  for i = 0, self.number_of_points - 1 do
    self.m_values[i + 1] = self._io:read_f8le()
  end
end


ShapefileMain.MultiPoint = class.class(KaitaiStruct)

function ShapefileMain.MultiPoint:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileMain.MultiPoint:_read()
  self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
  self.number_of_points = self._io:read_s4le()
  self.points = {}
  for i = 0, self.number_of_points - 1 do
    self.points[i + 1] = ShapefileMain.Point(self._io, self, self._root)
  end
end


ShapefileMain.MultiPointM = class.class(KaitaiStruct)

function ShapefileMain.MultiPointM:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileMain.MultiPointM:_read()
  self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
  self.number_of_points = self._io:read_s4le()
  self.points = {}
  for i = 0, self.number_of_points - 1 do
    self.points[i + 1] = ShapefileMain.Point(self._io, self, self._root)
  end
  self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
  self.m_values = {}
  for i = 0, self.number_of_points - 1 do
    self.m_values[i + 1] = self._io:read_f8le()
  end
end


ShapefileMain.MultiPointZ = class.class(KaitaiStruct)

function ShapefileMain.MultiPointZ:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileMain.MultiPointZ:_read()
  self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
  self.number_of_points = self._io:read_s4le()
  self.points = {}
  for i = 0, self.number_of_points - 1 do
    self.points[i + 1] = ShapefileMain.Point(self._io, self, self._root)
  end
  self.z_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
  self.z_values = {}
  for i = 0, self.number_of_points - 1 do
    self.z_values[i + 1] = self._io:read_f8le()
  end
  self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
  self.m_values = {}
  for i = 0, self.number_of_points - 1 do
    self.m_values[i + 1] = self._io:read_f8le()
  end
end


ShapefileMain.Point = class.class(KaitaiStruct)

function ShapefileMain.Point:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileMain.Point:_read()
  self.x = self._io:read_f8le()
  self.y = self._io:read_f8le()
end


ShapefileMain.PointM = class.class(KaitaiStruct)

function ShapefileMain.PointM:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileMain.PointM:_read()
  self.x = self._io:read_f8le()
  self.y = self._io:read_f8le()
  self.m = self._io:read_f8le()
end


ShapefileMain.PointZ = class.class(KaitaiStruct)

function ShapefileMain.PointZ:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileMain.PointZ:_read()
  self.x = self._io:read_f8le()
  self.y = self._io:read_f8le()
  self.z = self._io:read_f8le()
  self.m = self._io:read_f8le()
end


ShapefileMain.PolyLine = class.class(KaitaiStruct)

function ShapefileMain.PolyLine:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileMain.PolyLine:_read()
  self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
  self.number_of_parts = self._io:read_s4le()
  self.number_of_points = self._io:read_s4le()
  self.parts = {}
  for i = 0, self.number_of_parts - 1 do
    self.parts[i + 1] = self._io:read_s4le()
  end
  self.points = {}
  for i = 0, self.number_of_points - 1 do
    self.points[i + 1] = ShapefileMain.Point(self._io, self, self._root)
  end
end


ShapefileMain.PolyLineM = class.class(KaitaiStruct)

function ShapefileMain.PolyLineM:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileMain.PolyLineM:_read()
  self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
  self.number_of_parts = self._io:read_s4le()
  self.number_of_points = self._io:read_s4le()
  self.parts = {}
  for i = 0, self.number_of_parts - 1 do
    self.parts[i + 1] = self._io:read_s4le()
  end
  self.points = {}
  for i = 0, self.number_of_points - 1 do
    self.points[i + 1] = ShapefileMain.Point(self._io, self, self._root)
  end
  self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
  self.m_values = {}
  for i = 0, self.number_of_points - 1 do
    self.m_values[i + 1] = self._io:read_f8le()
  end
end


ShapefileMain.PolyLineZ = class.class(KaitaiStruct)

function ShapefileMain.PolyLineZ:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileMain.PolyLineZ:_read()
  self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
  self.number_of_parts = self._io:read_s4le()
  self.number_of_points = self._io:read_s4le()
  self.parts = {}
  for i = 0, self.number_of_parts - 1 do
    self.parts[i + 1] = self._io:read_s4le()
  end
  self.points = {}
  for i = 0, self.number_of_points - 1 do
    self.points[i + 1] = ShapefileMain.Point(self._io, self, self._root)
  end
  self.z_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
  self.z_values = {}
  for i = 0, self.number_of_points - 1 do
    self.z_values[i + 1] = self._io:read_f8le()
  end
  self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
  self.m_values = {}
  for i = 0, self.number_of_points - 1 do
    self.m_values[i + 1] = self._io:read_f8le()
  end
end


ShapefileMain.Polygon = class.class(KaitaiStruct)

function ShapefileMain.Polygon:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileMain.Polygon:_read()
  self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
  self.number_of_parts = self._io:read_s4le()
  self.number_of_points = self._io:read_s4le()
  self.parts = {}
  for i = 0, self.number_of_parts - 1 do
    self.parts[i + 1] = self._io:read_s4le()
  end
  self.points = {}
  for i = 0, self.number_of_points - 1 do
    self.points[i + 1] = ShapefileMain.Point(self._io, self, self._root)
  end
end


ShapefileMain.PolygonM = class.class(KaitaiStruct)

function ShapefileMain.PolygonM:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileMain.PolygonM:_read()
  self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
  self.number_of_parts = self._io:read_s4le()
  self.number_of_points = self._io:read_s4le()
  self.parts = {}
  for i = 0, self.number_of_parts - 1 do
    self.parts[i + 1] = self._io:read_s4le()
  end
  self.points = {}
  for i = 0, self.number_of_points - 1 do
    self.points[i + 1] = ShapefileMain.Point(self._io, self, self._root)
  end
  self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
  self.m_values = {}
  for i = 0, self.number_of_points - 1 do
    self.m_values[i + 1] = self._io:read_f8le()
  end
end


ShapefileMain.PolygonZ = class.class(KaitaiStruct)

function ShapefileMain.PolygonZ:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileMain.PolygonZ:_read()
  self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
  self.number_of_parts = self._io:read_s4le()
  self.number_of_points = self._io:read_s4le()
  self.parts = {}
  for i = 0, self.number_of_parts - 1 do
    self.parts[i + 1] = self._io:read_s4le()
  end
  self.points = {}
  for i = 0, self.number_of_points - 1 do
    self.points[i + 1] = ShapefileMain.Point(self._io, self, self._root)
  end
  self.z_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
  self.z_values = {}
  for i = 0, self.number_of_points - 1 do
    self.z_values[i + 1] = self._io:read_f8le()
  end
  self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
  self.m_values = {}
  for i = 0, self.number_of_points - 1 do
    self.m_values[i + 1] = self._io:read_f8le()
  end
end


ShapefileMain.Record = class.class(KaitaiStruct)

function ShapefileMain.Record:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileMain.Record:_read()
  self.header = ShapefileMain.RecordHeader(self._io, self, self._root)
  self.contents = ShapefileMain.RecordContents(self._io, self, self._root)
end

-- 
-- the size of this contents section in bytes must equal header.content_length * 2.

ShapefileMain.RecordContents = class.class(KaitaiStruct)

function ShapefileMain.RecordContents:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileMain.RecordContents:_read()
  self.shape_type = ShapefileMain.ShapeType(self._io:read_s4le())
  if self.shape_type ~= ShapefileMain.ShapeType.null_shape then
    local _on = self.shape_type
    if _on == ShapefileMain.ShapeType.multi_patch then
      self.shape_parameters = ShapefileMain.MultiPatch(self._io, self, self._root)
    elseif _on == ShapefileMain.ShapeType.multi_point then
      self.shape_parameters = ShapefileMain.MultiPoint(self._io, self, self._root)
    elseif _on == ShapefileMain.ShapeType.multi_point_m then
      self.shape_parameters = ShapefileMain.MultiPointM(self._io, self, self._root)
    elseif _on == ShapefileMain.ShapeType.multi_point_z then
      self.shape_parameters = ShapefileMain.MultiPointZ(self._io, self, self._root)
    elseif _on == ShapefileMain.ShapeType.point then
      self.shape_parameters = ShapefileMain.Point(self._io, self, self._root)
    elseif _on == ShapefileMain.ShapeType.point_m then
      self.shape_parameters = ShapefileMain.PointM(self._io, self, self._root)
    elseif _on == ShapefileMain.ShapeType.point_z then
      self.shape_parameters = ShapefileMain.PointZ(self._io, self, self._root)
    elseif _on == ShapefileMain.ShapeType.poly_line then
      self.shape_parameters = ShapefileMain.PolyLine(self._io, self, self._root)
    elseif _on == ShapefileMain.ShapeType.poly_line_m then
      self.shape_parameters = ShapefileMain.PolyLineM(self._io, self, self._root)
    elseif _on == ShapefileMain.ShapeType.poly_line_z then
      self.shape_parameters = ShapefileMain.PolyLineZ(self._io, self, self._root)
    elseif _on == ShapefileMain.ShapeType.polygon then
      self.shape_parameters = ShapefileMain.Polygon(self._io, self, self._root)
    elseif _on == ShapefileMain.ShapeType.polygon_m then
      self.shape_parameters = ShapefileMain.PolygonM(self._io, self, self._root)
    elseif _on == ShapefileMain.ShapeType.polygon_z then
      self.shape_parameters = ShapefileMain.PolygonZ(self._io, self, self._root)
    end
  end
end


ShapefileMain.RecordHeader = class.class(KaitaiStruct)

function ShapefileMain.RecordHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function ShapefileMain.RecordHeader:_read()
  self.record_number = self._io:read_s4be()
  self.content_length = self._io:read_s4be()
end


