# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum
import zlib


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Png(KaitaiStruct):
    """Test files for APNG can be found at the following locations:
    
      * <https://philip.html5.org/tests/apng/tests.html>
      * <http://littlesvr.ca/apng/>
    """

    class BlendOpValues(IntEnum):
        source = 0
        over = 1

    class ColorType(IntEnum):
        greyscale = 0
        truecolor = 2
        indexed = 3
        greyscale_alpha = 4
        truecolor_alpha = 6

    class CompressionMethods(IntEnum):
        zlib = 0

    class DisposeOpValues(IntEnum):
        none = 0
        background = 1
        previous = 2

    class PhysUnit(IntEnum):
        unknown = 0
        meter = 1
    def __init__(self, _io, _parent=None, _root=None):
        super(Png, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.magic = self._io.read_bytes(8)
        if not self.magic == b"\x89\x50\x4E\x47\x0D\x0A\x1A\x0A":
            raise kaitaistruct.ValidationNotEqualError(b"\x89\x50\x4E\x47\x0D\x0A\x1A\x0A", self.magic, self._io, u"/seq/0")
        self.ihdr_len = self._io.read_u4be()
        if not self.ihdr_len == 13:
            raise kaitaistruct.ValidationNotEqualError(13, self.ihdr_len, self._io, u"/seq/1")
        self.ihdr_type = self._io.read_bytes(4)
        if not self.ihdr_type == b"\x49\x48\x44\x52":
            raise kaitaistruct.ValidationNotEqualError(b"\x49\x48\x44\x52", self.ihdr_type, self._io, u"/seq/2")
        self.ihdr = Png.IhdrChunk(self._io, self, self._root)
        self.ihdr_crc = self._io.read_bytes(4)
        self.chunks = []
        i = 0
        while True:
            _ = Png.Chunk(self._io, self, self._root)
            self.chunks.append(_)
            if  ((_.type == u"IEND") or (self._io.is_eof())) :
                break
            i += 1


    def _fetch_instances(self):
        pass
        self.ihdr._fetch_instances()
        for i in range(len(self.chunks)):
            pass
            self.chunks[i]._fetch_instances()


    class AnimationControlChunk(KaitaiStruct):
        """
        .. seealso::
           Source - https://wiki.mozilla.org/APNG_Specification#.60acTL.60:_The_Animation_Control_Chunk
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Png.AnimationControlChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.num_frames = self._io.read_u4be()
            self.num_plays = self._io.read_u4be()


        def _fetch_instances(self):
            pass


    class BkgdChunk(KaitaiStruct):
        """Background chunk stores default background color to display this
        image against. Contents depend on `color_type` of the image.
        
        .. seealso::
           Source - https://www.w3.org/TR/png/#11bKGD
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Png.BkgdChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            _on = self._root.ihdr.color_type
            if _on == Png.ColorType.greyscale:
                pass
                self.bkgd = Png.BkgdGreyscale(self._io, self, self._root)
            elif _on == Png.ColorType.greyscale_alpha:
                pass
                self.bkgd = Png.BkgdGreyscale(self._io, self, self._root)
            elif _on == Png.ColorType.indexed:
                pass
                self.bkgd = Png.BkgdIndexed(self._io, self, self._root)
            elif _on == Png.ColorType.truecolor:
                pass
                self.bkgd = Png.BkgdTruecolor(self._io, self, self._root)
            elif _on == Png.ColorType.truecolor_alpha:
                pass
                self.bkgd = Png.BkgdTruecolor(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            _on = self._root.ihdr.color_type
            if _on == Png.ColorType.greyscale:
                pass
                self.bkgd._fetch_instances()
            elif _on == Png.ColorType.greyscale_alpha:
                pass
                self.bkgd._fetch_instances()
            elif _on == Png.ColorType.indexed:
                pass
                self.bkgd._fetch_instances()
            elif _on == Png.ColorType.truecolor:
                pass
                self.bkgd._fetch_instances()
            elif _on == Png.ColorType.truecolor_alpha:
                pass
                self.bkgd._fetch_instances()


    class BkgdGreyscale(KaitaiStruct):
        """Background chunk for greyscale images."""
        def __init__(self, _io, _parent=None, _root=None):
            super(Png.BkgdGreyscale, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.value = self._io.read_u2be()


        def _fetch_instances(self):
            pass


    class BkgdIndexed(KaitaiStruct):
        """Background chunk for images with indexed palette."""
        def __init__(self, _io, _parent=None, _root=None):
            super(Png.BkgdIndexed, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.palette_index = self._io.read_u1()


        def _fetch_instances(self):
            pass


    class BkgdTruecolor(KaitaiStruct):
        """Background chunk for truecolor images."""
        def __init__(self, _io, _parent=None, _root=None):
            super(Png.BkgdTruecolor, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.red = self._io.read_u2be()
            self.green = self._io.read_u2be()
            self.blue = self._io.read_u2be()


        def _fetch_instances(self):
            pass


    class ChrmChunk(KaitaiStruct):
        """
        .. seealso::
           Source - https://www.w3.org/TR/png/#11cHRM
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Png.ChrmChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.white_point = Png.Point(self._io, self, self._root)
            self.red = Png.Point(self._io, self, self._root)
            self.green = Png.Point(self._io, self, self._root)
            self.blue = Png.Point(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.white_point._fetch_instances()
            self.red._fetch_instances()
            self.green._fetch_instances()
            self.blue._fetch_instances()


    class Chunk(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Png.Chunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len = self._io.read_u4be()
            self.type = (self._io.read_bytes(4)).decode(u"UTF-8")
            _on = self.type
            if _on == u"PLTE":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.PlteChunk(_io__raw_body, self, self._root)
            elif _on == u"acTL":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.AnimationControlChunk(_io__raw_body, self, self._root)
            elif _on == u"bKGD":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.BkgdChunk(_io__raw_body, self, self._root)
            elif _on == u"cHRM":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.ChrmChunk(_io__raw_body, self, self._root)
            elif _on == u"fcTL":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.FrameControlChunk(_io__raw_body, self, self._root)
            elif _on == u"fdAT":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.FrameDataChunk(_io__raw_body, self, self._root)
            elif _on == u"gAMA":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.GamaChunk(_io__raw_body, self, self._root)
            elif _on == u"iTXt":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.InternationalTextChunk(_io__raw_body, self, self._root)
            elif _on == u"pHYs":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.PhysChunk(_io__raw_body, self, self._root)
            elif _on == u"sRGB":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.SrgbChunk(_io__raw_body, self, self._root)
            elif _on == u"tEXt":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.TextChunk(_io__raw_body, self, self._root)
            elif _on == u"tIME":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.TimeChunk(_io__raw_body, self, self._root)
            elif _on == u"zTXt":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.CompressedTextChunk(_io__raw_body, self, self._root)
            else:
                pass
                self.body = self._io.read_bytes(self.len)
            self.crc = self._io.read_bytes(4)


        def _fetch_instances(self):
            pass
            _on = self.type
            if _on == u"PLTE":
                pass
                self.body._fetch_instances()
            elif _on == u"acTL":
                pass
                self.body._fetch_instances()
            elif _on == u"bKGD":
                pass
                self.body._fetch_instances()
            elif _on == u"cHRM":
                pass
                self.body._fetch_instances()
            elif _on == u"fcTL":
                pass
                self.body._fetch_instances()
            elif _on == u"fdAT":
                pass
                self.body._fetch_instances()
            elif _on == u"gAMA":
                pass
                self.body._fetch_instances()
            elif _on == u"iTXt":
                pass
                self.body._fetch_instances()
            elif _on == u"pHYs":
                pass
                self.body._fetch_instances()
            elif _on == u"sRGB":
                pass
                self.body._fetch_instances()
            elif _on == u"tEXt":
                pass
                self.body._fetch_instances()
            elif _on == u"tIME":
                pass
                self.body._fetch_instances()
            elif _on == u"zTXt":
                pass
                self.body._fetch_instances()
            else:
                pass


    class CompressedTextChunk(KaitaiStruct):
        """Compressed text chunk effectively allows to store key-value
        string pairs in PNG container, compressing "value" part (which
        can be quite lengthy) with zlib compression.
        
        .. seealso::
           Source - https://www.w3.org/TR/png/#11zTXt
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Png.CompressedTextChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.keyword = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
            self.compression_method = KaitaiStream.resolve_enum(Png.CompressionMethods, self._io.read_u1())
            self._raw_text_datastream = self._io.read_bytes_full()
            self.text_datastream = zlib.decompress(self._raw_text_datastream)


        def _fetch_instances(self):
            pass


    class FrameControlChunk(KaitaiStruct):
        """
        .. seealso::
           Source - https://wiki.mozilla.org/APNG_Specification#.60fcTL.60:_The_Frame_Control_Chunk
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Png.FrameControlChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.sequence_number = self._io.read_u4be()
            self.width = self._io.read_u4be()
            if not self.width >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.width, self._io, u"/types/frame_control_chunk/seq/1")
            if not self.width <= self._root.ihdr.width:
                raise kaitaistruct.ValidationGreaterThanError(self._root.ihdr.width, self.width, self._io, u"/types/frame_control_chunk/seq/1")
            self.height = self._io.read_u4be()
            if not self.height >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.height, self._io, u"/types/frame_control_chunk/seq/2")
            if not self.height <= self._root.ihdr.height:
                raise kaitaistruct.ValidationGreaterThanError(self._root.ihdr.height, self.height, self._io, u"/types/frame_control_chunk/seq/2")
            self.x_offset = self._io.read_u4be()
            if not self.x_offset <= self._root.ihdr.width - self.width:
                raise kaitaistruct.ValidationGreaterThanError(self._root.ihdr.width - self.width, self.x_offset, self._io, u"/types/frame_control_chunk/seq/3")
            self.y_offset = self._io.read_u4be()
            if not self.y_offset <= self._root.ihdr.height - self.height:
                raise kaitaistruct.ValidationGreaterThanError(self._root.ihdr.height - self.height, self.y_offset, self._io, u"/types/frame_control_chunk/seq/4")
            self.delay_num = self._io.read_u2be()
            self.delay_den = self._io.read_u2be()
            self.dispose_op = KaitaiStream.resolve_enum(Png.DisposeOpValues, self._io.read_u1())
            self.blend_op = KaitaiStream.resolve_enum(Png.BlendOpValues, self._io.read_u1())


        def _fetch_instances(self):
            pass

        @property
        def delay(self):
            """Time to display this frame, in seconds."""
            if hasattr(self, '_m_delay'):
                return self._m_delay

            self._m_delay = self.delay_num / (100.0 if self.delay_den == 0 else self.delay_den)
            return getattr(self, '_m_delay', None)


    class FrameDataChunk(KaitaiStruct):
        """
        .. seealso::
           Source - https://wiki.mozilla.org/APNG_Specification#.60fdAT.60:_The_Frame_Data_Chunk
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Png.FrameDataChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.sequence_number = self._io.read_u4be()
            self.frame_data = self._io.read_bytes_full()


        def _fetch_instances(self):
            pass


    class GamaChunk(KaitaiStruct):
        """
        .. seealso::
           Source - https://www.w3.org/TR/png/#11gAMA
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Png.GamaChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.gamma_int = self._io.read_u4be()


        def _fetch_instances(self):
            pass

        @property
        def gamma_ratio(self):
            if hasattr(self, '_m_gamma_ratio'):
                return self._m_gamma_ratio

            self._m_gamma_ratio = 100000.0 / self.gamma_int
            return getattr(self, '_m_gamma_ratio', None)


    class IhdrChunk(KaitaiStruct):
        """
        .. seealso::
           Source - https://www.w3.org/TR/png/#11IHDR
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Png.IhdrChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.width = self._io.read_u4be()
            self.height = self._io.read_u4be()
            self.bit_depth = self._io.read_u1()
            self.color_type = KaitaiStream.resolve_enum(Png.ColorType, self._io.read_u1())
            self.compression_method = self._io.read_u1()
            self.filter_method = self._io.read_u1()
            self.interlace_method = self._io.read_u1()


        def _fetch_instances(self):
            pass


    class InternationalTextChunk(KaitaiStruct):
        """International text chunk effectively allows to store key-value string pairs in
        PNG container. Both "key" (keyword) and "value" (text) parts are
        given in pre-defined subset of iso8859-1 without control
        characters.
        
        .. seealso::
           Source - https://www.w3.org/TR/png/#11iTXt
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Png.InternationalTextChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.keyword = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
            self.compression_flag = self._io.read_u1()
            self.compression_method = KaitaiStream.resolve_enum(Png.CompressionMethods, self._io.read_u1())
            self.language_tag = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
            self.translated_keyword = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
            self.text = (self._io.read_bytes_full()).decode(u"UTF-8")


        def _fetch_instances(self):
            pass


    class PhysChunk(KaitaiStruct):
        """"Physical size" chunk stores data that allows to translate
        logical pixels into physical units (meters, etc) and vice-versa.
        
        .. seealso::
           Source - https://www.w3.org/TR/png/#11pHYs
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Png.PhysChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.pixels_per_unit_x = self._io.read_u4be()
            self.pixels_per_unit_y = self._io.read_u4be()
            self.unit = KaitaiStream.resolve_enum(Png.PhysUnit, self._io.read_u1())


        def _fetch_instances(self):
            pass


    class PlteChunk(KaitaiStruct):
        """
        .. seealso::
           Source - https://www.w3.org/TR/png/#11PLTE
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Png.PlteChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                self.entries.append(Png.Rgb(self._io, self, self._root))
                i += 1



        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



    class Point(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Png.Point, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.x_int = self._io.read_u4be()
            self.y_int = self._io.read_u4be()


        def _fetch_instances(self):
            pass

        @property
        def x(self):
            if hasattr(self, '_m_x'):
                return self._m_x

            self._m_x = self.x_int / 100000.0
            return getattr(self, '_m_x', None)

        @property
        def y(self):
            if hasattr(self, '_m_y'):
                return self._m_y

            self._m_y = self.y_int / 100000.0
            return getattr(self, '_m_y', None)


    class Rgb(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Png.Rgb, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.r = self._io.read_u1()
            self.g = self._io.read_u1()
            self.b = self._io.read_u1()


        def _fetch_instances(self):
            pass


    class SrgbChunk(KaitaiStruct):
        """
        .. seealso::
           Source - https://www.w3.org/TR/png/#11sRGB
        """

        class Intent(IntEnum):
            perceptual = 0
            relative_colorimetric = 1
            saturation = 2
            absolute_colorimetric = 3
        def __init__(self, _io, _parent=None, _root=None):
            super(Png.SrgbChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.render_intent = KaitaiStream.resolve_enum(Png.SrgbChunk.Intent, self._io.read_u1())


        def _fetch_instances(self):
            pass


    class TextChunk(KaitaiStruct):
        """Text chunk effectively allows to store key-value string pairs in
        PNG container. Both "key" (keyword) and "value" (text) parts are
        given in pre-defined subset of iso8859-1 without control
        characters.
        
        .. seealso::
           Source - https://www.w3.org/TR/png/#11tEXt
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Png.TextChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.keyword = (self._io.read_bytes_term(0, False, True, True)).decode(u"ISO-8859-1")
            self.text = (self._io.read_bytes_full()).decode(u"ISO-8859-1")


        def _fetch_instances(self):
            pass


    class TimeChunk(KaitaiStruct):
        """Time chunk stores time stamp of last modification of this image,
        up to 1 second precision in UTC timezone.
        
        .. seealso::
           Source - https://www.w3.org/TR/png/#11tIME
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Png.TimeChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.year = self._io.read_u2be()
            self.month = self._io.read_u1()
            self.day = self._io.read_u1()
            self.hour = self._io.read_u1()
            self.minute = self._io.read_u1()
            self.second = self._io.read_u1()


        def _fetch_instances(self):
            pass



