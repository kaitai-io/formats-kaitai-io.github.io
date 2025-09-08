# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
import pcx


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class PcxDcx(KaitaiStruct):
    """DCX is a simple extension of PCX image format allowing to bundle
    many PCX images (typically, pages of a document) in one file. It saw
    some limited use in DOS-era fax software, but was largely
    superseded with multi-page TIFFs and PDFs since then.
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(PcxDcx, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\xB1\x68\xDE\x3A":
            raise kaitaistruct.ValidationNotEqualError(b"\xB1\x68\xDE\x3A", self.magic, self._io, u"/seq/0")
        self.files = []
        i = 0
        while True:
            _ = PcxDcx.PcxOffset(self._io, self, self._root)
            self.files.append(_)
            if _.ofs_body == 0:
                break
            i += 1


    def _fetch_instances(self):
        pass
        for i in range(len(self.files)):
            pass
            self.files[i]._fetch_instances()


    class PcxOffset(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(PcxDcx.PcxOffset, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.ofs_body = self._io.read_u4le()


        def _fetch_instances(self):
            pass
            _ = self.body
            if hasattr(self, '_m_body'):
                pass
                self._m_body._fetch_instances()


        @property
        def body(self):
            if hasattr(self, '_m_body'):
                return self._m_body

            if self.ofs_body != 0:
                pass
                _pos = self._io.pos()
                self._io.seek(self.ofs_body)
                self._m_body = pcx.Pcx(self._io)
                self._io.seek(_pos)

            return getattr(self, '_m_body', None)



