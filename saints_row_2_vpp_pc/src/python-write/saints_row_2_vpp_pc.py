# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class SaintsRow2VppPc(ReadWriteKaitaiStruct):
    def __init__(self, _io=None, _parent=None, _root=None):
        super(SaintsRow2VppPc, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_extensions = False
        self.extensions__enabled = True
        self._should_write_filenames = False
        self.filenames__enabled = True
        self._should_write_files = False
        self.files__enabled = True

    def _read(self):
        self.magic = self._io.read_bytes(5)
        if not self.magic == b"\xCE\x0A\x89\x51\x04":
            raise kaitaistruct.ValidationNotEqualError(b"\xCE\x0A\x89\x51\x04", self.magic, self._io, u"/seq/0")
        self.pad1 = self._io.read_bytes(335)
        self.num_files = self._io.read_s4le()
        self.container_size = self._io.read_s4le()
        self.len_offsets = self._io.read_s4le()
        self.len_filenames = self._io.read_s4le()
        self.len_extensions = self._io.read_s4le()
        self.smth5 = self._io.read_s4le()
        self.smth6 = self._io.read_s4le()
        self.smth7 = self._io.read_s4le()
        self.smth8 = self._io.read_s4le()
        self.smth9 = self._io.read_s4le()
        self._dirty = False


    def _fetch_instances(self):
        pass
        _ = self.extensions
        if hasattr(self, '_m_extensions'):
            pass
            self._m_extensions._fetch_instances()

        _ = self.filenames
        if hasattr(self, '_m_filenames'):
            pass
            self._m_filenames._fetch_instances()

        _ = self.files
        if hasattr(self, '_m_files'):
            pass
            self._m_files._fetch_instances()



    def _write__seq(self, io=None):
        super(SaintsRow2VppPc, self)._write__seq(io)
        self._should_write_extensions = self.extensions__enabled
        self._should_write_filenames = self.filenames__enabled
        self._should_write_files = self.files__enabled
        self._io.write_bytes(self.magic)
        self._io.write_bytes(self.pad1)
        self._io.write_s4le(self.num_files)
        self._io.write_s4le(self.container_size)
        self._io.write_s4le(self.len_offsets)
        self._io.write_s4le(self.len_filenames)
        self._io.write_s4le(self.len_extensions)
        self._io.write_s4le(self.smth5)
        self._io.write_s4le(self.smth6)
        self._io.write_s4le(self.smth7)
        self._io.write_s4le(self.smth8)
        self._io.write_s4le(self.smth9)


    def _check(self):
        if len(self.magic) != 5:
            raise kaitaistruct.ConsistencyError(u"magic", 5, len(self.magic))
        if not self.magic == b"\xCE\x0A\x89\x51\x04":
            raise kaitaistruct.ValidationNotEqualError(b"\xCE\x0A\x89\x51\x04", self.magic, None, u"/seq/0")
        if len(self.pad1) != 335:
            raise kaitaistruct.ConsistencyError(u"pad1", 335, len(self.pad1))
        if self.extensions__enabled:
            pass
            if self._m_extensions._root != self._root:
                raise kaitaistruct.ConsistencyError(u"extensions", self._root, self._m_extensions._root)
            if self._m_extensions._parent != self:
                raise kaitaistruct.ConsistencyError(u"extensions", self, self._m_extensions._parent)

        if self.filenames__enabled:
            pass
            if self._m_filenames._root != self._root:
                raise kaitaistruct.ConsistencyError(u"filenames", self._root, self._m_filenames._root)
            if self._m_filenames._parent != self:
                raise kaitaistruct.ConsistencyError(u"filenames", self, self._m_filenames._parent)

        if self.files__enabled:
            pass
            if self._m_files._root != self._root:
                raise kaitaistruct.ConsistencyError(u"files", self._root, self._m_files._root)
            if self._m_files._parent != self:
                raise kaitaistruct.ConsistencyError(u"files", self, self._m_files._parent)

        self._dirty = False

    class Offsets(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SaintsRow2VppPc.Offsets, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = SaintsRow2VppPc.Offsets.Offset(self._io, self, self._root)
                try:
                    _t_entries._read()
                finally:
                    self.entries.append(_t_entries)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(SaintsRow2VppPc.Offsets, self)._write__seq(io)
            for i in range(len(self.entries)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                self.entries[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.entries)):
                pass
                if self.entries[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
                if self.entries[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

            self._dirty = False

        class Offset(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(SaintsRow2VppPc.Offsets.Offset, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_body = False
                self.body__enabled = True
                self._should_write_ext = False
                self.ext__enabled = True
                self._should_write_filename = False
                self.filename__enabled = True

            def _read(self):
                self.name_ofs = self._io.read_u4le()
                self.ext_ofs = self._io.read_u4le()
                self.smth2 = self._io.read_s4le()
                self.ofs_body = self._io.read_s4le()
                self.len_body = self._io.read_s4le()
                self.always_minus_1 = self._io.read_s4le()
                self.always_zero = self._io.read_s4le()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.body
                if hasattr(self, '_m_body'):
                    pass

                _ = self.ext
                if hasattr(self, '_m_ext'):
                    pass

                _ = self.filename
                if hasattr(self, '_m_filename'):
                    pass



            def _write__seq(self, io=None):
                super(SaintsRow2VppPc.Offsets.Offset, self)._write__seq(io)
                self._should_write_body = self.body__enabled
                self._should_write_ext = self.ext__enabled
                self._should_write_filename = self.filename__enabled
                self._io.write_u4le(self.name_ofs)
                self._io.write_u4le(self.ext_ofs)
                self._io.write_s4le(self.smth2)
                self._io.write_s4le(self.ofs_body)
                self._io.write_s4le(self.len_body)
                self._io.write_s4le(self.always_minus_1)
                self._io.write_s4le(self.always_zero)


            def _check(self):
                if self.body__enabled:
                    pass
                    if len(self._m_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"body", self.len_body, len(self._m_body))

                if self.ext__enabled:
                    pass
                    if KaitaiStream.byte_array_index_of((self._m_ext).encode(u"UTF-8"), 0) != -1:
                        raise kaitaistruct.ConsistencyError(u"ext", -1, KaitaiStream.byte_array_index_of((self._m_ext).encode(u"UTF-8"), 0))

                if self.filename__enabled:
                    pass
                    if KaitaiStream.byte_array_index_of((self._m_filename).encode(u"UTF-8"), 0) != -1:
                        raise kaitaistruct.ConsistencyError(u"filename", -1, KaitaiStream.byte_array_index_of((self._m_filename).encode(u"UTF-8"), 0))

                self._dirty = False

            @property
            def body(self):
                if self._should_write_body:
                    self._write_body()
                if hasattr(self, '_m_body'):
                    return self._m_body

                if not self.body__enabled:
                    return None

                io = self._root._io
                _pos = io.pos()
                io.seek(self._root.data_start + self.ofs_body)
                self._m_body = io.read_bytes(self.len_body)
                io.seek(_pos)
                return getattr(self, '_m_body', None)

            @body.setter
            def body(self, v):
                self._dirty = True
                self._m_body = v

            def _write_body(self):
                self._should_write_body = False
                io = self._root._io
                _pos = io.pos()
                io.seek(self._root.data_start + self.ofs_body)
                io.write_bytes(self._m_body)
                io.seek(_pos)

            @property
            def ext(self):
                if self._should_write_ext:
                    self._write_ext()
                if hasattr(self, '_m_ext'):
                    return self._m_ext

                if not self.ext__enabled:
                    return None

                io = self._root.extensions._io
                _pos = io.pos()
                io.seek(self.ext_ofs)
                self._m_ext = (io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
                io.seek(_pos)
                return getattr(self, '_m_ext', None)

            @ext.setter
            def ext(self, v):
                self._dirty = True
                self._m_ext = v

            def _write_ext(self):
                self._should_write_ext = False
                io = self._root.extensions._io
                _pos = io.pos()
                io.seek(self.ext_ofs)
                io.write_bytes((self._m_ext).encode(u"UTF-8"))
                io.write_u1(0)
                io.seek(_pos)

            @property
            def filename(self):
                if self._should_write_filename:
                    self._write_filename()
                if hasattr(self, '_m_filename'):
                    return self._m_filename

                if not self.filename__enabled:
                    return None

                io = self._root.filenames._io
                _pos = io.pos()
                io.seek(self.name_ofs)
                self._m_filename = (io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
                io.seek(_pos)
                return getattr(self, '_m_filename', None)

            @filename.setter
            def filename(self, v):
                self._dirty = True
                self._m_filename = v

            def _write_filename(self):
                self._should_write_filename = False
                io = self._root.filenames._io
                _pos = io.pos()
                io.seek(self.name_ofs)
                io.write_bytes((self._m_filename).encode(u"UTF-8"))
                io.write_u1(0)
                io.seek(_pos)



    class Strings(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SaintsRow2VppPc.Strings, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                self.entries.append((self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8"))
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass



        def _write__seq(self, io=None):
            super(SaintsRow2VppPc.Strings, self)._write__seq(io)
            for i in range(len(self.entries)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                self._io.write_bytes((self.entries[i]).encode(u"UTF-8"))
                self._io.write_u1(0)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.entries)):
                pass
                if KaitaiStream.byte_array_index_of((self.entries[i]).encode(u"UTF-8"), 0) != -1:
                    raise kaitaistruct.ConsistencyError(u"entries", -1, KaitaiStream.byte_array_index_of((self.entries[i]).encode(u"UTF-8"), 0))

            self._dirty = False


    @property
    def data_start(self):
        if hasattr(self, '_m_data_start'):
            return self._m_data_start

        self._m_data_start = (self.ofs_extensions + self.len_extensions & 4294965248) + 2048
        return getattr(self, '_m_data_start', None)

    def _invalidate_data_start(self):
        del self._m_data_start
    @property
    def extensions(self):
        if self._should_write_extensions:
            self._write_extensions()
        if hasattr(self, '_m_extensions'):
            return self._m_extensions

        if not self.extensions__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.ofs_extensions)
        self._raw__m_extensions = self._io.read_bytes(self.len_extensions)
        _io__raw__m_extensions = KaitaiStream(BytesIO(self._raw__m_extensions))
        self._m_extensions = SaintsRow2VppPc.Strings(_io__raw__m_extensions, self, self._root)
        self._m_extensions._read()
        self._io.seek(_pos)
        return getattr(self, '_m_extensions', None)

    @extensions.setter
    def extensions(self, v):
        self._dirty = True
        self._m_extensions = v

    def _write_extensions(self):
        self._should_write_extensions = False
        _pos = self._io.pos()
        self._io.seek(self.ofs_extensions)
        _io__raw__m_extensions = KaitaiStream(BytesIO(bytearray(self.len_extensions)))
        self._io.add_child_stream(_io__raw__m_extensions)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.len_extensions))
        def handler(parent, _io__raw__m_extensions=_io__raw__m_extensions):
            self._raw__m_extensions = _io__raw__m_extensions.to_byte_array()
            if len(self._raw__m_extensions) != self.len_extensions:
                raise kaitaistruct.ConsistencyError(u"raw(extensions)", self.len_extensions, len(self._raw__m_extensions))
            parent.write_bytes(self._raw__m_extensions)
        _io__raw__m_extensions.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self._m_extensions._write__seq(_io__raw__m_extensions)
        self._io.seek(_pos)

    @property
    def filenames(self):
        if self._should_write_filenames:
            self._write_filenames()
        if hasattr(self, '_m_filenames'):
            return self._m_filenames

        if not self.filenames__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.ofs_filenames)
        self._raw__m_filenames = self._io.read_bytes(self.len_filenames)
        _io__raw__m_filenames = KaitaiStream(BytesIO(self._raw__m_filenames))
        self._m_filenames = SaintsRow2VppPc.Strings(_io__raw__m_filenames, self, self._root)
        self._m_filenames._read()
        self._io.seek(_pos)
        return getattr(self, '_m_filenames', None)

    @filenames.setter
    def filenames(self, v):
        self._dirty = True
        self._m_filenames = v

    def _write_filenames(self):
        self._should_write_filenames = False
        _pos = self._io.pos()
        self._io.seek(self.ofs_filenames)
        _io__raw__m_filenames = KaitaiStream(BytesIO(bytearray(self.len_filenames)))
        self._io.add_child_stream(_io__raw__m_filenames)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.len_filenames))
        def handler(parent, _io__raw__m_filenames=_io__raw__m_filenames):
            self._raw__m_filenames = _io__raw__m_filenames.to_byte_array()
            if len(self._raw__m_filenames) != self.len_filenames:
                raise kaitaistruct.ConsistencyError(u"raw(filenames)", self.len_filenames, len(self._raw__m_filenames))
            parent.write_bytes(self._raw__m_filenames)
        _io__raw__m_filenames.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self._m_filenames._write__seq(_io__raw__m_filenames)
        self._io.seek(_pos)

    @property
    def files(self):
        if self._should_write_files:
            self._write_files()
        if hasattr(self, '_m_files'):
            return self._m_files

        if not self.files__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(2048)
        self._raw__m_files = self._io.read_bytes(self.len_offsets)
        _io__raw__m_files = KaitaiStream(BytesIO(self._raw__m_files))
        self._m_files = SaintsRow2VppPc.Offsets(_io__raw__m_files, self, self._root)
        self._m_files._read()
        self._io.seek(_pos)
        return getattr(self, '_m_files', None)

    @files.setter
    def files(self, v):
        self._dirty = True
        self._m_files = v

    def _write_files(self):
        self._should_write_files = False
        _pos = self._io.pos()
        self._io.seek(2048)
        _io__raw__m_files = KaitaiStream(BytesIO(bytearray(self.len_offsets)))
        self._io.add_child_stream(_io__raw__m_files)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.len_offsets))
        def handler(parent, _io__raw__m_files=_io__raw__m_files):
            self._raw__m_files = _io__raw__m_files.to_byte_array()
            if len(self._raw__m_files) != self.len_offsets:
                raise kaitaistruct.ConsistencyError(u"raw(files)", self.len_offsets, len(self._raw__m_files))
            parent.write_bytes(self._raw__m_files)
        _io__raw__m_files.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self._m_files._write__seq(_io__raw__m_files)
        self._io.seek(_pos)

    @property
    def ofs_extensions(self):
        if hasattr(self, '_m_ofs_extensions'):
            return self._m_ofs_extensions

        self._m_ofs_extensions = (self.ofs_filenames + self.len_filenames & 4294965248) + 2048
        return getattr(self, '_m_ofs_extensions', None)

    def _invalidate_ofs_extensions(self):
        del self._m_ofs_extensions
    @property
    def ofs_filenames(self):
        if hasattr(self, '_m_ofs_filenames'):
            return self._m_ofs_filenames

        self._m_ofs_filenames = (2048 + self.len_offsets & 4294965248) + 2048
        return getattr(self, '_m_ofs_filenames', None)

    def _invalidate_ofs_filenames(self):
        del self._m_ofs_filenames

