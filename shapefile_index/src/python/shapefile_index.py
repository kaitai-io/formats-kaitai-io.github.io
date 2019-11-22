# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class ShapefileIndex(KaitaiStruct):

    class ShapeType(Enum):
        null_shape = 0
        point = 1
        poly_line = 3
        polygon = 5
        multi_point = 8
        point_z = 11
        poly_line_z = 13
        polygon_z = 15
        multi_point_z = 18
        point_m = 21
        poly_line_m = 23
        polygon_m = 25
        multi_point_m = 28
        multi_patch = 31
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.header = self._root.FileHeader(self._io, self, self._root)
        self.records = []
        i = 0
        while not self._io.is_eof():
            self.records.append(self._root.Record(self._io, self, self._root))
            i += 1


    class FileHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.file_code = self._io.ensure_fixed_contents(b"\x00\x00\x27\x0A")
            self.unused_field_1 = self._io.ensure_fixed_contents(b"\x00\x00\x00\x00")
            self.unused_field_2 = self._io.ensure_fixed_contents(b"\x00\x00\x00\x00")
            self.unused_field_3 = self._io.ensure_fixed_contents(b"\x00\x00\x00\x00")
            self.unused_field_4 = self._io.ensure_fixed_contents(b"\x00\x00\x00\x00")
            self.unused_field_5 = self._io.ensure_fixed_contents(b"\x00\x00\x00\x00")
            self.file_length = self._io.read_s4be()
            self.version = self._io.ensure_fixed_contents(b"\xE8\x03\x00\x00")
            self.shape_type = self._root.ShapeType(self._io.read_s4le())
            self.bounding_box = self._root.BoundingBoxXYZM(self._io, self, self._root)


    class Record(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.offset = self._io.read_s4be()
            self.content_length = self._io.read_s4be()


    class BoundingBoxXYZM(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.x = self._root.BoundsMinMax(self._io, self, self._root)
            self.y = self._root.BoundsMinMax(self._io, self, self._root)
            self.z = self._root.BoundsMinMax(self._io, self, self._root)
            self.m = self._root.BoundsMinMax(self._io, self, self._root)


    class BoundsMinMax(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.min = self._io.read_f8be()
            self.max = self._io.read_f8be()



