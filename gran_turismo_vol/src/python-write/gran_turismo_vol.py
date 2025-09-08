# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class GranTurismoVol(ReadWriteKaitaiStruct):
    def __init__(self, _io=None, _parent=None, _root=None):
        super(GranTurismoVol, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_files = False
        self.files__enabled = True

    def _read(self):
        self.magic = self._io.read_bytes(8)
        if not self.magic == b"\x47\x54\x46\x53\x00\x00\x00\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x47\x54\x46\x53\x00\x00\x00\x00", self.magic, self._io, u"/seq/0")
        self.num_files = self._io.read_u2le()
        self.num_entries = self._io.read_u2le()
        self.reserved = self._io.read_bytes(4)
        if not self.reserved == b"\x00\x00\x00\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/seq/3")
        self.offsets = []
        for i in range(self.num_files):
            self.offsets.append(self._io.read_u4le())

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.offsets)):
            pass

        _ = self.files
        if hasattr(self, '_m_files'):
            pass
            for i in range(len(self._m_files)):
                pass
                self._m_files[i]._fetch_instances()




    def _write__seq(self, io=None):
        super(GranTurismoVol, self)._write__seq(io)
        self._should_write_files = self.files__enabled
        self._io.write_bytes(self.magic)
        self._io.write_u2le(self.num_files)
        self._io.write_u2le(self.num_entries)
        self._io.write_bytes(self.reserved)
        for i in range(len(self.offsets)):
            pass
            self._io.write_u4le(self.offsets[i])



    def _check(self):
        if len(self.magic) != 8:
            raise kaitaistruct.ConsistencyError(u"magic", 8, len(self.magic))
        if not self.magic == b"\x47\x54\x46\x53\x00\x00\x00\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x47\x54\x46\x53\x00\x00\x00\x00", self.magic, None, u"/seq/0")
        if len(self.reserved) != 4:
            raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
        if not self.reserved == b"\x00\x00\x00\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/seq/3")
        if len(self.offsets) != self.num_files:
            raise kaitaistruct.ConsistencyError(u"offsets", self.num_files, len(self.offsets))
        for i in range(len(self.offsets)):
            pass

        if self.files__enabled:
            pass
            if len(self._m_files) != self._root.num_entries:
                raise kaitaistruct.ConsistencyError(u"files", self._root.num_entries, len(self._m_files))
            for i in range(len(self._m_files)):
                pass
                if self._m_files[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"files", self._root, self._m_files[i]._root)
                if self._m_files[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"files", self, self._m_files[i]._parent)


        self._dirty = False

    class FileInfo(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(GranTurismoVol.FileInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_body = False
            self.body__enabled = True

        def _read(self):
            self.timestamp = self._io.read_u4le()
            self.offset_idx = self._io.read_u2le()
            self.flags = self._io.read_u1()
            self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(25), 0, False)).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.body
            if hasattr(self, '_m_body'):
                pass



        def _write__seq(self, io=None):
            super(GranTurismoVol.FileInfo, self)._write__seq(io)
            self._should_write_body = self.body__enabled
            self._io.write_u4le(self.timestamp)
            self._io.write_u2le(self.offset_idx)
            self._io.write_u1(self.flags)
            self._io.write_bytes_limit((self.name).encode(u"ASCII"), 25, 0, 0)


        def _check(self):
            if len((self.name).encode(u"ASCII")) > 25:
                raise kaitaistruct.ConsistencyError(u"name", 25, len((self.name).encode(u"ASCII")))
            if KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0))
            if self.body__enabled:
                pass
                if (not (self.is_dir)):
                    pass
                    if len(self._m_body) != self.size:
                        raise kaitaistruct.ConsistencyError(u"body", self.size, len(self._m_body))


            self._dirty = False

        @property
        def body(self):
            if self._should_write_body:
                self._write_body()
            if hasattr(self, '_m_body'):
                return self._m_body

            if not self.body__enabled:
                return None

            if (not (self.is_dir)):
                pass
                _pos = self._io.pos()
                self._io.seek(self._root.offsets[self.offset_idx] & 4294965248)
                self._m_body = self._io.read_bytes(self.size)
                self._io.seek(_pos)

            return getattr(self, '_m_body', None)

        @body.setter
        def body(self, v):
            self._dirty = True
            self._m_body = v

        def _write_body(self):
            self._should_write_body = False
            if (not (self.is_dir)):
                pass
                _pos = self._io.pos()
                self._io.seek(self._root.offsets[self.offset_idx] & 4294965248)
                self._io.write_bytes(self._m_body)
                self._io.seek(_pos)


        @property
        def is_dir(self):
            if hasattr(self, '_m_is_dir'):
                return self._m_is_dir

            self._m_is_dir = self.flags & 1 != 0
            return getattr(self, '_m_is_dir', None)

        def _invalidate_is_dir(self):
            del self._m_is_dir
        @property
        def is_last_entry(self):
            if hasattr(self, '_m_is_last_entry'):
                return self._m_is_last_entry

            self._m_is_last_entry = self.flags & 128 != 0
            return getattr(self, '_m_is_last_entry', None)

        def _invalidate_is_last_entry(self):
            del self._m_is_last_entry
        @property
        def size(self):
            if hasattr(self, '_m_size'):
                return self._m_size

            self._m_size = (self._root.offsets[self.offset_idx + 1] & 4294965248) - self._root.offsets[self.offset_idx]
            return getattr(self, '_m_size', None)

        def _invalidate_size(self):
            del self._m_size

    @property
    def files(self):
        if self._should_write_files:
            self._write_files()
        if hasattr(self, '_m_files'):
            return self._m_files

        if not self.files__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.ofs_dir & 4294965248)
        self._m_files = []
        for i in range(self._root.num_entries):
            _t__m_files = GranTurismoVol.FileInfo(self._io, self, self._root)
            try:
                _t__m_files._read()
            finally:
                self._m_files.append(_t__m_files)

        self._io.seek(_pos)
        return getattr(self, '_m_files', None)

    @files.setter
    def files(self, v):
        self._dirty = True
        self._m_files = v

    def _write_files(self):
        self._should_write_files = False
        _pos = self._io.pos()
        self._io.seek(self.ofs_dir & 4294965248)
        for i in range(len(self._m_files)):
            pass
            self._m_files[i]._write__seq(self._io)

        self._io.seek(_pos)

    @property
    def ofs_dir(self):
        if hasattr(self, '_m_ofs_dir'):
            return self._m_ofs_dir

        self._m_ofs_dir = self.offsets[1]
        return getattr(self, '_m_ofs_dir', None)

    def _invalidate_ofs_dir(self):
        del self._m_ofs_dir

