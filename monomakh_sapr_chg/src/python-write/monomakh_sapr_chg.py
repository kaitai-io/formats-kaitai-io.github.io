# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class MonomakhSaprChg(ReadWriteKaitaiStruct):
    """CHG is a container format file used by
    [MONOMAKH-SAPR](https://www.liraland.com/mono/), a software
    package for analysis & design of reinforced concrete multi-storey
    buildings with arbitrary configuration in plan.
    
    CHG is a simple container, which bundles several project files
    together.
    
    Written and tested by Vladimir Shulzhitskiy, 2017
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(MonomakhSaprChg, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.title = (self._io.read_bytes(10)).decode(u"ASCII")
        self.ent = []
        i = 0
        while not self._io.is_eof():
            _t_ent = MonomakhSaprChg.Block(self._io, self, self._root)
            try:
                _t_ent._read()
            finally:
                self.ent.append(_t_ent)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.ent)):
            pass
            self.ent[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(MonomakhSaprChg, self)._write__seq(io)
        self._io.write_bytes((self.title).encode(u"ASCII"))
        for i in range(len(self.ent)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"ent", 0, self._io.size() - self._io.pos())
            self.ent[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"ent", 0, self._io.size() - self._io.pos())


    def _check(self):
        if len((self.title).encode(u"ASCII")) != 10:
            raise kaitaistruct.ConsistencyError(u"title", 10, len((self.title).encode(u"ASCII")))
        for i in range(len(self.ent)):
            pass
            if self.ent[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"ent", self._root, self.ent[i]._root)
            if self.ent[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"ent", self, self.ent[i]._parent)

        self._dirty = False

    class Block(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MonomakhSaprChg.Block, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.header = (self._io.read_bytes(13)).decode(u"ASCII")
            self.file_size = self._io.read_u8le()
            self.file = self._io.read_bytes(self.file_size)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MonomakhSaprChg.Block, self)._write__seq(io)
            self._io.write_bytes((self.header).encode(u"ASCII"))
            self._io.write_u8le(self.file_size)
            self._io.write_bytes(self.file)


        def _check(self):
            if len((self.header).encode(u"ASCII")) != 13:
                raise kaitaistruct.ConsistencyError(u"header", 13, len((self.header).encode(u"ASCII")))
            if len(self.file) != self.file_size:
                raise kaitaistruct.ConsistencyError(u"file", self.file_size, len(self.file))
            self._dirty = False



