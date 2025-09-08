// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.List;
import java.util.Arrays;


/**
 * WMF (Windows Metafile) is a relatively early vector image format
 * introduced for Microsoft Windows in 1990.
 * 
 * Inside, it provides a serialized list of Windows GDI (Graphics
 * Device Interface) function calls, which, if played back, result in
 * an image being drawn on a given surface (display, off-screen buffer,
 * printer, etc).
 * @see <a href="https://www.loc.gov/preservation/digital/formats/digformatspecs/WindowsMetafileFormat(wmf)Specification.pdf">Source</a>
 */
public class Wmf extends KaitaiStruct.ReadWrite {
    public static Wmf fromFile(String fileName) throws IOException {
        return new Wmf(new ByteBufferKaitaiStream(fileName));
    }

    public enum BinRasterOp {
        BLACK(1),
        NOTMERGEPEN(2),
        MASKNOTPEN(3),
        NOTCOPYPEN(4),
        MASKPENNOT(5),
        NOT(6),
        XORPEN(7),
        NOTMASKPEN(8),
        MASKPEN(9),
        NOTXORPEN(10),
        NOP(11),
        MERGENOTPEN(12),
        COPYPEN(13),
        MERGEPENNOT(14),
        MERGEPEN(15),
        WHITE(16);

        private final long id;
        BinRasterOp(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, BinRasterOp> byId = new HashMap<Long, BinRasterOp>(16);
        static {
            for (BinRasterOp e : BinRasterOp.values())
                byId.put(e.id(), e);
        }
        public static BinRasterOp byId(long id) { return byId.get(id); }
    }

    public enum Func {
        EOF(0),
        SAVEDC(30),
        REALIZEPALETTE(53),
        SETPALENTRIES(55),
        CREATEPALETTE(247),
        SETBKMODE(258),
        SETMAPMODE(259),
        SETROP2(260),
        SETRELABS(261),
        SETPOLYFILLMODE(262),
        SETSTRETCHBLTMODE(263),
        SETTEXTCHAREXTRA(264),
        RESTOREDC(295),
        INVERTREGION(298),
        PAINTREGION(299),
        SELECTCLIPREGION(300),
        SELECTOBJECT(301),
        SETTEXTALIGN(302),
        RESIZEPALETTE(313),
        DIBCREATEPATTERNBRUSH(322),
        SETLAYOUT(329),
        DELETEOBJECT(496),
        CREATEPATTERNBRUSH(505),
        SETBKCOLOR(513),
        SETTEXTCOLOR(521),
        SETTEXTJUSTIFICATION(522),
        SETWINDOWORG(523),
        SETWINDOWEXT(524),
        SETVIEWPORTORG(525),
        SETVIEWPORTEXT(526),
        OFFSETWINDOWORG(527),
        OFFSETVIEWPORTORG(529),
        LINETO(531),
        MOVETO(532),
        OFFSETCLIPRGN(544),
        FILLREGION(552),
        SETMAPPERFLAGS(561),
        SELECTPALETTE(564),
        CREATEPENINDIRECT(762),
        CREATEFONTINDIRECT(763),
        CREATEBRUSHINDIRECT(764),
        POLYGON(804),
        POLYLINE(805),
        SCALEWINDOWEXT(1040),
        SCALEVIEWPORTEXT(1042),
        EXCLUDECLIPRECT(1045),
        INTERSECTCLIPRECT(1046),
        ELLIPSE(1048),
        FLOODFILL(1049),
        RECTANGLE(1051),
        SETPIXEL(1055),
        FRAMEREGION(1065),
        ANIMATEPALETTE(1078),
        TEXTOUT(1313),
        POLYPOLYGON(1336),
        EXTFLOODFILL(1352),
        ROUNDRECT(1564),
        PATBLT(1565),
        ESCAPE(1574),
        CREATEREGION(1791),
        ARC(2071),
        PIE(2074),
        CHORD(2096),
        BITBLT(2338),
        DIBBITBLT(2368),
        EXTTEXTOUT(2610),
        STRETCHBLT(2851),
        DIBSTRETCHBLT(2881),
        SETDIBTODEV(3379),
        STRETCHDIB(3907);

        private final long id;
        Func(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Func> byId = new HashMap<Long, Func>(70);
        static {
            for (Func e : Func.values())
                byId.put(e.id(), e);
        }
        public static Func byId(long id) { return byId.get(id); }
    }

    public enum MixMode {
        TRANSPARENT(1),
        OPAQUE(2);

        private final long id;
        MixMode(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, MixMode> byId = new HashMap<Long, MixMode>(2);
        static {
            for (MixMode e : MixMode.values())
                byId.put(e.id(), e);
        }
        public static MixMode byId(long id) { return byId.get(id); }
    }

    public enum PolyFillMode {
        ALTERNATE(1),
        WINDING(2);

        private final long id;
        PolyFillMode(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, PolyFillMode> byId = new HashMap<Long, PolyFillMode>(2);
        static {
            for (PolyFillMode e : PolyFillMode.values())
                byId.put(e.id(), e);
        }
        public static PolyFillMode byId(long id) { return byId.get(id); }
    }
    public Wmf() {
        this(null, null, null);
    }

    public Wmf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Wmf(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Wmf(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Wmf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.specialHeader = new SpecialHeader(this._io, this, _root);
        this.specialHeader._read();
        this.header = new Header(this._io, this, _root);
        this.header._read();
        this.records = new ArrayList<Record>();
        {
            Record _it;
            int i = 0;
            do {
                Record _t_records = new Record(this._io, this, _root);
                try {
                    _t_records._read();
                } finally {
                    _it = _t_records;
                    this.records.add(_it);
                }
                i++;
            } while (!(_it.function() == Func.EOF));
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.specialHeader._fetchInstances();
        this.header._fetchInstances();
        for (int i = 0; i < this.records.size(); i++) {
            this.records.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.specialHeader._write_Seq(this._io);
        this.header._write_Seq(this._io);
        for (int i = 0; i < this.records.size(); i++) {
            this.records.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (!Objects.equals(this.specialHeader._root(), _root()))
            throw new ConsistencyError("special_header", _root(), this.specialHeader._root());
        if (!Objects.equals(this.specialHeader._parent(), this))
            throw new ConsistencyError("special_header", this, this.specialHeader._parent());
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (this.records.size() == 0)
            throw new ConsistencyError("records", 0, this.records.size());
        for (int i = 0; i < this.records.size(); i++) {
            if (!Objects.equals(this.records.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("records", _root(), this.records.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.records.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("records", this, this.records.get(((Number) (i)).intValue())._parent());
            {
                Record _it = this.records.get(((Number) (i)).intValue());
                if ((_it.function() == Func.EOF) != (i == this.records.size() - 1))
                    throw new ConsistencyError("records", i == this.records.size() - 1, _it.function() == Func.EOF);
            }
        }
        _dirty = false;
    }

    /**
     * @see "section 2.2.1.7"
     */
    public static class ColorRef extends KaitaiStruct.ReadWrite {
        public static ColorRef fromFile(String fileName) throws IOException {
            return new ColorRef(new ByteBufferKaitaiStream(fileName));
        }
        public ColorRef() {
            this(null, null, null);
        }

        public ColorRef(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ColorRef(KaitaiStream _io, Wmf.Record _parent) {
            this(_io, _parent, null);
        }

        public ColorRef(KaitaiStream _io, Wmf.Record _parent, Wmf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.red = this._io.readU1();
            this.green = this._io.readU1();
            this.blue = this._io.readU1();
            this.reserved = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.red);
            this._io.writeU1(this.green);
            this._io.writeU1(this.blue);
            this._io.writeU1(this.reserved);
        }

        public void _check() {
            _dirty = false;
        }
        private int red;
        private int green;
        private int blue;
        private int reserved;
        private Wmf _root;
        private Wmf.Record _parent;
        public int red() { return red; }
        public void setRed(int _v) { _dirty = true; red = _v; }
        public int green() { return green; }
        public void setGreen(int _v) { _dirty = true; green = _v; }
        public int blue() { return blue; }
        public void setBlue(int _v) { _dirty = true; blue = _v; }
        public int reserved() { return reserved; }
        public void setReserved(int _v) { _dirty = true; reserved = _v; }
        public Wmf _root() { return _root; }
        public void set_root(Wmf _v) { _dirty = true; _root = _v; }
        public Wmf.Record _parent() { return _parent; }
        public void set_parent(Wmf.Record _v) { _dirty = true; _parent = _v; }
    }
    public static class Header extends KaitaiStruct.ReadWrite {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }

        public enum MetafileType {
            MEMORY_METAFILE(1),
            DISK_METAFILE(2);

            private final long id;
            MetafileType(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, MetafileType> byId = new HashMap<Long, MetafileType>(2);
            static {
                for (MetafileType e : MetafileType.values())
                    byId.put(e.id(), e);
            }
            public static MetafileType byId(long id) { return byId.get(id); }
        }
        public Header() {
            this(null, null, null);
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, Wmf _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Wmf _parent, Wmf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.metafileType = MetafileType.byId(this._io.readU2le());
            this.headerSize = this._io.readU2le();
            this.version = this._io.readU2le();
            this.size = this._io.readU4le();
            this.numberOfObjects = this._io.readU2le();
            this.maxRecord = this._io.readU4le();
            this.numberOfMembers = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(((Number) (this.metafileType.id())).intValue());
            this._io.writeU2le(this.headerSize);
            this._io.writeU2le(this.version);
            this._io.writeU4le(this.size);
            this._io.writeU2le(this.numberOfObjects);
            this._io.writeU4le(this.maxRecord);
            this._io.writeU2le(this.numberOfMembers);
        }

        public void _check() {
            _dirty = false;
        }
        private MetafileType metafileType;
        private int headerSize;
        private int version;
        private long size;
        private int numberOfObjects;
        private long maxRecord;
        private int numberOfMembers;
        private Wmf _root;
        private Wmf _parent;
        public MetafileType metafileType() { return metafileType; }
        public void setMetafileType(MetafileType _v) { _dirty = true; metafileType = _v; }
        public int headerSize() { return headerSize; }
        public void setHeaderSize(int _v) { _dirty = true; headerSize = _v; }
        public int version() { return version; }
        public void setVersion(int _v) { _dirty = true; version = _v; }
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }
        public int numberOfObjects() { return numberOfObjects; }
        public void setNumberOfObjects(int _v) { _dirty = true; numberOfObjects = _v; }
        public long maxRecord() { return maxRecord; }
        public void setMaxRecord(long _v) { _dirty = true; maxRecord = _v; }
        public int numberOfMembers() { return numberOfMembers; }
        public void setNumberOfMembers(int _v) { _dirty = true; numberOfMembers = _v; }
        public Wmf _root() { return _root; }
        public void set_root(Wmf _v) { _dirty = true; _root = _v; }
        public Wmf _parent() { return _parent; }
        public void set_parent(Wmf _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see "section 2.3.3.15 = params_polyline"
     */
    public static class ParamsPolygon extends KaitaiStruct.ReadWrite {
        public static ParamsPolygon fromFile(String fileName) throws IOException {
            return new ParamsPolygon(new ByteBufferKaitaiStream(fileName));
        }
        public ParamsPolygon() {
            this(null, null, null);
        }

        public ParamsPolygon(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ParamsPolygon(KaitaiStream _io, Wmf.Record _parent) {
            this(_io, _parent, null);
        }

        public ParamsPolygon(KaitaiStream _io, Wmf.Record _parent, Wmf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.numPoints = this._io.readS2le();
            this.points = new ArrayList<PointS>();
            for (int i = 0; i < numPoints(); i++) {
                PointS _t_points = new PointS(this._io, this, _root);
                try {
                    _t_points._read();
                } finally {
                    this.points.add(_t_points);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS2le(this.numPoints);
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.points.size() != numPoints())
                throw new ConsistencyError("points", numPoints(), this.points.size());
            for (int i = 0; i < this.points.size(); i++) {
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("points", _root(), this.points.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("points", this, this.points.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private short numPoints;
        private List<PointS> points;
        private Wmf _root;
        private Wmf.Record _parent;
        public short numPoints() { return numPoints; }
        public void setNumPoints(short _v) { _dirty = true; numPoints = _v; }
        public List<PointS> points() { return points; }
        public void setPoints(List<PointS> _v) { _dirty = true; points = _v; }
        public Wmf _root() { return _root; }
        public void set_root(Wmf _v) { _dirty = true; _root = _v; }
        public Wmf.Record _parent() { return _parent; }
        public void set_parent(Wmf.Record _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see "section 2.3.3.14"
     */
    public static class ParamsPolyline extends KaitaiStruct.ReadWrite {
        public static ParamsPolyline fromFile(String fileName) throws IOException {
            return new ParamsPolyline(new ByteBufferKaitaiStream(fileName));
        }
        public ParamsPolyline() {
            this(null, null, null);
        }

        public ParamsPolyline(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ParamsPolyline(KaitaiStream _io, Wmf.Record _parent) {
            this(_io, _parent, null);
        }

        public ParamsPolyline(KaitaiStream _io, Wmf.Record _parent, Wmf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.numPoints = this._io.readS2le();
            this.points = new ArrayList<PointS>();
            for (int i = 0; i < numPoints(); i++) {
                PointS _t_points = new PointS(this._io, this, _root);
                try {
                    _t_points._read();
                } finally {
                    this.points.add(_t_points);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS2le(this.numPoints);
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.points.size() != numPoints())
                throw new ConsistencyError("points", numPoints(), this.points.size());
            for (int i = 0; i < this.points.size(); i++) {
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("points", _root(), this.points.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("points", this, this.points.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private short numPoints;
        private List<PointS> points;
        private Wmf _root;
        private Wmf.Record _parent;
        public short numPoints() { return numPoints; }
        public void setNumPoints(short _v) { _dirty = true; numPoints = _v; }
        public List<PointS> points() { return points; }
        public void setPoints(List<PointS> _v) { _dirty = true; points = _v; }
        public Wmf _root() { return _root; }
        public void set_root(Wmf _v) { _dirty = true; _root = _v; }
        public Wmf.Record _parent() { return _parent; }
        public void set_parent(Wmf.Record _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see "section 2.3.5.15"
     */
    public static class ParamsSetbkmode extends KaitaiStruct.ReadWrite {
        public static ParamsSetbkmode fromFile(String fileName) throws IOException {
            return new ParamsSetbkmode(new ByteBufferKaitaiStream(fileName));
        }
        public ParamsSetbkmode() {
            this(null, null, null);
        }

        public ParamsSetbkmode(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ParamsSetbkmode(KaitaiStream _io, Wmf.Record _parent) {
            this(_io, _parent, null);
        }

        public ParamsSetbkmode(KaitaiStream _io, Wmf.Record _parent, Wmf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.bkMode = Wmf.MixMode.byId(this._io.readU2le());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(((Number) (this.bkMode.id())).intValue());
        }

        public void _check() {
            _dirty = false;
        }
        private MixMode bkMode;
        private Wmf _root;
        private Wmf.Record _parent;

        /**
         * Defines current graphic context background mix mode.
         */
        public MixMode bkMode() { return bkMode; }
        public void setBkMode(MixMode _v) { _dirty = true; bkMode = _v; }
        public Wmf _root() { return _root; }
        public void set_root(Wmf _v) { _dirty = true; _root = _v; }
        public Wmf.Record _parent() { return _parent; }
        public void set_parent(Wmf.Record _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see "section 2.3.5.20"
     */
    public static class ParamsSetpolyfillmode extends KaitaiStruct.ReadWrite {
        public static ParamsSetpolyfillmode fromFile(String fileName) throws IOException {
            return new ParamsSetpolyfillmode(new ByteBufferKaitaiStream(fileName));
        }
        public ParamsSetpolyfillmode() {
            this(null, null, null);
        }

        public ParamsSetpolyfillmode(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ParamsSetpolyfillmode(KaitaiStream _io, Wmf.Record _parent) {
            this(_io, _parent, null);
        }

        public ParamsSetpolyfillmode(KaitaiStream _io, Wmf.Record _parent, Wmf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.polyFillMode = Wmf.PolyFillMode.byId(this._io.readU2le());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(((Number) (this.polyFillMode.id())).intValue());
        }

        public void _check() {
            _dirty = false;
        }
        private PolyFillMode polyFillMode;
        private Wmf _root;
        private Wmf.Record _parent;

        /**
         * Defines current polygon fill mode.
         */
        public PolyFillMode polyFillMode() { return polyFillMode; }
        public void setPolyFillMode(PolyFillMode _v) { _dirty = true; polyFillMode = _v; }
        public Wmf _root() { return _root; }
        public void set_root(Wmf _v) { _dirty = true; _root = _v; }
        public Wmf.Record _parent() { return _parent; }
        public void set_parent(Wmf.Record _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see "section 2.3.5.22"
     */
    public static class ParamsSetrop2 extends KaitaiStruct.ReadWrite {
        public static ParamsSetrop2 fromFile(String fileName) throws IOException {
            return new ParamsSetrop2(new ByteBufferKaitaiStream(fileName));
        }
        public ParamsSetrop2() {
            this(null, null, null);
        }

        public ParamsSetrop2(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ParamsSetrop2(KaitaiStream _io, Wmf.Record _parent) {
            this(_io, _parent, null);
        }

        public ParamsSetrop2(KaitaiStream _io, Wmf.Record _parent, Wmf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.drawMode = Wmf.BinRasterOp.byId(this._io.readU2le());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(((Number) (this.drawMode.id())).intValue());
        }

        public void _check() {
            _dirty = false;
        }
        private BinRasterOp drawMode;
        private Wmf _root;
        private Wmf.Record _parent;

        /**
         * Defines current foreground binary raster operation mixing mode.
         */
        public BinRasterOp drawMode() { return drawMode; }
        public void setDrawMode(BinRasterOp _v) { _dirty = true; drawMode = _v; }
        public Wmf _root() { return _root; }
        public void set_root(Wmf _v) { _dirty = true; _root = _v; }
        public Wmf.Record _parent() { return _parent; }
        public void set_parent(Wmf.Record _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see "section 2.3.5.30"
     */
    public static class ParamsSetwindowext extends KaitaiStruct.ReadWrite {
        public static ParamsSetwindowext fromFile(String fileName) throws IOException {
            return new ParamsSetwindowext(new ByteBufferKaitaiStream(fileName));
        }
        public ParamsSetwindowext() {
            this(null, null, null);
        }

        public ParamsSetwindowext(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ParamsSetwindowext(KaitaiStream _io, Wmf.Record _parent) {
            this(_io, _parent, null);
        }

        public ParamsSetwindowext(KaitaiStream _io, Wmf.Record _parent, Wmf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.y = this._io.readS2le();
            this.x = this._io.readS2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS2le(this.y);
            this._io.writeS2le(this.x);
        }

        public void _check() {
            _dirty = false;
        }
        private short y;
        private short x;
        private Wmf _root;
        private Wmf.Record _parent;

        /**
         * Vertical extent of the window in logical units.
         */
        public short y() { return y; }
        public void setY(short _v) { _dirty = true; y = _v; }

        /**
         * Horizontal extent of the window in logical units.
         */
        public short x() { return x; }
        public void setX(short _v) { _dirty = true; x = _v; }
        public Wmf _root() { return _root; }
        public void set_root(Wmf _v) { _dirty = true; _root = _v; }
        public Wmf.Record _parent() { return _parent; }
        public void set_parent(Wmf.Record _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see "section 2.3.5.31"
     */
    public static class ParamsSetwindoworg extends KaitaiStruct.ReadWrite {
        public static ParamsSetwindoworg fromFile(String fileName) throws IOException {
            return new ParamsSetwindoworg(new ByteBufferKaitaiStream(fileName));
        }
        public ParamsSetwindoworg() {
            this(null, null, null);
        }

        public ParamsSetwindoworg(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ParamsSetwindoworg(KaitaiStream _io, Wmf.Record _parent) {
            this(_io, _parent, null);
        }

        public ParamsSetwindoworg(KaitaiStream _io, Wmf.Record _parent, Wmf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.y = this._io.readS2le();
            this.x = this._io.readS2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS2le(this.y);
            this._io.writeS2le(this.x);
        }

        public void _check() {
            _dirty = false;
        }
        private short y;
        private short x;
        private Wmf _root;
        private Wmf.Record _parent;

        /**
         * Y coordinate of the window origin, in logical units.
         */
        public short y() { return y; }
        public void setY(short _v) { _dirty = true; y = _v; }

        /**
         * X coordinate of the window origin, in logical units.
         */
        public short x() { return x; }
        public void setX(short _v) { _dirty = true; x = _v; }
        public Wmf _root() { return _root; }
        public void set_root(Wmf _v) { _dirty = true; _root = _v; }
        public Wmf.Record _parent() { return _parent; }
        public void set_parent(Wmf.Record _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see "section 2.2.1.12"
     */
    public static class PointS extends KaitaiStruct.ReadWrite {
        public static PointS fromFile(String fileName) throws IOException {
            return new PointS(new ByteBufferKaitaiStream(fileName));
        }
        public PointS() {
            this(null, null, null);
        }

        public PointS(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PointS(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public PointS(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Wmf _root) {
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
        private Wmf _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * X coordinate of the point, in logical units.
         */
        public short x() { return x; }
        public void setX(short _v) { _dirty = true; x = _v; }

        /**
         * Y coordinate of the point, in logical units.
         */
        public short y() { return y; }
        public void setY(short _v) { _dirty = true; y = _v; }
        public Wmf _root() { return _root; }
        public void set_root(Wmf _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class Record extends KaitaiStruct.ReadWrite {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new ByteBufferKaitaiStream(fileName));
        }
        public Record() {
            this(null, null, null);
        }

        public Record(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Record(KaitaiStream _io, Wmf _parent) {
            this(_io, _parent, null);
        }

        public Record(KaitaiStream _io, Wmf _parent, Wmf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.size = this._io.readU4le();
            this.function = Wmf.Func.byId(this._io.readU2le());
            {
                Func on = function();
                if (on != null) {
                    switch (function()) {
                    case POLYGON: {
                        this._raw_params = this._io.readBytes((size() - 3) * 2);
                        KaitaiStream _io__raw_params = new ByteBufferKaitaiStream(this._raw_params);
                        this.params = new ParamsPolygon(_io__raw_params, this, _root);
                        ((ParamsPolygon) (this.params))._read();
                        break;
                    }
                    case POLYLINE: {
                        this._raw_params = this._io.readBytes((size() - 3) * 2);
                        KaitaiStream _io__raw_params = new ByteBufferKaitaiStream(this._raw_params);
                        this.params = new ParamsPolyline(_io__raw_params, this, _root);
                        ((ParamsPolyline) (this.params))._read();
                        break;
                    }
                    case SETBKCOLOR: {
                        this._raw_params = this._io.readBytes((size() - 3) * 2);
                        KaitaiStream _io__raw_params = new ByteBufferKaitaiStream(this._raw_params);
                        this.params = new ColorRef(_io__raw_params, this, _root);
                        ((ColorRef) (this.params))._read();
                        break;
                    }
                    case SETBKMODE: {
                        this._raw_params = this._io.readBytes((size() - 3) * 2);
                        KaitaiStream _io__raw_params = new ByteBufferKaitaiStream(this._raw_params);
                        this.params = new ParamsSetbkmode(_io__raw_params, this, _root);
                        ((ParamsSetbkmode) (this.params))._read();
                        break;
                    }
                    case SETPOLYFILLMODE: {
                        this._raw_params = this._io.readBytes((size() - 3) * 2);
                        KaitaiStream _io__raw_params = new ByteBufferKaitaiStream(this._raw_params);
                        this.params = new ParamsSetpolyfillmode(_io__raw_params, this, _root);
                        ((ParamsSetpolyfillmode) (this.params))._read();
                        break;
                    }
                    case SETROP2: {
                        this._raw_params = this._io.readBytes((size() - 3) * 2);
                        KaitaiStream _io__raw_params = new ByteBufferKaitaiStream(this._raw_params);
                        this.params = new ParamsSetrop2(_io__raw_params, this, _root);
                        ((ParamsSetrop2) (this.params))._read();
                        break;
                    }
                    case SETWINDOWEXT: {
                        this._raw_params = this._io.readBytes((size() - 3) * 2);
                        KaitaiStream _io__raw_params = new ByteBufferKaitaiStream(this._raw_params);
                        this.params = new ParamsSetwindowext(_io__raw_params, this, _root);
                        ((ParamsSetwindowext) (this.params))._read();
                        break;
                    }
                    case SETWINDOWORG: {
                        this._raw_params = this._io.readBytes((size() - 3) * 2);
                        KaitaiStream _io__raw_params = new ByteBufferKaitaiStream(this._raw_params);
                        this.params = new ParamsSetwindoworg(_io__raw_params, this, _root);
                        ((ParamsSetwindoworg) (this.params))._read();
                        break;
                    }
                    default: {
                        this.params = this._io.readBytes((size() - 3) * 2);
                        break;
                    }
                    }
                } else {
                    this.params = this._io.readBytes((size() - 3) * 2);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                Func on = function();
                if (on != null) {
                    switch (function()) {
                    case POLYGON: {
                        ((ParamsPolygon) (this.params))._fetchInstances();
                        break;
                    }
                    case POLYLINE: {
                        ((ParamsPolyline) (this.params))._fetchInstances();
                        break;
                    }
                    case SETBKCOLOR: {
                        ((ColorRef) (this.params))._fetchInstances();
                        break;
                    }
                    case SETBKMODE: {
                        ((ParamsSetbkmode) (this.params))._fetchInstances();
                        break;
                    }
                    case SETPOLYFILLMODE: {
                        ((ParamsSetpolyfillmode) (this.params))._fetchInstances();
                        break;
                    }
                    case SETROP2: {
                        ((ParamsSetrop2) (this.params))._fetchInstances();
                        break;
                    }
                    case SETWINDOWEXT: {
                        ((ParamsSetwindowext) (this.params))._fetchInstances();
                        break;
                    }
                    case SETWINDOWORG: {
                        ((ParamsSetwindoworg) (this.params))._fetchInstances();
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
            this._io.writeU4le(this.size);
            this._io.writeU2le(((Number) (this.function.id())).intValue());
            {
                Func on = function();
                if (on != null) {
                    switch (function()) {
                    case POLYGON: {
                        final KaitaiStream _io__raw_params = new ByteBufferKaitaiStream((size() - 3) * 2);
                        this._io.addChildStream(_io__raw_params);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + ((size() - 3) * 2));
                            final Record _this = this;
                            _io__raw_params.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_params = _io__raw_params.toByteArray();
                                    if (((byte[]) (_this._raw_params)).length != (size() - 3) * 2)
                                        throw new ConsistencyError("raw(params)", (size() - 3) * 2, ((byte[]) (_this._raw_params)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_params)))));
                                }
                            });
                        }
                        ((ParamsPolygon) (this.params))._write_Seq(_io__raw_params);
                        break;
                    }
                    case POLYLINE: {
                        final KaitaiStream _io__raw_params = new ByteBufferKaitaiStream((size() - 3) * 2);
                        this._io.addChildStream(_io__raw_params);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + ((size() - 3) * 2));
                            final Record _this = this;
                            _io__raw_params.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_params = _io__raw_params.toByteArray();
                                    if (((byte[]) (_this._raw_params)).length != (size() - 3) * 2)
                                        throw new ConsistencyError("raw(params)", (size() - 3) * 2, ((byte[]) (_this._raw_params)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_params)))));
                                }
                            });
                        }
                        ((ParamsPolyline) (this.params))._write_Seq(_io__raw_params);
                        break;
                    }
                    case SETBKCOLOR: {
                        final KaitaiStream _io__raw_params = new ByteBufferKaitaiStream((size() - 3) * 2);
                        this._io.addChildStream(_io__raw_params);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + ((size() - 3) * 2));
                            final Record _this = this;
                            _io__raw_params.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_params = _io__raw_params.toByteArray();
                                    if (((byte[]) (_this._raw_params)).length != (size() - 3) * 2)
                                        throw new ConsistencyError("raw(params)", (size() - 3) * 2, ((byte[]) (_this._raw_params)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_params)))));
                                }
                            });
                        }
                        ((ColorRef) (this.params))._write_Seq(_io__raw_params);
                        break;
                    }
                    case SETBKMODE: {
                        final KaitaiStream _io__raw_params = new ByteBufferKaitaiStream((size() - 3) * 2);
                        this._io.addChildStream(_io__raw_params);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + ((size() - 3) * 2));
                            final Record _this = this;
                            _io__raw_params.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_params = _io__raw_params.toByteArray();
                                    if (((byte[]) (_this._raw_params)).length != (size() - 3) * 2)
                                        throw new ConsistencyError("raw(params)", (size() - 3) * 2, ((byte[]) (_this._raw_params)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_params)))));
                                }
                            });
                        }
                        ((ParamsSetbkmode) (this.params))._write_Seq(_io__raw_params);
                        break;
                    }
                    case SETPOLYFILLMODE: {
                        final KaitaiStream _io__raw_params = new ByteBufferKaitaiStream((size() - 3) * 2);
                        this._io.addChildStream(_io__raw_params);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + ((size() - 3) * 2));
                            final Record _this = this;
                            _io__raw_params.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_params = _io__raw_params.toByteArray();
                                    if (((byte[]) (_this._raw_params)).length != (size() - 3) * 2)
                                        throw new ConsistencyError("raw(params)", (size() - 3) * 2, ((byte[]) (_this._raw_params)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_params)))));
                                }
                            });
                        }
                        ((ParamsSetpolyfillmode) (this.params))._write_Seq(_io__raw_params);
                        break;
                    }
                    case SETROP2: {
                        final KaitaiStream _io__raw_params = new ByteBufferKaitaiStream((size() - 3) * 2);
                        this._io.addChildStream(_io__raw_params);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + ((size() - 3) * 2));
                            final Record _this = this;
                            _io__raw_params.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_params = _io__raw_params.toByteArray();
                                    if (((byte[]) (_this._raw_params)).length != (size() - 3) * 2)
                                        throw new ConsistencyError("raw(params)", (size() - 3) * 2, ((byte[]) (_this._raw_params)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_params)))));
                                }
                            });
                        }
                        ((ParamsSetrop2) (this.params))._write_Seq(_io__raw_params);
                        break;
                    }
                    case SETWINDOWEXT: {
                        final KaitaiStream _io__raw_params = new ByteBufferKaitaiStream((size() - 3) * 2);
                        this._io.addChildStream(_io__raw_params);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + ((size() - 3) * 2));
                            final Record _this = this;
                            _io__raw_params.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_params = _io__raw_params.toByteArray();
                                    if (((byte[]) (_this._raw_params)).length != (size() - 3) * 2)
                                        throw new ConsistencyError("raw(params)", (size() - 3) * 2, ((byte[]) (_this._raw_params)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_params)))));
                                }
                            });
                        }
                        ((ParamsSetwindowext) (this.params))._write_Seq(_io__raw_params);
                        break;
                    }
                    case SETWINDOWORG: {
                        final KaitaiStream _io__raw_params = new ByteBufferKaitaiStream((size() - 3) * 2);
                        this._io.addChildStream(_io__raw_params);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + ((size() - 3) * 2));
                            final Record _this = this;
                            _io__raw_params.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_params = _io__raw_params.toByteArray();
                                    if (((byte[]) (_this._raw_params)).length != (size() - 3) * 2)
                                        throw new ConsistencyError("raw(params)", (size() - 3) * 2, ((byte[]) (_this._raw_params)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_params)))));
                                }
                            });
                        }
                        ((ParamsSetwindoworg) (this.params))._write_Seq(_io__raw_params);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.params)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.params)))));
                }
            }
        }

        public void _check() {
            {
                Func on = function();
                if (on != null) {
                    switch (function()) {
                    case POLYGON: {
                        if (!Objects.equals(((Wmf.ParamsPolygon) (this.params))._root(), _root()))
                            throw new ConsistencyError("params", _root(), ((Wmf.ParamsPolygon) (this.params))._root());
                        if (!Objects.equals(((Wmf.ParamsPolygon) (this.params))._parent(), this))
                            throw new ConsistencyError("params", this, ((Wmf.ParamsPolygon) (this.params))._parent());
                        break;
                    }
                    case POLYLINE: {
                        if (!Objects.equals(((Wmf.ParamsPolyline) (this.params))._root(), _root()))
                            throw new ConsistencyError("params", _root(), ((Wmf.ParamsPolyline) (this.params))._root());
                        if (!Objects.equals(((Wmf.ParamsPolyline) (this.params))._parent(), this))
                            throw new ConsistencyError("params", this, ((Wmf.ParamsPolyline) (this.params))._parent());
                        break;
                    }
                    case SETBKCOLOR: {
                        if (!Objects.equals(((Wmf.ColorRef) (this.params))._root(), _root()))
                            throw new ConsistencyError("params", _root(), ((Wmf.ColorRef) (this.params))._root());
                        if (!Objects.equals(((Wmf.ColorRef) (this.params))._parent(), this))
                            throw new ConsistencyError("params", this, ((Wmf.ColorRef) (this.params))._parent());
                        break;
                    }
                    case SETBKMODE: {
                        if (!Objects.equals(((Wmf.ParamsSetbkmode) (this.params))._root(), _root()))
                            throw new ConsistencyError("params", _root(), ((Wmf.ParamsSetbkmode) (this.params))._root());
                        if (!Objects.equals(((Wmf.ParamsSetbkmode) (this.params))._parent(), this))
                            throw new ConsistencyError("params", this, ((Wmf.ParamsSetbkmode) (this.params))._parent());
                        break;
                    }
                    case SETPOLYFILLMODE: {
                        if (!Objects.equals(((Wmf.ParamsSetpolyfillmode) (this.params))._root(), _root()))
                            throw new ConsistencyError("params", _root(), ((Wmf.ParamsSetpolyfillmode) (this.params))._root());
                        if (!Objects.equals(((Wmf.ParamsSetpolyfillmode) (this.params))._parent(), this))
                            throw new ConsistencyError("params", this, ((Wmf.ParamsSetpolyfillmode) (this.params))._parent());
                        break;
                    }
                    case SETROP2: {
                        if (!Objects.equals(((Wmf.ParamsSetrop2) (this.params))._root(), _root()))
                            throw new ConsistencyError("params", _root(), ((Wmf.ParamsSetrop2) (this.params))._root());
                        if (!Objects.equals(((Wmf.ParamsSetrop2) (this.params))._parent(), this))
                            throw new ConsistencyError("params", this, ((Wmf.ParamsSetrop2) (this.params))._parent());
                        break;
                    }
                    case SETWINDOWEXT: {
                        if (!Objects.equals(((Wmf.ParamsSetwindowext) (this.params))._root(), _root()))
                            throw new ConsistencyError("params", _root(), ((Wmf.ParamsSetwindowext) (this.params))._root());
                        if (!Objects.equals(((Wmf.ParamsSetwindowext) (this.params))._parent(), this))
                            throw new ConsistencyError("params", this, ((Wmf.ParamsSetwindowext) (this.params))._parent());
                        break;
                    }
                    case SETWINDOWORG: {
                        if (!Objects.equals(((Wmf.ParamsSetwindoworg) (this.params))._root(), _root()))
                            throw new ConsistencyError("params", _root(), ((Wmf.ParamsSetwindoworg) (this.params))._root());
                        if (!Objects.equals(((Wmf.ParamsSetwindoworg) (this.params))._parent(), this))
                            throw new ConsistencyError("params", this, ((Wmf.ParamsSetwindoworg) (this.params))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.params)).length != (size() - 3) * 2)
                            throw new ConsistencyError("params", (size() - 3) * 2, ((byte[]) (this.params)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.params)).length != (size() - 3) * 2)
                        throw new ConsistencyError("params", (size() - 3) * 2, ((byte[]) (this.params)).length);
                }
            }
            _dirty = false;
        }
        private long size;
        private Func function;
        private Object params;
        private Wmf _root;
        private Wmf _parent;
        private byte[] _raw_params;
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }
        public Func function() { return function; }
        public void setFunction(Func _v) { _dirty = true; function = _v; }
        public Object params() { return params; }
        public void setParams(Object _v) { _dirty = true; params = _v; }
        public Wmf _root() { return _root; }
        public void set_root(Wmf _v) { _dirty = true; _root = _v; }
        public Wmf _parent() { return _parent; }
        public void set_parent(Wmf _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_params() { return _raw_params; }
        public void set_raw_Params(byte[] _v) { _dirty = true; _raw_params = _v; }
    }
    public static class SpecialHeader extends KaitaiStruct.ReadWrite {
        public static SpecialHeader fromFile(String fileName) throws IOException {
            return new SpecialHeader(new ByteBufferKaitaiStream(fileName));
        }
        public SpecialHeader() {
            this(null, null, null);
        }

        public SpecialHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SpecialHeader(KaitaiStream _io, Wmf _parent) {
            this(_io, _parent, null);
        }

        public SpecialHeader(KaitaiStream _io, Wmf _parent, Wmf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { -41, -51, -58, -102 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -41, -51, -58, -102 }, this.magic, this._io, "/types/special_header/seq/0");
            }
            this.handle = this._io.readBytes(2);
            if (!(Arrays.equals(this.handle, new byte[] { 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.handle, this._io, "/types/special_header/seq/1");
            }
            this.left = this._io.readS2le();
            this.top = this._io.readS2le();
            this.right = this._io.readS2le();
            this.bottom = this._io.readS2le();
            this.inch = this._io.readU2le();
            this.reserved = this._io.readBytes(4);
            if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/special_header/seq/7");
            }
            this.checksum = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeBytes(this.handle);
            this._io.writeS2le(this.left);
            this._io.writeS2le(this.top);
            this._io.writeS2le(this.right);
            this._io.writeS2le(this.bottom);
            this._io.writeU2le(this.inch);
            this._io.writeBytes(this.reserved);
            this._io.writeU2le(this.checksum);
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { -41, -51, -58, -102 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -41, -51, -58, -102 }, this.magic, null, "/types/special_header/seq/0");
            }
            if (this.handle.length != 2)
                throw new ConsistencyError("handle", 2, this.handle.length);
            if (!(Arrays.equals(this.handle, new byte[] { 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.handle, null, "/types/special_header/seq/1");
            }
            if (this.reserved.length != 4)
                throw new ConsistencyError("reserved", 4, this.reserved.length);
            if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/special_header/seq/7");
            }
            _dirty = false;
        }
        private byte[] magic;
        private byte[] handle;
        private short left;
        private short top;
        private short right;
        private short bottom;
        private int inch;
        private byte[] reserved;
        private int checksum;
        private Wmf _root;
        private Wmf _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public byte[] handle() { return handle; }
        public void setHandle(byte[] _v) { _dirty = true; handle = _v; }
        public short left() { return left; }
        public void setLeft(short _v) { _dirty = true; left = _v; }
        public short top() { return top; }
        public void setTop(short _v) { _dirty = true; top = _v; }
        public short right() { return right; }
        public void setRight(short _v) { _dirty = true; right = _v; }
        public short bottom() { return bottom; }
        public void setBottom(short _v) { _dirty = true; bottom = _v; }
        public int inch() { return inch; }
        public void setInch(int _v) { _dirty = true; inch = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public int checksum() { return checksum; }
        public void setChecksum(int _v) { _dirty = true; checksum = _v; }
        public Wmf _root() { return _root; }
        public void set_root(Wmf _v) { _dirty = true; _root = _v; }
        public Wmf _parent() { return _parent; }
        public void set_parent(Wmf _v) { _dirty = true; _parent = _v; }
    }
    private SpecialHeader specialHeader;
    private Header header;
    private List<Record> records;
    private Wmf _root;
    private KaitaiStruct.ReadWrite _parent;
    public SpecialHeader specialHeader() { return specialHeader; }
    public void setSpecialHeader(SpecialHeader _v) { _dirty = true; specialHeader = _v; }
    public Header header() { return header; }
    public void setHeader(Header _v) { _dirty = true; header = _v; }
    public List<Record> records() { return records; }
    public void setRecords(List<Record> _v) { _dirty = true; records = _v; }
    public Wmf _root() { return _root; }
    public void set_root(Wmf _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
