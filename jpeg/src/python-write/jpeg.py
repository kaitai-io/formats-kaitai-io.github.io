# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import exif
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Jpeg(ReadWriteKaitaiStruct):
    """JPEG File Interchange Format, or JFIF, or, more colloquially known
    as just "JPEG" or "JPG", is a popular 2D bitmap image file format,
    offering lossy compression which works reasonably well with
    photographic images.
    
    Format is organized as a container format, serving multiple
    "segments", each starting with a magic and a marker. JFIF standard
    dictates order and mandatory apperance of segments:
    
    * SOI
    * APP0 (with JFIF magic)
    * APP0 (with JFXX magic, optional)
    * everything else
    * SOS
    * JPEG-compressed stream
    * EOI
    """

    class ComponentId(IntEnum):
        y = 1
        cb = 2
        cr = 3
        i = 4
        q = 5
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Jpeg, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.segments = []
        i = 0
        while not self._io.is_eof():
            _t_segments = Jpeg.Segment(self._io, self, self._root)
            try:
                _t_segments._read()
            finally:
                self.segments.append(_t_segments)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.segments)):
            pass
            self.segments[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Jpeg, self)._write__seq(io)
        for i in range(len(self.segments)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"segments", 0, self._io.size() - self._io.pos())
            self.segments[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"segments", 0, self._io.size() - self._io.pos())


    def _check(self):
        for i in range(len(self.segments)):
            pass
            if self.segments[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"segments", self._root, self.segments[i]._root)
            if self.segments[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"segments", self, self.segments[i]._parent)

        self._dirty = False

    class ExifInJpeg(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Jpeg.ExifInJpeg, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.extra_zero = self._io.read_bytes(1)
            if not self.extra_zero == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.extra_zero, self._io, u"/types/exif_in_jpeg/seq/0")
            self._raw_data = self._io.read_bytes_full()
            _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
            self.data = exif.Exif(_io__raw_data)
            self.data._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.data._fetch_instances()


        def _write__seq(self, io=None):
            super(Jpeg.ExifInJpeg, self)._write__seq(io)
            self._io.write_bytes(self.extra_zero)
            _io__raw_data = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
            self._io.add_child_stream(_io__raw_data)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
            def handler(parent, _io__raw_data=_io__raw_data):
                self._raw_data = _io__raw_data.to_byte_array()
                parent.write_bytes(self._raw_data)
                if not parent.is_eof():
                    raise kaitaistruct.ConsistencyError(u"raw(data)", 0, parent.size() - parent.pos())
            _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.data._write__seq(_io__raw_data)


        def _check(self):
            if len(self.extra_zero) != 1:
                raise kaitaistruct.ConsistencyError(u"extra_zero", 1, len(self.extra_zero))
            if not self.extra_zero == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.extra_zero, None, u"/types/exif_in_jpeg/seq/0")
            self._dirty = False


    class Segment(ReadWriteKaitaiStruct):

        class MarkerEnum(IntEnum):
            tem = 1
            sof0 = 192
            sof1 = 193
            sof2 = 194
            sof3 = 195
            dht = 196
            sof5 = 197
            sof6 = 198
            sof7 = 199
            soi = 216
            eoi = 217
            sos = 218
            dqt = 219
            dnl = 220
            dri = 221
            dhp = 222
            app0 = 224
            app1 = 225
            app2 = 226
            app3 = 227
            app4 = 228
            app5 = 229
            app6 = 230
            app7 = 231
            app8 = 232
            app9 = 233
            app10 = 234
            app11 = 235
            app12 = 236
            app13 = 237
            app14 = 238
            app15 = 239
            com = 254
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Jpeg.Segment, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(1)
            if not self.magic == b"\xFF":
                raise kaitaistruct.ValidationNotEqualError(b"\xFF", self.magic, self._io, u"/types/segment/seq/0")
            self.marker = KaitaiStream.resolve_enum(Jpeg.Segment.MarkerEnum, self._io.read_u1())
            if  ((self.marker != Jpeg.Segment.MarkerEnum.soi) and (self.marker != Jpeg.Segment.MarkerEnum.eoi)) :
                pass
                self.length = self._io.read_u2be()

            if  ((self.marker != Jpeg.Segment.MarkerEnum.soi) and (self.marker != Jpeg.Segment.MarkerEnum.eoi)) :
                pass
                _on = self.marker
                if _on == Jpeg.Segment.MarkerEnum.app0:
                    pass
                    self._raw_data = self._io.read_bytes(self.length - 2)
                    _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                    self.data = Jpeg.SegmentApp0(_io__raw_data, self, self._root)
                    self.data._read()
                elif _on == Jpeg.Segment.MarkerEnum.app1:
                    pass
                    self._raw_data = self._io.read_bytes(self.length - 2)
                    _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                    self.data = Jpeg.SegmentApp1(_io__raw_data, self, self._root)
                    self.data._read()
                elif _on == Jpeg.Segment.MarkerEnum.sof0:
                    pass
                    self._raw_data = self._io.read_bytes(self.length - 2)
                    _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                    self.data = Jpeg.SegmentSof0(_io__raw_data, self, self._root)
                    self.data._read()
                elif _on == Jpeg.Segment.MarkerEnum.sos:
                    pass
                    self._raw_data = self._io.read_bytes(self.length - 2)
                    _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                    self.data = Jpeg.SegmentSos(_io__raw_data, self, self._root)
                    self.data._read()
                else:
                    pass
                    self.data = self._io.read_bytes(self.length - 2)

            if self.marker == Jpeg.Segment.MarkerEnum.sos:
                pass
                self.image_data = self._io.read_bytes_full()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if  ((self.marker != Jpeg.Segment.MarkerEnum.soi) and (self.marker != Jpeg.Segment.MarkerEnum.eoi)) :
                pass

            if  ((self.marker != Jpeg.Segment.MarkerEnum.soi) and (self.marker != Jpeg.Segment.MarkerEnum.eoi)) :
                pass
                _on = self.marker
                if _on == Jpeg.Segment.MarkerEnum.app0:
                    pass
                    self.data._fetch_instances()
                elif _on == Jpeg.Segment.MarkerEnum.app1:
                    pass
                    self.data._fetch_instances()
                elif _on == Jpeg.Segment.MarkerEnum.sof0:
                    pass
                    self.data._fetch_instances()
                elif _on == Jpeg.Segment.MarkerEnum.sos:
                    pass
                    self.data._fetch_instances()
                else:
                    pass

            if self.marker == Jpeg.Segment.MarkerEnum.sos:
                pass



        def _write__seq(self, io=None):
            super(Jpeg.Segment, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u1(int(self.marker))
            if  ((self.marker != Jpeg.Segment.MarkerEnum.soi) and (self.marker != Jpeg.Segment.MarkerEnum.eoi)) :
                pass
                self._io.write_u2be(self.length)

            if  ((self.marker != Jpeg.Segment.MarkerEnum.soi) and (self.marker != Jpeg.Segment.MarkerEnum.eoi)) :
                pass
                _on = self.marker
                if _on == Jpeg.Segment.MarkerEnum.app0:
                    pass
                    _io__raw_data = KaitaiStream(BytesIO(bytearray(self.length - 2)))
                    self._io.add_child_stream(_io__raw_data)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.length - 2))
                    def handler(parent, _io__raw_data=_io__raw_data):
                        self._raw_data = _io__raw_data.to_byte_array()
                        if len(self._raw_data) != self.length - 2:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.length - 2, len(self._raw_data))
                        parent.write_bytes(self._raw_data)
                    _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.data._write__seq(_io__raw_data)
                elif _on == Jpeg.Segment.MarkerEnum.app1:
                    pass
                    _io__raw_data = KaitaiStream(BytesIO(bytearray(self.length - 2)))
                    self._io.add_child_stream(_io__raw_data)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.length - 2))
                    def handler(parent, _io__raw_data=_io__raw_data):
                        self._raw_data = _io__raw_data.to_byte_array()
                        if len(self._raw_data) != self.length - 2:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.length - 2, len(self._raw_data))
                        parent.write_bytes(self._raw_data)
                    _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.data._write__seq(_io__raw_data)
                elif _on == Jpeg.Segment.MarkerEnum.sof0:
                    pass
                    _io__raw_data = KaitaiStream(BytesIO(bytearray(self.length - 2)))
                    self._io.add_child_stream(_io__raw_data)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.length - 2))
                    def handler(parent, _io__raw_data=_io__raw_data):
                        self._raw_data = _io__raw_data.to_byte_array()
                        if len(self._raw_data) != self.length - 2:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.length - 2, len(self._raw_data))
                        parent.write_bytes(self._raw_data)
                    _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.data._write__seq(_io__raw_data)
                elif _on == Jpeg.Segment.MarkerEnum.sos:
                    pass
                    _io__raw_data = KaitaiStream(BytesIO(bytearray(self.length - 2)))
                    self._io.add_child_stream(_io__raw_data)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.length - 2))
                    def handler(parent, _io__raw_data=_io__raw_data):
                        self._raw_data = _io__raw_data.to_byte_array()
                        if len(self._raw_data) != self.length - 2:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self.length - 2, len(self._raw_data))
                        parent.write_bytes(self._raw_data)
                    _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.data._write__seq(_io__raw_data)
                else:
                    pass
                    self._io.write_bytes(self.data)

            if self.marker == Jpeg.Segment.MarkerEnum.sos:
                pass
                self._io.write_bytes(self.image_data)
                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"image_data", 0, self._io.size() - self._io.pos())



        def _check(self):
            if len(self.magic) != 1:
                raise kaitaistruct.ConsistencyError(u"magic", 1, len(self.magic))
            if not self.magic == b"\xFF":
                raise kaitaistruct.ValidationNotEqualError(b"\xFF", self.magic, None, u"/types/segment/seq/0")
            if  ((self.marker != Jpeg.Segment.MarkerEnum.soi) and (self.marker != Jpeg.Segment.MarkerEnum.eoi)) :
                pass

            if  ((self.marker != Jpeg.Segment.MarkerEnum.soi) and (self.marker != Jpeg.Segment.MarkerEnum.eoi)) :
                pass
                _on = self.marker
                if _on == Jpeg.Segment.MarkerEnum.app0:
                    pass
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                elif _on == Jpeg.Segment.MarkerEnum.app1:
                    pass
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                elif _on == Jpeg.Segment.MarkerEnum.sof0:
                    pass
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                elif _on == Jpeg.Segment.MarkerEnum.sos:
                    pass
                    if self.data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                    if self.data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
                else:
                    pass
                    if len(self.data) != self.length - 2:
                        raise kaitaistruct.ConsistencyError(u"data", self.length - 2, len(self.data))

            if self.marker == Jpeg.Segment.MarkerEnum.sos:
                pass

            self._dirty = False


    class SegmentApp0(ReadWriteKaitaiStruct):

        class DensityUnit(IntEnum):
            no_units = 0
            pixels_per_inch = 1
            pixels_per_cm = 2
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Jpeg.SegmentApp0, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = (self._io.read_bytes(5)).decode(u"ASCII")
            self.version_major = self._io.read_u1()
            self.version_minor = self._io.read_u1()
            self.density_units = KaitaiStream.resolve_enum(Jpeg.SegmentApp0.DensityUnit, self._io.read_u1())
            self.density_x = self._io.read_u2be()
            self.density_y = self._io.read_u2be()
            self.thumbnail_x = self._io.read_u1()
            self.thumbnail_y = self._io.read_u1()
            self.thumbnail = self._io.read_bytes((self.thumbnail_x * self.thumbnail_y) * 3)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Jpeg.SegmentApp0, self)._write__seq(io)
            self._io.write_bytes((self.magic).encode(u"ASCII"))
            self._io.write_u1(self.version_major)
            self._io.write_u1(self.version_minor)
            self._io.write_u1(int(self.density_units))
            self._io.write_u2be(self.density_x)
            self._io.write_u2be(self.density_y)
            self._io.write_u1(self.thumbnail_x)
            self._io.write_u1(self.thumbnail_y)
            self._io.write_bytes(self.thumbnail)


        def _check(self):
            if len((self.magic).encode(u"ASCII")) != 5:
                raise kaitaistruct.ConsistencyError(u"magic", 5, len((self.magic).encode(u"ASCII")))
            if len(self.thumbnail) != (self.thumbnail_x * self.thumbnail_y) * 3:
                raise kaitaistruct.ConsistencyError(u"thumbnail", (self.thumbnail_x * self.thumbnail_y) * 3, len(self.thumbnail))
            self._dirty = False


    class SegmentApp1(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Jpeg.SegmentApp1, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
            _on = self.magic
            if _on == u"Exif":
                pass
                self.body = Jpeg.ExifInJpeg(self._io, self, self._root)
                self.body._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.magic
            if _on == u"Exif":
                pass
                self.body._fetch_instances()


        def _write__seq(self, io=None):
            super(Jpeg.SegmentApp1, self)._write__seq(io)
            self._io.write_bytes((self.magic).encode(u"ASCII"))
            self._io.write_u1(0)
            _on = self.magic
            if _on == u"Exif":
                pass
                self.body._write__seq(self._io)


        def _check(self):
            if KaitaiStream.byte_array_index_of((self.magic).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"magic", -1, KaitaiStream.byte_array_index_of((self.magic).encode(u"ASCII"), 0))
            _on = self.magic
            if _on == u"Exif":
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            self._dirty = False


    class SegmentSof0(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Jpeg.SegmentSof0, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.bits_per_sample = self._io.read_u1()
            self.image_height = self._io.read_u2be()
            self.image_width = self._io.read_u2be()
            self.num_components = self._io.read_u1()
            self.components = []
            for i in range(self.num_components):
                _t_components = Jpeg.SegmentSof0.Component(self._io, self, self._root)
                try:
                    _t_components._read()
                finally:
                    self.components.append(_t_components)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.components)):
                pass
                self.components[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Jpeg.SegmentSof0, self)._write__seq(io)
            self._io.write_u1(self.bits_per_sample)
            self._io.write_u2be(self.image_height)
            self._io.write_u2be(self.image_width)
            self._io.write_u1(self.num_components)
            for i in range(len(self.components)):
                pass
                self.components[i]._write__seq(self._io)



        def _check(self):
            if len(self.components) != self.num_components:
                raise kaitaistruct.ConsistencyError(u"components", self.num_components, len(self.components))
            for i in range(len(self.components)):
                pass
                if self.components[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"components", self._root, self.components[i]._root)
                if self.components[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"components", self, self.components[i]._parent)

            self._dirty = False

        class Component(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Jpeg.SegmentSof0.Component, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.id = KaitaiStream.resolve_enum(Jpeg.ComponentId, self._io.read_u1())
                self.sampling_factors = self._io.read_u1()
                self.quantization_table_id = self._io.read_u1()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Jpeg.SegmentSof0.Component, self)._write__seq(io)
                self._io.write_u1(int(self.id))
                self._io.write_u1(self.sampling_factors)
                self._io.write_u1(self.quantization_table_id)


            def _check(self):
                self._dirty = False

            @property
            def sampling_x(self):
                if hasattr(self, '_m_sampling_x'):
                    return self._m_sampling_x

                self._m_sampling_x = (self.sampling_factors & 240) >> 4
                return getattr(self, '_m_sampling_x', None)

            def _invalidate_sampling_x(self):
                del self._m_sampling_x
            @property
            def sampling_y(self):
                if hasattr(self, '_m_sampling_y'):
                    return self._m_sampling_y

                self._m_sampling_y = self.sampling_factors & 15
                return getattr(self, '_m_sampling_y', None)

            def _invalidate_sampling_y(self):
                del self._m_sampling_y


    class SegmentSos(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Jpeg.SegmentSos, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_components = self._io.read_u1()
            self.components = []
            for i in range(self.num_components):
                _t_components = Jpeg.SegmentSos.Component(self._io, self, self._root)
                try:
                    _t_components._read()
                finally:
                    self.components.append(_t_components)

            self.start_spectral_selection = self._io.read_u1()
            self.end_spectral = self._io.read_u1()
            self.appr_bit_pos = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.components)):
                pass
                self.components[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Jpeg.SegmentSos, self)._write__seq(io)
            self._io.write_u1(self.num_components)
            for i in range(len(self.components)):
                pass
                self.components[i]._write__seq(self._io)

            self._io.write_u1(self.start_spectral_selection)
            self._io.write_u1(self.end_spectral)
            self._io.write_u1(self.appr_bit_pos)


        def _check(self):
            if len(self.components) != self.num_components:
                raise kaitaistruct.ConsistencyError(u"components", self.num_components, len(self.components))
            for i in range(len(self.components)):
                pass
                if self.components[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"components", self._root, self.components[i]._root)
                if self.components[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"components", self, self.components[i]._parent)

            self._dirty = False

        class Component(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Jpeg.SegmentSos.Component, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.id = KaitaiStream.resolve_enum(Jpeg.ComponentId, self._io.read_u1())
                self.huffman_table = self._io.read_u1()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Jpeg.SegmentSos.Component, self)._write__seq(io)
                self._io.write_u1(int(self.id))
                self._io.write_u1(self.huffman_table)


            def _check(self):
                self._dirty = False




