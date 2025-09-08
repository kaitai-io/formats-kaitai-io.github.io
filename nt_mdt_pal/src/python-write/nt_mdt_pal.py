# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class NtMdtPal(ReadWriteKaitaiStruct):
    """It is a color scheme for visualising SPM scans."""
    def __init__(self, _io=None, _parent=None, _root=None):
        super(NtMdtPal, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.signature = self._io.read_bytes(26)
        if not self.signature == b"\x4E\x54\x2D\x4D\x44\x54\x20\x50\x61\x6C\x65\x74\x74\x65\x20\x46\x69\x6C\x65\x20\x20\x31\x2E\x30\x30\x21":
            raise kaitaistruct.ValidationNotEqualError(b"\x4E\x54\x2D\x4D\x44\x54\x20\x50\x61\x6C\x65\x74\x74\x65\x20\x46\x69\x6C\x65\x20\x20\x31\x2E\x30\x30\x21", self.signature, self._io, u"/seq/0")
        self.count = self._io.read_u4be()
        self.meta = []
        for i in range(self.count):
            _t_meta = NtMdtPal.Meta(self._io, self, self._root)
            try:
                _t_meta._read()
            finally:
                self.meta.append(_t_meta)

        self.something2 = self._io.read_bytes(1)
        self.tables = []
        for i in range(self.count):
            _t_tables = NtMdtPal.ColTable(i, self._io, self, self._root)
            try:
                _t_tables._read()
            finally:
                self.tables.append(_t_tables)

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.meta)):
            pass
            self.meta[i]._fetch_instances()

        for i in range(len(self.tables)):
            pass
            self.tables[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(NtMdtPal, self)._write__seq(io)
        self._io.write_bytes(self.signature)
        self._io.write_u4be(self.count)
        for i in range(len(self.meta)):
            pass
            self.meta[i]._write__seq(self._io)

        self._io.write_bytes(self.something2)
        for i in range(len(self.tables)):
            pass
            self.tables[i]._write__seq(self._io)



    def _check(self):
        if len(self.signature) != 26:
            raise kaitaistruct.ConsistencyError(u"signature", 26, len(self.signature))
        if not self.signature == b"\x4E\x54\x2D\x4D\x44\x54\x20\x50\x61\x6C\x65\x74\x74\x65\x20\x46\x69\x6C\x65\x20\x20\x31\x2E\x30\x30\x21":
            raise kaitaistruct.ValidationNotEqualError(b"\x4E\x54\x2D\x4D\x44\x54\x20\x50\x61\x6C\x65\x74\x74\x65\x20\x46\x69\x6C\x65\x20\x20\x31\x2E\x30\x30\x21", self.signature, None, u"/seq/0")
        if len(self.meta) != self.count:
            raise kaitaistruct.ConsistencyError(u"meta", self.count, len(self.meta))
        for i in range(len(self.meta)):
            pass
            if self.meta[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"meta", self._root, self.meta[i]._root)
            if self.meta[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"meta", self, self.meta[i]._parent)

        if len(self.something2) != 1:
            raise kaitaistruct.ConsistencyError(u"something2", 1, len(self.something2))
        if len(self.tables) != self.count:
            raise kaitaistruct.ConsistencyError(u"tables", self.count, len(self.tables))
        for i in range(len(self.tables)):
            pass
            if self.tables[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"tables", self._root, self.tables[i]._root)
            if self.tables[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"tables", self, self.tables[i]._parent)
            if self.tables[i].index != i:
                raise kaitaistruct.ConsistencyError(u"tables", i, self.tables[i].index)

        self._dirty = False

    class ColTable(ReadWriteKaitaiStruct):
        def __init__(self, index, _io=None, _parent=None, _root=None):
            super(NtMdtPal.ColTable, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.index = index

        def _read(self):
            self.size1 = self._io.read_u1()
            self.unkn = self._io.read_u1()
            self.title = (self._io.read_bytes(self._root.meta[self.index].name_size)).decode(u"UTF-16LE")
            self.unkn1 = self._io.read_u2be()
            self.colors = []
            for i in range(self._root.meta[self.index].colors_count - 1):
                _t_colors = NtMdtPal.Color(self._io, self, self._root)
                try:
                    _t_colors._read()
                finally:
                    self.colors.append(_t_colors)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.colors)):
                pass
                self.colors[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(NtMdtPal.ColTable, self)._write__seq(io)
            self._io.write_u1(self.size1)
            self._io.write_u1(self.unkn)
            self._io.write_bytes((self.title).encode(u"UTF-16LE"))
            self._io.write_u2be(self.unkn1)
            for i in range(len(self.colors)):
                pass
                self.colors[i]._write__seq(self._io)



        def _check(self):
            if len((self.title).encode(u"UTF-16LE")) != self._root.meta[self.index].name_size:
                raise kaitaistruct.ConsistencyError(u"title", self._root.meta[self.index].name_size, len((self.title).encode(u"UTF-16LE")))
            if len(self.colors) != self._root.meta[self.index].colors_count - 1:
                raise kaitaistruct.ConsistencyError(u"colors", self._root.meta[self.index].colors_count - 1, len(self.colors))
            for i in range(len(self.colors)):
                pass
                if self.colors[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"colors", self._root, self.colors[i]._root)
                if self.colors[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"colors", self, self.colors[i]._parent)

            self._dirty = False


    class Color(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(NtMdtPal.Color, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.red = self._io.read_u1()
            self.unkn = self._io.read_u1()
            self.blue = self._io.read_u1()
            self.green = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(NtMdtPal.Color, self)._write__seq(io)
            self._io.write_u1(self.red)
            self._io.write_u1(self.unkn)
            self._io.write_u1(self.blue)
            self._io.write_u1(self.green)


        def _check(self):
            self._dirty = False


    class Meta(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(NtMdtPal.Meta, self).__init__(_io)
            self._parent = _parent
            self._root = _root

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
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(NtMdtPal.Meta, self)._write__seq(io)
            self._io.write_bytes(self.unkn00)
            self._io.write_bytes(self.unkn01)
            self._io.write_bytes(self.unkn02)
            self._io.write_bytes(self.unkn03)
            self._io.write_u2le(self.colors_count)
            self._io.write_bytes(self.unkn10)
            self._io.write_bytes(self.unkn11)
            self._io.write_bytes(self.unkn12)
            self._io.write_u2be(self.name_size)


        def _check(self):
            if len(self.unkn00) != 3:
                raise kaitaistruct.ConsistencyError(u"unkn00", 3, len(self.unkn00))
            if len(self.unkn01) != 2:
                raise kaitaistruct.ConsistencyError(u"unkn01", 2, len(self.unkn01))
            if len(self.unkn02) != 1:
                raise kaitaistruct.ConsistencyError(u"unkn02", 1, len(self.unkn02))
            if len(self.unkn03) != 1:
                raise kaitaistruct.ConsistencyError(u"unkn03", 1, len(self.unkn03))
            if len(self.unkn10) != 2:
                raise kaitaistruct.ConsistencyError(u"unkn10", 2, len(self.unkn10))
            if len(self.unkn11) != 1:
                raise kaitaistruct.ConsistencyError(u"unkn11", 1, len(self.unkn11))
            if len(self.unkn12) != 2:
                raise kaitaistruct.ConsistencyError(u"unkn12", 2, len(self.unkn12))
            self._dirty = False



