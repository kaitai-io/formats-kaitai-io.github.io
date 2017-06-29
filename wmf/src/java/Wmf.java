// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;

public class Wmf extends KaitaiStruct {
    public static Wmf fromFile(String fileName) throws IOException {
        return new Wmf(new KaitaiStream(fileName));
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
        this.specialHdr = new SpecialHeader(this._io, this, _root);
        this.header = new WmfHeader(this._io, this, _root);
        this.records = new ArrayList<Record>();
        {
            Record _it;
            do {
                _it = new Record(this._io, this, _root);
                this.records.add(_it);
            } while (!(_it.function() == Func.EOF));
        }
    }
    public static class SpecialHeader extends KaitaiStruct {
        public static SpecialHeader fromFile(String fileName) throws IOException {
            return new SpecialHeader(new KaitaiStream(fileName));
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
    public static class WmfHeader extends KaitaiStruct {
        public static WmfHeader fromFile(String fileName) throws IOException {
            return new WmfHeader(new KaitaiStream(fileName));
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

        public WmfHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public WmfHeader(KaitaiStream _io, Wmf _parent) {
            this(_io, _parent, null);
        }

        public WmfHeader(KaitaiStream _io, Wmf _parent, Wmf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.type = MetafileType.byId(this._io.readU2le());
            this.headerSize = this._io.readU2le();
            this.version = this._io.readU2le();
            this.size = this._io.readU4le();
            this.numberOfObjects = this._io.readU2le();
            this.maxRecord = this._io.readU4le();
            this.numberOfMembers = this._io.readU2le();
        }
        private MetafileType type;
        private int headerSize;
        private int version;
        private long size;
        private int numberOfObjects;
        private long maxRecord;
        private int numberOfMembers;
        private Wmf _root;
        private Wmf _parent;
        public MetafileType type() { return type; }
        public int headerSize() { return headerSize; }
        public int version() { return version; }
        public long size() { return size; }
        public int numberOfObjects() { return numberOfObjects; }
        public long maxRecord() { return maxRecord; }
        public int numberOfMembers() { return numberOfMembers; }
        public Wmf _root() { return _root; }
        public Wmf _parent() { return _parent; }
    }
    public static class Record extends KaitaiStruct {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new KaitaiStream(fileName));
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
            this.params = this._io.readBytes(((size() - 3) * 2));
        }
        private long size;
        private Func function;
        private byte[] params;
        private Wmf _root;
        private Wmf _parent;
        public long size() { return size; }
        public Func function() { return function; }
        public byte[] params() { return params; }
        public Wmf _root() { return _root; }
        public Wmf _parent() { return _parent; }
    }
    private SpecialHeader specialHdr;
    private WmfHeader header;
    private ArrayList<Record> records;
    private Wmf _root;
    private KaitaiStruct _parent;
    public SpecialHeader specialHdr() { return specialHdr; }
    public WmfHeader header() { return header; }
    public ArrayList<Record> records() { return records; }
    public Wmf _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
