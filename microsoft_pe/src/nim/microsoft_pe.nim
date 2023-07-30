import kaitai_struct_nim_runtime
import options

type
  MicrosoftPe* = ref object of KaitaiStruct
    `mz`*: MicrosoftPe_MzPlaceholder
    `parent`*: KaitaiStruct
    `peInst`: MicrosoftPe_PeHeader
    `peInstFlag`: bool
  MicrosoftPe_PeFormat* = enum
    rom_image = 263
    pe32 = 267
    pe32_plus = 523
  MicrosoftPe_CertificateEntry* = ref object of KaitaiStruct
    `length`*: uint32
    `revision`*: MicrosoftPe_CertificateEntry_CertificateRevision
    `certificateType`*: MicrosoftPe_CertificateEntry_CertificateTypeEnum
    `certificateBytes`*: seq[byte]
    `parent`*: MicrosoftPe_CertificateTable
  MicrosoftPe_CertificateEntry_CertificateRevision* = enum
    revision_1_0 = 256
    revision_2_0 = 512
  MicrosoftPe_CertificateEntry_CertificateTypeEnum* = enum
    x509 = 1
    pkcs_signed_data = 2
    reserved_1 = 3
    ts_stack_signed = 4
  MicrosoftPe_OptionalHeaderWindows* = ref object of KaitaiStruct
    `imageBase32`*: uint32
    `imageBase64`*: uint64
    `sectionAlignment`*: uint32
    `fileAlignment`*: uint32
    `majorOperatingSystemVersion`*: uint16
    `minorOperatingSystemVersion`*: uint16
    `majorImageVersion`*: uint16
    `minorImageVersion`*: uint16
    `majorSubsystemVersion`*: uint16
    `minorSubsystemVersion`*: uint16
    `win32VersionValue`*: uint32
    `sizeOfImage`*: uint32
    `sizeOfHeaders`*: uint32
    `checkSum`*: uint32
    `subsystem`*: MicrosoftPe_OptionalHeaderWindows_SubsystemEnum
    `dllCharacteristics`*: uint16
    `sizeOfStackReserve32`*: uint32
    `sizeOfStackReserve64`*: uint64
    `sizeOfStackCommit32`*: uint32
    `sizeOfStackCommit64`*: uint64
    `sizeOfHeapReserve32`*: uint32
    `sizeOfHeapReserve64`*: uint64
    `sizeOfHeapCommit32`*: uint32
    `sizeOfHeapCommit64`*: uint64
    `loaderFlags`*: uint32
    `numberOfRvaAndSizes`*: uint32
    `parent`*: MicrosoftPe_OptionalHeader
  MicrosoftPe_OptionalHeaderWindows_SubsystemEnum* = enum
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
  MicrosoftPe_OptionalHeaderDataDirs* = ref object of KaitaiStruct
    `exportTable`*: MicrosoftPe_DataDir
    `importTable`*: MicrosoftPe_DataDir
    `resourceTable`*: MicrosoftPe_DataDir
    `exceptionTable`*: MicrosoftPe_DataDir
    `certificateTable`*: MicrosoftPe_DataDir
    `baseRelocationTable`*: MicrosoftPe_DataDir
    `debug`*: MicrosoftPe_DataDir
    `architecture`*: MicrosoftPe_DataDir
    `globalPtr`*: MicrosoftPe_DataDir
    `tlsTable`*: MicrosoftPe_DataDir
    `loadConfigTable`*: MicrosoftPe_DataDir
    `boundImport`*: MicrosoftPe_DataDir
    `iat`*: MicrosoftPe_DataDir
    `delayImportDescriptor`*: MicrosoftPe_DataDir
    `clrRuntimeHeader`*: MicrosoftPe_DataDir
    `parent`*: MicrosoftPe_OptionalHeader
  MicrosoftPe_DataDir* = ref object of KaitaiStruct
    `virtualAddress`*: uint32
    `size`*: uint32
    `parent`*: MicrosoftPe_OptionalHeaderDataDirs
  MicrosoftPe_CoffSymbol* = ref object of KaitaiStruct
    `nameAnnoying`*: MicrosoftPe_Annoyingstring
    `value`*: uint32
    `sectionNumber`*: uint16
    `type`*: uint16
    `storageClass`*: uint8
    `numberOfAuxSymbols`*: uint8
    `parent`*: MicrosoftPe_CoffHeader
    `rawNameAnnoying`*: seq[byte]
    `sectionInst`: MicrosoftPe_Section
    `sectionInstFlag`: bool
    `dataInst`: seq[byte]
    `dataInstFlag`: bool
  MicrosoftPe_PeHeader* = ref object of KaitaiStruct
    `peSignature`*: seq[byte]
    `coffHdr`*: MicrosoftPe_CoffHeader
    `optionalHdr`*: MicrosoftPe_OptionalHeader
    `sections`*: seq[MicrosoftPe_Section]
    `parent`*: MicrosoftPe
    `rawOptionalHdr`*: seq[byte]
    `rawCertificateTableInst`*: seq[byte]
    `certificateTableInst`: MicrosoftPe_CertificateTable
    `certificateTableInstFlag`: bool
  MicrosoftPe_OptionalHeader* = ref object of KaitaiStruct
    `std`*: MicrosoftPe_OptionalHeaderStd
    `windows`*: MicrosoftPe_OptionalHeaderWindows
    `dataDirs`*: MicrosoftPe_OptionalHeaderDataDirs
    `parent`*: MicrosoftPe_PeHeader
  MicrosoftPe_Section* = ref object of KaitaiStruct
    `name`*: string
    `virtualSize`*: uint32
    `virtualAddress`*: uint32
    `sizeOfRawData`*: uint32
    `pointerToRawData`*: uint32
    `pointerToRelocations`*: uint32
    `pointerToLinenumbers`*: uint32
    `numberOfRelocations`*: uint16
    `numberOfLinenumbers`*: uint16
    `characteristics`*: uint32
    `parent`*: MicrosoftPe_PeHeader
    `bodyInst`: seq[byte]
    `bodyInstFlag`: bool
  MicrosoftPe_CertificateTable* = ref object of KaitaiStruct
    `items`*: seq[MicrosoftPe_CertificateEntry]
    `parent`*: MicrosoftPe_PeHeader
  MicrosoftPe_MzPlaceholder* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `data1`*: seq[byte]
    `ofsPe`*: uint32
    `parent`*: MicrosoftPe
  MicrosoftPe_OptionalHeaderStd* = ref object of KaitaiStruct
    `format`*: MicrosoftPe_PeFormat
    `majorLinkerVersion`*: uint8
    `minorLinkerVersion`*: uint8
    `sizeOfCode`*: uint32
    `sizeOfInitializedData`*: uint32
    `sizeOfUninitializedData`*: uint32
    `addressOfEntryPoint`*: uint32
    `baseOfCode`*: uint32
    `baseOfData`*: uint32
    `parent`*: MicrosoftPe_OptionalHeader
  MicrosoftPe_CoffHeader* = ref object of KaitaiStruct
    `machine`*: MicrosoftPe_CoffHeader_MachineType
    `numberOfSections`*: uint16
    `timeDateStamp`*: uint32
    `pointerToSymbolTable`*: uint32
    `numberOfSymbols`*: uint32
    `sizeOfOptionalHeader`*: uint16
    `characteristics`*: uint16
    `parent`*: MicrosoftPe_PeHeader
    `symbolTableSizeInst`: int
    `symbolTableSizeInstFlag`: bool
    `symbolNameTableOffsetInst`: int
    `symbolNameTableOffsetInstFlag`: bool
    `symbolNameTableSizeInst`: uint32
    `symbolNameTableSizeInstFlag`: bool
    `symbolTableInst`: seq[MicrosoftPe_CoffSymbol]
    `symbolTableInstFlag`: bool
  MicrosoftPe_CoffHeader_MachineType* = enum
    unknown = 0
    i386 = 332
    r4000 = 358
    wce_mips_v2 = 361
    alpha = 388
    sh3 = 418
    sh3_dsp = 419
    sh4 = 422
    sh5 = 424
    arm = 448
    thumb = 450
    arm_nt = 452
    am33 = 467
    powerpc = 496
    powerpc_fp = 497
    ia64 = 512
    mips16 = 614
    alpha64_or_axp64 = 644
    mips_fpu = 870
    mips16_fpu = 1126
    ebc = 3772
    riscv32 = 20530
    riscv64 = 20580
    riscv128 = 20776
    loongarch32 = 25138
    loongarch64 = 25188
    amd64 = 34404
    m32r = 36929
    arm64 = 43620
  MicrosoftPe_Annoyingstring* = ref object of KaitaiStruct
    `parent`*: MicrosoftPe_CoffSymbol
    `nameFromOffsetInst`: string
    `nameFromOffsetInstFlag`: bool
    `nameOffsetInst`: uint32
    `nameOffsetInstFlag`: bool
    `nameInst`: string
    `nameInstFlag`: bool
    `nameZeroesInst`: uint32
    `nameZeroesInstFlag`: bool
    `nameFromShortInst`: string
    `nameFromShortInstFlag`: bool

proc read*(_: typedesc[MicrosoftPe], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MicrosoftPe
proc read*(_: typedesc[MicrosoftPe_CertificateEntry], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_CertificateTable): MicrosoftPe_CertificateEntry
proc read*(_: typedesc[MicrosoftPe_OptionalHeaderWindows], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_OptionalHeader): MicrosoftPe_OptionalHeaderWindows
proc read*(_: typedesc[MicrosoftPe_OptionalHeaderDataDirs], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_OptionalHeader): MicrosoftPe_OptionalHeaderDataDirs
proc read*(_: typedesc[MicrosoftPe_DataDir], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_OptionalHeaderDataDirs): MicrosoftPe_DataDir
proc read*(_: typedesc[MicrosoftPe_CoffSymbol], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_CoffHeader): MicrosoftPe_CoffSymbol
proc read*(_: typedesc[MicrosoftPe_PeHeader], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe): MicrosoftPe_PeHeader
proc read*(_: typedesc[MicrosoftPe_OptionalHeader], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_PeHeader): MicrosoftPe_OptionalHeader
proc read*(_: typedesc[MicrosoftPe_Section], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_PeHeader): MicrosoftPe_Section
proc read*(_: typedesc[MicrosoftPe_CertificateTable], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_PeHeader): MicrosoftPe_CertificateTable
proc read*(_: typedesc[MicrosoftPe_MzPlaceholder], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe): MicrosoftPe_MzPlaceholder
proc read*(_: typedesc[MicrosoftPe_OptionalHeaderStd], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_OptionalHeader): MicrosoftPe_OptionalHeaderStd
proc read*(_: typedesc[MicrosoftPe_CoffHeader], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_PeHeader): MicrosoftPe_CoffHeader
proc read*(_: typedesc[MicrosoftPe_Annoyingstring], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_CoffSymbol): MicrosoftPe_Annoyingstring

proc pe*(this: MicrosoftPe): MicrosoftPe_PeHeader
proc section*(this: MicrosoftPe_CoffSymbol): MicrosoftPe_Section
proc data*(this: MicrosoftPe_CoffSymbol): seq[byte]
proc certificateTable*(this: MicrosoftPe_PeHeader): MicrosoftPe_CertificateTable
proc body*(this: MicrosoftPe_Section): seq[byte]
proc symbolTableSize*(this: MicrosoftPe_CoffHeader): int
proc symbolNameTableOffset*(this: MicrosoftPe_CoffHeader): int
proc symbolNameTableSize*(this: MicrosoftPe_CoffHeader): uint32
proc symbolTable*(this: MicrosoftPe_CoffHeader): seq[MicrosoftPe_CoffSymbol]
proc nameFromOffset*(this: MicrosoftPe_Annoyingstring): string
proc nameOffset*(this: MicrosoftPe_Annoyingstring): uint32
proc name*(this: MicrosoftPe_Annoyingstring): string
proc nameZeroes*(this: MicrosoftPe_Annoyingstring): uint32
proc nameFromShort*(this: MicrosoftPe_Annoyingstring): string


##[
@see <a href="https://learn.microsoft.com/en-us/windows/win32/debug/pe-format">Source</a>
]##
proc read*(_: typedesc[MicrosoftPe], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MicrosoftPe =
  template this: untyped = result
  this = new(MicrosoftPe)
  let root = if root == nil: cast[MicrosoftPe](this) else: cast[MicrosoftPe](root)
  this.io = io
  this.root = root
  this.parent = parent

  let mzExpr = MicrosoftPe_MzPlaceholder.read(this.io, this.root, this)
  this.mz = mzExpr

proc pe(this: MicrosoftPe): MicrosoftPe_PeHeader = 
  if this.peInstFlag:
    return this.peInst
  let pos = this.io.pos()
  this.io.seek(int(this.mz.ofsPe))
  let peInstExpr = MicrosoftPe_PeHeader.read(this.io, this.root, this)
  this.peInst = peInstExpr
  this.io.seek(pos)
  this.peInstFlag = true
  return this.peInst

proc fromFile*(_: typedesc[MicrosoftPe], filename: string): MicrosoftPe =
  MicrosoftPe.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#the-attribute-certificate-table-image-only">Source</a>
]##
proc read*(_: typedesc[MicrosoftPe_CertificateEntry], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_CertificateTable): MicrosoftPe_CertificateEntry =
  template this: untyped = result
  this = new(MicrosoftPe_CertificateEntry)
  let root = if root == nil: cast[MicrosoftPe](this) else: cast[MicrosoftPe](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Specifies the length of the attribute certificate entry.
  ]##
  let lengthExpr = this.io.readU4le()
  this.length = lengthExpr

  ##[
  Contains the certificate version number.
  ]##
  let revisionExpr = MicrosoftPe_CertificateEntry_CertificateRevision(this.io.readU2le())
  this.revision = revisionExpr

  ##[
  Specifies the type of content in bCertificate
  ]##
  let certificateTypeExpr = MicrosoftPe_CertificateEntry_CertificateTypeEnum(this.io.readU2le())
  this.certificateType = certificateTypeExpr

  ##[
  Contains a certificate, such as an Authenticode signature.
  ]##
  let certificateBytesExpr = this.io.readBytes(int((this.length - 8)))
  this.certificateBytes = certificateBytesExpr

proc fromFile*(_: typedesc[MicrosoftPe_CertificateEntry], filename: string): MicrosoftPe_CertificateEntry =
  MicrosoftPe_CertificateEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MicrosoftPe_OptionalHeaderWindows], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_OptionalHeader): MicrosoftPe_OptionalHeaderWindows =
  template this: untyped = result
  this = new(MicrosoftPe_OptionalHeaderWindows)
  let root = if root == nil: cast[MicrosoftPe](this) else: cast[MicrosoftPe](root)
  this.io = io
  this.root = root
  this.parent = parent

  if this.parent.std.format == microsoft_pe.pe32:
    let imageBase32Expr = this.io.readU4le()
    this.imageBase32 = imageBase32Expr
  if this.parent.std.format == microsoft_pe.pe32_plus:
    let imageBase64Expr = this.io.readU8le()
    this.imageBase64 = imageBase64Expr
  let sectionAlignmentExpr = this.io.readU4le()
  this.sectionAlignment = sectionAlignmentExpr
  let fileAlignmentExpr = this.io.readU4le()
  this.fileAlignment = fileAlignmentExpr
  let majorOperatingSystemVersionExpr = this.io.readU2le()
  this.majorOperatingSystemVersion = majorOperatingSystemVersionExpr
  let minorOperatingSystemVersionExpr = this.io.readU2le()
  this.minorOperatingSystemVersion = minorOperatingSystemVersionExpr
  let majorImageVersionExpr = this.io.readU2le()
  this.majorImageVersion = majorImageVersionExpr
  let minorImageVersionExpr = this.io.readU2le()
  this.minorImageVersion = minorImageVersionExpr
  let majorSubsystemVersionExpr = this.io.readU2le()
  this.majorSubsystemVersion = majorSubsystemVersionExpr
  let minorSubsystemVersionExpr = this.io.readU2le()
  this.minorSubsystemVersion = minorSubsystemVersionExpr
  let win32VersionValueExpr = this.io.readU4le()
  this.win32VersionValue = win32VersionValueExpr
  let sizeOfImageExpr = this.io.readU4le()
  this.sizeOfImage = sizeOfImageExpr
  let sizeOfHeadersExpr = this.io.readU4le()
  this.sizeOfHeaders = sizeOfHeadersExpr
  let checkSumExpr = this.io.readU4le()
  this.checkSum = checkSumExpr
  let subsystemExpr = MicrosoftPe_OptionalHeaderWindows_SubsystemEnum(this.io.readU2le())
  this.subsystem = subsystemExpr
  let dllCharacteristicsExpr = this.io.readU2le()
  this.dllCharacteristics = dllCharacteristicsExpr
  if this.parent.std.format == microsoft_pe.pe32:
    let sizeOfStackReserve32Expr = this.io.readU4le()
    this.sizeOfStackReserve32 = sizeOfStackReserve32Expr
  if this.parent.std.format == microsoft_pe.pe32_plus:
    let sizeOfStackReserve64Expr = this.io.readU8le()
    this.sizeOfStackReserve64 = sizeOfStackReserve64Expr
  if this.parent.std.format == microsoft_pe.pe32:
    let sizeOfStackCommit32Expr = this.io.readU4le()
    this.sizeOfStackCommit32 = sizeOfStackCommit32Expr
  if this.parent.std.format == microsoft_pe.pe32_plus:
    let sizeOfStackCommit64Expr = this.io.readU8le()
    this.sizeOfStackCommit64 = sizeOfStackCommit64Expr
  if this.parent.std.format == microsoft_pe.pe32:
    let sizeOfHeapReserve32Expr = this.io.readU4le()
    this.sizeOfHeapReserve32 = sizeOfHeapReserve32Expr
  if this.parent.std.format == microsoft_pe.pe32_plus:
    let sizeOfHeapReserve64Expr = this.io.readU8le()
    this.sizeOfHeapReserve64 = sizeOfHeapReserve64Expr
  if this.parent.std.format == microsoft_pe.pe32:
    let sizeOfHeapCommit32Expr = this.io.readU4le()
    this.sizeOfHeapCommit32 = sizeOfHeapCommit32Expr
  if this.parent.std.format == microsoft_pe.pe32_plus:
    let sizeOfHeapCommit64Expr = this.io.readU8le()
    this.sizeOfHeapCommit64 = sizeOfHeapCommit64Expr
  let loaderFlagsExpr = this.io.readU4le()
  this.loaderFlags = loaderFlagsExpr
  let numberOfRvaAndSizesExpr = this.io.readU4le()
  this.numberOfRvaAndSizes = numberOfRvaAndSizesExpr

proc fromFile*(_: typedesc[MicrosoftPe_OptionalHeaderWindows], filename: string): MicrosoftPe_OptionalHeaderWindows =
  MicrosoftPe_OptionalHeaderWindows.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MicrosoftPe_OptionalHeaderDataDirs], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_OptionalHeader): MicrosoftPe_OptionalHeaderDataDirs =
  template this: untyped = result
  this = new(MicrosoftPe_OptionalHeaderDataDirs)
  let root = if root == nil: cast[MicrosoftPe](this) else: cast[MicrosoftPe](root)
  this.io = io
  this.root = root
  this.parent = parent

  let exportTableExpr = MicrosoftPe_DataDir.read(this.io, this.root, this)
  this.exportTable = exportTableExpr
  let importTableExpr = MicrosoftPe_DataDir.read(this.io, this.root, this)
  this.importTable = importTableExpr
  let resourceTableExpr = MicrosoftPe_DataDir.read(this.io, this.root, this)
  this.resourceTable = resourceTableExpr
  let exceptionTableExpr = MicrosoftPe_DataDir.read(this.io, this.root, this)
  this.exceptionTable = exceptionTableExpr
  let certificateTableExpr = MicrosoftPe_DataDir.read(this.io, this.root, this)
  this.certificateTable = certificateTableExpr
  let baseRelocationTableExpr = MicrosoftPe_DataDir.read(this.io, this.root, this)
  this.baseRelocationTable = baseRelocationTableExpr
  let debugExpr = MicrosoftPe_DataDir.read(this.io, this.root, this)
  this.debug = debugExpr
  let architectureExpr = MicrosoftPe_DataDir.read(this.io, this.root, this)
  this.architecture = architectureExpr
  let globalPtrExpr = MicrosoftPe_DataDir.read(this.io, this.root, this)
  this.globalPtr = globalPtrExpr
  let tlsTableExpr = MicrosoftPe_DataDir.read(this.io, this.root, this)
  this.tlsTable = tlsTableExpr
  let loadConfigTableExpr = MicrosoftPe_DataDir.read(this.io, this.root, this)
  this.loadConfigTable = loadConfigTableExpr
  let boundImportExpr = MicrosoftPe_DataDir.read(this.io, this.root, this)
  this.boundImport = boundImportExpr
  let iatExpr = MicrosoftPe_DataDir.read(this.io, this.root, this)
  this.iat = iatExpr
  let delayImportDescriptorExpr = MicrosoftPe_DataDir.read(this.io, this.root, this)
  this.delayImportDescriptor = delayImportDescriptorExpr
  let clrRuntimeHeaderExpr = MicrosoftPe_DataDir.read(this.io, this.root, this)
  this.clrRuntimeHeader = clrRuntimeHeaderExpr

proc fromFile*(_: typedesc[MicrosoftPe_OptionalHeaderDataDirs], filename: string): MicrosoftPe_OptionalHeaderDataDirs =
  MicrosoftPe_OptionalHeaderDataDirs.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MicrosoftPe_DataDir], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_OptionalHeaderDataDirs): MicrosoftPe_DataDir =
  template this: untyped = result
  this = new(MicrosoftPe_DataDir)
  let root = if root == nil: cast[MicrosoftPe](this) else: cast[MicrosoftPe](root)
  this.io = io
  this.root = root
  this.parent = parent

  let virtualAddressExpr = this.io.readU4le()
  this.virtualAddress = virtualAddressExpr
  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr

proc fromFile*(_: typedesc[MicrosoftPe_DataDir], filename: string): MicrosoftPe_DataDir =
  MicrosoftPe_DataDir.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MicrosoftPe_CoffSymbol], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_CoffHeader): MicrosoftPe_CoffSymbol =
  template this: untyped = result
  this = new(MicrosoftPe_CoffSymbol)
  let root = if root == nil: cast[MicrosoftPe](this) else: cast[MicrosoftPe](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rawNameAnnoyingExpr = this.io.readBytes(int(8))
  this.rawNameAnnoying = rawNameAnnoyingExpr
  let rawNameAnnoyingIo = newKaitaiStream(rawNameAnnoyingExpr)
  let nameAnnoyingExpr = MicrosoftPe_Annoyingstring.read(rawNameAnnoyingIo, this.root, this)
  this.nameAnnoying = nameAnnoyingExpr
  let valueExpr = this.io.readU4le()
  this.value = valueExpr
  let sectionNumberExpr = this.io.readU2le()
  this.sectionNumber = sectionNumberExpr
  let typeExpr = this.io.readU2le()
  this.type = typeExpr
  let storageClassExpr = this.io.readU1()
  this.storageClass = storageClassExpr
  let numberOfAuxSymbolsExpr = this.io.readU1()
  this.numberOfAuxSymbols = numberOfAuxSymbolsExpr

proc section(this: MicrosoftPe_CoffSymbol): MicrosoftPe_Section = 
  if this.sectionInstFlag:
    return this.sectionInst
  let sectionInstExpr = MicrosoftPe_Section(MicrosoftPe(this.root).pe.sections[(this.sectionNumber - 1)])
  this.sectionInst = sectionInstExpr
  this.sectionInstFlag = true
  return this.sectionInst

proc data(this: MicrosoftPe_CoffSymbol): seq[byte] = 
  if this.dataInstFlag:
    return this.dataInst
  let pos = this.io.pos()
  this.io.seek(int((this.section.pointerToRawData + this.value)))
  let dataInstExpr = this.io.readBytes(int(1))
  this.dataInst = dataInstExpr
  this.io.seek(pos)
  this.dataInstFlag = true
  return this.dataInst

proc fromFile*(_: typedesc[MicrosoftPe_CoffSymbol], filename: string): MicrosoftPe_CoffSymbol =
  MicrosoftPe_CoffSymbol.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MicrosoftPe_PeHeader], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe): MicrosoftPe_PeHeader =
  template this: untyped = result
  this = new(MicrosoftPe_PeHeader)
  let root = if root == nil: cast[MicrosoftPe](this) else: cast[MicrosoftPe](root)
  this.io = io
  this.root = root
  this.parent = parent

  let peSignatureExpr = this.io.readBytes(int(4))
  this.peSignature = peSignatureExpr
  let coffHdrExpr = MicrosoftPe_CoffHeader.read(this.io, this.root, this)
  this.coffHdr = coffHdrExpr
  let rawOptionalHdrExpr = this.io.readBytes(int(this.coffHdr.sizeOfOptionalHeader))
  this.rawOptionalHdr = rawOptionalHdrExpr
  let rawOptionalHdrIo = newKaitaiStream(rawOptionalHdrExpr)
  let optionalHdrExpr = MicrosoftPe_OptionalHeader.read(rawOptionalHdrIo, this.root, this)
  this.optionalHdr = optionalHdrExpr
  for i in 0 ..< int(this.coffHdr.numberOfSections):
    let it = MicrosoftPe_Section.read(this.io, this.root, this)
    this.sections.add(it)

proc certificateTable(this: MicrosoftPe_PeHeader): MicrosoftPe_CertificateTable = 
  if this.certificateTableInstFlag:
    return this.certificateTableInst
  if this.optionalHdr.dataDirs.certificateTable.virtualAddress != 0:
    let pos = this.io.pos()
    this.io.seek(int(this.optionalHdr.dataDirs.certificateTable.virtualAddress))
    let rawCertificateTableInstExpr = this.io.readBytes(int(this.optionalHdr.dataDirs.certificateTable.size))
    this.rawCertificateTableInst = rawCertificateTableInstExpr
    let rawCertificateTableInstIo = newKaitaiStream(rawCertificateTableInstExpr)
    let certificateTableInstExpr = MicrosoftPe_CertificateTable.read(rawCertificateTableInstIo, this.root, this)
    this.certificateTableInst = certificateTableInstExpr
    this.io.seek(pos)
  this.certificateTableInstFlag = true
  return this.certificateTableInst

proc fromFile*(_: typedesc[MicrosoftPe_PeHeader], filename: string): MicrosoftPe_PeHeader =
  MicrosoftPe_PeHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MicrosoftPe_OptionalHeader], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_PeHeader): MicrosoftPe_OptionalHeader =
  template this: untyped = result
  this = new(MicrosoftPe_OptionalHeader)
  let root = if root == nil: cast[MicrosoftPe](this) else: cast[MicrosoftPe](root)
  this.io = io
  this.root = root
  this.parent = parent

  let stdExpr = MicrosoftPe_OptionalHeaderStd.read(this.io, this.root, this)
  this.std = stdExpr
  let windowsExpr = MicrosoftPe_OptionalHeaderWindows.read(this.io, this.root, this)
  this.windows = windowsExpr
  let dataDirsExpr = MicrosoftPe_OptionalHeaderDataDirs.read(this.io, this.root, this)
  this.dataDirs = dataDirsExpr

proc fromFile*(_: typedesc[MicrosoftPe_OptionalHeader], filename: string): MicrosoftPe_OptionalHeader =
  MicrosoftPe_OptionalHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MicrosoftPe_Section], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_PeHeader): MicrosoftPe_Section =
  template this: untyped = result
  this = new(MicrosoftPe_Section)
  let root = if root == nil: cast[MicrosoftPe](this) else: cast[MicrosoftPe](root)
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
  let numberOfRelocationsExpr = this.io.readU2le()
  this.numberOfRelocations = numberOfRelocationsExpr
  let numberOfLinenumbersExpr = this.io.readU2le()
  this.numberOfLinenumbers = numberOfLinenumbersExpr
  let characteristicsExpr = this.io.readU4le()
  this.characteristics = characteristicsExpr

proc body(this: MicrosoftPe_Section): seq[byte] = 
  if this.bodyInstFlag:
    return this.bodyInst
  let pos = this.io.pos()
  this.io.seek(int(this.pointerToRawData))
  let bodyInstExpr = this.io.readBytes(int(this.sizeOfRawData))
  this.bodyInst = bodyInstExpr
  this.io.seek(pos)
  this.bodyInstFlag = true
  return this.bodyInst

proc fromFile*(_: typedesc[MicrosoftPe_Section], filename: string): MicrosoftPe_Section =
  MicrosoftPe_Section.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MicrosoftPe_CertificateTable], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_PeHeader): MicrosoftPe_CertificateTable =
  template this: untyped = result
  this = new(MicrosoftPe_CertificateTable)
  let root = if root == nil: cast[MicrosoftPe](this) else: cast[MicrosoftPe](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = MicrosoftPe_CertificateEntry.read(this.io, this.root, this)
      this.items.add(it)
      inc i

proc fromFile*(_: typedesc[MicrosoftPe_CertificateTable], filename: string): MicrosoftPe_CertificateTable =
  MicrosoftPe_CertificateTable.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MicrosoftPe_MzPlaceholder], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe): MicrosoftPe_MzPlaceholder =
  template this: untyped = result
  this = new(MicrosoftPe_MzPlaceholder)
  let root = if root == nil: cast[MicrosoftPe](this) else: cast[MicrosoftPe](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(2))
  this.magic = magicExpr
  let data1Expr = this.io.readBytes(int(58))
  this.data1 = data1Expr

  ##[
  In PE file, an offset to PE header
  ]##
  let ofsPeExpr = this.io.readU4le()
  this.ofsPe = ofsPeExpr

proc fromFile*(_: typedesc[MicrosoftPe_MzPlaceholder], filename: string): MicrosoftPe_MzPlaceholder =
  MicrosoftPe_MzPlaceholder.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MicrosoftPe_OptionalHeaderStd], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_OptionalHeader): MicrosoftPe_OptionalHeaderStd =
  template this: untyped = result
  this = new(MicrosoftPe_OptionalHeaderStd)
  let root = if root == nil: cast[MicrosoftPe](this) else: cast[MicrosoftPe](root)
  this.io = io
  this.root = root
  this.parent = parent

  let formatExpr = MicrosoftPe_PeFormat(this.io.readU2le())
  this.format = formatExpr
  let majorLinkerVersionExpr = this.io.readU1()
  this.majorLinkerVersion = majorLinkerVersionExpr
  let minorLinkerVersionExpr = this.io.readU1()
  this.minorLinkerVersion = minorLinkerVersionExpr
  let sizeOfCodeExpr = this.io.readU4le()
  this.sizeOfCode = sizeOfCodeExpr
  let sizeOfInitializedDataExpr = this.io.readU4le()
  this.sizeOfInitializedData = sizeOfInitializedDataExpr
  let sizeOfUninitializedDataExpr = this.io.readU4le()
  this.sizeOfUninitializedData = sizeOfUninitializedDataExpr
  let addressOfEntryPointExpr = this.io.readU4le()
  this.addressOfEntryPoint = addressOfEntryPointExpr
  let baseOfCodeExpr = this.io.readU4le()
  this.baseOfCode = baseOfCodeExpr
  if this.format == microsoft_pe.pe32:
    let baseOfDataExpr = this.io.readU4le()
    this.baseOfData = baseOfDataExpr

proc fromFile*(_: typedesc[MicrosoftPe_OptionalHeaderStd], filename: string): MicrosoftPe_OptionalHeaderStd =
  MicrosoftPe_OptionalHeaderStd.read(newKaitaiFileStream(filename), nil, nil)


##[
@see "3.3. COFF File Header (Object and Image)"
]##
proc read*(_: typedesc[MicrosoftPe_CoffHeader], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_PeHeader): MicrosoftPe_CoffHeader =
  template this: untyped = result
  this = new(MicrosoftPe_CoffHeader)
  let root = if root == nil: cast[MicrosoftPe](this) else: cast[MicrosoftPe](root)
  this.io = io
  this.root = root
  this.parent = parent

  let machineExpr = MicrosoftPe_CoffHeader_MachineType(this.io.readU2le())
  this.machine = machineExpr
  let numberOfSectionsExpr = this.io.readU2le()
  this.numberOfSections = numberOfSectionsExpr
  let timeDateStampExpr = this.io.readU4le()
  this.timeDateStamp = timeDateStampExpr
  let pointerToSymbolTableExpr = this.io.readU4le()
  this.pointerToSymbolTable = pointerToSymbolTableExpr
  let numberOfSymbolsExpr = this.io.readU4le()
  this.numberOfSymbols = numberOfSymbolsExpr
  let sizeOfOptionalHeaderExpr = this.io.readU2le()
  this.sizeOfOptionalHeader = sizeOfOptionalHeaderExpr
  let characteristicsExpr = this.io.readU2le()
  this.characteristics = characteristicsExpr

proc symbolTableSize(this: MicrosoftPe_CoffHeader): int = 
  if this.symbolTableSizeInstFlag:
    return this.symbolTableSizeInst
  let symbolTableSizeInstExpr = int((this.numberOfSymbols * 18))
  this.symbolTableSizeInst = symbolTableSizeInstExpr
  this.symbolTableSizeInstFlag = true
  return this.symbolTableSizeInst

proc symbolNameTableOffset(this: MicrosoftPe_CoffHeader): int = 
  if this.symbolNameTableOffsetInstFlag:
    return this.symbolNameTableOffsetInst
  let symbolNameTableOffsetInstExpr = int((this.pointerToSymbolTable + this.symbolTableSize))
  this.symbolNameTableOffsetInst = symbolNameTableOffsetInstExpr
  this.symbolNameTableOffsetInstFlag = true
  return this.symbolNameTableOffsetInst

proc symbolNameTableSize(this: MicrosoftPe_CoffHeader): uint32 = 
  if this.symbolNameTableSizeInstFlag:
    return this.symbolNameTableSizeInst
  let pos = this.io.pos()
  this.io.seek(int(this.symbolNameTableOffset))
  let symbolNameTableSizeInstExpr = this.io.readU4le()
  this.symbolNameTableSizeInst = symbolNameTableSizeInstExpr
  this.io.seek(pos)
  this.symbolNameTableSizeInstFlag = true
  return this.symbolNameTableSizeInst

proc symbolTable(this: MicrosoftPe_CoffHeader): seq[MicrosoftPe_CoffSymbol] = 
  if this.symbolTableInstFlag:
    return this.symbolTableInst
  let pos = this.io.pos()
  this.io.seek(int(this.pointerToSymbolTable))
  for i in 0 ..< int(this.numberOfSymbols):
    let it = MicrosoftPe_CoffSymbol.read(this.io, this.root, this)
    this.symbolTableInst.add(it)
  this.io.seek(pos)
  this.symbolTableInstFlag = true
  return this.symbolTableInst

proc fromFile*(_: typedesc[MicrosoftPe_CoffHeader], filename: string): MicrosoftPe_CoffHeader =
  MicrosoftPe_CoffHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MicrosoftPe_Annoyingstring], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftPe_CoffSymbol): MicrosoftPe_Annoyingstring =
  template this: untyped = result
  this = new(MicrosoftPe_Annoyingstring)
  let root = if root == nil: cast[MicrosoftPe](this) else: cast[MicrosoftPe](root)
  this.io = io
  this.root = root
  this.parent = parent


proc nameFromOffset(this: MicrosoftPe_Annoyingstring): string = 
  if this.nameFromOffsetInstFlag:
    return this.nameFromOffsetInst
  if this.nameZeroes == 0:
    let io = MicrosoftPe(this.root).io
    let pos = io.pos()
    io.seek(int((if this.nameZeroes == 0: (this.parent.parent.symbolNameTableOffset + this.nameOffset) else: 0)))
    let nameFromOffsetInstExpr = encode(io.readBytesTerm(0, false, true, false), "ascii")
    this.nameFromOffsetInst = nameFromOffsetInstExpr
    io.seek(pos)
  this.nameFromOffsetInstFlag = true
  return this.nameFromOffsetInst

proc nameOffset(this: MicrosoftPe_Annoyingstring): uint32 = 
  if this.nameOffsetInstFlag:
    return this.nameOffsetInst
  let pos = this.io.pos()
  this.io.seek(int(4))
  let nameOffsetInstExpr = this.io.readU4le()
  this.nameOffsetInst = nameOffsetInstExpr
  this.io.seek(pos)
  this.nameOffsetInstFlag = true
  return this.nameOffsetInst

proc name(this: MicrosoftPe_Annoyingstring): string = 
  if this.nameInstFlag:
    return this.nameInst
  let nameInstExpr = string((if this.nameZeroes == 0: this.nameFromOffset else: this.nameFromShort))
  this.nameInst = nameInstExpr
  this.nameInstFlag = true
  return this.nameInst

proc nameZeroes(this: MicrosoftPe_Annoyingstring): uint32 = 
  if this.nameZeroesInstFlag:
    return this.nameZeroesInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let nameZeroesInstExpr = this.io.readU4le()
  this.nameZeroesInst = nameZeroesInstExpr
  this.io.seek(pos)
  this.nameZeroesInstFlag = true
  return this.nameZeroesInst

proc nameFromShort(this: MicrosoftPe_Annoyingstring): string = 
  if this.nameFromShortInstFlag:
    return this.nameFromShortInst
  if this.nameZeroes != 0:
    let pos = this.io.pos()
    this.io.seek(int(0))
    let nameFromShortInstExpr = encode(this.io.readBytesTerm(0, false, true, false), "ascii")
    this.nameFromShortInst = nameFromShortInstExpr
    this.io.seek(pos)
  this.nameFromShortInstFlag = true
  return this.nameFromShortInst

proc fromFile*(_: typedesc[MicrosoftPe_Annoyingstring], filename: string): MicrosoftPe_Annoyingstring =
  MicrosoftPe_Annoyingstring.read(newKaitaiFileStream(filename), nil, nil)

