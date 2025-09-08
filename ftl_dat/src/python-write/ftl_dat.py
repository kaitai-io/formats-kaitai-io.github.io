# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class FtlDat(ReadWriteKaitaiStruct):
    def __init__(self, _io=None, _parent=None, _root=None):
        super(FtlDat, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.num_files = self._io.read_u4le()
        self.files = []
        for i in range(self.num_files):
            _t_files = FtlDat.File(self._io, self, self._root)
            try:
                _t_files._read()
            finally:
                self.files.append(_t_files)

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.files)):
            pass
            self.files[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(FtlDat, self)._write__seq(io)
        self._io.write_u4le(self.num_files)
        for i in range(len(self.files)):
            pass
            self.files[i]._write__seq(self._io)



    def _check(self):
        if len(self.files) != self.num_files:
            raise kaitaistruct.ConsistencyError(u"files", self.num_files, len(self.files))
        for i in range(len(self.files)):
            pass
            if self.files[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"files", self._root, self.files[i]._root)
            if self.files[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"files", self, self.files[i]._parent)

        self._dirty = False

    class File(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(FtlDat.File, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_meta = False
            self.meta__enabled = True

        def _read(self):
            self.ofs_meta = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.meta
            if hasattr(self, '_m_meta'):
                pass
                self._m_meta._fetch_instances()



        def _write__seq(self, io=None):
            super(FtlDat.File, self)._write__seq(io)
            self._should_write_meta = self.meta__enabled
            self._io.write_u4le(self.ofs_meta)


        def _check(self):
            if self.meta__enabled:
                pass
                if self.ofs_meta != 0:
                    pass
                    if self._m_meta._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"meta", self._root, self._m_meta._root)
                    if self._m_meta._parent != self:
                        raise kaitaistruct.ConsistencyError(u"meta", self, self._m_meta._parent)


            self._dirty = False

        @property
        def meta(self):
            if self._should_write_meta:
                self._write_meta()
            if hasattr(self, '_m_meta'):
                return self._m_meta

            if not self.meta__enabled:
                return None

            if self.ofs_meta != 0:
                pass
                _pos = self._io.pos()
                self._io.seek(self.ofs_meta)
                self._m_meta = FtlDat.Meta(self._io, self, self._root)
                self._m_meta._read()
                self._io.seek(_pos)

            return getattr(self, '_m_meta', None)

        @meta.setter
        def meta(self, v):
            self._dirty = True
            self._m_meta = v

        def _write_meta(self):
            self._should_write_meta = False
            if self.ofs_meta != 0:
                pass
                _pos = self._io.pos()
                self._io.seek(self.ofs_meta)
                self._m_meta._write__seq(self._io)
                self._io.seek(_pos)



    class Meta(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(FtlDat.Meta, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_file = self._io.read_u4le()
            self.len_filename = self._io.read_u4le()
            self.filename = (self._io.read_bytes(self.len_filename)).decode(u"UTF-8")
            self.body = self._io.read_bytes(self.len_file)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(FtlDat.Meta, self)._write__seq(io)
            self._io.write_u4le(self.len_file)
            self._io.write_u4le(self.len_filename)
            self._io.write_bytes((self.filename).encode(u"UTF-8"))
            self._io.write_bytes(self.body)


        def _check(self):
            if len((self.filename).encode(u"UTF-8")) != self.len_filename:
                raise kaitaistruct.ConsistencyError(u"filename", self.len_filename, len((self.filename).encode(u"UTF-8")))
            if len(self.body) != self.len_file:
                raise kaitaistruct.ConsistencyError(u"body", self.len_file, len(self.body))
            self._dirty = False



