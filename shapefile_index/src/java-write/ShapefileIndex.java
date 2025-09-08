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

public class ShapefileIndex extends KaitaiStruct.ReadWrite {
    public static ShapefileIndex fromFile(String fileName) throws IOException {
        return new ShapefileIndex(new ByteBufferKaitaiStream(fileName));
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
    public ShapefileIndex() {
        this(null, null, null);
    }

    public ShapefileIndex(KaitaiStream _io) {
        this(_io, null, null);
    }

    public ShapefileIndex(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public ShapefileIndex(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, ShapefileIndex _root) {
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

        public BoundingBoxXYZM(KaitaiStream _io, ShapefileIndex.FileHeader _parent) {
            this(_io, _parent, null);
        }

        public BoundingBoxXYZM(KaitaiStream _io, ShapefileIndex.FileHeader _parent, ShapefileIndex _root) {
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
        private ShapefileIndex _root;
        private ShapefileIndex.FileHeader _parent;
        public BoundsMinMax x() { return x; }
        public void setX(BoundsMinMax _v) { _dirty = true; x = _v; }
        public BoundsMinMax y() { return y; }
        public void setY(BoundsMinMax _v) { _dirty = true; y = _v; }
        public BoundsMinMax z() { return z; }
        public void setZ(BoundsMinMax _v) { _dirty = true; z = _v; }
        public BoundsMinMax m() { return m; }
        public void setM(BoundsMinMax _v) { _dirty = true; m = _v; }
        public ShapefileIndex _root() { return _root; }
        public void set_root(ShapefileIndex _v) { _dirty = true; _root = _v; }
        public ShapefileIndex.FileHeader _parent() { return _parent; }
        public void set_parent(ShapefileIndex.FileHeader _v) { _dirty = true; _parent = _v; }
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

        public BoundsMinMax(KaitaiStream _io, ShapefileIndex.BoundingBoxXYZM _parent) {
            this(_io, _parent, null);
        }

        public BoundsMinMax(KaitaiStream _io, ShapefileIndex.BoundingBoxXYZM _parent, ShapefileIndex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.min = this._io.readF8be();
            this.max = this._io.readF8be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeF8be(this.min);
            this._io.writeF8be(this.max);
        }

        public void _check() {
            _dirty = false;
        }
        private double min;
        private double max;
        private ShapefileIndex _root;
        private ShapefileIndex.BoundingBoxXYZM _parent;
        public double min() { return min; }
        public void setMin(double _v) { _dirty = true; min = _v; }
        public double max() { return max; }
        public void setMax(double _v) { _dirty = true; max = _v; }
        public ShapefileIndex _root() { return _root; }
        public void set_root(ShapefileIndex _v) { _dirty = true; _root = _v; }
        public ShapefileIndex.BoundingBoxXYZM _parent() { return _parent; }
        public void set_parent(ShapefileIndex.BoundingBoxXYZM _v) { _dirty = true; _parent = _v; }
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

        public FileHeader(KaitaiStream _io, ShapefileIndex _parent) {
            this(_io, _parent, null);
        }

        public FileHeader(KaitaiStream _io, ShapefileIndex _parent, ShapefileIndex _root) {
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
            this.shapeType = ShapefileIndex.ShapeType.byId(this._io.readS4le());
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
        private ShapefileIndex _root;
        private ShapefileIndex _parent;

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
        public ShapefileIndex _root() { return _root; }
        public void set_root(ShapefileIndex _v) { _dirty = true; _root = _v; }
        public ShapefileIndex _parent() { return _parent; }
        public void set_parent(ShapefileIndex _v) { _dirty = true; _parent = _v; }
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

        public Record(KaitaiStream _io, ShapefileIndex _parent) {
            this(_io, _parent, null);
        }

        public Record(KaitaiStream _io, ShapefileIndex _parent, ShapefileIndex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.offset = this._io.readS4be();
            this.contentLength = this._io.readS4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS4be(this.offset);
            this._io.writeS4be(this.contentLength);
        }

        public void _check() {
            _dirty = false;
        }
        private int offset;
        private int contentLength;
        private ShapefileIndex _root;
        private ShapefileIndex _parent;
        public int offset() { return offset; }
        public void setOffset(int _v) { _dirty = true; offset = _v; }
        public int contentLength() { return contentLength; }
        public void setContentLength(int _v) { _dirty = true; contentLength = _v; }
        public ShapefileIndex _root() { return _root; }
        public void set_root(ShapefileIndex _v) { _dirty = true; _root = _v; }
        public ShapefileIndex _parent() { return _parent; }
        public void set_parent(ShapefileIndex _v) { _dirty = true; _parent = _v; }
    }
    private FileHeader header;
    private List<Record> records;
    private ShapefileIndex _root;
    private KaitaiStruct.ReadWrite _parent;
    public FileHeader header() { return header; }
    public void setHeader(FileHeader _v) { _dirty = true; header = _v; }

    /**
     * the size of this section of the file in bytes must equal (header.file_length * 2) - 100
     */
    public List<Record> records() { return records; }
    public void setRecords(List<Record> _v) { _dirty = true; records = _v; }
    public ShapefileIndex _root() { return _root; }
    public void set_root(ShapefileIndex _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
