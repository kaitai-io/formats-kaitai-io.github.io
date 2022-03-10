# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package Rpm;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $OPERATING_SYSTEMS_LINUX = 1;
our $OPERATING_SYSTEMS_IRIX = 2;
our $OPERATING_SYSTEMS_NO_OS = 255;

our $SIGNATURE_TAGS_SIGNATURES = 62;
our $SIGNATURE_TAGS_HEADER_IMMUTABLE = 63;
our $SIGNATURE_TAGS_I18N_TABLE = 100;
our $SIGNATURE_TAGS_BAD_SHA1_1_OBSOLETE = 264;
our $SIGNATURE_TAGS_BAD_SHA1_2_OBSOLETE = 265;
our $SIGNATURE_TAGS_DSA = 267;
our $SIGNATURE_TAGS_RSA = 268;
our $SIGNATURE_TAGS_SHA1 = 269;
our $SIGNATURE_TAGS_LONG_SIZE = 270;
our $SIGNATURE_TAGS_LONG_ARCHIVE_SIZE = 271;
our $SIGNATURE_TAGS_SHA256 = 273;
our $SIGNATURE_TAGS_FILE_SIGNATURES = 274;
our $SIGNATURE_TAGS_FILE_SIGNATURE_LENGTH = 275;
our $SIGNATURE_TAGS_VERITY_SIGNATURES = 276;
our $SIGNATURE_TAGS_VERITY_SIGNATURE_ALGO = 277;
our $SIGNATURE_TAGS_SIZE = 1000;
our $SIGNATURE_TAGS_LE_MD5_1_OBSOLETE = 1001;
our $SIGNATURE_TAGS_PGP = 1002;
our $SIGNATURE_TAGS_LE_MD5_2_OBSOLETE = 1003;
our $SIGNATURE_TAGS_MD5 = 1004;
our $SIGNATURE_TAGS_GPG = 1005;
our $SIGNATURE_TAGS_PGP5_OBSOLETE = 1006;
our $SIGNATURE_TAGS_PAYLOAD_SIZE = 1007;
our $SIGNATURE_TAGS_RESERVED_SPACE = 1008;

our $RECORD_TYPES_NOT_IMPLEMENTED = 0;
our $RECORD_TYPES_CHAR = 1;
our $RECORD_TYPES_UINT8 = 2;
our $RECORD_TYPES_UINT16 = 3;
our $RECORD_TYPES_UINT32 = 4;
our $RECORD_TYPES_UINT64 = 5;
our $RECORD_TYPES_STRING = 6;
our $RECORD_TYPES_BIN = 7;
our $RECORD_TYPES_STRING_ARRAY = 8;
our $RECORD_TYPES_I18N_STRING = 9;

our $HEADER_TAGS_SIGNATURES = 62;
our $HEADER_TAGS_HEADER_IMMUTABLE = 63;
our $HEADER_TAGS_I18N_TABLE = 100;
our $HEADER_TAGS_NAME = 1000;
our $HEADER_TAGS_VERSION = 1001;
our $HEADER_TAGS_RELEASE = 1002;
our $HEADER_TAGS_EPOCH = 1003;
our $HEADER_TAGS_SUMMARY = 1004;
our $HEADER_TAGS_DESCRIPTION = 1005;
our $HEADER_TAGS_BUILD_TIME = 1006;
our $HEADER_TAGS_BUILD_HOST = 1007;
our $HEADER_TAGS_INSTALL_TIME = 1008;
our $HEADER_TAGS_SIZE = 1009;
our $HEADER_TAGS_DISTRIBUTION = 1010;
our $HEADER_TAGS_VENDOR = 1011;
our $HEADER_TAGS_GIF_OBSOLETE = 1012;
our $HEADER_TAGS_XPM_OBSOLETE = 1013;
our $HEADER_TAGS_LICENSE = 1014;
our $HEADER_TAGS_PACKAGER = 1015;
our $HEADER_TAGS_GROUP = 1016;
our $HEADER_TAGS_CHANGELOG_INTERNAL = 1017;
our $HEADER_TAGS_SOURCE = 1018;
our $HEADER_TAGS_PATCH = 1019;
our $HEADER_TAGS_URL = 1020;
our $HEADER_TAGS_OS = 1021;
our $HEADER_TAGS_ARCH = 1022;
our $HEADER_TAGS_PRE_INSTALL_SCRIPTLET = 1023;
our $HEADER_TAGS_POST_INSTALL_SCRIPTLET = 1024;
our $HEADER_TAGS_PRE_UNINSTALL_SCRIPTLET = 1025;
our $HEADER_TAGS_POST_UNINSTALL_SCRIPTLET = 1026;
our $HEADER_TAGS_OLD_FILE_NAMES_OBSOLETE = 1027;
our $HEADER_TAGS_FILE_SIZES = 1028;
our $HEADER_TAGS_FILE_STATES = 1029;
our $HEADER_TAGS_FILE_MODES = 1030;
our $HEADER_TAGS_FILE_UIDS_INTERNAL = 1031;
our $HEADER_TAGS_FILE_GIDS_INTERNAL = 1032;
our $HEADER_TAGS_DEVICE_NUMBER = 1033;
our $HEADER_TAGS_MTIMES = 1034;
our $HEADER_TAGS_FILE_DIGESTS = 1035;
our $HEADER_TAGS_LINK_TOS = 1036;
our $HEADER_TAGS_FILE_FLAGS = 1037;
our $HEADER_TAGS_ROOT_INTERNAL = 1038;
our $HEADER_TAGS_FILE_OWNER = 1039;
our $HEADER_TAGS_FILE_GROUP = 1040;
our $HEADER_TAGS_EXCLUDE_INTERNAL = 1041;
our $HEADER_TAGS_EXCLUSIVE_INTERNAL = 1042;
our $HEADER_TAGS_ICON_OBSOLETE = 1043;
our $HEADER_TAGS_SOURCE_RPM = 1044;
our $HEADER_TAGS_FILE_VERIFY_FLAGS = 1045;
our $HEADER_TAGS_ARCHIVE_SIZE = 1046;
our $HEADER_TAGS_PROVIDE_NAME = 1047;
our $HEADER_TAGS_REQUIRE_FLAGS = 1048;
our $HEADER_TAGS_REQUIRE_NAME = 1049;
our $HEADER_TAGS_REQUIRE_VERSION = 1050;
our $HEADER_TAGS_NO_SOURCE = 1051;
our $HEADER_TAGS_NO_PATCH = 1052;
our $HEADER_TAGS_CONFLICT_FLAGS = 1053;
our $HEADER_TAGS_CONFLICT_NAME = 1054;
our $HEADER_TAGS_CONFLICT_VERSION = 1055;
our $HEADER_TAGS_DEFAULT_PREFIX_INTERNAL = 1056;
our $HEADER_TAGS_BUILD_ROOT_INTERNAL = 1057;
our $HEADER_TAGS_INSTALL_PREFIX_INTERNAL = 1058;
our $HEADER_TAGS_EXCLUDE_ARCH = 1059;
our $HEADER_TAGS_EXCLUDE_OS = 1060;
our $HEADER_TAGS_EXCLUSIVE_ARCH = 1061;
our $HEADER_TAGS_EXCLUSIVE_OS = 1062;
our $HEADER_TAGS_AUTOREQPROV_INTERNAL = 1063;
our $HEADER_TAGS_RPM_VERSION = 1064;
our $HEADER_TAGS_TRIGGER_SCRIPTS = 1065;
our $HEADER_TAGS_TRIGGER_NAME = 1066;
our $HEADER_TAGS_TRIGGER_VERSION = 1067;
our $HEADER_TAGS_TRIGGER_FLAGS = 1068;
our $HEADER_TAGS_TRIGGER_INDEX = 1069;
our $HEADER_TAGS_VERIFY_SCRIPT = 1079;
our $HEADER_TAGS_CHANGELOG_TIME = 1080;
our $HEADER_TAGS_CHANGELOG_NAME = 1081;
our $HEADER_TAGS_CHANGELOG_TEXT = 1082;
our $HEADER_TAGS_BROKEN_MD5_INTERNAL = 1083;
our $HEADER_TAGS_PREREQ_INTERNAL = 1084;
our $HEADER_TAGS_PRE_INSTALL_INTERPRETER = 1085;
our $HEADER_TAGS_POST_INSTALL_INTERPRETER = 1086;
our $HEADER_TAGS_PRE_UNINSTALL_INTERPRETER = 1087;
our $HEADER_TAGS_POST_UNINSTALL_INTERPRETER = 1088;
our $HEADER_TAGS_BUILD_ARCHS = 1089;
our $HEADER_TAGS_OBSOLETE_NAME = 1090;
our $HEADER_TAGS_VERIFY_SCRIPT_PROG = 1091;
our $HEADER_TAGS_TRIGGER_SCRIPT_PROG = 1092;
our $HEADER_TAGS_DOC_DIR_INTERNAL = 1093;
our $HEADER_TAGS_COOKIE = 1094;
our $HEADER_TAGS_FILE_DEVICES = 1095;
our $HEADER_TAGS_FILE_INODES = 1096;
our $HEADER_TAGS_FILE_LANGS = 1097;
our $HEADER_TAGS_PREFIXES = 1098;
our $HEADER_TAGS_INSTALL_PREFIXES = 1099;
our $HEADER_TAGS_TRIGGER_INSTALL_INTERNAL = 1100;
our $HEADER_TAGS_TRIGGER_UNINSTALL_INTERNAL = 1101;
our $HEADER_TAGS_TRIGGER_POST_UNINSTALL_INTERNAL = 1102;
our $HEADER_TAGS_AUTOREQ_INTERNAL = 1103;
our $HEADER_TAGS_AUTOPROV_INTERNAL = 1104;
our $HEADER_TAGS_CAPABILITY_INTERNAL = 1105;
our $HEADER_TAGS_SOURCE_PACKAGE = 1106;
our $HEADER_TAGS_OLD_ORIG_FILENAMES_INTERNAL = 1107;
our $HEADER_TAGS_BUILD_PREREQ_INTERNAL = 1108;
our $HEADER_TAGS_BUILD_REQUIRES_INTERNAL = 1109;
our $HEADER_TAGS_BUILD_CONFLICTS_INTERNAL = 1110;
our $HEADER_TAGS_BUILD_MACROS_INTERNAL = 1111;
our $HEADER_TAGS_PROVIDE_FLAGS = 1112;
our $HEADER_TAGS_PROVIDE_VERSION = 1113;
our $HEADER_TAGS_OBSOLETE_FLAGS = 1114;
our $HEADER_TAGS_OBSOLETE_VERSION = 1115;
our $HEADER_TAGS_DIR_INDEXES = 1116;
our $HEADER_TAGS_BASE_NAMES = 1117;
our $HEADER_TAGS_DIR_NAMES = 1118;
our $HEADER_TAGS_ORIG_DIR_INDEXES = 1119;
our $HEADER_TAGS_ORIG_BASE_NAMES = 1120;
our $HEADER_TAGS_ORIG_DIR_NAMES = 1121;
our $HEADER_TAGS_OPT_FLAGS = 1122;
our $HEADER_TAGS_DIST_URL = 1123;
our $HEADER_TAGS_PAYLOAD_FORMAT = 1124;
our $HEADER_TAGS_PAYLOAD_COMPRESSOR = 1125;
our $HEADER_TAGS_PAYLOAD_FLAGS = 1126;
our $HEADER_TAGS_INSTALL_COLOR = 1127;
our $HEADER_TAGS_INSTALL_TID = 1128;
our $HEADER_TAGS_REMOVE_TID_OBSOLETE = 1129;
our $HEADER_TAGS_SHA1_RHN_INTERNAL = 1130;
our $HEADER_TAGS_RHN_PLATFORM_INTERNAL = 1131;
our $HEADER_TAGS_PLATFORM = 1132;
our $HEADER_TAGS_PATCHES_NAME_OBSOLETE = 1133;
our $HEADER_TAGS_PATCHES_FLAGS_OBSOLETE = 1134;
our $HEADER_TAGS_PATCHES_VERSION_OBSOLETE = 1135;
our $HEADER_TAGS_CACHE_CTIME_INTERNAL = 1136;
our $HEADER_TAGS_CACHE_PKG_PATH_INTERNAL = 1137;
our $HEADER_TAGS_CACHE_PKG_SIZE_INTERNAL = 1138;
our $HEADER_TAGS_CACHE_PKG_MTIME_INTERNAL = 1139;
our $HEADER_TAGS_FILE_COLORS = 1140;
our $HEADER_TAGS_FILE_CLASS = 1141;
our $HEADER_TAGS_CLASS_DICT = 1142;
our $HEADER_TAGS_FILE_DEPENDS_IDX = 1143;
our $HEADER_TAGS_FILE_DEPENDS_NUM = 1144;
our $HEADER_TAGS_DEPENDS_DICT = 1145;
our $HEADER_TAGS_SOURCE_PKGID = 1146;
our $HEADER_TAGS_FILE_CONTEXTS_OBSOLETE = 1147;
our $HEADER_TAGS_FS_CONTEXTS_OBSOLETE = 1148;
our $HEADER_TAGS_RE_CONTEXTS_OBSOLETE = 1149;
our $HEADER_TAGS_POLICIES = 1150;
our $HEADER_TAGS_PRE_TRANS = 1151;
our $HEADER_TAGS_POST_TRANS = 1152;
our $HEADER_TAGS_PRE_TRANS_PROG = 1153;
our $HEADER_TAGS_POST_TRANS_PROG = 1154;
our $HEADER_TAGS_DIST_TAG = 1155;
our $HEADER_TAGS_OLD_SUGGESTS_NAME_OBSOLETE = 1156;
our $HEADER_TAGS_OLD_SUGGESTS_VERSION_OBSOLETE = 1157;
our $HEADER_TAGS_OLD_SUGGESTS_FLAGS_OBSOLETE = 1158;
our $HEADER_TAGS_OLD_ENHANCES_NAME_OBSOLETE = 1159;
our $HEADER_TAGS_OLD_ENHANCES_VERSION_OBSOLETE = 1160;
our $HEADER_TAGS_OLD_ENHANCES_FLAGS_OBSOLETE = 1161;
our $HEADER_TAGS_PRIORITY_UNIMPLEMENTED = 1162;
our $HEADER_TAGS_CVSID_UNIMPLEMENTED = 1163;
our $HEADER_TAGS_BLINK_PKGID_UNIMPLEMENTED = 1164;
our $HEADER_TAGS_BLINK_HDRID_UNIMPLEMENTED = 1165;
our $HEADER_TAGS_BLINK_NEVRA_UNIMPLEMENTED = 1166;
our $HEADER_TAGS_FLINK_PKGID_UNIMPLEMENTED = 1167;
our $HEADER_TAGS_FLINK_HDRID_UNIMPLEMENTED = 1168;
our $HEADER_TAGS_FLINK_NEVRA_UNIMPLEMENTED = 1169;
our $HEADER_TAGS_PACKAGE_ORIGIN_UNIMPLEMENTED = 1170;
our $HEADER_TAGS_TRIGGER_PRE_INSTALL_INTERNAL = 1171;
our $HEADER_TAGS_BUILD_SUGGESTS_UNIMPLEMENTED = 1172;
our $HEADER_TAGS_BUILD_ENHANCES_UNIMPLEMENTED = 1173;
our $HEADER_TAGS_SCRIPT_STATES_UNIMPLEMENTED = 1174;
our $HEADER_TAGS_SCRIPT_METRICS_UNIMPLEMENTED = 1175;
our $HEADER_TAGS_BUILD_CPU_CLOCK_UNIMPLEMENTED = 1176;
our $HEADER_TAGS_FILE_DIGEST_ALGOS_UNIMPLEMENTED = 1177;
our $HEADER_TAGS_VARIANTS_UNIMPLEMENTED = 1178;
our $HEADER_TAGS_XMAJOR_UNIMPLEMENTED = 1179;
our $HEADER_TAGS_XMINOR_UNIMPLEMENTED = 1180;
our $HEADER_TAGS_REPO_TAG_UNIMPLEMENTED = 1181;
our $HEADER_TAGS_KEYWORDS_UNIMPLEMENTED = 1182;
our $HEADER_TAGS_BUILD_PLATFORMS_UNIMPLEMENTED = 1183;
our $HEADER_TAGS_PACKAGE_COLOR_UNIMPLEMENTED = 1184;
our $HEADER_TAGS_PACKAGE_PREF_COLOR_UNIMPLEMENTED = 1185;
our $HEADER_TAGS_XATTRS_DICT_UNIMPLEMENTED = 1186;
our $HEADER_TAGS_FILEX_ATTRSX_UNIMPLEMENTED = 1187;
our $HEADER_TAGS_DEP_ATTRS_DICT_UNIMPLEMENTED = 1188;
our $HEADER_TAGS_CONFLICT_ATTRSX_UNIMPLEMENTED = 1189;
our $HEADER_TAGS_OBSOLETE_ATTRSX_UNIMPLEMENTED = 1190;
our $HEADER_TAGS_PROVIDE_ATTRSX_UNIMPLEMENTED = 1191;
our $HEADER_TAGS_REQUIRE_ATTRSX_UNIMPLEMENTED = 1192;
our $HEADER_TAGS_BUILD_PROVIDES_UNIMPLEMENTED = 1193;
our $HEADER_TAGS_BUILD_OBSOLETES_UNIMPLEMENTED = 1194;
our $HEADER_TAGS_DB_INSTANCE = 1195;
our $HEADER_TAGS_NVRA = 1196;
our $HEADER_TAGS_FILE_NAMES = 5000;
our $HEADER_TAGS_FILE_PROVIDE = 5001;
our $HEADER_TAGS_FILE_REQUIRE = 5002;
our $HEADER_TAGS_FS_NAMES_UNIMPLEMENTED = 5003;
our $HEADER_TAGS_FS_SIZES_UNIMPLEMENTED = 5004;
our $HEADER_TAGS_TRIGGER_CONDS = 5005;
our $HEADER_TAGS_TRIGGER_TYPE = 5006;
our $HEADER_TAGS_ORIG_FILE_NAMES = 5007;
our $HEADER_TAGS_LONG_FILE_SIZES = 5008;
our $HEADER_TAGS_LONG_SIZE = 5009;
our $HEADER_TAGS_FILE_CAPS = 5010;
our $HEADER_TAGS_FILE_DIGEST_ALGO = 5011;
our $HEADER_TAGS_BUG_URL = 5012;
our $HEADER_TAGS_EVR = 5013;
our $HEADER_TAGS_NVR = 5014;
our $HEADER_TAGS_NEVR = 5015;
our $HEADER_TAGS_NEVRA = 5016;
our $HEADER_TAGS_HEADER_COLOR = 5017;
our $HEADER_TAGS_VERBOSE = 5018;
our $HEADER_TAGS_EPOCH_NUM = 5019;
our $HEADER_TAGS_PRE_INSTALL_FLAGS = 5020;
our $HEADER_TAGS_POST_INSTALL_FLAGS = 5021;
our $HEADER_TAGS_PRE_UNINSTALL_FLAGS = 5022;
our $HEADER_TAGS_POST_UNINSTALL_FLAGS = 5023;
our $HEADER_TAGS_PRE_TRANS_FLAGS = 5024;
our $HEADER_TAGS_POST_TRANS_FLAGS = 5025;
our $HEADER_TAGS_VERIFY_SCRIPT_FLAGS = 5026;
our $HEADER_TAGS_TRIGGER_SCRIPT_FLAGS = 5027;
our $HEADER_TAGS_COLLECTIONS_UNIMPLEMENTED = 5029;
our $HEADER_TAGS_POLICY_NAMES = 5030;
our $HEADER_TAGS_POLICY_TYPES = 5031;
our $HEADER_TAGS_POLICY_TYPES_INDEXES = 5032;
our $HEADER_TAGS_POLICY_FLAGS = 5033;
our $HEADER_TAGS_VCS = 5034;
our $HEADER_TAGS_ORDER_NAME = 5035;
our $HEADER_TAGS_ORDER_VERSION = 5036;
our $HEADER_TAGS_ORDER_FLAGS = 5037;
our $HEADER_TAGS_MSSF_MANIFEST_UNIMPLEMENTED = 5038;
our $HEADER_TAGS_MSSF_DOMAIN_UNIMPLEMENTED = 5039;
our $HEADER_TAGS_INST_FILE_NAMES = 5040;
our $HEADER_TAGS_REQUIRE_NEVRS = 5041;
our $HEADER_TAGS_PROVIDE_NEVRS = 5042;
our $HEADER_TAGS_OBSOLETE_NEVRS = 5043;
our $HEADER_TAGS_CONFLICT_NEVRS = 5044;
our $HEADER_TAGS_FILE_NLINKS = 5045;
our $HEADER_TAGS_RECOMMEND_NAME = 5046;
our $HEADER_TAGS_RECOMMEND_VERSION = 5047;
our $HEADER_TAGS_RECOMMEND_FLAGS = 5048;
our $HEADER_TAGS_SUGGEST_NAME = 5049;
our $HEADER_TAGS_SUGGEST_VERSION = 5050;
our $HEADER_TAGS_SUGGEST_FLAGS = 5051;
our $HEADER_TAGS_SUPPLEMENT_NAME = 5052;
our $HEADER_TAGS_SUPPLEMENT_VERSION = 5053;
our $HEADER_TAGS_SUPPLEMENT_FLAGS = 5054;
our $HEADER_TAGS_ENHANCE_NAME = 5055;
our $HEADER_TAGS_ENHANCE_VERSION = 5056;
our $HEADER_TAGS_ENHANCE_FLAGS = 5057;
our $HEADER_TAGS_RECOMMEND_NEVRS = 5058;
our $HEADER_TAGS_SUGGEST_NEVRS = 5059;
our $HEADER_TAGS_SUPPLEMENT_NEVRS = 5060;
our $HEADER_TAGS_ENHANCE_NEVRS = 5061;
our $HEADER_TAGS_ENCODING = 5062;
our $HEADER_TAGS_FILE_TRIGGER_INSTALL_INTERNAL = 5063;
our $HEADER_TAGS_FILE_TRIGGER_UNINSTALL_INTERNAL = 5064;
our $HEADER_TAGS_FILE_TRIGGER_POST_UNINSTALL_INTERNAL = 5065;
our $HEADER_TAGS_FILE_TRIGGER_SCRIPTS = 5066;
our $HEADER_TAGS_FILE_TRIGGER_SCRIPT_PROG = 5067;
our $HEADER_TAGS_FILE_TRIGGER_SCRIPT_FLAGS = 5068;
our $HEADER_TAGS_FILE_TRIGGER_NAME = 5069;
our $HEADER_TAGS_FILE_TRIGGER_INDEX = 5070;
our $HEADER_TAGS_FILE_TRIGGER_VERSION = 5071;
our $HEADER_TAGS_FILE_TRIGGER_FLAGS = 5072;
our $HEADER_TAGS_TRANS_FILE_TRIGGER_INSTALL_INTERNAL = 5073;
our $HEADER_TAGS_TRANS_FILE_TRIGGER_UNINSTALL_INTERNAL = 5074;
our $HEADER_TAGS_TRANS_FILE_TRIGGER_POST_UNINSTALL_INTERNAL = 5075;
our $HEADER_TAGS_TRANS_FILE_TRIGGER_SCRIPTS = 5076;
our $HEADER_TAGS_TRANS_FILE_TRIGGER_SCRIPT_PROG = 5077;
our $HEADER_TAGS_TRANS_FILE_TRIGGER_SCRIPT_FLAGS = 5078;
our $HEADER_TAGS_TRANS_FILE_TRIGGER_NAME = 5079;
our $HEADER_TAGS_TRANS_FILE_TRIGGER_INDEX = 5080;
our $HEADER_TAGS_TRANS_FILE_TRIGGER_VERSION = 5081;
our $HEADER_TAGS_TRANS_FILE_TRIGGER_FLAGS = 5082;
our $HEADER_TAGS_REMOVE_PATH_POSTFIXES_INTERNAL = 5083;
our $HEADER_TAGS_FILE_TRIGGER_PRIORITIES = 5084;
our $HEADER_TAGS_TRANS_FILE_TRIGGER_PRIORITIES = 5085;
our $HEADER_TAGS_FILE_TRIGGER_CONDS = 5086;
our $HEADER_TAGS_FILE_TRIGGER_TYPE = 5087;
our $HEADER_TAGS_TRANS_FILE_TRIGGER_CONDS = 5088;
our $HEADER_TAGS_TRANS_FILE_TRIGGER_TYPE = 5089;
our $HEADER_TAGS_FILE_SIGNATURES = 5090;
our $HEADER_TAGS_FILE_SIGNATURE_LENGTH = 5091;
our $HEADER_TAGS_PAYLOAD_DIGEST = 5092;
our $HEADER_TAGS_PAYLOAD_DIGEST_ALGO = 5093;
our $HEADER_TAGS_AUTO_INSTALLED_UNIMPLEMENTED = 5094;
our $HEADER_TAGS_IDENTITY_UNIMPLEMENTED = 5095;
our $HEADER_TAGS_MODULARITY_LABEL = 5096;
our $HEADER_TAGS_PAYLOAD_DIGEST_ALT = 5097;
our $HEADER_TAGS_ARCH_SUFFIX = 5098;

our $RPM_TYPES_BINARY = 0;
our $RPM_TYPES_SOURCE = 1;

our $ARCHITECTURES_X86 = 1;
our $ARCHITECTURES_ALPHA = 2;
our $ARCHITECTURES_SPARC = 3;
our $ARCHITECTURES_MIPS = 4;
our $ARCHITECTURES_PPC = 5;
our $ARCHITECTURES_M68K = 6;
our $ARCHITECTURES_SGI = 7;
our $ARCHITECTURES_RS6000 = 8;
our $ARCHITECTURES_IA64 = 9;
our $ARCHITECTURES_SPARC64 = 10;
our $ARCHITECTURES_MIPS64 = 11;
our $ARCHITECTURES_ARM = 12;
our $ARCHITECTURES_M68K_MINT = 13;
our $ARCHITECTURES_S390 = 14;
our $ARCHITECTURES_S390X = 15;
our $ARCHITECTURES_PPC64 = 16;
our $ARCHITECTURES_SH = 17;
our $ARCHITECTURES_XTENSA = 18;
our $ARCHITECTURES_AARCH64 = 19;
our $ARCHITECTURES_MIPS_R6 = 20;
our $ARCHITECTURES_MIPS64_R6 = 21;
our $ARCHITECTURES_RISCV = 22;
our $ARCHITECTURES_LOONGARCH64 = 23;
our $ARCHITECTURES_NO_ARCH = 255;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{lead} = Rpm::Lead->new($self->{_io}, $self, $self->{_root});
    $self->{signature} = Rpm::Header->new($self->{_io}, $self, $self->{_root});
    $self->{signature_padding} = $self->{_io}->read_bytes((-($self->_io()->pos()) % 8));
    if ($self->ofs_header() < 0) {
        $self->{_unnamed3} = $self->{_io}->read_bytes(0);
    }
    $self->{header} = Rpm::Header->new($self->{_io}, $self, $self->{_root});
    if ($self->ofs_payload() < 0) {
        $self->{_unnamed5} = $self->{_io}->read_bytes(0);
    }
    $self->{signature_tags_steps} = ();
    my $n_signature_tags_steps = $self->signature()->header_record()->num_index_records();
    for (my $i = 0; $i < $n_signature_tags_steps; $i++) {
        $self->{signature_tags_steps}[$i] = Rpm::SignatureTagsStep->new($self->{_io}, $self, $self->{_root});
    }
}

sub has_signature_size_tag {
    my ($self) = @_;
    return $self->{has_signature_size_tag} if ($self->{has_signature_size_tag});
    $self->{has_signature_size_tag} = @{$self->signature_tags_steps()}[-1]->size_tag_idx() != -1;
    return $self->{has_signature_size_tag};
}

sub signature_size_tag {
    my ($self) = @_;
    return $self->{signature_size_tag} if ($self->{signature_size_tag});
    if ($self->has_signature_size_tag()) {
        $self->{signature_size_tag} = @{$self->signature()->index_records()}[@{$self->signature_tags_steps()}[-1]->size_tag_idx()];
    }
    return $self->{signature_size_tag};
}

sub len_payload {
    my ($self) = @_;
    return $self->{len_payload} if ($self->{len_payload});
    if ($self->has_signature_size_tag()) {
        $self->{len_payload} = (@{$self->signature_size_tag()->body()->values()}[0] - $self->len_header());
    }
    return $self->{len_payload};
}

sub payload {
    my ($self) = @_;
    return $self->{payload} if ($self->{payload});
    if ($self->has_signature_size_tag()) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->ofs_payload());
        $self->{payload} = $self->{_io}->read_bytes($self->len_payload());
        $self->{_io}->seek($_pos);
    }
    return $self->{payload};
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header} if ($self->{len_header});
    $self->{len_header} = ($self->ofs_payload() - $self->ofs_header());
    return $self->{len_header};
}

sub ofs_header {
    my ($self) = @_;
    return $self->{ofs_header} if ($self->{ofs_header});
    $self->{ofs_header} = $self->_io()->pos();
    return $self->{ofs_header};
}

sub ofs_payload {
    my ($self) = @_;
    return $self->{ofs_payload} if ($self->{ofs_payload});
    $self->{ofs_payload} = $self->_io()->pos();
    return $self->{ofs_payload};
}

sub lead {
    my ($self) = @_;
    return $self->{lead};
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub signature_padding {
    my ($self) = @_;
    return $self->{signature_padding};
}

sub _unnamed3 {
    my ($self) = @_;
    return $self->{_unnamed3};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub _unnamed5 {
    my ($self) = @_;
    return $self->{_unnamed5};
}

sub signature_tags_steps {
    my ($self) = @_;
    return $self->{signature_tags_steps};
}

########################################################################
package Rpm::RecordTypeStringArray;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{values} = ();
    my $n_values = $self->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        $self->{values}[$i] = Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    }
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

sub num_values {
    my ($self) = @_;
    return $self->{num_values};
}

########################################################################
package Rpm::Lead;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{version} = Rpm::RpmVersion->new($self->{_io}, $self, $self->{_root});
    $self->{type} = $self->{_io}->read_u2be();
    $self->{architecture} = $self->{_io}->read_u2be();
    $self->{package_name} = Encode::decode("UTF-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(66), 0, 0));
    $self->{os} = $self->{_io}->read_u2be();
    $self->{signature_type} = $self->{_io}->read_u2be();
    $self->{reserved} = $self->{_io}->read_bytes(16);
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub architecture {
    my ($self) = @_;
    return $self->{architecture};
}

sub package_name {
    my ($self) = @_;
    return $self->{package_name};
}

sub os {
    my ($self) = @_;
    return $self->{os};
}

sub signature_type {
    my ($self) = @_;
    return $self->{signature_type};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package Rpm::RecordTypeString;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{values} = ();
    my $n_values = 1;
    for (my $i = 0; $i < $n_values; $i++) {
        $self->{values}[$i] = Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    }
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

########################################################################
package Rpm::SignatureTagsStep;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

}

sub size_tag_idx {
    my ($self) = @_;
    return $self->{size_tag_idx} if ($self->{size_tag_idx});
    $self->{size_tag_idx} = ($self->prev_size_tag_idx() != -1 ? $self->prev_size_tag_idx() : ( ((@{$self->_parent()->signature()->index_records()}[$self->idx()]->signature_tag() == $Rpm::SIGNATURE_TAGS_SIZE) && (@{$self->_parent()->signature()->index_records()}[$self->idx()]->record_type() == $Rpm::RECORD_TYPES_UINT32) && (@{$self->_parent()->signature()->index_records()}[$self->idx()]->num_values() >= 1))  ? $self->idx() : -1));
    return $self->{size_tag_idx};
}

sub idx {
    my ($self) = @_;
    return $self->{idx};
}

sub prev_size_tag_idx {
    my ($self) = @_;
    return $self->{prev_size_tag_idx};
}

########################################################################
package Rpm::RecordTypeUint32;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{values} = ();
    my $n_values = $self->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        $self->{values}[$i] = $self->{_io}->read_u4be();
    }
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

sub num_values {
    my ($self) = @_;
    return $self->{num_values};
}

########################################################################
package Rpm::RecordTypeUint16;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{values} = ();
    my $n_values = $self->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        $self->{values}[$i] = $self->{_io}->read_u2be();
    }
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

sub num_values {
    my ($self) = @_;
    return $self->{num_values};
}

########################################################################
package Rpm::HeaderIndexRecord;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{tag_raw} = $self->{_io}->read_u4be();
    $self->{record_type} = $self->{_io}->read_u4be();
    $self->{ofs_body} = $self->{_io}->read_u4be();
    $self->{count} = $self->{_io}->read_u4be();
}

sub num_values {
    my ($self) = @_;
    return $self->{num_values} if ($self->{num_values});
    if ($self->record_type() != $Rpm::RECORD_TYPES_BIN) {
        $self->{num_values} = $self->count();
    }
    return $self->{num_values};
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    my $io = $self->_parent()->storage_section()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_body());
    my $_on = $self->record_type();
    if ($_on == $Rpm::RECORD_TYPES_UINT32) {
        $self->{body} = Rpm::RecordTypeUint32->new($io, $self, $self->{_root});
    }
    elsif ($_on == $Rpm::RECORD_TYPES_UINT64) {
        $self->{body} = Rpm::RecordTypeUint64->new($io, $self, $self->{_root});
    }
    elsif ($_on == $Rpm::RECORD_TYPES_BIN) {
        $self->{body} = Rpm::RecordTypeBin->new($io, $self, $self->{_root});
    }
    elsif ($_on == $Rpm::RECORD_TYPES_STRING) {
        $self->{body} = Rpm::RecordTypeString->new($io, $self, $self->{_root});
    }
    elsif ($_on == $Rpm::RECORD_TYPES_UINT8) {
        $self->{body} = Rpm::RecordTypeUint8->new($io, $self, $self->{_root});
    }
    elsif ($_on == $Rpm::RECORD_TYPES_I18N_STRING) {
        $self->{body} = Rpm::RecordTypeStringArray->new($io, $self, $self->{_root});
    }
    elsif ($_on == $Rpm::RECORD_TYPES_UINT16) {
        $self->{body} = Rpm::RecordTypeUint16->new($io, $self, $self->{_root});
    }
    elsif ($_on == $Rpm::RECORD_TYPES_CHAR) {
        $self->{body} = Rpm::RecordTypeUint8->new($io, $self, $self->{_root});
    }
    elsif ($_on == $Rpm::RECORD_TYPES_STRING_ARRAY) {
        $self->{body} = Rpm::RecordTypeStringArray->new($io, $self, $self->{_root});
    }
    $io->seek($_pos);
    return $self->{body};
}

sub signature_tag {
    my ($self) = @_;
    return $self->{signature_tag} if ($self->{signature_tag});
    if ($self->_parent()->is_signature()) {
        $self->{signature_tag} = $self->tag_raw();
    }
    return $self->{signature_tag};
}

sub len_value {
    my ($self) = @_;
    return $self->{len_value} if ($self->{len_value});
    if ($self->record_type() == $Rpm::RECORD_TYPES_BIN) {
        $self->{len_value} = $self->count();
    }
    return $self->{len_value};
}

sub header_tag {
    my ($self) = @_;
    return $self->{header_tag} if ($self->{header_tag});
    if ($self->_parent()->is_header()) {
        $self->{header_tag} = $self->tag_raw();
    }
    return $self->{header_tag};
}

sub tag_raw {
    my ($self) = @_;
    return $self->{tag_raw};
}

sub record_type {
    my ($self) = @_;
    return $self->{record_type};
}

sub ofs_body {
    my ($self) = @_;
    return $self->{ofs_body};
}

sub count {
    my ($self) = @_;
    return $self->{count};
}

########################################################################
package Rpm::RpmVersion;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{major} = $self->{_io}->read_u1();
    $self->{minor} = $self->{_io}->read_u1();
}

sub major {
    my ($self) = @_;
    return $self->{major};
}

sub minor {
    my ($self) = @_;
    return $self->{minor};
}

########################################################################
package Rpm::Dummy;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

}

########################################################################
package Rpm::RecordTypeUint8;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{values} = ();
    my $n_values = $self->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        $self->{values}[$i] = $self->{_io}->read_u1();
    }
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

sub num_values {
    my ($self) = @_;
    return $self->{num_values};
}

########################################################################
package Rpm::RecordTypeUint64;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{values} = ();
    my $n_values = $self->num_values();
    for (my $i = 0; $i < $n_values; $i++) {
        $self->{values}[$i] = $self->{_io}->read_u8be();
    }
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

sub num_values {
    my ($self) = @_;
    return $self->{num_values};
}

########################################################################
package Rpm::RecordTypeBin;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{values} = ();
    my $n_values = 1;
    for (my $i = 0; $i < $n_values; $i++) {
        $self->{values}[$i] = $self->{_io}->read_bytes($self->len_value());
    }
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

sub len_value {
    my ($self) = @_;
    return $self->{len_value};
}

########################################################################
package Rpm::HeaderRecord;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{num_index_records} = $self->{_io}->read_u4be();
    $self->{len_storage_section} = $self->{_io}->read_u4be();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub num_index_records {
    my ($self) = @_;
    return $self->{num_index_records};
}

sub len_storage_section {
    my ($self) = @_;
    return $self->{len_storage_section};
}

########################################################################
package Rpm::Header;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{header_record} = Rpm::HeaderRecord->new($self->{_io}, $self, $self->{_root});
    $self->{index_records} = ();
    my $n_index_records = $self->header_record()->num_index_records();
    for (my $i = 0; $i < $n_index_records; $i++) {
        $self->{index_records}[$i] = Rpm::HeaderIndexRecord->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_raw_storage_section} = $self->{_io}->read_bytes($self->header_record()->len_storage_section());
    my $io__raw_storage_section = IO::KaitaiStruct::Stream->new($self->{_raw_storage_section});
    $self->{storage_section} = Rpm::Dummy->new($io__raw_storage_section, $self, $self->{_root});
}

sub is_header {
    my ($self) = @_;
    return $self->{is_header} if ($self->{is_header});
    $self->{is_header} = !($self->is_signature());
    return $self->{is_header};
}

sub header_record {
    my ($self) = @_;
    return $self->{header_record};
}

sub index_records {
    my ($self) = @_;
    return $self->{index_records};
}

sub storage_section {
    my ($self) = @_;
    return $self->{storage_section};
}

sub is_signature {
    my ($self) = @_;
    return $self->{is_signature};
}

sub _raw_storage_section {
    my ($self) = @_;
    return $self->{_raw_storage_section};
}

1;
