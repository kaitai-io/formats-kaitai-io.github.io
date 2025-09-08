# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class AndroidOpenglShadersCache(ReadWriteKaitaiStruct):
    """Android apps using directly or indirectly OpenGL cache compiled shaders
    into com.android.opengl.shaders_cache file.
    
    .. seealso::
       Source - https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/FileBlobCache.cpp
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(AndroidOpenglShadersCache, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\x45\x47\x4C\x24":
            raise kaitaistruct.ValidationNotEqualError(b"\x45\x47\x4C\x24", self.magic, self._io, u"/seq/0")
        self.crc32 = self._io.read_u4le()
        self._raw_contents = self._io.read_bytes_full()
        _io__raw_contents = KaitaiStream(BytesIO(self._raw_contents))
        self.contents = AndroidOpenglShadersCache.Cache(_io__raw_contents, self, self._root)
        self.contents._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.contents._fetch_instances()


    def _write__seq(self, io=None):
        super(AndroidOpenglShadersCache, self)._write__seq(io)
        self._io.write_bytes(self.magic)
        self._io.write_u4le(self.crc32)
        _io__raw_contents = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
        self._io.add_child_stream(_io__raw_contents)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
        def handler(parent, _io__raw_contents=_io__raw_contents):
            self._raw_contents = _io__raw_contents.to_byte_array()
            parent.write_bytes(self._raw_contents)
            if not parent.is_eof():
                raise kaitaistruct.ConsistencyError(u"raw(contents)", 0, parent.size() - parent.pos())
        _io__raw_contents.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.contents._write__seq(_io__raw_contents)


    def _check(self):
        if len(self.magic) != 4:
            raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
        if not self.magic == b"\x45\x47\x4C\x24":
            raise kaitaistruct.ValidationNotEqualError(b"\x45\x47\x4C\x24", self.magic, None, u"/seq/0")
        if self.contents._root != self._root:
            raise kaitaistruct.ConsistencyError(u"contents", self._root, self.contents._root)
        if self.contents._parent != self:
            raise kaitaistruct.ConsistencyError(u"contents", self, self.contents._parent)
        self._dirty = False

    class Alignment(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidOpenglShadersCache.Alignment, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.alignment = self._io.read_bytes(self._io.pos() + 3 & ~3 - self._io.pos())
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(AndroidOpenglShadersCache.Alignment, self)._write__seq(io)
            if len(self.alignment) != self._io.pos() + 3 & ~3 - self._io.pos():
                raise kaitaistruct.ConsistencyError(u"alignment", self._io.pos() + 3 & ~3 - self._io.pos(), len(self.alignment))
            self._io.write_bytes(self.alignment)


        def _check(self):
            self._dirty = False


    class Cache(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/BlobCache.cpp
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidOpenglShadersCache.Cache, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x24\x62\x42\x5F":
                raise kaitaistruct.ValidationNotEqualError(b"\x24\x62\x42\x5F", self.magic, self._io, u"/types/cache/seq/0")
            self.version = self._io.read_u4le()
            self.device_version = self._io.read_u4le()
            self.num_entries = self._io.read_u4le()
            if self.version >= 3:
                pass
                self.build_id = AndroidOpenglShadersCache.PrefixedString(self._io, self, self._root)
                self.build_id._read()

            self.entries = []
            for i in range(self.num_entries):
                _t_entries = AndroidOpenglShadersCache.Cache.Entry(self._io, self, self._root)
                try:
                    _t_entries._read()
                finally:
                    self.entries.append(_t_entries)

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.version >= 3:
                pass
                self.build_id._fetch_instances()

            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(AndroidOpenglShadersCache.Cache, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u4le(self.version)
            self._io.write_u4le(self.device_version)
            self._io.write_u4le(self.num_entries)
            if self.version >= 3:
                pass
                self.build_id._write__seq(self._io)

            for i in range(len(self.entries)):
                pass
                self.entries[i]._write__seq(self._io)



        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x24\x62\x42\x5F":
                raise kaitaistruct.ValidationNotEqualError(b"\x24\x62\x42\x5F", self.magic, None, u"/types/cache/seq/0")
            if self.version >= 3:
                pass
                if self.build_id._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"build_id", self._root, self.build_id._root)
                if self.build_id._parent != self:
                    raise kaitaistruct.ConsistencyError(u"build_id", self, self.build_id._parent)

            if len(self.entries) != self.num_entries:
                raise kaitaistruct.ConsistencyError(u"entries", self.num_entries, len(self.entries))
            for i in range(len(self.entries)):
                pass
                if self.entries[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
                if self.entries[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

            self._dirty = False

        class Entry(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(AndroidOpenglShadersCache.Cache.Entry, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.len_key = self._io.read_u4le()
                self.len_value = self._io.read_u4le()
                self.key = self._io.read_bytes(self.len_key)
                self.value = self._io.read_bytes(self.len_value)
                self.alignment = AndroidOpenglShadersCache.Alignment(self._io, self, self._root)
                self.alignment._read()
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.alignment._fetch_instances()


            def _write__seq(self, io=None):
                super(AndroidOpenglShadersCache.Cache.Entry, self)._write__seq(io)
                self._io.write_u4le(self.len_key)
                self._io.write_u4le(self.len_value)
                self._io.write_bytes(self.key)
                self._io.write_bytes(self.value)
                self.alignment._write__seq(self._io)


            def _check(self):
                if len(self.key) != self.len_key:
                    raise kaitaistruct.ConsistencyError(u"key", self.len_key, len(self.key))
                if len(self.value) != self.len_value:
                    raise kaitaistruct.ConsistencyError(u"value", self.len_value, len(self.value))
                if self.alignment._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"alignment", self._root, self.alignment._root)
                if self.alignment._parent != self:
                    raise kaitaistruct.ConsistencyError(u"alignment", self, self.alignment._parent)
                self._dirty = False



    class PrefixedString(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidOpenglShadersCache.PrefixedString, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_str = self._io.read_u4le()
            self.str = (KaitaiStream.bytes_terminate(self._io.read_bytes(self.len_str), 0, False)).decode(u"ASCII")
            self.alignment = AndroidOpenglShadersCache.Alignment(self._io, self, self._root)
            self.alignment._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.alignment._fetch_instances()


        def _write__seq(self, io=None):
            super(AndroidOpenglShadersCache.PrefixedString, self)._write__seq(io)
            self._io.write_u4le(self.len_str)
            self._io.write_bytes_limit((self.str).encode(u"ASCII"), self.len_str, 0, 0)
            self.alignment._write__seq(self._io)


        def _check(self):
            if len((self.str).encode(u"ASCII")) > self.len_str:
                raise kaitaistruct.ConsistencyError(u"str", self.len_str, len((self.str).encode(u"ASCII")))
            if KaitaiStream.byte_array_index_of((self.str).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"str", -1, KaitaiStream.byte_array_index_of((self.str).encode(u"ASCII"), 0))
            if self.alignment._root != self._root:
                raise kaitaistruct.ConsistencyError(u"alignment", self._root, self.alignment._root)
            if self.alignment._parent != self:
                raise kaitaistruct.ConsistencyError(u"alignment", self, self.alignment._parent)
            self._dirty = False



