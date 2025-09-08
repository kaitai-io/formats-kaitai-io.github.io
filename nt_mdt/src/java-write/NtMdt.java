// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;
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
 * * <https://www.ntmdt-si.ru/resources/scan-gallery>
 * * <http://callistosoft.narod.ru/Resources/Mdt.zip>
 * @see <a href="https://svn.code.sf.net/p/gwyddion/code/trunk/gwyddion/modules/file/nt-mdt.c">Source</a>
 */
public class NtMdt extends KaitaiStruct.ReadWrite {
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
    public NtMdt() {
        this(null, null, null);
    }

    public NtMdt(KaitaiStream _io) {
        this(_io, null, null);
    }

    public NtMdt(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public NtMdt(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, NtMdt _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.signature = this._io.readBytes(4);
        if (!(Arrays.equals(this.signature, new byte[] { 1, -80, -109, -1 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 1, -80, -109, -1 }, this.signature, this._io, "/seq/0");
        }
        this.size = this._io.readU4le();
        this.reserved0 = this._io.readBytes(4);
        this.lastFrame = this._io.readU2le();
        this.reserved1 = this._io.readBytes(18);
        this.wrondDoc = this._io.readBytes(1);
        this._raw_frames = this._io.readBytes(size());
        KaitaiStream _io__raw_frames = new ByteBufferKaitaiStream(this._raw_frames);
        this.frames = new Framez(_io__raw_frames, this, _root);
        this.frames._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.frames._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.signature);
        this._io.writeU4le(this.size);
        this._io.writeBytes(this.reserved0);
        this._io.writeU2le(this.lastFrame);
        this._io.writeBytes(this.reserved1);
        this._io.writeBytes(this.wrondDoc);
        final KaitaiStream _io__raw_frames = new ByteBufferKaitaiStream(size());
        this._io.addChildStream(_io__raw_frames);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (size()));
            final NtMdt _this = this;
            _io__raw_frames.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_frames = _io__raw_frames.toByteArray();
                    if (_this._raw_frames.length != size())
                        throw new ConsistencyError("raw(frames)", size(), _this._raw_frames.length);
                    parent.writeBytes(_this._raw_frames);
                }
            });
        }
        this.frames._write_Seq(_io__raw_frames);
    }

    public void _check() {
        if (this.signature.length != 4)
            throw new ConsistencyError("signature", 4, this.signature.length);
        if (!(Arrays.equals(this.signature, new byte[] { 1, -80, -109, -1 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 1, -80, -109, -1 }, this.signature, null, "/seq/0");
        }
        if (this.reserved0.length != 4)
            throw new ConsistencyError("reserved0", 4, this.reserved0.length);
        if (this.reserved1.length != 18)
            throw new ConsistencyError("reserved1", 18, this.reserved1.length);
        if (this.wrondDoc.length != 1)
            throw new ConsistencyError("wrond_doc", 1, this.wrondDoc.length);
        if (!Objects.equals(this.frames._root(), _root()))
            throw new ConsistencyError("frames", _root(), this.frames._root());
        if (!Objects.equals(this.frames._parent(), this))
            throw new ConsistencyError("frames", this, this.frames._parent());
        _dirty = false;
    }
    public static class Frame extends KaitaiStruct.ReadWrite {
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
        public Frame() {
            this(null, null, null);
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
        }
        public void _read() {
            this.size = this._io.readU4le();
            this._raw_main = this._io.readBytes(size() - 4);
            KaitaiStream _io__raw_main = new ByteBufferKaitaiStream(this._raw_main);
            this.main = new FrameMain(_io__raw_main, this, _root);
            this.main._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.main._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.size);
            final KaitaiStream _io__raw_main = new ByteBufferKaitaiStream(size() - 4);
            this._io.addChildStream(_io__raw_main);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (size() - 4));
                final Frame _this = this;
                _io__raw_main.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_main = _io__raw_main.toByteArray();
                        if (_this._raw_main.length != size() - 4)
                            throw new ConsistencyError("raw(main)", size() - 4, _this._raw_main.length);
                        parent.writeBytes(_this._raw_main);
                    }
                });
            }
            this.main._write_Seq(_io__raw_main);
        }

        public void _check() {
            if (!Objects.equals(this.main._root(), _root()))
                throw new ConsistencyError("main", _root(), this.main._root());
            if (!Objects.equals(this.main._parent(), this))
                throw new ConsistencyError("main", this, this.main._parent());
            _dirty = false;
        }
        public static class AxisScale extends KaitaiStruct.ReadWrite {
            public static AxisScale fromFile(String fileName) throws IOException {
                return new AxisScale(new ByteBufferKaitaiStream(fileName));
            }
            public AxisScale() {
                this(null, null, null);
            }

            public AxisScale(KaitaiStream _io) {
                this(_io, null, null);
            }

            public AxisScale(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                this(_io, _parent, null);
            }

            public AxisScale(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, NtMdt _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.offset = this._io.readF4le();
                this.step = this._io.readF4le();
                this.unit = NtMdt.Unit.byId(this._io.readS2le());
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeF4le(this.offset);
                this._io.writeF4le(this.step);
                this._io.writeS2le(((Number) (this.unit.id())).shortValue());
            }

            public void _check() {
                _dirty = false;
            }
            private float offset;
            private float step;
            private Unit unit;
            private NtMdt _root;
            private KaitaiStruct.ReadWrite _parent;

            /**
             * x_scale->offset = gwy_get_gfloat_le(&p);# r0 (physical units)
             */
            public float offset() { return offset; }
            public void setOffset(float _v) { _dirty = true; offset = _v; }

            /**
             * x_scale->step = gwy_get_gfloat_le(&p); r (physical units) x_scale->step = fabs(x_scale->step); if (!x_scale->step) {
             *   g_warning("x_scale.step == 0, changing to 1");
             *   x_scale->step = 1.0;
             * }
             */
            public float step() { return step; }
            public void setStep(float _v) { _dirty = true; step = _v; }

            /**
             * U
             */
            public Unit unit() { return unit; }
            public void setUnit(Unit _v) { _dirty = true; unit = _v; }
            public NtMdt _root() { return _root; }
            public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
            public KaitaiStruct.ReadWrite _parent() { return _parent; }
            public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        }
        public static class DateTime extends KaitaiStruct.ReadWrite {
            public static DateTime fromFile(String fileName) throws IOException {
                return new DateTime(new ByteBufferKaitaiStream(fileName));
            }
            public DateTime() {
                this(null, null, null);
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
            }
            public void _read() {
                this.date = new Date(this._io, this, _root);
                this.date._read();
                this.time = new Time(this._io, this, _root);
                this.time._read();
                _dirty = false;
            }

            public void _fetchInstances() {
                this.date._fetchInstances();
                this.time._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();
                this.date._write_Seq(this._io);
                this.time._write_Seq(this._io);
            }

            public void _check() {
                if (!Objects.equals(this.date._root(), _root()))
                    throw new ConsistencyError("date", _root(), this.date._root());
                if (!Objects.equals(this.date._parent(), this))
                    throw new ConsistencyError("date", this, this.date._parent());
                if (!Objects.equals(this.time._root(), _root()))
                    throw new ConsistencyError("time", _root(), this.time._root());
                if (!Objects.equals(this.time._parent(), this))
                    throw new ConsistencyError("time", this, this.time._parent());
                _dirty = false;
            }
            public static class Date extends KaitaiStruct.ReadWrite {
                public static Date fromFile(String fileName) throws IOException {
                    return new Date(new ByteBufferKaitaiStream(fileName));
                }
                public Date() {
                    this(null, null, null);
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
                }
                public void _read() {
                    this.year = this._io.readU2le();
                    this.month = this._io.readU2le();
                    this.day = this._io.readU2le();
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU2le(this.year);
                    this._io.writeU2le(this.month);
                    this._io.writeU2le(this.day);
                }

                public void _check() {
                    _dirty = false;
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
                public void setYear(int _v) { _dirty = true; year = _v; }

                /**
                 * h_mon
                 */
                public int month() { return month; }
                public void setMonth(int _v) { _dirty = true; month = _v; }

                /**
                 * h_day
                 */
                public int day() { return day; }
                public void setDay(int _v) { _dirty = true; day = _v; }
                public NtMdt _root() { return _root; }
                public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
                public NtMdt.Frame.DateTime _parent() { return _parent; }
                public void set_parent(NtMdt.Frame.DateTime _v) { _dirty = true; _parent = _v; }
            }
            public static class Time extends KaitaiStruct.ReadWrite {
                public static Time fromFile(String fileName) throws IOException {
                    return new Time(new ByteBufferKaitaiStream(fileName));
                }
                public Time() {
                    this(null, null, null);
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
                }
                public void _read() {
                    this.hour = this._io.readU2le();
                    this.min = this._io.readU2le();
                    this.sec = this._io.readU2le();
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU2le(this.hour);
                    this._io.writeU2le(this.min);
                    this._io.writeU2le(this.sec);
                }

                public void _check() {
                    _dirty = false;
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
                public void setHour(int _v) { _dirty = true; hour = _v; }

                /**
                 * h_m
                 */
                public int min() { return min; }
                public void setMin(int _v) { _dirty = true; min = _v; }

                /**
                 * h_s
                 */
                public int sec() { return sec; }
                public void setSec(int _v) { _dirty = true; sec = _v; }
                public NtMdt _root() { return _root; }
                public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
                public NtMdt.Frame.DateTime _parent() { return _parent; }
                public void set_parent(NtMdt.Frame.DateTime _v) { _dirty = true; _parent = _v; }
            }
            private Date date;
            private Time time;
            private NtMdt _root;
            private NtMdt.Frame.FrameMain _parent;
            public Date date() { return date; }
            public void setDate(Date _v) { _dirty = true; date = _v; }
            public Time time() { return time; }
            public void setTime(Time _v) { _dirty = true; time = _v; }
            public NtMdt _root() { return _root; }
            public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
            public NtMdt.Frame.FrameMain _parent() { return _parent; }
            public void set_parent(NtMdt.Frame.FrameMain _v) { _dirty = true; _parent = _v; }
        }
        public static class Dots extends KaitaiStruct.ReadWrite {
            public static Dots fromFile(String fileName) throws IOException {
                return new Dots(new ByteBufferKaitaiStream(fileName));
            }
            public Dots() {
                this(null, null, null);
            }

            public Dots(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Dots(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                this(_io, _parent, null);
            }

            public Dots(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, NtMdt _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.fmNdots = this._io.readU2le();
                if (fmNdots() > 0) {
                    this.coordHeader = new DotsHeader(this._io, this, _root);
                    this.coordHeader._read();
                }
                this.coordinates = new ArrayList<DotsData>();
                for (int i = 0; i < fmNdots(); i++) {
                    DotsData _t_coordinates = new DotsData(this._io, this, _root);
                    try {
                        _t_coordinates._read();
                    } finally {
                        this.coordinates.add(_t_coordinates);
                    }
                }
                this.data = new ArrayList<DataLinez>();
                for (int i = 0; i < fmNdots(); i++) {
                    DataLinez _t_data = new DataLinez(this._io, this, _root, i);
                    try {
                        _t_data._read();
                    } finally {
                        this.data.add(_t_data);
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                if (fmNdots() > 0) {
                    this.coordHeader._fetchInstances();
                }
                for (int i = 0; i < this.coordinates.size(); i++) {
                    this.coordinates.get(((Number) (i)).intValue())._fetchInstances();
                }
                for (int i = 0; i < this.data.size(); i++) {
                    this.data.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2le(this.fmNdots);
                if (fmNdots() > 0) {
                    this.coordHeader._write_Seq(this._io);
                }
                for (int i = 0; i < this.coordinates.size(); i++) {
                    this.coordinates.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                for (int i = 0; i < this.data.size(); i++) {
                    this.data.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            public void _check() {
                if (fmNdots() > 0) {
                    if (!Objects.equals(this.coordHeader._root(), _root()))
                        throw new ConsistencyError("coord_header", _root(), this.coordHeader._root());
                    if (!Objects.equals(this.coordHeader._parent(), this))
                        throw new ConsistencyError("coord_header", this, this.coordHeader._parent());
                }
                if (this.coordinates.size() != fmNdots())
                    throw new ConsistencyError("coordinates", fmNdots(), this.coordinates.size());
                for (int i = 0; i < this.coordinates.size(); i++) {
                    if (!Objects.equals(this.coordinates.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("coordinates", _root(), this.coordinates.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.coordinates.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("coordinates", this, this.coordinates.get(((Number) (i)).intValue())._parent());
                }
                if (this.data.size() != fmNdots())
                    throw new ConsistencyError("data", fmNdots(), this.data.size());
                for (int i = 0; i < this.data.size(); i++) {
                    if (!Objects.equals(this.data.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("data", _root(), this.data.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.data.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("data", this, this.data.get(((Number) (i)).intValue())._parent());
                    if (this.data.get(((Number) (i)).intValue()).index() != i)
                        throw new ConsistencyError("data", i, this.data.get(((Number) (i)).intValue()).index());
                }
                _dirty = false;
            }
            public static class DataLinez extends KaitaiStruct.ReadWrite {
                public DataLinez(int index) {
                    this(null, null, null, index);
                }

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
                }
                public void _read() {
                    this.forward = new ArrayList<Short>();
                    for (int i = 0; i < _parent().coordinates().get(((Number) (index())).intValue()).forwardSize(); i++) {
                        this.forward.add(this._io.readS2le());
                    }
                    this.backward = new ArrayList<Short>();
                    for (int i = 0; i < _parent().coordinates().get(((Number) (index())).intValue()).backwardSize(); i++) {
                        this.backward.add(this._io.readS2le());
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.forward.size(); i++) {
                    }
                    for (int i = 0; i < this.backward.size(); i++) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    for (int i = 0; i < this.forward.size(); i++) {
                        this._io.writeS2le(this.forward.get(((Number) (i)).intValue()));
                    }
                    for (int i = 0; i < this.backward.size(); i++) {
                        this._io.writeS2le(this.backward.get(((Number) (i)).intValue()));
                    }
                }

                public void _check() {
                    if (this.forward.size() != _parent().coordinates().get(((Number) (index())).intValue()).forwardSize())
                        throw new ConsistencyError("forward", _parent().coordinates().get(((Number) (index())).intValue()).forwardSize(), this.forward.size());
                    for (int i = 0; i < this.forward.size(); i++) {
                    }
                    if (this.backward.size() != _parent().coordinates().get(((Number) (index())).intValue()).backwardSize())
                        throw new ConsistencyError("backward", _parent().coordinates().get(((Number) (index())).intValue()).backwardSize(), this.backward.size());
                    for (int i = 0; i < this.backward.size(); i++) {
                    }
                    _dirty = false;
                }
                private List<Short> forward;
                private List<Short> backward;
                private int index;
                private NtMdt _root;
                private NtMdt.Frame.Dots _parent;
                public List<Short> forward() { return forward; }
                public void setForward(List<Short> _v) { _dirty = true; forward = _v; }
                public List<Short> backward() { return backward; }
                public void setBackward(List<Short> _v) { _dirty = true; backward = _v; }
                public int index() { return index; }
                public void setIndex(int _v) { _dirty = true; index = _v; }
                public NtMdt _root() { return _root; }
                public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
                public NtMdt.Frame.Dots _parent() { return _parent; }
                public void set_parent(NtMdt.Frame.Dots _v) { _dirty = true; _parent = _v; }
            }
            public static class DotsData extends KaitaiStruct.ReadWrite {
                public static DotsData fromFile(String fileName) throws IOException {
                    return new DotsData(new ByteBufferKaitaiStream(fileName));
                }
                public DotsData() {
                    this(null, null, null);
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
                }
                public void _read() {
                    this.coordX = this._io.readF4le();
                    this.coordY = this._io.readF4le();
                    this.forwardSize = this._io.readS4le();
                    this.backwardSize = this._io.readS4le();
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeF4le(this.coordX);
                    this._io.writeF4le(this.coordY);
                    this._io.writeS4le(this.forwardSize);
                    this._io.writeS4le(this.backwardSize);
                }

                public void _check() {
                    _dirty = false;
                }
                private float coordX;
                private float coordY;
                private int forwardSize;
                private int backwardSize;
                private NtMdt _root;
                private NtMdt.Frame.Dots _parent;
                public float coordX() { return coordX; }
                public void setCoordX(float _v) { _dirty = true; coordX = _v; }
                public float coordY() { return coordY; }
                public void setCoordY(float _v) { _dirty = true; coordY = _v; }
                public int forwardSize() { return forwardSize; }
                public void setForwardSize(int _v) { _dirty = true; forwardSize = _v; }
                public int backwardSize() { return backwardSize; }
                public void setBackwardSize(int _v) { _dirty = true; backwardSize = _v; }
                public NtMdt _root() { return _root; }
                public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
                public NtMdt.Frame.Dots _parent() { return _parent; }
                public void set_parent(NtMdt.Frame.Dots _v) { _dirty = true; _parent = _v; }
            }
            public static class DotsHeader extends KaitaiStruct.ReadWrite {
                public static DotsHeader fromFile(String fileName) throws IOException {
                    return new DotsHeader(new ByteBufferKaitaiStream(fileName));
                }
                public DotsHeader() {
                    this(null, null, null);
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
                }
                public void _read() {
                    this.headerSize = this._io.readS4le();
                    this._raw_header = this._io.readBytes(headerSize());
                    KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(this._raw_header);
                    this.header = new Header(_io__raw_header, this, _root);
                    this.header._read();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.header._fetchInstances();
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeS4le(this.headerSize);
                    final KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(headerSize());
                    this._io.addChildStream(_io__raw_header);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (headerSize()));
                        final DotsHeader _this = this;
                        _io__raw_header.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_header = _io__raw_header.toByteArray();
                                if (_this._raw_header.length != headerSize())
                                    throw new ConsistencyError("raw(header)", headerSize(), _this._raw_header.length);
                                parent.writeBytes(_this._raw_header);
                            }
                        });
                    }
                    this.header._write_Seq(_io__raw_header);
                }

                public void _check() {
                    if (!Objects.equals(this.header._root(), _root()))
                        throw new ConsistencyError("header", _root(), this.header._root());
                    if (!Objects.equals(this.header._parent(), this))
                        throw new ConsistencyError("header", this, this.header._parent());
                    _dirty = false;
                }
                public static class Header extends KaitaiStruct.ReadWrite {
                    public static Header fromFile(String fileName) throws IOException {
                        return new Header(new ByteBufferKaitaiStream(fileName));
                    }
                    public Header() {
                        this(null, null, null);
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
                    }
                    public void _read() {
                        this.coordSize = this._io.readS4le();
                        this.version = this._io.readS4le();
                        this.xyunits = NtMdt.Unit.byId(this._io.readS2le());
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this._io.writeS4le(this.coordSize);
                        this._io.writeS4le(this.version);
                        this._io.writeS2le(((Number) (this.xyunits.id())).shortValue());
                    }

                    public void _check() {
                        _dirty = false;
                    }
                    private int coordSize;
                    private int version;
                    private Unit xyunits;
                    private NtMdt _root;
                    private NtMdt.Frame.Dots.DotsHeader _parent;
                    public int coordSize() { return coordSize; }
                    public void setCoordSize(int _v) { _dirty = true; coordSize = _v; }
                    public int version() { return version; }
                    public void setVersion(int _v) { _dirty = true; version = _v; }
                    public Unit xyunits() { return xyunits; }
                    public void setXyunits(Unit _v) { _dirty = true; xyunits = _v; }
                    public NtMdt _root() { return _root; }
                    public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
                    public NtMdt.Frame.Dots.DotsHeader _parent() { return _parent; }
                    public void set_parent(NtMdt.Frame.Dots.DotsHeader _v) { _dirty = true; _parent = _v; }
                }
                private int headerSize;
                private Header header;
                private NtMdt _root;
                private NtMdt.Frame.Dots _parent;
                private byte[] _raw_header;
                public int headerSize() { return headerSize; }
                public void setHeaderSize(int _v) { _dirty = true; headerSize = _v; }
                public Header header() { return header; }
                public void setHeader(Header _v) { _dirty = true; header = _v; }
                public NtMdt _root() { return _root; }
                public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
                public NtMdt.Frame.Dots _parent() { return _parent; }
                public void set_parent(NtMdt.Frame.Dots _v) { _dirty = true; _parent = _v; }
                public byte[] _raw_header() { return _raw_header; }
                public void set_raw_Header(byte[] _v) { _dirty = true; _raw_header = _v; }
            }
            private int fmNdots;
            private DotsHeader coordHeader;
            private List<DotsData> coordinates;
            private List<DataLinez> data;
            private NtMdt _root;
            private KaitaiStruct.ReadWrite _parent;
            public int fmNdots() { return fmNdots; }
            public void setFmNdots(int _v) { _dirty = true; fmNdots = _v; }
            public DotsHeader coordHeader() { return coordHeader; }
            public void setCoordHeader(DotsHeader _v) { _dirty = true; coordHeader = _v; }
            public List<DotsData> coordinates() { return coordinates; }
            public void setCoordinates(List<DotsData> _v) { _dirty = true; coordinates = _v; }
            public List<DataLinez> data() { return data; }
            public void setData(List<DataLinez> _v) { _dirty = true; data = _v; }
            public NtMdt _root() { return _root; }
            public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
            public KaitaiStruct.ReadWrite _parent() { return _parent; }
            public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        }
        public static class FdCurvesNew extends KaitaiStruct.ReadWrite {
            public static FdCurvesNew fromFile(String fileName) throws IOException {
                return new FdCurvesNew(new ByteBufferKaitaiStream(fileName));
            }
            public FdCurvesNew() {
                this(null, null, null);
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
            }
            public void _read() {
                this.blockCount = this._io.readU4le();
                this.blocksHeaders = new ArrayList<BlockDescr>();
                for (int i = 0; i < blockCount(); i++) {
                    BlockDescr _t_blocksHeaders = new BlockDescr(this._io, this, _root);
                    try {
                        _t_blocksHeaders._read();
                    } finally {
                        this.blocksHeaders.add(_t_blocksHeaders);
                    }
                }
                this.blocksNames = new ArrayList<String>();
                for (int i = 0; i < blockCount(); i++) {
                    this.blocksNames.add(new String(this._io.readBytes(blocksHeaders().get(((Number) (i)).intValue()).nameLen()), StandardCharsets.UTF_8));
                }
                this.blocksData = new ArrayList<byte[]>();
                for (int i = 0; i < blockCount(); i++) {
                    this.blocksData.add(this._io.readBytes(blocksHeaders().get(((Number) (i)).intValue()).len()));
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.blocksHeaders.size(); i++) {
                    this.blocksHeaders.get(((Number) (i)).intValue())._fetchInstances();
                }
                for (int i = 0; i < this.blocksNames.size(); i++) {
                }
                for (int i = 0; i < this.blocksData.size(); i++) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4le(this.blockCount);
                for (int i = 0; i < this.blocksHeaders.size(); i++) {
                    this.blocksHeaders.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                for (int i = 0; i < this.blocksNames.size(); i++) {
                    this._io.writeBytes((this.blocksNames.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")));
                }
                for (int i = 0; i < this.blocksData.size(); i++) {
                    this._io.writeBytes(this.blocksData.get(((Number) (i)).intValue()));
                }
            }

            public void _check() {
                if (this.blocksHeaders.size() != blockCount())
                    throw new ConsistencyError("blocks_headers", blockCount(), this.blocksHeaders.size());
                for (int i = 0; i < this.blocksHeaders.size(); i++) {
                    if (!Objects.equals(this.blocksHeaders.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("blocks_headers", _root(), this.blocksHeaders.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.blocksHeaders.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("blocks_headers", this, this.blocksHeaders.get(((Number) (i)).intValue())._parent());
                }
                if (this.blocksNames.size() != blockCount())
                    throw new ConsistencyError("blocks_names", blockCount(), this.blocksNames.size());
                for (int i = 0; i < this.blocksNames.size(); i++) {
                    if ((this.blocksNames.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")).length != blocksHeaders().get(((Number) (i)).intValue()).nameLen())
                        throw new ConsistencyError("blocks_names", blocksHeaders().get(((Number) (i)).intValue()).nameLen(), (this.blocksNames.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")).length);
                }
                if (this.blocksData.size() != blockCount())
                    throw new ConsistencyError("blocks_data", blockCount(), this.blocksData.size());
                for (int i = 0; i < this.blocksData.size(); i++) {
                    if (this.blocksData.get(((Number) (i)).intValue()).length != blocksHeaders().get(((Number) (i)).intValue()).len())
                        throw new ConsistencyError("blocks_data", blocksHeaders().get(((Number) (i)).intValue()).len(), this.blocksData.get(((Number) (i)).intValue()).length);
                }
                _dirty = false;
            }
            public static class BlockDescr extends KaitaiStruct.ReadWrite {
                public static BlockDescr fromFile(String fileName) throws IOException {
                    return new BlockDescr(new ByteBufferKaitaiStream(fileName));
                }
                public BlockDescr() {
                    this(null, null, null);
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
                }
                public void _read() {
                    this.nameLen = this._io.readU4le();
                    this.len = this._io.readU4le();
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4le(this.nameLen);
                    this._io.writeU4le(this.len);
                }

                public void _check() {
                    _dirty = false;
                }
                private long nameLen;
                private long len;
                private NtMdt _root;
                private NtMdt.Frame.FdCurvesNew _parent;
                public long nameLen() { return nameLen; }
                public void setNameLen(long _v) { _dirty = true; nameLen = _v; }
                public long len() { return len; }
                public void setLen(long _v) { _dirty = true; len = _v; }
                public NtMdt _root() { return _root; }
                public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
                public NtMdt.Frame.FdCurvesNew _parent() { return _parent; }
                public void set_parent(NtMdt.Frame.FdCurvesNew _v) { _dirty = true; _parent = _v; }
            }
            private long blockCount;
            private List<BlockDescr> blocksHeaders;
            private List<String> blocksNames;
            private List<byte[]> blocksData;
            private NtMdt _root;
            private NtMdt.Frame.FrameMain _parent;
            public long blockCount() { return blockCount; }
            public void setBlockCount(long _v) { _dirty = true; blockCount = _v; }
            public List<BlockDescr> blocksHeaders() { return blocksHeaders; }
            public void setBlocksHeaders(List<BlockDescr> _v) { _dirty = true; blocksHeaders = _v; }
            public List<String> blocksNames() { return blocksNames; }
            public void setBlocksNames(List<String> _v) { _dirty = true; blocksNames = _v; }
            public List<byte[]> blocksData() { return blocksData; }
            public void setBlocksData(List<byte[]> _v) { _dirty = true; blocksData = _v; }
            public NtMdt _root() { return _root; }
            public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
            public NtMdt.Frame.FrameMain _parent() { return _parent; }
            public void set_parent(NtMdt.Frame.FrameMain _v) { _dirty = true; _parent = _v; }
        }
        public static class FdMetaData extends KaitaiStruct.ReadWrite {
            public static FdMetaData fromFile(String fileName) throws IOException {
                return new FdMetaData(new ByteBufferKaitaiStream(fileName));
            }
            public FdMetaData() {
                this(null, null, null);
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
            }
            public void _read() {
                this.headSize = this._io.readU4le();
                this.totLen = this._io.readU4le();
                this.guids = new ArrayList<Uuid>();
                for (int i = 0; i < 2; i++) {
                    Uuid _t_guids = new Uuid(this._io, this, _root);
                    try {
                        _t_guids._read();
                    } finally {
                        this.guids.add(_t_guids);
                    }
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
                this.title = new String(this._io.readBytes(nameSize()), StandardCharsets.UTF_8);
                this.xml = new String(this._io.readBytes(commSize()), StandardCharsets.UTF_8);
                this.structLen = this._io.readU4le();
                this.arraySize = this._io.readU8le();
                this.cellSize = this._io.readU4le();
                this.nDimensions = this._io.readU4le();
                this.nMesurands = this._io.readU4le();
                this.dimensions = new ArrayList<Calibration>();
                for (int i = 0; i < nDimensions(); i++) {
                    Calibration _t_dimensions = new Calibration(this._io, this, _root);
                    try {
                        _t_dimensions._read();
                    } finally {
                        this.dimensions.add(_t_dimensions);
                    }
                }
                this.mesurands = new ArrayList<Calibration>();
                for (int i = 0; i < nMesurands(); i++) {
                    Calibration _t_mesurands = new Calibration(this._io, this, _root);
                    try {
                        _t_mesurands._read();
                    } finally {
                        this.mesurands.add(_t_mesurands);
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.guids.size(); i++) {
                    this.guids.get(((Number) (i)).intValue())._fetchInstances();
                }
                for (int i = 0; i < this.dimensions.size(); i++) {
                    this.dimensions.get(((Number) (i)).intValue())._fetchInstances();
                }
                for (int i = 0; i < this.mesurands.size(); i++) {
                    this.mesurands.get(((Number) (i)).intValue())._fetchInstances();
                }
                image();
                if (this.image != null) {
                    this.image._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteImage = _enabledImage;
                this._io.writeU4le(this.headSize);
                this._io.writeU4le(this.totLen);
                for (int i = 0; i < this.guids.size(); i++) {
                    this.guids.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                this._io.writeBytes(this.frameStatus);
                this._io.writeU4le(this.nameSize);
                this._io.writeU4le(this.commSize);
                this._io.writeU4le(this.viewInfoSize);
                this._io.writeU4le(this.specSize);
                this._io.writeU4le(this.sourceInfoSize);
                this._io.writeU4le(this.varSize);
                this._io.writeU4le(this.dataOffset);
                this._io.writeU4le(this.dataSize);
                this._io.writeBytes((this.title).getBytes(Charset.forName("UTF-8")));
                this._io.writeBytes((this.xml).getBytes(Charset.forName("UTF-8")));
                this._io.writeU4le(this.structLen);
                this._io.writeU8le(this.arraySize);
                this._io.writeU4le(this.cellSize);
                this._io.writeU4le(this.nDimensions);
                this._io.writeU4le(this.nMesurands);
                for (int i = 0; i < this.dimensions.size(); i++) {
                    this.dimensions.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                for (int i = 0; i < this.mesurands.size(); i++) {
                    this.mesurands.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            public void _check() {
                if (this.guids.size() != 2)
                    throw new ConsistencyError("guids", 2, this.guids.size());
                for (int i = 0; i < this.guids.size(); i++) {
                    if (!Objects.equals(this.guids.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("guids", _root(), this.guids.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.guids.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("guids", this, this.guids.get(((Number) (i)).intValue())._parent());
                }
                if (this.frameStatus.length != 4)
                    throw new ConsistencyError("frame_status", 4, this.frameStatus.length);
                if ((this.title).getBytes(Charset.forName("UTF-8")).length != nameSize())
                    throw new ConsistencyError("title", nameSize(), (this.title).getBytes(Charset.forName("UTF-8")).length);
                if ((this.xml).getBytes(Charset.forName("UTF-8")).length != commSize())
                    throw new ConsistencyError("xml", commSize(), (this.xml).getBytes(Charset.forName("UTF-8")).length);
                if (this.dimensions.size() != nDimensions())
                    throw new ConsistencyError("dimensions", nDimensions(), this.dimensions.size());
                for (int i = 0; i < this.dimensions.size(); i++) {
                    if (!Objects.equals(this.dimensions.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("dimensions", _root(), this.dimensions.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.dimensions.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("dimensions", this, this.dimensions.get(((Number) (i)).intValue())._parent());
                }
                if (this.mesurands.size() != nMesurands())
                    throw new ConsistencyError("mesurands", nMesurands(), this.mesurands.size());
                for (int i = 0; i < this.mesurands.size(); i++) {
                    if (!Objects.equals(this.mesurands.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("mesurands", _root(), this.mesurands.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.mesurands.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("mesurands", this, this.mesurands.get(((Number) (i)).intValue())._parent());
                }
                if (_enabledImage) {
                    if (!Objects.equals(this.image._root(), _root()))
                        throw new ConsistencyError("image", _root(), this.image._root());
                    if (!Objects.equals(this.image._parent(), this))
                        throw new ConsistencyError("image", this, this.image._parent());
                }
                _dirty = false;
            }
            public static class Calibration extends KaitaiStruct.ReadWrite {
                public static Calibration fromFile(String fileName) throws IOException {
                    return new Calibration(new ByteBufferKaitaiStream(fileName));
                }
                public Calibration() {
                    this(null, null, null);
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
                }
                public void _read() {
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
                    this.name = new String(this._io.readBytes(lenName()), StandardCharsets.UTF_8);
                    this.comment = new String(this._io.readBytes(lenComment()), StandardCharsets.UTF_8);
                    this.unit = new String(this._io.readBytes(lenUnit()), StandardCharsets.UTF_8);
                    this.author = new String(this._io.readBytes(lenAuthor()), StandardCharsets.UTF_8);
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4le(this.lenTot);
                    this._io.writeU4le(this.lenStruct);
                    this._io.writeU4le(this.lenName);
                    this._io.writeU4le(this.lenComment);
                    this._io.writeU4le(this.lenUnit);
                    this._io.writeU8le(this.siUnit);
                    this._io.writeF8le(this.accuracy);
                    this._io.writeU8le(this.functionIdAndDimensions);
                    this._io.writeF8le(this.bias);
                    this._io.writeF8le(this.scale);
                    this._io.writeU8le(this.minIndex);
                    this._io.writeU8le(this.maxIndex);
                    this._io.writeS4le(((Number) (this.dataType.id())).intValue());
                    this._io.writeU4le(this.lenAuthor);
                    this._io.writeBytes((this.name).getBytes(Charset.forName("UTF-8")));
                    this._io.writeBytes((this.comment).getBytes(Charset.forName("UTF-8")));
                    this._io.writeBytes((this.unit).getBytes(Charset.forName("UTF-8")));
                    this._io.writeBytes((this.author).getBytes(Charset.forName("UTF-8")));
                }

                public void _check() {
                    if ((this.name).getBytes(Charset.forName("UTF-8")).length != lenName())
                        throw new ConsistencyError("name", lenName(), (this.name).getBytes(Charset.forName("UTF-8")).length);
                    if ((this.comment).getBytes(Charset.forName("UTF-8")).length != lenComment())
                        throw new ConsistencyError("comment", lenComment(), (this.comment).getBytes(Charset.forName("UTF-8")).length);
                    if ((this.unit).getBytes(Charset.forName("UTF-8")).length != lenUnit())
                        throw new ConsistencyError("unit", lenUnit(), (this.unit).getBytes(Charset.forName("UTF-8")).length);
                    if ((this.author).getBytes(Charset.forName("UTF-8")).length != lenAuthor())
                        throw new ConsistencyError("author", lenAuthor(), (this.author).getBytes(Charset.forName("UTF-8")).length);
                    _dirty = false;
                }
                private Integer count;
                public Integer count() {
                    if (this.count != null)
                        return this.count;
                    this.count = ((Number) ((maxIndex() - minIndex()) + 1)).intValue();
                    return this.count;
                }
                public void _invalidateCount() { this.count = null; }
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
                public void setLenTot(long _v) { _dirty = true; lenTot = _v; }
                public long lenStruct() { return lenStruct; }
                public void setLenStruct(long _v) { _dirty = true; lenStruct = _v; }
                public long lenName() { return lenName; }
                public void setLenName(long _v) { _dirty = true; lenName = _v; }
                public long lenComment() { return lenComment; }
                public void setLenComment(long _v) { _dirty = true; lenComment = _v; }
                public long lenUnit() { return lenUnit; }
                public void setLenUnit(long _v) { _dirty = true; lenUnit = _v; }
                public long siUnit() { return siUnit; }
                public void setSiUnit(long _v) { _dirty = true; siUnit = _v; }
                public double accuracy() { return accuracy; }
                public void setAccuracy(double _v) { _dirty = true; accuracy = _v; }
                public long functionIdAndDimensions() { return functionIdAndDimensions; }
                public void setFunctionIdAndDimensions(long _v) { _dirty = true; functionIdAndDimensions = _v; }
                public double bias() { return bias; }
                public void setBias(double _v) { _dirty = true; bias = _v; }
                public double scale() { return scale; }
                public void setScale(double _v) { _dirty = true; scale = _v; }
                public long minIndex() { return minIndex; }
                public void setMinIndex(long _v) { _dirty = true; minIndex = _v; }
                public long maxIndex() { return maxIndex; }
                public void setMaxIndex(long _v) { _dirty = true; maxIndex = _v; }
                public DataType dataType() { return dataType; }
                public void setDataType(DataType _v) { _dirty = true; dataType = _v; }
                public long lenAuthor() { return lenAuthor; }
                public void setLenAuthor(long _v) { _dirty = true; lenAuthor = _v; }
                public String name() { return name; }
                public void setName(String _v) { _dirty = true; name = _v; }
                public String comment() { return comment; }
                public void setComment(String _v) { _dirty = true; comment = _v; }
                public String unit() { return unit; }
                public void setUnit(String _v) { _dirty = true; unit = _v; }
                public String author() { return author; }
                public void setAuthor(String _v) { _dirty = true; author = _v; }
                public NtMdt _root() { return _root; }
                public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
                public NtMdt.Frame.FdMetaData _parent() { return _parent; }
                public void set_parent(NtMdt.Frame.FdMetaData _v) { _dirty = true; _parent = _v; }
            }
            public static class Image extends KaitaiStruct.ReadWrite {
                public static Image fromFile(String fileName) throws IOException {
                    return new Image(new ByteBufferKaitaiStream(fileName));
                }
                public Image() {
                    this(null, null, null);
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
                }
                public void _read() {
                    this.image = new ArrayList<Vec>();
                    {
                        int i = 0;
                        while (!this._io.isEof()) {
                            Vec _t_image = new Vec(this._io, this, _root);
                            try {
                                _t_image._read();
                            } finally {
                                this.image.add(_t_image);
                            }
                            i++;
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.image.size(); i++) {
                        this.image.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    for (int i = 0; i < this.image.size(); i++) {
                        if (this._io.isEof())
                            throw new ConsistencyError("image", 0, this._io.size() - this._io.pos());
                        this.image.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("image", 0, this._io.size() - this._io.pos());
                }

                public void _check() {
                    for (int i = 0; i < this.image.size(); i++) {
                        if (!Objects.equals(this.image.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("image", _root(), this.image.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.image.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("image", this, this.image.get(((Number) (i)).intValue())._parent());
                    }
                    _dirty = false;
                }
                public static class Vec extends KaitaiStruct.ReadWrite {
                    public static Vec fromFile(String fileName) throws IOException {
                        return new Vec(new ByteBufferKaitaiStream(fileName));
                    }
                    public Vec() {
                        this(null, null, null);
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
                    }
                    public void _read() {
                        this.items = new ArrayList<Double>();
                        for (int i = 0; i < _parent()._parent().nMesurands(); i++) {
                            {
                                DataType on = _parent()._parent().mesurands().get(((Number) (i)).intValue()).dataType();
                                if (on != null) {
                                    switch (_parent()._parent().mesurands().get(((Number) (i)).intValue()).dataType()) {
                                    case FLOAT32: {
                                        this.items.add(((Number) (this._io.readF4le())).doubleValue());
                                        break;
                                    }
                                    case FLOAT64: {
                                        this.items.add(((Number) (this._io.readF8le())).doubleValue());
                                        break;
                                    }
                                    case INT16: {
                                        this.items.add(((Number) (this._io.readS2le())).doubleValue());
                                        break;
                                    }
                                    case INT32: {
                                        this.items.add(((Number) (this._io.readS4le())).doubleValue());
                                        break;
                                    }
                                    case INT64: {
                                        this.items.add(((Number) (this._io.readS8le())).doubleValue());
                                        break;
                                    }
                                    case INT8: {
                                        this.items.add(((Number) (this._io.readS1())).doubleValue());
                                        break;
                                    }
                                    case UINT16: {
                                        this.items.add(((Number) (this._io.readU2le())).doubleValue());
                                        break;
                                    }
                                    case UINT32: {
                                        this.items.add(((Number) (this._io.readU4le())).doubleValue());
                                        break;
                                    }
                                    case UINT64: {
                                        this.items.add(((Number) (this._io.readU8le())).doubleValue());
                                        break;
                                    }
                                    case UINT8: {
                                        this.items.add(((Number) (this._io.readU1())).doubleValue());
                                        break;
                                    }
                                    }
                                }
                            }
                        }
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                        for (int i = 0; i < this.items.size(); i++) {
                            {
                                DataType on = _parent()._parent().mesurands().get(((Number) (i)).intValue()).dataType();
                                if (on != null) {
                                    switch (_parent()._parent().mesurands().get(((Number) (i)).intValue()).dataType()) {
                                    case FLOAT32: {
                                        break;
                                    }
                                    case FLOAT64: {
                                        break;
                                    }
                                    case INT16: {
                                        break;
                                    }
                                    case INT32: {
                                        break;
                                    }
                                    case INT64: {
                                        break;
                                    }
                                    case INT8: {
                                        break;
                                    }
                                    case UINT16: {
                                        break;
                                    }
                                    case UINT32: {
                                        break;
                                    }
                                    case UINT64: {
                                        break;
                                    }
                                    case UINT8: {
                                        break;
                                    }
                                    }
                                }
                            }
                        }
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        for (int i = 0; i < this.items.size(); i++) {
                            {
                                DataType on = _parent()._parent().mesurands().get(((Number) (i)).intValue()).dataType();
                                if (on != null) {
                                    switch (_parent()._parent().mesurands().get(((Number) (i)).intValue()).dataType()) {
                                    case FLOAT32: {
                                        this._io.writeF4le(((Number) (this.items.get(((Number) (i)).intValue()))).floatValue());
                                        break;
                                    }
                                    case FLOAT64: {
                                        this._io.writeF8le(((Number) (this.items.get(((Number) (i)).intValue()))).doubleValue());
                                        break;
                                    }
                                    case INT16: {
                                        this._io.writeS2le(((Number) (this.items.get(((Number) (i)).intValue()))).shortValue());
                                        break;
                                    }
                                    case INT32: {
                                        this._io.writeS4le(((Number) (this.items.get(((Number) (i)).intValue()))).intValue());
                                        break;
                                    }
                                    case INT64: {
                                        this._io.writeS8le(((Number) (this.items.get(((Number) (i)).intValue()))).longValue());
                                        break;
                                    }
                                    case INT8: {
                                        this._io.writeS1(((Number) (this.items.get(((Number) (i)).intValue()))).byteValue());
                                        break;
                                    }
                                    case UINT16: {
                                        this._io.writeU2le(((Number) (this.items.get(((Number) (i)).intValue()))).intValue());
                                        break;
                                    }
                                    case UINT32: {
                                        this._io.writeU4le(((Number) (this.items.get(((Number) (i)).intValue()))).longValue());
                                        break;
                                    }
                                    case UINT64: {
                                        this._io.writeU8le(((Number) (this.items.get(((Number) (i)).intValue()))).longValue());
                                        break;
                                    }
                                    case UINT8: {
                                        this._io.writeU1(((Number) (this.items.get(((Number) (i)).intValue()))).intValue());
                                        break;
                                    }
                                    }
                                }
                            }
                        }
                    }

                    public void _check() {
                        if (this.items.size() != _parent()._parent().nMesurands())
                            throw new ConsistencyError("items", _parent()._parent().nMesurands(), this.items.size());
                        for (int i = 0; i < this.items.size(); i++) {
                            {
                                DataType on = _parent()._parent().mesurands().get(((Number) (i)).intValue()).dataType();
                                if (on != null) {
                                    switch (_parent()._parent().mesurands().get(((Number) (i)).intValue()).dataType()) {
                                    case FLOAT32: {
                                        break;
                                    }
                                    case FLOAT64: {
                                        break;
                                    }
                                    case INT16: {
                                        break;
                                    }
                                    case INT32: {
                                        break;
                                    }
                                    case INT64: {
                                        break;
                                    }
                                    case INT8: {
                                        break;
                                    }
                                    case UINT16: {
                                        break;
                                    }
                                    case UINT32: {
                                        break;
                                    }
                                    case UINT64: {
                                        break;
                                    }
                                    case UINT8: {
                                        break;
                                    }
                                    }
                                }
                            }
                        }
                        _dirty = false;
                    }
                    private List<Double> items;
                    private NtMdt _root;
                    private NtMdt.Frame.FdMetaData.Image _parent;
                    public List<Double> items() { return items; }
                    public void setItems(List<Double> _v) { _dirty = true; items = _v; }
                    public NtMdt _root() { return _root; }
                    public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
                    public NtMdt.Frame.FdMetaData.Image _parent() { return _parent; }
                    public void set_parent(NtMdt.Frame.FdMetaData.Image _v) { _dirty = true; _parent = _v; }
                }
                private List<Vec> image;
                private NtMdt _root;
                private NtMdt.Frame.FdMetaData _parent;
                public List<Vec> image() { return image; }
                public void setImage(List<Vec> _v) { _dirty = true; image = _v; }
                public NtMdt _root() { return _root; }
                public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
                public NtMdt.Frame.FdMetaData _parent() { return _parent; }
                public void set_parent(NtMdt.Frame.FdMetaData _v) { _dirty = true; _parent = _v; }
            }
            private Image image;
            private boolean _shouldWriteImage = false;
            private boolean _enabledImage = true;
            public Image image() {
                if (_shouldWriteImage)
                    _writeImage();
                if (this.image != null)
                    return this.image;
                if (!_enabledImage)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(dataOffset());
                this._raw_image = this._io.readBytes(dataSize());
                KaitaiStream _io__raw_image = new ByteBufferKaitaiStream(this._raw_image);
                this.image = new Image(_io__raw_image, this, _root);
                this.image._read();
                this._io.seek(_pos);
                return this.image;
            }
            public void setImage(Image _v) { _dirty = true; image = _v; }
            public void setImage_Enabled(boolean _v) { _dirty = true; _enabledImage = _v; }

            private void _writeImage() {
                _shouldWriteImage = false;
                long _pos = this._io.pos();
                this._io.seek(dataOffset());
                final KaitaiStream _io__raw_image = new ByteBufferKaitaiStream(dataSize());
                this._io.addChildStream(_io__raw_image);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (dataSize()));
                    final FdMetaData _this = this;
                    _io__raw_image.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_image = _io__raw_image.toByteArray();
                            if (_this._raw_image.length != dataSize())
                                throw new ConsistencyError("raw(image)", dataSize(), _this._raw_image.length);
                            parent.writeBytes(_this._raw_image);
                        }
                    });
                }
                this.image._write_Seq(_io__raw_image);
                this._io.seek(_pos);
            }
            private long headSize;
            private long totLen;
            private List<Uuid> guids;
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
            private List<Calibration> dimensions;
            private List<Calibration> mesurands;
            private NtMdt _root;
            private NtMdt.Frame.FrameMain _parent;
            private byte[] _raw_image;
            public long headSize() { return headSize; }
            public void setHeadSize(long _v) { _dirty = true; headSize = _v; }
            public long totLen() { return totLen; }
            public void setTotLen(long _v) { _dirty = true; totLen = _v; }
            public List<Uuid> guids() { return guids; }
            public void setGuids(List<Uuid> _v) { _dirty = true; guids = _v; }
            public byte[] frameStatus() { return frameStatus; }
            public void setFrameStatus(byte[] _v) { _dirty = true; frameStatus = _v; }
            public long nameSize() { return nameSize; }
            public void setNameSize(long _v) { _dirty = true; nameSize = _v; }
            public long commSize() { return commSize; }
            public void setCommSize(long _v) { _dirty = true; commSize = _v; }
            public long viewInfoSize() { return viewInfoSize; }
            public void setViewInfoSize(long _v) { _dirty = true; viewInfoSize = _v; }
            public long specSize() { return specSize; }
            public void setSpecSize(long _v) { _dirty = true; specSize = _v; }
            public long sourceInfoSize() { return sourceInfoSize; }
            public void setSourceInfoSize(long _v) { _dirty = true; sourceInfoSize = _v; }
            public long varSize() { return varSize; }
            public void setVarSize(long _v) { _dirty = true; varSize = _v; }
            public long dataOffset() { return dataOffset; }
            public void setDataOffset(long _v) { _dirty = true; dataOffset = _v; }
            public long dataSize() { return dataSize; }
            public void setDataSize(long _v) { _dirty = true; dataSize = _v; }
            public String title() { return title; }
            public void setTitle(String _v) { _dirty = true; title = _v; }
            public String xml() { return xml; }
            public void setXml(String _v) { _dirty = true; xml = _v; }
            public long structLen() { return structLen; }
            public void setStructLen(long _v) { _dirty = true; structLen = _v; }
            public long arraySize() { return arraySize; }
            public void setArraySize(long _v) { _dirty = true; arraySize = _v; }
            public long cellSize() { return cellSize; }
            public void setCellSize(long _v) { _dirty = true; cellSize = _v; }
            public long nDimensions() { return nDimensions; }
            public void setNDimensions(long _v) { _dirty = true; nDimensions = _v; }
            public long nMesurands() { return nMesurands; }
            public void setNMesurands(long _v) { _dirty = true; nMesurands = _v; }
            public List<Calibration> dimensions() { return dimensions; }
            public void setDimensions(List<Calibration> _v) { _dirty = true; dimensions = _v; }
            public List<Calibration> mesurands() { return mesurands; }
            public void setMesurands(List<Calibration> _v) { _dirty = true; mesurands = _v; }
            public NtMdt _root() { return _root; }
            public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
            public NtMdt.Frame.FrameMain _parent() { return _parent; }
            public void set_parent(NtMdt.Frame.FrameMain _v) { _dirty = true; _parent = _v; }
            public byte[] _raw_image() { return _raw_image; }
            public void set_raw_Image(byte[] _v) { _dirty = true; _raw_image = _v; }
        }
        public static class FdScanned extends KaitaiStruct.ReadWrite {
            public static FdScanned fromFile(String fileName) throws IOException {
                return new FdScanned(new ByteBufferKaitaiStream(fileName));
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
            public FdScanned() {
                this(null, null, null);
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
            }
            public void _read() {
                this._raw_vars = this._io.readBytes(_parent().varSize());
                KaitaiStream _io__raw_vars = new ByteBufferKaitaiStream(this._raw_vars);
                this.vars = new Vars(_io__raw_vars, this, _root);
                this.vars._read();
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
                this.dots._read();
                this.image = new ArrayList<Short>();
                for (int i = 0; i < fmXres() * fmYres(); i++) {
                    this.image.add(this._io.readS2le());
                }
                this.title = new Title(this._io, this, _root);
                this.title._read();
                this.xml = new Xml(this._io, this, _root);
                this.xml._read();
                _dirty = false;
            }

            public void _fetchInstances() {
                this.vars._fetchInstances();
                if (false) {
                }
                if (false) {
                }
                if (false) {
                }
                if (false) {
                }
                if (false) {
                }
                this.dots._fetchInstances();
                for (int i = 0; i < this.image.size(); i++) {
                }
                this.title._fetchInstances();
                this.xml._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();
                final KaitaiStream _io__raw_vars = new ByteBufferKaitaiStream(_parent().varSize());
                this._io.addChildStream(_io__raw_vars);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (_parent().varSize()));
                    final FdScanned _this = this;
                    _io__raw_vars.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_vars = _io__raw_vars.toByteArray();
                            if (_this._raw_vars.length != _parent().varSize())
                                throw new ConsistencyError("raw(vars)", _parent().varSize(), _this._raw_vars.length);
                            parent.writeBytes(_this._raw_vars);
                        }
                    });
                }
                this.vars._write_Seq(_io__raw_vars);
                if (false) {
                    this._io.writeU4le(this.origFormat);
                }
                if (false) {
                    this._io.writeU4le(((Number) (this.tune.id())).longValue());
                }
                if (false) {
                    this._io.writeF8le(this.feedbackGain);
                }
                if (false) {
                    this._io.writeS4le(this.dacScale);
                }
                if (false) {
                    this._io.writeS4le(this.overscan);
                }
                this._io.writeU2le(this.fmMode);
                this._io.writeU2le(this.fmXres);
                this._io.writeU2le(this.fmYres);
                this.dots._write_Seq(this._io);
                for (int i = 0; i < this.image.size(); i++) {
                    this._io.writeS2le(this.image.get(((Number) (i)).intValue()));
                }
                this.title._write_Seq(this._io);
                this.xml._write_Seq(this._io);
            }

            public void _check() {
                if (!Objects.equals(this.vars._root(), _root()))
                    throw new ConsistencyError("vars", _root(), this.vars._root());
                if (!Objects.equals(this.vars._parent(), this))
                    throw new ConsistencyError("vars", this, this.vars._parent());
                if (false) {
                }
                if (false) {
                }
                if (false) {
                }
                if (false) {
                }
                if (false) {
                }
                if (!Objects.equals(this.dots._root(), _root()))
                    throw new ConsistencyError("dots", _root(), this.dots._root());
                if (!Objects.equals(this.dots._parent(), this))
                    throw new ConsistencyError("dots", this, this.dots._parent());
                if (this.image.size() != fmXres() * fmYres())
                    throw new ConsistencyError("image", fmXres() * fmYres(), this.image.size());
                for (int i = 0; i < this.image.size(); i++) {
                }
                if (!Objects.equals(this.title._root(), _root()))
                    throw new ConsistencyError("title", _root(), this.title._root());
                if (!Objects.equals(this.title._parent(), this))
                    throw new ConsistencyError("title", this, this.title._parent());
                if (!Objects.equals(this.xml._root(), _root()))
                    throw new ConsistencyError("xml", _root(), this.xml._root());
                if (!Objects.equals(this.xml._parent(), this))
                    throw new ConsistencyError("xml", this, this.xml._parent());
                _dirty = false;
            }
            public static class Dot extends KaitaiStruct.ReadWrite {
                public static Dot fromFile(String fileName) throws IOException {
                    return new Dot(new ByteBufferKaitaiStream(fileName));
                }
                public Dot() {
                    this(null, null, null);
                }

                public Dot(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Dot(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public Dot(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, NtMdt _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.x = this._io.readS2le();
                    this.y = this._io.readS2le();
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeS2le(this.x);
                    this._io.writeS2le(this.y);
                }

                public void _check() {
                    _dirty = false;
                }
                private short x;
                private short y;
                private NtMdt _root;
                private KaitaiStruct.ReadWrite _parent;
                public short x() { return x; }
                public void setX(short _v) { _dirty = true; x = _v; }
                public short y() { return y; }
                public void setY(short _v) { _dirty = true; y = _v; }
                public NtMdt _root() { return _root; }
                public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            public static class ScanDir extends KaitaiStruct.ReadWrite {
                public static ScanDir fromFile(String fileName) throws IOException {
                    return new ScanDir(new ByteBufferKaitaiStream(fileName));
                }
                public ScanDir() {
                    this(null, null, null);
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
                }
                public void _read() {
                    this.unkn = this._io.readBitsIntBe(4);
                    this.doublePass = this._io.readBitsIntBe(1) != 0;
                    this.bottom = this._io.readBitsIntBe(1) != 0;
                    this.left = this._io.readBitsIntBe(1) != 0;
                    this.horizontal = this._io.readBitsIntBe(1) != 0;
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBitsIntBe(4, this.unkn);
                    this._io.writeBitsIntBe(1, (this.doublePass ? 1 : 0));
                    this._io.writeBitsIntBe(1, (this.bottom ? 1 : 0));
                    this._io.writeBitsIntBe(1, (this.left ? 1 : 0));
                    this._io.writeBitsIntBe(1, (this.horizontal ? 1 : 0));
                }

                public void _check() {
                    _dirty = false;
                }
                private long unkn;
                private boolean doublePass;
                private boolean bottom;
                private boolean left;
                private boolean horizontal;
                private NtMdt _root;
                private NtMdt.Frame.FdScanned.Vars _parent;
                public long unkn() { return unkn; }
                public void setUnkn(long _v) { _dirty = true; unkn = _v; }
                public boolean doublePass() { return doublePass; }
                public void setDoublePass(boolean _v) { _dirty = true; doublePass = _v; }

                /**
                 * Bottom - 1 Top - 0
                 */
                public boolean bottom() { return bottom; }
                public void setBottom(boolean _v) { _dirty = true; bottom = _v; }

                /**
                 * Left - 1 Right - 0
                 */
                public boolean left() { return left; }
                public void setLeft(boolean _v) { _dirty = true; left = _v; }

                /**
                 * Horizontal - 1 Vertical - 0
                 */
                public boolean horizontal() { return horizontal; }
                public void setHorizontal(boolean _v) { _dirty = true; horizontal = _v; }
                public NtMdt _root() { return _root; }
                public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
                public NtMdt.Frame.FdScanned.Vars _parent() { return _parent; }
                public void set_parent(NtMdt.Frame.FdScanned.Vars _v) { _dirty = true; _parent = _v; }
            }
            public static class Vars extends KaitaiStruct.ReadWrite {
                public static Vars fromFile(String fileName) throws IOException {
                    return new Vars(new ByteBufferKaitaiStream(fileName));
                }
                public Vars() {
                    this(null, null, null);
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
                }
                public void _read() {
                    this.xScale = new AxisScale(this._io, this, _root);
                    this.xScale._read();
                    this.yScale = new AxisScale(this._io, this, _root);
                    this.yScale._read();
                    this.zScale = new AxisScale(this._io, this, _root);
                    this.zScale._read();
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
                    this.scanDir._read();
                    this.powerOf2 = this._io.readU1();
                    this.velocity = this._io.readF4le();
                    this.setpoint = this._io.readF4le();
                    this.biasVoltage = this._io.readF4le();
                    this.draw = this._io.readU1();
                    this.reserved = this._io.readU1();
                    this.xoff = this._io.readS4le();
                    this.yoff = this._io.readS4le();
                    this.nlCorr = this._io.readU1();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.xScale._fetchInstances();
                    this.yScale._fetchInstances();
                    this.zScale._fetchInstances();
                    this.scanDir._fetchInstances();
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this.xScale._write_Seq(this._io);
                    this.yScale._write_Seq(this._io);
                    this.zScale._write_Seq(this._io);
                    this._io.writeU1(((Number) (this.channelIndex.id())).intValue());
                    this._io.writeU1(((Number) (this.mode.id())).intValue());
                    this._io.writeU2le(this.xres);
                    this._io.writeU2le(this.yres);
                    this._io.writeU2le(this.ndacq);
                    this._io.writeF4le(this.stepLength);
                    this._io.writeU2le(this.adt);
                    this._io.writeU1(this.adcGainAmpLog10);
                    this._io.writeU1(this.adcIndex);
                    this._io.writeU1(this.inputSignalOrVersion);
                    this._io.writeU1(this.substrPlaneOrderOrPassNum);
                    this.scanDir._write_Seq(this._io);
                    this._io.writeU1(this.powerOf2);
                    this._io.writeF4le(this.velocity);
                    this._io.writeF4le(this.setpoint);
                    this._io.writeF4le(this.biasVoltage);
                    this._io.writeU1(this.draw);
                    this._io.writeU1(this.reserved);
                    this._io.writeS4le(this.xoff);
                    this._io.writeS4le(this.yoff);
                    this._io.writeU1(this.nlCorr);
                }

                public void _check() {
                    if (!Objects.equals(this.xScale._root(), _root()))
                        throw new ConsistencyError("x_scale", _root(), this.xScale._root());
                    if (!Objects.equals(this.xScale._parent(), this))
                        throw new ConsistencyError("x_scale", this, this.xScale._parent());
                    if (!Objects.equals(this.yScale._root(), _root()))
                        throw new ConsistencyError("y_scale", _root(), this.yScale._root());
                    if (!Objects.equals(this.yScale._parent(), this))
                        throw new ConsistencyError("y_scale", this, this.yScale._parent());
                    if (!Objects.equals(this.zScale._root(), _root()))
                        throw new ConsistencyError("z_scale", _root(), this.zScale._root());
                    if (!Objects.equals(this.zScale._parent(), this))
                        throw new ConsistencyError("z_scale", this, this.zScale._parent());
                    if (!Objects.equals(this.scanDir._root(), _root()))
                        throw new ConsistencyError("scan_dir", _root(), this.scanDir._root());
                    if (!Objects.equals(this.scanDir._parent(), this))
                        throw new ConsistencyError("scan_dir", this, this.scanDir._parent());
                    _dirty = false;
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
                public void setXScale(AxisScale _v) { _dirty = true; xScale = _v; }
                public AxisScale yScale() { return yScale; }
                public void setYScale(AxisScale _v) { _dirty = true; yScale = _v; }
                public AxisScale zScale() { return zScale; }
                public void setZScale(AxisScale _v) { _dirty = true; zScale = _v; }

                /**
                 * s_mode
                 */
                public AdcMode channelIndex() { return channelIndex; }
                public void setChannelIndex(AdcMode _v) { _dirty = true; channelIndex = _v; }

                /**
                 * s_dev
                 */
                public Mode mode() { return mode; }
                public void setMode(Mode _v) { _dirty = true; mode = _v; }

                /**
                 * s_nx
                 */
                public int xres() { return xres; }
                public void setXres(int _v) { _dirty = true; xres = _v; }

                /**
                 * s_ny
                 */
                public int yres() { return yres; }
                public void setYres(int _v) { _dirty = true; yres = _v; }

                /**
                 * Step (DAC)
                 */
                public int ndacq() { return ndacq; }
                public void setNdacq(int _v) { _dirty = true; ndacq = _v; }

                /**
                 * s_rs in Angstrom's (Angstrom*gwy_get_gfloat_le(&p))
                 */
                public float stepLength() { return stepLength; }
                public void setStepLength(float _v) { _dirty = true; stepLength = _v; }

                /**
                 * s_adt
                 */
                public int adt() { return adt; }
                public void setAdt(int _v) { _dirty = true; adt = _v; }

                /**
                 * s_adc_a
                 */
                public int adcGainAmpLog10() { return adcGainAmpLog10; }
                public void setAdcGainAmpLog10(int _v) { _dirty = true; adcGainAmpLog10 = _v; }

                /**
                 * ADC index
                 */
                public int adcIndex() { return adcIndex; }
                public void setAdcIndex(int _v) { _dirty = true; adcIndex = _v; }

                /**
                 * MDTInputSignal smp_in; s_smp_in (for signal) s_8xx (for version)
                 */
                public int inputSignalOrVersion() { return inputSignalOrVersion; }
                public void setInputSignalOrVersion(int _v) { _dirty = true; inputSignalOrVersion = _v; }

                /**
                 * s_spl or z_03
                 */
                public int substrPlaneOrderOrPassNum() { return substrPlaneOrderOrPassNum; }
                public void setSubstrPlaneOrderOrPassNum(int _v) { _dirty = true; substrPlaneOrderOrPassNum = _v; }

                /**
                 * s_xy TODO: interpretation
                 */
                public ScanDir scanDir() { return scanDir; }
                public void setScanDir(ScanDir _v) { _dirty = true; scanDir = _v; }

                /**
                 * s_2n (bool)
                 */
                public int powerOf2() { return powerOf2; }
                public void setPowerOf2(int _v) { _dirty = true; powerOf2 = _v; }

                /**
                 * s_vel (Angstrom/second)
                 */
                public float velocity() { return velocity; }
                public void setVelocity(float _v) { _dirty = true; velocity = _v; }

                /**
                 * s_i0
                 */
                public float setpoint() { return setpoint; }
                public void setSetpoint(float _v) { _dirty = true; setpoint = _v; }

                /**
                 * s_ut
                 */
                public float biasVoltage() { return biasVoltage; }
                public void setBiasVoltage(float _v) { _dirty = true; biasVoltage = _v; }

                /**
                 * s_draw (bool)
                 */
                public int draw() { return draw; }
                public void setDraw(int _v) { _dirty = true; draw = _v; }
                public int reserved() { return reserved; }
                public void setReserved(int _v) { _dirty = true; reserved = _v; }

                /**
                 * s_x00 (in DAC quants)
                 */
                public int xoff() { return xoff; }
                public void setXoff(int _v) { _dirty = true; xoff = _v; }

                /**
                 * s_y00 (in DAC quants)
                 */
                public int yoff() { return yoff; }
                public void setYoff(int _v) { _dirty = true; yoff = _v; }

                /**
                 * s_cor (bool)
                 */
                public int nlCorr() { return nlCorr; }
                public void setNlCorr(int _v) { _dirty = true; nlCorr = _v; }
                public NtMdt _root() { return _root; }
                public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
                public NtMdt.Frame.FdScanned _parent() { return _parent; }
                public void set_parent(NtMdt.Frame.FdScanned _v) { _dirty = true; _parent = _v; }
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
            private List<Short> image;
            private Title title;
            private Xml xml;
            private NtMdt _root;
            private NtMdt.Frame.FrameMain _parent;
            private byte[] _raw_vars;
            public Vars vars() { return vars; }
            public void setVars(Vars _v) { _dirty = true; vars = _v; }

            /**
             * s_oem
             */
            public Long origFormat() { return origFormat; }
            public void setOrigFormat(Long _v) { _dirty = true; origFormat = _v; }

            /**
             * z_tune
             */
            public LiftMode tune() { return tune; }
            public void setTune(LiftMode _v) { _dirty = true; tune = _v; }

            /**
             * s_fbg
             */
            public Double feedbackGain() { return feedbackGain; }
            public void setFeedbackGain(Double _v) { _dirty = true; feedbackGain = _v; }

            /**
             * s_s
             */
            public Integer dacScale() { return dacScale; }
            public void setDacScale(Integer _v) { _dirty = true; dacScale = _v; }

            /**
             * s_xov (in %)
             */
            public Integer overscan() { return overscan; }
            public void setOverscan(Integer _v) { _dirty = true; overscan = _v; }

            /**
             * m_mode
             */
            public int fmMode() { return fmMode; }
            public void setFmMode(int _v) { _dirty = true; fmMode = _v; }

            /**
             * m_nx
             */
            public int fmXres() { return fmXres; }
            public void setFmXres(int _v) { _dirty = true; fmXres = _v; }

            /**
             * m_ny
             */
            public int fmYres() { return fmYres; }
            public void setFmYres(int _v) { _dirty = true; fmYres = _v; }
            public Dots dots() { return dots; }
            public void setDots(Dots _v) { _dirty = true; dots = _v; }
            public List<Short> image() { return image; }
            public void setImage(List<Short> _v) { _dirty = true; image = _v; }
            public Title title() { return title; }
            public void setTitle(Title _v) { _dirty = true; title = _v; }
            public Xml xml() { return xml; }
            public void setXml(Xml _v) { _dirty = true; xml = _v; }
            public NtMdt _root() { return _root; }
            public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
            public NtMdt.Frame.FrameMain _parent() { return _parent; }
            public void set_parent(NtMdt.Frame.FrameMain _v) { _dirty = true; _parent = _v; }
            public byte[] _raw_vars() { return _raw_vars; }
            public void set_raw_Vars(byte[] _v) { _dirty = true; _raw_vars = _v; }
        }
        public static class FdSpectroscopy extends KaitaiStruct.ReadWrite {
            public static FdSpectroscopy fromFile(String fileName) throws IOException {
                return new FdSpectroscopy(new ByteBufferKaitaiStream(fileName));
            }
            public FdSpectroscopy() {
                this(null, null, null);
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
            }
            public void _read() {
                this._raw_vars = this._io.readBytes(_parent().varSize());
                KaitaiStream _io__raw_vars = new ByteBufferKaitaiStream(this._raw_vars);
                this.vars = new Vars(_io__raw_vars, this, _root);
                this.vars._read();
                this.fmMode = this._io.readU2le();
                this.fmXres = this._io.readU2le();
                this.fmYres = this._io.readU2le();
                this.dots = new Dots(this._io, this, _root);
                this.dots._read();
                this.data = new ArrayList<Short>();
                for (int i = 0; i < fmXres() * fmYres(); i++) {
                    this.data.add(this._io.readS2le());
                }
                this.title = new Title(this._io, this, _root);
                this.title._read();
                this.xml = new Xml(this._io, this, _root);
                this.xml._read();
                _dirty = false;
            }

            public void _fetchInstances() {
                this.vars._fetchInstances();
                this.dots._fetchInstances();
                for (int i = 0; i < this.data.size(); i++) {
                }
                this.title._fetchInstances();
                this.xml._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();
                final KaitaiStream _io__raw_vars = new ByteBufferKaitaiStream(_parent().varSize());
                this._io.addChildStream(_io__raw_vars);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (_parent().varSize()));
                    final FdSpectroscopy _this = this;
                    _io__raw_vars.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_vars = _io__raw_vars.toByteArray();
                            if (_this._raw_vars.length != _parent().varSize())
                                throw new ConsistencyError("raw(vars)", _parent().varSize(), _this._raw_vars.length);
                            parent.writeBytes(_this._raw_vars);
                        }
                    });
                }
                this.vars._write_Seq(_io__raw_vars);
                this._io.writeU2le(this.fmMode);
                this._io.writeU2le(this.fmXres);
                this._io.writeU2le(this.fmYres);
                this.dots._write_Seq(this._io);
                for (int i = 0; i < this.data.size(); i++) {
                    this._io.writeS2le(this.data.get(((Number) (i)).intValue()));
                }
                this.title._write_Seq(this._io);
                this.xml._write_Seq(this._io);
            }

            public void _check() {
                if (!Objects.equals(this.vars._root(), _root()))
                    throw new ConsistencyError("vars", _root(), this.vars._root());
                if (!Objects.equals(this.vars._parent(), this))
                    throw new ConsistencyError("vars", this, this.vars._parent());
                if (!Objects.equals(this.dots._root(), _root()))
                    throw new ConsistencyError("dots", _root(), this.dots._root());
                if (!Objects.equals(this.dots._parent(), this))
                    throw new ConsistencyError("dots", this, this.dots._parent());
                if (this.data.size() != fmXres() * fmYres())
                    throw new ConsistencyError("data", fmXres() * fmYres(), this.data.size());
                for (int i = 0; i < this.data.size(); i++) {
                }
                if (!Objects.equals(this.title._root(), _root()))
                    throw new ConsistencyError("title", _root(), this.title._root());
                if (!Objects.equals(this.title._parent(), this))
                    throw new ConsistencyError("title", this, this.title._parent());
                if (!Objects.equals(this.xml._root(), _root()))
                    throw new ConsistencyError("xml", _root(), this.xml._root());
                if (!Objects.equals(this.xml._parent(), this))
                    throw new ConsistencyError("xml", this, this.xml._parent());
                _dirty = false;
            }
            public static class Vars extends KaitaiStruct.ReadWrite {
                public static Vars fromFile(String fileName) throws IOException {
                    return new Vars(new ByteBufferKaitaiStream(fileName));
                }
                public Vars() {
                    this(null, null, null);
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
                }
                public void _read() {
                    this.xScale = new AxisScale(this._io, this, _root);
                    this.xScale._read();
                    this.yScale = new AxisScale(this._io, this, _root);
                    this.yScale._read();
                    this.zScale = new AxisScale(this._io, this, _root);
                    this.zScale._read();
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
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.xScale._fetchInstances();
                    this.yScale._fetchInstances();
                    this.zScale._fetchInstances();
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this.xScale._write_Seq(this._io);
                    this.yScale._write_Seq(this._io);
                    this.zScale._write_Seq(this._io);
                    this._io.writeU2le(this.spMode);
                    this._io.writeU2le(this.spFilter);
                    this._io.writeF4le(this.uBegin);
                    this._io.writeF4le(this.uEnd);
                    this._io.writeS2le(this.zUp);
                    this._io.writeS2le(this.zDown);
                    this._io.writeU2le(this.spAveraging);
                    this._io.writeU1(this.spRepeat);
                    this._io.writeU1(this.spBack);
                    this._io.writeS2le(this.sp4nx);
                    this._io.writeU1(this.spOsc);
                    this._io.writeU1(this.spN4);
                    this._io.writeF4le(this.sp4x0);
                    this._io.writeF4le(this.sp4xr);
                    this._io.writeS2le(this.sp4u);
                    this._io.writeS2le(this.sp4i);
                    this._io.writeS2le(this.spNx);
                }

                public void _check() {
                    if (!Objects.equals(this.xScale._root(), _root()))
                        throw new ConsistencyError("x_scale", _root(), this.xScale._root());
                    if (!Objects.equals(this.xScale._parent(), this))
                        throw new ConsistencyError("x_scale", this, this.xScale._parent());
                    if (!Objects.equals(this.yScale._root(), _root()))
                        throw new ConsistencyError("y_scale", _root(), this.yScale._root());
                    if (!Objects.equals(this.yScale._parent(), this))
                        throw new ConsistencyError("y_scale", this, this.yScale._parent());
                    if (!Objects.equals(this.zScale._root(), _root()))
                        throw new ConsistencyError("z_scale", _root(), this.zScale._root());
                    if (!Objects.equals(this.zScale._parent(), this))
                        throw new ConsistencyError("z_scale", this, this.zScale._parent());
                    _dirty = false;
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
                public void setXScale(AxisScale _v) { _dirty = true; xScale = _v; }
                public AxisScale yScale() { return yScale; }
                public void setYScale(AxisScale _v) { _dirty = true; yScale = _v; }
                public AxisScale zScale() { return zScale; }
                public void setZScale(AxisScale _v) { _dirty = true; zScale = _v; }
                public int spMode() { return spMode; }
                public void setSpMode(int _v) { _dirty = true; spMode = _v; }
                public int spFilter() { return spFilter; }
                public void setSpFilter(int _v) { _dirty = true; spFilter = _v; }
                public float uBegin() { return uBegin; }
                public void setUBegin(float _v) { _dirty = true; uBegin = _v; }
                public float uEnd() { return uEnd; }
                public void setUEnd(float _v) { _dirty = true; uEnd = _v; }
                public short zUp() { return zUp; }
                public void setZUp(short _v) { _dirty = true; zUp = _v; }
                public short zDown() { return zDown; }
                public void setZDown(short _v) { _dirty = true; zDown = _v; }
                public int spAveraging() { return spAveraging; }
                public void setSpAveraging(int _v) { _dirty = true; spAveraging = _v; }
                public int spRepeat() { return spRepeat; }
                public void setSpRepeat(int _v) { _dirty = true; spRepeat = _v; }
                public int spBack() { return spBack; }
                public void setSpBack(int _v) { _dirty = true; spBack = _v; }
                public short sp4nx() { return sp4nx; }
                public void setSp4nx(short _v) { _dirty = true; sp4nx = _v; }
                public int spOsc() { return spOsc; }
                public void setSpOsc(int _v) { _dirty = true; spOsc = _v; }
                public int spN4() { return spN4; }
                public void setSpN4(int _v) { _dirty = true; spN4 = _v; }
                public float sp4x0() { return sp4x0; }
                public void setSp4x0(float _v) { _dirty = true; sp4x0 = _v; }
                public float sp4xr() { return sp4xr; }
                public void setSp4xr(float _v) { _dirty = true; sp4xr = _v; }
                public short sp4u() { return sp4u; }
                public void setSp4u(short _v) { _dirty = true; sp4u = _v; }
                public short sp4i() { return sp4i; }
                public void setSp4i(short _v) { _dirty = true; sp4i = _v; }
                public short spNx() { return spNx; }
                public void setSpNx(short _v) { _dirty = true; spNx = _v; }
                public NtMdt _root() { return _root; }
                public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
                public NtMdt.Frame.FdSpectroscopy _parent() { return _parent; }
                public void set_parent(NtMdt.Frame.FdSpectroscopy _v) { _dirty = true; _parent = _v; }
            }
            private Vars vars;
            private int fmMode;
            private int fmXres;
            private int fmYres;
            private Dots dots;
            private List<Short> data;
            private Title title;
            private Xml xml;
            private NtMdt _root;
            private NtMdt.Frame.FrameMain _parent;
            private byte[] _raw_vars;
            public Vars vars() { return vars; }
            public void setVars(Vars _v) { _dirty = true; vars = _v; }
            public int fmMode() { return fmMode; }
            public void setFmMode(int _v) { _dirty = true; fmMode = _v; }
            public int fmXres() { return fmXres; }
            public void setFmXres(int _v) { _dirty = true; fmXres = _v; }
            public int fmYres() { return fmYres; }
            public void setFmYres(int _v) { _dirty = true; fmYres = _v; }
            public Dots dots() { return dots; }
            public void setDots(Dots _v) { _dirty = true; dots = _v; }
            public List<Short> data() { return data; }
            public void setData(List<Short> _v) { _dirty = true; data = _v; }
            public Title title() { return title; }
            public void setTitle(Title _v) { _dirty = true; title = _v; }
            public Xml xml() { return xml; }
            public void setXml(Xml _v) { _dirty = true; xml = _v; }
            public NtMdt _root() { return _root; }
            public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
            public NtMdt.Frame.FrameMain _parent() { return _parent; }
            public void set_parent(NtMdt.Frame.FrameMain _v) { _dirty = true; _parent = _v; }
            public byte[] _raw_vars() { return _raw_vars; }
            public void set_raw_Vars(byte[] _v) { _dirty = true; _raw_vars = _v; }
        }
        public static class FrameMain extends KaitaiStruct.ReadWrite {
            public static FrameMain fromFile(String fileName) throws IOException {
                return new FrameMain(new ByteBufferKaitaiStream(fileName));
            }
            public FrameMain() {
                this(null, null, null);
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
            }
            public void _read() {
                this.type = NtMdt.Frame.FrameType.byId(this._io.readU2le());
                this.version = new Version(this._io, this, _root);
                this.version._read();
                this.dateTime = new DateTime(this._io, this, _root);
                this.dateTime._read();
                this.varSize = this._io.readU2le();
                {
                    FrameType on = type();
                    if (on != null) {
                        switch (type()) {
                        case CURVES: {
                            this._raw_frameData = this._io.readBytesFull();
                            KaitaiStream _io__raw_frameData = new ByteBufferKaitaiStream(this._raw_frameData);
                            this.frameData = new FdSpectroscopy(_io__raw_frameData, this, _root);
                            ((FdSpectroscopy) (this.frameData))._read();
                            break;
                        }
                        case CURVES_NEW: {
                            this._raw_frameData = this._io.readBytesFull();
                            KaitaiStream _io__raw_frameData = new ByteBufferKaitaiStream(this._raw_frameData);
                            this.frameData = new FdCurvesNew(_io__raw_frameData, this, _root);
                            ((FdCurvesNew) (this.frameData))._read();
                            break;
                        }
                        case MDA: {
                            this._raw_frameData = this._io.readBytesFull();
                            KaitaiStream _io__raw_frameData = new ByteBufferKaitaiStream(this._raw_frameData);
                            this.frameData = new FdMetaData(_io__raw_frameData, this, _root);
                            ((FdMetaData) (this.frameData))._read();
                            break;
                        }
                        case SCANNED: {
                            this._raw_frameData = this._io.readBytesFull();
                            KaitaiStream _io__raw_frameData = new ByteBufferKaitaiStream(this._raw_frameData);
                            this.frameData = new FdScanned(_io__raw_frameData, this, _root);
                            ((FdScanned) (this.frameData))._read();
                            break;
                        }
                        case SPECTROSCOPY: {
                            this._raw_frameData = this._io.readBytesFull();
                            KaitaiStream _io__raw_frameData = new ByteBufferKaitaiStream(this._raw_frameData);
                            this.frameData = new FdSpectroscopy(_io__raw_frameData, this, _root);
                            ((FdSpectroscopy) (this.frameData))._read();
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
                _dirty = false;
            }

            public void _fetchInstances() {
                this.version._fetchInstances();
                this.dateTime._fetchInstances();
                {
                    FrameType on = type();
                    if (on != null) {
                        switch (type()) {
                        case CURVES: {
                            ((FdSpectroscopy) (this.frameData))._fetchInstances();
                            break;
                        }
                        case CURVES_NEW: {
                            ((FdCurvesNew) (this.frameData))._fetchInstances();
                            break;
                        }
                        case MDA: {
                            ((FdMetaData) (this.frameData))._fetchInstances();
                            break;
                        }
                        case SCANNED: {
                            ((FdScanned) (this.frameData))._fetchInstances();
                            break;
                        }
                        case SPECTROSCOPY: {
                            ((FdSpectroscopy) (this.frameData))._fetchInstances();
                            break;
                        }
                        default: {
                            break;
                        }
                        }
                    } else {
                    }
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2le(((Number) (this.type.id())).intValue());
                this.version._write_Seq(this._io);
                this.dateTime._write_Seq(this._io);
                this._io.writeU2le(this.varSize);
                {
                    FrameType on = type();
                    if (on != null) {
                        switch (type()) {
                        case CURVES: {
                            final KaitaiStream _io__raw_frameData = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
                            this._io.addChildStream(_io__raw_frameData);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
                                final FrameMain _this = this;
                                _io__raw_frameData.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_frameData = _io__raw_frameData.toByteArray();
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_frameData)))));
                                        if (!(parent.isEof()))
                                            throw new ConsistencyError("raw(frame_data)", 0, parent.size() - parent.pos());
                                    }
                                });
                            }
                            ((FdSpectroscopy) (this.frameData))._write_Seq(_io__raw_frameData);
                            break;
                        }
                        case CURVES_NEW: {
                            final KaitaiStream _io__raw_frameData = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
                            this._io.addChildStream(_io__raw_frameData);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
                                final FrameMain _this = this;
                                _io__raw_frameData.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_frameData = _io__raw_frameData.toByteArray();
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_frameData)))));
                                        if (!(parent.isEof()))
                                            throw new ConsistencyError("raw(frame_data)", 0, parent.size() - parent.pos());
                                    }
                                });
                            }
                            ((FdCurvesNew) (this.frameData))._write_Seq(_io__raw_frameData);
                            break;
                        }
                        case MDA: {
                            final KaitaiStream _io__raw_frameData = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
                            this._io.addChildStream(_io__raw_frameData);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
                                final FrameMain _this = this;
                                _io__raw_frameData.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_frameData = _io__raw_frameData.toByteArray();
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_frameData)))));
                                        if (!(parent.isEof()))
                                            throw new ConsistencyError("raw(frame_data)", 0, parent.size() - parent.pos());
                                    }
                                });
                            }
                            ((FdMetaData) (this.frameData))._write_Seq(_io__raw_frameData);
                            break;
                        }
                        case SCANNED: {
                            final KaitaiStream _io__raw_frameData = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
                            this._io.addChildStream(_io__raw_frameData);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
                                final FrameMain _this = this;
                                _io__raw_frameData.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_frameData = _io__raw_frameData.toByteArray();
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_frameData)))));
                                        if (!(parent.isEof()))
                                            throw new ConsistencyError("raw(frame_data)", 0, parent.size() - parent.pos());
                                    }
                                });
                            }
                            ((FdScanned) (this.frameData))._write_Seq(_io__raw_frameData);
                            break;
                        }
                        case SPECTROSCOPY: {
                            final KaitaiStream _io__raw_frameData = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
                            this._io.addChildStream(_io__raw_frameData);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
                                final FrameMain _this = this;
                                _io__raw_frameData.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_frameData = _io__raw_frameData.toByteArray();
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_frameData)))));
                                        if (!(parent.isEof()))
                                            throw new ConsistencyError("raw(frame_data)", 0, parent.size() - parent.pos());
                                    }
                                });
                            }
                            ((FdSpectroscopy) (this.frameData))._write_Seq(_io__raw_frameData);
                            break;
                        }
                        default: {
                            this._io.writeBytes(((byte[]) (((byte[]) (this.frameData)))));
                            if (!(this._io.isEof()))
                                throw new ConsistencyError("frame_data", 0, this._io.size() - this._io.pos());
                            break;
                        }
                        }
                    } else {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.frameData)))));
                        if (!(this._io.isEof()))
                            throw new ConsistencyError("frame_data", 0, this._io.size() - this._io.pos());
                    }
                }
            }

            public void _check() {
                if (!Objects.equals(this.version._root(), _root()))
                    throw new ConsistencyError("version", _root(), this.version._root());
                if (!Objects.equals(this.version._parent(), this))
                    throw new ConsistencyError("version", this, this.version._parent());
                if (!Objects.equals(this.dateTime._root(), _root()))
                    throw new ConsistencyError("date_time", _root(), this.dateTime._root());
                if (!Objects.equals(this.dateTime._parent(), this))
                    throw new ConsistencyError("date_time", this, this.dateTime._parent());
                {
                    FrameType on = type();
                    if (on != null) {
                        switch (type()) {
                        case CURVES: {
                            if (!Objects.equals(((NtMdt.Frame.FdSpectroscopy) (this.frameData))._root(), _root()))
                                throw new ConsistencyError("frame_data", _root(), ((NtMdt.Frame.FdSpectroscopy) (this.frameData))._root());
                            if (!Objects.equals(((NtMdt.Frame.FdSpectroscopy) (this.frameData))._parent(), this))
                                throw new ConsistencyError("frame_data", this, ((NtMdt.Frame.FdSpectroscopy) (this.frameData))._parent());
                            break;
                        }
                        case CURVES_NEW: {
                            if (!Objects.equals(((NtMdt.Frame.FdCurvesNew) (this.frameData))._root(), _root()))
                                throw new ConsistencyError("frame_data", _root(), ((NtMdt.Frame.FdCurvesNew) (this.frameData))._root());
                            if (!Objects.equals(((NtMdt.Frame.FdCurvesNew) (this.frameData))._parent(), this))
                                throw new ConsistencyError("frame_data", this, ((NtMdt.Frame.FdCurvesNew) (this.frameData))._parent());
                            break;
                        }
                        case MDA: {
                            if (!Objects.equals(((NtMdt.Frame.FdMetaData) (this.frameData))._root(), _root()))
                                throw new ConsistencyError("frame_data", _root(), ((NtMdt.Frame.FdMetaData) (this.frameData))._root());
                            if (!Objects.equals(((NtMdt.Frame.FdMetaData) (this.frameData))._parent(), this))
                                throw new ConsistencyError("frame_data", this, ((NtMdt.Frame.FdMetaData) (this.frameData))._parent());
                            break;
                        }
                        case SCANNED: {
                            if (!Objects.equals(((NtMdt.Frame.FdScanned) (this.frameData))._root(), _root()))
                                throw new ConsistencyError("frame_data", _root(), ((NtMdt.Frame.FdScanned) (this.frameData))._root());
                            if (!Objects.equals(((NtMdt.Frame.FdScanned) (this.frameData))._parent(), this))
                                throw new ConsistencyError("frame_data", this, ((NtMdt.Frame.FdScanned) (this.frameData))._parent());
                            break;
                        }
                        case SPECTROSCOPY: {
                            if (!Objects.equals(((NtMdt.Frame.FdSpectroscopy) (this.frameData))._root(), _root()))
                                throw new ConsistencyError("frame_data", _root(), ((NtMdt.Frame.FdSpectroscopy) (this.frameData))._root());
                            if (!Objects.equals(((NtMdt.Frame.FdSpectroscopy) (this.frameData))._parent(), this))
                                throw new ConsistencyError("frame_data", this, ((NtMdt.Frame.FdSpectroscopy) (this.frameData))._parent());
                            break;
                        }
                        default: {
                            break;
                        }
                        }
                    } else {
                    }
                }
                _dirty = false;
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
            public void setType(FrameType _v) { _dirty = true; type = _v; }
            public Version version() { return version; }
            public void setVersion(Version _v) { _dirty = true; version = _v; }
            public DateTime dateTime() { return dateTime; }
            public void setDateTime(DateTime _v) { _dirty = true; dateTime = _v; }

            /**
             * h_am, v6 and older only
             */
            public int varSize() { return varSize; }
            public void setVarSize(int _v) { _dirty = true; varSize = _v; }

            /**
             * 
             */
            public Object frameData() { return frameData; }
            public void setFrameData(Object _v) { _dirty = true; frameData = _v; }
            public NtMdt _root() { return _root; }
            public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
            public NtMdt.Frame _parent() { return _parent; }
            public void set_parent(NtMdt.Frame _v) { _dirty = true; _parent = _v; }
            public byte[] _raw_frameData() { return _raw_frameData; }
            public void set_raw_FrameData(byte[] _v) { _dirty = true; _raw_frameData = _v; }
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
        public void setSize(long _v) { _dirty = true; size = _v; }
        public FrameMain main() { return main; }
        public void setMain(FrameMain _v) { _dirty = true; main = _v; }
        public NtMdt _root() { return _root; }
        public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
        public NtMdt.Framez _parent() { return _parent; }
        public void set_parent(NtMdt.Framez _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_main() { return _raw_main; }
        public void set_raw_Main(byte[] _v) { _dirty = true; _raw_main = _v; }
    }
    public static class Framez extends KaitaiStruct.ReadWrite {
        public static Framez fromFile(String fileName) throws IOException {
            return new Framez(new ByteBufferKaitaiStream(fileName));
        }
        public Framez() {
            this(null, null, null);
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
        }
        public void _read() {
            this.frames = new ArrayList<Frame>();
            for (int i = 0; i < _root().lastFrame() + 1; i++) {
                Frame _t_frames = new Frame(this._io, this, _root);
                try {
                    _t_frames._read();
                } finally {
                    this.frames.add(_t_frames);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.frames.size(); i++) {
                this.frames.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.frames.size(); i++) {
                this.frames.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.frames.size() != _root().lastFrame() + 1)
                throw new ConsistencyError("frames", _root().lastFrame() + 1, this.frames.size());
            for (int i = 0; i < this.frames.size(); i++) {
                if (!Objects.equals(this.frames.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("frames", _root(), this.frames.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.frames.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("frames", this, this.frames.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<Frame> frames;
        private NtMdt _root;
        private NtMdt _parent;
        public List<Frame> frames() { return frames; }
        public void setFrames(List<Frame> _v) { _dirty = true; frames = _v; }
        public NtMdt _root() { return _root; }
        public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
        public NtMdt _parent() { return _parent; }
        public void set_parent(NtMdt _v) { _dirty = true; _parent = _v; }
    }
    public static class Title extends KaitaiStruct.ReadWrite {
        public static Title fromFile(String fileName) throws IOException {
            return new Title(new ByteBufferKaitaiStream(fileName));
        }
        public Title() {
            this(null, null, null);
        }

        public Title(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Title(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Title(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, NtMdt _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.titleLen = this._io.readU4le();
            this.title = new String(this._io.readBytes(titleLen()), Charset.forName("windows-1251"));
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.titleLen);
            this._io.writeBytes((this.title).getBytes(Charset.forName("windows-1251")));
        }

        public void _check() {
            if ((this.title).getBytes(Charset.forName("windows-1251")).length != titleLen())
                throw new ConsistencyError("title", titleLen(), (this.title).getBytes(Charset.forName("windows-1251")).length);
            _dirty = false;
        }
        private long titleLen;
        private String title;
        private NtMdt _root;
        private KaitaiStruct.ReadWrite _parent;
        public long titleLen() { return titleLen; }
        public void setTitleLen(long _v) { _dirty = true; titleLen = _v; }
        public String title() { return title; }
        public void setTitle(String _v) { _dirty = true; title = _v; }
        public NtMdt _root() { return _root; }
        public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class Uuid extends KaitaiStruct.ReadWrite {
        public static Uuid fromFile(String fileName) throws IOException {
            return new Uuid(new ByteBufferKaitaiStream(fileName));
        }
        public Uuid() {
            this(null, null, null);
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
        }
        public void _read() {
            this.data = new ArrayList<Integer>();
            for (int i = 0; i < 16; i++) {
                this.data.add(this._io.readU1());
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.data.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.data.size(); i++) {
                this._io.writeU1(this.data.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (this.data.size() != 16)
                throw new ConsistencyError("data", 16, this.data.size());
            for (int i = 0; i < this.data.size(); i++) {
            }
            _dirty = false;
        }
        private List<Integer> data;
        private NtMdt _root;
        private NtMdt.Frame.FdMetaData _parent;
        public List<Integer> data() { return data; }
        public void setData(List<Integer> _v) { _dirty = true; data = _v; }
        public NtMdt _root() { return _root; }
        public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
        public NtMdt.Frame.FdMetaData _parent() { return _parent; }
        public void set_parent(NtMdt.Frame.FdMetaData _v) { _dirty = true; _parent = _v; }
    }
    public static class Version extends KaitaiStruct.ReadWrite {
        public static Version fromFile(String fileName) throws IOException {
            return new Version(new ByteBufferKaitaiStream(fileName));
        }
        public Version() {
            this(null, null, null);
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
        }
        public void _read() {
            this.minor = this._io.readU1();
            this.major = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.minor);
            this._io.writeU1(this.major);
        }

        public void _check() {
            _dirty = false;
        }
        private int minor;
        private int major;
        private NtMdt _root;
        private NtMdt.Frame.FrameMain _parent;
        public int minor() { return minor; }
        public void setMinor(int _v) { _dirty = true; minor = _v; }
        public int major() { return major; }
        public void setMajor(int _v) { _dirty = true; major = _v; }
        public NtMdt _root() { return _root; }
        public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
        public NtMdt.Frame.FrameMain _parent() { return _parent; }
        public void set_parent(NtMdt.Frame.FrameMain _v) { _dirty = true; _parent = _v; }
    }
    public static class Xml extends KaitaiStruct.ReadWrite {
        public static Xml fromFile(String fileName) throws IOException {
            return new Xml(new ByteBufferKaitaiStream(fileName));
        }
        public Xml() {
            this(null, null, null);
        }

        public Xml(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Xml(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Xml(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, NtMdt _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.xmlLen = this._io.readU4le();
            this.xml = new String(this._io.readBytes(xmlLen()), StandardCharsets.UTF_16LE);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.xmlLen);
            this._io.writeBytes((this.xml).getBytes(Charset.forName("UTF-16LE")));
        }

        public void _check() {
            if ((this.xml).getBytes(Charset.forName("UTF-16LE")).length != xmlLen())
                throw new ConsistencyError("xml", xmlLen(), (this.xml).getBytes(Charset.forName("UTF-16LE")).length);
            _dirty = false;
        }
        private long xmlLen;
        private String xml;
        private NtMdt _root;
        private KaitaiStruct.ReadWrite _parent;
        public long xmlLen() { return xmlLen; }
        public void setXmlLen(long _v) { _dirty = true; xmlLen = _v; }
        public String xml() { return xml; }
        public void setXml(String _v) { _dirty = true; xml = _v; }
        public NtMdt _root() { return _root; }
        public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    private byte[] signature;
    private long size;
    private byte[] reserved0;
    private int lastFrame;
    private byte[] reserved1;
    private byte[] wrondDoc;
    private Framez frames;
    private NtMdt _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_frames;
    public byte[] signature() { return signature; }
    public void setSignature(byte[] _v) { _dirty = true; signature = _v; }

    /**
     * File size (w/o header)
     */
    public long size() { return size; }
    public void setSize(long _v) { _dirty = true; size = _v; }
    public byte[] reserved0() { return reserved0; }
    public void setReserved0(byte[] _v) { _dirty = true; reserved0 = _v; }
    public int lastFrame() { return lastFrame; }
    public void setLastFrame(int _v) { _dirty = true; lastFrame = _v; }
    public byte[] reserved1() { return reserved1; }
    public void setReserved1(byte[] _v) { _dirty = true; reserved1 = _v; }

    /**
     * documentation specifies 32 bytes long header, but zeroth frame starts at 33th byte in reality
     */
    public byte[] wrondDoc() { return wrondDoc; }
    public void setWrondDoc(byte[] _v) { _dirty = true; wrondDoc = _v; }
    public Framez frames() { return frames; }
    public void setFrames(Framez _v) { _dirty = true; frames = _v; }
    public NtMdt _root() { return _root; }
    public void set_root(NtMdt _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_frames() { return _raw_frames; }
    public void set_raw_Frames(byte[] _v) { _dirty = true; _raw_frames = _v; }
}
