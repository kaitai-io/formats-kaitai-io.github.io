# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Webp(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://developers.google.com/speed/webp/docs/riff_container
    """

    class ChunkNames(IntEnum):
        xmp_var = 5262680
        vp8 = 540561494
        xmp = 542133592
        exif = 1179211845
        anmf = 1179471425
        alph = 1213221953
        vp8l = 1278758998
        frgm = 1296519750
        anim = 1296649793
        iccp = 1346585417
        vp8x = 1480085590

    class CompressionMethod(IntEnum):
        none = 0
        webp_lossless = 1

    class FilteringMethod(IntEnum):
        none = 0
        horizontal = 1
        vertical = 2
        gradient = 3

    class Preprocessing(IntEnum):
        none = 0
        level_reduction = 1
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Webp, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\x52\x49\x46\x46":
            raise kaitaistruct.ValidationNotEqualError(b"\x52\x49\x46\x46", self.magic, self._io, u"/seq/0")
        self.len_data = self._io.read_u4le()
        self.webp = self._io.read_bytes(4)
        if not self.webp == b"\x57\x45\x42\x50":
            raise kaitaistruct.ValidationNotEqualError(b"\x57\x45\x42\x50", self.webp, self._io, u"/seq/2")
        self._raw_payload = self._io.read_bytes(self.len_data - 4)
        _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
        self.payload = Webp.Chunks(_io__raw_payload, self, self._root)
        self.payload._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.payload._fetch_instances()


    def _write__seq(self, io=None):
        super(Webp, self)._write__seq(io)
        self._io.write_bytes(self.magic)
        self._io.write_u4le(self.len_data)
        self._io.write_bytes(self.webp)
        _io__raw_payload = KaitaiStream(BytesIO(bytearray(self.len_data - 4)))
        self._io.add_child_stream(_io__raw_payload)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.len_data - 4))
        def handler(parent, _io__raw_payload=_io__raw_payload):
            self._raw_payload = _io__raw_payload.to_byte_array()
            if len(self._raw_payload) != self.len_data - 4:
                raise kaitaistruct.ConsistencyError(u"raw(payload)", self.len_data - 4, len(self._raw_payload))
            parent.write_bytes(self._raw_payload)
        _io__raw_payload.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.payload._write__seq(_io__raw_payload)


    def _check(self):
        if len(self.magic) != 4:
            raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
        if not self.magic == b"\x52\x49\x46\x46":
            raise kaitaistruct.ValidationNotEqualError(b"\x52\x49\x46\x46", self.magic, None, u"/seq/0")
        if len(self.webp) != 4:
            raise kaitaistruct.ConsistencyError(u"webp", 4, len(self.webp))
        if not self.webp == b"\x57\x45\x42\x50":
            raise kaitaistruct.ValidationNotEqualError(b"\x57\x45\x42\x50", self.webp, None, u"/seq/2")
        if self.payload._root != self._root:
            raise kaitaistruct.ConsistencyError(u"payload", self._root, self.payload._root)
        if self.payload._parent != self:
            raise kaitaistruct.ConsistencyError(u"payload", self, self.payload._parent)
        self._dirty = False

    class Alph(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Webp.Alph, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.reserved = self._io.read_bits_int_be(2)
            if not self.reserved == 0:
                raise kaitaistruct.ValidationNotEqualError(0, self.reserved, self._io, u"/types/alph/seq/0")
            self.preprocessing = KaitaiStream.resolve_enum(Webp.Preprocessing, self._io.read_bits_int_be(2))
            if not isinstance(self.preprocessing, Webp.Preprocessing):
                raise kaitaistruct.ValidationNotInEnumError(self.preprocessing, self._io, u"/types/alph/seq/1")
            self.filtering = KaitaiStream.resolve_enum(Webp.FilteringMethod, self._io.read_bits_int_be(2))
            self.compression = KaitaiStream.resolve_enum(Webp.CompressionMethod, self._io.read_bits_int_be(2))
            if not isinstance(self.compression, Webp.CompressionMethod):
                raise kaitaistruct.ValidationNotInEnumError(self.compression, self._io, u"/types/alph/seq/3")
            self.data = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Webp.Alph, self)._write__seq(io)
            self._io.write_bits_int_be(2, self.reserved)
            self._io.write_bits_int_be(2, int(self.preprocessing))
            self._io.write_bits_int_be(2, int(self.filtering))
            self._io.write_bits_int_be(2, int(self.compression))
            self._io.write_bytes(self.data)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())


        def _check(self):
            if not self.reserved == 0:
                raise kaitaistruct.ValidationNotEqualError(0, self.reserved, None, u"/types/alph/seq/0")
            if not isinstance(self.preprocessing, Webp.Preprocessing):
                raise kaitaistruct.ValidationNotInEnumError(self.preprocessing, None, u"/types/alph/seq/1")
            if not isinstance(self.compression, Webp.CompressionMethod):
                raise kaitaistruct.ValidationNotInEnumError(self.compression, None, u"/types/alph/seq/3")
            self._dirty = False


    class Anim(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://developers.google.com/speed/webp/docs/riff_container#animation
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Webp.Anim, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.background_color = Webp.Anim.BgColor(self._io, self, self._root)
            self.background_color._read()
            self.loop_count = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.background_color._fetch_instances()


        def _write__seq(self, io=None):
            super(Webp.Anim, self)._write__seq(io)
            self.background_color._write__seq(self._io)
            self._io.write_u2le(self.loop_count)


        def _check(self):
            if self.background_color._root != self._root:
                raise kaitaistruct.ConsistencyError(u"background_color", self._root, self.background_color._root)
            if self.background_color._parent != self:
                raise kaitaistruct.ConsistencyError(u"background_color", self, self.background_color._parent)
            self._dirty = False

        class BgColor(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Webp.Anim.BgColor, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.blue = self._io.read_u1()
                self.green = self._io.read_u1()
                self.red = self._io.read_u1()
                self.alpha = self._io.read_u1()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Webp.Anim.BgColor, self)._write__seq(io)
                self._io.write_u1(self.blue)
                self._io.write_u1(self.green)
                self._io.write_u1(self.red)
                self._io.write_u1(self.alpha)


            def _check(self):
                self._dirty = False



    class Anmf(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Webp.Anmf, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.frame_x_div_2 = self._io.read_bits_int_le(24)
            self.frame_y_div_2 = self._io.read_bits_int_le(24)
            self.frame_width_minus_1 = self._io.read_bits_int_le(24)
            self.frame_height_minus_1 = self._io.read_bits_int_le(24)
            self.duration = self._io.read_bits_int_le(24)
            self.reserved = self._io.read_bits_int_be(6)
            if not self.reserved == 0:
                raise kaitaistruct.ValidationNotEqualError(0, self.reserved, self._io, u"/types/anmf/seq/5")
            self.blending_method = self._io.read_bits_int_be(1) != 0
            self.disposal_method = self._io.read_bits_int_be(1) != 0
            self.data = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Webp.Anmf, self)._write__seq(io)
            self._io.write_bits_int_le(24, self.frame_x_div_2)
            self._io.write_bits_int_le(24, self.frame_y_div_2)
            self._io.write_bits_int_le(24, self.frame_width_minus_1)
            self._io.write_bits_int_le(24, self.frame_height_minus_1)
            self._io.write_bits_int_le(24, self.duration)
            self._io.write_bits_int_be(6, self.reserved)
            self._io.write_bits_int_be(1, int(self.blending_method))
            self._io.write_bits_int_be(1, int(self.disposal_method))
            self._io.write_bytes(self.data)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())


        def _check(self):
            if not self.reserved == 0:
                raise kaitaistruct.ValidationNotEqualError(0, self.reserved, None, u"/types/anmf/seq/5")
            self._dirty = False

        @property
        def frame_height(self):
            if hasattr(self, '_m_frame_height'):
                return self._m_frame_height

            self._m_frame_height = self.frame_height_minus_1 + 1
            return getattr(self, '_m_frame_height', None)

        def _invalidate_frame_height(self):
            del self._m_frame_height
        @property
        def frame_width(self):
            if hasattr(self, '_m_frame_width'):
                return self._m_frame_width

            self._m_frame_width = self.frame_width_minus_1 + 1
            return getattr(self, '_m_frame_width', None)

        def _invalidate_frame_width(self):
            del self._m_frame_width
        @property
        def frame_x(self):
            if hasattr(self, '_m_frame_x'):
                return self._m_frame_x

            self._m_frame_x = self.frame_x_div_2 * 2
            return getattr(self, '_m_frame_x', None)

        def _invalidate_frame_x(self):
            del self._m_frame_x
        @property
        def frame_y(self):
            if hasattr(self, '_m_frame_y'):
                return self._m_frame_y

            self._m_frame_y = self.frame_y_div_2 * 2
            return getattr(self, '_m_frame_y', None)

        def _invalidate_frame_y(self):
            del self._m_frame_y

    class Chunk(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Webp.Chunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.name = KaitaiStream.resolve_enum(Webp.ChunkNames, self._io.read_u4le())
            if not isinstance(self.name, Webp.ChunkNames):
                raise kaitaistruct.ValidationNotInEnumError(self.name, self._io, u"/types/chunk/seq/0")
            self.len_data = self._io.read_u4le()
            _on = self.name
            if _on == Webp.ChunkNames.alph:
                pass
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Webp.Alph(_io__raw_data, self, self._root)
                self.data._read()
            elif _on == Webp.ChunkNames.anim:
                pass
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Webp.Anim(_io__raw_data, self, self._root)
                self.data._read()
            elif _on == Webp.ChunkNames.anmf:
                pass
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Webp.Anmf(_io__raw_data, self, self._root)
                self.data._read()
            elif _on == Webp.ChunkNames.vp8:
                pass
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Webp.Vp8(_io__raw_data, self, self._root)
                self.data._read()
            elif _on == Webp.ChunkNames.vp8l:
                pass
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Webp.Vp8l(_io__raw_data, self, self._root)
                self.data._read()
            elif _on == Webp.ChunkNames.vp8x:
                pass
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Webp.Vp8x(_io__raw_data, self, self._root)
                self.data._read()
            elif _on == Webp.ChunkNames.xmp:
                pass
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Webp.Xmp(_io__raw_data, self, self._root)
                self.data._read()
            elif _on == Webp.ChunkNames.xmp_var:
                pass
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Webp.Xmp(_io__raw_data, self, self._root)
                self.data._read()
            else:
                pass
                self.data = self._io.read_bytes(self.len_data)
            if self.len_data % 2 != 0:
                pass
                self.padding = self._io.read_bytes(1)
                if not self.padding == b"\x00":
                    raise kaitaistruct.ValidationNotEqualError(b"\x00", self.padding, self._io, u"/types/chunk/seq/3")

            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.name
            if _on == Webp.ChunkNames.alph:
                pass
                self.data._fetch_instances()
            elif _on == Webp.ChunkNames.anim:
                pass
                self.data._fetch_instances()
            elif _on == Webp.ChunkNames.anmf:
                pass
                self.data._fetch_instances()
            elif _on == Webp.ChunkNames.vp8:
                pass
                self.data._fetch_instances()
            elif _on == Webp.ChunkNames.vp8l:
                pass
                self.data._fetch_instances()
            elif _on == Webp.ChunkNames.vp8x:
                pass
                self.data._fetch_instances()
            elif _on == Webp.ChunkNames.xmp:
                pass
                self.data._fetch_instances()
            elif _on == Webp.ChunkNames.xmp_var:
                pass
                self.data._fetch_instances()
            else:
                pass
            if self.len_data % 2 != 0:
                pass



        def _write__seq(self, io=None):
            super(Webp.Chunk, self)._write__seq(io)
            self._io.write_u4le(int(self.name))
            self._io.write_u4le(self.len_data)
            _on = self.name
            if _on == Webp.ChunkNames.alph:
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray(self.len_data)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_data))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != self.len_data:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", self.len_data, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)
            elif _on == Webp.ChunkNames.anim:
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray(self.len_data)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_data))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != self.len_data:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", self.len_data, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)
            elif _on == Webp.ChunkNames.anmf:
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray(self.len_data)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_data))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != self.len_data:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", self.len_data, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)
            elif _on == Webp.ChunkNames.vp8:
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray(self.len_data)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_data))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != self.len_data:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", self.len_data, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)
            elif _on == Webp.ChunkNames.vp8l:
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray(self.len_data)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_data))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != self.len_data:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", self.len_data, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)
            elif _on == Webp.ChunkNames.vp8x:
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray(self.len_data)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_data))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != self.len_data:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", self.len_data, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)
            elif _on == Webp.ChunkNames.xmp:
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray(self.len_data)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_data))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != self.len_data:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", self.len_data, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)
            elif _on == Webp.ChunkNames.xmp_var:
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray(self.len_data)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_data))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != self.len_data:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", self.len_data, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)
            else:
                pass
                self._io.write_bytes(self.data)
            if self.len_data % 2 != 0:
                pass
                self._io.write_bytes(self.padding)



        def _check(self):
            if not isinstance(self.name, Webp.ChunkNames):
                raise kaitaistruct.ValidationNotInEnumError(self.name, None, u"/types/chunk/seq/0")
            _on = self.name
            if _on == Webp.ChunkNames.alph:
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            elif _on == Webp.ChunkNames.anim:
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            elif _on == Webp.ChunkNames.anmf:
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            elif _on == Webp.ChunkNames.vp8:
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            elif _on == Webp.ChunkNames.vp8l:
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            elif _on == Webp.ChunkNames.vp8x:
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            elif _on == Webp.ChunkNames.xmp:
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            elif _on == Webp.ChunkNames.xmp_var:
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            else:
                pass
                if len(self.data) != self.len_data:
                    raise kaitaistruct.ConsistencyError(u"data", self.len_data, len(self.data))
            if self.len_data % 2 != 0:
                pass
                if len(self.padding) != 1:
                    raise kaitaistruct.ConsistencyError(u"padding", 1, len(self.padding))
                if not self.padding == b"\x00":
                    raise kaitaistruct.ValidationNotEqualError(b"\x00", self.padding, None, u"/types/chunk/seq/3")

            self._dirty = False


    class Chunks(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Webp.Chunks, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.chunks = []
            i = 0
            while not self._io.is_eof():
                _t_chunks = Webp.Chunk(self._io, self, self._root)
                try:
                    _t_chunks._read()
                finally:
                    self.chunks.append(_t_chunks)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.chunks)):
                pass
                self.chunks[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Webp.Chunks, self)._write__seq(io)
            for i in range(len(self.chunks)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"chunks", 0, self._io.size() - self._io.pos())
                self.chunks[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"chunks", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.chunks)):
                pass
                if self.chunks[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"chunks", self._root, self.chunks[i]._root)
                if self.chunks[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"chunks", self, self.chunks[i]._parent)

            self._dirty = False


    class Vp8(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://www.rfc-editor.org/rfc/rfc6386#section-9.1
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Webp.Vp8, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.frame_type = self._io.read_bits_int_le(1) != 0
            if not self.frame_type == False:
                raise kaitaistruct.ValidationNotEqualError(False, self.frame_type, self._io, u"/types/vp8/seq/0")
            self.version = self._io.read_bits_int_le(3)
            if not self.version <= 3:
                raise kaitaistruct.ValidationGreaterThanError(3, self.version, self._io, u"/types/vp8/seq/1")
            self.show_frame = self._io.read_bits_int_le(1) != 0
            self.len_first_partition = self._io.read_bits_int_le(19)
            self.start_code = self._io.read_bytes(3)
            if not self.start_code == b"\x9D\x01\x2A":
                raise kaitaistruct.ValidationNotEqualError(b"\x9D\x01\x2A", self.start_code, self._io, u"/types/vp8/seq/4")
            self.width = self._io.read_bits_int_le(14)
            self.horizontal_scale = self._io.read_bits_int_le(2)
            self.height = self._io.read_bits_int_le(14)
            self.vertical_scale = self._io.read_bits_int_le(2)
            self.data = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Webp.Vp8, self)._write__seq(io)
            self._io.write_bits_int_le(1, int(self.frame_type))
            self._io.write_bits_int_le(3, self.version)
            self._io.write_bits_int_le(1, int(self.show_frame))
            self._io.write_bits_int_le(19, self.len_first_partition)
            self._io.write_bytes(self.start_code)
            self._io.write_bits_int_le(14, self.width)
            self._io.write_bits_int_le(2, self.horizontal_scale)
            self._io.write_bits_int_le(14, self.height)
            self._io.write_bits_int_le(2, self.vertical_scale)
            self._io.write_bytes(self.data)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())


        def _check(self):
            if not self.frame_type == False:
                raise kaitaistruct.ValidationNotEqualError(False, self.frame_type, None, u"/types/vp8/seq/0")
            if not self.version <= 3:
                raise kaitaistruct.ValidationGreaterThanError(3, self.version, None, u"/types/vp8/seq/1")
            if len(self.start_code) != 3:
                raise kaitaistruct.ConsistencyError(u"start_code", 3, len(self.start_code))
            if not self.start_code == b"\x9D\x01\x2A":
                raise kaitaistruct.ValidationNotEqualError(b"\x9D\x01\x2A", self.start_code, None, u"/types/vp8/seq/4")
            self._dirty = False


    class Vp8l(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://developers.google.com/speed/webp/docs/webp_lossless_bitstream_specification
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Webp.Vp8l, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.signature = self._io.read_u1()
            if not self.signature == 47:
                raise kaitaistruct.ValidationNotEqualError(47, self.signature, self._io, u"/types/vp8l/seq/0")
            self.image_width_minus_1 = self._io.read_bits_int_le(14)
            self.image_height_minus_1 = self._io.read_bits_int_le(14)
            self.alpha_is_used = self._io.read_bits_int_le(1) != 0
            self.version_number = self._io.read_bits_int_le(3)
            if not self.version_number == 0:
                raise kaitaistruct.ValidationNotEqualError(0, self.version_number, self._io, u"/types/vp8l/seq/4")
            self.data = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Webp.Vp8l, self)._write__seq(io)
            self._io.write_u1(self.signature)
            self._io.write_bits_int_le(14, self.image_width_minus_1)
            self._io.write_bits_int_le(14, self.image_height_minus_1)
            self._io.write_bits_int_le(1, int(self.alpha_is_used))
            self._io.write_bits_int_le(3, self.version_number)
            self._io.write_bytes(self.data)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())


        def _check(self):
            if not self.signature == 47:
                raise kaitaistruct.ValidationNotEqualError(47, self.signature, None, u"/types/vp8l/seq/0")
            if not self.version_number == 0:
                raise kaitaistruct.ValidationNotEqualError(0, self.version_number, None, u"/types/vp8l/seq/4")
            self._dirty = False

        @property
        def image_height(self):
            if hasattr(self, '_m_image_height'):
                return self._m_image_height

            self._m_image_height = self.image_height_minus_1 + 1
            return getattr(self, '_m_image_height', None)

        def _invalidate_image_height(self):
            del self._m_image_height
        @property
        def image_width(self):
            if hasattr(self, '_m_image_width'):
                return self._m_image_width

            self._m_image_width = self.image_width_minus_1 + 1
            return getattr(self, '_m_image_width', None)

        def _invalidate_image_width(self):
            del self._m_image_width

    class Vp8x(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Webp.Vp8x, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.reserved1 = self._io.read_bits_int_be(2)
            if not self.reserved1 == 0:
                raise kaitaistruct.ValidationNotEqualError(0, self.reserved1, self._io, u"/types/vp8x/seq/0")
            self.icc_profile = self._io.read_bits_int_be(1) != 0
            self.alpha = self._io.read_bits_int_be(1) != 0
            self.exif = self._io.read_bits_int_be(1) != 0
            self.xmp = self._io.read_bits_int_be(1) != 0
            self.animation = self._io.read_bits_int_be(1) != 0
            self.reserved2 = self._io.read_bits_int_be(1) != 0
            if not self.reserved2 == False:
                raise kaitaistruct.ValidationNotEqualError(False, self.reserved2, self._io, u"/types/vp8x/seq/6")
            self.reserved3 = self._io.read_bits_int_be(24)
            if not self.reserved3 == 0:
                raise kaitaistruct.ValidationNotEqualError(0, self.reserved3, self._io, u"/types/vp8x/seq/7")
            self.canvas_width_minus_1 = self._io.read_bits_int_le(24)
            self.canvas_height_minus_1 = self._io.read_bits_int_le(24)
            if not self.canvas_height_minus_1 <= 4294967295 // self.canvas_width - 1:
                raise kaitaistruct.ValidationGreaterThanError(4294967295 // self.canvas_width - 1, self.canvas_height_minus_1, self._io, u"/types/vp8x/seq/9")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Webp.Vp8x, self)._write__seq(io)
            self._io.write_bits_int_be(2, self.reserved1)
            self._io.write_bits_int_be(1, int(self.icc_profile))
            self._io.write_bits_int_be(1, int(self.alpha))
            self._io.write_bits_int_be(1, int(self.exif))
            self._io.write_bits_int_be(1, int(self.xmp))
            self._io.write_bits_int_be(1, int(self.animation))
            self._io.write_bits_int_be(1, int(self.reserved2))
            self._io.write_bits_int_be(24, self.reserved3)
            self._io.write_bits_int_le(24, self.canvas_width_minus_1)
            self._io.write_bits_int_le(24, self.canvas_height_minus_1)


        def _check(self):
            if not self.reserved1 == 0:
                raise kaitaistruct.ValidationNotEqualError(0, self.reserved1, None, u"/types/vp8x/seq/0")
            if not self.reserved2 == False:
                raise kaitaistruct.ValidationNotEqualError(False, self.reserved2, None, u"/types/vp8x/seq/6")
            if not self.reserved3 == 0:
                raise kaitaistruct.ValidationNotEqualError(0, self.reserved3, None, u"/types/vp8x/seq/7")
            if not self.canvas_height_minus_1 <= 4294967295 // self.canvas_width - 1:
                raise kaitaistruct.ValidationGreaterThanError(4294967295 // self.canvas_width - 1, self.canvas_height_minus_1, None, u"/types/vp8x/seq/9")
            self._dirty = False

        @property
        def canvas_height(self):
            if hasattr(self, '_m_canvas_height'):
                return self._m_canvas_height

            self._m_canvas_height = self.canvas_height_minus_1 + 1
            return getattr(self, '_m_canvas_height', None)

        def _invalidate_canvas_height(self):
            del self._m_canvas_height
        @property
        def canvas_width(self):
            if hasattr(self, '_m_canvas_width'):
                return self._m_canvas_width

            self._m_canvas_width = self.canvas_width_minus_1 + 1
            return getattr(self, '_m_canvas_width', None)

        def _invalidate_canvas_width(self):
            del self._m_canvas_width

    class Xmp(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Webp.Xmp, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.data = (self._io.read_bytes_full()).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Webp.Xmp, self)._write__seq(io)
            self._io.write_bytes((self.data).encode(u"UTF-8"))
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False



