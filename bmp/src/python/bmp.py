# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Bmp(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.file_hdr = self._root.FileHeader(self._io, self, self._root)
        self.dib_hdr = self._root.DibHeader(self._io, self, self._root)

    class FileHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.file_type = self._io.read_bytes(2)
            self.file_size = self._io.read_u4le()
            self.reserved1 = self._io.read_u2le()
            self.reserved2 = self._io.read_u2le()
            self.bitmap_ofs = self._io.read_s4le()


    class DibHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.dib_header_size = self._io.read_s4le()
            if self.dib_header_size == 12:
                self._raw_bitmap_core_header = self._io.read_bytes((self.dib_header_size - 4))
                io = KaitaiStream(BytesIO(self._raw_bitmap_core_header))
                self.bitmap_core_header = self._root.BitmapCoreHeader(io, self, self._root)

            if self.dib_header_size == 40:
                self._raw_bitmap_info_header = self._io.read_bytes((self.dib_header_size - 4))
                io = KaitaiStream(BytesIO(self._raw_bitmap_info_header))
                self.bitmap_info_header = self._root.BitmapInfoHeader(io, self, self._root)

            if self.dib_header_size == 124:
                self._raw_bitmap_v5_header = self._io.read_bytes((self.dib_header_size - 4))
                io = KaitaiStream(BytesIO(self._raw_bitmap_v5_header))
                self.bitmap_v5_header = self._root.BitmapCoreHeader(io, self, self._root)

            if  ((self.dib_header_size != 12) and (self.dib_header_size != 40) and (self.dib_header_size != 124)) :
                self.dib_header_body = self._io.read_bytes((self.dib_header_size - 4))



    class BitmapCoreHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.image_width = self._io.read_u2le()
            self.image_height = self._io.read_u2le()
            self.num_planes = self._io.read_u2le()
            self.bits_per_pixel = self._io.read_u2le()


    class BitmapInfoHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.image_width = self._io.read_u4le()
            self.image_height = self._io.read_u4le()
            self.num_planes = self._io.read_u2le()
            self.bits_per_pixel = self._io.read_u2le()
            self.compression = self._io.read_u4le()
            self.size_image = self._io.read_u4le()
            self.x_px_per_m = self._io.read_u4le()
            self.y_px_per_m = self._io.read_u4le()
            self.num_colors_used = self._io.read_u4le()
            self.num_colors_important = self._io.read_u4le()


    @property
    def image(self):
        if hasattr(self, '_m_image'):
            return self._m_image if hasattr(self, '_m_image') else None

        _pos = self._io.pos()
        self._io.seek(self.file_hdr.bitmap_ofs)
        self._m_image = self._io.read_bytes_full()
        self._io.seek(_pos)
        return self._m_image if hasattr(self, '_m_image') else None


