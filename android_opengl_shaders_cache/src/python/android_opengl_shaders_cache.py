# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class AndroidOpenglShadersCache(KaitaiStruct):
    """Android apps using directly or indirectly OpenGL cache compiled shaders into com.android.opengl.shaders_cache file.
    
    .. seealso::
       Source - https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/FileBlobCache.cpp
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.signature = self._io.ensure_fixed_contents(b"\x45\x47\x4C\x24")
        self.crc32 = self._io.read_u4le()
        self._raw_contents = self._io.read_bytes_full()
        io = KaitaiStream(BytesIO(self._raw_contents))
        self.contents = self._root.Cache(io, self, self._root)

    class Alignment(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.alignment = self._io.read_bytes(((self._io.pos() + 3) & (~3 - self._io.pos())))


    class String(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.length = self._io.read_u4le()
            self.str = (KaitaiStream.bytes_terminate(self._io.read_bytes(self.length), 0, False)).decode(u"ascii")
            self.alignment = self._root.Alignment(self._io, self, self._root)


    class Cache(KaitaiStruct):
        """
        .. seealso::
           Source - https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/BlobCache.cpp
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.signature = self._io.ensure_fixed_contents(b"\x24\x62\x42\x5F")
            self.version = self._io.read_u4le()
            self.device_version = self._io.read_u4le()
            self.count_of_entries = self._io.read_u4le()
            if self.version >= 3:
                self.build_id = self._root.String(self._io, self, self._root)

            self.entries = [None] * (self.count_of_entries)
            for i in range(self.count_of_entries):
                self.entries[i] = self._root.Cache.Entry(self._io, self, self._root)


        class Entry(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.key_size = self._io.read_u4le()
                self.value_size = self._io.read_u4le()
                self.key = self._io.read_bytes(self.key_size)
                self.value = self._io.read_bytes(self.value_size)
                self.alignment = self._root.Alignment(self._io, self, self._root)




