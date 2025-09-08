# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class AndroidNanoappHeader(KaitaiStruct):
    """
    .. seealso::
       Source - https://android.googlesource.com/platform/system/chre/+/a7ff61b9/build/build_template.mk#130
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(AndroidNanoappHeader, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.header_version = self._io.read_u4le()
        if not self.header_version == 1:
            raise kaitaistruct.ValidationNotEqualError(1, self.header_version, self._io, u"/seq/0")
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\x4E\x41\x4E\x4F":
            raise kaitaistruct.ValidationNotEqualError(b"\x4E\x41\x4E\x4F", self.magic, self._io, u"/seq/1")
        self.app_id = self._io.read_u8le()
        self.app_version = self._io.read_u4le()
        self.flags = self._io.read_u4le()
        self.hub_type = self._io.read_u8le()
        self.chre_api_major_version = self._io.read_u1()
        self.chre_api_minor_version = self._io.read_u1()
        self.reserved = self._io.read_bytes(6)
        if not self.reserved == b"\x00\x00\x00\x00\x00\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00\x00\x00", self.reserved, self._io, u"/seq/8")


    def _fetch_instances(self):
        pass

    @property
    def is_encrypted(self):
        if hasattr(self, '_m_is_encrypted'):
            return self._m_is_encrypted

        self._m_is_encrypted = self.flags & 2 != 0
        return getattr(self, '_m_is_encrypted', None)

    @property
    def is_signed(self):
        if hasattr(self, '_m_is_signed'):
            return self._m_is_signed

        self._m_is_signed = self.flags & 1 != 0
        return getattr(self, '_m_is_signed', None)

    @property
    def is_tcm_capable(self):
        if hasattr(self, '_m_is_tcm_capable'):
            return self._m_is_tcm_capable

        self._m_is_tcm_capable = self.flags & 4 != 0
        return getattr(self, '_m_is_tcm_capable', None)


