# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class SaintsRow2VppPc(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.magic = self._io.ensure_fixed_contents(b"\xCE\x0A\x89\x51\x04")
        self.pad1 = self._io.read_bytes(335)
        self.num_files = self._io.read_s4le()
        self.container_size = self._io.read_s4le()
        self.len_offsets = self._io.read_s4le()
        self.len_filenames = self._io.read_s4le()
        self.len_extensions = self._io.read_s4le()
        self.smth5 = self._io.read_s4le()
        self.smth6 = self._io.read_s4le()
        self.smth7 = self._io.read_s4le()
        self.smth8 = self._io.read_s4le()
        self.smth9 = self._io.read_s4le()

    class Offsets(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                self.entries.append(self._root.Offsets.Offset(self._io, self, self._root))
                i += 1


        class Offset(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.name_ofs = self._io.read_u4le()
                self.ext_ofs = self._io.read_u4le()
                self.smth2 = self._io.read_s4le()
                self.ofs_body = self._io.read_s4le()
                self.len_body = self._io.read_s4le()
                self.always_minus_1 = self._io.read_s4le()
                self.always_zero = self._io.read_s4le()

            @property
            def filename(self):
                if hasattr(self, '_m_filename'):
                    return self._m_filename

                io = self._root.filenames._io
                _pos = io.pos()
                io.seek(self.name_ofs)
                self._m_filename = (io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
                io.seek(_pos)
                return self._m_filename

            @property
            def ext(self):
                if hasattr(self, '_m_ext'):
                    return self._m_ext

                io = self._root.extensions._io
                _pos = io.pos()
                io.seek(self.ext_ofs)
                self._m_ext = (io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
                io.seek(_pos)
                return self._m_ext

            @property
            def body(self):
                if hasattr(self, '_m_body'):
                    return self._m_body

                io = self._root._io
                _pos = io.pos()
                io.seek((self._root.data_start + self.ofs_body))
                self._m_body = io.read_bytes(self.len_body)
                io.seek(_pos)
                return self._m_body



    class Strings(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                self.entries.append((self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8"))
                i += 1



    @property
    def filenames(self):
        if hasattr(self, '_m_filenames'):
            return self._m_filenames

        _pos = self._io.pos()
        self._io.seek(self.ofs_filenames)
        self._raw__m_filenames = self._io.read_bytes(self.len_filenames)
        io = KaitaiStream(BytesIO(self._raw__m_filenames))
        self._m_filenames = self._root.Strings(io, self, self._root)
        self._io.seek(_pos)
        return self._m_filenames

    @property
    def ofs_extensions(self):
        if hasattr(self, '_m_ofs_extensions'):
            return self._m_ofs_extensions

        self._m_ofs_extensions = (((self.ofs_filenames + self.len_filenames) & 4294965248) + 2048)
        return self._m_ofs_extensions

    @property
    def files(self):
        if hasattr(self, '_m_files'):
            return self._m_files

        _pos = self._io.pos()
        self._io.seek(2048)
        self._raw__m_files = self._io.read_bytes(self.len_offsets)
        io = KaitaiStream(BytesIO(self._raw__m_files))
        self._m_files = self._root.Offsets(io, self, self._root)
        self._io.seek(_pos)
        return self._m_files

    @property
    def data_start(self):
        if hasattr(self, '_m_data_start'):
            return self._m_data_start

        self._m_data_start = (((self.ofs_extensions + self.len_extensions) & 4294965248) + 2048)
        return self._m_data_start

    @property
    def extensions(self):
        if hasattr(self, '_m_extensions'):
            return self._m_extensions

        _pos = self._io.pos()
        self._io.seek(self.ofs_extensions)
        self._raw__m_extensions = self._io.read_bytes(self.len_extensions)
        io = KaitaiStream(BytesIO(self._raw__m_extensions))
        self._m_extensions = self._root.Strings(io, self, self._root)
        self._io.seek(_pos)
        return self._m_extensions

    @property
    def ofs_filenames(self):
        if hasattr(self, '_m_ofs_filenames'):
            return self._m_ofs_filenames

        self._m_ofs_filenames = (((2048 + self.len_offsets) & 4294965248) + 2048)
        return self._m_ofs_filenames


