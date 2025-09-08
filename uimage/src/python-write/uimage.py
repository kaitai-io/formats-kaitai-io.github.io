# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Uimage(ReadWriteKaitaiStruct):
    """The new uImage format allows more flexibility in handling images of various
    types (kernel, ramdisk, etc.), it also enhances integrity protection of images
    with sha1 and md5 checksums.
    
    .. seealso::
       Source - https://source.denx.de/u-boot/u-boot/-/raw/e4dba4ba6f/include/image.h
    """

    class UimageArch(IntEnum):
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

    class UimageComp(IntEnum):
        none = 0
        gzip = 1
        bzip2 = 2
        lzma = 3
        lzo = 4
        lz4 = 5
        zstd = 6

    class UimageOs(IntEnum):
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

    class UimageType(IntEnum):
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
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Uimage, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header = Uimage.Uheader(self._io, self, self._root)
        self.header._read()
        self.data = self._io.read_bytes(self.header.len_image)
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()


    def _write__seq(self, io=None):
        super(Uimage, self)._write__seq(io)
        self.header._write__seq(self._io)
        self._io.write_bytes(self.data)


    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if len(self.data) != self.header.len_image:
            raise kaitaistruct.ConsistencyError(u"data", self.header.len_image, len(self.data))
        self._dirty = False

    class Uheader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Uimage.Uheader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

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
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Uimage.Uheader, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u4be(self.header_crc)
            self._io.write_u4be(self.timestamp)
            self._io.write_u4be(self.len_image)
            self._io.write_u4be(self.load_address)
            self._io.write_u4be(self.entry_address)
            self._io.write_u4be(self.data_crc)
            self._io.write_u1(int(self.os_type))
            self._io.write_u1(int(self.architecture))
            self._io.write_u1(int(self.image_type))
            self._io.write_u1(int(self.compression_type))
            self._io.write_bytes_limit((self.name).encode(u"UTF-8"), 32, 0, 0)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x27\x05\x19\x56":
                raise kaitaistruct.ValidationNotEqualError(b"\x27\x05\x19\x56", self.magic, None, u"/types/uheader/seq/0")
            if len((self.name).encode(u"UTF-8")) > 32:
                raise kaitaistruct.ConsistencyError(u"name", 32, len((self.name).encode(u"UTF-8")))
            if KaitaiStream.byte_array_index_of((self.name).encode(u"UTF-8"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self.name).encode(u"UTF-8"), 0))
            self._dirty = False



