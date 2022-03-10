// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;
import java.util.Arrays;


/**
 * This parser is for the RPM version 3 file format which is the current version
 * of the file format used by RPM 2.1 and later (including RPM version 4.x, which
 * is the current version of the RPM tool). There are historical versions of the
 * RPM file format, as well as a currently abandoned fork (rpm5). These formats
 * are not covered by this specification.
 * @see <a href="https://github.com/rpm-software-management/rpm/blob/911448f2/doc/manual/format.md">Source</a>
 * @see <a href="https://github.com/rpm-software-management/rpm/blob/911448f2/doc/manual/tags.md">Source</a>
 * @see <a href="https://refspecs.linuxbase.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/pkgformat.html">Source</a>
 * @see <a href="http://ftp.rpm.org/max-rpm/">Source</a>
 */
public class Rpm extends KaitaiStruct {
    public static Rpm fromFile(String fileName) throws IOException {
        return new Rpm(new ByteBufferKaitaiStream(fileName));
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
        ARCH_SUFFIX(5098);

        private final long id;
        HeaderTags(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, HeaderTags> byId = new HashMap<Long, HeaderTags>(289);
        static {
            for (HeaderTags e : HeaderTags.values())
                byId.put(e.id(), e);
        }
        public static HeaderTags byId(long id) { return byId.get(id); }
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

    public Rpm(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Rpm(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Rpm(KaitaiStream _io, KaitaiStruct _parent, Rpm _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.lead = new Lead(this._io, this, _root);
        this.signature = new Header(this._io, this, _root, true);
        this.signaturePadding = this._io.readBytes(KaitaiStream.mod(-(_io().pos()), 8));
        if (ofsHeader() < 0) {
            this._unnamed3 = this._io.readBytes(0);
        }
        this.header = new Header(this._io, this, _root, false);
        if (ofsPayload() < 0) {
            this._unnamed5 = this._io.readBytes(0);
        }
        signatureTagsSteps = new ArrayList<SignatureTagsStep>(((Number) (signature().headerRecord().numIndexRecords())).intValue());
        for (int i = 0; i < signature().headerRecord().numIndexRecords(); i++) {
            this.signatureTagsSteps.add(new SignatureTagsStep(this._io, this, _root, i, (i < 1 ? -1 : signatureTagsSteps().get((int) (i - 1)).sizeTagIdx())));
        }
    }
    public static class RecordTypeStringArray extends KaitaiStruct {

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
            _read();
        }
        private void _read() {
            values = new ArrayList<String>(((Number) (numValues())).intValue());
            for (int i = 0; i < numValues(); i++) {
                this.values.add(new String(this._io.readBytesTerm(0, false, true, true), Charset.forName("UTF-8")));
            }
        }
        private ArrayList<String> values;
        private long numValues;
        private Rpm _root;
        private Rpm.HeaderIndexRecord _parent;
        public ArrayList<String> values() { return values; }
        public long numValues() { return numValues; }
        public Rpm _root() { return _root; }
        public Rpm.HeaderIndexRecord _parent() { return _parent; }
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
    public static class Lead extends KaitaiStruct {
        public static Lead fromFile(String fileName) throws IOException {
            return new Lead(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(magic(), new byte[] { -19, -85, -18, -37 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -19, -85, -18, -37 }, magic(), _io(), "/types/lead/seq/0");
            }
            this.version = new RpmVersion(this._io, this, _root);
            this.type = Rpm.RpmTypes.byId(this._io.readU2be());
            this.architecture = Rpm.Architectures.byId(this._io.readU2be());
            this.packageName = new String(KaitaiStream.bytesTerminate(this._io.readBytes(66), (byte) 0, false), Charset.forName("UTF-8"));
            this.os = Rpm.OperatingSystems.byId(this._io.readU2be());
            this.signatureType = this._io.readU2be();
            if (!(signatureType() == 5)) {
                throw new KaitaiStream.ValidationNotEqualError(5, signatureType(), _io(), "/types/lead/seq/6");
            }
            this.reserved = this._io.readBytes(16);
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
        public RpmVersion version() { return version; }
        public RpmTypes type() { return type; }
        public Architectures architecture() { return architecture; }
        public String packageName() { return packageName; }
        public OperatingSystems os() { return os; }
        public int signatureType() { return signatureType; }
        public byte[] reserved() { return reserved; }
        public Rpm _root() { return _root; }
        public Rpm _parent() { return _parent; }
    }
    public static class RecordTypeString extends KaitaiStruct {
        public static RecordTypeString fromFile(String fileName) throws IOException {
            return new RecordTypeString(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            values = new ArrayList<String>(((Number) (1)).intValue());
            for (int i = 0; i < 1; i++) {
                this.values.add(new String(this._io.readBytesTerm(0, false, true, true), Charset.forName("UTF-8")));
            }
        }
        private ArrayList<String> values;
        private Rpm _root;
        private Rpm.HeaderIndexRecord _parent;
        public ArrayList<String> values() { return values; }
        public Rpm _root() { return _root; }
        public Rpm.HeaderIndexRecord _parent() { return _parent; }
    }
    public static class SignatureTagsStep extends KaitaiStruct {

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
            _read();
        }
        private void _read() {
        }
        private Integer sizeTagIdx;
        public Integer sizeTagIdx() {
            if (this.sizeTagIdx != null)
                return this.sizeTagIdx;
            int _tmp = (int) ((prevSizeTagIdx() != -1 ? prevSizeTagIdx() : ( ((_parent().signature().indexRecords().get((int) idx()).signatureTag() == Rpm.SignatureTags.SIZE) && (_parent().signature().indexRecords().get((int) idx()).recordType() == Rpm.RecordTypes.UINT32) && (_parent().signature().indexRecords().get((int) idx()).numValues() >= 1))  ? idx() : -1)));
            this.sizeTagIdx = _tmp;
            return this.sizeTagIdx;
        }
        private int idx;
        private int prevSizeTagIdx;
        private Rpm _root;
        private Rpm _parent;
        public int idx() { return idx; }
        public int prevSizeTagIdx() { return prevSizeTagIdx; }
        public Rpm _root() { return _root; }
        public Rpm _parent() { return _parent; }
    }
    public static class RecordTypeUint32 extends KaitaiStruct {

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
            _read();
        }
        private void _read() {
            values = new ArrayList<Long>(((Number) (numValues())).intValue());
            for (int i = 0; i < numValues(); i++) {
                this.values.add(this._io.readU4be());
            }
        }
        private ArrayList<Long> values;
        private long numValues;
        private Rpm _root;
        private Rpm.HeaderIndexRecord _parent;
        public ArrayList<Long> values() { return values; }
        public long numValues() { return numValues; }
        public Rpm _root() { return _root; }
        public Rpm.HeaderIndexRecord _parent() { return _parent; }
    }
    public static class RecordTypeUint16 extends KaitaiStruct {

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
            _read();
        }
        private void _read() {
            values = new ArrayList<Integer>(((Number) (numValues())).intValue());
            for (int i = 0; i < numValues(); i++) {
                this.values.add(this._io.readU2be());
            }
        }
        private ArrayList<Integer> values;
        private long numValues;
        private Rpm _root;
        private Rpm.HeaderIndexRecord _parent;
        public ArrayList<Integer> values() { return values; }
        public long numValues() { return numValues; }
        public Rpm _root() { return _root; }
        public Rpm.HeaderIndexRecord _parent() { return _parent; }
    }
    public static class HeaderIndexRecord extends KaitaiStruct {
        public static HeaderIndexRecord fromFile(String fileName) throws IOException {
            return new HeaderIndexRecord(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.tagRaw = this._io.readU4be();
            this.recordType = Rpm.RecordTypes.byId(this._io.readU4be());
            this.ofsBody = this._io.readU4be();
            this.count = this._io.readU4be();
        }
        private Long numValues;
        public Long numValues() {
            if (this.numValues != null)
                return this.numValues;
            if (recordType() != Rpm.RecordTypes.BIN) {
                long _tmp = (long) (count());
                this.numValues = _tmp;
            }
            return this.numValues;
        }
        private KaitaiStruct body;
        public KaitaiStruct body() {
            if (this.body != null)
                return this.body;
            KaitaiStream io = _parent().storageSection()._io();
            long _pos = io.pos();
            io.seek(ofsBody());
            {
                RecordTypes on = recordType();
                if (on != null) {
                    switch (recordType()) {
                    case UINT32: {
                        this.body = new RecordTypeUint32(io, this, _root, numValues());
                        break;
                    }
                    case UINT64: {
                        this.body = new RecordTypeUint64(io, this, _root, numValues());
                        break;
                    }
                    case BIN: {
                        this.body = new RecordTypeBin(io, this, _root, lenValue());
                        break;
                    }
                    case STRING: {
                        this.body = new RecordTypeString(io, this, _root);
                        break;
                    }
                    case UINT8: {
                        this.body = new RecordTypeUint8(io, this, _root, numValues());
                        break;
                    }
                    case I18N_STRING: {
                        this.body = new RecordTypeStringArray(io, this, _root, numValues());
                        break;
                    }
                    case UINT16: {
                        this.body = new RecordTypeUint16(io, this, _root, numValues());
                        break;
                    }
                    case CHAR: {
                        this.body = new RecordTypeUint8(io, this, _root, numValues());
                        break;
                    }
                    case STRING_ARRAY: {
                        this.body = new RecordTypeStringArray(io, this, _root, numValues());
                        break;
                    }
                    }
                }
            }
            io.seek(_pos);
            return this.body;
        }
        private SignatureTags signatureTag;
        public SignatureTags signatureTag() {
            if (this.signatureTag != null)
                return this.signatureTag;
            if (_parent().isSignature()) {
                this.signatureTag = Rpm.SignatureTags.byId(tagRaw());
            }
            return this.signatureTag;
        }
        private Long lenValue;
        public Long lenValue() {
            if (this.lenValue != null)
                return this.lenValue;
            if (recordType() == Rpm.RecordTypes.BIN) {
                long _tmp = (long) (count());
                this.lenValue = _tmp;
            }
            return this.lenValue;
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
        public RecordTypes recordType() { return recordType; }
        public long ofsBody() { return ofsBody; }

        /**
         * internal; access `num_values` and `len_value` instead
         */
        public long count() { return count; }
        public Rpm _root() { return _root; }
        public Rpm.Header _parent() { return _parent; }
    }
    public static class RpmVersion extends KaitaiStruct {
        public static RpmVersion fromFile(String fileName) throws IOException {
            return new RpmVersion(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.major = this._io.readU1();
            if (!(major() >= 3)) {
                throw new KaitaiStream.ValidationLessThanError(3, major(), _io(), "/types/rpm_version/seq/0");
            }
            if (!(major() <= 4)) {
                throw new KaitaiStream.ValidationGreaterThanError(4, major(), _io(), "/types/rpm_version/seq/0");
            }
            this.minor = this._io.readU1();
        }
        private int major;
        private int minor;
        private Rpm _root;
        private Rpm.Lead _parent;

        /**
         * @see <a href="https://github.com/rpm-software-management/rpm/blob/911448f2/lib/rpmlead.c#L102">Source</a>
         */
        public int major() { return major; }
        public int minor() { return minor; }
        public Rpm _root() { return _root; }
        public Rpm.Lead _parent() { return _parent; }
    }
    public static class Dummy extends KaitaiStruct {
        public static Dummy fromFile(String fileName) throws IOException {
            return new Dummy(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
        }
        private Rpm _root;
        private Rpm.Header _parent;
        public Rpm _root() { return _root; }
        public Rpm.Header _parent() { return _parent; }
    }
    public static class RecordTypeUint8 extends KaitaiStruct {

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
            _read();
        }
        private void _read() {
            values = new ArrayList<Integer>(((Number) (numValues())).intValue());
            for (int i = 0; i < numValues(); i++) {
                this.values.add(this._io.readU1());
            }
        }
        private ArrayList<Integer> values;
        private long numValues;
        private Rpm _root;
        private Rpm.HeaderIndexRecord _parent;
        public ArrayList<Integer> values() { return values; }
        public long numValues() { return numValues; }
        public Rpm _root() { return _root; }
        public Rpm.HeaderIndexRecord _parent() { return _parent; }
    }
    public static class RecordTypeUint64 extends KaitaiStruct {

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
            _read();
        }
        private void _read() {
            values = new ArrayList<Long>(((Number) (numValues())).intValue());
            for (int i = 0; i < numValues(); i++) {
                this.values.add(this._io.readU8be());
            }
        }
        private ArrayList<Long> values;
        private long numValues;
        private Rpm _root;
        private Rpm.HeaderIndexRecord _parent;
        public ArrayList<Long> values() { return values; }
        public long numValues() { return numValues; }
        public Rpm _root() { return _root; }
        public Rpm.HeaderIndexRecord _parent() { return _parent; }
    }
    public static class RecordTypeBin extends KaitaiStruct {

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
            _read();
        }
        private void _read() {
            values = new ArrayList<byte[]>(((Number) (1)).intValue());
            for (int i = 0; i < 1; i++) {
                this.values.add(this._io.readBytes(lenValue()));
            }
        }
        private ArrayList<byte[]> values;
        private long lenValue;
        private Rpm _root;
        private Rpm.HeaderIndexRecord _parent;
        public ArrayList<byte[]> values() { return values; }
        public long lenValue() { return lenValue; }
        public Rpm _root() { return _root; }
        public Rpm.HeaderIndexRecord _parent() { return _parent; }
    }
    public static class HeaderRecord extends KaitaiStruct {
        public static HeaderRecord fromFile(String fileName) throws IOException {
            return new HeaderRecord(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(magic(), new byte[] { -114, -83, -24, 1 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -114, -83, -24, 1 }, magic(), _io(), "/types/header_record/seq/0");
            }
            this.reserved = this._io.readBytes(4);
            if (!(Arrays.equals(reserved(), new byte[] { 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, reserved(), _io(), "/types/header_record/seq/1");
            }
            this.numIndexRecords = this._io.readU4be();
            if (!(numIndexRecords() >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, numIndexRecords(), _io(), "/types/header_record/seq/2");
            }
            this.lenStorageSection = this._io.readU4be();
        }
        private byte[] magic;
        private byte[] reserved;
        private long numIndexRecords;
        private long lenStorageSection;
        private Rpm _root;
        private Rpm.Header _parent;
        public byte[] magic() { return magic; }
        public byte[] reserved() { return reserved; }
        public long numIndexRecords() { return numIndexRecords; }

        /**
         * Size of the storage area for the data
         * pointed to by the Index Records.
         */
        public long lenStorageSection() { return lenStorageSection; }
        public Rpm _root() { return _root; }
        public Rpm.Header _parent() { return _parent; }
    }

    /**
     * header structure used for both the "header" and "signature", but some tag
     * values have different meanings in signature and header (hence they use
     * different enums)
     */
    public static class Header extends KaitaiStruct {

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
            _read();
        }
        private void _read() {
            this.headerRecord = new HeaderRecord(this._io, this, _root);
            indexRecords = new ArrayList<HeaderIndexRecord>(((Number) (headerRecord().numIndexRecords())).intValue());
            for (int i = 0; i < headerRecord().numIndexRecords(); i++) {
                this.indexRecords.add(new HeaderIndexRecord(this._io, this, _root));
            }
            this._raw_storageSection = this._io.readBytes(headerRecord().lenStorageSection());
            KaitaiStream _io__raw_storageSection = new ByteBufferKaitaiStream(_raw_storageSection);
            this.storageSection = new Dummy(_io__raw_storageSection, this, _root);
        }
        private Boolean isHeader;
        public Boolean isHeader() {
            if (this.isHeader != null)
                return this.isHeader;
            boolean _tmp = (boolean) (!(isSignature()));
            this.isHeader = _tmp;
            return this.isHeader;
        }
        private HeaderRecord headerRecord;
        private ArrayList<HeaderIndexRecord> indexRecords;
        private Dummy storageSection;
        private boolean isSignature;
        private Rpm _root;
        private Rpm _parent;
        private byte[] _raw_storageSection;
        public HeaderRecord headerRecord() { return headerRecord; }
        public ArrayList<HeaderIndexRecord> indexRecords() { return indexRecords; }
        public Dummy storageSection() { return storageSection; }
        public boolean isSignature() { return isSignature; }
        public Rpm _root() { return _root; }
        public Rpm _parent() { return _parent; }
        public byte[] _raw_storageSection() { return _raw_storageSection; }
    }
    private Boolean hasSignatureSizeTag;
    public Boolean hasSignatureSizeTag() {
        if (this.hasSignatureSizeTag != null)
            return this.hasSignatureSizeTag;
        boolean _tmp = (boolean) (signatureTagsSteps().get(signatureTagsSteps().size() - 1).sizeTagIdx() != -1);
        this.hasSignatureSizeTag = _tmp;
        return this.hasSignatureSizeTag;
    }
    private HeaderIndexRecord signatureSizeTag;
    public HeaderIndexRecord signatureSizeTag() {
        if (this.signatureSizeTag != null)
            return this.signatureSizeTag;
        if (hasSignatureSizeTag()) {
            this.signatureSizeTag = signature().indexRecords().get((int) signatureTagsSteps().get(signatureTagsSteps().size() - 1).sizeTagIdx());
        }
        return this.signatureSizeTag;
    }
    private Integer lenPayload;
    public Integer lenPayload() {
        if (this.lenPayload != null)
            return this.lenPayload;
        if (hasSignatureSizeTag()) {
            int _tmp = (int) ((((Rpm.RecordTypeUint32) (signatureSizeTag().body())).values().get((int) 0) - lenHeader()));
            this.lenPayload = _tmp;
        }
        return this.lenPayload;
    }
    private byte[] payload;
    public byte[] payload() {
        if (this.payload != null)
            return this.payload;
        if (hasSignatureSizeTag()) {
            long _pos = this._io.pos();
            this._io.seek(ofsPayload());
            this.payload = this._io.readBytes(lenPayload());
            this._io.seek(_pos);
        }
        return this.payload;
    }
    private Integer lenHeader;
    public Integer lenHeader() {
        if (this.lenHeader != null)
            return this.lenHeader;
        int _tmp = (int) ((ofsPayload() - ofsHeader()));
        this.lenHeader = _tmp;
        return this.lenHeader;
    }
    private Integer ofsHeader;
    public Integer ofsHeader() {
        if (this.ofsHeader != null)
            return this.ofsHeader;
        int _tmp = (int) (_io().pos());
        this.ofsHeader = _tmp;
        return this.ofsHeader;
    }
    private Integer ofsPayload;
    public Integer ofsPayload() {
        if (this.ofsPayload != null)
            return this.ofsPayload;
        int _tmp = (int) (_io().pos());
        this.ofsPayload = _tmp;
        return this.ofsPayload;
    }
    private Lead lead;
    private Header signature;
    private byte[] signaturePadding;
    private byte[] _unnamed3;
    private Header header;
    private byte[] _unnamed5;
    private ArrayList<SignatureTagsStep> signatureTagsSteps;
    private Rpm _root;
    private KaitaiStruct _parent;
    public Lead lead() { return lead; }
    public Header signature() { return signature; }
    public byte[] signaturePadding() { return signaturePadding; }
    public byte[] _unnamed3() { return _unnamed3; }
    public Header header() { return header; }
    public byte[] _unnamed5() { return _unnamed5; }
    public ArrayList<SignatureTagsStep> signatureTagsSteps() { return signatureTagsSteps; }
    public Rpm _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
