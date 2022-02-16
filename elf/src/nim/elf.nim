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
    `shIdxLoOsInst`*: int
    `shIdxLoReservedInst`*: int
    `shIdxHiProcInst`*: int
    `shIdxLoProcInst`*: int
    `shIdxHiOsInst`*: int
    `shIdxHiReservedInst`*: int
  Elf_SymbolVisibility* = enum
    default = 0
    internal = 1
    hidden = 2
    protected = 3
    exported = 4
    singleton = 5
    eliminate = 6
  Elf_SymbolBinding* = enum
    local = 0
    global_symbol = 1
    weak = 2
    os10 = 10
    os11 = 11
    os12 = 12
    proc13 = 13
    proc14 = 14
    proc15 = 15
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
    sunw_symnsort = 1879048172
    sunw_phname = 1879048173
    sunw_ancillary = 1879048174
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
    arm_debugoverlay = 1879048196
    arm_overlaysection = 1879048197
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
    iamcu = 6
    i860 = 7
    mips = 8
    s370 = 9
    mips_rs3_le = 10
    parisc = 15
    vpp500 = 17
    sparc32plus = 18
    i960 = 19
    powerpc = 20
    powerpc64 = 21
    s390 = 22
    spu = 23
    v800 = 36
    fr20 = 37
    rh32 = 38
    rce = 39
    arm = 40
    old_alpha = 41
    superh = 42
    sparc_v9 = 43
    tricore = 44
    arc = 45
    h8_300 = 46
    h8_300h = 47
    h8s = 48
    h8_500 = 49
    ia_64 = 50
    mips_x = 51
    coldfire = 52
    m68hc12 = 53
    mma = 54
    pcp = 55
    ncpu = 56
    ndr1 = 57
    starcore = 58
    me16 = 59
    st100 = 60
    tinyj = 61
    x86_64 = 62
    pdsp = 63
    pdp10 = 64
    pdp11 = 65
    fx66 = 66
    st9plus = 67
    st7 = 68
    mc68hc16 = 69
    mc68hc11 = 70
    mc68hc08 = 71
    mc68hc05 = 72
    svx = 73
    st19 = 74
    vax = 75
    cris = 76
    javelin = 77
    firepath = 78
    zsp = 79
    mmix = 80
    huany = 81
    prism = 82
    avr = 83
    fr30 = 84
    d10v = 85
    d30v = 86
    v850 = 87
    m32r = 88
    mn10300 = 89
    mn10200 = 90
    picojava = 91
    openrisc = 92
    arc_compact = 93
    xtensa = 94
    videocore = 95
    tmm_gpp = 96
    ns32k = 97
    tpc = 98
    snp1k = 99
    st200 = 100
    ip2k = 101
    max = 102
    compact_risc = 103
    f2mc16 = 104
    msp430 = 105
    blackfin = 106
    se_c33 = 107
    sep = 108
    arca = 109
    unicore = 110
    excess = 111
    dxp = 112
    altera_nios2 = 113
    crx = 114
    xgate = 115
    c166 = 116
    m16c = 117
    dspic30f = 118
    freescale_ce = 119
    m32c = 120
    tsk3000 = 131
    rs08 = 132
    sharc = 133
    ecog2 = 134
    score7 = 135
    dsp24 = 136
    videocore3 = 137
    latticemico32 = 138
    se_c17 = 139
    ti_c6000 = 140
    ti_c2000 = 141
    ti_c5500 = 142
    ti_arp32 = 143
    ti_pru = 144
    mmdsp_plus = 160
    cypress_m8c = 161
    r32c = 162
    trimedia = 163
    qdsp6 = 164
    i8051 = 165
    stxp7x = 166
    nds32 = 167
    ecog1x = 168
    maxq30 = 169
    ximo16 = 170
    manik = 171
    craynv2 = 172
    rx = 173
    metag = 174
    mcst_elbrus = 175
    ecog16 = 176
    cr16 = 177
    etpu = 178
    sle9x = 179
    l10m = 180
    k10m = 181
    aarch64 = 183
    avr32 = 185
    stm8 = 186
    tile64 = 187
    tilepro = 188
    microblaze = 189
    cuda = 190
    tilegx = 191
    cloudshield = 192
    corea_1st = 193
    corea_2nd = 194
    arcv2 = 195
    open8 = 196
    rl78 = 197
    videocore5 = 198
    renesas_78kor = 199
    freescale_56800ex = 200
    ba1 = 201
    ba2 = 202
    xcore = 203
    mchp_pic = 204
    intelgt = 205
    intel206 = 206
    intel207 = 207
    intel208 = 208
    intel209 = 209
    km32 = 210
    kmx32 = 211
    kmx16 = 212
    kmx8 = 213
    kvarc = 214
    cdp = 215
    coge = 216
    cool = 217
    norc = 218
    csr_kalimba = 219
    z80 = 220
    visium = 221
    ft32 = 222
    moxie = 223
    amd_gpu = 224
    riscv = 243
    lanai = 244
    ceva = 245
    ceva_x2 = 246
    bpf = 247
    graphcore_ipu = 248
    img1 = 249
    nfp = 250
    ve = 251
    csky = 252
    arc_compact3_64 = 253
    mcs6502 = 254
    arc_compact3 = 255
    kvx = 256
    wdc65816 = 257
    loongarch = 258
    kf32 = 259
    u16_u8core = 260
    tachyum = 261
    nxp_56800ef = 262
    avr_old = 4183
    msp430_old = 4185
    adapteva_epiphany = 4643
    mt = 9520
    cygnus_fr30 = 13104
    webassembly = 16727
    xc16x = 18056
    s12z = 19951
    cygnus_frv = 21569
    dlx = 23205
    cygnus_d10v = 30288
    cygnus_d30v = 30326
    ip2k_old = 33303
    cygnus_powerpc = 36901
    alpha = 36902
    cygnus_m32r = 36929
    cygnus_v850 = 36992
    s390_old = 41872
    xtensa_old = 43975
    xstormy16 = 44357
    microblaze_old = 47787
    cygnus_mn10300 = 48879
    cygnus_mn10200 = 57005
    cygnus_mep = 61453
    m32c_old = 65200
    iq2000 = 65210
    nios32 = 65211
    moxie_old = 65261
  Elf_SymbolType* = enum
    no_type = 0
    object = 1
    func = 2
    section = 3
    file = 4
    common = 5
    tls = 6
    relc = 8
    srelc = 9
    gnu_ifunc = 10
    os11 = 11
    os12 = 12
    proc13 = 13
    proc14 = 14
    proc15 = 15
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
    symtab_shndx = 34
    deprecated_sparc_register = 117440513
    sunw_auxiliary = 1610612749
    sunw_rtldinf = 1610612750
    sunw_filter = 1610612751
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
    sunw_symtab_shndx = 1610612764
    sunw_capchainent = 1610612765
    sunw_deferred = 1610612766
    sunw_capchainsz = 1610612767
    sunw_phname = 1610612768
    sunw_parent = 1610612769
    sunw_sx_aslr = 1610612771
    sunw_relax = 1610612773
    sunw_kmod = 1610612775
    sunw_sx_nxheap = 1610612777
    sunw_sx_nxstack = 1610612779
    sunw_sx_adiheap = 1610612781
    sunw_sx_adistack = 1610612783
    sunw_sx_ssbd = 1610612785
    sunw_symnsort = 1610612786
    sunw_symnsortsz = 1610612787
    gnu_flags_1 = 1879047668
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
    arm_exidx = 1879048193
  Elf_ObjType* = enum
    no_file_type = 0
    relocatable = 1
    executable = 2
    shared = 3
    core = 4
  Elf_SectionHeaderIdxSpecial* = enum
    undefined = 0
    before = 65280
    after = 65281
    amd64_lcommon = 65282
    sunw_ignore = 65343
    abs = 65521
    common = 65522
    xindex = 65535
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
    `rawSectionNamesInst`*: seq[byte]
    `programHeadersInst`*: seq[Elf_EndianElf_ProgramHeader]
    `sectionHeadersInst`*: seq[Elf_EndianElf_SectionHeader]
    `sectionNamesInst`*: Elf_EndianElf_StringsStruct
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
    `flagsObjInst`*: Elf_PhdrTypeFlags
    isLe: bool
  Elf_EndianElf_DynamicSectionEntry* = ref object of KaitaiStruct
    `tag`*: uint64
    `valueOrPtr`*: uint64
    `parent`*: Elf_EndianElf_DynamicSection
    `flag1ValuesInst`*: Elf_DtFlag1Values
    `valueStrInst`*: string
    `tagEnumInst`*: Elf_DynamicArrayTags
    `flagValuesInst`*: Elf_DtFlagValues
    `isValueStrInst`*: bool
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
    `linkedSectionInst`*: Elf_EndianElf_SectionHeader
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
    `parent`*: Elf_EndianElf_SectionHeader
    `isStringTableLinkedInst`*: bool
    isLe: bool
  Elf_EndianElf_DynsymSection* = ref object of KaitaiStruct
    `entries`*: seq[Elf_EndianElf_DynsymSectionEntry]
    `parent`*: Elf_EndianElf_SectionHeader
    `isStringTableLinkedInst`*: bool
    isLe: bool
  Elf_EndianElf_RelocationSectionEntry* = ref object of KaitaiStruct
    `offset`*: uint64
    `info`*: uint64
    `addend`*: int64
    `parent`*: Elf_EndianElf_RelocationSection
    isLe: bool
  Elf_EndianElf_DynsymSectionEntry* = ref object of KaitaiStruct
    `ofsName`*: uint32
    `valueB32`*: uint32
    `sizeB32`*: uint32
    `bind`*: Elf_SymbolBinding
    `type`*: Elf_SymbolType
    `other`*: uint8
    `shIdx`*: uint16
    `valueB64`*: uint64
    `sizeB64`*: uint64
    `parent`*: Elf_EndianElf_DynsymSection
    `isShIdxReservedInst`*: bool
    `isShIdxOsInst`*: bool
    `isShIdxProcInst`*: bool
    `sizeInst`*: uint64
    `visibilityInst`*: Elf_SymbolVisibility
    `valueInst`*: uint64
    `nameInst`*: string
    `shIdxSpecialInst`*: Elf_SectionHeaderIdxSpecial
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
  Elf_PhdrTypeFlags* = ref object of KaitaiStruct
    `value`*: uint32
    `parent`*: Elf_EndianElf_ProgramHeader
    `readInst`*: bool
    `writeInst`*: bool
    `executeInst`*: bool
    `maskProcInst`*: bool
  Elf_DtFlagValues* = ref object of KaitaiStruct
    `value`*: uint32
    `parent`*: Elf_EndianElf_DynamicSectionEntry
    `bindNowInst`*: bool
    `originInst`*: bool
    `textrelInst`*: bool
    `staticTlsInst`*: bool
    `symbolicInst`*: bool

proc read*(_: typedesc[Elf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Elf
proc read*(_: typedesc[Elf_EndianElf], io: KaitaiStream, root: KaitaiStruct, parent: Elf): Elf_EndianElf
proc read*(_: typedesc[Elf_EndianElf_NoteSection], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_SectionHeader): Elf_EndianElf_NoteSection
proc read*(_: typedesc[Elf_EndianElf_ProgramHeader], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf): Elf_EndianElf_ProgramHeader
proc read*(_: typedesc[Elf_EndianElf_DynamicSectionEntry], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_DynamicSection): Elf_EndianElf_DynamicSectionEntry
proc read*(_: typedesc[Elf_EndianElf_SectionHeader], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf): Elf_EndianElf_SectionHeader
proc read*(_: typedesc[Elf_EndianElf_RelocationSection], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_SectionHeader, hasAddend: any): Elf_EndianElf_RelocationSection
proc read*(_: typedesc[Elf_EndianElf_DynamicSection], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_SectionHeader): Elf_EndianElf_DynamicSection
proc read*(_: typedesc[Elf_EndianElf_DynsymSection], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_SectionHeader): Elf_EndianElf_DynsymSection
proc read*(_: typedesc[Elf_EndianElf_RelocationSectionEntry], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_RelocationSection): Elf_EndianElf_RelocationSectionEntry
proc read*(_: typedesc[Elf_EndianElf_DynsymSectionEntry], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_DynsymSection): Elf_EndianElf_DynsymSectionEntry
proc read*(_: typedesc[Elf_EndianElf_NoteSectionEntry], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_NoteSection): Elf_EndianElf_NoteSectionEntry
proc read*(_: typedesc[Elf_EndianElf_StringsStruct], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Elf_EndianElf_StringsStruct
proc read*(_: typedesc[Elf_DtFlag1Values], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_DynamicSectionEntry, value: any): Elf_DtFlag1Values
proc read*(_: typedesc[Elf_SectionHeaderFlags], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_SectionHeader, value: any): Elf_SectionHeaderFlags
proc read*(_: typedesc[Elf_PhdrTypeFlags], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_ProgramHeader, value: any): Elf_PhdrTypeFlags
proc read*(_: typedesc[Elf_DtFlagValues], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_DynamicSectionEntry, value: any): Elf_DtFlagValues

proc shIdxLoOs*(this: Elf): int
proc shIdxLoReserved*(this: Elf): int
proc shIdxHiProc*(this: Elf): int
proc shIdxLoProc*(this: Elf): int
proc shIdxHiOs*(this: Elf): int
proc shIdxHiReserved*(this: Elf): int
proc programHeaders*(this: Elf_EndianElf): seq[Elf_EndianElf_ProgramHeader]
proc sectionHeaders*(this: Elf_EndianElf): seq[Elf_EndianElf_SectionHeader]
proc sectionNames*(this: Elf_EndianElf): Elf_EndianElf_StringsStruct
proc flagsObj*(this: Elf_EndianElf_ProgramHeader): Elf_PhdrTypeFlags
proc flag1Values*(this: Elf_EndianElf_DynamicSectionEntry): Elf_DtFlag1Values
proc valueStr*(this: Elf_EndianElf_DynamicSectionEntry): string
proc tagEnum*(this: Elf_EndianElf_DynamicSectionEntry): Elf_DynamicArrayTags
proc flagValues*(this: Elf_EndianElf_DynamicSectionEntry): Elf_DtFlagValues
proc isValueStr*(this: Elf_EndianElf_DynamicSectionEntry): bool
proc body*(this: Elf_EndianElf_SectionHeader): KaitaiStruct
proc linkedSection*(this: Elf_EndianElf_SectionHeader): Elf_EndianElf_SectionHeader
proc name*(this: Elf_EndianElf_SectionHeader): string
proc flagsObj*(this: Elf_EndianElf_SectionHeader): Elf_SectionHeaderFlags
proc isStringTableLinked*(this: Elf_EndianElf_DynamicSection): bool
proc isStringTableLinked*(this: Elf_EndianElf_DynsymSection): bool
proc isShIdxReserved*(this: Elf_EndianElf_DynsymSectionEntry): bool
proc isShIdxOs*(this: Elf_EndianElf_DynsymSectionEntry): bool
proc isShIdxProc*(this: Elf_EndianElf_DynsymSectionEntry): bool
proc size*(this: Elf_EndianElf_DynsymSectionEntry): uint64
proc visibility*(this: Elf_EndianElf_DynsymSectionEntry): Elf_SymbolVisibility
proc value*(this: Elf_EndianElf_DynsymSectionEntry): uint64
proc name*(this: Elf_EndianElf_DynsymSectionEntry): string
proc shIdxSpecial*(this: Elf_EndianElf_DynsymSectionEntry): Elf_SectionHeaderIdxSpecial
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
proc read*(this: Elf_PhdrTypeFlags): bool
proc write*(this: Elf_PhdrTypeFlags): bool
proc execute*(this: Elf_PhdrTypeFlags): bool
proc maskProc*(this: Elf_PhdrTypeFlags): bool
proc bindNow*(this: Elf_DtFlagValues): bool
proc origin*(this: Elf_DtFlagValues): bool
proc textrel*(this: Elf_DtFlagValues): bool
proc staticTls*(this: Elf_DtFlagValues): bool
proc symbolic*(this: Elf_DtFlagValues): bool


##[
@see <a href="https://sourceware.org/git/?p=glibc.git;a=blob;f=elf/elf.h;hb=0f62fe0532">Source</a>
@see <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/contents.html">Source</a>
@see <a href="https://docs.oracle.com/cd/E37838_01/html/E36783/glcfv.html">Source</a>
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

proc shIdxLoOs(this: Elf): int = 
  if this.shIdxLoOsInst != nil:
    return this.shIdxLoOsInst
  let shIdxLoOsInstExpr = int(65312)
  this.shIdxLoOsInst = shIdxLoOsInstExpr
  if this.shIdxLoOsInst != nil:
    return this.shIdxLoOsInst

proc shIdxLoReserved(this: Elf): int = 
  if this.shIdxLoReservedInst != nil:
    return this.shIdxLoReservedInst
  let shIdxLoReservedInstExpr = int(65280)
  this.shIdxLoReservedInst = shIdxLoReservedInstExpr
  if this.shIdxLoReservedInst != nil:
    return this.shIdxLoReservedInst

proc shIdxHiProc(this: Elf): int = 
  if this.shIdxHiProcInst != nil:
    return this.shIdxHiProcInst
  let shIdxHiProcInstExpr = int(65311)
  this.shIdxHiProcInst = shIdxHiProcInstExpr
  if this.shIdxHiProcInst != nil:
    return this.shIdxHiProcInst

proc shIdxLoProc(this: Elf): int = 
  if this.shIdxLoProcInst != nil:
    return this.shIdxLoProcInst
  let shIdxLoProcInstExpr = int(65280)
  this.shIdxLoProcInst = shIdxLoProcInstExpr
  if this.shIdxLoProcInst != nil:
    return this.shIdxLoProcInst

proc shIdxHiOs(this: Elf): int = 
  if this.shIdxHiOsInst != nil:
    return this.shIdxHiOsInst
  let shIdxHiOsInstExpr = int(65343)
  this.shIdxHiOsInst = shIdxHiOsInstExpr
  if this.shIdxHiOsInst != nil:
    return this.shIdxHiOsInst

proc shIdxHiReserved(this: Elf): int = 
  if this.shIdxHiReservedInst != nil:
    return this.shIdxHiReservedInst
  let shIdxHiReservedInstExpr = int(65535)
  this.shIdxHiReservedInst = shIdxHiReservedInstExpr
  if this.shIdxHiReservedInst != nil:
    return this.shIdxHiReservedInst

proc fromFile*(_: typedesc[Elf], filename: string): Elf =
  Elf.read(newKaitaiFileStream(filename), nil, nil)


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

proc sectionNames(this: Elf_EndianElf): Elf_EndianElf_StringsStruct = 
  if this.sectionNamesInst != nil:
    return this.sectionNamesInst
  if  ((this.sectionNamesIdx != ord(elf.undefined)) and (this.sectionNamesIdx < Elf(this.root).header.qtySectionHeader)) :
    let pos = this.io.pos()
    this.io.seek(int(this.sectionHeaders[this.sectionNamesIdx].ofsBody))
    if this.isLe:
      let rawSectionNamesInstExpr = this.io.readBytes(int(this.sectionHeaders[this.sectionNamesIdx].lenBody))
      this.rawSectionNamesInst = rawSectionNamesInstExpr
      let rawSectionNamesInstIo = newKaitaiStream(rawSectionNamesInstExpr)
      let sectionNamesInstExpr = Elf_EndianElf_StringsStruct.read(rawSectionNamesInstIo, this.root, this)
      this.sectionNamesInst = sectionNamesInstExpr
    else:
      let rawSectionNamesInstExpr = this.io.readBytes(int(this.sectionHeaders[this.sectionNamesIdx].lenBody))
      this.rawSectionNamesInst = rawSectionNamesInstExpr
      let rawSectionNamesInstIo = newKaitaiStream(rawSectionNamesInstExpr)
      let sectionNamesInstExpr = Elf_EndianElf_StringsStruct.read(rawSectionNamesInstIo, this.root, this)
      this.sectionNamesInst = sectionNamesInstExpr
    this.io.seek(pos)
  if this.sectionNamesInst != nil:
    return this.sectionNamesInst

proc fromFile*(_: typedesc[Elf_EndianElf], filename: string): Elf_EndianElf =
  Elf_EndianElf.read(newKaitaiFileStream(filename), nil, nil)


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


##[
@see <a href="https://docs.oracle.com/cd/E37838_01/html/E36783/chapter6-42444.html">Source</a>
@see <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.dynamic.html#dynamic_section">Source</a>
]##

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

proc valueStr(this: Elf_EndianElf_DynamicSectionEntry): string = 
  if this.valueStrInst.len != 0:
    return this.valueStrInst
  if  ((this.isValueStr) and (this.parent.isStringTableLinked)) :
    let io = (Elf_EndianElf_StringsStruct(this.parent.parent.linkedSection.body)).io
    let pos = io.pos()
    io.seek(int(this.valueOrPtr))
    if this.isLe:
      let valueStrInstExpr = encode(io.readBytesTerm(0, false, true, true), "ASCII")
      this.valueStrInst = valueStrInstExpr
    else:
      let valueStrInstExpr = encode(io.readBytesTerm(0, false, true, true), "ASCII")
      this.valueStrInst = valueStrInstExpr
    io.seek(pos)
  if this.valueStrInst.len != 0:
    return this.valueStrInst

proc tagEnum(this: Elf_EndianElf_DynamicSectionEntry): Elf_DynamicArrayTags = 
  if this.tagEnumInst != nil:
    return this.tagEnumInst
  let tagEnumInstExpr = Elf_DynamicArrayTags(Elf_DynamicArrayTags(this.tag))
  this.tagEnumInst = tagEnumInstExpr
  if this.tagEnumInst != nil:
    return this.tagEnumInst

proc flagValues(this: Elf_EndianElf_DynamicSectionEntry): Elf_DtFlagValues = 
  if this.flagValuesInst != nil:
    return this.flagValuesInst
  if this.tagEnum == elf.flags:
    if this.isLe:
      let flagValuesInstExpr = Elf_DtFlagValues.read(this.io, this.root, this, this.valueOrPtr)
      this.flagValuesInst = flagValuesInstExpr
    else:
      let flagValuesInstExpr = Elf_DtFlagValues.read(this.io, this.root, this, this.valueOrPtr)
      this.flagValuesInst = flagValuesInstExpr
  if this.flagValuesInst != nil:
    return this.flagValuesInst

proc isValueStr(this: Elf_EndianElf_DynamicSectionEntry): bool = 
  if this.isValueStrInst != nil:
    return this.isValueStrInst
  let isValueStrInstExpr = bool( ((this.valueOrPtr != 0) and ( ((this.tagEnum == elf.needed) or (this.tagEnum == elf.soname) or (this.tagEnum == elf.rpath) or (this.tagEnum == elf.runpath) or (this.tagEnum == elf.sunw_auxiliary) or (this.tagEnum == elf.sunw_filter) or (this.tagEnum == elf.auxiliary) or (this.tagEnum == elf.filter) or (this.tagEnum == elf.config) or (this.tagEnum == elf.depaudit) or (this.tagEnum == elf.audit)) )) )
  this.isValueStrInst = isValueStrInstExpr
  if this.isValueStrInst != nil:
    return this.isValueStrInst

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
  if this.type != elf.nobits:
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

proc linkedSection(this: Elf_EndianElf_SectionHeader): Elf_EndianElf_SectionHeader = 

  ##[
  may reference a later section header, so don't try to access too early (use only lazy `instances`)
  @see <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.sheader.html#sh_link">Source</a>
  ]##
  if this.linkedSectionInst != nil:
    return this.linkedSectionInst
  if  ((this.linkedSectionIdx != ord(elf.undefined)) and (this.linkedSectionIdx < Elf(this.root).header.qtySectionHeader)) :
    let linkedSectionInstExpr = Elf_EndianElf_SectionHeader(Elf(this.root).header.sectionHeaders[this.linkedSectionIdx])
    this.linkedSectionInst = linkedSectionInstExpr
  if this.linkedSectionInst != nil:
    return this.linkedSectionInst

proc name(this: Elf_EndianElf_SectionHeader): string = 
  if this.nameInst.len != 0:
    return this.nameInst
  let io = Elf(this.root).header.sectionNames.io
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
@see <a href="https://docs.oracle.com/cd/E37838_01/html/E36783/chapter6-54839.html">Source</a>
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

proc read*(_: typedesc[Elf_EndianElf_DynamicSection], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_SectionHeader): Elf_EndianElf_DynamicSection =
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

proc isStringTableLinked(this: Elf_EndianElf_DynamicSection): bool = 
  if this.isStringTableLinkedInst != nil:
    return this.isStringTableLinkedInst
  let isStringTableLinkedInstExpr = bool(this.parent.linkedSection.type == elf.strtab)
  this.isStringTableLinkedInst = isStringTableLinkedInstExpr
  if this.isStringTableLinkedInst != nil:
    return this.isStringTableLinkedInst

proc fromFile*(_: typedesc[Elf_EndianElf_DynamicSection], filename: string): Elf_EndianElf_DynamicSection =
  Elf_EndianElf_DynamicSection.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Elf_EndianElf_DynsymSection) =
  block:
    var i: int
    while not this.io.isEof:
      let it = Elf_EndianElf_DynsymSectionEntry.read(this.io, this.root, this)
      this.entries.add(it)
      inc i


proc readBe(this: Elf_EndianElf_DynsymSection) =
  block:
    var i: int
    while not this.io.isEof:
      let it = Elf_EndianElf_DynsymSectionEntry.read(this.io, this.root, this)
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

proc isStringTableLinked(this: Elf_EndianElf_DynsymSection): bool = 
  if this.isStringTableLinkedInst != nil:
    return this.isStringTableLinkedInst
  let isStringTableLinkedInstExpr = bool(this.parent.linkedSection.type == elf.strtab)
  this.isStringTableLinkedInst = isStringTableLinkedInstExpr
  if this.isStringTableLinkedInst != nil:
    return this.isStringTableLinkedInst

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


##[
@see <a href="https://docs.oracle.com/cd/E37838_01/html/E36783/man-sts.html">Source</a>
@see <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.symtab.html">Source</a>
]##

proc readLe(this: Elf_EndianElf_DynsymSectionEntry) =
  let ofsNameExpr = this.io.readU4le()
  this.ofsName = ofsNameExpr
  if Elf(this.root).bits == elf.b32:
    let valueB32Expr = this.io.readU4le()
    this.valueB32 = valueB32Expr
  if Elf(this.root).bits == elf.b32:
    let sizeB32Expr = this.io.readU4le()
    this.sizeB32 = sizeB32Expr
  let bindExpr = Elf_SymbolBinding(this.io.readBitsIntBe(4))
  this.bind = bindExpr
  let typeExpr = Elf_SymbolType(this.io.readBitsIntBe(4))
  this.type = typeExpr
  alignToByte(this.io)

  ##[
  don't read this field, access `visibility` instead
  ]##
  let otherExpr = this.io.readU1()
  this.other = otherExpr

  ##[
  section header index
  ]##
  let shIdxExpr = this.io.readU2le()
  this.shIdx = shIdxExpr
  if Elf(this.root).bits == elf.b64:
    let valueB64Expr = this.io.readU8le()
    this.valueB64 = valueB64Expr
  if Elf(this.root).bits == elf.b64:
    let sizeB64Expr = this.io.readU8le()
    this.sizeB64 = sizeB64Expr


proc readBe(this: Elf_EndianElf_DynsymSectionEntry) =
  let ofsNameExpr = this.io.readU4be()
  this.ofsName = ofsNameExpr
  if Elf(this.root).bits == elf.b32:
    let valueB32Expr = this.io.readU4be()
    this.valueB32 = valueB32Expr
  if Elf(this.root).bits == elf.b32:
    let sizeB32Expr = this.io.readU4be()
    this.sizeB32 = sizeB32Expr
  let bindExpr = Elf_SymbolBinding(this.io.readBitsIntBe(4))
  this.bind = bindExpr
  let typeExpr = Elf_SymbolType(this.io.readBitsIntBe(4))
  this.type = typeExpr
  alignToByte(this.io)

  ##[
  don't read this field, access `visibility` instead
  ]##
  let otherExpr = this.io.readU1()
  this.other = otherExpr

  ##[
  section header index
  ]##
  let shIdxExpr = this.io.readU2be()
  this.shIdx = shIdxExpr
  if Elf(this.root).bits == elf.b64:
    let valueB64Expr = this.io.readU8be()
    this.valueB64 = valueB64Expr
  if Elf(this.root).bits == elf.b64:
    let sizeB64Expr = this.io.readU8be()
    this.sizeB64 = sizeB64Expr

proc read*(_: typedesc[Elf_EndianElf_DynsymSectionEntry], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_DynsymSection): Elf_EndianElf_DynsymSectionEntry =
  template this: untyped = result
  this = new(Elf_EndianElf_DynsymSectionEntry)
  let root = if root == nil: cast[Elf](this) else: cast[Elf](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc isShIdxReserved(this: Elf_EndianElf_DynsymSectionEntry): bool = 
  if this.isShIdxReservedInst != nil:
    return this.isShIdxReservedInst
  let isShIdxReservedInstExpr = bool( ((this.shIdx >= Elf(this.root).shIdxLoReserved) and (this.shIdx <= Elf(this.root).shIdxHiReserved)) )
  this.isShIdxReservedInst = isShIdxReservedInstExpr
  if this.isShIdxReservedInst != nil:
    return this.isShIdxReservedInst

proc isShIdxOs(this: Elf_EndianElf_DynsymSectionEntry): bool = 
  if this.isShIdxOsInst != nil:
    return this.isShIdxOsInst
  let isShIdxOsInstExpr = bool( ((this.shIdx >= Elf(this.root).shIdxLoOs) and (this.shIdx <= Elf(this.root).shIdxHiOs)) )
  this.isShIdxOsInst = isShIdxOsInstExpr
  if this.isShIdxOsInst != nil:
    return this.isShIdxOsInst

proc isShIdxProc(this: Elf_EndianElf_DynsymSectionEntry): bool = 
  if this.isShIdxProcInst != nil:
    return this.isShIdxProcInst
  let isShIdxProcInstExpr = bool( ((this.shIdx >= Elf(this.root).shIdxLoProc) and (this.shIdx <= Elf(this.root).shIdxHiProc)) )
  this.isShIdxProcInst = isShIdxProcInstExpr
  if this.isShIdxProcInst != nil:
    return this.isShIdxProcInst

proc size(this: Elf_EndianElf_DynsymSectionEntry): uint64 = 
  if this.sizeInst != nil:
    return this.sizeInst
  let sizeInstExpr = uint64((if Elf(this.root).bits == elf.b32: this.sizeB32 else: (if Elf(this.root).bits == elf.b64: this.sizeB64 else: 0)))
  this.sizeInst = sizeInstExpr
  if this.sizeInst != nil:
    return this.sizeInst

proc visibility(this: Elf_EndianElf_DynsymSectionEntry): Elf_SymbolVisibility = 
  if this.visibilityInst != nil:
    return this.visibilityInst
  let visibilityInstExpr = Elf_SymbolVisibility(Elf_SymbolVisibility((this.other and 3)))
  this.visibilityInst = visibilityInstExpr
  if this.visibilityInst != nil:
    return this.visibilityInst

proc value(this: Elf_EndianElf_DynsymSectionEntry): uint64 = 
  if this.valueInst != nil:
    return this.valueInst
  let valueInstExpr = uint64((if Elf(this.root).bits == elf.b32: this.valueB32 else: (if Elf(this.root).bits == elf.b64: this.valueB64 else: 0)))
  this.valueInst = valueInstExpr
  if this.valueInst != nil:
    return this.valueInst

proc name(this: Elf_EndianElf_DynsymSectionEntry): string = 
  if this.nameInst.len != 0:
    return this.nameInst
  if  ((this.ofsName != 0) and (this.parent.isStringTableLinked)) :
    let io = (Elf_EndianElf_StringsStruct(this.parent.parent.linkedSection.body)).io
    let pos = io.pos()
    io.seek(int(this.ofsName))
    if this.isLe:
      let nameInstExpr = encode(io.readBytesTerm(0, false, true, true), "UTF-8")
      this.nameInst = nameInstExpr
    else:
      let nameInstExpr = encode(io.readBytesTerm(0, false, true, true), "UTF-8")
      this.nameInst = nameInstExpr
    io.seek(pos)
  if this.nameInst.len != 0:
    return this.nameInst

proc shIdxSpecial(this: Elf_EndianElf_DynsymSectionEntry): Elf_SectionHeaderIdxSpecial = 
  if this.shIdxSpecialInst != nil:
    return this.shIdxSpecialInst
  let shIdxSpecialInstExpr = Elf_SectionHeaderIdxSpecial(Elf_SectionHeaderIdxSpecial(this.shIdx))
  this.shIdxSpecialInst = shIdxSpecialInstExpr
  if this.shIdxSpecialInst != nil:
    return this.shIdxSpecialInst

proc fromFile*(_: typedesc[Elf_EndianElf_DynsymSectionEntry], filename: string): Elf_EndianElf_DynsymSectionEntry =
  Elf_EndianElf_DynsymSectionEntry.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.oracle.com/cd/E37838_01/html/E36783/chapter6-18048.html">Source</a>
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
      let it = encode(this.io.readBytesTerm(0, false, true, true), "UTF-8")
      this.entries.add(it)
      inc i


proc readBe(this: Elf_EndianElf_StringsStruct) =
  block:
    var i: int
    while not this.io.isEof:
      let it = encode(this.io.readBytesTerm(0, false, true, true), "UTF-8")
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


##[
@see <a href="https://refspecs.linuxbase.org/elf/gabi4+/ch5.dynamic.html">Figure 5-11: DT_FLAGS values</a>
@see <a href="https://github.com/golang/go/blob/48dfddbab3/src/debug/elf/elf.go#L1079-L1095">Source</a>
@see <a href="https://docs.oracle.com/cd/E37838_01/html/E36783/chapter6-42444.html#OSLLGchapter7-tbl-5">Source</a>
]##
proc read*(_: typedesc[Elf_DtFlagValues], io: KaitaiStream, root: KaitaiStruct, parent: Elf_EndianElf_DynamicSectionEntry, value: any): Elf_DtFlagValues =
  template this: untyped = result
  this = new(Elf_DtFlagValues)
  let root = if root == nil: cast[Elf](this) else: cast[Elf](root)
  this.io = io
  this.root = root
  this.parent = parent
  let valueExpr = uint32(value)
  this.value = valueExpr


proc bindNow(this: Elf_DtFlagValues): bool = 

  ##[
  all relocations for this object must be processed before returning
control to the program

  ]##
  if this.bindNowInst != nil:
    return this.bindNowInst
  let bindNowInstExpr = bool((this.value and 8) != 0)
  this.bindNowInst = bindNowInstExpr
  if this.bindNowInst != nil:
    return this.bindNowInst

proc origin(this: Elf_DtFlagValues): bool = 

  ##[
  object may reference the $ORIGIN substitution string
  ]##
  if this.originInst != nil:
    return this.originInst
  let originInstExpr = bool((this.value and 1) != 0)
  this.originInst = originInstExpr
  if this.originInst != nil:
    return this.originInst

proc textrel(this: Elf_DtFlagValues): bool = 

  ##[
  relocation entries might request modifications to a non-writable segment
  ]##
  if this.textrelInst != nil:
    return this.textrelInst
  let textrelInstExpr = bool((this.value and 4) != 0)
  this.textrelInst = textrelInstExpr
  if this.textrelInst != nil:
    return this.textrelInst

proc staticTls(this: Elf_DtFlagValues): bool = 

  ##[
  object uses static thread-local storage scheme
  ]##
  if this.staticTlsInst != nil:
    return this.staticTlsInst
  let staticTlsInstExpr = bool((this.value and 16) != 0)
  this.staticTlsInst = staticTlsInstExpr
  if this.staticTlsInst != nil:
    return this.staticTlsInst

proc symbolic(this: Elf_DtFlagValues): bool = 

  ##[
  symbolic linking
  ]##
  if this.symbolicInst != nil:
    return this.symbolicInst
  let symbolicInstExpr = bool((this.value and 2) != 0)
  this.symbolicInst = symbolicInstExpr
  if this.symbolicInst != nil:
    return this.symbolicInst

proc fromFile*(_: typedesc[Elf_DtFlagValues], filename: string): Elf_DtFlagValues =
  Elf_DtFlagValues.read(newKaitaiFileStream(filename), nil, nil)

