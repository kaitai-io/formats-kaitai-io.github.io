# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Uimage(KaitaiStruct):
    """The new uImage format allows more flexibility in handling images of various
    types (kernel, ramdisk, etc.), it also enhances integrity protection of images
    with sha1 and md5 checksums.
    
    .. seealso::
       Source - https://github.com/EmcraftSystems/u-boot/blob/master/include/image.h
    """

    class UimageOs(Enum):
        invalid = 0
        openbsd = 1
        netbsd = 2
        freebsd = 3
        bsd4_4 = 4
        linux = 5
        svr4 = 6
        esix = 7
        solaris = 8
        irix = 9
        sco = 10
        dell = 11
        ncr = 12
        lynxos = 13
        vxworks = 14
        psos = 15
        qnx = 16
        u_boot = 17
        rtems = 18
        artos = 19
        unity = 20
        integrity = 21

    class UimageArch(Enum):
        invalid = 0
        alpha = 1
        arm = 2
        i386 = 3
        ia64 = 4
        mips = 5
        mips64 = 6
        ppc = 7
        s390 = 8
        sh = 9
        sparc = 10
        sparc64 = 11
        m68k = 12
        nios = 13
        microblaze = 14
        nios2 = 15
        blackfin = 16
        avr32 = 17
        st200 = 18

    class UimageComp(Enum):
        none = 0
        gzip = 1
        bzip2 = 2
        lzma = 3
        lzo = 4

    class UimageType(Enum):
        invalid = 0
        standalone = 1
        kernel = 2
        ramdisk = 3
        multi = 4
        firmware = 5
        script = 6
        filesystem = 7
        flatdt = 8
        kwbimage = 9
        imximage = 10
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.header = self._root.Uheader(self._io, self, self._root)
        self.data = self._io.read_bytes(self.header.len_image)

    class Uheader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.ensure_fixed_contents(b"\x27\x05\x19\x56")
            self.header_crc = self._io.read_u4be()
            self.timestamp = self._io.read_u4be()
            self.len_image = self._io.read_u4be()
            self.load_address = self._io.read_u4be()
            self.entry_address = self._io.read_u4be()
            self.data_crc = self._io.read_u4be()
            self.os_type = KaitaiStream.resolve_enum(self._root.UimageOs, self._io.read_u1())
            self.architecture = KaitaiStream.resolve_enum(self._root.UimageArch, self._io.read_u1())
            self.image_type = KaitaiStream.resolve_enum(self._root.UimageType, self._io.read_u1())
            self.compression_type = KaitaiStream.resolve_enum(self._root.UimageComp, self._io.read_u1())
            self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(32), 0, False)).decode(u"UTF-8")



