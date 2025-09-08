# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class AndroidImg(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://source.android.com/docs/core/architecture/bootloader/boot-image-header
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(AndroidImg, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_dtb_img = False
        self.dtb_img__enabled = True
        self._should_write_kernel_img = False
        self.kernel_img__enabled = True
        self._should_write_ramdisk_img = False
        self.ramdisk_img__enabled = True
        self._should_write_recovery_dtbo_img = False
        self.recovery_dtbo_img__enabled = True
        self._should_write_second_img = False
        self.second_img__enabled = True

    def _read(self):
        self.magic = self._io.read_bytes(8)
        if not self.magic == b"\x41\x4E\x44\x52\x4F\x49\x44\x21":
            raise kaitaistruct.ValidationNotEqualError(b"\x41\x4E\x44\x52\x4F\x49\x44\x21", self.magic, self._io, u"/seq/0")
        self.kernel = AndroidImg.Load(self._io, self, self._root)
        self.kernel._read()
        self.ramdisk = AndroidImg.Load(self._io, self, self._root)
        self.ramdisk._read()
        self.second = AndroidImg.Load(self._io, self, self._root)
        self.second._read()
        self.tags_load = self._io.read_u4le()
        self.page_size = self._io.read_u4le()
        self.header_version = self._io.read_u4le()
        self.os_version = AndroidImg.OsVersion(self._io, self, self._root)
        self.os_version._read()
        self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(16), 0, False)).decode(u"ASCII")
        self.cmdline = (KaitaiStream.bytes_terminate(self._io.read_bytes(512), 0, False)).decode(u"ASCII")
        self.sha = self._io.read_bytes(32)
        self.extra_cmdline = (KaitaiStream.bytes_terminate(self._io.read_bytes(1024), 0, False)).decode(u"ASCII")
        if self.header_version > 0:
            pass
            self.recovery_dtbo = AndroidImg.SizeOffset(self._io, self, self._root)
            self.recovery_dtbo._read()

        if self.header_version > 0:
            pass
            self.boot_header_size = self._io.read_u4le()

        if self.header_version > 1:
            pass
            self.dtb = AndroidImg.LoadLong(self._io, self, self._root)
            self.dtb._read()

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.kernel._fetch_instances()
        self.ramdisk._fetch_instances()
        self.second._fetch_instances()
        self.os_version._fetch_instances()
        if self.header_version > 0:
            pass
            self.recovery_dtbo._fetch_instances()

        if self.header_version > 0:
            pass

        if self.header_version > 1:
            pass
            self.dtb._fetch_instances()

        _ = self.dtb_img
        if hasattr(self, '_m_dtb_img'):
            pass

        _ = self.kernel_img
        if hasattr(self, '_m_kernel_img'):
            pass

        _ = self.ramdisk_img
        if hasattr(self, '_m_ramdisk_img'):
            pass

        _ = self.recovery_dtbo_img
        if hasattr(self, '_m_recovery_dtbo_img'):
            pass

        _ = self.second_img
        if hasattr(self, '_m_second_img'):
            pass



    def _write__seq(self, io=None):
        super(AndroidImg, self)._write__seq(io)
        self._should_write_dtb_img = self.dtb_img__enabled
        self._should_write_kernel_img = self.kernel_img__enabled
        self._should_write_ramdisk_img = self.ramdisk_img__enabled
        self._should_write_recovery_dtbo_img = self.recovery_dtbo_img__enabled
        self._should_write_second_img = self.second_img__enabled
        self._io.write_bytes(self.magic)
        self.kernel._write__seq(self._io)
        self.ramdisk._write__seq(self._io)
        self.second._write__seq(self._io)
        self._io.write_u4le(self.tags_load)
        self._io.write_u4le(self.page_size)
        self._io.write_u4le(self.header_version)
        self.os_version._write__seq(self._io)
        self._io.write_bytes_limit((self.name).encode(u"ASCII"), 16, 0, 0)
        self._io.write_bytes_limit((self.cmdline).encode(u"ASCII"), 512, 0, 0)
        self._io.write_bytes(self.sha)
        self._io.write_bytes_limit((self.extra_cmdline).encode(u"ASCII"), 1024, 0, 0)
        if self.header_version > 0:
            pass
            self.recovery_dtbo._write__seq(self._io)

        if self.header_version > 0:
            pass
            self._io.write_u4le(self.boot_header_size)

        if self.header_version > 1:
            pass
            self.dtb._write__seq(self._io)



    def _check(self):
        if len(self.magic) != 8:
            raise kaitaistruct.ConsistencyError(u"magic", 8, len(self.magic))
        if not self.magic == b"\x41\x4E\x44\x52\x4F\x49\x44\x21":
            raise kaitaistruct.ValidationNotEqualError(b"\x41\x4E\x44\x52\x4F\x49\x44\x21", self.magic, None, u"/seq/0")
        if self.kernel._root != self._root:
            raise kaitaistruct.ConsistencyError(u"kernel", self._root, self.kernel._root)
        if self.kernel._parent != self:
            raise kaitaistruct.ConsistencyError(u"kernel", self, self.kernel._parent)
        if self.ramdisk._root != self._root:
            raise kaitaistruct.ConsistencyError(u"ramdisk", self._root, self.ramdisk._root)
        if self.ramdisk._parent != self:
            raise kaitaistruct.ConsistencyError(u"ramdisk", self, self.ramdisk._parent)
        if self.second._root != self._root:
            raise kaitaistruct.ConsistencyError(u"second", self._root, self.second._root)
        if self.second._parent != self:
            raise kaitaistruct.ConsistencyError(u"second", self, self.second._parent)
        if self.os_version._root != self._root:
            raise kaitaistruct.ConsistencyError(u"os_version", self._root, self.os_version._root)
        if self.os_version._parent != self:
            raise kaitaistruct.ConsistencyError(u"os_version", self, self.os_version._parent)
        if len((self.name).encode(u"ASCII")) > 16:
            raise kaitaistruct.ConsistencyError(u"name", 16, len((self.name).encode(u"ASCII")))
        if KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0) != -1:
            raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0))
        if len((self.cmdline).encode(u"ASCII")) > 512:
            raise kaitaistruct.ConsistencyError(u"cmdline", 512, len((self.cmdline).encode(u"ASCII")))
        if KaitaiStream.byte_array_index_of((self.cmdline).encode(u"ASCII"), 0) != -1:
            raise kaitaistruct.ConsistencyError(u"cmdline", -1, KaitaiStream.byte_array_index_of((self.cmdline).encode(u"ASCII"), 0))
        if len(self.sha) != 32:
            raise kaitaistruct.ConsistencyError(u"sha", 32, len(self.sha))
        if len((self.extra_cmdline).encode(u"ASCII")) > 1024:
            raise kaitaistruct.ConsistencyError(u"extra_cmdline", 1024, len((self.extra_cmdline).encode(u"ASCII")))
        if KaitaiStream.byte_array_index_of((self.extra_cmdline).encode(u"ASCII"), 0) != -1:
            raise kaitaistruct.ConsistencyError(u"extra_cmdline", -1, KaitaiStream.byte_array_index_of((self.extra_cmdline).encode(u"ASCII"), 0))
        if self.header_version > 0:
            pass
            if self.recovery_dtbo._root != self._root:
                raise kaitaistruct.ConsistencyError(u"recovery_dtbo", self._root, self.recovery_dtbo._root)
            if self.recovery_dtbo._parent != self:
                raise kaitaistruct.ConsistencyError(u"recovery_dtbo", self, self.recovery_dtbo._parent)

        if self.header_version > 0:
            pass

        if self.header_version > 1:
            pass
            if self.dtb._root != self._root:
                raise kaitaistruct.ConsistencyError(u"dtb", self._root, self.dtb._root)
            if self.dtb._parent != self:
                raise kaitaistruct.ConsistencyError(u"dtb", self, self.dtb._parent)

        if self.dtb_img__enabled:
            pass
            if  ((self.header_version > 1) and (self.dtb.size > 0)) :
                pass
                if len(self._m_dtb_img) != self.dtb.size:
                    raise kaitaistruct.ConsistencyError(u"dtb_img", self.dtb.size, len(self._m_dtb_img))


        if self.kernel_img__enabled:
            pass
            if len(self._m_kernel_img) != self.kernel.size:
                raise kaitaistruct.ConsistencyError(u"kernel_img", self.kernel.size, len(self._m_kernel_img))

        if self.ramdisk_img__enabled:
            pass
            if self.ramdisk.size > 0:
                pass
                if len(self._m_ramdisk_img) != self.ramdisk.size:
                    raise kaitaistruct.ConsistencyError(u"ramdisk_img", self.ramdisk.size, len(self._m_ramdisk_img))


        if self.recovery_dtbo_img__enabled:
            pass
            if  ((self.header_version > 0) and (self.recovery_dtbo.size > 0)) :
                pass
                if len(self._m_recovery_dtbo_img) != self.recovery_dtbo.size:
                    raise kaitaistruct.ConsistencyError(u"recovery_dtbo_img", self.recovery_dtbo.size, len(self._m_recovery_dtbo_img))


        if self.second_img__enabled:
            pass
            if self.second.size > 0:
                pass
                if len(self._m_second_img) != self.second.size:
                    raise kaitaistruct.ConsistencyError(u"second_img", self.second.size, len(self._m_second_img))


        self._dirty = False

    class Load(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidImg.Load, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.size = self._io.read_u4le()
            self.addr = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(AndroidImg.Load, self)._write__seq(io)
            self._io.write_u4le(self.size)
            self._io.write_u4le(self.addr)


        def _check(self):
            self._dirty = False


    class LoadLong(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidImg.LoadLong, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.size = self._io.read_u4le()
            self.addr = self._io.read_u8le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(AndroidImg.LoadLong, self)._write__seq(io)
            self._io.write_u4le(self.size)
            self._io.write_u8le(self.addr)


        def _check(self):
            self._dirty = False


    class OsVersion(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidImg.OsVersion, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.version = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(AndroidImg.OsVersion, self)._write__seq(io)
            self._io.write_u4le(self.version)


        def _check(self):
            self._dirty = False

        @property
        def major(self):
            if hasattr(self, '_m_major'):
                return self._m_major

            self._m_major = self.version >> 25 & 127
            return getattr(self, '_m_major', None)

        def _invalidate_major(self):
            del self._m_major
        @property
        def minor(self):
            if hasattr(self, '_m_minor'):
                return self._m_minor

            self._m_minor = self.version >> 18 & 127
            return getattr(self, '_m_minor', None)

        def _invalidate_minor(self):
            del self._m_minor
        @property
        def month(self):
            if hasattr(self, '_m_month'):
                return self._m_month

            self._m_month = self.version & 15
            return getattr(self, '_m_month', None)

        def _invalidate_month(self):
            del self._m_month
        @property
        def patch(self):
            if hasattr(self, '_m_patch'):
                return self._m_patch

            self._m_patch = self.version >> 11 & 127
            return getattr(self, '_m_patch', None)

        def _invalidate_patch(self):
            del self._m_patch
        @property
        def year(self):
            if hasattr(self, '_m_year'):
                return self._m_year

            self._m_year = (self.version >> 4 & 127) + 2000
            return getattr(self, '_m_year', None)

        def _invalidate_year(self):
            del self._m_year

    class SizeOffset(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidImg.SizeOffset, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.size = self._io.read_u4le()
            self.offset = self._io.read_u8le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(AndroidImg.SizeOffset, self)._write__seq(io)
            self._io.write_u4le(self.size)
            self._io.write_u8le(self.offset)


        def _check(self):
            self._dirty = False


    @property
    def base(self):
        """base loading address."""
        if hasattr(self, '_m_base'):
            return self._m_base

        self._m_base = self.kernel.addr - 32768
        return getattr(self, '_m_base', None)

    def _invalidate_base(self):
        del self._m_base
    @property
    def dtb_img(self):
        if self._should_write_dtb_img:
            self._write_dtb_img()
        if hasattr(self, '_m_dtb_img'):
            return self._m_dtb_img

        if not self.dtb_img__enabled:
            return None

        if  ((self.header_version > 1) and (self.dtb.size > 0)) :
            pass
            _pos = self._io.pos()
            self._io.seek((((((((self.page_size + self.kernel.size) + self.ramdisk.size) + self.second.size) + self.recovery_dtbo.size) + self.page_size) - 1) // self.page_size) * self.page_size)
            self._m_dtb_img = self._io.read_bytes(self.dtb.size)
            self._io.seek(_pos)

        return getattr(self, '_m_dtb_img', None)

    @dtb_img.setter
    def dtb_img(self, v):
        self._dirty = True
        self._m_dtb_img = v

    def _write_dtb_img(self):
        self._should_write_dtb_img = False
        if  ((self.header_version > 1) and (self.dtb.size > 0)) :
            pass
            _pos = self._io.pos()
            self._io.seek((((((((self.page_size + self.kernel.size) + self.ramdisk.size) + self.second.size) + self.recovery_dtbo.size) + self.page_size) - 1) // self.page_size) * self.page_size)
            self._io.write_bytes(self._m_dtb_img)
            self._io.seek(_pos)


    @property
    def dtb_offset(self):
        """dtb offset from base."""
        if hasattr(self, '_m_dtb_offset'):
            return self._m_dtb_offset

        if self.header_version > 1:
            pass
            self._m_dtb_offset = (self.dtb.addr - self.base if self.dtb.addr > 0 else 0)

        return getattr(self, '_m_dtb_offset', None)

    def _invalidate_dtb_offset(self):
        del self._m_dtb_offset
    @property
    def kernel_img(self):
        if self._should_write_kernel_img:
            self._write_kernel_img()
        if hasattr(self, '_m_kernel_img'):
            return self._m_kernel_img

        if not self.kernel_img__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.page_size)
        self._m_kernel_img = self._io.read_bytes(self.kernel.size)
        self._io.seek(_pos)
        return getattr(self, '_m_kernel_img', None)

    @kernel_img.setter
    def kernel_img(self, v):
        self._dirty = True
        self._m_kernel_img = v

    def _write_kernel_img(self):
        self._should_write_kernel_img = False
        _pos = self._io.pos()
        self._io.seek(self.page_size)
        self._io.write_bytes(self._m_kernel_img)
        self._io.seek(_pos)

    @property
    def kernel_offset(self):
        """kernel offset from base."""
        if hasattr(self, '_m_kernel_offset'):
            return self._m_kernel_offset

        self._m_kernel_offset = self.kernel.addr - self.base
        return getattr(self, '_m_kernel_offset', None)

    def _invalidate_kernel_offset(self):
        del self._m_kernel_offset
    @property
    def ramdisk_img(self):
        if self._should_write_ramdisk_img:
            self._write_ramdisk_img()
        if hasattr(self, '_m_ramdisk_img'):
            return self._m_ramdisk_img

        if not self.ramdisk_img__enabled:
            return None

        if self.ramdisk.size > 0:
            pass
            _pos = self._io.pos()
            self._io.seek(((((self.page_size + self.kernel.size) + self.page_size) - 1) // self.page_size) * self.page_size)
            self._m_ramdisk_img = self._io.read_bytes(self.ramdisk.size)
            self._io.seek(_pos)

        return getattr(self, '_m_ramdisk_img', None)

    @ramdisk_img.setter
    def ramdisk_img(self, v):
        self._dirty = True
        self._m_ramdisk_img = v

    def _write_ramdisk_img(self):
        self._should_write_ramdisk_img = False
        if self.ramdisk.size > 0:
            pass
            _pos = self._io.pos()
            self._io.seek(((((self.page_size + self.kernel.size) + self.page_size) - 1) // self.page_size) * self.page_size)
            self._io.write_bytes(self._m_ramdisk_img)
            self._io.seek(_pos)


    @property
    def ramdisk_offset(self):
        """ramdisk offset from base."""
        if hasattr(self, '_m_ramdisk_offset'):
            return self._m_ramdisk_offset

        self._m_ramdisk_offset = (self.ramdisk.addr - self.base if self.ramdisk.addr > 0 else 0)
        return getattr(self, '_m_ramdisk_offset', None)

    def _invalidate_ramdisk_offset(self):
        del self._m_ramdisk_offset
    @property
    def recovery_dtbo_img(self):
        if self._should_write_recovery_dtbo_img:
            self._write_recovery_dtbo_img()
        if hasattr(self, '_m_recovery_dtbo_img'):
            return self._m_recovery_dtbo_img

        if not self.recovery_dtbo_img__enabled:
            return None

        if  ((self.header_version > 0) and (self.recovery_dtbo.size > 0)) :
            pass
            _pos = self._io.pos()
            self._io.seek(self.recovery_dtbo.offset)
            self._m_recovery_dtbo_img = self._io.read_bytes(self.recovery_dtbo.size)
            self._io.seek(_pos)

        return getattr(self, '_m_recovery_dtbo_img', None)

    @recovery_dtbo_img.setter
    def recovery_dtbo_img(self, v):
        self._dirty = True
        self._m_recovery_dtbo_img = v

    def _write_recovery_dtbo_img(self):
        self._should_write_recovery_dtbo_img = False
        if  ((self.header_version > 0) and (self.recovery_dtbo.size > 0)) :
            pass
            _pos = self._io.pos()
            self._io.seek(self.recovery_dtbo.offset)
            self._io.write_bytes(self._m_recovery_dtbo_img)
            self._io.seek(_pos)


    @property
    def second_img(self):
        if self._should_write_second_img:
            self._write_second_img()
        if hasattr(self, '_m_second_img'):
            return self._m_second_img

        if not self.second_img__enabled:
            return None

        if self.second.size > 0:
            pass
            _pos = self._io.pos()
            self._io.seek((((((self.page_size + self.kernel.size) + self.ramdisk.size) + self.page_size) - 1) // self.page_size) * self.page_size)
            self._m_second_img = self._io.read_bytes(self.second.size)
            self._io.seek(_pos)

        return getattr(self, '_m_second_img', None)

    @second_img.setter
    def second_img(self, v):
        self._dirty = True
        self._m_second_img = v

    def _write_second_img(self):
        self._should_write_second_img = False
        if self.second.size > 0:
            pass
            _pos = self._io.pos()
            self._io.seek((((((self.page_size + self.kernel.size) + self.ramdisk.size) + self.page_size) - 1) // self.page_size) * self.page_size)
            self._io.write_bytes(self._m_second_img)
            self._io.seek(_pos)


    @property
    def second_offset(self):
        """2nd bootloader offset from base."""
        if hasattr(self, '_m_second_offset'):
            return self._m_second_offset

        self._m_second_offset = (self.second.addr - self.base if self.second.addr > 0 else 0)
        return getattr(self, '_m_second_offset', None)

    def _invalidate_second_offset(self):
        del self._m_second_offset
    @property
    def tags_offset(self):
        """tags offset from base."""
        if hasattr(self, '_m_tags_offset'):
            return self._m_tags_offset

        self._m_tags_offset = self.tags_load - self.base
        return getattr(self, '_m_tags_offset', None)

    def _invalidate_tags_offset(self):
        del self._m_tags_offset

