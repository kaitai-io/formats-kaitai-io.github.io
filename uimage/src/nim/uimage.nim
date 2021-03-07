import kaitai_struct_nim_runtime
import options

type
  Uimage* = ref object of KaitaiStruct
    `header`*: Uimage_Uheader
    `data`*: seq[byte]
    `parent`*: KaitaiStruct
  Uimage_UimageOs* = enum
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
  Uimage_UimageArch* = enum
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
  Uimage_UimageComp* = enum
    none = 0
    gzip = 1
    bzip2 = 2
    lzma = 3
    lzo = 4
    lz4 = 5
    zstd = 6
  Uimage_UimageType* = enum
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
  Uimage_Uheader* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `headerCrc`*: uint32
    `timestamp`*: uint32
    `lenImage`*: uint32
    `loadAddress`*: uint32
    `entryAddress`*: uint32
    `dataCrc`*: uint32
    `osType`*: Uimage_UimageOs
    `architecture`*: Uimage_UimageArch
    `imageType`*: Uimage_UimageType
    `compressionType`*: Uimage_UimageComp
    `name`*: string
    `parent`*: Uimage

proc read*(_: typedesc[Uimage], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Uimage
proc read*(_: typedesc[Uimage_Uheader], io: KaitaiStream, root: KaitaiStruct, parent: Uimage): Uimage_Uheader



##[
The new uImage format allows more flexibility in handling images of various
types (kernel, ramdisk, etc.), it also enhances integrity protection of images
with sha1 and md5 checksums.

@see <a href="https://source.denx.de/u-boot/u-boot/-/raw/e4dba4b/include/image.h">Source</a>
]##
proc read*(_: typedesc[Uimage], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Uimage =
  template this: untyped = result
  this = new(Uimage)
  let root = if root == nil: cast[Uimage](this) else: cast[Uimage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = Uimage_Uheader.read(this.io, this.root, this)
  this.header = headerExpr
  let dataExpr = this.io.readBytes(int(this.header.lenImage))
  this.data = dataExpr

proc fromFile*(_: typedesc[Uimage], filename: string): Uimage =
  Uimage.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Uimage_Uheader], io: KaitaiStream, root: KaitaiStruct, parent: Uimage): Uimage_Uheader =
  template this: untyped = result
  this = new(Uimage_Uheader)
  let root = if root == nil: cast[Uimage](this) else: cast[Uimage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let headerCrcExpr = this.io.readU4be()
  this.headerCrc = headerCrcExpr
  let timestampExpr = this.io.readU4be()
  this.timestamp = timestampExpr
  let lenImageExpr = this.io.readU4be()
  this.lenImage = lenImageExpr
  let loadAddressExpr = this.io.readU4be()
  this.loadAddress = loadAddressExpr
  let entryAddressExpr = this.io.readU4be()
  this.entryAddress = entryAddressExpr
  let dataCrcExpr = this.io.readU4be()
  this.dataCrc = dataCrcExpr
  let osTypeExpr = Uimage_UimageOs(this.io.readU1())
  this.osType = osTypeExpr
  let architectureExpr = Uimage_UimageArch(this.io.readU1())
  this.architecture = architectureExpr
  let imageTypeExpr = Uimage_UimageType(this.io.readU1())
  this.imageType = imageTypeExpr
  let compressionTypeExpr = Uimage_UimageComp(this.io.readU1())
  this.compressionType = compressionTypeExpr
  let nameExpr = encode(this.io.readBytes(int(32)).bytesTerminate(0, false), "UTF-8")
  this.name = nameExpr

proc fromFile*(_: typedesc[Uimage_Uheader], filename: string): Uimage_Uheader =
  Uimage_Uheader.read(newKaitaiFileStream(filename), nil, nil)

