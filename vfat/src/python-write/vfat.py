# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import dos_datetime


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Vfat(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://download.microsoft.com/download/0/8/4/084c452b-b772-4fe5-89bb-a0cbf082286a/fatgen103.doc
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Vfat, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_fats = False
        self.fats__enabled = True
        self._should_write_root_dir = False
        self.root_dir__enabled = True

    def _read(self):
        self.boot_sector = Vfat.BootSector(self._io, self, self._root)
        self.boot_sector._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.boot_sector._fetch_instances()
        _ = self.fats
        if hasattr(self, '_m_fats'):
            pass
            for i in range(len(self._m_fats)):
                pass


        _ = self.root_dir
        if hasattr(self, '_m_root_dir'):
            pass
            self._m_root_dir._fetch_instances()



    def _write__seq(self, io=None):
        super(Vfat, self)._write__seq(io)
        self._should_write_fats = self.fats__enabled
        self._should_write_root_dir = self.root_dir__enabled
        self.boot_sector._write__seq(self._io)


    def _check(self):
        if self.boot_sector._root != self._root:
            raise kaitaistruct.ConsistencyError(u"boot_sector", self._root, self.boot_sector._root)
        if self.boot_sector._parent != self:
            raise kaitaistruct.ConsistencyError(u"boot_sector", self, self.boot_sector._parent)
        if self.fats__enabled:
            pass
            if len(self._m_fats) != self.boot_sector.bpb.num_fats:
                raise kaitaistruct.ConsistencyError(u"fats", self.boot_sector.bpb.num_fats, len(self._m_fats))
            for i in range(len(self._m_fats)):
                pass
                if len(self._m_fats[i]) != self.boot_sector.size_fat:
                    raise kaitaistruct.ConsistencyError(u"fats", self.boot_sector.size_fat, len(self._m_fats[i]))


        if self.root_dir__enabled:
            pass
            if self._m_root_dir._root != self._root:
                raise kaitaistruct.ConsistencyError(u"root_dir", self._root, self._m_root_dir._root)
            if self._m_root_dir._parent != self:
                raise kaitaistruct.ConsistencyError(u"root_dir", self, self._m_root_dir._parent)

        self._dirty = False

    class BiosParamBlock(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Vfat.BiosParamBlock, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.bytes_per_ls = self._io.read_u2le()
            self.ls_per_clus = self._io.read_u1()
            self.num_reserved_ls = self._io.read_u2le()
            self.num_fats = self._io.read_u1()
            self.max_root_dir_rec = self._io.read_u2le()
            self.total_ls_2 = self._io.read_u2le()
            self.media_code = self._io.read_u1()
            self.ls_per_fat = self._io.read_u2le()
            self.ps_per_track = self._io.read_u2le()
            self.num_heads = self._io.read_u2le()
            self.num_hidden_sectors = self._io.read_u4le()
            self.total_ls_4 = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Vfat.BiosParamBlock, self)._write__seq(io)
            self._io.write_u2le(self.bytes_per_ls)
            self._io.write_u1(self.ls_per_clus)
            self._io.write_u2le(self.num_reserved_ls)
            self._io.write_u1(self.num_fats)
            self._io.write_u2le(self.max_root_dir_rec)
            self._io.write_u2le(self.total_ls_2)
            self._io.write_u1(self.media_code)
            self._io.write_u2le(self.ls_per_fat)
            self._io.write_u2le(self.ps_per_track)
            self._io.write_u2le(self.num_heads)
            self._io.write_u4le(self.num_hidden_sectors)
            self._io.write_u4le(self.total_ls_4)


        def _check(self):
            self._dirty = False


    class BootSector(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Vfat.BootSector, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.jmp_instruction = self._io.read_bytes(3)
            self.oem_name = (KaitaiStream.bytes_strip_right(self._io.read_bytes(8), 32)).decode(u"ASCII")
            self.bpb = Vfat.BiosParamBlock(self._io, self, self._root)
            self.bpb._read()
            if (not (self.is_fat32)):
                pass
                self.ebpb_fat16 = Vfat.ExtBiosParamBlockFat16(self._io, self, self._root)
                self.ebpb_fat16._read()

            if self.is_fat32:
                pass
                self.ebpb_fat32 = Vfat.ExtBiosParamBlockFat32(self._io, self, self._root)
                self.ebpb_fat32._read()

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.bpb._fetch_instances()
            if (not (self.is_fat32)):
                pass
                self.ebpb_fat16._fetch_instances()

            if self.is_fat32:
                pass
                self.ebpb_fat32._fetch_instances()



        def _write__seq(self, io=None):
            super(Vfat.BootSector, self)._write__seq(io)
            self._io.write_bytes(self.jmp_instruction)
            self._io.write_bytes_limit((self.oem_name).encode(u"ASCII"), 8, 32, 32)
            self.bpb._write__seq(self._io)
            if (not (self.is_fat32)):
                pass
                self.ebpb_fat16._write__seq(self._io)

            if self.is_fat32:
                pass
                self.ebpb_fat32._write__seq(self._io)



        def _check(self):
            if len(self.jmp_instruction) != 3:
                raise kaitaistruct.ConsistencyError(u"jmp_instruction", 3, len(self.jmp_instruction))
            if len((self.oem_name).encode(u"ASCII")) > 8:
                raise kaitaistruct.ConsistencyError(u"oem_name", 8, len((self.oem_name).encode(u"ASCII")))
            if  ((len((self.oem_name).encode(u"ASCII")) != 0) and (KaitaiStream.byte_array_index((self.oem_name).encode(u"ASCII"), -1) == 32)) :
                raise kaitaistruct.ConsistencyError(u"oem_name", 32, KaitaiStream.byte_array_index((self.oem_name).encode(u"ASCII"), -1))
            if self.bpb._root != self._root:
                raise kaitaistruct.ConsistencyError(u"bpb", self._root, self.bpb._root)
            if self.bpb._parent != self:
                raise kaitaistruct.ConsistencyError(u"bpb", self, self.bpb._parent)
            if (not (self.is_fat32)):
                pass
                if self.ebpb_fat16._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"ebpb_fat16", self._root, self.ebpb_fat16._root)
                if self.ebpb_fat16._parent != self:
                    raise kaitaistruct.ConsistencyError(u"ebpb_fat16", self, self.ebpb_fat16._parent)

            if self.is_fat32:
                pass
                if self.ebpb_fat32._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"ebpb_fat32", self._root, self.ebpb_fat32._root)
                if self.ebpb_fat32._parent != self:
                    raise kaitaistruct.ConsistencyError(u"ebpb_fat32", self, self.ebpb_fat32._parent)

            self._dirty = False

        @property
        def is_fat32(self):
            """Determines if filesystem is FAT32 (true) or FAT12/16 (false)
            by analyzing some preliminary conditions in BPB. Used to
            determine whether we should parse post-BPB data as
            `ext_bios_param_block_fat16` or `ext_bios_param_block_fat32`.
            """
            if hasattr(self, '_m_is_fat32'):
                return self._m_is_fat32

            self._m_is_fat32 = self.bpb.max_root_dir_rec == 0
            return getattr(self, '_m_is_fat32', None)

        def _invalidate_is_fat32(self):
            del self._m_is_fat32
        @property
        def ls_per_fat(self):
            if hasattr(self, '_m_ls_per_fat'):
                return self._m_ls_per_fat

            self._m_ls_per_fat = (self.ebpb_fat32.ls_per_fat if self.is_fat32 else self.bpb.ls_per_fat)
            return getattr(self, '_m_ls_per_fat', None)

        def _invalidate_ls_per_fat(self):
            del self._m_ls_per_fat
        @property
        def ls_per_root_dir(self):
            """Size of root directory in logical sectors.
            
            .. seealso::
               FAT: General Overview of On-Disk Format, section "FAT Data Structure"
            """
            if hasattr(self, '_m_ls_per_root_dir'):
                return self._m_ls_per_root_dir

            self._m_ls_per_root_dir = ((self.bpb.max_root_dir_rec * 32 + self.bpb.bytes_per_ls) - 1) // self.bpb.bytes_per_ls
            return getattr(self, '_m_ls_per_root_dir', None)

        def _invalidate_ls_per_root_dir(self):
            del self._m_ls_per_root_dir
        @property
        def pos_fats(self):
            """Offset of FATs in bytes from start of filesystem."""
            if hasattr(self, '_m_pos_fats'):
                return self._m_pos_fats

            self._m_pos_fats = self.bpb.bytes_per_ls * self.bpb.num_reserved_ls
            return getattr(self, '_m_pos_fats', None)

        def _invalidate_pos_fats(self):
            del self._m_pos_fats
        @property
        def pos_root_dir(self):
            """Offset of root directory in bytes from start of filesystem."""
            if hasattr(self, '_m_pos_root_dir'):
                return self._m_pos_root_dir

            self._m_pos_root_dir = self.bpb.bytes_per_ls * (self.bpb.num_reserved_ls + self.ls_per_fat * self.bpb.num_fats)
            return getattr(self, '_m_pos_root_dir', None)

        def _invalidate_pos_root_dir(self):
            del self._m_pos_root_dir
        @property
        def size_fat(self):
            """Size of one FAT in bytes."""
            if hasattr(self, '_m_size_fat'):
                return self._m_size_fat

            self._m_size_fat = self.bpb.bytes_per_ls * self.ls_per_fat
            return getattr(self, '_m_size_fat', None)

        def _invalidate_size_fat(self):
            del self._m_size_fat
        @property
        def size_root_dir(self):
            """Size of root directory in bytes."""
            if hasattr(self, '_m_size_root_dir'):
                return self._m_size_root_dir

            self._m_size_root_dir = self.ls_per_root_dir * self.bpb.bytes_per_ls
            return getattr(self, '_m_size_root_dir', None)

        def _invalidate_size_root_dir(self):
            del self._m_size_root_dir

    class ExtBiosParamBlockFat16(ReadWriteKaitaiStruct):
        """Extended BIOS Parameter Block (DOS 4.0+, OS/2 1.0+). Used only
        for FAT12 and FAT16.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Vfat.ExtBiosParamBlockFat16, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.phys_drive_num = self._io.read_u1()
            self.reserved1 = self._io.read_u1()
            self.ext_boot_sign = self._io.read_u1()
            self.volume_id = self._io.read_bytes(4)
            self.partition_volume_label = (KaitaiStream.bytes_strip_right(self._io.read_bytes(11), 32)).decode(u"ASCII")
            self.fs_type_str = (KaitaiStream.bytes_strip_right(self._io.read_bytes(8), 32)).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Vfat.ExtBiosParamBlockFat16, self)._write__seq(io)
            self._io.write_u1(self.phys_drive_num)
            self._io.write_u1(self.reserved1)
            self._io.write_u1(self.ext_boot_sign)
            self._io.write_bytes(self.volume_id)
            self._io.write_bytes_limit((self.partition_volume_label).encode(u"ASCII"), 11, 32, 32)
            self._io.write_bytes_limit((self.fs_type_str).encode(u"ASCII"), 8, 32, 32)


        def _check(self):
            if len(self.volume_id) != 4:
                raise kaitaistruct.ConsistencyError(u"volume_id", 4, len(self.volume_id))
            if len((self.partition_volume_label).encode(u"ASCII")) > 11:
                raise kaitaistruct.ConsistencyError(u"partition_volume_label", 11, len((self.partition_volume_label).encode(u"ASCII")))
            if  ((len((self.partition_volume_label).encode(u"ASCII")) != 0) and (KaitaiStream.byte_array_index((self.partition_volume_label).encode(u"ASCII"), -1) == 32)) :
                raise kaitaistruct.ConsistencyError(u"partition_volume_label", 32, KaitaiStream.byte_array_index((self.partition_volume_label).encode(u"ASCII"), -1))
            if len((self.fs_type_str).encode(u"ASCII")) > 8:
                raise kaitaistruct.ConsistencyError(u"fs_type_str", 8, len((self.fs_type_str).encode(u"ASCII")))
            if  ((len((self.fs_type_str).encode(u"ASCII")) != 0) and (KaitaiStream.byte_array_index((self.fs_type_str).encode(u"ASCII"), -1) == 32)) :
                raise kaitaistruct.ConsistencyError(u"fs_type_str", 32, KaitaiStream.byte_array_index((self.fs_type_str).encode(u"ASCII"), -1))
            self._dirty = False


    class ExtBiosParamBlockFat32(ReadWriteKaitaiStruct):
        """Extended BIOS Parameter Block for FAT32."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Vfat.ExtBiosParamBlockFat32, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ls_per_fat = self._io.read_u4le()
            self.has_active_fat = self._io.read_bits_int_le(1) != 0
            self.reserved1 = self._io.read_bits_int_le(3)
            self.active_fat_id = self._io.read_bits_int_le(4)
            self.reserved2 = self._io.read_bytes(1)
            if not self.reserved2 == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.reserved2, self._io, u"/types/ext_bios_param_block_fat32/seq/4")
            self.fat_version = self._io.read_u2le()
            self.root_dir_start_clus = self._io.read_u4le()
            self.ls_fs_info = self._io.read_u2le()
            self.boot_sectors_copy_start_ls = self._io.read_u2le()
            self.reserved3 = self._io.read_bytes(12)
            self.phys_drive_num = self._io.read_u1()
            self.reserved4 = self._io.read_u1()
            self.ext_boot_sign = self._io.read_u1()
            self.volume_id = self._io.read_bytes(4)
            self.partition_volume_label = (KaitaiStream.bytes_strip_right(self._io.read_bytes(11), 32)).decode(u"ASCII")
            self.fs_type_str = (KaitaiStream.bytes_strip_right(self._io.read_bytes(8), 32)).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Vfat.ExtBiosParamBlockFat32, self)._write__seq(io)
            self._io.write_u4le(self.ls_per_fat)
            self._io.write_bits_int_le(1, int(self.has_active_fat))
            self._io.write_bits_int_le(3, self.reserved1)
            self._io.write_bits_int_le(4, self.active_fat_id)
            self._io.write_bytes(self.reserved2)
            self._io.write_u2le(self.fat_version)
            self._io.write_u4le(self.root_dir_start_clus)
            self._io.write_u2le(self.ls_fs_info)
            self._io.write_u2le(self.boot_sectors_copy_start_ls)
            self._io.write_bytes(self.reserved3)
            self._io.write_u1(self.phys_drive_num)
            self._io.write_u1(self.reserved4)
            self._io.write_u1(self.ext_boot_sign)
            self._io.write_bytes(self.volume_id)
            self._io.write_bytes_limit((self.partition_volume_label).encode(u"ASCII"), 11, 32, 32)
            self._io.write_bytes_limit((self.fs_type_str).encode(u"ASCII"), 8, 32, 32)


        def _check(self):
            if len(self.reserved2) != 1:
                raise kaitaistruct.ConsistencyError(u"reserved2", 1, len(self.reserved2))
            if not self.reserved2 == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.reserved2, None, u"/types/ext_bios_param_block_fat32/seq/4")
            if len(self.reserved3) != 12:
                raise kaitaistruct.ConsistencyError(u"reserved3", 12, len(self.reserved3))
            if len(self.volume_id) != 4:
                raise kaitaistruct.ConsistencyError(u"volume_id", 4, len(self.volume_id))
            if len((self.partition_volume_label).encode(u"ASCII")) > 11:
                raise kaitaistruct.ConsistencyError(u"partition_volume_label", 11, len((self.partition_volume_label).encode(u"ASCII")))
            if  ((len((self.partition_volume_label).encode(u"ASCII")) != 0) and (KaitaiStream.byte_array_index((self.partition_volume_label).encode(u"ASCII"), -1) == 32)) :
                raise kaitaistruct.ConsistencyError(u"partition_volume_label", 32, KaitaiStream.byte_array_index((self.partition_volume_label).encode(u"ASCII"), -1))
            if len((self.fs_type_str).encode(u"ASCII")) > 8:
                raise kaitaistruct.ConsistencyError(u"fs_type_str", 8, len((self.fs_type_str).encode(u"ASCII")))
            if  ((len((self.fs_type_str).encode(u"ASCII")) != 0) and (KaitaiStream.byte_array_index((self.fs_type_str).encode(u"ASCII"), -1) == 32)) :
                raise kaitaistruct.ConsistencyError(u"fs_type_str", 32, KaitaiStream.byte_array_index((self.fs_type_str).encode(u"ASCII"), -1))
            self._dirty = False


    class RootDirectory(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Vfat.RootDirectory, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.records = []
            for i in range(self._root.boot_sector.bpb.max_root_dir_rec):
                _t_records = Vfat.RootDirectoryRec(self._io, self, self._root)
                try:
                    _t_records._read()
                finally:
                    self.records.append(_t_records)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.records)):
                pass
                self.records[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Vfat.RootDirectory, self)._write__seq(io)
            for i in range(len(self.records)):
                pass
                self.records[i]._write__seq(self._io)



        def _check(self):
            if len(self.records) != self._root.boot_sector.bpb.max_root_dir_rec:
                raise kaitaistruct.ConsistencyError(u"records", self._root.boot_sector.bpb.max_root_dir_rec, len(self.records))
            for i in range(len(self.records)):
                pass
                if self.records[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"records", self._root, self.records[i]._root)
                if self.records[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"records", self, self.records[i]._parent)

            self._dirty = False


    class RootDirectoryRec(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Vfat.RootDirectoryRec, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.file_name = self._io.read_bytes(11)
            self._raw_attrs = self._io.read_bytes(1)
            _io__raw_attrs = KaitaiStream(BytesIO(self._raw_attrs))
            self.attrs = Vfat.RootDirectoryRec.AttrFlags(_io__raw_attrs, self, self._root)
            self.attrs._read()
            self.reserved = self._io.read_bytes(10)
            self._raw_last_write_time = self._io.read_bytes(4)
            _io__raw_last_write_time = KaitaiStream(BytesIO(self._raw_last_write_time))
            self.last_write_time = dos_datetime.DosDatetime(_io__raw_last_write_time)
            self.last_write_time._read()
            self.start_clus = self._io.read_u2le()
            self.file_size = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.attrs._fetch_instances()
            self.last_write_time._fetch_instances()


        def _write__seq(self, io=None):
            super(Vfat.RootDirectoryRec, self)._write__seq(io)
            self._io.write_bytes(self.file_name)
            _io__raw_attrs = KaitaiStream(BytesIO(bytearray(1)))
            self._io.add_child_stream(_io__raw_attrs)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (1))
            def handler(parent, _io__raw_attrs=_io__raw_attrs):
                self._raw_attrs = _io__raw_attrs.to_byte_array()
                if len(self._raw_attrs) != 1:
                    raise kaitaistruct.ConsistencyError(u"raw(attrs)", 1, len(self._raw_attrs))
                parent.write_bytes(self._raw_attrs)
            _io__raw_attrs.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.attrs._write__seq(_io__raw_attrs)
            self._io.write_bytes(self.reserved)
            _io__raw_last_write_time = KaitaiStream(BytesIO(bytearray(4)))
            self._io.add_child_stream(_io__raw_last_write_time)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (4))
            def handler(parent, _io__raw_last_write_time=_io__raw_last_write_time):
                self._raw_last_write_time = _io__raw_last_write_time.to_byte_array()
                if len(self._raw_last_write_time) != 4:
                    raise kaitaistruct.ConsistencyError(u"raw(last_write_time)", 4, len(self._raw_last_write_time))
                parent.write_bytes(self._raw_last_write_time)
            _io__raw_last_write_time.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.last_write_time._write__seq(_io__raw_last_write_time)
            self._io.write_u2le(self.start_clus)
            self._io.write_u4le(self.file_size)


        def _check(self):
            if len(self.file_name) != 11:
                raise kaitaistruct.ConsistencyError(u"file_name", 11, len(self.file_name))
            if self.attrs._root != self._root:
                raise kaitaistruct.ConsistencyError(u"attrs", self._root, self.attrs._root)
            if self.attrs._parent != self:
                raise kaitaistruct.ConsistencyError(u"attrs", self, self.attrs._parent)
            if len(self.reserved) != 10:
                raise kaitaistruct.ConsistencyError(u"reserved", 10, len(self.reserved))
            self._dirty = False

        class AttrFlags(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Vfat.RootDirectoryRec.AttrFlags, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.read_only = self._io.read_bits_int_le(1) != 0
                self.hidden = self._io.read_bits_int_le(1) != 0
                self.system = self._io.read_bits_int_le(1) != 0
                self.volume_id = self._io.read_bits_int_le(1) != 0
                self.is_directory = self._io.read_bits_int_le(1) != 0
                self.archive = self._io.read_bits_int_le(1) != 0
                self.reserved = self._io.read_bits_int_le(2)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Vfat.RootDirectoryRec.AttrFlags, self)._write__seq(io)
                self._io.write_bits_int_le(1, int(self.read_only))
                self._io.write_bits_int_le(1, int(self.hidden))
                self._io.write_bits_int_le(1, int(self.system))
                self._io.write_bits_int_le(1, int(self.volume_id))
                self._io.write_bits_int_le(1, int(self.is_directory))
                self._io.write_bits_int_le(1, int(self.archive))
                self._io.write_bits_int_le(2, self.reserved)


            def _check(self):
                self._dirty = False

            @property
            def long_name(self):
                if hasattr(self, '_m_long_name'):
                    return self._m_long_name

                self._m_long_name =  ((self.read_only) and (self.hidden) and (self.system) and (self.volume_id)) 
                return getattr(self, '_m_long_name', None)

            def _invalidate_long_name(self):
                del self._m_long_name


    @property
    def fats(self):
        if self._should_write_fats:
            self._write_fats()
        if hasattr(self, '_m_fats'):
            return self._m_fats

        if not self.fats__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.boot_sector.pos_fats)
        self._m_fats = []
        for i in range(self.boot_sector.bpb.num_fats):
            self._m_fats.append(self._io.read_bytes(self.boot_sector.size_fat))

        self._io.seek(_pos)
        return getattr(self, '_m_fats', None)

    @fats.setter
    def fats(self, v):
        self._dirty = True
        self._m_fats = v

    def _write_fats(self):
        self._should_write_fats = False
        _pos = self._io.pos()
        self._io.seek(self.boot_sector.pos_fats)
        for i in range(len(self._m_fats)):
            pass
            self._io.write_bytes(self._m_fats[i])

        self._io.seek(_pos)

    @property
    def root_dir(self):
        if self._should_write_root_dir:
            self._write_root_dir()
        if hasattr(self, '_m_root_dir'):
            return self._m_root_dir

        if not self.root_dir__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.boot_sector.pos_root_dir)
        self._raw__m_root_dir = self._io.read_bytes(self.boot_sector.size_root_dir)
        _io__raw__m_root_dir = KaitaiStream(BytesIO(self._raw__m_root_dir))
        self._m_root_dir = Vfat.RootDirectory(_io__raw__m_root_dir, self, self._root)
        self._m_root_dir._read()
        self._io.seek(_pos)
        return getattr(self, '_m_root_dir', None)

    @root_dir.setter
    def root_dir(self, v):
        self._dirty = True
        self._m_root_dir = v

    def _write_root_dir(self):
        self._should_write_root_dir = False
        _pos = self._io.pos()
        self._io.seek(self.boot_sector.pos_root_dir)
        _io__raw__m_root_dir = KaitaiStream(BytesIO(bytearray(self.boot_sector.size_root_dir)))
        self._io.add_child_stream(_io__raw__m_root_dir)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.boot_sector.size_root_dir))
        def handler(parent, _io__raw__m_root_dir=_io__raw__m_root_dir):
            self._raw__m_root_dir = _io__raw__m_root_dir.to_byte_array()
            if len(self._raw__m_root_dir) != self.boot_sector.size_root_dir:
                raise kaitaistruct.ConsistencyError(u"raw(root_dir)", self.boot_sector.size_root_dir, len(self._raw__m_root_dir))
            parent.write_bytes(self._raw__m_root_dir)
        _io__raw__m_root_dir.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self._m_root_dir._write__seq(_io__raw__m_root_dir)
        self._io.seek(_pos)


