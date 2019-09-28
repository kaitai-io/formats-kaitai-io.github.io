// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;


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
public class Stl extends KaitaiStruct {
    public static Stl fromFile(String fileName) throws IOException {
        return new Stl(new ByteBufferKaitaiStream(fileName));
    }

    public Stl(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Stl(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Stl(KaitaiStream _io, KaitaiStruct _parent, Stl _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = this._io.readBytes(80);
        this.numTriangles = this._io.readU4le();
        triangles = new ArrayList<Triangle>(((Number) (numTriangles())).intValue());
        for (int i = 0; i < numTriangles(); i++) {
            this.triangles.add(new Triangle(this._io, this, _root));
        }
    }

    /**
     * Each STL triangle is defined by its 3 points in 3D space and a
     * normal vector, which is generally used to determine where is
     * "inside" and "outside" of the model.
     */
    public static class Triangle extends KaitaiStruct {
        public static Triangle fromFile(String fileName) throws IOException {
            return new Triangle(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.normal = new Vec3d(this._io, this, _root);
            vertices = new ArrayList<Vec3d>(((Number) (3)).intValue());
            for (int i = 0; i < 3; i++) {
                this.vertices.add(new Vec3d(this._io, this, _root));
            }
            this.abr = this._io.readU2le();
        }
        private Vec3d normal;
        private ArrayList<Vec3d> vertices;
        private int abr;
        private Stl _root;
        private Stl _parent;
        public Vec3d normal() { return normal; }
        public ArrayList<Vec3d> vertices() { return vertices; }

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
        public Stl _root() { return _root; }
        public Stl _parent() { return _parent; }
    }
    public static class Vec3d extends KaitaiStruct {
        public static Vec3d fromFile(String fileName) throws IOException {
            return new Vec3d(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.x = this._io.readF4le();
            this.y = this._io.readF4le();
            this.z = this._io.readF4le();
        }
        private float x;
        private float y;
        private float z;
        private Stl _root;
        private Stl.Triangle _parent;
        public float x() { return x; }
        public float y() { return y; }
        public float z() { return z; }
        public Stl _root() { return _root; }
        public Stl.Triangle _parent() { return _parent; }
    }
    private byte[] header;
    private long numTriangles;
    private ArrayList<Triangle> triangles;
    private Stl _root;
    private KaitaiStruct _parent;
    public byte[] header() { return header; }
    public long numTriangles() { return numTriangles; }
    public ArrayList<Triangle> triangles() { return triangles; }
    public Stl _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
