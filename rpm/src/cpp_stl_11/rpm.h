#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class rpm_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * This parser is for the RPM version 3 file format which is the current version
 * of the file format used by RPM 2.1 and later (including RPM version 4.x, which
 * is the current version of the RPM tool). There are historical versions of the
 * RPM file format, as well as a currently abandoned fork (rpm5). These formats
 * are not covered by this specification.
 * \sa https://github.com/rpm-software-management/rpm/blob/afad3167/docs/manual/format.md Source
 * \sa https://github.com/rpm-software-management/rpm/blob/afad3167/docs/manual/tags.md Source
 * \sa https://refspecs.linuxbase.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/pkgformat.html Source
 * \sa http://ftp.rpm.org/max-rpm/ Source
 */

class rpm_t : public kaitai::kstruct {

public:
    class dummy_t;
    class header_t;
    class header_index_record_t;
    class header_record_t;
    class lead_t;
    class record_type_bin_t;
    class record_type_string_t;
    class record_type_string_array_t;
    class record_type_uint16_t;
    class record_type_uint32_t;
    class record_type_uint64_t;
    class record_type_uint8_t;
    class rpm_version_t;
    class signature_tags_step_t;

    enum architectures_t {
        ARCHITECTURES_X86 = 1,
        ARCHITECTURES_ALPHA = 2,
        ARCHITECTURES_SPARC = 3,
        ARCHITECTURES_MIPS = 4,
        ARCHITECTURES_PPC = 5,
        ARCHITECTURES_M68K = 6,
        ARCHITECTURES_SGI = 7,
        ARCHITECTURES_RS6000 = 8,
        ARCHITECTURES_IA64 = 9,
        ARCHITECTURES_SPARC64 = 10,
        ARCHITECTURES_MIPS64 = 11,
        ARCHITECTURES_ARM = 12,
        ARCHITECTURES_M68K_MINT = 13,
        ARCHITECTURES_S390 = 14,
        ARCHITECTURES_S390X = 15,
        ARCHITECTURES_PPC64 = 16,
        ARCHITECTURES_SH = 17,
        ARCHITECTURES_XTENSA = 18,
        ARCHITECTURES_AARCH64 = 19,
        ARCHITECTURES_MIPS_R6 = 20,
        ARCHITECTURES_MIPS64_R6 = 21,
        ARCHITECTURES_RISCV = 22,
        ARCHITECTURES_LOONGARCH64 = 23,
        ARCHITECTURES_NO_ARCH = 255
    };
    static bool _is_defined_architectures_t(architectures_t v);

private:
    static const std::set<architectures_t> _values_architectures_t;

public:

    enum header_tags_t {
        HEADER_TAGS_SIGNATURES = 62,
        HEADER_TAGS_HEADER_IMMUTABLE = 63,
        HEADER_TAGS_I18N_TABLE = 100,
        HEADER_TAGS_NAME = 1000,
        HEADER_TAGS_VERSION = 1001,
        HEADER_TAGS_RELEASE = 1002,
        HEADER_TAGS_EPOCH = 1003,
        HEADER_TAGS_SUMMARY = 1004,
        HEADER_TAGS_DESCRIPTION = 1005,
        HEADER_TAGS_BUILD_TIME = 1006,
        HEADER_TAGS_BUILD_HOST = 1007,
        HEADER_TAGS_INSTALL_TIME = 1008,
        HEADER_TAGS_SIZE = 1009,
        HEADER_TAGS_DISTRIBUTION = 1010,
        HEADER_TAGS_VENDOR = 1011,
        HEADER_TAGS_GIF_OBSOLETE = 1012,
        HEADER_TAGS_XPM_OBSOLETE = 1013,
        HEADER_TAGS_LICENSE = 1014,
        HEADER_TAGS_PACKAGER = 1015,
        HEADER_TAGS_GROUP = 1016,
        HEADER_TAGS_CHANGELOG_INTERNAL = 1017,
        HEADER_TAGS_SOURCE = 1018,
        HEADER_TAGS_PATCH = 1019,
        HEADER_TAGS_URL = 1020,
        HEADER_TAGS_OS = 1021,
        HEADER_TAGS_ARCH = 1022,
        HEADER_TAGS_PRE_INSTALL_SCRIPTLET = 1023,
        HEADER_TAGS_POST_INSTALL_SCRIPTLET = 1024,
        HEADER_TAGS_PRE_UNINSTALL_SCRIPTLET = 1025,
        HEADER_TAGS_POST_UNINSTALL_SCRIPTLET = 1026,
        HEADER_TAGS_OLD_FILE_NAMES_OBSOLETE = 1027,
        HEADER_TAGS_FILE_SIZES = 1028,
        HEADER_TAGS_FILE_STATES = 1029,
        HEADER_TAGS_FILE_MODES = 1030,
        HEADER_TAGS_FILE_UIDS_INTERNAL = 1031,
        HEADER_TAGS_FILE_GIDS_INTERNAL = 1032,
        HEADER_TAGS_DEVICE_NUMBER = 1033,
        HEADER_TAGS_MTIMES = 1034,
        HEADER_TAGS_FILE_DIGESTS = 1035,
        HEADER_TAGS_LINK_TOS = 1036,
        HEADER_TAGS_FILE_FLAGS = 1037,
        HEADER_TAGS_ROOT_INTERNAL = 1038,
        HEADER_TAGS_FILE_OWNER = 1039,
        HEADER_TAGS_FILE_GROUP = 1040,
        HEADER_TAGS_EXCLUDE_INTERNAL = 1041,
        HEADER_TAGS_EXCLUSIVE_INTERNAL = 1042,
        HEADER_TAGS_ICON_OBSOLETE = 1043,
        HEADER_TAGS_SOURCE_RPM = 1044,
        HEADER_TAGS_FILE_VERIFY_FLAGS = 1045,
        HEADER_TAGS_ARCHIVE_SIZE = 1046,
        HEADER_TAGS_PROVIDE_NAME = 1047,
        HEADER_TAGS_REQUIRE_FLAGS = 1048,
        HEADER_TAGS_REQUIRE_NAME = 1049,
        HEADER_TAGS_REQUIRE_VERSION = 1050,
        HEADER_TAGS_NO_SOURCE = 1051,
        HEADER_TAGS_NO_PATCH = 1052,
        HEADER_TAGS_CONFLICT_FLAGS = 1053,
        HEADER_TAGS_CONFLICT_NAME = 1054,
        HEADER_TAGS_CONFLICT_VERSION = 1055,
        HEADER_TAGS_DEFAULT_PREFIX_INTERNAL = 1056,
        HEADER_TAGS_BUILD_ROOT_INTERNAL = 1057,
        HEADER_TAGS_INSTALL_PREFIX_INTERNAL = 1058,
        HEADER_TAGS_EXCLUDE_ARCH = 1059,
        HEADER_TAGS_EXCLUDE_OS = 1060,
        HEADER_TAGS_EXCLUSIVE_ARCH = 1061,
        HEADER_TAGS_EXCLUSIVE_OS = 1062,
        HEADER_TAGS_AUTOREQPROV_INTERNAL = 1063,
        HEADER_TAGS_RPM_VERSION = 1064,
        HEADER_TAGS_TRIGGER_SCRIPTS = 1065,
        HEADER_TAGS_TRIGGER_NAME = 1066,
        HEADER_TAGS_TRIGGER_VERSION = 1067,
        HEADER_TAGS_TRIGGER_FLAGS = 1068,
        HEADER_TAGS_TRIGGER_INDEX = 1069,
        HEADER_TAGS_VERIFY_SCRIPT = 1079,
        HEADER_TAGS_CHANGELOG_TIME = 1080,
        HEADER_TAGS_CHANGELOG_NAME = 1081,
        HEADER_TAGS_CHANGELOG_TEXT = 1082,
        HEADER_TAGS_BROKEN_MD5_INTERNAL = 1083,
        HEADER_TAGS_PREREQ_INTERNAL = 1084,
        HEADER_TAGS_PRE_INSTALL_INTERPRETER = 1085,
        HEADER_TAGS_POST_INSTALL_INTERPRETER = 1086,
        HEADER_TAGS_PRE_UNINSTALL_INTERPRETER = 1087,
        HEADER_TAGS_POST_UNINSTALL_INTERPRETER = 1088,
        HEADER_TAGS_BUILD_ARCHS = 1089,
        HEADER_TAGS_OBSOLETE_NAME = 1090,
        HEADER_TAGS_VERIFY_SCRIPT_PROG = 1091,
        HEADER_TAGS_TRIGGER_SCRIPT_PROG = 1092,
        HEADER_TAGS_DOC_DIR_INTERNAL = 1093,
        HEADER_TAGS_COOKIE = 1094,
        HEADER_TAGS_FILE_DEVICES = 1095,
        HEADER_TAGS_FILE_INODES = 1096,
        HEADER_TAGS_FILE_LANGS = 1097,
        HEADER_TAGS_PREFIXES = 1098,
        HEADER_TAGS_INSTALL_PREFIXES = 1099,
        HEADER_TAGS_TRIGGER_INSTALL_INTERNAL = 1100,
        HEADER_TAGS_TRIGGER_UNINSTALL_INTERNAL = 1101,
        HEADER_TAGS_TRIGGER_POST_UNINSTALL_INTERNAL = 1102,
        HEADER_TAGS_AUTOREQ_INTERNAL = 1103,
        HEADER_TAGS_AUTOPROV_INTERNAL = 1104,
        HEADER_TAGS_CAPABILITY_INTERNAL = 1105,
        HEADER_TAGS_SOURCE_PACKAGE = 1106,
        HEADER_TAGS_OLD_ORIG_FILENAMES_INTERNAL = 1107,
        HEADER_TAGS_BUILD_PREREQ_INTERNAL = 1108,
        HEADER_TAGS_BUILD_REQUIRES_INTERNAL = 1109,
        HEADER_TAGS_BUILD_CONFLICTS_INTERNAL = 1110,
        HEADER_TAGS_BUILD_MACROS_INTERNAL = 1111,
        HEADER_TAGS_PROVIDE_FLAGS = 1112,
        HEADER_TAGS_PROVIDE_VERSION = 1113,
        HEADER_TAGS_OBSOLETE_FLAGS = 1114,
        HEADER_TAGS_OBSOLETE_VERSION = 1115,
        HEADER_TAGS_DIR_INDEXES = 1116,
        HEADER_TAGS_BASE_NAMES = 1117,
        HEADER_TAGS_DIR_NAMES = 1118,
        HEADER_TAGS_ORIG_DIR_INDEXES = 1119,
        HEADER_TAGS_ORIG_BASE_NAMES = 1120,
        HEADER_TAGS_ORIG_DIR_NAMES = 1121,
        HEADER_TAGS_OPT_FLAGS = 1122,
        HEADER_TAGS_DIST_URL = 1123,
        HEADER_TAGS_PAYLOAD_FORMAT = 1124,
        HEADER_TAGS_PAYLOAD_COMPRESSOR = 1125,
        HEADER_TAGS_PAYLOAD_FLAGS = 1126,
        HEADER_TAGS_INSTALL_COLOR = 1127,
        HEADER_TAGS_INSTALL_TID = 1128,
        HEADER_TAGS_REMOVE_TID_OBSOLETE = 1129,
        HEADER_TAGS_SHA1_RHN_INTERNAL = 1130,
        HEADER_TAGS_RHN_PLATFORM_INTERNAL = 1131,
        HEADER_TAGS_PLATFORM = 1132,
        HEADER_TAGS_PATCHES_NAME_OBSOLETE = 1133,
        HEADER_TAGS_PATCHES_FLAGS_OBSOLETE = 1134,
        HEADER_TAGS_PATCHES_VERSION_OBSOLETE = 1135,
        HEADER_TAGS_CACHE_CTIME_INTERNAL = 1136,
        HEADER_TAGS_CACHE_PKG_PATH_INTERNAL = 1137,
        HEADER_TAGS_CACHE_PKG_SIZE_INTERNAL = 1138,
        HEADER_TAGS_CACHE_PKG_MTIME_INTERNAL = 1139,
        HEADER_TAGS_FILE_COLORS = 1140,
        HEADER_TAGS_FILE_CLASS = 1141,
        HEADER_TAGS_CLASS_DICT = 1142,
        HEADER_TAGS_FILE_DEPENDS_IDX = 1143,
        HEADER_TAGS_FILE_DEPENDS_NUM = 1144,
        HEADER_TAGS_DEPENDS_DICT = 1145,
        HEADER_TAGS_SOURCE_PKGID = 1146,
        HEADER_TAGS_FILE_CONTEXTS_OBSOLETE = 1147,
        HEADER_TAGS_FS_CONTEXTS_OBSOLETE = 1148,
        HEADER_TAGS_RE_CONTEXTS_OBSOLETE = 1149,
        HEADER_TAGS_POLICIES = 1150,
        HEADER_TAGS_PRE_TRANS = 1151,
        HEADER_TAGS_POST_TRANS = 1152,
        HEADER_TAGS_PRE_TRANS_PROG = 1153,
        HEADER_TAGS_POST_TRANS_PROG = 1154,
        HEADER_TAGS_DIST_TAG = 1155,
        HEADER_TAGS_OLD_SUGGESTS_NAME_OBSOLETE = 1156,
        HEADER_TAGS_OLD_SUGGESTS_VERSION_OBSOLETE = 1157,
        HEADER_TAGS_OLD_SUGGESTS_FLAGS_OBSOLETE = 1158,
        HEADER_TAGS_OLD_ENHANCES_NAME_OBSOLETE = 1159,
        HEADER_TAGS_OLD_ENHANCES_VERSION_OBSOLETE = 1160,
        HEADER_TAGS_OLD_ENHANCES_FLAGS_OBSOLETE = 1161,
        HEADER_TAGS_PRIORITY_UNIMPLEMENTED = 1162,
        HEADER_TAGS_CVSID_UNIMPLEMENTED = 1163,
        HEADER_TAGS_BLINK_PKGID_UNIMPLEMENTED = 1164,
        HEADER_TAGS_BLINK_HDRID_UNIMPLEMENTED = 1165,
        HEADER_TAGS_BLINK_NEVRA_UNIMPLEMENTED = 1166,
        HEADER_TAGS_FLINK_PKGID_UNIMPLEMENTED = 1167,
        HEADER_TAGS_FLINK_HDRID_UNIMPLEMENTED = 1168,
        HEADER_TAGS_FLINK_NEVRA_UNIMPLEMENTED = 1169,
        HEADER_TAGS_PACKAGE_ORIGIN_UNIMPLEMENTED = 1170,
        HEADER_TAGS_TRIGGER_PRE_INSTALL_INTERNAL = 1171,
        HEADER_TAGS_BUILD_SUGGESTS_UNIMPLEMENTED = 1172,
        HEADER_TAGS_BUILD_ENHANCES_UNIMPLEMENTED = 1173,
        HEADER_TAGS_SCRIPT_STATES_UNIMPLEMENTED = 1174,
        HEADER_TAGS_SCRIPT_METRICS_UNIMPLEMENTED = 1175,
        HEADER_TAGS_BUILD_CPU_CLOCK_UNIMPLEMENTED = 1176,
        HEADER_TAGS_FILE_DIGEST_ALGOS_UNIMPLEMENTED = 1177,
        HEADER_TAGS_VARIANTS_UNIMPLEMENTED = 1178,
        HEADER_TAGS_XMAJOR_UNIMPLEMENTED = 1179,
        HEADER_TAGS_XMINOR_UNIMPLEMENTED = 1180,
        HEADER_TAGS_REPO_TAG_UNIMPLEMENTED = 1181,
        HEADER_TAGS_KEYWORDS_UNIMPLEMENTED = 1182,
        HEADER_TAGS_BUILD_PLATFORMS_UNIMPLEMENTED = 1183,
        HEADER_TAGS_PACKAGE_COLOR_UNIMPLEMENTED = 1184,
        HEADER_TAGS_PACKAGE_PREF_COLOR_UNIMPLEMENTED = 1185,
        HEADER_TAGS_XATTRS_DICT_UNIMPLEMENTED = 1186,
        HEADER_TAGS_FILEX_ATTRSX_UNIMPLEMENTED = 1187,
        HEADER_TAGS_DEP_ATTRS_DICT_UNIMPLEMENTED = 1188,
        HEADER_TAGS_CONFLICT_ATTRSX_UNIMPLEMENTED = 1189,
        HEADER_TAGS_OBSOLETE_ATTRSX_UNIMPLEMENTED = 1190,
        HEADER_TAGS_PROVIDE_ATTRSX_UNIMPLEMENTED = 1191,
        HEADER_TAGS_REQUIRE_ATTRSX_UNIMPLEMENTED = 1192,
        HEADER_TAGS_BUILD_PROVIDES_UNIMPLEMENTED = 1193,
        HEADER_TAGS_BUILD_OBSOLETES_UNIMPLEMENTED = 1194,
        HEADER_TAGS_DB_INSTANCE = 1195,
        HEADER_TAGS_NVRA = 1196,
        HEADER_TAGS_FILE_NAMES = 5000,
        HEADER_TAGS_FILE_PROVIDE = 5001,
        HEADER_TAGS_FILE_REQUIRE = 5002,
        HEADER_TAGS_FS_NAMES_UNIMPLEMENTED = 5003,
        HEADER_TAGS_FS_SIZES_UNIMPLEMENTED = 5004,
        HEADER_TAGS_TRIGGER_CONDS = 5005,
        HEADER_TAGS_TRIGGER_TYPE = 5006,
        HEADER_TAGS_ORIG_FILE_NAMES = 5007,
        HEADER_TAGS_LONG_FILE_SIZES = 5008,
        HEADER_TAGS_LONG_SIZE = 5009,
        HEADER_TAGS_FILE_CAPS = 5010,
        HEADER_TAGS_FILE_DIGEST_ALGO = 5011,
        HEADER_TAGS_BUG_URL = 5012,
        HEADER_TAGS_EVR = 5013,
        HEADER_TAGS_NVR = 5014,
        HEADER_TAGS_NEVR = 5015,
        HEADER_TAGS_NEVRA = 5016,
        HEADER_TAGS_HEADER_COLOR = 5017,
        HEADER_TAGS_VERBOSE = 5018,
        HEADER_TAGS_EPOCH_NUM = 5019,
        HEADER_TAGS_PRE_INSTALL_FLAGS = 5020,
        HEADER_TAGS_POST_INSTALL_FLAGS = 5021,
        HEADER_TAGS_PRE_UNINSTALL_FLAGS = 5022,
        HEADER_TAGS_POST_UNINSTALL_FLAGS = 5023,
        HEADER_TAGS_PRE_TRANS_FLAGS = 5024,
        HEADER_TAGS_POST_TRANS_FLAGS = 5025,
        HEADER_TAGS_VERIFY_SCRIPT_FLAGS = 5026,
        HEADER_TAGS_TRIGGER_SCRIPT_FLAGS = 5027,
        HEADER_TAGS_COLLECTIONS_UNIMPLEMENTED = 5029,
        HEADER_TAGS_POLICY_NAMES = 5030,
        HEADER_TAGS_POLICY_TYPES = 5031,
        HEADER_TAGS_POLICY_TYPES_INDEXES = 5032,
        HEADER_TAGS_POLICY_FLAGS = 5033,
        HEADER_TAGS_VCS = 5034,
        HEADER_TAGS_ORDER_NAME = 5035,
        HEADER_TAGS_ORDER_VERSION = 5036,
        HEADER_TAGS_ORDER_FLAGS = 5037,
        HEADER_TAGS_MSSF_MANIFEST_UNIMPLEMENTED = 5038,
        HEADER_TAGS_MSSF_DOMAIN_UNIMPLEMENTED = 5039,
        HEADER_TAGS_INST_FILE_NAMES = 5040,
        HEADER_TAGS_REQUIRE_NEVRS = 5041,
        HEADER_TAGS_PROVIDE_NEVRS = 5042,
        HEADER_TAGS_OBSOLETE_NEVRS = 5043,
        HEADER_TAGS_CONFLICT_NEVRS = 5044,
        HEADER_TAGS_FILE_NLINKS = 5045,
        HEADER_TAGS_RECOMMEND_NAME = 5046,
        HEADER_TAGS_RECOMMEND_VERSION = 5047,
        HEADER_TAGS_RECOMMEND_FLAGS = 5048,
        HEADER_TAGS_SUGGEST_NAME = 5049,
        HEADER_TAGS_SUGGEST_VERSION = 5050,
        HEADER_TAGS_SUGGEST_FLAGS = 5051,
        HEADER_TAGS_SUPPLEMENT_NAME = 5052,
        HEADER_TAGS_SUPPLEMENT_VERSION = 5053,
        HEADER_TAGS_SUPPLEMENT_FLAGS = 5054,
        HEADER_TAGS_ENHANCE_NAME = 5055,
        HEADER_TAGS_ENHANCE_VERSION = 5056,
        HEADER_TAGS_ENHANCE_FLAGS = 5057,
        HEADER_TAGS_RECOMMEND_NEVRS = 5058,
        HEADER_TAGS_SUGGEST_NEVRS = 5059,
        HEADER_TAGS_SUPPLEMENT_NEVRS = 5060,
        HEADER_TAGS_ENHANCE_NEVRS = 5061,
        HEADER_TAGS_ENCODING = 5062,
        HEADER_TAGS_FILE_TRIGGER_INSTALL_INTERNAL = 5063,
        HEADER_TAGS_FILE_TRIGGER_UNINSTALL_INTERNAL = 5064,
        HEADER_TAGS_FILE_TRIGGER_POST_UNINSTALL_INTERNAL = 5065,
        HEADER_TAGS_FILE_TRIGGER_SCRIPTS = 5066,
        HEADER_TAGS_FILE_TRIGGER_SCRIPT_PROG = 5067,
        HEADER_TAGS_FILE_TRIGGER_SCRIPT_FLAGS = 5068,
        HEADER_TAGS_FILE_TRIGGER_NAME = 5069,
        HEADER_TAGS_FILE_TRIGGER_INDEX = 5070,
        HEADER_TAGS_FILE_TRIGGER_VERSION = 5071,
        HEADER_TAGS_FILE_TRIGGER_FLAGS = 5072,
        HEADER_TAGS_TRANS_FILE_TRIGGER_INSTALL_INTERNAL = 5073,
        HEADER_TAGS_TRANS_FILE_TRIGGER_UNINSTALL_INTERNAL = 5074,
        HEADER_TAGS_TRANS_FILE_TRIGGER_POST_UNINSTALL_INTERNAL = 5075,
        HEADER_TAGS_TRANS_FILE_TRIGGER_SCRIPTS = 5076,
        HEADER_TAGS_TRANS_FILE_TRIGGER_SCRIPT_PROG = 5077,
        HEADER_TAGS_TRANS_FILE_TRIGGER_SCRIPT_FLAGS = 5078,
        HEADER_TAGS_TRANS_FILE_TRIGGER_NAME = 5079,
        HEADER_TAGS_TRANS_FILE_TRIGGER_INDEX = 5080,
        HEADER_TAGS_TRANS_FILE_TRIGGER_VERSION = 5081,
        HEADER_TAGS_TRANS_FILE_TRIGGER_FLAGS = 5082,
        HEADER_TAGS_REMOVE_PATH_POSTFIXES_INTERNAL = 5083,
        HEADER_TAGS_FILE_TRIGGER_PRIORITIES = 5084,
        HEADER_TAGS_TRANS_FILE_TRIGGER_PRIORITIES = 5085,
        HEADER_TAGS_FILE_TRIGGER_CONDS = 5086,
        HEADER_TAGS_FILE_TRIGGER_TYPE = 5087,
        HEADER_TAGS_TRANS_FILE_TRIGGER_CONDS = 5088,
        HEADER_TAGS_TRANS_FILE_TRIGGER_TYPE = 5089,
        HEADER_TAGS_FILE_SIGNATURES = 5090,
        HEADER_TAGS_FILE_SIGNATURE_LENGTH = 5091,
        HEADER_TAGS_PAYLOAD_DIGEST = 5092,
        HEADER_TAGS_PAYLOAD_DIGEST_ALGO = 5093,
        HEADER_TAGS_AUTO_INSTALLED_UNIMPLEMENTED = 5094,
        HEADER_TAGS_IDENTITY_UNIMPLEMENTED = 5095,
        HEADER_TAGS_MODULARITY_LABEL = 5096,
        HEADER_TAGS_PAYLOAD_DIGEST_ALT = 5097,
        HEADER_TAGS_ARCH_SUFFIX = 5098,
        HEADER_TAGS_SPEC = 5099,
        HEADER_TAGS_TRANSLATION_URL = 5100,
        HEADER_TAGS_UPSTREAM_RELEASES = 5101,
        HEADER_TAGS_SOURCE_LICENSE_INTERNAL = 5102,
        HEADER_TAGS_PRE_UNTRANS = 5103,
        HEADER_TAGS_POST_UNTRANS = 5104,
        HEADER_TAGS_PRE_UNTRANS_PROG = 5105,
        HEADER_TAGS_POST_UNTRANS_PROG = 5106,
        HEADER_TAGS_PRE_UNTRANS_FLAGS = 5107,
        HEADER_TAGS_POST_UNTRANS_FLAGS = 5108,
        HEADER_TAGS_SYS_USERS = 5109
    };
    static bool _is_defined_header_tags_t(header_tags_t v);

private:
    static const std::set<header_tags_t> _values_header_tags_t;

public:

    enum operating_systems_t {
        OPERATING_SYSTEMS_LINUX = 1,
        OPERATING_SYSTEMS_IRIX = 2,
        OPERATING_SYSTEMS_NO_OS = 255
    };
    static bool _is_defined_operating_systems_t(operating_systems_t v);

private:
    static const std::set<operating_systems_t> _values_operating_systems_t;

public:

    enum record_types_t {
        RECORD_TYPES_NOT_IMPLEMENTED = 0,
        RECORD_TYPES_CHAR = 1,
        RECORD_TYPES_UINT8 = 2,
        RECORD_TYPES_UINT16 = 3,
        RECORD_TYPES_UINT32 = 4,
        RECORD_TYPES_UINT64 = 5,
        RECORD_TYPES_STRING = 6,
        RECORD_TYPES_BIN = 7,
        RECORD_TYPES_STRING_ARRAY = 8,
        RECORD_TYPES_I18N_STRING = 9
    };
    static bool _is_defined_record_types_t(record_types_t v);

private:
    static const std::set<record_types_t> _values_record_types_t;

public:

    enum rpm_types_t {
        RPM_TYPES_BINARY = 0,
        RPM_TYPES_SOURCE = 1
    };
    static bool _is_defined_rpm_types_t(rpm_types_t v);

private:
    static const std::set<rpm_types_t> _values_rpm_types_t;

public:

    enum signature_tags_t {
        SIGNATURE_TAGS_SIGNATURES = 62,
        SIGNATURE_TAGS_HEADER_IMMUTABLE = 63,
        SIGNATURE_TAGS_I18N_TABLE = 100,
        SIGNATURE_TAGS_BAD_SHA1_1_OBSOLETE = 264,
        SIGNATURE_TAGS_BAD_SHA1_2_OBSOLETE = 265,
        SIGNATURE_TAGS_DSA = 267,
        SIGNATURE_TAGS_RSA = 268,
        SIGNATURE_TAGS_SHA1 = 269,
        SIGNATURE_TAGS_LONG_SIZE = 270,
        SIGNATURE_TAGS_LONG_ARCHIVE_SIZE = 271,
        SIGNATURE_TAGS_SHA256 = 273,
        SIGNATURE_TAGS_FILE_SIGNATURES = 274,
        SIGNATURE_TAGS_FILE_SIGNATURE_LENGTH = 275,
        SIGNATURE_TAGS_VERITY_SIGNATURES = 276,
        SIGNATURE_TAGS_VERITY_SIGNATURE_ALGO = 277,
        SIGNATURE_TAGS_SIZE = 1000,
        SIGNATURE_TAGS_LE_MD5_1_OBSOLETE = 1001,
        SIGNATURE_TAGS_PGP = 1002,
        SIGNATURE_TAGS_LE_MD5_2_OBSOLETE = 1003,
        SIGNATURE_TAGS_MD5 = 1004,
        SIGNATURE_TAGS_GPG = 1005,
        SIGNATURE_TAGS_PGP5_OBSOLETE = 1006,
        SIGNATURE_TAGS_PAYLOAD_SIZE = 1007,
        SIGNATURE_TAGS_RESERVED_SPACE = 1008
    };
    static bool _is_defined_signature_tags_t(signature_tags_t v);

private:
    static const std::set<signature_tags_t> _values_signature_tags_t;

public:

    rpm_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, rpm_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~rpm_t();

    class dummy_t : public kaitai::kstruct {

    public:

        dummy_t(kaitai::kstream* p__io, rpm_t::header_t* p__parent = nullptr, rpm_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~dummy_t();

    private:
        rpm_t* m__root;
        rpm_t::header_t* m__parent;

    public:
        rpm_t* _root() const { return m__root; }
        rpm_t::header_t* _parent() const { return m__parent; }
    };

    /**
     * header structure used for both the "header" and "signature", but some tag
     * values have different meanings in signature and header (hence they use
     * different enums)
     */

    class header_t : public kaitai::kstruct {

    public:

        header_t(bool p_is_signature, kaitai::kstream* p__io, rpm_t* p__parent = nullptr, rpm_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t();

    private:
        bool f_is_header;
        bool m_is_header;

    public:
        bool is_header();

    private:
        std::unique_ptr<header_record_t> m_header_record;
        std::unique_ptr<std::vector<std::unique_ptr<header_index_record_t>>> m_index_records;
        std::unique_ptr<dummy_t> m_storage_section;
        bool m_is_signature;
        rpm_t* m__root;
        rpm_t* m__parent;
        std::string m__raw_storage_section;
        std::unique_ptr<kaitai::kstream> m__io__raw_storage_section;

    public:
        header_record_t* header_record() const { return m_header_record.get(); }
        std::vector<std::unique_ptr<header_index_record_t>>* index_records() const { return m_index_records.get(); }
        dummy_t* storage_section() const { return m_storage_section.get(); }
        bool is_signature() const { return m_is_signature; }
        rpm_t* _root() const { return m__root; }
        rpm_t* _parent() const { return m__parent; }
        std::string _raw_storage_section() const { return m__raw_storage_section; }
        kaitai::kstream* _io__raw_storage_section() const { return m__io__raw_storage_section.get(); }
    };

    class header_index_record_t : public kaitai::kstruct {

    public:

        header_index_record_t(kaitai::kstream* p__io, rpm_t::header_t* p__parent = nullptr, rpm_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_index_record_t();

    private:
        bool f_body;
        std::unique_ptr<kaitai::kstruct> m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:

    public:
        kaitai::kstruct* body();

    private:
        bool f_header_tag;
        header_tags_t m_header_tag;
        bool n_header_tag;

    public:
        bool _is_null_header_tag() { header_tag(); return n_header_tag; };

    private:

    public:
        header_tags_t header_tag();

    private:
        bool f_len_value;
        uint32_t m_len_value;
        bool n_len_value;

    public:
        bool _is_null_len_value() { len_value(); return n_len_value; };

    private:

    public:
        uint32_t len_value();

    private:
        bool f_num_values;
        uint32_t m_num_values;
        bool n_num_values;

    public:
        bool _is_null_num_values() { num_values(); return n_num_values; };

    private:

    public:
        uint32_t num_values();

    private:
        bool f_signature_tag;
        signature_tags_t m_signature_tag;
        bool n_signature_tag;

    public:
        bool _is_null_signature_tag() { signature_tag(); return n_signature_tag; };

    private:

    public:
        signature_tags_t signature_tag();

    private:
        uint32_t m_tag_raw;
        record_types_t m_record_type;
        uint32_t m_ofs_body;
        uint32_t m_count;
        rpm_t* m__root;
        rpm_t::header_t* m__parent;

    public:

        /**
         * prefer to access `signature_tag` and `header_tag` instead
         */
        uint32_t tag_raw() const { return m_tag_raw; }
        record_types_t record_type() const { return m_record_type; }
        uint32_t ofs_body() const { return m_ofs_body; }

        /**
         * internal; access `num_values` and `len_value` instead
         */
        uint32_t count() const { return m_count; }
        rpm_t* _root() const { return m__root; }
        rpm_t::header_t* _parent() const { return m__parent; }
    };

    class header_record_t : public kaitai::kstruct {

    public:

        header_record_t(kaitai::kstream* p__io, rpm_t::header_t* p__parent = nullptr, rpm_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_record_t();

    private:
        std::string m_magic;
        std::string m_reserved;
        uint32_t m_num_index_records;
        uint32_t m_len_storage_section;
        rpm_t* m__root;
        rpm_t::header_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        std::string reserved() const { return m_reserved; }
        uint32_t num_index_records() const { return m_num_index_records; }

        /**
         * Size of the storage area for the data
         * pointed to by the Index Records.
         */
        uint32_t len_storage_section() const { return m_len_storage_section; }
        rpm_t* _root() const { return m__root; }
        rpm_t::header_t* _parent() const { return m__parent; }
    };

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

    class lead_t : public kaitai::kstruct {

    public:

        lead_t(kaitai::kstream* p__io, rpm_t* p__parent = nullptr, rpm_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~lead_t();

    private:
        std::string m_magic;
        std::unique_ptr<rpm_version_t> m_version;
        rpm_types_t m_type;
        architectures_t m_architecture;
        std::string m_package_name;
        operating_systems_t m_os;
        uint16_t m_signature_type;
        std::string m_reserved;
        rpm_t* m__root;
        rpm_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        rpm_version_t* version() const { return m_version.get(); }
        rpm_types_t type() const { return m_type; }
        architectures_t architecture() const { return m_architecture; }
        std::string package_name() const { return m_package_name; }
        operating_systems_t os() const { return m_os; }
        uint16_t signature_type() const { return m_signature_type; }
        std::string reserved() const { return m_reserved; }
        rpm_t* _root() const { return m__root; }
        rpm_t* _parent() const { return m__parent; }
    };

    class record_type_bin_t : public kaitai::kstruct {

    public:

        record_type_bin_t(uint32_t p_len_value, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent = nullptr, rpm_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_type_bin_t();

    private:
        std::unique_ptr<std::vector<std::string>> m_values;
        uint32_t m_len_value;
        rpm_t* m__root;
        rpm_t::header_index_record_t* m__parent;

    public:
        std::vector<std::string>* values() const { return m_values.get(); }
        uint32_t len_value() const { return m_len_value; }
        rpm_t* _root() const { return m__root; }
        rpm_t::header_index_record_t* _parent() const { return m__parent; }
    };

    class record_type_string_t : public kaitai::kstruct {

    public:

        record_type_string_t(kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent = nullptr, rpm_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_type_string_t();

    private:
        std::unique_ptr<std::vector<std::string>> m_values;
        rpm_t* m__root;
        rpm_t::header_index_record_t* m__parent;

    public:
        std::vector<std::string>* values() const { return m_values.get(); }
        rpm_t* _root() const { return m__root; }
        rpm_t::header_index_record_t* _parent() const { return m__parent; }
    };

    class record_type_string_array_t : public kaitai::kstruct {

    public:

        record_type_string_array_t(uint32_t p_num_values, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent = nullptr, rpm_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_type_string_array_t();

    private:
        std::unique_ptr<std::vector<std::string>> m_values;
        uint32_t m_num_values;
        rpm_t* m__root;
        rpm_t::header_index_record_t* m__parent;

    public:
        std::vector<std::string>* values() const { return m_values.get(); }
        uint32_t num_values() const { return m_num_values; }
        rpm_t* _root() const { return m__root; }
        rpm_t::header_index_record_t* _parent() const { return m__parent; }
    };

    class record_type_uint16_t : public kaitai::kstruct {

    public:

        record_type_uint16_t(uint32_t p_num_values, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent = nullptr, rpm_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_type_uint16_t();

    private:
        std::unique_ptr<std::vector<uint16_t>> m_values;
        uint32_t m_num_values;
        rpm_t* m__root;
        rpm_t::header_index_record_t* m__parent;

    public:
        std::vector<uint16_t>* values() const { return m_values.get(); }
        uint32_t num_values() const { return m_num_values; }
        rpm_t* _root() const { return m__root; }
        rpm_t::header_index_record_t* _parent() const { return m__parent; }
    };

    class record_type_uint32_t : public kaitai::kstruct {

    public:

        record_type_uint32_t(uint32_t p_num_values, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent = nullptr, rpm_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_type_uint32_t();

    private:
        std::unique_ptr<std::vector<uint32_t>> m_values;
        uint32_t m_num_values;
        rpm_t* m__root;
        rpm_t::header_index_record_t* m__parent;

    public:
        std::vector<uint32_t>* values() const { return m_values.get(); }
        uint32_t num_values() const { return m_num_values; }
        rpm_t* _root() const { return m__root; }
        rpm_t::header_index_record_t* _parent() const { return m__parent; }
    };

    class record_type_uint64_t : public kaitai::kstruct {

    public:

        record_type_uint64_t(uint32_t p_num_values, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent = nullptr, rpm_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_type_uint64_t();

    private:
        std::unique_ptr<std::vector<uint64_t>> m_values;
        uint32_t m_num_values;
        rpm_t* m__root;
        rpm_t::header_index_record_t* m__parent;

    public:
        std::vector<uint64_t>* values() const { return m_values.get(); }
        uint32_t num_values() const { return m_num_values; }
        rpm_t* _root() const { return m__root; }
        rpm_t::header_index_record_t* _parent() const { return m__parent; }
    };

    class record_type_uint8_t : public kaitai::kstruct {

    public:

        record_type_uint8_t(uint32_t p_num_values, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent = nullptr, rpm_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_type_uint8_t();

    private:
        std::unique_ptr<std::vector<uint8_t>> m_values;
        uint32_t m_num_values;
        rpm_t* m__root;
        rpm_t::header_index_record_t* m__parent;

    public:
        std::vector<uint8_t>* values() const { return m_values.get(); }
        uint32_t num_values() const { return m_num_values; }
        rpm_t* _root() const { return m__root; }
        rpm_t::header_index_record_t* _parent() const { return m__parent; }
    };

    class rpm_version_t : public kaitai::kstruct {

    public:

        rpm_version_t(kaitai::kstream* p__io, rpm_t::lead_t* p__parent = nullptr, rpm_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~rpm_version_t();

    private:
        uint8_t m_major;
        uint8_t m_minor;
        rpm_t* m__root;
        rpm_t::lead_t* m__parent;

    public:

        /**
         * \sa https://github.com/rpm-software-management/rpm/blob/afad3167/lib/rpmlead.c#L102 Source
         */
        uint8_t major() const { return m_major; }
        uint8_t minor() const { return m_minor; }
        rpm_t* _root() const { return m__root; }
        rpm_t::lead_t* _parent() const { return m__parent; }
    };

    class signature_tags_step_t : public kaitai::kstruct {

    public:

        signature_tags_step_t(int32_t p_idx, int32_t p_prev_size_tag_idx, kaitai::kstream* p__io, rpm_t* p__parent = nullptr, rpm_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~signature_tags_step_t();

    private:
        bool f_size_tag_idx;
        int32_t m_size_tag_idx;

    public:
        int32_t size_tag_idx();

    private:
        int32_t m_idx;
        int32_t m_prev_size_tag_idx;
        rpm_t* m__root;
        rpm_t* m__parent;

    public:
        int32_t idx() const { return m_idx; }
        int32_t prev_size_tag_idx() const { return m_prev_size_tag_idx; }
        rpm_t* _root() const { return m__root; }
        rpm_t* _parent() const { return m__parent; }
    };

private:
    bool f_has_signature_size_tag;
    bool m_has_signature_size_tag;

public:
    bool has_signature_size_tag();

private:
    bool f_len_header;
    int32_t m_len_header;

public:
    int32_t len_header();

private:
    bool f_len_payload;
    int32_t m_len_payload;
    bool n_len_payload;

public:
    bool _is_null_len_payload() { len_payload(); return n_len_payload; };

private:

public:
    int32_t len_payload();

private:
    bool f_ofs_header;
    int32_t m_ofs_header;

public:
    int32_t ofs_header();

private:
    bool f_ofs_payload;
    int32_t m_ofs_payload;

public:
    int32_t ofs_payload();

private:
    bool f_payload;
    std::string m_payload;
    bool n_payload;

public:
    bool _is_null_payload() { payload(); return n_payload; };

private:

public:
    std::string payload();

private:
    bool f_signature_size_tag;
    header_index_record_t* m_signature_size_tag;
    bool n_signature_size_tag;

public:
    bool _is_null_signature_size_tag() { signature_size_tag(); return n_signature_size_tag; };

private:

public:
    header_index_record_t* signature_size_tag();

private:
    std::unique_ptr<lead_t> m_lead;
    std::unique_ptr<header_t> m_signature;
    std::string m_signature_padding;
    std::string m__unnamed3;
    bool n__unnamed3;

public:
    bool _is_null__unnamed3() { _unnamed3(); return n__unnamed3; };

private:
    std::unique_ptr<header_t> m_header;
    std::string m__unnamed5;
    bool n__unnamed5;

public:
    bool _is_null__unnamed5() { _unnamed5(); return n__unnamed5; };

private:
    std::unique_ptr<std::vector<std::unique_ptr<signature_tags_step_t>>> m_signature_tags_steps;
    rpm_t* m__root;
    kaitai::kstruct* m__parent;

public:
    lead_t* lead() const { return m_lead.get(); }
    header_t* signature() const { return m_signature.get(); }
    std::string signature_padding() const { return m_signature_padding; }
    std::string _unnamed3() const { return m__unnamed3; }
    header_t* header() const { return m_header.get(); }
    std::string _unnamed5() const { return m__unnamed5; }
    std::vector<std::unique_ptr<signature_tags_step_t>>* signature_tags_steps() const { return m_signature_tags_steps.get(); }
    rpm_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
