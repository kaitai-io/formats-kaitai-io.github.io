# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class DosMz(KaitaiStruct):
    """DOS MZ file format is a traditional format for executables in MS-DOS
    environment. Many modern formats (i.e. Windows PE) still maintain
    compatibility stub with this format.
    
    As opposed to .com file format (which basically sports one 64K code
    segment of raw CPU instructions), DOS MZ .exe file format allowed
    more flexible memory management, loading of larger programs and
    added support for relocations.
    
    .. seealso::
       Source - http://www.delorie.com/djgpp/doc/exe/
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.header = DosMz.ExeHeader(self._io, self, self._root)
        self.body = self._io.read_bytes(self.header.len_body)

    class ExeHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.mz = DosMz.MzHeader(self._io, self, self._root)
            self.rest_of_header = self._io.read_bytes((self.mz.len_header - 28))

        @property
        def len_body(self):
            if hasattr(self, '_m_len_body'):
                return self._m_len_body

            self._m_len_body = (((self.mz.num_pages * 512) if self.mz.last_page_extra_bytes == 0 else (((self.mz.num_pages - 1) * 512) + self.mz.last_page_extra_bytes)) - self.mz.len_header)
            return getattr(self, '_m_len_body', None)


    class MzHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = (self._io.read_bytes(2)).decode(u"ASCII")
            if not  ((self.magic == u"MZ") or (self.magic == u"ZM")) :
                raise kaitaistruct.ValidationNotAnyOfError(self.magic, self._io, u"/types/mz_header/seq/0")
            self.last_page_extra_bytes = self._io.read_u2le()
            self.num_pages = self._io.read_u2le()
            self.num_relocations = self._io.read_u2le()
            self.header_size = self._io.read_u2le()
            self.min_allocation = self._io.read_u2le()
            self.max_allocation = self._io.read_u2le()
            self.initial_ss = self._io.read_u2le()
            self.initial_sp = self._io.read_u2le()
            self.checksum = self._io.read_u2le()
            self.initial_ip = self._io.read_u2le()
            self.initial_cs = self._io.read_u2le()
            self.ofs_relocations = self._io.read_u2le()
            self.overlay_id = self._io.read_u2le()

        @property
        def len_header(self):
            if hasattr(self, '_m_len_header'):
                return self._m_len_header

            self._m_len_header = (self.header_size * 16)
            return getattr(self, '_m_len_header', None)


    class Relocation(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.ofs = self._io.read_u2le()
            self.seg = self._io.read_u2le()


    @property
    def relocations(self):
        if hasattr(self, '_m_relocations'):
            return self._m_relocations

        if self.header.mz.ofs_relocations != 0:
            io = self.header._io
            _pos = io.pos()
            io.seek(self.header.mz.ofs_relocations)
            self._m_relocations = []
            for i in range(self.header.mz.num_relocations):
                self._m_relocations.append(DosMz.Relocation(io, self, self._root))

            io.seek(_pos)

        return getattr(self, '_m_relocations', None)


