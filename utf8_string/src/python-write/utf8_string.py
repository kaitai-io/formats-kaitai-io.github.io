# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Utf8String(ReadWriteKaitaiStruct):
    """UTF-8 is a popular character encoding scheme that allows to
    represent strings as sequence of code points defined in Unicode
    standard. Its features are:
    
    * variable width (i.e. one code point might be represented by 1 to 4
      bytes)
    * backward compatiblity with ASCII
    * basic validity checking (and thus distinguishing from other legacy
      8-bit encodings)
    * maintaining sort order of codepoints if sorted as a byte array
    
    WARNING: For the vast majority of practical purposes of format
    definitions in Kaitai Struct, you'd likely NOT want to use this and
    rather just use `type: str` with `encoding: utf-8`. That will use
    native string implementations, which are most likely more efficient
    and will give you native language strings, rather than an array of
    individual codepoints.  This format definition is provided mostly
    for educational / research purposes.
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Utf8String, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.codepoints = []
        i = 0
        while not self._io.is_eof():
            _t_codepoints = Utf8String.Utf8Codepoint(self._io.pos(), self._io, self, self._root)
            try:
                _t_codepoints._read()
            finally:
                self.codepoints.append(_t_codepoints)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.codepoints)):
            pass
            self.codepoints[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Utf8String, self)._write__seq(io)
        for i in range(len(self.codepoints)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"codepoints", 0, self._io.size() - self._io.pos())
            if self.codepoints[i].ofs != self._io.pos():
                raise kaitaistruct.ConsistencyError(u"codepoints", self._io.pos(), self.codepoints[i].ofs)
            self.codepoints[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"codepoints", 0, self._io.size() - self._io.pos())


    def _check(self):
        for i in range(len(self.codepoints)):
            pass
            if self.codepoints[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"codepoints", self._root, self.codepoints[i]._root)
            if self.codepoints[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"codepoints", self, self.codepoints[i]._parent)

        self._dirty = False

    class Utf8Codepoint(ReadWriteKaitaiStruct):
        def __init__(self, ofs, _io=None, _parent=None, _root=None):
            super(Utf8String.Utf8Codepoint, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.ofs = ofs
            self._should_write_byte0 = False
            self.byte0__enabled = True

        def _read(self):
            self.bytes = self._io.read_bytes(self.len_bytes)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.byte0
            if hasattr(self, '_m_byte0'):
                pass



        def _write__seq(self, io=None):
            super(Utf8String.Utf8Codepoint, self)._write__seq(io)
            self._should_write_byte0 = self.byte0__enabled
            if len(self.bytes) != self.len_bytes:
                raise kaitaistruct.ConsistencyError(u"bytes", self.len_bytes, len(self.bytes))
            self._io.write_bytes(self.bytes)


        def _check(self):
            if self.byte0__enabled:
                pass

            self._dirty = False

        @property
        def byte0(self):
            if self._should_write_byte0:
                self._write_byte0()
            if hasattr(self, '_m_byte0'):
                return self._m_byte0

            if not self.byte0__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.ofs)
            self._m_byte0 = self._io.read_u1()
            self._io.seek(_pos)
            return getattr(self, '_m_byte0', None)

        @byte0.setter
        def byte0(self, v):
            self._dirty = True
            self._m_byte0 = v

        def _write_byte0(self):
            self._should_write_byte0 = False
            _pos = self._io.pos()
            self._io.seek(self.ofs)
            self._io.write_u1(self._m_byte0)
            self._io.seek(_pos)

        @property
        def len_bytes(self):
            if hasattr(self, '_m_len_bytes'):
                return self._m_len_bytes

            self._m_len_bytes = (1 if self.byte0 & 128 == 0 else (2 if self.byte0 & 224 == 192 else (3 if self.byte0 & 240 == 224 else (4 if self.byte0 & 248 == 240 else -1))))
            return getattr(self, '_m_len_bytes', None)

        def _invalidate_len_bytes(self):
            del self._m_len_bytes
        @property
        def raw0(self):
            if hasattr(self, '_m_raw0'):
                return self._m_raw0

            self._m_raw0 = KaitaiStream.byte_array_index(self.bytes, 0) & (127 if self.len_bytes == 1 else (31 if self.len_bytes == 2 else (15 if self.len_bytes == 3 else (7 if self.len_bytes == 4 else 0))))
            return getattr(self, '_m_raw0', None)

        def _invalidate_raw0(self):
            del self._m_raw0
        @property
        def raw1(self):
            if hasattr(self, '_m_raw1'):
                return self._m_raw1

            if self.len_bytes >= 2:
                pass
                self._m_raw1 = KaitaiStream.byte_array_index(self.bytes, 1) & 63

            return getattr(self, '_m_raw1', None)

        def _invalidate_raw1(self):
            del self._m_raw1
        @property
        def raw2(self):
            if hasattr(self, '_m_raw2'):
                return self._m_raw2

            if self.len_bytes >= 3:
                pass
                self._m_raw2 = KaitaiStream.byte_array_index(self.bytes, 2) & 63

            return getattr(self, '_m_raw2', None)

        def _invalidate_raw2(self):
            del self._m_raw2
        @property
        def raw3(self):
            if hasattr(self, '_m_raw3'):
                return self._m_raw3

            if self.len_bytes >= 4:
                pass
                self._m_raw3 = KaitaiStream.byte_array_index(self.bytes, 3) & 63

            return getattr(self, '_m_raw3', None)

        def _invalidate_raw3(self):
            del self._m_raw3
        @property
        def value_as_int(self):
            if hasattr(self, '_m_value_as_int'):
                return self._m_value_as_int

            self._m_value_as_int = (self.raw0 if self.len_bytes == 1 else (self.raw0 << 6 | self.raw1 if self.len_bytes == 2 else ((self.raw0 << 12 | self.raw1 << 6) | self.raw2 if self.len_bytes == 3 else (((self.raw0 << 18 | self.raw1 << 12) | self.raw2 << 6) | self.raw3 if self.len_bytes == 4 else -1))))
            return getattr(self, '_m_value_as_int', None)

        def _invalidate_value_as_int(self):
            del self._m_value_as_int


