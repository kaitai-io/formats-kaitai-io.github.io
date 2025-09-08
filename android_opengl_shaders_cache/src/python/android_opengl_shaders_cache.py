# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class AndroidOpenglShadersCache(KaitaiStruct):
    """Android apps using directly or indirectly OpenGL cache compiled shaders
    into com.android.opengl.shaders_cache file.
    
    .. seealso::
       Source - https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/FileBlobCache.cpp
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(AndroidOpenglShadersCache, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\x45\x47\x4C\x24":
            raise kaitaistruct.ValidationNotEqualError(b"\x45\x47\x4C\x24", self.magic, self._io, u"/seq/0")
        self.crc32 = self._io.read_u4le()
        self._raw_contents = self._io.read_bytes_full()
        _io__raw_contents = KaitaiStream(BytesIO(self._raw_contents))
        self.contents = AndroidOpenglShadersCache.Cache(_io__raw_contents, self, self._root)


    def _fetch_instances(self):
        pass
        self.contents._fetch_instances()

    class Alignment(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(AndroidOpenglShadersCache.Alignment, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.alignment = self._io.read_bytes(self._io.pos() + 3 & ~3 - self._io.pos())


        def _fetch_instances(self):
            pass


    class Cache(KaitaiStruct):
        """
        .. seealso::
           Source - https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/BlobCache.cpp
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(AndroidOpenglShadersCache.Cache, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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

            self.entries = []
            for i in range(self.num_entries):
                self.entries.append(AndroidOpenglShadersCache.Cache.Entry(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            if self.version >= 3:
                pass
                self.build_id._fetch_instances()

            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()


        class Entry(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(AndroidOpenglShadersCache.Cache.Entry, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.len_key = self._io.read_u4le()
                self.len_value = self._io.read_u4le()
                self.key = self._io.read_bytes(self.len_key)
                self.value = self._io.read_bytes(self.len_value)
                self.alignment = AndroidOpenglShadersCache.Alignment(self._io, self, self._root)


            def _fetch_instances(self):
                pass
                self.alignment._fetch_instances()



    class PrefixedString(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(AndroidOpenglShadersCache.PrefixedString, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len_str = self._io.read_u4le()
            self.str = (KaitaiStream.bytes_terminate(self._io.read_bytes(self.len_str), 0, False)).decode(u"ASCII")
            self.alignment = AndroidOpenglShadersCache.Alignment(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.alignment._fetch_instances()



