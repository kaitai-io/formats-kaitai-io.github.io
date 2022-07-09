# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class AndroidImg(KaitaiStruct):
    """
    .. seealso::
       Source - https://source.android.com/devices/bootloader/boot-image-header
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.magic = self._io.read_bytes(8)
        if not self.magic == b"\x41\x4E\x44\x52\x4F\x49\x44\x21":
            raise kaitaistruct.ValidationNotEqualError(b"\x41\x4E\x44\x52\x4F\x49\x44\x21", self.magic, self._io, u"/seq/0")
        self.kernel = AndroidImg.Load(self._io, self, self._root)
        self.ramdisk = AndroidImg.Load(self._io, self, self._root)
        self.second = AndroidImg.Load(self._io, self, self._root)
        self.tags_load = self._io.read_u4le()
        self.page_size = self._io.read_u4le()
        self.header_version = self._io.read_u4le()
        self.os_version = AndroidImg.OsVersion(self._io, self, self._root)
        self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(16), 0, False)).decode(u"ASCII")
        self.cmdline = (KaitaiStream.bytes_terminate(self._io.read_bytes(512), 0, False)).decode(u"ASCII")
        self.sha = self._io.read_bytes(32)
        self.extra_cmdline = (KaitaiStream.bytes_terminate(self._io.read_bytes(1024), 0, False)).decode(u"ASCII")
        if self.header_version > 0:
            self.recovery_dtbo = AndroidImg.SizeOffset(self._io, self, self._root)

        if self.header_version > 0:
            self.boot_header_size = self._io.read_u4le()

        if self.header_version > 1:
            self.dtb = AndroidImg.LoadLong(self._io, self, self._root)


    class Load(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.size = self._io.read_u4le()
            self.addr = self._io.read_u4le()


    class LoadLong(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.size = self._io.read_u4le()
            self.addr = self._io.read_u8le()


    class SizeOffset(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.size = self._io.read_u4le()
            self.offset = self._io.read_u8le()


    class OsVersion(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.version = self._io.read_u4le()

        @property
        def month(self):
            if hasattr(self, '_m_month'):
                return self._m_month

            self._m_month = (self.version & 15)
            return getattr(self, '_m_month', None)

        @property
        def patch(self):
            if hasattr(self, '_m_patch'):
                return self._m_patch

            self._m_patch = ((self.version >> 11) & 127)
            return getattr(self, '_m_patch', None)

        @property
        def year(self):
            if hasattr(self, '_m_year'):
                return self._m_year

            self._m_year = (((self.version >> 4) & 127) + 2000)
            return getattr(self, '_m_year', None)

        @property
        def major(self):
            if hasattr(self, '_m_major'):
                return self._m_major

            self._m_major = ((self.version >> 25) & 127)
            return getattr(self, '_m_major', None)

        @property
        def minor(self):
            if hasattr(self, '_m_minor'):
                return self._m_minor

            self._m_minor = ((self.version >> 18) & 127)
            return getattr(self, '_m_minor', None)


    @property
    def kernel_img(self):
        if hasattr(self, '_m_kernel_img'):
            return self._m_kernel_img

        _pos = self._io.pos()
        self._io.seek(self.page_size)
        self._m_kernel_img = self._io.read_bytes(self.kernel.size)
        self._io.seek(_pos)
        return getattr(self, '_m_kernel_img', None)

    @property
    def tags_offset(self):
        """tags offset from base."""
        if hasattr(self, '_m_tags_offset'):
            return self._m_tags_offset

        self._m_tags_offset = (self.tags_load - self.base)
        return getattr(self, '_m_tags_offset', None)

    @property
    def ramdisk_offset(self):
        """ramdisk offset from base."""
        if hasattr(self, '_m_ramdisk_offset'):
            return self._m_ramdisk_offset

        self._m_ramdisk_offset = ((self.ramdisk.addr - self.base) if self.ramdisk.addr > 0 else 0)
        return getattr(self, '_m_ramdisk_offset', None)

    @property
    def second_offset(self):
        """2nd bootloader offset from base."""
        if hasattr(self, '_m_second_offset'):
            return self._m_second_offset

        self._m_second_offset = ((self.second.addr - self.base) if self.second.addr > 0 else 0)
        return getattr(self, '_m_second_offset', None)

    @property
    def kernel_offset(self):
        """kernel offset from base."""
        if hasattr(self, '_m_kernel_offset'):
            return self._m_kernel_offset

        self._m_kernel_offset = (self.kernel.addr - self.base)
        return getattr(self, '_m_kernel_offset', None)

    @property
    def dtb_offset(self):
        """dtb offset from base."""
        if hasattr(self, '_m_dtb_offset'):
            return self._m_dtb_offset

        if self.header_version > 1:
            self._m_dtb_offset = ((self.dtb.addr - self.base) if self.dtb.addr > 0 else 0)

        return getattr(self, '_m_dtb_offset', None)

    @property
    def dtb_img(self):
        if hasattr(self, '_m_dtb_img'):
            return self._m_dtb_img

        if  ((self.header_version > 1) and (self.dtb.size > 0)) :
            _pos = self._io.pos()
            self._io.seek((((((((self.page_size + self.kernel.size) + self.ramdisk.size) + self.second.size) + self.recovery_dtbo.size) + self.page_size) - 1) // self.page_size * self.page_size))
            self._m_dtb_img = self._io.read_bytes(self.dtb.size)
            self._io.seek(_pos)

        return getattr(self, '_m_dtb_img', None)

    @property
    def ramdisk_img(self):
        if hasattr(self, '_m_ramdisk_img'):
            return self._m_ramdisk_img

        if self.ramdisk.size > 0:
            _pos = self._io.pos()
            self._io.seek(((((self.page_size + self.kernel.size) + self.page_size) - 1) // self.page_size * self.page_size))
            self._m_ramdisk_img = self._io.read_bytes(self.ramdisk.size)
            self._io.seek(_pos)

        return getattr(self, '_m_ramdisk_img', None)

    @property
    def recovery_dtbo_img(self):
        if hasattr(self, '_m_recovery_dtbo_img'):
            return self._m_recovery_dtbo_img

        if  ((self.header_version > 0) and (self.recovery_dtbo.size > 0)) :
            _pos = self._io.pos()
            self._io.seek(self.recovery_dtbo.offset)
            self._m_recovery_dtbo_img = self._io.read_bytes(self.recovery_dtbo.size)
            self._io.seek(_pos)

        return getattr(self, '_m_recovery_dtbo_img', None)

    @property
    def second_img(self):
        if hasattr(self, '_m_second_img'):
            return self._m_second_img

        if self.second.size > 0:
            _pos = self._io.pos()
            self._io.seek((((((self.page_size + self.kernel.size) + self.ramdisk.size) + self.page_size) - 1) // self.page_size * self.page_size))
            self._m_second_img = self._io.read_bytes(self.second.size)
            self._io.seek(_pos)

        return getattr(self, '_m_second_img', None)

    @property
    def base(self):
        """base loading address."""
        if hasattr(self, '_m_base'):
            return self._m_base

        self._m_base = (self.kernel.addr - 32768)
        return getattr(self, '_m_base', None)


