# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class Respack(KaitaiStruct):
    """Resource file found in CPB firmware archives, mostly used on older CoolPad
    phones and/or tablets. The only observed files are called "ResPack.cfg".
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.header = Respack.Header(self._io, self, self._root)
        self.json = (self._io.read_bytes(self.header.len_json)).decode(u"UTF-8")

    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.read_bytes(2)
            if not self.magic == b"\x52\x53":
                raise kaitaistruct.ValidationNotEqualError(b"\x52\x53", self.magic, self._io, u"/types/header/seq/0")
            self.unknown = self._io.read_bytes(8)
            self.len_json = self._io.read_u4le()
            self.md5 = (self._io.read_bytes(32)).decode(u"UTF-8")



