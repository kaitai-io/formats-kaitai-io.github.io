# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class FalloutDat(KaitaiStruct):

    class Compression(Enum):
        none = 32
        lzss = 64
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.folder_count = self._io.read_u4be()
        self.unknown1 = self._io.read_u4be()
        self.unknown2 = self._io.read_u4be()
        self.timestamp = self._io.read_u4be()
        self.folder_names = []
        for i in range(self.folder_count):
            self.folder_names.append(FalloutDat.Pstr(self._io, self, self._root))

        self.folders = []
        for i in range(self.folder_count):
            self.folders.append(FalloutDat.Folder(self._io, self, self._root))


    class Pstr(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.size = self._io.read_u1()
            self.str = (self._io.read_bytes(self.size)).decode(u"ASCII")


    class Folder(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.file_count = self._io.read_u4be()
            self.unknown = self._io.read_u4be()
            self.flags = self._io.read_u4be()
            self.timestamp = self._io.read_u4be()
            self.files = []
            for i in range(self.file_count):
                self.files.append(FalloutDat.File(self._io, self, self._root))



    class File(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.name = FalloutDat.Pstr(self._io, self, self._root)
            self.flags = KaitaiStream.resolve_enum(FalloutDat.Compression, self._io.read_u4be())
            self.offset = self._io.read_u4be()
            self.size_unpacked = self._io.read_u4be()
            self.size_packed = self._io.read_u4be()

        @property
        def contents(self):
            if hasattr(self, '_m_contents'):
                return self._m_contents

            io = self._root._io
            _pos = io.pos()
            io.seek(self.offset)
            self._m_contents = io.read_bytes((self.size_unpacked if self.flags == FalloutDat.Compression.none else self.size_packed))
            io.seek(_pos)
            return getattr(self, '_m_contents', None)



