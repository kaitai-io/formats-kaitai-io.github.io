import kaitai_struct_nim_runtime
import options

type
  UefiTe* = ref object of KaitaiStruct
    `teHdr`*: UefiTe_TeHeader
    `sections`*: seq[UefiTe_Section]
    `parent`*: KaitaiStruct
    `rawTeHdr`*: seq[byte]
  UefiTe_TeHeader* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `machine`*: UefiTe_TeHeader_MachineType
    `numSections`*: uint8
    `subsystem`*: UefiTe_TeHeader_SubsystemEnum
    `strippedSize`*: uint16
    `entryPointAddr`*: uint32
    `baseOfCode`*: uint32
    `imageBase`*: uint64
    `dataDirs`*: UefiTe_HeaderDataDirs
    `parent`*: UefiTe
  UefiTe_TeHeader_MachineType* = enum
    unknown = 0
    i386 = 332
    r4000 = 358
    wcemipsv2 = 361
    alpha = 388
    sh3 = 418
    sh3dsp = 419
    sh4 = 422
    sh5 = 424
    arm = 448
    thumb = 450
    armnt = 452
    am33 = 467
    powerpc = 496
    powerpcfp = 497
    ia64 = 512
    mips16 = 614
    mipsfpu = 870
    mipsfpu16 = 1126
    ebc = 3772
    riscv32 = 20530
    riscv64 = 20580
    riscv128 = 20776
    amd64 = 34404
    m32r = 36929
    arm64 = 43620
  UefiTe_TeHeader_SubsystemEnum* = enum
    unknown = 0
    native = 1
    windows_gui = 2
    windows_cui = 3
    posix_cui = 7
    windows_ce_gui = 9
    efi_application = 10
    efi_boot_service_driver = 11
    efi_runtime_driver = 12
    efi_rom = 13
    xbox = 14
    windows_boot_application = 16
  UefiTe_HeaderDataDirs* = ref object of KaitaiStruct
    `baseRelocationTable`*: UefiTe_DataDir
    `debug`*: UefiTe_DataDir
    `parent`*: UefiTe_TeHeader
  UefiTe_DataDir* = ref object of KaitaiStruct
    `virtualAddress`*: uint32
    `size`*: uint32
    `parent`*: UefiTe_HeaderDataDirs
  UefiTe_Section* = ref object of KaitaiStruct
    `name`*: string
    `virtualSize`*: uint32
    `virtualAddress`*: uint32
    `sizeOfRawData`*: uint32
    `pointerToRawData`*: uint32
    `pointerToRelocations`*: uint32
    `pointerToLinenumbers`*: uint32
    `numRelocations`*: uint16
    `numLinenumbers`*: uint16
    `characteristics`*: uint32
    `parent`*: UefiTe
    `bodyInst`*: seq[byte]

proc read*(_: typedesc[UefiTe], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UefiTe
proc read*(_: typedesc[UefiTe_TeHeader], io: KaitaiStream, root: KaitaiStruct, parent: UefiTe): UefiTe_TeHeader
proc read*(_: typedesc[UefiTe_HeaderDataDirs], io: KaitaiStream, root: KaitaiStruct, parent: UefiTe_TeHeader): UefiTe_HeaderDataDirs
proc read*(_: typedesc[UefiTe_DataDir], io: KaitaiStream, root: KaitaiStruct, parent: UefiTe_HeaderDataDirs): UefiTe_DataDir
proc read*(_: typedesc[UefiTe_Section], io: KaitaiStream, root: KaitaiStruct, parent: UefiTe): UefiTe_Section

proc body*(this: UefiTe_Section): seq[byte]


##[
This type of executables could be found inside the UEFI firmware. The UEFI
firmware is stored in SPI flash memory, which is a chip soldered on a
system’s motherboard. UEFI firmware is very modular: it usually contains
dozens, if not hundreds, of executables. To store all these separates files,
the firmware is laid out in volumes using the Firmware File System (FFS), a
file system specifically designed to store firmware images. The volumes
contain files that are identified by GUIDs and each of these files contain
one or more sections holding the data. One of these sections contains the
actual executable image. Most of the executable images follow the PE format.
However, some of them follow the TE format.

The Terse Executable (TE) image format was created as a mechanism to reduce
the overhead of the PE/COFF headers in PE32/PE32+ images, resulting in a
corresponding reduction of image sizes for executables running in the PI
(Platform Initialization) Architecture environment. Reducing image size
provides an opportunity for use of a smaller system flash part.

So the TE format is basically a stripped version of PE.

@see <a href="https://uefi.org/sites/default/files/resources/PI_Spec_1_6.pdf">Source</a>
]##
proc read*(_: typedesc[UefiTe], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): UefiTe =
  template this: untyped = result
  this = new(UefiTe)
  let root = if root == nil: cast[UefiTe](this) else: cast[UefiTe](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rawTeHdrExpr = this.io.readBytes(int(40))
  this.rawTeHdr = rawTeHdrExpr
  let rawTeHdrIo = newKaitaiStream(rawTeHdrExpr)
  let teHdrExpr = UefiTe_TeHeader.read(rawTeHdrIo, this.root, this)
  this.teHdr = teHdrExpr
  for i in 0 ..< int(this.teHdr.numSections):
    let it = UefiTe_Section.read(this.io, this.root, this)
    this.sections.add(it)

proc fromFile*(_: typedesc[UefiTe], filename: string): UefiTe =
  UefiTe.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[UefiTe_TeHeader], io: KaitaiStream, root: KaitaiStruct, parent: UefiTe): UefiTe_TeHeader =
  template this: untyped = result
  this = new(UefiTe_TeHeader)
  let root = if root == nil: cast[UefiTe](this) else: cast[UefiTe](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(2))
  this.magic = magicExpr
  let machineExpr = UefiTe_TeHeader_MachineType(this.io.readU2le())
  this.machine = machineExpr
  let numSectionsExpr = this.io.readU1()
  this.numSections = numSectionsExpr
  let subsystemExpr = UefiTe_TeHeader_SubsystemEnum(this.io.readU1())
  this.subsystem = subsystemExpr
  let strippedSizeExpr = this.io.readU2le()
  this.strippedSize = strippedSizeExpr
  let entryPointAddrExpr = this.io.readU4le()
  this.entryPointAddr = entryPointAddrExpr
  let baseOfCodeExpr = this.io.readU4le()
  this.baseOfCode = baseOfCodeExpr
  let imageBaseExpr = this.io.readU8le()
  this.imageBase = imageBaseExpr
  let dataDirsExpr = UefiTe_HeaderDataDirs.read(this.io, this.root, this)
  this.dataDirs = dataDirsExpr

proc fromFile*(_: typedesc[UefiTe_TeHeader], filename: string): UefiTe_TeHeader =
  UefiTe_TeHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[UefiTe_HeaderDataDirs], io: KaitaiStream, root: KaitaiStruct, parent: UefiTe_TeHeader): UefiTe_HeaderDataDirs =
  template this: untyped = result
  this = new(UefiTe_HeaderDataDirs)
  let root = if root == nil: cast[UefiTe](this) else: cast[UefiTe](root)
  this.io = io
  this.root = root
  this.parent = parent

  let baseRelocationTableExpr = UefiTe_DataDir.read(this.io, this.root, this)
  this.baseRelocationTable = baseRelocationTableExpr
  let debugExpr = UefiTe_DataDir.read(this.io, this.root, this)
  this.debug = debugExpr

proc fromFile*(_: typedesc[UefiTe_HeaderDataDirs], filename: string): UefiTe_HeaderDataDirs =
  UefiTe_HeaderDataDirs.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[UefiTe_DataDir], io: KaitaiStream, root: KaitaiStruct, parent: UefiTe_HeaderDataDirs): UefiTe_DataDir =
  template this: untyped = result
  this = new(UefiTe_DataDir)
  let root = if root == nil: cast[UefiTe](this) else: cast[UefiTe](root)
  this.io = io
  this.root = root
  this.parent = parent

  let virtualAddressExpr = this.io.readU4le()
  this.virtualAddress = virtualAddressExpr
  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr

proc fromFile*(_: typedesc[UefiTe_DataDir], filename: string): UefiTe_DataDir =
  UefiTe_DataDir.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[UefiTe_Section], io: KaitaiStream, root: KaitaiStruct, parent: UefiTe): UefiTe_Section =
  template this: untyped = result
  this = new(UefiTe_Section)
  let root = if root == nil: cast[UefiTe](this) else: cast[UefiTe](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = encode(this.io.readBytes(int(8)).bytesStripRight(0), "UTF-8")
  this.name = nameExpr
  let virtualSizeExpr = this.io.readU4le()
  this.virtualSize = virtualSizeExpr
  let virtualAddressExpr = this.io.readU4le()
  this.virtualAddress = virtualAddressExpr
  let sizeOfRawDataExpr = this.io.readU4le()
  this.sizeOfRawData = sizeOfRawDataExpr
  let pointerToRawDataExpr = this.io.readU4le()
  this.pointerToRawData = pointerToRawDataExpr
  let pointerToRelocationsExpr = this.io.readU4le()
  this.pointerToRelocations = pointerToRelocationsExpr
  let pointerToLinenumbersExpr = this.io.readU4le()
  this.pointerToLinenumbers = pointerToLinenumbersExpr
  let numRelocationsExpr = this.io.readU2le()
  this.numRelocations = numRelocationsExpr
  let numLinenumbersExpr = this.io.readU2le()
  this.numLinenumbers = numLinenumbersExpr
  let characteristicsExpr = this.io.readU4le()
  this.characteristics = characteristicsExpr

proc body(this: UefiTe_Section): seq[byte] = 
  if this.bodyInst.len != 0:
    return this.bodyInst
  let pos = this.io.pos()
  this.io.seek(int(((this.pointerToRawData - UefiTe(this.root).teHdr.strippedSize) + UefiTe(this.root).teHdr.io.size)))
  let bodyInstExpr = this.io.readBytes(int(this.sizeOfRawData))
  this.bodyInst = bodyInstExpr
  this.io.seek(pos)
  if this.bodyInst.len != 0:
    return this.bodyInst

proc fromFile*(_: typedesc[UefiTe_Section], filename: string): UefiTe_Section =
  UefiTe_Section.read(newKaitaiFileStream(filename), nil, nil)

