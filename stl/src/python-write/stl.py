# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Stl(ReadWriteKaitaiStruct):
    """STL files are used to represent simple 3D models, defined using
    triangular 3D faces.
    
    Initially it was introduced as native format for 3D Systems
    Stereolithography CAD system, but due to its extreme simplicity, it
    was adopted by a wide range of 3D modelling, CAD, rapid prototyping
    and 3D printing applications as the simplest 3D model exchange
    format.
    
    STL is extremely bare-bones format: there are no complex headers, no
    texture / color support, no units specifications, no distinct vertex
    arrays. Whole model is specified as a collection of triangular
    faces.
    
    There are two versions of the format (text and binary), this spec
    describes binary version.
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Stl, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header = self._io.read_bytes(80)
        self.num_triangles = self._io.read_u4le()
        self.triangles = []
        for i in range(self.num_triangles):
            _t_triangles = Stl.Triangle(self._io, self, self._root)
            try:
                _t_triangles._read()
            finally:
                self.triangles.append(_t_triangles)

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.triangles)):
            pass
            self.triangles[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Stl, self)._write__seq(io)
        self._io.write_bytes(self.header)
        self._io.write_u4le(self.num_triangles)
        for i in range(len(self.triangles)):
            pass
            self.triangles[i]._write__seq(self._io)



    def _check(self):
        if len(self.header) != 80:
            raise kaitaistruct.ConsistencyError(u"header", 80, len(self.header))
        if len(self.triangles) != self.num_triangles:
            raise kaitaistruct.ConsistencyError(u"triangles", self.num_triangles, len(self.triangles))
        for i in range(len(self.triangles)):
            pass
            if self.triangles[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"triangles", self._root, self.triangles[i]._root)
            if self.triangles[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"triangles", self, self.triangles[i]._parent)

        self._dirty = False

    class Triangle(ReadWriteKaitaiStruct):
        """Each STL triangle is defined by its 3 points in 3D space and a
        normal vector, which is generally used to determine where is
        "inside" and "outside" of the model.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Stl.Triangle, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.normal = Stl.Vec3d(self._io, self, self._root)
            self.normal._read()
            self.vertices = []
            for i in range(3):
                _t_vertices = Stl.Vec3d(self._io, self, self._root)
                try:
                    _t_vertices._read()
                finally:
                    self.vertices.append(_t_vertices)

            self.abr = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.normal._fetch_instances()
            for i in range(len(self.vertices)):
                pass
                self.vertices[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Stl.Triangle, self)._write__seq(io)
            self.normal._write__seq(self._io)
            for i in range(len(self.vertices)):
                pass
                self.vertices[i]._write__seq(self._io)

            self._io.write_u2le(self.abr)


        def _check(self):
            if self.normal._root != self._root:
                raise kaitaistruct.ConsistencyError(u"normal", self._root, self.normal._root)
            if self.normal._parent != self:
                raise kaitaistruct.ConsistencyError(u"normal", self, self.normal._parent)
            if len(self.vertices) != 3:
                raise kaitaistruct.ConsistencyError(u"vertices", 3, len(self.vertices))
            for i in range(len(self.vertices)):
                pass
                if self.vertices[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"vertices", self._root, self.vertices[i]._root)
                if self.vertices[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"vertices", self, self.vertices[i]._parent)

            self._dirty = False


    class Vec3d(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Stl.Vec3d, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.x = self._io.read_f4le()
            self.y = self._io.read_f4le()
            self.z = self._io.read_f4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Stl.Vec3d, self)._write__seq(io)
            self._io.write_f4le(self.x)
            self._io.write_f4le(self.y)
            self._io.write_f4le(self.z)


        def _check(self):
            self._dirty = False



