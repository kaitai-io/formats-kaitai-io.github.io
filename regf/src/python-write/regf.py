# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Regf(ReadWriteKaitaiStruct):
    """This spec allows to parse files used by Microsoft Windows family of
    operating systems to store parts of its "registry". "Registry" is a
    hierarchical database that is used to store system settings (global
    configuration, per-user, per-application configuration, etc).
    
    Typically, registry files are stored in:
    
    * System-wide: several files in `%SystemRoot%\System32\Config\`
    * User-wide:
      * `%USERPROFILE%\Ntuser.dat`
      * `%USERPROFILE%\Local Settings\Application Data\Microsoft\Windows\Usrclass.dat` (localized, Windows 2000, Server 2003 and Windows XP)
      * `%USERPROFILE%\AppData\Local\Microsoft\Windows\Usrclass.dat` (non-localized, Windows Vista and later)
    
    Note that one typically can't access files directly on a mounted
    filesystem with a running Windows OS.
    
    .. seealso::
       Source - https://github.com/libyal/libregf/blob/main/documentation/Windows%20NT%20Registry%20File%20(REGF)%20format.asciidoc
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Regf, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header = Regf.FileHeader(self._io, self, self._root)
        self.header._read()
        self._raw_hive_bins = []
        self.hive_bins = []
        i = 0
        while not self._io.is_eof():
            self._raw_hive_bins.append(self._io.read_bytes(4096))
            _io__raw_hive_bins = KaitaiStream(BytesIO(self._raw_hive_bins[-1]))
            _t_hive_bins = Regf.HiveBin(_io__raw_hive_bins, self, self._root)
            try:
                _t_hive_bins._read()
            finally:
                self.hive_bins.append(_t_hive_bins)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        for i in range(len(self.hive_bins)):
            pass
            self.hive_bins[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Regf, self)._write__seq(io)
        self.header._write__seq(self._io)
        self._raw_hive_bins = []
        for i in range(len(self.hive_bins)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"hive_bins", 0, self._io.size() - self._io.pos())
            _io__raw_hive_bins = KaitaiStream(BytesIO(bytearray(4096)))
            self._io.add_child_stream(_io__raw_hive_bins)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (4096))
            def handler(parent, _io__raw_hive_bins=_io__raw_hive_bins, i=i):
                self._raw_hive_bins.append(_io__raw_hive_bins.to_byte_array())
                if len(self._raw_hive_bins[i]) != 4096:
                    raise kaitaistruct.ConsistencyError(u"raw(hive_bins)", 4096, len(self._raw_hive_bins[i]))
                parent.write_bytes(self._raw_hive_bins[i])
            _io__raw_hive_bins.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.hive_bins[i]._write__seq(_io__raw_hive_bins)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"hive_bins", 0, self._io.size() - self._io.pos())


    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        for i in range(len(self.hive_bins)):
            pass
            if self.hive_bins[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"hive_bins", self._root, self.hive_bins[i]._root)
            if self.hive_bins[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"hive_bins", self, self.hive_bins[i]._parent)

        self._dirty = False

    class FileHeader(ReadWriteKaitaiStruct):

        class FileFormat(IntEnum):
            direct_memory_load = 1

        class FileType(IntEnum):
            normal = 0
            transaction_log = 1
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Regf.FileHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.signature = self._io.read_bytes(4)
            if not self.signature == b"\x72\x65\x67\x66":
                raise kaitaistruct.ValidationNotEqualError(b"\x72\x65\x67\x66", self.signature, self._io, u"/types/file_header/seq/0")
            self.primary_sequence_number = self._io.read_u4le()
            self.secondary_sequence_number = self._io.read_u4le()
            self.last_modification_date_and_time = Regf.Filetime(self._io, self, self._root)
            self.last_modification_date_and_time._read()
            self.major_version = self._io.read_u4le()
            self.minor_version = self._io.read_u4le()
            self.type = KaitaiStream.resolve_enum(Regf.FileHeader.FileType, self._io.read_u4le())
            self.format = KaitaiStream.resolve_enum(Regf.FileHeader.FileFormat, self._io.read_u4le())
            self.root_key_offset = self._io.read_u4le()
            self.hive_bins_data_size = self._io.read_u4le()
            self.clustering_factor = self._io.read_u4le()
            self.unknown1 = self._io.read_bytes(64)
            self.unknown2 = self._io.read_bytes(396)
            self.checksum = self._io.read_u4le()
            self.reserved = self._io.read_bytes(3576)
            self.boot_type = self._io.read_u4le()
            self.boot_recover = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.last_modification_date_and_time._fetch_instances()


        def _write__seq(self, io=None):
            super(Regf.FileHeader, self)._write__seq(io)
            self._io.write_bytes(self.signature)
            self._io.write_u4le(self.primary_sequence_number)
            self._io.write_u4le(self.secondary_sequence_number)
            self.last_modification_date_and_time._write__seq(self._io)
            self._io.write_u4le(self.major_version)
            self._io.write_u4le(self.minor_version)
            self._io.write_u4le(int(self.type))
            self._io.write_u4le(int(self.format))
            self._io.write_u4le(self.root_key_offset)
            self._io.write_u4le(self.hive_bins_data_size)
            self._io.write_u4le(self.clustering_factor)
            self._io.write_bytes(self.unknown1)
            self._io.write_bytes(self.unknown2)
            self._io.write_u4le(self.checksum)
            self._io.write_bytes(self.reserved)
            self._io.write_u4le(self.boot_type)
            self._io.write_u4le(self.boot_recover)


        def _check(self):
            if len(self.signature) != 4:
                raise kaitaistruct.ConsistencyError(u"signature", 4, len(self.signature))
            if not self.signature == b"\x72\x65\x67\x66":
                raise kaitaistruct.ValidationNotEqualError(b"\x72\x65\x67\x66", self.signature, None, u"/types/file_header/seq/0")
            if self.last_modification_date_and_time._root != self._root:
                raise kaitaistruct.ConsistencyError(u"last_modification_date_and_time", self._root, self.last_modification_date_and_time._root)
            if self.last_modification_date_and_time._parent != self:
                raise kaitaistruct.ConsistencyError(u"last_modification_date_and_time", self, self.last_modification_date_and_time._parent)
            if len(self.unknown1) != 64:
                raise kaitaistruct.ConsistencyError(u"unknown1", 64, len(self.unknown1))
            if len(self.unknown2) != 396:
                raise kaitaistruct.ConsistencyError(u"unknown2", 396, len(self.unknown2))
            if len(self.reserved) != 3576:
                raise kaitaistruct.ConsistencyError(u"reserved", 3576, len(self.reserved))
            self._dirty = False


    class Filetime(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Regf.Filetime, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.value = self._io.read_u8le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Regf.Filetime, self)._write__seq(io)
            self._io.write_u8le(self.value)


        def _check(self):
            self._dirty = False


    class HiveBin(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Regf.HiveBin, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.header = Regf.HiveBinHeader(self._io, self, self._root)
            self.header._read()
            self.cells = []
            i = 0
            while not self._io.is_eof():
                _t_cells = Regf.HiveBinCell(self._io, self, self._root)
                try:
                    _t_cells._read()
                finally:
                    self.cells.append(_t_cells)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.header._fetch_instances()
            for i in range(len(self.cells)):
                pass
                self.cells[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Regf.HiveBin, self)._write__seq(io)
            self.header._write__seq(self._io)
            for i in range(len(self.cells)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"cells", 0, self._io.size() - self._io.pos())
                self.cells[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"cells", 0, self._io.size() - self._io.pos())


        def _check(self):
            if self.header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
            if self.header._parent != self:
                raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            for i in range(len(self.cells)):
                pass
                if self.cells[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"cells", self._root, self.cells[i]._root)
                if self.cells[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"cells", self, self.cells[i]._parent)

            self._dirty = False


    class HiveBinCell(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Regf.HiveBinCell, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.cell_size_raw = self._io.read_s4le()
            self.identifier = (self._io.read_bytes(2)).decode(u"ASCII")
            _on = self.identifier
            if _on == u"lf":
                pass
                self._raw_data = self._io.read_bytes((self.cell_size - 2) - 4)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Regf.HiveBinCell.SubKeyListLhLf(_io__raw_data, self, self._root)
                self.data._read()
            elif _on == u"lh":
                pass
                self._raw_data = self._io.read_bytes((self.cell_size - 2) - 4)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Regf.HiveBinCell.SubKeyListLhLf(_io__raw_data, self, self._root)
                self.data._read()
            elif _on == u"li":
                pass
                self._raw_data = self._io.read_bytes((self.cell_size - 2) - 4)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Regf.HiveBinCell.SubKeyListLi(_io__raw_data, self, self._root)
                self.data._read()
            elif _on == u"nk":
                pass
                self._raw_data = self._io.read_bytes((self.cell_size - 2) - 4)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Regf.HiveBinCell.NamedKey(_io__raw_data, self, self._root)
                self.data._read()
            elif _on == u"ri":
                pass
                self._raw_data = self._io.read_bytes((self.cell_size - 2) - 4)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Regf.HiveBinCell.SubKeyListRi(_io__raw_data, self, self._root)
                self.data._read()
            elif _on == u"sk":
                pass
                self._raw_data = self._io.read_bytes((self.cell_size - 2) - 4)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Regf.HiveBinCell.SubKeyListSk(_io__raw_data, self, self._root)
                self.data._read()
            elif _on == u"vk":
                pass
                self._raw_data = self._io.read_bytes((self.cell_size - 2) - 4)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Regf.HiveBinCell.SubKeyListVk(_io__raw_data, self, self._root)
                self.data._read()
            else:
                pass
                self.data = self._io.read_bytes((self.cell_size - 2) - 4)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.identifier
            if _on == u"lf":
                pass
                self.data._fetch_instances()
            elif _on == u"lh":
                pass
                self.data._fetch_instances()
            elif _on == u"li":
                pass
                self.data._fetch_instances()
            elif _on == u"nk":
                pass
                self.data._fetch_instances()
            elif _on == u"ri":
                pass
                self.data._fetch_instances()
            elif _on == u"sk":
                pass
                self.data._fetch_instances()
            elif _on == u"vk":
                pass
                self.data._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(Regf.HiveBinCell, self)._write__seq(io)
            self._io.write_s4le(self.cell_size_raw)
            self._io.write_bytes((self.identifier).encode(u"ASCII"))
            _on = self.identifier
            if _on == u"lf":
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray((self.cell_size - 2) - 4)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + ((self.cell_size - 2) - 4))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != (self.cell_size - 2) - 4:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", (self.cell_size - 2) - 4, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)
            elif _on == u"lh":
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray((self.cell_size - 2) - 4)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + ((self.cell_size - 2) - 4))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != (self.cell_size - 2) - 4:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", (self.cell_size - 2) - 4, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)
            elif _on == u"li":
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray((self.cell_size - 2) - 4)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + ((self.cell_size - 2) - 4))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != (self.cell_size - 2) - 4:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", (self.cell_size - 2) - 4, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)
            elif _on == u"nk":
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray((self.cell_size - 2) - 4)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + ((self.cell_size - 2) - 4))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != (self.cell_size - 2) - 4:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", (self.cell_size - 2) - 4, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)
            elif _on == u"ri":
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray((self.cell_size - 2) - 4)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + ((self.cell_size - 2) - 4))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != (self.cell_size - 2) - 4:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", (self.cell_size - 2) - 4, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)
            elif _on == u"sk":
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray((self.cell_size - 2) - 4)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + ((self.cell_size - 2) - 4))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != (self.cell_size - 2) - 4:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", (self.cell_size - 2) - 4, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)
            elif _on == u"vk":
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray((self.cell_size - 2) - 4)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + ((self.cell_size - 2) - 4))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != (self.cell_size - 2) - 4:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", (self.cell_size - 2) - 4, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)
            else:
                pass
                self._io.write_bytes(self.data)


        def _check(self):
            if len((self.identifier).encode(u"ASCII")) != 2:
                raise kaitaistruct.ConsistencyError(u"identifier", 2, len((self.identifier).encode(u"ASCII")))
            _on = self.identifier
            if _on == u"lf":
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            elif _on == u"lh":
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            elif _on == u"li":
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            elif _on == u"nk":
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            elif _on == u"ri":
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            elif _on == u"sk":
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            elif _on == u"vk":
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            else:
                pass
                if len(self.data) != (self.cell_size - 2) - 4:
                    raise kaitaistruct.ConsistencyError(u"data", (self.cell_size - 2) - 4, len(self.data))
            self._dirty = False

        class NamedKey(ReadWriteKaitaiStruct):

            class NkFlags(IntEnum):
                key_is_volatile = 1
                key_hive_exit = 2
                key_hive_entry = 4
                key_no_delete = 8
                key_sym_link = 16
                key_comp_name = 32
                key_prefef_handle = 64
                key_virt_mirrored = 128
                key_virt_target = 256
                key_virtual_store = 512
                unknown1 = 4096
                unknown2 = 16384
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Regf.HiveBinCell.NamedKey, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.flags = KaitaiStream.resolve_enum(Regf.HiveBinCell.NamedKey.NkFlags, self._io.read_u2le())
                self.last_key_written_date_and_time = Regf.Filetime(self._io, self, self._root)
                self.last_key_written_date_and_time._read()
                self.unknown1 = self._io.read_u4le()
                self.parent_key_offset = self._io.read_u4le()
                self.number_of_sub_keys = self._io.read_u4le()
                self.number_of_volatile_sub_keys = self._io.read_u4le()
                self.sub_keys_list_offset = self._io.read_u4le()
                self.number_of_values = self._io.read_u4le()
                self.values_list_offset = self._io.read_u4le()
                self.security_key_offset = self._io.read_u4le()
                self.class_name_offset = self._io.read_u4le()
                self.largest_sub_key_name_size = self._io.read_u4le()
                self.largest_sub_key_class_name_size = self._io.read_u4le()
                self.largest_value_name_size = self._io.read_u4le()
                self.largest_value_data_size = self._io.read_u4le()
                self.unknown2 = self._io.read_u4le()
                self.key_name_size = self._io.read_u2le()
                self.class_name_size = self._io.read_u2le()
                self.unknown_string_size = self._io.read_u4le()
                self.unknown_string = (self._io.read_bytes(self.unknown_string_size)).decode(u"ASCII")
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.last_key_written_date_and_time._fetch_instances()


            def _write__seq(self, io=None):
                super(Regf.HiveBinCell.NamedKey, self)._write__seq(io)
                self._io.write_u2le(int(self.flags))
                self.last_key_written_date_and_time._write__seq(self._io)
                self._io.write_u4le(self.unknown1)
                self._io.write_u4le(self.parent_key_offset)
                self._io.write_u4le(self.number_of_sub_keys)
                self._io.write_u4le(self.number_of_volatile_sub_keys)
                self._io.write_u4le(self.sub_keys_list_offset)
                self._io.write_u4le(self.number_of_values)
                self._io.write_u4le(self.values_list_offset)
                self._io.write_u4le(self.security_key_offset)
                self._io.write_u4le(self.class_name_offset)
                self._io.write_u4le(self.largest_sub_key_name_size)
                self._io.write_u4le(self.largest_sub_key_class_name_size)
                self._io.write_u4le(self.largest_value_name_size)
                self._io.write_u4le(self.largest_value_data_size)
                self._io.write_u4le(self.unknown2)
                self._io.write_u2le(self.key_name_size)
                self._io.write_u2le(self.class_name_size)
                self._io.write_u4le(self.unknown_string_size)
                self._io.write_bytes((self.unknown_string).encode(u"ASCII"))


            def _check(self):
                if self.last_key_written_date_and_time._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"last_key_written_date_and_time", self._root, self.last_key_written_date_and_time._root)
                if self.last_key_written_date_and_time._parent != self:
                    raise kaitaistruct.ConsistencyError(u"last_key_written_date_and_time", self, self.last_key_written_date_and_time._parent)
                if len((self.unknown_string).encode(u"ASCII")) != self.unknown_string_size:
                    raise kaitaistruct.ConsistencyError(u"unknown_string", self.unknown_string_size, len((self.unknown_string).encode(u"ASCII")))
                self._dirty = False


        class SubKeyListLhLf(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Regf.HiveBinCell.SubKeyListLhLf, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.count = self._io.read_u2le()
                self.items = []
                for i in range(self.count):
                    _t_items = Regf.HiveBinCell.SubKeyListLhLf.Item(self._io, self, self._root)
                    try:
                        _t_items._read()
                    finally:
                        self.items.append(_t_items)

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.items)):
                    pass
                    self.items[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(Regf.HiveBinCell.SubKeyListLhLf, self)._write__seq(io)
                self._io.write_u2le(self.count)
                for i in range(len(self.items)):
                    pass
                    self.items[i]._write__seq(self._io)



            def _check(self):
                if len(self.items) != self.count:
                    raise kaitaistruct.ConsistencyError(u"items", self.count, len(self.items))
                for i in range(len(self.items)):
                    pass
                    if self.items[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"items", self._root, self.items[i]._root)
                    if self.items[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"items", self, self.items[i]._parent)

                self._dirty = False

            class Item(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Regf.HiveBinCell.SubKeyListLhLf.Item, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.named_key_offset = self._io.read_u4le()
                    self.hash_value = self._io.read_u4le()
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(Regf.HiveBinCell.SubKeyListLhLf.Item, self)._write__seq(io)
                    self._io.write_u4le(self.named_key_offset)
                    self._io.write_u4le(self.hash_value)


                def _check(self):
                    self._dirty = False



        class SubKeyListLi(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Regf.HiveBinCell.SubKeyListLi, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.count = self._io.read_u2le()
                self.items = []
                for i in range(self.count):
                    _t_items = Regf.HiveBinCell.SubKeyListLi.Item(self._io, self, self._root)
                    try:
                        _t_items._read()
                    finally:
                        self.items.append(_t_items)

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.items)):
                    pass
                    self.items[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(Regf.HiveBinCell.SubKeyListLi, self)._write__seq(io)
                self._io.write_u2le(self.count)
                for i in range(len(self.items)):
                    pass
                    self.items[i]._write__seq(self._io)



            def _check(self):
                if len(self.items) != self.count:
                    raise kaitaistruct.ConsistencyError(u"items", self.count, len(self.items))
                for i in range(len(self.items)):
                    pass
                    if self.items[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"items", self._root, self.items[i]._root)
                    if self.items[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"items", self, self.items[i]._parent)

                self._dirty = False

            class Item(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Regf.HiveBinCell.SubKeyListLi.Item, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.named_key_offset = self._io.read_u4le()
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(Regf.HiveBinCell.SubKeyListLi.Item, self)._write__seq(io)
                    self._io.write_u4le(self.named_key_offset)


                def _check(self):
                    self._dirty = False



        class SubKeyListRi(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Regf.HiveBinCell.SubKeyListRi, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.count = self._io.read_u2le()
                self.items = []
                for i in range(self.count):
                    _t_items = Regf.HiveBinCell.SubKeyListRi.Item(self._io, self, self._root)
                    try:
                        _t_items._read()
                    finally:
                        self.items.append(_t_items)

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.items)):
                    pass
                    self.items[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(Regf.HiveBinCell.SubKeyListRi, self)._write__seq(io)
                self._io.write_u2le(self.count)
                for i in range(len(self.items)):
                    pass
                    self.items[i]._write__seq(self._io)



            def _check(self):
                if len(self.items) != self.count:
                    raise kaitaistruct.ConsistencyError(u"items", self.count, len(self.items))
                for i in range(len(self.items)):
                    pass
                    if self.items[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"items", self._root, self.items[i]._root)
                    if self.items[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"items", self, self.items[i]._parent)

                self._dirty = False

            class Item(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Regf.HiveBinCell.SubKeyListRi.Item, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.sub_key_list_offset = self._io.read_u4le()
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(Regf.HiveBinCell.SubKeyListRi.Item, self)._write__seq(io)
                    self._io.write_u4le(self.sub_key_list_offset)


                def _check(self):
                    self._dirty = False



        class SubKeyListSk(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Regf.HiveBinCell.SubKeyListSk, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.unknown1 = self._io.read_u2le()
                self.previous_security_key_offset = self._io.read_u4le()
                self.next_security_key_offset = self._io.read_u4le()
                self.reference_count = self._io.read_u4le()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Regf.HiveBinCell.SubKeyListSk, self)._write__seq(io)
                self._io.write_u2le(self.unknown1)
                self._io.write_u4le(self.previous_security_key_offset)
                self._io.write_u4le(self.next_security_key_offset)
                self._io.write_u4le(self.reference_count)


            def _check(self):
                self._dirty = False


        class SubKeyListVk(ReadWriteKaitaiStruct):

            class DataTypeEnum(IntEnum):
                reg_none = 0
                reg_sz = 1
                reg_expand_sz = 2
                reg_binary = 3
                reg_dword = 4
                reg_dword_big_endian = 5
                reg_link = 6
                reg_multi_sz = 7
                reg_resource_list = 8
                reg_full_resource_descriptor = 9
                reg_resource_requirements_list = 10
                reg_qword = 11

            class VkFlags(IntEnum):
                value_comp_name = 1
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Regf.HiveBinCell.SubKeyListVk, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.value_name_size = self._io.read_u2le()
                self.data_size = self._io.read_u4le()
                self.data_offset = self._io.read_u4le()
                self.data_type = KaitaiStream.resolve_enum(Regf.HiveBinCell.SubKeyListVk.DataTypeEnum, self._io.read_u4le())
                self.flags = KaitaiStream.resolve_enum(Regf.HiveBinCell.SubKeyListVk.VkFlags, self._io.read_u2le())
                self.padding = self._io.read_u2le()
                if self.flags == Regf.HiveBinCell.SubKeyListVk.VkFlags.value_comp_name:
                    pass
                    self.value_name = (self._io.read_bytes(self.value_name_size)).decode(u"ASCII")

                self._dirty = False


            def _fetch_instances(self):
                pass
                if self.flags == Regf.HiveBinCell.SubKeyListVk.VkFlags.value_comp_name:
                    pass



            def _write__seq(self, io=None):
                super(Regf.HiveBinCell.SubKeyListVk, self)._write__seq(io)
                self._io.write_u2le(self.value_name_size)
                self._io.write_u4le(self.data_size)
                self._io.write_u4le(self.data_offset)
                self._io.write_u4le(int(self.data_type))
                self._io.write_u2le(int(self.flags))
                self._io.write_u2le(self.padding)
                if self.flags == Regf.HiveBinCell.SubKeyListVk.VkFlags.value_comp_name:
                    pass
                    self._io.write_bytes((self.value_name).encode(u"ASCII"))



            def _check(self):
                if self.flags == Regf.HiveBinCell.SubKeyListVk.VkFlags.value_comp_name:
                    pass
                    if len((self.value_name).encode(u"ASCII")) != self.value_name_size:
                        raise kaitaistruct.ConsistencyError(u"value_name", self.value_name_size, len((self.value_name).encode(u"ASCII")))

                self._dirty = False


        @property
        def cell_size(self):
            if hasattr(self, '_m_cell_size'):
                return self._m_cell_size

            self._m_cell_size = (-1 if self.cell_size_raw < 0 else 1) * self.cell_size_raw
            return getattr(self, '_m_cell_size', None)

        def _invalidate_cell_size(self):
            del self._m_cell_size
        @property
        def is_allocated(self):
            if hasattr(self, '_m_is_allocated'):
                return self._m_is_allocated

            self._m_is_allocated = self.cell_size_raw < 0
            return getattr(self, '_m_is_allocated', None)

        def _invalidate_is_allocated(self):
            del self._m_is_allocated

    class HiveBinHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Regf.HiveBinHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.signature = self._io.read_bytes(4)
            if not self.signature == b"\x68\x62\x69\x6E":
                raise kaitaistruct.ValidationNotEqualError(b"\x68\x62\x69\x6E", self.signature, self._io, u"/types/hive_bin_header/seq/0")
            self.offset = self._io.read_u4le()
            self.size = self._io.read_u4le()
            self.unknown1 = self._io.read_u4le()
            self.unknown2 = self._io.read_u4le()
            self.timestamp = Regf.Filetime(self._io, self, self._root)
            self.timestamp._read()
            self.unknown4 = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.timestamp._fetch_instances()


        def _write__seq(self, io=None):
            super(Regf.HiveBinHeader, self)._write__seq(io)
            self._io.write_bytes(self.signature)
            self._io.write_u4le(self.offset)
            self._io.write_u4le(self.size)
            self._io.write_u4le(self.unknown1)
            self._io.write_u4le(self.unknown2)
            self.timestamp._write__seq(self._io)
            self._io.write_u4le(self.unknown4)


        def _check(self):
            if len(self.signature) != 4:
                raise kaitaistruct.ConsistencyError(u"signature", 4, len(self.signature))
            if not self.signature == b"\x68\x62\x69\x6E":
                raise kaitaistruct.ValidationNotEqualError(b"\x68\x62\x69\x6E", self.signature, None, u"/types/hive_bin_header/seq/0")
            if self.timestamp._root != self._root:
                raise kaitaistruct.ConsistencyError(u"timestamp", self._root, self.timestamp._root)
            if self.timestamp._parent != self:
                raise kaitaistruct.ConsistencyError(u"timestamp", self, self.timestamp._parent)
            self._dirty = False



