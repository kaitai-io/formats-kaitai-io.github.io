# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class TrDosImage(KaitaiStruct):
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
    def __init__(self, _io, _parent=None, _root=None):
        super(TrDosImage, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.files = []
        i = 0
        while True:
            _ = TrDosImage.File(self._io, self, self._root)
            self.files.append(_)
            if _.is_terminator:
                break
            i += 1


    def _fetch_instances(self):
        pass
        for i in range(len(self.files)):
            pass
            self.files[i]._fetch_instances()

        _ = self.volume_info
        if hasattr(self, '_m_volume_info'):
            pass
            self._m_volume_info._fetch_instances()


    class File(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(TrDosImage.File, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self._raw_name = self._io.read_bytes(8)
            _io__raw_name = KaitaiStream(BytesIO(self._raw_name))
            self.name = TrDosImage.Filename(_io__raw_name, self, self._root)
            self.extension = self._io.read_u1()
            _on = self.extension
            if _on == 35:
                pass
                self.position_and_length = TrDosImage.PositionAndLengthPrint(self._io, self, self._root)
            elif _on == 66:
                pass
                self.position_and_length = TrDosImage.PositionAndLengthBasic(self._io, self, self._root)
            elif _on == 67:
                pass
                self.position_and_length = TrDosImage.PositionAndLengthCode(self._io, self, self._root)
            else:
                pass
                self.position_and_length = TrDosImage.PositionAndLengthGeneric(self._io, self, self._root)
            self.length_sectors = self._io.read_u1()
            self.starting_sector = self._io.read_u1()
            self.starting_track = self._io.read_u1()


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


        @property
        def contents(self):
            if hasattr(self, '_m_contents'):
                return self._m_contents

            _pos = self._io.pos()
            self._io.seek((self.starting_track * 256) * 16 + self.starting_sector * 256)
            self._m_contents = self._io.read_bytes(self.length_sectors * 256)
            self._io.seek(_pos)
            return getattr(self, '_m_contents', None)

        @property
        def is_deleted(self):
            if hasattr(self, '_m_is_deleted'):
                return self._m_is_deleted

            self._m_is_deleted = self.name.first_byte == 1
            return getattr(self, '_m_is_deleted', None)

        @property
        def is_terminator(self):
            if hasattr(self, '_m_is_terminator'):
                return self._m_is_terminator

            self._m_is_terminator = self.name.first_byte == 0
            return getattr(self, '_m_is_terminator', None)


    class Filename(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(TrDosImage.Filename, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.name = self._io.read_bytes(8)


        def _fetch_instances(self):
            pass
            _ = self.first_byte
            if hasattr(self, '_m_first_byte'):
                pass


        @property
        def first_byte(self):
            if hasattr(self, '_m_first_byte'):
                return self._m_first_byte

            _pos = self._io.pos()
            self._io.seek(0)
            self._m_first_byte = self._io.read_u1()
            self._io.seek(_pos)
            return getattr(self, '_m_first_byte', None)


    class PositionAndLengthBasic(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(TrDosImage.PositionAndLengthBasic, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.program_and_data_length = self._io.read_u2le()
            self.program_length = self._io.read_u2le()


        def _fetch_instances(self):
            pass


    class PositionAndLengthCode(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(TrDosImage.PositionAndLengthCode, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.start_address = self._io.read_u2le()
            self.length = self._io.read_u2le()


        def _fetch_instances(self):
            pass


    class PositionAndLengthGeneric(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(TrDosImage.PositionAndLengthGeneric, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.reserved = self._io.read_u2le()
            self.length = self._io.read_u2le()


        def _fetch_instances(self):
            pass


    class PositionAndLengthPrint(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(TrDosImage.PositionAndLengthPrint, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.extent_no = self._io.read_u1()
            self.reserved = self._io.read_u1()
            self.length = self._io.read_u2le()


        def _fetch_instances(self):
            pass


    class VolumeInfo(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(TrDosImage.VolumeInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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


        def _fetch_instances(self):
            pass

        @property
        def num_sides(self):
            if hasattr(self, '_m_num_sides'):
                return self._m_num_sides

            self._m_num_sides = (1 if int(self.disk_type) & 8 != 0 else 2)
            return getattr(self, '_m_num_sides', None)

        @property
        def num_tracks(self):
            if hasattr(self, '_m_num_tracks'):
                return self._m_num_tracks

            self._m_num_tracks = (40 if int(self.disk_type) & 1 != 0 else 80)
            return getattr(self, '_m_num_tracks', None)


    @property
    def volume_info(self):
        if hasattr(self, '_m_volume_info'):
            return self._m_volume_info

        _pos = self._io.pos()
        self._io.seek(2048)
        self._m_volume_info = TrDosImage.VolumeInfo(self._io, self, self._root)
        self._io.seek(_pos)
        return getattr(self, '_m_volume_info', None)


