// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ShapefileMain extends KaitaiStruct {
    public static ShapefileMain fromFile(String fileName) throws IOException {
        return new ShapefileMain(new ByteBufferKaitaiStream(fileName));
    }

    public enum PartType {
        TRIANGLE_STRIP(0),
        TRIANGLE_FAN(1),
        OUTER_RING(2),
        INNER_RING(3),
        FIRST_RING(4),
        RING(5);

        private final long id;
        PartType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, PartType> byId = new HashMap<Long, PartType>(6);
        static {
            for (PartType e : PartType.values())
                byId.put(e.id(), e);
        }
        public static PartType byId(long id) { return byId.get(id); }
    }

    public enum ShapeType {
        NULL_SHAPE(0),
        POINT(1),
        POLY_LINE(3),
        POLYGON(5),
        MULTI_POINT(8),
        POINT_Z(11),
        POLY_LINE_Z(13),
        POLYGON_Z(15),
        MULTI_POINT_Z(18),
        POINT_M(21),
        POLY_LINE_M(23),
        POLYGON_M(25),
        MULTI_POINT_M(28),
        MULTI_PATCH(31);

        private final long id;
        ShapeType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ShapeType> byId = new HashMap<Long, ShapeType>(14);
        static {
            for (ShapeType e : ShapeType.values())
                byId.put(e.id(), e);
        }
        public static ShapeType byId(long id) { return byId.get(id); }
    }

    public ShapefileMain(KaitaiStream _io) {
        this(_io, null, null);
    }

    public ShapefileMain(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public ShapefileMain(KaitaiStream _io, KaitaiStruct _parent, ShapefileMain _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new FileHeader(this._io, this, _root);
        this.records = new ArrayList<Record>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.records.add(new Record(this._io, this, _root));
                i++;
            }
        }
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        for (int i = 0; i < this.records.size(); i++) {
            this.records.get(((Number) (i)).intValue())._fetchInstances();
        }
    }
    public static class BoundingBoxXY extends KaitaiStruct {
        public static BoundingBoxXY fromFile(String fileName) throws IOException {
            return new BoundingBoxXY(new ByteBufferKaitaiStream(fileName));
        }

        public BoundingBoxXY(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BoundingBoxXY(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public BoundingBoxXY(KaitaiStream _io, KaitaiStruct _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.x = new BoundsMinMax(this._io, this, _root);
            this.y = new BoundsMinMax(this._io, this, _root);
        }

        public void _fetchInstances() {
            this.x._fetchInstances();
            this.y._fetchInstances();
        }
        private BoundsMinMax x;
        private BoundsMinMax y;
        private ShapefileMain _root;
        private KaitaiStruct _parent;
        public BoundsMinMax x() { return x; }
        public BoundsMinMax y() { return y; }
        public ShapefileMain _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class BoundingBoxXYZM extends KaitaiStruct {
        public static BoundingBoxXYZM fromFile(String fileName) throws IOException {
            return new BoundingBoxXYZM(new ByteBufferKaitaiStream(fileName));
        }

        public BoundingBoxXYZM(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BoundingBoxXYZM(KaitaiStream _io, ShapefileMain.FileHeader _parent) {
            this(_io, _parent, null);
        }

        public BoundingBoxXYZM(KaitaiStream _io, ShapefileMain.FileHeader _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.x = new BoundsMinMax(this._io, this, _root);
            this.y = new BoundsMinMax(this._io, this, _root);
            this.z = new BoundsMinMax(this._io, this, _root);
            this.m = new BoundsMinMax(this._io, this, _root);
        }

        public void _fetchInstances() {
            this.x._fetchInstances();
            this.y._fetchInstances();
            this.z._fetchInstances();
            this.m._fetchInstances();
        }
        private BoundsMinMax x;
        private BoundsMinMax y;
        private BoundsMinMax z;
        private BoundsMinMax m;
        private ShapefileMain _root;
        private ShapefileMain.FileHeader _parent;
        public BoundsMinMax x() { return x; }
        public BoundsMinMax y() { return y; }
        public BoundsMinMax z() { return z; }
        public BoundsMinMax m() { return m; }
        public ShapefileMain _root() { return _root; }
        public ShapefileMain.FileHeader _parent() { return _parent; }
    }
    public static class BoundsMinMax extends KaitaiStruct {
        public static BoundsMinMax fromFile(String fileName) throws IOException {
            return new BoundsMinMax(new ByteBufferKaitaiStream(fileName));
        }

        public BoundsMinMax(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BoundsMinMax(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public BoundsMinMax(KaitaiStream _io, KaitaiStruct _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.min = this._io.readF8le();
            this.max = this._io.readF8le();
        }

        public void _fetchInstances() {
        }
        private double min;
        private double max;
        private ShapefileMain _root;
        private KaitaiStruct _parent;
        public double min() { return min; }
        public double max() { return max; }
        public ShapefileMain _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class FileHeader extends KaitaiStruct {
        public static FileHeader fromFile(String fileName) throws IOException {
            return new FileHeader(new ByteBufferKaitaiStream(fileName));
        }

        public FileHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileHeader(KaitaiStream _io, ShapefileMain _parent) {
            this(_io, _parent, null);
        }

        public FileHeader(KaitaiStream _io, ShapefileMain _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fileCode = this._io.readBytes(4);
            if (!(Arrays.equals(this.fileCode, new byte[] { 0, 0, 39, 10 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 39, 10 }, this.fileCode, this._io, "/types/file_header/seq/0");
            }
            this.unusedField1 = this._io.readBytes(4);
            if (!(Arrays.equals(this.unusedField1, new byte[] { 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.unusedField1, this._io, "/types/file_header/seq/1");
            }
            this.unusedField2 = this._io.readBytes(4);
            if (!(Arrays.equals(this.unusedField2, new byte[] { 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.unusedField2, this._io, "/types/file_header/seq/2");
            }
            this.unusedField3 = this._io.readBytes(4);
            if (!(Arrays.equals(this.unusedField3, new byte[] { 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.unusedField3, this._io, "/types/file_header/seq/3");
            }
            this.unusedField4 = this._io.readBytes(4);
            if (!(Arrays.equals(this.unusedField4, new byte[] { 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.unusedField4, this._io, "/types/file_header/seq/4");
            }
            this.unusedField5 = this._io.readBytes(4);
            if (!(Arrays.equals(this.unusedField5, new byte[] { 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.unusedField5, this._io, "/types/file_header/seq/5");
            }
            this.fileLength = this._io.readS4be();
            this.version = this._io.readBytes(4);
            if (!(Arrays.equals(this.version, new byte[] { -24, 3, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -24, 3, 0, 0 }, this.version, this._io, "/types/file_header/seq/7");
            }
            this.shapeType = ShapefileMain.ShapeType.byId(this._io.readS4le());
            this.boundingBox = new BoundingBoxXYZM(this._io, this, _root);
        }

        public void _fetchInstances() {
            this.boundingBox._fetchInstances();
        }
        private byte[] fileCode;
        private byte[] unusedField1;
        private byte[] unusedField2;
        private byte[] unusedField3;
        private byte[] unusedField4;
        private byte[] unusedField5;
        private int fileLength;
        private byte[] version;
        private ShapeType shapeType;
        private BoundingBoxXYZM boundingBox;
        private ShapefileMain _root;
        private ShapefileMain _parent;

        /**
         * corresponds to s4be value of 9994
         */
        public byte[] fileCode() { return fileCode; }
        public byte[] unusedField1() { return unusedField1; }
        public byte[] unusedField2() { return unusedField2; }
        public byte[] unusedField3() { return unusedField3; }
        public byte[] unusedField4() { return unusedField4; }
        public byte[] unusedField5() { return unusedField5; }
        public int fileLength() { return fileLength; }

        /**
         * corresponds to s4le value of 1000
         */
        public byte[] version() { return version; }
        public ShapeType shapeType() { return shapeType; }
        public BoundingBoxXYZM boundingBox() { return boundingBox; }
        public ShapefileMain _root() { return _root; }
        public ShapefileMain _parent() { return _parent; }
    }
    public static class MultiPatch extends KaitaiStruct {
        public static MultiPatch fromFile(String fileName) throws IOException {
            return new MultiPatch(new ByteBufferKaitaiStream(fileName));
        }

        public MultiPatch(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MultiPatch(KaitaiStream _io, ShapefileMain.RecordContents _parent) {
            this(_io, _parent, null);
        }

        public MultiPatch(KaitaiStream _io, ShapefileMain.RecordContents _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.boundingBox = new BoundingBoxXY(this._io, this, _root);
            this.numberOfParts = this._io.readS4le();
            this.numberOfPoints = this._io.readS4le();
            this.parts = new ArrayList<Integer>();
            for (int i = 0; i < numberOfParts(); i++) {
                this.parts.add(this._io.readS4le());
            }
            this.partTypes = new ArrayList<PartType>();
            for (int i = 0; i < numberOfParts(); i++) {
                this.partTypes.add(ShapefileMain.PartType.byId(this._io.readS4le()));
            }
            this.points = new ArrayList<Point>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.points.add(new Point(this._io, this, _root));
            }
            this.zRange = new BoundsMinMax(this._io, this, _root);
            this.zValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.zValues.add(this._io.readF8le());
            }
            this.mRange = new BoundsMinMax(this._io, this, _root);
            this.mValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.mValues.add(this._io.readF8le());
            }
        }

        public void _fetchInstances() {
            this.boundingBox._fetchInstances();
            for (int i = 0; i < this.parts.size(); i++) {
            }
            for (int i = 0; i < this.partTypes.size(); i++) {
            }
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._fetchInstances();
            }
            this.zRange._fetchInstances();
            for (int i = 0; i < this.zValues.size(); i++) {
            }
            this.mRange._fetchInstances();
            for (int i = 0; i < this.mValues.size(); i++) {
            }
        }
        private BoundingBoxXY boundingBox;
        private int numberOfParts;
        private int numberOfPoints;
        private List<Integer> parts;
        private List<PartType> partTypes;
        private List<Point> points;
        private BoundsMinMax zRange;
        private List<Double> zValues;
        private BoundsMinMax mRange;
        private List<Double> mValues;
        private ShapefileMain _root;
        private ShapefileMain.RecordContents _parent;
        public BoundingBoxXY boundingBox() { return boundingBox; }
        public int numberOfParts() { return numberOfParts; }
        public int numberOfPoints() { return numberOfPoints; }
        public List<Integer> parts() { return parts; }
        public List<PartType> partTypes() { return partTypes; }
        public List<Point> points() { return points; }
        public BoundsMinMax zRange() { return zRange; }
        public List<Double> zValues() { return zValues; }
        public BoundsMinMax mRange() { return mRange; }
        public List<Double> mValues() { return mValues; }
        public ShapefileMain _root() { return _root; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
    }
    public static class MultiPoint extends KaitaiStruct {
        public static MultiPoint fromFile(String fileName) throws IOException {
            return new MultiPoint(new ByteBufferKaitaiStream(fileName));
        }

        public MultiPoint(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MultiPoint(KaitaiStream _io, ShapefileMain.RecordContents _parent) {
            this(_io, _parent, null);
        }

        public MultiPoint(KaitaiStream _io, ShapefileMain.RecordContents _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.boundingBox = new BoundingBoxXY(this._io, this, _root);
            this.numberOfPoints = this._io.readS4le();
            this.points = new ArrayList<Point>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.points.add(new Point(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            this.boundingBox._fetchInstances();
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private BoundingBoxXY boundingBox;
        private int numberOfPoints;
        private List<Point> points;
        private ShapefileMain _root;
        private ShapefileMain.RecordContents _parent;
        public BoundingBoxXY boundingBox() { return boundingBox; }
        public int numberOfPoints() { return numberOfPoints; }
        public List<Point> points() { return points; }
        public ShapefileMain _root() { return _root; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
    }
    public static class MultiPointM extends KaitaiStruct {
        public static MultiPointM fromFile(String fileName) throws IOException {
            return new MultiPointM(new ByteBufferKaitaiStream(fileName));
        }

        public MultiPointM(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MultiPointM(KaitaiStream _io, ShapefileMain.RecordContents _parent) {
            this(_io, _parent, null);
        }

        public MultiPointM(KaitaiStream _io, ShapefileMain.RecordContents _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.boundingBox = new BoundingBoxXY(this._io, this, _root);
            this.numberOfPoints = this._io.readS4le();
            this.points = new ArrayList<Point>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.points.add(new Point(this._io, this, _root));
            }
            this.mRange = new BoundsMinMax(this._io, this, _root);
            this.mValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.mValues.add(this._io.readF8le());
            }
        }

        public void _fetchInstances() {
            this.boundingBox._fetchInstances();
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._fetchInstances();
            }
            this.mRange._fetchInstances();
            for (int i = 0; i < this.mValues.size(); i++) {
            }
        }
        private BoundingBoxXY boundingBox;
        private int numberOfPoints;
        private List<Point> points;
        private BoundsMinMax mRange;
        private List<Double> mValues;
        private ShapefileMain _root;
        private ShapefileMain.RecordContents _parent;
        public BoundingBoxXY boundingBox() { return boundingBox; }
        public int numberOfPoints() { return numberOfPoints; }
        public List<Point> points() { return points; }
        public BoundsMinMax mRange() { return mRange; }
        public List<Double> mValues() { return mValues; }
        public ShapefileMain _root() { return _root; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
    }
    public static class MultiPointZ extends KaitaiStruct {
        public static MultiPointZ fromFile(String fileName) throws IOException {
            return new MultiPointZ(new ByteBufferKaitaiStream(fileName));
        }

        public MultiPointZ(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MultiPointZ(KaitaiStream _io, ShapefileMain.RecordContents _parent) {
            this(_io, _parent, null);
        }

        public MultiPointZ(KaitaiStream _io, ShapefileMain.RecordContents _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.boundingBox = new BoundingBoxXY(this._io, this, _root);
            this.numberOfPoints = this._io.readS4le();
            this.points = new ArrayList<Point>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.points.add(new Point(this._io, this, _root));
            }
            this.zRange = new BoundsMinMax(this._io, this, _root);
            this.zValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.zValues.add(this._io.readF8le());
            }
            this.mRange = new BoundsMinMax(this._io, this, _root);
            this.mValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.mValues.add(this._io.readF8le());
            }
        }

        public void _fetchInstances() {
            this.boundingBox._fetchInstances();
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._fetchInstances();
            }
            this.zRange._fetchInstances();
            for (int i = 0; i < this.zValues.size(); i++) {
            }
            this.mRange._fetchInstances();
            for (int i = 0; i < this.mValues.size(); i++) {
            }
        }
        private BoundingBoxXY boundingBox;
        private int numberOfPoints;
        private List<Point> points;
        private BoundsMinMax zRange;
        private List<Double> zValues;
        private BoundsMinMax mRange;
        private List<Double> mValues;
        private ShapefileMain _root;
        private ShapefileMain.RecordContents _parent;
        public BoundingBoxXY boundingBox() { return boundingBox; }
        public int numberOfPoints() { return numberOfPoints; }
        public List<Point> points() { return points; }
        public BoundsMinMax zRange() { return zRange; }
        public List<Double> zValues() { return zValues; }
        public BoundsMinMax mRange() { return mRange; }
        public List<Double> mValues() { return mValues; }
        public ShapefileMain _root() { return _root; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
    }
    public static class Point extends KaitaiStruct {
        public static Point fromFile(String fileName) throws IOException {
            return new Point(new ByteBufferKaitaiStream(fileName));
        }

        public Point(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Point(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Point(KaitaiStream _io, KaitaiStruct _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.x = this._io.readF8le();
            this.y = this._io.readF8le();
        }

        public void _fetchInstances() {
        }
        private double x;
        private double y;
        private ShapefileMain _root;
        private KaitaiStruct _parent;
        public double x() { return x; }
        public double y() { return y; }
        public ShapefileMain _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class PointM extends KaitaiStruct {
        public static PointM fromFile(String fileName) throws IOException {
            return new PointM(new ByteBufferKaitaiStream(fileName));
        }

        public PointM(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PointM(KaitaiStream _io, ShapefileMain.RecordContents _parent) {
            this(_io, _parent, null);
        }

        public PointM(KaitaiStream _io, ShapefileMain.RecordContents _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.x = this._io.readF8le();
            this.y = this._io.readF8le();
            this.m = this._io.readF8le();
        }

        public void _fetchInstances() {
        }
        private double x;
        private double y;
        private double m;
        private ShapefileMain _root;
        private ShapefileMain.RecordContents _parent;
        public double x() { return x; }
        public double y() { return y; }
        public double m() { return m; }
        public ShapefileMain _root() { return _root; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
    }
    public static class PointZ extends KaitaiStruct {
        public static PointZ fromFile(String fileName) throws IOException {
            return new PointZ(new ByteBufferKaitaiStream(fileName));
        }

        public PointZ(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PointZ(KaitaiStream _io, ShapefileMain.RecordContents _parent) {
            this(_io, _parent, null);
        }

        public PointZ(KaitaiStream _io, ShapefileMain.RecordContents _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.x = this._io.readF8le();
            this.y = this._io.readF8le();
            this.z = this._io.readF8le();
            this.m = this._io.readF8le();
        }

        public void _fetchInstances() {
        }
        private double x;
        private double y;
        private double z;
        private double m;
        private ShapefileMain _root;
        private ShapefileMain.RecordContents _parent;
        public double x() { return x; }
        public double y() { return y; }
        public double z() { return z; }
        public double m() { return m; }
        public ShapefileMain _root() { return _root; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
    }
    public static class PolyLine extends KaitaiStruct {
        public static PolyLine fromFile(String fileName) throws IOException {
            return new PolyLine(new ByteBufferKaitaiStream(fileName));
        }

        public PolyLine(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PolyLine(KaitaiStream _io, ShapefileMain.RecordContents _parent) {
            this(_io, _parent, null);
        }

        public PolyLine(KaitaiStream _io, ShapefileMain.RecordContents _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.boundingBox = new BoundingBoxXY(this._io, this, _root);
            this.numberOfParts = this._io.readS4le();
            this.numberOfPoints = this._io.readS4le();
            this.parts = new ArrayList<Integer>();
            for (int i = 0; i < numberOfParts(); i++) {
                this.parts.add(this._io.readS4le());
            }
            this.points = new ArrayList<Point>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.points.add(new Point(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            this.boundingBox._fetchInstances();
            for (int i = 0; i < this.parts.size(); i++) {
            }
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private BoundingBoxXY boundingBox;
        private int numberOfParts;
        private int numberOfPoints;
        private List<Integer> parts;
        private List<Point> points;
        private ShapefileMain _root;
        private ShapefileMain.RecordContents _parent;
        public BoundingBoxXY boundingBox() { return boundingBox; }
        public int numberOfParts() { return numberOfParts; }
        public int numberOfPoints() { return numberOfPoints; }
        public List<Integer> parts() { return parts; }
        public List<Point> points() { return points; }
        public ShapefileMain _root() { return _root; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
    }
    public static class PolyLineM extends KaitaiStruct {
        public static PolyLineM fromFile(String fileName) throws IOException {
            return new PolyLineM(new ByteBufferKaitaiStream(fileName));
        }

        public PolyLineM(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PolyLineM(KaitaiStream _io, ShapefileMain.RecordContents _parent) {
            this(_io, _parent, null);
        }

        public PolyLineM(KaitaiStream _io, ShapefileMain.RecordContents _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.boundingBox = new BoundingBoxXY(this._io, this, _root);
            this.numberOfParts = this._io.readS4le();
            this.numberOfPoints = this._io.readS4le();
            this.parts = new ArrayList<Integer>();
            for (int i = 0; i < numberOfParts(); i++) {
                this.parts.add(this._io.readS4le());
            }
            this.points = new ArrayList<Point>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.points.add(new Point(this._io, this, _root));
            }
            this.mRange = new BoundsMinMax(this._io, this, _root);
            this.mValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.mValues.add(this._io.readF8le());
            }
        }

        public void _fetchInstances() {
            this.boundingBox._fetchInstances();
            for (int i = 0; i < this.parts.size(); i++) {
            }
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._fetchInstances();
            }
            this.mRange._fetchInstances();
            for (int i = 0; i < this.mValues.size(); i++) {
            }
        }
        private BoundingBoxXY boundingBox;
        private int numberOfParts;
        private int numberOfPoints;
        private List<Integer> parts;
        private List<Point> points;
        private BoundsMinMax mRange;
        private List<Double> mValues;
        private ShapefileMain _root;
        private ShapefileMain.RecordContents _parent;
        public BoundingBoxXY boundingBox() { return boundingBox; }
        public int numberOfParts() { return numberOfParts; }
        public int numberOfPoints() { return numberOfPoints; }
        public List<Integer> parts() { return parts; }
        public List<Point> points() { return points; }
        public BoundsMinMax mRange() { return mRange; }
        public List<Double> mValues() { return mValues; }
        public ShapefileMain _root() { return _root; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
    }
    public static class PolyLineZ extends KaitaiStruct {
        public static PolyLineZ fromFile(String fileName) throws IOException {
            return new PolyLineZ(new ByteBufferKaitaiStream(fileName));
        }

        public PolyLineZ(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PolyLineZ(KaitaiStream _io, ShapefileMain.RecordContents _parent) {
            this(_io, _parent, null);
        }

        public PolyLineZ(KaitaiStream _io, ShapefileMain.RecordContents _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.boundingBox = new BoundingBoxXY(this._io, this, _root);
            this.numberOfParts = this._io.readS4le();
            this.numberOfPoints = this._io.readS4le();
            this.parts = new ArrayList<Integer>();
            for (int i = 0; i < numberOfParts(); i++) {
                this.parts.add(this._io.readS4le());
            }
            this.points = new ArrayList<Point>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.points.add(new Point(this._io, this, _root));
            }
            this.zRange = new BoundsMinMax(this._io, this, _root);
            this.zValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.zValues.add(this._io.readF8le());
            }
            this.mRange = new BoundsMinMax(this._io, this, _root);
            this.mValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.mValues.add(this._io.readF8le());
            }
        }

        public void _fetchInstances() {
            this.boundingBox._fetchInstances();
            for (int i = 0; i < this.parts.size(); i++) {
            }
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._fetchInstances();
            }
            this.zRange._fetchInstances();
            for (int i = 0; i < this.zValues.size(); i++) {
            }
            this.mRange._fetchInstances();
            for (int i = 0; i < this.mValues.size(); i++) {
            }
        }
        private BoundingBoxXY boundingBox;
        private int numberOfParts;
        private int numberOfPoints;
        private List<Integer> parts;
        private List<Point> points;
        private BoundsMinMax zRange;
        private List<Double> zValues;
        private BoundsMinMax mRange;
        private List<Double> mValues;
        private ShapefileMain _root;
        private ShapefileMain.RecordContents _parent;
        public BoundingBoxXY boundingBox() { return boundingBox; }
        public int numberOfParts() { return numberOfParts; }
        public int numberOfPoints() { return numberOfPoints; }
        public List<Integer> parts() { return parts; }
        public List<Point> points() { return points; }
        public BoundsMinMax zRange() { return zRange; }
        public List<Double> zValues() { return zValues; }
        public BoundsMinMax mRange() { return mRange; }
        public List<Double> mValues() { return mValues; }
        public ShapefileMain _root() { return _root; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
    }
    public static class Polygon extends KaitaiStruct {
        public static Polygon fromFile(String fileName) throws IOException {
            return new Polygon(new ByteBufferKaitaiStream(fileName));
        }

        public Polygon(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Polygon(KaitaiStream _io, ShapefileMain.RecordContents _parent) {
            this(_io, _parent, null);
        }

        public Polygon(KaitaiStream _io, ShapefileMain.RecordContents _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.boundingBox = new BoundingBoxXY(this._io, this, _root);
            this.numberOfParts = this._io.readS4le();
            this.numberOfPoints = this._io.readS4le();
            this.parts = new ArrayList<Integer>();
            for (int i = 0; i < numberOfParts(); i++) {
                this.parts.add(this._io.readS4le());
            }
            this.points = new ArrayList<Point>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.points.add(new Point(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            this.boundingBox._fetchInstances();
            for (int i = 0; i < this.parts.size(); i++) {
            }
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private BoundingBoxXY boundingBox;
        private int numberOfParts;
        private int numberOfPoints;
        private List<Integer> parts;
        private List<Point> points;
        private ShapefileMain _root;
        private ShapefileMain.RecordContents _parent;
        public BoundingBoxXY boundingBox() { return boundingBox; }
        public int numberOfParts() { return numberOfParts; }
        public int numberOfPoints() { return numberOfPoints; }
        public List<Integer> parts() { return parts; }
        public List<Point> points() { return points; }
        public ShapefileMain _root() { return _root; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
    }
    public static class PolygonM extends KaitaiStruct {
        public static PolygonM fromFile(String fileName) throws IOException {
            return new PolygonM(new ByteBufferKaitaiStream(fileName));
        }

        public PolygonM(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PolygonM(KaitaiStream _io, ShapefileMain.RecordContents _parent) {
            this(_io, _parent, null);
        }

        public PolygonM(KaitaiStream _io, ShapefileMain.RecordContents _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.boundingBox = new BoundingBoxXY(this._io, this, _root);
            this.numberOfParts = this._io.readS4le();
            this.numberOfPoints = this._io.readS4le();
            this.parts = new ArrayList<Integer>();
            for (int i = 0; i < numberOfParts(); i++) {
                this.parts.add(this._io.readS4le());
            }
            this.points = new ArrayList<Point>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.points.add(new Point(this._io, this, _root));
            }
            this.mRange = new BoundsMinMax(this._io, this, _root);
            this.mValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.mValues.add(this._io.readF8le());
            }
        }

        public void _fetchInstances() {
            this.boundingBox._fetchInstances();
            for (int i = 0; i < this.parts.size(); i++) {
            }
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._fetchInstances();
            }
            this.mRange._fetchInstances();
            for (int i = 0; i < this.mValues.size(); i++) {
            }
        }
        private BoundingBoxXY boundingBox;
        private int numberOfParts;
        private int numberOfPoints;
        private List<Integer> parts;
        private List<Point> points;
        private BoundsMinMax mRange;
        private List<Double> mValues;
        private ShapefileMain _root;
        private ShapefileMain.RecordContents _parent;
        public BoundingBoxXY boundingBox() { return boundingBox; }
        public int numberOfParts() { return numberOfParts; }
        public int numberOfPoints() { return numberOfPoints; }
        public List<Integer> parts() { return parts; }
        public List<Point> points() { return points; }
        public BoundsMinMax mRange() { return mRange; }
        public List<Double> mValues() { return mValues; }
        public ShapefileMain _root() { return _root; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
    }
    public static class PolygonZ extends KaitaiStruct {
        public static PolygonZ fromFile(String fileName) throws IOException {
            return new PolygonZ(new ByteBufferKaitaiStream(fileName));
        }

        public PolygonZ(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PolygonZ(KaitaiStream _io, ShapefileMain.RecordContents _parent) {
            this(_io, _parent, null);
        }

        public PolygonZ(KaitaiStream _io, ShapefileMain.RecordContents _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.boundingBox = new BoundingBoxXY(this._io, this, _root);
            this.numberOfParts = this._io.readS4le();
            this.numberOfPoints = this._io.readS4le();
            this.parts = new ArrayList<Integer>();
            for (int i = 0; i < numberOfParts(); i++) {
                this.parts.add(this._io.readS4le());
            }
            this.points = new ArrayList<Point>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.points.add(new Point(this._io, this, _root));
            }
            this.zRange = new BoundsMinMax(this._io, this, _root);
            this.zValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.zValues.add(this._io.readF8le());
            }
            this.mRange = new BoundsMinMax(this._io, this, _root);
            this.mValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.mValues.add(this._io.readF8le());
            }
        }

        public void _fetchInstances() {
            this.boundingBox._fetchInstances();
            for (int i = 0; i < this.parts.size(); i++) {
            }
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._fetchInstances();
            }
            this.zRange._fetchInstances();
            for (int i = 0; i < this.zValues.size(); i++) {
            }
            this.mRange._fetchInstances();
            for (int i = 0; i < this.mValues.size(); i++) {
            }
        }
        private BoundingBoxXY boundingBox;
        private int numberOfParts;
        private int numberOfPoints;
        private List<Integer> parts;
        private List<Point> points;
        private BoundsMinMax zRange;
        private List<Double> zValues;
        private BoundsMinMax mRange;
        private List<Double> mValues;
        private ShapefileMain _root;
        private ShapefileMain.RecordContents _parent;
        public BoundingBoxXY boundingBox() { return boundingBox; }
        public int numberOfParts() { return numberOfParts; }
        public int numberOfPoints() { return numberOfPoints; }
        public List<Integer> parts() { return parts; }
        public List<Point> points() { return points; }
        public BoundsMinMax zRange() { return zRange; }
        public List<Double> zValues() { return zValues; }
        public BoundsMinMax mRange() { return mRange; }
        public List<Double> mValues() { return mValues; }
        public ShapefileMain _root() { return _root; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
    }
    public static class Record extends KaitaiStruct {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new ByteBufferKaitaiStream(fileName));
        }

        public Record(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Record(KaitaiStream _io, ShapefileMain _parent) {
            this(_io, _parent, null);
        }

        public Record(KaitaiStream _io, ShapefileMain _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.header = new RecordHeader(this._io, this, _root);
            this.contents = new RecordContents(this._io, this, _root);
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            this.contents._fetchInstances();
        }
        private RecordHeader header;
        private RecordContents contents;
        private ShapefileMain _root;
        private ShapefileMain _parent;
        public RecordHeader header() { return header; }

        /**
         * the size of this contents section in bytes must equal header.content_length * 2
         */
        public RecordContents contents() { return contents; }
        public ShapefileMain _root() { return _root; }
        public ShapefileMain _parent() { return _parent; }
    }
    public static class RecordContents extends KaitaiStruct {
        public static RecordContents fromFile(String fileName) throws IOException {
            return new RecordContents(new ByteBufferKaitaiStream(fileName));
        }

        public RecordContents(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RecordContents(KaitaiStream _io, ShapefileMain.Record _parent) {
            this(_io, _parent, null);
        }

        public RecordContents(KaitaiStream _io, ShapefileMain.Record _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.shapeType = ShapefileMain.ShapeType.byId(this._io.readS4le());
            if (shapeType() != ShapefileMain.ShapeType.NULL_SHAPE) {
                {
                    ShapeType on = shapeType();
                    if (on != null) {
                        switch (shapeType()) {
                        case MULTI_PATCH: {
                            this.shapeParameters = new MultiPatch(this._io, this, _root);
                            break;
                        }
                        case MULTI_POINT: {
                            this.shapeParameters = new MultiPoint(this._io, this, _root);
                            break;
                        }
                        case MULTI_POINT_M: {
                            this.shapeParameters = new MultiPointM(this._io, this, _root);
                            break;
                        }
                        case MULTI_POINT_Z: {
                            this.shapeParameters = new MultiPointZ(this._io, this, _root);
                            break;
                        }
                        case POINT: {
                            this.shapeParameters = new Point(this._io, this, _root);
                            break;
                        }
                        case POINT_M: {
                            this.shapeParameters = new PointM(this._io, this, _root);
                            break;
                        }
                        case POINT_Z: {
                            this.shapeParameters = new PointZ(this._io, this, _root);
                            break;
                        }
                        case POLY_LINE: {
                            this.shapeParameters = new PolyLine(this._io, this, _root);
                            break;
                        }
                        case POLY_LINE_M: {
                            this.shapeParameters = new PolyLineM(this._io, this, _root);
                            break;
                        }
                        case POLY_LINE_Z: {
                            this.shapeParameters = new PolyLineZ(this._io, this, _root);
                            break;
                        }
                        case POLYGON: {
                            this.shapeParameters = new Polygon(this._io, this, _root);
                            break;
                        }
                        case POLYGON_M: {
                            this.shapeParameters = new PolygonM(this._io, this, _root);
                            break;
                        }
                        case POLYGON_Z: {
                            this.shapeParameters = new PolygonZ(this._io, this, _root);
                            break;
                        }
                        }
                    }
                }
            }
        }

        public void _fetchInstances() {
            if (shapeType() != ShapefileMain.ShapeType.NULL_SHAPE) {
                {
                    ShapeType on = shapeType();
                    if (on != null) {
                        switch (shapeType()) {
                        case MULTI_PATCH: {
                            ((MultiPatch) (this.shapeParameters))._fetchInstances();
                            break;
                        }
                        case MULTI_POINT: {
                            ((MultiPoint) (this.shapeParameters))._fetchInstances();
                            break;
                        }
                        case MULTI_POINT_M: {
                            ((MultiPointM) (this.shapeParameters))._fetchInstances();
                            break;
                        }
                        case MULTI_POINT_Z: {
                            ((MultiPointZ) (this.shapeParameters))._fetchInstances();
                            break;
                        }
                        case POINT: {
                            ((Point) (this.shapeParameters))._fetchInstances();
                            break;
                        }
                        case POINT_M: {
                            ((PointM) (this.shapeParameters))._fetchInstances();
                            break;
                        }
                        case POINT_Z: {
                            ((PointZ) (this.shapeParameters))._fetchInstances();
                            break;
                        }
                        case POLY_LINE: {
                            ((PolyLine) (this.shapeParameters))._fetchInstances();
                            break;
                        }
                        case POLY_LINE_M: {
                            ((PolyLineM) (this.shapeParameters))._fetchInstances();
                            break;
                        }
                        case POLY_LINE_Z: {
                            ((PolyLineZ) (this.shapeParameters))._fetchInstances();
                            break;
                        }
                        case POLYGON: {
                            ((Polygon) (this.shapeParameters))._fetchInstances();
                            break;
                        }
                        case POLYGON_M: {
                            ((PolygonM) (this.shapeParameters))._fetchInstances();
                            break;
                        }
                        case POLYGON_Z: {
                            ((PolygonZ) (this.shapeParameters))._fetchInstances();
                            break;
                        }
                        }
                    }
                }
            }
        }
        private ShapeType shapeType;
        private KaitaiStruct shapeParameters;
        private ShapefileMain _root;
        private ShapefileMain.Record _parent;
        public ShapeType shapeType() { return shapeType; }
        public KaitaiStruct shapeParameters() { return shapeParameters; }
        public ShapefileMain _root() { return _root; }
        public ShapefileMain.Record _parent() { return _parent; }
    }
    public static class RecordHeader extends KaitaiStruct {
        public static RecordHeader fromFile(String fileName) throws IOException {
            return new RecordHeader(new ByteBufferKaitaiStream(fileName));
        }

        public RecordHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RecordHeader(KaitaiStream _io, ShapefileMain.Record _parent) {
            this(_io, _parent, null);
        }

        public RecordHeader(KaitaiStream _io, ShapefileMain.Record _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.recordNumber = this._io.readS4be();
            this.contentLength = this._io.readS4be();
        }

        public void _fetchInstances() {
        }
        private int recordNumber;
        private int contentLength;
        private ShapefileMain _root;
        private ShapefileMain.Record _parent;
        public int recordNumber() { return recordNumber; }
        public int contentLength() { return contentLength; }
        public ShapefileMain _root() { return _root; }
        public ShapefileMain.Record _parent() { return _parent; }
    }
    private FileHeader header;
    private List<Record> records;
    private ShapefileMain _root;
    private KaitaiStruct _parent;
    public FileHeader header() { return header; }

    /**
     * the size of this section of the file in bytes must equal (header.file_length * 2) - 100
     */
    public List<Record> records() { return records; }
    public ShapefileMain _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
