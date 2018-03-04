# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum
import zlib


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

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
                self.files[i] = self._root.File(self._io, self, self._root)



    class File(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.name = self._root.Pstr(self._io, self, self._root)
            self.flags = self._root.Compression(self._io.read_u1())
            self.size_unpacked = self._io.read_u4le()
            self.size_packed = self._io.read_u4le()
            self.offset = self._io.read_u4le()

        @property
        def contents(self):
            if hasattr(self, '_m_contents'):
                return self._m_contents if hasattr(self, '_m_contents') else None

            if self.flags == self._root.Compression.zlib:
                io = self._root._io
                _pos = io.pos()
                io.seek(self.offset)
                self._raw__m_contents = io.read_bytes(self.size_packed)
                self._m_contents = zlib.decompress(self._raw__m_contents)
                io.seek(_pos)

            return self._m_contents if hasattr(self, '_m_contents') else None


    @property
    def footer(self):
        if hasattr(self, '_m_footer'):
            return self._m_footer if hasattr(self, '_m_footer') else None

        _pos = self._io.pos()
        self._io.seek((self._io.size() - 8))
        self._m_footer = self._root.Footer(self._io, self, self._root)
        self._io.seek(_pos)
        return self._m_footer if hasattr(self, '_m_footer') else None

    @property
    def index(self):
        if hasattr(self, '_m_index'):
            return self._m_index if hasattr(self, '_m_index') else None

        _pos = self._io.pos()
        self._io.seek(((self._io.size() - 8) - self.footer.index_size))
        self._m_index = self._root.Index(self._io, self, self._root)
        self._io.seek(_pos)
        return self._m_index if hasattr(self, '_m_index') else None


