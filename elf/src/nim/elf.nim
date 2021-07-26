import kaitai_struct_nim_runtime
import options

type
  Elf* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `bits`*: Elf_Bits
    `endian`*: Elf_Endian
    `eiVersion`*: uint8
    `abi`*: Elf_OsAbi
    `abiVersion`*: uint8
    `pad`*: seq[byte]
    `header`*: Elf_EndianElf
    `parent`*: KaitaiStruct
  Elf_Endian* = enum
    le = 1
    be = 2
  Elf_ShType* = enum
    null_type = 0
    progbits = 1
    symtab = 2
    strtab = 3
    rela = 4
    hash = 5
    dynamic = 6
    note = 7
    nobits = 8
    rel = 9
    shlib = 10
    dynsym = 11
    init_array = 14
    fini_array = 15
    preinit_array = 16
    group = 17
    symtab_shndx = 18
    sunw_capchain = 1879048175
    sunw_capinfo = 1879048176
    sunw_symsort = 1879048177
    sunw_tlssort = 1879048178
    sunw_ldynsym = 1879048179
    sunw_dof = 1879048180
    sunw_cap = 1879048181
    sunw_signature = 1879048182
    sunw_annotate = 1879048183
    sunw_debugstr = 1879048184
    sunw_debug = 1879048185
    sunw_move = 1879048186
    sunw_comdat = 1879048187
    sunw_syminfo = 1879048188
    sunw_verdef = 1879048189
    sunw_verneed = 1879048190
    sunw_versym = 1879048191
    sparc_gotdata = 1879048192
    amd64_unwind = 1879048193
    arm_preemptmap = 1879048194
    arm_attributes = 1879048195
  Elf_OsAbi* = enum
    system_v = 0
    hp_ux = 1
    netbsd = 2
    gnu = 3
    solaris = 6
    aix = 7
    irix = 8
    freebsd = 9
    tru64 = 10
    modesto = 11
    openbsd = 12
    openvms = 13
    nsk = 14
    aros = 15
    fenixos = 16
    cloudabi = 17
    openvos = 18
  Elf_Machine* = enum
    no_machine = 0
    m32 = 1
    sparc = 2
    x86 = 3
    m68k = 4
    m88k = 5
    mips = 8
    powerpc = 20
    powerpc64 = 21
    s390 = 22
    arm = 40
    superh = 42
    sparcv9 = 43
    ia_64 = 50
    x86_64 = 62
    avr = 83
    qdsp6 = 164
    aarch64 = 183
    avr32 = 185
    amdgpu = 224
    riscv = 243
    bpf = 247
    csky = 252
  Elf_DynamicArrayTags* = enum
    null = 0
    needed = 1
    pltrelsz = 2
    pltgot = 3
    hash = 4
    strtab = 5
    symtab = 6
    rela = 7
    relasz = 8
    relaent = 9
    strsz = 10
    syment = 11
    init = 12
    fini = 13
    soname = 14
    rpath = 15
    symbolic = 16
    rel = 17
    relsz = 18
    relent = 19
    pltrel = 20
    debug = 21
    textrel = 22
    jmprel = 23
    bind_now = 24
    init_array = 25
    fini_array = 26
    init_arraysz = 27
    fini_arraysz = 28
    runpath = 29
    flags = 30
    preinit_array = 32
    preinit_arraysz = 33
    maxpostags = 34
    sunw_auxiliary = 1610612749
    sunw_filter = 1610612750
    sunw_cap = 1610612752
    sunw_symtab = 1610612753
    sunw_symsz = 1610612754
    sunw_sortent = 1610612755
    sunw_symsort = 1610612756
    sunw_symsortsz = 1610612757
    sunw_tlssort = 1610612758
    sunw_tlssortsz = 1610612759
    sunw_capinfo = 1610612760
    sunw_strpad = 1610612761
    sunw_capchain = 1610612762
    sunw_ldmach = 1610612763
    sunw_capchainent = 1610612765
    sunw_capchainsz = 1610612767
    gnu_prelinked = 1879047669
    gnu_conflictsz = 1879047670
    gnu_liblistsz = 1879047671
    checksum = 1879047672
    pltpadsz = 1879047673
    moveent = 1879047674
    movesz = 1879047675
    feature_1 = 1879047676
    posflag_1 = 1879047677
    syminsz = 1879047678
    syminent = 1879047679
    gnu_hash = 1879047925
    tlsdesc_plt = 1879047926
    tlsdesc_got = 1879047927
    gnu_conflict = 1879047928
    gnu_liblist = 1879047929
    config = 1879047930
    depaudit = 1879047931
    audit = 1879047932
    pltpad = 1879047933
    movetab = 1879047934
    syminfo = 1879047935
    versym = 1879048176
    relacount = 1879048185
    relcount = 1879048186
    flags_1 = 1879048187
    verdef = 1879048188
    verdefnum = 1879048189
    verneed = 1879048190
    verneednum = 1879048191
    sparc_register = 1879048193
    auxiliary = 2147483645
    used = 2147483646
    filter = 2147483647
  Elf_Bits* = enum
    b32 = 1
    b64 = 2
  Elf_PhType* = enum
    null_type = 0
    load = 1
    dynamic = 2
    interp = 3
    note = 4
    shlib = 5
    phdr = 6
    tls = 7
    gnu_eh_frame = 1685382480
    gnu_stack = 1685382481
    gnu_relro = 1685382482
    gnu_property = 1685382483
    pax_flags = 1694766464
    hios = 1879048191
    arm_exidx = 1879048193
  Elf_ObjType* = enum
    no_file_type = 0
    relocatable = 1
    executable = 2
    shared = 3
    core = 4
  Elf_PhdrTypeFlags* = ref object of KaitaiStruct
    `value`*: uint32
    `parent`*: Elf_EndianElf_ProgramHeader
    `readInst`*: bool
    `writeInst`*: bool
    `executeInst`*: bool
    `maskProcInst`*: bool
  Elf_SectionHeaderFlags* = ref object of KaitaiStruct
    `value`*: uint32
    `parent`*: Elf_EndianElf_SectionHeader
    `mergeInst`*: bool
    `maskOsInst`*: bool
    `excludeInst`*: bool
    `maskProcInst`*: bool
    `stringsInst`*: bool
    `osNonConformingInst`*: bool
    `allocInst`*: bool
    `execInstrInst`*: bool
    `infoLinkInst`*: bool
    `writeInst`*: bool
    `linkOrderInst`*: bool
    `orderedInst`*: bool
    `tlsInst`*: bool
    `groupInst`*: bool
  Elf_DtFlag1Values* = ref object of KaitaiStruct
    `value`*: uint32
    `parent`*: Elf_EndianElf_DynamicSectionEntry
    `singletonInst`*: bool
    `ignmuldefInst`*: bool
    `loadfltrInst`*: bool
    `initfirstInst`*: bool
    `symintposeInst`*: bool
    `norelocInst`*: bool
    `confaltInst`*: bool
    `dispreldneInst`*: bool
    `rtldGlobalInst`*: bool
    `nodeleteInst`*: bool
    `transInst`*: bool
    `originInst`*: bool
    `nowInst`*: bool
    `nohdrInst`*: bool
    `endfilteeInst`*: bool
    `nodirectInst`*: bool
    `globauditInst`*: bool
    `noksymsInst`*: bool
    `interposeInst`*: bool
    `nodumpInst`*: bool
    `disprelpndInst`*: bool
    `noopenInst`*: bool
    `stubInst`*: bool
    `directInst`*: bool
    `editedInst`*: bool
    `groupInst`*: bool
    `pieInst`*: bool
    `nodeflibInst`*: bool
  Elf_EndianElf* = ref object of KaitaiStruct
    `eType`*: Elf_ObjType
    `machine`*: Elf_Machine
    `eVersion`*: uint32
    `entryPoint`*: uint64
    `programHeaderOffset`*: uint64
    `sectionHeaderOffset`*: uint64
    `flags`*: seq[byte]
    `eEhsize`*: uint16
    `programHeaderEntrySize`*: uint16
    `qtyProgramHeader`*: uint16
    `sectionHeaderEntrySize`*: uint16
    `qtySectionHeader`*: uint16
    `sectionNamesIdx`*: uint16
    `parent`*: Elf
    `rawProgramHeadersInst`*: seq[seq[byte]]
    `rawSectionHeadersInst`*: seq[seq[byte]]
    `rawStringsInst`*: seq[byte]
    `programHeadersInst`*: seq[Elf_EndianElf_ProgramHeader]
    `sectionHeadersInst`*: seq[Elf_EndianElf_SectionHeader]
    `stringsInst`*: Elf_EndianElf_StringsStruct
    isLe: bool
  Elf_EndianElf_DynsymSectionEntry64* = ref object of KaitaiStruct
    `nameOffset`*: uint32
    `info`*: uint8
    `other`*: uint8
    `shndx`*: uint16
    `value`*: uint64
    `size`*: uint64
    `parent`*: Elf_EndianElf_DynsymSection
    isLe: bool
  Elf_EndianElf_NoteSection* = ref object of KaitaiStruct
    `entries`*: seq[Elf_EndianElf_NoteSectionEntry]
    `parent`*: Elf_EndianElf_SectionHeader
    isLe: bool
  Elf_EndianElf_ProgramHeader* = ref object of KaitaiStruct
    `type`*: Elf_PhType
    `flags64`*: uint32
    `offset`*: uint64
    `vaddr`*: uint64
    `paddr`*: uint64
    `filesz`*: uint64
    `memsz`*: uint64
    `flags32`*: uint32
    `align`*: uint64
    `parent`*: Elf_EndianElf
    `rawDynamicInst`*: seq[byte]
    `dynamicInst`*: Elf_EndianElf_DynamicSection
    `flagsObjInst`*: Elf_PhdrTypeFlags
    isLe: bool
  Elf_EndianElf_DynamicSectionEntry* = ref object of KaitaiStruct
    `tag`*: uint64
    `valueOrPtr`*: uint64
    `parent`*: Elf_EndianElf_DynamicSection
    `tagEnumInst`*: Elf_DynamicArrayTags
    `flag1ValuesInst`*: Elf_DtFlag1Values
    isLe: bool
  Elf_EndianElf_SectionHeader* = ref object of KaitaiStruct
    `ofsName`*: uint32
    `type`*: Elf_ShType
    `flags`*: uint64
    `addr`*: uint64
    `ofsBody`*: uint64
    `lenBody`*: uint64
    `linkedSectionIdx`*: uint32
    `info`*: seq[byte]
    `align`*: uint64
    `entrySize`*: uint64
    `parent`*: Elf_EndianElf
    `rawBodyInst`*: seq[byte]
    `bodyInst`*: KaitaiStruct
    `nameInst`*: string
    `flagsObjInst`*: Elf_SectionHeaderFlags
    isLe: bool
  Elf_EndianElf_RelocationSection* = ref object of KaitaiStruct
    `entries`*: seq[Elf_EndianElf_RelocationSectionEntry]
    `hasAddend`*: bool
    `parent`*: Elf_EndianElf_SectionHeader
    isLe: bool
  Elf_EndianElf_DynamicSection* = ref object of KaitaiStruct
    `entries`*: seq[Elf_EndianElf_DynamicSectionEntry]
    `parent`*: KaitaiStruct
    isLe: bool
  Elf_EndianElf_DynsymSection* = ref object of KaitaiStruct
    `entries`*: seq[KaitaiStruct]
    `parent`*: Elf_EndianElf_SectionHeader
    isLe: bool
  Elf_EndianElf_RelocationSectionEntry* = ref object of KaitaiStruct
    `offset`*: uint64
    `info`*: uint64
    `addend`*: int64
    `parent`*: Elf_EndianElf_RelocationSection
    isLe: bool
  Elf_EndianElf_DynsymSectionEntry32* = ref object of KaitaiStruct
    `nameOffset`*: uint32
    `value`*: uint32
    `size`*: uint32
    `info`*: uint8
    `other`*: uint8
    `shndx`*: uint16
    `parent`*: Elf_EndianElf_DynsymSection
    isLe: bool
  Elf_EndianElf_NoteSectionEntry* = ref object of KaitaiStruct
    `lenName`*: uint32
    `lenDescriptor`*: uint32
    `type`*: uint32
    `name`*: seq[byte]
    `namePadding`*: seq[byte]
    `descriptor`*: seq[byte]
    `descriptorPadding`*: seq[byte]
    `parent`*: Elf_EndianElf_NoteSection
    isLe: bool
  Elf_EndianElf_StringsStruct* = ref object of KaitaiStruct
    `entries`*: seq[string]
    `parent`*: KaitaiStruct
    isLe: bool

proc read*(_: typedesc[Elf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Elf
proc read*(_: typedesc[Elf_PhdrTypeFlags], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_ProgramHeader, value: any): Elf_PhdrTypeFlags
proc read*(_: typedesc[Elf_SectionHeaderFlags], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_SectionHeader, value: any): Elf_SectionHeaderFlags
proc read*(_: typedesc[Elf_DtFlag1Values], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_DynamicSectionEntry, value: any): Elf_DtFlag1Values
proc read*(_: typedesc[Elf_EndianElf], io: KaitaiStream, root: KaitaiStruct, parent: Elf): Elf_EndianElf
proc read*(_: typedesc[Elf_EndianElf_DynsymSectionEntry64], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_DynsymSection): Elf_EndianElf_DynsymSectionEntry64
proc read*(_: typedesc[Elf_EndianElf_NoteSection], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_SectionHeader): Elf_EndianElf_NoteSection
proc read*(_: typedesc[Elf_EndianElf_ProgramHeader], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf): Elf_EndianElf_ProgramHeader
proc read*(_: typedesc[Elf_EndianElf_DynamicSectionEntry], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_DynamicSection): Elf_EndianElf_DynamicSectionEntry
proc read*(_: typedesc[Elf_EndianElf_SectionHeader], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf): Elf_EndianElf_SectionHeader
proc read*(_: typedesc[Elf_EndianElf_RelocationSection], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_SectionHeader, hasAddend: any): Elf_EndianElf_RelocationSection
proc read*(_: typedesc[Elf_EndianElf_DynamicSection], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Elf_EndianElf_DynamicSection
proc read*(_: typedesc[Elf_EndianElf_DynsymSection], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_SectionHeader): Elf_EndianElf_DynsymSection
proc read*(_: typedesc[Elf_EndianElf_RelocationSectionEntry], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_RelocationSection): Elf_EndianElf_RelocationSectionEntry
proc read*(_: typedesc[Elf_EndianElf_DynsymSectionEntry32], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_DynsymSection): Elf_EndianElf_DynsymSectionEntry32
proc read*(_: typedesc[Elf_EndianElf_NoteSectionEntry], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_NoteSection): Elf_EndianElf_NoteSectionEntry
proc read*(_: typedesc[Elf_EndianElf_StringsStruct], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Elf_EndianElf_StringsStruct

proc read*(this: Elf_PhdrTypeFlags): bool
proc write*(this: Elf_PhdrTypeFlags): bool
proc execute*(this: Elf_PhdrTypeFlags): bool
proc maskProc*(this: Elf_PhdrTypeFlags): bool
proc merge*(this: Elf_SectionHeaderFlags): bool
proc maskOs*(this: Elf_SectionHeaderFlags): bool
proc exclude*(this: Elf_SectionHeaderFlags): bool
proc maskProc*(this: Elf_SectionHeaderFlags): bool
proc strings*(this: Elf_SectionHeaderFlags): bool
proc osNonConforming*(this: Elf_SectionHeaderFlags): bool
proc alloc*(this: Elf_SectionHeaderFlags): bool
proc execInstr*(this: Elf_SectionHeaderFlags): bool
proc infoLink*(this: Elf_SectionHeaderFlags): bool
proc write*(this: Elf_SectionHeaderFlags): bool
proc linkOrder*(this: Elf_SectionHeaderFlags): bool
proc ordered*(this: Elf_SectionHeaderFlags): bool
proc tls*(this: Elf_SectionHeaderFlags): bool
proc group*(this: Elf_SectionHeaderFlags): bool
proc singleton*(this: Elf_DtFlag1Values): bool
proc ignmuldef*(this: Elf_DtFlag1Values): bool
proc loadfltr*(this: Elf_DtFlag1Values): bool
proc initfirst*(this: Elf_DtFlag1Values): bool
proc symintpose*(this: Elf_DtFlag1Values): bool
proc noreloc*(this: Elf_DtFlag1Values): bool
proc confalt*(this: Elf_DtFlag1Values): bool
proc dispreldne*(this: Elf_DtFlag1Values): bool
proc rtldGlobal*(this: Elf_DtFlag1Values): bool
proc nodelete*(this: Elf_DtFlag1Values): bool
proc trans*(this: Elf_DtFlag1Values): bool
proc origin*(this: Elf_DtFlag1Values): bool
proc now*(this: Elf_DtFlag1Values): bool
proc nohdr*(this: Elf_DtFlag1Values): bool
proc endfiltee*(this: Elf_DtFlag1Values): bool
proc nodirect*(this: Elf_DtFlag1Values): bool
proc globaudit*(this: Elf_DtFlag1Values): bool
proc noksyms*(this: Elf_DtFlag1Values): bool
proc interpose*(this: Elf_DtFlag1Values): bool
proc nodump*(this: Elf_DtFlag1Values): bool
proc disprelpnd*(this: Elf_DtFlag1Values): bool
proc noopen*(this: Elf_DtFlag1Values): bool
proc stub*(this: Elf_DtFlag1Values): bool
proc direct*(this: Elf_DtFlag1Values): bool
proc edited*(this: Elf_DtFlag1Values): bool
proc group*(this: Elf_DtFlag1Values): bool
proc pie*(this: Elf_DtFlag1Values): bool
proc nodeflib*(this: Elf_DtFlag1Values): bool
proc programHeaders*(this: Elf_EndianElf): seq[Elf_EndianElf_ProgramHeader]
proc sectionHeaders*(this: Elf_EndianElf): seq[Elf_EndianElf_SectionHeader]
proc strings*(this: Elf_EndianElf): Elf_EndianElf_StringsStruct
proc dynamic*(this: Elf_EndianElf_ProgramHeader): Elf_EndianElf_DynamicSection
proc flagsObj*(this: Elf_EndianElf_ProgramHeader): Elf_PhdrTypeFlags
proc tagEnum*(this: Elf_EndianElf_DynamicSectionEntry): Elf_DynamicArrayTags
proc flag1Values*(this: Elf_EndianElf_DynamicSectionEntry): Elf_DtFlag1Values
proc body*(this: Elf_EndianElf_SectionHeader): KaitaiStruct
proc name*(this: Elf_EndianElf_SectionHeader): string
proc flagsObj*(this: Elf_EndianElf_SectionHeader): Elf_SectionHeaderFlags


##[
@see <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/contents.html">Source</a>
@see <a href="https://docs.oracle.com/cd/E23824_01/html/819-0690/chapter6-46512.html">Source</a>
@see <a href="https://sourceware.org/git/?p=glibc.git;a=blob;f=elf/elf.h;hb=HEAD">Source</a>
]##
proc read*(_: typedesc[Elf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Elf =
  template this: untyped = result
  this = new(Elf)
  let root = if root == nil: cast[Elf](this) else: cast[Elf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  File identification, must be 0x7f + "ELF".
  ]##
  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr

  ##[
  File class: designates target machine word size (32 or 64
bits). The size of many integer fields in this format will
depend on this setting.

  ]##
  let bitsExpr = Elf_Bits(this.io.readU1())
  this.bits = bitsExpr

  ##[
  Endianness used for all integers.
  ]##
  let endianExpr = Elf_Endian(this.io.readU1())
  this.endian = endianExpr

  ##[
  ELF header version.
  ]##
  let eiVersionExpr = this.io.readU1()
  this.eiVersion = eiVersionExpr

  ##[
  Specifies which OS- and ABI-related extensions will be used
in this ELF file.

  ]##
  let abiExpr = Elf_OsAbi(this.io.readU1())
  this.abi = abiExpr

  ##[
  Version of ABI targeted by this ELF file. Interpretation
depends on `abi` attribute.

  ]##
  let abiVersionExpr = this.io.readU1()
  this.abiVersion = abiVersionExpr
  let padExpr = this.io.readBytes(int(7))
  this.pad = padExpr
  let headerExpr = Elf_EndianElf.read(this.io, this.root, this)
  this.header = headerExpr

proc fromFile*(_: typedesc[Elf], filename: string): Elf =
  Elf.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Elf_PhdrTypeFlags], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_ProgramHeader, value: any): Elf_PhdrTypeFlags =
  template this: untyped = result
  this = new(Elf_PhdrTypeFlags)
  let root = if root == nil: cast[Elf](this) else: cast[Elf](root)
  this.io = io
  this.root = root
  this.parent = parent
  let valueExpr = uint32(value)
  this.value = valueExpr


proc read(this: Elf_PhdrTypeFlags): bool = 
  if this.readInst != nil:
    return this.readInst
  let readInstExpr = bool((this.value and 4) != 0)
  this.readInst = readInstExpr
  if this.readInst != nil:
    return this.readInst

proc write(this: Elf_PhdrTypeFlags): bool = 
  if this.writeInst != nil:
    return this.writeInst
  let writeInstExpr = bool((this.value and 2) != 0)
  this.writeInst = writeInstExpr
  if this.writeInst != nil:
    return this.writeInst

proc execute(this: Elf_PhdrTypeFlags): bool = 
  if this.executeInst != nil:
    return this.executeInst
  let executeInstExpr = bool((this.value and 1) != 0)
  this.executeInst = executeInstExpr
  if this.executeInst != nil:
    return this.executeInst

proc maskProc(this: Elf_PhdrTypeFlags): bool = 
  if this.maskProcInst != nil:
    return this.maskProcInst
  let maskProcInstExpr = bool((this.value and 4026531840'i64) != 0)
  this.maskProcInst = maskProcInstExpr
  if this.maskProcInst != nil:
    return this.maskProcInst

proc fromFile*(_: typedesc[Elf_PhdrTypeFlags], filename: string): Elf_PhdrTypeFlags =
  Elf_PhdrTypeFlags.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Elf_SectionHeaderFlags], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_SectionHeader, value: any): Elf_SectionHeaderFlags =
  template this: untyped = result
  this = new(Elf_SectionHeaderFlags)
  let root = if root == nil: cast[Elf](this) else: cast[Elf](root)
  this.io = io
  this.root = root
  this.parent = parent
  let valueExpr = uint32(value)
  this.value = valueExpr


proc merge(this: Elf_SectionHeaderFlags): bool = 

  ##[
  might be merged
  ]##
  if this.mergeInst != nil:
    return this.mergeInst
  let mergeInstExpr = bool((this.value and 16) != 0)
  this.mergeInst = mergeInstExpr
  if this.mergeInst != nil:
    return this.mergeInst

proc maskOs(this: Elf_SectionHeaderFlags): bool = 

  ##[
  OS-specific
  ]##
  if this.maskOsInst != nil:
    return this.maskOsInst
  let maskOsInstExpr = bool((this.value and 267386880) != 0)
  this.maskOsInst = maskOsInstExpr
  if this.maskOsInst != nil:
    return this.maskOsInst

proc exclude(this: Elf_SectionHeaderFlags): bool = 

  ##[
  section is excluded unless referenced or allocated (Solaris)
  ]##
  if this.excludeInst != nil:
    return this.excludeInst
  let excludeInstExpr = bool((this.value and 134217728) != 0)
  this.excludeInst = excludeInstExpr
  if this.excludeInst != nil:
    return this.excludeInst

proc maskProc(this: Elf_SectionHeaderFlags): bool = 

  ##[
  Processor-specific
  ]##
  if this.maskProcInst != nil:
    return this.maskProcInst
  let maskProcInstExpr = bool((this.value and 4026531840'i64) != 0)
  this.maskProcInst = maskProcInstExpr
  if this.maskProcInst != nil:
    return this.maskProcInst

proc strings(this: Elf_SectionHeaderFlags): bool = 

  ##[
  contains nul-terminated strings
  ]##
  if this.stringsInst != nil:
    return this.stringsInst
  let stringsInstExpr = bool((this.value and 32) != 0)
  this.stringsInst = stringsInstExpr
  if this.stringsInst != nil:
    return this.stringsInst

proc osNonConforming(this: Elf_SectionHeaderFlags): bool = 

  ##[
  non-standard OS specific handling required
  ]##
  if this.osNonConformingInst != nil:
    return this.osNonConformingInst
  let osNonConformingInstExpr = bool((this.value and 256) != 0)
  this.osNonConformingInst = osNonConformingInstExpr
  if this.osNonConformingInst != nil:
    return this.osNonConformingInst

proc alloc(this: Elf_SectionHeaderFlags): bool = 

  ##[
  occupies memory during execution
  ]##
  if this.allocInst != nil:
    return this.allocInst
  let allocInstExpr = bool((this.value and 2) != 0)
  this.allocInst = allocInstExpr
  if this.allocInst != nil:
    return this.allocInst

proc execInstr(this: Elf_SectionHeaderFlags): bool = 

  ##[
  executable
  ]##
  if this.execInstrInst != nil:
    return this.execInstrInst
  let execInstrInstExpr = bool((this.value and 4) != 0)
  this.execInstrInst = execInstrInstExpr
  if this.execInstrInst != nil:
    return this.execInstrInst

proc infoLink(this: Elf_SectionHeaderFlags): bool = 

  ##[
  'sh_info' contains SHT index
  ]##
  if this.infoLinkInst != nil:
    return this.infoLinkInst
  let infoLinkInstExpr = bool((this.value and 64) != 0)
  this.infoLinkInst = infoLinkInstExpr
  if this.infoLinkInst != nil:
    return this.infoLinkInst

proc write(this: Elf_SectionHeaderFlags): bool = 

  ##[
  writable
  ]##
  if this.writeInst != nil:
    return this.writeInst
  let writeInstExpr = bool((this.value and 1) != 0)
  this.writeInst = writeInstExpr
  if this.writeInst != nil:
    return this.writeInst

proc linkOrder(this: Elf_SectionHeaderFlags): bool = 

  ##[
  preserve order after combining
  ]##
  if this.linkOrderInst != nil:
    return this.linkOrderInst
  let linkOrderInstExpr = bool((this.value and 128) != 0)
  this.linkOrderInst = linkOrderInstExpr
  if this.linkOrderInst != nil:
    return this.linkOrderInst

proc ordered(this: Elf_SectionHeaderFlags): bool = 

  ##[
  special ordering requirement (Solaris)
  ]##
  if this.orderedInst != nil:
    return this.orderedInst
  let orderedInstExpr = bool((this.value and 67108864) != 0)
  this.orderedInst = orderedInstExpr
  if this.orderedInst != nil:
    return this.orderedInst

proc tls(this: Elf_SectionHeaderFlags): bool = 

  ##[
  section hold thread-local data
  ]##
  if this.tlsInst != nil:
    return this.tlsInst
  let tlsInstExpr = bool((this.value and 1024) != 0)
  this.tlsInst = tlsInstExpr
  if this.tlsInst != nil:
    return this.tlsInst

proc group(this: Elf_SectionHeaderFlags): bool = 

  ##[
  section is member of a group
  ]##
  if this.groupInst != nil:
    return this.groupInst
  let groupInstExpr = bool((this.value and 512) != 0)
  this.groupInst = groupInstExpr
  if this.groupInst != nil:
    return this.groupInst

proc fromFile*(_: typedesc[Elf_SectionHeaderFlags], filename: string): Elf_SectionHeaderFlags =
  Elf_SectionHeaderFlags.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Elf_DtFlag1Values], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_DynamicSectionEntry, value: any): Elf_DtFlag1Values =
  template this: untyped = result
  this = new(Elf_DtFlag1Values)
  let root = if root == nil: cast[Elf](this) else: cast[Elf](root)
  this.io = io
  this.root = root
  this.parent = parent
  let valueExpr = uint32(value)
  this.value = valueExpr


proc singleton(this: Elf_DtFlag1Values): bool = 

  ##[
  Singleton symbols are used.
  ]##
  if this.singletonInst != nil:
    return this.singletonInst
  let singletonInstExpr = bool((this.value and 33554432) != 0)
  this.singletonInst = singletonInstExpr
  if this.singletonInst != nil:
    return this.singletonInst

proc ignmuldef(this: Elf_DtFlag1Values): bool = 
  if this.ignmuldefInst != nil:
    return this.ignmuldefInst
  let ignmuldefInstExpr = bool((this.value and 262144) != 0)
  this.ignmuldefInst = ignmuldefInstExpr
  if this.ignmuldefInst != nil:
    return this.ignmuldefInst

proc loadfltr(this: Elf_DtFlag1Values): bool = 

  ##[
  Trigger filtee loading at runtime.
  ]##
  if this.loadfltrInst != nil:
    return this.loadfltrInst
  let loadfltrInstExpr = bool((this.value and 16) != 0)
  this.loadfltrInst = loadfltrInstExpr
  if this.loadfltrInst != nil:
    return this.loadfltrInst

proc initfirst(this: Elf_DtFlag1Values): bool = 

  ##[
  Set RTLD_INITFIRST for this object
  ]##
  if this.initfirstInst != nil:
    return this.initfirstInst
  let initfirstInstExpr = bool((this.value and 32) != 0)
  this.initfirstInst = initfirstInstExpr
  if this.initfirstInst != nil:
    return this.initfirstInst

proc symintpose(this: Elf_DtFlag1Values): bool = 

  ##[
  Object has individual interposers.
  ]##
  if this.symintposeInst != nil:
    return this.symintposeInst
  let symintposeInstExpr = bool((this.value and 8388608) != 0)
  this.symintposeInst = symintposeInstExpr
  if this.symintposeInst != nil:
    return this.symintposeInst

proc noreloc(this: Elf_DtFlag1Values): bool = 
  if this.norelocInst != nil:
    return this.norelocInst
  let norelocInstExpr = bool((this.value and 4194304) != 0)
  this.norelocInst = norelocInstExpr
  if this.norelocInst != nil:
    return this.norelocInst

proc confalt(this: Elf_DtFlag1Values): bool = 

  ##[
  Configuration alternative created.
  ]##
  if this.confaltInst != nil:
    return this.confaltInst
  let confaltInstExpr = bool((this.value and 8192) != 0)
  this.confaltInst = confaltInstExpr
  if this.confaltInst != nil:
    return this.confaltInst

proc dispreldne(this: Elf_DtFlag1Values): bool = 

  ##[
  Disp reloc applied at build time.
  ]##
  if this.dispreldneInst != nil:
    return this.dispreldneInst
  let dispreldneInstExpr = bool((this.value and 32768) != 0)
  this.dispreldneInst = dispreldneInstExpr
  if this.dispreldneInst != nil:
    return this.dispreldneInst

proc rtldGlobal(this: Elf_DtFlag1Values): bool = 

  ##[
  Set RTLD_GLOBAL for this object.
  ]##
  if this.rtldGlobalInst != nil:
    return this.rtldGlobalInst
  let rtldGlobalInstExpr = bool((this.value and 2) != 0)
  this.rtldGlobalInst = rtldGlobalInstExpr
  if this.rtldGlobalInst != nil:
    return this.rtldGlobalInst

proc nodelete(this: Elf_DtFlag1Values): bool = 

  ##[
  Set RTLD_NODELETE for this object.
  ]##
  if this.nodeleteInst != nil:
    return this.nodeleteInst
  let nodeleteInstExpr = bool((this.value and 8) != 0)
  this.nodeleteInst = nodeleteInstExpr
  if this.nodeleteInst != nil:
    return this.nodeleteInst

proc trans(this: Elf_DtFlag1Values): bool = 
  if this.transInst != nil:
    return this.transInst
  let transInstExpr = bool((this.value and 512) != 0)
  this.transInst = transInstExpr
  if this.transInst != nil:
    return this.transInst

proc origin(this: Elf_DtFlag1Values): bool = 

  ##[
  $ORIGIN must be handled.
  ]##
  if this.originInst != nil:
    return this.originInst
  let originInstExpr = bool((this.value and 128) != 0)
  this.originInst = originInstExpr
  if this.originInst != nil:
    return this.originInst

proc now(this: Elf_DtFlag1Values): bool = 

  ##[
  Set RTLD_NOW for this object.
  ]##
  if this.nowInst != nil:
    return this.nowInst
  let nowInstExpr = bool((this.value and 1) != 0)
  this.nowInst = nowInstExpr
  if this.nowInst != nil:
    return this.nowInst

proc nohdr(this: Elf_DtFlag1Values): bool = 
  if this.nohdrInst != nil:
    return this.nohdrInst
  let nohdrInstExpr = bool((this.value and 1048576) != 0)
  this.nohdrInst = nohdrInstExpr
  if this.nohdrInst != nil:
    return this.nohdrInst

proc endfiltee(this: Elf_DtFlag1Values): bool = 

  ##[
  Filtee terminates filters search.
  ]##
  if this.endfilteeInst != nil:
    return this.endfilteeInst
  let endfilteeInstExpr = bool((this.value and 16384) != 0)
  this.endfilteeInst = endfilteeInstExpr
  if this.endfilteeInst != nil:
    return this.endfilteeInst

proc nodirect(this: Elf_DtFlag1Values): bool = 

  ##[
  Object has no-direct binding.
  ]##
  if this.nodirectInst != nil:
    return this.nodirectInst
  let nodirectInstExpr = bool((this.value and 131072) != 0)
  this.nodirectInst = nodirectInstExpr
  if this.nodirectInst != nil:
    return this.nodirectInst

proc globaudit(this: Elf_DtFlag1Values): bool = 

  ##[
  Global auditing required.
  ]##
  if this.globauditInst != nil:
    return this.globauditInst
  let globauditInstExpr = bool((this.value and 16777216) != 0)
  this.globauditInst = globauditInstExpr
  if this.globauditInst != nil:
    return this.globauditInst

proc noksyms(this: Elf_DtFlag1Values): bool = 
  if this.noksymsInst != nil:
    return this.noksymsInst
  let noksymsInstExpr = bool((this.value and 524288) != 0)
  this.noksymsInst = noksymsInstExpr
  if this.noksymsInst != nil:
    return this.noksymsInst

proc interpose(this: Elf_DtFlag1Values): bool = 

  ##[
  Object is used to interpose.
  ]##
  if this.interposeInst != nil:
    return this.interposeInst
  let interposeInstExpr = bool((this.value and 1024) != 0)
  this.interposeInst = interposeInstExpr
  if this.interposeInst != nil:
    return this.interposeInst

proc nodump(this: Elf_DtFlag1Values): bool = 

  ##[
  Object can't be dldump'ed.
  ]##
  if this.nodumpInst != nil:
    return this.nodumpInst
  let nodumpInstExpr = bool((this.value and 4096) != 0)
  this.nodumpInst = nodumpInstExpr
  if this.nodumpInst != nil:
    return this.nodumpInst

proc disprelpnd(this: Elf_DtFlag1Values): bool = 

  ##[
  Disp reloc applied at run-time.
  ]##
  if this.disprelpndInst != nil:
    return this.disprelpndInst
  let disprelpndInstExpr = bool((this.value and 65536) != 0)
  this.disprelpndInst = disprelpndInstExpr
  if this.disprelpndInst != nil:
    return this.disprelpndInst

proc noopen(this: Elf_DtFlag1Values): bool = 

  ##[
  Set RTLD_NOOPEN for this object.
  ]##
  if this.noopenInst != nil:
    return this.noopenInst
  let noopenInstExpr = bool((this.value and 64) != 0)
  this.noopenInst = noopenInstExpr
  if this.noopenInst != nil:
    return this.noopenInst

proc stub(this: Elf_DtFlag1Values): bool = 
  if this.stubInst != nil:
    return this.stubInst
  let stubInstExpr = bool((this.value and 67108864) != 0)
  this.stubInst = stubInstExpr
  if this.stubInst != nil:
    return this.stubInst

proc direct(this: Elf_DtFlag1Values): bool = 

  ##[
  Direct binding enabled.
  ]##
  if this.directInst != nil:
    return this.directInst
  let directInstExpr = bool((this.value and 256) != 0)
  this.directInst = directInstExpr
  if this.directInst != nil:
    return this.directInst

proc edited(this: Elf_DtFlag1Values): bool = 

  ##[
  Object is modified after built.
  ]##
  if this.editedInst != nil:
    return this.editedInst
  let editedInstExpr = bool((this.value and 2097152) != 0)
  this.editedInst = editedInstExpr
  if this.editedInst != nil:
    return this.editedInst

proc group(this: Elf_DtFlag1Values): bool = 

  ##[
  Set RTLD_GROUP for this object.
  ]##
  if this.groupInst != nil:
    return this.groupInst
  let groupInstExpr = bool((this.value and 4) != 0)
  this.groupInst = groupInstExpr
  if this.groupInst != nil:
    return this.groupInst

proc pie(this: Elf_DtFlag1Values): bool = 
  if this.pieInst != nil:
    return this.pieInst
  let pieInstExpr = bool((this.value and 134217728) != 0)
  this.pieInst = pieInstExpr
  if this.pieInst != nil:
    return this.pieInst

proc nodeflib(this: Elf_DtFlag1Values): bool = 

  ##[
  Ignore default lib search path.
  ]##
  if this.nodeflibInst != nil:
    return this.nodeflibInst
  let nodeflibInstExpr = bool((this.value and 2048) != 0)
  this.nodeflibInst = nodeflibInstExpr
  if this.nodeflibInst != nil:
    return this.nodeflibInst

proc fromFile*(_: typedesc[Elf_DtFlag1Values], filename: string): Elf_DtFlag1Values =
  Elf_DtFlag1Values.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Elf_EndianElf) =
  let eTypeExpr = Elf_ObjType(this.io.readU2le())
  this.eType = eTypeExpr
  let machineExpr = Elf_Machine(this.io.readU2le())
  this.machine = machineExpr
  let eVersionExpr = this.io.readU4le()
  this.eVersion = eVersionExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let entryPointExpr = uint64(this.io.readU4le())
      this.entryPoint = entryPointExpr
    elif on == elf.b64:
      let entryPointExpr = this.io.readU8le()
      this.entryPoint = entryPointExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let programHeaderOffsetExpr = uint64(this.io.readU4le())
      this.programHeaderOffset = programHeaderOffsetExpr
    elif on == elf.b64:
      let programHeaderOffsetExpr = this.io.readU8le()
      this.programHeaderOffset = programHeaderOffsetExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let sectionHeaderOffsetExpr = uint64(this.io.readU4le())
      this.sectionHeaderOffset = sectionHeaderOffsetExpr
    elif on == elf.b64:
      let sectionHeaderOffsetExpr = this.io.readU8le()
      this.sectionHeaderOffset = sectionHeaderOffsetExpr
  let flagsExpr = this.io.readBytes(int(4))
  this.flags = flagsExpr
  let eEhsizeExpr = this.io.readU2le()
  this.eEhsize = eEhsizeExpr
  let programHeaderEntrySizeExpr = this.io.readU2le()
  this.programHeaderEntrySize = programHeaderEntrySizeExpr
  let qtyProgramHeaderExpr = this.io.readU2le()
  this.qtyProgramHeader = qtyProgramHeaderExpr
  let sectionHeaderEntrySizeExpr = this.io.readU2le()
  this.sectionHeaderEntrySize = sectionHeaderEntrySizeExpr
  let qtySectionHeaderExpr = this.io.readU2le()
  this.qtySectionHeader = qtySectionHeaderExpr
  let sectionNamesIdxExpr = this.io.readU2le()
  this.sectionNamesIdx = sectionNamesIdxExpr


proc readBe(this: Elf_EndianElf) =
  let eTypeExpr = Elf_ObjType(this.io.readU2be())
  this.eType = eTypeExpr
  let machineExpr = Elf_Machine(this.io.readU2be())
  this.machine = machineExpr
  let eVersionExpr = this.io.readU4be()
  this.eVersion = eVersionExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let entryPointExpr = uint64(this.io.readU4be())
      this.entryPoint = entryPointExpr
    elif on == elf.b64:
      let entryPointExpr = this.io.readU8be()
      this.entryPoint = entryPointExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let programHeaderOffsetExpr = uint64(this.io.readU4be())
      this.programHeaderOffset = programHeaderOffsetExpr
    elif on == elf.b64:
      let programHeaderOffsetExpr = this.io.readU8be()
      this.programHeaderOffset = programHeaderOffsetExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let sectionHeaderOffsetExpr = uint64(this.io.readU4be())
      this.sectionHeaderOffset = sectionHeaderOffsetExpr
    elif on == elf.b64:
      let sectionHeaderOffsetExpr = this.io.readU8be()
      this.sectionHeaderOffset = sectionHeaderOffsetExpr
  let flagsExpr = this.io.readBytes(int(4))
  this.flags = flagsExpr
  let eEhsizeExpr = this.io.readU2be()
  this.eEhsize = eEhsizeExpr
  let programHeaderEntrySizeExpr = this.io.readU2be()
  this.programHeaderEntrySize = programHeaderEntrySizeExpr
  let qtyProgramHeaderExpr = this.io.readU2be()
  this.qtyProgramHeader = qtyProgramHeaderExpr
  let sectionHeaderEntrySizeExpr = this.io.readU2be()
  this.sectionHeaderEntrySize = sectionHeaderEntrySizeExpr
  let qtySectionHeaderExpr = this.io.readU2be()
  this.qtySectionHeader = qtySectionHeaderExpr
  let sectionNamesIdxExpr = this.io.readU2be()
  this.sectionNamesIdx = sectionNamesIdxExpr

proc read*(_: typedesc[Elf_EndianElf], io: KaitaiStream, root: KaitaiStruct, parent: Elf): Elf_EndianElf =
  template this: untyped = result
  this = new(Elf_EndianElf)
  let root = if root == nil: cast[Elf](this) else: cast[Elf](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = false

  block:
    let on = Elf(this.root).endian
    if on == elf.le:
      let isLeExpr = bool(true)
      this.isLe = isLeExpr
    elif on == elf.be:
      let isLeExpr = bool(false)
      this.isLe = isLeExpr

  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc programHeaders(this: Elf_EndianElf): seq[Elf_EndianElf_ProgramHeader] = 
  if this.programHeadersInst.len != 0:
    return this.programHeadersInst
  let pos = this.io.pos()
  this.io.seek(int(this.programHeaderOffset))
  if this.isLe:
    for i in 0 ..< int(this.qtyProgramHeader):
      let buf = this.io.readBytes(int(this.programHeaderEntrySize))
      this.rawProgramHeadersInst.add(buf)
      let rawProgramHeadersInstIo = newKaitaiStream(buf)
      let it = Elf_EndianElf_ProgramHeader.read(rawProgramHeadersInstIo, this.root, this)
      this.programHeadersInst.add(it)
  else:
    for i in 0 ..< int(this.qtyProgramHeader):
      let buf = this.io.readBytes(int(this.programHeaderEntrySize))
      this.rawProgramHeadersInst.add(buf)
      let rawProgramHeadersInstIo = newKaitaiStream(buf)
      let it = Elf_EndianElf_ProgramHeader.read(rawProgramHeadersInstIo, this.root, this)
      this.programHeadersInst.add(it)
  this.io.seek(pos)
  if this.programHeadersInst.len != 0:
    return this.programHeadersInst

proc sectionHeaders(this: Elf_EndianElf): seq[Elf_EndianElf_SectionHeader] = 
  if this.sectionHeadersInst.len != 0:
    return this.sectionHeadersInst
  let pos = this.io.pos()
  this.io.seek(int(this.sectionHeaderOffset))
  if this.isLe:
    for i in 0 ..< int(this.qtySectionHeader):
      let buf = this.io.readBytes(int(this.sectionHeaderEntrySize))
      this.rawSectionHeadersInst.add(buf)
      let rawSectionHeadersInstIo = newKaitaiStream(buf)
      let it = Elf_EndianElf_SectionHeader.read(rawSectionHeadersInstIo, this.root, this)
      this.sectionHeadersInst.add(it)
  else:
    for i in 0 ..< int(this.qtySectionHeader):
      let buf = this.io.readBytes(int(this.sectionHeaderEntrySize))
      this.rawSectionHeadersInst.add(buf)
      let rawSectionHeadersInstIo = newKaitaiStream(buf)
      let it = Elf_EndianElf_SectionHeader.read(rawSectionHeadersInstIo, this.root, this)
      this.sectionHeadersInst.add(it)
  this.io.seek(pos)
  if this.sectionHeadersInst.len != 0:
    return this.sectionHeadersInst

proc strings(this: Elf_EndianElf): Elf_EndianElf_StringsStruct = 
  if this.stringsInst != nil:
    return this.stringsInst
  let pos = this.io.pos()
  this.io.seek(int(this.sectionHeaders[this.sectionNamesIdx].ofsBody))
  if this.isLe:
    let rawStringsInstExpr = this.io.readBytes(int(this.sectionHeaders[this.sectionNamesIdx].lenBody))
    this.rawStringsInst = rawStringsInstExpr
    let rawStringsInstIo = newKaitaiStream(rawStringsInstExpr)
    let stringsInstExpr = Elf_EndianElf_StringsStruct.read(rawStringsInstIo, this.root, this)
    this.stringsInst = stringsInstExpr
  else:
    let rawStringsInstExpr = this.io.readBytes(int(this.sectionHeaders[this.sectionNamesIdx].lenBody))
    this.rawStringsInst = rawStringsInstExpr
    let rawStringsInstIo = newKaitaiStream(rawStringsInstExpr)
    let stringsInstExpr = Elf_EndianElf_StringsStruct.read(rawStringsInstIo, this.root, this)
    this.stringsInst = stringsInstExpr
  this.io.seek(pos)
  if this.stringsInst != nil:
    return this.stringsInst

proc fromFile*(_: typedesc[Elf_EndianElf], filename: string): Elf_EndianElf =
  Elf_EndianElf.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Elf_EndianElf_DynsymSectionEntry64) =
  let nameOffsetExpr = this.io.readU4le()
  this.nameOffset = nameOffsetExpr
  let infoExpr = this.io.readU1()
  this.info = infoExpr
  let otherExpr = this.io.readU1()
  this.other = otherExpr
  let shndxExpr = this.io.readU2le()
  this.shndx = shndxExpr
  let valueExpr = this.io.readU8le()
  this.value = valueExpr
  let sizeExpr = this.io.readU8le()
  this.size = sizeExpr


proc readBe(this: Elf_EndianElf_DynsymSectionEntry64) =
  let nameOffsetExpr = this.io.readU4be()
  this.nameOffset = nameOffsetExpr
  let infoExpr = this.io.readU1()
  this.info = infoExpr
  let otherExpr = this.io.readU1()
  this.other = otherExpr
  let shndxExpr = this.io.readU2be()
  this.shndx = shndxExpr
  let valueExpr = this.io.readU8be()
  this.value = valueExpr
  let sizeExpr = this.io.readU8be()
  this.size = sizeExpr

proc read*(_: typedesc[Elf_EndianElf_DynsymSectionEntry64], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_DynsymSection): Elf_EndianElf_DynsymSectionEntry64 =
  template this: untyped = result
  this = new(Elf_EndianElf_DynsymSectionEntry64)
  let root = if root == nil: cast[Elf](this) else: cast[Elf](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc fromFile*(_: typedesc[Elf_EndianElf_DynsymSectionEntry64], filename: string): Elf_EndianElf_DynsymSectionEntry64 =
  Elf_EndianElf_DynsymSectionEntry64.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Elf_EndianElf_NoteSection) =
  block:
    var i: int
    while not this.io.isEof:
      let it = Elf_EndianElf_NoteSectionEntry.read(this.io, this.root, this)
      this.entries.add(it)
      inc i


proc readBe(this: Elf_EndianElf_NoteSection) =
  block:
    var i: int
    while not this.io.isEof:
      let it = Elf_EndianElf_NoteSectionEntry.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc read*(_: typedesc[Elf_EndianElf_NoteSection], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_SectionHeader): Elf_EndianElf_NoteSection =
  template this: untyped = result
  this = new(Elf_EndianElf_NoteSection)
  let root = if root == nil: cast[Elf](this) else: cast[Elf](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc fromFile*(_: typedesc[Elf_EndianElf_NoteSection], filename: string): Elf_EndianElf_NoteSection =
  Elf_EndianElf_NoteSection.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Elf_EndianElf_ProgramHeader) =
  let typeExpr = Elf_PhType(this.io.readU4le())
  this.type = typeExpr
  if Elf(this.root).bits == elf.b64:
    let flags64Expr = this.io.readU4le()
    this.flags64 = flags64Expr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let offsetExpr = uint64(this.io.readU4le())
      this.offset = offsetExpr
    elif on == elf.b64:
      let offsetExpr = this.io.readU8le()
      this.offset = offsetExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let vaddrExpr = uint64(this.io.readU4le())
      this.vaddr = vaddrExpr
    elif on == elf.b64:
      let vaddrExpr = this.io.readU8le()
      this.vaddr = vaddrExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let paddrExpr = uint64(this.io.readU4le())
      this.paddr = paddrExpr
    elif on == elf.b64:
      let paddrExpr = this.io.readU8le()
      this.paddr = paddrExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let fileszExpr = uint64(this.io.readU4le())
      this.filesz = fileszExpr
    elif on == elf.b64:
      let fileszExpr = this.io.readU8le()
      this.filesz = fileszExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let memszExpr = uint64(this.io.readU4le())
      this.memsz = memszExpr
    elif on == elf.b64:
      let memszExpr = this.io.readU8le()
      this.memsz = memszExpr
  if Elf(this.root).bits == elf.b32:
    let flags32Expr = this.io.readU4le()
    this.flags32 = flags32Expr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let alignExpr = uint64(this.io.readU4le())
      this.align = alignExpr
    elif on == elf.b64:
      let alignExpr = this.io.readU8le()
      this.align = alignExpr


proc readBe(this: Elf_EndianElf_ProgramHeader) =
  let typeExpr = Elf_PhType(this.io.readU4be())
  this.type = typeExpr
  if Elf(this.root).bits == elf.b64:
    let flags64Expr = this.io.readU4be()
    this.flags64 = flags64Expr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let offsetExpr = uint64(this.io.readU4be())
      this.offset = offsetExpr
    elif on == elf.b64:
      let offsetExpr = this.io.readU8be()
      this.offset = offsetExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let vaddrExpr = uint64(this.io.readU4be())
      this.vaddr = vaddrExpr
    elif on == elf.b64:
      let vaddrExpr = this.io.readU8be()
      this.vaddr = vaddrExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let paddrExpr = uint64(this.io.readU4be())
      this.paddr = paddrExpr
    elif on == elf.b64:
      let paddrExpr = this.io.readU8be()
      this.paddr = paddrExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let fileszExpr = uint64(this.io.readU4be())
      this.filesz = fileszExpr
    elif on == elf.b64:
      let fileszExpr = this.io.readU8be()
      this.filesz = fileszExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let memszExpr = uint64(this.io.readU4be())
      this.memsz = memszExpr
    elif on == elf.b64:
      let memszExpr = this.io.readU8be()
      this.memsz = memszExpr
  if Elf(this.root).bits == elf.b32:
    let flags32Expr = this.io.readU4be()
    this.flags32 = flags32Expr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let alignExpr = uint64(this.io.readU4be())
      this.align = alignExpr
    elif on == elf.b64:
      let alignExpr = this.io.readU8be()
      this.align = alignExpr

proc read*(_: typedesc[Elf_EndianElf_ProgramHeader], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf): Elf_EndianElf_ProgramHeader =
  template this: untyped = result
  this = new(Elf_EndianElf_ProgramHeader)
  let root = if root == nil: cast[Elf](this) else: cast[Elf](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc dynamic(this: Elf_EndianElf_ProgramHeader): Elf_EndianElf_DynamicSection = 
  if this.dynamicInst != nil:
    return this.dynamicInst
  if this.type == elf.dynamic:
    let io = Elf(this.root).io
    let pos = io.pos()
    io.seek(int(this.offset))
    if this.isLe:
      let rawDynamicInstExpr = io.readBytes(int(this.filesz))
      this.rawDynamicInst = rawDynamicInstExpr
      let rawDynamicInstIo = newKaitaiStream(rawDynamicInstExpr)
      let dynamicInstExpr = Elf_EndianElf_DynamicSection.read(rawDynamicInstIo, this.root, this)
      this.dynamicInst = dynamicInstExpr
    else:
      let rawDynamicInstExpr = io.readBytes(int(this.filesz))
      this.rawDynamicInst = rawDynamicInstExpr
      let rawDynamicInstIo = newKaitaiStream(rawDynamicInstExpr)
      let dynamicInstExpr = Elf_EndianElf_DynamicSection.read(rawDynamicInstIo, this.root, this)
      this.dynamicInst = dynamicInstExpr
    io.seek(pos)
  if this.dynamicInst != nil:
    return this.dynamicInst

proc flagsObj(this: Elf_EndianElf_ProgramHeader): Elf_PhdrTypeFlags = 
  if this.flagsObjInst != nil:
    return this.flagsObjInst
  if this.isLe:
    block:
      let on = Elf(this.root).bits
      if on == elf.b32:
        let flagsObjInstExpr = Elf_PhdrTypeFlags.read(this.io, this.root, this, this.flags32)
        this.flagsObjInst = flagsObjInstExpr
      elif on == elf.b64:
        let flagsObjInstExpr = Elf_PhdrTypeFlags.read(this.io, this.root, this, this.flags64)
        this.flagsObjInst = flagsObjInstExpr
  else:
    block:
      let on = Elf(this.root).bits
      if on == elf.b32:
        let flagsObjInstExpr = Elf_PhdrTypeFlags.read(this.io, this.root, this, this.flags32)
        this.flagsObjInst = flagsObjInstExpr
      elif on == elf.b64:
        let flagsObjInstExpr = Elf_PhdrTypeFlags.read(this.io, this.root, this, this.flags64)
        this.flagsObjInst = flagsObjInstExpr
  if this.flagsObjInst != nil:
    return this.flagsObjInst

proc fromFile*(_: typedesc[Elf_EndianElf_ProgramHeader], filename: string): Elf_EndianElf_ProgramHeader =
  Elf_EndianElf_ProgramHeader.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Elf_EndianElf_DynamicSectionEntry) =
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let tagExpr = uint64(this.io.readU4le())
      this.tag = tagExpr
    elif on == elf.b64:
      let tagExpr = this.io.readU8le()
      this.tag = tagExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let valueOrPtrExpr = uint64(this.io.readU4le())
      this.valueOrPtr = valueOrPtrExpr
    elif on == elf.b64:
      let valueOrPtrExpr = this.io.readU8le()
      this.valueOrPtr = valueOrPtrExpr


proc readBe(this: Elf_EndianElf_DynamicSectionEntry) =
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let tagExpr = uint64(this.io.readU4be())
      this.tag = tagExpr
    elif on == elf.b64:
      let tagExpr = this.io.readU8be()
      this.tag = tagExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let valueOrPtrExpr = uint64(this.io.readU4be())
      this.valueOrPtr = valueOrPtrExpr
    elif on == elf.b64:
      let valueOrPtrExpr = this.io.readU8be()
      this.valueOrPtr = valueOrPtrExpr

proc read*(_: typedesc[Elf_EndianElf_DynamicSectionEntry], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_DynamicSection): Elf_EndianElf_DynamicSectionEntry =
  template this: untyped = result
  this = new(Elf_EndianElf_DynamicSectionEntry)
  let root = if root == nil: cast[Elf](this) else: cast[Elf](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc tagEnum(this: Elf_EndianElf_DynamicSectionEntry): Elf_DynamicArrayTags = 
  if this.tagEnumInst != nil:
    return this.tagEnumInst
  let tagEnumInstExpr = Elf_DynamicArrayTags(Elf_DynamicArrayTags(this.tag))
  this.tagEnumInst = tagEnumInstExpr
  if this.tagEnumInst != nil:
    return this.tagEnumInst

proc flag1Values(this: Elf_EndianElf_DynamicSectionEntry): Elf_DtFlag1Values = 
  if this.flag1ValuesInst != nil:
    return this.flag1ValuesInst
  if this.tagEnum == elf.flags_1:
    if this.isLe:
      let flag1ValuesInstExpr = Elf_DtFlag1Values.read(this.io, this.root, this, this.valueOrPtr)
      this.flag1ValuesInst = flag1ValuesInstExpr
    else:
      let flag1ValuesInstExpr = Elf_DtFlag1Values.read(this.io, this.root, this, this.valueOrPtr)
      this.flag1ValuesInst = flag1ValuesInstExpr
  if this.flag1ValuesInst != nil:
    return this.flag1ValuesInst

proc fromFile*(_: typedesc[Elf_EndianElf_DynamicSectionEntry], filename: string): Elf_EndianElf_DynamicSectionEntry =
  Elf_EndianElf_DynamicSectionEntry.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Elf_EndianElf_SectionHeader) =
  let ofsNameExpr = this.io.readU4le()
  this.ofsName = ofsNameExpr
  let typeExpr = Elf_ShType(this.io.readU4le())
  this.type = typeExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let flagsExpr = uint64(this.io.readU4le())
      this.flags = flagsExpr
    elif on == elf.b64:
      let flagsExpr = this.io.readU8le()
      this.flags = flagsExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let addrExpr = uint64(this.io.readU4le())
      this.addr = addrExpr
    elif on == elf.b64:
      let addrExpr = this.io.readU8le()
      this.addr = addrExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let ofsBodyExpr = uint64(this.io.readU4le())
      this.ofsBody = ofsBodyExpr
    elif on == elf.b64:
      let ofsBodyExpr = this.io.readU8le()
      this.ofsBody = ofsBodyExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let lenBodyExpr = uint64(this.io.readU4le())
      this.lenBody = lenBodyExpr
    elif on == elf.b64:
      let lenBodyExpr = this.io.readU8le()
      this.lenBody = lenBodyExpr
  let linkedSectionIdxExpr = this.io.readU4le()
  this.linkedSectionIdx = linkedSectionIdxExpr
  let infoExpr = this.io.readBytes(int(4))
  this.info = infoExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let alignExpr = uint64(this.io.readU4le())
      this.align = alignExpr
    elif on == elf.b64:
      let alignExpr = this.io.readU8le()
      this.align = alignExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let entrySizeExpr = uint64(this.io.readU4le())
      this.entrySize = entrySizeExpr
    elif on == elf.b64:
      let entrySizeExpr = this.io.readU8le()
      this.entrySize = entrySizeExpr


proc readBe(this: Elf_EndianElf_SectionHeader) =
  let ofsNameExpr = this.io.readU4be()
  this.ofsName = ofsNameExpr
  let typeExpr = Elf_ShType(this.io.readU4be())
  this.type = typeExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let flagsExpr = uint64(this.io.readU4be())
      this.flags = flagsExpr
    elif on == elf.b64:
      let flagsExpr = this.io.readU8be()
      this.flags = flagsExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let addrExpr = uint64(this.io.readU4be())
      this.addr = addrExpr
    elif on == elf.b64:
      let addrExpr = this.io.readU8be()
      this.addr = addrExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let ofsBodyExpr = uint64(this.io.readU4be())
      this.ofsBody = ofsBodyExpr
    elif on == elf.b64:
      let ofsBodyExpr = this.io.readU8be()
      this.ofsBody = ofsBodyExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let lenBodyExpr = uint64(this.io.readU4be())
      this.lenBody = lenBodyExpr
    elif on == elf.b64:
      let lenBodyExpr = this.io.readU8be()
      this.lenBody = lenBodyExpr
  let linkedSectionIdxExpr = this.io.readU4be()
  this.linkedSectionIdx = linkedSectionIdxExpr
  let infoExpr = this.io.readBytes(int(4))
  this.info = infoExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let alignExpr = uint64(this.io.readU4be())
      this.align = alignExpr
    elif on == elf.b64:
      let alignExpr = this.io.readU8be()
      this.align = alignExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let entrySizeExpr = uint64(this.io.readU4be())
      this.entrySize = entrySizeExpr
    elif on == elf.b64:
      let entrySizeExpr = this.io.readU8be()
      this.entrySize = entrySizeExpr

proc read*(_: typedesc[Elf_EndianElf_SectionHeader], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf): Elf_EndianElf_SectionHeader =
  template this: untyped = result
  this = new(Elf_EndianElf_SectionHeader)
  let root = if root == nil: cast[Elf](this) else: cast[Elf](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc body(this: Elf_EndianElf_SectionHeader): KaitaiStruct = 
  if this.bodyInst != nil:
    return this.bodyInst
  let io = Elf(this.root).io
  let pos = io.pos()
  io.seek(int(this.ofsBody))
  if this.isLe:
    block:
      let on = this.type
      if on == elf.rel:
        let rawBodyInstExpr = io.readBytes(int(this.lenBody))
        this.rawBodyInst = rawBodyInstExpr
        let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
        let bodyInstExpr = Elf_EndianElf_RelocationSection.read(rawBodyInstIo, this.root, this, false)
        this.bodyInst = bodyInstExpr
      elif on == elf.note:
        let rawBodyInstExpr = io.readBytes(int(this.lenBody))
        this.rawBodyInst = rawBodyInstExpr
        let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
        let bodyInstExpr = Elf_EndianElf_NoteSection.read(rawBodyInstIo, this.root, this)
        this.bodyInst = bodyInstExpr
      elif on == elf.symtab:
        let rawBodyInstExpr = io.readBytes(int(this.lenBody))
        this.rawBodyInst = rawBodyInstExpr
        let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
        let bodyInstExpr = Elf_EndianElf_DynsymSection.read(rawBodyInstIo, this.root, this)
        this.bodyInst = bodyInstExpr
      elif on == elf.strtab:
        let rawBodyInstExpr = io.readBytes(int(this.lenBody))
        this.rawBodyInst = rawBodyInstExpr
        let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
        let bodyInstExpr = Elf_EndianElf_StringsStruct.read(rawBodyInstIo, this.root, this)
        this.bodyInst = bodyInstExpr
      elif on == elf.dynamic:
        let rawBodyInstExpr = io.readBytes(int(this.lenBody))
        this.rawBodyInst = rawBodyInstExpr
        let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
        let bodyInstExpr = Elf_EndianElf_DynamicSection.read(rawBodyInstIo, this.root, this)
        this.bodyInst = bodyInstExpr
      elif on == elf.dynsym:
        let rawBodyInstExpr = io.readBytes(int(this.lenBody))
        this.rawBodyInst = rawBodyInstExpr
        let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
        let bodyInstExpr = Elf_EndianElf_DynsymSection.read(rawBodyInstIo, this.root, this)
        this.bodyInst = bodyInstExpr
      elif on == elf.rela:
        let rawBodyInstExpr = io.readBytes(int(this.lenBody))
        this.rawBodyInst = rawBodyInstExpr
        let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
        let bodyInstExpr = Elf_EndianElf_RelocationSection.read(rawBodyInstIo, this.root, this, true)
        this.bodyInst = bodyInstExpr
      else:
        let bodyInstExpr = io.readBytes(int(this.lenBody))
        this.bodyInst = bodyInstExpr
  else:
    block:
      let on = this.type
      if on == elf.rel:
        let rawBodyInstExpr = io.readBytes(int(this.lenBody))
        this.rawBodyInst = rawBodyInstExpr
        let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
        let bodyInstExpr = Elf_EndianElf_RelocationSection.read(rawBodyInstIo, this.root, this, false)
        this.bodyInst = bodyInstExpr
      elif on == elf.note:
        let rawBodyInstExpr = io.readBytes(int(this.lenBody))
        this.rawBodyInst = rawBodyInstExpr
        let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
        let bodyInstExpr = Elf_EndianElf_NoteSection.read(rawBodyInstIo, this.root, this)
        this.bodyInst = bodyInstExpr
      elif on == elf.symtab:
        let rawBodyInstExpr = io.readBytes(int(this.lenBody))
        this.rawBodyInst = rawBodyInstExpr
        let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
        let bodyInstExpr = Elf_EndianElf_DynsymSection.read(rawBodyInstIo, this.root, this)
        this.bodyInst = bodyInstExpr
      elif on == elf.strtab:
        let rawBodyInstExpr = io.readBytes(int(this.lenBody))
        this.rawBodyInst = rawBodyInstExpr
        let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
        let bodyInstExpr = Elf_EndianElf_StringsStruct.read(rawBodyInstIo, this.root, this)
        this.bodyInst = bodyInstExpr
      elif on == elf.dynamic:
        let rawBodyInstExpr = io.readBytes(int(this.lenBody))
        this.rawBodyInst = rawBodyInstExpr
        let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
        let bodyInstExpr = Elf_EndianElf_DynamicSection.read(rawBodyInstIo, this.root, this)
        this.bodyInst = bodyInstExpr
      elif on == elf.dynsym:
        let rawBodyInstExpr = io.readBytes(int(this.lenBody))
        this.rawBodyInst = rawBodyInstExpr
        let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
        let bodyInstExpr = Elf_EndianElf_DynsymSection.read(rawBodyInstIo, this.root, this)
        this.bodyInst = bodyInstExpr
      elif on == elf.rela:
        let rawBodyInstExpr = io.readBytes(int(this.lenBody))
        this.rawBodyInst = rawBodyInstExpr
        let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
        let bodyInstExpr = Elf_EndianElf_RelocationSection.read(rawBodyInstIo, this.root, this, true)
        this.bodyInst = bodyInstExpr
      else:
        let bodyInstExpr = io.readBytes(int(this.lenBody))
        this.bodyInst = bodyInstExpr
  io.seek(pos)
  if this.bodyInst != nil:
    return this.bodyInst

proc name(this: Elf_EndianElf_SectionHeader): string = 
  if this.nameInst.len != 0:
    return this.nameInst
  let io = Elf(this.root).header.strings.io
  let pos = io.pos()
  io.seek(int(this.ofsName))
  if this.isLe:
    let nameInstExpr = encode(io.readBytesTerm(0, false, true, true), "ASCII")
    this.nameInst = nameInstExpr
  else:
    let nameInstExpr = encode(io.readBytesTerm(0, false, true, true), "ASCII")
    this.nameInst = nameInstExpr
  io.seek(pos)
  if this.nameInst.len != 0:
    return this.nameInst

proc flagsObj(this: Elf_EndianElf_SectionHeader): Elf_SectionHeaderFlags = 
  if this.flagsObjInst != nil:
    return this.flagsObjInst
  if this.isLe:
    let flagsObjInstExpr = Elf_SectionHeaderFlags.read(this.io, this.root, this, this.flags)
    this.flagsObjInst = flagsObjInstExpr
  else:
    let flagsObjInstExpr = Elf_SectionHeaderFlags.read(this.io, this.root, this, this.flags)
    this.flagsObjInst = flagsObjInstExpr
  if this.flagsObjInst != nil:
    return this.flagsObjInst

proc fromFile*(_: typedesc[Elf_EndianElf_SectionHeader], filename: string): Elf_EndianElf_SectionHeader =
  Elf_EndianElf_SectionHeader.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/cd/E23824_01/html/819-0690/chapter6-54839.html">Source</a>
@see <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.reloc.html">Source</a>
]##

proc readLe(this: Elf_EndianElf_RelocationSection) =
  block:
    var i: int
    while not this.io.isEof:
      let it = Elf_EndianElf_RelocationSectionEntry.read(this.io, this.root, this)
      this.entries.add(it)
      inc i


proc readBe(this: Elf_EndianElf_RelocationSection) =
  block:
    var i: int
    while not this.io.isEof:
      let it = Elf_EndianElf_RelocationSectionEntry.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc read*(_: typedesc[Elf_EndianElf_RelocationSection], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_SectionHeader, hasAddend: any): Elf_EndianElf_RelocationSection =
  template this: untyped = result
  this = new(Elf_EndianElf_RelocationSection)
  let root = if root == nil: cast[Elf](this) else: cast[Elf](root)
  this.io = io
  this.root = root
  this.parent = parent
  let hasAddendExpr = bool(hasAddend)
  this.hasAddend = hasAddendExpr
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc fromFile*(_: typedesc[Elf_EndianElf_RelocationSection], filename: string): Elf_EndianElf_RelocationSection =
  Elf_EndianElf_RelocationSection.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Elf_EndianElf_DynamicSection) =
  block:
    var i: int
    while not this.io.isEof:
      let it = Elf_EndianElf_DynamicSectionEntry.read(this.io, this.root, this)
      this.entries.add(it)
      inc i


proc readBe(this: Elf_EndianElf_DynamicSection) =
  block:
    var i: int
    while not this.io.isEof:
      let it = Elf_EndianElf_DynamicSectionEntry.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc read*(_: typedesc[Elf_EndianElf_DynamicSection], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Elf_EndianElf_DynamicSection =
  template this: untyped = result
  this = new(Elf_EndianElf_DynamicSection)
  let root = if root == nil: cast[Elf](this) else: cast[Elf](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc fromFile*(_: typedesc[Elf_EndianElf_DynamicSection], filename: string): Elf_EndianElf_DynamicSection =
  Elf_EndianElf_DynamicSection.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Elf_EndianElf_DynsymSection) =
  block:
    var i: int
    while not this.io.isEof:
      block:
        let on = Elf(this.root).bits
        if on == elf.b32:
          let it = Elf_EndianElf_DynsymSectionEntry32.read(this.io, this.root, this)
          this.entries.add(it)
        elif on == elf.b64:
          let it = Elf_EndianElf_DynsymSectionEntry64.read(this.io, this.root, this)
          this.entries.add(it)
      inc i


proc readBe(this: Elf_EndianElf_DynsymSection) =
  block:
    var i: int
    while not this.io.isEof:
      block:
        let on = Elf(this.root).bits
        if on == elf.b32:
          let it = Elf_EndianElf_DynsymSectionEntry32.read(this.io, this.root, this)
          this.entries.add(it)
        elif on == elf.b64:
          let it = Elf_EndianElf_DynsymSectionEntry64.read(this.io, this.root, this)
          this.entries.add(it)
      inc i

proc read*(_: typedesc[Elf_EndianElf_DynsymSection], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_SectionHeader): Elf_EndianElf_DynsymSection =
  template this: untyped = result
  this = new(Elf_EndianElf_DynsymSection)
  let root = if root == nil: cast[Elf](this) else: cast[Elf](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc fromFile*(_: typedesc[Elf_EndianElf_DynsymSection], filename: string): Elf_EndianElf_DynsymSection =
  Elf_EndianElf_DynsymSection.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Elf_EndianElf_RelocationSectionEntry) =
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let offsetExpr = uint64(this.io.readU4le())
      this.offset = offsetExpr
    elif on == elf.b64:
      let offsetExpr = this.io.readU8le()
      this.offset = offsetExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let infoExpr = uint64(this.io.readU4le())
      this.info = infoExpr
    elif on == elf.b64:
      let infoExpr = this.io.readU8le()
      this.info = infoExpr
  if this.parent.hasAddend:
    block:
      let on = Elf(this.root).bits
      if on == elf.b32:
        let addendExpr = int64(this.io.readS4le())
        this.addend = addendExpr
      elif on == elf.b64:
        let addendExpr = this.io.readS8le()
        this.addend = addendExpr


proc readBe(this: Elf_EndianElf_RelocationSectionEntry) =
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let offsetExpr = uint64(this.io.readU4be())
      this.offset = offsetExpr
    elif on == elf.b64:
      let offsetExpr = this.io.readU8be()
      this.offset = offsetExpr
  block:
    let on = Elf(this.root).bits
    if on == elf.b32:
      let infoExpr = uint64(this.io.readU4be())
      this.info = infoExpr
    elif on == elf.b64:
      let infoExpr = this.io.readU8be()
      this.info = infoExpr
  if this.parent.hasAddend:
    block:
      let on = Elf(this.root).bits
      if on == elf.b32:
        let addendExpr = int64(this.io.readS4be())
        this.addend = addendExpr
      elif on == elf.b64:
        let addendExpr = this.io.readS8be()
        this.addend = addendExpr

proc read*(_: typedesc[Elf_EndianElf_RelocationSectionEntry], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_RelocationSection): Elf_EndianElf_RelocationSectionEntry =
  template this: untyped = result
  this = new(Elf_EndianElf_RelocationSectionEntry)
  let root = if root == nil: cast[Elf](this) else: cast[Elf](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc fromFile*(_: typedesc[Elf_EndianElf_RelocationSectionEntry], filename: string): Elf_EndianElf_RelocationSectionEntry =
  Elf_EndianElf_RelocationSectionEntry.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Elf_EndianElf_DynsymSectionEntry32) =
  let nameOffsetExpr = this.io.readU4le()
  this.nameOffset = nameOffsetExpr
  let valueExpr = this.io.readU4le()
  this.value = valueExpr
  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr
  let infoExpr = this.io.readU1()
  this.info = infoExpr
  let otherExpr = this.io.readU1()
  this.other = otherExpr
  let shndxExpr = this.io.readU2le()
  this.shndx = shndxExpr


proc readBe(this: Elf_EndianElf_DynsymSectionEntry32) =
  let nameOffsetExpr = this.io.readU4be()
  this.nameOffset = nameOffsetExpr
  let valueExpr = this.io.readU4be()
  this.value = valueExpr
  let sizeExpr = this.io.readU4be()
  this.size = sizeExpr
  let infoExpr = this.io.readU1()
  this.info = infoExpr
  let otherExpr = this.io.readU1()
  this.other = otherExpr
  let shndxExpr = this.io.readU2be()
  this.shndx = shndxExpr

proc read*(_: typedesc[Elf_EndianElf_DynsymSectionEntry32], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_DynsymSection): Elf_EndianElf_DynsymSectionEntry32 =
  template this: untyped = result
  this = new(Elf_EndianElf_DynsymSectionEntry32)
  let root = if root == nil: cast[Elf](this) else: cast[Elf](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc fromFile*(_: typedesc[Elf_EndianElf_DynsymSectionEntry32], filename: string): Elf_EndianElf_DynsymSectionEntry32 =
  Elf_EndianElf_DynsymSectionEntry32.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/cd/E23824_01/html/819-0690/chapter6-18048.html">Source</a>
@see <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.pheader.html#note_section">Source</a>
]##

proc readLe(this: Elf_EndianElf_NoteSectionEntry) =
  let lenNameExpr = this.io.readU4le()
  this.lenName = lenNameExpr
  let lenDescriptorExpr = this.io.readU4le()
  this.lenDescriptor = lenDescriptorExpr
  let typeExpr = this.io.readU4le()
  this.type = typeExpr

  ##[
  Although the ELF specification seems to hint that the `note_name` field
is ASCII this isn't the case for Linux binaries that have a
`.gnu.build.attributes` section.

  @see <a href="https://fedoraproject.org/wiki/Toolchain/Watermark#Proposed_Specification_for_non-loaded_notes">Source</a>
  ]##
  let nameExpr = this.io.readBytes(int(this.lenName)).bytesTerminate(0, false)
  this.name = nameExpr
  let namePaddingExpr = this.io.readBytes(int((-(this.lenName) %%% 4)))
  this.namePadding = namePaddingExpr
  let descriptorExpr = this.io.readBytes(int(this.lenDescriptor))
  this.descriptor = descriptorExpr
  let descriptorPaddingExpr = this.io.readBytes(int((-(this.lenDescriptor) %%% 4)))
  this.descriptorPadding = descriptorPaddingExpr


proc readBe(this: Elf_EndianElf_NoteSectionEntry) =
  let lenNameExpr = this.io.readU4be()
  this.lenName = lenNameExpr
  let lenDescriptorExpr = this.io.readU4be()
  this.lenDescriptor = lenDescriptorExpr
  let typeExpr = this.io.readU4be()
  this.type = typeExpr

  ##[
  Although the ELF specification seems to hint that the `note_name` field
is ASCII this isn't the case for Linux binaries that have a
`.gnu.build.attributes` section.

  @see <a href="https://fedoraproject.org/wiki/Toolchain/Watermark#Proposed_Specification_for_non-loaded_notes">Source</a>
  ]##
  let nameExpr = this.io.readBytes(int(this.lenName)).bytesTerminate(0, false)
  this.name = nameExpr
  let namePaddingExpr = this.io.readBytes(int((-(this.lenName) %%% 4)))
  this.namePadding = namePaddingExpr
  let descriptorExpr = this.io.readBytes(int(this.lenDescriptor))
  this.descriptor = descriptorExpr
  let descriptorPaddingExpr = this.io.readBytes(int((-(this.lenDescriptor) %%% 4)))
  this.descriptorPadding = descriptorPaddingExpr

proc read*(_: typedesc[Elf_EndianElf_NoteSectionEntry], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_NoteSection): Elf_EndianElf_NoteSectionEntry =
  template this: untyped = result
  this = new(Elf_EndianElf_NoteSectionEntry)
  let root = if root == nil: cast[Elf](this) else: cast[Elf](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc fromFile*(_: typedesc[Elf_EndianElf_NoteSectionEntry], filename: string): Elf_EndianElf_NoteSectionEntry =
  Elf_EndianElf_NoteSectionEntry.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Elf_EndianElf_StringsStruct) =
  block:
    var i: int
    while not this.io.isEof:
      let it = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
      this.entries.add(it)
      inc i


proc readBe(this: Elf_EndianElf_StringsStruct) =
  block:
    var i: int
    while not this.io.isEof:
      let it = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
      this.entries.add(it)
      inc i

proc read*(_: typedesc[Elf_EndianElf_StringsStruct], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Elf_EndianElf_StringsStruct =
  template this: untyped = result
  this = new(Elf_EndianElf_StringsStruct)
  let root = if root == nil: cast[Elf](this) else: cast[Elf](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc fromFile*(_: typedesc[Elf_EndianElf_StringsStruct], filename: string): Elf_EndianElf_StringsStruct =
  Elf_EndianElf_StringsStruct.read(newKaitaiFileStream(filename), nil, nil)

