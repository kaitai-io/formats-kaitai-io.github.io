// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Rpm = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * This parser is for the RPM version 3 file format which is the current version
 * of the file format used by RPM 2.1 and later (including RPM version 4.x, which
 * is the current version of the RPM tool). There are historical versions of the
 * RPM file format, as well as a currently abandoned fork (rpm5). These formats
 * are not covered by this specification.
 * @see {@link https://github.com/rpm-software-management/rpm/blob/911448f2/doc/manual/format.md|Source}
 * @see {@link https://github.com/rpm-software-management/rpm/blob/911448f2/doc/manual/tags.md|Source}
 * @see {@link https://refspecs.linuxbase.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/pkgformat.html|Source}
 * @see {@link http://ftp.rpm.org/max-rpm/|Source}
 */

var Rpm = (function() {
  Rpm.OperatingSystems = Object.freeze({
    LINUX: 1,
    IRIX: 2,
    NO_OS: 255,

    1: "LINUX",
    2: "IRIX",
    255: "NO_OS",
  });

  Rpm.SignatureTags = Object.freeze({
    SIGNATURES: 62,
    HEADER_IMMUTABLE: 63,
    I18N_TABLE: 100,
    BAD_SHA1_1_OBSOLETE: 264,
    BAD_SHA1_2_OBSOLETE: 265,
    DSA: 267,
    RSA: 268,
    SHA1: 269,
    LONG_SIZE: 270,
    LONG_ARCHIVE_SIZE: 271,
    SHA256: 273,
    FILE_SIGNATURES: 274,
    FILE_SIGNATURE_LENGTH: 275,
    VERITY_SIGNATURES: 276,
    VERITY_SIGNATURE_ALGO: 277,
    SIZE: 1000,
    LE_MD5_1_OBSOLETE: 1001,
    PGP: 1002,
    LE_MD5_2_OBSOLETE: 1003,
    MD5: 1004,
    GPG: 1005,
    PGP5_OBSOLETE: 1006,
    PAYLOAD_SIZE: 1007,
    RESERVED_SPACE: 1008,

    62: "SIGNATURES",
    63: "HEADER_IMMUTABLE",
    100: "I18N_TABLE",
    264: "BAD_SHA1_1_OBSOLETE",
    265: "BAD_SHA1_2_OBSOLETE",
    267: "DSA",
    268: "RSA",
    269: "SHA1",
    270: "LONG_SIZE",
    271: "LONG_ARCHIVE_SIZE",
    273: "SHA256",
    274: "FILE_SIGNATURES",
    275: "FILE_SIGNATURE_LENGTH",
    276: "VERITY_SIGNATURES",
    277: "VERITY_SIGNATURE_ALGO",
    1000: "SIZE",
    1001: "LE_MD5_1_OBSOLETE",
    1002: "PGP",
    1003: "LE_MD5_2_OBSOLETE",
    1004: "MD5",
    1005: "GPG",
    1006: "PGP5_OBSOLETE",
    1007: "PAYLOAD_SIZE",
    1008: "RESERVED_SPACE",
  });

  Rpm.RecordTypes = Object.freeze({
    NOT_IMPLEMENTED: 0,
    CHAR: 1,
    UINT8: 2,
    UINT16: 3,
    UINT32: 4,
    UINT64: 5,
    STRING: 6,
    BIN: 7,
    STRING_ARRAY: 8,
    I18N_STRING: 9,

    0: "NOT_IMPLEMENTED",
    1: "CHAR",
    2: "UINT8",
    3: "UINT16",
    4: "UINT32",
    5: "UINT64",
    6: "STRING",
    7: "BIN",
    8: "STRING_ARRAY",
    9: "I18N_STRING",
  });

  Rpm.HeaderTags = Object.freeze({
    SIGNATURES: 62,
    HEADER_IMMUTABLE: 63,
    I18N_TABLE: 100,
    NAME: 1000,
    VERSION: 1001,
    RELEASE: 1002,
    EPOCH: 1003,
    SUMMARY: 1004,
    DESCRIPTION: 1005,
    BUILD_TIME: 1006,
    BUILD_HOST: 1007,
    INSTALL_TIME: 1008,
    SIZE: 1009,
    DISTRIBUTION: 1010,
    VENDOR: 1011,
    GIF_OBSOLETE: 1012,
    XPM_OBSOLETE: 1013,
    LICENSE: 1014,
    PACKAGER: 1015,
    GROUP: 1016,
    CHANGELOG_INTERNAL: 1017,
    SOURCE: 1018,
    PATCH: 1019,
    URL: 1020,
    OS: 1021,
    ARCH: 1022,
    PRE_INSTALL_SCRIPTLET: 1023,
    POST_INSTALL_SCRIPTLET: 1024,
    PRE_UNINSTALL_SCRIPTLET: 1025,
    POST_UNINSTALL_SCRIPTLET: 1026,
    OLD_FILE_NAMES_OBSOLETE: 1027,
    FILE_SIZES: 1028,
    FILE_STATES: 1029,
    FILE_MODES: 1030,
    FILE_UIDS_INTERNAL: 1031,
    FILE_GIDS_INTERNAL: 1032,
    DEVICE_NUMBER: 1033,
    MTIMES: 1034,
    FILE_DIGESTS: 1035,
    LINK_TOS: 1036,
    FILE_FLAGS: 1037,
    ROOT_INTERNAL: 1038,
    FILE_OWNER: 1039,
    FILE_GROUP: 1040,
    EXCLUDE_INTERNAL: 1041,
    EXCLUSIVE_INTERNAL: 1042,
    ICON_OBSOLETE: 1043,
    SOURCE_RPM: 1044,
    FILE_VERIFY_FLAGS: 1045,
    ARCHIVE_SIZE: 1046,
    PROVIDE_NAME: 1047,
    REQUIRE_FLAGS: 1048,
    REQUIRE_NAME: 1049,
    REQUIRE_VERSION: 1050,
    NO_SOURCE: 1051,
    NO_PATCH: 1052,
    CONFLICT_FLAGS: 1053,
    CONFLICT_NAME: 1054,
    CONFLICT_VERSION: 1055,
    DEFAULT_PREFIX_INTERNAL: 1056,
    BUILD_ROOT_INTERNAL: 1057,
    INSTALL_PREFIX_INTERNAL: 1058,
    EXCLUDE_ARCH: 1059,
    EXCLUDE_OS: 1060,
    EXCLUSIVE_ARCH: 1061,
    EXCLUSIVE_OS: 1062,
    AUTOREQPROV_INTERNAL: 1063,
    RPM_VERSION: 1064,
    TRIGGER_SCRIPTS: 1065,
    TRIGGER_NAME: 1066,
    TRIGGER_VERSION: 1067,
    TRIGGER_FLAGS: 1068,
    TRIGGER_INDEX: 1069,
    VERIFY_SCRIPT: 1079,
    CHANGELOG_TIME: 1080,
    CHANGELOG_NAME: 1081,
    CHANGELOG_TEXT: 1082,
    BROKEN_MD5_INTERNAL: 1083,
    PREREQ_INTERNAL: 1084,
    PRE_INSTALL_INTERPRETER: 1085,
    POST_INSTALL_INTERPRETER: 1086,
    PRE_UNINSTALL_INTERPRETER: 1087,
    POST_UNINSTALL_INTERPRETER: 1088,
    BUILD_ARCHS: 1089,
    OBSOLETE_NAME: 1090,
    VERIFY_SCRIPT_PROG: 1091,
    TRIGGER_SCRIPT_PROG: 1092,
    DOC_DIR_INTERNAL: 1093,
    COOKIE: 1094,
    FILE_DEVICES: 1095,
    FILE_INODES: 1096,
    FILE_LANGS: 1097,
    PREFIXES: 1098,
    INSTALL_PREFIXES: 1099,
    TRIGGER_INSTALL_INTERNAL: 1100,
    TRIGGER_UNINSTALL_INTERNAL: 1101,
    TRIGGER_POST_UNINSTALL_INTERNAL: 1102,
    AUTOREQ_INTERNAL: 1103,
    AUTOPROV_INTERNAL: 1104,
    CAPABILITY_INTERNAL: 1105,
    SOURCE_PACKAGE: 1106,
    OLD_ORIG_FILENAMES_INTERNAL: 1107,
    BUILD_PREREQ_INTERNAL: 1108,
    BUILD_REQUIRES_INTERNAL: 1109,
    BUILD_CONFLICTS_INTERNAL: 1110,
    BUILD_MACROS_INTERNAL: 1111,
    PROVIDE_FLAGS: 1112,
    PROVIDE_VERSION: 1113,
    OBSOLETE_FLAGS: 1114,
    OBSOLETE_VERSION: 1115,
    DIR_INDEXES: 1116,
    BASE_NAMES: 1117,
    DIR_NAMES: 1118,
    ORIG_DIR_INDEXES: 1119,
    ORIG_BASE_NAMES: 1120,
    ORIG_DIR_NAMES: 1121,
    OPT_FLAGS: 1122,
    DIST_URL: 1123,
    PAYLOAD_FORMAT: 1124,
    PAYLOAD_COMPRESSOR: 1125,
    PAYLOAD_FLAGS: 1126,
    INSTALL_COLOR: 1127,
    INSTALL_TID: 1128,
    REMOVE_TID_OBSOLETE: 1129,
    SHA1_RHN_INTERNAL: 1130,
    RHN_PLATFORM_INTERNAL: 1131,
    PLATFORM: 1132,
    PATCHES_NAME_OBSOLETE: 1133,
    PATCHES_FLAGS_OBSOLETE: 1134,
    PATCHES_VERSION_OBSOLETE: 1135,
    CACHE_CTIME_INTERNAL: 1136,
    CACHE_PKG_PATH_INTERNAL: 1137,
    CACHE_PKG_SIZE_INTERNAL: 1138,
    CACHE_PKG_MTIME_INTERNAL: 1139,
    FILE_COLORS: 1140,
    FILE_CLASS: 1141,
    CLASS_DICT: 1142,
    FILE_DEPENDS_IDX: 1143,
    FILE_DEPENDS_NUM: 1144,
    DEPENDS_DICT: 1145,
    SOURCE_PKGID: 1146,
    FILE_CONTEXTS_OBSOLETE: 1147,
    FS_CONTEXTS_OBSOLETE: 1148,
    RE_CONTEXTS_OBSOLETE: 1149,
    POLICIES: 1150,
    PRE_TRANS: 1151,
    POST_TRANS: 1152,
    PRE_TRANS_PROG: 1153,
    POST_TRANS_PROG: 1154,
    DIST_TAG: 1155,
    OLD_SUGGESTS_NAME_OBSOLETE: 1156,
    OLD_SUGGESTS_VERSION_OBSOLETE: 1157,
    OLD_SUGGESTS_FLAGS_OBSOLETE: 1158,
    OLD_ENHANCES_NAME_OBSOLETE: 1159,
    OLD_ENHANCES_VERSION_OBSOLETE: 1160,
    OLD_ENHANCES_FLAGS_OBSOLETE: 1161,
    PRIORITY_UNIMPLEMENTED: 1162,
    CVSID_UNIMPLEMENTED: 1163,
    BLINK_PKGID_UNIMPLEMENTED: 1164,
    BLINK_HDRID_UNIMPLEMENTED: 1165,
    BLINK_NEVRA_UNIMPLEMENTED: 1166,
    FLINK_PKGID_UNIMPLEMENTED: 1167,
    FLINK_HDRID_UNIMPLEMENTED: 1168,
    FLINK_NEVRA_UNIMPLEMENTED: 1169,
    PACKAGE_ORIGIN_UNIMPLEMENTED: 1170,
    TRIGGER_PRE_INSTALL_INTERNAL: 1171,
    BUILD_SUGGESTS_UNIMPLEMENTED: 1172,
    BUILD_ENHANCES_UNIMPLEMENTED: 1173,
    SCRIPT_STATES_UNIMPLEMENTED: 1174,
    SCRIPT_METRICS_UNIMPLEMENTED: 1175,
    BUILD_CPU_CLOCK_UNIMPLEMENTED: 1176,
    FILE_DIGEST_ALGOS_UNIMPLEMENTED: 1177,
    VARIANTS_UNIMPLEMENTED: 1178,
    XMAJOR_UNIMPLEMENTED: 1179,
    XMINOR_UNIMPLEMENTED: 1180,
    REPO_TAG_UNIMPLEMENTED: 1181,
    KEYWORDS_UNIMPLEMENTED: 1182,
    BUILD_PLATFORMS_UNIMPLEMENTED: 1183,
    PACKAGE_COLOR_UNIMPLEMENTED: 1184,
    PACKAGE_PREF_COLOR_UNIMPLEMENTED: 1185,
    XATTRS_DICT_UNIMPLEMENTED: 1186,
    FILEX_ATTRSX_UNIMPLEMENTED: 1187,
    DEP_ATTRS_DICT_UNIMPLEMENTED: 1188,
    CONFLICT_ATTRSX_UNIMPLEMENTED: 1189,
    OBSOLETE_ATTRSX_UNIMPLEMENTED: 1190,
    PROVIDE_ATTRSX_UNIMPLEMENTED: 1191,
    REQUIRE_ATTRSX_UNIMPLEMENTED: 1192,
    BUILD_PROVIDES_UNIMPLEMENTED: 1193,
    BUILD_OBSOLETES_UNIMPLEMENTED: 1194,
    DB_INSTANCE: 1195,
    NVRA: 1196,
    FILE_NAMES: 5000,
    FILE_PROVIDE: 5001,
    FILE_REQUIRE: 5002,
    FS_NAMES_UNIMPLEMENTED: 5003,
    FS_SIZES_UNIMPLEMENTED: 5004,
    TRIGGER_CONDS: 5005,
    TRIGGER_TYPE: 5006,
    ORIG_FILE_NAMES: 5007,
    LONG_FILE_SIZES: 5008,
    LONG_SIZE: 5009,
    FILE_CAPS: 5010,
    FILE_DIGEST_ALGO: 5011,
    BUG_URL: 5012,
    EVR: 5013,
    NVR: 5014,
    NEVR: 5015,
    NEVRA: 5016,
    HEADER_COLOR: 5017,
    VERBOSE: 5018,
    EPOCH_NUM: 5019,
    PRE_INSTALL_FLAGS: 5020,
    POST_INSTALL_FLAGS: 5021,
    PRE_UNINSTALL_FLAGS: 5022,
    POST_UNINSTALL_FLAGS: 5023,
    PRE_TRANS_FLAGS: 5024,
    POST_TRANS_FLAGS: 5025,
    VERIFY_SCRIPT_FLAGS: 5026,
    TRIGGER_SCRIPT_FLAGS: 5027,
    COLLECTIONS_UNIMPLEMENTED: 5029,
    POLICY_NAMES: 5030,
    POLICY_TYPES: 5031,
    POLICY_TYPES_INDEXES: 5032,
    POLICY_FLAGS: 5033,
    VCS: 5034,
    ORDER_NAME: 5035,
    ORDER_VERSION: 5036,
    ORDER_FLAGS: 5037,
    MSSF_MANIFEST_UNIMPLEMENTED: 5038,
    MSSF_DOMAIN_UNIMPLEMENTED: 5039,
    INST_FILE_NAMES: 5040,
    REQUIRE_NEVRS: 5041,
    PROVIDE_NEVRS: 5042,
    OBSOLETE_NEVRS: 5043,
    CONFLICT_NEVRS: 5044,
    FILE_NLINKS: 5045,
    RECOMMEND_NAME: 5046,
    RECOMMEND_VERSION: 5047,
    RECOMMEND_FLAGS: 5048,
    SUGGEST_NAME: 5049,
    SUGGEST_VERSION: 5050,
    SUGGEST_FLAGS: 5051,
    SUPPLEMENT_NAME: 5052,
    SUPPLEMENT_VERSION: 5053,
    SUPPLEMENT_FLAGS: 5054,
    ENHANCE_NAME: 5055,
    ENHANCE_VERSION: 5056,
    ENHANCE_FLAGS: 5057,
    RECOMMEND_NEVRS: 5058,
    SUGGEST_NEVRS: 5059,
    SUPPLEMENT_NEVRS: 5060,
    ENHANCE_NEVRS: 5061,
    ENCODING: 5062,
    FILE_TRIGGER_INSTALL_INTERNAL: 5063,
    FILE_TRIGGER_UNINSTALL_INTERNAL: 5064,
    FILE_TRIGGER_POST_UNINSTALL_INTERNAL: 5065,
    FILE_TRIGGER_SCRIPTS: 5066,
    FILE_TRIGGER_SCRIPT_PROG: 5067,
    FILE_TRIGGER_SCRIPT_FLAGS: 5068,
    FILE_TRIGGER_NAME: 5069,
    FILE_TRIGGER_INDEX: 5070,
    FILE_TRIGGER_VERSION: 5071,
    FILE_TRIGGER_FLAGS: 5072,
    TRANS_FILE_TRIGGER_INSTALL_INTERNAL: 5073,
    TRANS_FILE_TRIGGER_UNINSTALL_INTERNAL: 5074,
    TRANS_FILE_TRIGGER_POST_UNINSTALL_INTERNAL: 5075,
    TRANS_FILE_TRIGGER_SCRIPTS: 5076,
    TRANS_FILE_TRIGGER_SCRIPT_PROG: 5077,
    TRANS_FILE_TRIGGER_SCRIPT_FLAGS: 5078,
    TRANS_FILE_TRIGGER_NAME: 5079,
    TRANS_FILE_TRIGGER_INDEX: 5080,
    TRANS_FILE_TRIGGER_VERSION: 5081,
    TRANS_FILE_TRIGGER_FLAGS: 5082,
    REMOVE_PATH_POSTFIXES_INTERNAL: 5083,
    FILE_TRIGGER_PRIORITIES: 5084,
    TRANS_FILE_TRIGGER_PRIORITIES: 5085,
    FILE_TRIGGER_CONDS: 5086,
    FILE_TRIGGER_TYPE: 5087,
    TRANS_FILE_TRIGGER_CONDS: 5088,
    TRANS_FILE_TRIGGER_TYPE: 5089,
    FILE_SIGNATURES: 5090,
    FILE_SIGNATURE_LENGTH: 5091,
    PAYLOAD_DIGEST: 5092,
    PAYLOAD_DIGEST_ALGO: 5093,
    AUTO_INSTALLED_UNIMPLEMENTED: 5094,
    IDENTITY_UNIMPLEMENTED: 5095,
    MODULARITY_LABEL: 5096,
    PAYLOAD_DIGEST_ALT: 5097,
    ARCH_SUFFIX: 5098,
    SPEC: 5099,
    TRANSLATION_URL: 5100,
    UPSTREAM_RELEASES: 5101,
    SOURCE_LICENSE_INTERNAL: 5102,

    62: "SIGNATURES",
    63: "HEADER_IMMUTABLE",
    100: "I18N_TABLE",
    1000: "NAME",
    1001: "VERSION",
    1002: "RELEASE",
    1003: "EPOCH",
    1004: "SUMMARY",
    1005: "DESCRIPTION",
    1006: "BUILD_TIME",
    1007: "BUILD_HOST",
    1008: "INSTALL_TIME",
    1009: "SIZE",
    1010: "DISTRIBUTION",
    1011: "VENDOR",
    1012: "GIF_OBSOLETE",
    1013: "XPM_OBSOLETE",
    1014: "LICENSE",
    1015: "PACKAGER",
    1016: "GROUP",
    1017: "CHANGELOG_INTERNAL",
    1018: "SOURCE",
    1019: "PATCH",
    1020: "URL",
    1021: "OS",
    1022: "ARCH",
    1023: "PRE_INSTALL_SCRIPTLET",
    1024: "POST_INSTALL_SCRIPTLET",
    1025: "PRE_UNINSTALL_SCRIPTLET",
    1026: "POST_UNINSTALL_SCRIPTLET",
    1027: "OLD_FILE_NAMES_OBSOLETE",
    1028: "FILE_SIZES",
    1029: "FILE_STATES",
    1030: "FILE_MODES",
    1031: "FILE_UIDS_INTERNAL",
    1032: "FILE_GIDS_INTERNAL",
    1033: "DEVICE_NUMBER",
    1034: "MTIMES",
    1035: "FILE_DIGESTS",
    1036: "LINK_TOS",
    1037: "FILE_FLAGS",
    1038: "ROOT_INTERNAL",
    1039: "FILE_OWNER",
    1040: "FILE_GROUP",
    1041: "EXCLUDE_INTERNAL",
    1042: "EXCLUSIVE_INTERNAL",
    1043: "ICON_OBSOLETE",
    1044: "SOURCE_RPM",
    1045: "FILE_VERIFY_FLAGS",
    1046: "ARCHIVE_SIZE",
    1047: "PROVIDE_NAME",
    1048: "REQUIRE_FLAGS",
    1049: "REQUIRE_NAME",
    1050: "REQUIRE_VERSION",
    1051: "NO_SOURCE",
    1052: "NO_PATCH",
    1053: "CONFLICT_FLAGS",
    1054: "CONFLICT_NAME",
    1055: "CONFLICT_VERSION",
    1056: "DEFAULT_PREFIX_INTERNAL",
    1057: "BUILD_ROOT_INTERNAL",
    1058: "INSTALL_PREFIX_INTERNAL",
    1059: "EXCLUDE_ARCH",
    1060: "EXCLUDE_OS",
    1061: "EXCLUSIVE_ARCH",
    1062: "EXCLUSIVE_OS",
    1063: "AUTOREQPROV_INTERNAL",
    1064: "RPM_VERSION",
    1065: "TRIGGER_SCRIPTS",
    1066: "TRIGGER_NAME",
    1067: "TRIGGER_VERSION",
    1068: "TRIGGER_FLAGS",
    1069: "TRIGGER_INDEX",
    1079: "VERIFY_SCRIPT",
    1080: "CHANGELOG_TIME",
    1081: "CHANGELOG_NAME",
    1082: "CHANGELOG_TEXT",
    1083: "BROKEN_MD5_INTERNAL",
    1084: "PREREQ_INTERNAL",
    1085: "PRE_INSTALL_INTERPRETER",
    1086: "POST_INSTALL_INTERPRETER",
    1087: "PRE_UNINSTALL_INTERPRETER",
    1088: "POST_UNINSTALL_INTERPRETER",
    1089: "BUILD_ARCHS",
    1090: "OBSOLETE_NAME",
    1091: "VERIFY_SCRIPT_PROG",
    1092: "TRIGGER_SCRIPT_PROG",
    1093: "DOC_DIR_INTERNAL",
    1094: "COOKIE",
    1095: "FILE_DEVICES",
    1096: "FILE_INODES",
    1097: "FILE_LANGS",
    1098: "PREFIXES",
    1099: "INSTALL_PREFIXES",
    1100: "TRIGGER_INSTALL_INTERNAL",
    1101: "TRIGGER_UNINSTALL_INTERNAL",
    1102: "TRIGGER_POST_UNINSTALL_INTERNAL",
    1103: "AUTOREQ_INTERNAL",
    1104: "AUTOPROV_INTERNAL",
    1105: "CAPABILITY_INTERNAL",
    1106: "SOURCE_PACKAGE",
    1107: "OLD_ORIG_FILENAMES_INTERNAL",
    1108: "BUILD_PREREQ_INTERNAL",
    1109: "BUILD_REQUIRES_INTERNAL",
    1110: "BUILD_CONFLICTS_INTERNAL",
    1111: "BUILD_MACROS_INTERNAL",
    1112: "PROVIDE_FLAGS",
    1113: "PROVIDE_VERSION",
    1114: "OBSOLETE_FLAGS",
    1115: "OBSOLETE_VERSION",
    1116: "DIR_INDEXES",
    1117: "BASE_NAMES",
    1118: "DIR_NAMES",
    1119: "ORIG_DIR_INDEXES",
    1120: "ORIG_BASE_NAMES",
    1121: "ORIG_DIR_NAMES",
    1122: "OPT_FLAGS",
    1123: "DIST_URL",
    1124: "PAYLOAD_FORMAT",
    1125: "PAYLOAD_COMPRESSOR",
    1126: "PAYLOAD_FLAGS",
    1127: "INSTALL_COLOR",
    1128: "INSTALL_TID",
    1129: "REMOVE_TID_OBSOLETE",
    1130: "SHA1_RHN_INTERNAL",
    1131: "RHN_PLATFORM_INTERNAL",
    1132: "PLATFORM",
    1133: "PATCHES_NAME_OBSOLETE",
    1134: "PATCHES_FLAGS_OBSOLETE",
    1135: "PATCHES_VERSION_OBSOLETE",
    1136: "CACHE_CTIME_INTERNAL",
    1137: "CACHE_PKG_PATH_INTERNAL",
    1138: "CACHE_PKG_SIZE_INTERNAL",
    1139: "CACHE_PKG_MTIME_INTERNAL",
    1140: "FILE_COLORS",
    1141: "FILE_CLASS",
    1142: "CLASS_DICT",
    1143: "FILE_DEPENDS_IDX",
    1144: "FILE_DEPENDS_NUM",
    1145: "DEPENDS_DICT",
    1146: "SOURCE_PKGID",
    1147: "FILE_CONTEXTS_OBSOLETE",
    1148: "FS_CONTEXTS_OBSOLETE",
    1149: "RE_CONTEXTS_OBSOLETE",
    1150: "POLICIES",
    1151: "PRE_TRANS",
    1152: "POST_TRANS",
    1153: "PRE_TRANS_PROG",
    1154: "POST_TRANS_PROG",
    1155: "DIST_TAG",
    1156: "OLD_SUGGESTS_NAME_OBSOLETE",
    1157: "OLD_SUGGESTS_VERSION_OBSOLETE",
    1158: "OLD_SUGGESTS_FLAGS_OBSOLETE",
    1159: "OLD_ENHANCES_NAME_OBSOLETE",
    1160: "OLD_ENHANCES_VERSION_OBSOLETE",
    1161: "OLD_ENHANCES_FLAGS_OBSOLETE",
    1162: "PRIORITY_UNIMPLEMENTED",
    1163: "CVSID_UNIMPLEMENTED",
    1164: "BLINK_PKGID_UNIMPLEMENTED",
    1165: "BLINK_HDRID_UNIMPLEMENTED",
    1166: "BLINK_NEVRA_UNIMPLEMENTED",
    1167: "FLINK_PKGID_UNIMPLEMENTED",
    1168: "FLINK_HDRID_UNIMPLEMENTED",
    1169: "FLINK_NEVRA_UNIMPLEMENTED",
    1170: "PACKAGE_ORIGIN_UNIMPLEMENTED",
    1171: "TRIGGER_PRE_INSTALL_INTERNAL",
    1172: "BUILD_SUGGESTS_UNIMPLEMENTED",
    1173: "BUILD_ENHANCES_UNIMPLEMENTED",
    1174: "SCRIPT_STATES_UNIMPLEMENTED",
    1175: "SCRIPT_METRICS_UNIMPLEMENTED",
    1176: "BUILD_CPU_CLOCK_UNIMPLEMENTED",
    1177: "FILE_DIGEST_ALGOS_UNIMPLEMENTED",
    1178: "VARIANTS_UNIMPLEMENTED",
    1179: "XMAJOR_UNIMPLEMENTED",
    1180: "XMINOR_UNIMPLEMENTED",
    1181: "REPO_TAG_UNIMPLEMENTED",
    1182: "KEYWORDS_UNIMPLEMENTED",
    1183: "BUILD_PLATFORMS_UNIMPLEMENTED",
    1184: "PACKAGE_COLOR_UNIMPLEMENTED",
    1185: "PACKAGE_PREF_COLOR_UNIMPLEMENTED",
    1186: "XATTRS_DICT_UNIMPLEMENTED",
    1187: "FILEX_ATTRSX_UNIMPLEMENTED",
    1188: "DEP_ATTRS_DICT_UNIMPLEMENTED",
    1189: "CONFLICT_ATTRSX_UNIMPLEMENTED",
    1190: "OBSOLETE_ATTRSX_UNIMPLEMENTED",
    1191: "PROVIDE_ATTRSX_UNIMPLEMENTED",
    1192: "REQUIRE_ATTRSX_UNIMPLEMENTED",
    1193: "BUILD_PROVIDES_UNIMPLEMENTED",
    1194: "BUILD_OBSOLETES_UNIMPLEMENTED",
    1195: "DB_INSTANCE",
    1196: "NVRA",
    5000: "FILE_NAMES",
    5001: "FILE_PROVIDE",
    5002: "FILE_REQUIRE",
    5003: "FS_NAMES_UNIMPLEMENTED",
    5004: "FS_SIZES_UNIMPLEMENTED",
    5005: "TRIGGER_CONDS",
    5006: "TRIGGER_TYPE",
    5007: "ORIG_FILE_NAMES",
    5008: "LONG_FILE_SIZES",
    5009: "LONG_SIZE",
    5010: "FILE_CAPS",
    5011: "FILE_DIGEST_ALGO",
    5012: "BUG_URL",
    5013: "EVR",
    5014: "NVR",
    5015: "NEVR",
    5016: "NEVRA",
    5017: "HEADER_COLOR",
    5018: "VERBOSE",
    5019: "EPOCH_NUM",
    5020: "PRE_INSTALL_FLAGS",
    5021: "POST_INSTALL_FLAGS",
    5022: "PRE_UNINSTALL_FLAGS",
    5023: "POST_UNINSTALL_FLAGS",
    5024: "PRE_TRANS_FLAGS",
    5025: "POST_TRANS_FLAGS",
    5026: "VERIFY_SCRIPT_FLAGS",
    5027: "TRIGGER_SCRIPT_FLAGS",
    5029: "COLLECTIONS_UNIMPLEMENTED",
    5030: "POLICY_NAMES",
    5031: "POLICY_TYPES",
    5032: "POLICY_TYPES_INDEXES",
    5033: "POLICY_FLAGS",
    5034: "VCS",
    5035: "ORDER_NAME",
    5036: "ORDER_VERSION",
    5037: "ORDER_FLAGS",
    5038: "MSSF_MANIFEST_UNIMPLEMENTED",
    5039: "MSSF_DOMAIN_UNIMPLEMENTED",
    5040: "INST_FILE_NAMES",
    5041: "REQUIRE_NEVRS",
    5042: "PROVIDE_NEVRS",
    5043: "OBSOLETE_NEVRS",
    5044: "CONFLICT_NEVRS",
    5045: "FILE_NLINKS",
    5046: "RECOMMEND_NAME",
    5047: "RECOMMEND_VERSION",
    5048: "RECOMMEND_FLAGS",
    5049: "SUGGEST_NAME",
    5050: "SUGGEST_VERSION",
    5051: "SUGGEST_FLAGS",
    5052: "SUPPLEMENT_NAME",
    5053: "SUPPLEMENT_VERSION",
    5054: "SUPPLEMENT_FLAGS",
    5055: "ENHANCE_NAME",
    5056: "ENHANCE_VERSION",
    5057: "ENHANCE_FLAGS",
    5058: "RECOMMEND_NEVRS",
    5059: "SUGGEST_NEVRS",
    5060: "SUPPLEMENT_NEVRS",
    5061: "ENHANCE_NEVRS",
    5062: "ENCODING",
    5063: "FILE_TRIGGER_INSTALL_INTERNAL",
    5064: "FILE_TRIGGER_UNINSTALL_INTERNAL",
    5065: "FILE_TRIGGER_POST_UNINSTALL_INTERNAL",
    5066: "FILE_TRIGGER_SCRIPTS",
    5067: "FILE_TRIGGER_SCRIPT_PROG",
    5068: "FILE_TRIGGER_SCRIPT_FLAGS",
    5069: "FILE_TRIGGER_NAME",
    5070: "FILE_TRIGGER_INDEX",
    5071: "FILE_TRIGGER_VERSION",
    5072: "FILE_TRIGGER_FLAGS",
    5073: "TRANS_FILE_TRIGGER_INSTALL_INTERNAL",
    5074: "TRANS_FILE_TRIGGER_UNINSTALL_INTERNAL",
    5075: "TRANS_FILE_TRIGGER_POST_UNINSTALL_INTERNAL",
    5076: "TRANS_FILE_TRIGGER_SCRIPTS",
    5077: "TRANS_FILE_TRIGGER_SCRIPT_PROG",
    5078: "TRANS_FILE_TRIGGER_SCRIPT_FLAGS",
    5079: "TRANS_FILE_TRIGGER_NAME",
    5080: "TRANS_FILE_TRIGGER_INDEX",
    5081: "TRANS_FILE_TRIGGER_VERSION",
    5082: "TRANS_FILE_TRIGGER_FLAGS",
    5083: "REMOVE_PATH_POSTFIXES_INTERNAL",
    5084: "FILE_TRIGGER_PRIORITIES",
    5085: "TRANS_FILE_TRIGGER_PRIORITIES",
    5086: "FILE_TRIGGER_CONDS",
    5087: "FILE_TRIGGER_TYPE",
    5088: "TRANS_FILE_TRIGGER_CONDS",
    5089: "TRANS_FILE_TRIGGER_TYPE",
    5090: "FILE_SIGNATURES",
    5091: "FILE_SIGNATURE_LENGTH",
    5092: "PAYLOAD_DIGEST",
    5093: "PAYLOAD_DIGEST_ALGO",
    5094: "AUTO_INSTALLED_UNIMPLEMENTED",
    5095: "IDENTITY_UNIMPLEMENTED",
    5096: "MODULARITY_LABEL",
    5097: "PAYLOAD_DIGEST_ALT",
    5098: "ARCH_SUFFIX",
    5099: "SPEC",
    5100: "TRANSLATION_URL",
    5101: "UPSTREAM_RELEASES",
    5102: "SOURCE_LICENSE_INTERNAL",
  });

  Rpm.RpmTypes = Object.freeze({
    BINARY: 0,
    SOURCE: 1,

    0: "BINARY",
    1: "SOURCE",
  });

  Rpm.Architectures = Object.freeze({
    X86: 1,
    ALPHA: 2,
    SPARC: 3,
    MIPS: 4,
    PPC: 5,
    M68K: 6,
    SGI: 7,
    RS6000: 8,
    IA64: 9,
    SPARC64: 10,
    MIPS64: 11,
    ARM: 12,
    M68K_MINT: 13,
    S390: 14,
    S390X: 15,
    PPC64: 16,
    SH: 17,
    XTENSA: 18,
    AARCH64: 19,
    MIPS_R6: 20,
    MIPS64_R6: 21,
    RISCV: 22,
    LOONGARCH64: 23,
    NO_ARCH: 255,

    1: "X86",
    2: "ALPHA",
    3: "SPARC",
    4: "MIPS",
    5: "PPC",
    6: "M68K",
    7: "SGI",
    8: "RS6000",
    9: "IA64",
    10: "SPARC64",
    11: "MIPS64",
    12: "ARM",
    13: "M68K_MINT",
    14: "S390",
    15: "S390X",
    16: "PPC64",
    17: "SH",
    18: "XTENSA",
    19: "AARCH64",
    20: "MIPS_R6",
    21: "MIPS64_R6",
    22: "RISCV",
    23: "LOONGARCH64",
    255: "NO_ARCH",
  });

  function Rpm(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Rpm.prototype._read = function() {
    this.lead = new Lead(this._io, this, this._root);
    this.signature = new Header(this._io, this, this._root, true);
    this.signaturePadding = this._io.readBytes(KaitaiStream.mod(-(this._io.pos), 8));
    if (this.ofsHeader < 0) {
      this._unnamed3 = this._io.readBytes(0);
    }
    this.header = new Header(this._io, this, this._root, false);
    if (this.ofsPayload < 0) {
      this._unnamed5 = this._io.readBytes(0);
    }
    this.signatureTagsSteps = [];
    for (var i = 0; i < this.signature.headerRecord.numIndexRecords; i++) {
      this.signatureTagsSteps.push(new SignatureTagsStep(this._io, this, this._root, i, (i < 1 ? -1 : this.signatureTagsSteps[(i - 1)].sizeTagIdx)));
    }
  }

  var RecordTypeStringArray = Rpm.RecordTypeStringArray = (function() {
    function RecordTypeStringArray(_io, _parent, _root, numValues) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.numValues = numValues;

      this._read();
    }
    RecordTypeStringArray.prototype._read = function() {
      this.values = [];
      for (var i = 0; i < this.numValues; i++) {
        this.values.push(KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "UTF-8"));
      }
    }

    return RecordTypeStringArray;
  })();

  /**
   * In 2021, Panu Matilainen (a RPM developer) [described this
   * structure](https://github.com/kaitai-io/kaitai_struct_formats/pull/469#discussion_r718288192)
   * as follows:
   * 
   * > The lead as a structure is 25 years obsolete, the data there is
   * > meaningless. Seriously. Except to check for the magic to detect that
   * > it's an rpm file in the first place, just ignore everything in it.
   * > Literally everything.
   * 
   * The fields with `valid` constraints are important, because these are the
   * same validations that RPM does (which means that any valid `.rpm` file
   * must pass them), but otherwise you should not make decisions based on the
   * values given here.
   */

  var Lead = Rpm.Lead = (function() {
    function Lead(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Lead.prototype._read = function() {
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [237, 171, 238, 219]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([237, 171, 238, 219], this.magic, this._io, "/types/lead/seq/0");
      }
      this.version = new RpmVersion(this._io, this, this._root);
      this.type = this._io.readU2be();
      this.architecture = this._io.readU2be();
      this.packageName = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(66), 0, false), "UTF-8");
      this.os = this._io.readU2be();
      this.signatureType = this._io.readU2be();
      if (!(this.signatureType == 5)) {
        throw new KaitaiStream.ValidationNotEqualError(5, this.signatureType, this._io, "/types/lead/seq/6");
      }
      this.reserved = this._io.readBytes(16);
    }

    return Lead;
  })();

  var RecordTypeString = Rpm.RecordTypeString = (function() {
    function RecordTypeString(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RecordTypeString.prototype._read = function() {
      this.values = [];
      for (var i = 0; i < 1; i++) {
        this.values.push(KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "UTF-8"));
      }
    }

    return RecordTypeString;
  })();

  var SignatureTagsStep = Rpm.SignatureTagsStep = (function() {
    function SignatureTagsStep(_io, _parent, _root, idx, prevSizeTagIdx) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.idx = idx;
      this.prevSizeTagIdx = prevSizeTagIdx;

      this._read();
    }
    SignatureTagsStep.prototype._read = function() {
    }
    Object.defineProperty(SignatureTagsStep.prototype, 'sizeTagIdx', {
      get: function() {
        if (this._m_sizeTagIdx !== undefined)
          return this._m_sizeTagIdx;
        this._m_sizeTagIdx = (this.prevSizeTagIdx != -1 ? this.prevSizeTagIdx : ( ((this._parent.signature.indexRecords[this.idx].signatureTag == Rpm.SignatureTags.SIZE) && (this._parent.signature.indexRecords[this.idx].recordType == Rpm.RecordTypes.UINT32) && (this._parent.signature.indexRecords[this.idx].numValues >= 1))  ? this.idx : -1));
        return this._m_sizeTagIdx;
      }
    });

    return SignatureTagsStep;
  })();

  var RecordTypeUint32 = Rpm.RecordTypeUint32 = (function() {
    function RecordTypeUint32(_io, _parent, _root, numValues) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.numValues = numValues;

      this._read();
    }
    RecordTypeUint32.prototype._read = function() {
      this.values = [];
      for (var i = 0; i < this.numValues; i++) {
        this.values.push(this._io.readU4be());
      }
    }

    return RecordTypeUint32;
  })();

  var RecordTypeUint16 = Rpm.RecordTypeUint16 = (function() {
    function RecordTypeUint16(_io, _parent, _root, numValues) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.numValues = numValues;

      this._read();
    }
    RecordTypeUint16.prototype._read = function() {
      this.values = [];
      for (var i = 0; i < this.numValues; i++) {
        this.values.push(this._io.readU2be());
      }
    }

    return RecordTypeUint16;
  })();

  var HeaderIndexRecord = Rpm.HeaderIndexRecord = (function() {
    function HeaderIndexRecord(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    HeaderIndexRecord.prototype._read = function() {
      this.tagRaw = this._io.readU4be();
      this.recordType = this._io.readU4be();
      this.ofsBody = this._io.readU4be();
      this.count = this._io.readU4be();
    }
    Object.defineProperty(HeaderIndexRecord.prototype, 'numValues', {
      get: function() {
        if (this._m_numValues !== undefined)
          return this._m_numValues;
        if (this.recordType != Rpm.RecordTypes.BIN) {
          this._m_numValues = this.count;
        }
        return this._m_numValues;
      }
    });
    Object.defineProperty(HeaderIndexRecord.prototype, 'body', {
      get: function() {
        if (this._m_body !== undefined)
          return this._m_body;
        var io = this._parent.storageSection._io;
        var _pos = io.pos;
        io.seek(this.ofsBody);
        switch (this.recordType) {
        case Rpm.RecordTypes.UINT32:
          this._m_body = new RecordTypeUint32(io, this, this._root, this.numValues);
          break;
        case Rpm.RecordTypes.UINT64:
          this._m_body = new RecordTypeUint64(io, this, this._root, this.numValues);
          break;
        case Rpm.RecordTypes.BIN:
          this._m_body = new RecordTypeBin(io, this, this._root, this.lenValue);
          break;
        case Rpm.RecordTypes.STRING:
          this._m_body = new RecordTypeString(io, this, this._root);
          break;
        case Rpm.RecordTypes.UINT8:
          this._m_body = new RecordTypeUint8(io, this, this._root, this.numValues);
          break;
        case Rpm.RecordTypes.I18N_STRING:
          this._m_body = new RecordTypeStringArray(io, this, this._root, this.numValues);
          break;
        case Rpm.RecordTypes.UINT16:
          this._m_body = new RecordTypeUint16(io, this, this._root, this.numValues);
          break;
        case Rpm.RecordTypes.CHAR:
          this._m_body = new RecordTypeUint8(io, this, this._root, this.numValues);
          break;
        case Rpm.RecordTypes.STRING_ARRAY:
          this._m_body = new RecordTypeStringArray(io, this, this._root, this.numValues);
          break;
        }
        io.seek(_pos);
        return this._m_body;
      }
    });
    Object.defineProperty(HeaderIndexRecord.prototype, 'signatureTag', {
      get: function() {
        if (this._m_signatureTag !== undefined)
          return this._m_signatureTag;
        if (this._parent.isSignature) {
          this._m_signatureTag = this.tagRaw;
        }
        return this._m_signatureTag;
      }
    });
    Object.defineProperty(HeaderIndexRecord.prototype, 'lenValue', {
      get: function() {
        if (this._m_lenValue !== undefined)
          return this._m_lenValue;
        if (this.recordType == Rpm.RecordTypes.BIN) {
          this._m_lenValue = this.count;
        }
        return this._m_lenValue;
      }
    });
    Object.defineProperty(HeaderIndexRecord.prototype, 'headerTag', {
      get: function() {
        if (this._m_headerTag !== undefined)
          return this._m_headerTag;
        if (this._parent.isHeader) {
          this._m_headerTag = this.tagRaw;
        }
        return this._m_headerTag;
      }
    });

    /**
     * prefer to access `signature_tag` and `header_tag` instead
     */

    /**
     * internal; access `num_values` and `len_value` instead
     */

    return HeaderIndexRecord;
  })();

  var RpmVersion = Rpm.RpmVersion = (function() {
    function RpmVersion(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RpmVersion.prototype._read = function() {
      this.major = this._io.readU1();
      if (!(this.major >= 3)) {
        throw new KaitaiStream.ValidationLessThanError(3, this.major, this._io, "/types/rpm_version/seq/0");
      }
      if (!(this.major <= 4)) {
        throw new KaitaiStream.ValidationGreaterThanError(4, this.major, this._io, "/types/rpm_version/seq/0");
      }
      this.minor = this._io.readU1();
    }

    /**
     * @see {@link https://github.com/rpm-software-management/rpm/blob/911448f2/lib/rpmlead.c#L102|Source}
     */

    return RpmVersion;
  })();

  var Dummy = Rpm.Dummy = (function() {
    function Dummy(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Dummy.prototype._read = function() {
    }

    return Dummy;
  })();

  var RecordTypeUint8 = Rpm.RecordTypeUint8 = (function() {
    function RecordTypeUint8(_io, _parent, _root, numValues) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.numValues = numValues;

      this._read();
    }
    RecordTypeUint8.prototype._read = function() {
      this.values = [];
      for (var i = 0; i < this.numValues; i++) {
        this.values.push(this._io.readU1());
      }
    }

    return RecordTypeUint8;
  })();

  var RecordTypeUint64 = Rpm.RecordTypeUint64 = (function() {
    function RecordTypeUint64(_io, _parent, _root, numValues) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.numValues = numValues;

      this._read();
    }
    RecordTypeUint64.prototype._read = function() {
      this.values = [];
      for (var i = 0; i < this.numValues; i++) {
        this.values.push(this._io.readU8be());
      }
    }

    return RecordTypeUint64;
  })();

  var RecordTypeBin = Rpm.RecordTypeBin = (function() {
    function RecordTypeBin(_io, _parent, _root, lenValue) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.lenValue = lenValue;

      this._read();
    }
    RecordTypeBin.prototype._read = function() {
      this.values = [];
      for (var i = 0; i < 1; i++) {
        this.values.push(this._io.readBytes(this.lenValue));
      }
    }

    return RecordTypeBin;
  })();

  var HeaderRecord = Rpm.HeaderRecord = (function() {
    function HeaderRecord(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    HeaderRecord.prototype._read = function() {
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [142, 173, 232, 1]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([142, 173, 232, 1], this.magic, this._io, "/types/header_record/seq/0");
      }
      this.reserved = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.reserved, [0, 0, 0, 0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0, 0, 0, 0], this.reserved, this._io, "/types/header_record/seq/1");
      }
      this.numIndexRecords = this._io.readU4be();
      if (!(this.numIndexRecords >= 1)) {
        throw new KaitaiStream.ValidationLessThanError(1, this.numIndexRecords, this._io, "/types/header_record/seq/2");
      }
      this.lenStorageSection = this._io.readU4be();
    }

    /**
     * Size of the storage area for the data
     * pointed to by the Index Records.
     */

    return HeaderRecord;
  })();

  /**
   * header structure used for both the "header" and "signature", but some tag
   * values have different meanings in signature and header (hence they use
   * different enums)
   */

  var Header = Rpm.Header = (function() {
    function Header(_io, _parent, _root, isSignature) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.isSignature = isSignature;

      this._read();
    }
    Header.prototype._read = function() {
      this.headerRecord = new HeaderRecord(this._io, this, this._root);
      this.indexRecords = [];
      for (var i = 0; i < this.headerRecord.numIndexRecords; i++) {
        this.indexRecords.push(new HeaderIndexRecord(this._io, this, this._root));
      }
      this._raw_storageSection = this._io.readBytes(this.headerRecord.lenStorageSection);
      var _io__raw_storageSection = new KaitaiStream(this._raw_storageSection);
      this.storageSection = new Dummy(_io__raw_storageSection, this, this._root);
    }
    Object.defineProperty(Header.prototype, 'isHeader', {
      get: function() {
        if (this._m_isHeader !== undefined)
          return this._m_isHeader;
        this._m_isHeader = !(this.isSignature);
        return this._m_isHeader;
      }
    });

    return Header;
  })();
  Object.defineProperty(Rpm.prototype, 'hasSignatureSizeTag', {
    get: function() {
      if (this._m_hasSignatureSizeTag !== undefined)
        return this._m_hasSignatureSizeTag;
      this._m_hasSignatureSizeTag = this.signatureTagsSteps[this.signatureTagsSteps.length - 1].sizeTagIdx != -1;
      return this._m_hasSignatureSizeTag;
    }
  });
  Object.defineProperty(Rpm.prototype, 'signatureSizeTag', {
    get: function() {
      if (this._m_signatureSizeTag !== undefined)
        return this._m_signatureSizeTag;
      if (this.hasSignatureSizeTag) {
        this._m_signatureSizeTag = this.signature.indexRecords[this.signatureTagsSteps[this.signatureTagsSteps.length - 1].sizeTagIdx];
      }
      return this._m_signatureSizeTag;
    }
  });
  Object.defineProperty(Rpm.prototype, 'lenPayload', {
    get: function() {
      if (this._m_lenPayload !== undefined)
        return this._m_lenPayload;
      if (this.hasSignatureSizeTag) {
        this._m_lenPayload = (this.signatureSizeTag.body.values[0] - this.lenHeader);
      }
      return this._m_lenPayload;
    }
  });
  Object.defineProperty(Rpm.prototype, 'payload', {
    get: function() {
      if (this._m_payload !== undefined)
        return this._m_payload;
      if (this.hasSignatureSizeTag) {
        var _pos = this._io.pos;
        this._io.seek(this.ofsPayload);
        this._m_payload = this._io.readBytes(this.lenPayload);
        this._io.seek(_pos);
      }
      return this._m_payload;
    }
  });
  Object.defineProperty(Rpm.prototype, 'lenHeader', {
    get: function() {
      if (this._m_lenHeader !== undefined)
        return this._m_lenHeader;
      this._m_lenHeader = (this.ofsPayload - this.ofsHeader);
      return this._m_lenHeader;
    }
  });
  Object.defineProperty(Rpm.prototype, 'ofsHeader', {
    get: function() {
      if (this._m_ofsHeader !== undefined)
        return this._m_ofsHeader;
      this._m_ofsHeader = this._io.pos;
      return this._m_ofsHeader;
    }
  });
  Object.defineProperty(Rpm.prototype, 'ofsPayload', {
    get: function() {
      if (this._m_ofsPayload !== undefined)
        return this._m_ofsPayload;
      this._m_ofsPayload = this._io.pos;
      return this._m_ofsPayload;
    }
  });

  return Rpm;
})();
return Rpm;
}));
