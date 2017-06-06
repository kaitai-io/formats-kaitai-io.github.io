# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class DosMz(KaitaiStruct):
    """DOS MZ file format is a traditional format for executables in MS-DOS
    environment. Many modern formats (i.e. Windows PE) still maintain
    compatibility stub with this format.
    
    As opposed to .com file format (which basically sports one 64K code
    segment of raw CPU instructions), DOS MZ .exe file format allowed
    more flexible memory management, loading of larger programs and
    added support for relocations.
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.hdr = self._root.MzHeader(self._io, self, self._root)
        self.mz_header2 = self._io.read_bytes((self.hdr.relocations_ofs - 28))
        self.relocations = [None] * (self.hdr.qty_relocations)
        for i in range(self.hdr.qty_relocations):
            self.relocations[i] = self._root.Relocation(self._io, self, self._root)

        self.body = self._io.read_bytes_full()

    class MzHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.read_bytes(2)
            self.last_page_extra_bytes = self._io.read_u2le()
            self.qty_pages = self._io.read_u2le()
            self.qty_relocations = self._io.read_u2le()
            self.header_size = self._io.read_u2le()
            self.min_allocation = self._io.read_u2le()
            self.max_allocation = self._io.read_u2le()
            self.initial_ss = self._io.read_u2le()
            self.initial_sp = self._io.read_u2le()
            self.checksum = self._io.read_u2le()
            self.initial_ip = self._io.read_u2le()
            self.initial_cs = self._io.read_u2le()
            self.relocations_ofs = self._io.read_u2le()
            self.overlay_id = self._io.read_u2le()


    class Relocation(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.ofs = self._io.read_u2le()
            self.seg = self._io.read_u2le()



