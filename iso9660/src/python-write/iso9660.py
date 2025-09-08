# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Iso9660(ReadWriteKaitaiStruct):
    """ISO9660 is standard filesystem used on read-only optical discs
    (mostly CD-ROM). The standard was based on earlier High Sierra
    Format (HSF), proposed for CD-ROMs in 1985, and, after several
    revisions, it was accepted as ISO9960:1998.
    
    The format emphasizes portability (thus having pretty minimal
    features and very conservative file names standards) and sequential
    access (which favors disc devices with relatively slow rotation
    speed).
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Iso9660, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_primary_vol_desc = False
        self.primary_vol_desc__enabled = True

    def _read(self):
        pass
        self._dirty = False


    def _fetch_instances(self):
        pass
        _ = self.primary_vol_desc
        if hasattr(self, '_m_primary_vol_desc'):
            pass
            self._m_primary_vol_desc._fetch_instances()



    def _write__seq(self, io=None):
        super(Iso9660, self)._write__seq(io)
        self._should_write_primary_vol_desc = self.primary_vol_desc__enabled


    def _check(self):
        if self.primary_vol_desc__enabled:
            pass
            if self._m_primary_vol_desc._root != self._root:
                raise kaitaistruct.ConsistencyError(u"primary_vol_desc", self._root, self._m_primary_vol_desc._root)
            if self._m_primary_vol_desc._parent != self:
                raise kaitaistruct.ConsistencyError(u"primary_vol_desc", self, self._m_primary_vol_desc._parent)

        self._dirty = False

    class Datetime(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Iso9660.Datetime, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.year = self._io.read_u1()
            self.month = self._io.read_u1()
            self.day = self._io.read_u1()
            self.hour = self._io.read_u1()
            self.minute = self._io.read_u1()
            self.sec = self._io.read_u1()
            self.timezone = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Iso9660.Datetime, self)._write__seq(io)
            self._io.write_u1(self.year)
            self._io.write_u1(self.month)
            self._io.write_u1(self.day)
            self._io.write_u1(self.hour)
            self._io.write_u1(self.minute)
            self._io.write_u1(self.sec)
            self._io.write_u1(self.timezone)


        def _check(self):
            self._dirty = False


    class DecDatetime(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://wiki.osdev.org/ISO_9660#Date.2Ftime_format
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Iso9660.DecDatetime, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.year = (self._io.read_bytes(4)).decode(u"ASCII")
            self.month = (self._io.read_bytes(2)).decode(u"ASCII")
            self.day = (self._io.read_bytes(2)).decode(u"ASCII")
            self.hour = (self._io.read_bytes(2)).decode(u"ASCII")
            self.minute = (self._io.read_bytes(2)).decode(u"ASCII")
            self.sec = (self._io.read_bytes(2)).decode(u"ASCII")
            self.sec_hundreds = (self._io.read_bytes(2)).decode(u"ASCII")
            self.timezone = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Iso9660.DecDatetime, self)._write__seq(io)
            self._io.write_bytes((self.year).encode(u"ASCII"))
            self._io.write_bytes((self.month).encode(u"ASCII"))
            self._io.write_bytes((self.day).encode(u"ASCII"))
            self._io.write_bytes((self.hour).encode(u"ASCII"))
            self._io.write_bytes((self.minute).encode(u"ASCII"))
            self._io.write_bytes((self.sec).encode(u"ASCII"))
            self._io.write_bytes((self.sec_hundreds).encode(u"ASCII"))
            self._io.write_u1(self.timezone)


        def _check(self):
            if len((self.year).encode(u"ASCII")) != 4:
                raise kaitaistruct.ConsistencyError(u"year", 4, len((self.year).encode(u"ASCII")))
            if len((self.month).encode(u"ASCII")) != 2:
                raise kaitaistruct.ConsistencyError(u"month", 2, len((self.month).encode(u"ASCII")))
            if len((self.day).encode(u"ASCII")) != 2:
                raise kaitaistruct.ConsistencyError(u"day", 2, len((self.day).encode(u"ASCII")))
            if len((self.hour).encode(u"ASCII")) != 2:
                raise kaitaistruct.ConsistencyError(u"hour", 2, len((self.hour).encode(u"ASCII")))
            if len((self.minute).encode(u"ASCII")) != 2:
                raise kaitaistruct.ConsistencyError(u"minute", 2, len((self.minute).encode(u"ASCII")))
            if len((self.sec).encode(u"ASCII")) != 2:
                raise kaitaistruct.ConsistencyError(u"sec", 2, len((self.sec).encode(u"ASCII")))
            if len((self.sec_hundreds).encode(u"ASCII")) != 2:
                raise kaitaistruct.ConsistencyError(u"sec_hundreds", 2, len((self.sec_hundreds).encode(u"ASCII")))
            self._dirty = False


    class DirEntries(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Iso9660.DirEntries, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while True:
                _t_entries = Iso9660.DirEntry(self._io, self, self._root)
                try:
                    _t_entries._read()
                finally:
                    _ = _t_entries
                    self.entries.append(_)
                if _.len == 0:
                    break
                i += 1
            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Iso9660.DirEntries, self)._write__seq(io)
            for i in range(len(self.entries)):
                pass
                self.entries[i]._write__seq(self._io)



        def _check(self):
            if len(self.entries) == 0:
                raise kaitaistruct.ConsistencyError(u"entries", 0, len(self.entries))
            for i in range(len(self.entries)):
                pass
                if self.entries[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
                if self.entries[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)
                _ = self.entries[i]
                if (_.len == 0) != (i == len(self.entries) - 1):
                    raise kaitaistruct.ConsistencyError(u"entries", i == len(self.entries) - 1, _.len == 0)

            self._dirty = False


    class DirEntry(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Iso9660.DirEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len = self._io.read_u1()
            if self.len > 0:
                pass
                self._raw_body = self._io.read_bytes(self.len - 1)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Iso9660.DirEntryBody(_io__raw_body, self, self._root)
                self.body._read()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.len > 0:
                pass
                self.body._fetch_instances()



        def _write__seq(self, io=None):
            super(Iso9660.DirEntry, self)._write__seq(io)
            self._io.write_u1(self.len)
            if self.len > 0:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len - 1)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len - 1))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len - 1, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)



        def _check(self):
            if self.len > 0:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)

            self._dirty = False


    class DirEntryBody(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Iso9660.DirEntryBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_extent_as_dir = False
            self.extent_as_dir__enabled = True
            self._should_write_extent_as_file = False
            self.extent_as_file__enabled = True

        def _read(self):
            self.len_ext_attr_rec = self._io.read_u1()
            self.lba_extent = Iso9660.U4bi(self._io, self, self._root)
            self.lba_extent._read()
            self.size_extent = Iso9660.U4bi(self._io, self, self._root)
            self.size_extent._read()
            self.datetime = Iso9660.Datetime(self._io, self, self._root)
            self.datetime._read()
            self.file_flags = self._io.read_u1()
            self.file_unit_size = self._io.read_u1()
            self.interleave_gap_size = self._io.read_u1()
            self.vol_seq_num = Iso9660.U2bi(self._io, self, self._root)
            self.vol_seq_num._read()
            self.len_file_name = self._io.read_u1()
            self.file_name = (self._io.read_bytes(self.len_file_name)).decode(u"UTF-8")
            if self.len_file_name % 2 == 0:
                pass
                self.padding = self._io.read_u1()

            self.rest = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.lba_extent._fetch_instances()
            self.size_extent._fetch_instances()
            self.datetime._fetch_instances()
            self.vol_seq_num._fetch_instances()
            if self.len_file_name % 2 == 0:
                pass

            _ = self.extent_as_dir
            if hasattr(self, '_m_extent_as_dir'):
                pass
                self._m_extent_as_dir._fetch_instances()

            _ = self.extent_as_file
            if hasattr(self, '_m_extent_as_file'):
                pass



        def _write__seq(self, io=None):
            super(Iso9660.DirEntryBody, self)._write__seq(io)
            self._should_write_extent_as_dir = self.extent_as_dir__enabled
            self._should_write_extent_as_file = self.extent_as_file__enabled
            self._io.write_u1(self.len_ext_attr_rec)
            self.lba_extent._write__seq(self._io)
            self.size_extent._write__seq(self._io)
            self.datetime._write__seq(self._io)
            self._io.write_u1(self.file_flags)
            self._io.write_u1(self.file_unit_size)
            self._io.write_u1(self.interleave_gap_size)
            self.vol_seq_num._write__seq(self._io)
            self._io.write_u1(self.len_file_name)
            self._io.write_bytes((self.file_name).encode(u"UTF-8"))
            if self.len_file_name % 2 == 0:
                pass
                self._io.write_u1(self.padding)

            self._io.write_bytes(self.rest)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"rest", 0, self._io.size() - self._io.pos())


        def _check(self):
            if self.lba_extent._root != self._root:
                raise kaitaistruct.ConsistencyError(u"lba_extent", self._root, self.lba_extent._root)
            if self.lba_extent._parent != self:
                raise kaitaistruct.ConsistencyError(u"lba_extent", self, self.lba_extent._parent)
            if self.size_extent._root != self._root:
                raise kaitaistruct.ConsistencyError(u"size_extent", self._root, self.size_extent._root)
            if self.size_extent._parent != self:
                raise kaitaistruct.ConsistencyError(u"size_extent", self, self.size_extent._parent)
            if self.datetime._root != self._root:
                raise kaitaistruct.ConsistencyError(u"datetime", self._root, self.datetime._root)
            if self.datetime._parent != self:
                raise kaitaistruct.ConsistencyError(u"datetime", self, self.datetime._parent)
            if self.vol_seq_num._root != self._root:
                raise kaitaistruct.ConsistencyError(u"vol_seq_num", self._root, self.vol_seq_num._root)
            if self.vol_seq_num._parent != self:
                raise kaitaistruct.ConsistencyError(u"vol_seq_num", self, self.vol_seq_num._parent)
            if len((self.file_name).encode(u"UTF-8")) != self.len_file_name:
                raise kaitaistruct.ConsistencyError(u"file_name", self.len_file_name, len((self.file_name).encode(u"UTF-8")))
            if self.len_file_name % 2 == 0:
                pass

            if self.extent_as_dir__enabled:
                pass
                if self.file_flags & 2 != 0:
                    pass
                    if self._m_extent_as_dir._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"extent_as_dir", self._root, self._m_extent_as_dir._root)
                    if self._m_extent_as_dir._parent != self:
                        raise kaitaistruct.ConsistencyError(u"extent_as_dir", self, self._m_extent_as_dir._parent)


            if self.extent_as_file__enabled:
                pass
                if self.file_flags & 2 == 0:
                    pass
                    if len(self._m_extent_as_file) != self.size_extent.le:
                        raise kaitaistruct.ConsistencyError(u"extent_as_file", self.size_extent.le, len(self._m_extent_as_file))


            self._dirty = False

        @property
        def extent_as_dir(self):
            if self._should_write_extent_as_dir:
                self._write_extent_as_dir()
            if hasattr(self, '_m_extent_as_dir'):
                return self._m_extent_as_dir

            if not self.extent_as_dir__enabled:
                return None

            if self.file_flags & 2 != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.lba_extent.le * self._root.sector_size)
                self._raw__m_extent_as_dir = io.read_bytes(self.size_extent.le)
                _io__raw__m_extent_as_dir = KaitaiStream(BytesIO(self._raw__m_extent_as_dir))
                self._m_extent_as_dir = Iso9660.DirEntries(_io__raw__m_extent_as_dir, self, self._root)
                self._m_extent_as_dir._read()
                io.seek(_pos)

            return getattr(self, '_m_extent_as_dir', None)

        @extent_as_dir.setter
        def extent_as_dir(self, v):
            self._dirty = True
            self._m_extent_as_dir = v

        def _write_extent_as_dir(self):
            self._should_write_extent_as_dir = False
            if self.file_flags & 2 != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.lba_extent.le * self._root.sector_size)
                _io__raw__m_extent_as_dir = KaitaiStream(BytesIO(bytearray(self.size_extent.le)))
                io.add_child_stream(_io__raw__m_extent_as_dir)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.size_extent.le))
                def handler(parent, _io__raw__m_extent_as_dir=_io__raw__m_extent_as_dir):
                    self._raw__m_extent_as_dir = _io__raw__m_extent_as_dir.to_byte_array()
                    if len(self._raw__m_extent_as_dir) != self.size_extent.le:
                        raise kaitaistruct.ConsistencyError(u"raw(extent_as_dir)", self.size_extent.le, len(self._raw__m_extent_as_dir))
                    parent.write_bytes(self._raw__m_extent_as_dir)
                _io__raw__m_extent_as_dir.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_extent_as_dir._write__seq(_io__raw__m_extent_as_dir)
                io.seek(_pos)


        @property
        def extent_as_file(self):
            if self._should_write_extent_as_file:
                self._write_extent_as_file()
            if hasattr(self, '_m_extent_as_file'):
                return self._m_extent_as_file

            if not self.extent_as_file__enabled:
                return None

            if self.file_flags & 2 == 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.lba_extent.le * self._root.sector_size)
                self._m_extent_as_file = io.read_bytes(self.size_extent.le)
                io.seek(_pos)

            return getattr(self, '_m_extent_as_file', None)

        @extent_as_file.setter
        def extent_as_file(self, v):
            self._dirty = True
            self._m_extent_as_file = v

        def _write_extent_as_file(self):
            self._should_write_extent_as_file = False
            if self.file_flags & 2 == 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.lba_extent.le * self._root.sector_size)
                io.write_bytes(self._m_extent_as_file)
                io.seek(_pos)



    class PathTableEntryLe(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Iso9660.PathTableEntryLe, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_dir_name = self._io.read_u1()
            self.len_ext_attr_rec = self._io.read_u1()
            self.lba_extent = self._io.read_u4le()
            self.parent_dir_idx = self._io.read_u2le()
            self.dir_name = (self._io.read_bytes(self.len_dir_name)).decode(u"UTF-8")
            if self.len_dir_name % 2 == 1:
                pass
                self.padding = self._io.read_u1()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.len_dir_name % 2 == 1:
                pass



        def _write__seq(self, io=None):
            super(Iso9660.PathTableEntryLe, self)._write__seq(io)
            self._io.write_u1(self.len_dir_name)
            self._io.write_u1(self.len_ext_attr_rec)
            self._io.write_u4le(self.lba_extent)
            self._io.write_u2le(self.parent_dir_idx)
            self._io.write_bytes((self.dir_name).encode(u"UTF-8"))
            if self.len_dir_name % 2 == 1:
                pass
                self._io.write_u1(self.padding)



        def _check(self):
            if len((self.dir_name).encode(u"UTF-8")) != self.len_dir_name:
                raise kaitaistruct.ConsistencyError(u"dir_name", self.len_dir_name, len((self.dir_name).encode(u"UTF-8")))
            if self.len_dir_name % 2 == 1:
                pass

            self._dirty = False


    class PathTableLe(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://wiki.osdev.org/ISO_9660#The_Path_Table
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Iso9660.PathTableLe, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = Iso9660.PathTableEntryLe(self._io, self, self._root)
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
            super(Iso9660.PathTableLe, self)._write__seq(io)
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


    class U2bi(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Iso9660.U2bi, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.le = self._io.read_u2le()
            self.be = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Iso9660.U2bi, self)._write__seq(io)
            self._io.write_u2le(self.le)
            self._io.write_u2be(self.be)


        def _check(self):
            self._dirty = False


    class U4bi(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Iso9660.U4bi, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.le = self._io.read_u4le()
            self.be = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Iso9660.U4bi, self)._write__seq(io)
            self._io.write_u4le(self.le)
            self._io.write_u4be(self.be)


        def _check(self):
            self._dirty = False


    class VolDesc(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Iso9660.VolDesc, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.type = self._io.read_u1()
            self.magic = self._io.read_bytes(5)
            if not self.magic == b"\x43\x44\x30\x30\x31":
                raise kaitaistruct.ValidationNotEqualError(b"\x43\x44\x30\x30\x31", self.magic, self._io, u"/types/vol_desc/seq/1")
            self.version = self._io.read_u1()
            if self.type == 0:
                pass
                self.vol_desc_boot_record = Iso9660.VolDescBootRecord(self._io, self, self._root)
                self.vol_desc_boot_record._read()

            if self.type == 1:
                pass
                self.vol_desc_primary = Iso9660.VolDescPrimary(self._io, self, self._root)
                self.vol_desc_primary._read()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.type == 0:
                pass
                self.vol_desc_boot_record._fetch_instances()

            if self.type == 1:
                pass
                self.vol_desc_primary._fetch_instances()



        def _write__seq(self, io=None):
            super(Iso9660.VolDesc, self)._write__seq(io)
            self._io.write_u1(self.type)
            self._io.write_bytes(self.magic)
            self._io.write_u1(self.version)
            if self.type == 0:
                pass
                self.vol_desc_boot_record._write__seq(self._io)

            if self.type == 1:
                pass
                self.vol_desc_primary._write__seq(self._io)



        def _check(self):
            if len(self.magic) != 5:
                raise kaitaistruct.ConsistencyError(u"magic", 5, len(self.magic))
            if not self.magic == b"\x43\x44\x30\x30\x31":
                raise kaitaistruct.ValidationNotEqualError(b"\x43\x44\x30\x30\x31", self.magic, None, u"/types/vol_desc/seq/1")
            if self.type == 0:
                pass
                if self.vol_desc_boot_record._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"vol_desc_boot_record", self._root, self.vol_desc_boot_record._root)
                if self.vol_desc_boot_record._parent != self:
                    raise kaitaistruct.ConsistencyError(u"vol_desc_boot_record", self, self.vol_desc_boot_record._parent)

            if self.type == 1:
                pass
                if self.vol_desc_primary._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"vol_desc_primary", self._root, self.vol_desc_primary._root)
                if self.vol_desc_primary._parent != self:
                    raise kaitaistruct.ConsistencyError(u"vol_desc_primary", self, self.vol_desc_primary._parent)

            self._dirty = False


    class VolDescBootRecord(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Iso9660.VolDescBootRecord, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.boot_system_id = (self._io.read_bytes(32)).decode(u"UTF-8")
            self.boot_id = (self._io.read_bytes(32)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Iso9660.VolDescBootRecord, self)._write__seq(io)
            self._io.write_bytes((self.boot_system_id).encode(u"UTF-8"))
            self._io.write_bytes((self.boot_id).encode(u"UTF-8"))


        def _check(self):
            if len((self.boot_system_id).encode(u"UTF-8")) != 32:
                raise kaitaistruct.ConsistencyError(u"boot_system_id", 32, len((self.boot_system_id).encode(u"UTF-8")))
            if len((self.boot_id).encode(u"UTF-8")) != 32:
                raise kaitaistruct.ConsistencyError(u"boot_id", 32, len((self.boot_id).encode(u"UTF-8")))
            self._dirty = False


    class VolDescPrimary(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://wiki.osdev.org/ISO_9660#The_Primary_Volume_Descriptor
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Iso9660.VolDescPrimary, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_path_table = False
            self.path_table__enabled = True

        def _read(self):
            self.unused1 = self._io.read_bytes(1)
            if not self.unused1 == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.unused1, self._io, u"/types/vol_desc_primary/seq/0")
            self.system_id = (self._io.read_bytes(32)).decode(u"UTF-8")
            self.volume_id = (self._io.read_bytes(32)).decode(u"UTF-8")
            self.unused2 = self._io.read_bytes(8)
            if not self.unused2 == b"\x00\x00\x00\x00\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00\x00\x00\x00\x00", self.unused2, self._io, u"/types/vol_desc_primary/seq/3")
            self.vol_space_size = Iso9660.U4bi(self._io, self, self._root)
            self.vol_space_size._read()
            self.unused3 = self._io.read_bytes(32)
            if not self.unused3 == b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", self.unused3, self._io, u"/types/vol_desc_primary/seq/5")
            self.vol_set_size = Iso9660.U2bi(self._io, self, self._root)
            self.vol_set_size._read()
            self.vol_seq_num = Iso9660.U2bi(self._io, self, self._root)
            self.vol_seq_num._read()
            self.logical_block_size = Iso9660.U2bi(self._io, self, self._root)
            self.logical_block_size._read()
            self.path_table_size = Iso9660.U4bi(self._io, self, self._root)
            self.path_table_size._read()
            self.lba_path_table_le = self._io.read_u4le()
            self.lba_opt_path_table_le = self._io.read_u4le()
            self.lba_path_table_be = self._io.read_u4be()
            self.lba_opt_path_table_be = self._io.read_u4be()
            self._raw_root_dir = self._io.read_bytes(34)
            _io__raw_root_dir = KaitaiStream(BytesIO(self._raw_root_dir))
            self.root_dir = Iso9660.DirEntry(_io__raw_root_dir, self, self._root)
            self.root_dir._read()
            self.vol_set_id = (self._io.read_bytes(128)).decode(u"UTF-8")
            self.publisher_id = (self._io.read_bytes(128)).decode(u"UTF-8")
            self.data_preparer_id = (self._io.read_bytes(128)).decode(u"UTF-8")
            self.application_id = (self._io.read_bytes(128)).decode(u"UTF-8")
            self.copyright_file_id = (self._io.read_bytes(38)).decode(u"UTF-8")
            self.abstract_file_id = (self._io.read_bytes(36)).decode(u"UTF-8")
            self.bibliographic_file_id = (self._io.read_bytes(37)).decode(u"UTF-8")
            self.vol_create_datetime = Iso9660.DecDatetime(self._io, self, self._root)
            self.vol_create_datetime._read()
            self.vol_mod_datetime = Iso9660.DecDatetime(self._io, self, self._root)
            self.vol_mod_datetime._read()
            self.vol_expire_datetime = Iso9660.DecDatetime(self._io, self, self._root)
            self.vol_expire_datetime._read()
            self.vol_effective_datetime = Iso9660.DecDatetime(self._io, self, self._root)
            self.vol_effective_datetime._read()
            self.file_structure_version = self._io.read_u1()
            self.unused4 = self._io.read_u1()
            self.application_area = self._io.read_bytes(512)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.vol_space_size._fetch_instances()
            self.vol_set_size._fetch_instances()
            self.vol_seq_num._fetch_instances()
            self.logical_block_size._fetch_instances()
            self.path_table_size._fetch_instances()
            self.root_dir._fetch_instances()
            self.vol_create_datetime._fetch_instances()
            self.vol_mod_datetime._fetch_instances()
            self.vol_expire_datetime._fetch_instances()
            self.vol_effective_datetime._fetch_instances()
            _ = self.path_table
            if hasattr(self, '_m_path_table'):
                pass
                self._m_path_table._fetch_instances()



        def _write__seq(self, io=None):
            super(Iso9660.VolDescPrimary, self)._write__seq(io)
            self._should_write_path_table = self.path_table__enabled
            self._io.write_bytes(self.unused1)
            self._io.write_bytes((self.system_id).encode(u"UTF-8"))
            self._io.write_bytes((self.volume_id).encode(u"UTF-8"))
            self._io.write_bytes(self.unused2)
            self.vol_space_size._write__seq(self._io)
            self._io.write_bytes(self.unused3)
            self.vol_set_size._write__seq(self._io)
            self.vol_seq_num._write__seq(self._io)
            self.logical_block_size._write__seq(self._io)
            self.path_table_size._write__seq(self._io)
            self._io.write_u4le(self.lba_path_table_le)
            self._io.write_u4le(self.lba_opt_path_table_le)
            self._io.write_u4be(self.lba_path_table_be)
            self._io.write_u4be(self.lba_opt_path_table_be)
            _io__raw_root_dir = KaitaiStream(BytesIO(bytearray(34)))
            self._io.add_child_stream(_io__raw_root_dir)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (34))
            def handler(parent, _io__raw_root_dir=_io__raw_root_dir):
                self._raw_root_dir = _io__raw_root_dir.to_byte_array()
                if len(self._raw_root_dir) != 34:
                    raise kaitaistruct.ConsistencyError(u"raw(root_dir)", 34, len(self._raw_root_dir))
                parent.write_bytes(self._raw_root_dir)
            _io__raw_root_dir.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.root_dir._write__seq(_io__raw_root_dir)
            self._io.write_bytes((self.vol_set_id).encode(u"UTF-8"))
            self._io.write_bytes((self.publisher_id).encode(u"UTF-8"))
            self._io.write_bytes((self.data_preparer_id).encode(u"UTF-8"))
            self._io.write_bytes((self.application_id).encode(u"UTF-8"))
            self._io.write_bytes((self.copyright_file_id).encode(u"UTF-8"))
            self._io.write_bytes((self.abstract_file_id).encode(u"UTF-8"))
            self._io.write_bytes((self.bibliographic_file_id).encode(u"UTF-8"))
            self.vol_create_datetime._write__seq(self._io)
            self.vol_mod_datetime._write__seq(self._io)
            self.vol_expire_datetime._write__seq(self._io)
            self.vol_effective_datetime._write__seq(self._io)
            self._io.write_u1(self.file_structure_version)
            self._io.write_u1(self.unused4)
            self._io.write_bytes(self.application_area)


        def _check(self):
            if len(self.unused1) != 1:
                raise kaitaistruct.ConsistencyError(u"unused1", 1, len(self.unused1))
            if not self.unused1 == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.unused1, None, u"/types/vol_desc_primary/seq/0")
            if len((self.system_id).encode(u"UTF-8")) != 32:
                raise kaitaistruct.ConsistencyError(u"system_id", 32, len((self.system_id).encode(u"UTF-8")))
            if len((self.volume_id).encode(u"UTF-8")) != 32:
                raise kaitaistruct.ConsistencyError(u"volume_id", 32, len((self.volume_id).encode(u"UTF-8")))
            if len(self.unused2) != 8:
                raise kaitaistruct.ConsistencyError(u"unused2", 8, len(self.unused2))
            if not self.unused2 == b"\x00\x00\x00\x00\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00\x00\x00\x00\x00", self.unused2, None, u"/types/vol_desc_primary/seq/3")
            if self.vol_space_size._root != self._root:
                raise kaitaistruct.ConsistencyError(u"vol_space_size", self._root, self.vol_space_size._root)
            if self.vol_space_size._parent != self:
                raise kaitaistruct.ConsistencyError(u"vol_space_size", self, self.vol_space_size._parent)
            if len(self.unused3) != 32:
                raise kaitaistruct.ConsistencyError(u"unused3", 32, len(self.unused3))
            if not self.unused3 == b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", self.unused3, None, u"/types/vol_desc_primary/seq/5")
            if self.vol_set_size._root != self._root:
                raise kaitaistruct.ConsistencyError(u"vol_set_size", self._root, self.vol_set_size._root)
            if self.vol_set_size._parent != self:
                raise kaitaistruct.ConsistencyError(u"vol_set_size", self, self.vol_set_size._parent)
            if self.vol_seq_num._root != self._root:
                raise kaitaistruct.ConsistencyError(u"vol_seq_num", self._root, self.vol_seq_num._root)
            if self.vol_seq_num._parent != self:
                raise kaitaistruct.ConsistencyError(u"vol_seq_num", self, self.vol_seq_num._parent)
            if self.logical_block_size._root != self._root:
                raise kaitaistruct.ConsistencyError(u"logical_block_size", self._root, self.logical_block_size._root)
            if self.logical_block_size._parent != self:
                raise kaitaistruct.ConsistencyError(u"logical_block_size", self, self.logical_block_size._parent)
            if self.path_table_size._root != self._root:
                raise kaitaistruct.ConsistencyError(u"path_table_size", self._root, self.path_table_size._root)
            if self.path_table_size._parent != self:
                raise kaitaistruct.ConsistencyError(u"path_table_size", self, self.path_table_size._parent)
            if self.root_dir._root != self._root:
                raise kaitaistruct.ConsistencyError(u"root_dir", self._root, self.root_dir._root)
            if self.root_dir._parent != self:
                raise kaitaistruct.ConsistencyError(u"root_dir", self, self.root_dir._parent)
            if len((self.vol_set_id).encode(u"UTF-8")) != 128:
                raise kaitaistruct.ConsistencyError(u"vol_set_id", 128, len((self.vol_set_id).encode(u"UTF-8")))
            if len((self.publisher_id).encode(u"UTF-8")) != 128:
                raise kaitaistruct.ConsistencyError(u"publisher_id", 128, len((self.publisher_id).encode(u"UTF-8")))
            if len((self.data_preparer_id).encode(u"UTF-8")) != 128:
                raise kaitaistruct.ConsistencyError(u"data_preparer_id", 128, len((self.data_preparer_id).encode(u"UTF-8")))
            if len((self.application_id).encode(u"UTF-8")) != 128:
                raise kaitaistruct.ConsistencyError(u"application_id", 128, len((self.application_id).encode(u"UTF-8")))
            if len((self.copyright_file_id).encode(u"UTF-8")) != 38:
                raise kaitaistruct.ConsistencyError(u"copyright_file_id", 38, len((self.copyright_file_id).encode(u"UTF-8")))
            if len((self.abstract_file_id).encode(u"UTF-8")) != 36:
                raise kaitaistruct.ConsistencyError(u"abstract_file_id", 36, len((self.abstract_file_id).encode(u"UTF-8")))
            if len((self.bibliographic_file_id).encode(u"UTF-8")) != 37:
                raise kaitaistruct.ConsistencyError(u"bibliographic_file_id", 37, len((self.bibliographic_file_id).encode(u"UTF-8")))
            if self.vol_create_datetime._root != self._root:
                raise kaitaistruct.ConsistencyError(u"vol_create_datetime", self._root, self.vol_create_datetime._root)
            if self.vol_create_datetime._parent != self:
                raise kaitaistruct.ConsistencyError(u"vol_create_datetime", self, self.vol_create_datetime._parent)
            if self.vol_mod_datetime._root != self._root:
                raise kaitaistruct.ConsistencyError(u"vol_mod_datetime", self._root, self.vol_mod_datetime._root)
            if self.vol_mod_datetime._parent != self:
                raise kaitaistruct.ConsistencyError(u"vol_mod_datetime", self, self.vol_mod_datetime._parent)
            if self.vol_expire_datetime._root != self._root:
                raise kaitaistruct.ConsistencyError(u"vol_expire_datetime", self._root, self.vol_expire_datetime._root)
            if self.vol_expire_datetime._parent != self:
                raise kaitaistruct.ConsistencyError(u"vol_expire_datetime", self, self.vol_expire_datetime._parent)
            if self.vol_effective_datetime._root != self._root:
                raise kaitaistruct.ConsistencyError(u"vol_effective_datetime", self._root, self.vol_effective_datetime._root)
            if self.vol_effective_datetime._parent != self:
                raise kaitaistruct.ConsistencyError(u"vol_effective_datetime", self, self.vol_effective_datetime._parent)
            if len(self.application_area) != 512:
                raise kaitaistruct.ConsistencyError(u"application_area", 512, len(self.application_area))
            if self.path_table__enabled:
                pass
                if self._m_path_table._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"path_table", self._root, self._m_path_table._root)
                if self._m_path_table._parent != self:
                    raise kaitaistruct.ConsistencyError(u"path_table", self, self._m_path_table._parent)

            self._dirty = False

        @property
        def path_table(self):
            if self._should_write_path_table:
                self._write_path_table()
            if hasattr(self, '_m_path_table'):
                return self._m_path_table

            if not self.path_table__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.lba_path_table_le * self._root.sector_size)
            self._raw__m_path_table = self._io.read_bytes(self.path_table_size.le)
            _io__raw__m_path_table = KaitaiStream(BytesIO(self._raw__m_path_table))
            self._m_path_table = Iso9660.PathTableLe(_io__raw__m_path_table, self, self._root)
            self._m_path_table._read()
            self._io.seek(_pos)
            return getattr(self, '_m_path_table', None)

        @path_table.setter
        def path_table(self, v):
            self._dirty = True
            self._m_path_table = v

        def _write_path_table(self):
            self._should_write_path_table = False
            _pos = self._io.pos()
            self._io.seek(self.lba_path_table_le * self._root.sector_size)
            _io__raw__m_path_table = KaitaiStream(BytesIO(bytearray(self.path_table_size.le)))
            self._io.add_child_stream(_io__raw__m_path_table)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.path_table_size.le))
            def handler(parent, _io__raw__m_path_table=_io__raw__m_path_table):
                self._raw__m_path_table = _io__raw__m_path_table.to_byte_array()
                if len(self._raw__m_path_table) != self.path_table_size.le:
                    raise kaitaistruct.ConsistencyError(u"raw(path_table)", self.path_table_size.le, len(self._raw__m_path_table))
                parent.write_bytes(self._raw__m_path_table)
            _io__raw__m_path_table.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self._m_path_table._write__seq(_io__raw__m_path_table)
            self._io.seek(_pos)


    @property
    def primary_vol_desc(self):
        if self._should_write_primary_vol_desc:
            self._write_primary_vol_desc()
        if hasattr(self, '_m_primary_vol_desc'):
            return self._m_primary_vol_desc

        if not self.primary_vol_desc__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(16 * self.sector_size)
        self._m_primary_vol_desc = Iso9660.VolDesc(self._io, self, self._root)
        self._m_primary_vol_desc._read()
        self._io.seek(_pos)
        return getattr(self, '_m_primary_vol_desc', None)

    @primary_vol_desc.setter
    def primary_vol_desc(self, v):
        self._dirty = True
        self._m_primary_vol_desc = v

    def _write_primary_vol_desc(self):
        self._should_write_primary_vol_desc = False
        _pos = self._io.pos()
        self._io.seek(16 * self.sector_size)
        self._m_primary_vol_desc._write__seq(self._io)
        self._io.seek(_pos)

    @property
    def sector_size(self):
        if hasattr(self, '_m_sector_size'):
            return self._m_sector_size

        self._m_sector_size = 2048
        return getattr(self, '_m_sector_size', None)

    def _invalidate_sector_size(self):
        del self._m_sector_size

