# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class AndroidSuper(ReadWriteKaitaiStruct):
    """The metadata stored by Android at the beginning of a "super" partition, which
    is what it calls a disk partition that holds one or more Dynamic Partitions.
    Dynamic Partitions do more or less the same thing that LVM does on Linux,
    allowing Android to map ranges of non-contiguous extents to a single logical
    device. This metadata holds that mapping.
    
    .. seealso::
       Source - https://source.android.com/docs/core/ota/dynamic_partitions
    
    
    .. seealso::
       Source - https://android.googlesource.com/platform/system/core/+/refs/tags/android-11.0.0_r8/fs_mgr/liblp/include/liblp/metadata_format.h
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(AndroidSuper, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_root = False
        self.root__enabled = True

    def _read(self):
        pass
        self._dirty = False


    def _fetch_instances(self):
        pass
        _ = self.root
        if hasattr(self, '_m_root'):
            pass
            self._m_root._fetch_instances()



    def _write__seq(self, io=None):
        super(AndroidSuper, self)._write__seq(io)
        self._should_write_root = self.root__enabled


    def _check(self):
        if self.root__enabled:
            pass
            if self._m_root._root != self._root:
                raise kaitaistruct.ConsistencyError(u"root", self._root, self._m_root._root)
            if self._m_root._parent != self:
                raise kaitaistruct.ConsistencyError(u"root", self, self._m_root._parent)

        self._dirty = False

    class Geometry(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidSuper.Geometry, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x67\x44\x6C\x61":
                raise kaitaistruct.ValidationNotEqualError(b"\x67\x44\x6C\x61", self.magic, self._io, u"/types/geometry/seq/0")
            self.struct_size = self._io.read_u4le()
            self.checksum = self._io.read_bytes(32)
            self.metadata_max_size = self._io.read_u4le()
            self.metadata_slot_count = self._io.read_u4le()
            self.logical_block_size = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(AndroidSuper.Geometry, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u4le(self.struct_size)
            self._io.write_bytes(self.checksum)
            self._io.write_u4le(self.metadata_max_size)
            self._io.write_u4le(self.metadata_slot_count)
            self._io.write_u4le(self.logical_block_size)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x67\x44\x6C\x61":
                raise kaitaistruct.ValidationNotEqualError(b"\x67\x44\x6C\x61", self.magic, None, u"/types/geometry/seq/0")
            if len(self.checksum) != 32:
                raise kaitaistruct.ConsistencyError(u"checksum", 32, len(self.checksum))
            self._dirty = False


    class Metadata(ReadWriteKaitaiStruct):

        class TableKind(IntEnum):
            partitions = 0
            extents = 1
            groups = 2
            block_devices = 3
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidSuper.Metadata, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x30\x50\x4C\x41":
                raise kaitaistruct.ValidationNotEqualError(b"\x30\x50\x4C\x41", self.magic, self._io, u"/types/metadata/seq/0")
            self.major_version = self._io.read_u2le()
            self.minor_version = self._io.read_u2le()
            self.header_size = self._io.read_u4le()
            self.header_checksum = self._io.read_bytes(32)
            self.tables_size = self._io.read_u4le()
            self.tables_checksum = self._io.read_bytes(32)
            self.partitions = AndroidSuper.Metadata.TableDescriptor(AndroidSuper.Metadata.TableKind.partitions, self._io, self, self._root)
            self.partitions._read()
            self.extents = AndroidSuper.Metadata.TableDescriptor(AndroidSuper.Metadata.TableKind.extents, self._io, self, self._root)
            self.extents._read()
            self.groups = AndroidSuper.Metadata.TableDescriptor(AndroidSuper.Metadata.TableKind.groups, self._io, self, self._root)
            self.groups._read()
            self.block_devices = AndroidSuper.Metadata.TableDescriptor(AndroidSuper.Metadata.TableKind.block_devices, self._io, self, self._root)
            self.block_devices._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.partitions._fetch_instances()
            self.extents._fetch_instances()
            self.groups._fetch_instances()
            self.block_devices._fetch_instances()


        def _write__seq(self, io=None):
            super(AndroidSuper.Metadata, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u2le(self.major_version)
            self._io.write_u2le(self.minor_version)
            self._io.write_u4le(self.header_size)
            self._io.write_bytes(self.header_checksum)
            self._io.write_u4le(self.tables_size)
            self._io.write_bytes(self.tables_checksum)
            self.partitions._write__seq(self._io)
            self.extents._write__seq(self._io)
            self.groups._write__seq(self._io)
            self.block_devices._write__seq(self._io)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x30\x50\x4C\x41":
                raise kaitaistruct.ValidationNotEqualError(b"\x30\x50\x4C\x41", self.magic, None, u"/types/metadata/seq/0")
            if len(self.header_checksum) != 32:
                raise kaitaistruct.ConsistencyError(u"header_checksum", 32, len(self.header_checksum))
            if len(self.tables_checksum) != 32:
                raise kaitaistruct.ConsistencyError(u"tables_checksum", 32, len(self.tables_checksum))
            if self.partitions._root != self._root:
                raise kaitaistruct.ConsistencyError(u"partitions", self._root, self.partitions._root)
            if self.partitions._parent != self:
                raise kaitaistruct.ConsistencyError(u"partitions", self, self.partitions._parent)
            if self.partitions.kind != AndroidSuper.Metadata.TableKind.partitions:
                raise kaitaistruct.ConsistencyError(u"partitions", AndroidSuper.Metadata.TableKind.partitions, self.partitions.kind)
            if self.extents._root != self._root:
                raise kaitaistruct.ConsistencyError(u"extents", self._root, self.extents._root)
            if self.extents._parent != self:
                raise kaitaistruct.ConsistencyError(u"extents", self, self.extents._parent)
            if self.extents.kind != AndroidSuper.Metadata.TableKind.extents:
                raise kaitaistruct.ConsistencyError(u"extents", AndroidSuper.Metadata.TableKind.extents, self.extents.kind)
            if self.groups._root != self._root:
                raise kaitaistruct.ConsistencyError(u"groups", self._root, self.groups._root)
            if self.groups._parent != self:
                raise kaitaistruct.ConsistencyError(u"groups", self, self.groups._parent)
            if self.groups.kind != AndroidSuper.Metadata.TableKind.groups:
                raise kaitaistruct.ConsistencyError(u"groups", AndroidSuper.Metadata.TableKind.groups, self.groups.kind)
            if self.block_devices._root != self._root:
                raise kaitaistruct.ConsistencyError(u"block_devices", self._root, self.block_devices._root)
            if self.block_devices._parent != self:
                raise kaitaistruct.ConsistencyError(u"block_devices", self, self.block_devices._parent)
            if self.block_devices.kind != AndroidSuper.Metadata.TableKind.block_devices:
                raise kaitaistruct.ConsistencyError(u"block_devices", AndroidSuper.Metadata.TableKind.block_devices, self.block_devices.kind)
            self._dirty = False

        class BlockDevice(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(AndroidSuper.Metadata.BlockDevice, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.first_logical_sector = self._io.read_u8le()
                self.alignment = self._io.read_u4le()
                self.alignment_offset = self._io.read_u4le()
                self.size = self._io.read_u8le()
                self.partition_name = (KaitaiStream.bytes_terminate(self._io.read_bytes(36), 0, False)).decode(u"UTF-8")
                self.flag_slot_suffixed = self._io.read_bits_int_le(1) != 0
                self.flags_reserved = self._io.read_bits_int_le(31)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(AndroidSuper.Metadata.BlockDevice, self)._write__seq(io)
                self._io.write_u8le(self.first_logical_sector)
                self._io.write_u4le(self.alignment)
                self._io.write_u4le(self.alignment_offset)
                self._io.write_u8le(self.size)
                self._io.write_bytes_limit((self.partition_name).encode(u"UTF-8"), 36, 0, 0)
                self._io.write_bits_int_le(1, int(self.flag_slot_suffixed))
                self._io.write_bits_int_le(31, self.flags_reserved)


            def _check(self):
                if len((self.partition_name).encode(u"UTF-8")) > 36:
                    raise kaitaistruct.ConsistencyError(u"partition_name", 36, len((self.partition_name).encode(u"UTF-8")))
                if KaitaiStream.byte_array_index_of((self.partition_name).encode(u"UTF-8"), 0) != -1:
                    raise kaitaistruct.ConsistencyError(u"partition_name", -1, KaitaiStream.byte_array_index_of((self.partition_name).encode(u"UTF-8"), 0))
                self._dirty = False


        class Extent(ReadWriteKaitaiStruct):

            class TargetType(IntEnum):
                linear = 0
                zero = 1
            def __init__(self, _io=None, _parent=None, _root=None):
                super(AndroidSuper.Metadata.Extent, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.num_sectors = self._io.read_u8le()
                self.target_type = KaitaiStream.resolve_enum(AndroidSuper.Metadata.Extent.TargetType, self._io.read_u4le())
                self.target_data = self._io.read_u8le()
                self.target_source = self._io.read_u4le()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(AndroidSuper.Metadata.Extent, self)._write__seq(io)
                self._io.write_u8le(self.num_sectors)
                self._io.write_u4le(int(self.target_type))
                self._io.write_u8le(self.target_data)
                self._io.write_u4le(self.target_source)


            def _check(self):
                self._dirty = False


        class Group(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(AndroidSuper.Metadata.Group, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(36), 0, False)).decode(u"UTF-8")
                self.flag_slot_suffixed = self._io.read_bits_int_le(1) != 0
                self.flags_reserved = self._io.read_bits_int_le(31)
                self.maximum_size = self._io.read_u8le()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(AndroidSuper.Metadata.Group, self)._write__seq(io)
                self._io.write_bytes_limit((self.name).encode(u"UTF-8"), 36, 0, 0)
                self._io.write_bits_int_le(1, int(self.flag_slot_suffixed))
                self._io.write_bits_int_le(31, self.flags_reserved)
                self._io.write_u8le(self.maximum_size)


            def _check(self):
                if len((self.name).encode(u"UTF-8")) > 36:
                    raise kaitaistruct.ConsistencyError(u"name", 36, len((self.name).encode(u"UTF-8")))
                if KaitaiStream.byte_array_index_of((self.name).encode(u"UTF-8"), 0) != -1:
                    raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self.name).encode(u"UTF-8"), 0))
                self._dirty = False


        class Partition(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(AndroidSuper.Metadata.Partition, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(36), 0, False)).decode(u"UTF-8")
                self.attr_readonly = self._io.read_bits_int_le(1) != 0
                self.attr_slot_suffixed = self._io.read_bits_int_le(1) != 0
                self.attr_updated = self._io.read_bits_int_le(1) != 0
                self.attr_disabled = self._io.read_bits_int_le(1) != 0
                self.attrs_reserved = self._io.read_bits_int_le(28)
                self.first_extent_index = self._io.read_u4le()
                self.num_extents = self._io.read_u4le()
                self.group_index = self._io.read_u4le()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(AndroidSuper.Metadata.Partition, self)._write__seq(io)
                self._io.write_bytes_limit((self.name).encode(u"UTF-8"), 36, 0, 0)
                self._io.write_bits_int_le(1, int(self.attr_readonly))
                self._io.write_bits_int_le(1, int(self.attr_slot_suffixed))
                self._io.write_bits_int_le(1, int(self.attr_updated))
                self._io.write_bits_int_le(1, int(self.attr_disabled))
                self._io.write_bits_int_le(28, self.attrs_reserved)
                self._io.write_u4le(self.first_extent_index)
                self._io.write_u4le(self.num_extents)
                self._io.write_u4le(self.group_index)


            def _check(self):
                if len((self.name).encode(u"UTF-8")) > 36:
                    raise kaitaistruct.ConsistencyError(u"name", 36, len((self.name).encode(u"UTF-8")))
                if KaitaiStream.byte_array_index_of((self.name).encode(u"UTF-8"), 0) != -1:
                    raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self.name).encode(u"UTF-8"), 0))
                self._dirty = False


        class TableDescriptor(ReadWriteKaitaiStruct):
            def __init__(self, kind, _io=None, _parent=None, _root=None):
                super(AndroidSuper.Metadata.TableDescriptor, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self.kind = kind
                self._should_write_table = False
                self.table__enabled = True

            def _read(self):
                self.offset = self._io.read_u4le()
                self.num_entries = self._io.read_u4le()
                self.entry_size = self._io.read_u4le()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.table
                if hasattr(self, '_m_table'):
                    pass
                    for i in range(len(self._m_table)):
                        pass
                        _on = self.kind
                        if _on == AndroidSuper.Metadata.TableKind.block_devices:
                            pass
                            self._m_table[i]._fetch_instances()
                        elif _on == AndroidSuper.Metadata.TableKind.extents:
                            pass
                            self._m_table[i]._fetch_instances()
                        elif _on == AndroidSuper.Metadata.TableKind.groups:
                            pass
                            self._m_table[i]._fetch_instances()
                        elif _on == AndroidSuper.Metadata.TableKind.partitions:
                            pass
                            self._m_table[i]._fetch_instances()
                        else:
                            pass




            def _write__seq(self, io=None):
                super(AndroidSuper.Metadata.TableDescriptor, self)._write__seq(io)
                self._should_write_table = self.table__enabled
                self._io.write_u4le(self.offset)
                self._io.write_u4le(self.num_entries)
                self._io.write_u4le(self.entry_size)


            def _check(self):
                if self.table__enabled:
                    pass
                    if len(self._m_table) != self.num_entries:
                        raise kaitaistruct.ConsistencyError(u"table", self.num_entries, len(self._m_table))
                    for i in range(len(self._m_table)):
                        pass
                        _on = self.kind
                        if _on == AndroidSuper.Metadata.TableKind.block_devices:
                            pass
                            if self._m_table[i]._root != self._root:
                                raise kaitaistruct.ConsistencyError(u"table", self._root, self._m_table[i]._root)
                            if self._m_table[i]._parent != self:
                                raise kaitaistruct.ConsistencyError(u"table", self, self._m_table[i]._parent)
                        elif _on == AndroidSuper.Metadata.TableKind.extents:
                            pass
                            if self._m_table[i]._root != self._root:
                                raise kaitaistruct.ConsistencyError(u"table", self._root, self._m_table[i]._root)
                            if self._m_table[i]._parent != self:
                                raise kaitaistruct.ConsistencyError(u"table", self, self._m_table[i]._parent)
                        elif _on == AndroidSuper.Metadata.TableKind.groups:
                            pass
                            if self._m_table[i]._root != self._root:
                                raise kaitaistruct.ConsistencyError(u"table", self._root, self._m_table[i]._root)
                            if self._m_table[i]._parent != self:
                                raise kaitaistruct.ConsistencyError(u"table", self, self._m_table[i]._parent)
                        elif _on == AndroidSuper.Metadata.TableKind.partitions:
                            pass
                            if self._m_table[i]._root != self._root:
                                raise kaitaistruct.ConsistencyError(u"table", self._root, self._m_table[i]._root)
                            if self._m_table[i]._parent != self:
                                raise kaitaistruct.ConsistencyError(u"table", self, self._m_table[i]._parent)
                        else:
                            pass
                            if len(self._m_table[i]) != self.entry_size:
                                raise kaitaistruct.ConsistencyError(u"table", self.entry_size, len(self._m_table[i]))


                self._dirty = False

            @property
            def table(self):
                if self._should_write_table:
                    self._write_table()
                if hasattr(self, '_m_table'):
                    return self._m_table

                if not self.table__enabled:
                    return None

                _pos = self._io.pos()
                self._io.seek(self._parent.header_size + self.offset)
                self._raw__m_table = []
                self._m_table = []
                for i in range(self.num_entries):
                    _on = self.kind
                    if _on == AndroidSuper.Metadata.TableKind.block_devices:
                        pass
                        self._raw__m_table.append(self._io.read_bytes(self.entry_size))
                        _io__raw__m_table = KaitaiStream(BytesIO(self._raw__m_table[i]))
                        _t__m_table = AndroidSuper.Metadata.BlockDevice(_io__raw__m_table, self, self._root)
                        try:
                            _t__m_table._read()
                        finally:
                            self._m_table.append(_t__m_table)
                    elif _on == AndroidSuper.Metadata.TableKind.extents:
                        pass
                        self._raw__m_table.append(self._io.read_bytes(self.entry_size))
                        _io__raw__m_table = KaitaiStream(BytesIO(self._raw__m_table[i]))
                        _t__m_table = AndroidSuper.Metadata.Extent(_io__raw__m_table, self, self._root)
                        try:
                            _t__m_table._read()
                        finally:
                            self._m_table.append(_t__m_table)
                    elif _on == AndroidSuper.Metadata.TableKind.groups:
                        pass
                        self._raw__m_table.append(self._io.read_bytes(self.entry_size))
                        _io__raw__m_table = KaitaiStream(BytesIO(self._raw__m_table[i]))
                        _t__m_table = AndroidSuper.Metadata.Group(_io__raw__m_table, self, self._root)
                        try:
                            _t__m_table._read()
                        finally:
                            self._m_table.append(_t__m_table)
                    elif _on == AndroidSuper.Metadata.TableKind.partitions:
                        pass
                        self._raw__m_table.append(self._io.read_bytes(self.entry_size))
                        _io__raw__m_table = KaitaiStream(BytesIO(self._raw__m_table[i]))
                        _t__m_table = AndroidSuper.Metadata.Partition(_io__raw__m_table, self, self._root)
                        try:
                            _t__m_table._read()
                        finally:
                            self._m_table.append(_t__m_table)
                    else:
                        pass
                        self._m_table.append(self._io.read_bytes(self.entry_size))

                self._io.seek(_pos)
                return getattr(self, '_m_table', None)

            @table.setter
            def table(self, v):
                self._dirty = True
                self._m_table = v

            def _write_table(self):
                self._should_write_table = False
                _pos = self._io.pos()
                self._io.seek(self._parent.header_size + self.offset)
                self._raw__m_table = []
                for i in range(len(self._m_table)):
                    pass
                    _on = self.kind
                    if _on == AndroidSuper.Metadata.TableKind.block_devices:
                        pass
                        _io__raw__m_table = KaitaiStream(BytesIO(bytearray(self.entry_size)))
                        self._io.add_child_stream(_io__raw__m_table)
                        _pos2 = self._io.pos()
                        self._io.seek(self._io.pos() + (self.entry_size))
                        def handler(parent, _io__raw__m_table=_io__raw__m_table, i=i):
                            self._raw__m_table.append(_io__raw__m_table.to_byte_array())
                            if len(self._raw__m_table[i]) != self.entry_size:
                                raise kaitaistruct.ConsistencyError(u"raw(table)", self.entry_size, len(self._raw__m_table[i]))
                            parent.write_bytes(self._raw__m_table[i])
                        _io__raw__m_table.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                        self._m_table[i]._write__seq(_io__raw__m_table)
                    elif _on == AndroidSuper.Metadata.TableKind.extents:
                        pass
                        _io__raw__m_table = KaitaiStream(BytesIO(bytearray(self.entry_size)))
                        self._io.add_child_stream(_io__raw__m_table)
                        _pos2 = self._io.pos()
                        self._io.seek(self._io.pos() + (self.entry_size))
                        def handler(parent, _io__raw__m_table=_io__raw__m_table, i=i):
                            self._raw__m_table.append(_io__raw__m_table.to_byte_array())
                            if len(self._raw__m_table[i]) != self.entry_size:
                                raise kaitaistruct.ConsistencyError(u"raw(table)", self.entry_size, len(self._raw__m_table[i]))
                            parent.write_bytes(self._raw__m_table[i])
                        _io__raw__m_table.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                        self._m_table[i]._write__seq(_io__raw__m_table)
                    elif _on == AndroidSuper.Metadata.TableKind.groups:
                        pass
                        _io__raw__m_table = KaitaiStream(BytesIO(bytearray(self.entry_size)))
                        self._io.add_child_stream(_io__raw__m_table)
                        _pos2 = self._io.pos()
                        self._io.seek(self._io.pos() + (self.entry_size))
                        def handler(parent, _io__raw__m_table=_io__raw__m_table, i=i):
                            self._raw__m_table.append(_io__raw__m_table.to_byte_array())
                            if len(self._raw__m_table[i]) != self.entry_size:
                                raise kaitaistruct.ConsistencyError(u"raw(table)", self.entry_size, len(self._raw__m_table[i]))
                            parent.write_bytes(self._raw__m_table[i])
                        _io__raw__m_table.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                        self._m_table[i]._write__seq(_io__raw__m_table)
                    elif _on == AndroidSuper.Metadata.TableKind.partitions:
                        pass
                        _io__raw__m_table = KaitaiStream(BytesIO(bytearray(self.entry_size)))
                        self._io.add_child_stream(_io__raw__m_table)
                        _pos2 = self._io.pos()
                        self._io.seek(self._io.pos() + (self.entry_size))
                        def handler(parent, _io__raw__m_table=_io__raw__m_table, i=i):
                            self._raw__m_table.append(_io__raw__m_table.to_byte_array())
                            if len(self._raw__m_table[i]) != self.entry_size:
                                raise kaitaistruct.ConsistencyError(u"raw(table)", self.entry_size, len(self._raw__m_table[i]))
                            parent.write_bytes(self._raw__m_table[i])
                        _io__raw__m_table.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                        self._m_table[i]._write__seq(_io__raw__m_table)
                    else:
                        pass
                        self._io.write_bytes(self._m_table[i])

                self._io.seek(_pos)



    class Root(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidSuper.Root, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self._raw_primary_geometry = self._io.read_bytes(4096)
            _io__raw_primary_geometry = KaitaiStream(BytesIO(self._raw_primary_geometry))
            self.primary_geometry = AndroidSuper.Geometry(_io__raw_primary_geometry, self, self._root)
            self.primary_geometry._read()
            self._raw_backup_geometry = self._io.read_bytes(4096)
            _io__raw_backup_geometry = KaitaiStream(BytesIO(self._raw_backup_geometry))
            self.backup_geometry = AndroidSuper.Geometry(_io__raw_backup_geometry, self, self._root)
            self.backup_geometry._read()
            self._raw_primary_metadata = []
            self.primary_metadata = []
            for i in range(self.primary_geometry.metadata_slot_count):
                self._raw_primary_metadata.append(self._io.read_bytes(self.primary_geometry.metadata_max_size))
                _io__raw_primary_metadata = KaitaiStream(BytesIO(self._raw_primary_metadata[i]))
                _t_primary_metadata = AndroidSuper.Metadata(_io__raw_primary_metadata, self, self._root)
                try:
                    _t_primary_metadata._read()
                finally:
                    self.primary_metadata.append(_t_primary_metadata)

            self._raw_backup_metadata = []
            self.backup_metadata = []
            for i in range(self.primary_geometry.metadata_slot_count):
                self._raw_backup_metadata.append(self._io.read_bytes(self.primary_geometry.metadata_max_size))
                _io__raw_backup_metadata = KaitaiStream(BytesIO(self._raw_backup_metadata[i]))
                _t_backup_metadata = AndroidSuper.Metadata(_io__raw_backup_metadata, self, self._root)
                try:
                    _t_backup_metadata._read()
                finally:
                    self.backup_metadata.append(_t_backup_metadata)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.primary_geometry._fetch_instances()
            self.backup_geometry._fetch_instances()
            for i in range(len(self.primary_metadata)):
                pass
                self.primary_metadata[i]._fetch_instances()

            for i in range(len(self.backup_metadata)):
                pass
                self.backup_metadata[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(AndroidSuper.Root, self)._write__seq(io)
            _io__raw_primary_geometry = KaitaiStream(BytesIO(bytearray(4096)))
            self._io.add_child_stream(_io__raw_primary_geometry)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (4096))
            def handler(parent, _io__raw_primary_geometry=_io__raw_primary_geometry):
                self._raw_primary_geometry = _io__raw_primary_geometry.to_byte_array()
                if len(self._raw_primary_geometry) != 4096:
                    raise kaitaistruct.ConsistencyError(u"raw(primary_geometry)", 4096, len(self._raw_primary_geometry))
                parent.write_bytes(self._raw_primary_geometry)
            _io__raw_primary_geometry.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.primary_geometry._write__seq(_io__raw_primary_geometry)
            _io__raw_backup_geometry = KaitaiStream(BytesIO(bytearray(4096)))
            self._io.add_child_stream(_io__raw_backup_geometry)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (4096))
            def handler(parent, _io__raw_backup_geometry=_io__raw_backup_geometry):
                self._raw_backup_geometry = _io__raw_backup_geometry.to_byte_array()
                if len(self._raw_backup_geometry) != 4096:
                    raise kaitaistruct.ConsistencyError(u"raw(backup_geometry)", 4096, len(self._raw_backup_geometry))
                parent.write_bytes(self._raw_backup_geometry)
            _io__raw_backup_geometry.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.backup_geometry._write__seq(_io__raw_backup_geometry)
            self._raw_primary_metadata = []
            for i in range(len(self.primary_metadata)):
                pass
                _io__raw_primary_metadata = KaitaiStream(BytesIO(bytearray(self.primary_geometry.metadata_max_size)))
                self._io.add_child_stream(_io__raw_primary_metadata)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.primary_geometry.metadata_max_size))
                def handler(parent, _io__raw_primary_metadata=_io__raw_primary_metadata, i=i):
                    self._raw_primary_metadata.append(_io__raw_primary_metadata.to_byte_array())
                    if len(self._raw_primary_metadata[i]) != self.primary_geometry.metadata_max_size:
                        raise kaitaistruct.ConsistencyError(u"raw(primary_metadata)", self.primary_geometry.metadata_max_size, len(self._raw_primary_metadata[i]))
                    parent.write_bytes(self._raw_primary_metadata[i])
                _io__raw_primary_metadata.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.primary_metadata[i]._write__seq(_io__raw_primary_metadata)

            self._raw_backup_metadata = []
            for i in range(len(self.backup_metadata)):
                pass
                _io__raw_backup_metadata = KaitaiStream(BytesIO(bytearray(self.primary_geometry.metadata_max_size)))
                self._io.add_child_stream(_io__raw_backup_metadata)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.primary_geometry.metadata_max_size))
                def handler(parent, _io__raw_backup_metadata=_io__raw_backup_metadata, i=i):
                    self._raw_backup_metadata.append(_io__raw_backup_metadata.to_byte_array())
                    if len(self._raw_backup_metadata[i]) != self.primary_geometry.metadata_max_size:
                        raise kaitaistruct.ConsistencyError(u"raw(backup_metadata)", self.primary_geometry.metadata_max_size, len(self._raw_backup_metadata[i]))
                    parent.write_bytes(self._raw_backup_metadata[i])
                _io__raw_backup_metadata.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.backup_metadata[i]._write__seq(_io__raw_backup_metadata)



        def _check(self):
            if self.primary_geometry._root != self._root:
                raise kaitaistruct.ConsistencyError(u"primary_geometry", self._root, self.primary_geometry._root)
            if self.primary_geometry._parent != self:
                raise kaitaistruct.ConsistencyError(u"primary_geometry", self, self.primary_geometry._parent)
            if self.backup_geometry._root != self._root:
                raise kaitaistruct.ConsistencyError(u"backup_geometry", self._root, self.backup_geometry._root)
            if self.backup_geometry._parent != self:
                raise kaitaistruct.ConsistencyError(u"backup_geometry", self, self.backup_geometry._parent)
            if len(self.primary_metadata) != self.primary_geometry.metadata_slot_count:
                raise kaitaistruct.ConsistencyError(u"primary_metadata", self.primary_geometry.metadata_slot_count, len(self.primary_metadata))
            for i in range(len(self.primary_metadata)):
                pass
                if self.primary_metadata[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"primary_metadata", self._root, self.primary_metadata[i]._root)
                if self.primary_metadata[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"primary_metadata", self, self.primary_metadata[i]._parent)

            if len(self.backup_metadata) != self.primary_geometry.metadata_slot_count:
                raise kaitaistruct.ConsistencyError(u"backup_metadata", self.primary_geometry.metadata_slot_count, len(self.backup_metadata))
            for i in range(len(self.backup_metadata)):
                pass
                if self.backup_metadata[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"backup_metadata", self._root, self.backup_metadata[i]._root)
                if self.backup_metadata[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"backup_metadata", self, self.backup_metadata[i]._parent)

            self._dirty = False


    @property
    def root(self):
        if self._should_write_root:
            self._write_root()
        if hasattr(self, '_m_root'):
            return self._m_root

        if not self.root__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(4096)
        self._m_root = AndroidSuper.Root(self._io, self, self._root)
        self._m_root._read()
        self._io.seek(_pos)
        return getattr(self, '_m_root', None)

    @root.setter
    def root(self, v):
        self._dirty = True
        self._m_root = v

    def _write_root(self):
        self._should_write_root = False
        _pos = self._io.pos()
        self._io.seek(4096)
        self._m_root._write__seq(self._io)
        self._io.seek(_pos)


