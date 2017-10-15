# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
import struct


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class NtMdtPal(KaitaiStruct):
    """It is a color scheme for visualising SPM scans."""
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.signature = self._io.ensure_fixed_contents(struct.pack('26b', 78, 84, 45, 77, 68, 84, 32, 80, 97, 108, 101, 116, 116, 101, 32, 70, 105, 108, 101, 32, 32, 49, 46, 48, 48, 33))
        self.count = self._io.read_u4be()
        self.meta = [None] * (self.count)
        for i in range(self.count):
            self.meta[i] = self._root.Meta(self._io, self, self._root)

        self.something2 = self._io.read_bytes(1)
        self.tables = [None] * (self.count)
        for i in range(self.count):
            self.tables[i] = self._root.ColTable(i, self._io, self, self._root)


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
                self.colors[i] = self._root.Color(self._io, self, self._root)




