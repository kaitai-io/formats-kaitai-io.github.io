# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class CpioOldLe(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.files = []
        i = 0
        while not self._io.is_eof():
            self.files.append(self._root.File(self._io, self, self._root))
            i += 1


    class File(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.header = self._root.FileHeader(self._io, self, self._root)
            self.path_name = self._io.read_bytes((self.header.path_name_size - 1))
            self.string_terminator = self._io.ensure_fixed_contents(b"\x00")
            if (self.header.path_name_size % 2) == 1:
                self.path_name_padding = self._io.ensure_fixed_contents(b"\x00")

            self.file_data = self._io.read_bytes(self.header.file_size.value)
            if (self.header.file_size.value % 2) == 1:
                self.file_data_padding = self._io.ensure_fixed_contents(b"\x00")

            if  ((self.path_name == b"\x54\x52\x41\x49\x4C\x45\x52\x21\x21\x21") and (self.header.file_size.value == 0)) :
                self.end_of_file_padding = self._io.read_bytes_full()



    class FileHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.ensure_fixed_contents(b"\xC7\x71")
            self.device_number = self._io.read_u2le()
            self.inode_number = self._io.read_u2le()
            self.mode = self._io.read_u2le()
            self.user_id = self._io.read_u2le()
            self.group_id = self._io.read_u2le()
            self.number_of_links = self._io.read_u2le()
            self.r_device_number = self._io.read_u2le()
            self.modification_time = self._root.FourByteUnsignedInteger(self._io, self, self._root)
            self.path_name_size = self._io.read_u2le()
            self.file_size = self._root.FourByteUnsignedInteger(self._io, self, self._root)


    class FourByteUnsignedInteger(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.most_significant_bits = self._io.read_u2le()
            self.least_significant_bits = self._io.read_u2le()

        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = (self.least_significant_bits + (self.most_significant_bits << 16))
            return self._m_value



