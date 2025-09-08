# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class HeroesOfMightAndMagicBmp(ReadWriteKaitaiStruct):
    def __init__(self, _io=None, _parent=None, _root=None):
        super(HeroesOfMightAndMagicBmp, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = self._io.read_u2le()
        self.width = self._io.read_u2le()
        self.height = self._io.read_u2le()
        self.data = self._io.read_bytes(self.width * self.height)
        self._dirty = False


    def _fetch_instances(self):
        pass


    def _write__seq(self, io=None):
        super(HeroesOfMightAndMagicBmp, self)._write__seq(io)
        self._io.write_u2le(self.magic)
        self._io.write_u2le(self.width)
        self._io.write_u2le(self.height)
        self._io.write_bytes(self.data)


    def _check(self):
        if len(self.data) != self.width * self.height:
            raise kaitaistruct.ConsistencyError(u"data", self.width * self.height, len(self.data))
        self._dirty = False


