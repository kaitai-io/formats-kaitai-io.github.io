# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class NtMdtPal(KaitaiStruct):
    """It is a color scheme for visualising SPM scans."""
    def __init__(self, _io, _parent=None, _root=None):
        super(NtMdtPal, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.signature = self._io.read_bytes(26)
        if not self.signature == b"\x4E\x54\x2D\x4D\x44\x54\x20\x50\x61\x6C\x65\x74\x74\x65\x20\x46\x69\x6C\x65\x20\x20\x31\x2E\x30\x30\x21":
            raise kaitaistruct.ValidationNotEqualError(b"\x4E\x54\x2D\x4D\x44\x54\x20\x50\x61\x6C\x65\x74\x74\x65\x20\x46\x69\x6C\x65\x20\x20\x31\x2E\x30\x30\x21", self.signature, self._io, u"/seq/0")
        self.count = self._io.read_u4be()
        self.meta = []
        for i in range(self.count):
            self.meta.append(NtMdtPal.Meta(self._io, self, self._root))

        self.something2 = self._io.read_bytes(1)
        self.tables = []
        for i in range(self.count):
            self.tables.append(NtMdtPal.ColTable(i, self._io, self, self._root))



    def _fetch_instances(self):
        pass
        for i in range(len(self.meta)):
            pass
            self.meta[i]._fetch_instances()

        for i in range(len(self.tables)):
            pass
            self.tables[i]._fetch_instances()


    class ColTable(KaitaiStruct):
        def __init__(self, index, _io, _parent=None, _root=None):
            super(NtMdtPal.ColTable, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.index = index
            self._read()

        def _read(self):
            self.size1 = self._io.read_u1()
            self.unkn = self._io.read_u1()
            self.title = (self._io.read_bytes(self._root.meta[self.index].name_size)).decode(u"UTF-16LE")
            self.unkn1 = self._io.read_u2be()
            self.colors = []
            for i in range(self._root.meta[self.index].colors_count - 1):
                self.colors.append(NtMdtPal.Color(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.colors)):
                pass
                self.colors[i]._fetch_instances()



    class Color(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(NtMdtPal.Color, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.red = self._io.read_u1()
            self.unkn = self._io.read_u1()
            self.blue = self._io.read_u1()
            self.green = self._io.read_u1()


        def _fetch_instances(self):
            pass


    class Meta(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(NtMdtPal.Meta, self).__init__(_io)
            self._parent = _parent
            self._root = _root
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


        def _fetch_instances(self):
            pass



