# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class HashcatRestore(KaitaiStruct):
    """
    .. seealso::
       Source - https://hashcat.net/wiki/doku.php?id=restore
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(HashcatRestore, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.version = self._io.read_u4le()
        self.cwd = (KaitaiStream.bytes_terminate(self._io.read_bytes(256), 0, False)).decode(u"UTF-8")
        self.dicts_pos = self._io.read_u4le()
        self.masks_pos = self._io.read_u4le()
        self.padding = self._io.read_bytes(4)
        self.current_restore_point = self._io.read_u8le()
        self.argc = self._io.read_u4le()
        self.padding2 = self._io.read_bytes(12)
        self.argv = []
        for i in range(self.argc):
            self.argv.append((self._io.read_bytes_term(10, False, True, True)).decode(u"UTF-8"))



    def _fetch_instances(self):
        pass
        for i in range(len(self.argv)):
            pass



