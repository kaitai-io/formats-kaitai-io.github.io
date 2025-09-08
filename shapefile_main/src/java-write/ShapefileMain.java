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
import java.util.Arrays;
import java.util.List;

public class ShapefileMain extends KaitaiStruct.ReadWrite {
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
    public ShapefileMain() {
        this(null, null, null);
    }

    public ShapefileMain(KaitaiStream _io) {
        this(_io, null, null);
    }

    public ShapefileMain(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public ShapefileMain(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, ShapefileMain _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new FileHeader(this._io, this, _root);
        this.header._read();
        this.records = new ArrayList<Record>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                Record _t_records = new Record(this._io, this, _root);
                try {
                    _t_records._read();
                } finally {
                    this.records.add(_t_records);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        for (int i = 0; i < this.records.size(); i++) {
            this.records.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.header._write_Seq(this._io);
        for (int i = 0; i < this.records.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("records", 0, this._io.size() - this._io.pos());
            this.records.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("records", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        for (int i = 0; i < this.records.size(); i++) {
            if (!Objects.equals(this.records.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("records", _root(), this.records.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.records.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("records", this, this.records.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class BoundingBoxXY extends KaitaiStruct.ReadWrite {
        public static BoundingBoxXY fromFile(String fileName) throws IOException {
            return new BoundingBoxXY(new ByteBufferKaitaiStream(fileName));
        }
        public BoundingBoxXY() {
            this(null, null, null);
        }

        public BoundingBoxXY(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BoundingBoxXY(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public BoundingBoxXY(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.x = new BoundsMinMax(this._io, this, _root);
            this.x._read();
            this.y = new BoundsMinMax(this._io, this, _root);
            this.y._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.x._fetchInstances();
            this.y._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.x._write_Seq(this._io);
            this.y._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.x._root(), _root()))
                throw new ConsistencyError("x", _root(), this.x._root());
            if (!Objects.equals(this.x._parent(), this))
                throw new ConsistencyError("x", this, this.x._parent());
            if (!Objects.equals(this.y._root(), _root()))
                throw new ConsistencyError("y", _root(), this.y._root());
            if (!Objects.equals(this.y._parent(), this))
                throw new ConsistencyError("y", this, this.y._parent());
            _dirty = false;
        }
        private BoundsMinMax x;
        private BoundsMinMax y;
        private ShapefileMain _root;
        private KaitaiStruct.ReadWrite _parent;
        public BoundsMinMax x() { return x; }
        public void setX(BoundsMinMax _v) { _dirty = true; x = _v; }
        public BoundsMinMax y() { return y; }
        public void setY(BoundsMinMax _v) { _dirty = true; y = _v; }
        public ShapefileMain _root() { return _root; }
        public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class BoundingBoxXYZM extends KaitaiStruct.ReadWrite {
        public static BoundingBoxXYZM fromFile(String fileName) throws IOException {
            return new BoundingBoxXYZM(new ByteBufferKaitaiStream(fileName));
        }
        public BoundingBoxXYZM() {
            this(null, null, null);
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
        }
        public void _read() {
            this.x = new BoundsMinMax(this._io, this, _root);
            this.x._read();
            this.y = new BoundsMinMax(this._io, this, _root);
            this.y._read();
            this.z = new BoundsMinMax(this._io, this, _root);
            this.z._read();
            this.m = new BoundsMinMax(this._io, this, _root);
            this.m._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.x._fetchInstances();
            this.y._fetchInstances();
            this.z._fetchInstances();
            this.m._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.x._write_Seq(this._io);
            this.y._write_Seq(this._io);
            this.z._write_Seq(this._io);
            this.m._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.x._root(), _root()))
                throw new ConsistencyError("x", _root(), this.x._root());
            if (!Objects.equals(this.x._parent(), this))
                throw new ConsistencyError("x", this, this.x._parent());
            if (!Objects.equals(this.y._root(), _root()))
                throw new ConsistencyError("y", _root(), this.y._root());
            if (!Objects.equals(this.y._parent(), this))
                throw new ConsistencyError("y", this, this.y._parent());
            if (!Objects.equals(this.z._root(), _root()))
                throw new ConsistencyError("z", _root(), this.z._root());
            if (!Objects.equals(this.z._parent(), this))
                throw new ConsistencyError("z", this, this.z._parent());
            if (!Objects.equals(this.m._root(), _root()))
                throw new ConsistencyError("m", _root(), this.m._root());
            if (!Objects.equals(this.m._parent(), this))
                throw new ConsistencyError("m", this, this.m._parent());
            _dirty = false;
        }
        private BoundsMinMax x;
        private BoundsMinMax y;
        private BoundsMinMax z;
        private BoundsMinMax m;
        private ShapefileMain _root;
        private ShapefileMain.FileHeader _parent;
        public BoundsMinMax x() { return x; }
        public void setX(BoundsMinMax _v) { _dirty = true; x = _v; }
        public BoundsMinMax y() { return y; }
        public void setY(BoundsMinMax _v) { _dirty = true; y = _v; }
        public BoundsMinMax z() { return z; }
        public void setZ(BoundsMinMax _v) { _dirty = true; z = _v; }
        public BoundsMinMax m() { return m; }
        public void setM(BoundsMinMax _v) { _dirty = true; m = _v; }
        public ShapefileMain _root() { return _root; }
        public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
        public ShapefileMain.FileHeader _parent() { return _parent; }
        public void set_parent(ShapefileMain.FileHeader _v) { _dirty = true; _parent = _v; }
    }
    public static class BoundsMinMax extends KaitaiStruct.ReadWrite {
        public static BoundsMinMax fromFile(String fileName) throws IOException {
            return new BoundsMinMax(new ByteBufferKaitaiStream(fileName));
        }
        public BoundsMinMax() {
            this(null, null, null);
        }

        public BoundsMinMax(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BoundsMinMax(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public BoundsMinMax(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.min = this._io.readF8le();
            this.max = this._io.readF8le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeF8le(this.min);
            this._io.writeF8le(this.max);
        }

        public void _check() {
            _dirty = false;
        }
        private double min;
        private double max;
        private ShapefileMain _root;
        private KaitaiStruct.ReadWrite _parent;
        public double min() { return min; }
        public void setMin(double _v) { _dirty = true; min = _v; }
        public double max() { return max; }
        public void setMax(double _v) { _dirty = true; max = _v; }
        public ShapefileMain _root() { return _root; }
        public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class FileHeader extends KaitaiStruct.ReadWrite {
        public static FileHeader fromFile(String fileName) throws IOException {
            return new FileHeader(new ByteBufferKaitaiStream(fileName));
        }
        public FileHeader() {
            this(null, null, null);
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
        }
        public void _read() {
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
            this.boundingBox._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.boundingBox._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.fileCode);
            this._io.writeBytes(this.unusedField1);
            this._io.writeBytes(this.unusedField2);
            this._io.writeBytes(this.unusedField3);
            this._io.writeBytes(this.unusedField4);
            this._io.writeBytes(this.unusedField5);
            this._io.writeS4be(this.fileLength);
            this._io.writeBytes(this.version);
            this._io.writeS4le(((Number) (this.shapeType.id())).intValue());
            this.boundingBox._write_Seq(this._io);
        }

        public void _check() {
            if (this.fileCode.length != 4)
                throw new ConsistencyError("file_code", 4, this.fileCode.length);
            if (!(Arrays.equals(this.fileCode, new byte[] { 0, 0, 39, 10 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 39, 10 }, this.fileCode, null, "/types/file_header/seq/0");
            }
            if (this.unusedField1.length != 4)
                throw new ConsistencyError("unused_field_1", 4, this.unusedField1.length);
            if (!(Arrays.equals(this.unusedField1, new byte[] { 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.unusedField1, null, "/types/file_header/seq/1");
            }
            if (this.unusedField2.length != 4)
                throw new ConsistencyError("unused_field_2", 4, this.unusedField2.length);
            if (!(Arrays.equals(this.unusedField2, new byte[] { 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.unusedField2, null, "/types/file_header/seq/2");
            }
            if (this.unusedField3.length != 4)
                throw new ConsistencyError("unused_field_3", 4, this.unusedField3.length);
            if (!(Arrays.equals(this.unusedField3, new byte[] { 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.unusedField3, null, "/types/file_header/seq/3");
            }
            if (this.unusedField4.length != 4)
                throw new ConsistencyError("unused_field_4", 4, this.unusedField4.length);
            if (!(Arrays.equals(this.unusedField4, new byte[] { 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.unusedField4, null, "/types/file_header/seq/4");
            }
            if (this.unusedField5.length != 4)
                throw new ConsistencyError("unused_field_5", 4, this.unusedField5.length);
            if (!(Arrays.equals(this.unusedField5, new byte[] { 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.unusedField5, null, "/types/file_header/seq/5");
            }
            if (this.version.length != 4)
                throw new ConsistencyError("version", 4, this.version.length);
            if (!(Arrays.equals(this.version, new byte[] { -24, 3, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -24, 3, 0, 0 }, this.version, null, "/types/file_header/seq/7");
            }
            if (!Objects.equals(this.boundingBox._root(), _root()))
                throw new ConsistencyError("bounding_box", _root(), this.boundingBox._root());
            if (!Objects.equals(this.boundingBox._parent(), this))
                throw new ConsistencyError("bounding_box", this, this.boundingBox._parent());
            _dirty = false;
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
        public void setFileCode(byte[] _v) { _dirty = true; fileCode = _v; }
        public byte[] unusedField1() { return unusedField1; }
        public void setUnusedField1(byte[] _v) { _dirty = true; unusedField1 = _v; }
        public byte[] unusedField2() { return unusedField2; }
        public void setUnusedField2(byte[] _v) { _dirty = true; unusedField2 = _v; }
        public byte[] unusedField3() { return unusedField3; }
        public void setUnusedField3(byte[] _v) { _dirty = true; unusedField3 = _v; }
        public byte[] unusedField4() { return unusedField4; }
        public void setUnusedField4(byte[] _v) { _dirty = true; unusedField4 = _v; }
        public byte[] unusedField5() { return unusedField5; }
        public void setUnusedField5(byte[] _v) { _dirty = true; unusedField5 = _v; }
        public int fileLength() { return fileLength; }
        public void setFileLength(int _v) { _dirty = true; fileLength = _v; }

        /**
         * corresponds to s4le value of 1000
         */
        public byte[] version() { return version; }
        public void setVersion(byte[] _v) { _dirty = true; version = _v; }
        public ShapeType shapeType() { return shapeType; }
        public void setShapeType(ShapeType _v) { _dirty = true; shapeType = _v; }
        public BoundingBoxXYZM boundingBox() { return boundingBox; }
        public void setBoundingBox(BoundingBoxXYZM _v) { _dirty = true; boundingBox = _v; }
        public ShapefileMain _root() { return _root; }
        public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
        public ShapefileMain _parent() { return _parent; }
        public void set_parent(ShapefileMain _v) { _dirty = true; _parent = _v; }
    }
    public static class MultiPatch extends KaitaiStruct.ReadWrite {
        public static MultiPatch fromFile(String fileName) throws IOException {
            return new MultiPatch(new ByteBufferKaitaiStream(fileName));
        }
        public MultiPatch() {
            this(null, null, null);
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
        }
        public void _read() {
            this.boundingBox = new BoundingBoxXY(this._io, this, _root);
            this.boundingBox._read();
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
                Point _t_points = new Point(this._io, this, _root);
                try {
                    _t_points._read();
                } finally {
                    this.points.add(_t_points);
                }
            }
            this.zRange = new BoundsMinMax(this._io, this, _root);
            this.zRange._read();
            this.zValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.zValues.add(this._io.readF8le());
            }
            this.mRange = new BoundsMinMax(this._io, this, _root);
            this.mRange._read();
            this.mValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.mValues.add(this._io.readF8le());
            }
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            this.boundingBox._write_Seq(this._io);
            this._io.writeS4le(this.numberOfParts);
            this._io.writeS4le(this.numberOfPoints);
            for (int i = 0; i < this.parts.size(); i++) {
                this._io.writeS4le(this.parts.get(((Number) (i)).intValue()));
            }
            for (int i = 0; i < this.partTypes.size(); i++) {
                this._io.writeS4le(((Number) (this.partTypes.get(((Number) (i)).intValue()).id())).intValue());
            }
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this.zRange._write_Seq(this._io);
            for (int i = 0; i < this.zValues.size(); i++) {
                this._io.writeF8le(this.zValues.get(((Number) (i)).intValue()));
            }
            this.mRange._write_Seq(this._io);
            for (int i = 0; i < this.mValues.size(); i++) {
                this._io.writeF8le(this.mValues.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (!Objects.equals(this.boundingBox._root(), _root()))
                throw new ConsistencyError("bounding_box", _root(), this.boundingBox._root());
            if (!Objects.equals(this.boundingBox._parent(), this))
                throw new ConsistencyError("bounding_box", this, this.boundingBox._parent());
            if (this.parts.size() != numberOfParts())
                throw new ConsistencyError("parts", numberOfParts(), this.parts.size());
            for (int i = 0; i < this.parts.size(); i++) {
            }
            if (this.partTypes.size() != numberOfParts())
                throw new ConsistencyError("part_types", numberOfParts(), this.partTypes.size());
            for (int i = 0; i < this.partTypes.size(); i++) {
            }
            if (this.points.size() != numberOfPoints())
                throw new ConsistencyError("points", numberOfPoints(), this.points.size());
            for (int i = 0; i < this.points.size(); i++) {
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("points", _root(), this.points.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("points", this, this.points.get(((Number) (i)).intValue())._parent());
            }
            if (!Objects.equals(this.zRange._root(), _root()))
                throw new ConsistencyError("z_range", _root(), this.zRange._root());
            if (!Objects.equals(this.zRange._parent(), this))
                throw new ConsistencyError("z_range", this, this.zRange._parent());
            if (this.zValues.size() != numberOfPoints())
                throw new ConsistencyError("z_values", numberOfPoints(), this.zValues.size());
            for (int i = 0; i < this.zValues.size(); i++) {
            }
            if (!Objects.equals(this.mRange._root(), _root()))
                throw new ConsistencyError("m_range", _root(), this.mRange._root());
            if (!Objects.equals(this.mRange._parent(), this))
                throw new ConsistencyError("m_range", this, this.mRange._parent());
            if (this.mValues.size() != numberOfPoints())
                throw new ConsistencyError("m_values", numberOfPoints(), this.mValues.size());
            for (int i = 0; i < this.mValues.size(); i++) {
            }
            _dirty = false;
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
        public void setBoundingBox(BoundingBoxXY _v) { _dirty = true; boundingBox = _v; }
        public int numberOfParts() { return numberOfParts; }
        public void setNumberOfParts(int _v) { _dirty = true; numberOfParts = _v; }
        public int numberOfPoints() { return numberOfPoints; }
        public void setNumberOfPoints(int _v) { _dirty = true; numberOfPoints = _v; }
        public List<Integer> parts() { return parts; }
        public void setParts(List<Integer> _v) { _dirty = true; parts = _v; }
        public List<PartType> partTypes() { return partTypes; }
        public void setPartTypes(List<PartType> _v) { _dirty = true; partTypes = _v; }
        public List<Point> points() { return points; }
        public void setPoints(List<Point> _v) { _dirty = true; points = _v; }
        public BoundsMinMax zRange() { return zRange; }
        public void setZRange(BoundsMinMax _v) { _dirty = true; zRange = _v; }
        public List<Double> zValues() { return zValues; }
        public void setZValues(List<Double> _v) { _dirty = true; zValues = _v; }
        public BoundsMinMax mRange() { return mRange; }
        public void setMRange(BoundsMinMax _v) { _dirty = true; mRange = _v; }
        public List<Double> mValues() { return mValues; }
        public void setMValues(List<Double> _v) { _dirty = true; mValues = _v; }
        public ShapefileMain _root() { return _root; }
        public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
        public void set_parent(ShapefileMain.RecordContents _v) { _dirty = true; _parent = _v; }
    }
    public static class MultiPoint extends KaitaiStruct.ReadWrite {
        public static MultiPoint fromFile(String fileName) throws IOException {
            return new MultiPoint(new ByteBufferKaitaiStream(fileName));
        }
        public MultiPoint() {
            this(null, null, null);
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
        }
        public void _read() {
            this.boundingBox = new BoundingBoxXY(this._io, this, _root);
            this.boundingBox._read();
            this.numberOfPoints = this._io.readS4le();
            this.points = new ArrayList<Point>();
            for (int i = 0; i < numberOfPoints(); i++) {
                Point _t_points = new Point(this._io, this, _root);
                try {
                    _t_points._read();
                } finally {
                    this.points.add(_t_points);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.boundingBox._fetchInstances();
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.boundingBox._write_Seq(this._io);
            this._io.writeS4le(this.numberOfPoints);
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (!Objects.equals(this.boundingBox._root(), _root()))
                throw new ConsistencyError("bounding_box", _root(), this.boundingBox._root());
            if (!Objects.equals(this.boundingBox._parent(), this))
                throw new ConsistencyError("bounding_box", this, this.boundingBox._parent());
            if (this.points.size() != numberOfPoints())
                throw new ConsistencyError("points", numberOfPoints(), this.points.size());
            for (int i = 0; i < this.points.size(); i++) {
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("points", _root(), this.points.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("points", this, this.points.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private BoundingBoxXY boundingBox;
        private int numberOfPoints;
        private List<Point> points;
        private ShapefileMain _root;
        private ShapefileMain.RecordContents _parent;
        public BoundingBoxXY boundingBox() { return boundingBox; }
        public void setBoundingBox(BoundingBoxXY _v) { _dirty = true; boundingBox = _v; }
        public int numberOfPoints() { return numberOfPoints; }
        public void setNumberOfPoints(int _v) { _dirty = true; numberOfPoints = _v; }
        public List<Point> points() { return points; }
        public void setPoints(List<Point> _v) { _dirty = true; points = _v; }
        public ShapefileMain _root() { return _root; }
        public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
        public void set_parent(ShapefileMain.RecordContents _v) { _dirty = true; _parent = _v; }
    }
    public static class MultiPointM extends KaitaiStruct.ReadWrite {
        public static MultiPointM fromFile(String fileName) throws IOException {
            return new MultiPointM(new ByteBufferKaitaiStream(fileName));
        }
        public MultiPointM() {
            this(null, null, null);
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
        }
        public void _read() {
            this.boundingBox = new BoundingBoxXY(this._io, this, _root);
            this.boundingBox._read();
            this.numberOfPoints = this._io.readS4le();
            this.points = new ArrayList<Point>();
            for (int i = 0; i < numberOfPoints(); i++) {
                Point _t_points = new Point(this._io, this, _root);
                try {
                    _t_points._read();
                } finally {
                    this.points.add(_t_points);
                }
            }
            this.mRange = new BoundsMinMax(this._io, this, _root);
            this.mRange._read();
            this.mValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.mValues.add(this._io.readF8le());
            }
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            this.boundingBox._write_Seq(this._io);
            this._io.writeS4le(this.numberOfPoints);
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this.mRange._write_Seq(this._io);
            for (int i = 0; i < this.mValues.size(); i++) {
                this._io.writeF8le(this.mValues.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (!Objects.equals(this.boundingBox._root(), _root()))
                throw new ConsistencyError("bounding_box", _root(), this.boundingBox._root());
            if (!Objects.equals(this.boundingBox._parent(), this))
                throw new ConsistencyError("bounding_box", this, this.boundingBox._parent());
            if (this.points.size() != numberOfPoints())
                throw new ConsistencyError("points", numberOfPoints(), this.points.size());
            for (int i = 0; i < this.points.size(); i++) {
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("points", _root(), this.points.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("points", this, this.points.get(((Number) (i)).intValue())._parent());
            }
            if (!Objects.equals(this.mRange._root(), _root()))
                throw new ConsistencyError("m_range", _root(), this.mRange._root());
            if (!Objects.equals(this.mRange._parent(), this))
                throw new ConsistencyError("m_range", this, this.mRange._parent());
            if (this.mValues.size() != numberOfPoints())
                throw new ConsistencyError("m_values", numberOfPoints(), this.mValues.size());
            for (int i = 0; i < this.mValues.size(); i++) {
            }
            _dirty = false;
        }
        private BoundingBoxXY boundingBox;
        private int numberOfPoints;
        private List<Point> points;
        private BoundsMinMax mRange;
        private List<Double> mValues;
        private ShapefileMain _root;
        private ShapefileMain.RecordContents _parent;
        public BoundingBoxXY boundingBox() { return boundingBox; }
        public void setBoundingBox(BoundingBoxXY _v) { _dirty = true; boundingBox = _v; }
        public int numberOfPoints() { return numberOfPoints; }
        public void setNumberOfPoints(int _v) { _dirty = true; numberOfPoints = _v; }
        public List<Point> points() { return points; }
        public void setPoints(List<Point> _v) { _dirty = true; points = _v; }
        public BoundsMinMax mRange() { return mRange; }
        public void setMRange(BoundsMinMax _v) { _dirty = true; mRange = _v; }
        public List<Double> mValues() { return mValues; }
        public void setMValues(List<Double> _v) { _dirty = true; mValues = _v; }
        public ShapefileMain _root() { return _root; }
        public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
        public void set_parent(ShapefileMain.RecordContents _v) { _dirty = true; _parent = _v; }
    }
    public static class MultiPointZ extends KaitaiStruct.ReadWrite {
        public static MultiPointZ fromFile(String fileName) throws IOException {
            return new MultiPointZ(new ByteBufferKaitaiStream(fileName));
        }
        public MultiPointZ() {
            this(null, null, null);
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
        }
        public void _read() {
            this.boundingBox = new BoundingBoxXY(this._io, this, _root);
            this.boundingBox._read();
            this.numberOfPoints = this._io.readS4le();
            this.points = new ArrayList<Point>();
            for (int i = 0; i < numberOfPoints(); i++) {
                Point _t_points = new Point(this._io, this, _root);
                try {
                    _t_points._read();
                } finally {
                    this.points.add(_t_points);
                }
            }
            this.zRange = new BoundsMinMax(this._io, this, _root);
            this.zRange._read();
            this.zValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.zValues.add(this._io.readF8le());
            }
            this.mRange = new BoundsMinMax(this._io, this, _root);
            this.mRange._read();
            this.mValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.mValues.add(this._io.readF8le());
            }
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            this.boundingBox._write_Seq(this._io);
            this._io.writeS4le(this.numberOfPoints);
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this.zRange._write_Seq(this._io);
            for (int i = 0; i < this.zValues.size(); i++) {
                this._io.writeF8le(this.zValues.get(((Number) (i)).intValue()));
            }
            this.mRange._write_Seq(this._io);
            for (int i = 0; i < this.mValues.size(); i++) {
                this._io.writeF8le(this.mValues.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (!Objects.equals(this.boundingBox._root(), _root()))
                throw new ConsistencyError("bounding_box", _root(), this.boundingBox._root());
            if (!Objects.equals(this.boundingBox._parent(), this))
                throw new ConsistencyError("bounding_box", this, this.boundingBox._parent());
            if (this.points.size() != numberOfPoints())
                throw new ConsistencyError("points", numberOfPoints(), this.points.size());
            for (int i = 0; i < this.points.size(); i++) {
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("points", _root(), this.points.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("points", this, this.points.get(((Number) (i)).intValue())._parent());
            }
            if (!Objects.equals(this.zRange._root(), _root()))
                throw new ConsistencyError("z_range", _root(), this.zRange._root());
            if (!Objects.equals(this.zRange._parent(), this))
                throw new ConsistencyError("z_range", this, this.zRange._parent());
            if (this.zValues.size() != numberOfPoints())
                throw new ConsistencyError("z_values", numberOfPoints(), this.zValues.size());
            for (int i = 0; i < this.zValues.size(); i++) {
            }
            if (!Objects.equals(this.mRange._root(), _root()))
                throw new ConsistencyError("m_range", _root(), this.mRange._root());
            if (!Objects.equals(this.mRange._parent(), this))
                throw new ConsistencyError("m_range", this, this.mRange._parent());
            if (this.mValues.size() != numberOfPoints())
                throw new ConsistencyError("m_values", numberOfPoints(), this.mValues.size());
            for (int i = 0; i < this.mValues.size(); i++) {
            }
            _dirty = false;
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
        public void setBoundingBox(BoundingBoxXY _v) { _dirty = true; boundingBox = _v; }
        public int numberOfPoints() { return numberOfPoints; }
        public void setNumberOfPoints(int _v) { _dirty = true; numberOfPoints = _v; }
        public List<Point> points() { return points; }
        public void setPoints(List<Point> _v) { _dirty = true; points = _v; }
        public BoundsMinMax zRange() { return zRange; }
        public void setZRange(BoundsMinMax _v) { _dirty = true; zRange = _v; }
        public List<Double> zValues() { return zValues; }
        public void setZValues(List<Double> _v) { _dirty = true; zValues = _v; }
        public BoundsMinMax mRange() { return mRange; }
        public void setMRange(BoundsMinMax _v) { _dirty = true; mRange = _v; }
        public List<Double> mValues() { return mValues; }
        public void setMValues(List<Double> _v) { _dirty = true; mValues = _v; }
        public ShapefileMain _root() { return _root; }
        public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
        public void set_parent(ShapefileMain.RecordContents _v) { _dirty = true; _parent = _v; }
    }
    public static class Point extends KaitaiStruct.ReadWrite {
        public static Point fromFile(String fileName) throws IOException {
            return new Point(new ByteBufferKaitaiStream(fileName));
        }
        public Point() {
            this(null, null, null);
        }

        public Point(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Point(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Point(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.x = this._io.readF8le();
            this.y = this._io.readF8le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeF8le(this.x);
            this._io.writeF8le(this.y);
        }

        public void _check() {
            _dirty = false;
        }
        private double x;
        private double y;
        private ShapefileMain _root;
        private KaitaiStruct.ReadWrite _parent;
        public double x() { return x; }
        public void setX(double _v) { _dirty = true; x = _v; }
        public double y() { return y; }
        public void setY(double _v) { _dirty = true; y = _v; }
        public ShapefileMain _root() { return _root; }
        public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class PointM extends KaitaiStruct.ReadWrite {
        public static PointM fromFile(String fileName) throws IOException {
            return new PointM(new ByteBufferKaitaiStream(fileName));
        }
        public PointM() {
            this(null, null, null);
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
        }
        public void _read() {
            this.x = this._io.readF8le();
            this.y = this._io.readF8le();
            this.m = this._io.readF8le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeF8le(this.x);
            this._io.writeF8le(this.y);
            this._io.writeF8le(this.m);
        }

        public void _check() {
            _dirty = false;
        }
        private double x;
        private double y;
        private double m;
        private ShapefileMain _root;
        private ShapefileMain.RecordContents _parent;
        public double x() { return x; }
        public void setX(double _v) { _dirty = true; x = _v; }
        public double y() { return y; }
        public void setY(double _v) { _dirty = true; y = _v; }
        public double m() { return m; }
        public void setM(double _v) { _dirty = true; m = _v; }
        public ShapefileMain _root() { return _root; }
        public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
        public void set_parent(ShapefileMain.RecordContents _v) { _dirty = true; _parent = _v; }
    }
    public static class PointZ extends KaitaiStruct.ReadWrite {
        public static PointZ fromFile(String fileName) throws IOException {
            return new PointZ(new ByteBufferKaitaiStream(fileName));
        }
        public PointZ() {
            this(null, null, null);
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
        }
        public void _read() {
            this.x = this._io.readF8le();
            this.y = this._io.readF8le();
            this.z = this._io.readF8le();
            this.m = this._io.readF8le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeF8le(this.x);
            this._io.writeF8le(this.y);
            this._io.writeF8le(this.z);
            this._io.writeF8le(this.m);
        }

        public void _check() {
            _dirty = false;
        }
        private double x;
        private double y;
        private double z;
        private double m;
        private ShapefileMain _root;
        private ShapefileMain.RecordContents _parent;
        public double x() { return x; }
        public void setX(double _v) { _dirty = true; x = _v; }
        public double y() { return y; }
        public void setY(double _v) { _dirty = true; y = _v; }
        public double z() { return z; }
        public void setZ(double _v) { _dirty = true; z = _v; }
        public double m() { return m; }
        public void setM(double _v) { _dirty = true; m = _v; }
        public ShapefileMain _root() { return _root; }
        public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
        public void set_parent(ShapefileMain.RecordContents _v) { _dirty = true; _parent = _v; }
    }
    public static class PolyLine extends KaitaiStruct.ReadWrite {
        public static PolyLine fromFile(String fileName) throws IOException {
            return new PolyLine(new ByteBufferKaitaiStream(fileName));
        }
        public PolyLine() {
            this(null, null, null);
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
        }
        public void _read() {
            this.boundingBox = new BoundingBoxXY(this._io, this, _root);
            this.boundingBox._read();
            this.numberOfParts = this._io.readS4le();
            this.numberOfPoints = this._io.readS4le();
            this.parts = new ArrayList<Integer>();
            for (int i = 0; i < numberOfParts(); i++) {
                this.parts.add(this._io.readS4le());
            }
            this.points = new ArrayList<Point>();
            for (int i = 0; i < numberOfPoints(); i++) {
                Point _t_points = new Point(this._io, this, _root);
                try {
                    _t_points._read();
                } finally {
                    this.points.add(_t_points);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.boundingBox._fetchInstances();
            for (int i = 0; i < this.parts.size(); i++) {
            }
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.boundingBox._write_Seq(this._io);
            this._io.writeS4le(this.numberOfParts);
            this._io.writeS4le(this.numberOfPoints);
            for (int i = 0; i < this.parts.size(); i++) {
                this._io.writeS4le(this.parts.get(((Number) (i)).intValue()));
            }
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (!Objects.equals(this.boundingBox._root(), _root()))
                throw new ConsistencyError("bounding_box", _root(), this.boundingBox._root());
            if (!Objects.equals(this.boundingBox._parent(), this))
                throw new ConsistencyError("bounding_box", this, this.boundingBox._parent());
            if (this.parts.size() != numberOfParts())
                throw new ConsistencyError("parts", numberOfParts(), this.parts.size());
            for (int i = 0; i < this.parts.size(); i++) {
            }
            if (this.points.size() != numberOfPoints())
                throw new ConsistencyError("points", numberOfPoints(), this.points.size());
            for (int i = 0; i < this.points.size(); i++) {
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("points", _root(), this.points.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("points", this, this.points.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private BoundingBoxXY boundingBox;
        private int numberOfParts;
        private int numberOfPoints;
        private List<Integer> parts;
        private List<Point> points;
        private ShapefileMain _root;
        private ShapefileMain.RecordContents _parent;
        public BoundingBoxXY boundingBox() { return boundingBox; }
        public void setBoundingBox(BoundingBoxXY _v) { _dirty = true; boundingBox = _v; }
        public int numberOfParts() { return numberOfParts; }
        public void setNumberOfParts(int _v) { _dirty = true; numberOfParts = _v; }
        public int numberOfPoints() { return numberOfPoints; }
        public void setNumberOfPoints(int _v) { _dirty = true; numberOfPoints = _v; }
        public List<Integer> parts() { return parts; }
        public void setParts(List<Integer> _v) { _dirty = true; parts = _v; }
        public List<Point> points() { return points; }
        public void setPoints(List<Point> _v) { _dirty = true; points = _v; }
        public ShapefileMain _root() { return _root; }
        public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
        public void set_parent(ShapefileMain.RecordContents _v) { _dirty = true; _parent = _v; }
    }
    public static class PolyLineM extends KaitaiStruct.ReadWrite {
        public static PolyLineM fromFile(String fileName) throws IOException {
            return new PolyLineM(new ByteBufferKaitaiStream(fileName));
        }
        public PolyLineM() {
            this(null, null, null);
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
        }
        public void _read() {
            this.boundingBox = new BoundingBoxXY(this._io, this, _root);
            this.boundingBox._read();
            this.numberOfParts = this._io.readS4le();
            this.numberOfPoints = this._io.readS4le();
            this.parts = new ArrayList<Integer>();
            for (int i = 0; i < numberOfParts(); i++) {
                this.parts.add(this._io.readS4le());
            }
            this.points = new ArrayList<Point>();
            for (int i = 0; i < numberOfPoints(); i++) {
                Point _t_points = new Point(this._io, this, _root);
                try {
                    _t_points._read();
                } finally {
                    this.points.add(_t_points);
                }
            }
            this.mRange = new BoundsMinMax(this._io, this, _root);
            this.mRange._read();
            this.mValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.mValues.add(this._io.readF8le());
            }
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            this.boundingBox._write_Seq(this._io);
            this._io.writeS4le(this.numberOfParts);
            this._io.writeS4le(this.numberOfPoints);
            for (int i = 0; i < this.parts.size(); i++) {
                this._io.writeS4le(this.parts.get(((Number) (i)).intValue()));
            }
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this.mRange._write_Seq(this._io);
            for (int i = 0; i < this.mValues.size(); i++) {
                this._io.writeF8le(this.mValues.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (!Objects.equals(this.boundingBox._root(), _root()))
                throw new ConsistencyError("bounding_box", _root(), this.boundingBox._root());
            if (!Objects.equals(this.boundingBox._parent(), this))
                throw new ConsistencyError("bounding_box", this, this.boundingBox._parent());
            if (this.parts.size() != numberOfParts())
                throw new ConsistencyError("parts", numberOfParts(), this.parts.size());
            for (int i = 0; i < this.parts.size(); i++) {
            }
            if (this.points.size() != numberOfPoints())
                throw new ConsistencyError("points", numberOfPoints(), this.points.size());
            for (int i = 0; i < this.points.size(); i++) {
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("points", _root(), this.points.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("points", this, this.points.get(((Number) (i)).intValue())._parent());
            }
            if (!Objects.equals(this.mRange._root(), _root()))
                throw new ConsistencyError("m_range", _root(), this.mRange._root());
            if (!Objects.equals(this.mRange._parent(), this))
                throw new ConsistencyError("m_range", this, this.mRange._parent());
            if (this.mValues.size() != numberOfPoints())
                throw new ConsistencyError("m_values", numberOfPoints(), this.mValues.size());
            for (int i = 0; i < this.mValues.size(); i++) {
            }
            _dirty = false;
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
        public void setBoundingBox(BoundingBoxXY _v) { _dirty = true; boundingBox = _v; }
        public int numberOfParts() { return numberOfParts; }
        public void setNumberOfParts(int _v) { _dirty = true; numberOfParts = _v; }
        public int numberOfPoints() { return numberOfPoints; }
        public void setNumberOfPoints(int _v) { _dirty = true; numberOfPoints = _v; }
        public List<Integer> parts() { return parts; }
        public void setParts(List<Integer> _v) { _dirty = true; parts = _v; }
        public List<Point> points() { return points; }
        public void setPoints(List<Point> _v) { _dirty = true; points = _v; }
        public BoundsMinMax mRange() { return mRange; }
        public void setMRange(BoundsMinMax _v) { _dirty = true; mRange = _v; }
        public List<Double> mValues() { return mValues; }
        public void setMValues(List<Double> _v) { _dirty = true; mValues = _v; }
        public ShapefileMain _root() { return _root; }
        public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
        public void set_parent(ShapefileMain.RecordContents _v) { _dirty = true; _parent = _v; }
    }
    public static class PolyLineZ extends KaitaiStruct.ReadWrite {
        public static PolyLineZ fromFile(String fileName) throws IOException {
            return new PolyLineZ(new ByteBufferKaitaiStream(fileName));
        }
        public PolyLineZ() {
            this(null, null, null);
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
        }
        public void _read() {
            this.boundingBox = new BoundingBoxXY(this._io, this, _root);
            this.boundingBox._read();
            this.numberOfParts = this._io.readS4le();
            this.numberOfPoints = this._io.readS4le();
            this.parts = new ArrayList<Integer>();
            for (int i = 0; i < numberOfParts(); i++) {
                this.parts.add(this._io.readS4le());
            }
            this.points = new ArrayList<Point>();
            for (int i = 0; i < numberOfPoints(); i++) {
                Point _t_points = new Point(this._io, this, _root);
                try {
                    _t_points._read();
                } finally {
                    this.points.add(_t_points);
                }
            }
            this.zRange = new BoundsMinMax(this._io, this, _root);
            this.zRange._read();
            this.zValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.zValues.add(this._io.readF8le());
            }
            this.mRange = new BoundsMinMax(this._io, this, _root);
            this.mRange._read();
            this.mValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.mValues.add(this._io.readF8le());
            }
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            this.boundingBox._write_Seq(this._io);
            this._io.writeS4le(this.numberOfParts);
            this._io.writeS4le(this.numberOfPoints);
            for (int i = 0; i < this.parts.size(); i++) {
                this._io.writeS4le(this.parts.get(((Number) (i)).intValue()));
            }
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this.zRange._write_Seq(this._io);
            for (int i = 0; i < this.zValues.size(); i++) {
                this._io.writeF8le(this.zValues.get(((Number) (i)).intValue()));
            }
            this.mRange._write_Seq(this._io);
            for (int i = 0; i < this.mValues.size(); i++) {
                this._io.writeF8le(this.mValues.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (!Objects.equals(this.boundingBox._root(), _root()))
                throw new ConsistencyError("bounding_box", _root(), this.boundingBox._root());
            if (!Objects.equals(this.boundingBox._parent(), this))
                throw new ConsistencyError("bounding_box", this, this.boundingBox._parent());
            if (this.parts.size() != numberOfParts())
                throw new ConsistencyError("parts", numberOfParts(), this.parts.size());
            for (int i = 0; i < this.parts.size(); i++) {
            }
            if (this.points.size() != numberOfPoints())
                throw new ConsistencyError("points", numberOfPoints(), this.points.size());
            for (int i = 0; i < this.points.size(); i++) {
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("points", _root(), this.points.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("points", this, this.points.get(((Number) (i)).intValue())._parent());
            }
            if (!Objects.equals(this.zRange._root(), _root()))
                throw new ConsistencyError("z_range", _root(), this.zRange._root());
            if (!Objects.equals(this.zRange._parent(), this))
                throw new ConsistencyError("z_range", this, this.zRange._parent());
            if (this.zValues.size() != numberOfPoints())
                throw new ConsistencyError("z_values", numberOfPoints(), this.zValues.size());
            for (int i = 0; i < this.zValues.size(); i++) {
            }
            if (!Objects.equals(this.mRange._root(), _root()))
                throw new ConsistencyError("m_range", _root(), this.mRange._root());
            if (!Objects.equals(this.mRange._parent(), this))
                throw new ConsistencyError("m_range", this, this.mRange._parent());
            if (this.mValues.size() != numberOfPoints())
                throw new ConsistencyError("m_values", numberOfPoints(), this.mValues.size());
            for (int i = 0; i < this.mValues.size(); i++) {
            }
            _dirty = false;
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
        public void setBoundingBox(BoundingBoxXY _v) { _dirty = true; boundingBox = _v; }
        public int numberOfParts() { return numberOfParts; }
        public void setNumberOfParts(int _v) { _dirty = true; numberOfParts = _v; }
        public int numberOfPoints() { return numberOfPoints; }
        public void setNumberOfPoints(int _v) { _dirty = true; numberOfPoints = _v; }
        public List<Integer> parts() { return parts; }
        public void setParts(List<Integer> _v) { _dirty = true; parts = _v; }
        public List<Point> points() { return points; }
        public void setPoints(List<Point> _v) { _dirty = true; points = _v; }
        public BoundsMinMax zRange() { return zRange; }
        public void setZRange(BoundsMinMax _v) { _dirty = true; zRange = _v; }
        public List<Double> zValues() { return zValues; }
        public void setZValues(List<Double> _v) { _dirty = true; zValues = _v; }
        public BoundsMinMax mRange() { return mRange; }
        public void setMRange(BoundsMinMax _v) { _dirty = true; mRange = _v; }
        public List<Double> mValues() { return mValues; }
        public void setMValues(List<Double> _v) { _dirty = true; mValues = _v; }
        public ShapefileMain _root() { return _root; }
        public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
        public void set_parent(ShapefileMain.RecordContents _v) { _dirty = true; _parent = _v; }
    }
    public static class Polygon extends KaitaiStruct.ReadWrite {
        public static Polygon fromFile(String fileName) throws IOException {
            return new Polygon(new ByteBufferKaitaiStream(fileName));
        }
        public Polygon() {
            this(null, null, null);
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
        }
        public void _read() {
            this.boundingBox = new BoundingBoxXY(this._io, this, _root);
            this.boundingBox._read();
            this.numberOfParts = this._io.readS4le();
            this.numberOfPoints = this._io.readS4le();
            this.parts = new ArrayList<Integer>();
            for (int i = 0; i < numberOfParts(); i++) {
                this.parts.add(this._io.readS4le());
            }
            this.points = new ArrayList<Point>();
            for (int i = 0; i < numberOfPoints(); i++) {
                Point _t_points = new Point(this._io, this, _root);
                try {
                    _t_points._read();
                } finally {
                    this.points.add(_t_points);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.boundingBox._fetchInstances();
            for (int i = 0; i < this.parts.size(); i++) {
            }
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.boundingBox._write_Seq(this._io);
            this._io.writeS4le(this.numberOfParts);
            this._io.writeS4le(this.numberOfPoints);
            for (int i = 0; i < this.parts.size(); i++) {
                this._io.writeS4le(this.parts.get(((Number) (i)).intValue()));
            }
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (!Objects.equals(this.boundingBox._root(), _root()))
                throw new ConsistencyError("bounding_box", _root(), this.boundingBox._root());
            if (!Objects.equals(this.boundingBox._parent(), this))
                throw new ConsistencyError("bounding_box", this, this.boundingBox._parent());
            if (this.parts.size() != numberOfParts())
                throw new ConsistencyError("parts", numberOfParts(), this.parts.size());
            for (int i = 0; i < this.parts.size(); i++) {
            }
            if (this.points.size() != numberOfPoints())
                throw new ConsistencyError("points", numberOfPoints(), this.points.size());
            for (int i = 0; i < this.points.size(); i++) {
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("points", _root(), this.points.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("points", this, this.points.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private BoundingBoxXY boundingBox;
        private int numberOfParts;
        private int numberOfPoints;
        private List<Integer> parts;
        private List<Point> points;
        private ShapefileMain _root;
        private ShapefileMain.RecordContents _parent;
        public BoundingBoxXY boundingBox() { return boundingBox; }
        public void setBoundingBox(BoundingBoxXY _v) { _dirty = true; boundingBox = _v; }
        public int numberOfParts() { return numberOfParts; }
        public void setNumberOfParts(int _v) { _dirty = true; numberOfParts = _v; }
        public int numberOfPoints() { return numberOfPoints; }
        public void setNumberOfPoints(int _v) { _dirty = true; numberOfPoints = _v; }
        public List<Integer> parts() { return parts; }
        public void setParts(List<Integer> _v) { _dirty = true; parts = _v; }
        public List<Point> points() { return points; }
        public void setPoints(List<Point> _v) { _dirty = true; points = _v; }
        public ShapefileMain _root() { return _root; }
        public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
        public void set_parent(ShapefileMain.RecordContents _v) { _dirty = true; _parent = _v; }
    }
    public static class PolygonM extends KaitaiStruct.ReadWrite {
        public static PolygonM fromFile(String fileName) throws IOException {
            return new PolygonM(new ByteBufferKaitaiStream(fileName));
        }
        public PolygonM() {
            this(null, null, null);
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
        }
        public void _read() {
            this.boundingBox = new BoundingBoxXY(this._io, this, _root);
            this.boundingBox._read();
            this.numberOfParts = this._io.readS4le();
            this.numberOfPoints = this._io.readS4le();
            this.parts = new ArrayList<Integer>();
            for (int i = 0; i < numberOfParts(); i++) {
                this.parts.add(this._io.readS4le());
            }
            this.points = new ArrayList<Point>();
            for (int i = 0; i < numberOfPoints(); i++) {
                Point _t_points = new Point(this._io, this, _root);
                try {
                    _t_points._read();
                } finally {
                    this.points.add(_t_points);
                }
            }
            this.mRange = new BoundsMinMax(this._io, this, _root);
            this.mRange._read();
            this.mValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.mValues.add(this._io.readF8le());
            }
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            this.boundingBox._write_Seq(this._io);
            this._io.writeS4le(this.numberOfParts);
            this._io.writeS4le(this.numberOfPoints);
            for (int i = 0; i < this.parts.size(); i++) {
                this._io.writeS4le(this.parts.get(((Number) (i)).intValue()));
            }
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this.mRange._write_Seq(this._io);
            for (int i = 0; i < this.mValues.size(); i++) {
                this._io.writeF8le(this.mValues.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (!Objects.equals(this.boundingBox._root(), _root()))
                throw new ConsistencyError("bounding_box", _root(), this.boundingBox._root());
            if (!Objects.equals(this.boundingBox._parent(), this))
                throw new ConsistencyError("bounding_box", this, this.boundingBox._parent());
            if (this.parts.size() != numberOfParts())
                throw new ConsistencyError("parts", numberOfParts(), this.parts.size());
            for (int i = 0; i < this.parts.size(); i++) {
            }
            if (this.points.size() != numberOfPoints())
                throw new ConsistencyError("points", numberOfPoints(), this.points.size());
            for (int i = 0; i < this.points.size(); i++) {
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("points", _root(), this.points.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("points", this, this.points.get(((Number) (i)).intValue())._parent());
            }
            if (!Objects.equals(this.mRange._root(), _root()))
                throw new ConsistencyError("m_range", _root(), this.mRange._root());
            if (!Objects.equals(this.mRange._parent(), this))
                throw new ConsistencyError("m_range", this, this.mRange._parent());
            if (this.mValues.size() != numberOfPoints())
                throw new ConsistencyError("m_values", numberOfPoints(), this.mValues.size());
            for (int i = 0; i < this.mValues.size(); i++) {
            }
            _dirty = false;
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
        public void setBoundingBox(BoundingBoxXY _v) { _dirty = true; boundingBox = _v; }
        public int numberOfParts() { return numberOfParts; }
        public void setNumberOfParts(int _v) { _dirty = true; numberOfParts = _v; }
        public int numberOfPoints() { return numberOfPoints; }
        public void setNumberOfPoints(int _v) { _dirty = true; numberOfPoints = _v; }
        public List<Integer> parts() { return parts; }
        public void setParts(List<Integer> _v) { _dirty = true; parts = _v; }
        public List<Point> points() { return points; }
        public void setPoints(List<Point> _v) { _dirty = true; points = _v; }
        public BoundsMinMax mRange() { return mRange; }
        public void setMRange(BoundsMinMax _v) { _dirty = true; mRange = _v; }
        public List<Double> mValues() { return mValues; }
        public void setMValues(List<Double> _v) { _dirty = true; mValues = _v; }
        public ShapefileMain _root() { return _root; }
        public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
        public void set_parent(ShapefileMain.RecordContents _v) { _dirty = true; _parent = _v; }
    }
    public static class PolygonZ extends KaitaiStruct.ReadWrite {
        public static PolygonZ fromFile(String fileName) throws IOException {
            return new PolygonZ(new ByteBufferKaitaiStream(fileName));
        }
        public PolygonZ() {
            this(null, null, null);
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
        }
        public void _read() {
            this.boundingBox = new BoundingBoxXY(this._io, this, _root);
            this.boundingBox._read();
            this.numberOfParts = this._io.readS4le();
            this.numberOfPoints = this._io.readS4le();
            this.parts = new ArrayList<Integer>();
            for (int i = 0; i < numberOfParts(); i++) {
                this.parts.add(this._io.readS4le());
            }
            this.points = new ArrayList<Point>();
            for (int i = 0; i < numberOfPoints(); i++) {
                Point _t_points = new Point(this._io, this, _root);
                try {
                    _t_points._read();
                } finally {
                    this.points.add(_t_points);
                }
            }
            this.zRange = new BoundsMinMax(this._io, this, _root);
            this.zRange._read();
            this.zValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.zValues.add(this._io.readF8le());
            }
            this.mRange = new BoundsMinMax(this._io, this, _root);
            this.mRange._read();
            this.mValues = new ArrayList<Double>();
            for (int i = 0; i < numberOfPoints(); i++) {
                this.mValues.add(this._io.readF8le());
            }
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            this.boundingBox._write_Seq(this._io);
            this._io.writeS4le(this.numberOfParts);
            this._io.writeS4le(this.numberOfPoints);
            for (int i = 0; i < this.parts.size(); i++) {
                this._io.writeS4le(this.parts.get(((Number) (i)).intValue()));
            }
            for (int i = 0; i < this.points.size(); i++) {
                this.points.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this.zRange._write_Seq(this._io);
            for (int i = 0; i < this.zValues.size(); i++) {
                this._io.writeF8le(this.zValues.get(((Number) (i)).intValue()));
            }
            this.mRange._write_Seq(this._io);
            for (int i = 0; i < this.mValues.size(); i++) {
                this._io.writeF8le(this.mValues.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (!Objects.equals(this.boundingBox._root(), _root()))
                throw new ConsistencyError("bounding_box", _root(), this.boundingBox._root());
            if (!Objects.equals(this.boundingBox._parent(), this))
                throw new ConsistencyError("bounding_box", this, this.boundingBox._parent());
            if (this.parts.size() != numberOfParts())
                throw new ConsistencyError("parts", numberOfParts(), this.parts.size());
            for (int i = 0; i < this.parts.size(); i++) {
            }
            if (this.points.size() != numberOfPoints())
                throw new ConsistencyError("points", numberOfPoints(), this.points.size());
            for (int i = 0; i < this.points.size(); i++) {
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("points", _root(), this.points.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.points.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("points", this, this.points.get(((Number) (i)).intValue())._parent());
            }
            if (!Objects.equals(this.zRange._root(), _root()))
                throw new ConsistencyError("z_range", _root(), this.zRange._root());
            if (!Objects.equals(this.zRange._parent(), this))
                throw new ConsistencyError("z_range", this, this.zRange._parent());
            if (this.zValues.size() != numberOfPoints())
                throw new ConsistencyError("z_values", numberOfPoints(), this.zValues.size());
            for (int i = 0; i < this.zValues.size(); i++) {
            }
            if (!Objects.equals(this.mRange._root(), _root()))
                throw new ConsistencyError("m_range", _root(), this.mRange._root());
            if (!Objects.equals(this.mRange._parent(), this))
                throw new ConsistencyError("m_range", this, this.mRange._parent());
            if (this.mValues.size() != numberOfPoints())
                throw new ConsistencyError("m_values", numberOfPoints(), this.mValues.size());
            for (int i = 0; i < this.mValues.size(); i++) {
            }
            _dirty = false;
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
        public void setBoundingBox(BoundingBoxXY _v) { _dirty = true; boundingBox = _v; }
        public int numberOfParts() { return numberOfParts; }
        public void setNumberOfParts(int _v) { _dirty = true; numberOfParts = _v; }
        public int numberOfPoints() { return numberOfPoints; }
        public void setNumberOfPoints(int _v) { _dirty = true; numberOfPoints = _v; }
        public List<Integer> parts() { return parts; }
        public void setParts(List<Integer> _v) { _dirty = true; parts = _v; }
        public List<Point> points() { return points; }
        public void setPoints(List<Point> _v) { _dirty = true; points = _v; }
        public BoundsMinMax zRange() { return zRange; }
        public void setZRange(BoundsMinMax _v) { _dirty = true; zRange = _v; }
        public List<Double> zValues() { return zValues; }
        public void setZValues(List<Double> _v) { _dirty = true; zValues = _v; }
        public BoundsMinMax mRange() { return mRange; }
        public void setMRange(BoundsMinMax _v) { _dirty = true; mRange = _v; }
        public List<Double> mValues() { return mValues; }
        public void setMValues(List<Double> _v) { _dirty = true; mValues = _v; }
        public ShapefileMain _root() { return _root; }
        public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
        public ShapefileMain.RecordContents _parent() { return _parent; }
        public void set_parent(ShapefileMain.RecordContents _v) { _dirty = true; _parent = _v; }
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

        public Record(KaitaiStream _io, ShapefileMain _parent) {
            this(_io, _parent, null);
        }

        public Record(KaitaiStream _io, ShapefileMain _parent, ShapefileMain _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.header = new RecordHeader(this._io, this, _root);
            this.header._read();
            this.contents = new RecordContents(this._io, this, _root);
            this.contents._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            this.contents._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.header._write_Seq(this._io);
            this.contents._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.header._root(), _root()))
                throw new ConsistencyError("header", _root(), this.header._root());
            if (!Objects.equals(this.header._parent(), this))
                throw new ConsistencyError("header", this, this.header._parent());
            if (!Objects.equals(this.contents._root(), _root()))
                throw new ConsistencyError("contents", _root(), this.contents._root());
            if (!Objects.equals(this.contents._parent(), this))
                throw new ConsistencyError("contents", this, this.contents._parent());
            _dirty = false;
        }
        private RecordHeader header;
        private RecordContents contents;
        private ShapefileMain _root;
        private ShapefileMain _parent;
        public RecordHeader header() { return header; }
        public void setHeader(RecordHeader _v) { _dirty = true; header = _v; }

        /**
         * the size of this contents section in bytes must equal header.content_length * 2
         */
        public RecordContents contents() { return contents; }
        public void setContents(RecordContents _v) { _dirty = true; contents = _v; }
        public ShapefileMain _root() { return _root; }
        public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
        public ShapefileMain _parent() { return _parent; }
        public void set_parent(ShapefileMain _v) { _dirty = true; _parent = _v; }
    }
    public static class RecordContents extends KaitaiStruct.ReadWrite {
        public static RecordContents fromFile(String fileName) throws IOException {
            return new RecordContents(new ByteBufferKaitaiStream(fileName));
        }
        public RecordContents() {
            this(null, null, null);
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
        }
        public void _read() {
            this.shapeType = ShapefileMain.ShapeType.byId(this._io.readS4le());
            if (shapeType() != ShapefileMain.ShapeType.NULL_SHAPE) {
                {
                    ShapeType on = shapeType();
                    if (on != null) {
                        switch (shapeType()) {
                        case MULTI_PATCH: {
                            this.shapeParameters = new MultiPatch(this._io, this, _root);
                            ((MultiPatch) (this.shapeParameters))._read();
                            break;
                        }
                        case MULTI_POINT: {
                            this.shapeParameters = new MultiPoint(this._io, this, _root);
                            ((MultiPoint) (this.shapeParameters))._read();
                            break;
                        }
                        case MULTI_POINT_M: {
                            this.shapeParameters = new MultiPointM(this._io, this, _root);
                            ((MultiPointM) (this.shapeParameters))._read();
                            break;
                        }
                        case MULTI_POINT_Z: {
                            this.shapeParameters = new MultiPointZ(this._io, this, _root);
                            ((MultiPointZ) (this.shapeParameters))._read();
                            break;
                        }
                        case POINT: {
                            this.shapeParameters = new Point(this._io, this, _root);
                            ((Point) (this.shapeParameters))._read();
                            break;
                        }
                        case POINT_M: {
                            this.shapeParameters = new PointM(this._io, this, _root);
                            ((PointM) (this.shapeParameters))._read();
                            break;
                        }
                        case POINT_Z: {
                            this.shapeParameters = new PointZ(this._io, this, _root);
                            ((PointZ) (this.shapeParameters))._read();
                            break;
                        }
                        case POLY_LINE: {
                            this.shapeParameters = new PolyLine(this._io, this, _root);
                            ((PolyLine) (this.shapeParameters))._read();
                            break;
                        }
                        case POLY_LINE_M: {
                            this.shapeParameters = new PolyLineM(this._io, this, _root);
                            ((PolyLineM) (this.shapeParameters))._read();
                            break;
                        }
                        case POLY_LINE_Z: {
                            this.shapeParameters = new PolyLineZ(this._io, this, _root);
                            ((PolyLineZ) (this.shapeParameters))._read();
                            break;
                        }
                        case POLYGON: {
                            this.shapeParameters = new Polygon(this._io, this, _root);
                            ((Polygon) (this.shapeParameters))._read();
                            break;
                        }
                        case POLYGON_M: {
                            this.shapeParameters = new PolygonM(this._io, this, _root);
                            ((PolygonM) (this.shapeParameters))._read();
                            break;
                        }
                        case POLYGON_Z: {
                            this.shapeParameters = new PolygonZ(this._io, this, _root);
                            ((PolygonZ) (this.shapeParameters))._read();
                            break;
                        }
                        }
                    }
                }
            }
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS4le(((Number) (this.shapeType.id())).intValue());
            if (shapeType() != ShapefileMain.ShapeType.NULL_SHAPE) {
                {
                    ShapeType on = shapeType();
                    if (on != null) {
                        switch (shapeType()) {
                        case MULTI_PATCH: {
                            ((MultiPatch) (this.shapeParameters))._write_Seq(this._io);
                            break;
                        }
                        case MULTI_POINT: {
                            ((MultiPoint) (this.shapeParameters))._write_Seq(this._io);
                            break;
                        }
                        case MULTI_POINT_M: {
                            ((MultiPointM) (this.shapeParameters))._write_Seq(this._io);
                            break;
                        }
                        case MULTI_POINT_Z: {
                            ((MultiPointZ) (this.shapeParameters))._write_Seq(this._io);
                            break;
                        }
                        case POINT: {
                            ((Point) (this.shapeParameters))._write_Seq(this._io);
                            break;
                        }
                        case POINT_M: {
                            ((PointM) (this.shapeParameters))._write_Seq(this._io);
                            break;
                        }
                        case POINT_Z: {
                            ((PointZ) (this.shapeParameters))._write_Seq(this._io);
                            break;
                        }
                        case POLY_LINE: {
                            ((PolyLine) (this.shapeParameters))._write_Seq(this._io);
                            break;
                        }
                        case POLY_LINE_M: {
                            ((PolyLineM) (this.shapeParameters))._write_Seq(this._io);
                            break;
                        }
                        case POLY_LINE_Z: {
                            ((PolyLineZ) (this.shapeParameters))._write_Seq(this._io);
                            break;
                        }
                        case POLYGON: {
                            ((Polygon) (this.shapeParameters))._write_Seq(this._io);
                            break;
                        }
                        case POLYGON_M: {
                            ((PolygonM) (this.shapeParameters))._write_Seq(this._io);
                            break;
                        }
                        case POLYGON_Z: {
                            ((PolygonZ) (this.shapeParameters))._write_Seq(this._io);
                            break;
                        }
                        }
                    }
                }
            }
        }

        public void _check() {
            if (shapeType() != ShapefileMain.ShapeType.NULL_SHAPE) {
                {
                    ShapeType on = shapeType();
                    if (on != null) {
                        switch (shapeType()) {
                        case MULTI_PATCH: {
                            if (!Objects.equals(((ShapefileMain.MultiPatch) (this.shapeParameters))._root(), _root()))
                                throw new ConsistencyError("shape_parameters", _root(), ((ShapefileMain.MultiPatch) (this.shapeParameters))._root());
                            if (!Objects.equals(((ShapefileMain.MultiPatch) (this.shapeParameters))._parent(), this))
                                throw new ConsistencyError("shape_parameters", this, ((ShapefileMain.MultiPatch) (this.shapeParameters))._parent());
                            break;
                        }
                        case MULTI_POINT: {
                            if (!Objects.equals(((ShapefileMain.MultiPoint) (this.shapeParameters))._root(), _root()))
                                throw new ConsistencyError("shape_parameters", _root(), ((ShapefileMain.MultiPoint) (this.shapeParameters))._root());
                            if (!Objects.equals(((ShapefileMain.MultiPoint) (this.shapeParameters))._parent(), this))
                                throw new ConsistencyError("shape_parameters", this, ((ShapefileMain.MultiPoint) (this.shapeParameters))._parent());
                            break;
                        }
                        case MULTI_POINT_M: {
                            if (!Objects.equals(((ShapefileMain.MultiPointM) (this.shapeParameters))._root(), _root()))
                                throw new ConsistencyError("shape_parameters", _root(), ((ShapefileMain.MultiPointM) (this.shapeParameters))._root());
                            if (!Objects.equals(((ShapefileMain.MultiPointM) (this.shapeParameters))._parent(), this))
                                throw new ConsistencyError("shape_parameters", this, ((ShapefileMain.MultiPointM) (this.shapeParameters))._parent());
                            break;
                        }
                        case MULTI_POINT_Z: {
                            if (!Objects.equals(((ShapefileMain.MultiPointZ) (this.shapeParameters))._root(), _root()))
                                throw new ConsistencyError("shape_parameters", _root(), ((ShapefileMain.MultiPointZ) (this.shapeParameters))._root());
                            if (!Objects.equals(((ShapefileMain.MultiPointZ) (this.shapeParameters))._parent(), this))
                                throw new ConsistencyError("shape_parameters", this, ((ShapefileMain.MultiPointZ) (this.shapeParameters))._parent());
                            break;
                        }
                        case POINT: {
                            if (!Objects.equals(((ShapefileMain.Point) (this.shapeParameters))._root(), _root()))
                                throw new ConsistencyError("shape_parameters", _root(), ((ShapefileMain.Point) (this.shapeParameters))._root());
                            if (!Objects.equals(((ShapefileMain.Point) (this.shapeParameters))._parent(), this))
                                throw new ConsistencyError("shape_parameters", this, ((ShapefileMain.Point) (this.shapeParameters))._parent());
                            break;
                        }
                        case POINT_M: {
                            if (!Objects.equals(((ShapefileMain.PointM) (this.shapeParameters))._root(), _root()))
                                throw new ConsistencyError("shape_parameters", _root(), ((ShapefileMain.PointM) (this.shapeParameters))._root());
                            if (!Objects.equals(((ShapefileMain.PointM) (this.shapeParameters))._parent(), this))
                                throw new ConsistencyError("shape_parameters", this, ((ShapefileMain.PointM) (this.shapeParameters))._parent());
                            break;
                        }
                        case POINT_Z: {
                            if (!Objects.equals(((ShapefileMain.PointZ) (this.shapeParameters))._root(), _root()))
                                throw new ConsistencyError("shape_parameters", _root(), ((ShapefileMain.PointZ) (this.shapeParameters))._root());
                            if (!Objects.equals(((ShapefileMain.PointZ) (this.shapeParameters))._parent(), this))
                                throw new ConsistencyError("shape_parameters", this, ((ShapefileMain.PointZ) (this.shapeParameters))._parent());
                            break;
                        }
                        case POLY_LINE: {
                            if (!Objects.equals(((ShapefileMain.PolyLine) (this.shapeParameters))._root(), _root()))
                                throw new ConsistencyError("shape_parameters", _root(), ((ShapefileMain.PolyLine) (this.shapeParameters))._root());
                            if (!Objects.equals(((ShapefileMain.PolyLine) (this.shapeParameters))._parent(), this))
                                throw new ConsistencyError("shape_parameters", this, ((ShapefileMain.PolyLine) (this.shapeParameters))._parent());
                            break;
                        }
                        case POLY_LINE_M: {
                            if (!Objects.equals(((ShapefileMain.PolyLineM) (this.shapeParameters))._root(), _root()))
                                throw new ConsistencyError("shape_parameters", _root(), ((ShapefileMain.PolyLineM) (this.shapeParameters))._root());
                            if (!Objects.equals(((ShapefileMain.PolyLineM) (this.shapeParameters))._parent(), this))
                                throw new ConsistencyError("shape_parameters", this, ((ShapefileMain.PolyLineM) (this.shapeParameters))._parent());
                            break;
                        }
                        case POLY_LINE_Z: {
                            if (!Objects.equals(((ShapefileMain.PolyLineZ) (this.shapeParameters))._root(), _root()))
                                throw new ConsistencyError("shape_parameters", _root(), ((ShapefileMain.PolyLineZ) (this.shapeParameters))._root());
                            if (!Objects.equals(((ShapefileMain.PolyLineZ) (this.shapeParameters))._parent(), this))
                                throw new ConsistencyError("shape_parameters", this, ((ShapefileMain.PolyLineZ) (this.shapeParameters))._parent());
                            break;
                        }
                        case POLYGON: {
                            if (!Objects.equals(((ShapefileMain.Polygon) (this.shapeParameters))._root(), _root()))
                                throw new ConsistencyError("shape_parameters", _root(), ((ShapefileMain.Polygon) (this.shapeParameters))._root());
                            if (!Objects.equals(((ShapefileMain.Polygon) (this.shapeParameters))._parent(), this))
                                throw new ConsistencyError("shape_parameters", this, ((ShapefileMain.Polygon) (this.shapeParameters))._parent());
                            break;
                        }
                        case POLYGON_M: {
                            if (!Objects.equals(((ShapefileMain.PolygonM) (this.shapeParameters))._root(), _root()))
                                throw new ConsistencyError("shape_parameters", _root(), ((ShapefileMain.PolygonM) (this.shapeParameters))._root());
                            if (!Objects.equals(((ShapefileMain.PolygonM) (this.shapeParameters))._parent(), this))
                                throw new ConsistencyError("shape_parameters", this, ((ShapefileMain.PolygonM) (this.shapeParameters))._parent());
                            break;
                        }
                        case POLYGON_Z: {
                            if (!Objects.equals(((ShapefileMain.PolygonZ) (this.shapeParameters))._root(), _root()))
                                throw new ConsistencyError("shape_parameters", _root(), ((ShapefileMain.PolygonZ) (this.shapeParameters))._root());
                            if (!Objects.equals(((ShapefileMain.PolygonZ) (this.shapeParameters))._parent(), this))
                                throw new ConsistencyError("shape_parameters", this, ((ShapefileMain.PolygonZ) (this.shapeParameters))._parent());
                            break;
                        }
                        }
                    }
                }
            }
            _dirty = false;
        }
        private ShapeType shapeType;
        private KaitaiStruct.ReadWrite shapeParameters;
        private ShapefileMain _root;
        private ShapefileMain.Record _parent;
        public ShapeType shapeType() { return shapeType; }
        public void setShapeType(ShapeType _v) { _dirty = true; shapeType = _v; }
        public KaitaiStruct.ReadWrite shapeParameters() { return shapeParameters; }
        public void setShapeParameters(KaitaiStruct.ReadWrite _v) { _dirty = true; shapeParameters = _v; }
        public ShapefileMain _root() { return _root; }
        public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
        public ShapefileMain.Record _parent() { return _parent; }
        public void set_parent(ShapefileMain.Record _v) { _dirty = true; _parent = _v; }
    }
    public static class RecordHeader extends KaitaiStruct.ReadWrite {
        public static RecordHeader fromFile(String fileName) throws IOException {
            return new RecordHeader(new ByteBufferKaitaiStream(fileName));
        }
        public RecordHeader() {
            this(null, null, null);
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
        }
        public void _read() {
            this.recordNumber = this._io.readS4be();
            this.contentLength = this._io.readS4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS4be(this.recordNumber);
            this._io.writeS4be(this.contentLength);
        }

        public void _check() {
            _dirty = false;
        }
        private int recordNumber;
        private int contentLength;
        private ShapefileMain _root;
        private ShapefileMain.Record _parent;
        public int recordNumber() { return recordNumber; }
        public void setRecordNumber(int _v) { _dirty = true; recordNumber = _v; }
        public int contentLength() { return contentLength; }
        public void setContentLength(int _v) { _dirty = true; contentLength = _v; }
        public ShapefileMain _root() { return _root; }
        public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
        public ShapefileMain.Record _parent() { return _parent; }
        public void set_parent(ShapefileMain.Record _v) { _dirty = true; _parent = _v; }
    }
    private FileHeader header;
    private List<Record> records;
    private ShapefileMain _root;
    private KaitaiStruct.ReadWrite _parent;
    public FileHeader header() { return header; }
    public void setHeader(FileHeader _v) { _dirty = true; header = _v; }

    /**
     * the size of this section of the file in bytes must equal (header.file_length * 2) - 100
     */
    public List<Record> records() { return records; }
    public void setRecords(List<Record> _v) { _dirty = true; records = _v; }
    public ShapefileMain _root() { return _root; }
    public void set_root(ShapefileMain _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
