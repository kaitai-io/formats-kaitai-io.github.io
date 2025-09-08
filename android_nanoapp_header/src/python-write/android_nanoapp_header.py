# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class AndroidNanoappHeader(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://android.googlesource.com/platform/system/chre/+/a7ff61b9/build/build_template.mk#130
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(AndroidNanoappHeader, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

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
        self._dirty = False


    def _fetch_instances(self):
        pass


    def _write__seq(self, io=None):
        super(AndroidNanoappHeader, self)._write__seq(io)
        self._io.write_u4le(self.header_version)
        self._io.write_bytes(self.magic)
        self._io.write_u8le(self.app_id)
        self._io.write_u4le(self.app_version)
        self._io.write_u4le(self.flags)
        self._io.write_u8le(self.hub_type)
        self._io.write_u1(self.chre_api_major_version)
        self._io.write_u1(self.chre_api_minor_version)
        self._io.write_bytes(self.reserved)


    def _check(self):
        if not self.header_version == 1:
            raise kaitaistruct.ValidationNotEqualError(1, self.header_version, None, u"/seq/0")
        if len(self.magic) != 4:
            raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
        if not self.magic == b"\x4E\x41\x4E\x4F":
            raise kaitaistruct.ValidationNotEqualError(b"\x4E\x41\x4E\x4F", self.magic, None, u"/seq/1")
        if len(self.reserved) != 6:
            raise kaitaistruct.ConsistencyError(u"reserved", 6, len(self.reserved))
        if not self.reserved == b"\x00\x00\x00\x00\x00\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00\x00\x00", self.reserved, None, u"/seq/8")
        self._dirty = False

    @property
    def is_encrypted(self):
        if hasattr(self, '_m_is_encrypted'):
            return self._m_is_encrypted

        self._m_is_encrypted = self.flags & 2 != 0
        return getattr(self, '_m_is_encrypted', None)

    def _invalidate_is_encrypted(self):
        del self._m_is_encrypted
    @property
    def is_signed(self):
        if hasattr(self, '_m_is_signed'):
            return self._m_is_signed

        self._m_is_signed = self.flags & 1 != 0
        return getattr(self, '_m_is_signed', None)

    def _invalidate_is_signed(self):
        del self._m_is_signed
    @property
    def is_tcm_capable(self):
        if hasattr(self, '_m_is_tcm_capable'):
            return self._m_is_tcm_capable

        self._m_is_tcm_capable = self.flags & 4 != 0
        return getattr(self, '_m_is_tcm_capable', None)

    def _invalidate_is_tcm_capable(self):
        del self._m_is_tcm_capable

