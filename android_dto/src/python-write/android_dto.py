# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class AndroidDto(ReadWriteKaitaiStruct):
    """Format for Android DTB/DTBO partitions. It's kind of archive with
    dtb/dtbo files. Used only when there is a separate unique partition
    (dtb, dtbo) on an android device to organize device tree files.
    The format consists of a header with info about size and number
    of device tree entries and the entries themselves. This format
    description could be used to extract device tree entries from a
    partition images and decompile them with dtc (device tree compiler).
    
    .. seealso::
       Source - https://source.android.com/docs/core/architecture/dto/partitions
    
    
    .. seealso::
       Source - https://android.googlesource.com/platform/system/libufdt/+/refs/tags/android-10.0.0_r47
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(AndroidDto, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header = AndroidDto.DtTableHeader(self._io, self, self._root)
        self.header._read()
        self.entries = []
        for i in range(self.header.dt_entry_count):
            _t_entries = AndroidDto.DtTableEntry(self._io, self, self._root)
            try:
                _t_entries._read()
            finally:
                self.entries.append(_t_entries)

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        for i in range(len(self.entries)):
            pass
            self.entries[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(AndroidDto, self)._write__seq(io)
        self.header._write__seq(self._io)
        for i in range(len(self.entries)):
            pass
            self.entries[i]._write__seq(self._io)



    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if len(self.entries) != self.header.dt_entry_count:
            raise kaitaistruct.ConsistencyError(u"entries", self.header.dt_entry_count, len(self.entries))
        for i in range(len(self.entries)):
            pass
            if self.entries[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
            if self.entries[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

        self._dirty = False

    class DtTableEntry(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidDto.DtTableEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_body = False
            self.body__enabled = True

        def _read(self):
            self.dt_size = self._io.read_u4be()
            self.dt_offset = self._io.read_u4be()
            self.id = self._io.read_u4be()
            self.rev = self._io.read_u4be()
            self.custom = []
            for i in range(4):
                self.custom.append(self._io.read_u4be())

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.custom)):
                pass

            _ = self.body
            if hasattr(self, '_m_body'):
                pass



        def _write__seq(self, io=None):
            super(AndroidDto.DtTableEntry, self)._write__seq(io)
            self._should_write_body = self.body__enabled
            self._io.write_u4be(self.dt_size)
            self._io.write_u4be(self.dt_offset)
            self._io.write_u4be(self.id)
            self._io.write_u4be(self.rev)
            for i in range(len(self.custom)):
                pass
                self._io.write_u4be(self.custom[i])



        def _check(self):
            if len(self.custom) != 4:
                raise kaitaistruct.ConsistencyError(u"custom", 4, len(self.custom))
            for i in range(len(self.custom)):
                pass

            if self.body__enabled:
                pass
                if len(self._m_body) != self.dt_size:
                    raise kaitaistruct.ConsistencyError(u"body", self.dt_size, len(self._m_body))

            self._dirty = False

        @property
        def body(self):
            """DTB/DTBO file."""
            if self._should_write_body:
                self._write_body()
            if hasattr(self, '_m_body'):
                return self._m_body

            if not self.body__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.dt_offset)
            self._m_body = io.read_bytes(self.dt_size)
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
            io.seek(self.dt_offset)
            io.write_bytes(self._m_body)
            io.seek(_pos)


    class DtTableHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidDto.DtTableHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\xD7\xB7\xAB\x1E":
                raise kaitaistruct.ValidationNotEqualError(b"\xD7\xB7\xAB\x1E", self.magic, self._io, u"/types/dt_table_header/seq/0")
            self.total_size = self._io.read_u4be()
            self.header_size = self._io.read_u4be()
            self.dt_entry_size = self._io.read_u4be()
            self.dt_entry_count = self._io.read_u4be()
            self.dt_entries_offset = self._io.read_u4be()
            self.page_size = self._io.read_u4be()
            self.version = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(AndroidDto.DtTableHeader, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u4be(self.total_size)
            self._io.write_u4be(self.header_size)
            self._io.write_u4be(self.dt_entry_size)
            self._io.write_u4be(self.dt_entry_count)
            self._io.write_u4be(self.dt_entries_offset)
            self._io.write_u4be(self.page_size)
            self._io.write_u4be(self.version)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\xD7\xB7\xAB\x1E":
                raise kaitaistruct.ValidationNotEqualError(b"\xD7\xB7\xAB\x1E", self.magic, None, u"/types/dt_table_header/seq/0")
            self._dirty = False



