# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum
import zlib


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Png(KaitaiStruct):

    class ColorType(Enum):
        greyscale = 0
        truecolor = 2
        indexed = 3
        greyscale_alpha = 4
        truecolor_alpha = 6

    class PhysUnit(Enum):
        unknown = 0
        meter = 1

    class CompressionMethods(Enum):
        zlib = 0
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.magic = self._io.ensure_fixed_contents(b"\x89\x50\x4E\x47\x0D\x0A\x1A\x0A")
        self.ihdr_len = self._io.ensure_fixed_contents(b"\x00\x00\x00\x0D")
        self.ihdr_type = self._io.ensure_fixed_contents(b"\x49\x48\x44\x52")
        self.ihdr = self._root.IhdrChunk(self._io, self, self._root)
        self.ihdr_crc = self._io.read_bytes(4)
        self.chunks = []
        i = 0
        while True:
            _ = self._root.Chunk(self._io, self, self._root)
            self.chunks.append(_)
            if  ((_.type == u"IEND") or (self._io.is_eof())) :
                break
            i += 1

    class Rgb(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.r = self._io.read_u1()
            self.g = self._io.read_u1()
            self.b = self._io.read_u1()


    class Chunk(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len = self._io.read_u4be()
            self.type = (self._io.read_bytes(4)).decode(u"UTF-8")
            _on = self.type
            if _on == u"iTXt":
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = self._root.InternationalTextChunk(_io__raw_body, self, self._root)
            elif _on == u"gAMA":
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = self._root.GamaChunk(_io__raw_body, self, self._root)
            elif _on == u"tIME":
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = self._root.TimeChunk(_io__raw_body, self, self._root)
            elif _on == u"PLTE":
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = self._root.PlteChunk(_io__raw_body, self, self._root)
            elif _on == u"bKGD":
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = self._root.BkgdChunk(_io__raw_body, self, self._root)
            elif _on == u"pHYs":
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = self._root.PhysChunk(_io__raw_body, self, self._root)
            elif _on == u"tEXt":
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = self._root.TextChunk(_io__raw_body, self, self._root)
            elif _on == u"cHRM":
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = self._root.ChrmChunk(_io__raw_body, self, self._root)
            elif _on == u"sRGB":
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = self._root.SrgbChunk(_io__raw_body, self, self._root)
            elif _on == u"zTXt":
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = self._root.CompressedTextChunk(_io__raw_body, self, self._root)
            else:
                self.body = self._io.read_bytes(self.len)
            self.crc = self._io.read_bytes(4)


    class BkgdIndexed(KaitaiStruct):
        """Background chunk for images with indexed palette."""
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.palette_index = self._io.read_u1()


    class Point(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.x_int = self._io.read_u4be()
            self.y_int = self._io.read_u4be()

        @property
        def x(self):
            if hasattr(self, '_m_x'):
                return self._m_x if hasattr(self, '_m_x') else None

            self._m_x = (self.x_int / 100000.0)
            return self._m_x if hasattr(self, '_m_x') else None

        @property
        def y(self):
            if hasattr(self, '_m_y'):
                return self._m_y if hasattr(self, '_m_y') else None

            self._m_y = (self.y_int / 100000.0)
            return self._m_y if hasattr(self, '_m_y') else None


    class BkgdGreyscale(KaitaiStruct):
        """Background chunk for greyscale images."""
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.value = self._io.read_u2be()


    class ChrmChunk(KaitaiStruct):
        """
        .. seealso::
           Source - https://www.w3.org/TR/PNG/#11cHRM
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.white_point = self._root.Point(self._io, self, self._root)
            self.red = self._root.Point(self._io, self, self._root)
            self.green = self._root.Point(self._io, self, self._root)
            self.blue = self._root.Point(self._io, self, self._root)


    class IhdrChunk(KaitaiStruct):
        """
        .. seealso::
           Source - https://www.w3.org/TR/PNG/#11IHDR
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.width = self._io.read_u4be()
            self.height = self._io.read_u4be()
            self.bit_depth = self._io.read_u1()
            self.color_type = KaitaiStream.resolve_enum(self._root.ColorType, self._io.read_u1())
            self.compression_method = self._io.read_u1()
            self.filter_method = self._io.read_u1()
            self.interlace_method = self._io.read_u1()


    class PlteChunk(KaitaiStruct):
        """
        .. seealso::
           Source - https://www.w3.org/TR/PNG/#11PLTE
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                self.entries.append(self._root.Rgb(self._io, self, self._root))
                i += 1



    class SrgbChunk(KaitaiStruct):
        """
        .. seealso::
           Source - https://www.w3.org/TR/PNG/#11sRGB
        """

        class Intent(Enum):
            perceptual = 0
            relative_colorimetric = 1
            saturation = 2
            absolute_colorimetric = 3
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.render_intent = KaitaiStream.resolve_enum(self._root.SrgbChunk.Intent, self._io.read_u1())


    class CompressedTextChunk(KaitaiStruct):
        """Compressed text chunk effectively allows to store key-value
        string pairs in PNG container, compressing "value" part (which
        can be quite lengthy) with zlib compression.
        
        .. seealso::
           Source - https://www.w3.org/TR/PNG/#11zTXt
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.keyword = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
            self.compression_method = KaitaiStream.resolve_enum(self._root.CompressionMethods, self._io.read_u1())
            self._raw_text_datastream = self._io.read_bytes_full()
            self.text_datastream = zlib.decompress(self._raw_text_datastream)


    class BkgdTruecolor(KaitaiStruct):
        """Background chunk for truecolor images."""
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.red = self._io.read_u2be()
            self.green = self._io.read_u2be()
            self.blue = self._io.read_u2be()


    class GamaChunk(KaitaiStruct):
        """
        .. seealso::
           Source - https://www.w3.org/TR/PNG/#11gAMA
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.gamma_int = self._io.read_u4be()

        @property
        def gamma_ratio(self):
            if hasattr(self, '_m_gamma_ratio'):
                return self._m_gamma_ratio if hasattr(self, '_m_gamma_ratio') else None

            self._m_gamma_ratio = (100000.0 / self.gamma_int)
            return self._m_gamma_ratio if hasattr(self, '_m_gamma_ratio') else None


    class BkgdChunk(KaitaiStruct):
        """Background chunk stores default background color to display this
        image against. Contents depend on `color_type` of the image.
        
        .. seealso::
           Source - https://www.w3.org/TR/PNG/#11bKGD
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            _on = self._root.ihdr.color_type
            if _on == self._root.ColorType.indexed:
                self.bkgd = self._root.BkgdIndexed(self._io, self, self._root)
            elif _on == self._root.ColorType.truecolor_alpha:
                self.bkgd = self._root.BkgdTruecolor(self._io, self, self._root)
            elif _on == self._root.ColorType.greyscale_alpha:
                self.bkgd = self._root.BkgdGreyscale(self._io, self, self._root)
            elif _on == self._root.ColorType.truecolor:
                self.bkgd = self._root.BkgdTruecolor(self._io, self, self._root)
            elif _on == self._root.ColorType.greyscale:
                self.bkgd = self._root.BkgdGreyscale(self._io, self, self._root)


    class PhysChunk(KaitaiStruct):
        """"Physical size" chunk stores data that allows to translate
        logical pixels into physical units (meters, etc) and vice-versa.
        
        .. seealso::
           Source - https://www.w3.org/TR/PNG/#11pHYs
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.pixels_per_unit_x = self._io.read_u4be()
            self.pixels_per_unit_y = self._io.read_u4be()
            self.unit = KaitaiStream.resolve_enum(self._root.PhysUnit, self._io.read_u1())


    class InternationalTextChunk(KaitaiStruct):
        """International text chunk effectively allows to store key-value string pairs in
        PNG container. Both "key" (keyword) and "value" (text) parts are
        given in pre-defined subset of iso8859-1 without control
        characters.
        
        .. seealso::
           Source - https://www.w3.org/TR/PNG/#11iTXt
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.keyword = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
            self.compression_flag = self._io.read_u1()
            self.compression_method = KaitaiStream.resolve_enum(self._root.CompressionMethods, self._io.read_u1())
            self.language_tag = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
            self.translated_keyword = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
            self.text = (self._io.read_bytes_full()).decode(u"UTF-8")


    class TextChunk(KaitaiStruct):
        """Text chunk effectively allows to store key-value string pairs in
        PNG container. Both "key" (keyword) and "value" (text) parts are
        given in pre-defined subset of iso8859-1 without control
        characters.
        
        .. seealso::
           Source - https://www.w3.org/TR/PNG/#11tEXt
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.keyword = (self._io.read_bytes_term(0, False, True, True)).decode(u"iso8859-1")
            self.text = (self._io.read_bytes_full()).decode(u"iso8859-1")


    class TimeChunk(KaitaiStruct):
        """Time chunk stores time stamp of last modification of this image,
        up to 1 second precision in UTC timezone.
        
        .. seealso::
           Source - https://www.w3.org/TR/PNG/#11tIME
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.year = self._io.read_u2be()
            self.month = self._io.read_u1()
            self.day = self._io.read_u1()
            self.hour = self._io.read_u1()
            self.minute = self._io.read_u1()
            self.second = self._io.read_u1()



