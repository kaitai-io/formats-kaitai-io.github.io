// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "rpm.h"
#include "kaitai/exceptions.h"
const std::set<rpm_t::architectures_t> rpm_t::_values_architectures_t{
    rpm_t::ARCHITECTURES_X86,
    rpm_t::ARCHITECTURES_ALPHA,
    rpm_t::ARCHITECTURES_SPARC,
    rpm_t::ARCHITECTURES_MIPS,
    rpm_t::ARCHITECTURES_PPC,
    rpm_t::ARCHITECTURES_M68K,
    rpm_t::ARCHITECTURES_SGI,
    rpm_t::ARCHITECTURES_RS6000,
    rpm_t::ARCHITECTURES_IA64,
    rpm_t::ARCHITECTURES_SPARC64,
    rpm_t::ARCHITECTURES_MIPS64,
    rpm_t::ARCHITECTURES_ARM,
    rpm_t::ARCHITECTURES_M68K_MINT,
    rpm_t::ARCHITECTURES_S390,
    rpm_t::ARCHITECTURES_S390X,
    rpm_t::ARCHITECTURES_PPC64,
    rpm_t::ARCHITECTURES_SH,
    rpm_t::ARCHITECTURES_XTENSA,
    rpm_t::ARCHITECTURES_AARCH64,
    rpm_t::ARCHITECTURES_MIPS_R6,
    rpm_t::ARCHITECTURES_MIPS64_R6,
    rpm_t::ARCHITECTURES_RISCV,
    rpm_t::ARCHITECTURES_LOONGARCH64,
    rpm_t::ARCHITECTURES_NO_ARCH,
};
bool rpm_t::_is_defined_architectures_t(rpm_t::architectures_t v) {
    return rpm_t::_values_architectures_t.find(v) != rpm_t::_values_architectures_t.end();
}
const std::set<rpm_t::header_tags_t> rpm_t::_values_header_tags_t{
    rpm_t::HEADER_TAGS_SIGNATURES,
    rpm_t::HEADER_TAGS_HEADER_IMMUTABLE,
    rpm_t::HEADER_TAGS_I18N_TABLE,
    rpm_t::HEADER_TAGS_NAME,
    rpm_t::HEADER_TAGS_VERSION,
    rpm_t::HEADER_TAGS_RELEASE,
    rpm_t::HEADER_TAGS_EPOCH,
    rpm_t::HEADER_TAGS_SUMMARY,
    rpm_t::HEADER_TAGS_DESCRIPTION,
    rpm_t::HEADER_TAGS_BUILD_TIME,
    rpm_t::HEADER_TAGS_BUILD_HOST,
    rpm_t::HEADER_TAGS_INSTALL_TIME,
    rpm_t::HEADER_TAGS_SIZE,
    rpm_t::HEADER_TAGS_DISTRIBUTION,
    rpm_t::HEADER_TAGS_VENDOR,
    rpm_t::HEADER_TAGS_GIF_OBSOLETE,
    rpm_t::HEADER_TAGS_XPM_OBSOLETE,
    rpm_t::HEADER_TAGS_LICENSE,
    rpm_t::HEADER_TAGS_PACKAGER,
    rpm_t::HEADER_TAGS_GROUP,
    rpm_t::HEADER_TAGS_CHANGELOG_INTERNAL,
    rpm_t::HEADER_TAGS_SOURCE,
    rpm_t::HEADER_TAGS_PATCH,
    rpm_t::HEADER_TAGS_URL,
    rpm_t::HEADER_TAGS_OS,
    rpm_t::HEADER_TAGS_ARCH,
    rpm_t::HEADER_TAGS_PRE_INSTALL_SCRIPTLET,
    rpm_t::HEADER_TAGS_POST_INSTALL_SCRIPTLET,
    rpm_t::HEADER_TAGS_PRE_UNINSTALL_SCRIPTLET,
    rpm_t::HEADER_TAGS_POST_UNINSTALL_SCRIPTLET,
    rpm_t::HEADER_TAGS_OLD_FILE_NAMES_OBSOLETE,
    rpm_t::HEADER_TAGS_FILE_SIZES,
    rpm_t::HEADER_TAGS_FILE_STATES,
    rpm_t::HEADER_TAGS_FILE_MODES,
    rpm_t::HEADER_TAGS_FILE_UIDS_INTERNAL,
    rpm_t::HEADER_TAGS_FILE_GIDS_INTERNAL,
    rpm_t::HEADER_TAGS_DEVICE_NUMBER,
    rpm_t::HEADER_TAGS_MTIMES,
    rpm_t::HEADER_TAGS_FILE_DIGESTS,
    rpm_t::HEADER_TAGS_LINK_TOS,
    rpm_t::HEADER_TAGS_FILE_FLAGS,
    rpm_t::HEADER_TAGS_ROOT_INTERNAL,
    rpm_t::HEADER_TAGS_FILE_OWNER,
    rpm_t::HEADER_TAGS_FILE_GROUP,
    rpm_t::HEADER_TAGS_EXCLUDE_INTERNAL,
    rpm_t::HEADER_TAGS_EXCLUSIVE_INTERNAL,
    rpm_t::HEADER_TAGS_ICON_OBSOLETE,
    rpm_t::HEADER_TAGS_SOURCE_RPM,
    rpm_t::HEADER_TAGS_FILE_VERIFY_FLAGS,
    rpm_t::HEADER_TAGS_ARCHIVE_SIZE,
    rpm_t::HEADER_TAGS_PROVIDE_NAME,
    rpm_t::HEADER_TAGS_REQUIRE_FLAGS,
    rpm_t::HEADER_TAGS_REQUIRE_NAME,
    rpm_t::HEADER_TAGS_REQUIRE_VERSION,
    rpm_t::HEADER_TAGS_NO_SOURCE,
    rpm_t::HEADER_TAGS_NO_PATCH,
    rpm_t::HEADER_TAGS_CONFLICT_FLAGS,
    rpm_t::HEADER_TAGS_CONFLICT_NAME,
    rpm_t::HEADER_TAGS_CONFLICT_VERSION,
    rpm_t::HEADER_TAGS_DEFAULT_PREFIX_INTERNAL,
    rpm_t::HEADER_TAGS_BUILD_ROOT_INTERNAL,
    rpm_t::HEADER_TAGS_INSTALL_PREFIX_INTERNAL,
    rpm_t::HEADER_TAGS_EXCLUDE_ARCH,
    rpm_t::HEADER_TAGS_EXCLUDE_OS,
    rpm_t::HEADER_TAGS_EXCLUSIVE_ARCH,
    rpm_t::HEADER_TAGS_EXCLUSIVE_OS,
    rpm_t::HEADER_TAGS_AUTOREQPROV_INTERNAL,
    rpm_t::HEADER_TAGS_RPM_VERSION,
    rpm_t::HEADER_TAGS_TRIGGER_SCRIPTS,
    rpm_t::HEADER_TAGS_TRIGGER_NAME,
    rpm_t::HEADER_TAGS_TRIGGER_VERSION,
    rpm_t::HEADER_TAGS_TRIGGER_FLAGS,
    rpm_t::HEADER_TAGS_TRIGGER_INDEX,
    rpm_t::HEADER_TAGS_VERIFY_SCRIPT,
    rpm_t::HEADER_TAGS_CHANGELOG_TIME,
    rpm_t::HEADER_TAGS_CHANGELOG_NAME,
    rpm_t::HEADER_TAGS_CHANGELOG_TEXT,
    rpm_t::HEADER_TAGS_BROKEN_MD5_INTERNAL,
    rpm_t::HEADER_TAGS_PREREQ_INTERNAL,
    rpm_t::HEADER_TAGS_PRE_INSTALL_INTERPRETER,
    rpm_t::HEADER_TAGS_POST_INSTALL_INTERPRETER,
    rpm_t::HEADER_TAGS_PRE_UNINSTALL_INTERPRETER,
    rpm_t::HEADER_TAGS_POST_UNINSTALL_INTERPRETER,
    rpm_t::HEADER_TAGS_BUILD_ARCHS,
    rpm_t::HEADER_TAGS_OBSOLETE_NAME,
    rpm_t::HEADER_TAGS_VERIFY_SCRIPT_PROG,
    rpm_t::HEADER_TAGS_TRIGGER_SCRIPT_PROG,
    rpm_t::HEADER_TAGS_DOC_DIR_INTERNAL,
    rpm_t::HEADER_TAGS_COOKIE,
    rpm_t::HEADER_TAGS_FILE_DEVICES,
    rpm_t::HEADER_TAGS_FILE_INODES,
    rpm_t::HEADER_TAGS_FILE_LANGS,
    rpm_t::HEADER_TAGS_PREFIXES,
    rpm_t::HEADER_TAGS_INSTALL_PREFIXES,
    rpm_t::HEADER_TAGS_TRIGGER_INSTALL_INTERNAL,
    rpm_t::HEADER_TAGS_TRIGGER_UNINSTALL_INTERNAL,
    rpm_t::HEADER_TAGS_TRIGGER_POST_UNINSTALL_INTERNAL,
    rpm_t::HEADER_TAGS_AUTOREQ_INTERNAL,
    rpm_t::HEADER_TAGS_AUTOPROV_INTERNAL,
    rpm_t::HEADER_TAGS_CAPABILITY_INTERNAL,
    rpm_t::HEADER_TAGS_SOURCE_PACKAGE,
    rpm_t::HEADER_TAGS_OLD_ORIG_FILENAMES_INTERNAL,
    rpm_t::HEADER_TAGS_BUILD_PREREQ_INTERNAL,
    rpm_t::HEADER_TAGS_BUILD_REQUIRES_INTERNAL,
    rpm_t::HEADER_TAGS_BUILD_CONFLICTS_INTERNAL,
    rpm_t::HEADER_TAGS_BUILD_MACROS_INTERNAL,
    rpm_t::HEADER_TAGS_PROVIDE_FLAGS,
    rpm_t::HEADER_TAGS_PROVIDE_VERSION,
    rpm_t::HEADER_TAGS_OBSOLETE_FLAGS,
    rpm_t::HEADER_TAGS_OBSOLETE_VERSION,
    rpm_t::HEADER_TAGS_DIR_INDEXES,
    rpm_t::HEADER_TAGS_BASE_NAMES,
    rpm_t::HEADER_TAGS_DIR_NAMES,
    rpm_t::HEADER_TAGS_ORIG_DIR_INDEXES,
    rpm_t::HEADER_TAGS_ORIG_BASE_NAMES,
    rpm_t::HEADER_TAGS_ORIG_DIR_NAMES,
    rpm_t::HEADER_TAGS_OPT_FLAGS,
    rpm_t::HEADER_TAGS_DIST_URL,
    rpm_t::HEADER_TAGS_PAYLOAD_FORMAT,
    rpm_t::HEADER_TAGS_PAYLOAD_COMPRESSOR,
    rpm_t::HEADER_TAGS_PAYLOAD_FLAGS,
    rpm_t::HEADER_TAGS_INSTALL_COLOR,
    rpm_t::HEADER_TAGS_INSTALL_TID,
    rpm_t::HEADER_TAGS_REMOVE_TID_OBSOLETE,
    rpm_t::HEADER_TAGS_SHA1_RHN_INTERNAL,
    rpm_t::HEADER_TAGS_RHN_PLATFORM_INTERNAL,
    rpm_t::HEADER_TAGS_PLATFORM,
    rpm_t::HEADER_TAGS_PATCHES_NAME_OBSOLETE,
    rpm_t::HEADER_TAGS_PATCHES_FLAGS_OBSOLETE,
    rpm_t::HEADER_TAGS_PATCHES_VERSION_OBSOLETE,
    rpm_t::HEADER_TAGS_CACHE_CTIME_INTERNAL,
    rpm_t::HEADER_TAGS_CACHE_PKG_PATH_INTERNAL,
    rpm_t::HEADER_TAGS_CACHE_PKG_SIZE_INTERNAL,
    rpm_t::HEADER_TAGS_CACHE_PKG_MTIME_INTERNAL,
    rpm_t::HEADER_TAGS_FILE_COLORS,
    rpm_t::HEADER_TAGS_FILE_CLASS,
    rpm_t::HEADER_TAGS_CLASS_DICT,
    rpm_t::HEADER_TAGS_FILE_DEPENDS_IDX,
    rpm_t::HEADER_TAGS_FILE_DEPENDS_NUM,
    rpm_t::HEADER_TAGS_DEPENDS_DICT,
    rpm_t::HEADER_TAGS_SOURCE_PKGID,
    rpm_t::HEADER_TAGS_FILE_CONTEXTS_OBSOLETE,
    rpm_t::HEADER_TAGS_FS_CONTEXTS_OBSOLETE,
    rpm_t::HEADER_TAGS_RE_CONTEXTS_OBSOLETE,
    rpm_t::HEADER_TAGS_POLICIES,
    rpm_t::HEADER_TAGS_PRE_TRANS,
    rpm_t::HEADER_TAGS_POST_TRANS,
    rpm_t::HEADER_TAGS_PRE_TRANS_PROG,
    rpm_t::HEADER_TAGS_POST_TRANS_PROG,
    rpm_t::HEADER_TAGS_DIST_TAG,
    rpm_t::HEADER_TAGS_OLD_SUGGESTS_NAME_OBSOLETE,
    rpm_t::HEADER_TAGS_OLD_SUGGESTS_VERSION_OBSOLETE,
    rpm_t::HEADER_TAGS_OLD_SUGGESTS_FLAGS_OBSOLETE,
    rpm_t::HEADER_TAGS_OLD_ENHANCES_NAME_OBSOLETE,
    rpm_t::HEADER_TAGS_OLD_ENHANCES_VERSION_OBSOLETE,
    rpm_t::HEADER_TAGS_OLD_ENHANCES_FLAGS_OBSOLETE,
    rpm_t::HEADER_TAGS_PRIORITY_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_CVSID_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_BLINK_PKGID_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_BLINK_HDRID_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_BLINK_NEVRA_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_FLINK_PKGID_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_FLINK_HDRID_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_FLINK_NEVRA_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_PACKAGE_ORIGIN_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_TRIGGER_PRE_INSTALL_INTERNAL,
    rpm_t::HEADER_TAGS_BUILD_SUGGESTS_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_BUILD_ENHANCES_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_SCRIPT_STATES_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_SCRIPT_METRICS_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_BUILD_CPU_CLOCK_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_FILE_DIGEST_ALGOS_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_VARIANTS_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_XMAJOR_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_XMINOR_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_REPO_TAG_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_KEYWORDS_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_BUILD_PLATFORMS_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_PACKAGE_COLOR_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_PACKAGE_PREF_COLOR_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_XATTRS_DICT_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_FILEX_ATTRSX_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_DEP_ATTRS_DICT_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_CONFLICT_ATTRSX_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_OBSOLETE_ATTRSX_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_PROVIDE_ATTRSX_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_REQUIRE_ATTRSX_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_BUILD_PROVIDES_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_BUILD_OBSOLETES_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_DB_INSTANCE,
    rpm_t::HEADER_TAGS_NVRA,
    rpm_t::HEADER_TAGS_FILE_NAMES,
    rpm_t::HEADER_TAGS_FILE_PROVIDE,
    rpm_t::HEADER_TAGS_FILE_REQUIRE,
    rpm_t::HEADER_TAGS_FS_NAMES_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_FS_SIZES_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_TRIGGER_CONDS,
    rpm_t::HEADER_TAGS_TRIGGER_TYPE,
    rpm_t::HEADER_TAGS_ORIG_FILE_NAMES,
    rpm_t::HEADER_TAGS_LONG_FILE_SIZES,
    rpm_t::HEADER_TAGS_LONG_SIZE,
    rpm_t::HEADER_TAGS_FILE_CAPS,
    rpm_t::HEADER_TAGS_FILE_DIGEST_ALGO,
    rpm_t::HEADER_TAGS_BUG_URL,
    rpm_t::HEADER_TAGS_EVR,
    rpm_t::HEADER_TAGS_NVR,
    rpm_t::HEADER_TAGS_NEVR,
    rpm_t::HEADER_TAGS_NEVRA,
    rpm_t::HEADER_TAGS_HEADER_COLOR,
    rpm_t::HEADER_TAGS_VERBOSE,
    rpm_t::HEADER_TAGS_EPOCH_NUM,
    rpm_t::HEADER_TAGS_PRE_INSTALL_FLAGS,
    rpm_t::HEADER_TAGS_POST_INSTALL_FLAGS,
    rpm_t::HEADER_TAGS_PRE_UNINSTALL_FLAGS,
    rpm_t::HEADER_TAGS_POST_UNINSTALL_FLAGS,
    rpm_t::HEADER_TAGS_PRE_TRANS_FLAGS,
    rpm_t::HEADER_TAGS_POST_TRANS_FLAGS,
    rpm_t::HEADER_TAGS_VERIFY_SCRIPT_FLAGS,
    rpm_t::HEADER_TAGS_TRIGGER_SCRIPT_FLAGS,
    rpm_t::HEADER_TAGS_COLLECTIONS_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_POLICY_NAMES,
    rpm_t::HEADER_TAGS_POLICY_TYPES,
    rpm_t::HEADER_TAGS_POLICY_TYPES_INDEXES,
    rpm_t::HEADER_TAGS_POLICY_FLAGS,
    rpm_t::HEADER_TAGS_VCS,
    rpm_t::HEADER_TAGS_ORDER_NAME,
    rpm_t::HEADER_TAGS_ORDER_VERSION,
    rpm_t::HEADER_TAGS_ORDER_FLAGS,
    rpm_t::HEADER_TAGS_MSSF_MANIFEST_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_MSSF_DOMAIN_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_INST_FILE_NAMES,
    rpm_t::HEADER_TAGS_REQUIRE_NEVRS,
    rpm_t::HEADER_TAGS_PROVIDE_NEVRS,
    rpm_t::HEADER_TAGS_OBSOLETE_NEVRS,
    rpm_t::HEADER_TAGS_CONFLICT_NEVRS,
    rpm_t::HEADER_TAGS_FILE_NLINKS,
    rpm_t::HEADER_TAGS_RECOMMEND_NAME,
    rpm_t::HEADER_TAGS_RECOMMEND_VERSION,
    rpm_t::HEADER_TAGS_RECOMMEND_FLAGS,
    rpm_t::HEADER_TAGS_SUGGEST_NAME,
    rpm_t::HEADER_TAGS_SUGGEST_VERSION,
    rpm_t::HEADER_TAGS_SUGGEST_FLAGS,
    rpm_t::HEADER_TAGS_SUPPLEMENT_NAME,
    rpm_t::HEADER_TAGS_SUPPLEMENT_VERSION,
    rpm_t::HEADER_TAGS_SUPPLEMENT_FLAGS,
    rpm_t::HEADER_TAGS_ENHANCE_NAME,
    rpm_t::HEADER_TAGS_ENHANCE_VERSION,
    rpm_t::HEADER_TAGS_ENHANCE_FLAGS,
    rpm_t::HEADER_TAGS_RECOMMEND_NEVRS,
    rpm_t::HEADER_TAGS_SUGGEST_NEVRS,
    rpm_t::HEADER_TAGS_SUPPLEMENT_NEVRS,
    rpm_t::HEADER_TAGS_ENHANCE_NEVRS,
    rpm_t::HEADER_TAGS_ENCODING,
    rpm_t::HEADER_TAGS_FILE_TRIGGER_INSTALL_INTERNAL,
    rpm_t::HEADER_TAGS_FILE_TRIGGER_UNINSTALL_INTERNAL,
    rpm_t::HEADER_TAGS_FILE_TRIGGER_POST_UNINSTALL_INTERNAL,
    rpm_t::HEADER_TAGS_FILE_TRIGGER_SCRIPTS,
    rpm_t::HEADER_TAGS_FILE_TRIGGER_SCRIPT_PROG,
    rpm_t::HEADER_TAGS_FILE_TRIGGER_SCRIPT_FLAGS,
    rpm_t::HEADER_TAGS_FILE_TRIGGER_NAME,
    rpm_t::HEADER_TAGS_FILE_TRIGGER_INDEX,
    rpm_t::HEADER_TAGS_FILE_TRIGGER_VERSION,
    rpm_t::HEADER_TAGS_FILE_TRIGGER_FLAGS,
    rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_INSTALL_INTERNAL,
    rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_UNINSTALL_INTERNAL,
    rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_POST_UNINSTALL_INTERNAL,
    rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_SCRIPTS,
    rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_SCRIPT_PROG,
    rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_SCRIPT_FLAGS,
    rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_NAME,
    rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_INDEX,
    rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_VERSION,
    rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_FLAGS,
    rpm_t::HEADER_TAGS_REMOVE_PATH_POSTFIXES_INTERNAL,
    rpm_t::HEADER_TAGS_FILE_TRIGGER_PRIORITIES,
    rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_PRIORITIES,
    rpm_t::HEADER_TAGS_FILE_TRIGGER_CONDS,
    rpm_t::HEADER_TAGS_FILE_TRIGGER_TYPE,
    rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_CONDS,
    rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_TYPE,
    rpm_t::HEADER_TAGS_FILE_SIGNATURES,
    rpm_t::HEADER_TAGS_FILE_SIGNATURE_LENGTH,
    rpm_t::HEADER_TAGS_PAYLOAD_DIGEST,
    rpm_t::HEADER_TAGS_PAYLOAD_DIGEST_ALGO,
    rpm_t::HEADER_TAGS_AUTO_INSTALLED_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_IDENTITY_UNIMPLEMENTED,
    rpm_t::HEADER_TAGS_MODULARITY_LABEL,
    rpm_t::HEADER_TAGS_PAYLOAD_DIGEST_ALT,
    rpm_t::HEADER_TAGS_ARCH_SUFFIX,
    rpm_t::HEADER_TAGS_SPEC,
    rpm_t::HEADER_TAGS_TRANSLATION_URL,
    rpm_t::HEADER_TAGS_UPSTREAM_RELEASES,
    rpm_t::HEADER_TAGS_SOURCE_LICENSE_INTERNAL,
    rpm_t::HEADER_TAGS_PRE_UNTRANS,
    rpm_t::HEADER_TAGS_POST_UNTRANS,
    rpm_t::HEADER_TAGS_PRE_UNTRANS_PROG,
    rpm_t::HEADER_TAGS_POST_UNTRANS_PROG,
    rpm_t::HEADER_TAGS_PRE_UNTRANS_FLAGS,
    rpm_t::HEADER_TAGS_POST_UNTRANS_FLAGS,
    rpm_t::HEADER_TAGS_SYS_USERS,
};
bool rpm_t::_is_defined_header_tags_t(rpm_t::header_tags_t v) {
    return rpm_t::_values_header_tags_t.find(v) != rpm_t::_values_header_tags_t.end();
}
const std::set<rpm_t::operating_systems_t> rpm_t::_values_operating_systems_t{
    rpm_t::OPERATING_SYSTEMS_LINUX,
    rpm_t::OPERATING_SYSTEMS_IRIX,
    rpm_t::OPERATING_SYSTEMS_NO_OS,
};
bool rpm_t::_is_defined_operating_systems_t(rpm_t::operating_systems_t v) {
    return rpm_t::_values_operating_systems_t.find(v) != rpm_t::_values_operating_systems_t.end();
}
const std::set<rpm_t::record_types_t> rpm_t::_values_record_types_t{
    rpm_t::RECORD_TYPES_NOT_IMPLEMENTED,
    rpm_t::RECORD_TYPES_CHAR,
    rpm_t::RECORD_TYPES_UINT8,
    rpm_t::RECORD_TYPES_UINT16,
    rpm_t::RECORD_TYPES_UINT32,
    rpm_t::RECORD_TYPES_UINT64,
    rpm_t::RECORD_TYPES_STRING,
    rpm_t::RECORD_TYPES_BIN,
    rpm_t::RECORD_TYPES_STRING_ARRAY,
    rpm_t::RECORD_TYPES_I18N_STRING,
};
bool rpm_t::_is_defined_record_types_t(rpm_t::record_types_t v) {
    return rpm_t::_values_record_types_t.find(v) != rpm_t::_values_record_types_t.end();
}
const std::set<rpm_t::rpm_types_t> rpm_t::_values_rpm_types_t{
    rpm_t::RPM_TYPES_BINARY,
    rpm_t::RPM_TYPES_SOURCE,
};
bool rpm_t::_is_defined_rpm_types_t(rpm_t::rpm_types_t v) {
    return rpm_t::_values_rpm_types_t.find(v) != rpm_t::_values_rpm_types_t.end();
}
const std::set<rpm_t::signature_tags_t> rpm_t::_values_signature_tags_t{
    rpm_t::SIGNATURE_TAGS_SIGNATURES,
    rpm_t::SIGNATURE_TAGS_HEADER_IMMUTABLE,
    rpm_t::SIGNATURE_TAGS_I18N_TABLE,
    rpm_t::SIGNATURE_TAGS_BAD_SHA1_1_OBSOLETE,
    rpm_t::SIGNATURE_TAGS_BAD_SHA1_2_OBSOLETE,
    rpm_t::SIGNATURE_TAGS_DSA,
    rpm_t::SIGNATURE_TAGS_RSA,
    rpm_t::SIGNATURE_TAGS_SHA1,
    rpm_t::SIGNATURE_TAGS_LONG_SIZE,
    rpm_t::SIGNATURE_TAGS_LONG_ARCHIVE_SIZE,
    rpm_t::SIGNATURE_TAGS_SHA256,
    rpm_t::SIGNATURE_TAGS_FILE_SIGNATURES,
    rpm_t::SIGNATURE_TAGS_FILE_SIGNATURE_LENGTH,
    rpm_t::SIGNATURE_TAGS_VERITY_SIGNATURES,
    rpm_t::SIGNATURE_TAGS_VERITY_SIGNATURE_ALGO,
    rpm_t::SIGNATURE_TAGS_SIZE,
    rpm_t::SIGNATURE_TAGS_LE_MD5_1_OBSOLETE,
    rpm_t::SIGNATURE_TAGS_PGP,
    rpm_t::SIGNATURE_TAGS_LE_MD5_2_OBSOLETE,
    rpm_t::SIGNATURE_TAGS_MD5,
    rpm_t::SIGNATURE_TAGS_GPG,
    rpm_t::SIGNATURE_TAGS_PGP5_OBSOLETE,
    rpm_t::SIGNATURE_TAGS_PAYLOAD_SIZE,
    rpm_t::SIGNATURE_TAGS_RESERVED_SPACE,
};
bool rpm_t::_is_defined_signature_tags_t(rpm_t::signature_tags_t v) {
    return rpm_t::_values_signature_tags_t.find(v) != rpm_t::_values_signature_tags_t.end();
}

rpm_t::rpm_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_lead = nullptr;
    m_signature = nullptr;
    m_header = nullptr;
    m_signature_tags_steps = nullptr;
    f_has_signature_size_tag = false;
    f_len_header = false;
    f_len_payload = false;
    f_ofs_header = false;
    f_ofs_payload = false;
    f_payload = false;
    f_signature_size_tag = false;
    _read();
}

void rpm_t::_read() {
    m_lead = std::unique_ptr<lead_t>(new lead_t(m__io, this, m__root));
    m_signature = std::unique_ptr<header_t>(new header_t(true, m__io, this, m__root));
    m_signature_padding = m__io->read_bytes(kaitai::kstream::mod(-(_io()->pos()), 8));
    n__unnamed3 = true;
    if (ofs_header() < 0) {
        n__unnamed3 = false;
        m__unnamed3 = m__io->read_bytes(0);
    }
    m_header = std::unique_ptr<header_t>(new header_t(false, m__io, this, m__root));
    n__unnamed5 = true;
    if (ofs_payload() < 0) {
        n__unnamed5 = false;
        m__unnamed5 = m__io->read_bytes(0);
    }
    m_signature_tags_steps = std::unique_ptr<std::vector<std::unique_ptr<signature_tags_step_t>>>(new std::vector<std::unique_ptr<signature_tags_step_t>>());
    const int l_signature_tags_steps = signature()->header_record()->num_index_records();
    for (int i = 0; i < l_signature_tags_steps; i++) {
        m_signature_tags_steps->push_back(std::move(std::unique_ptr<signature_tags_step_t>(new signature_tags_step_t(i, ((i < 1) ? (-1) : (signature_tags_steps()->at(i - 1)->size_tag_idx())), m__io, this, m__root))));
    }
}

rpm_t::~rpm_t() {
    _clean_up();
}

void rpm_t::_clean_up() {
    if (!n__unnamed3) {
    }
    if (!n__unnamed5) {
    }
    if (f_payload && !n_payload) {
    }
}

rpm_t::dummy_t::dummy_t(kaitai::kstream* p__io, rpm_t::header_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void rpm_t::dummy_t::_read() {
}

rpm_t::dummy_t::~dummy_t() {
    _clean_up();
}

void rpm_t::dummy_t::_clean_up() {
}

rpm_t::header_t::header_t(bool p_is_signature, kaitai::kstream* p__io, rpm_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_is_signature = p_is_signature;
    m_header_record = nullptr;
    m_index_records = nullptr;
    m_storage_section = nullptr;
    m__io__raw_storage_section = nullptr;
    f_is_header = false;
    _read();
}

void rpm_t::header_t::_read() {
    m_header_record = std::unique_ptr<header_record_t>(new header_record_t(m__io, this, m__root));
    m_index_records = std::unique_ptr<std::vector<std::unique_ptr<header_index_record_t>>>(new std::vector<std::unique_ptr<header_index_record_t>>());
    const int l_index_records = header_record()->num_index_records();
    for (int i = 0; i < l_index_records; i++) {
        m_index_records->push_back(std::move(std::unique_ptr<header_index_record_t>(new header_index_record_t(m__io, this, m__root))));
    }
    m__raw_storage_section = m__io->read_bytes(header_record()->len_storage_section());
    m__io__raw_storage_section = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_storage_section));
    m_storage_section = std::unique_ptr<dummy_t>(new dummy_t(m__io__raw_storage_section.get(), this, m__root));
}

rpm_t::header_t::~header_t() {
    _clean_up();
}

void rpm_t::header_t::_clean_up() {
}

bool rpm_t::header_t::is_header() {
    if (f_is_header)
        return m_is_header;
    f_is_header = true;
    m_is_header = !(is_signature());
    return m_is_header;
}

rpm_t::header_index_record_t::header_index_record_t(kaitai::kstream* p__io, rpm_t::header_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_body = false;
    f_header_tag = false;
    f_len_value = false;
    f_num_values = false;
    f_signature_tag = false;
    _read();
}

void rpm_t::header_index_record_t::_read() {
    m_tag_raw = m__io->read_u4be();
    m_record_type = static_cast<rpm_t::record_types_t>(m__io->read_u4be());
    m_ofs_body = m__io->read_u4be();
    m_count = m__io->read_u4be();
}

rpm_t::header_index_record_t::~header_index_record_t() {
    _clean_up();
}

void rpm_t::header_index_record_t::_clean_up() {
    if (f_body && !n_body) {
    }
}

kaitai::kstruct* rpm_t::header_index_record_t::body() {
    if (f_body)
        return m_body.get();
    f_body = true;
    kaitai::kstream *io = _parent()->storage_section()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_body());
    n_body = true;
    switch (record_type()) {
    case rpm_t::RECORD_TYPES_BIN: {
        n_body = false;
        m_body = std::unique_ptr<record_type_bin_t>(new record_type_bin_t(len_value(), io, this, m__root));
        break;
    }
    case rpm_t::RECORD_TYPES_CHAR: {
        n_body = false;
        m_body = std::unique_ptr<record_type_uint8_t>(new record_type_uint8_t(num_values(), io, this, m__root));
        break;
    }
    case rpm_t::RECORD_TYPES_I18N_STRING: {
        n_body = false;
        m_body = std::unique_ptr<record_type_string_array_t>(new record_type_string_array_t(num_values(), io, this, m__root));
        break;
    }
    case rpm_t::RECORD_TYPES_STRING: {
        n_body = false;
        m_body = std::unique_ptr<record_type_string_t>(new record_type_string_t(io, this, m__root));
        break;
    }
    case rpm_t::RECORD_TYPES_STRING_ARRAY: {
        n_body = false;
        m_body = std::unique_ptr<record_type_string_array_t>(new record_type_string_array_t(num_values(), io, this, m__root));
        break;
    }
    case rpm_t::RECORD_TYPES_UINT16: {
        n_body = false;
        m_body = std::unique_ptr<record_type_uint16_t>(new record_type_uint16_t(num_values(), io, this, m__root));
        break;
    }
    case rpm_t::RECORD_TYPES_UINT32: {
        n_body = false;
        m_body = std::unique_ptr<record_type_uint32_t>(new record_type_uint32_t(num_values(), io, this, m__root));
        break;
    }
    case rpm_t::RECORD_TYPES_UINT64: {
        n_body = false;
        m_body = std::unique_ptr<record_type_uint64_t>(new record_type_uint64_t(num_values(), io, this, m__root));
        break;
    }
    case rpm_t::RECORD_TYPES_UINT8: {
        n_body = false;
        m_body = std::unique_ptr<record_type_uint8_t>(new record_type_uint8_t(num_values(), io, this, m__root));
        break;
    }
    }
    io->seek(_pos);
    return m_body.get();
}

rpm_t::header_tags_t rpm_t::header_index_record_t::header_tag() {
    if (f_header_tag)
        return m_header_tag;
    f_header_tag = true;
    n_header_tag = true;
    if (_parent()->is_header()) {
        n_header_tag = false;
        m_header_tag = static_cast<rpm_t::header_tags_t>(tag_raw());
    }
    return m_header_tag;
}

uint32_t rpm_t::header_index_record_t::len_value() {
    if (f_len_value)
        return m_len_value;
    f_len_value = true;
    n_len_value = true;
    if (record_type() == rpm_t::RECORD_TYPES_BIN) {
        n_len_value = false;
        m_len_value = count();
    }
    return m_len_value;
}

uint32_t rpm_t::header_index_record_t::num_values() {
    if (f_num_values)
        return m_num_values;
    f_num_values = true;
    n_num_values = true;
    if (record_type() != rpm_t::RECORD_TYPES_BIN) {
        n_num_values = false;
        m_num_values = count();
    }
    return m_num_values;
}

rpm_t::signature_tags_t rpm_t::header_index_record_t::signature_tag() {
    if (f_signature_tag)
        return m_signature_tag;
    f_signature_tag = true;
    n_signature_tag = true;
    if (_parent()->is_signature()) {
        n_signature_tag = false;
        m_signature_tag = static_cast<rpm_t::signature_tags_t>(tag_raw());
    }
    return m_signature_tag;
}

rpm_t::header_record_t::header_record_t(kaitai::kstream* p__io, rpm_t::header_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void rpm_t::header_record_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x8E\xAD\xE8\x01", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x8E\xAD\xE8\x01", 4), m_magic, m__io, std::string("/types/header_record/seq/0"));
    }
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/header_record/seq/1"));
    }
    m_num_index_records = m__io->read_u4be();
    if (!(m_num_index_records >= 1)) {
        throw kaitai::validation_less_than_error<uint32_t>(1, m_num_index_records, m__io, std::string("/types/header_record/seq/2"));
    }
    m_len_storage_section = m__io->read_u4be();
}

rpm_t::header_record_t::~header_record_t() {
    _clean_up();
}

void rpm_t::header_record_t::_clean_up() {
}

rpm_t::lead_t::lead_t(kaitai::kstream* p__io, rpm_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_version = nullptr;
    _read();
}

void rpm_t::lead_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\xED\xAB\xEE\xDB", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xED\xAB\xEE\xDB", 4), m_magic, m__io, std::string("/types/lead/seq/0"));
    }
    m_version = std::unique_ptr<rpm_version_t>(new rpm_version_t(m__io, this, m__root));
    m_type = static_cast<rpm_t::rpm_types_t>(m__io->read_u2be());
    m_architecture = static_cast<rpm_t::architectures_t>(m__io->read_u2be());
    m_package_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(66), 0, false), "UTF-8");
    m_os = static_cast<rpm_t::operating_systems_t>(m__io->read_u2be());
    m_signature_type = m__io->read_u2be();
    if (!(m_signature_type == 5)) {
        throw kaitai::validation_not_equal_error<uint16_t>(5, m_signature_type, m__io, std::string("/types/lead/seq/6"));
    }
    m_reserved = m__io->read_bytes(16);
}

rpm_t::lead_t::~lead_t() {
    _clean_up();
}

void rpm_t::lead_t::_clean_up() {
}

rpm_t::record_type_bin_t::record_type_bin_t(uint32_t p_len_value, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len_value = p_len_value;
    m_values = nullptr;
    _read();
}

void rpm_t::record_type_bin_t::_read() {
    m_values = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    const int l_values = 1;
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(m__io->read_bytes(len_value())));
    }
}

rpm_t::record_type_bin_t::~record_type_bin_t() {
    _clean_up();
}

void rpm_t::record_type_bin_t::_clean_up() {
}

rpm_t::record_type_string_t::record_type_string_t(kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_values = nullptr;
    _read();
}

void rpm_t::record_type_string_t::_read() {
    m_values = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    const int l_values = 1;
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "UTF-8")));
    }
}

rpm_t::record_type_string_t::~record_type_string_t() {
    _clean_up();
}

void rpm_t::record_type_string_t::_clean_up() {
}

rpm_t::record_type_string_array_t::record_type_string_array_t(uint32_t p_num_values, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_values = p_num_values;
    m_values = nullptr;
    _read();
}

void rpm_t::record_type_string_array_t::_read() {
    m_values = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    const int l_values = num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "UTF-8")));
    }
}

rpm_t::record_type_string_array_t::~record_type_string_array_t() {
    _clean_up();
}

void rpm_t::record_type_string_array_t::_clean_up() {
}

rpm_t::record_type_uint16_t::record_type_uint16_t(uint32_t p_num_values, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_values = p_num_values;
    m_values = nullptr;
    _read();
}

void rpm_t::record_type_uint16_t::_read() {
    m_values = std::unique_ptr<std::vector<uint16_t>>(new std::vector<uint16_t>());
    const int l_values = num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(m__io->read_u2be()));
    }
}

rpm_t::record_type_uint16_t::~record_type_uint16_t() {
    _clean_up();
}

void rpm_t::record_type_uint16_t::_clean_up() {
}

rpm_t::record_type_uint32_t::record_type_uint32_t(uint32_t p_num_values, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_values = p_num_values;
    m_values = nullptr;
    _read();
}

void rpm_t::record_type_uint32_t::_read() {
    m_values = std::unique_ptr<std::vector<uint32_t>>(new std::vector<uint32_t>());
    const int l_values = num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(m__io->read_u4be()));
    }
}

rpm_t::record_type_uint32_t::~record_type_uint32_t() {
    _clean_up();
}

void rpm_t::record_type_uint32_t::_clean_up() {
}

rpm_t::record_type_uint64_t::record_type_uint64_t(uint32_t p_num_values, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_values = p_num_values;
    m_values = nullptr;
    _read();
}

void rpm_t::record_type_uint64_t::_read() {
    m_values = std::unique_ptr<std::vector<uint64_t>>(new std::vector<uint64_t>());
    const int l_values = num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(m__io->read_u8be()));
    }
}

rpm_t::record_type_uint64_t::~record_type_uint64_t() {
    _clean_up();
}

void rpm_t::record_type_uint64_t::_clean_up() {
}

rpm_t::record_type_uint8_t::record_type_uint8_t(uint32_t p_num_values, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_values = p_num_values;
    m_values = nullptr;
    _read();
}

void rpm_t::record_type_uint8_t::_read() {
    m_values = std::unique_ptr<std::vector<uint8_t>>(new std::vector<uint8_t>());
    const int l_values = num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(m__io->read_u1()));
    }
}

rpm_t::record_type_uint8_t::~record_type_uint8_t() {
    _clean_up();
}

void rpm_t::record_type_uint8_t::_clean_up() {
}

rpm_t::rpm_version_t::rpm_version_t(kaitai::kstream* p__io, rpm_t::lead_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void rpm_t::rpm_version_t::_read() {
    m_major = m__io->read_u1();
    if (!(m_major >= 3)) {
        throw kaitai::validation_less_than_error<uint8_t>(3, m_major, m__io, std::string("/types/rpm_version/seq/0"));
    }
    if (!(m_major <= 4)) {
        throw kaitai::validation_greater_than_error<uint8_t>(4, m_major, m__io, std::string("/types/rpm_version/seq/0"));
    }
    m_minor = m__io->read_u1();
}

rpm_t::rpm_version_t::~rpm_version_t() {
    _clean_up();
}

void rpm_t::rpm_version_t::_clean_up() {
}

rpm_t::signature_tags_step_t::signature_tags_step_t(int32_t p_idx, int32_t p_prev_size_tag_idx, kaitai::kstream* p__io, rpm_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_idx = p_idx;
    m_prev_size_tag_idx = p_prev_size_tag_idx;
    f_size_tag_idx = false;
    _read();
}

void rpm_t::signature_tags_step_t::_read() {
}

rpm_t::signature_tags_step_t::~signature_tags_step_t() {
    _clean_up();
}

void rpm_t::signature_tags_step_t::_clean_up() {
}

int32_t rpm_t::signature_tags_step_t::size_tag_idx() {
    if (f_size_tag_idx)
        return m_size_tag_idx;
    f_size_tag_idx = true;
    m_size_tag_idx = ((prev_size_tag_idx() != -1) ? (prev_size_tag_idx()) : ((( ((_parent()->signature()->index_records()->at(idx())->signature_tag() == rpm_t::SIGNATURE_TAGS_SIZE) && (_parent()->signature()->index_records()->at(idx())->record_type() == rpm_t::RECORD_TYPES_UINT32) && (_parent()->signature()->index_records()->at(idx())->num_values() >= 1)) ) ? (idx()) : (-1))));
    return m_size_tag_idx;
}

bool rpm_t::has_signature_size_tag() {
    if (f_has_signature_size_tag)
        return m_has_signature_size_tag;
    f_has_signature_size_tag = true;
    m_has_signature_size_tag = signature_tags_steps()->back()->size_tag_idx() != -1;
    return m_has_signature_size_tag;
}

int32_t rpm_t::len_header() {
    if (f_len_header)
        return m_len_header;
    f_len_header = true;
    m_len_header = ofs_payload() - ofs_header();
    return m_len_header;
}

int32_t rpm_t::len_payload() {
    if (f_len_payload)
        return m_len_payload;
    f_len_payload = true;
    n_len_payload = true;
    if (has_signature_size_tag()) {
        n_len_payload = false;
        m_len_payload = static_cast<rpm_t::record_type_uint32_t*>(signature_size_tag()->body())->values()->at(0) - len_header();
    }
    return m_len_payload;
}

int32_t rpm_t::ofs_header() {
    if (f_ofs_header)
        return m_ofs_header;
    f_ofs_header = true;
    m_ofs_header = _io()->pos();
    return m_ofs_header;
}

int32_t rpm_t::ofs_payload() {
    if (f_ofs_payload)
        return m_ofs_payload;
    f_ofs_payload = true;
    m_ofs_payload = _io()->pos();
    return m_ofs_payload;
}

std::string rpm_t::payload() {
    if (f_payload)
        return m_payload;
    f_payload = true;
    n_payload = true;
    if (has_signature_size_tag()) {
        n_payload = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(ofs_payload());
        m_payload = m__io->read_bytes(len_payload());
        m__io->seek(_pos);
    }
    return m_payload;
}

rpm_t::header_index_record_t* rpm_t::signature_size_tag() {
    if (f_signature_size_tag)
        return m_signature_size_tag;
    f_signature_size_tag = true;
    n_signature_size_tag = true;
    if (has_signature_size_tag()) {
        n_signature_size_tag = false;
        m_signature_size_tag = signature()->index_records()->at(signature_tags_steps()->back()->size_tag_idx()).get();
    }
    return m_signature_size_tag;
}
