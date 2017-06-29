// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;

public class Stl extends KaitaiStruct {
    public static Stl fromFile(String fileName) throws IOException {
        return new Stl(new KaitaiStream(fileName));
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
        triangles = new ArrayList<Triangle>((int) (numTriangles()));
        for (int i = 0; i < numTriangles(); i++) {
            this.triangles.add(new Triangle(this._io, this, _root));
        }
    }
    public static class Triangle extends KaitaiStruct {
        public static Triangle fromFile(String fileName) throws IOException {
            return new Triangle(new KaitaiStream(fileName));
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
            vertices = new ArrayList<Vec3d>((int) (3));
            for (int i = 0; i < 3; i++) {
                this.vertices.add(new Vec3d(this._io, this, _root));
            }
        }
        private Vec3d normal;
        private ArrayList<Vec3d> vertices;
        private Stl _root;
        private Stl _parent;
        public Vec3d normal() { return normal; }
        public ArrayList<Vec3d> vertices() { return vertices; }
        public Stl _root() { return _root; }
        public Stl _parent() { return _parent; }
    }
    public static class Vec3d extends KaitaiStruct {
        public static Vec3d fromFile(String fileName) throws IOException {
            return new Vec3d(new KaitaiStream(fileName));
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
