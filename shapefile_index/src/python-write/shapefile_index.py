# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class ShapefileIndex(ReadWriteKaitaiStruct):

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
        super(ShapefileIndex, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header = ShapefileIndex.FileHeader(self._io, self, self._root)
        self.header._read()
        self.records = []
        i = 0
        while not self._io.is_eof():
            _t_records = ShapefileIndex.Record(self._io, self, self._root)
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
        super(ShapefileIndex, self)._write__seq(io)
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

    class BoundingBoxXYZM(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileIndex.BoundingBoxXYZM, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.x = ShapefileIndex.BoundsMinMax(self._io, self, self._root)
            self.x._read()
            self.y = ShapefileIndex.BoundsMinMax(self._io, self, self._root)
            self.y._read()
            self.z = ShapefileIndex.BoundsMinMax(self._io, self, self._root)
            self.z._read()
            self.m = ShapefileIndex.BoundsMinMax(self._io, self, self._root)
            self.m._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.x._fetch_instances()
            self.y._fetch_instances()
            self.z._fetch_instances()
            self.m._fetch_instances()


        def _write__seq(self, io=None):
            super(ShapefileIndex.BoundingBoxXYZM, self)._write__seq(io)
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
            super(ShapefileIndex.BoundsMinMax, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.min = self._io.read_f8be()
            self.max = self._io.read_f8be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(ShapefileIndex.BoundsMinMax, self)._write__seq(io)
            self._io.write_f8be(self.min)
            self._io.write_f8be(self.max)


        def _check(self):
            self._dirty = False


    class FileHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileIndex.FileHeader, self).__init__(_io)
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
            self.shape_type = KaitaiStream.resolve_enum(ShapefileIndex.ShapeType, self._io.read_s4le())
            self.bounding_box = ShapefileIndex.BoundingBoxXYZM(self._io, self, self._root)
            self.bounding_box._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.bounding_box._fetch_instances()


        def _write__seq(self, io=None):
            super(ShapefileIndex.FileHeader, self)._write__seq(io)
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


    class Record(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ShapefileIndex.Record, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.offset = self._io.read_s4be()
            self.content_length = self._io.read_s4be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(ShapefileIndex.Record, self)._write__seq(io)
            self._io.write_s4be(self.offset)
            self._io.write_s4be(self.content_length)


        def _check(self):
            self._dirty = False



