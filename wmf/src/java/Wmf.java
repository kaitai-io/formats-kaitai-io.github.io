// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;


/**
 * @see <a href="http://www.digitalpreservation.gov/formats/digformatspecs/WindowsMetafileFormat(wmf)Specification.pdf">Source</a>
 */
public class Wmf extends KaitaiStruct {
    public static Wmf fromFile(String fileName) throws IOException {
        return new Wmf(new ByteBufferKaitaiStream(fileName));
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

    public Wmf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Wmf(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Wmf(KaitaiStream _io, KaitaiStruct _parent, Wmf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.specialHeader = new SpecialHeader(this._io, this, _root);
        this.header = new Header(this._io, this, _root);
        this.records = new ArrayList<Record>();
        {
            Record _it;
            int i = 0;
            do {
                _it = new Record(this._io, this, _root);
                this.records.add(_it);
                i++;
            } while (!(_it.function() == Func.EOF));
        }
    }
    public static class ParamsSetwindoworg extends KaitaiStruct {
        public static ParamsSetwindoworg fromFile(String fileName) throws IOException {
            return new ParamsSetwindoworg(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.y = this._io.readS2le();
            this.x = this._io.readS2le();
        }
        private short y;
        private short x;
        private Wmf _root;
        private Wmf.Record _parent;

        /**
         * Y coordinate of the window origin, in logical units.
         */
        public short y() { return y; }

        /**
         * X coordinate of the window origin, in logical units.
         */
        public short x() { return x; }
        public Wmf _root() { return _root; }
        public Wmf.Record _parent() { return _parent; }
    }
    public static class ParamsSetbkmode extends KaitaiStruct {
        public static ParamsSetbkmode fromFile(String fileName) throws IOException {
            return new ParamsSetbkmode(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.bkMode = Wmf.MixMode.byId(this._io.readU2le());
        }
        private MixMode bkMode;
        private Wmf _root;
        private Wmf.Record _parent;

        /**
         * Defines current graphic context background mix mode.
         */
        public MixMode bkMode() { return bkMode; }
        public Wmf _root() { return _root; }
        public Wmf.Record _parent() { return _parent; }
    }
    public static class PointS extends KaitaiStruct {
        public static PointS fromFile(String fileName) throws IOException {
            return new PointS(new ByteBufferKaitaiStream(fileName));
        }

        public PointS(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PointS(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public PointS(KaitaiStream _io, KaitaiStruct _parent, Wmf _root) {
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
        private Wmf _root;
        private KaitaiStruct _parent;

        /**
         * X coordinate of the point, in logical units.
         */
        public short x() { return x; }

        /**
         * Y coordinate of the point, in logical units.
         */
        public short y() { return y; }
        public Wmf _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class ParamsSetwindowext extends KaitaiStruct {
        public static ParamsSetwindowext fromFile(String fileName) throws IOException {
            return new ParamsSetwindowext(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.y = this._io.readS2le();
            this.x = this._io.readS2le();
        }
        private short y;
        private short x;
        private Wmf _root;
        private Wmf.Record _parent;

        /**
         * Vertical extent of the window in logical units.
         */
        public short y() { return y; }

        /**
         * Horizontal extent of the window in logical units.
         */
        public short x() { return x; }
        public Wmf _root() { return _root; }
        public Wmf.Record _parent() { return _parent; }
    }
    public static class ParamsPolygon extends KaitaiStruct {
        public static ParamsPolygon fromFile(String fileName) throws IOException {
            return new ParamsPolygon(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.numPoints = this._io.readS2le();
            points = new ArrayList<PointS>((int) (numPoints()));
            for (int i = 0; i < numPoints(); i++) {
                this.points.add(new PointS(this._io, this, _root));
            }
        }
        private short numPoints;
        private ArrayList<PointS> points;
        private Wmf _root;
        private Wmf.Record _parent;
        public short numPoints() { return numPoints; }
        public ArrayList<PointS> points() { return points; }
        public Wmf _root() { return _root; }
        public Wmf.Record _parent() { return _parent; }
    }
    public static class Header extends KaitaiStruct {
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
            _read();
        }
        private void _read() {
            this.metafileType = MetafileType.byId(this._io.readU2le());
            this.headerSize = this._io.readU2le();
            this.version = this._io.readU2le();
            this.size = this._io.readU4le();
            this.numberOfObjects = this._io.readU2le();
            this.maxRecord = this._io.readU4le();
            this.numberOfMembers = this._io.readU2le();
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
        public int headerSize() { return headerSize; }
        public int version() { return version; }
        public long size() { return size; }
        public int numberOfObjects() { return numberOfObjects; }
        public long maxRecord() { return maxRecord; }
        public int numberOfMembers() { return numberOfMembers; }
        public Wmf _root() { return _root; }
        public Wmf _parent() { return _parent; }
    }
    public static class ColorRef extends KaitaiStruct {
        public static ColorRef fromFile(String fileName) throws IOException {
            return new ColorRef(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.red = this._io.readU1();
            this.green = this._io.readU1();
            this.blue = this._io.readU1();
            this.reserved = this._io.readU1();
        }
        private int red;
        private int green;
        private int blue;
        private int reserved;
        private Wmf _root;
        private Wmf.Record _parent;
        public int red() { return red; }
        public int green() { return green; }
        public int blue() { return blue; }
        public int reserved() { return reserved; }
        public Wmf _root() { return _root; }
        public Wmf.Record _parent() { return _parent; }
    }
    public static class ParamsSetrop2 extends KaitaiStruct {
        public static ParamsSetrop2 fromFile(String fileName) throws IOException {
            return new ParamsSetrop2(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.drawMode = Wmf.BinRasterOp.byId(this._io.readU2le());
        }
        private BinRasterOp drawMode;
        private Wmf _root;
        private Wmf.Record _parent;

        /**
         * Defines current foreground binary raster operation mixing mode.
         */
        public BinRasterOp drawMode() { return drawMode; }
        public Wmf _root() { return _root; }
        public Wmf.Record _parent() { return _parent; }
    }
    public static class ParamsSetpolyfillmode extends KaitaiStruct {
        public static ParamsSetpolyfillmode fromFile(String fileName) throws IOException {
            return new ParamsSetpolyfillmode(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.polyFillMode = Wmf.PolyFillMode.byId(this._io.readU2le());
        }
        private PolyFillMode polyFillMode;
        private Wmf _root;
        private Wmf.Record _parent;

        /**
         * Defines current polygon fill mode.
         */
        public PolyFillMode polyFillMode() { return polyFillMode; }
        public Wmf _root() { return _root; }
        public Wmf.Record _parent() { return _parent; }
    }
    public static class ParamsPolyline extends KaitaiStruct {
        public static ParamsPolyline fromFile(String fileName) throws IOException {
            return new ParamsPolyline(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.numPoints = this._io.readS2le();
            points = new ArrayList<PointS>((int) (numPoints()));
            for (int i = 0; i < numPoints(); i++) {
                this.points.add(new PointS(this._io, this, _root));
            }
        }
        private short numPoints;
        private ArrayList<PointS> points;
        private Wmf _root;
        private Wmf.Record _parent;
        public short numPoints() { return numPoints; }
        public ArrayList<PointS> points() { return points; }
        public Wmf _root() { return _root; }
        public Wmf.Record _parent() { return _parent; }
    }
    public static class SpecialHeader extends KaitaiStruct {
        public static SpecialHeader fromFile(String fileName) throws IOException {
            return new SpecialHeader(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.magic = this._io.ensureFixedContents(new byte[] { -41, -51, -58, -102 });
            this.handle = this._io.ensureFixedContents(new byte[] { 0, 0 });
            this.left = this._io.readS2le();
            this.top = this._io.readS2le();
            this.right = this._io.readS2le();
            this.bottom = this._io.readS2le();
            this.inch = this._io.readU2le();
            this.reserved = this._io.ensureFixedContents(new byte[] { 0, 0, 0, 0 });
            this.checksum = this._io.readU2le();
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
        public byte[] handle() { return handle; }
        public short left() { return left; }
        public short top() { return top; }
        public short right() { return right; }
        public short bottom() { return bottom; }
        public int inch() { return inch; }
        public byte[] reserved() { return reserved; }
        public int checksum() { return checksum; }
        public Wmf _root() { return _root; }
        public Wmf _parent() { return _parent; }
    }
    public static class Record extends KaitaiStruct {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.size = this._io.readU4le();
            this.function = Wmf.Func.byId(this._io.readU2le());
            switch (function()) {
            case SETBKMODE: {
                this._raw_params = this._io.readBytes(((size() - 3) * 2));
                KaitaiStream _io__raw_params = new ByteBufferKaitaiStream(_raw_params);
                this.params = new ParamsSetbkmode(_io__raw_params, this, _root);
                break;
            }
            case SETBKCOLOR: {
                this._raw_params = this._io.readBytes(((size() - 3) * 2));
                KaitaiStream _io__raw_params = new ByteBufferKaitaiStream(_raw_params);
                this.params = new ColorRef(_io__raw_params, this, _root);
                break;
            }
            case SETROP2: {
                this._raw_params = this._io.readBytes(((size() - 3) * 2));
                KaitaiStream _io__raw_params = new ByteBufferKaitaiStream(_raw_params);
                this.params = new ParamsSetrop2(_io__raw_params, this, _root);
                break;
            }
            case POLYLINE: {
                this._raw_params = this._io.readBytes(((size() - 3) * 2));
                KaitaiStream _io__raw_params = new ByteBufferKaitaiStream(_raw_params);
                this.params = new ParamsPolyline(_io__raw_params, this, _root);
                break;
            }
            case SETWINDOWORG: {
                this._raw_params = this._io.readBytes(((size() - 3) * 2));
                KaitaiStream _io__raw_params = new ByteBufferKaitaiStream(_raw_params);
                this.params = new ParamsSetwindoworg(_io__raw_params, this, _root);
                break;
            }
            case POLYGON: {
                this._raw_params = this._io.readBytes(((size() - 3) * 2));
                KaitaiStream _io__raw_params = new ByteBufferKaitaiStream(_raw_params);
                this.params = new ParamsPolygon(_io__raw_params, this, _root);
                break;
            }
            case SETWINDOWEXT: {
                this._raw_params = this._io.readBytes(((size() - 3) * 2));
                KaitaiStream _io__raw_params = new ByteBufferKaitaiStream(_raw_params);
                this.params = new ParamsSetwindowext(_io__raw_params, this, _root);
                break;
            }
            case SETPOLYFILLMODE: {
                this._raw_params = this._io.readBytes(((size() - 3) * 2));
                KaitaiStream _io__raw_params = new ByteBufferKaitaiStream(_raw_params);
                this.params = new ParamsSetpolyfillmode(_io__raw_params, this, _root);
                break;
            }
            default: {
                this.params = this._io.readBytes(((size() - 3) * 2));
                break;
            }
            }
        }
        private long size;
        private Func function;
        private Object params;
        private Wmf _root;
        private Wmf _parent;
        private byte[] _raw_params;
        public long size() { return size; }
        public Func function() { return function; }
        public Object params() { return params; }
        public Wmf _root() { return _root; }
        public Wmf _parent() { return _parent; }
        public byte[] _raw_params() { return _raw_params; }
    }
    private SpecialHeader specialHeader;
    private Header header;
    private ArrayList<Record> records;
    private Wmf _root;
    private KaitaiStruct _parent;
    public SpecialHeader specialHeader() { return specialHeader; }
    public Header header() { return header; }
    public ArrayList<Record> records() { return records; }
    public Wmf _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
