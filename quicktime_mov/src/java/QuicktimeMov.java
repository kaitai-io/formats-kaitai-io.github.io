// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;


/**
 * @see <a href="https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-BBCGDDDF">Source</a>
 */
public class QuicktimeMov extends KaitaiStruct {
    public static QuicktimeMov fromFile(String fileName) throws IOException {
        return new QuicktimeMov(new ByteBufferKaitaiStream(fileName));
    }

    public enum AtomType {
        XTRA(1484026465),
        DINF(1684631142),
        DREF(1685218662),
        EDTS(1701082227),
        ELST(1701606260),
        FREE(1718773093),
        FTYP(1718909296),
        HDLR(1751411826),
        IODS(1768907891),
        MDAT(1835295092),
        MDHD(1835296868),
        MDIA(1835297121),
        META(1835365473),
        MINF(1835626086),
        MOOF(1836019558),
        MOOV(1836019574),
        MVHD(1836476516),
        SMHD(1936549988),
        STBL(1937007212),
        STCO(1937007471),
        STSC(1937011555),
        STSD(1937011556),
        STSZ(1937011578),
        STTS(1937011827),
        TKHD(1953196132),
        TRAF(1953653094),
        TRAK(1953653099),
        TREF(1953654118),
        UDTA(1969517665),
        VMHD(1986881636);

        private final long id;
        AtomType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, AtomType> byId = new HashMap<Long, AtomType>(30);
        static {
            for (AtomType e : AtomType.values())
                byId.put(e.id(), e);
        }
        public static AtomType byId(long id) { return byId.get(id); }
    }

    public enum Brand {
        X_3G2A(862401121),
        X_3GE6(862414134),
        X_3GE7(862414135),
        X_3GE9(862414137),
        X_3GF9(862414393),
        X_3GG6(862414646),
        X_3GG9(862414649),
        X_3GH9(862414905),
        X_3GM9(862416185),
        X_3GMA(862416193),
        X_3GP4(862416948),
        X_3GP5(862416949),
        X_3GP6(862416950),
        X_3GP7(862416951),
        X_3GP8(862416952),
        X_3GP9(862416953),
        X_3GR6(862417462),
        X_3GR9(862417465),
        X_3GS6(862417718),
        X_3GS9(862417721),
        X_3GT8(862417976),
        X_3GT9(862417977),
        X_3GTV(862418038),
        X_3GVR(862418546),
        X_3VRA(863400545),
        X_3VRB(863400546),
        X_3VRM(863400557),
        ARRI(1095914057),
        CAEP(1128351056),
        CDES(1128555891),
        J2P0(1244811312),
        J2P1(1244811313),
        LCAG(1279476039),
        M4A(1295270176),
        M4B(1295270432),
        M4P(1295274016),
        M4V(1295275552),
        MA1A(1296118081),
        MA1B(1296118082),
        MFSM(1296454477),
        MGSV(1296520022),
        MPPI(1297109065),
        MSNV(1297305174),
        MIAB(1298743618),
        MIAC(1298743619),
        MIAN(1298743662),
        MIBU(1298743925),
        MICM(1298744173),
        MIHA(1298745409),
        MIHB(1298745410),
        MIHE(1298745413),
        MIPR(1298747506),
        ROSS(1380930387),
        SEAU(1397047637),
        SEBK(1397047883),
        XAVC(1480676931),
        ADTI(1633973353),
        AID3(1634296883),
        AV01(1635135537),
        AVC1(1635148593),
        AVCI(1635148649),
        AVCS(1635148659),
        AVDE(1635148901),
        AVIF(1635150182),
        AVIO(1635150191),
        AVIS(1635150195),
        BBXM(1650620525),
        CA4M(1667314797),
        CA4S(1667314803),
        CAAA(1667326305),
        CAAC(1667326307),
        CABL(1667326572),
        CAMA(1667329377),
        CAMC(1667329379),
        CAQV(1667330422),
        CASU(1667330933),
        CCEA(1667458401),
        CCFF(1667458662),
        CDM1(1667525937),
        CDM4(1667525940),
        CEAC(1667588451),
        CFHD(1667655780),
        CFSD(1667658596),
        CHD1(1667785777),
        CHD2(1667785778),
        CHDF(1667785830),
        CHEV(1667786102),
        CHH1(1667786801),
        CHHD(1667786852),
        CINT(1667853940),
        CLG1(1668048689),
        CLG2(1668048690),
        CMF2(1668113970),
        CMFC(1668114019),
        CMFF(1668114022),
        CMFL(1668114028),
        CMFS(1668114035),
        CMHM(1668114541),
        CMHS(1668114547),
        COMP(1668246896),
        CSH1(1668507697),
        CUD1(1668637745),
        CUD2(1668637746),
        CUD8(1668637752),
        CUD9(1668637753),
        CUVD(1668642404),
        CVID(1668704612),
        CVVC(1668707939),
        CWVT(1668773492),
        DA0A(1684090977),
        DA0B(1684090978),
        DA1A(1684091233),
        DA1B(1684091234),
        DA2A(1684091489),
        DA2B(1684091490),
        DA3A(1684091745),
        DA3B(1684091746),
        DASH(1684108136),
        DBY1(1684175153),
        DMB1(1684890161),
        DSMS(1685286259),
        DTS1(1685353265),
        DTS2(1685353266),
        DTS3(1685353267),
        DV1A(1685467489),
        DV1B(1685467490),
        DV2A(1685467745),
        DV2B(1685467746),
        DV3A(1685468001),
        DV3B(1685468002),
        DVR1(1685484081),
        DVT1(1685484593),
        DXO(1685614368),
        EMSG(1701671783),
        HEIC(1751476579),
        HEIM(1751476589),
        HEIS(1751476595),
        HEIX(1751476600),
        HEOI(1751478121),
        HEVC(1751479907),
        HEVD(1751479908),
        HEVI(1751479913),
        HEVM(1751479917),
        HEVS(1751479923),
        HEVX(1751479928),
        HVCE(1752589157),
        HVCI(1752589161),
        HVCX(1752589176),
        HVTI(1752593513),
        IFAA(1768317281),
        IFAH(1768317288),
        IFAI(1768317289),
        IFAS(1768317299),
        IFAU(1768317301),
        IFAV(1768317302),
        IFHD(1768319076),
        IFHH(1768319080),
        IFHR(1768319090),
        IFHS(1768319091),
        IFHU(1768319093),
        IFHX(1768319096),
        IFRM(1768321645),
        IFSD(1768321892),
        IM1I(1768763753),
        IM1T(1768763764),
        IM2I(1768764009),
        IM2T(1768764020),
        ISC2(1769169714),
        ISO2(1769172786),
        ISO3(1769172787),
        ISO4(1769172788),
        ISO5(1769172789),
        ISO6(1769172790),
        ISO7(1769172791),
        ISO8(1769172792),
        ISO9(1769172793),
        ISOA(1769172833),
        ISOB(1769172834),
        ISOC(1769172835),
        ISOM(1769172845),
        J2IS(1781688691),
        J2KI(1781689193),
        J2KS(1781689203),
        JP2(1785737760),
        JPEG(1785750887),
        JPGS(1785751411),
        JPM(1785752864),
        JPOI(1785753449),
        JPSI(1785754473),
        JPX(1785755680),
        JPXB(1785755746),
        JXL(1786276896),
        JXS(1786278688),
        JXSC(1786278755),
        JXSI(1786278761),
        JXSS(1786278771),
        LHTE(1818784869),
        LHTI(1818784873),
        LMSG(1819112295),
        MIAF(1835622758),
        MIF1(1835623985),
        MIF2(1835623986),
        MJ2S(1835676275),
        MJP2(1835692082),
        MP21(1836069425),
        MP41(1836069937),
        MP42(1836069938),
        MP71(1836070705),
        MPUF(1836086630),
        MSDH(1836278888),
        MSF1(1836279345),
        MSIX(1836280184),
        NIKO(1852402543),
        NLSL(1852601196),
        NRAS(1852989811),
        OA2D(1868640868),
        OABL(1868653164),
        ODCF(1868850022),
        OMPP(1869443184),
        OPF2(1869637170),
        OPX2(1869641778),
        OVDP(1870029936),
        OVLY(1870031993),
        PAFF(1885431398),
        PANA(1885433441),
        PIFF(1885955686),
        PMFF(1886217830),
        PNVI(1886287465),
        PRED(1886545252),
        QT(1903435808),
        RELO(1919249519),
        RISX(1919513464),
        SDV(1935963680),
        SENV(1936027254),
        SIMS(1936289139),
        SISX(1936290680),
        SITI(1936290921),
        SITV(1936290934),
        SLH1(1936484401),
        SLH2(1936484402),
        SLH3(1936484403),
        SSSS(1936946035),
        TTML(1953787244),
        TTWV(1953789814),
        UHVI(1969780329),
        UNIF(1970170214),
        UVVU(1970697845),
        V3MP(1983081840),
        V3MT(1983081844),
        V3NT(1983082100),
        V3ST(1983083380),
        VVCI(1987470185),
        VVOI(1987473257),
        VWPT(1987539060),
        YT4(2037658656);

        private final long id;
        Brand(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Brand> byId = new HashMap<Long, Brand>(255);
        static {
            for (Brand e : Brand.values())
                byId.put(e.id(), e);
        }
        public static Brand byId(long id) { return byId.get(id); }
    }

    public QuicktimeMov(KaitaiStream _io) {
        this(_io, null, null);
    }

    public QuicktimeMov(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public QuicktimeMov(KaitaiStream _io, KaitaiStruct _parent, QuicktimeMov _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.atoms = new AtomList(this._io, this, _root);
    }

    /**
     * @see <a href="https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-BBCGFGJG">Source</a>
     */
    public static class MvhdBody extends KaitaiStruct {
        public static MvhdBody fromFile(String fileName) throws IOException {
            return new MvhdBody(new ByteBufferKaitaiStream(fileName));
        }

        public MvhdBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MvhdBody(KaitaiStream _io, QuicktimeMov.Atom _parent) {
            this(_io, _parent, null);
        }

        public MvhdBody(KaitaiStream _io, QuicktimeMov.Atom _parent, QuicktimeMov _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.version = this._io.readU1();
            this.flags = this._io.readBytes(3);
            this.creationTime = this._io.readU4be();
            this.modificationTime = this._io.readU4be();
            this.timeScale = this._io.readU4be();
            this.duration = this._io.readU4be();
            this.preferredRate = new Fixed32(this._io, this, _root);
            this.preferredVolume = new Fixed16(this._io, this, _root);
            this.reserved1 = this._io.readBytes(10);
            this.matrix = this._io.readBytes(36);
            this.previewTime = this._io.readU4be();
            this.previewDuration = this._io.readU4be();
            this.posterTime = this._io.readU4be();
            this.selectionTime = this._io.readU4be();
            this.selectionDuration = this._io.readU4be();
            this.currentTime = this._io.readU4be();
            this.nextTrackId = this._io.readU4be();
        }
        private int version;
        private byte[] flags;
        private long creationTime;
        private long modificationTime;
        private long timeScale;
        private long duration;
        private Fixed32 preferredRate;
        private Fixed16 preferredVolume;
        private byte[] reserved1;
        private byte[] matrix;
        private long previewTime;
        private long previewDuration;
        private long posterTime;
        private long selectionTime;
        private long selectionDuration;
        private long currentTime;
        private long nextTrackId;
        private QuicktimeMov _root;
        private QuicktimeMov.Atom _parent;

        /**
         * Version of this movie header atom
         */
        public int version() { return version; }
        public byte[] flags() { return flags; }
        public long creationTime() { return creationTime; }
        public long modificationTime() { return modificationTime; }

        /**
         * A time value that indicates the time scale for this
         * movie - the number of time units that pass per second
         * in its time coordinate system. A time coordinate system that
         * measures time in sixtieths of a second, for example, has a
         * time scale of 60.
         */
        public long timeScale() { return timeScale; }

        /**
         * A time value that indicates the duration of the movie in
         * time scale units. Note that this property is derived from
         * the movie's tracks. The value of this field corresponds to
         * the duration of the longest track in the movie.
         */
        public long duration() { return duration; }

        /**
         * The rate at which to play this movie. A value of 1.0 indicates normal rate.
         */
        public Fixed32 preferredRate() { return preferredRate; }

        /**
         * How loud to play this movie's sound. A value of 1.0 indicates full volume.
         */
        public Fixed16 preferredVolume() { return preferredVolume; }
        public byte[] reserved1() { return reserved1; }

        /**
         * A matrix shows how to map points from one coordinate space into another.
         */
        public byte[] matrix() { return matrix; }

        /**
         * The time value in the movie at which the preview begins.
         */
        public long previewTime() { return previewTime; }

        /**
         * The duration of the movie preview in movie time scale units.
         */
        public long previewDuration() { return previewDuration; }

        /**
         * The time value of the time of the movie poster.
         */
        public long posterTime() { return posterTime; }

        /**
         * The time value for the start time of the current selection.
         */
        public long selectionTime() { return selectionTime; }

        /**
         * The duration of the current selection in movie time scale units.
         */
        public long selectionDuration() { return selectionDuration; }

        /**
         * The time value for current time position within the movie.
         */
        public long currentTime() { return currentTime; }

        /**
         * Indicates a value to use for the track ID number of the next
         * track added to this movie. Note that 0 is not a valid track
         * ID value.
         */
        public long nextTrackId() { return nextTrackId; }
        public QuicktimeMov _root() { return _root; }
        public QuicktimeMov.Atom _parent() { return _parent; }
    }

    /**
     * @see <a href="https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-CJBCBIFF">Source</a>
     */
    public static class FtypBody extends KaitaiStruct {
        public static FtypBody fromFile(String fileName) throws IOException {
            return new FtypBody(new ByteBufferKaitaiStream(fileName));
        }

        public FtypBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FtypBody(KaitaiStream _io, QuicktimeMov.Atom _parent) {
            this(_io, _parent, null);
        }

        public FtypBody(KaitaiStream _io, QuicktimeMov.Atom _parent, QuicktimeMov _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.majorBrand = QuicktimeMov.Brand.byId(this._io.readU4be());
            this.minorVersion = this._io.readBytes(4);
            this.compatibleBrands = new ArrayList<Brand>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.compatibleBrands.add(QuicktimeMov.Brand.byId(this._io.readU4be()));
                    i++;
                }
            }
        }
        private Brand majorBrand;
        private byte[] minorVersion;
        private ArrayList<Brand> compatibleBrands;
        private QuicktimeMov _root;
        private QuicktimeMov.Atom _parent;
        public Brand majorBrand() { return majorBrand; }
        public byte[] minorVersion() { return minorVersion; }
        public ArrayList<Brand> compatibleBrands() { return compatibleBrands; }
        public QuicktimeMov _root() { return _root; }
        public QuicktimeMov.Atom _parent() { return _parent; }
    }

    /**
     * Fixed-point 32-bit number.
     */
    public static class Fixed32 extends KaitaiStruct {
        public static Fixed32 fromFile(String fileName) throws IOException {
            return new Fixed32(new ByteBufferKaitaiStream(fileName));
        }

        public Fixed32(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Fixed32(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Fixed32(KaitaiStream _io, KaitaiStruct _parent, QuicktimeMov _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.intPart = this._io.readS2be();
            this.fracPart = this._io.readU2be();
        }
        private short intPart;
        private int fracPart;
        private QuicktimeMov _root;
        private KaitaiStruct _parent;
        public short intPart() { return intPart; }
        public int fracPart() { return fracPart; }
        public QuicktimeMov _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * Fixed-point 16-bit number.
     */
    public static class Fixed16 extends KaitaiStruct {
        public static Fixed16 fromFile(String fileName) throws IOException {
            return new Fixed16(new ByteBufferKaitaiStream(fileName));
        }

        public Fixed16(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Fixed16(KaitaiStream _io, QuicktimeMov.MvhdBody _parent) {
            this(_io, _parent, null);
        }

        public Fixed16(KaitaiStream _io, QuicktimeMov.MvhdBody _parent, QuicktimeMov _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.intPart = this._io.readS1();
            this.fracPart = this._io.readU1();
        }
        private byte intPart;
        private int fracPart;
        private QuicktimeMov _root;
        private QuicktimeMov.MvhdBody _parent;
        public byte intPart() { return intPart; }
        public int fracPart() { return fracPart; }
        public QuicktimeMov _root() { return _root; }
        public QuicktimeMov.MvhdBody _parent() { return _parent; }
    }
    public static class Atom extends KaitaiStruct {
        public static Atom fromFile(String fileName) throws IOException {
            return new Atom(new ByteBufferKaitaiStream(fileName));
        }

        public Atom(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Atom(KaitaiStream _io, QuicktimeMov.AtomList _parent) {
            this(_io, _parent, null);
        }

        public Atom(KaitaiStream _io, QuicktimeMov.AtomList _parent, QuicktimeMov _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.len32 = this._io.readU4be();
            this.atomType = QuicktimeMov.AtomType.byId(this._io.readU4be());
            if (len32() == 1) {
                this.len64 = this._io.readU8be();
            }
            {
                AtomType on = atomType();
                if (on != null) {
                    switch (atomType()) {
                    case MOOF: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new AtomList(_io__raw_body, this, _root);
                        break;
                    }
                    case TKHD: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new TkhdBody(_io__raw_body, this, _root);
                        break;
                    }
                    case STBL: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new AtomList(_io__raw_body, this, _root);
                        break;
                    }
                    case TRAF: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new AtomList(_io__raw_body, this, _root);
                        break;
                    }
                    case MINF: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new AtomList(_io__raw_body, this, _root);
                        break;
                    }
                    case TRAK: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new AtomList(_io__raw_body, this, _root);
                        break;
                    }
                    case MOOV: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new AtomList(_io__raw_body, this, _root);
                        break;
                    }
                    case MDIA: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new AtomList(_io__raw_body, this, _root);
                        break;
                    }
                    case DINF: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new AtomList(_io__raw_body, this, _root);
                        break;
                    }
                    case MVHD: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new MvhdBody(_io__raw_body, this, _root);
                        break;
                    }
                    case FTYP: {
                        this._raw_body = this._io.readBytes(len());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new FtypBody(_io__raw_body, this, _root);
                        break;
                    }
                    default: {
                        this.body = this._io.readBytes(len());
                        break;
                    }
                    }
                } else {
                    this.body = this._io.readBytes(len());
                }
            }
        }
        private Integer len;
        public Integer len() {
            if (this.len != null)
                return this.len;
            int _tmp = (int) ((len32() == 0 ? (_io().size() - 8) : (len32() == 1 ? (len64() - 16) : (len32() - 8))));
            this.len = _tmp;
            return this.len;
        }
        private long len32;
        private AtomType atomType;
        private Long len64;
        private Object body;
        private QuicktimeMov _root;
        private QuicktimeMov.AtomList _parent;
        private byte[] _raw_body;
        public long len32() { return len32; }
        public AtomType atomType() { return atomType; }
        public Long len64() { return len64; }
        public Object body() { return body; }
        public QuicktimeMov _root() { return _root; }
        public QuicktimeMov.AtomList _parent() { return _parent; }
        public byte[] _raw_body() { return _raw_body; }
    }

    /**
     * @see <a href="https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-25550">Source</a>
     */
    public static class TkhdBody extends KaitaiStruct {
        public static TkhdBody fromFile(String fileName) throws IOException {
            return new TkhdBody(new ByteBufferKaitaiStream(fileName));
        }

        public TkhdBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TkhdBody(KaitaiStream _io, QuicktimeMov.Atom _parent) {
            this(_io, _parent, null);
        }

        public TkhdBody(KaitaiStream _io, QuicktimeMov.Atom _parent, QuicktimeMov _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.version = this._io.readU1();
            this.flags = this._io.readBytes(3);
            this.creationTime = this._io.readU4be();
            this.modificationTime = this._io.readU4be();
            this.trackId = this._io.readU4be();
            this.reserved1 = this._io.readBytes(4);
            this.duration = this._io.readU4be();
            this.reserved2 = this._io.readBytes(8);
            this.layer = this._io.readU2be();
            this.alternativeGroup = this._io.readU2be();
            this.volume = this._io.readU2be();
            this.reserved3 = this._io.readU2be();
            this.matrix = this._io.readBytes(36);
            this.width = new Fixed32(this._io, this, _root);
            this.height = new Fixed32(this._io, this, _root);
        }
        private int version;
        private byte[] flags;
        private long creationTime;
        private long modificationTime;
        private long trackId;
        private byte[] reserved1;
        private long duration;
        private byte[] reserved2;
        private int layer;
        private int alternativeGroup;
        private int volume;
        private int reserved3;
        private byte[] matrix;
        private Fixed32 width;
        private Fixed32 height;
        private QuicktimeMov _root;
        private QuicktimeMov.Atom _parent;
        public int version() { return version; }
        public byte[] flags() { return flags; }
        public long creationTime() { return creationTime; }
        public long modificationTime() { return modificationTime; }

        /**
         * Integer that uniquely identifies the track. The value 0 cannot be used.
         */
        public long trackId() { return trackId; }
        public byte[] reserved1() { return reserved1; }
        public long duration() { return duration; }
        public byte[] reserved2() { return reserved2; }
        public int layer() { return layer; }
        public int alternativeGroup() { return alternativeGroup; }
        public int volume() { return volume; }
        public int reserved3() { return reserved3; }
        public byte[] matrix() { return matrix; }
        public Fixed32 width() { return width; }
        public Fixed32 height() { return height; }
        public QuicktimeMov _root() { return _root; }
        public QuicktimeMov.Atom _parent() { return _parent; }
    }
    public static class AtomList extends KaitaiStruct {
        public static AtomList fromFile(String fileName) throws IOException {
            return new AtomList(new ByteBufferKaitaiStream(fileName));
        }

        public AtomList(KaitaiStream _io) {
            this(_io, null, null);
        }

        public AtomList(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public AtomList(KaitaiStream _io, KaitaiStruct _parent, QuicktimeMov _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.items = new ArrayList<Atom>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.items.add(new Atom(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<Atom> items;
        private QuicktimeMov _root;
        private KaitaiStruct _parent;
        public ArrayList<Atom> items() { return items; }
        public QuicktimeMov _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    private AtomList atoms;
    private QuicktimeMov _root;
    private KaitaiStruct _parent;
    public AtomList atoms() { return atoms; }
    public QuicktimeMov _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
