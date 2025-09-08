# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import pcx


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class PcxDcx(ReadWriteKaitaiStruct):
    """DCX is a simple extension of PCX image format allowing to bundle
    many PCX images (typically, pages of a document) in one file. It saw
    some limited use in DOS-era fax software, but was largely
    superseded with multi-page TIFFs and PDFs since then.
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(PcxDcx, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\xB1\x68\xDE\x3A":
            raise kaitaistruct.ValidationNotEqualError(b"\xB1\x68\xDE\x3A", self.magic, self._io, u"/seq/0")
        self.files = []
        i = 0
        while True:
            _t_files = PcxDcx.PcxOffset(self._io, self, self._root)
            try:
                _t_files._read()
            finally:
                _ = _t_files
                self.files.append(_)
            if _.ofs_body == 0:
                break
            i += 1
        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.files)):
            pass
            self.files[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(PcxDcx, self)._write__seq(io)
        self._io.write_bytes(self.magic)
        for i in range(len(self.files)):
            pass
            self.files[i]._write__seq(self._io)



    def _check(self):
        if len(self.magic) != 4:
            raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
        if not self.magic == b"\xB1\x68\xDE\x3A":
            raise kaitaistruct.ValidationNotEqualError(b"\xB1\x68\xDE\x3A", self.magic, None, u"/seq/0")
        if len(self.files) == 0:
            raise kaitaistruct.ConsistencyError(u"files", 0, len(self.files))
        for i in range(len(self.files)):
            pass
            if self.files[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"files", self._root, self.files[i]._root)
            if self.files[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"files", self, self.files[i]._parent)
            _ = self.files[i]
            if (_.ofs_body == 0) != (i == len(self.files) - 1):
                raise kaitaistruct.ConsistencyError(u"files", i == len(self.files) - 1, _.ofs_body == 0)

        self._dirty = False

    class PcxOffset(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PcxDcx.PcxOffset, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_body = False
            self.body__enabled = True

        def _read(self):
            self.ofs_body = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.body
            if hasattr(self, '_m_body'):
                pass
                self._m_body._fetch_instances()



        def _write__seq(self, io=None):
            super(PcxDcx.PcxOffset, self)._write__seq(io)
            self._should_write_body = self.body__enabled
            self._io.write_u4le(self.ofs_body)


        def _check(self):
            if self.body__enabled:
                pass
                if self.ofs_body != 0:
                    pass


            self._dirty = False

        @property
        def body(self):
            if self._should_write_body:
                self._write_body()
            if hasattr(self, '_m_body'):
                return self._m_body

            if not self.body__enabled:
                return None

            if self.ofs_body != 0:
                pass
                _pos = self._io.pos()
                self._io.seek(self.ofs_body)
                self._m_body = pcx.Pcx(self._io)
                self._m_body._read()
                self._io.seek(_pos)

            return getattr(self, '_m_body', None)

        @body.setter
        def body(self, v):
            self._dirty = True
            self._m_body = v

        def _write_body(self):
            self._should_write_body = False
            if self.ofs_body != 0:
                pass
                _pos = self._io.pos()
                self._io.seek(self.ofs_body)
                self._m_body._write__seq(self._io)
                self._io.seek(_pos)




