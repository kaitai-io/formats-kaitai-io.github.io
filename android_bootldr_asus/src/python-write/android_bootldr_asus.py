# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class AndroidBootldrAsus(ReadWriteKaitaiStruct):
    """A bootloader image which only seems to have been used on a few ASUS
    devices. The encoding is ASCII, because the `releasetools.py` script
    is written using Python 2, where the default encoding is ASCII.
    
    A test file can be found in the firmware files for the "fugu" device,
    which can be downloaded from <https://developers.google.com/android/images>
    
    .. seealso::
       Source - https://android.googlesource.com/device/asus/fugu/+/android-8.1.0_r5/releasetools.py
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(AndroidBootldrAsus, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = self._io.read_bytes(8)
        if not self.magic == b"\x42\x4F\x4F\x54\x4C\x44\x52\x21":
            raise kaitaistruct.ValidationNotEqualError(b"\x42\x4F\x4F\x54\x4C\x44\x52\x21", self.magic, self._io, u"/seq/0")
        self.revision = self._io.read_u2le()
        if not self.revision >= 2:
            raise kaitaistruct.ValidationLessThanError(2, self.revision, self._io, u"/seq/1")
        self.reserved1 = self._io.read_u2le()
        self.reserved2 = self._io.read_u4le()
        self.images = []
        for i in range(3):
            _t_images = AndroidBootldrAsus.Image(self._io, self, self._root)
            try:
                _t_images._read()
            finally:
                self.images.append(_t_images)

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.images)):
            pass
            self.images[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(AndroidBootldrAsus, self)._write__seq(io)
        self._io.write_bytes(self.magic)
        self._io.write_u2le(self.revision)
        self._io.write_u2le(self.reserved1)
        self._io.write_u4le(self.reserved2)
        for i in range(len(self.images)):
            pass
            self.images[i]._write__seq(self._io)



    def _check(self):
        if len(self.magic) != 8:
            raise kaitaistruct.ConsistencyError(u"magic", 8, len(self.magic))
        if not self.magic == b"\x42\x4F\x4F\x54\x4C\x44\x52\x21":
            raise kaitaistruct.ValidationNotEqualError(b"\x42\x4F\x4F\x54\x4C\x44\x52\x21", self.magic, None, u"/seq/0")
        if not self.revision >= 2:
            raise kaitaistruct.ValidationLessThanError(2, self.revision, None, u"/seq/1")
        if len(self.images) != 3:
            raise kaitaistruct.ConsistencyError(u"images", 3, len(self.images))
        for i in range(len(self.images)):
            pass
            if self.images[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"images", self._root, self.images[i]._root)
            if self.images[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"images", self, self.images[i]._parent)

        self._dirty = False

    class Image(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidBootldrAsus.Image, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.chunk_id = (self._io.read_bytes(8)).decode(u"ASCII")
            if not  ((self.chunk_id == u"IFWI!!!!") or (self.chunk_id == u"DROIDBT!") or (self.chunk_id == u"SPLASHS!")) :
                raise kaitaistruct.ValidationNotAnyOfError(self.chunk_id, self._io, u"/types/image/seq/0")
            self.len_body = self._io.read_u4le()
            self.flags = self._io.read_u1()
            _ = self.flags
            if not _ & 1 != 0:
                raise kaitaistruct.ValidationExprError(self.flags, self._io, u"/types/image/seq/2")
            self.reserved1 = self._io.read_u1()
            self.reserved2 = self._io.read_u1()
            self.reserved3 = self._io.read_u1()
            self.body = self._io.read_bytes(self.len_body)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(AndroidBootldrAsus.Image, self)._write__seq(io)
            self._io.write_bytes((self.chunk_id).encode(u"ASCII"))
            self._io.write_u4le(self.len_body)
            self._io.write_u1(self.flags)
            self._io.write_u1(self.reserved1)
            self._io.write_u1(self.reserved2)
            self._io.write_u1(self.reserved3)
            self._io.write_bytes(self.body)


        def _check(self):
            if len((self.chunk_id).encode(u"ASCII")) != 8:
                raise kaitaistruct.ConsistencyError(u"chunk_id", 8, len((self.chunk_id).encode(u"ASCII")))
            if not  ((self.chunk_id == u"IFWI!!!!") or (self.chunk_id == u"DROIDBT!") or (self.chunk_id == u"SPLASHS!")) :
                raise kaitaistruct.ValidationNotAnyOfError(self.chunk_id, None, u"/types/image/seq/0")
            _ = self.flags
            if not _ & 1 != 0:
                raise kaitaistruct.ValidationExprError(self.flags, None, u"/types/image/seq/2")
            if len(self.body) != self.len_body:
                raise kaitaistruct.ConsistencyError(u"body", self.len_body, len(self.body))
            self._dirty = False

        @property
        def file_name(self):
            if hasattr(self, '_m_file_name'):
                return self._m_file_name

            self._m_file_name = (u"ifwi.bin" if self.chunk_id == u"IFWI!!!!" else (u"droidboot.img" if self.chunk_id == u"DROIDBT!" else (u"splashscreen.img" if self.chunk_id == u"SPLASHS!" else u"")))
            return getattr(self, '_m_file_name', None)

        def _invalidate_file_name(self):
            del self._m_file_name


