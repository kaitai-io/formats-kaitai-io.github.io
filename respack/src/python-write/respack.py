# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Respack(ReadWriteKaitaiStruct):
    """Resource file found in CPB firmware archives, mostly used on older CoolPad
    phones and/or tablets. The only observed files are called "ResPack.cfg".
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Respack, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header = Respack.Header(self._io, self, self._root)
        self.header._read()
        self.json = (self._io.read_bytes(self.header.len_json)).decode(u"UTF-8")
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()


    def _write__seq(self, io=None):
        super(Respack, self)._write__seq(io)
        self.header._write__seq(self._io)
        self._io.write_bytes((self.json).encode(u"UTF-8"))


    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if len((self.json).encode(u"UTF-8")) != self.header.len_json:
            raise kaitaistruct.ConsistencyError(u"json", self.header.len_json, len((self.json).encode(u"UTF-8")))
        self._dirty = False

    class Header(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Respack.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(2)
            if not self.magic == b"\x52\x53":
                raise kaitaistruct.ValidationNotEqualError(b"\x52\x53", self.magic, self._io, u"/types/header/seq/0")
            self.unknown = self._io.read_bytes(8)
            self.len_json = self._io.read_u4le()
            self.md5 = (self._io.read_bytes(32)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Respack.Header, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_bytes(self.unknown)
            self._io.write_u4le(self.len_json)
            self._io.write_bytes((self.md5).encode(u"UTF-8"))


        def _check(self):
            if len(self.magic) != 2:
                raise kaitaistruct.ConsistencyError(u"magic", 2, len(self.magic))
            if not self.magic == b"\x52\x53":
                raise kaitaistruct.ValidationNotEqualError(b"\x52\x53", self.magic, None, u"/types/header/seq/0")
            if len(self.unknown) != 8:
                raise kaitaistruct.ConsistencyError(u"unknown", 8, len(self.unknown))
            if len((self.md5).encode(u"UTF-8")) != 32:
                raise kaitaistruct.ConsistencyError(u"md5", 32, len((self.md5).encode(u"UTF-8")))
            self._dirty = False



