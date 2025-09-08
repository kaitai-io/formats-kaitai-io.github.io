# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class ShapefileMain(ReadWriteKaitaiStruct):

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
    def __init__(self, _io=None, _parent=None, _root=None):
        super(ShapefileMain, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header = ShapefileMain.FileHeader(self._io, self, self._root)
        self.header._read()
        self.records = []
        i = 0
        while not self._io.is_eof():
            _t_records = ShapefileMain.Record(self._io, self, self._root)
            try:
                _t_records._read()
            finally:
                self.records.append(_t_records)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        for i in range(len(self.records)):
            pass
            self.records[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(ShapefileMain, self)._write__seq(io)
        self.header._write__seq(self._io)
        for i in range(len(self.records)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"records", 0, self._io.size() - self._io.pos())
            self.records[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"records", 0, self._io.size() - self._io.pos())


    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        for i in range(len(self.records)):
            pass
            if self.records[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"records", self._root, self.records[i]._root)
            if self.records[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"records", self, self.records[i]._parent)

        self._dirty = False

    class BoundingBoxXY(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileMain.BoundingBoxXY, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.x = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.x._read()
            self.y = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.y._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.x._fetch_instances()
            self.y._fetch_instances()


        def _write__seq(self, io=None):
            super(ShapefileMain.BoundingBoxXY, self)._write__seq(io)
            self.x._write__seq(self._io)
            self.y._write__seq(self._io)


        def _check(self):
            if self.x._root != self._root:
                raise kaitaistruct.ConsistencyError(u"x", self._root, self.x._root)
            if self.x._parent != self:
                raise kaitaistruct.ConsistencyError(u"x", self, self.x._parent)
            if self.y._root != self._root:
                raise kaitaistruct.ConsistencyError(u"y", self._root, self.y._root)
            if self.y._parent != self:
                raise kaitaistruct.ConsistencyError(u"y", self, self.y._parent)
            self._dirty = False


    class BoundingBoxXYZM(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileMain.BoundingBoxXYZM, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.x = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.x._read()
            self.y = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.y._read()
            self.z = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.z._read()
            self.m = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.m._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.x._fetch_instances()
            self.y._fetch_instances()
            self.z._fetch_instances()
            self.m._fetch_instances()


        def _write__seq(self, io=None):
            super(ShapefileMain.BoundingBoxXYZM, self)._write__seq(io)
            self.x._write__seq(self._io)
            self.y._write__seq(self._io)
            self.z._write__seq(self._io)
            self.m._write__seq(self._io)


        def _check(self):
            if self.x._root != self._root:
                raise kaitaistruct.ConsistencyError(u"x", self._root, self.x._root)
            if self.x._parent != self:
                raise kaitaistruct.ConsistencyError(u"x", self, self.x._parent)
            if self.y._root != self._root:
                raise kaitaistruct.ConsistencyError(u"y", self._root, self.y._root)
            if self.y._parent != self:
                raise kaitaistruct.ConsistencyError(u"y", self, self.y._parent)
            if self.z._root != self._root:
                raise kaitaistruct.ConsistencyError(u"z", self._root, self.z._root)
            if self.z._parent != self:
                raise kaitaistruct.ConsistencyError(u"z", self, self.z._parent)
            if self.m._root != self._root:
                raise kaitaistruct.ConsistencyError(u"m", self._root, self.m._root)
            if self.m._parent != self:
                raise kaitaistruct.ConsistencyError(u"m", self, self.m._parent)
            self._dirty = False


    class BoundsMinMax(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileMain.BoundsMinMax, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.min = self._io.read_f8le()
            self.max = self._io.read_f8le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(ShapefileMain.BoundsMinMax, self)._write__seq(io)
            self._io.write_f8le(self.min)
            self._io.write_f8le(self.max)


        def _check(self):
            self._dirty = False


    class FileHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileMain.FileHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

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
            self.bounding_box._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.bounding_box._fetch_instances()


        def _write__seq(self, io=None):
            super(ShapefileMain.FileHeader, self)._write__seq(io)
            self._io.write_bytes(self.file_code)
            self._io.write_bytes(self.unused_field_1)
            self._io.write_bytes(self.unused_field_2)
            self._io.write_bytes(self.unused_field_3)
            self._io.write_bytes(self.unused_field_4)
            self._io.write_bytes(self.unused_field_5)
            self._io.write_s4be(self.file_length)
            self._io.write_bytes(self.version)
            self._io.write_s4le(int(self.shape_type))
            self.bounding_box._write__seq(self._io)


        def _check(self):
            if len(self.file_code) != 4:
                raise kaitaistruct.ConsistencyError(u"file_code", 4, len(self.file_code))
            if not self.file_code == b"\x00\x00\x27\x0A":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x27\x0A", self.file_code, None, u"/types/file_header/seq/0")
            if len(self.unused_field_1) != 4:
                raise kaitaistruct.ConsistencyError(u"unused_field_1", 4, len(self.unused_field_1))
            if not self.unused_field_1 == b"\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.unused_field_1, None, u"/types/file_header/seq/1")
            if len(self.unused_field_2) != 4:
                raise kaitaistruct.ConsistencyError(u"unused_field_2", 4, len(self.unused_field_2))
            if not self.unused_field_2 == b"\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.unused_field_2, None, u"/types/file_header/seq/2")
            if len(self.unused_field_3) != 4:
                raise kaitaistruct.ConsistencyError(u"unused_field_3", 4, len(self.unused_field_3))
            if not self.unused_field_3 == b"\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.unused_field_3, None, u"/types/file_header/seq/3")
            if len(self.unused_field_4) != 4:
                raise kaitaistruct.ConsistencyError(u"unused_field_4", 4, len(self.unused_field_4))
            if not self.unused_field_4 == b"\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.unused_field_4, None, u"/types/file_header/seq/4")
            if len(self.unused_field_5) != 4:
                raise kaitaistruct.ConsistencyError(u"unused_field_5", 4, len(self.unused_field_5))
            if not self.unused_field_5 == b"\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.unused_field_5, None, u"/types/file_header/seq/5")
            if len(self.version) != 4:
                raise kaitaistruct.ConsistencyError(u"version", 4, len(self.version))
            if not self.version == b"\xE8\x03\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\xE8\x03\x00\x00", self.version, None, u"/types/file_header/seq/7")
            if self.bounding_box._root != self._root:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self._root, self.bounding_box._root)
            if self.bounding_box._parent != self:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self, self.bounding_box._parent)
            self._dirty = False


    class MultiPatch(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileMain.MultiPatch, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
            self.bounding_box._read()
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
                _t_points = ShapefileMain.Point(self._io, self, self._root)
                try:
                    _t_points._read()
                finally:
                    self.points.append(_t_points)

            self.z_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.z_range._read()
            self.z_values = []
            for i in range(self.number_of_points):
                self.z_values.append(self._io.read_f8le())

            self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.m_range._read()
            self.m_values = []
            for i in range(self.number_of_points):
                self.m_values.append(self._io.read_f8le())

            self._dirty = False


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



        def _write__seq(self, io=None):
            super(ShapefileMain.MultiPatch, self)._write__seq(io)
            self.bounding_box._write__seq(self._io)
            self._io.write_s4le(self.number_of_parts)
            self._io.write_s4le(self.number_of_points)
            for i in range(len(self.parts)):
                pass
                self._io.write_s4le(self.parts[i])

            for i in range(len(self.part_types)):
                pass
                self._io.write_s4le(int(self.part_types[i]))

            for i in range(len(self.points)):
                pass
                self.points[i]._write__seq(self._io)

            self.z_range._write__seq(self._io)
            for i in range(len(self.z_values)):
                pass
                self._io.write_f8le(self.z_values[i])

            self.m_range._write__seq(self._io)
            for i in range(len(self.m_values)):
                pass
                self._io.write_f8le(self.m_values[i])



        def _check(self):
            if self.bounding_box._root != self._root:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self._root, self.bounding_box._root)
            if self.bounding_box._parent != self:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self, self.bounding_box._parent)
            if len(self.parts) != self.number_of_parts:
                raise kaitaistruct.ConsistencyError(u"parts", self.number_of_parts, len(self.parts))
            for i in range(len(self.parts)):
                pass

            if len(self.part_types) != self.number_of_parts:
                raise kaitaistruct.ConsistencyError(u"part_types", self.number_of_parts, len(self.part_types))
            for i in range(len(self.part_types)):
                pass

            if len(self.points) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"points", self.number_of_points, len(self.points))
            for i in range(len(self.points)):
                pass
                if self.points[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"points", self._root, self.points[i]._root)
                if self.points[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"points", self, self.points[i]._parent)

            if self.z_range._root != self._root:
                raise kaitaistruct.ConsistencyError(u"z_range", self._root, self.z_range._root)
            if self.z_range._parent != self:
                raise kaitaistruct.ConsistencyError(u"z_range", self, self.z_range._parent)
            if len(self.z_values) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"z_values", self.number_of_points, len(self.z_values))
            for i in range(len(self.z_values)):
                pass

            if self.m_range._root != self._root:
                raise kaitaistruct.ConsistencyError(u"m_range", self._root, self.m_range._root)
            if self.m_range._parent != self:
                raise kaitaistruct.ConsistencyError(u"m_range", self, self.m_range._parent)
            if len(self.m_values) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"m_values", self.number_of_points, len(self.m_values))
            for i in range(len(self.m_values)):
                pass

            self._dirty = False


    class MultiPoint(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileMain.MultiPoint, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
            self.bounding_box._read()
            self.number_of_points = self._io.read_s4le()
            self.points = []
            for i in range(self.number_of_points):
                _t_points = ShapefileMain.Point(self._io, self, self._root)
                try:
                    _t_points._read()
                finally:
                    self.points.append(_t_points)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.bounding_box._fetch_instances()
            for i in range(len(self.points)):
                pass
                self.points[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(ShapefileMain.MultiPoint, self)._write__seq(io)
            self.bounding_box._write__seq(self._io)
            self._io.write_s4le(self.number_of_points)
            for i in range(len(self.points)):
                pass
                self.points[i]._write__seq(self._io)



        def _check(self):
            if self.bounding_box._root != self._root:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self._root, self.bounding_box._root)
            if self.bounding_box._parent != self:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self, self.bounding_box._parent)
            if len(self.points) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"points", self.number_of_points, len(self.points))
            for i in range(len(self.points)):
                pass
                if self.points[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"points", self._root, self.points[i]._root)
                if self.points[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"points", self, self.points[i]._parent)

            self._dirty = False


    class MultiPointM(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileMain.MultiPointM, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
            self.bounding_box._read()
            self.number_of_points = self._io.read_s4le()
            self.points = []
            for i in range(self.number_of_points):
                _t_points = ShapefileMain.Point(self._io, self, self._root)
                try:
                    _t_points._read()
                finally:
                    self.points.append(_t_points)

            self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.m_range._read()
            self.m_values = []
            for i in range(self.number_of_points):
                self.m_values.append(self._io.read_f8le())

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.bounding_box._fetch_instances()
            for i in range(len(self.points)):
                pass
                self.points[i]._fetch_instances()

            self.m_range._fetch_instances()
            for i in range(len(self.m_values)):
                pass



        def _write__seq(self, io=None):
            super(ShapefileMain.MultiPointM, self)._write__seq(io)
            self.bounding_box._write__seq(self._io)
            self._io.write_s4le(self.number_of_points)
            for i in range(len(self.points)):
                pass
                self.points[i]._write__seq(self._io)

            self.m_range._write__seq(self._io)
            for i in range(len(self.m_values)):
                pass
                self._io.write_f8le(self.m_values[i])



        def _check(self):
            if self.bounding_box._root != self._root:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self._root, self.bounding_box._root)
            if self.bounding_box._parent != self:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self, self.bounding_box._parent)
            if len(self.points) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"points", self.number_of_points, len(self.points))
            for i in range(len(self.points)):
                pass
                if self.points[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"points", self._root, self.points[i]._root)
                if self.points[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"points", self, self.points[i]._parent)

            if self.m_range._root != self._root:
                raise kaitaistruct.ConsistencyError(u"m_range", self._root, self.m_range._root)
            if self.m_range._parent != self:
                raise kaitaistruct.ConsistencyError(u"m_range", self, self.m_range._parent)
            if len(self.m_values) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"m_values", self.number_of_points, len(self.m_values))
            for i in range(len(self.m_values)):
                pass

            self._dirty = False


    class MultiPointZ(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileMain.MultiPointZ, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
            self.bounding_box._read()
            self.number_of_points = self._io.read_s4le()
            self.points = []
            for i in range(self.number_of_points):
                _t_points = ShapefileMain.Point(self._io, self, self._root)
                try:
                    _t_points._read()
                finally:
                    self.points.append(_t_points)

            self.z_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.z_range._read()
            self.z_values = []
            for i in range(self.number_of_points):
                self.z_values.append(self._io.read_f8le())

            self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.m_range._read()
            self.m_values = []
            for i in range(self.number_of_points):
                self.m_values.append(self._io.read_f8le())

            self._dirty = False


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



        def _write__seq(self, io=None):
            super(ShapefileMain.MultiPointZ, self)._write__seq(io)
            self.bounding_box._write__seq(self._io)
            self._io.write_s4le(self.number_of_points)
            for i in range(len(self.points)):
                pass
                self.points[i]._write__seq(self._io)

            self.z_range._write__seq(self._io)
            for i in range(len(self.z_values)):
                pass
                self._io.write_f8le(self.z_values[i])

            self.m_range._write__seq(self._io)
            for i in range(len(self.m_values)):
                pass
                self._io.write_f8le(self.m_values[i])



        def _check(self):
            if self.bounding_box._root != self._root:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self._root, self.bounding_box._root)
            if self.bounding_box._parent != self:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self, self.bounding_box._parent)
            if len(self.points) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"points", self.number_of_points, len(self.points))
            for i in range(len(self.points)):
                pass
                if self.points[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"points", self._root, self.points[i]._root)
                if self.points[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"points", self, self.points[i]._parent)

            if self.z_range._root != self._root:
                raise kaitaistruct.ConsistencyError(u"z_range", self._root, self.z_range._root)
            if self.z_range._parent != self:
                raise kaitaistruct.ConsistencyError(u"z_range", self, self.z_range._parent)
            if len(self.z_values) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"z_values", self.number_of_points, len(self.z_values))
            for i in range(len(self.z_values)):
                pass

            if self.m_range._root != self._root:
                raise kaitaistruct.ConsistencyError(u"m_range", self._root, self.m_range._root)
            if self.m_range._parent != self:
                raise kaitaistruct.ConsistencyError(u"m_range", self, self.m_range._parent)
            if len(self.m_values) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"m_values", self.number_of_points, len(self.m_values))
            for i in range(len(self.m_values)):
                pass

            self._dirty = False


    class Point(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileMain.Point, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.x = self._io.read_f8le()
            self.y = self._io.read_f8le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(ShapefileMain.Point, self)._write__seq(io)
            self._io.write_f8le(self.x)
            self._io.write_f8le(self.y)


        def _check(self):
            self._dirty = False


    class PointM(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileMain.PointM, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.x = self._io.read_f8le()
            self.y = self._io.read_f8le()
            self.m = self._io.read_f8le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(ShapefileMain.PointM, self)._write__seq(io)
            self._io.write_f8le(self.x)
            self._io.write_f8le(self.y)
            self._io.write_f8le(self.m)


        def _check(self):
            self._dirty = False


    class PointZ(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileMain.PointZ, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.x = self._io.read_f8le()
            self.y = self._io.read_f8le()
            self.z = self._io.read_f8le()
            self.m = self._io.read_f8le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(ShapefileMain.PointZ, self)._write__seq(io)
            self._io.write_f8le(self.x)
            self._io.write_f8le(self.y)
            self._io.write_f8le(self.z)
            self._io.write_f8le(self.m)


        def _check(self):
            self._dirty = False


    class PolyLine(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileMain.PolyLine, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
            self.bounding_box._read()
            self.number_of_parts = self._io.read_s4le()
            self.number_of_points = self._io.read_s4le()
            self.parts = []
            for i in range(self.number_of_parts):
                self.parts.append(self._io.read_s4le())

            self.points = []
            for i in range(self.number_of_points):
                _t_points = ShapefileMain.Point(self._io, self, self._root)
                try:
                    _t_points._read()
                finally:
                    self.points.append(_t_points)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.bounding_box._fetch_instances()
            for i in range(len(self.parts)):
                pass

            for i in range(len(self.points)):
                pass
                self.points[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(ShapefileMain.PolyLine, self)._write__seq(io)
            self.bounding_box._write__seq(self._io)
            self._io.write_s4le(self.number_of_parts)
            self._io.write_s4le(self.number_of_points)
            for i in range(len(self.parts)):
                pass
                self._io.write_s4le(self.parts[i])

            for i in range(len(self.points)):
                pass
                self.points[i]._write__seq(self._io)



        def _check(self):
            if self.bounding_box._root != self._root:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self._root, self.bounding_box._root)
            if self.bounding_box._parent != self:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self, self.bounding_box._parent)
            if len(self.parts) != self.number_of_parts:
                raise kaitaistruct.ConsistencyError(u"parts", self.number_of_parts, len(self.parts))
            for i in range(len(self.parts)):
                pass

            if len(self.points) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"points", self.number_of_points, len(self.points))
            for i in range(len(self.points)):
                pass
                if self.points[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"points", self._root, self.points[i]._root)
                if self.points[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"points", self, self.points[i]._parent)

            self._dirty = False


    class PolyLineM(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileMain.PolyLineM, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
            self.bounding_box._read()
            self.number_of_parts = self._io.read_s4le()
            self.number_of_points = self._io.read_s4le()
            self.parts = []
            for i in range(self.number_of_parts):
                self.parts.append(self._io.read_s4le())

            self.points = []
            for i in range(self.number_of_points):
                _t_points = ShapefileMain.Point(self._io, self, self._root)
                try:
                    _t_points._read()
                finally:
                    self.points.append(_t_points)

            self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.m_range._read()
            self.m_values = []
            for i in range(self.number_of_points):
                self.m_values.append(self._io.read_f8le())

            self._dirty = False


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



        def _write__seq(self, io=None):
            super(ShapefileMain.PolyLineM, self)._write__seq(io)
            self.bounding_box._write__seq(self._io)
            self._io.write_s4le(self.number_of_parts)
            self._io.write_s4le(self.number_of_points)
            for i in range(len(self.parts)):
                pass
                self._io.write_s4le(self.parts[i])

            for i in range(len(self.points)):
                pass
                self.points[i]._write__seq(self._io)

            self.m_range._write__seq(self._io)
            for i in range(len(self.m_values)):
                pass
                self._io.write_f8le(self.m_values[i])



        def _check(self):
            if self.bounding_box._root != self._root:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self._root, self.bounding_box._root)
            if self.bounding_box._parent != self:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self, self.bounding_box._parent)
            if len(self.parts) != self.number_of_parts:
                raise kaitaistruct.ConsistencyError(u"parts", self.number_of_parts, len(self.parts))
            for i in range(len(self.parts)):
                pass

            if len(self.points) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"points", self.number_of_points, len(self.points))
            for i in range(len(self.points)):
                pass
                if self.points[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"points", self._root, self.points[i]._root)
                if self.points[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"points", self, self.points[i]._parent)

            if self.m_range._root != self._root:
                raise kaitaistruct.ConsistencyError(u"m_range", self._root, self.m_range._root)
            if self.m_range._parent != self:
                raise kaitaistruct.ConsistencyError(u"m_range", self, self.m_range._parent)
            if len(self.m_values) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"m_values", self.number_of_points, len(self.m_values))
            for i in range(len(self.m_values)):
                pass

            self._dirty = False


    class PolyLineZ(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileMain.PolyLineZ, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
            self.bounding_box._read()
            self.number_of_parts = self._io.read_s4le()
            self.number_of_points = self._io.read_s4le()
            self.parts = []
            for i in range(self.number_of_parts):
                self.parts.append(self._io.read_s4le())

            self.points = []
            for i in range(self.number_of_points):
                _t_points = ShapefileMain.Point(self._io, self, self._root)
                try:
                    _t_points._read()
                finally:
                    self.points.append(_t_points)

            self.z_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.z_range._read()
            self.z_values = []
            for i in range(self.number_of_points):
                self.z_values.append(self._io.read_f8le())

            self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.m_range._read()
            self.m_values = []
            for i in range(self.number_of_points):
                self.m_values.append(self._io.read_f8le())

            self._dirty = False


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



        def _write__seq(self, io=None):
            super(ShapefileMain.PolyLineZ, self)._write__seq(io)
            self.bounding_box._write__seq(self._io)
            self._io.write_s4le(self.number_of_parts)
            self._io.write_s4le(self.number_of_points)
            for i in range(len(self.parts)):
                pass
                self._io.write_s4le(self.parts[i])

            for i in range(len(self.points)):
                pass
                self.points[i]._write__seq(self._io)

            self.z_range._write__seq(self._io)
            for i in range(len(self.z_values)):
                pass
                self._io.write_f8le(self.z_values[i])

            self.m_range._write__seq(self._io)
            for i in range(len(self.m_values)):
                pass
                self._io.write_f8le(self.m_values[i])



        def _check(self):
            if self.bounding_box._root != self._root:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self._root, self.bounding_box._root)
            if self.bounding_box._parent != self:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self, self.bounding_box._parent)
            if len(self.parts) != self.number_of_parts:
                raise kaitaistruct.ConsistencyError(u"parts", self.number_of_parts, len(self.parts))
            for i in range(len(self.parts)):
                pass

            if len(self.points) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"points", self.number_of_points, len(self.points))
            for i in range(len(self.points)):
                pass
                if self.points[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"points", self._root, self.points[i]._root)
                if self.points[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"points", self, self.points[i]._parent)

            if self.z_range._root != self._root:
                raise kaitaistruct.ConsistencyError(u"z_range", self._root, self.z_range._root)
            if self.z_range._parent != self:
                raise kaitaistruct.ConsistencyError(u"z_range", self, self.z_range._parent)
            if len(self.z_values) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"z_values", self.number_of_points, len(self.z_values))
            for i in range(len(self.z_values)):
                pass

            if self.m_range._root != self._root:
                raise kaitaistruct.ConsistencyError(u"m_range", self._root, self.m_range._root)
            if self.m_range._parent != self:
                raise kaitaistruct.ConsistencyError(u"m_range", self, self.m_range._parent)
            if len(self.m_values) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"m_values", self.number_of_points, len(self.m_values))
            for i in range(len(self.m_values)):
                pass

            self._dirty = False


    class Polygon(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileMain.Polygon, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
            self.bounding_box._read()
            self.number_of_parts = self._io.read_s4le()
            self.number_of_points = self._io.read_s4le()
            self.parts = []
            for i in range(self.number_of_parts):
                self.parts.append(self._io.read_s4le())

            self.points = []
            for i in range(self.number_of_points):
                _t_points = ShapefileMain.Point(self._io, self, self._root)
                try:
                    _t_points._read()
                finally:
                    self.points.append(_t_points)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.bounding_box._fetch_instances()
            for i in range(len(self.parts)):
                pass

            for i in range(len(self.points)):
                pass
                self.points[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(ShapefileMain.Polygon, self)._write__seq(io)
            self.bounding_box._write__seq(self._io)
            self._io.write_s4le(self.number_of_parts)
            self._io.write_s4le(self.number_of_points)
            for i in range(len(self.parts)):
                pass
                self._io.write_s4le(self.parts[i])

            for i in range(len(self.points)):
                pass
                self.points[i]._write__seq(self._io)



        def _check(self):
            if self.bounding_box._root != self._root:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self._root, self.bounding_box._root)
            if self.bounding_box._parent != self:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self, self.bounding_box._parent)
            if len(self.parts) != self.number_of_parts:
                raise kaitaistruct.ConsistencyError(u"parts", self.number_of_parts, len(self.parts))
            for i in range(len(self.parts)):
                pass

            if len(self.points) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"points", self.number_of_points, len(self.points))
            for i in range(len(self.points)):
                pass
                if self.points[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"points", self._root, self.points[i]._root)
                if self.points[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"points", self, self.points[i]._parent)

            self._dirty = False


    class PolygonM(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileMain.PolygonM, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
            self.bounding_box._read()
            self.number_of_parts = self._io.read_s4le()
            self.number_of_points = self._io.read_s4le()
            self.parts = []
            for i in range(self.number_of_parts):
                self.parts.append(self._io.read_s4le())

            self.points = []
            for i in range(self.number_of_points):
                _t_points = ShapefileMain.Point(self._io, self, self._root)
                try:
                    _t_points._read()
                finally:
                    self.points.append(_t_points)

            self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.m_range._read()
            self.m_values = []
            for i in range(self.number_of_points):
                self.m_values.append(self._io.read_f8le())

            self._dirty = False


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



        def _write__seq(self, io=None):
            super(ShapefileMain.PolygonM, self)._write__seq(io)
            self.bounding_box._write__seq(self._io)
            self._io.write_s4le(self.number_of_parts)
            self._io.write_s4le(self.number_of_points)
            for i in range(len(self.parts)):
                pass
                self._io.write_s4le(self.parts[i])

            for i in range(len(self.points)):
                pass
                self.points[i]._write__seq(self._io)

            self.m_range._write__seq(self._io)
            for i in range(len(self.m_values)):
                pass
                self._io.write_f8le(self.m_values[i])



        def _check(self):
            if self.bounding_box._root != self._root:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self._root, self.bounding_box._root)
            if self.bounding_box._parent != self:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self, self.bounding_box._parent)
            if len(self.parts) != self.number_of_parts:
                raise kaitaistruct.ConsistencyError(u"parts", self.number_of_parts, len(self.parts))
            for i in range(len(self.parts)):
                pass

            if len(self.points) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"points", self.number_of_points, len(self.points))
            for i in range(len(self.points)):
                pass
                if self.points[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"points", self._root, self.points[i]._root)
                if self.points[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"points", self, self.points[i]._parent)

            if self.m_range._root != self._root:
                raise kaitaistruct.ConsistencyError(u"m_range", self._root, self.m_range._root)
            if self.m_range._parent != self:
                raise kaitaistruct.ConsistencyError(u"m_range", self, self.m_range._parent)
            if len(self.m_values) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"m_values", self.number_of_points, len(self.m_values))
            for i in range(len(self.m_values)):
                pass

            self._dirty = False


    class PolygonZ(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileMain.PolygonZ, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.bounding_box = ShapefileMain.BoundingBoxXY(self._io, self, self._root)
            self.bounding_box._read()
            self.number_of_parts = self._io.read_s4le()
            self.number_of_points = self._io.read_s4le()
            self.parts = []
            for i in range(self.number_of_parts):
                self.parts.append(self._io.read_s4le())

            self.points = []
            for i in range(self.number_of_points):
                _t_points = ShapefileMain.Point(self._io, self, self._root)
                try:
                    _t_points._read()
                finally:
                    self.points.append(_t_points)

            self.z_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.z_range._read()
            self.z_values = []
            for i in range(self.number_of_points):
                self.z_values.append(self._io.read_f8le())

            self.m_range = ShapefileMain.BoundsMinMax(self._io, self, self._root)
            self.m_range._read()
            self.m_values = []
            for i in range(self.number_of_points):
                self.m_values.append(self._io.read_f8le())

            self._dirty = False


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



        def _write__seq(self, io=None):
            super(ShapefileMain.PolygonZ, self)._write__seq(io)
            self.bounding_box._write__seq(self._io)
            self._io.write_s4le(self.number_of_parts)
            self._io.write_s4le(self.number_of_points)
            for i in range(len(self.parts)):
                pass
                self._io.write_s4le(self.parts[i])

            for i in range(len(self.points)):
                pass
                self.points[i]._write__seq(self._io)

            self.z_range._write__seq(self._io)
            for i in range(len(self.z_values)):
                pass
                self._io.write_f8le(self.z_values[i])

            self.m_range._write__seq(self._io)
            for i in range(len(self.m_values)):
                pass
                self._io.write_f8le(self.m_values[i])



        def _check(self):
            if self.bounding_box._root != self._root:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self._root, self.bounding_box._root)
            if self.bounding_box._parent != self:
                raise kaitaistruct.ConsistencyError(u"bounding_box", self, self.bounding_box._parent)
            if len(self.parts) != self.number_of_parts:
                raise kaitaistruct.ConsistencyError(u"parts", self.number_of_parts, len(self.parts))
            for i in range(len(self.parts)):
                pass

            if len(self.points) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"points", self.number_of_points, len(self.points))
            for i in range(len(self.points)):
                pass
                if self.points[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"points", self._root, self.points[i]._root)
                if self.points[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"points", self, self.points[i]._parent)

            if self.z_range._root != self._root:
                raise kaitaistruct.ConsistencyError(u"z_range", self._root, self.z_range._root)
            if self.z_range._parent != self:
                raise kaitaistruct.ConsistencyError(u"z_range", self, self.z_range._parent)
            if len(self.z_values) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"z_values", self.number_of_points, len(self.z_values))
            for i in range(len(self.z_values)):
                pass

            if self.m_range._root != self._root:
                raise kaitaistruct.ConsistencyError(u"m_range", self._root, self.m_range._root)
            if self.m_range._parent != self:
                raise kaitaistruct.ConsistencyError(u"m_range", self, self.m_range._parent)
            if len(self.m_values) != self.number_of_points:
                raise kaitaistruct.ConsistencyError(u"m_values", self.number_of_points, len(self.m_values))
            for i in range(len(self.m_values)):
                pass

            self._dirty = False


    class Record(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileMain.Record, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.header = ShapefileMain.RecordHeader(self._io, self, self._root)
            self.header._read()
            self.contents = ShapefileMain.RecordContents(self._io, self, self._root)
            self.contents._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.header._fetch_instances()
            self.contents._fetch_instances()


        def _write__seq(self, io=None):
            super(ShapefileMain.Record, self)._write__seq(io)
            self.header._write__seq(self._io)
            self.contents._write__seq(self._io)


        def _check(self):
            if self.header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
            if self.header._parent != self:
                raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            if self.contents._root != self._root:
                raise kaitaistruct.ConsistencyError(u"contents", self._root, self.contents._root)
            if self.contents._parent != self:
                raise kaitaistruct.ConsistencyError(u"contents", self, self.contents._parent)
            self._dirty = False


    class RecordContents(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileMain.RecordContents, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.shape_type = KaitaiStream.resolve_enum(ShapefileMain.ShapeType, self._io.read_s4le())
            if self.shape_type != ShapefileMain.ShapeType.null_shape:
                pass
                _on = self.shape_type
                if _on == ShapefileMain.ShapeType.multi_patch:
                    pass
                    self.shape_parameters = ShapefileMain.MultiPatch(self._io, self, self._root)
                    self.shape_parameters._read()
                elif _on == ShapefileMain.ShapeType.multi_point:
                    pass
                    self.shape_parameters = ShapefileMain.MultiPoint(self._io, self, self._root)
                    self.shape_parameters._read()
                elif _on == ShapefileMain.ShapeType.multi_point_m:
                    pass
                    self.shape_parameters = ShapefileMain.MultiPointM(self._io, self, self._root)
                    self.shape_parameters._read()
                elif _on == ShapefileMain.ShapeType.multi_point_z:
                    pass
                    self.shape_parameters = ShapefileMain.MultiPointZ(self._io, self, self._root)
                    self.shape_parameters._read()
                elif _on == ShapefileMain.ShapeType.point:
                    pass
                    self.shape_parameters = ShapefileMain.Point(self._io, self, self._root)
                    self.shape_parameters._read()
                elif _on == ShapefileMain.ShapeType.point_m:
                    pass
                    self.shape_parameters = ShapefileMain.PointM(self._io, self, self._root)
                    self.shape_parameters._read()
                elif _on == ShapefileMain.ShapeType.point_z:
                    pass
                    self.shape_parameters = ShapefileMain.PointZ(self._io, self, self._root)
                    self.shape_parameters._read()
                elif _on == ShapefileMain.ShapeType.poly_line:
                    pass
                    self.shape_parameters = ShapefileMain.PolyLine(self._io, self, self._root)
                    self.shape_parameters._read()
                elif _on == ShapefileMain.ShapeType.poly_line_m:
                    pass
                    self.shape_parameters = ShapefileMain.PolyLineM(self._io, self, self._root)
                    self.shape_parameters._read()
                elif _on == ShapefileMain.ShapeType.poly_line_z:
                    pass
                    self.shape_parameters = ShapefileMain.PolyLineZ(self._io, self, self._root)
                    self.shape_parameters._read()
                elif _on == ShapefileMain.ShapeType.polygon:
                    pass
                    self.shape_parameters = ShapefileMain.Polygon(self._io, self, self._root)
                    self.shape_parameters._read()
                elif _on == ShapefileMain.ShapeType.polygon_m:
                    pass
                    self.shape_parameters = ShapefileMain.PolygonM(self._io, self, self._root)
                    self.shape_parameters._read()
                elif _on == ShapefileMain.ShapeType.polygon_z:
                    pass
                    self.shape_parameters = ShapefileMain.PolygonZ(self._io, self, self._root)
                    self.shape_parameters._read()

            self._dirty = False


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



        def _write__seq(self, io=None):
            super(ShapefileMain.RecordContents, self)._write__seq(io)
            self._io.write_s4le(int(self.shape_type))
            if self.shape_type != ShapefileMain.ShapeType.null_shape:
                pass
                _on = self.shape_type
                if _on == ShapefileMain.ShapeType.multi_patch:
                    pass
                    self.shape_parameters._write__seq(self._io)
                elif _on == ShapefileMain.ShapeType.multi_point:
                    pass
                    self.shape_parameters._write__seq(self._io)
                elif _on == ShapefileMain.ShapeType.multi_point_m:
                    pass
                    self.shape_parameters._write__seq(self._io)
                elif _on == ShapefileMain.ShapeType.multi_point_z:
                    pass
                    self.shape_parameters._write__seq(self._io)
                elif _on == ShapefileMain.ShapeType.point:
                    pass
                    self.shape_parameters._write__seq(self._io)
                elif _on == ShapefileMain.ShapeType.point_m:
                    pass
                    self.shape_parameters._write__seq(self._io)
                elif _on == ShapefileMain.ShapeType.point_z:
                    pass
                    self.shape_parameters._write__seq(self._io)
                elif _on == ShapefileMain.ShapeType.poly_line:
                    pass
                    self.shape_parameters._write__seq(self._io)
                elif _on == ShapefileMain.ShapeType.poly_line_m:
                    pass
                    self.shape_parameters._write__seq(self._io)
                elif _on == ShapefileMain.ShapeType.poly_line_z:
                    pass
                    self.shape_parameters._write__seq(self._io)
                elif _on == ShapefileMain.ShapeType.polygon:
                    pass
                    self.shape_parameters._write__seq(self._io)
                elif _on == ShapefileMain.ShapeType.polygon_m:
                    pass
                    self.shape_parameters._write__seq(self._io)
                elif _on == ShapefileMain.ShapeType.polygon_z:
                    pass
                    self.shape_parameters._write__seq(self._io)



        def _check(self):
            if self.shape_type != ShapefileMain.ShapeType.null_shape:
                pass
                _on = self.shape_type
                if _on == ShapefileMain.ShapeType.multi_patch:
                    pass
                    if self.shape_parameters._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self._root, self.shape_parameters._root)
                    if self.shape_parameters._parent != self:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self, self.shape_parameters._parent)
                elif _on == ShapefileMain.ShapeType.multi_point:
                    pass
                    if self.shape_parameters._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self._root, self.shape_parameters._root)
                    if self.shape_parameters._parent != self:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self, self.shape_parameters._parent)
                elif _on == ShapefileMain.ShapeType.multi_point_m:
                    pass
                    if self.shape_parameters._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self._root, self.shape_parameters._root)
                    if self.shape_parameters._parent != self:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self, self.shape_parameters._parent)
                elif _on == ShapefileMain.ShapeType.multi_point_z:
                    pass
                    if self.shape_parameters._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self._root, self.shape_parameters._root)
                    if self.shape_parameters._parent != self:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self, self.shape_parameters._parent)
                elif _on == ShapefileMain.ShapeType.point:
                    pass
                    if self.shape_parameters._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self._root, self.shape_parameters._root)
                    if self.shape_parameters._parent != self:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self, self.shape_parameters._parent)
                elif _on == ShapefileMain.ShapeType.point_m:
                    pass
                    if self.shape_parameters._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self._root, self.shape_parameters._root)
                    if self.shape_parameters._parent != self:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self, self.shape_parameters._parent)
                elif _on == ShapefileMain.ShapeType.point_z:
                    pass
                    if self.shape_parameters._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self._root, self.shape_parameters._root)
                    if self.shape_parameters._parent != self:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self, self.shape_parameters._parent)
                elif _on == ShapefileMain.ShapeType.poly_line:
                    pass
                    if self.shape_parameters._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self._root, self.shape_parameters._root)
                    if self.shape_parameters._parent != self:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self, self.shape_parameters._parent)
                elif _on == ShapefileMain.ShapeType.poly_line_m:
                    pass
                    if self.shape_parameters._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self._root, self.shape_parameters._root)
                    if self.shape_parameters._parent != self:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self, self.shape_parameters._parent)
                elif _on == ShapefileMain.ShapeType.poly_line_z:
                    pass
                    if self.shape_parameters._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self._root, self.shape_parameters._root)
                    if self.shape_parameters._parent != self:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self, self.shape_parameters._parent)
                elif _on == ShapefileMain.ShapeType.polygon:
                    pass
                    if self.shape_parameters._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self._root, self.shape_parameters._root)
                    if self.shape_parameters._parent != self:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self, self.shape_parameters._parent)
                elif _on == ShapefileMain.ShapeType.polygon_m:
                    pass
                    if self.shape_parameters._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self._root, self.shape_parameters._root)
                    if self.shape_parameters._parent != self:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self, self.shape_parameters._parent)
                elif _on == ShapefileMain.ShapeType.polygon_z:
                    pass
                    if self.shape_parameters._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self._root, self.shape_parameters._root)
                    if self.shape_parameters._parent != self:
                        raise kaitaistruct.ConsistencyError(u"shape_parameters", self, self.shape_parameters._parent)

            self._dirty = False


    class RecordHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileMain.RecordHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.record_number = self._io.read_s4be()
            self.content_length = self._io.read_s4be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(ShapefileMain.RecordHeader, self)._write__seq(io)
            self._io.write_s4be(self.record_number)
            self._io.write_s4be(self.content_length)


        def _check(self):
            self._dirty = False



