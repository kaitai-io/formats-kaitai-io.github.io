# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if parse_version(kaitaistruct.__version__) < parse_version('0.9'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class AndroidBootldrHuawei(KaitaiStruct):
    """Format of `bootloader-*.img` files found in factory images of certain Android devices from Huawei:
    
    * Nexus 6P "angler": [sample][sample-angler] ([other samples][others-angler]),
      [releasetools.py](https://android.googlesource.com/device/huawei/angler/+/cf92cd8/releasetools.py#29)
    
    [sample-angler]: https://androidfilehost.com/?fid=11410963190603870158 "bootloader-angler-angler-03.84.img"
    [others-angler]: https://androidfilehost.com/?w=search&s=bootloader-angler&type=files
    
    All image versions can be found in factory images at
    <https://developers.google.com/android/images> for the specific device. To
    avoid having to download an entire ZIP archive when you only need one file
    from it, install [remotezip](https://github.com/gtsystem/python-remotezip) and
    use its [command line
    tool](https://github.com/gtsystem/python-remotezip#command-line-tool) to list
    members in the archive and then to download only the file you want.
    
    .. seealso::
       Source - https://android.googlesource.com/device/huawei/angler/+/673cfb9/releasetools.py
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.meta_header = AndroidBootldrHuawei.MetaHdr(self._io, self, self._root)
        self.header_ext = self._io.read_bytes((self.meta_header.len_meta_header - 76))
        self._raw_image_header = self._io.read_bytes(self.meta_header.len_image_header)
        _io__raw_image_header = KaitaiStream(BytesIO(self._raw_image_header))
        self.image_header = AndroidBootldrHuawei.ImageHdr(_io__raw_image_header, self, self._root)

    class MetaHdr(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x3C\xD6\x1A\xCE":
                raise kaitaistruct.ValidationNotEqualError(b"\x3C\xD6\x1A\xCE", self.magic, self._io, u"/types/meta_hdr/seq/0")
            self.version = AndroidBootldrHuawei.Version(self._io, self, self._root)
            self.image_version = (KaitaiStream.bytes_terminate(self._io.read_bytes(64), 0, False)).decode(u"ASCII")
            self.len_meta_header = self._io.read_u2le()
            self.len_image_header = self._io.read_u2le()


    class Version(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.major = self._io.read_u2le()
            self.minor = self._io.read_u2le()


    class ImageHdr(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                self.entries.append(AndroidBootldrHuawei.ImageHdrEntry(self._io, self, self._root))
                i += 1



    class ImageHdrEntry(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(72), 0, False)).decode(u"ASCII")
            self.ofs_body = self._io.read_u4le()
            self.len_body = self._io.read_u4le()

        @property
        def body(self):
            if hasattr(self, '_m_body'):
                return self._m_body if hasattr(self, '_m_body') else None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_body)
            self._m_body = io.read_bytes(self.len_body)
            io.seek(_pos)
            return self._m_body if hasattr(self, '_m_body') else None



