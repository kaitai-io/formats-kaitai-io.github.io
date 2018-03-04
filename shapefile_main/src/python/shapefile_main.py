# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class ShapefileMain(KaitaiStruct):

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

    class PartType(Enum):
        triangle_strip = 0
        triangle_fan = 1
        outer_ring = 2
        inner_ring = 3
        first_ring = 4
        ring = 5
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


    class MultiPointM(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.bounding_box = self._root.BoundingBoxXY(self._io, self, self._root)
            self.number_of_points = self._io.read_s4le()
            self.points = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.points[i] = self._root.Point(self._io, self, self._root)

            self.m_range = self._root.BoundsMinMax(self._io, self, self._root)
            self.m_values = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.m_values[i] = self._io.read_f8le()



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


    class Point(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.x = self._io.read_f8le()
            self.y = self._io.read_f8le()


    class Polygon(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.bounding_box = self._root.BoundingBoxXY(self._io, self, self._root)
            self.number_of_parts = self._io.read_s4le()
            self.number_of_points = self._io.read_s4le()
            self.parts = [None] * (self.number_of_parts)
            for i in range(self.number_of_parts):
                self.parts[i] = self._io.read_s4le()

            self.points = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.points[i] = self._root.Point(self._io, self, self._root)



    class BoundsMinMax(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.min = self._io.read_f8le()
            self.max = self._io.read_f8le()


    class PolyLine(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.bounding_box = self._root.BoundingBoxXY(self._io, self, self._root)
            self.number_of_parts = self._io.read_s4le()
            self.number_of_points = self._io.read_s4le()
            self.parts = [None] * (self.number_of_parts)
            for i in range(self.number_of_parts):
                self.parts[i] = self._io.read_s4le()

            self.points = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.points[i] = self._root.Point(self._io, self, self._root)



    class MultiPointZ(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.bounding_box = self._root.BoundingBoxXY(self._io, self, self._root)
            self.number_of_points = self._io.read_s4le()
            self.points = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.points[i] = self._root.Point(self._io, self, self._root)

            self.z_range = self._root.BoundsMinMax(self._io, self, self._root)
            self.z_values = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.z_values[i] = self._io.read_f8le()

            self.m_range = self._root.BoundsMinMax(self._io, self, self._root)
            self.m_values = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.m_values[i] = self._io.read_f8le()



    class PolyLineZ(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.bounding_box = self._root.BoundingBoxXY(self._io, self, self._root)
            self.number_of_parts = self._io.read_s4le()
            self.number_of_points = self._io.read_s4le()
            self.parts = [None] * (self.number_of_parts)
            for i in range(self.number_of_parts):
                self.parts[i] = self._io.read_s4le()

            self.points = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.points[i] = self._root.Point(self._io, self, self._root)

            self.z_range = self._root.BoundsMinMax(self._io, self, self._root)
            self.z_values = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.z_values[i] = self._io.read_f8le()

            self.m_range = self._root.BoundsMinMax(self._io, self, self._root)
            self.m_values = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.m_values[i] = self._io.read_f8le()



    class PolygonZ(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.bounding_box = self._root.BoundingBoxXY(self._io, self, self._root)
            self.number_of_parts = self._io.read_s4le()
            self.number_of_points = self._io.read_s4le()
            self.parts = [None] * (self.number_of_parts)
            for i in range(self.number_of_parts):
                self.parts[i] = self._io.read_s4le()

            self.points = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.points[i] = self._root.Point(self._io, self, self._root)

            self.z_range = self._root.BoundsMinMax(self._io, self, self._root)
            self.z_values = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.z_values[i] = self._io.read_f8le()

            self.m_range = self._root.BoundsMinMax(self._io, self, self._root)
            self.m_values = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.m_values[i] = self._io.read_f8le()



    class BoundingBoxXY(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.x = self._root.BoundsMinMax(self._io, self, self._root)
            self.y = self._root.BoundsMinMax(self._io, self, self._root)


    class PointM(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.x = self._io.read_f8le()
            self.y = self._io.read_f8le()
            self.m = self._io.read_f8le()


    class PolygonM(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.bounding_box = self._root.BoundingBoxXY(self._io, self, self._root)
            self.number_of_parts = self._io.read_s4le()
            self.number_of_points = self._io.read_s4le()
            self.parts = [None] * (self.number_of_parts)
            for i in range(self.number_of_parts):
                self.parts[i] = self._io.read_s4le()

            self.points = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.points[i] = self._root.Point(self._io, self, self._root)

            self.m_range = self._root.BoundsMinMax(self._io, self, self._root)
            self.m_values = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.m_values[i] = self._io.read_f8le()



    class RecordHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.record_number = self._io.read_s4be()
            self.content_length = self._io.read_s4be()


    class MultiPoint(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.bounding_box = self._root.BoundingBoxXY(self._io, self, self._root)
            self.number_of_points = self._io.read_s4le()
            self.points = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.points[i] = self._root.Point(self._io, self, self._root)



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


    class PointZ(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.x = self._io.read_f8le()
            self.y = self._io.read_f8le()
            self.z = self._io.read_f8le()
            self.m = self._io.read_f8le()


    class Record(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.header = self._root.RecordHeader(self._io, self, self._root)
            self.contents = self._root.RecordContents(self._io, self, self._root)


    class RecordContents(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.shape_type = self._root.ShapeType(self._io.read_s4le())
            if self.shape_type != self._root.ShapeType.null_shape:
                _on = self.shape_type
                if _on == self._root.ShapeType.point_m:
                    self.shape_parameters = self._root.PointM(self._io, self, self._root)
                elif _on == self._root.ShapeType.polygon_z:
                    self.shape_parameters = self._root.PolygonZ(self._io, self, self._root)
                elif _on == self._root.ShapeType.multi_point_m:
                    self.shape_parameters = self._root.MultiPointM(self._io, self, self._root)
                elif _on == self._root.ShapeType.poly_line_z:
                    self.shape_parameters = self._root.PolyLineZ(self._io, self, self._root)
                elif _on == self._root.ShapeType.multi_point_z:
                    self.shape_parameters = self._root.MultiPointZ(self._io, self, self._root)
                elif _on == self._root.ShapeType.multi_point:
                    self.shape_parameters = self._root.MultiPoint(self._io, self, self._root)
                elif _on == self._root.ShapeType.polygon_m:
                    self.shape_parameters = self._root.PolygonM(self._io, self, self._root)
                elif _on == self._root.ShapeType.polygon:
                    self.shape_parameters = self._root.Polygon(self._io, self, self._root)
                elif _on == self._root.ShapeType.point:
                    self.shape_parameters = self._root.Point(self._io, self, self._root)
                elif _on == self._root.ShapeType.poly_line_m:
                    self.shape_parameters = self._root.PolyLineM(self._io, self, self._root)
                elif _on == self._root.ShapeType.poly_line:
                    self.shape_parameters = self._root.PolyLine(self._io, self, self._root)
                elif _on == self._root.ShapeType.point_z:
                    self.shape_parameters = self._root.PointZ(self._io, self, self._root)
                elif _on == self._root.ShapeType.multi_patch:
                    self.shape_parameters = self._root.MultiPatch(self._io, self, self._root)



    class MultiPatch(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.bounding_box = self._root.BoundingBoxXY(self._io, self, self._root)
            self.number_of_parts = self._io.read_s4le()
            self.number_of_points = self._io.read_s4le()
            self.parts = [None] * (self.number_of_parts)
            for i in range(self.number_of_parts):
                self.parts[i] = self._io.read_s4le()

            self.part_types = [None] * (self.number_of_parts)
            for i in range(self.number_of_parts):
                self.part_types[i] = self._root.PartType(self._io.read_s4le())

            self.points = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.points[i] = self._root.Point(self._io, self, self._root)

            self.z_range = self._root.BoundsMinMax(self._io, self, self._root)
            self.z_values = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.z_values[i] = self._io.read_f8le()

            self.m_range = self._root.BoundsMinMax(self._io, self, self._root)
            self.m_values = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.m_values[i] = self._io.read_f8le()



    class PolyLineM(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.bounding_box = self._root.BoundingBoxXY(self._io, self, self._root)
            self.number_of_parts = self._io.read_s4le()
            self.number_of_points = self._io.read_s4le()
            self.parts = [None] * (self.number_of_parts)
            for i in range(self.number_of_parts):
                self.parts[i] = self._io.read_s4le()

            self.points = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.points[i] = self._root.Point(self._io, self, self._root)

            self.m_range = self._root.BoundsMinMax(self._io, self, self._root)
            self.m_values = [None] * (self.number_of_points)
            for i in range(self.number_of_points):
                self.m_values[i] = self._io.read_f8le()




