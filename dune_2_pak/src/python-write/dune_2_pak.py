# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Dune2Pak(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://moddingwiki.shikadi.net/wiki/PAK_Format_(Westwood)
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Dune2Pak, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_dir_size = False
        self.dir_size__enabled = True

    def _read(self):
        self._raw_dir = self._io.read_bytes(self.dir_size)
        _io__raw_dir = KaitaiStream(BytesIO(self._raw_dir))
        self.dir = Dune2Pak.Files(_io__raw_dir, self, self._root)
        self.dir._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.dir._fetch_instances()
        _ = self.dir_size
        if hasattr(self, '_m_dir_size'):
            pass



    def _write__seq(self, io=None):
        super(Dune2Pak, self)._write__seq(io)
        self._should_write_dir_size = self.dir_size__enabled
        _io__raw_dir = KaitaiStream(BytesIO(bytearray(self.dir_size)))
        self._io.add_child_stream(_io__raw_dir)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.dir_size))
        def handler(parent, _io__raw_dir=_io__raw_dir):
            self._raw_dir = _io__raw_dir.to_byte_array()
            if len(self._raw_dir) != self.dir_size:
                raise kaitaistruct.ConsistencyError(u"raw(dir)", self.dir_size, len(self._raw_dir))
            parent.write_bytes(self._raw_dir)
        _io__raw_dir.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.dir._write__seq(_io__raw_dir)


    def _check(self):
        if self.dir._root != self._root:
            raise kaitaistruct.ConsistencyError(u"dir", self._root, self.dir._root)
        if self.dir._parent != self:
            raise kaitaistruct.ConsistencyError(u"dir", self, self.dir._parent)
        if self.dir_size__enabled:
            pass

        self._dirty = False

    class File(ReadWriteKaitaiStruct):
        def __init__(self, idx, _io=None, _parent=None, _root=None):
            super(Dune2Pak.File, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.idx = idx
            self._should_write_body = False
            self.body__enabled = True

        def _read(self):
            self.ofs = self._io.read_u4le()
            if self.ofs != 0:
                pass
                self.file_name = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.ofs != 0:
                pass

            _ = self.body
            if hasattr(self, '_m_body'):
                pass



        def _write__seq(self, io=None):
            super(Dune2Pak.File, self)._write__seq(io)
            self._should_write_body = self.body__enabled
            self._io.write_u4le(self.ofs)
            if self.ofs != 0:
                pass
                self._io.write_bytes((self.file_name).encode(u"ASCII"))
                self._io.write_u1(0)



        def _check(self):
            if self.ofs != 0:
                pass
                if KaitaiStream.byte_array_index_of((self.file_name).encode(u"ASCII"), 0) != -1:
                    raise kaitaistruct.ConsistencyError(u"file_name", -1, KaitaiStream.byte_array_index_of((self.file_name).encode(u"ASCII"), 0))

            if self.body__enabled:
                pass
                if self.ofs != 0:
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

            if self.ofs != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs)
                self._m_body = io.read_bytes(self.next_ofs - self.ofs)
                io.seek(_pos)

            return getattr(self, '_m_body', None)

        @body.setter
        def body(self, v):
            self._dirty = True
            self._m_body = v

        def _write_body(self):
            self._should_write_body = False
            if self.ofs != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs)
                if len(self._m_body) != self.next_ofs - self.ofs:
                    raise kaitaistruct.ConsistencyError(u"body", self.next_ofs - self.ofs, len(self._m_body))
                io.write_bytes(self._m_body)
                io.seek(_pos)


        @property
        def next_ofs(self):
            if hasattr(self, '_m_next_ofs'):
                return self._m_next_ofs

            if self.ofs != 0:
                pass
                self._m_next_ofs = (self._root._io.size() if self.next_ofs0 == 0 else self.next_ofs0)

            return getattr(self, '_m_next_ofs', None)

        def _invalidate_next_ofs(self):
            del self._m_next_ofs
        @property
        def next_ofs0(self):
            if hasattr(self, '_m_next_ofs0'):
                return self._m_next_ofs0

            if self.ofs != 0:
                pass
                self._m_next_ofs0 = self._root.dir.files[self.idx + 1].ofs

            return getattr(self, '_m_next_ofs0', None)

        def _invalidate_next_ofs0(self):
            del self._m_next_ofs0

    class Files(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dune2Pak.Files, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.files = []
            i = 0
            while not self._io.is_eof():
                _t_files = Dune2Pak.File(i, self._io, self, self._root)
                try:
                    _t_files._read()
                finally:
                    self.files.append(_t_files)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.files)):
                pass
                self.files[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Dune2Pak.Files, self)._write__seq(io)
            for i in range(len(self.files)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"files", 0, self._io.size() - self._io.pos())
                self.files[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"files", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.files)):
                pass
                if self.files[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"files", self._root, self.files[i]._root)
                if self.files[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"files", self, self.files[i]._parent)
                if self.files[i].idx != i:
                    raise kaitaistruct.ConsistencyError(u"files", i, self.files[i].idx)

            self._dirty = False


    @property
    def dir_size(self):
        if self._should_write_dir_size:
            self._write_dir_size()
        if hasattr(self, '_m_dir_size'):
            return self._m_dir_size

        if not self.dir_size__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(0)
        self._m_dir_size = self._io.read_u4le()
        self._io.seek(_pos)
        return getattr(self, '_m_dir_size', None)

    @dir_size.setter
    def dir_size(self, v):
        self._dirty = True
        self._m_dir_size = v

    def _write_dir_size(self):
        self._should_write_dir_size = False
        _pos = self._io.pos()
        self._io.seek(0)
        self._io.write_u4le(self._m_dir_size)
        self._io.seek(_pos)


