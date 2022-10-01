import kaitai_struct_nim_runtime
import options

type
  Rpm* = ref object of KaitaiStruct
    `lead`*: Rpm_Lead
    `signature`*: Rpm_Header
    `signaturePadding`*: seq[byte]
    `unnamed3`*: seq[byte]
    `header`*: Rpm_Header
    `unnamed5`*: seq[byte]
    `signatureTagsSteps`*: seq[Rpm_SignatureTagsStep]
    `parent`*: KaitaiStruct
    `hasSignatureSizeTagInst`: bool
    `hasSignatureSizeTagInstFlag`: bool
    `signatureSizeTagInst`: Rpm_HeaderIndexRecord
    `signatureSizeTagInstFlag`: bool
    `lenPayloadInst`: int
    `lenPayloadInstFlag`: bool
    `payloadInst`: seq[byte]
    `payloadInstFlag`: bool
    `lenHeaderInst`: int
    `lenHeaderInstFlag`: bool
    `ofsHeaderInst`: int
    `ofsHeaderInstFlag`: bool
    `ofsPayloadInst`: int
    `ofsPayloadInstFlag`: bool
  Rpm_OperatingSystems* = enum
    linux = 1
    irix = 2
    no_os = 255
  Rpm_SignatureTags* = enum
    signatures = 62
    header_immutable = 63
    i18n_table = 100
    bad_sha1_1_obsolete = 264
    bad_sha1_2_obsolete = 265
    dsa = 267
    rsa = 268
    sha1 = 269
    long_size = 270
    long_archive_size = 271
    sha256 = 273
    file_signatures = 274
    file_signature_length = 275
    verity_signatures = 276
    verity_signature_algo = 277
    size = 1000
    le_md5_1_obsolete = 1001
    pgp = 1002
    le_md5_2_obsolete = 1003
    md5 = 1004
    gpg = 1005
    pgp5_obsolete = 1006
    payload_size = 1007
    reserved_space = 1008
  Rpm_RecordTypes* = enum
    not_implemented = 0
    char = 1
    uint8 = 2
    uint16 = 3
    uint32 = 4
    uint64 = 5
    string = 6
    bin = 7
    string_array = 8
    i18n_string = 9
  Rpm_HeaderTags* = enum
    signatures = 62
    header_immutable = 63
    i18n_table = 100
    name = 1000
    version = 1001
    release = 1002
    epoch = 1003
    summary = 1004
    description = 1005
    build_time = 1006
    build_host = 1007
    install_time = 1008
    size = 1009
    distribution = 1010
    vendor = 1011
    gif_obsolete = 1012
    xpm_obsolete = 1013
    license = 1014
    packager = 1015
    group = 1016
    changelog_internal = 1017
    source = 1018
    patch = 1019
    url = 1020
    os = 1021
    arch = 1022
    pre_install_scriptlet = 1023
    post_install_scriptlet = 1024
    pre_uninstall_scriptlet = 1025
    post_uninstall_scriptlet = 1026
    old_file_names_obsolete = 1027
    file_sizes = 1028
    file_states = 1029
    file_modes = 1030
    file_uids_internal = 1031
    file_gids_internal = 1032
    device_number = 1033
    mtimes = 1034
    file_digests = 1035
    link_tos = 1036
    file_flags = 1037
    root_internal = 1038
    file_owner = 1039
    file_group = 1040
    exclude_internal = 1041
    exclusive_internal = 1042
    icon_obsolete = 1043
    source_rpm = 1044
    file_verify_flags = 1045
    archive_size = 1046
    provide_name = 1047
    require_flags = 1048
    require_name = 1049
    require_version = 1050
    no_source = 1051
    no_patch = 1052
    conflict_flags = 1053
    conflict_name = 1054
    conflict_version = 1055
    default_prefix_internal = 1056
    build_root_internal = 1057
    install_prefix_internal = 1058
    exclude_arch = 1059
    exclude_os = 1060
    exclusive_arch = 1061
    exclusive_os = 1062
    autoreqprov_internal = 1063
    rpm_version = 1064
    trigger_scripts = 1065
    trigger_name = 1066
    trigger_version = 1067
    trigger_flags = 1068
    trigger_index = 1069
    verify_script = 1079
    changelog_time = 1080
    changelog_name = 1081
    changelog_text = 1082
    broken_md5_internal = 1083
    prereq_internal = 1084
    pre_install_interpreter = 1085
    post_install_interpreter = 1086
    pre_uninstall_interpreter = 1087
    post_uninstall_interpreter = 1088
    build_archs = 1089
    obsolete_name = 1090
    verify_script_prog = 1091
    trigger_script_prog = 1092
    doc_dir_internal = 1093
    cookie = 1094
    file_devices = 1095
    file_inodes = 1096
    file_langs = 1097
    prefixes = 1098
    install_prefixes = 1099
    trigger_install_internal = 1100
    trigger_uninstall_internal = 1101
    trigger_post_uninstall_internal = 1102
    autoreq_internal = 1103
    autoprov_internal = 1104
    capability_internal = 1105
    source_package = 1106
    old_orig_filenames_internal = 1107
    build_prereq_internal = 1108
    build_requires_internal = 1109
    build_conflicts_internal = 1110
    build_macros_internal = 1111
    provide_flags = 1112
    provide_version = 1113
    obsolete_flags = 1114
    obsolete_version = 1115
    dir_indexes = 1116
    base_names = 1117
    dir_names = 1118
    orig_dir_indexes = 1119
    orig_base_names = 1120
    orig_dir_names = 1121
    opt_flags = 1122
    dist_url = 1123
    payload_format = 1124
    payload_compressor = 1125
    payload_flags = 1126
    install_color = 1127
    install_tid = 1128
    remove_tid_obsolete = 1129
    sha1_rhn_internal = 1130
    rhn_platform_internal = 1131
    platform = 1132
    patches_name_obsolete = 1133
    patches_flags_obsolete = 1134
    patches_version_obsolete = 1135
    cache_ctime_internal = 1136
    cache_pkg_path_internal = 1137
    cache_pkg_size_internal = 1138
    cache_pkg_mtime_internal = 1139
    file_colors = 1140
    file_class = 1141
    class_dict = 1142
    file_depends_idx = 1143
    file_depends_num = 1144
    depends_dict = 1145
    source_pkgid = 1146
    file_contexts_obsolete = 1147
    fs_contexts_obsolete = 1148
    re_contexts_obsolete = 1149
    policies = 1150
    pre_trans = 1151
    post_trans = 1152
    pre_trans_prog = 1153
    post_trans_prog = 1154
    dist_tag = 1155
    old_suggests_name_obsolete = 1156
    old_suggests_version_obsolete = 1157
    old_suggests_flags_obsolete = 1158
    old_enhances_name_obsolete = 1159
    old_enhances_version_obsolete = 1160
    old_enhances_flags_obsolete = 1161
    priority_unimplemented = 1162
    cvsid_unimplemented = 1163
    blink_pkgid_unimplemented = 1164
    blink_hdrid_unimplemented = 1165
    blink_nevra_unimplemented = 1166
    flink_pkgid_unimplemented = 1167
    flink_hdrid_unimplemented = 1168
    flink_nevra_unimplemented = 1169
    package_origin_unimplemented = 1170
    trigger_pre_install_internal = 1171
    build_suggests_unimplemented = 1172
    build_enhances_unimplemented = 1173
    script_states_unimplemented = 1174
    script_metrics_unimplemented = 1175
    build_cpu_clock_unimplemented = 1176
    file_digest_algos_unimplemented = 1177
    variants_unimplemented = 1178
    xmajor_unimplemented = 1179
    xminor_unimplemented = 1180
    repo_tag_unimplemented = 1181
    keywords_unimplemented = 1182
    build_platforms_unimplemented = 1183
    package_color_unimplemented = 1184
    package_pref_color_unimplemented = 1185
    xattrs_dict_unimplemented = 1186
    filex_attrsx_unimplemented = 1187
    dep_attrs_dict_unimplemented = 1188
    conflict_attrsx_unimplemented = 1189
    obsolete_attrsx_unimplemented = 1190
    provide_attrsx_unimplemented = 1191
    require_attrsx_unimplemented = 1192
    build_provides_unimplemented = 1193
    build_obsoletes_unimplemented = 1194
    db_instance = 1195
    nvra = 1196
    file_names = 5000
    file_provide = 5001
    file_require = 5002
    fs_names_unimplemented = 5003
    fs_sizes_unimplemented = 5004
    trigger_conds = 5005
    trigger_type = 5006
    orig_file_names = 5007
    long_file_sizes = 5008
    long_size = 5009
    file_caps = 5010
    file_digest_algo = 5011
    bug_url = 5012
    evr = 5013
    nvr = 5014
    nevr = 5015
    nevra = 5016
    header_color = 5017
    verbose = 5018
    epoch_num = 5019
    pre_install_flags = 5020
    post_install_flags = 5021
    pre_uninstall_flags = 5022
    post_uninstall_flags = 5023
    pre_trans_flags = 5024
    post_trans_flags = 5025
    verify_script_flags = 5026
    trigger_script_flags = 5027
    collections_unimplemented = 5029
    policy_names = 5030
    policy_types = 5031
    policy_types_indexes = 5032
    policy_flags = 5033
    vcs = 5034
    order_name = 5035
    order_version = 5036
    order_flags = 5037
    mssf_manifest_unimplemented = 5038
    mssf_domain_unimplemented = 5039
    inst_file_names = 5040
    require_nevrs = 5041
    provide_nevrs = 5042
    obsolete_nevrs = 5043
    conflict_nevrs = 5044
    file_nlinks = 5045
    recommend_name = 5046
    recommend_version = 5047
    recommend_flags = 5048
    suggest_name = 5049
    suggest_version = 5050
    suggest_flags = 5051
    supplement_name = 5052
    supplement_version = 5053
    supplement_flags = 5054
    enhance_name = 5055
    enhance_version = 5056
    enhance_flags = 5057
    recommend_nevrs = 5058
    suggest_nevrs = 5059
    supplement_nevrs = 5060
    enhance_nevrs = 5061
    encoding = 5062
    file_trigger_install_internal = 5063
    file_trigger_uninstall_internal = 5064
    file_trigger_post_uninstall_internal = 5065
    file_trigger_scripts = 5066
    file_trigger_script_prog = 5067
    file_trigger_script_flags = 5068
    file_trigger_name = 5069
    file_trigger_index = 5070
    file_trigger_version = 5071
    file_trigger_flags = 5072
    trans_file_trigger_install_internal = 5073
    trans_file_trigger_uninstall_internal = 5074
    trans_file_trigger_post_uninstall_internal = 5075
    trans_file_trigger_scripts = 5076
    trans_file_trigger_script_prog = 5077
    trans_file_trigger_script_flags = 5078
    trans_file_trigger_name = 5079
    trans_file_trigger_index = 5080
    trans_file_trigger_version = 5081
    trans_file_trigger_flags = 5082
    remove_path_postfixes_internal = 5083
    file_trigger_priorities = 5084
    trans_file_trigger_priorities = 5085
    file_trigger_conds = 5086
    file_trigger_type = 5087
    trans_file_trigger_conds = 5088
    trans_file_trigger_type = 5089
    file_signatures = 5090
    file_signature_length = 5091
    payload_digest = 5092
    payload_digest_algo = 5093
    auto_installed_unimplemented = 5094
    identity_unimplemented = 5095
    modularity_label = 5096
    payload_digest_alt = 5097
    arch_suffix = 5098
    spec = 5099
    translation_url = 5100
    upstream_releases = 5101
    source_license_internal = 5102
  Rpm_RpmTypes* = enum
    binary = 0
    source = 1
  Rpm_Architectures* = enum
    x86 = 1
    alpha = 2
    sparc = 3
    mips = 4
    ppc = 5
    m68k = 6
    sgi = 7
    rs6000 = 8
    ia64 = 9
    sparc64 = 10
    mips64 = 11
    arm = 12
    m68k_mint = 13
    s390 = 14
    s390x = 15
    ppc64 = 16
    sh = 17
    xtensa = 18
    aarch64 = 19
    mips_r6 = 20
    mips64_r6 = 21
    riscv = 22
    loongarch64 = 23
    no_arch = 255
  Rpm_RecordTypeStringArray* = ref object of KaitaiStruct
    `values`*: seq[string]
    `numValues`*: uint32
    `parent`*: Rpm_HeaderIndexRecord
  Rpm_Lead* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `version`*: Rpm_RpmVersion
    `type`*: Rpm_RpmTypes
    `architecture`*: Rpm_Architectures
    `packageName`*: string
    `os`*: Rpm_OperatingSystems
    `signatureType`*: uint16
    `reserved`*: seq[byte]
    `parent`*: Rpm
  Rpm_RecordTypeString* = ref object of KaitaiStruct
    `values`*: seq[string]
    `parent`*: Rpm_HeaderIndexRecord
  Rpm_SignatureTagsStep* = ref object of KaitaiStruct
    `idx`*: int32
    `prevSizeTagIdx`*: int32
    `parent`*: Rpm
    `sizeTagIdxInst`: int
    `sizeTagIdxInstFlag`: bool
  Rpm_RecordTypeUint32* = ref object of KaitaiStruct
    `values`*: seq[uint32]
    `numValues`*: uint32
    `parent`*: Rpm_HeaderIndexRecord
  Rpm_RecordTypeUint16* = ref object of KaitaiStruct
    `values`*: seq[uint16]
    `numValues`*: uint32
    `parent`*: Rpm_HeaderIndexRecord
  Rpm_HeaderIndexRecord* = ref object of KaitaiStruct
    `tagRaw`*: uint32
    `recordType`*: Rpm_RecordTypes
    `ofsBody`*: uint32
    `count`*: uint32
    `parent`*: Rpm_Header
    `numValuesInst`: uint32
    `numValuesInstFlag`: bool
    `bodyInst`: KaitaiStruct
    `bodyInstFlag`: bool
    `signatureTagInst`: Rpm_SignatureTags
    `signatureTagInstFlag`: bool
    `lenValueInst`: uint32
    `lenValueInstFlag`: bool
    `headerTagInst`: Rpm_HeaderTags
    `headerTagInstFlag`: bool
  Rpm_RpmVersion* = ref object of KaitaiStruct
    `major`*: uint8
    `minor`*: uint8
    `parent`*: Rpm_Lead
  Rpm_Dummy* = ref object of KaitaiStruct
    `parent`*: Rpm_Header
  Rpm_RecordTypeUint8* = ref object of KaitaiStruct
    `values`*: seq[uint8]
    `numValues`*: uint32
    `parent`*: Rpm_HeaderIndexRecord
  Rpm_RecordTypeUint64* = ref object of KaitaiStruct
    `values`*: seq[uint64]
    `numValues`*: uint32
    `parent`*: Rpm_HeaderIndexRecord
  Rpm_RecordTypeBin* = ref object of KaitaiStruct
    `values`*: seq[seq[byte]]
    `lenValue`*: uint32
    `parent`*: Rpm_HeaderIndexRecord
  Rpm_HeaderRecord* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `reserved`*: seq[byte]
    `numIndexRecords`*: uint32
    `lenStorageSection`*: uint32
    `parent`*: Rpm_Header
  Rpm_Header* = ref object of KaitaiStruct
    `headerRecord`*: Rpm_HeaderRecord
    `indexRecords`*: seq[Rpm_HeaderIndexRecord]
    `storageSection`*: Rpm_Dummy
    `isSignature`*: bool
    `parent`*: Rpm
    `rawStorageSection`*: seq[byte]
    `isHeaderInst`: bool
    `isHeaderInstFlag`: bool

proc read*(_: typedesc[Rpm], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Rpm
proc read*(_: typedesc[Rpm_RecordTypeStringArray], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_HeaderIndexRecord, numValues: any): Rpm_RecordTypeStringArray
proc read*(_: typedesc[Rpm_Lead], io: KaitaiStream, root: KaitaiStruct, parent: Rpm): Rpm_Lead
proc read*(_: typedesc[Rpm_RecordTypeString], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_HeaderIndexRecord): Rpm_RecordTypeString
proc read*(_: typedesc[Rpm_SignatureTagsStep], io: KaitaiStream, root: KaitaiStruct, parent: Rpm, idx: any, prevSizeTagIdx: any): Rpm_SignatureTagsStep
proc read*(_: typedesc[Rpm_RecordTypeUint32], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_HeaderIndexRecord, numValues: any): Rpm_RecordTypeUint32
proc read*(_: typedesc[Rpm_RecordTypeUint16], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_HeaderIndexRecord, numValues: any): Rpm_RecordTypeUint16
proc read*(_: typedesc[Rpm_HeaderIndexRecord], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_Header): Rpm_HeaderIndexRecord
proc read*(_: typedesc[Rpm_RpmVersion], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_Lead): Rpm_RpmVersion
proc read*(_: typedesc[Rpm_Dummy], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_Header): Rpm_Dummy
proc read*(_: typedesc[Rpm_RecordTypeUint8], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_HeaderIndexRecord, numValues: any): Rpm_RecordTypeUint8
proc read*(_: typedesc[Rpm_RecordTypeUint64], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_HeaderIndexRecord, numValues: any): Rpm_RecordTypeUint64
proc read*(_: typedesc[Rpm_RecordTypeBin], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_HeaderIndexRecord, lenValue: any): Rpm_RecordTypeBin
proc read*(_: typedesc[Rpm_HeaderRecord], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_Header): Rpm_HeaderRecord
proc read*(_: typedesc[Rpm_Header], io: KaitaiStream, root: KaitaiStruct, parent: Rpm, isSignature: any): Rpm_Header

proc hasSignatureSizeTag*(this: Rpm): bool
proc signatureSizeTag*(this: Rpm): Rpm_HeaderIndexRecord
proc lenPayload*(this: Rpm): int
proc payload*(this: Rpm): seq[byte]
proc lenHeader*(this: Rpm): int
proc ofsHeader*(this: Rpm): int
proc ofsPayload*(this: Rpm): int
proc sizeTagIdx*(this: Rpm_SignatureTagsStep): int
proc numValues*(this: Rpm_HeaderIndexRecord): uint32
proc body*(this: Rpm_HeaderIndexRecord): KaitaiStruct
proc signatureTag*(this: Rpm_HeaderIndexRecord): Rpm_SignatureTags
proc lenValue*(this: Rpm_HeaderIndexRecord): uint32
proc headerTag*(this: Rpm_HeaderIndexRecord): Rpm_HeaderTags
proc isHeader*(this: Rpm_Header): bool


##[
This parser is for the RPM version 3 file format which is the current version
of the file format used by RPM 2.1 and later (including RPM version 4.x, which
is the current version of the RPM tool). There are historical versions of the
RPM file format, as well as a currently abandoned fork (rpm5). These formats
are not covered by this specification.

@see <a href="https://github.com/rpm-software-management/rpm/blob/911448f2/doc/manual/format.md">Source</a>
@see <a href="https://github.com/rpm-software-management/rpm/blob/911448f2/doc/manual/tags.md">Source</a>
@see <a href="https://refspecs.linuxbase.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/pkgformat.html">Source</a>
@see <a href="http://ftp.rpm.org/max-rpm/">Source</a>
]##
proc read*(_: typedesc[Rpm], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Rpm =
  template this: untyped = result
  this = new(Rpm)
  let root = if root == nil: cast[Rpm](this) else: cast[Rpm](root)
  this.io = io
  this.root = root
  this.parent = parent

  let leadExpr = Rpm_Lead.read(this.io, this.root, this)
  this.lead = leadExpr
  let signatureExpr = Rpm_Header.read(this.io, this.root, this, true)
  this.signature = signatureExpr
  let signaturePaddingExpr = this.io.readBytes(int((-(this.io.pos) %%% 8)))
  this.signaturePadding = signaturePaddingExpr
  if this.ofsHeader < 0:
    let unnamed3Expr = this.io.readBytes(int(0))
    this.unnamed3 = unnamed3Expr
  let headerExpr = Rpm_Header.read(this.io, this.root, this, false)
  this.header = headerExpr
  if this.ofsPayload < 0:
    let unnamed5Expr = this.io.readBytes(int(0))
    this.unnamed5 = unnamed5Expr
  for i in 0 ..< int(this.signature.headerRecord.numIndexRecords):
    let it = Rpm_SignatureTagsStep.read(this.io, this.root, this, i, (if i < 1: -1 else: this.signatureTagsSteps[(i - 1)].sizeTagIdx))
    this.signatureTagsSteps.add(it)

proc hasSignatureSizeTag(this: Rpm): bool = 
  if this.hasSignatureSizeTagInstFlag:
    return this.hasSignatureSizeTagInst
  let hasSignatureSizeTagInstExpr = bool(this.signatureTagsSteps[^1].sizeTagIdx != -1)
  this.hasSignatureSizeTagInst = hasSignatureSizeTagInstExpr
  this.hasSignatureSizeTagInstFlag = true
  return this.hasSignatureSizeTagInst

proc signatureSizeTag(this: Rpm): Rpm_HeaderIndexRecord = 
  if this.signatureSizeTagInstFlag:
    return this.signatureSizeTagInst
  if this.hasSignatureSizeTag:
    let signatureSizeTagInstExpr = Rpm_HeaderIndexRecord(this.signature.indexRecords[this.signatureTagsSteps[^1].sizeTagIdx])
    this.signatureSizeTagInst = signatureSizeTagInstExpr
  this.signatureSizeTagInstFlag = true
  return this.signatureSizeTagInst

proc lenPayload(this: Rpm): int = 
  if this.lenPayloadInstFlag:
    return this.lenPayloadInst
  if this.hasSignatureSizeTag:
    let lenPayloadInstExpr = int(((Rpm_RecordTypeUint32(this.signatureSizeTag.body)).values[0] - this.lenHeader))
    this.lenPayloadInst = lenPayloadInstExpr
  this.lenPayloadInstFlag = true
  return this.lenPayloadInst

proc payload(this: Rpm): seq[byte] = 
  if this.payloadInstFlag:
    return this.payloadInst
  if this.hasSignatureSizeTag:
    let pos = this.io.pos()
    this.io.seek(int(this.ofsPayload))
    let payloadInstExpr = this.io.readBytes(int(this.lenPayload))
    this.payloadInst = payloadInstExpr
    this.io.seek(pos)
  this.payloadInstFlag = true
  return this.payloadInst

proc lenHeader(this: Rpm): int = 
  if this.lenHeaderInstFlag:
    return this.lenHeaderInst
  let lenHeaderInstExpr = int((this.ofsPayload - this.ofsHeader))
  this.lenHeaderInst = lenHeaderInstExpr
  this.lenHeaderInstFlag = true
  return this.lenHeaderInst

proc ofsHeader(this: Rpm): int = 
  if this.ofsHeaderInstFlag:
    return this.ofsHeaderInst
  let ofsHeaderInstExpr = int(this.io.pos)
  this.ofsHeaderInst = ofsHeaderInstExpr
  this.ofsHeaderInstFlag = true
  return this.ofsHeaderInst

proc ofsPayload(this: Rpm): int = 
  if this.ofsPayloadInstFlag:
    return this.ofsPayloadInst
  let ofsPayloadInstExpr = int(this.io.pos)
  this.ofsPayloadInst = ofsPayloadInstExpr
  this.ofsPayloadInstFlag = true
  return this.ofsPayloadInst

proc fromFile*(_: typedesc[Rpm], filename: string): Rpm =
  Rpm.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Rpm_RecordTypeStringArray], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_HeaderIndexRecord, numValues: any): Rpm_RecordTypeStringArray =
  template this: untyped = result
  this = new(Rpm_RecordTypeStringArray)
  let root = if root == nil: cast[Rpm](this) else: cast[Rpm](root)
  this.io = io
  this.root = root
  this.parent = parent
  let numValuesExpr = uint32(numValues)
  this.numValues = numValuesExpr

  for i in 0 ..< int(this.numValues):
    let it = encode(this.io.readBytesTerm(0, false, true, true), "UTF-8")
    this.values.add(it)

proc fromFile*(_: typedesc[Rpm_RecordTypeStringArray], filename: string): Rpm_RecordTypeStringArray =
  Rpm_RecordTypeStringArray.read(newKaitaiFileStream(filename), nil, nil)


##[
In 2021, Panu Matilainen (a RPM developer) [described this
structure](https://github.com/kaitai-io/kaitai_struct_formats/pull/469#discussion_r718288192)
as follows:

> The lead as a structure is 25 years obsolete, the data there is
> meaningless. Seriously. Except to check for the magic to detect that
> it's an rpm file in the first place, just ignore everything in it.
> Literally everything.

The fields with `valid` constraints are important, because these are the
same validations that RPM does (which means that any valid `.rpm` file
must pass them), but otherwise you should not make decisions based on the
values given here.

]##
proc read*(_: typedesc[Rpm_Lead], io: KaitaiStream, root: KaitaiStruct, parent: Rpm): Rpm_Lead =
  template this: untyped = result
  this = new(Rpm_Lead)
  let root = if root == nil: cast[Rpm](this) else: cast[Rpm](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let versionExpr = Rpm_RpmVersion.read(this.io, this.root, this)
  this.version = versionExpr
  let typeExpr = Rpm_RpmTypes(this.io.readU2be())
  this.type = typeExpr
  let architectureExpr = Rpm_Architectures(this.io.readU2be())
  this.architecture = architectureExpr
  let packageNameExpr = encode(this.io.readBytes(int(66)).bytesTerminate(0, false), "UTF-8")
  this.packageName = packageNameExpr
  let osExpr = Rpm_OperatingSystems(this.io.readU2be())
  this.os = osExpr
  let signatureTypeExpr = this.io.readU2be()
  this.signatureType = signatureTypeExpr
  let reservedExpr = this.io.readBytes(int(16))
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[Rpm_Lead], filename: string): Rpm_Lead =
  Rpm_Lead.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Rpm_RecordTypeString], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_HeaderIndexRecord): Rpm_RecordTypeString =
  template this: untyped = result
  this = new(Rpm_RecordTypeString)
  let root = if root == nil: cast[Rpm](this) else: cast[Rpm](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(1):
    let it = encode(this.io.readBytesTerm(0, false, true, true), "UTF-8")
    this.values.add(it)

proc fromFile*(_: typedesc[Rpm_RecordTypeString], filename: string): Rpm_RecordTypeString =
  Rpm_RecordTypeString.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Rpm_SignatureTagsStep], io: KaitaiStream, root: KaitaiStruct, parent: Rpm, idx: any, prevSizeTagIdx: any): Rpm_SignatureTagsStep =
  template this: untyped = result
  this = new(Rpm_SignatureTagsStep)
  let root = if root == nil: cast[Rpm](this) else: cast[Rpm](root)
  this.io = io
  this.root = root
  this.parent = parent
  let idxExpr = int32(idx)
  this.idx = idxExpr
  let prevSizeTagIdxExpr = int32(prevSizeTagIdx)
  this.prevSizeTagIdx = prevSizeTagIdxExpr


proc sizeTagIdx(this: Rpm_SignatureTagsStep): int = 
  if this.sizeTagIdxInstFlag:
    return this.sizeTagIdxInst
  let sizeTagIdxInstExpr = int((if this.prevSizeTagIdx != -1: this.prevSizeTagIdx else: (if  ((this.parent.signature.indexRecords[this.idx].signatureTag == rpm.size) and (this.parent.signature.indexRecords[this.idx].recordType == rpm.uint32) and (this.parent.signature.indexRecords[this.idx].numValues >= 1)) : this.idx else: -1)))
  this.sizeTagIdxInst = sizeTagIdxInstExpr
  this.sizeTagIdxInstFlag = true
  return this.sizeTagIdxInst

proc fromFile*(_: typedesc[Rpm_SignatureTagsStep], filename: string): Rpm_SignatureTagsStep =
  Rpm_SignatureTagsStep.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Rpm_RecordTypeUint32], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_HeaderIndexRecord, numValues: any): Rpm_RecordTypeUint32 =
  template this: untyped = result
  this = new(Rpm_RecordTypeUint32)
  let root = if root == nil: cast[Rpm](this) else: cast[Rpm](root)
  this.io = io
  this.root = root
  this.parent = parent
  let numValuesExpr = uint32(numValues)
  this.numValues = numValuesExpr

  for i in 0 ..< int(this.numValues):
    let it = this.io.readU4be()
    this.values.add(it)

proc fromFile*(_: typedesc[Rpm_RecordTypeUint32], filename: string): Rpm_RecordTypeUint32 =
  Rpm_RecordTypeUint32.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Rpm_RecordTypeUint16], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_HeaderIndexRecord, numValues: any): Rpm_RecordTypeUint16 =
  template this: untyped = result
  this = new(Rpm_RecordTypeUint16)
  let root = if root == nil: cast[Rpm](this) else: cast[Rpm](root)
  this.io = io
  this.root = root
  this.parent = parent
  let numValuesExpr = uint32(numValues)
  this.numValues = numValuesExpr

  for i in 0 ..< int(this.numValues):
    let it = this.io.readU2be()
    this.values.add(it)

proc fromFile*(_: typedesc[Rpm_RecordTypeUint16], filename: string): Rpm_RecordTypeUint16 =
  Rpm_RecordTypeUint16.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Rpm_HeaderIndexRecord], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_Header): Rpm_HeaderIndexRecord =
  template this: untyped = result
  this = new(Rpm_HeaderIndexRecord)
  let root = if root == nil: cast[Rpm](this) else: cast[Rpm](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  prefer to access `signature_tag` and `header_tag` instead
  ]##
  let tagRawExpr = this.io.readU4be()
  this.tagRaw = tagRawExpr
  let recordTypeExpr = Rpm_RecordTypes(this.io.readU4be())
  this.recordType = recordTypeExpr
  let ofsBodyExpr = this.io.readU4be()
  this.ofsBody = ofsBodyExpr

  ##[
  internal; access `num_values` and `len_value` instead
  ]##
  let countExpr = this.io.readU4be()
  this.count = countExpr

proc numValues(this: Rpm_HeaderIndexRecord): uint32 = 
  if this.numValuesInstFlag:
    return this.numValuesInst
  if this.recordType != rpm.bin:
    let numValuesInstExpr = uint32(this.count)
    this.numValuesInst = numValuesInstExpr
  this.numValuesInstFlag = true
  return this.numValuesInst

proc body(this: Rpm_HeaderIndexRecord): KaitaiStruct = 
  if this.bodyInstFlag:
    return this.bodyInst
  let io = this.parent.storageSection.io
  let pos = io.pos()
  io.seek(int(this.ofsBody))
  block:
    let on = this.recordType
    if on == rpm.uint32:
      let bodyInstExpr = Rpm_RecordTypeUint32.read(io, this.root, this, this.numValues)
      this.bodyInst = bodyInstExpr
    elif on == rpm.uint64:
      let bodyInstExpr = Rpm_RecordTypeUint64.read(io, this.root, this, this.numValues)
      this.bodyInst = bodyInstExpr
    elif on == rpm.bin:
      let bodyInstExpr = Rpm_RecordTypeBin.read(io, this.root, this, this.lenValue)
      this.bodyInst = bodyInstExpr
    elif on == rpm.string:
      let bodyInstExpr = Rpm_RecordTypeString.read(io, this.root, this)
      this.bodyInst = bodyInstExpr
    elif on == rpm.uint8:
      let bodyInstExpr = Rpm_RecordTypeUint8.read(io, this.root, this, this.numValues)
      this.bodyInst = bodyInstExpr
    elif on == rpm.i18n_string:
      let bodyInstExpr = Rpm_RecordTypeStringArray.read(io, this.root, this, this.numValues)
      this.bodyInst = bodyInstExpr
    elif on == rpm.uint16:
      let bodyInstExpr = Rpm_RecordTypeUint16.read(io, this.root, this, this.numValues)
      this.bodyInst = bodyInstExpr
    elif on == rpm.char:
      let bodyInstExpr = Rpm_RecordTypeUint8.read(io, this.root, this, this.numValues)
      this.bodyInst = bodyInstExpr
    elif on == rpm.string_array:
      let bodyInstExpr = Rpm_RecordTypeStringArray.read(io, this.root, this, this.numValues)
      this.bodyInst = bodyInstExpr
  io.seek(pos)
  this.bodyInstFlag = true
  return this.bodyInst

proc signatureTag(this: Rpm_HeaderIndexRecord): Rpm_SignatureTags = 
  if this.signatureTagInstFlag:
    return this.signatureTagInst
  if this.parent.isSignature:
    let signatureTagInstExpr = Rpm_SignatureTags(Rpm_SignatureTags(this.tagRaw))
    this.signatureTagInst = signatureTagInstExpr
  this.signatureTagInstFlag = true
  return this.signatureTagInst

proc lenValue(this: Rpm_HeaderIndexRecord): uint32 = 
  if this.lenValueInstFlag:
    return this.lenValueInst
  if this.recordType == rpm.bin:
    let lenValueInstExpr = uint32(this.count)
    this.lenValueInst = lenValueInstExpr
  this.lenValueInstFlag = true
  return this.lenValueInst

proc headerTag(this: Rpm_HeaderIndexRecord): Rpm_HeaderTags = 
  if this.headerTagInstFlag:
    return this.headerTagInst
  if this.parent.isHeader:
    let headerTagInstExpr = Rpm_HeaderTags(Rpm_HeaderTags(this.tagRaw))
    this.headerTagInst = headerTagInstExpr
  this.headerTagInstFlag = true
  return this.headerTagInst

proc fromFile*(_: typedesc[Rpm_HeaderIndexRecord], filename: string): Rpm_HeaderIndexRecord =
  Rpm_HeaderIndexRecord.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Rpm_RpmVersion], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_Lead): Rpm_RpmVersion =
  template this: untyped = result
  this = new(Rpm_RpmVersion)
  let root = if root == nil: cast[Rpm](this) else: cast[Rpm](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  @see <a href="https://github.com/rpm-software-management/rpm/blob/911448f2/lib/rpmlead.c#L102">Source</a>
  ]##
  let majorExpr = this.io.readU1()
  this.major = majorExpr
  let minorExpr = this.io.readU1()
  this.minor = minorExpr

proc fromFile*(_: typedesc[Rpm_RpmVersion], filename: string): Rpm_RpmVersion =
  Rpm_RpmVersion.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Rpm_Dummy], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_Header): Rpm_Dummy =
  template this: untyped = result
  this = new(Rpm_Dummy)
  let root = if root == nil: cast[Rpm](this) else: cast[Rpm](root)
  this.io = io
  this.root = root
  this.parent = parent


proc fromFile*(_: typedesc[Rpm_Dummy], filename: string): Rpm_Dummy =
  Rpm_Dummy.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Rpm_RecordTypeUint8], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_HeaderIndexRecord, numValues: any): Rpm_RecordTypeUint8 =
  template this: untyped = result
  this = new(Rpm_RecordTypeUint8)
  let root = if root == nil: cast[Rpm](this) else: cast[Rpm](root)
  this.io = io
  this.root = root
  this.parent = parent
  let numValuesExpr = uint32(numValues)
  this.numValues = numValuesExpr

  for i in 0 ..< int(this.numValues):
    let it = this.io.readU1()
    this.values.add(it)

proc fromFile*(_: typedesc[Rpm_RecordTypeUint8], filename: string): Rpm_RecordTypeUint8 =
  Rpm_RecordTypeUint8.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Rpm_RecordTypeUint64], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_HeaderIndexRecord, numValues: any): Rpm_RecordTypeUint64 =
  template this: untyped = result
  this = new(Rpm_RecordTypeUint64)
  let root = if root == nil: cast[Rpm](this) else: cast[Rpm](root)
  this.io = io
  this.root = root
  this.parent = parent
  let numValuesExpr = uint32(numValues)
  this.numValues = numValuesExpr

  for i in 0 ..< int(this.numValues):
    let it = this.io.readU8be()
    this.values.add(it)

proc fromFile*(_: typedesc[Rpm_RecordTypeUint64], filename: string): Rpm_RecordTypeUint64 =
  Rpm_RecordTypeUint64.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Rpm_RecordTypeBin], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_HeaderIndexRecord, lenValue: any): Rpm_RecordTypeBin =
  template this: untyped = result
  this = new(Rpm_RecordTypeBin)
  let root = if root == nil: cast[Rpm](this) else: cast[Rpm](root)
  this.io = io
  this.root = root
  this.parent = parent
  let lenValueExpr = uint32(lenValue)
  this.lenValue = lenValueExpr

  for i in 0 ..< int(1):
    let it = this.io.readBytes(int(this.lenValue))
    this.values.add(it)

proc fromFile*(_: typedesc[Rpm_RecordTypeBin], filename: string): Rpm_RecordTypeBin =
  Rpm_RecordTypeBin.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Rpm_HeaderRecord], io: KaitaiStream, root: KaitaiStruct, parent: Rpm_Header): Rpm_HeaderRecord =
  template this: untyped = result
  this = new(Rpm_HeaderRecord)
  let root = if root == nil: cast[Rpm](this) else: cast[Rpm](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let numIndexRecordsExpr = this.io.readU4be()
  this.numIndexRecords = numIndexRecordsExpr

  ##[
  Size of the storage area for the data
pointed to by the Index Records.

  ]##
  let lenStorageSectionExpr = this.io.readU4be()
  this.lenStorageSection = lenStorageSectionExpr

proc fromFile*(_: typedesc[Rpm_HeaderRecord], filename: string): Rpm_HeaderRecord =
  Rpm_HeaderRecord.read(newKaitaiFileStream(filename), nil, nil)


##[
header structure used for both the "header" and "signature", but some tag
values have different meanings in signature and header (hence they use
different enums)

]##
proc read*(_: typedesc[Rpm_Header], io: KaitaiStream, root: KaitaiStruct, parent: Rpm, isSignature: any): Rpm_Header =
  template this: untyped = result
  this = new(Rpm_Header)
  let root = if root == nil: cast[Rpm](this) else: cast[Rpm](root)
  this.io = io
  this.root = root
  this.parent = parent
  let isSignatureExpr = bool(isSignature)
  this.isSignature = isSignatureExpr

  let headerRecordExpr = Rpm_HeaderRecord.read(this.io, this.root, this)
  this.headerRecord = headerRecordExpr
  for i in 0 ..< int(this.headerRecord.numIndexRecords):
    let it = Rpm_HeaderIndexRecord.read(this.io, this.root, this)
    this.indexRecords.add(it)
  let rawStorageSectionExpr = this.io.readBytes(int(this.headerRecord.lenStorageSection))
  this.rawStorageSection = rawStorageSectionExpr
  let rawStorageSectionIo = newKaitaiStream(rawStorageSectionExpr)
  let storageSectionExpr = Rpm_Dummy.read(rawStorageSectionIo, this.root, this)
  this.storageSection = storageSectionExpr

proc isHeader(this: Rpm_Header): bool = 
  if this.isHeaderInstFlag:
    return this.isHeaderInst
  let isHeaderInstExpr = bool(not(this.isSignature))
  this.isHeaderInst = isHeaderInstExpr
  this.isHeaderInstFlag = true
  return this.isHeaderInst

proc fromFile*(_: typedesc[Rpm_Header], filename: string): Rpm_Header =
  Rpm_Header.read(newKaitaiFileStream(filename), nil, nil)

