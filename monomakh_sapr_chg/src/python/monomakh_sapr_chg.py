# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class MonomakhSaprChg(KaitaiStruct):
    """CHG is a container format file used by
    [MONOMAKH-SAPR](https://www.liraland.com/mono/), a software
    package for analysis & design of reinforced concrete multi-storey
    buildings with arbitrary configuration in plan.
    
    CHG is a simple container, which bundles several project files
    together.
    
    Written and tested by Vladimir Shulzhitskiy, 2017
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(MonomakhSaprChg, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.title = (self._io.read_bytes(10)).decode(u"ASCII")
        self.ent = []
        i = 0
        while not self._io.is_eof():
            self.ent.append(MonomakhSaprChg.Block(self._io, self, self._root))
            i += 1



    def _fetch_instances(self):
        pass
        for i in range(len(self.ent)):
            pass
            self.ent[i]._fetch_instances()


    class Block(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(MonomakhSaprChg.Block, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.header = (self._io.read_bytes(13)).decode(u"ASCII")
            self.file_size = self._io.read_u8le()
            self.file = self._io.read_bytes(self.file_size)


        def _fetch_instances(self):
            pass



