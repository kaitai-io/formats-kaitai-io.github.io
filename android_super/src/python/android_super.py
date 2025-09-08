# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class AndroidSuper(KaitaiStruct):
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
    def __init__(self, _io, _parent=None, _root=None):
        super(AndroidSuper, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        pass


    def _fetch_instances(self):
        pass
        _ = self.root
        if hasattr(self, '_m_root'):
            pass
            self._m_root._fetch_instances()


    class Geometry(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(AndroidSuper.Geometry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x67\x44\x6C\x61":
                raise kaitaistruct.ValidationNotEqualError(b"\x67\x44\x6C\x61", self.magic, self._io, u"/types/geometry/seq/0")
            self.struct_size = self._io.read_u4le()
            self.checksum = self._io.read_bytes(32)
            self.metadata_max_size = self._io.read_u4le()
            self.metadata_slot_count = self._io.read_u4le()
            self.logical_block_size = self._io.read_u4le()


        def _fetch_instances(self):
            pass


    class Metadata(KaitaiStruct):

        class TableKind(IntEnum):
            partitions = 0
            extents = 1
            groups = 2
            block_devices = 3
        def __init__(self, _io, _parent=None, _root=None):
            super(AndroidSuper.Metadata, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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
            self.extents = AndroidSuper.Metadata.TableDescriptor(AndroidSuper.Metadata.TableKind.extents, self._io, self, self._root)
            self.groups = AndroidSuper.Metadata.TableDescriptor(AndroidSuper.Metadata.TableKind.groups, self._io, self, self._root)
            self.block_devices = AndroidSuper.Metadata.TableDescriptor(AndroidSuper.Metadata.TableKind.block_devices, self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.partitions._fetch_instances()
            self.extents._fetch_instances()
            self.groups._fetch_instances()
            self.block_devices._fetch_instances()

        class BlockDevice(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(AndroidSuper.Metadata.BlockDevice, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.first_logical_sector = self._io.read_u8le()
                self.alignment = self._io.read_u4le()
                self.alignment_offset = self._io.read_u4le()
                self.size = self._io.read_u8le()
                self.partition_name = (KaitaiStream.bytes_terminate(self._io.read_bytes(36), 0, False)).decode(u"UTF-8")
                self.flag_slot_suffixed = self._io.read_bits_int_le(1) != 0
                self.flags_reserved = self._io.read_bits_int_le(31)


            def _fetch_instances(self):
                pass


        class Extent(KaitaiStruct):

            class TargetType(IntEnum):
                linear = 0
                zero = 1
            def __init__(self, _io, _parent=None, _root=None):
                super(AndroidSuper.Metadata.Extent, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.num_sectors = self._io.read_u8le()
                self.target_type = KaitaiStream.resolve_enum(AndroidSuper.Metadata.Extent.TargetType, self._io.read_u4le())
                self.target_data = self._io.read_u8le()
                self.target_source = self._io.read_u4le()


            def _fetch_instances(self):
                pass


        class Group(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(AndroidSuper.Metadata.Group, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(36), 0, False)).decode(u"UTF-8")
                self.flag_slot_suffixed = self._io.read_bits_int_le(1) != 0
                self.flags_reserved = self._io.read_bits_int_le(31)
                self.maximum_size = self._io.read_u8le()


            def _fetch_instances(self):
                pass


        class Partition(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(AndroidSuper.Metadata.Partition, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

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


            def _fetch_instances(self):
                pass


        class TableDescriptor(KaitaiStruct):
            def __init__(self, kind, _io, _parent=None, _root=None):
                super(AndroidSuper.Metadata.TableDescriptor, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self.kind = kind
                self._read()

            def _read(self):
                self.offset = self._io.read_u4le()
                self.num_entries = self._io.read_u4le()
                self.entry_size = self._io.read_u4le()


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



            @property
            def table(self):
                if hasattr(self, '_m_table'):
                    return self._m_table

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
                        self._m_table.append(AndroidSuper.Metadata.BlockDevice(_io__raw__m_table, self, self._root))
                    elif _on == AndroidSuper.Metadata.TableKind.extents:
                        pass
                        self._raw__m_table.append(self._io.read_bytes(self.entry_size))
                        _io__raw__m_table = KaitaiStream(BytesIO(self._raw__m_table[i]))
                        self._m_table.append(AndroidSuper.Metadata.Extent(_io__raw__m_table, self, self._root))
                    elif _on == AndroidSuper.Metadata.TableKind.groups:
                        pass
                        self._raw__m_table.append(self._io.read_bytes(self.entry_size))
                        _io__raw__m_table = KaitaiStream(BytesIO(self._raw__m_table[i]))
                        self._m_table.append(AndroidSuper.Metadata.Group(_io__raw__m_table, self, self._root))
                    elif _on == AndroidSuper.Metadata.TableKind.partitions:
                        pass
                        self._raw__m_table.append(self._io.read_bytes(self.entry_size))
                        _io__raw__m_table = KaitaiStream(BytesIO(self._raw__m_table[i]))
                        self._m_table.append(AndroidSuper.Metadata.Partition(_io__raw__m_table, self, self._root))
                    else:
                        pass
                        self._m_table.append(self._io.read_bytes(self.entry_size))

                self._io.seek(_pos)
                return getattr(self, '_m_table', None)



    class Root(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(AndroidSuper.Root, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self._raw_primary_geometry = self._io.read_bytes(4096)
            _io__raw_primary_geometry = KaitaiStream(BytesIO(self._raw_primary_geometry))
            self.primary_geometry = AndroidSuper.Geometry(_io__raw_primary_geometry, self, self._root)
            self._raw_backup_geometry = self._io.read_bytes(4096)
            _io__raw_backup_geometry = KaitaiStream(BytesIO(self._raw_backup_geometry))
            self.backup_geometry = AndroidSuper.Geometry(_io__raw_backup_geometry, self, self._root)
            self._raw_primary_metadata = []
            self.primary_metadata = []
            for i in range(self.primary_geometry.metadata_slot_count):
                self._raw_primary_metadata.append(self._io.read_bytes(self.primary_geometry.metadata_max_size))
                _io__raw_primary_metadata = KaitaiStream(BytesIO(self._raw_primary_metadata[i]))
                self.primary_metadata.append(AndroidSuper.Metadata(_io__raw_primary_metadata, self, self._root))

            self._raw_backup_metadata = []
            self.backup_metadata = []
            for i in range(self.primary_geometry.metadata_slot_count):
                self._raw_backup_metadata.append(self._io.read_bytes(self.primary_geometry.metadata_max_size))
                _io__raw_backup_metadata = KaitaiStream(BytesIO(self._raw_backup_metadata[i]))
                self.backup_metadata.append(AndroidSuper.Metadata(_io__raw_backup_metadata, self, self._root))



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



    @property
    def root(self):
        if hasattr(self, '_m_root'):
            return self._m_root

        _pos = self._io.pos()
        self._io.seek(4096)
        self._m_root = AndroidSuper.Root(self._io, self, self._root)
        self._io.seek(_pos)
        return getattr(self, '_m_root', None)


