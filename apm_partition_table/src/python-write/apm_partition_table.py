# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class ApmPartitionTable(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://en.wikipedia.org/wiki/Apple_Partition_Map
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(ApmPartitionTable, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_partition_entries = False
        self.partition_entries__enabled = True
        self._should_write_partition_lookup = False
        self.partition_lookup__enabled = True

    def _read(self):
        pass
        self._dirty = False


    def _fetch_instances(self):
        pass
        _ = self.partition_entries
        if hasattr(self, '_m_partition_entries'):
            pass
            for i in range(len(self._m_partition_entries)):
                pass
                self._m_partition_entries[i]._fetch_instances()


        _ = self.partition_lookup
        if hasattr(self, '_m_partition_lookup'):
            pass
            self._m_partition_lookup._fetch_instances()



    def _write__seq(self, io=None):
        super(ApmPartitionTable, self)._write__seq(io)
        self._should_write_partition_entries = self.partition_entries__enabled
        self._should_write_partition_lookup = self.partition_lookup__enabled


    def _check(self):
        if self.partition_entries__enabled:
            pass
            if len(self._m_partition_entries) != self._root.partition_lookup.number_of_partitions:
                raise kaitaistruct.ConsistencyError(u"partition_entries", self._root.partition_lookup.number_of_partitions, len(self._m_partition_entries))
            for i in range(len(self._m_partition_entries)):
                pass
                if self._m_partition_entries[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"partition_entries", self._root, self._m_partition_entries[i]._root)
                if self._m_partition_entries[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"partition_entries", self, self._m_partition_entries[i]._parent)


        if self.partition_lookup__enabled:
            pass
            if self._m_partition_lookup._root != self._root:
                raise kaitaistruct.ConsistencyError(u"partition_lookup", self._root, self._m_partition_lookup._root)
            if self._m_partition_lookup._parent != self:
                raise kaitaistruct.ConsistencyError(u"partition_lookup", self, self._m_partition_lookup._parent)

        self._dirty = False

    class PartitionEntry(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ApmPartitionTable.PartitionEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_boot_code = False
            self.boot_code__enabled = True
            self._should_write_data = False
            self.data__enabled = True
            self._should_write_partition = False
            self.partition__enabled = True

        def _read(self):
            self.magic = self._io.read_bytes(2)
            if not self.magic == b"\x50\x4D":
                raise kaitaistruct.ValidationNotEqualError(b"\x50\x4D", self.magic, self._io, u"/types/partition_entry/seq/0")
            self.reserved_1 = self._io.read_bytes(2)
            self.number_of_partitions = self._io.read_u4be()
            self.partition_start = self._io.read_u4be()
            self.partition_size = self._io.read_u4be()
            self.partition_name = (KaitaiStream.bytes_terminate(self._io.read_bytes(32), 0, False)).decode(u"ASCII")
            self.partition_type = (KaitaiStream.bytes_terminate(self._io.read_bytes(32), 0, False)).decode(u"ASCII")
            self.data_start = self._io.read_u4be()
            self.data_size = self._io.read_u4be()
            self.partition_status = self._io.read_u4be()
            self.boot_code_start = self._io.read_u4be()
            self.boot_code_size = self._io.read_u4be()
            self.boot_loader_address = self._io.read_u4be()
            self.reserved_2 = self._io.read_bytes(4)
            self.boot_code_entry = self._io.read_u4be()
            self.reserved_3 = self._io.read_bytes(4)
            self.boot_code_cksum = self._io.read_u4be()
            self.processor_type = (KaitaiStream.bytes_terminate(self._io.read_bytes(16), 0, False)).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.boot_code
            if hasattr(self, '_m_boot_code'):
                pass

            _ = self.data
            if hasattr(self, '_m_data'):
                pass

            _ = self.partition
            if hasattr(self, '_m_partition'):
                pass



        def _write__seq(self, io=None):
            super(ApmPartitionTable.PartitionEntry, self)._write__seq(io)
            self._should_write_boot_code = self.boot_code__enabled
            self._should_write_data = self.data__enabled
            self._should_write_partition = self.partition__enabled
            self._io.write_bytes(self.magic)
            self._io.write_bytes(self.reserved_1)
            self._io.write_u4be(self.number_of_partitions)
            self._io.write_u4be(self.partition_start)
            self._io.write_u4be(self.partition_size)
            self._io.write_bytes_limit((self.partition_name).encode(u"ASCII"), 32, 0, 0)
            self._io.write_bytes_limit((self.partition_type).encode(u"ASCII"), 32, 0, 0)
            self._io.write_u4be(self.data_start)
            self._io.write_u4be(self.data_size)
            self._io.write_u4be(self.partition_status)
            self._io.write_u4be(self.boot_code_start)
            self._io.write_u4be(self.boot_code_size)
            self._io.write_u4be(self.boot_loader_address)
            self._io.write_bytes(self.reserved_2)
            self._io.write_u4be(self.boot_code_entry)
            self._io.write_bytes(self.reserved_3)
            self._io.write_u4be(self.boot_code_cksum)
            self._io.write_bytes_limit((self.processor_type).encode(u"ASCII"), 16, 0, 0)


        def _check(self):
            if len(self.magic) != 2:
                raise kaitaistruct.ConsistencyError(u"magic", 2, len(self.magic))
            if not self.magic == b"\x50\x4D":
                raise kaitaistruct.ValidationNotEqualError(b"\x50\x4D", self.magic, None, u"/types/partition_entry/seq/0")
            if len(self.reserved_1) != 2:
                raise kaitaistruct.ConsistencyError(u"reserved_1", 2, len(self.reserved_1))
            if len((self.partition_name).encode(u"ASCII")) > 32:
                raise kaitaistruct.ConsistencyError(u"partition_name", 32, len((self.partition_name).encode(u"ASCII")))
            if KaitaiStream.byte_array_index_of((self.partition_name).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"partition_name", -1, KaitaiStream.byte_array_index_of((self.partition_name).encode(u"ASCII"), 0))
            if len((self.partition_type).encode(u"ASCII")) > 32:
                raise kaitaistruct.ConsistencyError(u"partition_type", 32, len((self.partition_type).encode(u"ASCII")))
            if KaitaiStream.byte_array_index_of((self.partition_type).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"partition_type", -1, KaitaiStream.byte_array_index_of((self.partition_type).encode(u"ASCII"), 0))
            if len(self.reserved_2) != 4:
                raise kaitaistruct.ConsistencyError(u"reserved_2", 4, len(self.reserved_2))
            if len(self.reserved_3) != 4:
                raise kaitaistruct.ConsistencyError(u"reserved_3", 4, len(self.reserved_3))
            if len((self.processor_type).encode(u"ASCII")) > 16:
                raise kaitaistruct.ConsistencyError(u"processor_type", 16, len((self.processor_type).encode(u"ASCII")))
            if KaitaiStream.byte_array_index_of((self.processor_type).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"processor_type", -1, KaitaiStream.byte_array_index_of((self.processor_type).encode(u"ASCII"), 0))
            if self.boot_code__enabled:
                pass
                if len(self._m_boot_code) != self.boot_code_size:
                    raise kaitaistruct.ConsistencyError(u"boot_code", self.boot_code_size, len(self._m_boot_code))

            if self.data__enabled:
                pass
                if len(self._m_data) != self.data_size * self._root.sector_size:
                    raise kaitaistruct.ConsistencyError(u"data", self.data_size * self._root.sector_size, len(self._m_data))

            if self.partition__enabled:
                pass
                if self.partition_status & 1 != 0:
                    pass
                    if len(self._m_partition) != self.partition_size * self._root.sector_size:
                        raise kaitaistruct.ConsistencyError(u"partition", self.partition_size * self._root.sector_size, len(self._m_partition))


            self._dirty = False

        @property
        def boot_code(self):
            if self._should_write_boot_code:
                self._write_boot_code()
            if hasattr(self, '_m_boot_code'):
                return self._m_boot_code

            if not self.boot_code__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.boot_code_start * self._root.sector_size)
            self._m_boot_code = io.read_bytes(self.boot_code_size)
            io.seek(_pos)
            return getattr(self, '_m_boot_code', None)

        @boot_code.setter
        def boot_code(self, v):
            self._dirty = True
            self._m_boot_code = v

        def _write_boot_code(self):
            self._should_write_boot_code = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.boot_code_start * self._root.sector_size)
            io.write_bytes(self._m_boot_code)
            io.seek(_pos)

        @property
        def data(self):
            if self._should_write_data:
                self._write_data()
            if hasattr(self, '_m_data'):
                return self._m_data

            if not self.data__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.data_start * self._root.sector_size)
            self._m_data = io.read_bytes(self.data_size * self._root.sector_size)
            io.seek(_pos)
            return getattr(self, '_m_data', None)

        @data.setter
        def data(self, v):
            self._dirty = True
            self._m_data = v

        def _write_data(self):
            self._should_write_data = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.data_start * self._root.sector_size)
            io.write_bytes(self._m_data)
            io.seek(_pos)

        @property
        def partition(self):
            if self._should_write_partition:
                self._write_partition()
            if hasattr(self, '_m_partition'):
                return self._m_partition

            if not self.partition__enabled:
                return None

            if self.partition_status & 1 != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.partition_start * self._root.sector_size)
                self._m_partition = io.read_bytes(self.partition_size * self._root.sector_size)
                io.seek(_pos)

            return getattr(self, '_m_partition', None)

        @partition.setter
        def partition(self, v):
            self._dirty = True
            self._m_partition = v

        def _write_partition(self):
            self._should_write_partition = False
            if self.partition_status & 1 != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.partition_start * self._root.sector_size)
                io.write_bytes(self._m_partition)
                io.seek(_pos)



    @property
    def partition_entries(self):
        if self._should_write_partition_entries:
            self._write_partition_entries()
        if hasattr(self, '_m_partition_entries'):
            return self._m_partition_entries

        if not self.partition_entries__enabled:
            return None

        io = self._root._io
        _pos = io.pos()
        io.seek(self._root.sector_size)
        self._raw__m_partition_entries = []
        self._m_partition_entries = []
        for i in range(self._root.partition_lookup.number_of_partitions):
            self._raw__m_partition_entries.append(io.read_bytes(self.sector_size))
            _io__raw__m_partition_entries = KaitaiStream(BytesIO(self._raw__m_partition_entries[i]))
            _t__m_partition_entries = ApmPartitionTable.PartitionEntry(_io__raw__m_partition_entries, self, self._root)
            try:
                _t__m_partition_entries._read()
            finally:
                self._m_partition_entries.append(_t__m_partition_entries)

        io.seek(_pos)
        return getattr(self, '_m_partition_entries', None)

    @partition_entries.setter
    def partition_entries(self, v):
        self._dirty = True
        self._m_partition_entries = v

    def _write_partition_entries(self):
        self._should_write_partition_entries = False
        io = self._root._io
        _pos = io.pos()
        io.seek(self._root.sector_size)
        self._raw__m_partition_entries = []
        for i in range(len(self._m_partition_entries)):
            pass
            _io__raw__m_partition_entries = KaitaiStream(BytesIO(bytearray(self.sector_size)))
            io.add_child_stream(_io__raw__m_partition_entries)
            _pos2 = io.pos()
            io.seek(io.pos() + (self.sector_size))
            def handler(parent, _io__raw__m_partition_entries=_io__raw__m_partition_entries, i=i):
                self._raw__m_partition_entries.append(_io__raw__m_partition_entries.to_byte_array())
                if len(self._raw__m_partition_entries[i]) != self.sector_size:
                    raise kaitaistruct.ConsistencyError(u"raw(partition_entries)", self.sector_size, len(self._raw__m_partition_entries[i]))
                parent.write_bytes(self._raw__m_partition_entries[i])
            _io__raw__m_partition_entries.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self._m_partition_entries[i]._write__seq(_io__raw__m_partition_entries)

        io.seek(_pos)

    @property
    def partition_lookup(self):
        """Every partition entry contains the number of partition entries.
        We parse the first entry, to know how many to parse, including the first one.
        No logic is given what to do if other entries have a different number.
        """
        if self._should_write_partition_lookup:
            self._write_partition_lookup()
        if hasattr(self, '_m_partition_lookup'):
            return self._m_partition_lookup

        if not self.partition_lookup__enabled:
            return None

        io = self._root._io
        _pos = io.pos()
        io.seek(self._root.sector_size)
        self._raw__m_partition_lookup = io.read_bytes(self.sector_size)
        _io__raw__m_partition_lookup = KaitaiStream(BytesIO(self._raw__m_partition_lookup))
        self._m_partition_lookup = ApmPartitionTable.PartitionEntry(_io__raw__m_partition_lookup, self, self._root)
        self._m_partition_lookup._read()
        io.seek(_pos)
        return getattr(self, '_m_partition_lookup', None)

    @partition_lookup.setter
    def partition_lookup(self, v):
        self._dirty = True
        self._m_partition_lookup = v

    def _write_partition_lookup(self):
        self._should_write_partition_lookup = False
        io = self._root._io
        _pos = io.pos()
        io.seek(self._root.sector_size)
        _io__raw__m_partition_lookup = KaitaiStream(BytesIO(bytearray(self.sector_size)))
        io.add_child_stream(_io__raw__m_partition_lookup)
        _pos2 = io.pos()
        io.seek(io.pos() + (self.sector_size))
        def handler(parent, _io__raw__m_partition_lookup=_io__raw__m_partition_lookup):
            self._raw__m_partition_lookup = _io__raw__m_partition_lookup.to_byte_array()
            if len(self._raw__m_partition_lookup) != self.sector_size:
                raise kaitaistruct.ConsistencyError(u"raw(partition_lookup)", self.sector_size, len(self._raw__m_partition_lookup))
            parent.write_bytes(self._raw__m_partition_lookup)
        _io__raw__m_partition_lookup.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self._m_partition_lookup._write__seq(_io__raw__m_partition_lookup)
        io.seek(_pos)

    @property
    def sector_size(self):
        """0x200 (512) bytes for disks, 0x1000 (4096) bytes is not supported by APM
        0x800 (2048) bytes for CDROM
        """
        if hasattr(self, '_m_sector_size'):
            return self._m_sector_size

        self._m_sector_size = 512
        return getattr(self, '_m_sector_size', None)

    def _invalidate_sector_size(self):
        del self._m_sector_size

