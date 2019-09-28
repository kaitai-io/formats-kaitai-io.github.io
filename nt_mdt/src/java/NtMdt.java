// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;


/**
 * A native file format of NT-MDT scientific software. Usually contains
 * any of:
 * 
 * * [Scanning probe](https://en.wikipedia.org/wiki/Scanning_probe_microscopy) microscopy scans and spectra
 * * [Raman spectra](https://en.wikipedia.org/wiki/Raman_spectroscopy)
 * * results of their analysis
 * 
 * Some examples of mdt files can be downloaded at:
 * 
 * * http://www.ntmdt-si.ru/scan-gallery
 * * http://callistosoft.narod.ru/Resources/Mdt.zip
 * @see <a href="https://svn.code.sf.net/p/gwyddion/code/trunk/gwyddion/modules/file/nt-mdt.c">Source</a>
 */
public class NtMdt extends KaitaiStruct {
    public static NtMdt fromFile(String fileName) throws IOException {
        return new NtMdt(new ByteBufferKaitaiStream(fileName));
    }

    public enum AdcMode {
        HEIGHT(0),
        DFL(1),
        LATERAL_F(2),
        BIAS_V(3),
        CURRENT(4),
        FB_OUT(5),
        MAG(6),
        MAG_SIN(7),
        MAG_COS(8),
        RMS(9),
        CALC_MAG(10),
        PHASE1(11),
        PHASE2(12),
        CALC_PHASE(13),
        EX1(14),
        EX2(15),
        HV_X(16),
        HV_Y(17),
        SNAP_BACK(18),
        FALSE(255);

        private final long id;
        AdcMode(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, AdcMode> byId = new HashMap<Long, AdcMode>(20);
        static {
            for (AdcMode e : AdcMode.values())
                byId.put(e.id(), e);
        }
        public static AdcMode byId(long id) { return byId.get(id); }
    }

    public enum XmlScanLocation {
        HLT(0),
        HLB(1),
        HRT(2),
        HRB(3),
        VLT(4),
        VLB(5),
        VRT(6),
        VRB(7);

        private final long id;
        XmlScanLocation(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, XmlScanLocation> byId = new HashMap<Long, XmlScanLocation>(8);
        static {
            for (XmlScanLocation e : XmlScanLocation.values())
                byId.put(e.id(), e);
        }
        public static XmlScanLocation byId(long id) { return byId.get(id); }
    }

    public enum DataType {
        FLOATFIX(-65544),
        FLOAT80(-16138),
        FLOAT64(-13320),
        FLOAT48(-9990),
        FLOAT32(-5892),
        INT64(-8),
        INT32(-4),
        INT16(-2),
        INT8(-1),
        UNKNOWN0(0),
        UINT8(1),
        UINT16(2),
        UINT32(4),
        UINT64(8);

        private final long id;
        DataType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, DataType> byId = new HashMap<Long, DataType>(14);
        static {
            for (DataType e : DataType.values())
                byId.put(e.id(), e);
        }
        public static DataType byId(long id) { return byId.get(id); }
    }

    public enum XmlParamType {
        NONE(0),
        LASER_WAVELENGTH(1),
        UNITS(2),
        DATA_ARRAY(255);

        private final long id;
        XmlParamType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, XmlParamType> byId = new HashMap<Long, XmlParamType>(4);
        static {
            for (XmlParamType e : XmlParamType.values())
                byId.put(e.id(), e);
        }
        public static XmlParamType byId(long id) { return byId.get(id); }
    }

    public enum SpmMode {
        CONSTANT_FORCE(0),
        CONTACT_CONSTANT_HEIGHT(1),
        CONTACT_ERROR(2),
        LATERAL_FORCE(3),
        FORCE_MODULATION(4),
        SPREADING_RESISTANCE_IMAGING(5),
        SEMICONTACT_TOPOGRAPHY(6),
        SEMICONTACT_ERROR(7),
        PHASE_CONTRAST(8),
        AC_MAGNETIC_FORCE(9),
        DC_MAGNETIC_FORCE(10),
        ELECTROSTATIC_FORCE(11),
        CAPACITANCE_CONTRAST(12),
        KELVIN_PROBE(13),
        CONSTANT_CURRENT(14),
        BARRIER_HEIGHT(15),
        CONSTANT_HEIGHT(16),
        AFAM(17),
        CONTACT_EFM(18),
        SHEAR_FORCE_TOPOGRAPHY(19),
        SFOM(20),
        CONTACT_CAPACITANCE(21),
        SNOM_TRANSMISSION(22),
        SNOM_REFLECTION(23),
        SNOM_ALL(24),
        SNOM(25);

        private final long id;
        SpmMode(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, SpmMode> byId = new HashMap<Long, SpmMode>(26);
        static {
            for (SpmMode e : SpmMode.values())
                byId.put(e.id(), e);
        }
        public static SpmMode byId(long id) { return byId.get(id); }
    }

    public enum Unit {
        RAMAN_SHIFT(-10),
        RESERVED0(-9),
        RESERVED1(-8),
        RESERVED2(-7),
        RESERVED3(-6),
        METER(-5),
        CENTI_METER(-4),
        MILLI_METER(-3),
        MICRO_METER(-2),
        NANO_METER(-1),
        ANGSTROM(0),
        NANO_AMPERE(1),
        VOLT(2),
        NONE(3),
        KILO_HERTZ(4),
        DEGREES(5),
        PERCENT(6),
        CELSIUS_DEGREE(7),
        VOLT_HIGH(8),
        SECOND(9),
        MILLI_SECOND(10),
        MICRO_SECOND(11),
        NANO_SECOND(12),
        COUNTS(13),
        PIXELS(14),
        RESERVED_SFOM0(15),
        RESERVED_SFOM1(16),
        RESERVED_SFOM2(17),
        RESERVED_SFOM3(18),
        RESERVED_SFOM4(19),
        AMPERE2(20),
        MILLI_AMPERE(21),
        MICRO_AMPERE(22),
        NANO_AMPERE2(23),
        PICO_AMPERE(24),
        VOLT2(25),
        MILLI_VOLT(26),
        MICRO_VOLT(27),
        NANO_VOLT(28),
        PICO_VOLT(29),
        NEWTON(30),
        MILLI_NEWTON(31),
        MICRO_NEWTON(32),
        NANO_NEWTON(33),
        PICO_NEWTON(34),
        RESERVED_DOS0(35),
        RESERVED_DOS1(36),
        RESERVED_DOS2(37),
        RESERVED_DOS3(38),
        RESERVED_DOS4(39);

        private final long id;
        Unit(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Unit> byId = new HashMap<Long, Unit>(50);
        static {
            for (Unit e : Unit.values())
                byId.put(e.id(), e);
        }
        public static Unit byId(long id) { return byId.get(id); }
    }

    public enum SpmTechnique {
        CONTACT_MODE(0),
        SEMICONTACT_MODE(1),
        TUNNEL_CURRENT(2),
        SNOM(3);

        private final long id;
        SpmTechnique(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, SpmTechnique> byId = new HashMap<Long, SpmTechnique>(4);
        static {
            for (SpmTechnique e : SpmTechnique.values())
                byId.put(e.id(), e);
        }
        public static SpmTechnique byId(long id) { return byId.get(id); }
    }

    public enum Consts {
        FRAME_MODE_SIZE(8),
        FRAME_HEADER_SIZE(22),
        AXIS_SCALES_SIZE(30),
        FILE_HEADER_SIZE(32),
        SPECTRO_VARS_MIN_SIZE(38),
        SCAN_VARS_MIN_SIZE(77);

        private final long id;
        Consts(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Consts> byId = new HashMap<Long, Consts>(6);
        static {
            for (Consts e : Consts.values())
                byId.put(e.id(), e);
        }
        public static Consts byId(long id) { return byId.get(id); }
    }

    public NtMdt(KaitaiStream _io) {
        this(_io, null, null);
    }

    public NtMdt(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public NtMdt(KaitaiStream _io, KaitaiStruct _parent, NtMdt _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.signature = this._io.ensureFixedContents(new byte[] { 1, -80, -109, -1 });
        this.size = this._io.readU4le();
        this.reserved0 = this._io.readBytes(4);
        this.lastFrame = this._io.readU2le();
        this.reserved1 = this._io.readBytes(18);
        this.wrondDoc = this._io.readBytes(1);
        this._raw_frames = this._io.readBytes(size());
        KaitaiStream _io__raw_frames = new ByteBufferKaitaiStream(_raw_frames);
        this.frames = new Framez(_io__raw_frames, this, _root);
    }
    public static class Uuid extends KaitaiStruct {
        public static Uuid fromFile(String fileName) throws IOException {
            return new Uuid(new ByteBufferKaitaiStream(fileName));
        }

        public Uuid(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Uuid(KaitaiStream _io, NtMdt.Frame.FdMetaData _parent) {
            this(_io, _parent, null);
        }

        public Uuid(KaitaiStream _io, NtMdt.Frame.FdMetaData _parent, NtMdt _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            data = new ArrayList<Integer>(((Number) (16)).intValue());
            for (int i = 0; i < 16; i++) {
                this.data.add(this._io.readU1());
            }
        }
        private ArrayList<Integer> data;
        private NtMdt _root;
        private NtMdt.Frame.FdMetaData _parent;
        public ArrayList<Integer> data() { return data; }
        public NtMdt _root() { return _root; }
        public NtMdt.Frame.FdMetaData _parent() { return _parent; }
    }
    public static class Framez extends KaitaiStruct {
        public static Framez fromFile(String fileName) throws IOException {
            return new Framez(new ByteBufferKaitaiStream(fileName));
        }

        public Framez(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Framez(KaitaiStream _io, NtMdt _parent) {
            this(_io, _parent, null);
        }

        public Framez(KaitaiStream _io, NtMdt _parent, NtMdt _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            frames = new ArrayList<Frame>(((Number) ((_root.lastFrame() + 1))).intValue());
            for (int i = 0; i < (_root.lastFrame() + 1); i++) {
                this.frames.add(new Frame(this._io, this, _root));
            }
        }
        private ArrayList<Frame> frames;
        private NtMdt _root;
        private NtMdt _parent;
        public ArrayList<Frame> frames() { return frames; }
        public NtMdt _root() { return _root; }
        public NtMdt _parent() { return _parent; }
    }
    public static class Frame extends KaitaiStruct {
        public static Frame fromFile(String fileName) throws IOException {
            return new Frame(new ByteBufferKaitaiStream(fileName));
        }

        public enum FrameType {
            SCANNED(0),
            SPECTROSCOPY(1),
            TEXT(3),
            OLD_MDA(105),
            MDA(106),
            PALETTE(107),
            CURVES_NEW(190),
            CURVES(201);

            private final long id;
            FrameType(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, FrameType> byId = new HashMap<Long, FrameType>(8);
            static {
                for (FrameType e : FrameType.values())
                    byId.put(e.id(), e);
            }
            public static FrameType byId(long id) { return byId.get(id); }
        }

        public Frame(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Frame(KaitaiStream _io, NtMdt.Framez _parent) {
            this(_io, _parent, null);
        }

        public Frame(KaitaiStream _io, NtMdt.Framez _parent, NtMdt _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.size = this._io.readU4le();
            this._raw_main = this._io.readBytes((size() - 4));
            KaitaiStream _io__raw_main = new ByteBufferKaitaiStream(_raw_main);
            this.main = new FrameMain(_io__raw_main, this, _root);
        }
        public static class Dots extends KaitaiStruct {
            public static Dots fromFile(String fileName) throws IOException {
                return new Dots(new ByteBufferKaitaiStream(fileName));
            }

            public Dots(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Dots(KaitaiStream _io, KaitaiStruct _parent) {
                this(_io, _parent, null);
            }

            public Dots(KaitaiStream _io, KaitaiStruct _parent, NtMdt _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.fmNdots = this._io.readU2le();
                if (fmNdots() > 0) {
                    this.coordHeader = new DotsHeader(this._io, this, _root);
                }
                coordinates = new ArrayList<DotsData>(((Number) (fmNdots())).intValue());
                for (int i = 0; i < fmNdots(); i++) {
                    this.coordinates.add(new DotsData(this._io, this, _root));
                }
                data = new ArrayList<DataLinez>(((Number) (fmNdots())).intValue());
                for (int i = 0; i < fmNdots(); i++) {
                    this.data.add(new DataLinez(this._io, this, _root, i));
                }
            }
            public static class DotsHeader extends KaitaiStruct {
                public static DotsHeader fromFile(String fileName) throws IOException {
                    return new DotsHeader(new ByteBufferKaitaiStream(fileName));
                }

                public DotsHeader(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public DotsHeader(KaitaiStream _io, NtMdt.Frame.Dots _parent) {
                    this(_io, _parent, null);
                }

                public DotsHeader(KaitaiStream _io, NtMdt.Frame.Dots _parent, NtMdt _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.headerSize = this._io.readS4le();
                    this._raw_header = this._io.readBytes(headerSize());
                    KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(_raw_header);
                    this.header = new Header(_io__raw_header, this, _root);
                }
                public static class Header extends KaitaiStruct {
                    public static Header fromFile(String fileName) throws IOException {
                        return new Header(new ByteBufferKaitaiStream(fileName));
                    }

                    public Header(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public Header(KaitaiStream _io, NtMdt.Frame.Dots.DotsHeader _parent) {
                        this(_io, _parent, null);
                    }

                    public Header(KaitaiStream _io, NtMdt.Frame.Dots.DotsHeader _parent, NtMdt _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                        _read();
                    }
                    private void _read() {
                        this.coordSize = this._io.readS4le();
                        this.version = this._io.readS4le();
                        this.xyunits = NtMdt.Unit.byId(this._io.readS2le());
                    }
                    private int coordSize;
                    private int version;
                    private Unit xyunits;
                    private NtMdt _root;
                    private NtMdt.Frame.Dots.DotsHeader _parent;
                    public int coordSize() { return coordSize; }
                    public int version() { return version; }
                    public Unit xyunits() { return xyunits; }
                    public NtMdt _root() { return _root; }
                    public NtMdt.Frame.Dots.DotsHeader _parent() { return _parent; }
                }
                private int headerSize;
                private Header header;
                private NtMdt _root;
                private NtMdt.Frame.Dots _parent;
                private byte[] _raw_header;
                public int headerSize() { return headerSize; }
                public Header header() { return header; }
                public NtMdt _root() { return _root; }
                public NtMdt.Frame.Dots _parent() { return _parent; }
                public byte[] _raw_header() { return _raw_header; }
            }
            public static class DotsData extends KaitaiStruct {
                public static DotsData fromFile(String fileName) throws IOException {
                    return new DotsData(new ByteBufferKaitaiStream(fileName));
                }

                public DotsData(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public DotsData(KaitaiStream _io, NtMdt.Frame.Dots _parent) {
                    this(_io, _parent, null);
                }

                public DotsData(KaitaiStream _io, NtMdt.Frame.Dots _parent, NtMdt _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.coordX = this._io.readF4le();
                    this.coordY = this._io.readF4le();
                    this.forwardSize = this._io.readS4le();
                    this.backwardSize = this._io.readS4le();
                }
                private float coordX;
                private float coordY;
                private int forwardSize;
                private int backwardSize;
                private NtMdt _root;
                private NtMdt.Frame.Dots _parent;
                public float coordX() { return coordX; }
                public float coordY() { return coordY; }
                public int forwardSize() { return forwardSize; }
                public int backwardSize() { return backwardSize; }
                public NtMdt _root() { return _root; }
                public NtMdt.Frame.Dots _parent() { return _parent; }
            }
            public static class DataLinez extends KaitaiStruct {

                public DataLinez(KaitaiStream _io, int index) {
                    this(_io, null, null, index);
                }

                public DataLinez(KaitaiStream _io, NtMdt.Frame.Dots _parent, int index) {
                    this(_io, _parent, null, index);
                }

                public DataLinez(KaitaiStream _io, NtMdt.Frame.Dots _parent, NtMdt _root, int index) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    this.index = index;
                    _read();
                }
                private void _read() {
                    forward = new ArrayList<Short>(((Number) (_parent().coordinates().get((int) index()).forwardSize())).intValue());
                    for (int i = 0; i < _parent().coordinates().get((int) index()).forwardSize(); i++) {
                        this.forward.add(this._io.readS2le());
                    }
                    backward = new ArrayList<Short>(((Number) (_parent().coordinates().get((int) index()).backwardSize())).intValue());
                    for (int i = 0; i < _parent().coordinates().get((int) index()).backwardSize(); i++) {
                        this.backward.add(this._io.readS2le());
                    }
                }
                private ArrayList<Short> forward;
                private ArrayList<Short> backward;
                private int index;
                private NtMdt _root;
                private NtMdt.Frame.Dots _parent;
                public ArrayList<Short> forward() { return forward; }
                public ArrayList<Short> backward() { return backward; }
                public int index() { return index; }
                public NtMdt _root() { return _root; }
                public NtMdt.Frame.Dots _parent() { return _parent; }
            }
            private int fmNdots;
            private DotsHeader coordHeader;
            private ArrayList<DotsData> coordinates;
            private ArrayList<DataLinez> data;
            private NtMdt _root;
            private KaitaiStruct _parent;
            public int fmNdots() { return fmNdots; }
            public DotsHeader coordHeader() { return coordHeader; }
            public ArrayList<DotsData> coordinates() { return coordinates; }
            public ArrayList<DataLinez> data() { return data; }
            public NtMdt _root() { return _root; }
            public KaitaiStruct _parent() { return _parent; }
        }
        public static class FrameMain extends KaitaiStruct {
            public static FrameMain fromFile(String fileName) throws IOException {
                return new FrameMain(new ByteBufferKaitaiStream(fileName));
            }

            public FrameMain(KaitaiStream _io) {
                this(_io, null, null);
            }

            public FrameMain(KaitaiStream _io, NtMdt.Frame _parent) {
                this(_io, _parent, null);
            }

            public FrameMain(KaitaiStream _io, NtMdt.Frame _parent, NtMdt _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.type = NtMdt.Frame.FrameType.byId(this._io.readU2le());
                this.version = new Version(this._io, this, _root);
                this.dateTime = new DateTime(this._io, this, _root);
                this.varSize = this._io.readU2le();
                {
                    FrameType on = type();
                    if (on != null) {
                        switch (type()) {
                        case MDA: {
                            this._raw_frameData = this._io.readBytesFull();
                            KaitaiStream _io__raw_frameData = new ByteBufferKaitaiStream(_raw_frameData);
                            this.frameData = new FdMetaData(_io__raw_frameData, this, _root);
                            break;
                        }
                        case CURVES_NEW: {
                            this._raw_frameData = this._io.readBytesFull();
                            KaitaiStream _io__raw_frameData = new ByteBufferKaitaiStream(_raw_frameData);
                            this.frameData = new FdCurvesNew(_io__raw_frameData, this, _root);
                            break;
                        }
                        case CURVES: {
                            this._raw_frameData = this._io.readBytesFull();
                            KaitaiStream _io__raw_frameData = new ByteBufferKaitaiStream(_raw_frameData);
                            this.frameData = new FdSpectroscopy(_io__raw_frameData, this, _root);
                            break;
                        }
                        case SPECTROSCOPY: {
                            this._raw_frameData = this._io.readBytesFull();
                            KaitaiStream _io__raw_frameData = new ByteBufferKaitaiStream(_raw_frameData);
                            this.frameData = new FdSpectroscopy(_io__raw_frameData, this, _root);
                            break;
                        }
                        case SCANNED: {
                            this._raw_frameData = this._io.readBytesFull();
                            KaitaiStream _io__raw_frameData = new ByteBufferKaitaiStream(_raw_frameData);
                            this.frameData = new FdScanned(_io__raw_frameData, this, _root);
                            break;
                        }
                        default: {
                            this.frameData = this._io.readBytesFull();
                            break;
                        }
                        }
                    } else {
                        this.frameData = this._io.readBytesFull();
                    }
                }
            }
            private FrameType type;
            private Version version;
            private DateTime dateTime;
            private int varSize;
            private Object frameData;
            private NtMdt _root;
            private NtMdt.Frame _parent;
            private byte[] _raw_frameData;

            /**
             * h_what
             */
            public FrameType type() { return type; }
            public Version version() { return version; }
            public DateTime dateTime() { return dateTime; }

            /**
             * h_am, v6 and older only
             */
            public int varSize() { return varSize; }

            /**
             * 
             */
            public Object frameData() { return frameData; }
            public NtMdt _root() { return _root; }
            public NtMdt.Frame _parent() { return _parent; }
            public byte[] _raw_frameData() { return _raw_frameData; }
        }
        public static class FdCurvesNew extends KaitaiStruct {
            public static FdCurvesNew fromFile(String fileName) throws IOException {
                return new FdCurvesNew(new ByteBufferKaitaiStream(fileName));
            }

            public FdCurvesNew(KaitaiStream _io) {
                this(_io, null, null);
            }

            public FdCurvesNew(KaitaiStream _io, NtMdt.Frame.FrameMain _parent) {
                this(_io, _parent, null);
            }

            public FdCurvesNew(KaitaiStream _io, NtMdt.Frame.FrameMain _parent, NtMdt _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.blockCount = this._io.readU4le();
                blocksHeaders = new ArrayList<BlockDescr>(((Number) (blockCount())).intValue());
                for (int i = 0; i < blockCount(); i++) {
                    this.blocksHeaders.add(new BlockDescr(this._io, this, _root));
                }
                blocksNames = new ArrayList<String>(((Number) (blockCount())).intValue());
                for (int i = 0; i < blockCount(); i++) {
                    this.blocksNames.add(new String(this._io.readBytes(blocksHeaders().get((int) i).nameLen()), Charset.forName("UTF-8")));
                }
                blocksData = new ArrayList<byte[]>(((Number) (blockCount())).intValue());
                for (int i = 0; i < blockCount(); i++) {
                    this.blocksData.add(this._io.readBytes(blocksHeaders().get((int) i).len()));
                }
            }
            public static class BlockDescr extends KaitaiStruct {
                public static BlockDescr fromFile(String fileName) throws IOException {
                    return new BlockDescr(new ByteBufferKaitaiStream(fileName));
                }

                public BlockDescr(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public BlockDescr(KaitaiStream _io, NtMdt.Frame.FdCurvesNew _parent) {
                    this(_io, _parent, null);
                }

                public BlockDescr(KaitaiStream _io, NtMdt.Frame.FdCurvesNew _parent, NtMdt _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.nameLen = this._io.readU4le();
                    this.len = this._io.readU4le();
                }
                private long nameLen;
                private long len;
                private NtMdt _root;
                private NtMdt.Frame.FdCurvesNew _parent;
                public long nameLen() { return nameLen; }
                public long len() { return len; }
                public NtMdt _root() { return _root; }
                public NtMdt.Frame.FdCurvesNew _parent() { return _parent; }
            }
            private long blockCount;
            private ArrayList<BlockDescr> blocksHeaders;
            private ArrayList<String> blocksNames;
            private ArrayList<byte[]> blocksData;
            private NtMdt _root;
            private NtMdt.Frame.FrameMain _parent;
            public long blockCount() { return blockCount; }
            public ArrayList<BlockDescr> blocksHeaders() { return blocksHeaders; }
            public ArrayList<String> blocksNames() { return blocksNames; }
            public ArrayList<byte[]> blocksData() { return blocksData; }
            public NtMdt _root() { return _root; }
            public NtMdt.Frame.FrameMain _parent() { return _parent; }
        }
        public static class FdMetaData extends KaitaiStruct {
            public static FdMetaData fromFile(String fileName) throws IOException {
                return new FdMetaData(new ByteBufferKaitaiStream(fileName));
            }

            public FdMetaData(KaitaiStream _io) {
                this(_io, null, null);
            }

            public FdMetaData(KaitaiStream _io, NtMdt.Frame.FrameMain _parent) {
                this(_io, _parent, null);
            }

            public FdMetaData(KaitaiStream _io, NtMdt.Frame.FrameMain _parent, NtMdt _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.headSize = this._io.readU4le();
                this.totLen = this._io.readU4le();
                guids = new ArrayList<Uuid>(((Number) (2)).intValue());
                for (int i = 0; i < 2; i++) {
                    this.guids.add(new Uuid(this._io, this, _root));
                }
                this.frameStatus = this._io.readBytes(4);
                this.nameSize = this._io.readU4le();
                this.commSize = this._io.readU4le();
                this.viewInfoSize = this._io.readU4le();
                this.specSize = this._io.readU4le();
                this.sourceInfoSize = this._io.readU4le();
                this.varSize = this._io.readU4le();
                this.dataOffset = this._io.readU4le();
                this.dataSize = this._io.readU4le();
                this.title = new String(this._io.readBytes(nameSize()), Charset.forName("UTF-8"));
                this.xml = new String(this._io.readBytes(commSize()), Charset.forName("UTF-8"));
                this.structLen = this._io.readU4le();
                this.arraySize = this._io.readU8le();
                this.cellSize = this._io.readU4le();
                this.nDimensions = this._io.readU4le();
                this.nMesurands = this._io.readU4le();
                dimensions = new ArrayList<Calibration>(((Number) (nDimensions())).intValue());
                for (int i = 0; i < nDimensions(); i++) {
                    this.dimensions.add(new Calibration(this._io, this, _root));
                }
                mesurands = new ArrayList<Calibration>(((Number) (nMesurands())).intValue());
                for (int i = 0; i < nMesurands(); i++) {
                    this.mesurands.add(new Calibration(this._io, this, _root));
                }
            }
            public static class Image extends KaitaiStruct {
                public static Image fromFile(String fileName) throws IOException {
                    return new Image(new ByteBufferKaitaiStream(fileName));
                }

                public Image(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Image(KaitaiStream _io, NtMdt.Frame.FdMetaData _parent) {
                    this(_io, _parent, null);
                }

                public Image(KaitaiStream _io, NtMdt.Frame.FdMetaData _parent, NtMdt _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.image = new ArrayList<Vec>();
                    {
                        int i = 0;
                        while (!this._io.isEof()) {
                            this.image.add(new Vec(this._io, this, _root));
                            i++;
                        }
                    }
                }
                public static class Vec extends KaitaiStruct {
                    public static Vec fromFile(String fileName) throws IOException {
                        return new Vec(new ByteBufferKaitaiStream(fileName));
                    }

                    public Vec(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public Vec(KaitaiStream _io, NtMdt.Frame.FdMetaData.Image _parent) {
                        this(_io, _parent, null);
                    }

                    public Vec(KaitaiStream _io, NtMdt.Frame.FdMetaData.Image _parent, NtMdt _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                        _read();
                    }
                    private void _read() {
                        items = new ArrayList<Double>(((Number) (_parent()._parent().nMesurands())).intValue());
                        for (int i = 0; i < _parent()._parent().nMesurands(); i++) {
                            {
                                DataType on = _parent()._parent().mesurands().get((int) i).dataType();
                                if (on != null) {
                                    switch (_parent()._parent().mesurands().get((int) i).dataType()) {
                                    case UINT64: {
                                        this.items.add((double) (this._io.readU8le()));
                                        break;
                                    }
                                    case UINT8: {
                                        this.items.add((double) (this._io.readU1()));
                                        break;
                                    }
                                    case FLOAT32: {
                                        this.items.add((double) (this._io.readF4le()));
                                        break;
                                    }
                                    case INT8: {
                                        this.items.add((double) (this._io.readS1()));
                                        break;
                                    }
                                    case UINT16: {
                                        this.items.add((double) (this._io.readU2le()));
                                        break;
                                    }
                                    case INT64: {
                                        this.items.add((double) (this._io.readS8le()));
                                        break;
                                    }
                                    case UINT32: {
                                        this.items.add((double) (this._io.readU4le()));
                                        break;
                                    }
                                    case FLOAT64: {
                                        this.items.add((double) (this._io.readF8le()));
                                        break;
                                    }
                                    case INT16: {
                                        this.items.add((double) (this._io.readS2le()));
                                        break;
                                    }
                                    case INT32: {
                                        this.items.add((double) (this._io.readS4le()));
                                        break;
                                    }
                                    }
                                }
                            }
                        }
                    }
                    private ArrayList<Double> items;
                    private NtMdt _root;
                    private NtMdt.Frame.FdMetaData.Image _parent;
                    public ArrayList<Double> items() { return items; }
                    public NtMdt _root() { return _root; }
                    public NtMdt.Frame.FdMetaData.Image _parent() { return _parent; }
                }
                private ArrayList<Vec> image;
                private NtMdt _root;
                private NtMdt.Frame.FdMetaData _parent;
                public ArrayList<Vec> image() { return image; }
                public NtMdt _root() { return _root; }
                public NtMdt.Frame.FdMetaData _parent() { return _parent; }
            }
            public static class Calibration extends KaitaiStruct {
                public static Calibration fromFile(String fileName) throws IOException {
                    return new Calibration(new ByteBufferKaitaiStream(fileName));
                }

                public Calibration(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Calibration(KaitaiStream _io, NtMdt.Frame.FdMetaData _parent) {
                    this(_io, _parent, null);
                }

                public Calibration(KaitaiStream _io, NtMdt.Frame.FdMetaData _parent, NtMdt _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.lenTot = this._io.readU4le();
                    this.lenStruct = this._io.readU4le();
                    this.lenName = this._io.readU4le();
                    this.lenComment = this._io.readU4le();
                    this.lenUnit = this._io.readU4le();
                    this.siUnit = this._io.readU8le();
                    this.accuracy = this._io.readF8le();
                    this.functionIdAndDimensions = this._io.readU8le();
                    this.bias = this._io.readF8le();
                    this.scale = this._io.readF8le();
                    this.minIndex = this._io.readU8le();
                    this.maxIndex = this._io.readU8le();
                    this.dataType = NtMdt.DataType.byId(this._io.readS4le());
                    this.lenAuthor = this._io.readU4le();
                    this.name = new String(this._io.readBytes(lenName()), Charset.forName("utf-8"));
                    this.comment = new String(this._io.readBytes(lenComment()), Charset.forName("utf-8"));
                    this.unit = new String(this._io.readBytes(lenUnit()), Charset.forName("utf-8"));
                    this.author = new String(this._io.readBytes(lenAuthor()), Charset.forName("utf-8"));
                }
                private Integer count;
                public Integer count() {
                    if (this.count != null)
                        return this.count;
                    int _tmp = (int) (((maxIndex() - minIndex()) + 1));
                    this.count = _tmp;
                    return this.count;
                }
                private long lenTot;
                private long lenStruct;
                private long lenName;
                private long lenComment;
                private long lenUnit;
                private long siUnit;
                private double accuracy;
                private long functionIdAndDimensions;
                private double bias;
                private double scale;
                private long minIndex;
                private long maxIndex;
                private DataType dataType;
                private long lenAuthor;
                private String name;
                private String comment;
                private String unit;
                private String author;
                private NtMdt _root;
                private NtMdt.Frame.FdMetaData _parent;
                public long lenTot() { return lenTot; }
                public long lenStruct() { return lenStruct; }
                public long lenName() { return lenName; }
                public long lenComment() { return lenComment; }
                public long lenUnit() { return lenUnit; }
                public long siUnit() { return siUnit; }
                public double accuracy() { return accuracy; }
                public long functionIdAndDimensions() { return functionIdAndDimensions; }
                public double bias() { return bias; }
                public double scale() { return scale; }
                public long minIndex() { return minIndex; }
                public long maxIndex() { return maxIndex; }
                public DataType dataType() { return dataType; }
                public long lenAuthor() { return lenAuthor; }
                public String name() { return name; }
                public String comment() { return comment; }
                public String unit() { return unit; }
                public String author() { return author; }
                public NtMdt _root() { return _root; }
                public NtMdt.Frame.FdMetaData _parent() { return _parent; }
            }
            private Image image;
            public Image image() {
                if (this.image != null)
                    return this.image;
                long _pos = this._io.pos();
                this._io.seek(dataOffset());
                this._raw_image = this._io.readBytes(dataSize());
                KaitaiStream _io__raw_image = new ByteBufferKaitaiStream(_raw_image);
                this.image = new Image(_io__raw_image, this, _root);
                this._io.seek(_pos);
                return this.image;
            }
            private long headSize;
            private long totLen;
            private ArrayList<Uuid> guids;
            private byte[] frameStatus;
            private long nameSize;
            private long commSize;
            private long viewInfoSize;
            private long specSize;
            private long sourceInfoSize;
            private long varSize;
            private long dataOffset;
            private long dataSize;
            private String title;
            private String xml;
            private long structLen;
            private long arraySize;
            private long cellSize;
            private long nDimensions;
            private long nMesurands;
            private ArrayList<Calibration> dimensions;
            private ArrayList<Calibration> mesurands;
            private NtMdt _root;
            private NtMdt.Frame.FrameMain _parent;
            private byte[] _raw_image;
            public long headSize() { return headSize; }
            public long totLen() { return totLen; }
            public ArrayList<Uuid> guids() { return guids; }
            public byte[] frameStatus() { return frameStatus; }
            public long nameSize() { return nameSize; }
            public long commSize() { return commSize; }
            public long viewInfoSize() { return viewInfoSize; }
            public long specSize() { return specSize; }
            public long sourceInfoSize() { return sourceInfoSize; }
            public long varSize() { return varSize; }
            public long dataOffset() { return dataOffset; }
            public long dataSize() { return dataSize; }
            public String title() { return title; }
            public String xml() { return xml; }
            public long structLen() { return structLen; }
            public long arraySize() { return arraySize; }
            public long cellSize() { return cellSize; }
            public long nDimensions() { return nDimensions; }
            public long nMesurands() { return nMesurands; }
            public ArrayList<Calibration> dimensions() { return dimensions; }
            public ArrayList<Calibration> mesurands() { return mesurands; }
            public NtMdt _root() { return _root; }
            public NtMdt.Frame.FrameMain _parent() { return _parent; }
            public byte[] _raw_image() { return _raw_image; }
        }
        public static class FdSpectroscopy extends KaitaiStruct {
            public static FdSpectroscopy fromFile(String fileName) throws IOException {
                return new FdSpectroscopy(new ByteBufferKaitaiStream(fileName));
            }

            public FdSpectroscopy(KaitaiStream _io) {
                this(_io, null, null);
            }

            public FdSpectroscopy(KaitaiStream _io, NtMdt.Frame.FrameMain _parent) {
                this(_io, _parent, null);
            }

            public FdSpectroscopy(KaitaiStream _io, NtMdt.Frame.FrameMain _parent, NtMdt _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this._raw_vars = this._io.readBytes(_parent().varSize());
                KaitaiStream _io__raw_vars = new ByteBufferKaitaiStream(_raw_vars);
                this.vars = new Vars(_io__raw_vars, this, _root);
                this.fmMode = this._io.readU2le();
                this.fmXres = this._io.readU2le();
                this.fmYres = this._io.readU2le();
                this.dots = new Dots(this._io, this, _root);
                data = new ArrayList<Short>(((Number) ((fmXres() * fmYres()))).intValue());
                for (int i = 0; i < (fmXres() * fmYres()); i++) {
                    this.data.add(this._io.readS2le());
                }
                this.title = new Title(this._io, this, _root);
                this.xml = new Xml(this._io, this, _root);
            }
            public static class Vars extends KaitaiStruct {
                public static Vars fromFile(String fileName) throws IOException {
                    return new Vars(new ByteBufferKaitaiStream(fileName));
                }

                public Vars(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Vars(KaitaiStream _io, NtMdt.Frame.FdSpectroscopy _parent) {
                    this(_io, _parent, null);
                }

                public Vars(KaitaiStream _io, NtMdt.Frame.FdSpectroscopy _parent, NtMdt _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.xScale = new AxisScale(this._io, this, _root);
                    this.yScale = new AxisScale(this._io, this, _root);
                    this.zScale = new AxisScale(this._io, this, _root);
                    this.spMode = this._io.readU2le();
                    this.spFilter = this._io.readU2le();
                    this.uBegin = this._io.readF4le();
                    this.uEnd = this._io.readF4le();
                    this.zUp = this._io.readS2le();
                    this.zDown = this._io.readS2le();
                    this.spAveraging = this._io.readU2le();
                    this.spRepeat = this._io.readU1();
                    this.spBack = this._io.readU1();
                    this.sp4nx = this._io.readS2le();
                    this.spOsc = this._io.readU1();
                    this.spN4 = this._io.readU1();
                    this.sp4x0 = this._io.readF4le();
                    this.sp4xr = this._io.readF4le();
                    this.sp4u = this._io.readS2le();
                    this.sp4i = this._io.readS2le();
                    this.spNx = this._io.readS2le();
                }
                private AxisScale xScale;
                private AxisScale yScale;
                private AxisScale zScale;
                private int spMode;
                private int spFilter;
                private float uBegin;
                private float uEnd;
                private short zUp;
                private short zDown;
                private int spAveraging;
                private int spRepeat;
                private int spBack;
                private short sp4nx;
                private int spOsc;
                private int spN4;
                private float sp4x0;
                private float sp4xr;
                private short sp4u;
                private short sp4i;
                private short spNx;
                private NtMdt _root;
                private NtMdt.Frame.FdSpectroscopy _parent;
                public AxisScale xScale() { return xScale; }
                public AxisScale yScale() { return yScale; }
                public AxisScale zScale() { return zScale; }
                public int spMode() { return spMode; }
                public int spFilter() { return spFilter; }
                public float uBegin() { return uBegin; }
                public float uEnd() { return uEnd; }
                public short zUp() { return zUp; }
                public short zDown() { return zDown; }
                public int spAveraging() { return spAveraging; }
                public int spRepeat() { return spRepeat; }
                public int spBack() { return spBack; }
                public short sp4nx() { return sp4nx; }
                public int spOsc() { return spOsc; }
                public int spN4() { return spN4; }
                public float sp4x0() { return sp4x0; }
                public float sp4xr() { return sp4xr; }
                public short sp4u() { return sp4u; }
                public short sp4i() { return sp4i; }
                public short spNx() { return spNx; }
                public NtMdt _root() { return _root; }
                public NtMdt.Frame.FdSpectroscopy _parent() { return _parent; }
            }
            private Vars vars;
            private int fmMode;
            private int fmXres;
            private int fmYres;
            private Dots dots;
            private ArrayList<Short> data;
            private Title title;
            private Xml xml;
            private NtMdt _root;
            private NtMdt.Frame.FrameMain _parent;
            private byte[] _raw_vars;
            public Vars vars() { return vars; }
            public int fmMode() { return fmMode; }
            public int fmXres() { return fmXres; }
            public int fmYres() { return fmYres; }
            public Dots dots() { return dots; }
            public ArrayList<Short> data() { return data; }
            public Title title() { return title; }
            public Xml xml() { return xml; }
            public NtMdt _root() { return _root; }
            public NtMdt.Frame.FrameMain _parent() { return _parent; }
            public byte[] _raw_vars() { return _raw_vars; }
        }
        public static class DateTime extends KaitaiStruct {
            public static DateTime fromFile(String fileName) throws IOException {
                return new DateTime(new ByteBufferKaitaiStream(fileName));
            }

            public DateTime(KaitaiStream _io) {
                this(_io, null, null);
            }

            public DateTime(KaitaiStream _io, NtMdt.Frame.FrameMain _parent) {
                this(_io, _parent, null);
            }

            public DateTime(KaitaiStream _io, NtMdt.Frame.FrameMain _parent, NtMdt _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.date = new Date(this._io, this, _root);
                this.time = new Time(this._io, this, _root);
            }
            public static class Date extends KaitaiStruct {
                public static Date fromFile(String fileName) throws IOException {
                    return new Date(new ByteBufferKaitaiStream(fileName));
                }

                public Date(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Date(KaitaiStream _io, NtMdt.Frame.DateTime _parent) {
                    this(_io, _parent, null);
                }

                public Date(KaitaiStream _io, NtMdt.Frame.DateTime _parent, NtMdt _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.year = this._io.readU2le();
                    this.month = this._io.readU2le();
                    this.day = this._io.readU2le();
                }
                private int year;
                private int month;
                private int day;
                private NtMdt _root;
                private NtMdt.Frame.DateTime _parent;

                /**
                 * h_yea
                 */
                public int year() { return year; }

                /**
                 * h_mon
                 */
                public int month() { return month; }

                /**
                 * h_day
                 */
                public int day() { return day; }
                public NtMdt _root() { return _root; }
                public NtMdt.Frame.DateTime _parent() { return _parent; }
            }
            public static class Time extends KaitaiStruct {
                public static Time fromFile(String fileName) throws IOException {
                    return new Time(new ByteBufferKaitaiStream(fileName));
                }

                public Time(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Time(KaitaiStream _io, NtMdt.Frame.DateTime _parent) {
                    this(_io, _parent, null);
                }

                public Time(KaitaiStream _io, NtMdt.Frame.DateTime _parent, NtMdt _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.hour = this._io.readU2le();
                    this.min = this._io.readU2le();
                    this.sec = this._io.readU2le();
                }
                private int hour;
                private int min;
                private int sec;
                private NtMdt _root;
                private NtMdt.Frame.DateTime _parent;

                /**
                 * h_h
                 */
                public int hour() { return hour; }

                /**
                 * h_m
                 */
                public int min() { return min; }

                /**
                 * h_s
                 */
                public int sec() { return sec; }
                public NtMdt _root() { return _root; }
                public NtMdt.Frame.DateTime _parent() { return _parent; }
            }
            private Date date;
            private Time time;
            private NtMdt _root;
            private NtMdt.Frame.FrameMain _parent;
            public Date date() { return date; }
            public Time time() { return time; }
            public NtMdt _root() { return _root; }
            public NtMdt.Frame.FrameMain _parent() { return _parent; }
        }
        public static class AxisScale extends KaitaiStruct {
            public static AxisScale fromFile(String fileName) throws IOException {
                return new AxisScale(new ByteBufferKaitaiStream(fileName));
            }

            public AxisScale(KaitaiStream _io) {
                this(_io, null, null);
            }

            public AxisScale(KaitaiStream _io, KaitaiStruct _parent) {
                this(_io, _parent, null);
            }

            public AxisScale(KaitaiStream _io, KaitaiStruct _parent, NtMdt _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.offset = this._io.readF4le();
                this.step = this._io.readF4le();
                this.unit = NtMdt.Unit.byId(this._io.readS2le());
            }
            private float offset;
            private float step;
            private Unit unit;
            private NtMdt _root;
            private KaitaiStruct _parent;

            /**
             * x_scale->offset = gwy_get_gfloat_le(&p);# r0 (physical units)
             */
            public float offset() { return offset; }

            /**
             * x_scale->step = gwy_get_gfloat_le(&p); r (physical units) x_scale->step = fabs(x_scale->step); if (!x_scale->step) {
             *   g_warning("x_scale.step == 0, changing to 1");
             *   x_scale->step = 1.0;
             * }
             */
            public float step() { return step; }

            /**
             * U
             */
            public Unit unit() { return unit; }
            public NtMdt _root() { return _root; }
            public KaitaiStruct _parent() { return _parent; }
        }
        public static class FdScanned extends KaitaiStruct {
            public static FdScanned fromFile(String fileName) throws IOException {
                return new FdScanned(new ByteBufferKaitaiStream(fileName));
            }

            public enum Mode {
                STM(0),
                AFM(1),
                UNKNOWN2(2),
                UNKNOWN3(3),
                UNKNOWN4(4);

                private final long id;
                Mode(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, Mode> byId = new HashMap<Long, Mode>(5);
                static {
                    for (Mode e : Mode.values())
                        byId.put(e.id(), e);
                }
                public static Mode byId(long id) { return byId.get(id); }
            }

            public enum InputSignal {
                EXTENSION_SLOT(0),
                BIAS_V(1),
                GROUND(2);

                private final long id;
                InputSignal(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, InputSignal> byId = new HashMap<Long, InputSignal>(3);
                static {
                    for (InputSignal e : InputSignal.values())
                        byId.put(e.id(), e);
                }
                public static InputSignal byId(long id) { return byId.get(id); }
            }

            public enum LiftMode {
                STEP(0),
                FINE(1),
                SLOPE(2);

                private final long id;
                LiftMode(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, LiftMode> byId = new HashMap<Long, LiftMode>(3);
                static {
                    for (LiftMode e : LiftMode.values())
                        byId.put(e.id(), e);
                }
                public static LiftMode byId(long id) { return byId.get(id); }
            }

            public FdScanned(KaitaiStream _io) {
                this(_io, null, null);
            }

            public FdScanned(KaitaiStream _io, NtMdt.Frame.FrameMain _parent) {
                this(_io, _parent, null);
            }

            public FdScanned(KaitaiStream _io, NtMdt.Frame.FrameMain _parent, NtMdt _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this._raw_vars = this._io.readBytes(_parent().varSize());
                KaitaiStream _io__raw_vars = new ByteBufferKaitaiStream(_raw_vars);
                this.vars = new Vars(_io__raw_vars, this, _root);
                if (false) {
                    this.origFormat = this._io.readU4le();
                }
                if (false) {
                    this.tune = LiftMode.byId(this._io.readU4le());
                }
                if (false) {
                    this.feedbackGain = this._io.readF8le();
                }
                if (false) {
                    this.dacScale = this._io.readS4le();
                }
                if (false) {
                    this.overscan = this._io.readS4le();
                }
                this.fmMode = this._io.readU2le();
                this.fmXres = this._io.readU2le();
                this.fmYres = this._io.readU2le();
                this.dots = new Dots(this._io, this, _root);
                image = new ArrayList<Short>(((Number) ((fmXres() * fmYres()))).intValue());
                for (int i = 0; i < (fmXres() * fmYres()); i++) {
                    this.image.add(this._io.readS2le());
                }
                this.title = new Title(this._io, this, _root);
                this.xml = new Xml(this._io, this, _root);
            }
            public static class Vars extends KaitaiStruct {
                public static Vars fromFile(String fileName) throws IOException {
                    return new Vars(new ByteBufferKaitaiStream(fileName));
                }

                public Vars(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Vars(KaitaiStream _io, NtMdt.Frame.FdScanned _parent) {
                    this(_io, _parent, null);
                }

                public Vars(KaitaiStream _io, NtMdt.Frame.FdScanned _parent, NtMdt _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.xScale = new AxisScale(this._io, this, _root);
                    this.yScale = new AxisScale(this._io, this, _root);
                    this.zScale = new AxisScale(this._io, this, _root);
                    this.channelIndex = NtMdt.AdcMode.byId(this._io.readU1());
                    this.mode = NtMdt.Frame.FdScanned.Mode.byId(this._io.readU1());
                    this.xres = this._io.readU2le();
                    this.yres = this._io.readU2le();
                    this.ndacq = this._io.readU2le();
                    this.stepLength = this._io.readF4le();
                    this.adt = this._io.readU2le();
                    this.adcGainAmpLog10 = this._io.readU1();
                    this.adcIndex = this._io.readU1();
                    this.inputSignalOrVersion = this._io.readU1();
                    this.substrPlaneOrderOrPassNum = this._io.readU1();
                    this.scanDir = new ScanDir(this._io, this, _root);
                    this.powerOf2 = this._io.readU1();
                    this.velocity = this._io.readF4le();
                    this.setpoint = this._io.readF4le();
                    this.biasVoltage = this._io.readF4le();
                    this.draw = this._io.readU1();
                    this.reserved = this._io.readU1();
                    this.xoff = this._io.readS4le();
                    this.yoff = this._io.readS4le();
                    this.nlCorr = this._io.readU1();
                }
                private AxisScale xScale;
                private AxisScale yScale;
                private AxisScale zScale;
                private AdcMode channelIndex;
                private Mode mode;
                private int xres;
                private int yres;
                private int ndacq;
                private float stepLength;
                private int adt;
                private int adcGainAmpLog10;
                private int adcIndex;
                private int inputSignalOrVersion;
                private int substrPlaneOrderOrPassNum;
                private ScanDir scanDir;
                private int powerOf2;
                private float velocity;
                private float setpoint;
                private float biasVoltage;
                private int draw;
                private int reserved;
                private int xoff;
                private int yoff;
                private int nlCorr;
                private NtMdt _root;
                private NtMdt.Frame.FdScanned _parent;
                public AxisScale xScale() { return xScale; }
                public AxisScale yScale() { return yScale; }
                public AxisScale zScale() { return zScale; }

                /**
                 * s_mode
                 */
                public AdcMode channelIndex() { return channelIndex; }

                /**
                 * s_dev
                 */
                public Mode mode() { return mode; }

                /**
                 * s_nx
                 */
                public int xres() { return xres; }

                /**
                 * s_ny
                 */
                public int yres() { return yres; }

                /**
                 * Step (DAC)
                 */
                public int ndacq() { return ndacq; }

                /**
                 * s_rs in Angstrom's (Angstrom*gwy_get_gfloat_le(&p))
                 */
                public float stepLength() { return stepLength; }

                /**
                 * s_adt
                 */
                public int adt() { return adt; }

                /**
                 * s_adc_a
                 */
                public int adcGainAmpLog10() { return adcGainAmpLog10; }

                /**
                 * ADC index
                 */
                public int adcIndex() { return adcIndex; }

                /**
                 * MDTInputSignal smp_in; s_smp_in (for signal) s_8xx (for version)
                 */
                public int inputSignalOrVersion() { return inputSignalOrVersion; }

                /**
                 * s_spl or z_03
                 */
                public int substrPlaneOrderOrPassNum() { return substrPlaneOrderOrPassNum; }

                /**
                 * s_xy TODO: interpretation
                 */
                public ScanDir scanDir() { return scanDir; }

                /**
                 * s_2n (bool)
                 */
                public int powerOf2() { return powerOf2; }

                /**
                 * s_vel (Angstrom/second)
                 */
                public float velocity() { return velocity; }

                /**
                 * s_i0
                 */
                public float setpoint() { return setpoint; }

                /**
                 * s_ut
                 */
                public float biasVoltage() { return biasVoltage; }

                /**
                 * s_draw (bool)
                 */
                public int draw() { return draw; }
                public int reserved() { return reserved; }

                /**
                 * s_x00 (in DAC quants)
                 */
                public int xoff() { return xoff; }

                /**
                 * s_y00 (in DAC quants)
                 */
                public int yoff() { return yoff; }

                /**
                 * s_cor (bool)
                 */
                public int nlCorr() { return nlCorr; }
                public NtMdt _root() { return _root; }
                public NtMdt.Frame.FdScanned _parent() { return _parent; }
            }
            public static class Dot extends KaitaiStruct {
                public static Dot fromFile(String fileName) throws IOException {
                    return new Dot(new ByteBufferKaitaiStream(fileName));
                }

                public Dot(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Dot(KaitaiStream _io, KaitaiStruct _parent) {
                    this(_io, _parent, null);
                }

                public Dot(KaitaiStream _io, KaitaiStruct _parent, NtMdt _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.x = this._io.readS2le();
                    this.y = this._io.readS2le();
                }
                private short x;
                private short y;
                private NtMdt _root;
                private KaitaiStruct _parent;
                public short x() { return x; }
                public short y() { return y; }
                public NtMdt _root() { return _root; }
                public KaitaiStruct _parent() { return _parent; }
            }
            public static class ScanDir extends KaitaiStruct {
                public static ScanDir fromFile(String fileName) throws IOException {
                    return new ScanDir(new ByteBufferKaitaiStream(fileName));
                }

                public ScanDir(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ScanDir(KaitaiStream _io, NtMdt.Frame.FdScanned.Vars _parent) {
                    this(_io, _parent, null);
                }

                public ScanDir(KaitaiStream _io, NtMdt.Frame.FdScanned.Vars _parent, NtMdt _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.unkn = this._io.readBitsInt(4);
                    this.doublePass = this._io.readBitsInt(1) != 0;
                    this.bottom = this._io.readBitsInt(1) != 0;
                    this.left = this._io.readBitsInt(1) != 0;
                    this.horizontal = this._io.readBitsInt(1) != 0;
                }
                private long unkn;
                private boolean doublePass;
                private boolean bottom;
                private boolean left;
                private boolean horizontal;
                private NtMdt _root;
                private NtMdt.Frame.FdScanned.Vars _parent;
                public long unkn() { return unkn; }
                public boolean doublePass() { return doublePass; }

                /**
                 * Bottom - 1 Top - 0
                 */
                public boolean bottom() { return bottom; }

                /**
                 * Left - 1 Right - 0
                 */
                public boolean left() { return left; }

                /**
                 * Horizontal - 1 Vertical - 0
                 */
                public boolean horizontal() { return horizontal; }
                public NtMdt _root() { return _root; }
                public NtMdt.Frame.FdScanned.Vars _parent() { return _parent; }
            }
            private Vars vars;
            private Long origFormat;
            private LiftMode tune;
            private Double feedbackGain;
            private Integer dacScale;
            private Integer overscan;
            private int fmMode;
            private int fmXres;
            private int fmYres;
            private Dots dots;
            private ArrayList<Short> image;
            private Title title;
            private Xml xml;
            private NtMdt _root;
            private NtMdt.Frame.FrameMain _parent;
            private byte[] _raw_vars;
            public Vars vars() { return vars; }

            /**
             * s_oem
             */
            public Long origFormat() { return origFormat; }

            /**
             * z_tune
             */
            public LiftMode tune() { return tune; }

            /**
             * s_fbg
             */
            public Double feedbackGain() { return feedbackGain; }

            /**
             * s_s
             */
            public Integer dacScale() { return dacScale; }

            /**
             * s_xov (in %)
             */
            public Integer overscan() { return overscan; }

            /**
             * m_mode
             */
            public int fmMode() { return fmMode; }

            /**
             * m_nx
             */
            public int fmXres() { return fmXres; }

            /**
             * m_ny
             */
            public int fmYres() { return fmYres; }
            public Dots dots() { return dots; }
            public ArrayList<Short> image() { return image; }
            public Title title() { return title; }
            public Xml xml() { return xml; }
            public NtMdt _root() { return _root; }
            public NtMdt.Frame.FrameMain _parent() { return _parent; }
            public byte[] _raw_vars() { return _raw_vars; }
        }
        private long size;
        private FrameMain main;
        private NtMdt _root;
        private NtMdt.Framez _parent;
        private byte[] _raw_main;

        /**
         * h_sz
         */
        public long size() { return size; }
        public FrameMain main() { return main; }
        public NtMdt _root() { return _root; }
        public NtMdt.Framez _parent() { return _parent; }
        public byte[] _raw_main() { return _raw_main; }
    }
    public static class Version extends KaitaiStruct {
        public static Version fromFile(String fileName) throws IOException {
            return new Version(new ByteBufferKaitaiStream(fileName));
        }

        public Version(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Version(KaitaiStream _io, NtMdt.Frame.FrameMain _parent) {
            this(_io, _parent, null);
        }

        public Version(KaitaiStream _io, NtMdt.Frame.FrameMain _parent, NtMdt _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.minor = this._io.readU1();
            this.major = this._io.readU1();
        }
        private int minor;
        private int major;
        private NtMdt _root;
        private NtMdt.Frame.FrameMain _parent;
        public int minor() { return minor; }
        public int major() { return major; }
        public NtMdt _root() { return _root; }
        public NtMdt.Frame.FrameMain _parent() { return _parent; }
    }
    public static class Xml extends KaitaiStruct {
        public static Xml fromFile(String fileName) throws IOException {
            return new Xml(new ByteBufferKaitaiStream(fileName));
        }

        public Xml(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Xml(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Xml(KaitaiStream _io, KaitaiStruct _parent, NtMdt _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.xmlLen = this._io.readU4le();
            this.xml = new String(this._io.readBytes(xmlLen()), Charset.forName("UTF-16LE"));
        }
        private long xmlLen;
        private String xml;
        private NtMdt _root;
        private KaitaiStruct _parent;
        public long xmlLen() { return xmlLen; }
        public String xml() { return xml; }
        public NtMdt _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class Title extends KaitaiStruct {
        public static Title fromFile(String fileName) throws IOException {
            return new Title(new ByteBufferKaitaiStream(fileName));
        }

        public Title(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Title(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Title(KaitaiStream _io, KaitaiStruct _parent, NtMdt _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.titleLen = this._io.readU4le();
            this.title = new String(this._io.readBytes(titleLen()), Charset.forName("cp1251"));
        }
        private long titleLen;
        private String title;
        private NtMdt _root;
        private KaitaiStruct _parent;
        public long titleLen() { return titleLen; }
        public String title() { return title; }
        public NtMdt _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    private byte[] signature;
    private long size;
    private byte[] reserved0;
    private int lastFrame;
    private byte[] reserved1;
    private byte[] wrondDoc;
    private Framez frames;
    private NtMdt _root;
    private KaitaiStruct _parent;
    private byte[] _raw_frames;
    public byte[] signature() { return signature; }

    /**
     * File size (w/o header)
     */
    public long size() { return size; }
    public byte[] reserved0() { return reserved0; }
    public int lastFrame() { return lastFrame; }
    public byte[] reserved1() { return reserved1; }

    /**
     * documentation specifies 32 bytes long header, but zeroth frame starts at 33th byte in reality
     */
    public byte[] wrondDoc() { return wrondDoc; }
    public Framez frames() { return frames; }
    public NtMdt _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_frames() { return _raw_frames; }
}
