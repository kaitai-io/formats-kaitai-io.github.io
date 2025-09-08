# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum
import zlib


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Fallout2Dat(ReadWriteKaitaiStruct):

    class Compression(IntEnum):
        none = 0
        zlib = 1
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Fallout2Dat, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_footer = False
        self.footer__enabled = True
        self._should_write_index = False
        self.index__enabled = True

    def _read(self):
        pass
        self._dirty = False


    def _fetch_instances(self):
        pass
        _ = self.footer
        if hasattr(self, '_m_footer'):
            pass
            self._m_footer._fetch_instances()

        _ = self.index
        if hasattr(self, '_m_index'):
            pass
            self._m_index._fetch_instances()



    def _write__seq(self, io=None):
        super(Fallout2Dat, self)._write__seq(io)
        self._should_write_footer = self.footer__enabled
        self._should_write_index = self.index__enabled


    def _check(self):
        if self.footer__enabled:
            pass
            if self._m_footer._root != self._root:
                raise kaitaistruct.ConsistencyError(u"footer", self._root, self._m_footer._root)
            if self._m_footer._parent != self:
                raise kaitaistruct.ConsistencyError(u"footer", self, self._m_footer._parent)

        if self.index__enabled:
            pass
            if self._m_index._root != self._root:
                raise kaitaistruct.ConsistencyError(u"index", self._root, self._m_index._root)
            if self._m_index._parent != self:
                raise kaitaistruct.ConsistencyError(u"index", self, self._m_index._parent)

        self._dirty = False

    class File(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Fallout2Dat.File, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_contents_raw = False
            self.contents_raw__enabled = True
            self._should_write_contents_zlib = False
            self.contents_zlib__enabled = True

        def _read(self):
            self.name = Fallout2Dat.Pstr(self._io, self, self._root)
            self.name._read()
            self.flags = KaitaiStream.resolve_enum(Fallout2Dat.Compression, self._io.read_u1())
            self.size_unpacked = self._io.read_u4le()
            self.size_packed = self._io.read_u4le()
            self.offset = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()
            _ = self.contents_raw
            if hasattr(self, '_m_contents_raw'):
                pass

            _ = self.contents_zlib
            if hasattr(self, '_m_contents_zlib'):
                pass



        def _write__seq(self, io=None):
            super(Fallout2Dat.File, self)._write__seq(io)
            self._should_write_contents_raw = self.contents_raw__enabled
            self._should_write_contents_zlib = self.contents_zlib__enabled
            self.name._write__seq(self._io)
            self._io.write_u1(int(self.flags))
            self._io.write_u4le(self.size_unpacked)
            self._io.write_u4le(self.size_packed)
            self._io.write_u4le(self.offset)


        def _check(self):
            if self.name._root != self._root:
                raise kaitaistruct.ConsistencyError(u"name", self._root, self.name._root)
            if self.name._parent != self:
                raise kaitaistruct.ConsistencyError(u"name", self, self.name._parent)
            if self.contents_raw__enabled:
                pass
                if self.flags == Fallout2Dat.Compression.none:
                    pass
                    if len(self._m_contents_raw) != self.size_unpacked:
                        raise kaitaistruct.ConsistencyError(u"contents_raw", self.size_unpacked, len(self._m_contents_raw))


            if self.contents_zlib__enabled:
                pass
                if self.flags == Fallout2Dat.Compression.zlib:
                    pass


            self._dirty = False

        @property
        def contents(self):
            if hasattr(self, '_m_contents'):
                return self._m_contents

            if  ((self.flags == Fallout2Dat.Compression.zlib) or (self.flags == Fallout2Dat.Compression.none)) :
                pass
                self._m_contents = (self.contents_zlib if self.flags == Fallout2Dat.Compression.zlib else self.contents_raw)

            return getattr(self, '_m_contents', None)

        def _invalidate_contents(self):
            del self._m_contents
        @property
        def contents_raw(self):
            if self._should_write_contents_raw:
                self._write_contents_raw()
            if hasattr(self, '_m_contents_raw'):
                return self._m_contents_raw

            if not self.contents_raw__enabled:
                return None

            if self.flags == Fallout2Dat.Compression.none:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.offset)
                self._m_contents_raw = io.read_bytes(self.size_unpacked)
                io.seek(_pos)

            return getattr(self, '_m_contents_raw', None)

        @contents_raw.setter
        def contents_raw(self, v):
            self._dirty = True
            self._m_contents_raw = v

        def _write_contents_raw(self):
            self._should_write_contents_raw = False
            if self.flags == Fallout2Dat.Compression.none:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.offset)
                io.write_bytes(self._m_contents_raw)
                io.seek(_pos)


        @property
        def contents_zlib(self):
            if self._should_write_contents_zlib:
                self._write_contents_zlib()
            if hasattr(self, '_m_contents_zlib'):
                return self._m_contents_zlib

            if not self.contents_zlib__enabled:
                return None

            if self.flags == Fallout2Dat.Compression.zlib:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.offset)
                self._raw__m_contents_zlib = io.read_bytes(self.size_packed)
                self._m_contents_zlib = zlib.decompress(self._raw__m_contents_zlib)
                io.seek(_pos)

            return getattr(self, '_m_contents_zlib', None)

        @contents_zlib.setter
        def contents_zlib(self, v):
            self._dirty = True
            self._m_contents_zlib = v

        def _write_contents_zlib(self):
            self._should_write_contents_zlib = False
            if self.flags == Fallout2Dat.Compression.zlib:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.offset)
                self._raw__m_contents_zlib = zlib.compress(self._m_contents_zlib)
                if len(self._raw__m_contents_zlib) != self.size_packed:
                    raise kaitaistruct.ConsistencyError(u"contents_zlib", self.size_packed, len(self._raw__m_contents_zlib))
                io.write_bytes(self._raw__m_contents_zlib)
                io.seek(_pos)



    class Footer(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Fallout2Dat.Footer, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.index_size = self._io.read_u4le()
            self.file_size = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Fallout2Dat.Footer, self)._write__seq(io)
            self._io.write_u4le(self.index_size)
            self._io.write_u4le(self.file_size)


        def _check(self):
            self._dirty = False


    class Index(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Fallout2Dat.Index, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.file_count = self._io.read_u4le()
            self.files = []
            for i in range(self.file_count):
                _t_files = Fallout2Dat.File(self._io, self, self._root)
                try:
                    _t_files._read()
                finally:
                    self.files.append(_t_files)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.files)):
                pass
                self.files[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Fallout2Dat.Index, self)._write__seq(io)
            self._io.write_u4le(self.file_count)
            for i in range(len(self.files)):
                pass
                self.files[i]._write__seq(self._io)



        def _check(self):
            if len(self.files) != self.file_count:
                raise kaitaistruct.ConsistencyError(u"files", self.file_count, len(self.files))
            for i in range(len(self.files)):
                pass
                if self.files[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"files", self._root, self.files[i]._root)
                if self.files[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"files", self, self.files[i]._parent)

            self._dirty = False


    class Pstr(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Fallout2Dat.Pstr, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.size = self._io.read_u4le()
            self.str = (self._io.read_bytes(self.size)).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Fallout2Dat.Pstr, self)._write__seq(io)
            self._io.write_u4le(self.size)
            self._io.write_bytes((self.str).encode(u"ASCII"))


        def _check(self):
            if len((self.str).encode(u"ASCII")) != self.size:
                raise kaitaistruct.ConsistencyError(u"str", self.size, len((self.str).encode(u"ASCII")))
            self._dirty = False


    @property
    def footer(self):
        if self._should_write_footer:
            self._write_footer()
        if hasattr(self, '_m_footer'):
            return self._m_footer

        if not self.footer__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self._io.size() - 8)
        self._m_footer = Fallout2Dat.Footer(self._io, self, self._root)
        self._m_footer._read()
        self._io.seek(_pos)
        return getattr(self, '_m_footer', None)

    @footer.setter
    def footer(self, v):
        self._dirty = True
        self._m_footer = v

    def _write_footer(self):
        self._should_write_footer = False
        _pos = self._io.pos()
        self._io.seek(self._io.size() - 8)
        self._m_footer._write__seq(self._io)
        self._io.seek(_pos)

    @property
    def index(self):
        if self._should_write_index:
            self._write_index()
        if hasattr(self, '_m_index'):
            return self._m_index

        if not self.index__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek((self._io.size() - 8) - self.footer.index_size)
        self._m_index = Fallout2Dat.Index(self._io, self, self._root)
        self._m_index._read()
        self._io.seek(_pos)
        return getattr(self, '_m_index', None)

    @index.setter
    def index(self, v):
        self._dirty = True
        self._m_index = v

    def _write_index(self):
        self._should_write_index = False
        _pos = self._io.pos()
        self._io.seek((self._io.size() - 8) - self.footer.index_size)
        self._m_index._write__seq(self._io)
        self._io.seek(_pos)


