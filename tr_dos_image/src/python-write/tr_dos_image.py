# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class TrDosImage(ReadWriteKaitaiStruct):
    """.trd file is a raw dump of TR-DOS (ZX-Spectrum) floppy. .trd files are
    headerless and contain consequent "logical tracks", each logical track
    consists of 16 256-byte sectors.
    
    Logical tracks are defined the same way as used by TR-DOS: for single-side
    floppies it's just a physical track number, for two-side floppies sides are
    interleaved, i.e. logical_track_num = (physical_track_num << 1) | side
    
    So, this format definition is more for TR-DOS filesystem than for .trd files,
    which are formatless.
    
    Strings (file names, disk label, disk password) are padded with spaces and use
    ZX Spectrum character set, including UDGs, block drawing chars and Basic
    tokens. ASCII range is mostly standard ASCII, with few characters (^, `, DEL)
    replaced with (up arrow, pound, copyright symbol).
    
    .trd file can be smaller than actual floppy disk, if last logical tracks are
    empty (contain no file data) they can be omitted.
    """

    class DiskType(IntEnum):
        type_80_tracks_double_side = 22
        type_40_tracks_double_side = 23
        type_80_tracks_single_side = 24
        type_40_tracks_single_side = 25
    def __init__(self, _io=None, _parent=None, _root=None):
        super(TrDosImage, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_volume_info = False
        self.volume_info__enabled = True

    def _read(self):
        self.files = []
        i = 0
        while True:
            _t_files = TrDosImage.File(self._io, self, self._root)
            try:
                _t_files._read()
            finally:
                _ = _t_files
                self.files.append(_)
            if _.is_terminator:
                break
            i += 1
        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.files)):
            pass
            self.files[i]._fetch_instances()

        _ = self.volume_info
        if hasattr(self, '_m_volume_info'):
            pass
            self._m_volume_info._fetch_instances()



    def _write__seq(self, io=None):
        super(TrDosImage, self)._write__seq(io)
        self._should_write_volume_info = self.volume_info__enabled
        for i in range(len(self.files)):
            pass
            self.files[i]._write__seq(self._io)



    def _check(self):
        if len(self.files) == 0:
            raise kaitaistruct.ConsistencyError(u"files", 0, len(self.files))
        for i in range(len(self.files)):
            pass
            if self.files[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"files", self._root, self.files[i]._root)
            if self.files[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"files", self, self.files[i]._parent)
            _ = self.files[i]
            if _.is_terminator != (i == len(self.files) - 1):
                raise kaitaistruct.ConsistencyError(u"files", i == len(self.files) - 1, _.is_terminator)

        if self.volume_info__enabled:
            pass
            if self._m_volume_info._root != self._root:
                raise kaitaistruct.ConsistencyError(u"volume_info", self._root, self._m_volume_info._root)
            if self._m_volume_info._parent != self:
                raise kaitaistruct.ConsistencyError(u"volume_info", self, self._m_volume_info._parent)

        self._dirty = False

    class File(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(TrDosImage.File, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_contents = False
            self.contents__enabled = True

        def _read(self):
            self._raw_name = self._io.read_bytes(8)
            _io__raw_name = KaitaiStream(BytesIO(self._raw_name))
            self.name = TrDosImage.Filename(_io__raw_name, self, self._root)
            self.name._read()
            self.extension = self._io.read_u1()
            _on = self.extension
            if _on == 35:
                pass
                self.position_and_length = TrDosImage.PositionAndLengthPrint(self._io, self, self._root)
                self.position_and_length._read()
            elif _on == 66:
                pass
                self.position_and_length = TrDosImage.PositionAndLengthBasic(self._io, self, self._root)
                self.position_and_length._read()
            elif _on == 67:
                pass
                self.position_and_length = TrDosImage.PositionAndLengthCode(self._io, self, self._root)
                self.position_and_length._read()
            else:
                pass
                self.position_and_length = TrDosImage.PositionAndLengthGeneric(self._io, self, self._root)
                self.position_and_length._read()
            self.length_sectors = self._io.read_u1()
            self.starting_sector = self._io.read_u1()
            self.starting_track = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()
            _on = self.extension
            if _on == 35:
                pass
                self.position_and_length._fetch_instances()
            elif _on == 66:
                pass
                self.position_and_length._fetch_instances()
            elif _on == 67:
                pass
                self.position_and_length._fetch_instances()
            else:
                pass
                self.position_and_length._fetch_instances()
            _ = self.contents
            if hasattr(self, '_m_contents'):
                pass



        def _write__seq(self, io=None):
            super(TrDosImage.File, self)._write__seq(io)
            self._should_write_contents = self.contents__enabled
            _io__raw_name = KaitaiStream(BytesIO(bytearray(8)))
            self._io.add_child_stream(_io__raw_name)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (8))
            def handler(parent, _io__raw_name=_io__raw_name):
                self._raw_name = _io__raw_name.to_byte_array()
                if len(self._raw_name) != 8:
                    raise kaitaistruct.ConsistencyError(u"raw(name)", 8, len(self._raw_name))
                parent.write_bytes(self._raw_name)
            _io__raw_name.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.name._write__seq(_io__raw_name)
            self._io.write_u1(self.extension)
            _on = self.extension
            if _on == 35:
                pass
                self.position_and_length._write__seq(self._io)
            elif _on == 66:
                pass
                self.position_and_length._write__seq(self._io)
            elif _on == 67:
                pass
                self.position_and_length._write__seq(self._io)
            else:
                pass
                self.position_and_length._write__seq(self._io)
            self._io.write_u1(self.length_sectors)
            self._io.write_u1(self.starting_sector)
            self._io.write_u1(self.starting_track)


        def _check(self):
            if self.name._root != self._root:
                raise kaitaistruct.ConsistencyError(u"name", self._root, self.name._root)
            if self.name._parent != self:
                raise kaitaistruct.ConsistencyError(u"name", self, self.name._parent)
            _on = self.extension
            if _on == 35:
                pass
                if self.position_and_length._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"position_and_length", self._root, self.position_and_length._root)
                if self.position_and_length._parent != self:
                    raise kaitaistruct.ConsistencyError(u"position_and_length", self, self.position_and_length._parent)
            elif _on == 66:
                pass
                if self.position_and_length._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"position_and_length", self._root, self.position_and_length._root)
                if self.position_and_length._parent != self:
                    raise kaitaistruct.ConsistencyError(u"position_and_length", self, self.position_and_length._parent)
            elif _on == 67:
                pass
                if self.position_and_length._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"position_and_length", self._root, self.position_and_length._root)
                if self.position_and_length._parent != self:
                    raise kaitaistruct.ConsistencyError(u"position_and_length", self, self.position_and_length._parent)
            else:
                pass
                if self.position_and_length._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"position_and_length", self._root, self.position_and_length._root)
                if self.position_and_length._parent != self:
                    raise kaitaistruct.ConsistencyError(u"position_and_length", self, self.position_and_length._parent)
            if self.contents__enabled:
                pass
                if len(self._m_contents) != self.length_sectors * 256:
                    raise kaitaistruct.ConsistencyError(u"contents", self.length_sectors * 256, len(self._m_contents))

            self._dirty = False

        @property
        def contents(self):
            if self._should_write_contents:
                self._write_contents()
            if hasattr(self, '_m_contents'):
                return self._m_contents

            if not self.contents__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek((self.starting_track * 256) * 16 + self.starting_sector * 256)
            self._m_contents = self._io.read_bytes(self.length_sectors * 256)
            self._io.seek(_pos)
            return getattr(self, '_m_contents', None)

        @contents.setter
        def contents(self, v):
            self._dirty = True
            self._m_contents = v

        def _write_contents(self):
            self._should_write_contents = False
            _pos = self._io.pos()
            self._io.seek((self.starting_track * 256) * 16 + self.starting_sector * 256)
            self._io.write_bytes(self._m_contents)
            self._io.seek(_pos)

        @property
        def is_deleted(self):
            if hasattr(self, '_m_is_deleted'):
                return self._m_is_deleted

            self._m_is_deleted = self.name.first_byte == 1
            return getattr(self, '_m_is_deleted', None)

        def _invalidate_is_deleted(self):
            del self._m_is_deleted
        @property
        def is_terminator(self):
            if hasattr(self, '_m_is_terminator'):
                return self._m_is_terminator

            self._m_is_terminator = self.name.first_byte == 0
            return getattr(self, '_m_is_terminator', None)

        def _invalidate_is_terminator(self):
            del self._m_is_terminator

    class Filename(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(TrDosImage.Filename, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_first_byte = False
            self.first_byte__enabled = True

        def _read(self):
            self.name = self._io.read_bytes(8)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.first_byte
            if hasattr(self, '_m_first_byte'):
                pass



        def _write__seq(self, io=None):
            super(TrDosImage.Filename, self)._write__seq(io)
            self._should_write_first_byte = self.first_byte__enabled
            self._io.write_bytes(self.name)


        def _check(self):
            if len(self.name) != 8:
                raise kaitaistruct.ConsistencyError(u"name", 8, len(self.name))
            if self.first_byte__enabled:
                pass

            self._dirty = False

        @property
        def first_byte(self):
            if self._should_write_first_byte:
                self._write_first_byte()
            if hasattr(self, '_m_first_byte'):
                return self._m_first_byte

            if not self.first_byte__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(0)
            self._m_first_byte = self._io.read_u1()
            self._io.seek(_pos)
            return getattr(self, '_m_first_byte', None)

        @first_byte.setter
        def first_byte(self, v):
            self._dirty = True
            self._m_first_byte = v

        def _write_first_byte(self):
            self._should_write_first_byte = False
            _pos = self._io.pos()
            self._io.seek(0)
            self._io.write_u1(self._m_first_byte)
            self._io.seek(_pos)


    class PositionAndLengthBasic(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(TrDosImage.PositionAndLengthBasic, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.program_and_data_length = self._io.read_u2le()
            self.program_length = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(TrDosImage.PositionAndLengthBasic, self)._write__seq(io)
            self._io.write_u2le(self.program_and_data_length)
            self._io.write_u2le(self.program_length)


        def _check(self):
            self._dirty = False


    class PositionAndLengthCode(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(TrDosImage.PositionAndLengthCode, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.start_address = self._io.read_u2le()
            self.length = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(TrDosImage.PositionAndLengthCode, self)._write__seq(io)
            self._io.write_u2le(self.start_address)
            self._io.write_u2le(self.length)


        def _check(self):
            self._dirty = False


    class PositionAndLengthGeneric(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(TrDosImage.PositionAndLengthGeneric, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.reserved = self._io.read_u2le()
            self.length = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(TrDosImage.PositionAndLengthGeneric, self)._write__seq(io)
            self._io.write_u2le(self.reserved)
            self._io.write_u2le(self.length)


        def _check(self):
            self._dirty = False


    class PositionAndLengthPrint(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(TrDosImage.PositionAndLengthPrint, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.extent_no = self._io.read_u1()
            self.reserved = self._io.read_u1()
            self.length = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(TrDosImage.PositionAndLengthPrint, self)._write__seq(io)
            self._io.write_u1(self.extent_no)
            self._io.write_u1(self.reserved)
            self._io.write_u2le(self.length)


        def _check(self):
            self._dirty = False


    class VolumeInfo(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(TrDosImage.VolumeInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.catalog_end = self._io.read_bytes(1)
            if not self.catalog_end == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.catalog_end, self._io, u"/types/volume_info/seq/0")
            self.unused = self._io.read_bytes(224)
            self.first_free_sector_sector = self._io.read_u1()
            self.first_free_sector_track = self._io.read_u1()
            self.disk_type = KaitaiStream.resolve_enum(TrDosImage.DiskType, self._io.read_u1())
            self.num_files = self._io.read_u1()
            self.num_free_sectors = self._io.read_u2le()
            self.tr_dos_id = self._io.read_bytes(1)
            if not self.tr_dos_id == b"\x10":
                raise kaitaistruct.ValidationNotEqualError(b"\x10", self.tr_dos_id, self._io, u"/types/volume_info/seq/7")
            self.unused_2 = self._io.read_bytes(2)
            self.password = self._io.read_bytes(9)
            self.unused_3 = self._io.read_bytes(1)
            self.num_deleted_files = self._io.read_u1()
            self.label = self._io.read_bytes(8)
            self.unused_4 = self._io.read_bytes(3)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(TrDosImage.VolumeInfo, self)._write__seq(io)
            self._io.write_bytes(self.catalog_end)
            self._io.write_bytes(self.unused)
            self._io.write_u1(self.first_free_sector_sector)
            self._io.write_u1(self.first_free_sector_track)
            self._io.write_u1(int(self.disk_type))
            self._io.write_u1(self.num_files)
            self._io.write_u2le(self.num_free_sectors)
            self._io.write_bytes(self.tr_dos_id)
            self._io.write_bytes(self.unused_2)
            self._io.write_bytes(self.password)
            self._io.write_bytes(self.unused_3)
            self._io.write_u1(self.num_deleted_files)
            self._io.write_bytes(self.label)
            self._io.write_bytes(self.unused_4)


        def _check(self):
            if len(self.catalog_end) != 1:
                raise kaitaistruct.ConsistencyError(u"catalog_end", 1, len(self.catalog_end))
            if not self.catalog_end == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.catalog_end, None, u"/types/volume_info/seq/0")
            if len(self.unused) != 224:
                raise kaitaistruct.ConsistencyError(u"unused", 224, len(self.unused))
            if len(self.tr_dos_id) != 1:
                raise kaitaistruct.ConsistencyError(u"tr_dos_id", 1, len(self.tr_dos_id))
            if not self.tr_dos_id == b"\x10":
                raise kaitaistruct.ValidationNotEqualError(b"\x10", self.tr_dos_id, None, u"/types/volume_info/seq/7")
            if len(self.unused_2) != 2:
                raise kaitaistruct.ConsistencyError(u"unused_2", 2, len(self.unused_2))
            if len(self.password) != 9:
                raise kaitaistruct.ConsistencyError(u"password", 9, len(self.password))
            if len(self.unused_3) != 1:
                raise kaitaistruct.ConsistencyError(u"unused_3", 1, len(self.unused_3))
            if len(self.label) != 8:
                raise kaitaistruct.ConsistencyError(u"label", 8, len(self.label))
            if len(self.unused_4) != 3:
                raise kaitaistruct.ConsistencyError(u"unused_4", 3, len(self.unused_4))
            self._dirty = False

        @property
        def num_sides(self):
            if hasattr(self, '_m_num_sides'):
                return self._m_num_sides

            self._m_num_sides = (1 if int(self.disk_type) & 8 != 0 else 2)
            return getattr(self, '_m_num_sides', None)

        def _invalidate_num_sides(self):
            del self._m_num_sides
        @property
        def num_tracks(self):
            if hasattr(self, '_m_num_tracks'):
                return self._m_num_tracks

            self._m_num_tracks = (40 if int(self.disk_type) & 1 != 0 else 80)
            return getattr(self, '_m_num_tracks', None)

        def _invalidate_num_tracks(self):
            del self._m_num_tracks

    @property
    def volume_info(self):
        if self._should_write_volume_info:
            self._write_volume_info()
        if hasattr(self, '_m_volume_info'):
            return self._m_volume_info

        if not self.volume_info__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(2048)
        self._m_volume_info = TrDosImage.VolumeInfo(self._io, self, self._root)
        self._m_volume_info._read()
        self._io.seek(_pos)
        return getattr(self, '_m_volume_info', None)

    @volume_info.setter
    def volume_info(self, v):
        self._dirty = True
        self._m_volume_info = v

    def _write_volume_info(self):
        self._should_write_volume_info = False
        _pos = self._io.pos()
        self._io.seek(2048)
        self._m_volume_info._write__seq(self._io)
        self._io.seek(_pos)


