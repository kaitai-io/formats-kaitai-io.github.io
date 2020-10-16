-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

-- 
-- STL files are used to represent simple 3D models, defined using
-- triangular 3D faces.
-- 
-- Initially it was introduced as native format for 3D Systems
-- Stereolithography CAD system, but due to its extreme simplicity, it
-- was adopted by a wide range of 3D modelling, CAD, rapid prototyping
-- and 3D printing applications as the simplest 3D model exchange
-- format.
-- 
-- STL is extremely bare-bones format: there are no complex headers, no
-- texture / color support, no units specifications, no distinct vertex
-- arrays. Whole model is specified as a collection of triangular
-- faces.
-- 
-- There are two versions of the format (text and binary), this spec
-- describes binary version.
Stl = class.class(KaitaiStruct)

function Stl:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Stl:_read()
  self.header = self._io:read_bytes(80)
  self.num_triangles = self._io:read_u4le()
  self.triangles = {}
  for i = 0, self.num_triangles - 1 do
    self.triangles[i + 1] = Stl.Triangle(self._io, self, self._root)
  end
end


-- 
-- Each STL triangle is defined by its 3 points in 3D space and a
-- normal vector, which is generally used to determine where is
-- "inside" and "outside" of the model.
Stl.Triangle = class.class(KaitaiStruct)

function Stl.Triangle:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Stl.Triangle:_read()
  self.normal = Stl.Vec3d(self._io, self, self._root)
  self.vertices = {}
  for i = 0, 3 - 1 do
    self.vertices[i + 1] = Stl.Vec3d(self._io, self, self._root)
  end
  self.abr = self._io:read_u2le()
end

-- 
-- In theory (per standard), it's "attribute byte count" with
-- no other details given on what "attribute" is and what
-- should be stored in this field.
-- 
-- In practice, software dealing with STL either expected to
-- see 0 here, or uses this 16-bit field per se to store
-- additional attributes (such as RGB color of a vertex or
-- color index).

Stl.Vec3d = class.class(KaitaiStruct)

function Stl.Vec3d:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Stl.Vec3d:_read()
  self.x = self._io:read_f4le()
  self.y = self._io:read_f4le()
  self.z = self._io:read_f4le()
end


