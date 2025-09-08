// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "rpm.h"
#include "kaitai/exceptions.h"
std::set<rpm_t::architectures_t> rpm_t::_build_values_architectures_t() {
    std::set<rpm_t::architectures_t> _t;
    _t.insert(rpm_t::ARCHITECTURES_X86);
    _t.insert(rpm_t::ARCHITECTURES_ALPHA);
    _t.insert(rpm_t::ARCHITECTURES_SPARC);
    _t.insert(rpm_t::ARCHITECTURES_MIPS);
    _t.insert(rpm_t::ARCHITECTURES_PPC);
    _t.insert(rpm_t::ARCHITECTURES_M68K);
    _t.insert(rpm_t::ARCHITECTURES_SGI);
    _t.insert(rpm_t::ARCHITECTURES_RS6000);
    _t.insert(rpm_t::ARCHITECTURES_IA64);
    _t.insert(rpm_t::ARCHITECTURES_SPARC64);
    _t.insert(rpm_t::ARCHITECTURES_MIPS64);
    _t.insert(rpm_t::ARCHITECTURES_ARM);
    _t.insert(rpm_t::ARCHITECTURES_M68K_MINT);
    _t.insert(rpm_t::ARCHITECTURES_S390);
    _t.insert(rpm_t::ARCHITECTURES_S390X);
    _t.insert(rpm_t::ARCHITECTURES_PPC64);
    _t.insert(rpm_t::ARCHITECTURES_SH);
    _t.insert(rpm_t::ARCHITECTURES_XTENSA);
    _t.insert(rpm_t::ARCHITECTURES_AARCH64);
    _t.insert(rpm_t::ARCHITECTURES_MIPS_R6);
    _t.insert(rpm_t::ARCHITECTURES_MIPS64_R6);
    _t.insert(rpm_t::ARCHITECTURES_RISCV);
    _t.insert(rpm_t::ARCHITECTURES_LOONGARCH64);
    _t.insert(rpm_t::ARCHITECTURES_NO_ARCH);
    return _t;
}
const std::set<rpm_t::architectures_t> rpm_t::_values_architectures_t = rpm_t::_build_values_architectures_t();
bool rpm_t::_is_defined_architectures_t(rpm_t::architectures_t v) {
    return rpm_t::_values_architectures_t.find(v) != rpm_t::_values_architectures_t.end();
}
std::set<rpm_t::header_tags_t> rpm_t::_build_values_header_tags_t() {
    std::set<rpm_t::header_tags_t> _t;
    _t.insert(rpm_t::HEADER_TAGS_SIGNATURES);
    _t.insert(rpm_t::HEADER_TAGS_HEADER_IMMUTABLE);
    _t.insert(rpm_t::HEADER_TAGS_I18N_TABLE);
    _t.insert(rpm_t::HEADER_TAGS_NAME);
    _t.insert(rpm_t::HEADER_TAGS_VERSION);
    _t.insert(rpm_t::HEADER_TAGS_RELEASE);
    _t.insert(rpm_t::HEADER_TAGS_EPOCH);
    _t.insert(rpm_t::HEADER_TAGS_SUMMARY);
    _t.insert(rpm_t::HEADER_TAGS_DESCRIPTION);
    _t.insert(rpm_t::HEADER_TAGS_BUILD_TIME);
    _t.insert(rpm_t::HEADER_TAGS_BUILD_HOST);
    _t.insert(rpm_t::HEADER_TAGS_INSTALL_TIME);
    _t.insert(rpm_t::HEADER_TAGS_SIZE);
    _t.insert(rpm_t::HEADER_TAGS_DISTRIBUTION);
    _t.insert(rpm_t::HEADER_TAGS_VENDOR);
    _t.insert(rpm_t::HEADER_TAGS_GIF_OBSOLETE);
    _t.insert(rpm_t::HEADER_TAGS_XPM_OBSOLETE);
    _t.insert(rpm_t::HEADER_TAGS_LICENSE);
    _t.insert(rpm_t::HEADER_TAGS_PACKAGER);
    _t.insert(rpm_t::HEADER_TAGS_GROUP);
    _t.insert(rpm_t::HEADER_TAGS_CHANGELOG_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_SOURCE);
    _t.insert(rpm_t::HEADER_TAGS_PATCH);
    _t.insert(rpm_t::HEADER_TAGS_URL);
    _t.insert(rpm_t::HEADER_TAGS_OS);
    _t.insert(rpm_t::HEADER_TAGS_ARCH);
    _t.insert(rpm_t::HEADER_TAGS_PRE_INSTALL_SCRIPTLET);
    _t.insert(rpm_t::HEADER_TAGS_POST_INSTALL_SCRIPTLET);
    _t.insert(rpm_t::HEADER_TAGS_PRE_UNINSTALL_SCRIPTLET);
    _t.insert(rpm_t::HEADER_TAGS_POST_UNINSTALL_SCRIPTLET);
    _t.insert(rpm_t::HEADER_TAGS_OLD_FILE_NAMES_OBSOLETE);
    _t.insert(rpm_t::HEADER_TAGS_FILE_SIZES);
    _t.insert(rpm_t::HEADER_TAGS_FILE_STATES);
    _t.insert(rpm_t::HEADER_TAGS_FILE_MODES);
    _t.insert(rpm_t::HEADER_TAGS_FILE_UIDS_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_FILE_GIDS_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_DEVICE_NUMBER);
    _t.insert(rpm_t::HEADER_TAGS_MTIMES);
    _t.insert(rpm_t::HEADER_TAGS_FILE_DIGESTS);
    _t.insert(rpm_t::HEADER_TAGS_LINK_TOS);
    _t.insert(rpm_t::HEADER_TAGS_FILE_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_ROOT_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_FILE_OWNER);
    _t.insert(rpm_t::HEADER_TAGS_FILE_GROUP);
    _t.insert(rpm_t::HEADER_TAGS_EXCLUDE_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_EXCLUSIVE_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_ICON_OBSOLETE);
    _t.insert(rpm_t::HEADER_TAGS_SOURCE_RPM);
    _t.insert(rpm_t::HEADER_TAGS_FILE_VERIFY_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_ARCHIVE_SIZE);
    _t.insert(rpm_t::HEADER_TAGS_PROVIDE_NAME);
    _t.insert(rpm_t::HEADER_TAGS_REQUIRE_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_REQUIRE_NAME);
    _t.insert(rpm_t::HEADER_TAGS_REQUIRE_VERSION);
    _t.insert(rpm_t::HEADER_TAGS_NO_SOURCE);
    _t.insert(rpm_t::HEADER_TAGS_NO_PATCH);
    _t.insert(rpm_t::HEADER_TAGS_CONFLICT_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_CONFLICT_NAME);
    _t.insert(rpm_t::HEADER_TAGS_CONFLICT_VERSION);
    _t.insert(rpm_t::HEADER_TAGS_DEFAULT_PREFIX_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_BUILD_ROOT_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_INSTALL_PREFIX_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_EXCLUDE_ARCH);
    _t.insert(rpm_t::HEADER_TAGS_EXCLUDE_OS);
    _t.insert(rpm_t::HEADER_TAGS_EXCLUSIVE_ARCH);
    _t.insert(rpm_t::HEADER_TAGS_EXCLUSIVE_OS);
    _t.insert(rpm_t::HEADER_TAGS_AUTOREQPROV_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_RPM_VERSION);
    _t.insert(rpm_t::HEADER_TAGS_TRIGGER_SCRIPTS);
    _t.insert(rpm_t::HEADER_TAGS_TRIGGER_NAME);
    _t.insert(rpm_t::HEADER_TAGS_TRIGGER_VERSION);
    _t.insert(rpm_t::HEADER_TAGS_TRIGGER_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_TRIGGER_INDEX);
    _t.insert(rpm_t::HEADER_TAGS_VERIFY_SCRIPT);
    _t.insert(rpm_t::HEADER_TAGS_CHANGELOG_TIME);
    _t.insert(rpm_t::HEADER_TAGS_CHANGELOG_NAME);
    _t.insert(rpm_t::HEADER_TAGS_CHANGELOG_TEXT);
    _t.insert(rpm_t::HEADER_TAGS_BROKEN_MD5_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_PREREQ_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_PRE_INSTALL_INTERPRETER);
    _t.insert(rpm_t::HEADER_TAGS_POST_INSTALL_INTERPRETER);
    _t.insert(rpm_t::HEADER_TAGS_PRE_UNINSTALL_INTERPRETER);
    _t.insert(rpm_t::HEADER_TAGS_POST_UNINSTALL_INTERPRETER);
    _t.insert(rpm_t::HEADER_TAGS_BUILD_ARCHS);
    _t.insert(rpm_t::HEADER_TAGS_OBSOLETE_NAME);
    _t.insert(rpm_t::HEADER_TAGS_VERIFY_SCRIPT_PROG);
    _t.insert(rpm_t::HEADER_TAGS_TRIGGER_SCRIPT_PROG);
    _t.insert(rpm_t::HEADER_TAGS_DOC_DIR_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_COOKIE);
    _t.insert(rpm_t::HEADER_TAGS_FILE_DEVICES);
    _t.insert(rpm_t::HEADER_TAGS_FILE_INODES);
    _t.insert(rpm_t::HEADER_TAGS_FILE_LANGS);
    _t.insert(rpm_t::HEADER_TAGS_PREFIXES);
    _t.insert(rpm_t::HEADER_TAGS_INSTALL_PREFIXES);
    _t.insert(rpm_t::HEADER_TAGS_TRIGGER_INSTALL_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_TRIGGER_UNINSTALL_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_TRIGGER_POST_UNINSTALL_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_AUTOREQ_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_AUTOPROV_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_CAPABILITY_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_SOURCE_PACKAGE);
    _t.insert(rpm_t::HEADER_TAGS_OLD_ORIG_FILENAMES_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_BUILD_PREREQ_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_BUILD_REQUIRES_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_BUILD_CONFLICTS_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_BUILD_MACROS_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_PROVIDE_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_PROVIDE_VERSION);
    _t.insert(rpm_t::HEADER_TAGS_OBSOLETE_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_OBSOLETE_VERSION);
    _t.insert(rpm_t::HEADER_TAGS_DIR_INDEXES);
    _t.insert(rpm_t::HEADER_TAGS_BASE_NAMES);
    _t.insert(rpm_t::HEADER_TAGS_DIR_NAMES);
    _t.insert(rpm_t::HEADER_TAGS_ORIG_DIR_INDEXES);
    _t.insert(rpm_t::HEADER_TAGS_ORIG_BASE_NAMES);
    _t.insert(rpm_t::HEADER_TAGS_ORIG_DIR_NAMES);
    _t.insert(rpm_t::HEADER_TAGS_OPT_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_DIST_URL);
    _t.insert(rpm_t::HEADER_TAGS_PAYLOAD_FORMAT);
    _t.insert(rpm_t::HEADER_TAGS_PAYLOAD_COMPRESSOR);
    _t.insert(rpm_t::HEADER_TAGS_PAYLOAD_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_INSTALL_COLOR);
    _t.insert(rpm_t::HEADER_TAGS_INSTALL_TID);
    _t.insert(rpm_t::HEADER_TAGS_REMOVE_TID_OBSOLETE);
    _t.insert(rpm_t::HEADER_TAGS_SHA1_RHN_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_RHN_PLATFORM_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_PLATFORM);
    _t.insert(rpm_t::HEADER_TAGS_PATCHES_NAME_OBSOLETE);
    _t.insert(rpm_t::HEADER_TAGS_PATCHES_FLAGS_OBSOLETE);
    _t.insert(rpm_t::HEADER_TAGS_PATCHES_VERSION_OBSOLETE);
    _t.insert(rpm_t::HEADER_TAGS_CACHE_CTIME_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_CACHE_PKG_PATH_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_CACHE_PKG_SIZE_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_CACHE_PKG_MTIME_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_FILE_COLORS);
    _t.insert(rpm_t::HEADER_TAGS_FILE_CLASS);
    _t.insert(rpm_t::HEADER_TAGS_CLASS_DICT);
    _t.insert(rpm_t::HEADER_TAGS_FILE_DEPENDS_IDX);
    _t.insert(rpm_t::HEADER_TAGS_FILE_DEPENDS_NUM);
    _t.insert(rpm_t::HEADER_TAGS_DEPENDS_DICT);
    _t.insert(rpm_t::HEADER_TAGS_SOURCE_PKGID);
    _t.insert(rpm_t::HEADER_TAGS_FILE_CONTEXTS_OBSOLETE);
    _t.insert(rpm_t::HEADER_TAGS_FS_CONTEXTS_OBSOLETE);
    _t.insert(rpm_t::HEADER_TAGS_RE_CONTEXTS_OBSOLETE);
    _t.insert(rpm_t::HEADER_TAGS_POLICIES);
    _t.insert(rpm_t::HEADER_TAGS_PRE_TRANS);
    _t.insert(rpm_t::HEADER_TAGS_POST_TRANS);
    _t.insert(rpm_t::HEADER_TAGS_PRE_TRANS_PROG);
    _t.insert(rpm_t::HEADER_TAGS_POST_TRANS_PROG);
    _t.insert(rpm_t::HEADER_TAGS_DIST_TAG);
    _t.insert(rpm_t::HEADER_TAGS_OLD_SUGGESTS_NAME_OBSOLETE);
    _t.insert(rpm_t::HEADER_TAGS_OLD_SUGGESTS_VERSION_OBSOLETE);
    _t.insert(rpm_t::HEADER_TAGS_OLD_SUGGESTS_FLAGS_OBSOLETE);
    _t.insert(rpm_t::HEADER_TAGS_OLD_ENHANCES_NAME_OBSOLETE);
    _t.insert(rpm_t::HEADER_TAGS_OLD_ENHANCES_VERSION_OBSOLETE);
    _t.insert(rpm_t::HEADER_TAGS_OLD_ENHANCES_FLAGS_OBSOLETE);
    _t.insert(rpm_t::HEADER_TAGS_PRIORITY_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_CVSID_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_BLINK_PKGID_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_BLINK_HDRID_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_BLINK_NEVRA_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_FLINK_PKGID_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_FLINK_HDRID_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_FLINK_NEVRA_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_PACKAGE_ORIGIN_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_TRIGGER_PRE_INSTALL_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_BUILD_SUGGESTS_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_BUILD_ENHANCES_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_SCRIPT_STATES_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_SCRIPT_METRICS_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_BUILD_CPU_CLOCK_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_FILE_DIGEST_ALGOS_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_VARIANTS_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_XMAJOR_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_XMINOR_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_REPO_TAG_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_KEYWORDS_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_BUILD_PLATFORMS_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_PACKAGE_COLOR_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_PACKAGE_PREF_COLOR_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_XATTRS_DICT_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_FILEX_ATTRSX_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_DEP_ATTRS_DICT_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_CONFLICT_ATTRSX_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_OBSOLETE_ATTRSX_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_PROVIDE_ATTRSX_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_REQUIRE_ATTRSX_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_BUILD_PROVIDES_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_BUILD_OBSOLETES_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_DB_INSTANCE);
    _t.insert(rpm_t::HEADER_TAGS_NVRA);
    _t.insert(rpm_t::HEADER_TAGS_FILE_NAMES);
    _t.insert(rpm_t::HEADER_TAGS_FILE_PROVIDE);
    _t.insert(rpm_t::HEADER_TAGS_FILE_REQUIRE);
    _t.insert(rpm_t::HEADER_TAGS_FS_NAMES_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_FS_SIZES_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_TRIGGER_CONDS);
    _t.insert(rpm_t::HEADER_TAGS_TRIGGER_TYPE);
    _t.insert(rpm_t::HEADER_TAGS_ORIG_FILE_NAMES);
    _t.insert(rpm_t::HEADER_TAGS_LONG_FILE_SIZES);
    _t.insert(rpm_t::HEADER_TAGS_LONG_SIZE);
    _t.insert(rpm_t::HEADER_TAGS_FILE_CAPS);
    _t.insert(rpm_t::HEADER_TAGS_FILE_DIGEST_ALGO);
    _t.insert(rpm_t::HEADER_TAGS_BUG_URL);
    _t.insert(rpm_t::HEADER_TAGS_EVR);
    _t.insert(rpm_t::HEADER_TAGS_NVR);
    _t.insert(rpm_t::HEADER_TAGS_NEVR);
    _t.insert(rpm_t::HEADER_TAGS_NEVRA);
    _t.insert(rpm_t::HEADER_TAGS_HEADER_COLOR);
    _t.insert(rpm_t::HEADER_TAGS_VERBOSE);
    _t.insert(rpm_t::HEADER_TAGS_EPOCH_NUM);
    _t.insert(rpm_t::HEADER_TAGS_PRE_INSTALL_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_POST_INSTALL_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_PRE_UNINSTALL_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_POST_UNINSTALL_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_PRE_TRANS_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_POST_TRANS_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_VERIFY_SCRIPT_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_TRIGGER_SCRIPT_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_COLLECTIONS_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_POLICY_NAMES);
    _t.insert(rpm_t::HEADER_TAGS_POLICY_TYPES);
    _t.insert(rpm_t::HEADER_TAGS_POLICY_TYPES_INDEXES);
    _t.insert(rpm_t::HEADER_TAGS_POLICY_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_VCS);
    _t.insert(rpm_t::HEADER_TAGS_ORDER_NAME);
    _t.insert(rpm_t::HEADER_TAGS_ORDER_VERSION);
    _t.insert(rpm_t::HEADER_TAGS_ORDER_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_MSSF_MANIFEST_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_MSSF_DOMAIN_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_INST_FILE_NAMES);
    _t.insert(rpm_t::HEADER_TAGS_REQUIRE_NEVRS);
    _t.insert(rpm_t::HEADER_TAGS_PROVIDE_NEVRS);
    _t.insert(rpm_t::HEADER_TAGS_OBSOLETE_NEVRS);
    _t.insert(rpm_t::HEADER_TAGS_CONFLICT_NEVRS);
    _t.insert(rpm_t::HEADER_TAGS_FILE_NLINKS);
    _t.insert(rpm_t::HEADER_TAGS_RECOMMEND_NAME);
    _t.insert(rpm_t::HEADER_TAGS_RECOMMEND_VERSION);
    _t.insert(rpm_t::HEADER_TAGS_RECOMMEND_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_SUGGEST_NAME);
    _t.insert(rpm_t::HEADER_TAGS_SUGGEST_VERSION);
    _t.insert(rpm_t::HEADER_TAGS_SUGGEST_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_SUPPLEMENT_NAME);
    _t.insert(rpm_t::HEADER_TAGS_SUPPLEMENT_VERSION);
    _t.insert(rpm_t::HEADER_TAGS_SUPPLEMENT_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_ENHANCE_NAME);
    _t.insert(rpm_t::HEADER_TAGS_ENHANCE_VERSION);
    _t.insert(rpm_t::HEADER_TAGS_ENHANCE_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_RECOMMEND_NEVRS);
    _t.insert(rpm_t::HEADER_TAGS_SUGGEST_NEVRS);
    _t.insert(rpm_t::HEADER_TAGS_SUPPLEMENT_NEVRS);
    _t.insert(rpm_t::HEADER_TAGS_ENHANCE_NEVRS);
    _t.insert(rpm_t::HEADER_TAGS_ENCODING);
    _t.insert(rpm_t::HEADER_TAGS_FILE_TRIGGER_INSTALL_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_FILE_TRIGGER_UNINSTALL_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_FILE_TRIGGER_POST_UNINSTALL_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_FILE_TRIGGER_SCRIPTS);
    _t.insert(rpm_t::HEADER_TAGS_FILE_TRIGGER_SCRIPT_PROG);
    _t.insert(rpm_t::HEADER_TAGS_FILE_TRIGGER_SCRIPT_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_FILE_TRIGGER_NAME);
    _t.insert(rpm_t::HEADER_TAGS_FILE_TRIGGER_INDEX);
    _t.insert(rpm_t::HEADER_TAGS_FILE_TRIGGER_VERSION);
    _t.insert(rpm_t::HEADER_TAGS_FILE_TRIGGER_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_INSTALL_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_UNINSTALL_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_POST_UNINSTALL_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_SCRIPTS);
    _t.insert(rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_SCRIPT_PROG);
    _t.insert(rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_SCRIPT_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_NAME);
    _t.insert(rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_INDEX);
    _t.insert(rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_VERSION);
    _t.insert(rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_REMOVE_PATH_POSTFIXES_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_FILE_TRIGGER_PRIORITIES);
    _t.insert(rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_PRIORITIES);
    _t.insert(rpm_t::HEADER_TAGS_FILE_TRIGGER_CONDS);
    _t.insert(rpm_t::HEADER_TAGS_FILE_TRIGGER_TYPE);
    _t.insert(rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_CONDS);
    _t.insert(rpm_t::HEADER_TAGS_TRANS_FILE_TRIGGER_TYPE);
    _t.insert(rpm_t::HEADER_TAGS_FILE_SIGNATURES);
    _t.insert(rpm_t::HEADER_TAGS_FILE_SIGNATURE_LENGTH);
    _t.insert(rpm_t::HEADER_TAGS_PAYLOAD_DIGEST);
    _t.insert(rpm_t::HEADER_TAGS_PAYLOAD_DIGEST_ALGO);
    _t.insert(rpm_t::HEADER_TAGS_AUTO_INSTALLED_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_IDENTITY_UNIMPLEMENTED);
    _t.insert(rpm_t::HEADER_TAGS_MODULARITY_LABEL);
    _t.insert(rpm_t::HEADER_TAGS_PAYLOAD_DIGEST_ALT);
    _t.insert(rpm_t::HEADER_TAGS_ARCH_SUFFIX);
    _t.insert(rpm_t::HEADER_TAGS_SPEC);
    _t.insert(rpm_t::HEADER_TAGS_TRANSLATION_URL);
    _t.insert(rpm_t::HEADER_TAGS_UPSTREAM_RELEASES);
    _t.insert(rpm_t::HEADER_TAGS_SOURCE_LICENSE_INTERNAL);
    _t.insert(rpm_t::HEADER_TAGS_PRE_UNTRANS);
    _t.insert(rpm_t::HEADER_TAGS_POST_UNTRANS);
    _t.insert(rpm_t::HEADER_TAGS_PRE_UNTRANS_PROG);
    _t.insert(rpm_t::HEADER_TAGS_POST_UNTRANS_PROG);
    _t.insert(rpm_t::HEADER_TAGS_PRE_UNTRANS_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_POST_UNTRANS_FLAGS);
    _t.insert(rpm_t::HEADER_TAGS_SYS_USERS);
    return _t;
}
const std::set<rpm_t::header_tags_t> rpm_t::_values_header_tags_t = rpm_t::_build_values_header_tags_t();
bool rpm_t::_is_defined_header_tags_t(rpm_t::header_tags_t v) {
    return rpm_t::_values_header_tags_t.find(v) != rpm_t::_values_header_tags_t.end();
}
std::set<rpm_t::operating_systems_t> rpm_t::_build_values_operating_systems_t() {
    std::set<rpm_t::operating_systems_t> _t;
    _t.insert(rpm_t::OPERATING_SYSTEMS_LINUX);
    _t.insert(rpm_t::OPERATING_SYSTEMS_IRIX);
    _t.insert(rpm_t::OPERATING_SYSTEMS_NO_OS);
    return _t;
}
const std::set<rpm_t::operating_systems_t> rpm_t::_values_operating_systems_t = rpm_t::_build_values_operating_systems_t();
bool rpm_t::_is_defined_operating_systems_t(rpm_t::operating_systems_t v) {
    return rpm_t::_values_operating_systems_t.find(v) != rpm_t::_values_operating_systems_t.end();
}
std::set<rpm_t::record_types_t> rpm_t::_build_values_record_types_t() {
    std::set<rpm_t::record_types_t> _t;
    _t.insert(rpm_t::RECORD_TYPES_NOT_IMPLEMENTED);
    _t.insert(rpm_t::RECORD_TYPES_CHAR);
    _t.insert(rpm_t::RECORD_TYPES_UINT8);
    _t.insert(rpm_t::RECORD_TYPES_UINT16);
    _t.insert(rpm_t::RECORD_TYPES_UINT32);
    _t.insert(rpm_t::RECORD_TYPES_UINT64);
    _t.insert(rpm_t::RECORD_TYPES_STRING);
    _t.insert(rpm_t::RECORD_TYPES_BIN);
    _t.insert(rpm_t::RECORD_TYPES_STRING_ARRAY);
    _t.insert(rpm_t::RECORD_TYPES_I18N_STRING);
    return _t;
}
const std::set<rpm_t::record_types_t> rpm_t::_values_record_types_t = rpm_t::_build_values_record_types_t();
bool rpm_t::_is_defined_record_types_t(rpm_t::record_types_t v) {
    return rpm_t::_values_record_types_t.find(v) != rpm_t::_values_record_types_t.end();
}
std::set<rpm_t::rpm_types_t> rpm_t::_build_values_rpm_types_t() {
    std::set<rpm_t::rpm_types_t> _t;
    _t.insert(rpm_t::RPM_TYPES_BINARY);
    _t.insert(rpm_t::RPM_TYPES_SOURCE);
    return _t;
}
const std::set<rpm_t::rpm_types_t> rpm_t::_values_rpm_types_t = rpm_t::_build_values_rpm_types_t();
bool rpm_t::_is_defined_rpm_types_t(rpm_t::rpm_types_t v) {
    return rpm_t::_values_rpm_types_t.find(v) != rpm_t::_values_rpm_types_t.end();
}
std::set<rpm_t::signature_tags_t> rpm_t::_build_values_signature_tags_t() {
    std::set<rpm_t::signature_tags_t> _t;
    _t.insert(rpm_t::SIGNATURE_TAGS_SIGNATURES);
    _t.insert(rpm_t::SIGNATURE_TAGS_HEADER_IMMUTABLE);
    _t.insert(rpm_t::SIGNATURE_TAGS_I18N_TABLE);
    _t.insert(rpm_t::SIGNATURE_TAGS_BAD_SHA1_1_OBSOLETE);
    _t.insert(rpm_t::SIGNATURE_TAGS_BAD_SHA1_2_OBSOLETE);
    _t.insert(rpm_t::SIGNATURE_TAGS_DSA);
    _t.insert(rpm_t::SIGNATURE_TAGS_RSA);
    _t.insert(rpm_t::SIGNATURE_TAGS_SHA1);
    _t.insert(rpm_t::SIGNATURE_TAGS_LONG_SIZE);
    _t.insert(rpm_t::SIGNATURE_TAGS_LONG_ARCHIVE_SIZE);
    _t.insert(rpm_t::SIGNATURE_TAGS_SHA256);
    _t.insert(rpm_t::SIGNATURE_TAGS_FILE_SIGNATURES);
    _t.insert(rpm_t::SIGNATURE_TAGS_FILE_SIGNATURE_LENGTH);
    _t.insert(rpm_t::SIGNATURE_TAGS_VERITY_SIGNATURES);
    _t.insert(rpm_t::SIGNATURE_TAGS_VERITY_SIGNATURE_ALGO);
    _t.insert(rpm_t::SIGNATURE_TAGS_SIZE);
    _t.insert(rpm_t::SIGNATURE_TAGS_LE_MD5_1_OBSOLETE);
    _t.insert(rpm_t::SIGNATURE_TAGS_PGP);
    _t.insert(rpm_t::SIGNATURE_TAGS_LE_MD5_2_OBSOLETE);
    _t.insert(rpm_t::SIGNATURE_TAGS_MD5);
    _t.insert(rpm_t::SIGNATURE_TAGS_GPG);
    _t.insert(rpm_t::SIGNATURE_TAGS_PGP5_OBSOLETE);
    _t.insert(rpm_t::SIGNATURE_TAGS_PAYLOAD_SIZE);
    _t.insert(rpm_t::SIGNATURE_TAGS_RESERVED_SPACE);
    return _t;
}
const std::set<rpm_t::signature_tags_t> rpm_t::_values_signature_tags_t = rpm_t::_build_values_signature_tags_t();
bool rpm_t::_is_defined_signature_tags_t(rpm_t::signature_tags_t v) {
    return rpm_t::_values_signature_tags_t.find(v) != rpm_t::_values_signature_tags_t.end();
}

rpm_t::rpm_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_lead = 0;
    m_signature = 0;
    m_header = 0;
    m_signature_tags_steps = 0;
    f_has_signature_size_tag = false;
    f_len_header = false;
    f_len_payload = false;
    f_ofs_header = false;
    f_ofs_payload = false;
    f_payload = false;
    f_signature_size_tag = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::_read() {
    m_lead = new lead_t(m__io, this, m__root);
    m_signature = new header_t(true, m__io, this, m__root);
    m_signature_padding = m__io->read_bytes(kaitai::kstream::mod(-(_io()->pos()), 8));
    n__unnamed3 = true;
    if (ofs_header() < 0) {
        n__unnamed3 = false;
        m__unnamed3 = m__io->read_bytes(0);
    }
    m_header = new header_t(false, m__io, this, m__root);
    n__unnamed5 = true;
    if (ofs_payload() < 0) {
        n__unnamed5 = false;
        m__unnamed5 = m__io->read_bytes(0);
    }
    m_signature_tags_steps = new std::vector<signature_tags_step_t*>();
    const int l_signature_tags_steps = signature()->header_record()->num_index_records();
    for (int i = 0; i < l_signature_tags_steps; i++) {
        m_signature_tags_steps->push_back(new signature_tags_step_t(i, ((i < 1) ? (-1) : (signature_tags_steps()->at(i - 1)->size_tag_idx())), m__io, this, m__root));
    }
}

rpm_t::~rpm_t() {
    _clean_up();
}

void rpm_t::_clean_up() {
    if (m_lead) {
        delete m_lead; m_lead = 0;
    }
    if (m_signature) {
        delete m_signature; m_signature = 0;
    }
    if (!n__unnamed3) {
    }
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (!n__unnamed5) {
    }
    if (m_signature_tags_steps) {
        for (std::vector<signature_tags_step_t*>::iterator it = m_signature_tags_steps->begin(); it != m_signature_tags_steps->end(); ++it) {
            delete *it;
        }
        delete m_signature_tags_steps; m_signature_tags_steps = 0;
    }
    if (f_payload && !n_payload) {
    }
}

rpm_t::dummy_t::dummy_t(kaitai::kstream* p__io, rpm_t::header_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_header_record = 0;
    m_index_records = 0;
    m_storage_section = 0;
    m__io__raw_storage_section = 0;
    f_is_header = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::header_t::_read() {
    m_header_record = new header_record_t(m__io, this, m__root);
    m_index_records = new std::vector<header_index_record_t*>();
    const int l_index_records = header_record()->num_index_records();
    for (int i = 0; i < l_index_records; i++) {
        m_index_records->push_back(new header_index_record_t(m__io, this, m__root));
    }
    m__raw_storage_section = m__io->read_bytes(header_record()->len_storage_section());
    m__io__raw_storage_section = new kaitai::kstream(m__raw_storage_section);
    m_storage_section = new dummy_t(m__io__raw_storage_section, this, m__root);
}

rpm_t::header_t::~header_t() {
    _clean_up();
}

void rpm_t::header_t::_clean_up() {
    if (m_header_record) {
        delete m_header_record; m_header_record = 0;
    }
    if (m_index_records) {
        for (std::vector<header_index_record_t*>::iterator it = m_index_records->begin(); it != m_index_records->end(); ++it) {
            delete *it;
        }
        delete m_index_records; m_index_records = 0;
    }
    if (m__io__raw_storage_section) {
        delete m__io__raw_storage_section; m__io__raw_storage_section = 0;
    }
    if (m_storage_section) {
        delete m_storage_section; m_storage_section = 0;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

kaitai::kstruct* rpm_t::header_index_record_t::body() {
    if (f_body)
        return m_body;
    f_body = true;
    kaitai::kstream *io = _parent()->storage_section()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_body());
    n_body = true;
    switch (record_type()) {
    case rpm_t::RECORD_TYPES_BIN: {
        n_body = false;
        m_body = new record_type_bin_t(len_value(), io, this, m__root);
        break;
    }
    case rpm_t::RECORD_TYPES_CHAR: {
        n_body = false;
        m_body = new record_type_uint8_t(num_values(), io, this, m__root);
        break;
    }
    case rpm_t::RECORD_TYPES_I18N_STRING: {
        n_body = false;
        m_body = new record_type_string_array_t(num_values(), io, this, m__root);
        break;
    }
    case rpm_t::RECORD_TYPES_STRING: {
        n_body = false;
        m_body = new record_type_string_t(io, this, m__root);
        break;
    }
    case rpm_t::RECORD_TYPES_STRING_ARRAY: {
        n_body = false;
        m_body = new record_type_string_array_t(num_values(), io, this, m__root);
        break;
    }
    case rpm_t::RECORD_TYPES_UINT16: {
        n_body = false;
        m_body = new record_type_uint16_t(num_values(), io, this, m__root);
        break;
    }
    case rpm_t::RECORD_TYPES_UINT32: {
        n_body = false;
        m_body = new record_type_uint32_t(num_values(), io, this, m__root);
        break;
    }
    case rpm_t::RECORD_TYPES_UINT64: {
        n_body = false;
        m_body = new record_type_uint64_t(num_values(), io, this, m__root);
        break;
    }
    case rpm_t::RECORD_TYPES_UINT8: {
        n_body = false;
        m_body = new record_type_uint8_t(num_values(), io, this, m__root);
        break;
    }
    }
    io->seek(_pos);
    return m_body;
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_version = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::lead_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\xED\xAB\xEE\xDB", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xED\xAB\xEE\xDB", 4), m_magic, m__io, std::string("/types/lead/seq/0"));
    }
    m_version = new rpm_version_t(m__io, this, m__root);
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
    if (m_version) {
        delete m_version; m_version = 0;
    }
}

rpm_t::record_type_bin_t::record_type_bin_t(uint32_t p_len_value, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len_value = p_len_value;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::record_type_bin_t::_read() {
    m_values = new std::vector<std::string>();
    const int l_values = 1;
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_bytes(len_value()));
    }
}

rpm_t::record_type_bin_t::~record_type_bin_t() {
    _clean_up();
}

void rpm_t::record_type_bin_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

rpm_t::record_type_string_t::record_type_string_t(kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::record_type_string_t::_read() {
    m_values = new std::vector<std::string>();
    const int l_values = 1;
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "UTF-8"));
    }
}

rpm_t::record_type_string_t::~record_type_string_t() {
    _clean_up();
}

void rpm_t::record_type_string_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

rpm_t::record_type_string_array_t::record_type_string_array_t(uint32_t p_num_values, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_values = p_num_values;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::record_type_string_array_t::_read() {
    m_values = new std::vector<std::string>();
    const int l_values = num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "UTF-8"));
    }
}

rpm_t::record_type_string_array_t::~record_type_string_array_t() {
    _clean_up();
}

void rpm_t::record_type_string_array_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

rpm_t::record_type_uint16_t::record_type_uint16_t(uint32_t p_num_values, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_values = p_num_values;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::record_type_uint16_t::_read() {
    m_values = new std::vector<uint16_t>();
    const int l_values = num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_u2be());
    }
}

rpm_t::record_type_uint16_t::~record_type_uint16_t() {
    _clean_up();
}

void rpm_t::record_type_uint16_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

rpm_t::record_type_uint32_t::record_type_uint32_t(uint32_t p_num_values, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_values = p_num_values;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::record_type_uint32_t::_read() {
    m_values = new std::vector<uint32_t>();
    const int l_values = num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_u4be());
    }
}

rpm_t::record_type_uint32_t::~record_type_uint32_t() {
    _clean_up();
}

void rpm_t::record_type_uint32_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

rpm_t::record_type_uint64_t::record_type_uint64_t(uint32_t p_num_values, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_values = p_num_values;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::record_type_uint64_t::_read() {
    m_values = new std::vector<uint64_t>();
    const int l_values = num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_u8be());
    }
}

rpm_t::record_type_uint64_t::~record_type_uint64_t() {
    _clean_up();
}

void rpm_t::record_type_uint64_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

rpm_t::record_type_uint8_t::record_type_uint8_t(uint32_t p_num_values, kaitai::kstream* p__io, rpm_t::header_index_record_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_values = p_num_values;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void rpm_t::record_type_uint8_t::_read() {
    m_values = new std::vector<uint8_t>();
    const int l_values = num_values();
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_u1());
    }
}

rpm_t::record_type_uint8_t::~record_type_uint8_t() {
    _clean_up();
}

void rpm_t::record_type_uint8_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

rpm_t::rpm_version_t::rpm_version_t(kaitai::kstream* p__io, rpm_t::lead_t* p__parent, rpm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
        m_signature_size_tag = signature()->index_records()->at(signature_tags_steps()->back()->size_tag_idx());
    }
    return m_signature_size_tag;
}
