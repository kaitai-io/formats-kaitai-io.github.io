# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum
import zlib


if parse_version(kaitaistruct.__version__) < parse_version('0.9'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class Fallout2Dat(KaitaiStruct):

    class Compression(Enum):
        none = 0
        zlib = 1
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        pass

    class Pstr(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.size = self._io.read_u4le()
            self.str = (self._io.read_bytes(self.size)).decode(u"ASCII")


    class Footer(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.index_size = self._io.read_u4le()
            self.file_size = self._io.read_u4le()


    class Index(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.file_count = self._io.read_u4le()
            self.files = [None] * (self.file_count)
            for i in range(self.file_count):
                self.files[i] = Fallout2Dat.File(self._io, self, self._root)



    class File(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.name = Fallout2Dat.Pstr(self._io, self, self._root)
            self.flags = KaitaiStream.resolve_enum(Fallout2Dat.Compression, self._io.read_u1())
            self.size_unpacked = self._io.read_u4le()
            self.size_packed = self._io.read_u4le()
            self.offset = self._io.read_u4le()

        @property
        def contents_raw(self):
            if hasattr(self, '_m_contents_raw'):
                return self._m_contents_raw if hasattr(self, '_m_contents_raw') else None

            if self.flags == Fallout2Dat.Compression.none:
                io = self._root._io
                _pos = io.pos()
                io.seek(self.offset)
                self._m_contents_raw = io.read_bytes(self.size_unpacked)
                io.seek(_pos)

            return self._m_contents_raw if hasattr(self, '_m_contents_raw') else None

        @property
        def contents_zlib(self):
            if hasattr(self, '_m_contents_zlib'):
                return self._m_contents_zlib if hasattr(self, '_m_contents_zlib') else None

            if self.flags == Fallout2Dat.Compression.zlib:
                io = self._root._io
                _pos = io.pos()
                io.seek(self.offset)
                self._raw__m_contents_zlib = io.read_bytes(self.size_packed)
                self._m_contents_zlib = zlib.decompress(self._raw__m_contents_zlib)
                io.seek(_pos)

            return self._m_contents_zlib if hasattr(self, '_m_contents_zlib') else None

        @property
        def contents(self):
            if hasattr(self, '_m_contents'):
                return self._m_contents if hasattr(self, '_m_contents') else None

            if  ((self.flags == Fallout2Dat.Compression.zlib) or (self.flags == Fallout2Dat.Compression.none)) :
                self._m_contents = (self.contents_zlib if self.flags == Fallout2Dat.Compression.zlib else self.contents_raw)

            return self._m_contents if hasattr(self, '_m_contents') else None


    @property
    def footer(self):
        if hasattr(self, '_m_footer'):
            return self._m_footer if hasattr(self, '_m_footer') else None

        _pos = self._io.pos()
        self._io.seek((self._io.size() - 8))
        self._m_footer = Fallout2Dat.Footer(self._io, self, self._root)
        self._io.seek(_pos)
        return self._m_footer if hasattr(self, '_m_footer') else None

    @property
    def index(self):
        if hasattr(self, '_m_index'):
            return self._m_index if hasattr(self, '_m_index') else None

        _pos = self._io.pos()
        self._io.seek(((self._io.size() - 8) - self.footer.index_size))
        self._m_index = Fallout2Dat.Index(self._io, self, self._root)
        self._io.seek(_pos)
        return self._m_index if hasattr(self, '_m_index') else None


