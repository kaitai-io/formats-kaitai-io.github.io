# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Webp(KaitaiStruct):
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
    def __init__(self, _io, _parent=None, _root=None):
        super(Webp, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

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


    def _fetch_instances(self):
        pass
        self.payload._fetch_instances()

    class Alph(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Webp.Alph, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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


        def _fetch_instances(self):
            pass


    class Anim(KaitaiStruct):
        """
        .. seealso::
           Source - https://developers.google.com/speed/webp/docs/riff_container#animation
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Webp.Anim, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.background_color = Webp.Anim.BgColor(self._io, self, self._root)
            self.loop_count = self._io.read_u2le()


        def _fetch_instances(self):
            pass
            self.background_color._fetch_instances()

        class BgColor(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(Webp.Anim.BgColor, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.blue = self._io.read_u1()
                self.green = self._io.read_u1()
                self.red = self._io.read_u1()
                self.alpha = self._io.read_u1()


            def _fetch_instances(self):
                pass



    class Anmf(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Webp.Anmf, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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


        def _fetch_instances(self):
            pass

        @property
        def frame_height(self):
            if hasattr(self, '_m_frame_height'):
                return self._m_frame_height

            self._m_frame_height = self.frame_height_minus_1 + 1
            return getattr(self, '_m_frame_height', None)

        @property
        def frame_width(self):
            if hasattr(self, '_m_frame_width'):
                return self._m_frame_width

            self._m_frame_width = self.frame_width_minus_1 + 1
            return getattr(self, '_m_frame_width', None)

        @property
        def frame_x(self):
            if hasattr(self, '_m_frame_x'):
                return self._m_frame_x

            self._m_frame_x = self.frame_x_div_2 * 2
            return getattr(self, '_m_frame_x', None)

        @property
        def frame_y(self):
            if hasattr(self, '_m_frame_y'):
                return self._m_frame_y

            self._m_frame_y = self.frame_y_div_2 * 2
            return getattr(self, '_m_frame_y', None)


    class Chunk(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Webp.Chunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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
            elif _on == Webp.ChunkNames.anim:
                pass
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Webp.Anim(_io__raw_data, self, self._root)
            elif _on == Webp.ChunkNames.anmf:
                pass
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Webp.Anmf(_io__raw_data, self, self._root)
            elif _on == Webp.ChunkNames.vp8:
                pass
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Webp.Vp8(_io__raw_data, self, self._root)
            elif _on == Webp.ChunkNames.vp8l:
                pass
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Webp.Vp8l(_io__raw_data, self, self._root)
            elif _on == Webp.ChunkNames.vp8x:
                pass
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Webp.Vp8x(_io__raw_data, self, self._root)
            elif _on == Webp.ChunkNames.xmp:
                pass
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Webp.Xmp(_io__raw_data, self, self._root)
            elif _on == Webp.ChunkNames.xmp_var:
                pass
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Webp.Xmp(_io__raw_data, self, self._root)
            else:
                pass
                self.data = self._io.read_bytes(self.len_data)
            if self.len_data % 2 != 0:
                pass
                self.padding = self._io.read_bytes(1)
                if not self.padding == b"\x00":
                    raise kaitaistruct.ValidationNotEqualError(b"\x00", self.padding, self._io, u"/types/chunk/seq/3")



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



    class Chunks(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Webp.Chunks, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.chunks = []
            i = 0
            while not self._io.is_eof():
                self.chunks.append(Webp.Chunk(self._io, self, self._root))
                i += 1



        def _fetch_instances(self):
            pass
            for i in range(len(self.chunks)):
                pass
                self.chunks[i]._fetch_instances()



    class Vp8(KaitaiStruct):
        """
        .. seealso::
           Source - https://www.rfc-editor.org/rfc/rfc6386#section-9.1
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Webp.Vp8, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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


        def _fetch_instances(self):
            pass


    class Vp8l(KaitaiStruct):
        """
        .. seealso::
           Source - https://developers.google.com/speed/webp/docs/webp_lossless_bitstream_specification
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Webp.Vp8l, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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


        def _fetch_instances(self):
            pass

        @property
        def image_height(self):
            if hasattr(self, '_m_image_height'):
                return self._m_image_height

            self._m_image_height = self.image_height_minus_1 + 1
            return getattr(self, '_m_image_height', None)

        @property
        def image_width(self):
            if hasattr(self, '_m_image_width'):
                return self._m_image_width

            self._m_image_width = self.image_width_minus_1 + 1
            return getattr(self, '_m_image_width', None)


    class Vp8x(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Webp.Vp8x, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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


        def _fetch_instances(self):
            pass

        @property
        def canvas_height(self):
            if hasattr(self, '_m_canvas_height'):
                return self._m_canvas_height

            self._m_canvas_height = self.canvas_height_minus_1 + 1
            return getattr(self, '_m_canvas_height', None)

        @property
        def canvas_width(self):
            if hasattr(self, '_m_canvas_width'):
                return self._m_canvas_width

            self._m_canvas_width = self.canvas_width_minus_1 + 1
            return getattr(self, '_m_canvas_width', None)


    class Xmp(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Webp.Xmp, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.data = (self._io.read_bytes_full()).decode(u"UTF-8")


        def _fetch_instances(self):
            pass



