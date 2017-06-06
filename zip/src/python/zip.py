# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum
import struct


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Zip(KaitaiStruct):

    class Compression(Enum):
        none = 0
        shrunk = 1
        reduced_1 = 2
        reduced_2 = 3
        reduced_3 = 4
        reduced_4 = 5
        imploded = 6
        deflated = 8
        enhanced_deflated = 9
        pkware_dcl_imploded = 10
        bzip2 = 12
        lzma = 14
        ibm_terse = 18
        ibm_lz77_z = 19
        ppmd = 98
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.sections = []
        while not self._io.is_eof():
            self.sections.append(self._root.PkSection(self._io, self, self._root))


    class LocalFile(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.header = self._root.LocalFileHeader(self._io, self, self._root)
            self.body = self._io.read_bytes(self.header.compressed_size)


    class CentralDirEntry(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.version_made_by = self._io.read_u2le()
            self.version_needed_to_extract = self._io.read_u2le()
            self.flags = self._io.read_u2le()
            self.compression_method = self._io.read_u2le()
            self.last_mod_file_time = self._io.read_u2le()
            self.last_mod_file_date = self._io.read_u2le()
            self.crc32 = self._io.read_u4le()
            self.compressed_size = self._io.read_u4le()
            self.uncompressed_size = self._io.read_u4le()
            self.file_name_len = self._io.read_u2le()
            self.extra_len = self._io.read_u2le()
            self.comment_len = self._io.read_u2le()
            self.disk_number_start = self._io.read_u2le()
            self.int_file_attr = self._io.read_u2le()
            self.ext_file_attr = self._io.read_u4le()
            self.local_header_offset = self._io.read_s4le()
            self.file_name = (self._io.read_bytes(self.file_name_len)).decode(u"UTF-8")
            self.extra = self._io.read_bytes(self.extra_len)
            self.comment = (self._io.read_bytes(self.comment_len)).decode(u"UTF-8")


    class PkSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.ensure_fixed_contents(struct.pack('2b', 80, 75))
            self.section_type = self._io.read_u2le()
            _on = self.section_type
            if _on == 513:
                self.body = self._root.CentralDirEntry(self._io, self, self._root)
            elif _on == 1027:
                self.body = self._root.LocalFile(self._io, self, self._root)
            elif _on == 1541:
                self.body = self._root.EndOfCentralDir(self._io, self, self._root)


    class LocalFileHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.version = self._io.read_u2le()
            self.flags = self._io.read_u2le()
            self.compression = self._root.Compression(self._io.read_u2le())
            self.file_mod_time = self._io.read_u2le()
            self.file_mod_date = self._io.read_u2le()
            self.crc32 = self._io.read_u4le()
            self.compressed_size = self._io.read_u4le()
            self.uncompressed_size = self._io.read_u4le()
            self.file_name_len = self._io.read_u2le()
            self.extra_len = self._io.read_u2le()
            self.file_name = (self._io.read_bytes(self.file_name_len)).decode(u"UTF-8")
            self.extra = self._io.read_bytes(self.extra_len)


    class EndOfCentralDir(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.disk_of_end_of_central_dir = self._io.read_u2le()
            self.disk_of_central_dir = self._io.read_u2le()
            self.qty_central_dir_entries_on_disk = self._io.read_u2le()
            self.qty_central_dir_entries_total = self._io.read_u2le()
            self.central_dir_size = self._io.read_u4le()
            self.central_dir_offset = self._io.read_u4le()
            self.comment_len = self._io.read_u2le()
            self.comment = (self._io.read_bytes(self.comment_len)).decode(u"UTF-8")



