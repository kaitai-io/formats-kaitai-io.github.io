// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.List;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


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
public class QuakeMdl extends KaitaiStruct.ReadWrite {
    public static QuakeMdl fromFile(String fileName) throws IOException {
        return new QuakeMdl(new ByteBufferKaitaiStream(fileName));
    }
    public QuakeMdl() {
        this(null, null, null);
    }

    public QuakeMdl(KaitaiStream _io) {
        this(_io, null, null);
    }

    public QuakeMdl(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public QuakeMdl(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, QuakeMdl _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new MdlHeader(this._io, this, _root);
        this.header._read();
        this.skins = new ArrayList<MdlSkin>();
        for (int i = 0; i < header().numSkins(); i++) {
            MdlSkin _t_skins = new MdlSkin(this._io, this, _root);
            try {
                _t_skins._read();
            } finally {
                this.skins.add(_t_skins);
            }
        }
        this.textureCoordinates = new ArrayList<MdlTexcoord>();
        for (int i = 0; i < header().numVerts(); i++) {
            MdlTexcoord _t_textureCoordinates = new MdlTexcoord(this._io, this, _root);
            try {
                _t_textureCoordinates._read();
            } finally {
                this.textureCoordinates.add(_t_textureCoordinates);
            }
        }
        this.triangles = new ArrayList<MdlTriangle>();
        for (int i = 0; i < header().numTris(); i++) {
            MdlTriangle _t_triangles = new MdlTriangle(this._io, this, _root);
            try {
                _t_triangles._read();
            } finally {
                this.triangles.add(_t_triangles);
            }
        }
        this.frames = new ArrayList<MdlFrame>();
        for (int i = 0; i < header().numFrames(); i++) {
            MdlFrame _t_frames = new MdlFrame(this._io, this, _root);
            try {
                _t_frames._read();
            } finally {
                this.frames.add(_t_frames);
            }
        }
        _dirty = false;
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

    public void _write_Seq() {
        _assertNotDirty();
        this.header._write_Seq(this._io);
        for (int i = 0; i < this.skins.size(); i++) {
            this.skins.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        for (int i = 0; i < this.textureCoordinates.size(); i++) {
            this.textureCoordinates.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        for (int i = 0; i < this.triangles.size(); i++) {
            this.triangles.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        for (int i = 0; i < this.frames.size(); i++) {
            this.frames.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (this.skins.size() != header().numSkins())
            throw new ConsistencyError("skins", header().numSkins(), this.skins.size());
        for (int i = 0; i < this.skins.size(); i++) {
            if (!Objects.equals(this.skins.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("skins", _root(), this.skins.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.skins.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("skins", this, this.skins.get(((Number) (i)).intValue())._parent());
        }
        if (this.textureCoordinates.size() != header().numVerts())
            throw new ConsistencyError("texture_coordinates", header().numVerts(), this.textureCoordinates.size());
        for (int i = 0; i < this.textureCoordinates.size(); i++) {
            if (!Objects.equals(this.textureCoordinates.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("texture_coordinates", _root(), this.textureCoordinates.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.textureCoordinates.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("texture_coordinates", this, this.textureCoordinates.get(((Number) (i)).intValue())._parent());
        }
        if (this.triangles.size() != header().numTris())
            throw new ConsistencyError("triangles", header().numTris(), this.triangles.size());
        for (int i = 0; i < this.triangles.size(); i++) {
            if (!Objects.equals(this.triangles.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("triangles", _root(), this.triangles.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.triangles.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("triangles", this, this.triangles.get(((Number) (i)).intValue())._parent());
        }
        if (this.frames.size() != header().numFrames())
            throw new ConsistencyError("frames", header().numFrames(), this.frames.size());
        for (int i = 0; i < this.frames.size(); i++) {
            if (!Objects.equals(this.frames.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("frames", _root(), this.frames.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.frames.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("frames", this, this.frames.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class MdlFrame extends KaitaiStruct.ReadWrite {
        public static MdlFrame fromFile(String fileName) throws IOException {
            return new MdlFrame(new ByteBufferKaitaiStream(fileName));
        }
        public MdlFrame() {
            this(null, null, null);
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
        }
        public void _read() {
            this.type = this._io.readS4le();
            if (type() != 0) {
                this.min = new MdlVertex(this._io, this, _root);
                this.min._read();
            }
            if (type() != 0) {
                this.max = new MdlVertex(this._io, this, _root);
                this.max._read();
            }
            if (type() != 0) {
                this.time = new ArrayList<Float>();
                for (int i = 0; i < type(); i++) {
                    this.time.add(this._io.readF4le());
                }
            }
            this.frames = new ArrayList<MdlSimpleFrame>();
            for (int i = 0; i < numSimpleFrames(); i++) {
                MdlSimpleFrame _t_frames = new MdlSimpleFrame(this._io, this, _root);
                try {
                    _t_frames._read();
                } finally {
                    this.frames.add(_t_frames);
                }
            }
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS4le(this.type);
            if (type() != 0) {
                this.min._write_Seq(this._io);
            }
            if (type() != 0) {
                this.max._write_Seq(this._io);
            }
            if (type() != 0) {
                for (int i = 0; i < this.time.size(); i++) {
                    this._io.writeF4le(this.time.get(((Number) (i)).intValue()));
                }
            }
            for (int i = 0; i < this.frames.size(); i++) {
                this.frames.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (type() != 0) {
                if (!Objects.equals(this.min._root(), _root()))
                    throw new ConsistencyError("min", _root(), this.min._root());
                if (!Objects.equals(this.min._parent(), this))
                    throw new ConsistencyError("min", this, this.min._parent());
            }
            if (type() != 0) {
                if (!Objects.equals(this.max._root(), _root()))
                    throw new ConsistencyError("max", _root(), this.max._root());
                if (!Objects.equals(this.max._parent(), this))
                    throw new ConsistencyError("max", this, this.max._parent());
            }
            if (type() != 0) {
                if (this.time.size() != type())
                    throw new ConsistencyError("time", type(), this.time.size());
                for (int i = 0; i < this.time.size(); i++) {
                }
            }
            if (this.frames.size() != numSimpleFrames())
                throw new ConsistencyError("frames", numSimpleFrames(), this.frames.size());
            for (int i = 0; i < this.frames.size(); i++) {
                if (!Objects.equals(this.frames.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("frames", _root(), this.frames.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.frames.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("frames", this, this.frames.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private Integer numSimpleFrames;
        public Integer numSimpleFrames() {
            if (this.numSimpleFrames != null)
                return this.numSimpleFrames;
            this.numSimpleFrames = ((Number) ((type() == 0 ? 1 : type()))).intValue();
            return this.numSimpleFrames;
        }
        public void _invalidateNumSimpleFrames() { this.numSimpleFrames = null; }
        private int type;
        private MdlVertex min;
        private MdlVertex max;
        private List<Float> time;
        private List<MdlSimpleFrame> frames;
        private QuakeMdl _root;
        private QuakeMdl _parent;
        public int type() { return type; }
        public void setType(int _v) { _dirty = true; type = _v; }
        public MdlVertex min() { return min; }
        public void setMin(MdlVertex _v) { _dirty = true; min = _v; }
        public MdlVertex max() { return max; }
        public void setMax(MdlVertex _v) { _dirty = true; max = _v; }
        public List<Float> time() { return time; }
        public void setTime(List<Float> _v) { _dirty = true; time = _v; }
        public List<MdlSimpleFrame> frames() { return frames; }
        public void setFrames(List<MdlSimpleFrame> _v) { _dirty = true; frames = _v; }
        public QuakeMdl _root() { return _root; }
        public void set_root(QuakeMdl _v) { _dirty = true; _root = _v; }
        public QuakeMdl _parent() { return _parent; }
        public void set_parent(QuakeMdl _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L59-L75">Source</a>
     * @see <a href="https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD0">Source</a>
     */
    public static class MdlHeader extends KaitaiStruct.ReadWrite {
        public static MdlHeader fromFile(String fileName) throws IOException {
            return new MdlHeader(new ByteBufferKaitaiStream(fileName));
        }
        public MdlHeader() {
            this(null, null, null);
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
        }
        public void _read() {
            this.ident = this._io.readBytes(4);
            if (!(Arrays.equals(this.ident, new byte[] { 73, 68, 80, 79 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 73, 68, 80, 79 }, this.ident, this._io, "/types/mdl_header/seq/0");
            }
            this.version = this._io.readS4le();
            if (!(this.version == 6)) {
                throw new KaitaiStream.ValidationNotEqualError(6, this.version, this._io, "/types/mdl_header/seq/1");
            }
            this.scale = new Vec3(this._io, this, _root);
            this.scale._read();
            this.origin = new Vec3(this._io, this, _root);
            this.origin._read();
            this.radius = this._io.readF4le();
            this.eyePosition = new Vec3(this._io, this, _root);
            this.eyePosition._read();
            this.numSkins = this._io.readS4le();
            this.skinWidth = this._io.readS4le();
            this.skinHeight = this._io.readS4le();
            this.numVerts = this._io.readS4le();
            this.numTris = this._io.readS4le();
            this.numFrames = this._io.readS4le();
            this.synctype = this._io.readS4le();
            this.flags = this._io.readS4le();
            this.size = this._io.readF4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.scale._fetchInstances();
            this.origin._fetchInstances();
            this.eyePosition._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.ident);
            this._io.writeS4le(this.version);
            this.scale._write_Seq(this._io);
            this.origin._write_Seq(this._io);
            this._io.writeF4le(this.radius);
            this.eyePosition._write_Seq(this._io);
            this._io.writeS4le(this.numSkins);
            this._io.writeS4le(this.skinWidth);
            this._io.writeS4le(this.skinHeight);
            this._io.writeS4le(this.numVerts);
            this._io.writeS4le(this.numTris);
            this._io.writeS4le(this.numFrames);
            this._io.writeS4le(this.synctype);
            this._io.writeS4le(this.flags);
            this._io.writeF4le(this.size);
        }

        public void _check() {
            if (this.ident.length != 4)
                throw new ConsistencyError("ident", 4, this.ident.length);
            if (!(Arrays.equals(this.ident, new byte[] { 73, 68, 80, 79 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 73, 68, 80, 79 }, this.ident, null, "/types/mdl_header/seq/0");
            }
            if (!(this.version == 6)) {
                throw new KaitaiStream.ValidationNotEqualError(6, this.version, null, "/types/mdl_header/seq/1");
            }
            if (!Objects.equals(this.scale._root(), _root()))
                throw new ConsistencyError("scale", _root(), this.scale._root());
            if (!Objects.equals(this.scale._parent(), this))
                throw new ConsistencyError("scale", this, this.scale._parent());
            if (!Objects.equals(this.origin._root(), _root()))
                throw new ConsistencyError("origin", _root(), this.origin._root());
            if (!Objects.equals(this.origin._parent(), this))
                throw new ConsistencyError("origin", this, this.origin._parent());
            if (!Objects.equals(this.eyePosition._root(), _root()))
                throw new ConsistencyError("eye_position", _root(), this.eyePosition._root());
            if (!Objects.equals(this.eyePosition._parent(), this))
                throw new ConsistencyError("eye_position", this, this.eyePosition._parent());
            _dirty = false;
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
        public void _invalidateSkinSize() { this.skinSize = null; }
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
        public void setIdent(byte[] _v) { _dirty = true; ident = _v; }
        public int version() { return version; }
        public void setVersion(int _v) { _dirty = true; version = _v; }

        /**
         * Global scaling factors in 3 dimensions for whole model. When
         * represented in 3D world, this model local coordinates will
         * be multiplied by these factors.
         */
        public Vec3 scale() { return scale; }
        public void setScale(Vec3 _v) { _dirty = true; scale = _v; }
        public Vec3 origin() { return origin; }
        public void setOrigin(Vec3 _v) { _dirty = true; origin = _v; }
        public float radius() { return radius; }
        public void setRadius(float _v) { _dirty = true; radius = _v; }
        public Vec3 eyePosition() { return eyePosition; }
        public void setEyePosition(Vec3 _v) { _dirty = true; eyePosition = _v; }

        /**
         * Number of skins (=texture bitmaps) included in this model.
         */
        public int numSkins() { return numSkins; }
        public void setNumSkins(int _v) { _dirty = true; numSkins = _v; }

        /**
         * Width (U coordinate max) of every skin (=texture) in pixels.
         */
        public int skinWidth() { return skinWidth; }
        public void setSkinWidth(int _v) { _dirty = true; skinWidth = _v; }

        /**
         * Height (V coordinate max) of every skin (=texture) in
         * pixels.
         */
        public int skinHeight() { return skinHeight; }
        public void setSkinHeight(int _v) { _dirty = true; skinHeight = _v; }

        /**
         * Number of vertices in this model. Note that this is constant
         * for all the animation frames and all textures.
         */
        public int numVerts() { return numVerts; }
        public void setNumVerts(int _v) { _dirty = true; numVerts = _v; }

        /**
         * Number of triangles (=triangular faces) in this model.
         */
        public int numTris() { return numTris; }
        public void setNumTris(int _v) { _dirty = true; numTris = _v; }

        /**
         * Number of animation frames included in this model.
         */
        public int numFrames() { return numFrames; }
        public void setNumFrames(int _v) { _dirty = true; numFrames = _v; }
        public int synctype() { return synctype; }
        public void setSynctype(int _v) { _dirty = true; synctype = _v; }
        public int flags() { return flags; }
        public void setFlags(int _v) { _dirty = true; flags = _v; }
        public float size() { return size; }
        public void setSize(float _v) { _dirty = true; size = _v; }
        public QuakeMdl _root() { return _root; }
        public void set_root(QuakeMdl _v) { _dirty = true; _root = _v; }
        public QuakeMdl _parent() { return _parent; }
        public void set_parent(QuakeMdl _v) { _dirty = true; _parent = _v; }
    }
    public static class MdlSimpleFrame extends KaitaiStruct.ReadWrite {
        public static MdlSimpleFrame fromFile(String fileName) throws IOException {
            return new MdlSimpleFrame(new ByteBufferKaitaiStream(fileName));
        }
        public MdlSimpleFrame() {
            this(null, null, null);
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
        }
        public void _read() {
            this.bboxMin = new MdlVertex(this._io, this, _root);
            this.bboxMin._read();
            this.bboxMax = new MdlVertex(this._io, this, _root);
            this.bboxMax._read();
            this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(16), (byte) 0, false), StandardCharsets.US_ASCII);
            this.vertices = new ArrayList<MdlVertex>();
            for (int i = 0; i < _root().header().numVerts(); i++) {
                MdlVertex _t_vertices = new MdlVertex(this._io, this, _root);
                try {
                    _t_vertices._read();
                } finally {
                    this.vertices.add(_t_vertices);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.bboxMin._fetchInstances();
            this.bboxMax._fetchInstances();
            for (int i = 0; i < this.vertices.size(); i++) {
                this.vertices.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.bboxMin._write_Seq(this._io);
            this.bboxMax._write_Seq(this._io);
            this._io.writeBytesLimit((this.name).getBytes(Charset.forName("ASCII")), 16, (byte) 0, (byte) 0);
            for (int i = 0; i < this.vertices.size(); i++) {
                this.vertices.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (!Objects.equals(this.bboxMin._root(), _root()))
                throw new ConsistencyError("bbox_min", _root(), this.bboxMin._root());
            if (!Objects.equals(this.bboxMin._parent(), this))
                throw new ConsistencyError("bbox_min", this, this.bboxMin._parent());
            if (!Objects.equals(this.bboxMax._root(), _root()))
                throw new ConsistencyError("bbox_max", _root(), this.bboxMax._root());
            if (!Objects.equals(this.bboxMax._parent(), this))
                throw new ConsistencyError("bbox_max", this, this.bboxMax._parent());
            if ((this.name).getBytes(Charset.forName("ASCII")).length > 16)
                throw new ConsistencyError("name", 16, (this.name).getBytes(Charset.forName("ASCII")).length);
            if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            if (this.vertices.size() != _root().header().numVerts())
                throw new ConsistencyError("vertices", _root().header().numVerts(), this.vertices.size());
            for (int i = 0; i < this.vertices.size(); i++) {
                if (!Objects.equals(this.vertices.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("vertices", _root(), this.vertices.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.vertices.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("vertices", this, this.vertices.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private MdlVertex bboxMin;
        private MdlVertex bboxMax;
        private String name;
        private List<MdlVertex> vertices;
        private QuakeMdl _root;
        private QuakeMdl.MdlFrame _parent;
        public MdlVertex bboxMin() { return bboxMin; }
        public void setBboxMin(MdlVertex _v) { _dirty = true; bboxMin = _v; }
        public MdlVertex bboxMax() { return bboxMax; }
        public void setBboxMax(MdlVertex _v) { _dirty = true; bboxMax = _v; }
        public String name() { return name; }
        public void setName(String _v) { _dirty = true; name = _v; }
        public List<MdlVertex> vertices() { return vertices; }
        public void setVertices(List<MdlVertex> _v) { _dirty = true; vertices = _v; }
        public QuakeMdl _root() { return _root; }
        public void set_root(QuakeMdl _v) { _dirty = true; _root = _v; }
        public QuakeMdl.MdlFrame _parent() { return _parent; }
        public void set_parent(QuakeMdl.MdlFrame _v) { _dirty = true; _parent = _v; }
    }
    public static class MdlSkin extends KaitaiStruct.ReadWrite {
        public static MdlSkin fromFile(String fileName) throws IOException {
            return new MdlSkin(new ByteBufferKaitaiStream(fileName));
        }
        public MdlSkin() {
            this(null, null, null);
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
        }
        public void _read() {
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
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS4le(this.group);
            if (group() == 0) {
                this._io.writeBytes(this.singleTextureData);
            }
            if (group() != 0) {
                this._io.writeU4le(this.numFrames);
            }
            if (group() != 0) {
                for (int i = 0; i < this.frameTimes.size(); i++) {
                    this._io.writeF4le(this.frameTimes.get(((Number) (i)).intValue()));
                }
            }
            if (group() != 0) {
                for (int i = 0; i < this.groupTextureData.size(); i++) {
                    this._io.writeBytes(this.groupTextureData.get(((Number) (i)).intValue()));
                }
            }
        }

        public void _check() {
            if (group() == 0) {
                if (this.singleTextureData.length != _root().header().skinSize())
                    throw new ConsistencyError("single_texture_data", _root().header().skinSize(), this.singleTextureData.length);
            }
            if (group() != 0) {
            }
            if (group() != 0) {
                if (this.frameTimes.size() != numFrames())
                    throw new ConsistencyError("frame_times", numFrames(), this.frameTimes.size());
                for (int i = 0; i < this.frameTimes.size(); i++) {
                }
            }
            if (group() != 0) {
                if (this.groupTextureData.size() != numFrames())
                    throw new ConsistencyError("group_texture_data", numFrames(), this.groupTextureData.size());
                for (int i = 0; i < this.groupTextureData.size(); i++) {
                    if (this.groupTextureData.get(((Number) (i)).intValue()).length != _root().header().skinSize())
                        throw new ConsistencyError("group_texture_data", _root().header().skinSize(), this.groupTextureData.get(((Number) (i)).intValue()).length);
                }
            }
            _dirty = false;
        }
        private int group;
        private byte[] singleTextureData;
        private Long numFrames;
        private List<Float> frameTimes;
        private List<byte[]> groupTextureData;
        private QuakeMdl _root;
        private QuakeMdl _parent;
        public int group() { return group; }
        public void setGroup(int _v) { _dirty = true; group = _v; }
        public byte[] singleTextureData() { return singleTextureData; }
        public void setSingleTextureData(byte[] _v) { _dirty = true; singleTextureData = _v; }
        public Long numFrames() { return numFrames; }
        public void setNumFrames(Long _v) { _dirty = true; numFrames = _v; }
        public List<Float> frameTimes() { return frameTimes; }
        public void setFrameTimes(List<Float> _v) { _dirty = true; frameTimes = _v; }
        public List<byte[]> groupTextureData() { return groupTextureData; }
        public void setGroupTextureData(List<byte[]> _v) { _dirty = true; groupTextureData = _v; }
        public QuakeMdl _root() { return _root; }
        public void set_root(QuakeMdl _v) { _dirty = true; _root = _v; }
        public QuakeMdl _parent() { return _parent; }
        public void set_parent(QuakeMdl _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L79-L83">Source</a>
     * @see <a href="https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD2">Source</a>
     */
    public static class MdlTexcoord extends KaitaiStruct.ReadWrite {
        public static MdlTexcoord fromFile(String fileName) throws IOException {
            return new MdlTexcoord(new ByteBufferKaitaiStream(fileName));
        }
        public MdlTexcoord() {
            this(null, null, null);
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
        }
        public void _read() {
            this.onSeam = this._io.readS4le();
            this.s = this._io.readS4le();
            this.t = this._io.readS4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS4le(this.onSeam);
            this._io.writeS4le(this.s);
            this._io.writeS4le(this.t);
        }

        public void _check() {
            _dirty = false;
        }
        private int onSeam;
        private int s;
        private int t;
        private QuakeMdl _root;
        private QuakeMdl _parent;
        public int onSeam() { return onSeam; }
        public void setOnSeam(int _v) { _dirty = true; onSeam = _v; }
        public int s() { return s; }
        public void setS(int _v) { _dirty = true; s = _v; }
        public int t() { return t; }
        public void setT(int _v) { _dirty = true; t = _v; }
        public QuakeMdl _root() { return _root; }
        public void set_root(QuakeMdl _v) { _dirty = true; _root = _v; }
        public QuakeMdl _parent() { return _parent; }
        public void set_parent(QuakeMdl _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Represents a triangular face, connecting 3 vertices, referenced
     * by their indexes.
     * @see <a href="https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L85-L88">Source</a>
     * @see <a href="https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD3">Source</a>
     */
    public static class MdlTriangle extends KaitaiStruct.ReadWrite {
        public static MdlTriangle fromFile(String fileName) throws IOException {
            return new MdlTriangle(new ByteBufferKaitaiStream(fileName));
        }
        public MdlTriangle() {
            this(null, null, null);
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
        }
        public void _read() {
            this.facesFront = this._io.readS4le();
            this.vertices = new ArrayList<Integer>();
            for (int i = 0; i < 3; i++) {
                this.vertices.add(this._io.readS4le());
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.vertices.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS4le(this.facesFront);
            for (int i = 0; i < this.vertices.size(); i++) {
                this._io.writeS4le(this.vertices.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (this.vertices.size() != 3)
                throw new ConsistencyError("vertices", 3, this.vertices.size());
            for (int i = 0; i < this.vertices.size(); i++) {
            }
            _dirty = false;
        }
        private int facesFront;
        private List<Integer> vertices;
        private QuakeMdl _root;
        private QuakeMdl _parent;
        public int facesFront() { return facesFront; }
        public void setFacesFront(int _v) { _dirty = true; facesFront = _v; }
        public List<Integer> vertices() { return vertices; }
        public void setVertices(List<Integer> _v) { _dirty = true; vertices = _v; }
        public QuakeMdl _root() { return _root; }
        public void set_root(QuakeMdl _v) { _dirty = true; _root = _v; }
        public QuakeMdl _parent() { return _parent; }
        public void set_parent(QuakeMdl _v) { _dirty = true; _parent = _v; }
    }
    public static class MdlVertex extends KaitaiStruct.ReadWrite {
        public static MdlVertex fromFile(String fileName) throws IOException {
            return new MdlVertex(new ByteBufferKaitaiStream(fileName));
        }
        public MdlVertex() {
            this(null, null, null);
        }

        public MdlVertex(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MdlVertex(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public MdlVertex(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, QuakeMdl _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.values = new ArrayList<Integer>();
            for (int i = 0; i < 3; i++) {
                this.values.add(this._io.readU1());
            }
            this.normalIndex = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.values.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.values.size(); i++) {
                this._io.writeU1(this.values.get(((Number) (i)).intValue()));
            }
            this._io.writeU1(this.normalIndex);
        }

        public void _check() {
            if (this.values.size() != 3)
                throw new ConsistencyError("values", 3, this.values.size());
            for (int i = 0; i < this.values.size(); i++) {
            }
            _dirty = false;
        }
        private List<Integer> values;
        private int normalIndex;
        private QuakeMdl _root;
        private KaitaiStruct.ReadWrite _parent;
        public List<Integer> values() { return values; }
        public void setValues(List<Integer> _v) { _dirty = true; values = _v; }
        public int normalIndex() { return normalIndex; }
        public void setNormalIndex(int _v) { _dirty = true; normalIndex = _v; }
        public QuakeMdl _root() { return _root; }
        public void set_root(QuakeMdl _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Basic 3D vector (x, y, z) using single-precision floating point
     * coordnates. Can be used to specify a point in 3D space,
     * direction, scaling factor, etc.
     */
    public static class Vec3 extends KaitaiStruct.ReadWrite {
        public static Vec3 fromFile(String fileName) throws IOException {
            return new Vec3(new ByteBufferKaitaiStream(fileName));
        }
        public Vec3() {
            this(null, null, null);
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
        private QuakeMdl _root;
        private QuakeMdl.MdlHeader _parent;
        public float x() { return x; }
        public void setX(float _v) { _dirty = true; x = _v; }
        public float y() { return y; }
        public void setY(float _v) { _dirty = true; y = _v; }
        public float z() { return z; }
        public void setZ(float _v) { _dirty = true; z = _v; }
        public QuakeMdl _root() { return _root; }
        public void set_root(QuakeMdl _v) { _dirty = true; _root = _v; }
        public QuakeMdl.MdlHeader _parent() { return _parent; }
        public void set_parent(QuakeMdl.MdlHeader _v) { _dirty = true; _parent = _v; }
    }
    private MdlHeader header;
    private List<MdlSkin> skins;
    private List<MdlTexcoord> textureCoordinates;
    private List<MdlTriangle> triangles;
    private List<MdlFrame> frames;
    private QuakeMdl _root;
    private KaitaiStruct.ReadWrite _parent;
    public MdlHeader header() { return header; }
    public void setHeader(MdlHeader _v) { _dirty = true; header = _v; }
    public List<MdlSkin> skins() { return skins; }
    public void setSkins(List<MdlSkin> _v) { _dirty = true; skins = _v; }
    public List<MdlTexcoord> textureCoordinates() { return textureCoordinates; }
    public void setTextureCoordinates(List<MdlTexcoord> _v) { _dirty = true; textureCoordinates = _v; }
    public List<MdlTriangle> triangles() { return triangles; }
    public void setTriangles(List<MdlTriangle> _v) { _dirty = true; triangles = _v; }
    public List<MdlFrame> frames() { return frames; }
    public void setFrames(List<MdlFrame> _v) { _dirty = true; frames = _v; }
    public QuakeMdl _root() { return _root; }
    public void set_root(QuakeMdl _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
