# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if parse_version(kaitaistruct.__version__) < parse_version('0.9'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class AndroidAsusBootldr(KaitaiStruct):
    """A bootloader image which only seems to have been used on a few ASUS
    devices. The encoding is ASCII, because the `releasetools.py` script
    is written using Python 2, where the default encoding is ASCII.
    
    A test file can be found in the firmware files for the "fugu" device,
    which can be downloaded from <https://developers.google.com/android/images>
    
    .. seealso::
       Source - https://android.googlesource.com/device/asus/fugu/+/android-8.1.0_r5/releasetools.py
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.magic = self._io.read_bytes(8)
        if not self.magic == b"\x42\x4F\x4F\x54\x4C\x44\x52\x21":
            raise kaitaistruct.ValidationNotEqualError(b"\x42\x4F\x4F\x54\x4C\x44\x52\x21", self.magic, self._io, u"/seq/0")
        self.revision = self._io.read_u2le()
        if not self.revision >= 2:
            raise kaitaistruct.ValidationLessThanError(2, self.revision, self._io, u"/seq/1")
        self.reserved1 = self._io.read_u2le()
        self.reserved2 = self._io.read_u4le()
        self.images = [None] * (3)
        for i in range(3):
            self.images[i] = AndroidAsusBootldr.Image(self._io, self, self._root)


    class Image(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.chunk_id = (self._io.read_bytes(8)).decode(u"ASCII")
            if not  ((self.chunk_id == u"IFWI!!!!") or (self.chunk_id == u"DROIDBT!") or (self.chunk_id == u"SPLASHS!")) :
                raise kaitaistruct.ValidationNotAnyOfError(self.chunk_id, self._io, u"/types/image/seq/0")
            self.len_body = self._io.read_u4le()
            self.flags = self._io.read_u1()
            _ = self.flags
            if not (_ & 1) != 0:
                raise kaitaistruct.ValidationExprError(self.flags, self._io, u"/types/image/seq/2")
            self.reserved1 = self._io.read_u1()
            self.reserved2 = self._io.read_u1()
            self.reserved3 = self._io.read_u1()
            self.body = self._io.read_bytes(self.len_body)

        @property
        def file_name(self):
            if hasattr(self, '_m_file_name'):
                return self._m_file_name if hasattr(self, '_m_file_name') else None

            self._m_file_name = (u"ifwi.bin" if self.chunk_id == u"IFWI!!!!" else (u"droidboot.img" if self.chunk_id == u"DROIDBT!" else (u"splashscreen.img" if self.chunk_id == u"SPLASHS!" else u"")))
            return self._m_file_name if hasattr(self, '_m_file_name') else None



