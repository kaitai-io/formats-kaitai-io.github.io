# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class ShapefileMain(KaitaiStruct):

    class PartType(IntEnum):
        triangle_strip = 0
        triangle_fan = 1
        outer_ring = 2
        inner_ring = 3
        first_ring = 4
        ring = 5

    class ShapeType(IntEnum):
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
        super(ShapefileMain, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.header = ShapefileMain.FileHeader(self._io, self, self._root)
        self.records = []
        i = 0
        while not self._io.is_eof():
            self.records.append(ShapefileMain.Record(self._io, self, self._root))
            i += 1



    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        for i in range(len(self.records)):
            pass
            self.records[i]._fetch_instances()


    class BoundingBoxXY(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ShapefileMain.BoundingBoxXY, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.x = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.y = ShapefileMain.BoundsMinMax(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.x._fetch_instances()
            self.y._fetch_instances()


    class BoundingBoxXYZM(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ShapefileMain.BoundingBoxXYZM, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.x = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.y = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.z = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.m = ShapefileMain.BoundsMinMax(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.x._fetch_instances()
            self.y._fetch_instances()
            self.z._fetch_instances()
            self.m._fetch_instances()


    class BoundsMinMax(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ShapefileMain.BoundsMinMax, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.min = self._io.read_f8le()
            self.max = self._io.read_f8le()


        def _fetch_instances(self):
            pass


    class FileHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ShapefileMain.FileHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.file_code = self._io.read_bytes(4)
            if not self.file_code == b"\x00\x00\x27\x0A":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x27\x0A", self.file_code, self._io, u"/types/file_header/seq/0")
            self.unused_field_1 = self._io.read_bytes(4)
            if not self.unused_field_1 == b"\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.unused_field_1, self._io, u"/types/file_header/seq/1")
            self.unused_field_2 = self._io.read_bytes(4)
            if not self.unused_field_2 == b"\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.unused_field_2, self._io, u"/types/file_header/seq/2")
            self.unused_field_3 = self._io.read_bytes(4)
            if not self.unused_field_3 == b"\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.unused_field_3, self._io, u"/types/file_header/seq/3")
            self.unused_field_4 = self._io.read_bytes(4)
            if not self.unused_field_4 == b"\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.unused_field_4, self._io, u"/types/file_header/seq/4")
            self.unused_field_5 = self._io.read_bytes(4)
            if not self.unused_field_5 == b"\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.unused_field_5, self._io, u"/types/file_header/seq/5")
            self.file_length = self._io.read_s4be()
            self.version = self._io.read_bytes(4)
            if not self.version == b"\xE8\x03\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\xE8\x03\x00\x00", self.version, self._io, u"/types/file_header/seq/7")
            self.shape_type = KaitaiStream.resolve_enum(ShapefileMain.ShapeType, self._io.read_s4le())
            self.bounding_box = ShapefileMain.BoundingBoxXYZM(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.bounding_box._fetch_instances()


    class MultiPatch(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ShapefileMain.MultiPatch, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
            self.number_of_parts = self._io.read_s4le()
            self.number_of_points = self._io.read_s4le()
            self.parts = []
            for i in range(self.number_of_parts):
                self.parts.append(self._io.read_s4le())

            self.part_types = []
            for i in range(self.number_of_parts):
                self.part_types.append(KaitaiStream.resolve_enum(ShapefileMain.PartType, self._io.read_s4le()))

            self.points = []
            for i in range(self.number_of_points):
                self.points.append(ShapefileMain.Point(self._io, self, self._root))

            self.z_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.z_values = []
            for i in range(self.number_of_points):
                self.z_values.append(self._io.read_f8le())

            self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.m_values = []
            for i in range(self.number_of_points):
                self.m_values.append(self._io.read_f8le())



        def _fetch_instances(self):
            pass
            self.bounding_box._fetch_instances()
            for i in range(len(self.parts)):
                pass

            for i in range(len(self.part_types)):
                pass

            for i in range(len(self.points)):
                pass
                self.points[i]._fetch_instances()

            self.z_range._fetch_instances()
            for i in range(len(self.z_values)):
                pass

            self.m_range._fetch_instances()
            for i in range(len(self.m_values)):
                pass



    class MultiPoint(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ShapefileMain.MultiPoint, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
            self.number_of_points = self._io.read_s4le()
            self.points = []
            for i in range(self.number_of_points):
                self.points.append(ShapefileMain.Point(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            self.bounding_box._fetch_instances()
            for i in range(len(self.points)):
                pass
                self.points[i]._fetch_instances()



    class MultiPointM(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ShapefileMain.MultiPointM, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
            self.number_of_points = self._io.read_s4le()
            self.points = []
            for i in range(self.number_of_points):
                self.points.append(ShapefileMain.Point(self._io, self, self._root))

            self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.m_values = []
            for i in range(self.number_of_points):
                self.m_values.append(self._io.read_f8le())



        def _fetch_instances(self):
            pass
            self.bounding_box._fetch_instances()
            for i in range(len(self.points)):
                pass
                self.points[i]._fetch_instances()

            self.m_range._fetch_instances()
            for i in range(len(self.m_values)):
                pass



    class MultiPointZ(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ShapefileMain.MultiPointZ, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
            self.number_of_points = self._io.read_s4le()
            self.points = []
            for i in range(self.number_of_points):
                self.points.append(ShapefileMain.Point(self._io, self, self._root))

            self.z_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.z_values = []
            for i in range(self.number_of_points):
                self.z_values.append(self._io.read_f8le())

            self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.m_values = []
            for i in range(self.number_of_points):
                self.m_values.append(self._io.read_f8le())



        def _fetch_instances(self):
            pass
            self.bounding_box._fetch_instances()
            for i in range(len(self.points)):
                pass
                self.points[i]._fetch_instances()

            self.z_range._fetch_instances()
            for i in range(len(self.z_values)):
                pass

            self.m_range._fetch_instances()
            for i in range(len(self.m_values)):
                pass



    class Point(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ShapefileMain.Point, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.x = self._io.read_f8le()
            self.y = self._io.read_f8le()


        def _fetch_instances(self):
            pass


    class PointM(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ShapefileMain.PointM, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.x = self._io.read_f8le()
            self.y = self._io.read_f8le()
            self.m = self._io.read_f8le()


        def _fetch_instances(self):
            pass


    class PointZ(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ShapefileMain.PointZ, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.x = self._io.read_f8le()
            self.y = self._io.read_f8le()
            self.z = self._io.read_f8le()
            self.m = self._io.read_f8le()


        def _fetch_instances(self):
            pass


    class PolyLine(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ShapefileMain.PolyLine, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
            self.number_of_parts = self._io.read_s4le()
            self.number_of_points = self._io.read_s4le()
            self.parts = []
            for i in range(self.number_of_parts):
                self.parts.append(self._io.read_s4le())

            self.points = []
            for i in range(self.number_of_points):
                self.points.append(ShapefileMain.Point(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            self.bounding_box._fetch_instances()
            for i in range(len(self.parts)):
                pass

            for i in range(len(self.points)):
                pass
                self.points[i]._fetch_instances()



    class PolyLineM(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ShapefileMain.PolyLineM, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
            self.number_of_parts = self._io.read_s4le()
            self.number_of_points = self._io.read_s4le()
            self.parts = []
            for i in range(self.number_of_parts):
                self.parts.append(self._io.read_s4le())

            self.points = []
            for i in range(self.number_of_points):
                self.points.append(ShapefileMain.Point(self._io, self, self._root))

            self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.m_values = []
            for i in range(self.number_of_points):
                self.m_values.append(self._io.read_f8le())



        def _fetch_instances(self):
            pass
            self.bounding_box._fetch_instances()
            for i in range(len(self.parts)):
                pass

            for i in range(len(self.points)):
                pass
                self.points[i]._fetch_instances()

            self.m_range._fetch_instances()
            for i in range(len(self.m_values)):
                pass



    class PolyLineZ(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ShapefileMain.PolyLineZ, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
            self.number_of_parts = self._io.read_s4le()
            self.number_of_points = self._io.read_s4le()
            self.parts = []
            for i in range(self.number_of_parts):
                self.parts.append(self._io.read_s4le())

            self.points = []
            for i in range(self.number_of_points):
                self.points.append(ShapefileMain.Point(self._io, self, self._root))

            self.z_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.z_values = []
            for i in range(self.number_of_points):
                self.z_values.append(self._io.read_f8le())

            self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.m_values = []
            for i in range(self.number_of_points):
                self.m_values.append(self._io.read_f8le())



        def _fetch_instances(self):
            pass
            self.bounding_box._fetch_instances()
            for i in range(len(self.parts)):
                pass

            for i in range(len(self.points)):
                pass
                self.points[i]._fetch_instances()

            self.z_range._fetch_instances()
            for i in range(len(self.z_values)):
                pass

            self.m_range._fetch_instances()
            for i in range(len(self.m_values)):
                pass



    class Polygon(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ShapefileMain.Polygon, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
            self.number_of_parts = self._io.read_s4le()
            self.number_of_points = self._io.read_s4le()
            self.parts = []
            for i in range(self.number_of_parts):
                self.parts.append(self._io.read_s4le())

            self.points = []
            for i in range(self.number_of_points):
                self.points.append(ShapefileMain.Point(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            self.bounding_box._fetch_instances()
            for i in range(len(self.parts)):
                pass

            for i in range(len(self.points)):
                pass
                self.points[i]._fetch_instances()



    class PolygonM(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ShapefileMain.PolygonM, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
            self.number_of_parts = self._io.read_s4le()
            self.number_of_points = self._io.read_s4le()
            self.parts = []
            for i in range(self.number_of_parts):
                self.parts.append(self._io.read_s4le())

            self.points = []
            for i in range(self.number_of_points):
                self.points.append(ShapefileMain.Point(self._io, self, self._root))

            self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.m_values = []
            for i in range(self.number_of_points):
                self.m_values.append(self._io.read_f8le())



        def _fetch_instances(self):
            pass
            self.bounding_box._fetch_instances()
            for i in range(len(self.parts)):
                pass

            for i in range(len(self.points)):
                pass
                self.points[i]._fetch_instances()

            self.m_range._fetch_instances()
            for i in range(len(self.m_values)):
                pass



    class PolygonZ(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ShapefileMain.PolygonZ, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
            self.number_of_parts = self._io.read_s4le()
            self.number_of_points = self._io.read_s4le()
            self.parts = []
            for i in range(self.number_of_parts):
                self.parts.append(self._io.read_s4le())

            self.points = []
            for i in range(self.number_of_points):
                self.points.append(ShapefileMain.Point(self._io, self, self._root))

            self.z_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.z_values = []
            for i in range(self.number_of_points):
                self.z_values.append(self._io.read_f8le())

            self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.m_values = []
            for i in range(self.number_of_points):
                self.m_values.append(self._io.read_f8le())



        def _fetch_instances(self):
            pass
            self.bounding_box._fetch_instances()
            for i in range(len(self.parts)):
                pass

            for i in range(len(self.points)):
                pass
                self.points[i]._fetch_instances()

            self.z_range._fetch_instances()
            for i in range(len(self.z_values)):
                pass

            self.m_range._fetch_instances()
            for i in range(len(self.m_values)):
                pass



    class Record(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ShapefileMain.Record, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.header = ShapefileMain.RecordHeader(self._io, self, self._root)
            self.contents = ShapefileMain.RecordContents(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.header._fetch_instances()
            self.contents._fetch_instances()


    class RecordContents(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ShapefileMain.RecordContents, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.shape_type = KaitaiStream.resolve_enum(ShapefileMain.ShapeType, self._io.read_s4le())
            if self.shape_type != ShapefileMain.ShapeType.null_shape:
                pass
                _on = self.shape_type
                if _on == ShapefileMain.ShapeType.multi_patch:
                    pass
                    self.shape_parameters = ShapefileMain.MultiPatch(self._io, self, self._root)
                elif _on == ShapefileMain.ShapeType.multi_point:
                    pass
                    self.shape_parameters = ShapefileMain.MultiPoint(self._io, self, self._root)
                elif _on == ShapefileMain.ShapeType.multi_point_m:
                    pass
                    self.shape_parameters = ShapefileMain.MultiPointM(self._io, self, self._root)
                elif _on == ShapefileMain.ShapeType.multi_point_z:
                    pass
                    self.shape_parameters = ShapefileMain.MultiPointZ(self._io, self, self._root)
                elif _on == ShapefileMain.ShapeType.point:
                    pass
                    self.shape_parameters = ShapefileMain.Point(self._io, self, self._root)
                elif _on == ShapefileMain.ShapeType.point_m:
                    pass
                    self.shape_parameters = ShapefileMain.PointM(self._io, self, self._root)
                elif _on == ShapefileMain.ShapeType.point_z:
                    pass
                    self.shape_parameters = ShapefileMain.PointZ(self._io, self, self._root)
                elif _on == ShapefileMain.ShapeType.poly_line:
                    pass
                    self.shape_parameters = ShapefileMain.PolyLine(self._io, self, self._root)
                elif _on == ShapefileMain.ShapeType.poly_line_m:
                    pass
                    self.shape_parameters = ShapefileMain.PolyLineM(self._io, self, self._root)
                elif _on == ShapefileMain.ShapeType.poly_line_z:
                    pass
                    self.shape_parameters = ShapefileMain.PolyLineZ(self._io, self, self._root)
                elif _on == ShapefileMain.ShapeType.polygon:
                    pass
                    self.shape_parameters = ShapefileMain.Polygon(self._io, self, self._root)
                elif _on == ShapefileMain.ShapeType.polygon_m:
                    pass
                    self.shape_parameters = ShapefileMain.PolygonM(self._io, self, self._root)
                elif _on == ShapefileMain.ShapeType.polygon_z:
                    pass
                    self.shape_parameters = ShapefileMain.PolygonZ(self._io, self, self._root)



        def _fetch_instances(self):
            pass
            if self.shape_type != ShapefileMain.ShapeType.null_shape:
                pass
                _on = self.shape_type
                if _on == ShapefileMain.ShapeType.multi_patch:
                    pass
                    self.shape_parameters._fetch_instances()
                elif _on == ShapefileMain.ShapeType.multi_point:
                    pass
                    self.shape_parameters._fetch_instances()
                elif _on == ShapefileMain.ShapeType.multi_point_m:
                    pass
                    self.shape_parameters._fetch_instances()
                elif _on == ShapefileMain.ShapeType.multi_point_z:
                    pass
                    self.shape_parameters._fetch_instances()
                elif _on == ShapefileMain.ShapeType.point:
                    pass
                    self.shape_parameters._fetch_instances()
                elif _on == ShapefileMain.ShapeType.point_m:
                    pass
                    self.shape_parameters._fetch_instances()
                elif _on == ShapefileMain.ShapeType.point_z:
                    pass
                    self.shape_parameters._fetch_instances()
                elif _on == ShapefileMain.ShapeType.poly_line:
                    pass
                    self.shape_parameters._fetch_instances()
                elif _on == ShapefileMain.ShapeType.poly_line_m:
                    pass
                    self.shape_parameters._fetch_instances()
                elif _on == ShapefileMain.ShapeType.poly_line_z:
                    pass
                    self.shape_parameters._fetch_instances()
                elif _on == ShapefileMain.ShapeType.polygon:
                    pass
                    self.shape_parameters._fetch_instances()
                elif _on == ShapefileMain.ShapeType.polygon_m:
                    pass
                    self.shape_parameters._fetch_instances()
                elif _on == ShapefileMain.ShapeType.polygon_z:
                    pass
                    self.shape_parameters._fetch_instances()



    class RecordHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ShapefileMain.RecordHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.record_number = self._io.read_s4be()
            self.content_length = self._io.read_s4be()


        def _fetch_instances(self):
            pass



