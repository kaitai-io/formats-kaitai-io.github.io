# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if parse_version(kaitaistruct.__version__) < parse_version('0.9'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class AndroidDto(KaitaiStruct):
    """Format for Android DTB/DTBO partitions. It's kind of archive with
    dtb/dtbo files. Used only when there is a separate unique partition
    (dtb, dtbo) on an android device to organize device tree files.
    The format consists of a header with info about size and number
    of device tree entries and the entries themselves. This format
    description could be used to extract device tree entries from a
    partition images and decompile them with dtc (device tree compiler).
    
    .. seealso::
       Source - https://source.android.com/devices/architecture/dto/partitions
    
    
    .. seealso::
       Source - https://android.googlesource.com/platform/system/libufdt/+/refs/tags/android-10.0.0_r47
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.header = AndroidDto.DtTableHeader(self._io, self, self._root)
        self.entries = [None] * (self.header.dt_entry_count)
        for i in range(self.header.dt_entry_count):
            self.entries[i] = AndroidDto.DtTableEntry(self._io, self, self._root)


    class DtTableHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

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


    class DtTableEntry(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.dt_size = self._io.read_u4be()
            self.dt_offset = self._io.read_u4be()
            self.id = self._io.read_u4be()
            self.rev = self._io.read_u4be()
            self.custom = [None] * (4)
            for i in range(4):
                self.custom[i] = self._io.read_u4be()


        @property
        def body(self):
            """DTB/DTBO file."""
            if hasattr(self, '_m_body'):
                return self._m_body if hasattr(self, '_m_body') else None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.dt_offset)
            self._m_body = io.read_bytes(self.dt_size)
            io.seek(_pos)
            return self._m_body if hasattr(self, '_m_body') else None



