# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class GptPartitionTable(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://en.wikipedia.org/wiki/GUID_Partition_Table
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(GptPartitionTable, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_backup = False
        self.backup__enabled = True
        self._should_write_primary = False
        self.primary__enabled = True

    def _read(self):
        pass
        self._dirty = False


    def _fetch_instances(self):
        pass
        _ = self.backup
        if hasattr(self, '_m_backup'):
            pass
            self._m_backup._fetch_instances()

        _ = self.primary
        if hasattr(self, '_m_primary'):
            pass
            self._m_primary._fetch_instances()



    def _write__seq(self, io=None):
        super(GptPartitionTable, self)._write__seq(io)
        self._should_write_backup = self.backup__enabled
        self._should_write_primary = self.primary__enabled


    def _check(self):
        if self.backup__enabled:
            pass
            if self._m_backup._root != self._root:
                raise kaitaistruct.ConsistencyError(u"backup", self._root, self._m_backup._root)
            if self._m_backup._parent != self:
                raise kaitaistruct.ConsistencyError(u"backup", self, self._m_backup._parent)

        if self.primary__enabled:
            pass
            if self._m_primary._root != self._root:
                raise kaitaistruct.ConsistencyError(u"primary", self._root, self._m_primary._root)
            if self._m_primary._parent != self:
                raise kaitaistruct.ConsistencyError(u"primary", self, self._m_primary._parent)

        self._dirty = False

    class PartitionEntry(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(GptPartitionTable.PartitionEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.type_guid = self._io.read_bytes(16)
            self.guid = self._io.read_bytes(16)
            self.first_lba = self._io.read_u8le()
            self.last_lba = self._io.read_u8le()
            self.attributes = self._io.read_u8le()
            self.name = (self._io.read_bytes(72)).decode(u"UTF-16LE")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(GptPartitionTable.PartitionEntry, self)._write__seq(io)
            self._io.write_bytes(self.type_guid)
            self._io.write_bytes(self.guid)
            self._io.write_u8le(self.first_lba)
            self._io.write_u8le(self.last_lba)
            self._io.write_u8le(self.attributes)
            self._io.write_bytes((self.name).encode(u"UTF-16LE"))


        def _check(self):
            if len(self.type_guid) != 16:
                raise kaitaistruct.ConsistencyError(u"type_guid", 16, len(self.type_guid))
            if len(self.guid) != 16:
                raise kaitaistruct.ConsistencyError(u"guid", 16, len(self.guid))
            if len((self.name).encode(u"UTF-16LE")) != 72:
                raise kaitaistruct.ConsistencyError(u"name", 72, len((self.name).encode(u"UTF-16LE")))
            self._dirty = False


    class PartitionHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(GptPartitionTable.PartitionHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_entries = False
            self.entries__enabled = True

        def _read(self):
            self.signature = self._io.read_bytes(8)
            if not self.signature == b"\x45\x46\x49\x20\x50\x41\x52\x54":
                raise kaitaistruct.ValidationNotEqualError(b"\x45\x46\x49\x20\x50\x41\x52\x54", self.signature, self._io, u"/types/partition_header/seq/0")
            self.revision = self._io.read_u4le()
            self.header_size = self._io.read_u4le()
            self.crc32_header = self._io.read_u4le()
            self.reserved = self._io.read_u4le()
            self.current_lba = self._io.read_u8le()
            self.backup_lba = self._io.read_u8le()
            self.first_usable_lba = self._io.read_u8le()
            self.last_usable_lba = self._io.read_u8le()
            self.disk_guid = self._io.read_bytes(16)
            self.entries_start = self._io.read_u8le()
            self.entries_count = self._io.read_u4le()
            self.entries_size = self._io.read_u4le()
            self.crc32_array = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.entries
            if hasattr(self, '_m_entries'):
                pass
                for i in range(len(self._m_entries)):
                    pass
                    self._m_entries[i]._fetch_instances()




        def _write__seq(self, io=None):
            super(GptPartitionTable.PartitionHeader, self)._write__seq(io)
            self._should_write_entries = self.entries__enabled
            self._io.write_bytes(self.signature)
            self._io.write_u4le(self.revision)
            self._io.write_u4le(self.header_size)
            self._io.write_u4le(self.crc32_header)
            self._io.write_u4le(self.reserved)
            self._io.write_u8le(self.current_lba)
            self._io.write_u8le(self.backup_lba)
            self._io.write_u8le(self.first_usable_lba)
            self._io.write_u8le(self.last_usable_lba)
            self._io.write_bytes(self.disk_guid)
            self._io.write_u8le(self.entries_start)
            self._io.write_u4le(self.entries_count)
            self._io.write_u4le(self.entries_size)
            self._io.write_u4le(self.crc32_array)


        def _check(self):
            if len(self.signature) != 8:
                raise kaitaistruct.ConsistencyError(u"signature", 8, len(self.signature))
            if not self.signature == b"\x45\x46\x49\x20\x50\x41\x52\x54":
                raise kaitaistruct.ValidationNotEqualError(b"\x45\x46\x49\x20\x50\x41\x52\x54", self.signature, None, u"/types/partition_header/seq/0")
            if len(self.disk_guid) != 16:
                raise kaitaistruct.ConsistencyError(u"disk_guid", 16, len(self.disk_guid))
            if self.entries__enabled:
                pass
                if len(self._m_entries) != self.entries_count:
                    raise kaitaistruct.ConsistencyError(u"entries", self.entries_count, len(self._m_entries))
                for i in range(len(self._m_entries)):
                    pass
                    if self._m_entries[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"entries", self._root, self._m_entries[i]._root)
                    if self._m_entries[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"entries", self, self._m_entries[i]._parent)


            self._dirty = False

        @property
        def entries(self):
            if self._should_write_entries:
                self._write_entries()
            if hasattr(self, '_m_entries'):
                return self._m_entries

            if not self.entries__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.entries_start * self._root.sector_size)
            self._raw__m_entries = []
            self._m_entries = []
            for i in range(self.entries_count):
                self._raw__m_entries.append(io.read_bytes(self.entries_size))
                _io__raw__m_entries = KaitaiStream(BytesIO(self._raw__m_entries[i]))
                _t__m_entries = GptPartitionTable.PartitionEntry(_io__raw__m_entries, self, self._root)
                try:
                    _t__m_entries._read()
                finally:
                    self._m_entries.append(_t__m_entries)

            io.seek(_pos)
            return getattr(self, '_m_entries', None)

        @entries.setter
        def entries(self, v):
            self._dirty = True
            self._m_entries = v

        def _write_entries(self):
            self._should_write_entries = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.entries_start * self._root.sector_size)
            self._raw__m_entries = []
            for i in range(len(self._m_entries)):
                pass
                _io__raw__m_entries = KaitaiStream(BytesIO(bytearray(self.entries_size)))
                io.add_child_stream(_io__raw__m_entries)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.entries_size))
                def handler(parent, _io__raw__m_entries=_io__raw__m_entries, i=i):
                    self._raw__m_entries.append(_io__raw__m_entries.to_byte_array())
                    if len(self._raw__m_entries[i]) != self.entries_size:
                        raise kaitaistruct.ConsistencyError(u"raw(entries)", self.entries_size, len(self._raw__m_entries[i]))
                    parent.write_bytes(self._raw__m_entries[i])
                _io__raw__m_entries.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_entries[i]._write__seq(_io__raw__m_entries)

            io.seek(_pos)


    @property
    def backup(self):
        if self._should_write_backup:
            self._write_backup()
        if hasattr(self, '_m_backup'):
            return self._m_backup

        if not self.backup__enabled:
            return None

        io = self._root._io
        _pos = io.pos()
        io.seek(self._io.size() - self._root.sector_size)
        self._m_backup = GptPartitionTable.PartitionHeader(io, self, self._root)
        self._m_backup._read()
        io.seek(_pos)
        return getattr(self, '_m_backup', None)

    @backup.setter
    def backup(self, v):
        self._dirty = True
        self._m_backup = v

    def _write_backup(self):
        self._should_write_backup = False
        io = self._root._io
        _pos = io.pos()
        io.seek(self._io.size() - self._root.sector_size)
        self._m_backup._write__seq(io)
        io.seek(_pos)

    @property
    def primary(self):
        if self._should_write_primary:
            self._write_primary()
        if hasattr(self, '_m_primary'):
            return self._m_primary

        if not self.primary__enabled:
            return None

        io = self._root._io
        _pos = io.pos()
        io.seek(self._root.sector_size)
        self._m_primary = GptPartitionTable.PartitionHeader(io, self, self._root)
        self._m_primary._read()
        io.seek(_pos)
        return getattr(self, '_m_primary', None)

    @primary.setter
    def primary(self, v):
        self._dirty = True
        self._m_primary = v

    def _write_primary(self):
        self._should_write_primary = False
        io = self._root._io
        _pos = io.pos()
        io.seek(self._root.sector_size)
        self._m_primary._write__seq(io)
        io.seek(_pos)

    @property
    def sector_size(self):
        if hasattr(self, '_m_sector_size'):
            return self._m_sector_size

        self._m_sector_size = 512
        return getattr(self, '_m_sector_size', None)

    def _invalidate_sector_size(self):
        del self._m_sector_size

