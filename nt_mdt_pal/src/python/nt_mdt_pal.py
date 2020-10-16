# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if parse_version(kaitaistruct.__version__) < parse_version('0.9'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class NtMdtPal(KaitaiStruct):
    """It is a color scheme for visualising SPM scans."""
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.signature = self._io.read_bytes(26)
        if not self.signature == b"\x4E\x54\x2D\x4D\x44\x54\x20\x50\x61\x6C\x65\x74\x74\x65\x20\x46\x69\x6C\x65\x20\x20\x31\x2E\x30\x30\x21":
            raise kaitaistruct.ValidationNotEqualError(b"\x4E\x54\x2D\x4D\x44\x54\x20\x50\x61\x6C\x65\x74\x74\x65\x20\x46\x69\x6C\x65\x20\x20\x31\x2E\x30\x30\x21", self.signature, self._io, u"/seq/0")
        self.count = self._io.read_u4be()
        self.meta = [None] * (self.count)
        for i in range(self.count):
            self.meta[i] = NtMdtPal.Meta(self._io, self, self._root)

        self.something2 = self._io.read_bytes(1)
        self.tables = [None] * (self.count)
        for i in range(self.count):
            self.tables[i] = NtMdtPal.ColTable(i, self._io, self, self._root)


    class Meta(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.unkn00 = self._io.read_bytes(3)
            self.unkn01 = self._io.read_bytes(2)
            self.unkn02 = self._io.read_bytes(1)
            self.unkn03 = self._io.read_bytes(1)
            self.colors_count = self._io.read_u2le()
            self.unkn10 = self._io.read_bytes(2)
            self.unkn11 = self._io.read_bytes(1)
            self.unkn12 = self._io.read_bytes(2)
            self.name_size = self._io.read_u2be()


    class Color(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.red = self._io.read_u1()
            self.unkn = self._io.read_u1()
            self.blue = self._io.read_u1()
            self.green = self._io.read_u1()


    class ColTable(KaitaiStruct):
        def __init__(self, index, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self.index = index
            self._read()

        def _read(self):
            self.size1 = self._io.read_u1()
            self.unkn = self._io.read_u1()
            self.title = (self._io.read_bytes(self._root.meta[self.index].name_size)).decode(u"UTF-16")
            self.unkn1 = self._io.read_u2be()
            self.colors = [None] * ((self._root.meta[self.index].colors_count - 1))
            for i in range((self._root.meta[self.index].colors_count - 1)):
                self.colors[i] = NtMdtPal.Color(self._io, self, self._root)




