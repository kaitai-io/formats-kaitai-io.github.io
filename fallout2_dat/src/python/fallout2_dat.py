# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum
import zlib


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Fallout2Dat(KaitaiStruct):

    class Compression(IntEnum):
        none = 0
        zlib = 1
    def __init__(self, _io, _parent=None, _root=None):
        super(Fallout2Dat, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        pass


    def _fetch_instances(self):
        pass
        _ = self.footer
        if hasattr(self, '_m_footer'):
            pass
            self._m_footer._fetch_instances()

        _ = self.index
        if hasattr(self, '_m_index'):
            pass
            self._m_index._fetch_instances()


    class File(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Fallout2Dat.File, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.name = Fallout2Dat.Pstr(self._io, self, self._root)
            self.flags = KaitaiStream.resolve_enum(Fallout2Dat.Compression, self._io.read_u1())
            self.size_unpacked = self._io.read_u4le()
            self.size_packed = self._io.read_u4le()
            self.offset = self._io.read_u4le()


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()
            _ = self.contents_raw
            if hasattr(self, '_m_contents_raw'):
                pass

            _ = self.contents_zlib
            if hasattr(self, '_m_contents_zlib'):
                pass


        @property
        def contents(self):
            if hasattr(self, '_m_contents'):
                return self._m_contents

            if  ((self.flags == Fallout2Dat.Compression.zlib) or (self.flags == Fallout2Dat.Compression.none)) :
                pass
                self._m_contents = (self.contents_zlib if self.flags == Fallout2Dat.Compression.zlib else self.contents_raw)

            return getattr(self, '_m_contents', None)

        @property
        def contents_raw(self):
            if hasattr(self, '_m_contents_raw'):
                return self._m_contents_raw

            if self.flags == Fallout2Dat.Compression.none:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.offset)
                self._m_contents_raw = io.read_bytes(self.size_unpacked)
                io.seek(_pos)

            return getattr(self, '_m_contents_raw', None)

        @property
        def contents_zlib(self):
            if hasattr(self, '_m_contents_zlib'):
                return self._m_contents_zlib

            if self.flags == Fallout2Dat.Compression.zlib:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.offset)
                self._raw__m_contents_zlib = io.read_bytes(self.size_packed)
                self._m_contents_zlib = zlib.decompress(self._raw__m_contents_zlib)
                io.seek(_pos)

            return getattr(self, '_m_contents_zlib', None)


    class Footer(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Fallout2Dat.Footer, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.index_size = self._io.read_u4le()
            self.file_size = self._io.read_u4le()


        def _fetch_instances(self):
            pass


    class Index(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Fallout2Dat.Index, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.file_count = self._io.read_u4le()
            self.files = []
            for i in range(self.file_count):
                self.files.append(Fallout2Dat.File(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.files)):
                pass
                self.files[i]._fetch_instances()



    class Pstr(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Fallout2Dat.Pstr, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.size = self._io.read_u4le()
            self.str = (self._io.read_bytes(self.size)).decode(u"ASCII")


        def _fetch_instances(self):
            pass


    @property
    def footer(self):
        if hasattr(self, '_m_footer'):
            return self._m_footer

        _pos = self._io.pos()
        self._io.seek(self._io.size() - 8)
        self._m_footer = Fallout2Dat.Footer(self._io, self, self._root)
        self._io.seek(_pos)
        return getattr(self, '_m_footer', None)

    @property
    def index(self):
        if hasattr(self, '_m_index'):
            return self._m_index

        _pos = self._io.pos()
        self._io.seek((self._io.size() - 8) - self.footer.index_size)
        self._m_index = Fallout2Dat.Index(self._io, self, self._root)
        self._io.seek(_pos)
        return getattr(self, '_m_index', None)


