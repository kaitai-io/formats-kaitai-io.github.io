# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class BytesWithIo(ReadWriteKaitaiStruct):
    """Helper type to work around Kaitai Struct not providing an `_io` member for plain byte arrays.
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(BytesWithIo, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.data = self._io.read_bytes_full()
        self._dirty = False


    def _fetch_instances(self):
        pass


    def _write__seq(self, io=None):
        super(BytesWithIo, self)._write__seq(io)
        self._io.write_bytes(self.data)
        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())


    def _check(self):
        self._dirty = False


