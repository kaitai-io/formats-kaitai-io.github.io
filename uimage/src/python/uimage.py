# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class Uimage(KaitaiStruct):
    """The new uImage format allows more flexibility in handling images of various
    types (kernel, ramdisk, etc.), it also enhances integrity protection of images
    with sha1 and md5 checksums.
    
    .. seealso::
       Source - https://source.denx.de/u-boot/u-boot/-/raw/e4dba4ba6f/include/image.h
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
        ose = 22
        plan9 = 23
        openrtos = 24
        arm_trusted_firmware = 25
        tee = 26
        opensbi = 27
        efi = 28

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
        sandbox = 19
        nds32 = 20
        openrisc = 21
        arm64 = 22
        arc = 23
        x86_64 = 24
        xtensa = 25
        riscv = 26

    class UimageComp(Enum):
        none = 0
        gzip = 1
        bzip2 = 2
        lzma = 3
        lzo = 4
        lz4 = 5
        zstd = 6

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
        ublimage = 11
        omapimage = 12
        aisimage = 13
        kernel_noload = 14
        pblimage = 15
        mxsimage = 16
        gpimage = 17
        atmelimage = 18
        socfpgaimage = 19
        x86_setup = 20
        lpc32xximage = 21
        loadable = 22
        rkimage = 23
        rksd = 24
        rkspi = 25
        zynqimage = 26
        zynqmpimage = 27
        zynqmpbif = 28
        fpga = 29
        vybridimage = 30
        tee = 31
        firmware_ivt = 32
        pmmc = 33
        stm32image = 34
        socfpgaimage_v1 = 35
        mtkimage = 36
        imx8mimage = 37
        imx8image = 38
        copro = 39
        sunxi_egon = 40
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.header = Uimage.Uheader(self._io, self, self._root)
        self.data = self._io.read_bytes(self.header.len_image)

    class Uheader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x27\x05\x19\x56":
                raise kaitaistruct.ValidationNotEqualError(b"\x27\x05\x19\x56", self.magic, self._io, u"/types/uheader/seq/0")
            self.header_crc = self._io.read_u4be()
            self.timestamp = self._io.read_u4be()
            self.len_image = self._io.read_u4be()
            self.load_address = self._io.read_u4be()
            self.entry_address = self._io.read_u4be()
            self.data_crc = self._io.read_u4be()
            self.os_type = KaitaiStream.resolve_enum(Uimage.UimageOs, self._io.read_u1())
            self.architecture = KaitaiStream.resolve_enum(Uimage.UimageArch, self._io.read_u1())
            self.image_type = KaitaiStream.resolve_enum(Uimage.UimageType, self._io.read_u1())
            self.compression_type = KaitaiStream.resolve_enum(Uimage.UimageComp, self._io.read_u1())
            self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(32), 0, False)).decode(u"UTF-8")



