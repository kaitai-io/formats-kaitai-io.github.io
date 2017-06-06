// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.Charset;
import java.util.ArrayList;

public class Icc4 extends KaitaiStruct {
    public static Icc4 fromFile(String fileName) throws IOException {
        return new Icc4(new KaitaiStream(fileName));
    }

    public Icc4(KaitaiStream _io) {
        super(_io);
        this._root = this;
        _init();
    }

    public Icc4(KaitaiStream _io, KaitaiStruct _parent) {
        super(_io);
        this._parent = _parent;
        this._root = this;
        _init();
    }

    public Icc4(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root;
        _init();
    }

    private void _init() {
        _read();
    }
    private void _read() {
        this.header = new ProfileHeader(this._io, this, _root);
        this.tagTable = new TagTable(this._io, this, _root);
    }
    public static class U8Fixed8Number extends KaitaiStruct {
        public static U8Fixed8Number fromFile(String fileName) throws IOException {
            return new U8Fixed8Number(new KaitaiStream(fileName));
        }

        public U8Fixed8Number(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public U8Fixed8Number(KaitaiStream _io, KaitaiStruct _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public U8Fixed8Number(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.number = this._io.readBytes(2);
        }
        private byte[] number;
        private Icc4 _root;
        private KaitaiStruct _parent;
        public byte[] number() { return number; }
        public Icc4 _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class U16Fixed16Number extends KaitaiStruct {
        public static U16Fixed16Number fromFile(String fileName) throws IOException {
            return new U16Fixed16Number(new KaitaiStream(fileName));
        }

        public U16Fixed16Number(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public U16Fixed16Number(KaitaiStream _io, KaitaiStruct _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public U16Fixed16Number(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.number = this._io.readBytes(4);
        }
        private byte[] number;
        private Icc4 _root;
        private KaitaiStruct _parent;
        public byte[] number() { return number; }
        public Icc4 _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class StandardIlluminantEncoding extends KaitaiStruct {
        public static StandardIlluminantEncoding fromFile(String fileName) throws IOException {
            return new StandardIlluminantEncoding(new KaitaiStream(fileName));
        }

        public enum StandardIlluminantEncodings {
            UNKNOWN(0),
            D50(1),
            D65(2),
            D93(3),
            F2(4),
            D55(5),
            A(6),
            EQUI_POWER(7),
            F8(8);

            private final long id;
            StandardIlluminantEncodings(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, StandardIlluminantEncodings> byId = new HashMap<Long, StandardIlluminantEncodings>(9);
            static {
                for (StandardIlluminantEncodings e : StandardIlluminantEncodings.values())
                    byId.put(e.id(), e);
            }
            public static StandardIlluminantEncodings byId(long id) { return byId.get(id); }
        }

        public StandardIlluminantEncoding(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public StandardIlluminantEncoding(KaitaiStream _io, KaitaiStruct _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public StandardIlluminantEncoding(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.standardIlluminantEncoding = StandardIlluminantEncodings.byId(this._io.readU4be());
        }
        private StandardIlluminantEncodings standardIlluminantEncoding;
        private Icc4 _root;
        private KaitaiStruct _parent;
        public StandardIlluminantEncodings standardIlluminantEncoding() { return standardIlluminantEncoding; }
        public Icc4 _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class ProfileHeader extends KaitaiStruct {
        public static ProfileHeader fromFile(String fileName) throws IOException {
            return new ProfileHeader(new KaitaiStream(fileName));
        }

        public enum CmmSignatures {
            THE_IMAGING_FACTORY_CMM(858931796),
            AGFA_CMM(1094929747),
            ADOBE_CMM(1094992453),
            COLOR_GEAR_CMM(1128484179),
            LOGOSYNC_CMM(1147629395),
            EFI_CMM(1162234144),
            EXACT_SCAN_CMM(1163411779),
            FUJI_FILM_CMM(1179000864),
            HARLEQUIN_RIP_CMM(1212370253),
            HEIDELBERG_CMM(1212435744),
            KODAK_CMM(1262701907),
            KONICA_MINOLTA_CMM(1296256324),
            DEVICE_LINK_CMM(1380404563),
            SAMPLE_ICC_CMM(1397310275),
            MUTOH_CMM(1397311310),
            TOSHIBA_CMM(1413696845),
            COLOR_GEAR_CMM_LITE(1430471501),
            COLOR_GEAR_CMM_C(1430474067),
            WINDOWS_COLOR_SYSTEM_CMM(1464029984),
            WARE_TO_GO_CMM(1465141024),
            APPLE_CMM(1634758764),
            ARGYLL_CMS_CMM(1634887532),
            LITTLE_CMS_CMM(1818455411),
            ZORAN_CMM(2053320752);

            private final long id;
            CmmSignatures(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, CmmSignatures> byId = new HashMap<Long, CmmSignatures>(24);
            static {
                for (CmmSignatures e : CmmSignatures.values())
                    byId.put(e.id(), e);
            }
            public static CmmSignatures byId(long id) { return byId.get(id); }
        }

        public enum PrimaryPlatforms {
            APPLE_COMPUTER_INC(1095782476),
            MICROSOFT_CORPORATION(1297303124),
            SILICON_GRAPHICS_INC(1397180704),
            SUN_MICROSYSTEMS(1398099543);

            private final long id;
            PrimaryPlatforms(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, PrimaryPlatforms> byId = new HashMap<Long, PrimaryPlatforms>(4);
            static {
                for (PrimaryPlatforms e : PrimaryPlatforms.values())
                    byId.put(e.id(), e);
            }
            public static PrimaryPlatforms byId(long id) { return byId.get(id); }
        }

        public enum ProfileClasses {
            ABSTRACT_PROFILE(1633842036),
            DEVICE_LINK_PROFILE(1818848875),
            DISPLAY_DEVICE_PROFILE(1835955314),
            NAMED_COLOR_PROFILE(1852662636),
            OUTPUT_DEVICE_PROFILE(1886549106),
            INPUT_DEVICE_PROFILE(1935896178),
            COLOR_SPACE_PROFILE(1936744803);

            private final long id;
            ProfileClasses(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, ProfileClasses> byId = new HashMap<Long, ProfileClasses>(7);
            static {
                for (ProfileClasses e : ProfileClasses.values())
                    byId.put(e.id(), e);
            }
            public static ProfileClasses byId(long id) { return byId.get(id); }
        }

        public enum RenderingIntents {
            PERCEPTUAL(0),
            MEDIA_RELATIVE_COLORIMETRIC(1),
            SATURATION(2),
            ICC_ABSOLUTE_COLORIMETRIC(3);

            private final long id;
            RenderingIntents(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, RenderingIntents> byId = new HashMap<Long, RenderingIntents>(4);
            static {
                for (RenderingIntents e : RenderingIntents.values())
                    byId.put(e.id(), e);
            }
            public static RenderingIntents byId(long id) { return byId.get(id); }
        }

        public enum DataColourSpaces {
            TWO_COLOUR(843271250),
            THREE_COLOUR(860048466),
            FOUR_COLOUR(876825682),
            FIVE_COLOUR(893602898),
            SIX_COLOUR(910380114),
            SEVEN_COLOUR(927157330),
            EIGHT_COLOUR(943934546),
            NINE_COLOUR(960711762),
            TEN_COLOUR(1094929490),
            ELEVEN_COLOUR(1111706706),
            TWELVE_COLOUR(1128483922),
            CMY(1129142560),
            CMYK(1129142603),
            THIRTEEN_COLOUR(1145261138),
            FOURTEEN_COLOUR(1162038354),
            FIFTEEN_COLOUR(1178815570),
            GRAY(1196573017),
            HLS(1212961568),
            HSV(1213421088),
            CIELAB_OR_PCSLAB(1281450528),
            CIELUV(1282766368),
            RGB(1380401696),
            NCIEXYZ_OR_PCSXYZ(1482250784),
            YCBCR(1497588338),
            CIEYXY(1501067552);

            private final long id;
            DataColourSpaces(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, DataColourSpaces> byId = new HashMap<Long, DataColourSpaces>(25);
            static {
                for (DataColourSpaces e : DataColourSpaces.values())
                    byId.put(e.id(), e);
            }
            public static DataColourSpaces byId(long id) { return byId.get(id); }
        }

        public ProfileHeader(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public ProfileHeader(KaitaiStream _io, Icc4 _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public ProfileHeader(KaitaiStream _io, Icc4 _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.size = this._io.readU4be();
            this.preferredCmmType = CmmSignatures.byId(this._io.readU4be());
            this.version = new VersionField(this._io, this, _root);
            this.deviceClass = ProfileClasses.byId(this._io.readU4be());
            this.colorSpace = DataColourSpaces.byId(this._io.readU4be());
            this.pcs = new String(this._io.readBytes(4), Charset.forName("ASCII"));
            this.creationDateTime = new DateTimeNumber(this._io, this, _root);
            this.fileSignature = this._io.ensureFixedContents(new byte[] { 97, 99, 115, 112 });
            this.primaryPlatform = PrimaryPlatforms.byId(this._io.readU4be());
            this.profileFlags = new ProfileFlags(this._io, this, _root);
            this.deviceManufacturer = new DeviceManufacturer(this._io, this, _root);
            this.deviceModel = new String(this._io.readBytes(4), Charset.forName("ASCII"));
            this.deviceAttributes = new DeviceAttributes(this._io, this, _root);
            this.renderingIntent = RenderingIntents.byId(this._io.readU4be());
            this.nciexyzValuesOfIlluminantOfPcs = new XyzNumber(this._io, this, _root);
            this.creator = new DeviceManufacturer(this._io, this, _root);
            this.identifier = this._io.readBytes(16);
            this.reservedData = this._io.readBytes(28);
        }
        public static class VersionField extends KaitaiStruct {
            public static VersionField fromFile(String fileName) throws IOException {
                return new VersionField(new KaitaiStream(fileName));
            }

            public VersionField(KaitaiStream _io) {
                super(_io);
                _init();
            }

            public VersionField(KaitaiStream _io, Icc4.ProfileHeader _parent) {
                super(_io);
                this._parent = _parent;
                _init();
            }

            public VersionField(KaitaiStream _io, Icc4.ProfileHeader _parent, Icc4 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _init();
            }

            private void _init() {
                _read();
            }
            private void _read() {
                this.major = this._io.ensureFixedContents(new byte[] { 4 });
                this.minor = this._io.readBitsInt(4);
                this.bugFixLevel = this._io.readBitsInt(4);
                this._io.alignToByte();
                this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0 });
            }
            private byte[] major;
            private long minor;
            private long bugFixLevel;
            private byte[] reserved;
            private Icc4 _root;
            private Icc4.ProfileHeader _parent;
            public byte[] major() { return major; }
            public long minor() { return minor; }
            public long bugFixLevel() { return bugFixLevel; }
            public byte[] reserved() { return reserved; }
            public Icc4 _root() { return _root; }
            public Icc4.ProfileHeader _parent() { return _parent; }
        }
        public static class ProfileFlags extends KaitaiStruct {
            public static ProfileFlags fromFile(String fileName) throws IOException {
                return new ProfileFlags(new KaitaiStream(fileName));
            }

            public ProfileFlags(KaitaiStream _io) {
                super(_io);
                _init();
            }

            public ProfileFlags(KaitaiStream _io, Icc4.ProfileHeader _parent) {
                super(_io);
                this._parent = _parent;
                _init();
            }

            public ProfileFlags(KaitaiStream _io, Icc4.ProfileHeader _parent, Icc4 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _init();
            }

            private void _init() {
                _read();
            }
            private void _read() {
                this.embeddedProfile = this._io.readBitsInt(1) != 0;
                this.profileCanBeUsedIndependentlyOfEmbeddedColourData = this._io.readBitsInt(1) != 0;
                this.otherFlags = this._io.readBitsInt(30);
            }
            private boolean embeddedProfile;
            private boolean profileCanBeUsedIndependentlyOfEmbeddedColourData;
            private long otherFlags;
            private Icc4 _root;
            private Icc4.ProfileHeader _parent;
            public boolean embeddedProfile() { return embeddedProfile; }
            public boolean profileCanBeUsedIndependentlyOfEmbeddedColourData() { return profileCanBeUsedIndependentlyOfEmbeddedColourData; }
            public long otherFlags() { return otherFlags; }
            public Icc4 _root() { return _root; }
            public Icc4.ProfileHeader _parent() { return _parent; }
        }
        private long size;
        private CmmSignatures preferredCmmType;
        private VersionField version;
        private ProfileClasses deviceClass;
        private DataColourSpaces colorSpace;
        private String pcs;
        private DateTimeNumber creationDateTime;
        private byte[] fileSignature;
        private PrimaryPlatforms primaryPlatform;
        private ProfileFlags profileFlags;
        private DeviceManufacturer deviceManufacturer;
        private String deviceModel;
        private DeviceAttributes deviceAttributes;
        private RenderingIntents renderingIntent;
        private XyzNumber nciexyzValuesOfIlluminantOfPcs;
        private DeviceManufacturer creator;
        private byte[] identifier;
        private byte[] reservedData;
        private Icc4 _root;
        private Icc4 _parent;
        public long size() { return size; }
        public CmmSignatures preferredCmmType() { return preferredCmmType; }
        public VersionField version() { return version; }
        public ProfileClasses deviceClass() { return deviceClass; }
        public DataColourSpaces colorSpace() { return colorSpace; }
        public String pcs() { return pcs; }
        public DateTimeNumber creationDateTime() { return creationDateTime; }
        public byte[] fileSignature() { return fileSignature; }
        public PrimaryPlatforms primaryPlatform() { return primaryPlatform; }
        public ProfileFlags profileFlags() { return profileFlags; }
        public DeviceManufacturer deviceManufacturer() { return deviceManufacturer; }
        public String deviceModel() { return deviceModel; }
        public DeviceAttributes deviceAttributes() { return deviceAttributes; }
        public RenderingIntents renderingIntent() { return renderingIntent; }
        public XyzNumber nciexyzValuesOfIlluminantOfPcs() { return nciexyzValuesOfIlluminantOfPcs; }
        public DeviceManufacturer creator() { return creator; }
        public byte[] identifier() { return identifier; }
        public byte[] reservedData() { return reservedData; }
        public Icc4 _root() { return _root; }
        public Icc4 _parent() { return _parent; }
    }
    public static class XyzNumber extends KaitaiStruct {
        public static XyzNumber fromFile(String fileName) throws IOException {
            return new XyzNumber(new KaitaiStream(fileName));
        }

        public XyzNumber(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public XyzNumber(KaitaiStream _io, KaitaiStruct _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public XyzNumber(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.x = this._io.readBytes(4);
            this.y = this._io.readBytes(4);
            this.z = this._io.readBytes(4);
        }
        private byte[] x;
        private byte[] y;
        private byte[] z;
        private Icc4 _root;
        private KaitaiStruct _parent;
        public byte[] x() { return x; }
        public byte[] y() { return y; }
        public byte[] z() { return z; }
        public Icc4 _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class DateTimeNumber extends KaitaiStruct {
        public static DateTimeNumber fromFile(String fileName) throws IOException {
            return new DateTimeNumber(new KaitaiStream(fileName));
        }

        public DateTimeNumber(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public DateTimeNumber(KaitaiStream _io, KaitaiStruct _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public DateTimeNumber(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.year = this._io.readU2be();
            this.month = this._io.readU2be();
            this.day = this._io.readU2be();
            this.hour = this._io.readU2be();
            this.minute = this._io.readU2be();
            this.second = this._io.readU2be();
        }
        private int year;
        private int month;
        private int day;
        private int hour;
        private int minute;
        private int second;
        private Icc4 _root;
        private KaitaiStruct _parent;
        public int year() { return year; }
        public int month() { return month; }
        public int day() { return day; }
        public int hour() { return hour; }
        public int minute() { return minute; }
        public int second() { return second; }
        public Icc4 _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class Response16Number extends KaitaiStruct {
        public static Response16Number fromFile(String fileName) throws IOException {
            return new Response16Number(new KaitaiStream(fileName));
        }

        public Response16Number(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public Response16Number(KaitaiStream _io, KaitaiStruct _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public Response16Number(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.number = this._io.readU4be();
            this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0 });
            this.measurementValue = new S15Fixed16Number(this._io, this, _root);
        }
        private long number;
        private byte[] reserved;
        private S15Fixed16Number measurementValue;
        private Icc4 _root;
        private KaitaiStruct _parent;
        public long number() { return number; }
        public byte[] reserved() { return reserved; }
        public S15Fixed16Number measurementValue() { return measurementValue; }
        public Icc4 _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class U1Fixed15Number extends KaitaiStruct {
        public static U1Fixed15Number fromFile(String fileName) throws IOException {
            return new U1Fixed15Number(new KaitaiStream(fileName));
        }

        public U1Fixed15Number(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public U1Fixed15Number(KaitaiStream _io, KaitaiStruct _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public U1Fixed15Number(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.number = this._io.readBytes(2);
        }
        private byte[] number;
        private Icc4 _root;
        private KaitaiStruct _parent;
        public byte[] number() { return number; }
        public Icc4 _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class TagTable extends KaitaiStruct {
        public static TagTable fromFile(String fileName) throws IOException {
            return new TagTable(new KaitaiStream(fileName));
        }

        public TagTable(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public TagTable(KaitaiStream _io, Icc4 _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public TagTable(KaitaiStream _io, Icc4 _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.tagCount = this._io.readU4be();
            tags = new ArrayList<TagDefinition>((int) (tagCount()));
            for (int i = 0; i < tagCount(); i++) {
                this.tags.add(new TagDefinition(this._io, this, _root));
            }
        }
        public static class TagDefinition extends KaitaiStruct {
            public static TagDefinition fromFile(String fileName) throws IOException {
                return new TagDefinition(new KaitaiStream(fileName));
            }

            public enum TagSignatures {
                A_TO_B_0(1093812784),
                A_TO_B_1(1093812785),
                A_TO_B_2(1093812786),
                B_TO_A_0(1110589744),
                B_TO_A_1(1110589745),
                B_TO_A_2(1110589746),
                B_TO_D_0(1110590512),
                B_TO_D_1(1110590513),
                B_TO_D_2(1110590514),
                B_TO_D_3(1110590515),
                D_TO_B_0(1144144432),
                D_TO_B_1(1144144433),
                D_TO_B_2(1144144434),
                D_TO_B_3(1144144435),
                BLUE_TRC(1649693251),
                BLUE_MATRIX_COLUMN(1649957210),
                CALIBRATION_DATE_TIME(1667329140),
                CHROMATIC_ADAPTATION(1667785060),
                CHROMATICITY(1667789421),
                COLORIMETRIC_INTENT_IMAGE_STATE(1667852659),
                COLORANT_TABLE_OUT(1668050804),
                COLORANT_ORDER(1668051567),
                COLORANT_TABLE(1668051572),
                COPYRIGHT(1668313716),
                PROFILE_DESCRIPTION(1684370275),
                DEVICE_MODEL_DESC(1684890724),
                DEVICE_MFG_DESC(1684893284),
                GREEN_TRC(1733579331),
                GREEN_MATRIX_COLUMN(1733843290),
                GAMUT(1734438260),
                GRAY_TRC(1800688195),
                LUMINANCE(1819635049),
                MEASUREMENT(1835360627),
                NAMED_COLOR_2(1852009522),
                PREVIEW_0(1886545200),
                PREVIEW_1(1886545201),
                PREVIEW_2(1886545202),
                PROFILE_SEQUENCE(1886610801),
                PROFILE_SEQUENCE_IDENTIFIER(1886611812),
                RED_TRC(1918128707),
                RED_MATRIX_COLUMN(1918392666),
                OUTPUT_RESPONSE(1919251312),
                PERCEPTUAL_RENDERING_INTENT_GAMUT(1919510320),
                SATURATION_RENDERING_INTENT_GAMUT(1919510322),
                CHAR_TARGET(1952543335),
                TECHNOLOGY(1952801640),
                VIEWING_CONDITIONS(1986618743),
                VIEWING_COND_DESC(1987405156),
                MEDIA_WHITE_POINT(2004119668);

                private final long id;
                TagSignatures(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, TagSignatures> byId = new HashMap<Long, TagSignatures>(49);
                static {
                    for (TagSignatures e : TagSignatures.values())
                        byId.put(e.id(), e);
                }
                public static TagSignatures byId(long id) { return byId.get(id); }
            }

            public enum TagTypeSignatures {
                XYZ_TYPE(1482250784),
                COLORANT_TABLE_TYPE(1668051572),
                CURVE_TYPE(1668641398),
                DATA_TYPE(1684108385),
                DATE_TIME_TYPE(1685350765),
                MULTI_FUNCTION_A_TO_B_TABLE_TYPE(1832993312),
                MULTI_FUNCTION_B_TO_A_TABLE_TYPE(1833058592),
                MEASUREMENT_TYPE(1835360627),
                MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE(1835430961),
                MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE(1835430962),
                MULTI_LOCALIZED_UNICODE_TYPE(1835824483),
                MULTI_PROCESS_ELEMENTS_TYPE(1836082548),
                NAMED_COLOR_2_TYPE(1852009522),
                PARAMETRIC_CURVE_TYPE(1885434465),
                PROFILE_SEQUENCE_DESC_TYPE(1886610801),
                PROFILE_SEQUENCE_IDENTIFIER_TYPE(1886611812),
                RESPONSE_CURVE_SET_16_TYPE(1919120178),
                S_15_FIXED_16_ARRAY_TYPE(1936077618),
                SIGNATURE_TYPE(1936287520),
                TEXT_TYPE(1952807028),
                U_16_FIXED_16_ARRAY_TYPE(1969632050),
                U_INT_8_ARRAY_TYPE(1969827896),
                U_INT_16_ARRAY_TYPE(1969828150),
                U_INT_32_ARRAY_TYPE(1969828658),
                U_INT_64_ARRAY_TYPE(1969829428),
                VIEWING_CONDITIONS_TYPE(1986618743);

                private final long id;
                TagTypeSignatures(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, TagTypeSignatures> byId = new HashMap<Long, TagTypeSignatures>(26);
                static {
                    for (TagTypeSignatures e : TagTypeSignatures.values())
                        byId.put(e.id(), e);
                }
                public static TagTypeSignatures byId(long id) { return byId.get(id); }
            }

            public enum MultiProcessElementsTypes {
                BACS_ELEMENT_TYPE(1648444243),
                CLUT_ELEMENT_TYPE(1668052340),
                ONE_DIMENSIONAL_CURVES_TYPE(1668641382),
                EACS_ELEMENT_TYPE(1698775891),
                MATRIX_ELEMENT_TYPE(1835103334),
                CURVE_SET_ELEMENT_TABLE_TYPE(1835428980),
                FORMULA_CURVE_SEGMENTS_TYPE(1885434470),
                SAMPLED_CURVE_SEGMENT_TYPE(1935764838);

                private final long id;
                MultiProcessElementsTypes(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, MultiProcessElementsTypes> byId = new HashMap<Long, MultiProcessElementsTypes>(8);
                static {
                    for (MultiProcessElementsTypes e : MultiProcessElementsTypes.values())
                        byId.put(e.id(), e);
                }
                public static MultiProcessElementsTypes byId(long id) { return byId.get(id); }
            }

            public TagDefinition(KaitaiStream _io) {
                super(_io);
                _init();
            }

            public TagDefinition(KaitaiStream _io, Icc4.TagTable _parent) {
                super(_io);
                this._parent = _parent;
                _init();
            }

            public TagDefinition(KaitaiStream _io, Icc4.TagTable _parent, Icc4 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _init();
            }

            private void _init() {
                _read();
            }
            private void _read() {
                this.tagSignature = TagSignatures.byId(this._io.readU4be());
                this.offsetToDataElement = this._io.readU4be();
                this.sizeOfDataElement = this._io.readU4be();
            }
            public static class BlueMatrixColumnTag extends KaitaiStruct {
                public static BlueMatrixColumnTag fromFile(String fileName) throws IOException {
                    return new BlueMatrixColumnTag(new KaitaiStream(fileName));
                }

                public BlueMatrixColumnTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public BlueMatrixColumnTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public BlueMatrixColumnTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case XYZ_TYPE: {
                        this.tagData = new XyzType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private XyzType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public XyzType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class DeviceMfgDescTag extends KaitaiStruct {
                public static DeviceMfgDescTag fromFile(String fileName) throws IOException {
                    return new DeviceMfgDescTag(new KaitaiStream(fileName));
                }

                public DeviceMfgDescTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public DeviceMfgDescTag(KaitaiStream _io, KaitaiStruct _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public DeviceMfgDescTag(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_LOCALIZED_UNICODE_TYPE: {
                        this.tagData = new MultiLocalizedUnicodeType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private MultiLocalizedUnicodeType tagData;
                private Icc4 _root;
                private KaitaiStruct _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public MultiLocalizedUnicodeType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class NamedColor2Type extends KaitaiStruct {
                public static NamedColor2Type fromFile(String fileName) throws IOException {
                    return new NamedColor2Type(new KaitaiStream(fileName));
                }

                public NamedColor2Type(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public NamedColor2Type(KaitaiStream _io, Icc4.TagTable.TagDefinition.NamedColor2Tag _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public NamedColor2Type(KaitaiStream _io, Icc4.TagTable.TagDefinition.NamedColor2Tag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.vendorSpecificFlag = this._io.readU4be();
                    this.countOfNamedColours = this._io.readU4be();
                    this.numberOfDeviceCoordinatesForEachNamedColour = this._io.readU4be();
                    this.prefixForEachColourName = new String(this._io.readBytesTerm(0, false, true, true), Charset.forName("ASCII"));
                    prefixForEachColourNamePadding = new ArrayList<byte[]>((int) ((32 - prefixForEachColourName().length())));
                    for (int i = 0; i < (32 - prefixForEachColourName().length()); i++) {
                        this.prefixForEachColourNamePadding = this._io.ensureFixedContents(new byte[] { 0 });
                    }
                    this.suffixForEachColourName = new String(this._io.readBytesTerm(0, false, true, true), Charset.forName("ASCII"));
                    suffixForEachColourNamePadding = new ArrayList<byte[]>((int) ((32 - suffixForEachColourName().length())));
                    for (int i = 0; i < (32 - suffixForEachColourName().length()); i++) {
                        this.suffixForEachColourNamePadding = this._io.ensureFixedContents(new byte[] { 0 });
                    }
                    namedColourDefinitions = new ArrayList<NamedColourDefinition>((int) (countOfNamedColours()));
                    for (int i = 0; i < countOfNamedColours(); i++) {
                        this.namedColourDefinitions.add(new NamedColourDefinition(this._io, this, _root));
                    }
                }
                public static class NamedColourDefinition extends KaitaiStruct {
                    public static NamedColourDefinition fromFile(String fileName) throws IOException {
                        return new NamedColourDefinition(new KaitaiStream(fileName));
                    }

                    public NamedColourDefinition(KaitaiStream _io) {
                        super(_io);
                        _init();
                    }

                    public NamedColourDefinition(KaitaiStream _io, Icc4.TagTable.TagDefinition.NamedColor2Type _parent) {
                        super(_io);
                        this._parent = _parent;
                        _init();
                    }

                    public NamedColourDefinition(KaitaiStream _io, Icc4.TagTable.TagDefinition.NamedColor2Type _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                        _init();
                    }

                    private void _init() {
                        _read();
                    }
                    private void _read() {
                        this.rootName = new String(this._io.readBytesTerm(0, false, true, true), Charset.forName("ASCII"));
                        rootNamePadding = new ArrayList<byte[]>((int) ((32 - rootName().length())));
                        for (int i = 0; i < (32 - rootName().length()); i++) {
                            this.rootNamePadding = this._io.ensureFixedContents(new byte[] { 0 });
                        }
                        this.pcsCoordinates = this._io.readBytes(6);
                        if (_parent().numberOfDeviceCoordinatesForEachNamedColour() > 0) {
                            deviceCoordinates = new ArrayList<Integer>((int) (_parent().countOfNamedColours()));
                            for (int i = 0; i < _parent().countOfNamedColours(); i++) {
                                this.deviceCoordinates.add(this._io.readU2be());
                            }
                        }
                    }
                    private String rootName;
                    private ArrayList<byte[]> rootNamePadding;
                    private byte[] pcsCoordinates;
                    private ArrayList<Integer> deviceCoordinates;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.NamedColor2Type _parent;
                    public String rootName() { return rootName; }
                    public ArrayList<byte[]> rootNamePadding() { return rootNamePadding; }
                    public byte[] pcsCoordinates() { return pcsCoordinates; }
                    public ArrayList<Integer> deviceCoordinates() { return deviceCoordinates; }
                    public Icc4 _root() { return _root; }
                    public Icc4.TagTable.TagDefinition.NamedColor2Type _parent() { return _parent; }
                }
                private byte[] reserved;
                private long vendorSpecificFlag;
                private long countOfNamedColours;
                private long numberOfDeviceCoordinatesForEachNamedColour;
                private String prefixForEachColourName;
                private ArrayList<byte[]> prefixForEachColourNamePadding;
                private String suffixForEachColourName;
                private ArrayList<byte[]> suffixForEachColourNamePadding;
                private ArrayList<NamedColourDefinition> namedColourDefinitions;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.NamedColor2Tag _parent;
                public byte[] reserved() { return reserved; }
                public long vendorSpecificFlag() { return vendorSpecificFlag; }
                public long countOfNamedColours() { return countOfNamedColours; }
                public long numberOfDeviceCoordinatesForEachNamedColour() { return numberOfDeviceCoordinatesForEachNamedColour; }
                public String prefixForEachColourName() { return prefixForEachColourName; }
                public ArrayList<byte[]> prefixForEachColourNamePadding() { return prefixForEachColourNamePadding; }
                public String suffixForEachColourName() { return suffixForEachColourName; }
                public ArrayList<byte[]> suffixForEachColourNamePadding() { return suffixForEachColourNamePadding; }
                public ArrayList<NamedColourDefinition> namedColourDefinitions() { return namedColourDefinitions; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition.NamedColor2Tag _parent() { return _parent; }
            }
            public static class ViewingConditionsTag extends KaitaiStruct {
                public static ViewingConditionsTag fromFile(String fileName) throws IOException {
                    return new ViewingConditionsTag(new KaitaiStream(fileName));
                }

                public ViewingConditionsTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public ViewingConditionsTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public ViewingConditionsTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case VIEWING_CONDITIONS_TYPE: {
                        this.tagData = new ViewingConditionsType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private ViewingConditionsType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public ViewingConditionsType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class BlueTrcTag extends KaitaiStruct {
                public static BlueTrcTag fromFile(String fileName) throws IOException {
                    return new BlueTrcTag(new KaitaiStream(fileName));
                }

                public BlueTrcTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public BlueTrcTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public BlueTrcTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case CURVE_TYPE: {
                        this.tagData = new CurveType(this._io, this, _root);
                        break;
                    }
                    case PARAMETRIC_CURVE_TYPE: {
                        this.tagData = new ParametricCurveType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public KaitaiStruct tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class ResponseCurveSet16Type extends KaitaiStruct {
                public static ResponseCurveSet16Type fromFile(String fileName) throws IOException {
                    return new ResponseCurveSet16Type(new KaitaiStream(fileName));
                }

                public ResponseCurveSet16Type(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public ResponseCurveSet16Type(KaitaiStream _io, Icc4.TagTable.TagDefinition.OutputResponseTag _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public ResponseCurveSet16Type(KaitaiStream _io, Icc4.TagTable.TagDefinition.OutputResponseTag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.numberOfChannels = this._io.readU2be();
                    this.countOfMeasurementTypes = this._io.readU2be();
                    responseCurveStructureOffsets = new ArrayList<Long>((int) (countOfMeasurementTypes()));
                    for (int i = 0; i < countOfMeasurementTypes(); i++) {
                        this.responseCurveStructureOffsets.add(this._io.readU4be());
                    }
                    this.responseCurveStructures = this._io.readBytesFull();
                }
                private byte[] reserved;
                private int numberOfChannels;
                private int countOfMeasurementTypes;
                private ArrayList<Long> responseCurveStructureOffsets;
                private byte[] responseCurveStructures;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.OutputResponseTag _parent;
                public byte[] reserved() { return reserved; }
                public int numberOfChannels() { return numberOfChannels; }
                public int countOfMeasurementTypes() { return countOfMeasurementTypes; }
                public ArrayList<Long> responseCurveStructureOffsets() { return responseCurveStructureOffsets; }
                public byte[] responseCurveStructures() { return responseCurveStructures; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition.OutputResponseTag _parent() { return _parent; }
            }
            public static class CurveType extends KaitaiStruct {
                public static CurveType fromFile(String fileName) throws IOException {
                    return new CurveType(new KaitaiStream(fileName));
                }

                public CurveType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public CurveType(KaitaiStream _io, KaitaiStruct _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public CurveType(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.numberOfEntries = this._io.readU4be();
                    if (numberOfEntries() > 1) {
                        curveValues = new ArrayList<Long>((int) (numberOfEntries()));
                        for (int i = 0; i < numberOfEntries(); i++) {
                            this.curveValues.add(this._io.readU4be());
                        }
                    }
                    if (numberOfEntries() == 1) {
                        this.curveValue = this._io.readU1();
                    }
                }
                private byte[] reserved;
                private long numberOfEntries;
                private ArrayList<Long> curveValues;
                private Integer curveValue;
                private Icc4 _root;
                private KaitaiStruct _parent;
                public byte[] reserved() { return reserved; }
                public long numberOfEntries() { return numberOfEntries; }
                public ArrayList<Long> curveValues() { return curveValues; }
                public Integer curveValue() { return curveValue; }
                public Icc4 _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class SaturationRenderingIntentGamutTag extends KaitaiStruct {
                public static SaturationRenderingIntentGamutTag fromFile(String fileName) throws IOException {
                    return new SaturationRenderingIntentGamutTag(new KaitaiStream(fileName));
                }

                public SaturationRenderingIntentGamutTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public SaturationRenderingIntentGamutTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public SaturationRenderingIntentGamutTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case SIGNATURE_TYPE: {
                        this.tagData = new SignatureType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private SignatureType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public SignatureType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class XyzType extends KaitaiStruct {
                public static XyzType fromFile(String fileName) throws IOException {
                    return new XyzType(new KaitaiStream(fileName));
                }

                public XyzType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public XyzType(KaitaiStream _io, KaitaiStruct _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public XyzType(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.values = new ArrayList<XyzNumber>();
                    while (!this._io.isEof()) {
                        this.values.add(new XyzNumber(this._io, this, _root));
                    }
                }
                private byte[] reserved;
                private ArrayList<XyzNumber> values;
                private Icc4 _root;
                private KaitaiStruct _parent;
                public byte[] reserved() { return reserved; }
                public ArrayList<XyzNumber> values() { return values; }
                public Icc4 _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class Lut8Type extends KaitaiStruct {
                public static Lut8Type fromFile(String fileName) throws IOException {
                    return new Lut8Type(new KaitaiStream(fileName));
                }

                public Lut8Type(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public Lut8Type(KaitaiStream _io, KaitaiStruct _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public Lut8Type(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.numberOfInputChannels = this._io.readU1();
                    this.numberOfOutputChannels = this._io.readU1();
                    this.numberOfClutGridPoints = this._io.readU1();
                    this.padding = this._io.ensureFixedContents(new byte[] { 0 });
                    encodedEParameters = new ArrayList<Integer>((int) (9));
                    for (int i = 0; i < 9; i++) {
                        this.encodedEParameters.add(this._io.readS4be());
                    }
                    this.numberOfInputTableEntries = this._io.readU4be();
                    this.numberOfOutputTableEntries = this._io.readU4be();
                    this.inputTables = this._io.readBytes((256 * numberOfInputChannels()));
                    this.clutValues = this._io.readBytes(((numberOfClutGridPoints() ^ numberOfInputChannels()) * numberOfOutputChannels()));
                    this.outputTables = this._io.readBytes((256 * numberOfOutputChannels()));
                }
                private byte[] reserved;
                private int numberOfInputChannels;
                private int numberOfOutputChannels;
                private int numberOfClutGridPoints;
                private byte[] padding;
                private ArrayList<Integer> encodedEParameters;
                private long numberOfInputTableEntries;
                private long numberOfOutputTableEntries;
                private byte[] inputTables;
                private byte[] clutValues;
                private byte[] outputTables;
                private Icc4 _root;
                private KaitaiStruct _parent;
                public byte[] reserved() { return reserved; }
                public int numberOfInputChannels() { return numberOfInputChannels; }
                public int numberOfOutputChannels() { return numberOfOutputChannels; }
                public int numberOfClutGridPoints() { return numberOfClutGridPoints; }
                public byte[] padding() { return padding; }
                public ArrayList<Integer> encodedEParameters() { return encodedEParameters; }
                public long numberOfInputTableEntries() { return numberOfInputTableEntries; }
                public long numberOfOutputTableEntries() { return numberOfOutputTableEntries; }
                public byte[] inputTables() { return inputTables; }
                public byte[] clutValues() { return clutValues; }
                public byte[] outputTables() { return outputTables; }
                public Icc4 _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class BToA2Tag extends KaitaiStruct {
                public static BToA2Tag fromFile(String fileName) throws IOException {
                    return new BToA2Tag(new KaitaiStream(fileName));
                }

                public BToA2Tag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public BToA2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public BToA2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                        this.tagData = new Lut8Type(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                        this.tagData = new Lut16Type(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                        this.tagData = new LutBToAType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public KaitaiStruct tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class LutAToBType extends KaitaiStruct {
                public static LutAToBType fromFile(String fileName) throws IOException {
                    return new LutAToBType(new KaitaiStream(fileName));
                }

                public LutAToBType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public LutAToBType(KaitaiStream _io, KaitaiStruct _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public LutAToBType(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.numberOfInputChannels = this._io.readU1();
                    this.numberOfOutputChannels = this._io.readU1();
                    this.padding = this._io.ensureFixedContents(new byte[] { 0, 0 });
                    this.offsetToFirstBCurve = this._io.readU4be();
                    this.offsetToMatrix = this._io.readU4be();
                    this.offsetToFirstMCurve = this._io.readU4be();
                    this.offsetToClut = this._io.readU4be();
                    this.offsetToFirstACurve = this._io.readU4be();
                    this.data = this._io.readBytesFull();
                }
                private byte[] reserved;
                private int numberOfInputChannels;
                private int numberOfOutputChannels;
                private byte[] padding;
                private long offsetToFirstBCurve;
                private long offsetToMatrix;
                private long offsetToFirstMCurve;
                private long offsetToClut;
                private long offsetToFirstACurve;
                private byte[] data;
                private Icc4 _root;
                private KaitaiStruct _parent;
                public byte[] reserved() { return reserved; }
                public int numberOfInputChannels() { return numberOfInputChannels; }
                public int numberOfOutputChannels() { return numberOfOutputChannels; }
                public byte[] padding() { return padding; }
                public long offsetToFirstBCurve() { return offsetToFirstBCurve; }
                public long offsetToMatrix() { return offsetToMatrix; }
                public long offsetToFirstMCurve() { return offsetToFirstMCurve; }
                public long offsetToClut() { return offsetToClut; }
                public long offsetToFirstACurve() { return offsetToFirstACurve; }
                public byte[] data() { return data; }
                public Icc4 _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class BToA0Tag extends KaitaiStruct {
                public static BToA0Tag fromFile(String fileName) throws IOException {
                    return new BToA0Tag(new KaitaiStream(fileName));
                }

                public BToA0Tag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public BToA0Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public BToA0Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                        this.tagData = new Lut8Type(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                        this.tagData = new Lut16Type(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                        this.tagData = new LutBToAType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public KaitaiStruct tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class MediaWhitePointTag extends KaitaiStruct {
                public static MediaWhitePointTag fromFile(String fileName) throws IOException {
                    return new MediaWhitePointTag(new KaitaiStream(fileName));
                }

                public MediaWhitePointTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public MediaWhitePointTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public MediaWhitePointTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case XYZ_TYPE: {
                        this.tagData = new XyzType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private XyzType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public XyzType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class Lut16Type extends KaitaiStruct {
                public static Lut16Type fromFile(String fileName) throws IOException {
                    return new Lut16Type(new KaitaiStream(fileName));
                }

                public Lut16Type(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public Lut16Type(KaitaiStream _io, KaitaiStruct _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public Lut16Type(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.numberOfInputChannels = this._io.readU1();
                    this.numberOfOutputChannels = this._io.readU1();
                    this.numberOfClutGridPoints = this._io.readU1();
                    this.padding = this._io.ensureFixedContents(new byte[] { 0 });
                    encodedEParameters = new ArrayList<Integer>((int) (9));
                    for (int i = 0; i < 9; i++) {
                        this.encodedEParameters.add(this._io.readS4be());
                    }
                    this.numberOfInputTableEntries = this._io.readU4be();
                    this.numberOfOutputTableEntries = this._io.readU4be();
                    this.inputTables = this._io.readBytes(((2 * numberOfInputChannels()) * numberOfInputTableEntries()));
                    this.clutValues = this._io.readBytes(((2 * (numberOfClutGridPoints() ^ numberOfInputChannels())) * numberOfOutputChannels()));
                    this.outputTables = this._io.readBytes(((2 * numberOfOutputChannels()) * numberOfOutputTableEntries()));
                }
                private byte[] reserved;
                private int numberOfInputChannels;
                private int numberOfOutputChannels;
                private int numberOfClutGridPoints;
                private byte[] padding;
                private ArrayList<Integer> encodedEParameters;
                private long numberOfInputTableEntries;
                private long numberOfOutputTableEntries;
                private byte[] inputTables;
                private byte[] clutValues;
                private byte[] outputTables;
                private Icc4 _root;
                private KaitaiStruct _parent;
                public byte[] reserved() { return reserved; }
                public int numberOfInputChannels() { return numberOfInputChannels; }
                public int numberOfOutputChannels() { return numberOfOutputChannels; }
                public int numberOfClutGridPoints() { return numberOfClutGridPoints; }
                public byte[] padding() { return padding; }
                public ArrayList<Integer> encodedEParameters() { return encodedEParameters; }
                public long numberOfInputTableEntries() { return numberOfInputTableEntries; }
                public long numberOfOutputTableEntries() { return numberOfOutputTableEntries; }
                public byte[] inputTables() { return inputTables; }
                public byte[] clutValues() { return clutValues; }
                public byte[] outputTables() { return outputTables; }
                public Icc4 _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class PerceptualRenderingIntentGamutTag extends KaitaiStruct {
                public static PerceptualRenderingIntentGamutTag fromFile(String fileName) throws IOException {
                    return new PerceptualRenderingIntentGamutTag(new KaitaiStream(fileName));
                }

                public PerceptualRenderingIntentGamutTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public PerceptualRenderingIntentGamutTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public PerceptualRenderingIntentGamutTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case SIGNATURE_TYPE: {
                        this.tagData = new SignatureType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private SignatureType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public SignatureType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class U16Fixed16ArrayType extends KaitaiStruct {
                public static U16Fixed16ArrayType fromFile(String fileName) throws IOException {
                    return new U16Fixed16ArrayType(new KaitaiStream(fileName));
                }

                public U16Fixed16ArrayType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public U16Fixed16ArrayType(KaitaiStream _io, KaitaiStruct _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public U16Fixed16ArrayType(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.values = new ArrayList<U16Fixed16Number>();
                    while (!this._io.isEof()) {
                        this.values.add(new U16Fixed16Number(this._io, this, _root));
                    }
                }
                private byte[] reserved;
                private ArrayList<U16Fixed16Number> values;
                private Icc4 _root;
                private KaitaiStruct _parent;
                public byte[] reserved() { return reserved; }
                public ArrayList<U16Fixed16Number> values() { return values; }
                public Icc4 _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class ColorantTableOutTag extends KaitaiStruct {
                public static ColorantTableOutTag fromFile(String fileName) throws IOException {
                    return new ColorantTableOutTag(new KaitaiStream(fileName));
                }

                public ColorantTableOutTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public ColorantTableOutTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public ColorantTableOutTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case COLORANT_TABLE_TYPE: {
                        this.tagData = new ColorantTableType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private ColorantTableType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public ColorantTableType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class MeasurementTag extends KaitaiStruct {
                public static MeasurementTag fromFile(String fileName) throws IOException {
                    return new MeasurementTag(new KaitaiStream(fileName));
                }

                public MeasurementTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public MeasurementTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public MeasurementTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MEASUREMENT_TYPE: {
                        this.tagData = new MeasurementType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private MeasurementType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public MeasurementType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class ProfileSequenceTag extends KaitaiStruct {
                public static ProfileSequenceTag fromFile(String fileName) throws IOException {
                    return new ProfileSequenceTag(new KaitaiStream(fileName));
                }

                public ProfileSequenceTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public ProfileSequenceTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public ProfileSequenceTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case PROFILE_SEQUENCE_DESC_TYPE: {
                        this.tagData = new ProfileSequenceDescType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private ProfileSequenceDescType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public ProfileSequenceDescType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class TechnologyTag extends KaitaiStruct {
                public static TechnologyTag fromFile(String fileName) throws IOException {
                    return new TechnologyTag(new KaitaiStream(fileName));
                }

                public TechnologyTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public TechnologyTag(KaitaiStream _io, KaitaiStruct _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public TechnologyTag(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case SIGNATURE_TYPE: {
                        this.tagData = new SignatureType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private SignatureType tagData;
                private Icc4 _root;
                private KaitaiStruct _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public SignatureType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class AToB0Tag extends KaitaiStruct {
                public static AToB0Tag fromFile(String fileName) throws IOException {
                    return new AToB0Tag(new KaitaiStream(fileName));
                }

                public AToB0Tag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public AToB0Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public AToB0Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                        this.tagData = new Lut8Type(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                        this.tagData = new Lut16Type(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
                        this.tagData = new LutAToBType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public KaitaiStruct tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class DToB0Tag extends KaitaiStruct {
                public static DToB0Tag fromFile(String fileName) throws IOException {
                    return new DToB0Tag(new KaitaiStream(fileName));
                }

                public DToB0Tag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public DToB0Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public DToB0Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_PROCESS_ELEMENTS_TYPE: {
                        this.tagData = new MultiProcessElementsType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private MultiProcessElementsType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public MultiProcessElementsType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class OutputResponseTag extends KaitaiStruct {
                public static OutputResponseTag fromFile(String fileName) throws IOException {
                    return new OutputResponseTag(new KaitaiStream(fileName));
                }

                public OutputResponseTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public OutputResponseTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public OutputResponseTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case RESPONSE_CURVE_SET_16_TYPE: {
                        this.tagData = new ResponseCurveSet16Type(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private ResponseCurveSet16Type tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public ResponseCurveSet16Type tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class GreenMatrixColumnTag extends KaitaiStruct {
                public static GreenMatrixColumnTag fromFile(String fileName) throws IOException {
                    return new GreenMatrixColumnTag(new KaitaiStream(fileName));
                }

                public GreenMatrixColumnTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public GreenMatrixColumnTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public GreenMatrixColumnTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case XYZ_TYPE: {
                        this.tagData = new XyzType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private XyzType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public XyzType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class ProfileDescriptionTag extends KaitaiStruct {
                public static ProfileDescriptionTag fromFile(String fileName) throws IOException {
                    return new ProfileDescriptionTag(new KaitaiStream(fileName));
                }

                public ProfileDescriptionTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public ProfileDescriptionTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public ProfileDescriptionTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_LOCALIZED_UNICODE_TYPE: {
                        this.tagData = new MultiLocalizedUnicodeType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private MultiLocalizedUnicodeType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public MultiLocalizedUnicodeType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class Preview1Tag extends KaitaiStruct {
                public static Preview1Tag fromFile(String fileName) throws IOException {
                    return new Preview1Tag(new KaitaiStream(fileName));
                }

                public Preview1Tag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public Preview1Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public Preview1Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                        this.tagData = new Lut8Type(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                        this.tagData = new Lut16Type(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                        this.tagData = new LutBToAType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public KaitaiStruct tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class RedTrcTag extends KaitaiStruct {
                public static RedTrcTag fromFile(String fileName) throws IOException {
                    return new RedTrcTag(new KaitaiStream(fileName));
                }

                public RedTrcTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public RedTrcTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public RedTrcTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case CURVE_TYPE: {
                        this.tagData = new CurveType(this._io, this, _root);
                        break;
                    }
                    case PARAMETRIC_CURVE_TYPE: {
                        this.tagData = new ParametricCurveType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public KaitaiStruct tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class BToD0Tag extends KaitaiStruct {
                public static BToD0Tag fromFile(String fileName) throws IOException {
                    return new BToD0Tag(new KaitaiStream(fileName));
                }

                public BToD0Tag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public BToD0Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public BToD0Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_PROCESS_ELEMENTS_TYPE: {
                        this.tagData = new MultiProcessElementsType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private MultiProcessElementsType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public MultiProcessElementsType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class DToB1Tag extends KaitaiStruct {
                public static DToB1Tag fromFile(String fileName) throws IOException {
                    return new DToB1Tag(new KaitaiStream(fileName));
                }

                public DToB1Tag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public DToB1Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public DToB1Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_PROCESS_ELEMENTS_TYPE: {
                        this.tagData = new MultiProcessElementsType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private MultiProcessElementsType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public MultiProcessElementsType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class BToA1Tag extends KaitaiStruct {
                public static BToA1Tag fromFile(String fileName) throws IOException {
                    return new BToA1Tag(new KaitaiStream(fileName));
                }

                public BToA1Tag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public BToA1Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public BToA1Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                        this.tagData = new Lut8Type(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                        this.tagData = new Lut16Type(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                        this.tagData = new LutBToAType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public KaitaiStruct tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class ParametricCurveType extends KaitaiStruct {
                public static ParametricCurveType fromFile(String fileName) throws IOException {
                    return new ParametricCurveType(new KaitaiStream(fileName));
                }

                public enum ParametricCurveTypeFunctions {
                    Y_EQUALS_X_TO_POWER_OF_G(0),
                    CIE_122_1996(1),
                    IEC_61966_3(2),
                    IEC_61966_2_1(3),
                    Y_EQUALS_OB_AX_PLUS_B_CB_TO_POWER_OF_G_PLUS_C(4);

                    private final long id;
                    ParametricCurveTypeFunctions(long id) { this.id = id; }
                    public long id() { return id; }
                    private static final Map<Long, ParametricCurveTypeFunctions> byId = new HashMap<Long, ParametricCurveTypeFunctions>(5);
                    static {
                        for (ParametricCurveTypeFunctions e : ParametricCurveTypeFunctions.values())
                            byId.put(e.id(), e);
                    }
                    public static ParametricCurveTypeFunctions byId(long id) { return byId.get(id); }
                }

                public ParametricCurveType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public ParametricCurveType(KaitaiStream _io, KaitaiStruct _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public ParametricCurveType(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.functionType = ParametricCurveTypeFunctions.byId(this._io.readU2be());
                    this.reserved2 = this._io.ensureFixedContents(new byte[] { 0, 0 });
                    switch (functionType()) {
                    case Y_EQUALS_X_TO_POWER_OF_G: {
                        this.parameters = new ParamsYEqualsXToPowerOfG(this._io, this, _root);
                        break;
                    }
                    case CIE_122_1996: {
                        this.parameters = new ParamsCie1221996(this._io, this, _root);
                        break;
                    }
                    case IEC_61966_2_1: {
                        this.parameters = new ParamsIec6196621(this._io, this, _root);
                        break;
                    }
                    case Y_EQUALS_OB_AX_PLUS_B_CB_TO_POWER_OF_G_PLUS_C: {
                        this.parameters = new ParamsYEqualsObAxPlusBCbToPowerOfGPlusC(this._io, this, _root);
                        break;
                    }
                    case IEC_61966_3: {
                        this.parameters = new ParamsIec619663(this._io, this, _root);
                        break;
                    }
                    }
                }
                public static class ParamsIec619663 extends KaitaiStruct {
                    public static ParamsIec619663 fromFile(String fileName) throws IOException {
                        return new ParamsIec619663(new KaitaiStream(fileName));
                    }

                    public ParamsIec619663(KaitaiStream _io) {
                        super(_io);
                        _init();
                    }

                    public ParamsIec619663(KaitaiStream _io, Icc4.TagTable.TagDefinition.ParametricCurveType _parent) {
                        super(_io);
                        this._parent = _parent;
                        _init();
                    }

                    public ParamsIec619663(KaitaiStream _io, Icc4.TagTable.TagDefinition.ParametricCurveType _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                        _init();
                    }

                    private void _init() {
                        _read();
                    }
                    private void _read() {
                        this.g = this._io.readS4be();
                        this.a = this._io.readS4be();
                        this.b = this._io.readS4be();
                        this.c = this._io.readS4be();
                    }
                    private int g;
                    private int a;
                    private int b;
                    private int c;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.ParametricCurveType _parent;
                    public int g() { return g; }
                    public int a() { return a; }
                    public int b() { return b; }
                    public int c() { return c; }
                    public Icc4 _root() { return _root; }
                    public Icc4.TagTable.TagDefinition.ParametricCurveType _parent() { return _parent; }
                }
                public static class ParamsIec6196621 extends KaitaiStruct {
                    public static ParamsIec6196621 fromFile(String fileName) throws IOException {
                        return new ParamsIec6196621(new KaitaiStream(fileName));
                    }

                    public ParamsIec6196621(KaitaiStream _io) {
                        super(_io);
                        _init();
                    }

                    public ParamsIec6196621(KaitaiStream _io, Icc4.TagTable.TagDefinition.ParametricCurveType _parent) {
                        super(_io);
                        this._parent = _parent;
                        _init();
                    }

                    public ParamsIec6196621(KaitaiStream _io, Icc4.TagTable.TagDefinition.ParametricCurveType _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                        _init();
                    }

                    private void _init() {
                        _read();
                    }
                    private void _read() {
                        this.g = this._io.readS4be();
                        this.a = this._io.readS4be();
                        this.b = this._io.readS4be();
                        this.c = this._io.readS4be();
                        this.d = this._io.readS4be();
                    }
                    private int g;
                    private int a;
                    private int b;
                    private int c;
                    private int d;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.ParametricCurveType _parent;
                    public int g() { return g; }
                    public int a() { return a; }
                    public int b() { return b; }
                    public int c() { return c; }
                    public int d() { return d; }
                    public Icc4 _root() { return _root; }
                    public Icc4.TagTable.TagDefinition.ParametricCurveType _parent() { return _parent; }
                }
                public static class ParamsYEqualsXToPowerOfG extends KaitaiStruct {
                    public static ParamsYEqualsXToPowerOfG fromFile(String fileName) throws IOException {
                        return new ParamsYEqualsXToPowerOfG(new KaitaiStream(fileName));
                    }

                    public ParamsYEqualsXToPowerOfG(KaitaiStream _io) {
                        super(_io);
                        _init();
                    }

                    public ParamsYEqualsXToPowerOfG(KaitaiStream _io, Icc4.TagTable.TagDefinition.ParametricCurveType _parent) {
                        super(_io);
                        this._parent = _parent;
                        _init();
                    }

                    public ParamsYEqualsXToPowerOfG(KaitaiStream _io, Icc4.TagTable.TagDefinition.ParametricCurveType _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                        _init();
                    }

                    private void _init() {
                        _read();
                    }
                    private void _read() {
                        this.g = this._io.readS4be();
                    }
                    private int g;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.ParametricCurveType _parent;
                    public int g() { return g; }
                    public Icc4 _root() { return _root; }
                    public Icc4.TagTable.TagDefinition.ParametricCurveType _parent() { return _parent; }
                }
                public static class ParamsYEqualsObAxPlusBCbToPowerOfGPlusC extends KaitaiStruct {
                    public static ParamsYEqualsObAxPlusBCbToPowerOfGPlusC fromFile(String fileName) throws IOException {
                        return new ParamsYEqualsObAxPlusBCbToPowerOfGPlusC(new KaitaiStream(fileName));
                    }

                    public ParamsYEqualsObAxPlusBCbToPowerOfGPlusC(KaitaiStream _io) {
                        super(_io);
                        _init();
                    }

                    public ParamsYEqualsObAxPlusBCbToPowerOfGPlusC(KaitaiStream _io, Icc4.TagTable.TagDefinition.ParametricCurveType _parent) {
                        super(_io);
                        this._parent = _parent;
                        _init();
                    }

                    public ParamsYEqualsObAxPlusBCbToPowerOfGPlusC(KaitaiStream _io, Icc4.TagTable.TagDefinition.ParametricCurveType _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                        _init();
                    }

                    private void _init() {
                        _read();
                    }
                    private void _read() {
                        this.g = this._io.readS4be();
                        this.a = this._io.readS4be();
                        this.b = this._io.readS4be();
                        this.c = this._io.readS4be();
                        this.d = this._io.readS4be();
                        this.e = this._io.readS4be();
                        this.f = this._io.readS4be();
                    }
                    private int g;
                    private int a;
                    private int b;
                    private int c;
                    private int d;
                    private int e;
                    private int f;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.ParametricCurveType _parent;
                    public int g() { return g; }
                    public int a() { return a; }
                    public int b() { return b; }
                    public int c() { return c; }
                    public int d() { return d; }
                    public int e() { return e; }
                    public int f() { return f; }
                    public Icc4 _root() { return _root; }
                    public Icc4.TagTable.TagDefinition.ParametricCurveType _parent() { return _parent; }
                }
                public static class ParamsCie1221996 extends KaitaiStruct {
                    public static ParamsCie1221996 fromFile(String fileName) throws IOException {
                        return new ParamsCie1221996(new KaitaiStream(fileName));
                    }

                    public ParamsCie1221996(KaitaiStream _io) {
                        super(_io);
                        _init();
                    }

                    public ParamsCie1221996(KaitaiStream _io, Icc4.TagTable.TagDefinition.ParametricCurveType _parent) {
                        super(_io);
                        this._parent = _parent;
                        _init();
                    }

                    public ParamsCie1221996(KaitaiStream _io, Icc4.TagTable.TagDefinition.ParametricCurveType _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                        _init();
                    }

                    private void _init() {
                        _read();
                    }
                    private void _read() {
                        this.g = this._io.readS4be();
                        this.a = this._io.readS4be();
                        this.b = this._io.readS4be();
                    }
                    private int g;
                    private int a;
                    private int b;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.ParametricCurveType _parent;
                    public int g() { return g; }
                    public int a() { return a; }
                    public int b() { return b; }
                    public Icc4 _root() { return _root; }
                    public Icc4.TagTable.TagDefinition.ParametricCurveType _parent() { return _parent; }
                }
                private byte[] reserved;
                private ParametricCurveTypeFunctions functionType;
                private byte[] reserved2;
                private KaitaiStruct parameters;
                private Icc4 _root;
                private KaitaiStruct _parent;
                public byte[] reserved() { return reserved; }
                public ParametricCurveTypeFunctions functionType() { return functionType; }
                public byte[] reserved2() { return reserved2; }
                public KaitaiStruct parameters() { return parameters; }
                public Icc4 _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class ChromaticityTag extends KaitaiStruct {
                public static ChromaticityTag fromFile(String fileName) throws IOException {
                    return new ChromaticityTag(new KaitaiStream(fileName));
                }

                public ChromaticityTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public ChromaticityTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public ChromaticityTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case CHROMATICITY_TYPE: {
                        this.tagData = new ChromaticityType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private ChromaticityType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public ChromaticityType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class ChromaticAdaptationTag extends KaitaiStruct {
                public static ChromaticAdaptationTag fromFile(String fileName) throws IOException {
                    return new ChromaticAdaptationTag(new KaitaiStream(fileName));
                }

                public ChromaticAdaptationTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public ChromaticAdaptationTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public ChromaticAdaptationTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case S_15_FIXED_16_ARRAY_TYPE: {
                        this.tagData = new S15Fixed16ArrayType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private S15Fixed16ArrayType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public S15Fixed16ArrayType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class MeasurementType extends KaitaiStruct {
                public static MeasurementType fromFile(String fileName) throws IOException {
                    return new MeasurementType(new KaitaiStream(fileName));
                }

                public enum StandardObserverEncodings {
                    UNKNOWN(0),
                    CIE_1931_STANDARD_COLORIMETRIC_OBSERVER(1),
                    CIE_1964_STANDARD_COLORIMETRIC_OBSERVER(2);

                    private final long id;
                    StandardObserverEncodings(long id) { this.id = id; }
                    public long id() { return id; }
                    private static final Map<Long, StandardObserverEncodings> byId = new HashMap<Long, StandardObserverEncodings>(3);
                    static {
                        for (StandardObserverEncodings e : StandardObserverEncodings.values())
                            byId.put(e.id(), e);
                    }
                    public static StandardObserverEncodings byId(long id) { return byId.get(id); }
                }

                public enum MeasurementGeometryEncodings {
                    UNKNOWN(0),
                    ZERO_DEGREES_TO_45_DEGREES_OR_45_DEGREES_TO_ZERO_DEGREES(1),
                    ZERO_DEGREES_TO_D_DEGREES_OR_D_DEGREES_TO_ZERO_DEGREES(2);

                    private final long id;
                    MeasurementGeometryEncodings(long id) { this.id = id; }
                    public long id() { return id; }
                    private static final Map<Long, MeasurementGeometryEncodings> byId = new HashMap<Long, MeasurementGeometryEncodings>(3);
                    static {
                        for (MeasurementGeometryEncodings e : MeasurementGeometryEncodings.values())
                            byId.put(e.id(), e);
                    }
                    public static MeasurementGeometryEncodings byId(long id) { return byId.get(id); }
                }

                public enum MeasurementFlareEncodings {
                    ZERO_PERCENT(0),
                    ONE_HUNDRED_PERCENT(65536);

                    private final long id;
                    MeasurementFlareEncodings(long id) { this.id = id; }
                    public long id() { return id; }
                    private static final Map<Long, MeasurementFlareEncodings> byId = new HashMap<Long, MeasurementFlareEncodings>(2);
                    static {
                        for (MeasurementFlareEncodings e : MeasurementFlareEncodings.values())
                            byId.put(e.id(), e);
                    }
                    public static MeasurementFlareEncodings byId(long id) { return byId.get(id); }
                }

                public MeasurementType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public MeasurementType(KaitaiStream _io, Icc4.TagTable.TagDefinition.MeasurementTag _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public MeasurementType(KaitaiStream _io, Icc4.TagTable.TagDefinition.MeasurementTag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.standardObserverEncoding = StandardObserverEncodings.byId(this._io.readU4be());
                    this.nciexyzTristimulusValuesForMeasurementBacking = new XyzNumber(this._io, this, _root);
                    this.measurementGeometryEncoding = MeasurementGeometryEncodings.byId(this._io.readU4be());
                    this.measurementFlareEncoding = MeasurementFlareEncodings.byId(this._io.readU4be());
                    this.standardIlluminantEncoding = new StandardIlluminantEncoding(this._io, this, _root);
                }
                private byte[] reserved;
                private StandardObserverEncodings standardObserverEncoding;
                private XyzNumber nciexyzTristimulusValuesForMeasurementBacking;
                private MeasurementGeometryEncodings measurementGeometryEncoding;
                private MeasurementFlareEncodings measurementFlareEncoding;
                private StandardIlluminantEncoding standardIlluminantEncoding;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.MeasurementTag _parent;
                public byte[] reserved() { return reserved; }
                public StandardObserverEncodings standardObserverEncoding() { return standardObserverEncoding; }
                public XyzNumber nciexyzTristimulusValuesForMeasurementBacking() { return nciexyzTristimulusValuesForMeasurementBacking; }
                public MeasurementGeometryEncodings measurementGeometryEncoding() { return measurementGeometryEncoding; }
                public MeasurementFlareEncodings measurementFlareEncoding() { return measurementFlareEncoding; }
                public StandardIlluminantEncoding standardIlluminantEncoding() { return standardIlluminantEncoding; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition.MeasurementTag _parent() { return _parent; }
            }
            public static class TextType extends KaitaiStruct {
                public static TextType fromFile(String fileName) throws IOException {
                    return new TextType(new KaitaiStream(fileName));
                }

                public TextType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public TextType(KaitaiStream _io, Icc4.TagTable.TagDefinition.CharTargetTag _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public TextType(KaitaiStream _io, Icc4.TagTable.TagDefinition.CharTargetTag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.value = new String(KaitaiStream.bytesTerminate(this._io.readBytesFull(), (byte) 0, false), Charset.forName("ASCII"));
                }
                private byte[] reserved;
                private String value;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.CharTargetTag _parent;
                public byte[] reserved() { return reserved; }
                public String value() { return value; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition.CharTargetTag _parent() { return _parent; }
            }
            public static class ProfileSequenceIdentifierType extends KaitaiStruct {
                public static ProfileSequenceIdentifierType fromFile(String fileName) throws IOException {
                    return new ProfileSequenceIdentifierType(new KaitaiStream(fileName));
                }

                public ProfileSequenceIdentifierType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public ProfileSequenceIdentifierType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierTag _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public ProfileSequenceIdentifierType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierTag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.numberOfStructures = this._io.readU4be();
                    positionsTable = new ArrayList<PositionNumber>((int) (numberOfStructures()));
                    for (int i = 0; i < numberOfStructures(); i++) {
                        this.positionsTable.add(new PositionNumber(this._io, this, _root));
                    }
                    profileIdentifiers = new ArrayList<ProfileIdentifier>((int) (numberOfStructures()));
                    for (int i = 0; i < numberOfStructures(); i++) {
                        this.profileIdentifiers.add(new ProfileIdentifier(this._io, this, _root));
                    }
                }
                public static class ProfileIdentifier extends KaitaiStruct {
                    public static ProfileIdentifier fromFile(String fileName) throws IOException {
                        return new ProfileIdentifier(new KaitaiStream(fileName));
                    }

                    public ProfileIdentifier(KaitaiStream _io) {
                        super(_io);
                        _init();
                    }

                    public ProfileIdentifier(KaitaiStream _io, Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierType _parent) {
                        super(_io);
                        this._parent = _parent;
                        _init();
                    }

                    public ProfileIdentifier(KaitaiStream _io, Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierType _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                        _init();
                    }

                    private void _init() {
                        _read();
                    }
                    private void _read() {
                        this.profileId = this._io.readBytes(16);
                        this.profileDescription = new MultiLocalizedUnicodeType(this._io, this, _root);
                    }
                    private byte[] profileId;
                    private MultiLocalizedUnicodeType profileDescription;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierType _parent;
                    public byte[] profileId() { return profileId; }
                    public MultiLocalizedUnicodeType profileDescription() { return profileDescription; }
                    public Icc4 _root() { return _root; }
                    public Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierType _parent() { return _parent; }
                }
                private byte[] reserved;
                private long numberOfStructures;
                private ArrayList<PositionNumber> positionsTable;
                private ArrayList<ProfileIdentifier> profileIdentifiers;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierTag _parent;
                public byte[] reserved() { return reserved; }
                public long numberOfStructures() { return numberOfStructures; }
                public ArrayList<PositionNumber> positionsTable() { return positionsTable; }
                public ArrayList<ProfileIdentifier> profileIdentifiers() { return profileIdentifiers; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierTag _parent() { return _parent; }
            }
            public static class ColorantTableType extends KaitaiStruct {
                public static ColorantTableType fromFile(String fileName) throws IOException {
                    return new ColorantTableType(new KaitaiStream(fileName));
                }

                public ColorantTableType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public ColorantTableType(KaitaiStream _io, KaitaiStruct _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public ColorantTableType(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.countOfColorants = this._io.readU4be();
                    colorants = new ArrayList<Colorant>((int) (countOfColorants()));
                    for (int i = 0; i < countOfColorants(); i++) {
                        this.colorants.add(new Colorant(this._io, this, _root));
                    }
                }
                public static class Colorant extends KaitaiStruct {
                    public static Colorant fromFile(String fileName) throws IOException {
                        return new Colorant(new KaitaiStream(fileName));
                    }

                    public Colorant(KaitaiStream _io) {
                        super(_io);
                        _init();
                    }

                    public Colorant(KaitaiStream _io, Icc4.TagTable.TagDefinition.ColorantTableType _parent) {
                        super(_io);
                        this._parent = _parent;
                        _init();
                    }

                    public Colorant(KaitaiStream _io, Icc4.TagTable.TagDefinition.ColorantTableType _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                        _init();
                    }

                    private void _init() {
                        _read();
                    }
                    private void _read() {
                        this.name = new String(this._io.readBytesTerm(0, false, true, true), Charset.forName("ASCII"));
                        padding = new ArrayList<byte[]>((int) ((32 - name().length())));
                        for (int i = 0; i < (32 - name().length()); i++) {
                            this.padding = this._io.ensureFixedContents(new byte[] { 0 });
                        }
                        this.pcsValues = this._io.readBytes(6);
                    }
                    private String name;
                    private ArrayList<byte[]> padding;
                    private byte[] pcsValues;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.ColorantTableType _parent;
                    public String name() { return name; }
                    public ArrayList<byte[]> padding() { return padding; }
                    public byte[] pcsValues() { return pcsValues; }
                    public Icc4 _root() { return _root; }
                    public Icc4.TagTable.TagDefinition.ColorantTableType _parent() { return _parent; }
                }
                private byte[] reserved;
                private long countOfColorants;
                private ArrayList<Colorant> colorants;
                private Icc4 _root;
                private KaitaiStruct _parent;
                public byte[] reserved() { return reserved; }
                public long countOfColorants() { return countOfColorants; }
                public ArrayList<Colorant> colorants() { return colorants; }
                public Icc4 _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class SignatureType extends KaitaiStruct {
                public static SignatureType fromFile(String fileName) throws IOException {
                    return new SignatureType(new KaitaiStream(fileName));
                }

                public SignatureType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public SignatureType(KaitaiStream _io, KaitaiStruct _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public SignatureType(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.signature = new String(this._io.readBytes(4), Charset.forName("ASCII"));
                }
                private byte[] reserved;
                private String signature;
                private Icc4 _root;
                private KaitaiStruct _parent;
                public byte[] reserved() { return reserved; }
                public String signature() { return signature; }
                public Icc4 _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class CopyrightTag extends KaitaiStruct {
                public static CopyrightTag fromFile(String fileName) throws IOException {
                    return new CopyrightTag(new KaitaiStream(fileName));
                }

                public CopyrightTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public CopyrightTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public CopyrightTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_LOCALIZED_UNICODE_TYPE: {
                        this.tagData = new MultiLocalizedUnicodeType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private MultiLocalizedUnicodeType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public MultiLocalizedUnicodeType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class Preview0Tag extends KaitaiStruct {
                public static Preview0Tag fromFile(String fileName) throws IOException {
                    return new Preview0Tag(new KaitaiStream(fileName));
                }

                public Preview0Tag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public Preview0Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public Preview0Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                        this.tagData = new Lut8Type(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                        this.tagData = new Lut16Type(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
                        this.tagData = new LutAToBType(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                        this.tagData = new LutBToAType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public KaitaiStruct tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class DateTimeType extends KaitaiStruct {
                public static DateTimeType fromFile(String fileName) throws IOException {
                    return new DateTimeType(new KaitaiStream(fileName));
                }

                public DateTimeType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public DateTimeType(KaitaiStream _io, Icc4.TagTable.TagDefinition.CalibrationDateTimeTag _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public DateTimeType(KaitaiStream _io, Icc4.TagTable.TagDefinition.CalibrationDateTimeTag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.dateAndTime = new DateTimeNumber(this._io, this, _root);
                }
                private byte[] reserved;
                private DateTimeNumber dateAndTime;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.CalibrationDateTimeTag _parent;
                public byte[] reserved() { return reserved; }
                public DateTimeNumber dateAndTime() { return dateAndTime; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition.CalibrationDateTimeTag _parent() { return _parent; }
            }
            public static class DToB3Tag extends KaitaiStruct {
                public static DToB3Tag fromFile(String fileName) throws IOException {
                    return new DToB3Tag(new KaitaiStream(fileName));
                }

                public DToB3Tag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public DToB3Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public DToB3Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_PROCESS_ELEMENTS_TYPE: {
                        this.tagData = new MultiProcessElementsType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private MultiProcessElementsType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public MultiProcessElementsType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class Preview2Tag extends KaitaiStruct {
                public static Preview2Tag fromFile(String fileName) throws IOException {
                    return new Preview2Tag(new KaitaiStream(fileName));
                }

                public Preview2Tag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public Preview2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public Preview2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                        this.tagData = new Lut8Type(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                        this.tagData = new Lut16Type(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                        this.tagData = new LutBToAType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public KaitaiStruct tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class DeviceModelDescTag extends KaitaiStruct {
                public static DeviceModelDescTag fromFile(String fileName) throws IOException {
                    return new DeviceModelDescTag(new KaitaiStream(fileName));
                }

                public DeviceModelDescTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public DeviceModelDescTag(KaitaiStream _io, KaitaiStruct _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public DeviceModelDescTag(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_LOCALIZED_UNICODE_TYPE: {
                        this.tagData = new MultiLocalizedUnicodeType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private MultiLocalizedUnicodeType tagData;
                private Icc4 _root;
                private KaitaiStruct _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public MultiLocalizedUnicodeType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class MultiProcessElementsType extends KaitaiStruct {
                public static MultiProcessElementsType fromFile(String fileName) throws IOException {
                    return new MultiProcessElementsType(new KaitaiStream(fileName));
                }

                public MultiProcessElementsType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public MultiProcessElementsType(KaitaiStream _io, KaitaiStruct _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public MultiProcessElementsType(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.numberOfInputChannels = this._io.readU2be();
                    this.numberOfOutputChannels = this._io.readU2be();
                    this.numberOfProcessingElements = this._io.readU4be();
                    processElementPositionsTable = new ArrayList<PositionNumber>((int) (numberOfProcessingElements()));
                    for (int i = 0; i < numberOfProcessingElements(); i++) {
                        this.processElementPositionsTable.add(new PositionNumber(this._io, this, _root));
                    }
                    this.data = this._io.readBytesFull();
                }
                private byte[] reserved;
                private int numberOfInputChannels;
                private int numberOfOutputChannels;
                private long numberOfProcessingElements;
                private ArrayList<PositionNumber> processElementPositionsTable;
                private byte[] data;
                private Icc4 _root;
                private KaitaiStruct _parent;
                public byte[] reserved() { return reserved; }
                public int numberOfInputChannels() { return numberOfInputChannels; }
                public int numberOfOutputChannels() { return numberOfOutputChannels; }
                public long numberOfProcessingElements() { return numberOfProcessingElements; }
                public ArrayList<PositionNumber> processElementPositionsTable() { return processElementPositionsTable; }
                public byte[] data() { return data; }
                public Icc4 _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class UInt16ArrayType extends KaitaiStruct {
                public static UInt16ArrayType fromFile(String fileName) throws IOException {
                    return new UInt16ArrayType(new KaitaiStream(fileName));
                }

                public UInt16ArrayType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public UInt16ArrayType(KaitaiStream _io, KaitaiStruct _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public UInt16ArrayType(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.values = new ArrayList<Integer>();
                    while (!this._io.isEof()) {
                        this.values.add(this._io.readU2be());
                    }
                }
                private byte[] reserved;
                private ArrayList<Integer> values;
                private Icc4 _root;
                private KaitaiStruct _parent;
                public byte[] reserved() { return reserved; }
                public ArrayList<Integer> values() { return values; }
                public Icc4 _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class ColorantOrderTag extends KaitaiStruct {
                public static ColorantOrderTag fromFile(String fileName) throws IOException {
                    return new ColorantOrderTag(new KaitaiStream(fileName));
                }

                public ColorantOrderTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public ColorantOrderTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public ColorantOrderTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case COLORANT_ORDER_TYPE: {
                        this.tagData = new ColorantOrderType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private ColorantOrderType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public ColorantOrderType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class DataType extends KaitaiStruct {
                public static DataType fromFile(String fileName) throws IOException {
                    return new DataType(new KaitaiStream(fileName));
                }

                public enum DataTypes {
                    ASCII_DATA(0),
                    BINARY_DATA(1);

                    private final long id;
                    DataTypes(long id) { this.id = id; }
                    public long id() { return id; }
                    private static final Map<Long, DataTypes> byId = new HashMap<Long, DataTypes>(2);
                    static {
                        for (DataTypes e : DataTypes.values())
                            byId.put(e.id(), e);
                    }
                    public static DataTypes byId(long id) { return byId.get(id); }
                }

                public DataType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public DataType(KaitaiStream _io, KaitaiStruct _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public DataType(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.dataFlag = DataTypes.byId(this._io.readU4be());
                }
                private DataTypes dataFlag;
                private Icc4 _root;
                private KaitaiStruct _parent;
                public DataTypes dataFlag() { return dataFlag; }
                public Icc4 _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class ChromaticityType extends KaitaiStruct {
                public static ChromaticityType fromFile(String fileName) throws IOException {
                    return new ChromaticityType(new KaitaiStream(fileName));
                }

                public enum ColorantAndPhosphorEncodings {
                    UNKNOWN(0),
                    ITU_R_BT_709_2(1),
                    SMPTE_RP145(2),
                    EBU_TECH_3213_E(3),
                    P22(4);

                    private final long id;
                    ColorantAndPhosphorEncodings(long id) { this.id = id; }
                    public long id() { return id; }
                    private static final Map<Long, ColorantAndPhosphorEncodings> byId = new HashMap<Long, ColorantAndPhosphorEncodings>(5);
                    static {
                        for (ColorantAndPhosphorEncodings e : ColorantAndPhosphorEncodings.values())
                            byId.put(e.id(), e);
                    }
                    public static ColorantAndPhosphorEncodings byId(long id) { return byId.get(id); }
                }

                public ChromaticityType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public ChromaticityType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ChromaticityTag _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public ChromaticityType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ChromaticityTag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.numberOfDeviceChannels = this._io.readU2be();
                    this.colorantAndPhosphorEncoding = ColorantAndPhosphorEncodings.byId(this._io.readU2be());
                    ciexyCoordinatesPerChannel = new ArrayList<CiexyCoordinateValues>((int) (numberOfDeviceChannels()));
                    for (int i = 0; i < numberOfDeviceChannels(); i++) {
                        this.ciexyCoordinatesPerChannel.add(new CiexyCoordinateValues(this._io, this, _root));
                    }
                }
                public static class CiexyCoordinateValues extends KaitaiStruct {
                    public static CiexyCoordinateValues fromFile(String fileName) throws IOException {
                        return new CiexyCoordinateValues(new KaitaiStream(fileName));
                    }

                    public CiexyCoordinateValues(KaitaiStream _io) {
                        super(_io);
                        _init();
                    }

                    public CiexyCoordinateValues(KaitaiStream _io, Icc4.TagTable.TagDefinition.ChromaticityType _parent) {
                        super(_io);
                        this._parent = _parent;
                        _init();
                    }

                    public CiexyCoordinateValues(KaitaiStream _io, Icc4.TagTable.TagDefinition.ChromaticityType _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                        _init();
                    }

                    private void _init() {
                        _read();
                    }
                    private void _read() {
                        this.xCoordinate = this._io.readU2be();
                        this.yCoordinate = this._io.readU2be();
                    }
                    private int xCoordinate;
                    private int yCoordinate;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.ChromaticityType _parent;
                    public int xCoordinate() { return xCoordinate; }
                    public int yCoordinate() { return yCoordinate; }
                    public Icc4 _root() { return _root; }
                    public Icc4.TagTable.TagDefinition.ChromaticityType _parent() { return _parent; }
                }
                private byte[] reserved;
                private int numberOfDeviceChannels;
                private ColorantAndPhosphorEncodings colorantAndPhosphorEncoding;
                private ArrayList<CiexyCoordinateValues> ciexyCoordinatesPerChannel;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.ChromaticityTag _parent;
                public byte[] reserved() { return reserved; }
                public int numberOfDeviceChannels() { return numberOfDeviceChannels; }
                public ColorantAndPhosphorEncodings colorantAndPhosphorEncoding() { return colorantAndPhosphorEncoding; }
                public ArrayList<CiexyCoordinateValues> ciexyCoordinatesPerChannel() { return ciexyCoordinatesPerChannel; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition.ChromaticityTag _parent() { return _parent; }
            }
            public static class LuminanceTag extends KaitaiStruct {
                public static LuminanceTag fromFile(String fileName) throws IOException {
                    return new LuminanceTag(new KaitaiStream(fileName));
                }

                public LuminanceTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public LuminanceTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public LuminanceTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case XYZ_TYPE: {
                        this.tagData = new XyzType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private XyzType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public XyzType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class S15Fixed16ArrayType extends KaitaiStruct {
                public static S15Fixed16ArrayType fromFile(String fileName) throws IOException {
                    return new S15Fixed16ArrayType(new KaitaiStream(fileName));
                }

                public S15Fixed16ArrayType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public S15Fixed16ArrayType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ChromaticAdaptationTag _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public S15Fixed16ArrayType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ChromaticAdaptationTag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.values = new ArrayList<S15Fixed16Number>();
                    while (!this._io.isEof()) {
                        this.values.add(new S15Fixed16Number(this._io, this, _root));
                    }
                }
                private byte[] reserved;
                private ArrayList<S15Fixed16Number> values;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.ChromaticAdaptationTag _parent;
                public byte[] reserved() { return reserved; }
                public ArrayList<S15Fixed16Number> values() { return values; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition.ChromaticAdaptationTag _parent() { return _parent; }
            }
            public static class MultiLocalizedUnicodeType extends KaitaiStruct {
                public static MultiLocalizedUnicodeType fromFile(String fileName) throws IOException {
                    return new MultiLocalizedUnicodeType(new KaitaiStream(fileName));
                }

                public MultiLocalizedUnicodeType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public MultiLocalizedUnicodeType(KaitaiStream _io, KaitaiStruct _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public MultiLocalizedUnicodeType(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.numberOfRecords = this._io.readU4be();
                    this.recordSize = this._io.readU4be();
                    records = new ArrayList<Record>((int) (numberOfRecords()));
                    for (int i = 0; i < numberOfRecords(); i++) {
                        this.records.add(new Record(this._io, this, _root));
                    }
                }
                public static class Record extends KaitaiStruct {
                    public static Record fromFile(String fileName) throws IOException {
                        return new Record(new KaitaiStream(fileName));
                    }

                    public Record(KaitaiStream _io) {
                        super(_io);
                        _init();
                    }

                    public Record(KaitaiStream _io, Icc4.TagTable.TagDefinition.MultiLocalizedUnicodeType _parent) {
                        super(_io);
                        this._parent = _parent;
                        _init();
                    }

                    public Record(KaitaiStream _io, Icc4.TagTable.TagDefinition.MultiLocalizedUnicodeType _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                        _init();
                    }

                    private void _init() {
                        _read();
                    }
                    private void _read() {
                        this.languageCode = this._io.readU2be();
                        this.countryCode = this._io.readU2be();
                        this.stringLength = this._io.readU4be();
                        this.stringOffset = this._io.readU4be();
                    }
                    private String stringData;
                    public String stringData() {
                        if (this.stringData != null)
                            return this.stringData;
                        long _pos = this._io.pos();
                        this._io.seek(stringOffset());
                        this.stringData = new String(this._io.readBytes(stringLength()), Charset.forName("UTF-16BE"));
                        this._io.seek(_pos);
                        return this.stringData;
                    }
                    private int languageCode;
                    private int countryCode;
                    private long stringLength;
                    private long stringOffset;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.MultiLocalizedUnicodeType _parent;
                    public int languageCode() { return languageCode; }
                    public int countryCode() { return countryCode; }
                    public long stringLength() { return stringLength; }
                    public long stringOffset() { return stringOffset; }
                    public Icc4 _root() { return _root; }
                    public Icc4.TagTable.TagDefinition.MultiLocalizedUnicodeType _parent() { return _parent; }
                }
                private byte[] reserved;
                private long numberOfRecords;
                private long recordSize;
                private ArrayList<Record> records;
                private Icc4 _root;
                private KaitaiStruct _parent;
                public byte[] reserved() { return reserved; }
                public long numberOfRecords() { return numberOfRecords; }
                public long recordSize() { return recordSize; }
                public ArrayList<Record> records() { return records; }
                public Icc4 _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class AToB2Tag extends KaitaiStruct {
                public static AToB2Tag fromFile(String fileName) throws IOException {
                    return new AToB2Tag(new KaitaiStream(fileName));
                }

                public AToB2Tag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public AToB2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public AToB2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                        this.tagData = new Lut8Type(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                        this.tagData = new Lut16Type(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
                        this.tagData = new LutAToBType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public KaitaiStruct tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class AToB1Tag extends KaitaiStruct {
                public static AToB1Tag fromFile(String fileName) throws IOException {
                    return new AToB1Tag(new KaitaiStream(fileName));
                }

                public AToB1Tag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public AToB1Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public AToB1Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                        this.tagData = new Lut8Type(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                        this.tagData = new Lut16Type(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
                        this.tagData = new LutAToBType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public KaitaiStruct tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class ColorimetricIntentImageStateTag extends KaitaiStruct {
                public static ColorimetricIntentImageStateTag fromFile(String fileName) throws IOException {
                    return new ColorimetricIntentImageStateTag(new KaitaiStream(fileName));
                }

                public ColorimetricIntentImageStateTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public ColorimetricIntentImageStateTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public ColorimetricIntentImageStateTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case SIGNATURE_TYPE: {
                        this.tagData = new SignatureType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private SignatureType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public SignatureType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class CharTargetTag extends KaitaiStruct {
                public static CharTargetTag fromFile(String fileName) throws IOException {
                    return new CharTargetTag(new KaitaiStream(fileName));
                }

                public CharTargetTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public CharTargetTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public CharTargetTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case TEXT_TYPE: {
                        this.tagData = new TextType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private TextType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public TextType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class ColorantTableTag extends KaitaiStruct {
                public static ColorantTableTag fromFile(String fileName) throws IOException {
                    return new ColorantTableTag(new KaitaiStream(fileName));
                }

                public ColorantTableTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public ColorantTableTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public ColorantTableTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case COLORANT_TABLE_TYPE: {
                        this.tagData = new ColorantTableType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private ColorantTableType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public ColorantTableType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class CalibrationDateTimeTag extends KaitaiStruct {
                public static CalibrationDateTimeTag fromFile(String fileName) throws IOException {
                    return new CalibrationDateTimeTag(new KaitaiStream(fileName));
                }

                public CalibrationDateTimeTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public CalibrationDateTimeTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public CalibrationDateTimeTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case DATE_TIME_TYPE: {
                        this.tagData = new DateTimeType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private DateTimeType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public DateTimeType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class NamedColor2Tag extends KaitaiStruct {
                public static NamedColor2Tag fromFile(String fileName) throws IOException {
                    return new NamedColor2Tag(new KaitaiStream(fileName));
                }

                public NamedColor2Tag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public NamedColor2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public NamedColor2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case NAMED_COLOR_2_TYPE: {
                        this.tagData = new NamedColor2Type(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private NamedColor2Type tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public NamedColor2Type tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class ViewingCondDescTag extends KaitaiStruct {
                public static ViewingCondDescTag fromFile(String fileName) throws IOException {
                    return new ViewingCondDescTag(new KaitaiStream(fileName));
                }

                public ViewingCondDescTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public ViewingCondDescTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public ViewingCondDescTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_LOCALIZED_UNICODE_TYPE: {
                        this.tagData = new MultiLocalizedUnicodeType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private MultiLocalizedUnicodeType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public MultiLocalizedUnicodeType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class BToD3Tag extends KaitaiStruct {
                public static BToD3Tag fromFile(String fileName) throws IOException {
                    return new BToD3Tag(new KaitaiStream(fileName));
                }

                public BToD3Tag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public BToD3Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public BToD3Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_PROCESS_ELEMENTS_TYPE: {
                        this.tagData = new MultiProcessElementsType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private MultiProcessElementsType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public MultiProcessElementsType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class ProfileSequenceDescType extends KaitaiStruct {
                public static ProfileSequenceDescType fromFile(String fileName) throws IOException {
                    return new ProfileSequenceDescType(new KaitaiStream(fileName));
                }

                public ProfileSequenceDescType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public ProfileSequenceDescType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ProfileSequenceTag _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public ProfileSequenceDescType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ProfileSequenceTag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.numberOfDescriptionStructures = this._io.readU4be();
                    profileDescriptions = new ArrayList<ProfileDescription>((int) (numberOfDescriptionStructures()));
                    for (int i = 0; i < numberOfDescriptionStructures(); i++) {
                        this.profileDescriptions.add(new ProfileDescription(this._io, this, _root));
                    }
                }
                public static class ProfileDescription extends KaitaiStruct {
                    public static ProfileDescription fromFile(String fileName) throws IOException {
                        return new ProfileDescription(new KaitaiStream(fileName));
                    }

                    public ProfileDescription(KaitaiStream _io) {
                        super(_io);
                        _init();
                    }

                    public ProfileDescription(KaitaiStream _io, Icc4.TagTable.TagDefinition.ProfileSequenceDescType _parent) {
                        super(_io);
                        this._parent = _parent;
                        _init();
                    }

                    public ProfileDescription(KaitaiStream _io, Icc4.TagTable.TagDefinition.ProfileSequenceDescType _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                        _init();
                    }

                    private void _init() {
                        _read();
                    }
                    private void _read() {
                        this.deviceManufacturer = new DeviceManufacturer(this._io, this, _root);
                        this.deviceModel = new String(this._io.readBytes(4), Charset.forName("ASCII"));
                        this.deviceAttributes = new DeviceAttributes(this._io, this, _root);
                        this.deviceTechnology = new TechnologyTag(this._io, this, _root);
                        this.descriptionOfDeviceManufacturer = new DeviceMfgDescTag(this._io, this, _root);
                        this.descriptionOfDeviceModel = new DeviceModelDescTag(this._io, this, _root);
                    }
                    private DeviceManufacturer deviceManufacturer;
                    private String deviceModel;
                    private DeviceAttributes deviceAttributes;
                    private TechnologyTag deviceTechnology;
                    private DeviceMfgDescTag descriptionOfDeviceManufacturer;
                    private DeviceModelDescTag descriptionOfDeviceModel;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.ProfileSequenceDescType _parent;
                    public DeviceManufacturer deviceManufacturer() { return deviceManufacturer; }
                    public String deviceModel() { return deviceModel; }
                    public DeviceAttributes deviceAttributes() { return deviceAttributes; }
                    public TechnologyTag deviceTechnology() { return deviceTechnology; }
                    public DeviceMfgDescTag descriptionOfDeviceManufacturer() { return descriptionOfDeviceManufacturer; }
                    public DeviceModelDescTag descriptionOfDeviceModel() { return descriptionOfDeviceModel; }
                    public Icc4 _root() { return _root; }
                    public Icc4.TagTable.TagDefinition.ProfileSequenceDescType _parent() { return _parent; }
                }
                private byte[] reserved;
                private long numberOfDescriptionStructures;
                private ArrayList<ProfileDescription> profileDescriptions;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.ProfileSequenceTag _parent;
                public byte[] reserved() { return reserved; }
                public long numberOfDescriptionStructures() { return numberOfDescriptionStructures; }
                public ArrayList<ProfileDescription> profileDescriptions() { return profileDescriptions; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition.ProfileSequenceTag _parent() { return _parent; }
            }
            public static class ProfileSequenceIdentifierTag extends KaitaiStruct {
                public static ProfileSequenceIdentifierTag fromFile(String fileName) throws IOException {
                    return new ProfileSequenceIdentifierTag(new KaitaiStream(fileName));
                }

                public ProfileSequenceIdentifierTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public ProfileSequenceIdentifierTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public ProfileSequenceIdentifierTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case PROFILE_SEQUENCE_IDENTIFIER_TYPE: {
                        this.tagData = new ProfileSequenceIdentifierType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private ProfileSequenceIdentifierType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public ProfileSequenceIdentifierType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class BToD1Tag extends KaitaiStruct {
                public static BToD1Tag fromFile(String fileName) throws IOException {
                    return new BToD1Tag(new KaitaiStream(fileName));
                }

                public BToD1Tag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public BToD1Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public BToD1Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_PROCESS_ELEMENTS_TYPE: {
                        this.tagData = new MultiProcessElementsType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private MultiProcessElementsType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public MultiProcessElementsType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class ColorantOrderType extends KaitaiStruct {
                public static ColorantOrderType fromFile(String fileName) throws IOException {
                    return new ColorantOrderType(new KaitaiStream(fileName));
                }

                public ColorantOrderType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public ColorantOrderType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ColorantOrderTag _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public ColorantOrderType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ColorantOrderTag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.countOfColorants = this._io.readU4be();
                    numbersOfColorantsInOrderOfPrinting = new ArrayList<Integer>((int) (countOfColorants()));
                    for (int i = 0; i < countOfColorants(); i++) {
                        this.numbersOfColorantsInOrderOfPrinting.add(this._io.readU1());
                    }
                }
                private byte[] reserved;
                private long countOfColorants;
                private ArrayList<Integer> numbersOfColorantsInOrderOfPrinting;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.ColorantOrderTag _parent;
                public byte[] reserved() { return reserved; }
                public long countOfColorants() { return countOfColorants; }
                public ArrayList<Integer> numbersOfColorantsInOrderOfPrinting() { return numbersOfColorantsInOrderOfPrinting; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition.ColorantOrderTag _parent() { return _parent; }
            }
            public static class DToB2Tag extends KaitaiStruct {
                public static DToB2Tag fromFile(String fileName) throws IOException {
                    return new DToB2Tag(new KaitaiStream(fileName));
                }

                public DToB2Tag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public DToB2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public DToB2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_PROCESS_ELEMENTS_TYPE: {
                        this.tagData = new MultiProcessElementsType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private MultiProcessElementsType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public MultiProcessElementsType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class GrayTrcTag extends KaitaiStruct {
                public static GrayTrcTag fromFile(String fileName) throws IOException {
                    return new GrayTrcTag(new KaitaiStream(fileName));
                }

                public GrayTrcTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public GrayTrcTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public GrayTrcTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case CURVE_TYPE: {
                        this.tagData = new CurveType(this._io, this, _root);
                        break;
                    }
                    case PARAMETRIC_CURVE_TYPE: {
                        this.tagData = new ParametricCurveType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public KaitaiStruct tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class ViewingConditionsType extends KaitaiStruct {
                public static ViewingConditionsType fromFile(String fileName) throws IOException {
                    return new ViewingConditionsType(new KaitaiStream(fileName));
                }

                public ViewingConditionsType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public ViewingConditionsType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ViewingConditionsTag _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public ViewingConditionsType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ViewingConditionsTag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.unNormalizedCiexyzValuesForIlluminant = new XyzNumber(this._io, this, _root);
                    this.unNormalizedCiexyzValuesForSurround = new XyzNumber(this._io, this, _root);
                    this.illuminantType = new StandardIlluminantEncoding(this._io, this, _root);
                }
                private byte[] reserved;
                private XyzNumber unNormalizedCiexyzValuesForIlluminant;
                private XyzNumber unNormalizedCiexyzValuesForSurround;
                private StandardIlluminantEncoding illuminantType;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.ViewingConditionsTag _parent;
                public byte[] reserved() { return reserved; }
                public XyzNumber unNormalizedCiexyzValuesForIlluminant() { return unNormalizedCiexyzValuesForIlluminant; }
                public XyzNumber unNormalizedCiexyzValuesForSurround() { return unNormalizedCiexyzValuesForSurround; }
                public StandardIlluminantEncoding illuminantType() { return illuminantType; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition.ViewingConditionsTag _parent() { return _parent; }
            }
            public static class LutBToAType extends KaitaiStruct {
                public static LutBToAType fromFile(String fileName) throws IOException {
                    return new LutBToAType(new KaitaiStream(fileName));
                }

                public LutBToAType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public LutBToAType(KaitaiStream _io, KaitaiStruct _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public LutBToAType(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.numberOfInputChannels = this._io.readU1();
                    this.numberOfOutputChannels = this._io.readU1();
                    this.padding = this._io.ensureFixedContents(new byte[] { 0, 0 });
                    this.offsetToFirstBCurve = this._io.readU4be();
                    this.offsetToMatrix = this._io.readU4be();
                    this.offsetToFirstMCurve = this._io.readU4be();
                    this.offsetToClut = this._io.readU4be();
                    this.offsetToFirstACurve = this._io.readU4be();
                    this.data = this._io.readBytesFull();
                }
                private byte[] reserved;
                private int numberOfInputChannels;
                private int numberOfOutputChannels;
                private byte[] padding;
                private long offsetToFirstBCurve;
                private long offsetToMatrix;
                private long offsetToFirstMCurve;
                private long offsetToClut;
                private long offsetToFirstACurve;
                private byte[] data;
                private Icc4 _root;
                private KaitaiStruct _parent;
                public byte[] reserved() { return reserved; }
                public int numberOfInputChannels() { return numberOfInputChannels; }
                public int numberOfOutputChannels() { return numberOfOutputChannels; }
                public byte[] padding() { return padding; }
                public long offsetToFirstBCurve() { return offsetToFirstBCurve; }
                public long offsetToMatrix() { return offsetToMatrix; }
                public long offsetToFirstMCurve() { return offsetToFirstMCurve; }
                public long offsetToClut() { return offsetToClut; }
                public long offsetToFirstACurve() { return offsetToFirstACurve; }
                public byte[] data() { return data; }
                public Icc4 _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class GreenTrcTag extends KaitaiStruct {
                public static GreenTrcTag fromFile(String fileName) throws IOException {
                    return new GreenTrcTag(new KaitaiStream(fileName));
                }

                public GreenTrcTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public GreenTrcTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public GreenTrcTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case CURVE_TYPE: {
                        this.tagData = new CurveType(this._io, this, _root);
                        break;
                    }
                    case PARAMETRIC_CURVE_TYPE: {
                        this.tagData = new ParametricCurveType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public KaitaiStruct tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class UInt32ArrayType extends KaitaiStruct {
                public static UInt32ArrayType fromFile(String fileName) throws IOException {
                    return new UInt32ArrayType(new KaitaiStream(fileName));
                }

                public UInt32ArrayType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public UInt32ArrayType(KaitaiStream _io, KaitaiStruct _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public UInt32ArrayType(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.values = new ArrayList<Long>();
                    while (!this._io.isEof()) {
                        this.values.add(this._io.readU4be());
                    }
                }
                private byte[] reserved;
                private ArrayList<Long> values;
                private Icc4 _root;
                private KaitaiStruct _parent;
                public byte[] reserved() { return reserved; }
                public ArrayList<Long> values() { return values; }
                public Icc4 _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class GamutTag extends KaitaiStruct {
                public static GamutTag fromFile(String fileName) throws IOException {
                    return new GamutTag(new KaitaiStream(fileName));
                }

                public GamutTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public GamutTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public GamutTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                        this.tagData = new Lut8Type(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                        this.tagData = new Lut16Type(this._io, this, _root);
                        break;
                    }
                    case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                        this.tagData = new LutBToAType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public KaitaiStruct tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class UInt8ArrayType extends KaitaiStruct {
                public static UInt8ArrayType fromFile(String fileName) throws IOException {
                    return new UInt8ArrayType(new KaitaiStream(fileName));
                }

                public UInt8ArrayType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public UInt8ArrayType(KaitaiStream _io, KaitaiStruct _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public UInt8ArrayType(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.values = new ArrayList<Integer>();
                    while (!this._io.isEof()) {
                        this.values.add(this._io.readU1());
                    }
                }
                private byte[] reserved;
                private ArrayList<Integer> values;
                private Icc4 _root;
                private KaitaiStruct _parent;
                public byte[] reserved() { return reserved; }
                public ArrayList<Integer> values() { return values; }
                public Icc4 _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class RedMatrixColumnTag extends KaitaiStruct {
                public static RedMatrixColumnTag fromFile(String fileName) throws IOException {
                    return new RedMatrixColumnTag(new KaitaiStream(fileName));
                }

                public RedMatrixColumnTag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public RedMatrixColumnTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public RedMatrixColumnTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case XYZ_TYPE: {
                        this.tagData = new XyzType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private XyzType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public XyzType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            public static class UInt64ArrayType extends KaitaiStruct {
                public static UInt64ArrayType fromFile(String fileName) throws IOException {
                    return new UInt64ArrayType(new KaitaiStream(fileName));
                }

                public UInt64ArrayType(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public UInt64ArrayType(KaitaiStream _io, KaitaiStruct _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public UInt64ArrayType(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
                    this.values = new ArrayList<Long>();
                    while (!this._io.isEof()) {
                        this.values.add(this._io.readU8be());
                    }
                }
                private byte[] reserved;
                private ArrayList<Long> values;
                private Icc4 _root;
                private KaitaiStruct _parent;
                public byte[] reserved() { return reserved; }
                public ArrayList<Long> values() { return values; }
                public Icc4 _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class BToD2Tag extends KaitaiStruct {
                public static BToD2Tag fromFile(String fileName) throws IOException {
                    return new BToD2Tag(new KaitaiStream(fileName));
                }

                public BToD2Tag(KaitaiStream _io) {
                    super(_io);
                    _init();
                }

                public BToD2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    super(_io);
                    this._parent = _parent;
                    _init();
                }

                public BToD2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _init();
                }

                private void _init() {
                    _read();
                }
                private void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    switch (tagType()) {
                    case MULTI_PROCESS_ELEMENTS_TYPE: {
                        this.tagData = new MultiProcessElementsType(this._io, this, _root);
                        break;
                    }
                    }
                }
                private TagTypeSignatures tagType;
                private MultiProcessElementsType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public MultiProcessElementsType tagData() { return tagData; }
                public Icc4 _root() { return _root; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
            }
            private Object tagDataElement;
            public Object tagDataElement() {
                if (this.tagDataElement != null)
                    return this.tagDataElement;
                long _pos = this._io.pos();
                this._io.seek(offsetToDataElement());
                switch (tagSignature()) {
                case PROFILE_SEQUENCE_IDENTIFIER: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new ProfileSequenceIdentifierTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case COLORIMETRIC_INTENT_IMAGE_STATE: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new ColorimetricIntentImageStateTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case RED_TRC: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new RedTrcTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case PREVIEW_0: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new Preview0Tag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case GREEN_TRC: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new GreenTrcTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case B_TO_D_0: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new BToD0Tag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case COLORANT_TABLE_OUT: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new ColorantTableOutTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case B_TO_A_2: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new BToA2Tag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case CALIBRATION_DATE_TIME: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new CalibrationDateTimeTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case CHROMATIC_ADAPTATION: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new ChromaticAdaptationTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case COLORANT_TABLE: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new ColorantTableTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case A_TO_B_2: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new AToB2Tag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case D_TO_B_1: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new DToB1Tag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case CHROMATICITY: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new ChromaticityTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case BLUE_MATRIX_COLUMN: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new BlueMatrixColumnTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case A_TO_B_0: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new AToB0Tag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case B_TO_D_2: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new BToD2Tag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case B_TO_A_1: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new BToA1Tag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case MEDIA_WHITE_POINT: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new MediaWhitePointTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case D_TO_B_0: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new DToB0Tag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case NAMED_COLOR_2: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new NamedColor2Tag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case D_TO_B_2: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new DToB2Tag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case RED_MATRIX_COLUMN: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new RedMatrixColumnTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case VIEWING_CONDITIONS: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new ViewingConditionsTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case A_TO_B_1: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new AToB1Tag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case PREVIEW_1: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new Preview1Tag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case GRAY_TRC: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new GrayTrcTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case DEVICE_MFG_DESC: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new DeviceMfgDescTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case B_TO_D_1: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new BToD1Tag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case COLORANT_ORDER: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new ColorantOrderTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case COPYRIGHT: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new CopyrightTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case GAMUT: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new GamutTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case CHAR_TARGET: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new CharTargetTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case OUTPUT_RESPONSE: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new OutputResponseTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case TECHNOLOGY: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new TechnologyTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case VIEWING_COND_DESC: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new ViewingCondDescTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case PROFILE_DESCRIPTION: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new ProfileDescriptionTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case LUMINANCE: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new LuminanceTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case D_TO_B_3: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new DToB3Tag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case B_TO_D_3: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new BToD3Tag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case B_TO_A_0: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new BToA0Tag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case PREVIEW_2: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new Preview2Tag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case GREEN_MATRIX_COLUMN: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new GreenMatrixColumnTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case PROFILE_SEQUENCE: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new ProfileSequenceTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case SATURATION_RENDERING_INTENT_GAMUT: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new SaturationRenderingIntentGamutTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case PERCEPTUAL_RENDERING_INTENT_GAMUT: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new PerceptualRenderingIntentGamutTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case BLUE_TRC: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new BlueTrcTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case DEVICE_MODEL_DESC: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new DeviceModelDescTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                case MEASUREMENT: {
                    this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                    KaitaiStream _io__raw_tagDataElement = new KaitaiStream(_raw_tagDataElement);
                    this.tagDataElement = new MeasurementTag(_io__raw_tagDataElement, this, _root);
                    break;
                }
                default: {
                    this.tagDataElement = this._io.readBytes(sizeOfDataElement());
                    break;
                }
                }
                this._io.seek(_pos);
                return this.tagDataElement;
            }
            private TagSignatures tagSignature;
            private long offsetToDataElement;
            private long sizeOfDataElement;
            private Icc4 _root;
            private Icc4.TagTable _parent;
            private byte[] _raw_tagDataElement;
            public TagSignatures tagSignature() { return tagSignature; }
            public long offsetToDataElement() { return offsetToDataElement; }
            public long sizeOfDataElement() { return sizeOfDataElement; }
            public Icc4 _root() { return _root; }
            public Icc4.TagTable _parent() { return _parent; }
            public byte[] _raw_tagDataElement() { return _raw_tagDataElement; }
        }
        private long tagCount;
        private ArrayList<TagDefinition> tags;
        private Icc4 _root;
        private Icc4 _parent;
        public long tagCount() { return tagCount; }
        public ArrayList<TagDefinition> tags() { return tags; }
        public Icc4 _root() { return _root; }
        public Icc4 _parent() { return _parent; }
    }
    public static class DeviceAttributes extends KaitaiStruct {
        public static DeviceAttributes fromFile(String fileName) throws IOException {
            return new DeviceAttributes(new KaitaiStream(fileName));
        }

        public enum DeviceAttributesReflectiveOrTransparency {
            REFLECTIVE(0),
            TRANSPARENCY(1);

            private final long id;
            DeviceAttributesReflectiveOrTransparency(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, DeviceAttributesReflectiveOrTransparency> byId = new HashMap<Long, DeviceAttributesReflectiveOrTransparency>(2);
            static {
                for (DeviceAttributesReflectiveOrTransparency e : DeviceAttributesReflectiveOrTransparency.values())
                    byId.put(e.id(), e);
            }
            public static DeviceAttributesReflectiveOrTransparency byId(long id) { return byId.get(id); }
        }

        public enum DeviceAttributesGlossyOrMatte {
            GLOSSY(0),
            MATTE(1);

            private final long id;
            DeviceAttributesGlossyOrMatte(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, DeviceAttributesGlossyOrMatte> byId = new HashMap<Long, DeviceAttributesGlossyOrMatte>(2);
            static {
                for (DeviceAttributesGlossyOrMatte e : DeviceAttributesGlossyOrMatte.values())
                    byId.put(e.id(), e);
            }
            public static DeviceAttributesGlossyOrMatte byId(long id) { return byId.get(id); }
        }

        public enum DeviceAttributesPositiveOrNegativeMediaPolarity {
            POSITIVE_MEDIA_POLARITY(0),
            NEGATIVE_MEDIA_POLARITY(1);

            private final long id;
            DeviceAttributesPositiveOrNegativeMediaPolarity(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, DeviceAttributesPositiveOrNegativeMediaPolarity> byId = new HashMap<Long, DeviceAttributesPositiveOrNegativeMediaPolarity>(2);
            static {
                for (DeviceAttributesPositiveOrNegativeMediaPolarity e : DeviceAttributesPositiveOrNegativeMediaPolarity.values())
                    byId.put(e.id(), e);
            }
            public static DeviceAttributesPositiveOrNegativeMediaPolarity byId(long id) { return byId.get(id); }
        }

        public enum DeviceAttributesColourOrBlackAndWhiteMedia {
            COLOUR_MEDIA(0),
            BLACK_AND_WHITE_MEDIA(1);

            private final long id;
            DeviceAttributesColourOrBlackAndWhiteMedia(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, DeviceAttributesColourOrBlackAndWhiteMedia> byId = new HashMap<Long, DeviceAttributesColourOrBlackAndWhiteMedia>(2);
            static {
                for (DeviceAttributesColourOrBlackAndWhiteMedia e : DeviceAttributesColourOrBlackAndWhiteMedia.values())
                    byId.put(e.id(), e);
            }
            public static DeviceAttributesColourOrBlackAndWhiteMedia byId(long id) { return byId.get(id); }
        }

        public DeviceAttributes(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public DeviceAttributes(KaitaiStream _io, KaitaiStruct _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public DeviceAttributes(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.reflectiveOrTransparency = DeviceAttributesReflectiveOrTransparency.byId(this._io.readBitsInt(1));
            this.glossyOrMatte = DeviceAttributesGlossyOrMatte.byId(this._io.readBitsInt(1));
            this.positiveOrNegativeMediaPolarity = DeviceAttributesPositiveOrNegativeMediaPolarity.byId(this._io.readBitsInt(1));
            this.colourOrBlackAndWhiteMedia = DeviceAttributesColourOrBlackAndWhiteMedia.byId(this._io.readBitsInt(1));
            this.reserved = this._io.readBitsInt(28);
            this.vendorSpecific = this._io.readBitsInt(32);
        }
        private DeviceAttributesReflectiveOrTransparency reflectiveOrTransparency;
        private DeviceAttributesGlossyOrMatte glossyOrMatte;
        private DeviceAttributesPositiveOrNegativeMediaPolarity positiveOrNegativeMediaPolarity;
        private DeviceAttributesColourOrBlackAndWhiteMedia colourOrBlackAndWhiteMedia;
        private long reserved;
        private long vendorSpecific;
        private Icc4 _root;
        private KaitaiStruct _parent;
        public DeviceAttributesReflectiveOrTransparency reflectiveOrTransparency() { return reflectiveOrTransparency; }
        public DeviceAttributesGlossyOrMatte glossyOrMatte() { return glossyOrMatte; }
        public DeviceAttributesPositiveOrNegativeMediaPolarity positiveOrNegativeMediaPolarity() { return positiveOrNegativeMediaPolarity; }
        public DeviceAttributesColourOrBlackAndWhiteMedia colourOrBlackAndWhiteMedia() { return colourOrBlackAndWhiteMedia; }
        public long reserved() { return reserved; }
        public long vendorSpecific() { return vendorSpecific; }
        public Icc4 _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class DeviceManufacturer extends KaitaiStruct {
        public static DeviceManufacturer fromFile(String fileName) throws IOException {
            return new DeviceManufacturer(new KaitaiStream(fileName));
        }

        public enum DeviceManufacturers {
            ERDT_SYSTEMS_GMBH_AND_CO_KG(878981744),
            AAMAZING_TECHNOLOGIES_INC(1094798657),
            ACER_PERIPHERALS(1094927698),
            ACOLYTE_COLOR_RESEARCH(1094929492),
            ACTIX_SYTEMS_INC(1094931529),
            ADARA_TECHNOLOGY_INC(1094992210),
            ADOBE_SYSTEMS_INCORPORATED(1094992453),
            ADI_SYSTEMS_INC(1094994208),
            AGFA_GRAPHICS_NV(1095190081),
            ALPS_ELECTRIC_USA_INC(1095519556),
            ALPS_ELECTRIC_USA_INC_2(1095520339),
            ALWAN_COLOR_EXPERTISE(1095522126),
            AMIABLE_TECHNOLOGIES_INC(1095586889),
            AOC_INTERNATIONAL_USA_LTD(1095713568),
            APAGO(1095778631),
            APPLE_COMPUTER_INC(1095782476),
            AST(1095980064),
            ATANDT_COMPUTER_SYSTEMS(1096033876),
            BARBIERI_ELECTRONIC(1111573836),
            BARCO_NV(1112687439),
            BREAKPOINT_PTY_LIMITED(1112689488),
            BROTHER_INDUSTRIES_LTD(1112690516),
            BULL(1112886348),
            BUS_COMPUTER_SYSTEMS(1112888096),
            C_ITOH(1127041364),
            INTEL_CORPORATION(1128353106),
            CANON_INC_CANON_DEVELOPMENT_AMERICAS_INC(1128353359),
            CARROLL_TOUCH(1128354386),
            CASIO_COMPUTER_CO_LTD(1128354633),
            COLORBUS_PL(1128420691),
            CROSSFIELD(1128614944),
            CROSSFIELD_2(1128615032),
            CGS_PUBLISHING_TECHNOLOGIES_INTERNATIONAL_GMBH(1128747808),
            ROCHESTER_ROBOTICS(1128811808),
            COLOUR_IMAGING_GROUP_LONDON(1128875852),
            CITIZEN(1128879177),
            CANDELA_LTD(1129066544),
            COLOR_IQ(1129072977),
            CHROMACO_INC(1129136975),
            CHROMIX(1129146712),
            COLORGRAPHIC_COMMUNICATIONS_CORPORATION(1129270351),
            COMPAQ_COMPUTER_CORPORATION(1129270608),
            COMPEQ_USA_FOCUS_TECHNOLOGY(1129270640),
            CONRAC_DISPLAY_PRODUCTS(1129270866),
            CORDATA_TECHNOLOGIES_INC(1129271876),
            COMPAQ_COMPUTER_CORPORATION_2(1129337120),
            COLORPRO(1129337423),
            CORNERSTONE(1129467424),
            CTX_INTERNATIONAL_INC(1129601056),
            COLORVISION(1129728339),
            FUJITSU_LABORATORIES_LTD(1129792288),
            DARIUS_TECHNOLOGY_LTD(1145131593),
            DATAPRODUCTS(1145132097),
            DRY_CREEK_PHOTO(1145262112),
            DIGITAL_CONTENTS_RESOURCE_CENTER_CHUNG_ANG_UNIVERSITY(1145262659),
            DELL_COMPUTER_CORPORATION(1145392204),
            DAINIPPON_INK_AND_CHEMICALS(1145652000),
            DICONIX(1145652047),
            DIGITAL(1145653065),
            DIGITAL_LIGHT_AND_COLOR(1145841219),
            DOPPELGANGER_LLC(1146113095),
            DAINIPPON_SCREEN(1146298400),
            DOOSOL(1146310476),
            DUPONT(1146441806),
            EPSON(1162892111),
            ESKO_GRAPHICS(1163086671),
            ELECTRONICS_AND_TELECOMMUNICATIONS_RESEARCH_INSTITUTE(1163153993),
            EVEREX_SYSTEMS_INC(1163281746),
            EXACTCODE_GMBH(1163411779),
            EIZO_NANAO_CORPORATION(1164540527),
            FALCO_DATA_PRODUCTS_INC(1178684483),
            FUJI_PHOTO_FILM_COLTD(1179000864),
            FUJIFILM_ELECTRONIC_IMAGING_LTD(1179010377),
            FNORD_SOFTWARE(1179537988),
            FORA_INC(1179603521),
            FOREFRONT_TECHNOLOGY_CORPORATION(1179603525),
            FUJITSU(1179658794),
            WAYTECH_DEVELOPMENT_INC(1179664672),
            FUJITSU_2(1179994697),
            FUJI_XEROX_CO_LTD(1180180512),
            GCC_TECHNOLOGIES_INC(1195590432),
            GLOBAL_GRAPHICS_SOFTWARE_LIMITED(1195856716),
            GRETAGMACBETH(1196245536),
            GMG_GMBH_AND_CO_KG(1196246816),
            GOLDSTAR_TECHNOLOGY_INC(1196379204),
            GIANTPRINT_PTY_LTD(1196446292),
            GRETAGMACBETH_2(1196707138),
            WAYTECH_DEVELOPMENT_INC_2(1196835616),
            SONY_CORPORATION(1196896843),
            HCI(1212369184),
            HEIDELBERGER_DRUCKMASCHINEN_AG(1212435744),
            HERMES(1212502605),
            HITACHI_AMERICA_LTD(1212765249),
            HEWLETT_PACKARD(1213210656),
            HITACHI_LTD(1213481760),
            HITI_DIGITAL_INC(1214862441),
            IBM_CORPORATION(1229081888),
            SCITEX_CORPORATION_LTD(1229213268),
            HEWLETT_PACKARD_2(1229275936),
            IIYAMA_NORTH_AMERICA_INC(1229543745),
            IKEGAMI_ELECTRONICS_INC(1229669703),
            IMAGE_SYSTEMS_CORPORATION(1229799751),
            INGRAM_MICRO_INC(1229801760),
            INTEL_CORPORATION_2(1229870147),
            INTL(1229870156),
            INTRA_ELECTRONICS_USA_INC(1229870162),
            IOCOMM_INTERNATIONAL_TECHNOLOGY_CORPORATION(1229931343),
            INFOPRINT_SOLUTIONS_COMPANY(1230000928),
            SCITEX_CORPORATION_LTD_3(1230129491),
            ICHIKAWA_SOFT_LABORATORY(1230195744),
            ITNL(1230261836),
            IVM(1230392608),
            IWATSU_ELECTRIC_CO_LTD(1230455124),
            SCITEX_CORPORATION_LTD_2(1231318644),
            INCA_DIGITAL_PRINTERS_LTD(1231971169),
            SCITEX_CORPORATION_LTD_4(1232234867),
            JETSOFT_DEVELOPMENT(1246971476),
            JVC_INFORMATION_PRODUCTS_CO(1247167264),
            SCITEX_CORPORATION_LTD_6(1262572116),
            KFC_COMPUTEK_COMPONENTS_CORPORATION(1262895904),
            KLH_COMPUTERS(1263290400),
            KONICA_MINOLTA_HOLDINGS_INC(1263355972),
            KONICA_CORPORATION(1263420225),
            KODAK(1263486017),
            KYOCERA(1264144195),
            SCITEX_CORPORATION_LTD_7(1264677492),
            LEICA_CAMERA_AG(1279476039),
            LEEDS_COLOUR(1279476548),
            LEFT_DAKOTA(1279541579),
            LEADING_TECHNOLOGY_INC(1279607108),
            LEXMARK_INTERNATIONAL_INC(1279613005),
            LINK_COMPUTER_INC(1279872587),
            LINOTRONIC(1279872591),
            LITE_ON_INC(1279874117),
            MAG_COMPUTRONIC_USA_INC(1296123715),
            MAG_INNOVISION_INC(1296123721),
            MANNESMANN(1296125518),
            MICRON_TECHNOLOGY_INC(1296646990),
            MICROTEK(1296646994),
            MICROVITEC_INC(1296646998),
            MINOLTA(1296649807),
            MITSUBISHI_ELECTRONICS_AMERICA_INC(1296651347),
            MITSUBA_CORPORATION(1296651379),
            MINOLTA_2(1296976980),
            MODGRAPH_INC(1297040455),
            MONITRONIX_INC(1297043017),
            MONACO_SYSTEMS_INC(1297043027),
            MORSE_TECHNOLOGY_INC(1297044051),
            MOTIVE_SYSTEMS(1297044553),
            MICROSOFT_CORPORATION(1297303124),
            MUTOH_INDUSTRIES_LTD(1297437775),
            MITSUBISHI_ELECTRIC_CORPORATION_KYOTO_WORKS(1298756723),
            NANAO_USA_CORPORATION(1312902721),
            NEC_CORPORATION(1313162016),
            NEXPRESS_SOLUTIONS_LLC(1313167440),
            NISSEI_SANGYO_AMERICA_LTD(1313428307),
            NIKON_CORPORATION(1313558350),
            OCE_TECHNOLOGIES_BV(1329808672),
            OCECOLOR(1329808707),
            OKI(1330333984),
            OKIDATA(1330334020),
            OKIDATA_2(1330334032),
            OLIVETTI(1330399574),
            OLYMPUS_OPTICAL_CO_LTD(1330403661),
            ONYX_GRAPHICS(1330534744),
            OPTIQUEST(1330664521),
            PACKARD_BELL(1346454347),
            MATSUSHITA_ELECTRIC_INDUSTRIAL_CO_LTD(1346457153),
            PANTONE_INC(1346457172),
            PACKARD_BELL_2(1346522656),
            PFU_LIMITED(1346786592),
            PHILIPS_CONSUMER_ELECTRONICS_CO(1346914636),
            HOYA_CORPORATION_PENTAX_IMAGING_SYSTEMS_DIVISION(1347310680),
            PHASE_ONE_A_S(1347382885),
            PREMIER_COMPUTER_INNOVATIONS(1347568973),
            PRINCETON_GRAPHIC_SYSTEMS(1347569998),
            PRINCETON_PUBLISHING_LABS(1347570000),
            QLUX(1363957080),
            QMS_INC(1364022048),
            QPCARD_AB(1364214596),
            QUADLASER(1364541764),
            QUME_CORPORATION(1364544837),
            RADIUS_INC(1380009033),
            INTEGRATED_COLOR_SOLUTIONS_INC_2(1380205688),
            ROLAND_DG_CORPORATION(1380206368),
            REDMS_GROUP_INC(1380271181),
            RELISYS(1380273225),
            ROLF_GIERLING_MULTITOOLS(1380404563),
            RICOH_CORPORATION(1380533071),
            EDMUND_RONALD(1380863044),
            ROYAL(1380931905),
            RICOH_PRINTING_SYSTEMSLTD(1380991776),
            ROYAL_INFORMATION_ELECTRONICS_CO_LTD(1381256224),
            SAMPO_CORPORATION_OF_AMERICA(1396788560),
            SAMSUNG_INC(1396788563),
            JAIME_SANTANA_POMARES(1396788820),
            SCITEX_CORPORATION_LTD_9(1396918612),
            DAINIPPON_SCREEN_3(1396920910),
            SCITEX_CORPORATION_LTD_12(1396985888),
            SAMSUNG_ELECTRONICS_COLTD(1397048096),
            SEIKO_INSTRUMENTS_USA_INC(1397049675),
            SEIKOSHA(1397049707),
            SCANGUYCOM(1397183833),
            SHARP_LABORATORIES(1397244242),
            INTERNATIONAL_COLOR_CONSORTIUM(1397310275),
            SONY_CORPORATION_2(1397706329),
            SPECTRACAL(1397769036),
            STAR(1398030674),
            SAMPO_TECHNOLOGY_CORPORATION(1398031136),
            SCITEX_CORPORATION_LTD_10(1399023988),
            SCITEX_CORPORATION_LTD_13(1399091232),
            SONY_CORPORATION_3(1399811705),
            TALON_TECHNOLOGY_CORPORATION(1413565519),
            TANDY(1413566020),
            TATUNG_CO_OF_AMERICA_INC(1413567573),
            TAXAN_AMERICA_INC(1413568577),
            TOKYO_DENSHI_SEKEI_KK(1413763872),
            TECO_INFORMATION_SYSTEMS_INC(1413825359),
            TEGRA(1413826386),
            TEKTRONIX_INC(1413827412),
            TEXAS_INSTRUMENTS(1414078496),
            TYPEMAKER_LTD(1414351698),
            TOSHIBA_CORP(1414484802),
            TOSHIBA_INC(1414484808),
            TOTOKU_ELECTRIC_CO_LTD(1414485067),
            TRIUMPH(1414678869),
            TOSHIBA_TEC_CORPORATION(1414742612),
            TTX_COMPUTER_PRODUCTS_INC(1414813728),
            TVM_PROFESSIONAL_MONITOR_CORPORATION(1414941984),
            TW_CASPER_CORPORATION(1414996000),
            ULEAD_SYSTEMS(1431065432),
            UNISYS(1431193939),
            UTZ_FEHLAU_AND_SOHN(1431591494),
            VARITYPER(1447121481),
            VIEWSONIC(1447642455),
            VISUAL_COMMUNICATION(1447646028),
            WANG(1463897671),
            WILBUR_IMAGING(1464615506),
            WARE_TO_GO(1465141042),
            WYSE_TECHNOLOGY(1465471813),
            XEROX_CORPORATION(1480938072),
            X_RITE(1481787732),
            LAVANYAS_TEST_COMPANY(1513173555),
            ZORAN_CORPORATION(1515340110),
            ZEBRA_TECHNOLOGIES_INC(1516593778),
            BASICCOLOR_GMBH(1648968515),
            BERGDESIGN_INCORPORATED(1650815591),
            INTEGRATED_COLOR_SOLUTIONS_INC(1667594596),
            MACDERMID_COLORSPAN_INC(1668051824),
            DAINIPPON_SCREEN_2(1685266464),
            DUPONT_2(1685418094),
            FUJIFILM_ELECTRONIC_IMAGING_LTD_2(1717986665),
            FLUXDATA_CORPORATION(1718383992),
            SCITEX_CORPORATION_LTD_5(1769105779),
            SCITEX_CORPORATION_LTD_8(1801548404),
            ERDT_SYSTEMS_GMBH_AND_CO_KG_2(1868706916),
            MEDIGRAPH_GMBH(1868720483),
            QUBYX_SARL(1903518329),
            SCITEX_CORPORATION_LTD_11(1935894900),
            DAINIPPON_SCREEN_4(1935897198),
            SCITEX_CORPORATION_LTD_14(1935962144),
            SIWI_GRAFIKA_CORPORATION(1936291689),
            YXYMASTER_GMBH(2037938541);

            private final long id;
            DeviceManufacturers(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, DeviceManufacturers> byId = new HashMap<Long, DeviceManufacturers>(263);
            static {
                for (DeviceManufacturers e : DeviceManufacturers.values())
                    byId.put(e.id(), e);
            }
            public static DeviceManufacturers byId(long id) { return byId.get(id); }
        }

        public DeviceManufacturer(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public DeviceManufacturer(KaitaiStream _io, KaitaiStruct _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public DeviceManufacturer(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.deviceManufacturer = DeviceManufacturers.byId(this._io.readU4be());
        }
        private DeviceManufacturers deviceManufacturer;
        private Icc4 _root;
        private KaitaiStruct _parent;
        public DeviceManufacturers deviceManufacturer() { return deviceManufacturer; }
        public Icc4 _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class S15Fixed16Number extends KaitaiStruct {
        public static S15Fixed16Number fromFile(String fileName) throws IOException {
            return new S15Fixed16Number(new KaitaiStream(fileName));
        }

        public S15Fixed16Number(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public S15Fixed16Number(KaitaiStream _io, Icc4.TagTable.TagDefinition.S15Fixed16ArrayType _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public S15Fixed16Number(KaitaiStream _io, Icc4.TagTable.TagDefinition.S15Fixed16ArrayType _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.number = this._io.readBytes(4);
        }
        private byte[] number;
        private Icc4 _root;
        private Icc4.TagTable.TagDefinition.S15Fixed16ArrayType _parent;
        public byte[] number() { return number; }
        public Icc4 _root() { return _root; }
        public Icc4.TagTable.TagDefinition.S15Fixed16ArrayType _parent() { return _parent; }
    }
    public static class PositionNumber extends KaitaiStruct {
        public static PositionNumber fromFile(String fileName) throws IOException {
            return new PositionNumber(new KaitaiStream(fileName));
        }

        public PositionNumber(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public PositionNumber(KaitaiStream _io, KaitaiStruct _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public PositionNumber(KaitaiStream _io, KaitaiStruct _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.offsetToDataElement = this._io.readU4be();
            this.sizeOfDataElement = this._io.readU4be();
        }
        private long offsetToDataElement;
        private long sizeOfDataElement;
        private Icc4 _root;
        private KaitaiStruct _parent;
        public long offsetToDataElement() { return offsetToDataElement; }
        public long sizeOfDataElement() { return sizeOfDataElement; }
        public Icc4 _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    private ProfileHeader header;
    private TagTable tagTable;
    private Icc4 _root;
    private KaitaiStruct _parent;
    public ProfileHeader header() { return header; }
    public TagTable tagTable() { return tagTable; }
    public Icc4 _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
