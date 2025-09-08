// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;


/**
 * STL files are used to represent simple 3D models, defined using
 * triangular 3D faces.
 * 
 * Initially it was introduced as native format for 3D Systems
 * Stereolithography CAD system, but due to its extreme simplicity, it
 * was adopted by a wide range of 3D modelling, CAD, rapid prototyping
 * and 3D printing applications as the simplest 3D model exchange
 * format.
 * 
 * STL is extremely bare-bones format: there are no complex headers, no
 * texture / color support, no units specifications, no distinct vertex
 * arrays. Whole model is specified as a collection of triangular
 * faces.
 * 
 * There are two versions of the format (text and binary), this spec
 * describes binary version.
 */
public class Stl extends KaitaiStruct.ReadWrite {
    public static Stl fromFile(String fileName) throws IOException {
        return new Stl(new ByteBufferKaitaiStream(fileName));
    }
    public Stl() {
        this(null, null, null);
    }

    public Stl(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Stl(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Stl(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Stl _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = this._io.readBytes(80);
        this.numTriangles = this._io.readU4le();
        this.triangles = new ArrayList<Triangle>();
        for (int i = 0; i < numTriangles(); i++) {
            Triangle _t_triangles = new Triangle(this._io, this, _root);
            try {
                _t_triangles._read();
            } finally {
                this.triangles.add(_t_triangles);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.triangles.size(); i++) {
            this.triangles.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.header);
        this._io.writeU4le(this.numTriangles);
        for (int i = 0; i < this.triangles.size(); i++) {
            this.triangles.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.header.length != 80)
            throw new ConsistencyError("header", 80, this.header.length);
        if (this.triangles.size() != numTriangles())
            throw new ConsistencyError("triangles", numTriangles(), this.triangles.size());
        for (int i = 0; i < this.triangles.size(); i++) {
            if (!Objects.equals(this.triangles.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("triangles", _root(), this.triangles.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.triangles.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("triangles", this, this.triangles.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }

    /**
     * Each STL triangle is defined by its 3 points in 3D space and a
     * normal vector, which is generally used to determine where is
     * "inside" and "outside" of the model.
     */
    public static class Triangle extends KaitaiStruct.ReadWrite {
        public static Triangle fromFile(String fileName) throws IOException {
            return new Triangle(new ByteBufferKaitaiStream(fileName));
        }
        public Triangle() {
            this(null, null, null);
        }

        public Triangle(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Triangle(KaitaiStream _io, Stl _parent) {
            this(_io, _parent, null);
        }

        public Triangle(KaitaiStream _io, Stl _parent, Stl _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.normal = new Vec3d(this._io, this, _root);
            this.normal._read();
            this.vertices = new ArrayList<Vec3d>();
            for (int i = 0; i < 3; i++) {
                Vec3d _t_vertices = new Vec3d(this._io, this, _root);
                try {
                    _t_vertices._read();
                } finally {
                    this.vertices.add(_t_vertices);
                }
            }
            this.abr = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.normal._fetchInstances();
            for (int i = 0; i < this.vertices.size(); i++) {
                this.vertices.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.normal._write_Seq(this._io);
            for (int i = 0; i < this.vertices.size(); i++) {
                this.vertices.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this._io.writeU2le(this.abr);
        }

        public void _check() {
            if (!Objects.equals(this.normal._root(), _root()))
                throw new ConsistencyError("normal", _root(), this.normal._root());
            if (!Objects.equals(this.normal._parent(), this))
                throw new ConsistencyError("normal", this, this.normal._parent());
            if (this.vertices.size() != 3)
                throw new ConsistencyError("vertices", 3, this.vertices.size());
            for (int i = 0; i < this.vertices.size(); i++) {
                if (!Objects.equals(this.vertices.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("vertices", _root(), this.vertices.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.vertices.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("vertices", this, this.vertices.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private Vec3d normal;
        private List<Vec3d> vertices;
        private int abr;
        private Stl _root;
        private Stl _parent;
        public Vec3d normal() { return normal; }
        public void setNormal(Vec3d _v) { _dirty = true; normal = _v; }
        public List<Vec3d> vertices() { return vertices; }
        public void setVertices(List<Vec3d> _v) { _dirty = true; vertices = _v; }

        /**
         * In theory (per standard), it's "attribute byte count" with
         * no other details given on what "attribute" is and what
         * should be stored in this field.
         * 
         * In practice, software dealing with STL either expected to
         * see 0 here, or uses this 16-bit field per se to store
         * additional attributes (such as RGB color of a vertex or
         * color index).
         */
        public int abr() { return abr; }
        public void setAbr(int _v) { _dirty = true; abr = _v; }
        public Stl _root() { return _root; }
        public void set_root(Stl _v) { _dirty = true; _root = _v; }
        public Stl _parent() { return _parent; }
        public void set_parent(Stl _v) { _dirty = true; _parent = _v; }
    }
    public static class Vec3d extends KaitaiStruct.ReadWrite {
        public static Vec3d fromFile(String fileName) throws IOException {
            return new Vec3d(new ByteBufferKaitaiStream(fileName));
        }
        public Vec3d() {
            this(null, null, null);
        }

        public Vec3d(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Vec3d(KaitaiStream _io, Stl.Triangle _parent) {
            this(_io, _parent, null);
        }

        public Vec3d(KaitaiStream _io, Stl.Triangle _parent, Stl _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.x = this._io.readF4le();
            this.y = this._io.readF4le();
            this.z = this._io.readF4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeF4le(this.x);
            this._io.writeF4le(this.y);
            this._io.writeF4le(this.z);
        }

        public void _check() {
            _dirty = false;
        }
        private float x;
        private float y;
        private float z;
        private Stl _root;
        private Stl.Triangle _parent;
        public float x() { return x; }
        public void setX(float _v) { _dirty = true; x = _v; }
        public float y() { return y; }
        public void setY(float _v) { _dirty = true; y = _v; }
        public float z() { return z; }
        public void setZ(float _v) { _dirty = true; z = _v; }
        public Stl _root() { return _root; }
        public void set_root(Stl _v) { _dirty = true; _root = _v; }
        public Stl.Triangle _parent() { return _parent; }
        public void set_parent(Stl.Triangle _v) { _dirty = true; _parent = _v; }
    }
    private byte[] header;
    private long numTriangles;
    private List<Triangle> triangles;
    private Stl _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] header() { return header; }
    public void setHeader(byte[] _v) { _dirty = true; header = _v; }
    public long numTriangles() { return numTriangles; }
    public void setNumTriangles(long _v) { _dirty = true; numTriangles = _v; }
    public List<Triangle> triangles() { return triangles; }
    public void setTriangles(List<Triangle> _v) { _dirty = true; triangles = _v; }
    public Stl _root() { return _root; }
    public void set_root(Stl _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
