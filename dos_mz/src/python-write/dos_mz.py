# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class DosMz(ReadWriteKaitaiStruct):
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
    def __init__(self, _io=None, _parent=None, _root=None):
        super(DosMz, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_relocations = False
        self.relocations__enabled = True

    def _read(self):
        self.header = DosMz.ExeHeader(self._io, self, self._root)
        self.header._read()
        self.body = self._io.read_bytes(self.header.len_body)
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        _ = self.relocations
        if hasattr(self, '_m_relocations'):
            pass
            for i in range(len(self._m_relocations)):
                pass
                self._m_relocations[i]._fetch_instances()




    def _write__seq(self, io=None):
        super(DosMz, self)._write__seq(io)
        self._should_write_relocations = self.relocations__enabled
        self.header._write__seq(self._io)
        self._io.write_bytes(self.body)


    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if len(self.body) != self.header.len_body:
            raise kaitaistruct.ConsistencyError(u"body", self.header.len_body, len(self.body))
        if self.relocations__enabled:
            pass
            if self.header.mz.ofs_relocations != 0:
                pass
                if len(self._m_relocations) != self.header.mz.num_relocations:
                    raise kaitaistruct.ConsistencyError(u"relocations", self.header.mz.num_relocations, len(self._m_relocations))
                for i in range(len(self._m_relocations)):
                    pass
                    if self._m_relocations[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"relocations", self._root, self._m_relocations[i]._root)
                    if self._m_relocations[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"relocations", self, self._m_relocations[i]._parent)



        self._dirty = False

    class ExeHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DosMz.ExeHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.mz = DosMz.MzHeader(self._io, self, self._root)
            self.mz._read()
            self.rest_of_header = self._io.read_bytes(self.mz.len_header - 28)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.mz._fetch_instances()


        def _write__seq(self, io=None):
            super(DosMz.ExeHeader, self)._write__seq(io)
            self.mz._write__seq(self._io)
            self._io.write_bytes(self.rest_of_header)


        def _check(self):
            if self.mz._root != self._root:
                raise kaitaistruct.ConsistencyError(u"mz", self._root, self.mz._root)
            if self.mz._parent != self:
                raise kaitaistruct.ConsistencyError(u"mz", self, self.mz._parent)
            if len(self.rest_of_header) != self.mz.len_header - 28:
                raise kaitaistruct.ConsistencyError(u"rest_of_header", self.mz.len_header - 28, len(self.rest_of_header))
            self._dirty = False

        @property
        def len_body(self):
            if hasattr(self, '_m_len_body'):
                return self._m_len_body

            self._m_len_body = (self.mz.num_pages * 512 if self.mz.last_page_extra_bytes == 0 else (self.mz.num_pages - 1) * 512 + self.mz.last_page_extra_bytes) - self.mz.len_header
            return getattr(self, '_m_len_body', None)

        def _invalidate_len_body(self):
            del self._m_len_body

    class MzHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DosMz.MzHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

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
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(DosMz.MzHeader, self)._write__seq(io)
            self._io.write_bytes((self.magic).encode(u"ASCII"))
            self._io.write_u2le(self.last_page_extra_bytes)
            self._io.write_u2le(self.num_pages)
            self._io.write_u2le(self.num_relocations)
            self._io.write_u2le(self.header_size)
            self._io.write_u2le(self.min_allocation)
            self._io.write_u2le(self.max_allocation)
            self._io.write_u2le(self.initial_ss)
            self._io.write_u2le(self.initial_sp)
            self._io.write_u2le(self.checksum)
            self._io.write_u2le(self.initial_ip)
            self._io.write_u2le(self.initial_cs)
            self._io.write_u2le(self.ofs_relocations)
            self._io.write_u2le(self.overlay_id)


        def _check(self):
            if len((self.magic).encode(u"ASCII")) != 2:
                raise kaitaistruct.ConsistencyError(u"magic", 2, len((self.magic).encode(u"ASCII")))
            if not  ((self.magic == u"MZ") or (self.magic == u"ZM")) :
                raise kaitaistruct.ValidationNotAnyOfError(self.magic, None, u"/types/mz_header/seq/0")
            self._dirty = False

        @property
        def len_header(self):
            if hasattr(self, '_m_len_header'):
                return self._m_len_header

            self._m_len_header = self.header_size * 16
            return getattr(self, '_m_len_header', None)

        def _invalidate_len_header(self):
            del self._m_len_header

    class Relocation(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DosMz.Relocation, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ofs = self._io.read_u2le()
            self.seg = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(DosMz.Relocation, self)._write__seq(io)
            self._io.write_u2le(self.ofs)
            self._io.write_u2le(self.seg)


        def _check(self):
            self._dirty = False


    @property
    def relocations(self):
        if self._should_write_relocations:
            self._write_relocations()
        if hasattr(self, '_m_relocations'):
            return self._m_relocations

        if not self.relocations__enabled:
            return None

        if self.header.mz.ofs_relocations != 0:
            pass
            io = self.header._io
            _pos = io.pos()
            io.seek(self.header.mz.ofs_relocations)
            self._m_relocations = []
            for i in range(self.header.mz.num_relocations):
                _t__m_relocations = DosMz.Relocation(io, self, self._root)
                try:
                    _t__m_relocations._read()
                finally:
                    self._m_relocations.append(_t__m_relocations)

            io.seek(_pos)

        return getattr(self, '_m_relocations', None)

    @relocations.setter
    def relocations(self, v):
        self._dirty = True
        self._m_relocations = v

    def _write_relocations(self):
        self._should_write_relocations = False
        if self.header.mz.ofs_relocations != 0:
            pass
            io = self.header._io
            _pos = io.pos()
            io.seek(self.header.mz.ofs_relocations)
            for i in range(len(self._m_relocations)):
                pass
                self._m_relocations[i]._write__seq(io)

            io.seek(_pos)



