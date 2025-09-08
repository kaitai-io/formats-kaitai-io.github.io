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

public class ShapefileIndex extends KaitaiStruct {
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

    public ShapefileIndex(KaitaiStream _io) {
        this(_io, null, null);
    }

    public ShapefileIndex(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public ShapefileIndex(KaitaiStream _io, KaitaiStruct _parent, ShapefileIndex _root) {
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
    public static class BoundingBoxXYZM extends KaitaiStruct {
        public static BoundingBoxXYZM fromFile(String fileName) throws IOException {
            return new BoundingBoxXYZM(new ByteBufferKaitaiStream(fileName));
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
        private ShapefileIndex _root;
        private ShapefileIndex.FileHeader _parent;
        public BoundsMinMax x() { return x; }
        public BoundsMinMax y() { return y; }
        public BoundsMinMax z() { return z; }
        public BoundsMinMax m() { return m; }
        public ShapefileIndex _root() { return _root; }
        public ShapefileIndex.FileHeader _parent() { return _parent; }
    }
    public static class BoundsMinMax extends KaitaiStruct {
        public static BoundsMinMax fromFile(String fileName) throws IOException {
            return new BoundsMinMax(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.min = this._io.readF8be();
            this.max = this._io.readF8be();
        }

        public void _fetchInstances() {
        }
        private double min;
        private double max;
        private ShapefileIndex _root;
        private ShapefileIndex.BoundingBoxXYZM _parent;
        public double min() { return min; }
        public double max() { return max; }
        public ShapefileIndex _root() { return _root; }
        public ShapefileIndex.BoundingBoxXYZM _parent() { return _parent; }
    }
    public static class FileHeader extends KaitaiStruct {
        public static FileHeader fromFile(String fileName) throws IOException {
            return new FileHeader(new ByteBufferKaitaiStream(fileName));
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
            this.shapeType = ShapefileIndex.ShapeType.byId(this._io.readS4le());
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
        private ShapefileIndex _root;
        private ShapefileIndex _parent;

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
        public ShapefileIndex _root() { return _root; }
        public ShapefileIndex _parent() { return _parent; }
    }
    public static class Record extends KaitaiStruct {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.offset = this._io.readS4be();
            this.contentLength = this._io.readS4be();
        }

        public void _fetchInstances() {
        }
        private int offset;
        private int contentLength;
        private ShapefileIndex _root;
        private ShapefileIndex _parent;
        public int offset() { return offset; }
        public int contentLength() { return contentLength; }
        public ShapefileIndex _root() { return _root; }
        public ShapefileIndex _parent() { return _parent; }
    }
    private FileHeader header;
    private List<Record> records;
    private ShapefileIndex _root;
    private KaitaiStruct _parent;
    public FileHeader header() { return header; }

    /**
     * the size of this section of the file in bytes must equal (header.file_length * 2) - 100
     */
    public List<Record> records() { return records; }
    public ShapefileIndex _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
