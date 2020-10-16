// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.nio.charset.Charset;

public class QuakeMdl extends KaitaiStruct {
    public static QuakeMdl fromFile(String fileName) throws IOException {
        return new QuakeMdl(new ByteBufferKaitaiStream(fileName));
    }

    public QuakeMdl(KaitaiStream _io) {
        this(_io, null, null);
    }

    public QuakeMdl(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public QuakeMdl(KaitaiStream _io, KaitaiStruct _parent, QuakeMdl _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new MdlHeader(this._io, this, _root);
        skins = new ArrayList<MdlSkin>(((Number) (header().numSkins())).intValue());
        for (int i = 0; i < header().numSkins(); i++) {
            this.skins.add(new MdlSkin(this._io, this, _root));
        }
        textureCoordinates = new ArrayList<MdlTexcoord>(((Number) (header().numVerts())).intValue());
        for (int i = 0; i < header().numVerts(); i++) {
            this.textureCoordinates.add(new MdlTexcoord(this._io, this, _root));
        }
        triangles = new ArrayList<MdlTriangle>(((Number) (header().numTris())).intValue());
        for (int i = 0; i < header().numTris(); i++) {
            this.triangles.add(new MdlTriangle(this._io, this, _root));
        }
        frames = new ArrayList<MdlFrame>(((Number) (header().numFrames())).intValue());
        for (int i = 0; i < header().numFrames(); i++) {
            this.frames.add(new MdlFrame(this._io, this, _root));
        }
    }
    public static class MdlVertex extends KaitaiStruct {
        public static MdlVertex fromFile(String fileName) throws IOException {
            return new MdlVertex(new ByteBufferKaitaiStream(fileName));
        }

        public MdlVertex(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MdlVertex(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public MdlVertex(KaitaiStream _io, KaitaiStruct _parent, QuakeMdl _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            values = new ArrayList<Integer>(((Number) (3)).intValue());
            for (int i = 0; i < 3; i++) {
                this.values.add(this._io.readU1());
            }
            this.normalIndex = this._io.readU1();
        }
        private ArrayList<Integer> values;
        private int normalIndex;
        private QuakeMdl _root;
        private KaitaiStruct _parent;
        public ArrayList<Integer> values() { return values; }
        public int normalIndex() { return normalIndex; }
        public QuakeMdl _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class MdlTexcoord extends KaitaiStruct {
        public static MdlTexcoord fromFile(String fileName) throws IOException {
            return new MdlTexcoord(new ByteBufferKaitaiStream(fileName));
        }

        public MdlTexcoord(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MdlTexcoord(KaitaiStream _io, QuakeMdl _parent) {
            this(_io, _parent, null);
        }

        public MdlTexcoord(KaitaiStream _io, QuakeMdl _parent, QuakeMdl _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.onSeam = this._io.readS4le();
            this.s = this._io.readS4le();
            this.t = this._io.readS4le();
        }
        private int onSeam;
        private int s;
        private int t;
        private QuakeMdl _root;
        private QuakeMdl _parent;
        public int onSeam() { return onSeam; }
        public int s() { return s; }
        public int t() { return t; }
        public QuakeMdl _root() { return _root; }
        public QuakeMdl _parent() { return _parent; }
    }
    public static class MdlHeader extends KaitaiStruct {
        public static MdlHeader fromFile(String fileName) throws IOException {
            return new MdlHeader(new ByteBufferKaitaiStream(fileName));
        }

        public MdlHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MdlHeader(KaitaiStream _io, QuakeMdl _parent) {
            this(_io, _parent, null);
        }

        public MdlHeader(KaitaiStream _io, QuakeMdl _parent, QuakeMdl _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.ident = this._io.readBytes(4);
            if (!(Arrays.equals(ident(), new byte[] { 73, 68, 80, 79 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 73, 68, 80, 79 }, ident(), _io(), "/types/mdl_header/seq/0");
            }
            this.versionMustBe6 = this._io.readBytes(4);
            if (!(Arrays.equals(versionMustBe6(), new byte[] { 6, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 6, 0, 0, 0 }, versionMustBe6(), _io(), "/types/mdl_header/seq/1");
            }
            this.scale = new Vec3(this._io, this, _root);
            this.origin = new Vec3(this._io, this, _root);
            this.radius = this._io.readF4le();
            this.eyePosition = new Vec3(this._io, this, _root);
            this.numSkins = this._io.readS4le();
            this.skinWidth = this._io.readS4le();
            this.skinHeight = this._io.readS4le();
            this.numVerts = this._io.readS4le();
            this.numTris = this._io.readS4le();
            this.numFrames = this._io.readS4le();
            this.synctype = this._io.readS4le();
            this.flags = this._io.readS4le();
            this.size = this._io.readF4le();
        }
        private Byte version;
        public Byte version() {
            if (this.version != null)
                return this.version;
            byte _tmp = (byte) (6);
            this.version = _tmp;
            return this.version;
        }
        private Integer skinSize;
        public Integer skinSize() {
            if (this.skinSize != null)
                return this.skinSize;
            int _tmp = (int) ((skinWidth() * skinHeight()));
            this.skinSize = _tmp;
            return this.skinSize;
        }
        private byte[] ident;
        private byte[] versionMustBe6;
        private Vec3 scale;
        private Vec3 origin;
        private float radius;
        private Vec3 eyePosition;
        private int numSkins;
        private int skinWidth;
        private int skinHeight;
        private int numVerts;
        private int numTris;
        private int numFrames;
        private int synctype;
        private int flags;
        private float size;
        private QuakeMdl _root;
        private QuakeMdl _parent;
        public byte[] ident() { return ident; }
        public byte[] versionMustBe6() { return versionMustBe6; }
        public Vec3 scale() { return scale; }
        public Vec3 origin() { return origin; }
        public float radius() { return radius; }
        public Vec3 eyePosition() { return eyePosition; }
        public int numSkins() { return numSkins; }
        public int skinWidth() { return skinWidth; }
        public int skinHeight() { return skinHeight; }
        public int numVerts() { return numVerts; }
        public int numTris() { return numTris; }
        public int numFrames() { return numFrames; }
        public int synctype() { return synctype; }
        public int flags() { return flags; }
        public float size() { return size; }
        public QuakeMdl _root() { return _root; }
        public QuakeMdl _parent() { return _parent; }
    }
    public static class MdlSkin extends KaitaiStruct {
        public static MdlSkin fromFile(String fileName) throws IOException {
            return new MdlSkin(new ByteBufferKaitaiStream(fileName));
        }

        public MdlSkin(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MdlSkin(KaitaiStream _io, QuakeMdl _parent) {
            this(_io, _parent, null);
        }

        public MdlSkin(KaitaiStream _io, QuakeMdl _parent, QuakeMdl _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.group = this._io.readS4le();
            if (group() == 0) {
                this.singleTextureData = this._io.readBytes(_root.header().skinSize());
            }
            if (group() != 0) {
                this.numFrames = this._io.readU4le();
            }
            if (group() != 0) {
                frameTimes = new ArrayList<Float>(((Number) (numFrames())).intValue());
                for (int i = 0; i < numFrames(); i++) {
                    this.frameTimes.add(this._io.readF4le());
                }
            }
            if (group() != 0) {
                groupTextureData = new ArrayList<byte[]>(((Number) (numFrames())).intValue());
                for (int i = 0; i < numFrames(); i++) {
                    this.groupTextureData.add(this._io.readBytes(_root.header().skinSize()));
                }
            }
        }
        private int group;
        private byte[] singleTextureData;
        private Long numFrames;
        private ArrayList<Float> frameTimes;
        private ArrayList<byte[]> groupTextureData;
        private QuakeMdl _root;
        private QuakeMdl _parent;
        public int group() { return group; }
        public byte[] singleTextureData() { return singleTextureData; }
        public Long numFrames() { return numFrames; }
        public ArrayList<Float> frameTimes() { return frameTimes; }
        public ArrayList<byte[]> groupTextureData() { return groupTextureData; }
        public QuakeMdl _root() { return _root; }
        public QuakeMdl _parent() { return _parent; }
    }
    public static class MdlFrame extends KaitaiStruct {
        public static MdlFrame fromFile(String fileName) throws IOException {
            return new MdlFrame(new ByteBufferKaitaiStream(fileName));
        }

        public MdlFrame(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MdlFrame(KaitaiStream _io, QuakeMdl _parent) {
            this(_io, _parent, null);
        }

        public MdlFrame(KaitaiStream _io, QuakeMdl _parent, QuakeMdl _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.type = this._io.readS4le();
            if (type() != 0) {
                this.min = new MdlVertex(this._io, this, _root);
            }
            if (type() != 0) {
                this.max = new MdlVertex(this._io, this, _root);
            }
            if (type() != 0) {
                time = new ArrayList<Float>(((Number) (type())).intValue());
                for (int i = 0; i < type(); i++) {
                    this.time.add(this._io.readF4le());
                }
            }
            frames = new ArrayList<MdlSimpleFrame>(((Number) (numSimpleFrames())).intValue());
            for (int i = 0; i < numSimpleFrames(); i++) {
                this.frames.add(new MdlSimpleFrame(this._io, this, _root));
            }
        }
        private Integer numSimpleFrames;
        public Integer numSimpleFrames() {
            if (this.numSimpleFrames != null)
                return this.numSimpleFrames;
            int _tmp = (int) ((type() == 0 ? 1 : type()));
            this.numSimpleFrames = _tmp;
            return this.numSimpleFrames;
        }
        private int type;
        private MdlVertex min;
        private MdlVertex max;
        private ArrayList<Float> time;
        private ArrayList<MdlSimpleFrame> frames;
        private QuakeMdl _root;
        private QuakeMdl _parent;
        public int type() { return type; }
        public MdlVertex min() { return min; }
        public MdlVertex max() { return max; }
        public ArrayList<Float> time() { return time; }
        public ArrayList<MdlSimpleFrame> frames() { return frames; }
        public QuakeMdl _root() { return _root; }
        public QuakeMdl _parent() { return _parent; }
    }
    public static class MdlSimpleFrame extends KaitaiStruct {
        public static MdlSimpleFrame fromFile(String fileName) throws IOException {
            return new MdlSimpleFrame(new ByteBufferKaitaiStream(fileName));
        }

        public MdlSimpleFrame(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MdlSimpleFrame(KaitaiStream _io, QuakeMdl.MdlFrame _parent) {
            this(_io, _parent, null);
        }

        public MdlSimpleFrame(KaitaiStream _io, QuakeMdl.MdlFrame _parent, QuakeMdl _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.bboxMin = new MdlVertex(this._io, this, _root);
            this.bboxMax = new MdlVertex(this._io, this, _root);
            this.name = new String(KaitaiStream.bytesTerminate(KaitaiStream.bytesStripRight(this._io.readBytes(16), (byte) 0), (byte) 0, false), Charset.forName("ASCII"));
            vertices = new ArrayList<MdlVertex>(((Number) (_root.header().numVerts())).intValue());
            for (int i = 0; i < _root.header().numVerts(); i++) {
                this.vertices.add(new MdlVertex(this._io, this, _root));
            }
        }
        private MdlVertex bboxMin;
        private MdlVertex bboxMax;
        private String name;
        private ArrayList<MdlVertex> vertices;
        private QuakeMdl _root;
        private QuakeMdl.MdlFrame _parent;
        public MdlVertex bboxMin() { return bboxMin; }
        public MdlVertex bboxMax() { return bboxMax; }
        public String name() { return name; }
        public ArrayList<MdlVertex> vertices() { return vertices; }
        public QuakeMdl _root() { return _root; }
        public QuakeMdl.MdlFrame _parent() { return _parent; }
    }
    public static class MdlTriangle extends KaitaiStruct {
        public static MdlTriangle fromFile(String fileName) throws IOException {
            return new MdlTriangle(new ByteBufferKaitaiStream(fileName));
        }

        public MdlTriangle(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MdlTriangle(KaitaiStream _io, QuakeMdl _parent) {
            this(_io, _parent, null);
        }

        public MdlTriangle(KaitaiStream _io, QuakeMdl _parent, QuakeMdl _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.facesFront = this._io.readS4le();
            vertices = new ArrayList<Integer>(((Number) (3)).intValue());
            for (int i = 0; i < 3; i++) {
                this.vertices.add(this._io.readS4le());
            }
        }
        private int facesFront;
        private ArrayList<Integer> vertices;
        private QuakeMdl _root;
        private QuakeMdl _parent;
        public int facesFront() { return facesFront; }
        public ArrayList<Integer> vertices() { return vertices; }
        public QuakeMdl _root() { return _root; }
        public QuakeMdl _parent() { return _parent; }
    }
    public static class Vec3 extends KaitaiStruct {
        public static Vec3 fromFile(String fileName) throws IOException {
            return new Vec3(new ByteBufferKaitaiStream(fileName));
        }

        public Vec3(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Vec3(KaitaiStream _io, QuakeMdl.MdlHeader _parent) {
            this(_io, _parent, null);
        }

        public Vec3(KaitaiStream _io, QuakeMdl.MdlHeader _parent, QuakeMdl _root) {
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
        private QuakeMdl _root;
        private QuakeMdl.MdlHeader _parent;
        public float x() { return x; }
        public float y() { return y; }
        public float z() { return z; }
        public QuakeMdl _root() { return _root; }
        public QuakeMdl.MdlHeader _parent() { return _parent; }
    }
    private MdlHeader header;
    private ArrayList<MdlSkin> skins;
    private ArrayList<MdlTexcoord> textureCoordinates;
    private ArrayList<MdlTriangle> triangles;
    private ArrayList<MdlFrame> frames;
    private QuakeMdl _root;
    private KaitaiStruct _parent;
    public MdlHeader header() { return header; }
    public ArrayList<MdlSkin> skins() { return skins; }
    public ArrayList<MdlTexcoord> textureCoordinates() { return textureCoordinates; }
    public ArrayList<MdlTriangle> triangles() { return triangles; }
    public ArrayList<MdlFrame> frames() { return frames; }
    public QuakeMdl _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
