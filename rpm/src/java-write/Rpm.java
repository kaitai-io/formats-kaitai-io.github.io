// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


/**
 * This parser is for the RPM version 3 file format which is the current version
 * of the file format used by RPM 2.1 and later (including RPM version 4.x, which
 * is the current version of the RPM tool). There are historical versions of the
 * RPM file format, as well as a currently abandoned fork (rpm5). These formats
 * are not covered by this specification.
 * @see <a href="https://github.com/rpm-software-management/rpm/blob/afad3167/docs/manual/format.md">Source</a>
 * @see <a href="https://github.com/rpm-software-management/rpm/blob/afad3167/docs/manual/tags.md">Source</a>
 * @see <a href="https://refspecs.linuxbase.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/pkgformat.html">Source</a>
 * @see <a href="http://ftp.rpm.org/max-rpm/">Source</a>
 */
public class Rpm extends KaitaiStruct.ReadWrite {
    public static Rpm fromFile(String fileName) throws IOException {
        return new Rpm(new ByteBufferKaitaiStream(fileName));
    }

    public enum Architectures {
        X86(1),
        ALPHA(2),
        SPARC(3),
        MIPS(4),
        PPC(5),
        M68K(6),
        SGI(7),
        RS6000(8),
        IA64(9),
        SPARC64(10),
        MIPS64(11),
        ARM(12),
        M68K_MINT(13),
        S390(14),
        S390X(15),
        PPC64(16),
        SH(17),
        XTENSA(18),
        AARCH64(19),
        MIPS_R6(20),
        MIPS64_R6(21),
        RISCV(22),
        LOONGARCH64(23),
        NO_ARCH(255);

        private final long id;
        Architectures(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Architectures> byId = new HashMap<Long, Architectures>(24);
        static {
            for (Architectures e : Architectures.values())
                byId.put(e.id(), e);
        }
        public static Architectures byId(long id) { return byId.get(id); }
    }

    public enum HeaderTags {
        SIGNATURES(62),
        HEADER_IMMUTABLE(63),
        I18N_TABLE(100),
        NAME(1000),
        VERSION(1001),
        RELEASE(1002),
        EPOCH(1003),
        SUMMARY(1004),
        DESCRIPTION(1005),
        BUILD_TIME(1006),
        BUILD_HOST(1007),
        INSTALL_TIME(1008),
        SIZE(1009),
        DISTRIBUTION(1010),
        VENDOR(1011),
        GIF_OBSOLETE(1012),
        XPM_OBSOLETE(1013),
        LICENSE(1014),
        PACKAGER(1015),
        GROUP(1016),
        CHANGELOG_INTERNAL(1017),
        SOURCE(1018),
        PATCH(1019),
        URL(1020),
        OS(1021),
        ARCH(1022),
        PRE_INSTALL_SCRIPTLET(1023),
        POST_INSTALL_SCRIPTLET(1024),
        PRE_UNINSTALL_SCRIPTLET(1025),
        POST_UNINSTALL_SCRIPTLET(1026),
        OLD_FILE_NAMES_OBSOLETE(1027),
        FILE_SIZES(1028),
        FILE_STATES(1029),
        FILE_MODES(1030),
        FILE_UIDS_INTERNAL(1031),
        FILE_GIDS_INTERNAL(1032),
        DEVICE_NUMBER(1033),
        MTIMES(1034),
        FILE_DIGESTS(1035),
        LINK_TOS(1036),
        FILE_FLAGS(1037),
        ROOT_INTERNAL(1038),
        FILE_OWNER(1039),
        FILE_GROUP(1040),
        EXCLUDE_INTERNAL(1041),
        EXCLUSIVE_INTERNAL(1042),
        ICON_OBSOLETE(1043),
        SOURCE_RPM(1044),
        FILE_VERIFY_FLAGS(1045),
        ARCHIVE_SIZE(1046),
        PROVIDE_NAME(1047),
        REQUIRE_FLAGS(1048),
        REQUIRE_NAME(1049),
        REQUIRE_VERSION(1050),
        NO_SOURCE(1051),
        NO_PATCH(1052),
        CONFLICT_FLAGS(1053),
        CONFLICT_NAME(1054),
        CONFLICT_VERSION(1055),
        DEFAULT_PREFIX_INTERNAL(1056),
        BUILD_ROOT_INTERNAL(1057),
        INSTALL_PREFIX_INTERNAL(1058),
        EXCLUDE_ARCH(1059),
        EXCLUDE_OS(1060),
        EXCLUSIVE_ARCH(1061),
        EXCLUSIVE_OS(1062),
        AUTOREQPROV_INTERNAL(1063),
        RPM_VERSION(1064),
        TRIGGER_SCRIPTS(1065),
        TRIGGER_NAME(1066),
        TRIGGER_VERSION(1067),
        TRIGGER_FLAGS(1068),
        TRIGGER_INDEX(1069),
        VERIFY_SCRIPT(1079),
        CHANGELOG_TIME(1080),
        CHANGELOG_NAME(1081),
        CHANGELOG_TEXT(1082),
        BROKEN_MD5_INTERNAL(1083),
        PREREQ_INTERNAL(1084),
        PRE_INSTALL_INTERPRETER(1085),
        POST_INSTALL_INTERPRETER(1086),
        PRE_UNINSTALL_INTERPRETER(1087),
        POST_UNINSTALL_INTERPRETER(1088),
        BUILD_ARCHS(1089),
        OBSOLETE_NAME(1090),
        VERIFY_SCRIPT_PROG(1091),
        TRIGGER_SCRIPT_PROG(1092),
        DOC_DIR_INTERNAL(1093),
        COOKIE(1094),
        FILE_DEVICES(1095),
        FILE_INODES(1096),
        FILE_LANGS(1097),
        PREFIXES(1098),
        INSTALL_PREFIXES(1099),
        TRIGGER_INSTALL_INTERNAL(1100),
        TRIGGER_UNINSTALL_INTERNAL(1101),
        TRIGGER_POST_UNINSTALL_INTERNAL(1102),
        AUTOREQ_INTERNAL(1103),
        AUTOPROV_INTERNAL(1104),
        CAPABILITY_INTERNAL(1105),
        SOURCE_PACKAGE(1106),
        OLD_ORIG_FILENAMES_INTERNAL(1107),
        BUILD_PREREQ_INTERNAL(1108),
        BUILD_REQUIRES_INTERNAL(1109),
        BUILD_CONFLICTS_INTERNAL(1110),
        BUILD_MACROS_INTERNAL(1111),
        PROVIDE_FLAGS(1112),
        PROVIDE_VERSION(1113),
        OBSOLETE_FLAGS(1114),
        OBSOLETE_VERSION(1115),
        DIR_INDEXES(1116),
        BASE_NAMES(1117),
        DIR_NAMES(1118),
        ORIG_DIR_INDEXES(1119),
        ORIG_BASE_NAMES(1120),
        ORIG_DIR_NAMES(1121),
        OPT_FLAGS(1122),
        DIST_URL(1123),
        PAYLOAD_FORMAT(1124),
        PAYLOAD_COMPRESSOR(1125),
        PAYLOAD_FLAGS(1126),
        INSTALL_COLOR(1127),
        INSTALL_TID(1128),
        REMOVE_TID_OBSOLETE(1129),
        SHA1_RHN_INTERNAL(1130),
        RHN_PLATFORM_INTERNAL(1131),
        PLATFORM(1132),
        PATCHES_NAME_OBSOLETE(1133),
        PATCHES_FLAGS_OBSOLETE(1134),
        PATCHES_VERSION_OBSOLETE(1135),
        CACHE_CTIME_INTERNAL(1136),
        CACHE_PKG_PATH_INTERNAL(1137),
        CACHE_PKG_SIZE_INTERNAL(1138),
        CACHE_PKG_MTIME_INTERNAL(1139),
        FILE_COLORS(1140),
        FILE_CLASS(1141),
        CLASS_DICT(1142),
        FILE_DEPENDS_IDX(1143),
        FILE_DEPENDS_NUM(1144),
        DEPENDS_DICT(1145),
        SOURCE_PKGID(1146),
        FILE_CONTEXTS_OBSOLETE(1147),
        FS_CONTEXTS_OBSOLETE(1148),
        RE_CONTEXTS_OBSOLETE(1149),
        POLICIES(1150),
        PRE_TRANS(1151),
        POST_TRANS(1152),
        PRE_TRANS_PROG(1153),
        POST_TRANS_PROG(1154),
        DIST_TAG(1155),
        OLD_SUGGESTS_NAME_OBSOLETE(1156),
        OLD_SUGGESTS_VERSION_OBSOLETE(1157),
        OLD_SUGGESTS_FLAGS_OBSOLETE(1158),
        OLD_ENHANCES_NAME_OBSOLETE(1159),
        OLD_ENHANCES_VERSION_OBSOLETE(1160),
        OLD_ENHANCES_FLAGS_OBSOLETE(1161),
        PRIORITY_UNIMPLEMENTED(1162),
        CVSID_UNIMPLEMENTED(1163),
        BLINK_PKGID_UNIMPLEMENTED(1164),
        BLINK_HDRID_UNIMPLEMENTED(1165),
        BLINK_NEVRA_UNIMPLEMENTED(1166),
        FLINK_PKGID_UNIMPLEMENTED(1167),
        FLINK_HDRID_UNIMPLEMENTED(1168),
        FLINK_NEVRA_UNIMPLEMENTED(1169),
        PACKAGE_ORIGIN_UNIMPLEMENTED(1170),
        TRIGGER_PRE_INSTALL_INTERNAL(1171),
        BUILD_SUGGESTS_UNIMPLEMENTED(1172),
        BUILD_ENHANCES_UNIMPLEMENTED(1173),
        SCRIPT_STATES_UNIMPLEMENTED(1174),
        SCRIPT_METRICS_UNIMPLEMENTED(1175),
        BUILD_CPU_CLOCK_UNIMPLEMENTED(1176),
        FILE_DIGEST_ALGOS_UNIMPLEMENTED(1177),
        VARIANTS_UNIMPLEMENTED(1178),
        XMAJOR_UNIMPLEMENTED(1179),
        XMINOR_UNIMPLEMENTED(1180),
        REPO_TAG_UNIMPLEMENTED(1181),
        KEYWORDS_UNIMPLEMENTED(1182),
        BUILD_PLATFORMS_UNIMPLEMENTED(1183),
        PACKAGE_COLOR_UNIMPLEMENTED(1184),
        PACKAGE_PREF_COLOR_UNIMPLEMENTED(1185),
        XATTRS_DICT_UNIMPLEMENTED(1186),
        FILEX_ATTRSX_UNIMPLEMENTED(1187),
        DEP_ATTRS_DICT_UNIMPLEMENTED(1188),
        CONFLICT_ATTRSX_UNIMPLEMENTED(1189),
        OBSOLETE_ATTRSX_UNIMPLEMENTED(1190),
        PROVIDE_ATTRSX_UNIMPLEMENTED(1191),
        REQUIRE_ATTRSX_UNIMPLEMENTED(1192),
        BUILD_PROVIDES_UNIMPLEMENTED(1193),
        BUILD_OBSOLETES_UNIMPLEMENTED(1194),
        DB_INSTANCE(1195),
        NVRA(1196),
        FILE_NAMES(5000),
        FILE_PROVIDE(5001),
        FILE_REQUIRE(5002),
        FS_NAMES_UNIMPLEMENTED(5003),
        FS_SIZES_UNIMPLEMENTED(5004),
        TRIGGER_CONDS(5005),
        TRIGGER_TYPE(5006),
        ORIG_FILE_NAMES(5007),
        LONG_FILE_SIZES(5008),
        LONG_SIZE(5009),
        FILE_CAPS(5010),
        FILE_DIGEST_ALGO(5011),
        BUG_URL(5012),
        EVR(5013),
        NVR(5014),
        NEVR(5015),
        NEVRA(5016),
        HEADER_COLOR(5017),
        VERBOSE(5018),
        EPOCH_NUM(5019),
        PRE_INSTALL_FLAGS(5020),
        POST_INSTALL_FLAGS(5021),
        PRE_UNINSTALL_FLAGS(5022),
        POST_UNINSTALL_FLAGS(5023),
        PRE_TRANS_FLAGS(5024),
        POST_TRANS_FLAGS(5025),
        VERIFY_SCRIPT_FLAGS(5026),
        TRIGGER_SCRIPT_FLAGS(5027),
        COLLECTIONS_UNIMPLEMENTED(5029),
        POLICY_NAMES(5030),
        POLICY_TYPES(5031),
        POLICY_TYPES_INDEXES(5032),
        POLICY_FLAGS(5033),
        VCS(5034),
        ORDER_NAME(5035),
        ORDER_VERSION(5036),
        ORDER_FLAGS(5037),
        MSSF_MANIFEST_UNIMPLEMENTED(5038),
        MSSF_DOMAIN_UNIMPLEMENTED(5039),
        INST_FILE_NAMES(5040),
        REQUIRE_NEVRS(5041),
        PROVIDE_NEVRS(5042),
        OBSOLETE_NEVRS(5043),
        CONFLICT_NEVRS(5044),
        FILE_NLINKS(5045),
        RECOMMEND_NAME(5046),
        RECOMMEND_VERSION(5047),
        RECOMMEND_FLAGS(5048),
        SUGGEST_NAME(5049),
        SUGGEST_VERSION(5050),
        SUGGEST_FLAGS(5051),
        SUPPLEMENT_NAME(5052),
        SUPPLEMENT_VERSION(5053),
        SUPPLEMENT_FLAGS(5054),
        ENHANCE_NAME(5055),
        ENHANCE_VERSION(5056),
        ENHANCE_FLAGS(5057),
        RECOMMEND_NEVRS(5058),
        SUGGEST_NEVRS(5059),
        SUPPLEMENT_NEVRS(5060),
        ENHANCE_NEVRS(5061),
        ENCODING(5062),
        FILE_TRIGGER_INSTALL_INTERNAL(5063),
        FILE_TRIGGER_UNINSTALL_INTERNAL(5064),
        FILE_TRIGGER_POST_UNINSTALL_INTERNAL(5065),
        FILE_TRIGGER_SCRIPTS(5066),
        FILE_TRIGGER_SCRIPT_PROG(5067),
        FILE_TRIGGER_SCRIPT_FLAGS(5068),
        FILE_TRIGGER_NAME(5069),
        FILE_TRIGGER_INDEX(5070),
        FILE_TRIGGER_VERSION(5071),
        FILE_TRIGGER_FLAGS(5072),
        TRANS_FILE_TRIGGER_INSTALL_INTERNAL(5073),
        TRANS_FILE_TRIGGER_UNINSTALL_INTERNAL(5074),
        TRANS_FILE_TRIGGER_POST_UNINSTALL_INTERNAL(5075),
        TRANS_FILE_TRIGGER_SCRIPTS(5076),
        TRANS_FILE_TRIGGER_SCRIPT_PROG(5077),
        TRANS_FILE_TRIGGER_SCRIPT_FLAGS(5078),
        TRANS_FILE_TRIGGER_NAME(5079),
        TRANS_FILE_TRIGGER_INDEX(5080),
        TRANS_FILE_TRIGGER_VERSION(5081),
        TRANS_FILE_TRIGGER_FLAGS(5082),
        REMOVE_PATH_POSTFIXES_INTERNAL(5083),
        FILE_TRIGGER_PRIORITIES(5084),
        TRANS_FILE_TRIGGER_PRIORITIES(5085),
        FILE_TRIGGER_CONDS(5086),
        FILE_TRIGGER_TYPE(5087),
        TRANS_FILE_TRIGGER_CONDS(5088),
        TRANS_FILE_TRIGGER_TYPE(5089),
        FILE_SIGNATURES(5090),
        FILE_SIGNATURE_LENGTH(5091),
        PAYLOAD_DIGEST(5092),
        PAYLOAD_DIGEST_ALGO(5093),
        AUTO_INSTALLED_UNIMPLEMENTED(5094),
        IDENTITY_UNIMPLEMENTED(5095),
        MODULARITY_LABEL(5096),
        PAYLOAD_DIGEST_ALT(5097),
        ARCH_SUFFIX(5098),
        SPEC(5099),
        TRANSLATION_URL(5100),
        UPSTREAM_RELEASES(5101),
        SOURCE_LICENSE_INTERNAL(5102),
        PRE_UNTRANS(5103),
        POST_UNTRANS(5104),
        PRE_UNTRANS_PROG(5105),
        POST_UNTRANS_PROG(5106),
        PRE_UNTRANS_FLAGS(5107),
        POST_UNTRANS_FLAGS(5108),
        SYS_USERS(5109);

        private final long id;
        HeaderTags(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, HeaderTags> byId = new HashMap<Long, HeaderTags>(300);
        static {
            for (HeaderTags e : HeaderTags.values())
                byId.put(e.id(), e);
        }
        public static HeaderTags byId(long id) { return byId.get(id); }
    }

    public enum OperatingSystems {
        LINUX(1),
        IRIX(2),
        NO_OS(255);

        private final long id;
        OperatingSystems(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, OperatingSystems> byId = new HashMap<Long, OperatingSystems>(3);
        static {
            for (OperatingSystems e : OperatingSystems.values())
                byId.put(e.id(), e);
        }
        public static OperatingSystems byId(long id) { return byId.get(id); }
    }

    public enum RecordTypes {
        NOT_IMPLEMENTED(0),
        CHAR(1),
        UINT8(2),
        UINT16(3),
        UINT32(4),
        UINT64(5),
        STRING(6),
        BIN(7),
        STRING_ARRAY(8),
        I18N_STRING(9);

        private final long id;
        RecordTypes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, RecordTypes> byId = new HashMap<Long, RecordTypes>(10);
        static {
            for (RecordTypes e : RecordTypes.values())
                byId.put(e.id(), e);
        }
        public static RecordTypes byId(long id) { return byId.get(id); }
    }

    public enum RpmTypes {
        BINARY(0),
        SOURCE(1);

        private final long id;
        RpmTypes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, RpmTypes> byId = new HashMap<Long, RpmTypes>(2);
        static {
            for (RpmTypes e : RpmTypes.values())
                byId.put(e.id(), e);
        }
        public static RpmTypes byId(long id) { return byId.get(id); }
    }

    public enum SignatureTags {
        SIGNATURES(62),
        HEADER_IMMUTABLE(63),
        I18N_TABLE(100),
        BAD_SHA1_1_OBSOLETE(264),
        BAD_SHA1_2_OBSOLETE(265),
        DSA(267),
        RSA(268),
        SHA1(269),
        LONG_SIZE(270),
        LONG_ARCHIVE_SIZE(271),
        SHA256(273),
        FILE_SIGNATURES(274),
        FILE_SIGNATURE_LENGTH(275),
        VERITY_SIGNATURES(276),
        VERITY_SIGNATURE_ALGO(277),
        SIZE(1000),
        LE_MD5_1_OBSOLETE(1001),
        PGP(1002),
        LE_MD5_2_OBSOLETE(1003),
        MD5(1004),
        GPG(1005),
        PGP5_OBSOLETE(1006),
        PAYLOAD_SIZE(1007),
        RESERVED_SPACE(1008);

        private final long id;
        SignatureTags(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, SignatureTags> byId = new HashMap<Long, SignatureTags>(24);
        static {
            for (SignatureTags e : SignatureTags.values())
                byId.put(e.id(), e);
        }
        public static SignatureTags byId(long id) { return byId.get(id); }
    }
    public Rpm() {
        this(null, null, null);
    }

    public Rpm(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Rpm(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Rpm(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Rpm _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.lead = new Lead(this._io, this, _root);
        this.lead._read();
        this.signature = new Header(this._io, this, _root, true);
        this.signature._read();
        this.signaturePadding = this._io.readBytes(KaitaiStream.mod(-(_io().pos()), 8));
        if (ofsHeader() < 0) {
            this._unnamed3 = this._io.readBytes(0);
        }
        this.header = new Header(this._io, this, _root, false);
        this.header._read();
        if (ofsPayload() < 0) {
            this._unnamed5 = this._io.readBytes(0);
        }
        this.signatureTagsSteps = new ArrayList<SignatureTagsStep>();
        for (int i = 0; i < signature().headerRecord().numIndexRecords(); i++) {
            SignatureTagsStep _t_signatureTagsSteps = new SignatureTagsStep(this._io, this, _root, i, (i < 1 ? -1 : signatureTagsSteps().get(((Number) (i - 1)).intValue()).sizeTagIdx()));
            try {
                _t_signatureTagsSteps._read();
            } finally {
                this.signatureTagsSteps.add(_t_signatureTagsSteps);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.lead._fetchInstances();
        this.signature._fetchInstances();
        if (ofsHeader() < 0) {
        }
        this.header._fetchInstances();
        if (ofsPayload() < 0) {
        }
        for (int i = 0; i < this.signatureTagsSteps.size(); i++) {
            this.signatureTagsSteps.get(((Number) (i)).intValue())._fetchInstances();
        }
        payload();
        if (this.payload != null) {
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWritePayload = _enabledPayload;
        this.lead._write_Seq(this._io);
        this.signature._write_Seq(this._io);
        if (this.signaturePadding.length != KaitaiStream.mod(-(_io().pos()), 8))
            throw new ConsistencyError("signature_padding", KaitaiStream.mod(-(_io().pos()), 8), this.signaturePadding.length);
        this._io.writeBytes(this.signaturePadding);
        if (ofsHeader() < 0) {
            if (this._unnamed3.length != 0)
                throw new ConsistencyError("_unnamed3", 0, this._unnamed3.length);
            this._io.writeBytes(this._unnamed3);
        }
        this.header._write_Seq(this._io);
        if (ofsPayload() < 0) {
            if (this._unnamed5.length != 0)
                throw new ConsistencyError("_unnamed5", 0, this._unnamed5.length);
            this._io.writeBytes(this._unnamed5);
        }
        for (int i = 0; i < this.signatureTagsSteps.size(); i++) {
            this.signatureTagsSteps.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (!Objects.equals(this.lead._root(), _root()))
            throw new ConsistencyError("lead", _root(), this.lead._root());
        if (!Objects.equals(this.lead._parent(), this))
            throw new ConsistencyError("lead", this, this.lead._parent());
        if (!Objects.equals(this.signature._root(), _root()))
            throw new ConsistencyError("signature", _root(), this.signature._root());
        if (!Objects.equals(this.signature._parent(), this))
            throw new ConsistencyError("signature", this, this.signature._parent());
        if (this.signature.isSignature() != true)
            throw new ConsistencyError("signature", true, this.signature.isSignature());
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (this.header.isSignature() != false)
            throw new ConsistencyError("header", false, this.header.isSignature());
        if (this.signatureTagsSteps.size() != signature().headerRecord().numIndexRecords())
            throw new ConsistencyError("signature_tags_steps", signature().headerRecord().numIndexRecords(), this.signatureTagsSteps.size());
        for (int i = 0; i < this.signatureTagsSteps.size(); i++) {
            if (!Objects.equals(this.signatureTagsSteps.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("signature_tags_steps", _root(), this.signatureTagsSteps.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.signatureTagsSteps.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("signature_tags_steps", this, this.signatureTagsSteps.get(((Number) (i)).intValue())._parent());
            if (this.signatureTagsSteps.get(((Number) (i)).intValue()).idx() != i)
                throw new ConsistencyError("signature_tags_steps", i, this.signatureTagsSteps.get(((Number) (i)).intValue()).idx());
            if (this.signatureTagsSteps.get(((Number) (i)).intValue()).prevSizeTagIdx() != (i < 1 ? -1 : signatureTagsSteps().get(((Number) (i - 1)).intValue()).sizeTagIdx()))
                throw new ConsistencyError("signature_tags_steps", (i < 1 ? -1 : signatureTagsSteps().get(((Number) (i - 1)).intValue()).sizeTagIdx()), this.signatureTagsSteps.get(((Number) (i)).intValue()).prevSizeTagIdx());
        }
        if (_enabledPayload) {
            if (hasSignatureSizeTag()) {
            }
        }
        _dirty = false;
    }
    public static class Dummy extends KaitaiStruct.ReadWrite {
        public static Dummy fromFile(String fileName) throws IOException {
            return new Dummy(new ByteBufferKaitaiStream(fileName));
        }
        public Dummy() {
            this(null, null, null);
        }

        public Dummy(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Dummy(KaitaiStream _io, Rpm.Header _parent) {
            this(_io, _parent, null);
        }

        public Dummy(KaitaiStream _io, Rpm.Header _parent, Rpm _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
        }

        public void _check() {
            _dirty = false;
        }
        private Rpm _root;
        private Rpm.Header _parent;
        public Rpm _root() { return _root; }
        public void set_root(Rpm _v) { _dirty = true; _root = _v; }
        public Rpm.Header _parent() { return _parent; }
        public void set_parent(Rpm.Header _v) { _dirty = true; _parent = _v; }
    }

    /**
     * header structure used for both the "header" and "signature", but some tag
     * values have different meanings in signature and header (hence they use
     * different enums)
     */
    public static class Header extends KaitaiStruct.ReadWrite {
        public Header(boolean isSignature) {
            this(null, null, null, isSignature);
        }

        public Header(KaitaiStream _io, boolean isSignature) {
            this(_io, null, null, isSignature);
        }

        public Header(KaitaiStream _io, Rpm _parent, boolean isSignature) {
            this(_io, _parent, null, isSignature);
        }

        public Header(KaitaiStream _io, Rpm _parent, Rpm _root, boolean isSignature) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.isSignature = isSignature;
        }
        public void _read() {
            this.headerRecord = new HeaderRecord(this._io, this, _root);
            this.headerRecord._read();
            this.indexRecords = new ArrayList<HeaderIndexRecord>();
            for (int i = 0; i < headerRecord().numIndexRecords(); i++) {
                HeaderIndexRecord _t_indexRecords = new HeaderIndexRecord(this._io, this, _root);
                try {
                    _t_indexRecords._read();
                } finally {
                    this.indexRecords.add(_t_indexRecords);
                }
            }
            this._raw_storageSection = this._io.readBytes(headerRecord().lenStorageSection());
            KaitaiStream _io__raw_storageSection = new ByteBufferKaitaiStream(this._raw_storageSection);
            this.storageSection = new Dummy(_io__raw_storageSection, this, _root);
            this.storageSection._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.headerRecord._fetchInstances();
            for (int i = 0; i < this.indexRecords.size(); i++) {
                this.indexRecords.get(((Number) (i)).intValue())._fetchInstances();
            }
            this.storageSection._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.headerRecord._write_Seq(this._io);
            for (int i = 0; i < this.indexRecords.size(); i++) {
                this.indexRecords.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            final KaitaiStream _io__raw_storageSection = new ByteBufferKaitaiStream(headerRecord().lenStorageSection());
            this._io.addChildStream(_io__raw_storageSection);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (headerRecord().lenStorageSection()));
                final Header _this = this;
                _io__raw_storageSection.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_storageSection = _io__raw_storageSection.toByteArray();
                        if (_this._raw_storageSection.length != headerRecord().lenStorageSection())
                            throw new ConsistencyError("raw(storage_section)", headerRecord().lenStorageSection(), _this._raw_storageSection.length);
                        parent.writeBytes(_this._raw_storageSection);
                    }
                });
            }
            this.storageSection._write_Seq(_io__raw_storageSection);
        }

        public void _check() {
            if (!Objects.equals(this.headerRecord._root(), _root()))
                throw new ConsistencyError("header_record", _root(), this.headerRecord._root());
            if (!Objects.equals(this.headerRecord._parent(), this))
                throw new ConsistencyError("header_record", this, this.headerRecord._parent());
            if (this.indexRecords.size() != headerRecord().numIndexRecords())
                throw new ConsistencyError("index_records", headerRecord().numIndexRecords(), this.indexRecords.size());
            for (int i = 0; i < this.indexRecords.size(); i++) {
                if (!Objects.equals(this.indexRecords.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("index_records", _root(), this.indexRecords.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.indexRecords.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("index_records", this, this.indexRecords.get(((Number) (i)).intValue())._parent());
            }
            if (!Objects.equals(this.storageSection._root(), _root()))
                throw new ConsistencyError("storage_section", _root(), this.storageSection._root());
            if (!Objects.equals(this.storageSection._parent(), this))
                throw new ConsistencyError("storage_section", this, this.storageSection._parent());
            _dirty = false;
        }
        private Boolean isHeader;
        public Boolean isHeader() {
            if (this.isHeader != null)
                return this.isHeader;
            this.isHeader = !(isSignature());
            return this.isHeader;
        }
        public void _invalidateIsHeader() { this.isHeader = null; }
        private HeaderRecord headerRecord;
        private List<HeaderIndexRecord> indexRecords;
        private Dummy storageSection;
        private boolean isSignature;
        private Rpm _root;
        private Rpm _parent;
        private byte[] _raw_storageSection;
        public HeaderRecord headerRecord() { return headerRecord; }
        public void setHeaderRecord(HeaderRecord _v) { _dirty = true; headerRecord = _v; }
        public List<HeaderIndexRecord> indexRecords() { return indexRecords; }
        public void setIndexRecords(List<HeaderIndexRecord> _v) { _dirty = true; indexRecords = _v; }
        public Dummy storageSection() { return storageSection; }
        public void setStorageSection(Dummy _v) { _dirty = true; storageSection = _v; }
        public boolean isSignature() { return isSignature; }
        public void setIsSignature(boolean _v) { _dirty = true; isSignature = _v; }
        public Rpm _root() { return _root; }
        public void set_root(Rpm _v) { _dirty = true; _root = _v; }
        public Rpm _parent() { return _parent; }
        public void set_parent(Rpm _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_storageSection() { return _raw_storageSection; }
        public void set_raw_StorageSection(byte[] _v) { _dirty = true; _raw_storageSection = _v; }
    }
    public static class HeaderIndexRecord extends KaitaiStruct.ReadWrite {
        public static HeaderIndexRecord fromFile(String fileName) throws IOException {
            return new HeaderIndexRecord(new ByteBufferKaitaiStream(fileName));
        }
        public HeaderIndexRecord() {
            this(null, null, null);
        }

        public HeaderIndexRecord(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HeaderIndexRecord(KaitaiStream _io, Rpm.Header _parent) {
            this(_io, _parent, null);
        }

        public HeaderIndexRecord(KaitaiStream _io, Rpm.Header _parent, Rpm _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.tagRaw = this._io.readU4be();
            this.recordType = Rpm.RecordTypes.byId(this._io.readU4be());
            this.ofsBody = this._io.readU4be();
            this.count = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
            body();
            if (this.body != null) {
                {
                    RecordTypes on = recordType();
                    if (on != null) {
                        switch (recordType()) {
                        case BIN: {
                            ((RecordTypeBin) (this.body))._fetchInstances();
                            break;
                        }
                        case CHAR: {
                            ((RecordTypeUint8) (this.body))._fetchInstances();
                            break;
                        }
                        case I18N_STRING: {
                            ((RecordTypeStringArray) (this.body))._fetchInstances();
                            break;
                        }
                        case STRING: {
                            ((RecordTypeString) (this.body))._fetchInstances();
                            break;
                        }
                        case STRING_ARRAY: {
                            ((RecordTypeStringArray) (this.body))._fetchInstances();
                            break;
                        }
                        case UINT16: {
                            ((RecordTypeUint16) (this.body))._fetchInstances();
                            break;
                        }
                        case UINT32: {
                            ((RecordTypeUint32) (this.body))._fetchInstances();
                            break;
                        }
                        case UINT64: {
                            ((RecordTypeUint64) (this.body))._fetchInstances();
                            break;
                        }
                        case UINT8: {
                            ((RecordTypeUint8) (this.body))._fetchInstances();
                            break;
                        }
                        }
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBody = _enabledBody;
            this._io.writeU4be(this.tagRaw);
            this._io.writeU4be(((Number) (this.recordType.id())).longValue());
            this._io.writeU4be(this.ofsBody);
            this._io.writeU4be(this.count);
        }

        public void _check() {
            if (_enabledBody) {
                {
                    RecordTypes on = recordType();
                    if (on != null) {
                        switch (recordType()) {
                        case BIN: {
                            if (!Objects.equals(((Rpm.RecordTypeBin) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((Rpm.RecordTypeBin) (this.body))._root());
                            if (!Objects.equals(((Rpm.RecordTypeBin) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((Rpm.RecordTypeBin) (this.body))._parent());
                            if (((Rpm.RecordTypeBin) (this.body)).lenValue() != lenValue())
                                throw new ConsistencyError("body", lenValue(), ((Rpm.RecordTypeBin) (this.body)).lenValue());
                            break;
                        }
                        case CHAR: {
                            if (!Objects.equals(((Rpm.RecordTypeUint8) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((Rpm.RecordTypeUint8) (this.body))._root());
                            if (!Objects.equals(((Rpm.RecordTypeUint8) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((Rpm.RecordTypeUint8) (this.body))._parent());
                            if (((Rpm.RecordTypeUint8) (this.body)).numValues() != numValues())
                                throw new ConsistencyError("body", numValues(), ((Rpm.RecordTypeUint8) (this.body)).numValues());
                            break;
                        }
                        case I18N_STRING: {
                            if (!Objects.equals(((Rpm.RecordTypeStringArray) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((Rpm.RecordTypeStringArray) (this.body))._root());
                            if (!Objects.equals(((Rpm.RecordTypeStringArray) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((Rpm.RecordTypeStringArray) (this.body))._parent());
                            if (((Rpm.RecordTypeStringArray) (this.body)).numValues() != numValues())
                                throw new ConsistencyError("body", numValues(), ((Rpm.RecordTypeStringArray) (this.body)).numValues());
                            break;
                        }
                        case STRING: {
                            if (!Objects.equals(((Rpm.RecordTypeString) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((Rpm.RecordTypeString) (this.body))._root());
                            if (!Objects.equals(((Rpm.RecordTypeString) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((Rpm.RecordTypeString) (this.body))._parent());
                            break;
                        }
                        case STRING_ARRAY: {
                            if (!Objects.equals(((Rpm.RecordTypeStringArray) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((Rpm.RecordTypeStringArray) (this.body))._root());
                            if (!Objects.equals(((Rpm.RecordTypeStringArray) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((Rpm.RecordTypeStringArray) (this.body))._parent());
                            if (((Rpm.RecordTypeStringArray) (this.body)).numValues() != numValues())
                                throw new ConsistencyError("body", numValues(), ((Rpm.RecordTypeStringArray) (this.body)).numValues());
                            break;
                        }
                        case UINT16: {
                            if (!Objects.equals(((Rpm.RecordTypeUint16) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((Rpm.RecordTypeUint16) (this.body))._root());
                            if (!Objects.equals(((Rpm.RecordTypeUint16) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((Rpm.RecordTypeUint16) (this.body))._parent());
                            if (((Rpm.RecordTypeUint16) (this.body)).numValues() != numValues())
                                throw new ConsistencyError("body", numValues(), ((Rpm.RecordTypeUint16) (this.body)).numValues());
                            break;
                        }
                        case UINT32: {
                            if (!Objects.equals(((Rpm.RecordTypeUint32) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((Rpm.RecordTypeUint32) (this.body))._root());
                            if (!Objects.equals(((Rpm.RecordTypeUint32) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((Rpm.RecordTypeUint32) (this.body))._parent());
                            if (((Rpm.RecordTypeUint32) (this.body)).numValues() != numValues())
                                throw new ConsistencyError("body", numValues(), ((Rpm.RecordTypeUint32) (this.body)).numValues());
                            break;
                        }
                        case UINT64: {
                            if (!Objects.equals(((Rpm.RecordTypeUint64) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((Rpm.RecordTypeUint64) (this.body))._root());
                            if (!Objects.equals(((Rpm.RecordTypeUint64) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((Rpm.RecordTypeUint64) (this.body))._parent());
                            if (((Rpm.RecordTypeUint64) (this.body)).numValues() != numValues())
                                throw new ConsistencyError("body", numValues(), ((Rpm.RecordTypeUint64) (this.body)).numValues());
                            break;
                        }
                        case UINT8: {
                            if (!Objects.equals(((Rpm.RecordTypeUint8) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((Rpm.RecordTypeUint8) (this.body))._root());
                            if (!Objects.equals(((Rpm.RecordTypeUint8) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((Rpm.RecordTypeUint8) (this.body))._parent());
                            if (((Rpm.RecordTypeUint8) (this.body)).numValues() != numValues())
                                throw new ConsistencyError("body", numValues(), ((Rpm.RecordTypeUint8) (this.body)).numValues());
                            break;
                        }
                        }
                    }
                }
            }
            _dirty = false;
        }
        private KaitaiStruct.ReadWrite body;
        private boolean _shouldWriteBody = false;
        private boolean _enabledBody = true;
        public KaitaiStruct.ReadWrite body() {
            if (_shouldWriteBody)
                _writeBody();
            if (this.body != null)
                return this.body;
            if (!_enabledBody)
                return null;
            KaitaiStream io = _parent().storageSection()._io();
            long _pos = io.pos();
            io.seek(ofsBody());
            {
                RecordTypes on = recordType();
                if (on != null) {
                    switch (recordType()) {
                    case BIN: {
                        this.body = new RecordTypeBin(io, this, _root, lenValue());
                        ((RecordTypeBin) (this.body))._read();
                        break;
                    }
                    case CHAR: {
                        this.body = new RecordTypeUint8(io, this, _root, numValues());
                        ((RecordTypeUint8) (this.body))._read();
                        break;
                    }
                    case I18N_STRING: {
                        this.body = new RecordTypeStringArray(io, this, _root, numValues());
                        ((RecordTypeStringArray) (this.body))._read();
                        break;
                    }
                    case STRING: {
                        this.body = new RecordTypeString(io, this, _root);
                        ((RecordTypeString) (this.body))._read();
                        break;
                    }
                    case STRING_ARRAY: {
                        this.body = new RecordTypeStringArray(io, this, _root, numValues());
                        ((RecordTypeStringArray) (this.body))._read();
                        break;
                    }
                    case UINT16: {
                        this.body = new RecordTypeUint16(io, this, _root, numValues());
                        ((RecordTypeUint16) (this.body))._read();
                        break;
                    }
                    case UINT32: {
                        this.body = new RecordTypeUint32(io, this, _root, numValues());
                        ((RecordTypeUint32) (this.body))._read();
                        break;
                    }
                    case UINT64: {
                        this.body = new RecordTypeUint64(io, this, _root, numValues());
                        ((RecordTypeUint64) (this.body))._read();
                        break;
                    }
                    case UINT8: {
                        this.body = new RecordTypeUint8(io, this, _root, numValues());
                        ((RecordTypeUint8) (this.body))._read();
                        break;
                    }
                    }
                }
            }
            io.seek(_pos);
            return this.body;
        }
        public void setBody(KaitaiStruct.ReadWrite _v) { _dirty = true; body = _v; }
        public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

        private void _writeBody() {
            _shouldWriteBody = false;
            KaitaiStream io = _parent().storageSection()._io();
            long _pos = io.pos();
            io.seek(ofsBody());
            {
                RecordTypes on = recordType();
                if (on != null) {
                    switch (recordType()) {
                    case BIN: {
                        ((RecordTypeBin) (this.body))._write_Seq(io);
                        break;
                    }
                    case CHAR: {
                        ((RecordTypeUint8) (this.body))._write_Seq(io);
                        break;
                    }
                    case I18N_STRING: {
                        ((RecordTypeStringArray) (this.body))._write_Seq(io);
                        break;
                    }
                    case STRING: {
                        ((RecordTypeString) (this.body))._write_Seq(io);
                        break;
                    }
                    case STRING_ARRAY: {
                        ((RecordTypeStringArray) (this.body))._write_Seq(io);
                        break;
                    }
                    case UINT16: {
                        ((RecordTypeUint16) (this.body))._write_Seq(io);
                        break;
                    }
                    case UINT32: {
                        ((RecordTypeUint32) (this.body))._write_Seq(io);
                        break;
                    }
                    case UINT64: {
                        ((RecordTypeUint64) (this.body))._write_Seq(io);
                        break;
                    }
                    case UINT8: {
                        ((RecordTypeUint8) (this.body))._write_Seq(io);
                        break;
                    }
                    }
                }
            }
            io.seek(_pos);
        }
        private HeaderTags headerTag;
        public HeaderTags headerTag() {
            if (this.headerTag != null)
                return this.headerTag;
            if (_parent().isHeader()) {
                this.headerTag = Rpm.HeaderTags.byId(tagRaw());
            }
            return this.headerTag;
        }
        public void _invalidateHeaderTag() { this.headerTag = null; }
        private Long lenValue;
        public Long lenValue() {
            if (this.lenValue != null)
                return this.lenValue;
            if (recordType() == Rpm.RecordTypes.BIN) {
                this.lenValue = ((Number) (count())).longValue();
            }
            return this.lenValue;
        }
        public void _invalidateLenValue() { this.lenValue = null; }
        private Long numValues;
        public Long numValues() {
            if (this.numValues != null)
                return this.numValues;
            if (recordType() != Rpm.RecordTypes.BIN) {
                this.numValues = ((Number) (count())).longValue();
            }
            return this.numValues;
        }
        public void _invalidateNumValues() { this.numValues = null; }
        private SignatureTags signatureTag;
        public SignatureTags signatureTag() {
            if (this.signatureTag != null)
                return this.signatureTag;
            if (_parent().isSignature()) {
                this.signatureTag = Rpm.SignatureTags.byId(tagRaw());
            }
            return this.signatureTag;
        }
        public void _invalidateSignatureTag() { this.signatureTag = null; }
        private long tagRaw;
        private RecordTypes recordType;
        private long ofsBody;
        private long count;
        private Rpm _root;
        private Rpm.Header _parent;

        /**
         * prefer to access `signature_tag` and `header_tag` instead
         */
        public long tagRaw() { return tagRaw; }
        public void setTagRaw(long _v) { _dirty = true; tagRaw = _v; }
        public RecordTypes recordType() { return recordType; }
        public void setRecordType(RecordTypes _v) { _dirty = true; recordType = _v; }
        public long ofsBody() { return ofsBody; }
        public void setOfsBody(long _v) { _dirty = true; ofsBody = _v; }

        /**
         * internal; access `num_values` and `len_value` instead
         */
        public long count() { return count; }
        public void setCount(long _v) { _dirty = true; count = _v; }
        public Rpm _root() { return _root; }
        public void set_root(Rpm _v) { _dirty = true; _root = _v; }
        public Rpm.Header _parent() { return _parent; }
        public void set_parent(Rpm.Header _v) { _dirty = true; _parent = _v; }
    }
    public static class HeaderRecord extends KaitaiStruct.ReadWrite {
        public static HeaderRecord fromFile(String fileName) throws IOException {
            return new HeaderRecord(new ByteBufferKaitaiStream(fileName));
        }
        public HeaderRecord() {
            this(null, null, null);
        }

        public HeaderRecord(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HeaderRecord(KaitaiStream _io, Rpm.Header _parent) {
            this(_io, _parent, null);
        }

        public HeaderRecord(KaitaiStream _io, Rpm.Header _parent, Rpm _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { -114, -83, -24, 1 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -114, -83, -24, 1 }, this.magic, this._io, "/types/header_record/seq/0");
            }
            this.reserved = this._io.readBytes(4);
            if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/header_record/seq/1");
            }
            this.numIndexRecords = this._io.readU4be();
            if (!(this.numIndexRecords >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.numIndexRecords, this._io, "/types/header_record/seq/2");
            }
            this.lenStorageSection = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeBytes(this.reserved);
            this._io.writeU4be(this.numIndexRecords);
            this._io.writeU4be(this.lenStorageSection);
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { -114, -83, -24, 1 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -114, -83, -24, 1 }, this.magic, null, "/types/header_record/seq/0");
            }
            if (this.reserved.length != 4)
                throw new ConsistencyError("reserved", 4, this.reserved.length);
            if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/header_record/seq/1");
            }
            if (!(this.numIndexRecords >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.numIndexRecords, null, "/types/header_record/seq/2");
            }
            _dirty = false;
        }
        private byte[] magic;
        private byte[] reserved;
        private long numIndexRecords;
        private long lenStorageSection;
        private Rpm _root;
        private Rpm.Header _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public long numIndexRecords() { return numIndexRecords; }
        public void setNumIndexRecords(long _v) { _dirty = true; numIndexRecords = _v; }

        /**
         * Size of the storage area for the data
         * pointed to by the Index Records.
         */
        public long lenStorageSection() { return lenStorageSection; }
        public void setLenStorageSection(long _v) { _dirty = true; lenStorageSection = _v; }
        public Rpm _root() { return _root; }
        public void set_root(Rpm _v) { _dirty = true; _root = _v; }
        public Rpm.Header _parent() { return _parent; }
        public void set_parent(Rpm.Header _v) { _dirty = true; _parent = _v; }
    }

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
    public static class Lead extends KaitaiStruct.ReadWrite {
        public static Lead fromFile(String fileName) throws IOException {
            return new Lead(new ByteBufferKaitaiStream(fileName));
        }
        public Lead() {
            this(null, null, null);
        }

        public Lead(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Lead(KaitaiStream _io, Rpm _parent) {
            this(_io, _parent, null);
        }

        public Lead(KaitaiStream _io, Rpm _parent, Rpm _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { -19, -85, -18, -37 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -19, -85, -18, -37 }, this.magic, this._io, "/types/lead/seq/0");
            }
            this.version = new RpmVersion(this._io, this, _root);
            this.version._read();
            this.type = Rpm.RpmTypes.byId(this._io.readU2be());
            this.architecture = Rpm.Architectures.byId(this._io.readU2be());
            this.packageName = new String(KaitaiStream.bytesTerminate(this._io.readBytes(66), (byte) 0, false), StandardCharsets.UTF_8);
            this.os = Rpm.OperatingSystems.byId(this._io.readU2be());
            this.signatureType = this._io.readU2be();
            if (!(this.signatureType == 5)) {
                throw new KaitaiStream.ValidationNotEqualError(5, this.signatureType, this._io, "/types/lead/seq/6");
            }
            this.reserved = this._io.readBytes(16);
            _dirty = false;
        }

        public void _fetchInstances() {
            this.version._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this.version._write_Seq(this._io);
            this._io.writeU2be(((Number) (this.type.id())).intValue());
            this._io.writeU2be(((Number) (this.architecture.id())).intValue());
            this._io.writeBytesLimit((this.packageName).getBytes(Charset.forName("UTF-8")), 66, (byte) 0, (byte) 0);
            this._io.writeU2be(((Number) (this.os.id())).intValue());
            this._io.writeU2be(this.signatureType);
            this._io.writeBytes(this.reserved);
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { -19, -85, -18, -37 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -19, -85, -18, -37 }, this.magic, null, "/types/lead/seq/0");
            }
            if (!Objects.equals(this.version._root(), _root()))
                throw new ConsistencyError("version", _root(), this.version._root());
            if (!Objects.equals(this.version._parent(), this))
                throw new ConsistencyError("version", this, this.version._parent());
            if ((this.packageName).getBytes(Charset.forName("UTF-8")).length > 66)
                throw new ConsistencyError("package_name", 66, (this.packageName).getBytes(Charset.forName("UTF-8")).length);
            if (KaitaiStream.byteArrayIndexOf((this.packageName).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                throw new ConsistencyError("package_name", -1, KaitaiStream.byteArrayIndexOf((this.packageName).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            if (!(this.signatureType == 5)) {
                throw new KaitaiStream.ValidationNotEqualError(5, this.signatureType, null, "/types/lead/seq/6");
            }
            if (this.reserved.length != 16)
                throw new ConsistencyError("reserved", 16, this.reserved.length);
            _dirty = false;
        }
        private byte[] magic;
        private RpmVersion version;
        private RpmTypes type;
        private Architectures architecture;
        private String packageName;
        private OperatingSystems os;
        private int signatureType;
        private byte[] reserved;
        private Rpm _root;
        private Rpm _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public RpmVersion version() { return version; }
        public void setVersion(RpmVersion _v) { _dirty = true; version = _v; }
        public RpmTypes type() { return type; }
        public void setType(RpmTypes _v) { _dirty = true; type = _v; }
        public Architectures architecture() { return architecture; }
        public void setArchitecture(Architectures _v) { _dirty = true; architecture = _v; }
        public String packageName() { return packageName; }
        public void setPackageName(String _v) { _dirty = true; packageName = _v; }
        public OperatingSystems os() { return os; }
        public void setOs(OperatingSystems _v) { _dirty = true; os = _v; }
        public int signatureType() { return signatureType; }
        public void setSignatureType(int _v) { _dirty = true; signatureType = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public Rpm _root() { return _root; }
        public void set_root(Rpm _v) { _dirty = true; _root = _v; }
        public Rpm _parent() { return _parent; }
        public void set_parent(Rpm _v) { _dirty = true; _parent = _v; }
    }
    public static class RecordTypeBin extends KaitaiStruct.ReadWrite {
        public RecordTypeBin(long lenValue) {
            this(null, null, null, lenValue);
        }

        public RecordTypeBin(KaitaiStream _io, long lenValue) {
            this(_io, null, null, lenValue);
        }

        public RecordTypeBin(KaitaiStream _io, Rpm.HeaderIndexRecord _parent, long lenValue) {
            this(_io, _parent, null, lenValue);
        }

        public RecordTypeBin(KaitaiStream _io, Rpm.HeaderIndexRecord _parent, Rpm _root, long lenValue) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.lenValue = lenValue;
        }
        public void _read() {
            this.values = new ArrayList<byte[]>();
            for (int i = 0; i < 1; i++) {
                this.values.add(this._io.readBytes(lenValue()));
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.values.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.values.size(); i++) {
                this._io.writeBytes(this.values.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (this.values.size() != 1)
                throw new ConsistencyError("values", 1, this.values.size());
            for (int i = 0; i < this.values.size(); i++) {
                if (this.values.get(((Number) (i)).intValue()).length != lenValue())
                    throw new ConsistencyError("values", lenValue(), this.values.get(((Number) (i)).intValue()).length);
            }
            _dirty = false;
        }
        private List<byte[]> values;
        private long lenValue;
        private Rpm _root;
        private Rpm.HeaderIndexRecord _parent;
        public List<byte[]> values() { return values; }
        public void setValues(List<byte[]> _v) { _dirty = true; values = _v; }
        public long lenValue() { return lenValue; }
        public void setLenValue(long _v) { _dirty = true; lenValue = _v; }
        public Rpm _root() { return _root; }
        public void set_root(Rpm _v) { _dirty = true; _root = _v; }
        public Rpm.HeaderIndexRecord _parent() { return _parent; }
        public void set_parent(Rpm.HeaderIndexRecord _v) { _dirty = true; _parent = _v; }
    }
    public static class RecordTypeString extends KaitaiStruct.ReadWrite {
        public static RecordTypeString fromFile(String fileName) throws IOException {
            return new RecordTypeString(new ByteBufferKaitaiStream(fileName));
        }
        public RecordTypeString() {
            this(null, null, null);
        }

        public RecordTypeString(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RecordTypeString(KaitaiStream _io, Rpm.HeaderIndexRecord _parent) {
            this(_io, _parent, null);
        }

        public RecordTypeString(KaitaiStream _io, Rpm.HeaderIndexRecord _parent, Rpm _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.values = new ArrayList<String>();
            for (int i = 0; i < 1; i++) {
                this.values.add(new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8));
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.values.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.values.size(); i++) {
                this._io.writeBytes((this.values.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")));
                this._io.writeU1(0);
            }
        }

        public void _check() {
            if (this.values.size() != 1)
                throw new ConsistencyError("values", 1, this.values.size());
            for (int i = 0; i < this.values.size(); i++) {
                if (KaitaiStream.byteArrayIndexOf((this.values.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                    throw new ConsistencyError("values", -1, KaitaiStream.byteArrayIndexOf((this.values.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            }
            _dirty = false;
        }
        private List<String> values;
        private Rpm _root;
        private Rpm.HeaderIndexRecord _parent;
        public List<String> values() { return values; }
        public void setValues(List<String> _v) { _dirty = true; values = _v; }
        public Rpm _root() { return _root; }
        public void set_root(Rpm _v) { _dirty = true; _root = _v; }
        public Rpm.HeaderIndexRecord _parent() { return _parent; }
        public void set_parent(Rpm.HeaderIndexRecord _v) { _dirty = true; _parent = _v; }
    }
    public static class RecordTypeStringArray extends KaitaiStruct.ReadWrite {
        public RecordTypeStringArray(long numValues) {
            this(null, null, null, numValues);
        }

        public RecordTypeStringArray(KaitaiStream _io, long numValues) {
            this(_io, null, null, numValues);
        }

        public RecordTypeStringArray(KaitaiStream _io, Rpm.HeaderIndexRecord _parent, long numValues) {
            this(_io, _parent, null, numValues);
        }

        public RecordTypeStringArray(KaitaiStream _io, Rpm.HeaderIndexRecord _parent, Rpm _root, long numValues) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.numValues = numValues;
        }
        public void _read() {
            this.values = new ArrayList<String>();
            for (int i = 0; i < numValues(); i++) {
                this.values.add(new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8));
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.values.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.values.size(); i++) {
                this._io.writeBytes((this.values.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")));
                this._io.writeU1(0);
            }
        }

        public void _check() {
            if (this.values.size() != numValues())
                throw new ConsistencyError("values", numValues(), this.values.size());
            for (int i = 0; i < this.values.size(); i++) {
                if (KaitaiStream.byteArrayIndexOf((this.values.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                    throw new ConsistencyError("values", -1, KaitaiStream.byteArrayIndexOf((this.values.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            }
            _dirty = false;
        }
        private List<String> values;
        private long numValues;
        private Rpm _root;
        private Rpm.HeaderIndexRecord _parent;
        public List<String> values() { return values; }
        public void setValues(List<String> _v) { _dirty = true; values = _v; }
        public long numValues() { return numValues; }
        public void setNumValues(long _v) { _dirty = true; numValues = _v; }
        public Rpm _root() { return _root; }
        public void set_root(Rpm _v) { _dirty = true; _root = _v; }
        public Rpm.HeaderIndexRecord _parent() { return _parent; }
        public void set_parent(Rpm.HeaderIndexRecord _v) { _dirty = true; _parent = _v; }
    }
    public static class RecordTypeUint16 extends KaitaiStruct.ReadWrite {
        public RecordTypeUint16(long numValues) {
            this(null, null, null, numValues);
        }

        public RecordTypeUint16(KaitaiStream _io, long numValues) {
            this(_io, null, null, numValues);
        }

        public RecordTypeUint16(KaitaiStream _io, Rpm.HeaderIndexRecord _parent, long numValues) {
            this(_io, _parent, null, numValues);
        }

        public RecordTypeUint16(KaitaiStream _io, Rpm.HeaderIndexRecord _parent, Rpm _root, long numValues) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.numValues = numValues;
        }
        public void _read() {
            this.values = new ArrayList<Integer>();
            for (int i = 0; i < numValues(); i++) {
                this.values.add(this._io.readU2be());
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.values.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.values.size(); i++) {
                this._io.writeU2be(this.values.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (this.values.size() != numValues())
                throw new ConsistencyError("values", numValues(), this.values.size());
            for (int i = 0; i < this.values.size(); i++) {
            }
            _dirty = false;
        }
        private List<Integer> values;
        private long numValues;
        private Rpm _root;
        private Rpm.HeaderIndexRecord _parent;
        public List<Integer> values() { return values; }
        public void setValues(List<Integer> _v) { _dirty = true; values = _v; }
        public long numValues() { return numValues; }
        public void setNumValues(long _v) { _dirty = true; numValues = _v; }
        public Rpm _root() { return _root; }
        public void set_root(Rpm _v) { _dirty = true; _root = _v; }
        public Rpm.HeaderIndexRecord _parent() { return _parent; }
        public void set_parent(Rpm.HeaderIndexRecord _v) { _dirty = true; _parent = _v; }
    }
    public static class RecordTypeUint32 extends KaitaiStruct.ReadWrite {
        public RecordTypeUint32(long numValues) {
            this(null, null, null, numValues);
        }

        public RecordTypeUint32(KaitaiStream _io, long numValues) {
            this(_io, null, null, numValues);
        }

        public RecordTypeUint32(KaitaiStream _io, Rpm.HeaderIndexRecord _parent, long numValues) {
            this(_io, _parent, null, numValues);
        }

        public RecordTypeUint32(KaitaiStream _io, Rpm.HeaderIndexRecord _parent, Rpm _root, long numValues) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.numValues = numValues;
        }
        public void _read() {
            this.values = new ArrayList<Long>();
            for (int i = 0; i < numValues(); i++) {
                this.values.add(this._io.readU4be());
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.values.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.values.size(); i++) {
                this._io.writeU4be(this.values.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (this.values.size() != numValues())
                throw new ConsistencyError("values", numValues(), this.values.size());
            for (int i = 0; i < this.values.size(); i++) {
            }
            _dirty = false;
        }
        private List<Long> values;
        private long numValues;
        private Rpm _root;
        private Rpm.HeaderIndexRecord _parent;
        public List<Long> values() { return values; }
        public void setValues(List<Long> _v) { _dirty = true; values = _v; }
        public long numValues() { return numValues; }
        public void setNumValues(long _v) { _dirty = true; numValues = _v; }
        public Rpm _root() { return _root; }
        public void set_root(Rpm _v) { _dirty = true; _root = _v; }
        public Rpm.HeaderIndexRecord _parent() { return _parent; }
        public void set_parent(Rpm.HeaderIndexRecord _v) { _dirty = true; _parent = _v; }
    }
    public static class RecordTypeUint64 extends KaitaiStruct.ReadWrite {
        public RecordTypeUint64(long numValues) {
            this(null, null, null, numValues);
        }

        public RecordTypeUint64(KaitaiStream _io, long numValues) {
            this(_io, null, null, numValues);
        }

        public RecordTypeUint64(KaitaiStream _io, Rpm.HeaderIndexRecord _parent, long numValues) {
            this(_io, _parent, null, numValues);
        }

        public RecordTypeUint64(KaitaiStream _io, Rpm.HeaderIndexRecord _parent, Rpm _root, long numValues) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.numValues = numValues;
        }
        public void _read() {
            this.values = new ArrayList<Long>();
            for (int i = 0; i < numValues(); i++) {
                this.values.add(this._io.readU8be());
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.values.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.values.size(); i++) {
                this._io.writeU8be(this.values.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (this.values.size() != numValues())
                throw new ConsistencyError("values", numValues(), this.values.size());
            for (int i = 0; i < this.values.size(); i++) {
            }
            _dirty = false;
        }
        private List<Long> values;
        private long numValues;
        private Rpm _root;
        private Rpm.HeaderIndexRecord _parent;
        public List<Long> values() { return values; }
        public void setValues(List<Long> _v) { _dirty = true; values = _v; }
        public long numValues() { return numValues; }
        public void setNumValues(long _v) { _dirty = true; numValues = _v; }
        public Rpm _root() { return _root; }
        public void set_root(Rpm _v) { _dirty = true; _root = _v; }
        public Rpm.HeaderIndexRecord _parent() { return _parent; }
        public void set_parent(Rpm.HeaderIndexRecord _v) { _dirty = true; _parent = _v; }
    }
    public static class RecordTypeUint8 extends KaitaiStruct.ReadWrite {
        public RecordTypeUint8(long numValues) {
            this(null, null, null, numValues);
        }

        public RecordTypeUint8(KaitaiStream _io, long numValues) {
            this(_io, null, null, numValues);
        }

        public RecordTypeUint8(KaitaiStream _io, Rpm.HeaderIndexRecord _parent, long numValues) {
            this(_io, _parent, null, numValues);
        }

        public RecordTypeUint8(KaitaiStream _io, Rpm.HeaderIndexRecord _parent, Rpm _root, long numValues) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.numValues = numValues;
        }
        public void _read() {
            this.values = new ArrayList<Integer>();
            for (int i = 0; i < numValues(); i++) {
                this.values.add(this._io.readU1());
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.values.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.values.size(); i++) {
                this._io.writeU1(this.values.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (this.values.size() != numValues())
                throw new ConsistencyError("values", numValues(), this.values.size());
            for (int i = 0; i < this.values.size(); i++) {
            }
            _dirty = false;
        }
        private List<Integer> values;
        private long numValues;
        private Rpm _root;
        private Rpm.HeaderIndexRecord _parent;
        public List<Integer> values() { return values; }
        public void setValues(List<Integer> _v) { _dirty = true; values = _v; }
        public long numValues() { return numValues; }
        public void setNumValues(long _v) { _dirty = true; numValues = _v; }
        public Rpm _root() { return _root; }
        public void set_root(Rpm _v) { _dirty = true; _root = _v; }
        public Rpm.HeaderIndexRecord _parent() { return _parent; }
        public void set_parent(Rpm.HeaderIndexRecord _v) { _dirty = true; _parent = _v; }
    }
    public static class RpmVersion extends KaitaiStruct.ReadWrite {
        public static RpmVersion fromFile(String fileName) throws IOException {
            return new RpmVersion(new ByteBufferKaitaiStream(fileName));
        }
        public RpmVersion() {
            this(null, null, null);
        }

        public RpmVersion(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RpmVersion(KaitaiStream _io, Rpm.Lead _parent) {
            this(_io, _parent, null);
        }

        public RpmVersion(KaitaiStream _io, Rpm.Lead _parent, Rpm _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.major = this._io.readU1();
            if (!(this.major >= 3)) {
                throw new KaitaiStream.ValidationLessThanError(3, this.major, this._io, "/types/rpm_version/seq/0");
            }
            if (!(this.major <= 4)) {
                throw new KaitaiStream.ValidationGreaterThanError(4, this.major, this._io, "/types/rpm_version/seq/0");
            }
            this.minor = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.major);
            this._io.writeU1(this.minor);
        }

        public void _check() {
            if (!(this.major >= 3)) {
                throw new KaitaiStream.ValidationLessThanError(3, this.major, null, "/types/rpm_version/seq/0");
            }
            if (!(this.major <= 4)) {
                throw new KaitaiStream.ValidationGreaterThanError(4, this.major, null, "/types/rpm_version/seq/0");
            }
            _dirty = false;
        }
        private int major;
        private int minor;
        private Rpm _root;
        private Rpm.Lead _parent;

        /**
         * @see <a href="https://github.com/rpm-software-management/rpm/blob/afad3167/lib/rpmlead.c#L102">Source</a>
         */
        public int major() { return major; }
        public void setMajor(int _v) { _dirty = true; major = _v; }
        public int minor() { return minor; }
        public void setMinor(int _v) { _dirty = true; minor = _v; }
        public Rpm _root() { return _root; }
        public void set_root(Rpm _v) { _dirty = true; _root = _v; }
        public Rpm.Lead _parent() { return _parent; }
        public void set_parent(Rpm.Lead _v) { _dirty = true; _parent = _v; }
    }
    public static class SignatureTagsStep extends KaitaiStruct.ReadWrite {
        public SignatureTagsStep(int idx, int prevSizeTagIdx) {
            this(null, null, null, idx, prevSizeTagIdx);
        }

        public SignatureTagsStep(KaitaiStream _io, int idx, int prevSizeTagIdx) {
            this(_io, null, null, idx, prevSizeTagIdx);
        }

        public SignatureTagsStep(KaitaiStream _io, Rpm _parent, int idx, int prevSizeTagIdx) {
            this(_io, _parent, null, idx, prevSizeTagIdx);
        }

        public SignatureTagsStep(KaitaiStream _io, Rpm _parent, Rpm _root, int idx, int prevSizeTagIdx) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.idx = idx;
            this.prevSizeTagIdx = prevSizeTagIdx;
        }
        public void _read() {
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
        }

        public void _check() {
            _dirty = false;
        }
        private Integer sizeTagIdx;
        public Integer sizeTagIdx() {
            if (this.sizeTagIdx != null)
                return this.sizeTagIdx;
            this.sizeTagIdx = ((Number) ((prevSizeTagIdx() != -1 ? prevSizeTagIdx() : ( ((_parent().signature().indexRecords().get(((Number) (idx())).intValue()).signatureTag() == Rpm.SignatureTags.SIZE) && (_parent().signature().indexRecords().get(((Number) (idx())).intValue()).recordType() == Rpm.RecordTypes.UINT32) && (_parent().signature().indexRecords().get(((Number) (idx())).intValue()).numValues() >= 1))  ? idx() : -1)))).intValue();
            return this.sizeTagIdx;
        }
        public void _invalidateSizeTagIdx() { this.sizeTagIdx = null; }
        private int idx;
        private int prevSizeTagIdx;
        private Rpm _root;
        private Rpm _parent;
        public int idx() { return idx; }
        public void setIdx(int _v) { _dirty = true; idx = _v; }
        public int prevSizeTagIdx() { return prevSizeTagIdx; }
        public void setPrevSizeTagIdx(int _v) { _dirty = true; prevSizeTagIdx = _v; }
        public Rpm _root() { return _root; }
        public void set_root(Rpm _v) { _dirty = true; _root = _v; }
        public Rpm _parent() { return _parent; }
        public void set_parent(Rpm _v) { _dirty = true; _parent = _v; }
    }
    private Boolean hasSignatureSizeTag;
    public Boolean hasSignatureSizeTag() {
        if (this.hasSignatureSizeTag != null)
            return this.hasSignatureSizeTag;
        this.hasSignatureSizeTag = signatureTagsSteps().get(signatureTagsSteps().size() - 1).sizeTagIdx() != -1;
        return this.hasSignatureSizeTag;
    }
    public void _invalidateHasSignatureSizeTag() { this.hasSignatureSizeTag = null; }
    private Integer lenHeader;
    public Integer lenHeader() {
        if (this.lenHeader != null)
            return this.lenHeader;
        this.lenHeader = ((Number) (ofsPayload() - ofsHeader())).intValue();
        return this.lenHeader;
    }
    public void _invalidateLenHeader() { this.lenHeader = null; }
    private Integer lenPayload;
    public Integer lenPayload() {
        if (this.lenPayload != null)
            return this.lenPayload;
        if (hasSignatureSizeTag()) {
            this.lenPayload = ((Number) (((Rpm.RecordTypeUint32) (signatureSizeTag().body())).values().get(((int) 0)) - lenHeader())).intValue();
        }
        return this.lenPayload;
    }
    public void _invalidateLenPayload() { this.lenPayload = null; }
    private Integer ofsHeader;
    public Integer ofsHeader() {
        if (this.ofsHeader != null)
            return this.ofsHeader;
        this.ofsHeader = ((Number) (_io().pos())).intValue();
        return this.ofsHeader;
    }
    public void _invalidateOfsHeader() { this.ofsHeader = null; }
    private Integer ofsPayload;
    public Integer ofsPayload() {
        if (this.ofsPayload != null)
            return this.ofsPayload;
        this.ofsPayload = ((Number) (_io().pos())).intValue();
        return this.ofsPayload;
    }
    public void _invalidateOfsPayload() { this.ofsPayload = null; }
    private byte[] payload;
    private boolean _shouldWritePayload = false;
    private boolean _enabledPayload = true;
    public byte[] payload() {
        if (_shouldWritePayload)
            _writePayload();
        if (this.payload != null)
            return this.payload;
        if (!_enabledPayload)
            return null;
        if (hasSignatureSizeTag()) {
            long _pos = this._io.pos();
            this._io.seek(ofsPayload());
            this.payload = this._io.readBytes(lenPayload());
            this._io.seek(_pos);
        }
        return this.payload;
    }
    public void setPayload(byte[] _v) { _dirty = true; payload = _v; }
    public void setPayload_Enabled(boolean _v) { _dirty = true; _enabledPayload = _v; }

    private void _writePayload() {
        _shouldWritePayload = false;
        if (hasSignatureSizeTag()) {
            long _pos = this._io.pos();
            this._io.seek(ofsPayload());
            if (this.payload.length != lenPayload())
                throw new ConsistencyError("payload", lenPayload(), this.payload.length);
            this._io.writeBytes(this.payload);
            this._io.seek(_pos);
        }
    }
    private HeaderIndexRecord signatureSizeTag;
    public HeaderIndexRecord signatureSizeTag() {
        if (this.signatureSizeTag != null)
            return this.signatureSizeTag;
        if (hasSignatureSizeTag()) {
            this.signatureSizeTag = signature().indexRecords().get(((Number) (signatureTagsSteps().get(signatureTagsSteps().size() - 1).sizeTagIdx())).intValue());
        }
        return this.signatureSizeTag;
    }
    public void _invalidateSignatureSizeTag() { this.signatureSizeTag = null; }
    private Lead lead;
    private Header signature;
    private byte[] signaturePadding;
    private byte[] _unnamed3;
    private Header header;
    private byte[] _unnamed5;
    private List<SignatureTagsStep> signatureTagsSteps;
    private Rpm _root;
    private KaitaiStruct.ReadWrite _parent;
    public Lead lead() { return lead; }
    public void setLead(Lead _v) { _dirty = true; lead = _v; }
    public Header signature() { return signature; }
    public void setSignature(Header _v) { _dirty = true; signature = _v; }
    public byte[] signaturePadding() { return signaturePadding; }
    public void setSignaturePadding(byte[] _v) { _dirty = true; signaturePadding = _v; }
    public byte[] _unnamed3() { return _unnamed3; }
    public void set_unnamed3(byte[] _v) { _dirty = true; _unnamed3 = _v; }
    public Header header() { return header; }
    public void setHeader(Header _v) { _dirty = true; header = _v; }
    public byte[] _unnamed5() { return _unnamed5; }
    public void set_unnamed5(byte[] _v) { _dirty = true; _unnamed5 = _v; }
    public List<SignatureTagsStep> signatureTagsSteps() { return signatureTagsSteps; }
    public void setSignatureTagsSteps(List<SignatureTagsStep> _v) { _dirty = true; signatureTagsSteps = _v; }
    public Rpm _root() { return _root; }
    public void set_root(Rpm _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
