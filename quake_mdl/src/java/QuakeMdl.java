// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;


/**
 * Quake 1 model format is used to store 3D models completely with
 * textures and animations used in the game. Quake 1 engine
 * (retroactively named "idtech2") is a popular 3D engine first used
 * for Quake game by id Software in 1996.
 * 
 * Model is constructed traditionally from vertices in 3D space, faces
 * which connect vertices, textures ("skins", i.e. 2D bitmaps) and
 * texture UV mapping information. As opposed to more modern,
 * bones-based animation formats, Quake model was animated by changing
 * locations of all vertices it included in 3D space, frame by frame.
 * 
 * File format stores:
 * 
 * * "Skins" — effectively 2D bitmaps which will be used as a
 *   texture. Every model can have multiple skins — e.g. these can be
 *   switched to depict various levels of damage to the
 *   monsters. Bitmaps are 8-bit-per-pixel, indexed in global Quake
 *   palette, subject to lighting and gamma adjustment when rendering
 *   in the game using colormap technique.
 * * "Texture coordinates" — UV coordinates, mapping 3D vertices to
 *   skin coordinates.
 * * "Triangles" — triangular faces connecting 3D vertices.
 * * "Frames" — locations of vertices in 3D space; can include more
 *   than one frame, thus allowing representation of different frames
 *   for animation purposes.
 * 
 * Originally, 3D geometry for models for Quake was designed in [Alias
 * PowerAnimator](https://en.wikipedia.org/wiki/PowerAnimator),
 * precursor of modern day Autodesk Maya and Autodesk Alias. Therefore,
 * 3D-related part of Quake model format followed closely Alias TRI
 * format, and Quake development utilities included a converter from Alias
 * TRI (`modelgen`).
 * 
 * Skins (textures) where prepared as LBM bitmaps with the help from
 * `texmap` utility in the same development utilities toolkit.
 */
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
        this.skins = new ArrayList<MdlSkin>();
        for (int i = 0; i < header().numSkins(); i++) {
            this.skins.add(new MdlSkin(this._io, this, _root));
        }
        this.textureCoordinates = new ArrayList<MdlTexcoord>();
        for (int i = 0; i < header().numVerts(); i++) {
            this.textureCoordinates.add(new MdlTexcoord(this._io, this, _root));
        }
        this.triangles = new ArrayList<MdlTriangle>();
        for (int i = 0; i < header().numTris(); i++) {
            this.triangles.add(new MdlTriangle(this._io, this, _root));
        }
        this.frames = new ArrayList<MdlFrame>();
        for (int i = 0; i < header().numFrames(); i++) {
            this.frames.add(new MdlFrame(this._io, this, _root));
        }
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        for (int i = 0; i < this.skins.size(); i++) {
            this.skins.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.textureCoordinates.size(); i++) {
            this.textureCoordinates.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.triangles.size(); i++) {
            this.triangles.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.frames.size(); i++) {
            this.frames.get(((Number) (i)).intValue())._fetchInstances();
        }
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
                this.time = new ArrayList<Float>();
                for (int i = 0; i < type(); i++) {
                    this.time.add(this._io.readF4le());
                }
            }
            this.frames = new ArrayList<MdlSimpleFrame>();
            for (int i = 0; i < numSimpleFrames(); i++) {
                this.frames.add(new MdlSimpleFrame(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            if (type() != 0) {
                this.min._fetchInstances();
            }
            if (type() != 0) {
                this.max._fetchInstances();
            }
            if (type() != 0) {
                for (int i = 0; i < this.time.size(); i++) {
                }
            }
            for (int i = 0; i < this.frames.size(); i++) {
                this.frames.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private Integer numSimpleFrames;
        public Integer numSimpleFrames() {
            if (this.numSimpleFrames != null)
                return this.numSimpleFrames;
            this.numSimpleFrames = ((Number) ((type() == 0 ? 1 : type()))).intValue();
            return this.numSimpleFrames;
        }
        private int type;
        private MdlVertex min;
        private MdlVertex max;
        private List<Float> time;
        private List<MdlSimpleFrame> frames;
        private QuakeMdl _root;
        private QuakeMdl _parent;
        public int type() { return type; }
        public MdlVertex min() { return min; }
        public MdlVertex max() { return max; }
        public List<Float> time() { return time; }
        public List<MdlSimpleFrame> frames() { return frames; }
        public QuakeMdl _root() { return _root; }
        public QuakeMdl _parent() { return _parent; }
    }

    /**
     * @see <a href="https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L59-L75">Source</a>
     * @see <a href="https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD0">Source</a>
     */
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
            if (!(Arrays.equals(this.ident, new byte[] { 73, 68, 80, 79 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 73, 68, 80, 79 }, this.ident, this._io, "/types/mdl_header/seq/0");
            }
            this.version = this._io.readS4le();
            if (!(this.version == 6)) {
                throw new KaitaiStream.ValidationNotEqualError(6, this.version, this._io, "/types/mdl_header/seq/1");
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

        public void _fetchInstances() {
            this.scale._fetchInstances();
            this.origin._fetchInstances();
            this.eyePosition._fetchInstances();
        }
        private Integer skinSize;

        /**
         * Skin size in pixels.
         */
        public Integer skinSize() {
            if (this.skinSize != null)
                return this.skinSize;
            this.skinSize = ((Number) (skinWidth() * skinHeight())).intValue();
            return this.skinSize;
        }
        private byte[] ident;
        private int version;
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

        /**
         * Magic signature bytes that every Quake model must
         * have. "IDPO" is short for "IDPOLYHEADER".
         * @see <a href="https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L132-L133">Source</a>
         */
        public byte[] ident() { return ident; }
        public int version() { return version; }

        /**
         * Global scaling factors in 3 dimensions for whole model. When
         * represented in 3D world, this model local coordinates will
         * be multiplied by these factors.
         */
        public Vec3 scale() { return scale; }
        public Vec3 origin() { return origin; }
        public float radius() { return radius; }
        public Vec3 eyePosition() { return eyePosition; }

        /**
         * Number of skins (=texture bitmaps) included in this model.
         */
        public int numSkins() { return numSkins; }

        /**
         * Width (U coordinate max) of every skin (=texture) in pixels.
         */
        public int skinWidth() { return skinWidth; }

        /**
         * Height (V coordinate max) of every skin (=texture) in
         * pixels.
         */
        public int skinHeight() { return skinHeight; }

        /**
         * Number of vertices in this model. Note that this is constant
         * for all the animation frames and all textures.
         */
        public int numVerts() { return numVerts; }

        /**
         * Number of triangles (=triangular faces) in this model.
         */
        public int numTris() { return numTris; }

        /**
         * Number of animation frames included in this model.
         */
        public int numFrames() { return numFrames; }
        public int synctype() { return synctype; }
        public int flags() { return flags; }
        public float size() { return size; }
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
            this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(16), (byte) 0, false), StandardCharsets.US_ASCII);
            this.vertices = new ArrayList<MdlVertex>();
            for (int i = 0; i < _root().header().numVerts(); i++) {
                this.vertices.add(new MdlVertex(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            this.bboxMin._fetchInstances();
            this.bboxMax._fetchInstances();
            for (int i = 0; i < this.vertices.size(); i++) {
                this.vertices.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private MdlVertex bboxMin;
        private MdlVertex bboxMax;
        private String name;
        private List<MdlVertex> vertices;
        private QuakeMdl _root;
        private QuakeMdl.MdlFrame _parent;
        public MdlVertex bboxMin() { return bboxMin; }
        public MdlVertex bboxMax() { return bboxMax; }
        public String name() { return name; }
        public List<MdlVertex> vertices() { return vertices; }
        public QuakeMdl _root() { return _root; }
        public QuakeMdl.MdlFrame _parent() { return _parent; }
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
                this.singleTextureData = this._io.readBytes(_root().header().skinSize());
            }
            if (group() != 0) {
                this.numFrames = this._io.readU4le();
            }
            if (group() != 0) {
                this.frameTimes = new ArrayList<Float>();
                for (int i = 0; i < numFrames(); i++) {
                    this.frameTimes.add(this._io.readF4le());
                }
            }
            if (group() != 0) {
                this.groupTextureData = new ArrayList<byte[]>();
                for (int i = 0; i < numFrames(); i++) {
                    this.groupTextureData.add(this._io.readBytes(_root().header().skinSize()));
                }
            }
        }

        public void _fetchInstances() {
            if (group() == 0) {
            }
            if (group() != 0) {
            }
            if (group() != 0) {
                for (int i = 0; i < this.frameTimes.size(); i++) {
                }
            }
            if (group() != 0) {
                for (int i = 0; i < this.groupTextureData.size(); i++) {
                }
            }
        }
        private int group;
        private byte[] singleTextureData;
        private Long numFrames;
        private List<Float> frameTimes;
        private List<byte[]> groupTextureData;
        private QuakeMdl _root;
        private QuakeMdl _parent;
        public int group() { return group; }
        public byte[] singleTextureData() { return singleTextureData; }
        public Long numFrames() { return numFrames; }
        public List<Float> frameTimes() { return frameTimes; }
        public List<byte[]> groupTextureData() { return groupTextureData; }
        public QuakeMdl _root() { return _root; }
        public QuakeMdl _parent() { return _parent; }
    }

    /**
     * @see <a href="https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L79-L83">Source</a>
     * @see <a href="https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD2">Source</a>
     */
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

        public void _fetchInstances() {
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

    /**
     * Represents a triangular face, connecting 3 vertices, referenced
     * by their indexes.
     * @see <a href="https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L85-L88">Source</a>
     * @see <a href="https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD3">Source</a>
     */
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
            this.vertices = new ArrayList<Integer>();
            for (int i = 0; i < 3; i++) {
                this.vertices.add(this._io.readS4le());
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.vertices.size(); i++) {
            }
        }
        private int facesFront;
        private List<Integer> vertices;
        private QuakeMdl _root;
        private QuakeMdl _parent;
        public int facesFront() { return facesFront; }
        public List<Integer> vertices() { return vertices; }
        public QuakeMdl _root() { return _root; }
        public QuakeMdl _parent() { return _parent; }
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
            this.values = new ArrayList<Integer>();
            for (int i = 0; i < 3; i++) {
                this.values.add(this._io.readU1());
            }
            this.normalIndex = this._io.readU1();
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.values.size(); i++) {
            }
        }
        private List<Integer> values;
        private int normalIndex;
        private QuakeMdl _root;
        private KaitaiStruct _parent;
        public List<Integer> values() { return values; }
        public int normalIndex() { return normalIndex; }
        public QuakeMdl _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * Basic 3D vector (x, y, z) using single-precision floating point
     * coordnates. Can be used to specify a point in 3D space,
     * direction, scaling factor, etc.
     */
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

        public void _fetchInstances() {
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
    private List<MdlSkin> skins;
    private List<MdlTexcoord> textureCoordinates;
    private List<MdlTriangle> triangles;
    private List<MdlFrame> frames;
    private QuakeMdl _root;
    private KaitaiStruct _parent;
    public MdlHeader header() { return header; }
    public List<MdlSkin> skins() { return skins; }
    public List<MdlTexcoord> textureCoordinates() { return textureCoordinates; }
    public List<MdlTriangle> triangles() { return triangles; }
    public List<MdlFrame> frames() { return frames; }
    public QuakeMdl _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
