import kaitai_struct_nim_runtime
import options
import /serialization/asn1/asn1_der

import "asn1_der"
type
  MachO* = ref object of KaitaiStruct
    `magic`*: MachO_MagicType
    `header`*: MachO_MachHeader
    `loadCommands`*: seq[MachO_LoadCommand]
    `parent`*: KaitaiStruct
  MachO_MagicType* = enum
    macho_le_x86 = 3472551422
    macho_le_x64 = 3489328638
    macho_be_x86 = 4277009102
    macho_be_x64 = 4277009103
  MachO_CpuType* = enum
    vax = 1
    romp = 2
    ns32032 = 4
    ns32332 = 5
    i386 = 7
    mips = 8
    ns32532 = 9
    hppa = 11
    arm = 12
    mc88000 = 13
    sparc = 14
    i860 = 15
    i860_little = 16
    rs6000 = 17
    powerpc = 18
    abi64 = 16777216
    x86_64 = 16777223
    arm64 = 16777228
    powerpc64 = 16777234
    any = 4294967295
  MachO_FileType* = enum
    object = 1
    execute = 2
    fvmlib = 3
    core = 4
    preload = 5
    dylib = 6
    dylinker = 7
    bundle = 8
    dylib_stub = 9
    dsym = 10
    kext_bundle = 11
  MachO_LoadCommandType* = enum
    segment = 1
    symtab = 2
    symseg = 3
    thread = 4
    unix_thread = 5
    load_fvm_lib = 6
    id_fvm_lib = 7
    ident = 8
    fvm_file = 9
    prepage = 10
    dysymtab = 11
    load_dylib = 12
    id_dylib = 13
    load_dylinker = 14
    id_dylinker = 15
    prebound_dylib = 16
    routines = 17
    sub_framework = 18
    sub_umbrella = 19
    sub_client = 20
    sub_library = 21
    twolevel_hints = 22
    prebind_cksum = 23
    segment_64 = 25
    routines_64 = 26
    uuid = 27
    code_signature = 29
    segment_split_info = 30
    lazy_load_dylib = 32
    encryption_info = 33
    dyld_info = 34
    version_min_macosx = 36
    version_min_iphoneos = 37
    function_starts = 38
    dyld_environment = 39
    data_in_code = 41
    source_version = 42
    dylib_code_sign_drs = 43
    encryption_info_64 = 44
    linker_option = 45
    linker_optimization_hint = 46
    version_min_tvos = 47
    version_min_watchos = 48
    build_version = 50
    req_dyld = 2147483648
    load_weak_dylib = 2147483672
    rpath = 2147483676
    reexport_dylib = 2147483679
    dyld_info_only = 2147483682
    load_upward_dylib = 2147483683
    main = 2147483688
  MachO_RpathCommand* = ref object of KaitaiStruct
    `pathOffset`*: uint32
    `path`*: string
    `parent`*: MachO_LoadCommand
  MachO_Uleb128* = ref object of KaitaiStruct
    `b1`*: uint8
    `b2`*: uint8
    `b3`*: uint8
    `b4`*: uint8
    `b5`*: uint8
    `b6`*: uint8
    `b7`*: uint8
    `b8`*: uint8
    `b9`*: uint8
    `b10`*: uint8
    `parent`*: KaitaiStruct
    `valueInst`: int
    `valueInstFlag`: bool
  MachO_SourceVersionCommand* = ref object of KaitaiStruct
    `version`*: uint64
    `parent`*: MachO_LoadCommand
  MachO_CsBlob* = ref object of KaitaiStruct
    `magic`*: MachO_CsBlob_CsMagic
    `length`*: uint32
    `body`*: KaitaiStruct
    `parent`*: KaitaiStruct
    `rawBody`*: seq[byte]
  MachO_CsBlob_CsMagic* = enum
    blob_wrapper = 4208855809
    requirement = 4208856064
    requirements = 4208856065
    code_directory = 4208856066
    embedded_signature = 4208856256
    detached_signature = 4208856257
    entitlements = 4208882033
    der_entitlements = 4208882034
  MachO_CsBlob_CodeDirectory* = ref object of KaitaiStruct
    `version`*: uint32
    `flags`*: uint32
    `hashOffset`*: uint32
    `identOffset`*: uint32
    `nSpecialSlots`*: uint32
    `nCodeSlots`*: uint32
    `codeLimit`*: uint32
    `hashSize`*: uint8
    `hashType`*: uint8
    `spare1`*: uint8
    `pageSize`*: uint8
    `spare2`*: uint32
    `scatterOffset`*: uint32
    `teamIdOffset`*: uint32
    `parent`*: MachO_CsBlob
    `identInst`: string
    `identInstFlag`: bool
    `teamIdInst`: string
    `teamIdInstFlag`: bool
    `hashesInst`: seq[seq[byte]]
    `hashesInstFlag`: bool
  MachO_CsBlob_Data* = ref object of KaitaiStruct
    `length`*: uint32
    `value`*: seq[byte]
    `padding`*: seq[byte]
    `parent`*: KaitaiStruct
  MachO_CsBlob_SuperBlob* = ref object of KaitaiStruct
    `count`*: uint32
    `blobs`*: seq[MachO_CsBlob_BlobIndex]
    `parent`*: MachO_CsBlob
  MachO_CsBlob_Expr* = ref object of KaitaiStruct
    `op`*: MachO_CsBlob_Expr_OpEnum
    `data`*: KaitaiStruct
    `parent`*: KaitaiStruct
  MachO_CsBlob_Expr_OpEnum* = enum
    false = 0
    true = 1
    ident = 2
    apple_anchor = 3
    anchor_hash = 4
    info_key_value = 5
    and_op = 6
    or_op = 7
    cd_hash = 8
    not_op = 9
    info_key_field = 10
    cert_field = 11
    trusted_cert = 12
    trusted_certs = 13
    cert_generic = 14
    apple_generic_anchor = 15
    entitlement_field = 16
  MachO_CsBlob_Expr_CertSlot* = enum
    left_cert = 0
    anchor_cert = 4294967295
  MachO_CsBlob_Expr_InfoKeyFieldExpr* = ref object of KaitaiStruct
    `data`*: MachO_CsBlob_Data
    `match`*: MachO_CsBlob_Match
    `parent`*: MachO_CsBlob_Expr
  MachO_CsBlob_Expr_CertSlotExpr* = ref object of KaitaiStruct
    `value`*: MachO_CsBlob_Expr_CertSlot
    `parent`*: MachO_CsBlob_Expr
  MachO_CsBlob_Expr_CertGenericExpr* = ref object of KaitaiStruct
    `certSlot`*: MachO_CsBlob_Expr_CertSlot
    `data`*: MachO_CsBlob_Data
    `match`*: MachO_CsBlob_Match
    `parent`*: MachO_CsBlob_Expr
  MachO_CsBlob_Expr_IdentExpr* = ref object of KaitaiStruct
    `identifier`*: MachO_CsBlob_Data
    `parent`*: MachO_CsBlob_Expr
  MachO_CsBlob_Expr_CertFieldExpr* = ref object of KaitaiStruct
    `certSlot`*: MachO_CsBlob_Expr_CertSlot
    `data`*: MachO_CsBlob_Data
    `match`*: MachO_CsBlob_Match
    `parent`*: MachO_CsBlob_Expr
  MachO_CsBlob_Expr_AnchorHashExpr* = ref object of KaitaiStruct
    `certSlot`*: MachO_CsBlob_Expr_CertSlot
    `data`*: MachO_CsBlob_Data
    `parent`*: MachO_CsBlob_Expr
  MachO_CsBlob_Expr_AppleGenericAnchorExpr* = ref object of KaitaiStruct
    `parent`*: MachO_CsBlob_Expr
    `valueInst`: string
    `valueInstFlag`: bool
  MachO_CsBlob_Expr_EntitlementFieldExpr* = ref object of KaitaiStruct
    `data`*: MachO_CsBlob_Data
    `match`*: MachO_CsBlob_Match
    `parent`*: MachO_CsBlob_Expr
  MachO_CsBlob_Expr_AndExpr* = ref object of KaitaiStruct
    `left`*: MachO_CsBlob_Expr
    `right`*: MachO_CsBlob_Expr
    `parent`*: MachO_CsBlob_Expr
  MachO_CsBlob_Expr_OrExpr* = ref object of KaitaiStruct
    `left`*: MachO_CsBlob_Expr
    `right`*: MachO_CsBlob_Expr
    `parent`*: MachO_CsBlob_Expr
  MachO_CsBlob_BlobIndex* = ref object of KaitaiStruct
    `type`*: MachO_CsBlob_BlobIndex_CsslotType
    `offset`*: uint32
    `parent`*: MachO_CsBlob_SuperBlob
    `rawBlobInst`*: seq[byte]
    `blobInst`: MachO_CsBlob
    `blobInstFlag`: bool
  MachO_CsBlob_BlobIndex_CsslotType* = enum
    code_directory = 0
    info_slot = 1
    requirements = 2
    resource_dir = 3
    application = 4
    entitlements = 5
    der_entitlements = 7
    alternate_code_directories = 4096
    signature_slot = 65536
  MachO_CsBlob_Match* = ref object of KaitaiStruct
    `matchOp`*: MachO_CsBlob_Match_Op
    `data`*: MachO_CsBlob_Data
    `parent`*: KaitaiStruct
  MachO_CsBlob_Match_Op* = enum
    exists = 0
    equal = 1
    contains = 2
    begins_with = 3
    ends_with = 4
    less_than = 5
    greater_than = 6
    less_equal = 7
    greater_equal = 8
  MachO_CsBlob_Requirement* = ref object of KaitaiStruct
    `kind`*: uint32
    `expr`*: MachO_CsBlob_Expr
    `parent`*: MachO_CsBlob
  MachO_CsBlob_Requirements* = ref object of KaitaiStruct
    `count`*: uint32
    `items`*: seq[MachO_CsBlob_RequirementsBlobIndex]
    `parent`*: MachO_CsBlob
  MachO_CsBlob_BlobWrapper* = ref object of KaitaiStruct
    `data`*: seq[byte]
    `parent`*: MachO_CsBlob
  MachO_CsBlob_Entitlements* = ref object of KaitaiStruct
    `data`*: seq[byte]
    `parent`*: MachO_CsBlob
  MachO_CsBlob_RequirementsBlobIndex* = ref object of KaitaiStruct
    `type`*: MachO_CsBlob_RequirementsBlobIndex_RequirementType
    `offset`*: uint32
    `parent`*: MachO_CsBlob_Requirements
    `valueInst`: MachO_CsBlob
    `valueInstFlag`: bool
  MachO_CsBlob_RequirementsBlobIndex_RequirementType* = enum
    host = 1
    guest = 2
    designated = 3
    library = 4
  MachO_BuildVersionCommand* = ref object of KaitaiStruct
    `platform`*: uint32
    `minos`*: uint32
    `sdk`*: uint32
    `ntools`*: uint32
    `tools`*: seq[MachO_BuildVersionCommand_BuildToolVersion]
    `parent`*: MachO_LoadCommand
  MachO_BuildVersionCommand_BuildToolVersion* = ref object of KaitaiStruct
    `tool`*: uint32
    `version`*: uint32
    `parent`*: MachO_BuildVersionCommand
  MachO_RoutinesCommand* = ref object of KaitaiStruct
    `initAddress`*: uint32
    `initModule`*: uint32
    `reserved`*: seq[byte]
    `parent`*: MachO_LoadCommand
  MachO_MachoFlags* = ref object of KaitaiStruct
    `value`*: uint32
    `parent`*: MachO_MachHeader
    `subsectionsViaSymbolsInst`: bool
    `subsectionsViaSymbolsInstFlag`: bool
    `deadStrippableDylibInst`: bool
    `deadStrippableDylibInstFlag`: bool
    `weakDefinesInst`: bool
    `weakDefinesInstFlag`: bool
    `preboundInst`: bool
    `preboundInstFlag`: bool
    `allModsBoundInst`: bool
    `allModsBoundInstFlag`: bool
    `hasTlvDescriptorsInst`: bool
    `hasTlvDescriptorsInstFlag`: bool
    `forceFlatInst`: bool
    `forceFlatInstFlag`: bool
    `rootSafeInst`: bool
    `rootSafeInstFlag`: bool
    `noUndefsInst`: bool
    `noUndefsInstFlag`: bool
    `setuidSafeInst`: bool
    `setuidSafeInstFlag`: bool
    `noHeapExecutionInst`: bool
    `noHeapExecutionInstFlag`: bool
    `noReexportedDylibsInst`: bool
    `noReexportedDylibsInstFlag`: bool
    `noMultiDefsInst`: bool
    `noMultiDefsInstFlag`: bool
    `appExtensionSafeInst`: bool
    `appExtensionSafeInstFlag`: bool
    `prebindableInst`: bool
    `prebindableInstFlag`: bool
    `incrLinkInst`: bool
    `incrLinkInstFlag`: bool
    `bindAtLoadInst`: bool
    `bindAtLoadInstFlag`: bool
    `canonicalInst`: bool
    `canonicalInstFlag`: bool
    `twoLevelInst`: bool
    `twoLevelInstFlag`: bool
    `splitSegsInst`: bool
    `splitSegsInstFlag`: bool
    `lazyInitInst`: bool
    `lazyInitInstFlag`: bool
    `allowStackExecutionInst`: bool
    `allowStackExecutionInstFlag`: bool
    `bindsToWeakInst`: bool
    `bindsToWeakInstFlag`: bool
    `noFixPrebindingInst`: bool
    `noFixPrebindingInstFlag`: bool
    `dyldLinkInst`: bool
    `dyldLinkInstFlag`: bool
    `pieInst`: bool
    `pieInstFlag`: bool
  MachO_RoutinesCommand64* = ref object of KaitaiStruct
    `initAddress`*: uint64
    `initModule`*: uint64
    `reserved`*: seq[byte]
    `parent`*: MachO_LoadCommand
  MachO_LinkerOptionCommand* = ref object of KaitaiStruct
    `numStrings`*: uint32
    `strings`*: seq[string]
    `parent`*: MachO_LoadCommand
  MachO_SegmentCommand64* = ref object of KaitaiStruct
    `segname`*: string
    `vmaddr`*: uint64
    `vmsize`*: uint64
    `fileoff`*: uint64
    `filesize`*: uint64
    `maxprot`*: MachO_VmProt
    `initprot`*: MachO_VmProt
    `nsects`*: uint32
    `flags`*: uint32
    `sections`*: seq[MachO_SegmentCommand64_Section64]
    `parent`*: MachO_LoadCommand
  MachO_SegmentCommand64_Section64* = ref object of KaitaiStruct
    `sectName`*: string
    `segName`*: string
    `addr`*: uint64
    `size`*: uint64
    `offset`*: uint32
    `align`*: uint32
    `reloff`*: uint32
    `nreloc`*: uint32
    `flags`*: uint32
    `reserved1`*: uint32
    `reserved2`*: uint32
    `reserved3`*: uint32
    `parent`*: MachO_SegmentCommand64
    `rawDataInst`*: seq[byte]
    `dataInst`: KaitaiStruct
    `dataInstFlag`: bool
  MachO_SegmentCommand64_Section64_CfStringList* = ref object of KaitaiStruct
    `items`*: seq[MachO_SegmentCommand64_Section64_CfString]
    `parent`*: MachO_SegmentCommand64_Section64
  MachO_SegmentCommand64_Section64_CfString* = ref object of KaitaiStruct
    `isa`*: uint64
    `info`*: uint64
    `data`*: uint64
    `length`*: uint64
    `parent`*: MachO_SegmentCommand64_Section64_CfStringList
  MachO_SegmentCommand64_Section64_EhFrameItem* = ref object of KaitaiStruct
    `length`*: uint32
    `length64`*: uint64
    `id`*: uint32
    `body`*: KaitaiStruct
    `parent`*: MachO_SegmentCommand64_Section64_EhFrame
    `rawBody`*: seq[byte]
  MachO_SegmentCommand64_Section64_EhFrameItem_CharChain* = ref object of KaitaiStruct
    `chr`*: uint8
    `next`*: MachO_SegmentCommand64_Section64_EhFrameItem_CharChain
    `parent`*: KaitaiStruct
  MachO_SegmentCommand64_Section64_EhFrameItem_Cie* = ref object of KaitaiStruct
    `version`*: uint8
    `augStr`*: MachO_SegmentCommand64_Section64_EhFrameItem_CharChain
    `codeAlignmentFactor`*: MachO_Uleb128
    `dataAlignmentFactor`*: MachO_Uleb128
    `returnAddressRegister`*: uint8
    `augmentation`*: MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry
    `parent`*: MachO_SegmentCommand64_Section64_EhFrameItem
  MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry* = ref object of KaitaiStruct
    `length`*: MachO_Uleb128
    `fdePointerEncoding`*: uint8
    `parent`*: MachO_SegmentCommand64_Section64_EhFrameItem_Cie
  MachO_SegmentCommand64_Section64_EhFrame* = ref object of KaitaiStruct
    `items`*: seq[MachO_SegmentCommand64_Section64_EhFrameItem]
    `parent`*: MachO_SegmentCommand64_Section64
  MachO_SegmentCommand64_Section64_PointerList* = ref object of KaitaiStruct
    `items`*: seq[uint64]
    `parent`*: MachO_SegmentCommand64_Section64
  MachO_SegmentCommand64_Section64_StringList* = ref object of KaitaiStruct
    `strings`*: seq[string]
    `parent`*: MachO_SegmentCommand64_Section64
  MachO_VmProt* = ref object of KaitaiStruct
    `stripRead`*: bool
    `isMask`*: bool
    `reserved0`*: bool
    `copy`*: bool
    `noChange`*: bool
    `execute`*: bool
    `write`*: bool
    `read`*: bool
    `reserved1`*: uint64
    `parent`*: KaitaiStruct
  MachO_DysymtabCommand* = ref object of KaitaiStruct
    `iLocalSym`*: uint32
    `nLocalSym`*: uint32
    `iExtDefSym`*: uint32
    `nExtDefSym`*: uint32
    `iUndefSym`*: uint32
    `nUndefSym`*: uint32
    `tocOff`*: uint32
    `nToc`*: uint32
    `modTabOff`*: uint32
    `nModTab`*: uint32
    `extRefSymOff`*: uint32
    `nExtRefSyms`*: uint32
    `indirectSymOff`*: uint32
    `nIndirectSyms`*: uint32
    `extRelOff`*: uint32
    `nExtRel`*: uint32
    `locRelOff`*: uint32
    `nLocRel`*: uint32
    `parent`*: MachO_LoadCommand
    `indirectSymbolsInst`: seq[uint32]
    `indirectSymbolsInstFlag`: bool
  MachO_MachHeader* = ref object of KaitaiStruct
    `cputype`*: MachO_CpuType
    `cpusubtype`*: uint32
    `filetype`*: MachO_FileType
    `ncmds`*: uint32
    `sizeofcmds`*: uint32
    `flags`*: uint32
    `reserved`*: uint32
    `parent`*: MachO
    `flagsObjInst`: MachO_MachoFlags
    `flagsObjInstFlag`: bool
  MachO_LinkeditDataCommand* = ref object of KaitaiStruct
    `dataOff`*: uint32
    `dataSize`*: uint32
    `parent`*: MachO_LoadCommand
  MachO_SubCommand* = ref object of KaitaiStruct
    `name`*: MachO_LcStr
    `parent`*: MachO_LoadCommand
  MachO_TwolevelHintsCommand* = ref object of KaitaiStruct
    `offset`*: uint32
    `numHints`*: uint32
    `parent`*: MachO_LoadCommand
  MachO_Version* = ref object of KaitaiStruct
    `p1`*: uint8
    `minor`*: uint8
    `major`*: uint8
    `release`*: uint8
    `parent`*: MachO_VersionMinCommand
  MachO_EncryptionInfoCommand* = ref object of KaitaiStruct
    `cryptoff`*: uint32
    `cryptsize`*: uint32
    `cryptid`*: uint32
    `pad`*: uint32
    `parent`*: MachO_LoadCommand
  MachO_CodeSignatureCommand* = ref object of KaitaiStruct
    `dataOff`*: uint32
    `dataSize`*: uint32
    `parent`*: MachO_LoadCommand
    `rawCodeSignatureInst`*: seq[byte]
    `codeSignatureInst`: MachO_CsBlob
    `codeSignatureInstFlag`: bool
  MachO_DyldInfoCommand* = ref object of KaitaiStruct
    `rebaseOff`*: uint32
    `rebaseSize`*: uint32
    `bindOff`*: uint32
    `bindSize`*: uint32
    `weakBindOff`*: uint32
    `weakBindSize`*: uint32
    `lazyBindOff`*: uint32
    `lazyBindSize`*: uint32
    `exportOff`*: uint32
    `exportSize`*: uint32
    `parent`*: MachO_LoadCommand
    `rawBindInst`*: seq[byte]
    `rawExportsInst`*: seq[byte]
    `rawWeakBindInst`*: seq[byte]
    `rawRebaseInst`*: seq[byte]
    `rawLazyBindInst`*: seq[byte]
    `bindInst`: MachO_DyldInfoCommand_BindData
    `bindInstFlag`: bool
    `exportsInst`: MachO_DyldInfoCommand_ExportNode
    `exportsInstFlag`: bool
    `weakBindInst`: MachO_DyldInfoCommand_BindData
    `weakBindInstFlag`: bool
    `rebaseInst`: MachO_DyldInfoCommand_RebaseData
    `rebaseInstFlag`: bool
    `lazyBindInst`: MachO_DyldInfoCommand_BindData
    `lazyBindInstFlag`: bool
  MachO_DyldInfoCommand_BindOpcode* = enum
    done = 0
    set_dylib_ordinal_immediate = 16
    set_dylib_ordinal_uleb = 32
    set_dylib_special_immediate = 48
    set_symbol_trailing_flags_immediate = 64
    set_type_immediate = 80
    set_append_sleb = 96
    set_segment_and_offset_uleb = 112
    add_address_uleb = 128
    do_bind = 144
    do_bind_add_address_uleb = 160
    do_bind_add_address_immediate_scaled = 176
    do_bind_uleb_times_skipping_uleb = 192
  MachO_DyldInfoCommand_RebaseData* = ref object of KaitaiStruct
    `items`*: seq[MachO_DyldInfoCommand_RebaseData_RebaseItem]
    `parent`*: MachO_DyldInfoCommand
  MachO_DyldInfoCommand_RebaseData_Opcode* = enum
    done = 0
    set_type_immediate = 16
    set_segment_and_offset_uleb = 32
    add_address_uleb = 48
    add_address_immediate_scaled = 64
    do_rebase_immediate_times = 80
    do_rebase_uleb_times = 96
    do_rebase_add_address_uleb = 112
    do_rebase_uleb_times_skipping_uleb = 128
  MachO_DyldInfoCommand_RebaseData_RebaseItem* = ref object of KaitaiStruct
    `opcodeAndImmediate`*: uint8
    `uleb`*: MachO_Uleb128
    `skip`*: MachO_Uleb128
    `parent`*: MachO_DyldInfoCommand_RebaseData
    `opcodeInst`: MachO_DyldInfoCommand_RebaseData_Opcode
    `opcodeInstFlag`: bool
    `immediateInst`: int
    `immediateInstFlag`: bool
  MachO_DyldInfoCommand_BindItem* = ref object of KaitaiStruct
    `opcodeAndImmediate`*: uint8
    `uleb`*: MachO_Uleb128
    `skip`*: MachO_Uleb128
    `symbol`*: string
    `parent`*: MachO_DyldInfoCommand_BindData
    `opcodeInst`: MachO_DyldInfoCommand_BindOpcode
    `opcodeInstFlag`: bool
    `immediateInst`: int
    `immediateInstFlag`: bool
  MachO_DyldInfoCommand_BindData* = ref object of KaitaiStruct
    `items`*: seq[MachO_DyldInfoCommand_BindItem]
    `parent`*: MachO_DyldInfoCommand
  MachO_DyldInfoCommand_ExportNode* = ref object of KaitaiStruct
    `terminalSize`*: MachO_Uleb128
    `childrenCount`*: uint8
    `children`*: seq[MachO_DyldInfoCommand_ExportNode_Child]
    `terminal`*: seq[byte]
    `parent`*: KaitaiStruct
  MachO_DyldInfoCommand_ExportNode_Child* = ref object of KaitaiStruct
    `name`*: string
    `nodeOffset`*: MachO_Uleb128
    `parent`*: MachO_DyldInfoCommand_ExportNode
    `valueInst`: MachO_DyldInfoCommand_ExportNode
    `valueInstFlag`: bool
  MachO_DylinkerCommand* = ref object of KaitaiStruct
    `name`*: MachO_LcStr
    `parent`*: MachO_LoadCommand
  MachO_DylibCommand* = ref object of KaitaiStruct
    `nameOffset`*: uint32
    `timestamp`*: uint32
    `currentVersion`*: uint32
    `compatibilityVersion`*: uint32
    `name`*: string
    `parent`*: MachO_LoadCommand
  MachO_SegmentCommand* = ref object of KaitaiStruct
    `segname`*: string
    `vmaddr`*: uint32
    `vmsize`*: uint32
    `fileoff`*: uint32
    `filesize`*: uint32
    `maxprot`*: MachO_VmProt
    `initprot`*: MachO_VmProt
    `nsects`*: uint32
    `flags`*: uint32
    `sections`*: seq[MachO_SegmentCommand_Section]
    `parent`*: MachO_LoadCommand
  MachO_SegmentCommand_Section* = ref object of KaitaiStruct
    `sectName`*: string
    `segName`*: string
    `addr`*: uint32
    `size`*: uint32
    `offset`*: uint32
    `align`*: uint32
    `reloff`*: uint32
    `nreloc`*: uint32
    `flags`*: uint32
    `reserved1`*: uint32
    `reserved2`*: uint32
    `parent`*: MachO_SegmentCommand
    `dataInst`: seq[byte]
    `dataInstFlag`: bool
  MachO_LcStr* = ref object of KaitaiStruct
    `length`*: uint32
    `value`*: string
    `parent`*: KaitaiStruct
  MachO_LoadCommand* = ref object of KaitaiStruct
    `type`*: MachO_LoadCommandType
    `size`*: uint32
    `body`*: KaitaiStruct
    `parent`*: MachO
    `rawBody`*: seq[byte]
  MachO_UuidCommand* = ref object of KaitaiStruct
    `uuid`*: seq[byte]
    `parent`*: MachO_LoadCommand
  MachO_SymtabCommand* = ref object of KaitaiStruct
    `symOff`*: uint32
    `nSyms`*: uint32
    `strOff`*: uint32
    `strSize`*: uint32
    `parent`*: MachO_LoadCommand
    `rawStrsInst`*: seq[byte]
    `symbolsInst`: seq[KaitaiStruct]
    `symbolsInstFlag`: bool
    `strsInst`: MachO_SymtabCommand_StrTable
    `strsInstFlag`: bool
  MachO_SymtabCommand_StrTable* = ref object of KaitaiStruct
    `unknown`*: uint32
    `items`*: seq[string]
    `parent`*: MachO_SymtabCommand
  MachO_SymtabCommand_Nlist64* = ref object of KaitaiStruct
    `un`*: uint32
    `type`*: uint8
    `sect`*: uint8
    `desc`*: uint16
    `value`*: uint64
    `parent`*: MachO_SymtabCommand
    `nameInst`: string
    `nameInstFlag`: bool
  MachO_SymtabCommand_Nlist* = ref object of KaitaiStruct
    `un`*: uint32
    `type`*: uint8
    `sect`*: uint8
    `desc`*: uint16
    `value`*: uint32
    `parent`*: MachO_SymtabCommand
    `nameInst`: string
    `nameInstFlag`: bool
  MachO_VersionMinCommand* = ref object of KaitaiStruct
    `version`*: MachO_Version
    `sdk`*: MachO_Version
    `parent`*: MachO_LoadCommand
  MachO_EntryPointCommand* = ref object of KaitaiStruct
    `entryOff`*: uint64
    `stackSize`*: uint64
    `parent`*: MachO_LoadCommand

proc read*(_: typedesc[MachO], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachO
proc read*(_: typedesc[MachO_RpathCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_RpathCommand
proc read*(_: typedesc[MachO_Uleb128], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachO_Uleb128
proc read*(_: typedesc[MachO_SourceVersionCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_SourceVersionCommand
proc read*(_: typedesc[MachO_CsBlob], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachO_CsBlob
proc read*(_: typedesc[MachO_CsBlob_CodeDirectory], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob): MachO_CsBlob_CodeDirectory
proc read*(_: typedesc[MachO_CsBlob_Data], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachO_CsBlob_Data
proc read*(_: typedesc[MachO_CsBlob_SuperBlob], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob): MachO_CsBlob_SuperBlob
proc read*(_: typedesc[MachO_CsBlob_Expr], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachO_CsBlob_Expr
proc read*(_: typedesc[MachO_CsBlob_Expr_InfoKeyFieldExpr], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Expr): MachO_CsBlob_Expr_InfoKeyFieldExpr
proc read*(_: typedesc[MachO_CsBlob_Expr_CertSlotExpr], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Expr): MachO_CsBlob_Expr_CertSlotExpr
proc read*(_: typedesc[MachO_CsBlob_Expr_CertGenericExpr], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Expr): MachO_CsBlob_Expr_CertGenericExpr
proc read*(_: typedesc[MachO_CsBlob_Expr_IdentExpr], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Expr): MachO_CsBlob_Expr_IdentExpr
proc read*(_: typedesc[MachO_CsBlob_Expr_CertFieldExpr], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Expr): MachO_CsBlob_Expr_CertFieldExpr
proc read*(_: typedesc[MachO_CsBlob_Expr_AnchorHashExpr], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Expr): MachO_CsBlob_Expr_AnchorHashExpr
proc read*(_: typedesc[MachO_CsBlob_Expr_AppleGenericAnchorExpr], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Expr): MachO_CsBlob_Expr_AppleGenericAnchorExpr
proc read*(_: typedesc[MachO_CsBlob_Expr_EntitlementFieldExpr], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Expr): MachO_CsBlob_Expr_EntitlementFieldExpr
proc read*(_: typedesc[MachO_CsBlob_Expr_AndExpr], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Expr): MachO_CsBlob_Expr_AndExpr
proc read*(_: typedesc[MachO_CsBlob_Expr_OrExpr], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Expr): MachO_CsBlob_Expr_OrExpr
proc read*(_: typedesc[MachO_CsBlob_BlobIndex], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_SuperBlob): MachO_CsBlob_BlobIndex
proc read*(_: typedesc[MachO_CsBlob_Match], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachO_CsBlob_Match
proc read*(_: typedesc[MachO_CsBlob_Requirement], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob): MachO_CsBlob_Requirement
proc read*(_: typedesc[MachO_CsBlob_Requirements], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob): MachO_CsBlob_Requirements
proc read*(_: typedesc[MachO_CsBlob_BlobWrapper], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob): MachO_CsBlob_BlobWrapper
proc read*(_: typedesc[MachO_CsBlob_Entitlements], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob): MachO_CsBlob_Entitlements
proc read*(_: typedesc[MachO_CsBlob_RequirementsBlobIndex], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Requirements): MachO_CsBlob_RequirementsBlobIndex
proc read*(_: typedesc[MachO_BuildVersionCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_BuildVersionCommand
proc read*(_: typedesc[MachO_BuildVersionCommand_BuildToolVersion], io: KaitaiStream, root: KaitaiStruct, parent: MachO_BuildVersionCommand): MachO_BuildVersionCommand_BuildToolVersion
proc read*(_: typedesc[MachO_RoutinesCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_RoutinesCommand
proc read*(_: typedesc[MachO_MachoFlags], io: KaitaiStream, root: KaitaiStruct, parent: MachO_MachHeader, value: any): MachO_MachoFlags
proc read*(_: typedesc[MachO_RoutinesCommand64], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_RoutinesCommand64
proc read*(_: typedesc[MachO_LinkerOptionCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_LinkerOptionCommand
proc read*(_: typedesc[MachO_SegmentCommand64], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_SegmentCommand64
proc read*(_: typedesc[MachO_SegmentCommand64_Section64], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SegmentCommand64): MachO_SegmentCommand64_Section64
proc read*(_: typedesc[MachO_SegmentCommand64_Section64_CfStringList], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SegmentCommand64_Section64): MachO_SegmentCommand64_Section64_CfStringList
proc read*(_: typedesc[MachO_SegmentCommand64_Section64_CfString], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SegmentCommand64_Section64_CfStringList): MachO_SegmentCommand64_Section64_CfString
proc read*(_: typedesc[MachO_SegmentCommand64_Section64_EhFrameItem], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SegmentCommand64_Section64_EhFrame): MachO_SegmentCommand64_Section64_EhFrameItem
proc read*(_: typedesc[MachO_SegmentCommand64_Section64_EhFrameItem_CharChain], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachO_SegmentCommand64_Section64_EhFrameItem_CharChain
proc read*(_: typedesc[MachO_SegmentCommand64_Section64_EhFrameItem_Cie], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SegmentCommand64_Section64_EhFrameItem): MachO_SegmentCommand64_Section64_EhFrameItem_Cie
proc read*(_: typedesc[MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SegmentCommand64_Section64_EhFrameItem_Cie): MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry
proc read*(_: typedesc[MachO_SegmentCommand64_Section64_EhFrame], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SegmentCommand64_Section64): MachO_SegmentCommand64_Section64_EhFrame
proc read*(_: typedesc[MachO_SegmentCommand64_Section64_PointerList], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SegmentCommand64_Section64): MachO_SegmentCommand64_Section64_PointerList
proc read*(_: typedesc[MachO_SegmentCommand64_Section64_StringList], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SegmentCommand64_Section64): MachO_SegmentCommand64_Section64_StringList
proc read*(_: typedesc[MachO_VmProt], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachO_VmProt
proc read*(_: typedesc[MachO_DysymtabCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_DysymtabCommand
proc read*(_: typedesc[MachO_MachHeader], io: KaitaiStream, root: KaitaiStruct, parent: MachO): MachO_MachHeader
proc read*(_: typedesc[MachO_LinkeditDataCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_LinkeditDataCommand
proc read*(_: typedesc[MachO_SubCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_SubCommand
proc read*(_: typedesc[MachO_TwolevelHintsCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_TwolevelHintsCommand
proc read*(_: typedesc[MachO_Version], io: KaitaiStream, root: KaitaiStruct, parent: MachO_VersionMinCommand): MachO_Version
proc read*(_: typedesc[MachO_EncryptionInfoCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_EncryptionInfoCommand
proc read*(_: typedesc[MachO_CodeSignatureCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_CodeSignatureCommand
proc read*(_: typedesc[MachO_DyldInfoCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_DyldInfoCommand
proc read*(_: typedesc[MachO_DyldInfoCommand_RebaseData], io: KaitaiStream, root: KaitaiStruct, parent: MachO_DyldInfoCommand): MachO_DyldInfoCommand_RebaseData
proc read*(_: typedesc[MachO_DyldInfoCommand_RebaseData_RebaseItem], io: KaitaiStream, root: KaitaiStruct, parent: MachO_DyldInfoCommand_RebaseData): MachO_DyldInfoCommand_RebaseData_RebaseItem
proc read*(_: typedesc[MachO_DyldInfoCommand_BindItem], io: KaitaiStream, root: KaitaiStruct, parent: MachO_DyldInfoCommand_BindData): MachO_DyldInfoCommand_BindItem
proc read*(_: typedesc[MachO_DyldInfoCommand_BindData], io: KaitaiStream, root: KaitaiStruct, parent: MachO_DyldInfoCommand): MachO_DyldInfoCommand_BindData
proc read*(_: typedesc[MachO_DyldInfoCommand_ExportNode], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachO_DyldInfoCommand_ExportNode
proc read*(_: typedesc[MachO_DyldInfoCommand_ExportNode_Child], io: KaitaiStream, root: KaitaiStruct, parent: MachO_DyldInfoCommand_ExportNode): MachO_DyldInfoCommand_ExportNode_Child
proc read*(_: typedesc[MachO_DylinkerCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_DylinkerCommand
proc read*(_: typedesc[MachO_DylibCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_DylibCommand
proc read*(_: typedesc[MachO_SegmentCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_SegmentCommand
proc read*(_: typedesc[MachO_SegmentCommand_Section], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SegmentCommand): MachO_SegmentCommand_Section
proc read*(_: typedesc[MachO_LcStr], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachO_LcStr
proc read*(_: typedesc[MachO_LoadCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO): MachO_LoadCommand
proc read*(_: typedesc[MachO_UuidCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_UuidCommand
proc read*(_: typedesc[MachO_SymtabCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_SymtabCommand
proc read*(_: typedesc[MachO_SymtabCommand_StrTable], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SymtabCommand): MachO_SymtabCommand_StrTable
proc read*(_: typedesc[MachO_SymtabCommand_Nlist64], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SymtabCommand): MachO_SymtabCommand_Nlist64
proc read*(_: typedesc[MachO_SymtabCommand_Nlist], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SymtabCommand): MachO_SymtabCommand_Nlist
proc read*(_: typedesc[MachO_VersionMinCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_VersionMinCommand
proc read*(_: typedesc[MachO_EntryPointCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_EntryPointCommand

proc value*(this: MachO_Uleb128): int
proc ident*(this: MachO_CsBlob_CodeDirectory): string
proc teamId*(this: MachO_CsBlob_CodeDirectory): string
proc hashes*(this: MachO_CsBlob_CodeDirectory): seq[seq[byte]]
proc value*(this: MachO_CsBlob_Expr_AppleGenericAnchorExpr): string
proc blob*(this: MachO_CsBlob_BlobIndex): MachO_CsBlob
proc value*(this: MachO_CsBlob_RequirementsBlobIndex): MachO_CsBlob
proc subsectionsViaSymbols*(this: MachO_MachoFlags): bool
proc deadStrippableDylib*(this: MachO_MachoFlags): bool
proc weakDefines*(this: MachO_MachoFlags): bool
proc prebound*(this: MachO_MachoFlags): bool
proc allModsBound*(this: MachO_MachoFlags): bool
proc hasTlvDescriptors*(this: MachO_MachoFlags): bool
proc forceFlat*(this: MachO_MachoFlags): bool
proc rootSafe*(this: MachO_MachoFlags): bool
proc noUndefs*(this: MachO_MachoFlags): bool
proc setuidSafe*(this: MachO_MachoFlags): bool
proc noHeapExecution*(this: MachO_MachoFlags): bool
proc noReexportedDylibs*(this: MachO_MachoFlags): bool
proc noMultiDefs*(this: MachO_MachoFlags): bool
proc appExtensionSafe*(this: MachO_MachoFlags): bool
proc prebindable*(this: MachO_MachoFlags): bool
proc incrLink*(this: MachO_MachoFlags): bool
proc bindAtLoad*(this: MachO_MachoFlags): bool
proc canonical*(this: MachO_MachoFlags): bool
proc twoLevel*(this: MachO_MachoFlags): bool
proc splitSegs*(this: MachO_MachoFlags): bool
proc lazyInit*(this: MachO_MachoFlags): bool
proc allowStackExecution*(this: MachO_MachoFlags): bool
proc bindsToWeak*(this: MachO_MachoFlags): bool
proc noFixPrebinding*(this: MachO_MachoFlags): bool
proc dyldLink*(this: MachO_MachoFlags): bool
proc pie*(this: MachO_MachoFlags): bool
proc data*(this: MachO_SegmentCommand64_Section64): KaitaiStruct
proc indirectSymbols*(this: MachO_DysymtabCommand): seq[uint32]
proc flagsObj*(this: MachO_MachHeader): MachO_MachoFlags
proc codeSignature*(this: MachO_CodeSignatureCommand): MachO_CsBlob
proc bind*(this: MachO_DyldInfoCommand): MachO_DyldInfoCommand_BindData
proc exports*(this: MachO_DyldInfoCommand): MachO_DyldInfoCommand_ExportNode
proc weakBind*(this: MachO_DyldInfoCommand): MachO_DyldInfoCommand_BindData
proc rebase*(this: MachO_DyldInfoCommand): MachO_DyldInfoCommand_RebaseData
proc lazyBind*(this: MachO_DyldInfoCommand): MachO_DyldInfoCommand_BindData
proc opcode*(this: MachO_DyldInfoCommand_RebaseData_RebaseItem): MachO_DyldInfoCommand_RebaseData_Opcode
proc immediate*(this: MachO_DyldInfoCommand_RebaseData_RebaseItem): int
proc opcode*(this: MachO_DyldInfoCommand_BindItem): MachO_DyldInfoCommand_BindOpcode
proc immediate*(this: MachO_DyldInfoCommand_BindItem): int
proc value*(this: MachO_DyldInfoCommand_ExportNode_Child): MachO_DyldInfoCommand_ExportNode
proc data*(this: MachO_SegmentCommand_Section): seq[byte]
proc symbols*(this: MachO_SymtabCommand): seq[KaitaiStruct]
proc strs*(this: MachO_SymtabCommand): MachO_SymtabCommand_StrTable
proc name*(this: MachO_SymtabCommand_Nlist64): string
proc name*(this: MachO_SymtabCommand_Nlist): string


##[
@see <a href="https://www.stonedcoder.org/~kd/lib/MachORuntime.pdf">Source</a>
@see <a href="https://opensource.apple.com/source/python_modules/python_modules-43/Modules/macholib-1.5.1/macholib-1.5.1.tar.gz">Source</a>
@see <a href="https://github.com/comex/cs/blob/07a88f9/macho_cs.py">Source</a>
@see <a href="https://opensource.apple.com/source/Security/Security-55471/libsecurity_codesigning/requirements.grammar.auto.html">Source</a>
@see <a href="https://github.com/apple/darwin-xnu/blob/xnu-2782.40.9/bsd/sys/codesign.h">Source</a>
@see <a href="https://opensource.apple.com/source/dyld/dyld-852/src/ImageLoaderMachO.cpp.auto.html">Source</a>
@see <a href="https://opensource.apple.com/source/dyld/dyld-852/src/ImageLoaderMachOCompressed.cpp.auto.html">Source</a>
]##
proc read*(_: typedesc[MachO], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachO =
  template this: untyped = result
  this = new(MachO)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = MachO_MagicType(this.io.readU4be())
  this.magic = magicExpr
  let headerExpr = MachO_MachHeader.read(this.io, this.root, this)
  this.header = headerExpr
  for i in 0 ..< int(this.header.ncmds):
    let it = MachO_LoadCommand.read(this.io, this.root, this)
    this.loadCommands.add(it)

proc fromFile*(_: typedesc[MachO], filename: string): MachO =
  MachO.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_RpathCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_RpathCommand =
  template this: untyped = result
  this = new(MachO_RpathCommand)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let pathOffsetExpr = this.io.readU4le()
  this.pathOffset = pathOffsetExpr
  let pathExpr = encode(this.io.readBytesTerm(0, false, true, true), "utf-8")
  this.path = pathExpr

proc fromFile*(_: typedesc[MachO_RpathCommand], filename: string): MachO_RpathCommand =
  MachO_RpathCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_Uleb128], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachO_Uleb128 =
  template this: untyped = result
  this = new(MachO_Uleb128)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let b1Expr = this.io.readU1()
  this.b1 = b1Expr
  if (this.b1 and 128) != 0:
    let b2Expr = this.io.readU1()
    this.b2 = b2Expr
  if (this.b2 and 128) != 0:
    let b3Expr = this.io.readU1()
    this.b3 = b3Expr
  if (this.b3 and 128) != 0:
    let b4Expr = this.io.readU1()
    this.b4 = b4Expr
  if (this.b4 and 128) != 0:
    let b5Expr = this.io.readU1()
    this.b5 = b5Expr
  if (this.b5 and 128) != 0:
    let b6Expr = this.io.readU1()
    this.b6 = b6Expr
  if (this.b6 and 128) != 0:
    let b7Expr = this.io.readU1()
    this.b7 = b7Expr
  if (this.b7 and 128) != 0:
    let b8Expr = this.io.readU1()
    this.b8 = b8Expr
  if (this.b8 and 128) != 0:
    let b9Expr = this.io.readU1()
    this.b9 = b9Expr
  if (this.b9 and 128) != 0:
    let b10Expr = this.io.readU1()
    this.b10 = b10Expr

proc value(this: MachO_Uleb128): int = 
  if this.valueInstFlag:
    return this.valueInst
  let valueInstExpr = int((((this.b1 %%% 128) shl 0) + (if (this.b1 and 128) == 0: 0 else: (((this.b2 %%% 128) shl 7) + (if (this.b2 and 128) == 0: 0 else: (((this.b3 %%% 128) shl 14) + (if (this.b3 and 128) == 0: 0 else: (((this.b4 %%% 128) shl 21) + (if (this.b4 and 128) == 0: 0 else: (((this.b5 %%% 128) shl 28) + (if (this.b5 and 128) == 0: 0 else: (((this.b6 %%% 128) shl 35) + (if (this.b6 and 128) == 0: 0 else: (((this.b7 %%% 128) shl 42) + (if (this.b7 and 128) == 0: 0 else: (((this.b8 %%% 128) shl 49) + (if (this.b8 and 128) == 0: 0 else: (((this.b9 %%% 128) shl 56) + (if (this.b8 and 128) == 0: 0 else: ((this.b10 %%% 128) shl 63))))))))))))))))))))
  this.valueInst = valueInstExpr
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[MachO_Uleb128], filename: string): MachO_Uleb128 =
  MachO_Uleb128.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_SourceVersionCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_SourceVersionCommand =
  template this: untyped = result
  this = new(MachO_SourceVersionCommand)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = this.io.readU8le()
  this.version = versionExpr

proc fromFile*(_: typedesc[MachO_SourceVersionCommand], filename: string): MachO_SourceVersionCommand =
  MachO_SourceVersionCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachO_CsBlob =
  template this: untyped = result
  this = new(MachO_CsBlob)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = MachO_CsBlob_CsMagic(this.io.readU4be())
  this.magic = magicExpr
  let lengthExpr = this.io.readU4be()
  this.length = lengthExpr
  block:
    let on = this.magic
    if on == mach_o.requirement:
      let rawBodyExpr = this.io.readBytes(int((this.length - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_CsBlob_Requirement.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.code_directory:
      let rawBodyExpr = this.io.readBytes(int((this.length - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_CsBlob_CodeDirectory.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.requirements:
      let rawBodyExpr = this.io.readBytes(int((this.length - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_CsBlob_Requirements.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.blob_wrapper:
      let rawBodyExpr = this.io.readBytes(int((this.length - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_CsBlob_BlobWrapper.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.embedded_signature:
      let rawBodyExpr = this.io.readBytes(int((this.length - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_CsBlob_SuperBlob.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.entitlements:
      let rawBodyExpr = this.io.readBytes(int((this.length - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_CsBlob_Entitlements.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.detached_signature:
      let rawBodyExpr = this.io.readBytes(int((this.length - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_CsBlob_SuperBlob.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.der_entitlements:
      let rawBodyExpr = this.io.readBytes(int((this.length - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Asn1Der.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int((this.length - 8)))
      this.body = bodyExpr

proc fromFile*(_: typedesc[MachO_CsBlob], filename: string): MachO_CsBlob =
  MachO_CsBlob.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_CodeDirectory], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob): MachO_CsBlob_CodeDirectory =
  template this: untyped = result
  this = new(MachO_CsBlob_CodeDirectory)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = this.io.readU4be()
  this.version = versionExpr
  let flagsExpr = this.io.readU4be()
  this.flags = flagsExpr
  let hashOffsetExpr = this.io.readU4be()
  this.hashOffset = hashOffsetExpr
  let identOffsetExpr = this.io.readU4be()
  this.identOffset = identOffsetExpr
  let nSpecialSlotsExpr = this.io.readU4be()
  this.nSpecialSlots = nSpecialSlotsExpr
  let nCodeSlotsExpr = this.io.readU4be()
  this.nCodeSlots = nCodeSlotsExpr
  let codeLimitExpr = this.io.readU4be()
  this.codeLimit = codeLimitExpr
  let hashSizeExpr = this.io.readU1()
  this.hashSize = hashSizeExpr
  let hashTypeExpr = this.io.readU1()
  this.hashType = hashTypeExpr
  let spare1Expr = this.io.readU1()
  this.spare1 = spare1Expr
  let pageSizeExpr = this.io.readU1()
  this.pageSize = pageSizeExpr
  let spare2Expr = this.io.readU4be()
  this.spare2 = spare2Expr
  if this.version >= 131328:
    let scatterOffsetExpr = this.io.readU4be()
    this.scatterOffset = scatterOffsetExpr
  if this.version >= 131584:
    let teamIdOffsetExpr = this.io.readU4be()
    this.teamIdOffset = teamIdOffsetExpr

proc ident(this: MachO_CsBlob_CodeDirectory): string = 
  if this.identInstFlag:
    return this.identInst
  let pos = this.io.pos()
  this.io.seek(int((this.identOffset - 8)))
  let identInstExpr = encode(this.io.readBytesTerm(0, false, true, true), "utf-8")
  this.identInst = identInstExpr
  this.io.seek(pos)
  this.identInstFlag = true
  return this.identInst

proc teamId(this: MachO_CsBlob_CodeDirectory): string = 
  if this.teamIdInstFlag:
    return this.teamIdInst
  let pos = this.io.pos()
  this.io.seek(int((this.teamIdOffset - 8)))
  let teamIdInstExpr = encode(this.io.readBytesTerm(0, false, true, true), "utf-8")
  this.teamIdInst = teamIdInstExpr
  this.io.seek(pos)
  this.teamIdInstFlag = true
  return this.teamIdInst

proc hashes(this: MachO_CsBlob_CodeDirectory): seq[seq[byte]] = 
  if this.hashesInstFlag:
    return this.hashesInst
  let pos = this.io.pos()
  this.io.seek(int(((this.hashOffset - 8) - (this.hashSize * this.nSpecialSlots))))
  for i in 0 ..< int((this.nSpecialSlots + this.nCodeSlots)):
    let it = this.io.readBytes(int(this.hashSize))
    this.hashesInst.add(it)
  this.io.seek(pos)
  this.hashesInstFlag = true
  return this.hashesInst

proc fromFile*(_: typedesc[MachO_CsBlob_CodeDirectory], filename: string): MachO_CsBlob_CodeDirectory =
  MachO_CsBlob_CodeDirectory.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_Data], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachO_CsBlob_Data =
  template this: untyped = result
  this = new(MachO_CsBlob_Data)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lengthExpr = this.io.readU4be()
  this.length = lengthExpr
  let valueExpr = this.io.readBytes(int(this.length))
  this.value = valueExpr
  let paddingExpr = this.io.readBytes(int((-(this.length) %%% 4)))
  this.padding = paddingExpr

proc fromFile*(_: typedesc[MachO_CsBlob_Data], filename: string): MachO_CsBlob_Data =
  MachO_CsBlob_Data.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_SuperBlob], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob): MachO_CsBlob_SuperBlob =
  template this: untyped = result
  this = new(MachO_CsBlob_SuperBlob)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let countExpr = this.io.readU4be()
  this.count = countExpr
  for i in 0 ..< int(this.count):
    let it = MachO_CsBlob_BlobIndex.read(this.io, this.root, this)
    this.blobs.add(it)

proc fromFile*(_: typedesc[MachO_CsBlob_SuperBlob], filename: string): MachO_CsBlob_SuperBlob =
  MachO_CsBlob_SuperBlob.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_Expr], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachO_CsBlob_Expr =
  template this: untyped = result
  this = new(MachO_CsBlob_Expr)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let opExpr = MachO_CsBlob_Expr_OpEnum(this.io.readU4be())
  this.op = opExpr
  block:
    let on = this.op
    if on == mach_o.ident:
      let dataExpr = MachO_CsBlob_Expr_IdentExpr.read(this.io, this.root, this)
      this.data = dataExpr
    elif on == mach_o.or_op:
      let dataExpr = MachO_CsBlob_Expr_OrExpr.read(this.io, this.root, this)
      this.data = dataExpr
    elif on == mach_o.info_key_value:
      let dataExpr = MachO_CsBlob_Data.read(this.io, this.root, this)
      this.data = dataExpr
    elif on == mach_o.anchor_hash:
      let dataExpr = MachO_CsBlob_Expr_AnchorHashExpr.read(this.io, this.root, this)
      this.data = dataExpr
    elif on == mach_o.info_key_field:
      let dataExpr = MachO_CsBlob_Expr_InfoKeyFieldExpr.read(this.io, this.root, this)
      this.data = dataExpr
    elif on == mach_o.not_op:
      let dataExpr = MachO_CsBlob_Expr.read(this.io, this.root, this)
      this.data = dataExpr
    elif on == mach_o.entitlement_field:
      let dataExpr = MachO_CsBlob_Expr_EntitlementFieldExpr.read(this.io, this.root, this)
      this.data = dataExpr
    elif on == mach_o.trusted_cert:
      let dataExpr = MachO_CsBlob_Expr_CertSlotExpr.read(this.io, this.root, this)
      this.data = dataExpr
    elif on == mach_o.and_op:
      let dataExpr = MachO_CsBlob_Expr_AndExpr.read(this.io, this.root, this)
      this.data = dataExpr
    elif on == mach_o.cert_generic:
      let dataExpr = MachO_CsBlob_Expr_CertGenericExpr.read(this.io, this.root, this)
      this.data = dataExpr
    elif on == mach_o.cert_field:
      let dataExpr = MachO_CsBlob_Expr_CertFieldExpr.read(this.io, this.root, this)
      this.data = dataExpr
    elif on == mach_o.cd_hash:
      let dataExpr = MachO_CsBlob_Data.read(this.io, this.root, this)
      this.data = dataExpr
    elif on == mach_o.apple_generic_anchor:
      let dataExpr = MachO_CsBlob_Expr_AppleGenericAnchorExpr.read(this.io, this.root, this)
      this.data = dataExpr

proc fromFile*(_: typedesc[MachO_CsBlob_Expr], filename: string): MachO_CsBlob_Expr =
  MachO_CsBlob_Expr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_Expr_InfoKeyFieldExpr], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Expr): MachO_CsBlob_Expr_InfoKeyFieldExpr =
  template this: untyped = result
  this = new(MachO_CsBlob_Expr_InfoKeyFieldExpr)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dataExpr = MachO_CsBlob_Data.read(this.io, this.root, this)
  this.data = dataExpr
  let matchExpr = MachO_CsBlob_Match.read(this.io, this.root, this)
  this.match = matchExpr

proc fromFile*(_: typedesc[MachO_CsBlob_Expr_InfoKeyFieldExpr], filename: string): MachO_CsBlob_Expr_InfoKeyFieldExpr =
  MachO_CsBlob_Expr_InfoKeyFieldExpr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_Expr_CertSlotExpr], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Expr): MachO_CsBlob_Expr_CertSlotExpr =
  template this: untyped = result
  this = new(MachO_CsBlob_Expr_CertSlotExpr)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let valueExpr = MachO_CsBlob_Expr_CertSlot(this.io.readU4be())
  this.value = valueExpr

proc fromFile*(_: typedesc[MachO_CsBlob_Expr_CertSlotExpr], filename: string): MachO_CsBlob_Expr_CertSlotExpr =
  MachO_CsBlob_Expr_CertSlotExpr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_Expr_CertGenericExpr], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Expr): MachO_CsBlob_Expr_CertGenericExpr =
  template this: untyped = result
  this = new(MachO_CsBlob_Expr_CertGenericExpr)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let certSlotExpr = MachO_CsBlob_Expr_CertSlot(this.io.readU4be())
  this.certSlot = certSlotExpr
  let dataExpr = MachO_CsBlob_Data.read(this.io, this.root, this)
  this.data = dataExpr
  let matchExpr = MachO_CsBlob_Match.read(this.io, this.root, this)
  this.match = matchExpr

proc fromFile*(_: typedesc[MachO_CsBlob_Expr_CertGenericExpr], filename: string): MachO_CsBlob_Expr_CertGenericExpr =
  MachO_CsBlob_Expr_CertGenericExpr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_Expr_IdentExpr], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Expr): MachO_CsBlob_Expr_IdentExpr =
  template this: untyped = result
  this = new(MachO_CsBlob_Expr_IdentExpr)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let identifierExpr = MachO_CsBlob_Data.read(this.io, this.root, this)
  this.identifier = identifierExpr

proc fromFile*(_: typedesc[MachO_CsBlob_Expr_IdentExpr], filename: string): MachO_CsBlob_Expr_IdentExpr =
  MachO_CsBlob_Expr_IdentExpr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_Expr_CertFieldExpr], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Expr): MachO_CsBlob_Expr_CertFieldExpr =
  template this: untyped = result
  this = new(MachO_CsBlob_Expr_CertFieldExpr)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let certSlotExpr = MachO_CsBlob_Expr_CertSlot(this.io.readU4be())
  this.certSlot = certSlotExpr
  let dataExpr = MachO_CsBlob_Data.read(this.io, this.root, this)
  this.data = dataExpr
  let matchExpr = MachO_CsBlob_Match.read(this.io, this.root, this)
  this.match = matchExpr

proc fromFile*(_: typedesc[MachO_CsBlob_Expr_CertFieldExpr], filename: string): MachO_CsBlob_Expr_CertFieldExpr =
  MachO_CsBlob_Expr_CertFieldExpr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_Expr_AnchorHashExpr], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Expr): MachO_CsBlob_Expr_AnchorHashExpr =
  template this: untyped = result
  this = new(MachO_CsBlob_Expr_AnchorHashExpr)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let certSlotExpr = MachO_CsBlob_Expr_CertSlot(this.io.readU4be())
  this.certSlot = certSlotExpr
  let dataExpr = MachO_CsBlob_Data.read(this.io, this.root, this)
  this.data = dataExpr

proc fromFile*(_: typedesc[MachO_CsBlob_Expr_AnchorHashExpr], filename: string): MachO_CsBlob_Expr_AnchorHashExpr =
  MachO_CsBlob_Expr_AnchorHashExpr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_Expr_AppleGenericAnchorExpr], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Expr): MachO_CsBlob_Expr_AppleGenericAnchorExpr =
  template this: untyped = result
  this = new(MachO_CsBlob_Expr_AppleGenericAnchorExpr)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent


proc value(this: MachO_CsBlob_Expr_AppleGenericAnchorExpr): string = 
  if this.valueInstFlag:
    return this.valueInst
  let valueInstExpr = string("anchor apple generic")
  this.valueInst = valueInstExpr
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[MachO_CsBlob_Expr_AppleGenericAnchorExpr], filename: string): MachO_CsBlob_Expr_AppleGenericAnchorExpr =
  MachO_CsBlob_Expr_AppleGenericAnchorExpr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_Expr_EntitlementFieldExpr], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Expr): MachO_CsBlob_Expr_EntitlementFieldExpr =
  template this: untyped = result
  this = new(MachO_CsBlob_Expr_EntitlementFieldExpr)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dataExpr = MachO_CsBlob_Data.read(this.io, this.root, this)
  this.data = dataExpr
  let matchExpr = MachO_CsBlob_Match.read(this.io, this.root, this)
  this.match = matchExpr

proc fromFile*(_: typedesc[MachO_CsBlob_Expr_EntitlementFieldExpr], filename: string): MachO_CsBlob_Expr_EntitlementFieldExpr =
  MachO_CsBlob_Expr_EntitlementFieldExpr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_Expr_AndExpr], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Expr): MachO_CsBlob_Expr_AndExpr =
  template this: untyped = result
  this = new(MachO_CsBlob_Expr_AndExpr)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let leftExpr = MachO_CsBlob_Expr.read(this.io, this.root, this)
  this.left = leftExpr
  let rightExpr = MachO_CsBlob_Expr.read(this.io, this.root, this)
  this.right = rightExpr

proc fromFile*(_: typedesc[MachO_CsBlob_Expr_AndExpr], filename: string): MachO_CsBlob_Expr_AndExpr =
  MachO_CsBlob_Expr_AndExpr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_Expr_OrExpr], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Expr): MachO_CsBlob_Expr_OrExpr =
  template this: untyped = result
  this = new(MachO_CsBlob_Expr_OrExpr)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let leftExpr = MachO_CsBlob_Expr.read(this.io, this.root, this)
  this.left = leftExpr
  let rightExpr = MachO_CsBlob_Expr.read(this.io, this.root, this)
  this.right = rightExpr

proc fromFile*(_: typedesc[MachO_CsBlob_Expr_OrExpr], filename: string): MachO_CsBlob_Expr_OrExpr =
  MachO_CsBlob_Expr_OrExpr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_BlobIndex], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_SuperBlob): MachO_CsBlob_BlobIndex =
  template this: untyped = result
  this = new(MachO_CsBlob_BlobIndex)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let typeExpr = MachO_CsBlob_BlobIndex_CsslotType(this.io.readU4be())
  this.type = typeExpr
  let offsetExpr = this.io.readU4be()
  this.offset = offsetExpr

proc blob(this: MachO_CsBlob_BlobIndex): MachO_CsBlob = 
  if this.blobInstFlag:
    return this.blobInst
  let io = this.parent.io
  let pos = io.pos()
  io.seek(int((this.offset - 8)))
  let rawBlobInstExpr = io.readBytesFull()
  this.rawBlobInst = rawBlobInstExpr
  let rawBlobInstIo = newKaitaiStream(rawBlobInstExpr)
  let blobInstExpr = MachO_CsBlob.read(rawBlobInstIo, this.root, this)
  this.blobInst = blobInstExpr
  io.seek(pos)
  this.blobInstFlag = true
  return this.blobInst

proc fromFile*(_: typedesc[MachO_CsBlob_BlobIndex], filename: string): MachO_CsBlob_BlobIndex =
  MachO_CsBlob_BlobIndex.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_Match], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachO_CsBlob_Match =
  template this: untyped = result
  this = new(MachO_CsBlob_Match)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let matchOpExpr = MachO_CsBlob_Match_Op(this.io.readU4be())
  this.matchOp = matchOpExpr
  if this.matchOp != mach_o.exists:
    let dataExpr = MachO_CsBlob_Data.read(this.io, this.root, this)
    this.data = dataExpr

proc fromFile*(_: typedesc[MachO_CsBlob_Match], filename: string): MachO_CsBlob_Match =
  MachO_CsBlob_Match.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_Requirement], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob): MachO_CsBlob_Requirement =
  template this: untyped = result
  this = new(MachO_CsBlob_Requirement)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let kindExpr = this.io.readU4be()
  this.kind = kindExpr
  let exprExpr = MachO_CsBlob_Expr.read(this.io, this.root, this)
  this.expr = exprExpr

proc fromFile*(_: typedesc[MachO_CsBlob_Requirement], filename: string): MachO_CsBlob_Requirement =
  MachO_CsBlob_Requirement.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_Requirements], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob): MachO_CsBlob_Requirements =
  template this: untyped = result
  this = new(MachO_CsBlob_Requirements)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let countExpr = this.io.readU4be()
  this.count = countExpr
  for i in 0 ..< int(this.count):
    let it = MachO_CsBlob_RequirementsBlobIndex.read(this.io, this.root, this)
    this.items.add(it)

proc fromFile*(_: typedesc[MachO_CsBlob_Requirements], filename: string): MachO_CsBlob_Requirements =
  MachO_CsBlob_Requirements.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_BlobWrapper], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob): MachO_CsBlob_BlobWrapper =
  template this: untyped = result
  this = new(MachO_CsBlob_BlobWrapper)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dataExpr = this.io.readBytesFull()
  this.data = dataExpr

proc fromFile*(_: typedesc[MachO_CsBlob_BlobWrapper], filename: string): MachO_CsBlob_BlobWrapper =
  MachO_CsBlob_BlobWrapper.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_Entitlements], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob): MachO_CsBlob_Entitlements =
  template this: untyped = result
  this = new(MachO_CsBlob_Entitlements)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dataExpr = this.io.readBytesFull()
  this.data = dataExpr

proc fromFile*(_: typedesc[MachO_CsBlob_Entitlements], filename: string): MachO_CsBlob_Entitlements =
  MachO_CsBlob_Entitlements.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CsBlob_RequirementsBlobIndex], io: KaitaiStream, root: KaitaiStruct, parent: MachO_CsBlob_Requirements): MachO_CsBlob_RequirementsBlobIndex =
  template this: untyped = result
  this = new(MachO_CsBlob_RequirementsBlobIndex)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let typeExpr = MachO_CsBlob_RequirementsBlobIndex_RequirementType(this.io.readU4be())
  this.type = typeExpr
  let offsetExpr = this.io.readU4be()
  this.offset = offsetExpr

proc value(this: MachO_CsBlob_RequirementsBlobIndex): MachO_CsBlob = 
  if this.valueInstFlag:
    return this.valueInst
  let pos = this.io.pos()
  this.io.seek(int((this.offset - 8)))
  let valueInstExpr = MachO_CsBlob.read(this.io, this.root, this)
  this.valueInst = valueInstExpr
  this.io.seek(pos)
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[MachO_CsBlob_RequirementsBlobIndex], filename: string): MachO_CsBlob_RequirementsBlobIndex =
  MachO_CsBlob_RequirementsBlobIndex.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_BuildVersionCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_BuildVersionCommand =
  template this: untyped = result
  this = new(MachO_BuildVersionCommand)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let platformExpr = this.io.readU4le()
  this.platform = platformExpr
  let minosExpr = this.io.readU4le()
  this.minos = minosExpr
  let sdkExpr = this.io.readU4le()
  this.sdk = sdkExpr
  let ntoolsExpr = this.io.readU4le()
  this.ntools = ntoolsExpr
  for i in 0 ..< int(this.ntools):
    let it = MachO_BuildVersionCommand_BuildToolVersion.read(this.io, this.root, this)
    this.tools.add(it)

proc fromFile*(_: typedesc[MachO_BuildVersionCommand], filename: string): MachO_BuildVersionCommand =
  MachO_BuildVersionCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_BuildVersionCommand_BuildToolVersion], io: KaitaiStream, root: KaitaiStruct, parent: MachO_BuildVersionCommand): MachO_BuildVersionCommand_BuildToolVersion =
  template this: untyped = result
  this = new(MachO_BuildVersionCommand_BuildToolVersion)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let toolExpr = this.io.readU4le()
  this.tool = toolExpr
  let versionExpr = this.io.readU4le()
  this.version = versionExpr

proc fromFile*(_: typedesc[MachO_BuildVersionCommand_BuildToolVersion], filename: string): MachO_BuildVersionCommand_BuildToolVersion =
  MachO_BuildVersionCommand_BuildToolVersion.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_RoutinesCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_RoutinesCommand =
  template this: untyped = result
  this = new(MachO_RoutinesCommand)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let initAddressExpr = this.io.readU4le()
  this.initAddress = initAddressExpr
  let initModuleExpr = this.io.readU4le()
  this.initModule = initModuleExpr
  let reservedExpr = this.io.readBytes(int(24))
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[MachO_RoutinesCommand], filename: string): MachO_RoutinesCommand =
  MachO_RoutinesCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_MachoFlags], io: KaitaiStream, root: KaitaiStruct, parent: MachO_MachHeader, value: any): MachO_MachoFlags =
  template this: untyped = result
  this = new(MachO_MachoFlags)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent
  let valueExpr = uint32(value)
  this.value = valueExpr


proc subsectionsViaSymbols(this: MachO_MachoFlags): bool = 

  ##[
  safe to divide up the sections into sub-sections via symbols for dead code stripping
  ]##
  if this.subsectionsViaSymbolsInstFlag:
    return this.subsectionsViaSymbolsInst
  let subsectionsViaSymbolsInstExpr = bool((this.value and 8192) != 0)
  this.subsectionsViaSymbolsInst = subsectionsViaSymbolsInstExpr
  this.subsectionsViaSymbolsInstFlag = true
  return this.subsectionsViaSymbolsInst

proc deadStrippableDylib(this: MachO_MachoFlags): bool = 
  if this.deadStrippableDylibInstFlag:
    return this.deadStrippableDylibInst
  let deadStrippableDylibInstExpr = bool((this.value and 4194304) != 0)
  this.deadStrippableDylibInst = deadStrippableDylibInstExpr
  this.deadStrippableDylibInstFlag = true
  return this.deadStrippableDylibInst

proc weakDefines(this: MachO_MachoFlags): bool = 

  ##[
  the final linked image contains external weak symbols
  ]##
  if this.weakDefinesInstFlag:
    return this.weakDefinesInst
  let weakDefinesInstExpr = bool((this.value and 32768) != 0)
  this.weakDefinesInst = weakDefinesInstExpr
  this.weakDefinesInstFlag = true
  return this.weakDefinesInst

proc prebound(this: MachO_MachoFlags): bool = 

  ##[
  the file has its dynamic undefined references prebound.
  ]##
  if this.preboundInstFlag:
    return this.preboundInst
  let preboundInstExpr = bool((this.value and 16) != 0)
  this.preboundInst = preboundInstExpr
  this.preboundInstFlag = true
  return this.preboundInst

proc allModsBound(this: MachO_MachoFlags): bool = 

  ##[
  indicates that this binary binds to all two-level namespace modules of its dependent libraries. only used when MH_PREBINDABLE and MH_TWOLEVEL are both set.
  ]##
  if this.allModsBoundInstFlag:
    return this.allModsBoundInst
  let allModsBoundInstExpr = bool((this.value and 4096) != 0)
  this.allModsBoundInst = allModsBoundInstExpr
  this.allModsBoundInstFlag = true
  return this.allModsBoundInst

proc hasTlvDescriptors(this: MachO_MachoFlags): bool = 
  if this.hasTlvDescriptorsInstFlag:
    return this.hasTlvDescriptorsInst
  let hasTlvDescriptorsInstExpr = bool((this.value and 8388608) != 0)
  this.hasTlvDescriptorsInst = hasTlvDescriptorsInstExpr
  this.hasTlvDescriptorsInstFlag = true
  return this.hasTlvDescriptorsInst

proc forceFlat(this: MachO_MachoFlags): bool = 

  ##[
  the executable is forcing all images to use flat name space bindings
  ]##
  if this.forceFlatInstFlag:
    return this.forceFlatInst
  let forceFlatInstExpr = bool((this.value and 256) != 0)
  this.forceFlatInst = forceFlatInstExpr
  this.forceFlatInstFlag = true
  return this.forceFlatInst

proc rootSafe(this: MachO_MachoFlags): bool = 

  ##[
  When this bit is set, the binary declares it is safe for use in processes with uid zero
  ]##
  if this.rootSafeInstFlag:
    return this.rootSafeInst
  let rootSafeInstExpr = bool((this.value and 262144) != 0)
  this.rootSafeInst = rootSafeInstExpr
  this.rootSafeInstFlag = true
  return this.rootSafeInst

proc noUndefs(this: MachO_MachoFlags): bool = 

  ##[
  the object file has no undefined references
  ]##
  if this.noUndefsInstFlag:
    return this.noUndefsInst
  let noUndefsInstExpr = bool((this.value and 1) != 0)
  this.noUndefsInst = noUndefsInstExpr
  this.noUndefsInstFlag = true
  return this.noUndefsInst

proc setuidSafe(this: MachO_MachoFlags): bool = 

  ##[
  When this bit is set, the binary declares it is safe for use in processes when issetugid() is true
  ]##
  if this.setuidSafeInstFlag:
    return this.setuidSafeInst
  let setuidSafeInstExpr = bool((this.value and 524288) != 0)
  this.setuidSafeInst = setuidSafeInstExpr
  this.setuidSafeInstFlag = true
  return this.setuidSafeInst

proc noHeapExecution(this: MachO_MachoFlags): bool = 
  if this.noHeapExecutionInstFlag:
    return this.noHeapExecutionInst
  let noHeapExecutionInstExpr = bool((this.value and 16777216) != 0)
  this.noHeapExecutionInst = noHeapExecutionInstExpr
  this.noHeapExecutionInstFlag = true
  return this.noHeapExecutionInst

proc noReexportedDylibs(this: MachO_MachoFlags): bool = 

  ##[
  When this bit is set on a dylib, the static linker does not need to examine dependent dylibs to see if any are re-exported
  ]##
  if this.noReexportedDylibsInstFlag:
    return this.noReexportedDylibsInst
  let noReexportedDylibsInstExpr = bool((this.value and 1048576) != 0)
  this.noReexportedDylibsInst = noReexportedDylibsInstExpr
  this.noReexportedDylibsInstFlag = true
  return this.noReexportedDylibsInst

proc noMultiDefs(this: MachO_MachoFlags): bool = 

  ##[
  this umbrella guarantees no multiple defintions of symbols in its sub-images so the two-level namespace hints can always be used.
  ]##
  if this.noMultiDefsInstFlag:
    return this.noMultiDefsInst
  let noMultiDefsInstExpr = bool((this.value and 512) != 0)
  this.noMultiDefsInst = noMultiDefsInstExpr
  this.noMultiDefsInstFlag = true
  return this.noMultiDefsInst

proc appExtensionSafe(this: MachO_MachoFlags): bool = 
  if this.appExtensionSafeInstFlag:
    return this.appExtensionSafeInst
  let appExtensionSafeInstExpr = bool((this.value and 33554432) != 0)
  this.appExtensionSafeInst = appExtensionSafeInstExpr
  this.appExtensionSafeInstFlag = true
  return this.appExtensionSafeInst

proc prebindable(this: MachO_MachoFlags): bool = 

  ##[
  the binary is not prebound but can have its prebinding redone. only used when MH_PREBOUND is not set.
  ]##
  if this.prebindableInstFlag:
    return this.prebindableInst
  let prebindableInstExpr = bool((this.value and 2048) != 0)
  this.prebindableInst = prebindableInstExpr
  this.prebindableInstFlag = true
  return this.prebindableInst

proc incrLink(this: MachO_MachoFlags): bool = 

  ##[
  the object file is the output of an incremental link against a base file and can't be link edited again
  ]##
  if this.incrLinkInstFlag:
    return this.incrLinkInst
  let incrLinkInstExpr = bool((this.value and 2) != 0)
  this.incrLinkInst = incrLinkInstExpr
  this.incrLinkInstFlag = true
  return this.incrLinkInst

proc bindAtLoad(this: MachO_MachoFlags): bool = 

  ##[
  the object file's undefined references are bound by the dynamic linker when loaded.
  ]##
  if this.bindAtLoadInstFlag:
    return this.bindAtLoadInst
  let bindAtLoadInstExpr = bool((this.value and 8) != 0)
  this.bindAtLoadInst = bindAtLoadInstExpr
  this.bindAtLoadInstFlag = true
  return this.bindAtLoadInst

proc canonical(this: MachO_MachoFlags): bool = 

  ##[
  the binary has been canonicalized via the unprebind operation
  ]##
  if this.canonicalInstFlag:
    return this.canonicalInst
  let canonicalInstExpr = bool((this.value and 16384) != 0)
  this.canonicalInst = canonicalInstExpr
  this.canonicalInstFlag = true
  return this.canonicalInst

proc twoLevel(this: MachO_MachoFlags): bool = 

  ##[
  the image is using two-level name space bindings
  ]##
  if this.twoLevelInstFlag:
    return this.twoLevelInst
  let twoLevelInstExpr = bool((this.value and 128) != 0)
  this.twoLevelInst = twoLevelInstExpr
  this.twoLevelInstFlag = true
  return this.twoLevelInst

proc splitSegs(this: MachO_MachoFlags): bool = 

  ##[
  the file has its read-only and read-write segments split
  ]##
  if this.splitSegsInstFlag:
    return this.splitSegsInst
  let splitSegsInstExpr = bool((this.value and 32) != 0)
  this.splitSegsInst = splitSegsInstExpr
  this.splitSegsInstFlag = true
  return this.splitSegsInst

proc lazyInit(this: MachO_MachoFlags): bool = 

  ##[
  the shared library init routine is to be run lazily via catching memory faults to its writeable segments (obsolete)
  ]##
  if this.lazyInitInstFlag:
    return this.lazyInitInst
  let lazyInitInstExpr = bool((this.value and 64) != 0)
  this.lazyInitInst = lazyInitInstExpr
  this.lazyInitInstFlag = true
  return this.lazyInitInst

proc allowStackExecution(this: MachO_MachoFlags): bool = 

  ##[
  When this bit is set, all stacks in the task will be given stack execution privilege.  Only used in MH_EXECUTE filetypes.
  ]##
  if this.allowStackExecutionInstFlag:
    return this.allowStackExecutionInst
  let allowStackExecutionInstExpr = bool((this.value and 131072) != 0)
  this.allowStackExecutionInst = allowStackExecutionInstExpr
  this.allowStackExecutionInstFlag = true
  return this.allowStackExecutionInst

proc bindsToWeak(this: MachO_MachoFlags): bool = 

  ##[
  the final linked image uses weak symbols
  ]##
  if this.bindsToWeakInstFlag:
    return this.bindsToWeakInst
  let bindsToWeakInstExpr = bool((this.value and 65536) != 0)
  this.bindsToWeakInst = bindsToWeakInstExpr
  this.bindsToWeakInstFlag = true
  return this.bindsToWeakInst

proc noFixPrebinding(this: MachO_MachoFlags): bool = 

  ##[
  do not have dyld notify the prebinding agent about this executable
  ]##
  if this.noFixPrebindingInstFlag:
    return this.noFixPrebindingInst
  let noFixPrebindingInstExpr = bool((this.value and 1024) != 0)
  this.noFixPrebindingInst = noFixPrebindingInstExpr
  this.noFixPrebindingInstFlag = true
  return this.noFixPrebindingInst

proc dyldLink(this: MachO_MachoFlags): bool = 

  ##[
  the object file is input for the dynamic linker and can't be staticly link edited again
  ]##
  if this.dyldLinkInstFlag:
    return this.dyldLinkInst
  let dyldLinkInstExpr = bool((this.value and 4) != 0)
  this.dyldLinkInst = dyldLinkInstExpr
  this.dyldLinkInstFlag = true
  return this.dyldLinkInst

proc pie(this: MachO_MachoFlags): bool = 

  ##[
  When this bit is set, the OS will load the main executable at a random address. Only used in MH_EXECUTE filetypes.
  ]##
  if this.pieInstFlag:
    return this.pieInst
  let pieInstExpr = bool((this.value and 2097152) != 0)
  this.pieInst = pieInstExpr
  this.pieInstFlag = true
  return this.pieInst

proc fromFile*(_: typedesc[MachO_MachoFlags], filename: string): MachO_MachoFlags =
  MachO_MachoFlags.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_RoutinesCommand64], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_RoutinesCommand64 =
  template this: untyped = result
  this = new(MachO_RoutinesCommand64)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let initAddressExpr = this.io.readU8le()
  this.initAddress = initAddressExpr
  let initModuleExpr = this.io.readU8le()
  this.initModule = initModuleExpr
  let reservedExpr = this.io.readBytes(int(48))
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[MachO_RoutinesCommand64], filename: string): MachO_RoutinesCommand64 =
  MachO_RoutinesCommand64.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_LinkerOptionCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_LinkerOptionCommand =
  template this: untyped = result
  this = new(MachO_LinkerOptionCommand)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numStringsExpr = this.io.readU4le()
  this.numStrings = numStringsExpr
  for i in 0 ..< int(this.numStrings):
    let it = encode(this.io.readBytesTerm(0, false, true, true), "utf-8")
    this.strings.add(it)

proc fromFile*(_: typedesc[MachO_LinkerOptionCommand], filename: string): MachO_LinkerOptionCommand =
  MachO_LinkerOptionCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_SegmentCommand64], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_SegmentCommand64 =
  template this: untyped = result
  this = new(MachO_SegmentCommand64)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let segnameExpr = encode(this.io.readBytes(int(16)).bytesStripRight(0), "ascii")
  this.segname = segnameExpr
  let vmaddrExpr = this.io.readU8le()
  this.vmaddr = vmaddrExpr
  let vmsizeExpr = this.io.readU8le()
  this.vmsize = vmsizeExpr
  let fileoffExpr = this.io.readU8le()
  this.fileoff = fileoffExpr
  let filesizeExpr = this.io.readU8le()
  this.filesize = filesizeExpr
  let maxprotExpr = MachO_VmProt.read(this.io, this.root, this)
  this.maxprot = maxprotExpr
  let initprotExpr = MachO_VmProt.read(this.io, this.root, this)
  this.initprot = initprotExpr
  let nsectsExpr = this.io.readU4le()
  this.nsects = nsectsExpr
  let flagsExpr = this.io.readU4le()
  this.flags = flagsExpr
  for i in 0 ..< int(this.nsects):
    let it = MachO_SegmentCommand64_Section64.read(this.io, this.root, this)
    this.sections.add(it)

proc fromFile*(_: typedesc[MachO_SegmentCommand64], filename: string): MachO_SegmentCommand64 =
  MachO_SegmentCommand64.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_SegmentCommand64_Section64], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SegmentCommand64): MachO_SegmentCommand64_Section64 =
  template this: untyped = result
  this = new(MachO_SegmentCommand64_Section64)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sectNameExpr = encode(this.io.readBytes(int(16)).bytesStripRight(0), "ascii")
  this.sectName = sectNameExpr
  let segNameExpr = encode(this.io.readBytes(int(16)).bytesStripRight(0), "ascii")
  this.segName = segNameExpr
  let addrExpr = this.io.readU8le()
  this.addr = addrExpr
  let sizeExpr = this.io.readU8le()
  this.size = sizeExpr
  let offsetExpr = this.io.readU4le()
  this.offset = offsetExpr
  let alignExpr = this.io.readU4le()
  this.align = alignExpr
  let reloffExpr = this.io.readU4le()
  this.reloff = reloffExpr
  let nrelocExpr = this.io.readU4le()
  this.nreloc = nrelocExpr
  let flagsExpr = this.io.readU4le()
  this.flags = flagsExpr
  let reserved1Expr = this.io.readU4le()
  this.reserved1 = reserved1Expr
  let reserved2Expr = this.io.readU4le()
  this.reserved2 = reserved2Expr
  let reserved3Expr = this.io.readU4le()
  this.reserved3 = reserved3Expr

proc data(this: MachO_SegmentCommand64_Section64): KaitaiStruct = 
  if this.dataInstFlag:
    return this.dataInst
  let io = MachO(this.root).io
  let pos = io.pos()
  io.seek(int(this.offset))
  block:
    let on = this.sectName
    if on == "__objc_nlclslist":
      let rawDataInstExpr = io.readBytes(int(this.size))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = MachO_SegmentCommand64_Section64_PointerList.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    elif on == "__objc_methname":
      let rawDataInstExpr = io.readBytes(int(this.size))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = MachO_SegmentCommand64_Section64_StringList.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    elif on == "__nl_symbol_ptr":
      let rawDataInstExpr = io.readBytes(int(this.size))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = MachO_SegmentCommand64_Section64_PointerList.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    elif on == "__la_symbol_ptr":
      let rawDataInstExpr = io.readBytes(int(this.size))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = MachO_SegmentCommand64_Section64_PointerList.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    elif on == "__objc_selrefs":
      let rawDataInstExpr = io.readBytes(int(this.size))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = MachO_SegmentCommand64_Section64_PointerList.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    elif on == "__cstring":
      let rawDataInstExpr = io.readBytes(int(this.size))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = MachO_SegmentCommand64_Section64_StringList.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    elif on == "__objc_classlist":
      let rawDataInstExpr = io.readBytes(int(this.size))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = MachO_SegmentCommand64_Section64_PointerList.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    elif on == "__objc_protolist":
      let rawDataInstExpr = io.readBytes(int(this.size))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = MachO_SegmentCommand64_Section64_PointerList.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    elif on == "__objc_imageinfo":
      let rawDataInstExpr = io.readBytes(int(this.size))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = MachO_SegmentCommand64_Section64_PointerList.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    elif on == "__objc_methtype":
      let rawDataInstExpr = io.readBytes(int(this.size))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = MachO_SegmentCommand64_Section64_StringList.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    elif on == "__cfstring":
      let rawDataInstExpr = io.readBytes(int(this.size))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = MachO_SegmentCommand64_Section64_CfStringList.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    elif on == "__objc_classrefs":
      let rawDataInstExpr = io.readBytes(int(this.size))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = MachO_SegmentCommand64_Section64_PointerList.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    elif on == "__objc_protorefs":
      let rawDataInstExpr = io.readBytes(int(this.size))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = MachO_SegmentCommand64_Section64_PointerList.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    elif on == "__objc_classname":
      let rawDataInstExpr = io.readBytes(int(this.size))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = MachO_SegmentCommand64_Section64_StringList.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    elif on == "__got":
      let rawDataInstExpr = io.readBytes(int(this.size))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = MachO_SegmentCommand64_Section64_PointerList.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    elif on == "__eh_frame":
      let rawDataInstExpr = io.readBytes(int(this.size))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = MachO_SegmentCommand64_Section64_EhFrame.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    elif on == "__objc_superrefs":
      let rawDataInstExpr = io.readBytes(int(this.size))
      this.rawDataInst = rawDataInstExpr
      let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
      let dataInstExpr = MachO_SegmentCommand64_Section64_PointerList.read(rawDataInstIo, this.root, this)
      this.dataInst = dataInstExpr
    else:
      let dataInstExpr = io.readBytes(int(this.size))
      this.dataInst = dataInstExpr
  io.seek(pos)
  this.dataInstFlag = true
  return this.dataInst

proc fromFile*(_: typedesc[MachO_SegmentCommand64_Section64], filename: string): MachO_SegmentCommand64_Section64 =
  MachO_SegmentCommand64_Section64.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_SegmentCommand64_Section64_CfStringList], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SegmentCommand64_Section64): MachO_SegmentCommand64_Section64_CfStringList =
  template this: untyped = result
  this = new(MachO_SegmentCommand64_Section64_CfStringList)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = MachO_SegmentCommand64_Section64_CfString.read(this.io, this.root, this)
      this.items.add(it)
      inc i

proc fromFile*(_: typedesc[MachO_SegmentCommand64_Section64_CfStringList], filename: string): MachO_SegmentCommand64_Section64_CfStringList =
  MachO_SegmentCommand64_Section64_CfStringList.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_SegmentCommand64_Section64_CfString], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SegmentCommand64_Section64_CfStringList): MachO_SegmentCommand64_Section64_CfString =
  template this: untyped = result
  this = new(MachO_SegmentCommand64_Section64_CfString)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let isaExpr = this.io.readU8le()
  this.isa = isaExpr
  let infoExpr = this.io.readU8le()
  this.info = infoExpr
  let dataExpr = this.io.readU8le()
  this.data = dataExpr
  let lengthExpr = this.io.readU8le()
  this.length = lengthExpr

proc fromFile*(_: typedesc[MachO_SegmentCommand64_Section64_CfString], filename: string): MachO_SegmentCommand64_Section64_CfString =
  MachO_SegmentCommand64_Section64_CfString.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_SegmentCommand64_Section64_EhFrameItem], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SegmentCommand64_Section64_EhFrame): MachO_SegmentCommand64_Section64_EhFrameItem =
  template this: untyped = result
  this = new(MachO_SegmentCommand64_Section64_EhFrameItem)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lengthExpr = this.io.readU4le()
  this.length = lengthExpr
  if this.length == 4294967295'i64:
    let length64Expr = this.io.readU8le()
    this.length64 = length64Expr
  let idExpr = this.io.readU4le()
  this.id = idExpr
  if this.length > 0:
    block:
      let on = this.id
      if on == 0:
        let rawBodyExpr = this.io.readBytes(int((this.length - 4)))
        this.rawBody = rawBodyExpr
        let rawBodyIo = newKaitaiStream(rawBodyExpr)
        let bodyExpr = MachO_SegmentCommand64_Section64_EhFrameItem_Cie.read(rawBodyIo, this.root, this)
        this.body = bodyExpr
      else:
        let bodyExpr = this.io.readBytes(int((this.length - 4)))
        this.body = bodyExpr

proc fromFile*(_: typedesc[MachO_SegmentCommand64_Section64_EhFrameItem], filename: string): MachO_SegmentCommand64_Section64_EhFrameItem =
  MachO_SegmentCommand64_Section64_EhFrameItem.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_SegmentCommand64_Section64_EhFrameItem_CharChain], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachO_SegmentCommand64_Section64_EhFrameItem_CharChain =
  template this: untyped = result
  this = new(MachO_SegmentCommand64_Section64_EhFrameItem_CharChain)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let chrExpr = this.io.readU1()
  this.chr = chrExpr
  if this.chr != 0:
    let nextExpr = MachO_SegmentCommand64_Section64_EhFrameItem_CharChain.read(this.io, this.root, this)
    this.next = nextExpr

proc fromFile*(_: typedesc[MachO_SegmentCommand64_Section64_EhFrameItem_CharChain], filename: string): MachO_SegmentCommand64_Section64_EhFrameItem_CharChain =
  MachO_SegmentCommand64_Section64_EhFrameItem_CharChain.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_SegmentCommand64_Section64_EhFrameItem_Cie], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SegmentCommand64_Section64_EhFrameItem): MachO_SegmentCommand64_Section64_EhFrameItem_Cie =
  template this: untyped = result
  this = new(MachO_SegmentCommand64_Section64_EhFrameItem_Cie)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = this.io.readU1()
  this.version = versionExpr
  let augStrExpr = MachO_SegmentCommand64_Section64_EhFrameItem_CharChain.read(this.io, this.root, this)
  this.augStr = augStrExpr
  let codeAlignmentFactorExpr = MachO_Uleb128.read(this.io, this.root, this)
  this.codeAlignmentFactor = codeAlignmentFactorExpr
  let dataAlignmentFactorExpr = MachO_Uleb128.read(this.io, this.root, this)
  this.dataAlignmentFactor = dataAlignmentFactorExpr
  let returnAddressRegisterExpr = this.io.readU1()
  this.returnAddressRegister = returnAddressRegisterExpr
  if this.augStr.chr == 122:
    let augmentationExpr = MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry.read(this.io, this.root, this)
    this.augmentation = augmentationExpr

proc fromFile*(_: typedesc[MachO_SegmentCommand64_Section64_EhFrameItem_Cie], filename: string): MachO_SegmentCommand64_Section64_EhFrameItem_Cie =
  MachO_SegmentCommand64_Section64_EhFrameItem_Cie.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SegmentCommand64_Section64_EhFrameItem_Cie): MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry =
  template this: untyped = result
  this = new(MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lengthExpr = MachO_Uleb128.read(this.io, this.root, this)
  this.length = lengthExpr
  if this.parent.augStr.next.chr == 82:
    let fdePointerEncodingExpr = this.io.readU1()
    this.fdePointerEncoding = fdePointerEncodingExpr

proc fromFile*(_: typedesc[MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry], filename: string): MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry =
  MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_SegmentCommand64_Section64_EhFrame], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SegmentCommand64_Section64): MachO_SegmentCommand64_Section64_EhFrame =
  template this: untyped = result
  this = new(MachO_SegmentCommand64_Section64_EhFrame)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = MachO_SegmentCommand64_Section64_EhFrameItem.read(this.io, this.root, this)
      this.items.add(it)
      inc i

proc fromFile*(_: typedesc[MachO_SegmentCommand64_Section64_EhFrame], filename: string): MachO_SegmentCommand64_Section64_EhFrame =
  MachO_SegmentCommand64_Section64_EhFrame.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_SegmentCommand64_Section64_PointerList], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SegmentCommand64_Section64): MachO_SegmentCommand64_Section64_PointerList =
  template this: untyped = result
  this = new(MachO_SegmentCommand64_Section64_PointerList)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = this.io.readU8le()
      this.items.add(it)
      inc i

proc fromFile*(_: typedesc[MachO_SegmentCommand64_Section64_PointerList], filename: string): MachO_SegmentCommand64_Section64_PointerList =
  MachO_SegmentCommand64_Section64_PointerList.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_SegmentCommand64_Section64_StringList], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SegmentCommand64_Section64): MachO_SegmentCommand64_Section64_StringList =
  template this: untyped = result
  this = new(MachO_SegmentCommand64_Section64_StringList)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = encode(this.io.readBytesTerm(0, false, true, true), "ascii")
      this.strings.add(it)
      inc i

proc fromFile*(_: typedesc[MachO_SegmentCommand64_Section64_StringList], filename: string): MachO_SegmentCommand64_Section64_StringList =
  MachO_SegmentCommand64_Section64_StringList.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_VmProt], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachO_VmProt =
  template this: untyped = result
  this = new(MachO_VmProt)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Special marker to support execute-only protection.
  ]##
  let stripReadExpr = this.io.readBitsIntBe(1) != 0
  this.stripRead = stripReadExpr

  ##[
  Indicates to use value as a mask against the actual protection bits.
  ]##
  let isMaskExpr = this.io.readBitsIntBe(1) != 0
  this.isMask = isMaskExpr

  ##[
  Reserved (unused) bit.
  ]##
  let reserved0Expr = this.io.readBitsIntBe(1) != 0
  this.reserved0 = reserved0Expr

  ##[
  Used when write permission can not be obtained, to mark the entry as COW.
  ]##
  let copyExpr = this.io.readBitsIntBe(1) != 0
  this.copy = copyExpr

  ##[
  Used only by memory_object_lock_request to indicate no change to page locks.
  ]##
  let noChangeExpr = this.io.readBitsIntBe(1) != 0
  this.noChange = noChangeExpr

  ##[
  Execute permission.
  ]##
  let executeExpr = this.io.readBitsIntBe(1) != 0
  this.execute = executeExpr

  ##[
  Write permission.
  ]##
  let writeExpr = this.io.readBitsIntBe(1) != 0
  this.write = writeExpr

  ##[
  Read permission.
  ]##
  let readExpr = this.io.readBitsIntBe(1) != 0
  this.read = readExpr

  ##[
  Reserved (unused) bits.
  ]##
  let reserved1Expr = this.io.readBitsIntBe(24)
  this.reserved1 = reserved1Expr

proc fromFile*(_: typedesc[MachO_VmProt], filename: string): MachO_VmProt =
  MachO_VmProt.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_DysymtabCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_DysymtabCommand =
  template this: untyped = result
  this = new(MachO_DysymtabCommand)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let iLocalSymExpr = this.io.readU4le()
  this.iLocalSym = iLocalSymExpr
  let nLocalSymExpr = this.io.readU4le()
  this.nLocalSym = nLocalSymExpr
  let iExtDefSymExpr = this.io.readU4le()
  this.iExtDefSym = iExtDefSymExpr
  let nExtDefSymExpr = this.io.readU4le()
  this.nExtDefSym = nExtDefSymExpr
  let iUndefSymExpr = this.io.readU4le()
  this.iUndefSym = iUndefSymExpr
  let nUndefSymExpr = this.io.readU4le()
  this.nUndefSym = nUndefSymExpr
  let tocOffExpr = this.io.readU4le()
  this.tocOff = tocOffExpr
  let nTocExpr = this.io.readU4le()
  this.nToc = nTocExpr
  let modTabOffExpr = this.io.readU4le()
  this.modTabOff = modTabOffExpr
  let nModTabExpr = this.io.readU4le()
  this.nModTab = nModTabExpr
  let extRefSymOffExpr = this.io.readU4le()
  this.extRefSymOff = extRefSymOffExpr
  let nExtRefSymsExpr = this.io.readU4le()
  this.nExtRefSyms = nExtRefSymsExpr
  let indirectSymOffExpr = this.io.readU4le()
  this.indirectSymOff = indirectSymOffExpr
  let nIndirectSymsExpr = this.io.readU4le()
  this.nIndirectSyms = nIndirectSymsExpr
  let extRelOffExpr = this.io.readU4le()
  this.extRelOff = extRelOffExpr
  let nExtRelExpr = this.io.readU4le()
  this.nExtRel = nExtRelExpr
  let locRelOffExpr = this.io.readU4le()
  this.locRelOff = locRelOffExpr
  let nLocRelExpr = this.io.readU4le()
  this.nLocRel = nLocRelExpr

proc indirectSymbols(this: MachO_DysymtabCommand): seq[uint32] = 
  if this.indirectSymbolsInstFlag:
    return this.indirectSymbolsInst
  let io = MachO(this.root).io
  let pos = io.pos()
  io.seek(int(this.indirectSymOff))
  for i in 0 ..< int(this.nIndirectSyms):
    let it = io.readU4le()
    this.indirectSymbolsInst.add(it)
  io.seek(pos)
  this.indirectSymbolsInstFlag = true
  return this.indirectSymbolsInst

proc fromFile*(_: typedesc[MachO_DysymtabCommand], filename: string): MachO_DysymtabCommand =
  MachO_DysymtabCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_MachHeader], io: KaitaiStream, root: KaitaiStruct, parent: MachO): MachO_MachHeader =
  template this: untyped = result
  this = new(MachO_MachHeader)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let cputypeExpr = MachO_CpuType(this.io.readU4le())
  this.cputype = cputypeExpr
  let cpusubtypeExpr = this.io.readU4le()
  this.cpusubtype = cpusubtypeExpr
  let filetypeExpr = MachO_FileType(this.io.readU4le())
  this.filetype = filetypeExpr
  let ncmdsExpr = this.io.readU4le()
  this.ncmds = ncmdsExpr
  let sizeofcmdsExpr = this.io.readU4le()
  this.sizeofcmds = sizeofcmdsExpr
  let flagsExpr = this.io.readU4le()
  this.flags = flagsExpr
  if  ((MachO(this.root).magic == mach_o.macho_be_x64) or (MachO(this.root).magic == mach_o.macho_le_x64)) :
    let reservedExpr = this.io.readU4le()
    this.reserved = reservedExpr

proc flagsObj(this: MachO_MachHeader): MachO_MachoFlags = 
  if this.flagsObjInstFlag:
    return this.flagsObjInst
  let flagsObjInstExpr = MachO_MachoFlags.read(this.io, this.root, this, this.flags)
  this.flagsObjInst = flagsObjInstExpr
  this.flagsObjInstFlag = true
  return this.flagsObjInst

proc fromFile*(_: typedesc[MachO_MachHeader], filename: string): MachO_MachHeader =
  MachO_MachHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_LinkeditDataCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_LinkeditDataCommand =
  template this: untyped = result
  this = new(MachO_LinkeditDataCommand)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dataOffExpr = this.io.readU4le()
  this.dataOff = dataOffExpr
  let dataSizeExpr = this.io.readU4le()
  this.dataSize = dataSizeExpr

proc fromFile*(_: typedesc[MachO_LinkeditDataCommand], filename: string): MachO_LinkeditDataCommand =
  MachO_LinkeditDataCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_SubCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_SubCommand =
  template this: untyped = result
  this = new(MachO_SubCommand)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = MachO_LcStr.read(this.io, this.root, this)
  this.name = nameExpr

proc fromFile*(_: typedesc[MachO_SubCommand], filename: string): MachO_SubCommand =
  MachO_SubCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_TwolevelHintsCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_TwolevelHintsCommand =
  template this: untyped = result
  this = new(MachO_TwolevelHintsCommand)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let offsetExpr = this.io.readU4le()
  this.offset = offsetExpr
  let numHintsExpr = this.io.readU4le()
  this.numHints = numHintsExpr

proc fromFile*(_: typedesc[MachO_TwolevelHintsCommand], filename: string): MachO_TwolevelHintsCommand =
  MachO_TwolevelHintsCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_Version], io: KaitaiStream, root: KaitaiStruct, parent: MachO_VersionMinCommand): MachO_Version =
  template this: untyped = result
  this = new(MachO_Version)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let p1Expr = this.io.readU1()
  this.p1 = p1Expr
  let minorExpr = this.io.readU1()
  this.minor = minorExpr
  let majorExpr = this.io.readU1()
  this.major = majorExpr
  let releaseExpr = this.io.readU1()
  this.release = releaseExpr

proc fromFile*(_: typedesc[MachO_Version], filename: string): MachO_Version =
  MachO_Version.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_EncryptionInfoCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_EncryptionInfoCommand =
  template this: untyped = result
  this = new(MachO_EncryptionInfoCommand)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let cryptoffExpr = this.io.readU4le()
  this.cryptoff = cryptoffExpr
  let cryptsizeExpr = this.io.readU4le()
  this.cryptsize = cryptsizeExpr
  let cryptidExpr = this.io.readU4le()
  this.cryptid = cryptidExpr
  if  ((MachO(this.root).magic == mach_o.macho_be_x64) or (MachO(this.root).magic == mach_o.macho_le_x64)) :
    let padExpr = this.io.readU4le()
    this.pad = padExpr

proc fromFile*(_: typedesc[MachO_EncryptionInfoCommand], filename: string): MachO_EncryptionInfoCommand =
  MachO_EncryptionInfoCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_CodeSignatureCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_CodeSignatureCommand =
  template this: untyped = result
  this = new(MachO_CodeSignatureCommand)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dataOffExpr = this.io.readU4le()
  this.dataOff = dataOffExpr
  let dataSizeExpr = this.io.readU4le()
  this.dataSize = dataSizeExpr

proc codeSignature(this: MachO_CodeSignatureCommand): MachO_CsBlob = 
  if this.codeSignatureInstFlag:
    return this.codeSignatureInst
  let io = MachO(this.root).io
  let pos = io.pos()
  io.seek(int(this.dataOff))
  let rawCodeSignatureInstExpr = io.readBytes(int(this.dataSize))
  this.rawCodeSignatureInst = rawCodeSignatureInstExpr
  let rawCodeSignatureInstIo = newKaitaiStream(rawCodeSignatureInstExpr)
  let codeSignatureInstExpr = MachO_CsBlob.read(rawCodeSignatureInstIo, this.root, this)
  this.codeSignatureInst = codeSignatureInstExpr
  io.seek(pos)
  this.codeSignatureInstFlag = true
  return this.codeSignatureInst

proc fromFile*(_: typedesc[MachO_CodeSignatureCommand], filename: string): MachO_CodeSignatureCommand =
  MachO_CodeSignatureCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_DyldInfoCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_DyldInfoCommand =
  template this: untyped = result
  this = new(MachO_DyldInfoCommand)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rebaseOffExpr = this.io.readU4le()
  this.rebaseOff = rebaseOffExpr
  let rebaseSizeExpr = this.io.readU4le()
  this.rebaseSize = rebaseSizeExpr
  let bindOffExpr = this.io.readU4le()
  this.bindOff = bindOffExpr
  let bindSizeExpr = this.io.readU4le()
  this.bindSize = bindSizeExpr
  let weakBindOffExpr = this.io.readU4le()
  this.weakBindOff = weakBindOffExpr
  let weakBindSizeExpr = this.io.readU4le()
  this.weakBindSize = weakBindSizeExpr
  let lazyBindOffExpr = this.io.readU4le()
  this.lazyBindOff = lazyBindOffExpr
  let lazyBindSizeExpr = this.io.readU4le()
  this.lazyBindSize = lazyBindSizeExpr
  let exportOffExpr = this.io.readU4le()
  this.exportOff = exportOffExpr
  let exportSizeExpr = this.io.readU4le()
  this.exportSize = exportSizeExpr

proc bind(this: MachO_DyldInfoCommand): MachO_DyldInfoCommand_BindData = 
  if this.bindInstFlag:
    return this.bindInst
  if this.bindSize != 0:
    let io = MachO(this.root).io
    let pos = io.pos()
    io.seek(int(this.bindOff))
    let rawBindInstExpr = io.readBytes(int(this.bindSize))
    this.rawBindInst = rawBindInstExpr
    let rawBindInstIo = newKaitaiStream(rawBindInstExpr)
    let bindInstExpr = MachO_DyldInfoCommand_BindData.read(rawBindInstIo, this.root, this)
    this.bindInst = bindInstExpr
    io.seek(pos)
  this.bindInstFlag = true
  return this.bindInst

proc exports(this: MachO_DyldInfoCommand): MachO_DyldInfoCommand_ExportNode = 
  if this.exportsInstFlag:
    return this.exportsInst
  if this.exportSize != 0:
    let io = MachO(this.root).io
    let pos = io.pos()
    io.seek(int(this.exportOff))
    let rawExportsInstExpr = io.readBytes(int(this.exportSize))
    this.rawExportsInst = rawExportsInstExpr
    let rawExportsInstIo = newKaitaiStream(rawExportsInstExpr)
    let exportsInstExpr = MachO_DyldInfoCommand_ExportNode.read(rawExportsInstIo, this.root, this)
    this.exportsInst = exportsInstExpr
    io.seek(pos)
  this.exportsInstFlag = true
  return this.exportsInst

proc weakBind(this: MachO_DyldInfoCommand): MachO_DyldInfoCommand_BindData = 
  if this.weakBindInstFlag:
    return this.weakBindInst
  if this.weakBindSize != 0:
    let io = MachO(this.root).io
    let pos = io.pos()
    io.seek(int(this.weakBindOff))
    let rawWeakBindInstExpr = io.readBytes(int(this.weakBindSize))
    this.rawWeakBindInst = rawWeakBindInstExpr
    let rawWeakBindInstIo = newKaitaiStream(rawWeakBindInstExpr)
    let weakBindInstExpr = MachO_DyldInfoCommand_BindData.read(rawWeakBindInstIo, this.root, this)
    this.weakBindInst = weakBindInstExpr
    io.seek(pos)
  this.weakBindInstFlag = true
  return this.weakBindInst

proc rebase(this: MachO_DyldInfoCommand): MachO_DyldInfoCommand_RebaseData = 
  if this.rebaseInstFlag:
    return this.rebaseInst
  if this.rebaseSize != 0:
    let io = MachO(this.root).io
    let pos = io.pos()
    io.seek(int(this.rebaseOff))
    let rawRebaseInstExpr = io.readBytes(int(this.rebaseSize))
    this.rawRebaseInst = rawRebaseInstExpr
    let rawRebaseInstIo = newKaitaiStream(rawRebaseInstExpr)
    let rebaseInstExpr = MachO_DyldInfoCommand_RebaseData.read(rawRebaseInstIo, this.root, this)
    this.rebaseInst = rebaseInstExpr
    io.seek(pos)
  this.rebaseInstFlag = true
  return this.rebaseInst

proc lazyBind(this: MachO_DyldInfoCommand): MachO_DyldInfoCommand_BindData = 
  if this.lazyBindInstFlag:
    return this.lazyBindInst
  if this.lazyBindSize != 0:
    let io = MachO(this.root).io
    let pos = io.pos()
    io.seek(int(this.lazyBindOff))
    let rawLazyBindInstExpr = io.readBytes(int(this.lazyBindSize))
    this.rawLazyBindInst = rawLazyBindInstExpr
    let rawLazyBindInstIo = newKaitaiStream(rawLazyBindInstExpr)
    let lazyBindInstExpr = MachO_DyldInfoCommand_BindData.read(rawLazyBindInstIo, this.root, this)
    this.lazyBindInst = lazyBindInstExpr
    io.seek(pos)
  this.lazyBindInstFlag = true
  return this.lazyBindInst

proc fromFile*(_: typedesc[MachO_DyldInfoCommand], filename: string): MachO_DyldInfoCommand =
  MachO_DyldInfoCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_DyldInfoCommand_RebaseData], io: KaitaiStream, root: KaitaiStruct, parent: MachO_DyldInfoCommand): MachO_DyldInfoCommand_RebaseData =
  template this: untyped = result
  this = new(MachO_DyldInfoCommand_RebaseData)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while true:
      let it = MachO_DyldInfoCommand_RebaseData_RebaseItem.read(this.io, this.root, this)
      this.items.add(it)
      if it.opcode == mach_o.done:
        break
      inc i

proc fromFile*(_: typedesc[MachO_DyldInfoCommand_RebaseData], filename: string): MachO_DyldInfoCommand_RebaseData =
  MachO_DyldInfoCommand_RebaseData.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_DyldInfoCommand_RebaseData_RebaseItem], io: KaitaiStream, root: KaitaiStruct, parent: MachO_DyldInfoCommand_RebaseData): MachO_DyldInfoCommand_RebaseData_RebaseItem =
  template this: untyped = result
  this = new(MachO_DyldInfoCommand_RebaseData_RebaseItem)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let opcodeAndImmediateExpr = this.io.readU1()
  this.opcodeAndImmediate = opcodeAndImmediateExpr
  if  ((this.opcode == mach_o.set_segment_and_offset_uleb) or (this.opcode == mach_o.add_address_uleb) or (this.opcode == mach_o.do_rebase_uleb_times) or (this.opcode == mach_o.do_rebase_add_address_uleb) or (this.opcode == mach_o.do_rebase_uleb_times_skipping_uleb)) :
    let ulebExpr = MachO_Uleb128.read(this.io, this.root, this)
    this.uleb = ulebExpr
  if this.opcode == mach_o.do_rebase_uleb_times_skipping_uleb:
    let skipExpr = MachO_Uleb128.read(this.io, this.root, this)
    this.skip = skipExpr

proc opcode(this: MachO_DyldInfoCommand_RebaseData_RebaseItem): MachO_DyldInfoCommand_RebaseData_Opcode = 
  if this.opcodeInstFlag:
    return this.opcodeInst
  let opcodeInstExpr = MachO_DyldInfoCommand_RebaseData_Opcode(MachO_DyldInfoCommand_RebaseData_Opcode((this.opcodeAndImmediate and 240)))
  this.opcodeInst = opcodeInstExpr
  this.opcodeInstFlag = true
  return this.opcodeInst

proc immediate(this: MachO_DyldInfoCommand_RebaseData_RebaseItem): int = 
  if this.immediateInstFlag:
    return this.immediateInst
  let immediateInstExpr = int((this.opcodeAndImmediate and 15))
  this.immediateInst = immediateInstExpr
  this.immediateInstFlag = true
  return this.immediateInst

proc fromFile*(_: typedesc[MachO_DyldInfoCommand_RebaseData_RebaseItem], filename: string): MachO_DyldInfoCommand_RebaseData_RebaseItem =
  MachO_DyldInfoCommand_RebaseData_RebaseItem.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_DyldInfoCommand_BindItem], io: KaitaiStream, root: KaitaiStruct, parent: MachO_DyldInfoCommand_BindData): MachO_DyldInfoCommand_BindItem =
  template this: untyped = result
  this = new(MachO_DyldInfoCommand_BindItem)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let opcodeAndImmediateExpr = this.io.readU1()
  this.opcodeAndImmediate = opcodeAndImmediateExpr
  if  ((this.opcode == mach_o.set_dylib_ordinal_uleb) or (this.opcode == mach_o.set_append_sleb) or (this.opcode == mach_o.set_segment_and_offset_uleb) or (this.opcode == mach_o.add_address_uleb) or (this.opcode == mach_o.do_bind_add_address_uleb) or (this.opcode == mach_o.do_bind_uleb_times_skipping_uleb)) :
    let ulebExpr = MachO_Uleb128.read(this.io, this.root, this)
    this.uleb = ulebExpr
  if this.opcode == mach_o.do_bind_uleb_times_skipping_uleb:
    let skipExpr = MachO_Uleb128.read(this.io, this.root, this)
    this.skip = skipExpr
  if this.opcode == mach_o.set_symbol_trailing_flags_immediate:
    let symbolExpr = encode(this.io.readBytesTerm(0, false, true, true), "ascii")
    this.symbol = symbolExpr

proc opcode(this: MachO_DyldInfoCommand_BindItem): MachO_DyldInfoCommand_BindOpcode = 
  if this.opcodeInstFlag:
    return this.opcodeInst
  let opcodeInstExpr = MachO_DyldInfoCommand_BindOpcode(MachO_DyldInfoCommand_BindOpcode((this.opcodeAndImmediate and 240)))
  this.opcodeInst = opcodeInstExpr
  this.opcodeInstFlag = true
  return this.opcodeInst

proc immediate(this: MachO_DyldInfoCommand_BindItem): int = 
  if this.immediateInstFlag:
    return this.immediateInst
  let immediateInstExpr = int((this.opcodeAndImmediate and 15))
  this.immediateInst = immediateInstExpr
  this.immediateInstFlag = true
  return this.immediateInst

proc fromFile*(_: typedesc[MachO_DyldInfoCommand_BindItem], filename: string): MachO_DyldInfoCommand_BindItem =
  MachO_DyldInfoCommand_BindItem.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_DyldInfoCommand_BindData], io: KaitaiStream, root: KaitaiStruct, parent: MachO_DyldInfoCommand): MachO_DyldInfoCommand_BindData =
  template this: untyped = result
  this = new(MachO_DyldInfoCommand_BindData)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = MachO_DyldInfoCommand_BindItem.read(this.io, this.root, this)
      this.items.add(it)
      inc i

proc fromFile*(_: typedesc[MachO_DyldInfoCommand_BindData], filename: string): MachO_DyldInfoCommand_BindData =
  MachO_DyldInfoCommand_BindData.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_DyldInfoCommand_ExportNode], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachO_DyldInfoCommand_ExportNode =
  template this: untyped = result
  this = new(MachO_DyldInfoCommand_ExportNode)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let terminalSizeExpr = MachO_Uleb128.read(this.io, this.root, this)
  this.terminalSize = terminalSizeExpr
  let childrenCountExpr = this.io.readU1()
  this.childrenCount = childrenCountExpr
  for i in 0 ..< int(this.childrenCount):
    let it = MachO_DyldInfoCommand_ExportNode_Child.read(this.io, this.root, this)
    this.children.add(it)
  let terminalExpr = this.io.readBytes(int(this.terminalSize.value))
  this.terminal = terminalExpr

proc fromFile*(_: typedesc[MachO_DyldInfoCommand_ExportNode], filename: string): MachO_DyldInfoCommand_ExportNode =
  MachO_DyldInfoCommand_ExportNode.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_DyldInfoCommand_ExportNode_Child], io: KaitaiStream, root: KaitaiStruct, parent: MachO_DyldInfoCommand_ExportNode): MachO_DyldInfoCommand_ExportNode_Child =
  template this: untyped = result
  this = new(MachO_DyldInfoCommand_ExportNode_Child)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = encode(this.io.readBytesTerm(0, false, true, true), "ascii")
  this.name = nameExpr
  let nodeOffsetExpr = MachO_Uleb128.read(this.io, this.root, this)
  this.nodeOffset = nodeOffsetExpr

proc value(this: MachO_DyldInfoCommand_ExportNode_Child): MachO_DyldInfoCommand_ExportNode = 
  if this.valueInstFlag:
    return this.valueInst
  let pos = this.io.pos()
  this.io.seek(int(this.nodeOffset.value))
  let valueInstExpr = MachO_DyldInfoCommand_ExportNode.read(this.io, this.root, this)
  this.valueInst = valueInstExpr
  this.io.seek(pos)
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[MachO_DyldInfoCommand_ExportNode_Child], filename: string): MachO_DyldInfoCommand_ExportNode_Child =
  MachO_DyldInfoCommand_ExportNode_Child.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_DylinkerCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_DylinkerCommand =
  template this: untyped = result
  this = new(MachO_DylinkerCommand)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = MachO_LcStr.read(this.io, this.root, this)
  this.name = nameExpr

proc fromFile*(_: typedesc[MachO_DylinkerCommand], filename: string): MachO_DylinkerCommand =
  MachO_DylinkerCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_DylibCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_DylibCommand =
  template this: untyped = result
  this = new(MachO_DylibCommand)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameOffsetExpr = this.io.readU4le()
  this.nameOffset = nameOffsetExpr
  let timestampExpr = this.io.readU4le()
  this.timestamp = timestampExpr
  let currentVersionExpr = this.io.readU4le()
  this.currentVersion = currentVersionExpr
  let compatibilityVersionExpr = this.io.readU4le()
  this.compatibilityVersion = compatibilityVersionExpr
  let nameExpr = encode(this.io.readBytesTerm(0, false, true, true), "utf-8")
  this.name = nameExpr

proc fromFile*(_: typedesc[MachO_DylibCommand], filename: string): MachO_DylibCommand =
  MachO_DylibCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_SegmentCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_SegmentCommand =
  template this: untyped = result
  this = new(MachO_SegmentCommand)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let segnameExpr = encode(this.io.readBytes(int(16)).bytesStripRight(0), "ascii")
  this.segname = segnameExpr
  let vmaddrExpr = this.io.readU4le()
  this.vmaddr = vmaddrExpr
  let vmsizeExpr = this.io.readU4le()
  this.vmsize = vmsizeExpr
  let fileoffExpr = this.io.readU4le()
  this.fileoff = fileoffExpr
  let filesizeExpr = this.io.readU4le()
  this.filesize = filesizeExpr
  let maxprotExpr = MachO_VmProt.read(this.io, this.root, this)
  this.maxprot = maxprotExpr
  let initprotExpr = MachO_VmProt.read(this.io, this.root, this)
  this.initprot = initprotExpr
  let nsectsExpr = this.io.readU4le()
  this.nsects = nsectsExpr
  let flagsExpr = this.io.readU4le()
  this.flags = flagsExpr
  for i in 0 ..< int(this.nsects):
    let it = MachO_SegmentCommand_Section.read(this.io, this.root, this)
    this.sections.add(it)

proc fromFile*(_: typedesc[MachO_SegmentCommand], filename: string): MachO_SegmentCommand =
  MachO_SegmentCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_SegmentCommand_Section], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SegmentCommand): MachO_SegmentCommand_Section =
  template this: untyped = result
  this = new(MachO_SegmentCommand_Section)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sectNameExpr = encode(this.io.readBytes(int(16)).bytesStripRight(0), "ascii")
  this.sectName = sectNameExpr
  let segNameExpr = encode(this.io.readBytes(int(16)).bytesStripRight(0), "ascii")
  this.segName = segNameExpr
  let addrExpr = this.io.readU4le()
  this.addr = addrExpr
  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr
  let offsetExpr = this.io.readU4le()
  this.offset = offsetExpr
  let alignExpr = this.io.readU4le()
  this.align = alignExpr
  let reloffExpr = this.io.readU4le()
  this.reloff = reloffExpr
  let nrelocExpr = this.io.readU4le()
  this.nreloc = nrelocExpr
  let flagsExpr = this.io.readU4le()
  this.flags = flagsExpr
  let reserved1Expr = this.io.readU4le()
  this.reserved1 = reserved1Expr
  let reserved2Expr = this.io.readU4le()
  this.reserved2 = reserved2Expr

proc data(this: MachO_SegmentCommand_Section): seq[byte] = 
  if this.dataInstFlag:
    return this.dataInst
  let io = MachO(this.root).io
  let pos = io.pos()
  io.seek(int(this.offset))
  let dataInstExpr = io.readBytes(int(this.size))
  this.dataInst = dataInstExpr
  io.seek(pos)
  this.dataInstFlag = true
  return this.dataInst

proc fromFile*(_: typedesc[MachO_SegmentCommand_Section], filename: string): MachO_SegmentCommand_Section =
  MachO_SegmentCommand_Section.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_LcStr], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachO_LcStr =
  template this: untyped = result
  this = new(MachO_LcStr)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lengthExpr = this.io.readU4le()
  this.length = lengthExpr
  let valueExpr = encode(this.io.readBytesTerm(0, false, true, true), "UTF-8")
  this.value = valueExpr

proc fromFile*(_: typedesc[MachO_LcStr], filename: string): MachO_LcStr =
  MachO_LcStr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_LoadCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO): MachO_LoadCommand =
  template this: untyped = result
  this = new(MachO_LoadCommand)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let typeExpr = MachO_LoadCommandType(this.io.readU4le())
  this.type = typeExpr
  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr
  block:
    let on = this.type
    if on == mach_o.id_dylinker:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_DylinkerCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.reexport_dylib:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_DylibCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.build_version:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_BuildVersionCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.source_version:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_SourceVersionCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.function_starts:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_LinkeditDataCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.rpath:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_RpathCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.sub_framework:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_SubCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.routines:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_RoutinesCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.sub_library:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_SubCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.dyld_info_only:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_DyldInfoCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.dyld_environment:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_DylinkerCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.load_dylinker:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_DylinkerCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.segment_split_info:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_LinkeditDataCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.main:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_EntryPointCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.load_dylib:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_DylibCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.encryption_info:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_EncryptionInfoCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.dysymtab:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_DysymtabCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.twolevel_hints:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_TwolevelHintsCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.encryption_info_64:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_EncryptionInfoCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.linker_option:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_LinkerOptionCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.dyld_info:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_DyldInfoCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.version_min_tvos:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_VersionMinCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.load_upward_dylib:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_DylibCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.segment_64:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_SegmentCommand64.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.segment:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_SegmentCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.sub_umbrella:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_SubCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.version_min_watchos:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_VersionMinCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.routines_64:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_RoutinesCommand64.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.id_dylib:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_DylibCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.sub_client:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_SubCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.dylib_code_sign_drs:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_LinkeditDataCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.symtab:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_SymtabCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.linker_optimization_hint:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_LinkeditDataCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.data_in_code:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_LinkeditDataCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.code_signature:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_CodeSignatureCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.version_min_iphoneos:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_VersionMinCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.load_weak_dylib:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_DylibCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.lazy_load_dylib:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_DylibCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.uuid:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_UuidCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == mach_o.version_min_macosx:
      let rawBodyExpr = this.io.readBytes(int((this.size - 8)))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = MachO_VersionMinCommand.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int((this.size - 8)))
      this.body = bodyExpr

proc fromFile*(_: typedesc[MachO_LoadCommand], filename: string): MachO_LoadCommand =
  MachO_LoadCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_UuidCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_UuidCommand =
  template this: untyped = result
  this = new(MachO_UuidCommand)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let uuidExpr = this.io.readBytes(int(16))
  this.uuid = uuidExpr

proc fromFile*(_: typedesc[MachO_UuidCommand], filename: string): MachO_UuidCommand =
  MachO_UuidCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_SymtabCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_SymtabCommand =
  template this: untyped = result
  this = new(MachO_SymtabCommand)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let symOffExpr = this.io.readU4le()
  this.symOff = symOffExpr
  let nSymsExpr = this.io.readU4le()
  this.nSyms = nSymsExpr
  let strOffExpr = this.io.readU4le()
  this.strOff = strOffExpr
  let strSizeExpr = this.io.readU4le()
  this.strSize = strSizeExpr

proc symbols(this: MachO_SymtabCommand): seq[KaitaiStruct] = 
  if this.symbolsInstFlag:
    return this.symbolsInst
  let io = MachO(this.root).io
  let pos = io.pos()
  io.seek(int(this.symOff))
  for i in 0 ..< int(this.nSyms):
    block:
      let on = MachO(this.root).magic
      if on == mach_o.macho_le_x64:
        let it = MachO_SymtabCommand_Nlist64.read(io, this.root, this)
        this.symbolsInst.add(it)
      elif on == mach_o.macho_be_x64:
        let it = MachO_SymtabCommand_Nlist64.read(io, this.root, this)
        this.symbolsInst.add(it)
      elif on == mach_o.macho_le_x86:
        let it = MachO_SymtabCommand_Nlist.read(io, this.root, this)
        this.symbolsInst.add(it)
      elif on == mach_o.macho_be_x86:
        let it = MachO_SymtabCommand_Nlist.read(io, this.root, this)
        this.symbolsInst.add(it)
  io.seek(pos)
  this.symbolsInstFlag = true
  return this.symbolsInst

proc strs(this: MachO_SymtabCommand): MachO_SymtabCommand_StrTable = 
  if this.strsInstFlag:
    return this.strsInst
  let io = MachO(this.root).io
  let pos = io.pos()
  io.seek(int(this.strOff))
  let rawStrsInstExpr = io.readBytes(int(this.strSize))
  this.rawStrsInst = rawStrsInstExpr
  let rawStrsInstIo = newKaitaiStream(rawStrsInstExpr)
  let strsInstExpr = MachO_SymtabCommand_StrTable.read(rawStrsInstIo, this.root, this)
  this.strsInst = strsInstExpr
  io.seek(pos)
  this.strsInstFlag = true
  return this.strsInst

proc fromFile*(_: typedesc[MachO_SymtabCommand], filename: string): MachO_SymtabCommand =
  MachO_SymtabCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_SymtabCommand_StrTable], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SymtabCommand): MachO_SymtabCommand_StrTable =
  template this: untyped = result
  this = new(MachO_SymtabCommand_StrTable)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let unknownExpr = this.io.readU4le()
  this.unknown = unknownExpr
  block:
    var i: int
    while true:
      let it = encode(this.io.readBytesTerm(0, false, true, false), "utf-8")
      this.items.add(it)
      if it == "":
        break
      inc i

proc fromFile*(_: typedesc[MachO_SymtabCommand_StrTable], filename: string): MachO_SymtabCommand_StrTable =
  MachO_SymtabCommand_StrTable.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_SymtabCommand_Nlist64], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SymtabCommand): MachO_SymtabCommand_Nlist64 =
  template this: untyped = result
  this = new(MachO_SymtabCommand_Nlist64)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let unExpr = this.io.readU4le()
  this.un = unExpr
  let typeExpr = this.io.readU1()
  this.type = typeExpr
  let sectExpr = this.io.readU1()
  this.sect = sectExpr
  let descExpr = this.io.readU2le()
  this.desc = descExpr
  let valueExpr = this.io.readU8le()
  this.value = valueExpr

proc name(this: MachO_SymtabCommand_Nlist64): string = 
  if this.nameInstFlag:
    return this.nameInst
  if this.un != 0:
    let pos = this.io.pos()
    this.io.seek(int((this.parent.strOff + this.un)))
    let nameInstExpr = encode(this.io.readBytesTerm(0, false, true, true), "utf-8")
    this.nameInst = nameInstExpr
    this.io.seek(pos)
  this.nameInstFlag = true
  return this.nameInst

proc fromFile*(_: typedesc[MachO_SymtabCommand_Nlist64], filename: string): MachO_SymtabCommand_Nlist64 =
  MachO_SymtabCommand_Nlist64.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_SymtabCommand_Nlist], io: KaitaiStream, root: KaitaiStruct, parent: MachO_SymtabCommand): MachO_SymtabCommand_Nlist =
  template this: untyped = result
  this = new(MachO_SymtabCommand_Nlist)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let unExpr = this.io.readU4le()
  this.un = unExpr
  let typeExpr = this.io.readU1()
  this.type = typeExpr
  let sectExpr = this.io.readU1()
  this.sect = sectExpr
  let descExpr = this.io.readU2le()
  this.desc = descExpr
  let valueExpr = this.io.readU4le()
  this.value = valueExpr

proc name(this: MachO_SymtabCommand_Nlist): string = 
  if this.nameInstFlag:
    return this.nameInst
  if this.un != 0:
    let pos = this.io.pos()
    this.io.seek(int((this.parent.strOff + this.un)))
    let nameInstExpr = encode(this.io.readBytesTerm(0, false, true, true), "utf-8")
    this.nameInst = nameInstExpr
    this.io.seek(pos)
  this.nameInstFlag = true
  return this.nameInst

proc fromFile*(_: typedesc[MachO_SymtabCommand_Nlist], filename: string): MachO_SymtabCommand_Nlist =
  MachO_SymtabCommand_Nlist.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_VersionMinCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_VersionMinCommand =
  template this: untyped = result
  this = new(MachO_VersionMinCommand)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = MachO_Version.read(this.io, this.root, this)
  this.version = versionExpr
  let sdkExpr = MachO_Version.read(this.io, this.root, this)
  this.sdk = sdkExpr

proc fromFile*(_: typedesc[MachO_VersionMinCommand], filename: string): MachO_VersionMinCommand =
  MachO_VersionMinCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachO_EntryPointCommand], io: KaitaiStream, root: KaitaiStruct, parent: MachO_LoadCommand): MachO_EntryPointCommand =
  template this: untyped = result
  this = new(MachO_EntryPointCommand)
  let root = if root == nil: cast[MachO](this) else: cast[MachO](root)
  this.io = io
  this.root = root
  this.parent = parent

  let entryOffExpr = this.io.readU8le()
  this.entryOff = entryOffExpr
  let stackSizeExpr = this.io.readU8le()
  this.stackSize = stackSizeExpr

proc fromFile*(_: typedesc[MachO_EntryPointCommand], filename: string): MachO_EntryPointCommand =
  MachO_EntryPointCommand.read(newKaitaiFileStream(filename), nil, nil)

