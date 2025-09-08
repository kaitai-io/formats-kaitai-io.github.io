// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;


/**
 * The MD2 format is used for 3D animated models in id Sofware's Quake II.
 * 
 * A model consists of named `frames`, each with the same number of `vertices`
 * (`vertices_per_frame`). Each such vertex has a `position` and `normal` in
 * model space. Each vertex has the same topological "meaning" across frames, in
 * terms of triangle and texture info; it just varies in position and normal for
 * animation purposes.
 * 
 * How the vertices form triangles is defined via disjoint `triangles` or via
 * `gl_cmds` (which allows strip and fan topology). Each triangle contains three
 * `vertex_indices` into frame vertices, and three `tex_point_indices` into
 * global `tex_coords`. Each texture point has pixel coords `s_px` and `t_px`
 * ranging from 0 to `skin_{width,height}_px` respectively, along with
 * `{s,t}_normalized` ranging from 0 to 1 for your convenience.
 * 
 * A GL command has a `primitive` type (`TRIANGLE_FAN` or `TRIANGLE_STRIP`) along
 * with some `vertices`. Each GL vertex contains `tex_coords_normalized` from 0
 * to 1, and a `vertex_index` into frame vertices.
 * 
 * A model may also contain `skins`, which are just file paths to PCX images.
 * However, this is empty for many models, in which case it is up to the client
 * (e.g. Q2PRO) to offer skins some other way (e.g. by similar filename in the
 * current directory).
 * 
 * There are 198 `frames` in total, partitioned into a fixed set of ranges used
 * for different animations. Each frame has a standard `name` for humans, but the
 * client just uses their index and the name can be arbitrary. The name, start
 * frame index and frame count of each animation can be looked up in the arrays
 * `anim_names`, `anim_start_indices`, and `anim_num_frames` respectively. This
 * information is summarized in the following table:
 * 
 * ```
 * |   INDEX  |    NAME | SUFFIX | NOTES                                                  |
 * |:--------:|--------:|:-------|:-------------------------------------------------------|
 * |    0-39  |   stand | 01-40  | Idle animation                                         |
 * |   40-45  |     run | 1-6    | Full run cycle                                         |
 * |   46-53  |  attack | 1-8    | Shoot, reload; some weapons just repeat 1st few frames |
 * |   54-57  |   pain1 | 01-04  | Q2Pro also uses this for switching weapons             |
 * |   58-61  |   pain2 | 01-04  |                                                        |
 * |   62-65  |   pain3 | 01-04  |                                                        |
 * |   66-71  |    jump | 1-6    | Starts at height and lands on feet                     |
 * |   72-83  |    flip | 01-12  | Flipoff, i.e. middle finger                            |
 * |   84-94  |  salute | 01-11  |                                                        |
 * |   95-111 |   taunt | 01-17  |                                                        |
 * |  112-122 |    wave | 01-11  | Q2Pro plays this backwards for a handgrenade toss      |
 * |  123-134 |   point | 01-12  |                                                        |
 * |  135-153 |  crstnd | 01-19  | Idle while crouching                                   |
 * |  154-159 |  crwalk | 1-6    |                                                        |
 * |  160-168 | crattak | 1-9    |                                                        |
 * |  169-172 |  crpain | 1-4    |                                                        |
 * |  173-177 | crdeath | 1-5    |                                                        |
 * |  178-183 |  death1 | 01-06  |                                                        |
 * |  184-189 |  death2 | 01-06  |                                                        |
 * |  190-197 |  death3 | 01-08  |                                                        |
 * ```
 * 
 * The above are filled in for player models; for the separate weapon models,
 * the final frame is 173 "g_view" (unknown purpose) since weapons aren't shown
 * during death animations. `a_grenades.md2`, the handgrenade weapon model, is
 * the same except that the `wave` frames are blank (according to the default
 * female model files). This is likely due to its dual use as a grenade throw
 * animation where this model must leave the player's model.
 * @see <a href="https://icculus.org/~phaethon/q3a/formats/md2-schoenblum.html">Source</a>
 * @see <a href="http://tfc.duke.free.fr/coding/md2-specs-en.html">Source</a>
 * @see <a href="http://tastyspleen.net/~panjoo/downloads/quake2_model_frames.html">Source</a>
 * @see <a href="http://wiki.polycount.com/wiki/OldSiteResourcesQuake2FramesList">Source</a>
 */
public class Quake2Md2 extends KaitaiStruct.ReadWrite {
    public static Quake2Md2 fromFile(String fileName) throws IOException {
        return new Quake2Md2(new ByteBufferKaitaiStream(fileName));
    }

    public enum GlPrimitive {
        TRIANGLE_STRIP(0),
        TRIANGLE_FAN(1);

        private final long id;
        GlPrimitive(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, GlPrimitive> byId = new HashMap<Long, GlPrimitive>(2);
        static {
            for (GlPrimitive e : GlPrimitive.values())
                byId.put(e.id(), e);
        }
        public static GlPrimitive byId(long id) { return byId.get(id); }
    }
    public Quake2Md2() {
        this(null, null, null);
    }

    public Quake2Md2(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Quake2Md2(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Quake2Md2(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Quake2Md2 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 73, 68, 80, 50 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 73, 68, 80, 50 }, this.magic, this._io, "/seq/0");
        }
        this.version = this._io.readU4le();
        if (!(this.version == 8)) {
            throw new KaitaiStream.ValidationNotEqualError(8, this.version, this._io, "/seq/1");
        }
        this.skinWidthPx = this._io.readU4le();
        this.skinHeightPx = this._io.readU4le();
        this.bytesPerFrame = this._io.readU4le();
        this.numSkins = this._io.readU4le();
        this.verticesPerFrame = this._io.readU4le();
        this.numTexCoords = this._io.readU4le();
        this.numTriangles = this._io.readU4le();
        this.numGlCmds = this._io.readU4le();
        this.numFrames = this._io.readU4le();
        this.ofsSkins = this._io.readU4le();
        this.ofsTexCoords = this._io.readU4le();
        this.ofsTriangles = this._io.readU4le();
        this.ofsFrames = this._io.readU4le();
        this.ofsGlCmds = this._io.readU4le();
        this.ofsEof = this._io.readU4le();
        _dirty = false;
    }

    public void _fetchInstances() {
        frames();
        if (this.frames != null) {
            for (int i = 0; i < this.frames.size(); i++) {
                this.frames.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        glCmds();
        if (this.glCmds != null) {
            this.glCmds._fetchInstances();
        }
        skins();
        if (this.skins != null) {
            for (int i = 0; i < this.skins.size(); i++) {
            }
        }
        texCoords();
        if (this.texCoords != null) {
            for (int i = 0; i < this.texCoords.size(); i++) {
                this.texCoords.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        triangles();
        if (this.triangles != null) {
            for (int i = 0; i < this.triangles.size(); i++) {
                this.triangles.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteFrames = _enabledFrames;
        _shouldWriteGlCmds = _enabledGlCmds;
        _shouldWriteSkins = _enabledSkins;
        _shouldWriteTexCoords = _enabledTexCoords;
        _shouldWriteTriangles = _enabledTriangles;
        this._io.writeBytes(this.magic);
        this._io.writeU4le(this.version);
        this._io.writeU4le(this.skinWidthPx);
        this._io.writeU4le(this.skinHeightPx);
        this._io.writeU4le(this.bytesPerFrame);
        this._io.writeU4le(this.numSkins);
        this._io.writeU4le(this.verticesPerFrame);
        this._io.writeU4le(this.numTexCoords);
        this._io.writeU4le(this.numTriangles);
        this._io.writeU4le(this.numGlCmds);
        this._io.writeU4le(this.numFrames);
        this._io.writeU4le(this.ofsSkins);
        this._io.writeU4le(this.ofsTexCoords);
        this._io.writeU4le(this.ofsTriangles);
        this._io.writeU4le(this.ofsFrames);
        this._io.writeU4le(this.ofsGlCmds);
        this._io.writeU4le(this.ofsEof);
    }

    public void _check() {
        if (this.magic.length != 4)
            throw new ConsistencyError("magic", 4, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 73, 68, 80, 50 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 73, 68, 80, 50 }, this.magic, null, "/seq/0");
        }
        if (!(this.version == 8)) {
            throw new KaitaiStream.ValidationNotEqualError(8, this.version, null, "/seq/1");
        }
        if (_enabledFrames) {
            if (this.frames.size() != numFrames())
                throw new ConsistencyError("frames", numFrames(), this.frames.size());
            for (int i = 0; i < this.frames.size(); i++) {
                if (!Objects.equals(this.frames.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("frames", _root(), this.frames.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.frames.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("frames", this, this.frames.get(((Number) (i)).intValue())._parent());
            }
        }
        if (_enabledGlCmds) {
            if (!Objects.equals(this.glCmds._root(), _root()))
                throw new ConsistencyError("gl_cmds", _root(), this.glCmds._root());
            if (!Objects.equals(this.glCmds._parent(), this))
                throw new ConsistencyError("gl_cmds", this, this.glCmds._parent());
        }
        if (_enabledSkins) {
            if (this.skins.size() != numSkins())
                throw new ConsistencyError("skins", numSkins(), this.skins.size());
            for (int i = 0; i < this.skins.size(); i++) {
                if ((this.skins.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")).length > 64)
                    throw new ConsistencyError("skins", 64, (this.skins.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")).length);
                if (KaitaiStream.byteArrayIndexOf((this.skins.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                    throw new ConsistencyError("skins", -1, KaitaiStream.byteArrayIndexOf((this.skins.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            }
        }
        if (_enabledTexCoords) {
            if (this.texCoords.size() != numTexCoords())
                throw new ConsistencyError("tex_coords", numTexCoords(), this.texCoords.size());
            for (int i = 0; i < this.texCoords.size(); i++) {
                if (!Objects.equals(this.texCoords.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("tex_coords", _root(), this.texCoords.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.texCoords.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("tex_coords", this, this.texCoords.get(((Number) (i)).intValue())._parent());
            }
        }
        if (_enabledTriangles) {
            if (this.triangles.size() != numTriangles())
                throw new ConsistencyError("triangles", numTriangles(), this.triangles.size());
            for (int i = 0; i < this.triangles.size(); i++) {
                if (!Objects.equals(this.triangles.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("triangles", _root(), this.triangles.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.triangles.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("triangles", this, this.triangles.get(((Number) (i)).intValue())._parent());
            }
        }
        _dirty = false;
    }
    public static class CompressedVec extends KaitaiStruct.ReadWrite {
        public static CompressedVec fromFile(String fileName) throws IOException {
            return new CompressedVec(new ByteBufferKaitaiStream(fileName));
        }
        public CompressedVec() {
            this(null, null, null);
        }

        public CompressedVec(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CompressedVec(KaitaiStream _io, Quake2Md2.Vertex _parent) {
            this(_io, _parent, null);
        }

        public CompressedVec(KaitaiStream _io, Quake2Md2.Vertex _parent, Quake2Md2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.xCompressed = this._io.readU1();
            this.yCompressed = this._io.readU1();
            this.zCompressed = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.xCompressed);
            this._io.writeU1(this.yCompressed);
            this._io.writeU1(this.zCompressed);
        }

        public void _check() {
            _dirty = false;
        }
        private Double x;
        public Double x() {
            if (this.x != null)
                return this.x;
            this.x = ((Number) (xCompressed() * _parent()._parent().scale().x() + _parent()._parent().translate().x())).doubleValue();
            return this.x;
        }
        public void _invalidateX() { this.x = null; }
        private Double y;
        public Double y() {
            if (this.y != null)
                return this.y;
            this.y = ((Number) (yCompressed() * _parent()._parent().scale().y() + _parent()._parent().translate().y())).doubleValue();
            return this.y;
        }
        public void _invalidateY() { this.y = null; }
        private Double z;
        public Double z() {
            if (this.z != null)
                return this.z;
            this.z = ((Number) (zCompressed() * _parent()._parent().scale().z() + _parent()._parent().translate().z())).doubleValue();
            return this.z;
        }
        public void _invalidateZ() { this.z = null; }
        private int xCompressed;
        private int yCompressed;
        private int zCompressed;
        private Quake2Md2 _root;
        private Quake2Md2.Vertex _parent;
        public int xCompressed() { return xCompressed; }
        public void setXCompressed(int _v) { _dirty = true; xCompressed = _v; }
        public int yCompressed() { return yCompressed; }
        public void setYCompressed(int _v) { _dirty = true; yCompressed = _v; }
        public int zCompressed() { return zCompressed; }
        public void setZCompressed(int _v) { _dirty = true; zCompressed = _v; }
        public Quake2Md2 _root() { return _root; }
        public void set_root(Quake2Md2 _v) { _dirty = true; _root = _v; }
        public Quake2Md2.Vertex _parent() { return _parent; }
        public void set_parent(Quake2Md2.Vertex _v) { _dirty = true; _parent = _v; }
    }
    public static class Frame extends KaitaiStruct.ReadWrite {
        public static Frame fromFile(String fileName) throws IOException {
            return new Frame(new ByteBufferKaitaiStream(fileName));
        }
        public Frame() {
            this(null, null, null);
        }

        public Frame(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Frame(KaitaiStream _io, Quake2Md2 _parent) {
            this(_io, _parent, null);
        }

        public Frame(KaitaiStream _io, Quake2Md2 _parent, Quake2Md2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.scale = new Vec3f(this._io, this, _root);
            this.scale._read();
            this.translate = new Vec3f(this._io, this, _root);
            this.translate._read();
            this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(16), (byte) 0, false), StandardCharsets.US_ASCII);
            this.vertices = new ArrayList<Vertex>();
            for (int i = 0; i < _root().verticesPerFrame(); i++) {
                Vertex _t_vertices = new Vertex(this._io, this, _root);
                try {
                    _t_vertices._read();
                } finally {
                    this.vertices.add(_t_vertices);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.scale._fetchInstances();
            this.translate._fetchInstances();
            for (int i = 0; i < this.vertices.size(); i++) {
                this.vertices.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.scale._write_Seq(this._io);
            this.translate._write_Seq(this._io);
            this._io.writeBytesLimit((this.name).getBytes(Charset.forName("ASCII")), 16, (byte) 0, (byte) 0);
            for (int i = 0; i < this.vertices.size(); i++) {
                this.vertices.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (!Objects.equals(this.scale._root(), _root()))
                throw new ConsistencyError("scale", _root(), this.scale._root());
            if (!Objects.equals(this.scale._parent(), this))
                throw new ConsistencyError("scale", this, this.scale._parent());
            if (!Objects.equals(this.translate._root(), _root()))
                throw new ConsistencyError("translate", _root(), this.translate._root());
            if (!Objects.equals(this.translate._parent(), this))
                throw new ConsistencyError("translate", this, this.translate._parent());
            if ((this.name).getBytes(Charset.forName("ASCII")).length > 16)
                throw new ConsistencyError("name", 16, (this.name).getBytes(Charset.forName("ASCII")).length);
            if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            if (this.vertices.size() != _root().verticesPerFrame())
                throw new ConsistencyError("vertices", _root().verticesPerFrame(), this.vertices.size());
            for (int i = 0; i < this.vertices.size(); i++) {
                if (!Objects.equals(this.vertices.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("vertices", _root(), this.vertices.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.vertices.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("vertices", this, this.vertices.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private Vec3f scale;
        private Vec3f translate;
        private String name;
        private List<Vertex> vertices;
        private Quake2Md2 _root;
        private Quake2Md2 _parent;
        public Vec3f scale() { return scale; }
        public void setScale(Vec3f _v) { _dirty = true; scale = _v; }
        public Vec3f translate() { return translate; }
        public void setTranslate(Vec3f _v) { _dirty = true; translate = _v; }
        public String name() { return name; }
        public void setName(String _v) { _dirty = true; name = _v; }
        public List<Vertex> vertices() { return vertices; }
        public void setVertices(List<Vertex> _v) { _dirty = true; vertices = _v; }
        public Quake2Md2 _root() { return _root; }
        public void set_root(Quake2Md2 _v) { _dirty = true; _root = _v; }
        public Quake2Md2 _parent() { return _parent; }
        public void set_parent(Quake2Md2 _v) { _dirty = true; _parent = _v; }
    }
    public static class GlCmd extends KaitaiStruct.ReadWrite {
        public static GlCmd fromFile(String fileName) throws IOException {
            return new GlCmd(new ByteBufferKaitaiStream(fileName));
        }
        public GlCmd() {
            this(null, null, null);
        }

        public GlCmd(KaitaiStream _io) {
            this(_io, null, null);
        }

        public GlCmd(KaitaiStream _io, Quake2Md2.GlCmdsList _parent) {
            this(_io, _parent, null);
        }

        public GlCmd(KaitaiStream _io, Quake2Md2.GlCmdsList _parent, Quake2Md2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.cmdNumVertices = this._io.readS4le();
            this.vertices = new ArrayList<GlVertex>();
            for (int i = 0; i < numVertices(); i++) {
                GlVertex _t_vertices = new GlVertex(this._io, this, _root);
                try {
                    _t_vertices._read();
                } finally {
                    this.vertices.add(_t_vertices);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.vertices.size(); i++) {
                this.vertices.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS4le(this.cmdNumVertices);
            for (int i = 0; i < this.vertices.size(); i++) {
                this.vertices.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.vertices.size() != numVertices())
                throw new ConsistencyError("vertices", numVertices(), this.vertices.size());
            for (int i = 0; i < this.vertices.size(); i++) {
                if (!Objects.equals(this.vertices.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("vertices", _root(), this.vertices.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.vertices.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("vertices", this, this.vertices.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private Integer numVertices;
        public Integer numVertices() {
            if (this.numVertices != null)
                return this.numVertices;
            this.numVertices = ((Number) ((cmdNumVertices() < 0 ? -(cmdNumVertices()) : cmdNumVertices()))).intValue();
            return this.numVertices;
        }
        public void _invalidateNumVertices() { this.numVertices = null; }
        private GlPrimitive primitive;
        public GlPrimitive primitive() {
            if (this.primitive != null)
                return this.primitive;
            this.primitive = (cmdNumVertices() < 0 ? Quake2Md2.GlPrimitive.TRIANGLE_FAN : Quake2Md2.GlPrimitive.TRIANGLE_STRIP);
            return this.primitive;
        }
        public void _invalidatePrimitive() { this.primitive = null; }
        private int cmdNumVertices;
        private List<GlVertex> vertices;
        private Quake2Md2 _root;
        private Quake2Md2.GlCmdsList _parent;
        public int cmdNumVertices() { return cmdNumVertices; }
        public void setCmdNumVertices(int _v) { _dirty = true; cmdNumVertices = _v; }
        public List<GlVertex> vertices() { return vertices; }
        public void setVertices(List<GlVertex> _v) { _dirty = true; vertices = _v; }
        public Quake2Md2 _root() { return _root; }
        public void set_root(Quake2Md2 _v) { _dirty = true; _root = _v; }
        public Quake2Md2.GlCmdsList _parent() { return _parent; }
        public void set_parent(Quake2Md2.GlCmdsList _v) { _dirty = true; _parent = _v; }
    }
    public static class GlCmdsList extends KaitaiStruct.ReadWrite {
        public static GlCmdsList fromFile(String fileName) throws IOException {
            return new GlCmdsList(new ByteBufferKaitaiStream(fileName));
        }
        public GlCmdsList() {
            this(null, null, null);
        }

        public GlCmdsList(KaitaiStream _io) {
            this(_io, null, null);
        }

        public GlCmdsList(KaitaiStream _io, Quake2Md2 _parent) {
            this(_io, _parent, null);
        }

        public GlCmdsList(KaitaiStream _io, Quake2Md2 _parent, Quake2Md2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            if (!(_io().isEof())) {
                this.items = new ArrayList<GlCmd>();
                {
                    GlCmd _it;
                    int i = 0;
                    do {
                        GlCmd _t_items = new GlCmd(this._io, this, _root);
                        try {
                            _t_items._read();
                        } finally {
                            _it = _t_items;
                            this.items.add(_it);
                        }
                        i++;
                    } while (!(_it.cmdNumVertices() == 0));
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (!(_io().isEof())) {
                for (int i = 0; i < this.items.size(); i++) {
                    this.items.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            if (!(_io().isEof())) {
                if (this.items.size() == 0)
                    throw new ConsistencyError("items", 0, this.items.size());
                for (int i = 0; i < this.items.size(); i++) {
                    if (!Objects.equals(this.items.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("items", _root(), this.items.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.items.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("items", this, this.items.get(((Number) (i)).intValue())._parent());
                    this.items.get(((Number) (i)).intValue())._write_Seq(this._io);
                    {
                        GlCmd _it = this.items.get(((Number) (i)).intValue());
                        if ((_it.cmdNumVertices() == 0) != (i == this.items.size() - 1))
                            throw new ConsistencyError("items", i == this.items.size() - 1, _it.cmdNumVertices() == 0);
                    }
                }
            }
        }

        public void _check() {
            _dirty = false;
        }
        private List<GlCmd> items;
        private Quake2Md2 _root;
        private Quake2Md2 _parent;
        public List<GlCmd> items() { return items; }
        public void setItems(List<GlCmd> _v) { _dirty = true; items = _v; }
        public Quake2Md2 _root() { return _root; }
        public void set_root(Quake2Md2 _v) { _dirty = true; _root = _v; }
        public Quake2Md2 _parent() { return _parent; }
        public void set_parent(Quake2Md2 _v) { _dirty = true; _parent = _v; }
    }
    public static class GlVertex extends KaitaiStruct.ReadWrite {
        public static GlVertex fromFile(String fileName) throws IOException {
            return new GlVertex(new ByteBufferKaitaiStream(fileName));
        }
        public GlVertex() {
            this(null, null, null);
        }

        public GlVertex(KaitaiStream _io) {
            this(_io, null, null);
        }

        public GlVertex(KaitaiStream _io, Quake2Md2.GlCmd _parent) {
            this(_io, _parent, null);
        }

        public GlVertex(KaitaiStream _io, Quake2Md2.GlCmd _parent, Quake2Md2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.texCoordsNormalized = new ArrayList<Float>();
            for (int i = 0; i < 2; i++) {
                this.texCoordsNormalized.add(this._io.readF4le());
            }
            this.vertexIndex = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.texCoordsNormalized.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.texCoordsNormalized.size(); i++) {
                this._io.writeF4le(this.texCoordsNormalized.get(((Number) (i)).intValue()));
            }
            this._io.writeU4le(this.vertexIndex);
        }

        public void _check() {
            if (this.texCoordsNormalized.size() != 2)
                throw new ConsistencyError("tex_coords_normalized", 2, this.texCoordsNormalized.size());
            for (int i = 0; i < this.texCoordsNormalized.size(); i++) {
            }
            _dirty = false;
        }
        private List<Float> texCoordsNormalized;
        private long vertexIndex;
        private Quake2Md2 _root;
        private Quake2Md2.GlCmd _parent;
        public List<Float> texCoordsNormalized() { return texCoordsNormalized; }
        public void setTexCoordsNormalized(List<Float> _v) { _dirty = true; texCoordsNormalized = _v; }

        /**
         * index to `_root.frames[i].vertices` (for each frame with index `i`)
         */
        public long vertexIndex() { return vertexIndex; }
        public void setVertexIndex(long _v) { _dirty = true; vertexIndex = _v; }
        public Quake2Md2 _root() { return _root; }
        public void set_root(Quake2Md2 _v) { _dirty = true; _root = _v; }
        public Quake2Md2.GlCmd _parent() { return _parent; }
        public void set_parent(Quake2Md2.GlCmd _v) { _dirty = true; _parent = _v; }
    }
    public static class TexPoint extends KaitaiStruct.ReadWrite {
        public static TexPoint fromFile(String fileName) throws IOException {
            return new TexPoint(new ByteBufferKaitaiStream(fileName));
        }
        public TexPoint() {
            this(null, null, null);
        }

        public TexPoint(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TexPoint(KaitaiStream _io, Quake2Md2 _parent) {
            this(_io, _parent, null);
        }

        public TexPoint(KaitaiStream _io, Quake2Md2 _parent, Quake2Md2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.sPx = this._io.readU2le();
            this.tPx = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.sPx);
            this._io.writeU2le(this.tPx);
        }

        public void _check() {
            _dirty = false;
        }
        private Double sNormalized;
        public Double sNormalized() {
            if (this.sNormalized != null)
                return this.sNormalized;
            this.sNormalized = ((Number) ((sPx() + 0.0) / _root().skinWidthPx())).doubleValue();
            return this.sNormalized;
        }
        public void _invalidateSNormalized() { this.sNormalized = null; }
        private Double tNormalized;
        public Double tNormalized() {
            if (this.tNormalized != null)
                return this.tNormalized;
            this.tNormalized = ((Number) ((tPx() + 0.0) / _root().skinHeightPx())).doubleValue();
            return this.tNormalized;
        }
        public void _invalidateTNormalized() { this.tNormalized = null; }
        private int sPx;
        private int tPx;
        private Quake2Md2 _root;
        private Quake2Md2 _parent;
        public int sPx() { return sPx; }
        public void setSPx(int _v) { _dirty = true; sPx = _v; }
        public int tPx() { return tPx; }
        public void setTPx(int _v) { _dirty = true; tPx = _v; }
        public Quake2Md2 _root() { return _root; }
        public void set_root(Quake2Md2 _v) { _dirty = true; _root = _v; }
        public Quake2Md2 _parent() { return _parent; }
        public void set_parent(Quake2Md2 _v) { _dirty = true; _parent = _v; }
    }
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

        public Triangle(KaitaiStream _io, Quake2Md2 _parent) {
            this(_io, _parent, null);
        }

        public Triangle(KaitaiStream _io, Quake2Md2 _parent, Quake2Md2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.vertexIndices = new ArrayList<Integer>();
            for (int i = 0; i < 3; i++) {
                this.vertexIndices.add(this._io.readU2le());
            }
            this.texPointIndices = new ArrayList<Integer>();
            for (int i = 0; i < 3; i++) {
                this.texPointIndices.add(this._io.readU2le());
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.vertexIndices.size(); i++) {
            }
            for (int i = 0; i < this.texPointIndices.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.vertexIndices.size(); i++) {
                this._io.writeU2le(this.vertexIndices.get(((Number) (i)).intValue()));
            }
            for (int i = 0; i < this.texPointIndices.size(); i++) {
                this._io.writeU2le(this.texPointIndices.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (this.vertexIndices.size() != 3)
                throw new ConsistencyError("vertex_indices", 3, this.vertexIndices.size());
            for (int i = 0; i < this.vertexIndices.size(); i++) {
            }
            if (this.texPointIndices.size() != 3)
                throw new ConsistencyError("tex_point_indices", 3, this.texPointIndices.size());
            for (int i = 0; i < this.texPointIndices.size(); i++) {
            }
            _dirty = false;
        }
        private List<Integer> vertexIndices;
        private List<Integer> texPointIndices;
        private Quake2Md2 _root;
        private Quake2Md2 _parent;

        /**
         * indices to `_root.frames[i].vertices` (for each frame with index `i`)
         */
        public List<Integer> vertexIndices() { return vertexIndices; }
        public void setVertexIndices(List<Integer> _v) { _dirty = true; vertexIndices = _v; }

        /**
         * indices to `_root.tex_coords`
         */
        public List<Integer> texPointIndices() { return texPointIndices; }
        public void setTexPointIndices(List<Integer> _v) { _dirty = true; texPointIndices = _v; }
        public Quake2Md2 _root() { return _root; }
        public void set_root(Quake2Md2 _v) { _dirty = true; _root = _v; }
        public Quake2Md2 _parent() { return _parent; }
        public void set_parent(Quake2Md2 _v) { _dirty = true; _parent = _v; }
    }
    public static class Vec3f extends KaitaiStruct.ReadWrite {
        public static Vec3f fromFile(String fileName) throws IOException {
            return new Vec3f(new ByteBufferKaitaiStream(fileName));
        }
        public Vec3f() {
            this(null, null, null);
        }

        public Vec3f(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Vec3f(KaitaiStream _io, Quake2Md2.Frame _parent) {
            this(_io, _parent, null);
        }

        public Vec3f(KaitaiStream _io, Quake2Md2.Frame _parent, Quake2Md2 _root) {
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
        private Quake2Md2 _root;
        private Quake2Md2.Frame _parent;
        public float x() { return x; }
        public void setX(float _v) { _dirty = true; x = _v; }
        public float y() { return y; }
        public void setY(float _v) { _dirty = true; y = _v; }
        public float z() { return z; }
        public void setZ(float _v) { _dirty = true; z = _v; }
        public Quake2Md2 _root() { return _root; }
        public void set_root(Quake2Md2 _v) { _dirty = true; _root = _v; }
        public Quake2Md2.Frame _parent() { return _parent; }
        public void set_parent(Quake2Md2.Frame _v) { _dirty = true; _parent = _v; }
    }
    public static class Vertex extends KaitaiStruct.ReadWrite {
        public static Vertex fromFile(String fileName) throws IOException {
            return new Vertex(new ByteBufferKaitaiStream(fileName));
        }
        public Vertex() {
            this(null, null, null);
        }

        public Vertex(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Vertex(KaitaiStream _io, Quake2Md2.Frame _parent) {
            this(_io, _parent, null);
        }

        public Vertex(KaitaiStream _io, Quake2Md2.Frame _parent, Quake2Md2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.position = new CompressedVec(this._io, this, _root);
            this.position._read();
            this.normalIndex = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.position._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.position._write_Seq(this._io);
            this._io.writeU1(this.normalIndex);
        }

        public void _check() {
            if (!Objects.equals(this.position._root(), _root()))
                throw new ConsistencyError("position", _root(), this.position._root());
            if (!Objects.equals(this.position._parent(), this))
                throw new ConsistencyError("position", this, this.position._parent());
            _dirty = false;
        }
        private List<Double> normal;
        public List<Double> normal() {
            if (this.normal != null)
                return this.normal;
            this.normal = _root().anormsTable().get(((Number) (normalIndex())).intValue());
            return this.normal;
        }
        public void _invalidateNormal() { this.normal = null; }
        private CompressedVec position;
        private int normalIndex;
        private Quake2Md2 _root;
        private Quake2Md2.Frame _parent;
        public CompressedVec position() { return position; }
        public void setPosition(CompressedVec _v) { _dirty = true; position = _v; }
        public int normalIndex() { return normalIndex; }
        public void setNormalIndex(int _v) { _dirty = true; normalIndex = _v; }
        public Quake2Md2 _root() { return _root; }
        public void set_root(Quake2Md2 _v) { _dirty = true; _root = _v; }
        public Quake2Md2.Frame _parent() { return _parent; }
        public void set_parent(Quake2Md2.Frame _v) { _dirty = true; _parent = _v; }
    }
    private List<String> animNames;
    public List<String> animNames() {
        if (this.animNames != null)
            return this.animNames;
        this.animNames = new ArrayList<String>(Arrays.asList("stand", "run", "attack", "pain1", "pain2", "pain3", "jump", "flip", "salute", "taunt", "wave", "point", "crstnd", "crwalk", "crattak", "crpain", "crdeath", "death1", "death2", "death3"));
        return this.animNames;
    }
    public void _invalidateAnimNames() { this.animNames = null; }
    private byte[] animNumFrames;
    public byte[] animNumFrames() {
        if (this.animNumFrames != null)
            return this.animNumFrames;
        this.animNumFrames = new byte[] { 40, 6, 8, 4, 4, 4, 6, 12, 11, 17, 11, 12, 19, 6, 9, 4, 5, 6, 6, 8 };
        return this.animNumFrames;
    }
    public void _invalidateAnimNumFrames() { this.animNumFrames = null; }
    private byte[] animStartIndices;
    public byte[] animStartIndices() {
        if (this.animStartIndices != null)
            return this.animStartIndices;
        this.animStartIndices = new byte[] { 0, 40, 46, 54, 58, 62, 66, 72, 84, 95, 112, 123, -121, -102, -96, -87, -83, -78, -72, -66 };
        return this.animStartIndices;
    }
    public void _invalidateAnimStartIndices() { this.animStartIndices = null; }
    private List<List<Double>> anormsTable;

    /**
     * @see <a href="https://github.com/skullernet/q2pro/blob/f4faabd/src/common/math.c#L80
     * from">Quake anorms.h</a>
     */
    public List<List<Double>> anormsTable() {
        if (this.anormsTable != null)
            return this.anormsTable;
        this.anormsTable = new ArrayList<List<Double>>(Arrays.asList(new ArrayList<Double>(Arrays.asList(-0.525731, 0.000000, 0.850651)), new ArrayList<Double>(Arrays.asList(-0.442863, 0.238856, 0.864188)), new ArrayList<Double>(Arrays.asList(-0.295242, 0.000000, 0.955423)), new ArrayList<Double>(Arrays.asList(-0.309017, 0.500000, 0.809017)), new ArrayList<Double>(Arrays.asList(-0.162460, 0.262866, 0.951056)), new ArrayList<Double>(Arrays.asList(0.000000, 0.000000, 1.000000)), new ArrayList<Double>(Arrays.asList(0.000000, 0.850651, 0.525731)), new ArrayList<Double>(Arrays.asList(-0.147621, 0.716567, 0.681718)), new ArrayList<Double>(Arrays.asList(0.147621, 0.716567, 0.681718)), new ArrayList<Double>(Arrays.asList(0.000000, 0.525731, 0.850651)), new ArrayList<Double>(Arrays.asList(0.309017, 0.500000, 0.809017)), new ArrayList<Double>(Arrays.asList(0.525731, 0.000000, 0.850651)), new ArrayList<Double>(Arrays.asList(0.295242, 0.000000, 0.955423)), new ArrayList<Double>(Arrays.asList(0.442863, 0.238856, 0.864188)), new ArrayList<Double>(Arrays.asList(0.162460, 0.262866, 0.951056)), new ArrayList<Double>(Arrays.asList(-0.681718, 0.147621, 0.716567)), new ArrayList<Double>(Arrays.asList(-0.809017, 0.309017, 0.500000)), new ArrayList<Double>(Arrays.asList(-0.587785, 0.425325, 0.688191)), new ArrayList<Double>(Arrays.asList(-0.850651, 0.525731, 0.000000)), new ArrayList<Double>(Arrays.asList(-0.864188, 0.442863, 0.238856)), new ArrayList<Double>(Arrays.asList(-0.716567, 0.681718, 0.147621)), new ArrayList<Double>(Arrays.asList(-0.688191, 0.587785, 0.425325)), new ArrayList<Double>(Arrays.asList(-0.500000, 0.809017, 0.309017)), new ArrayList<Double>(Arrays.asList(-0.238856, 0.864188, 0.442863)), new ArrayList<Double>(Arrays.asList(-0.425325, 0.688191, 0.587785)), new ArrayList<Double>(Arrays.asList(-0.716567, 0.681718, -0.147621)), new ArrayList<Double>(Arrays.asList(-0.500000, 0.809017, -0.309017)), new ArrayList<Double>(Arrays.asList(-0.525731, 0.850651, 0.000000)), new ArrayList<Double>(Arrays.asList(0.000000, 0.850651, -0.525731)), new ArrayList<Double>(Arrays.asList(-0.238856, 0.864188, -0.442863)), new ArrayList<Double>(Arrays.asList(0.000000, 0.955423, -0.295242)), new ArrayList<Double>(Arrays.asList(-0.262866, 0.951056, -0.162460)), new ArrayList<Double>(Arrays.asList(0.000000, 1.000000, 0.000000)), new ArrayList<Double>(Arrays.asList(0.000000, 0.955423, 0.295242)), new ArrayList<Double>(Arrays.asList(-0.262866, 0.951056, 0.162460)), new ArrayList<Double>(Arrays.asList(0.238856, 0.864188, 0.442863)), new ArrayList<Double>(Arrays.asList(0.262866, 0.951056, 0.162460)), new ArrayList<Double>(Arrays.asList(0.500000, 0.809017, 0.309017)), new ArrayList<Double>(Arrays.asList(0.238856, 0.864188, -0.442863)), new ArrayList<Double>(Arrays.asList(0.262866, 0.951056, -0.162460)), new ArrayList<Double>(Arrays.asList(0.500000, 0.809017, -0.309017)), new ArrayList<Double>(Arrays.asList(0.850651, 0.525731, 0.000000)), new ArrayList<Double>(Arrays.asList(0.716567, 0.681718, 0.147621)), new ArrayList<Double>(Arrays.asList(0.716567, 0.681718, -0.147621)), new ArrayList<Double>(Arrays.asList(0.525731, 0.850651, 0.000000)), new ArrayList<Double>(Arrays.asList(0.425325, 0.688191, 0.587785)), new ArrayList<Double>(Arrays.asList(0.864188, 0.442863, 0.238856)), new ArrayList<Double>(Arrays.asList(0.688191, 0.587785, 0.425325)), new ArrayList<Double>(Arrays.asList(0.809017, 0.309017, 0.500000)), new ArrayList<Double>(Arrays.asList(0.681718, 0.147621, 0.716567)), new ArrayList<Double>(Arrays.asList(0.587785, 0.425325, 0.688191)), new ArrayList<Double>(Arrays.asList(0.955423, 0.295242, 0.000000)), new ArrayList<Double>(Arrays.asList(1.000000, 0.000000, 0.000000)), new ArrayList<Double>(Arrays.asList(0.951056, 0.162460, 0.262866)), new ArrayList<Double>(Arrays.asList(0.850651, -0.525731, 0.000000)), new ArrayList<Double>(Arrays.asList(0.955423, -0.295242, 0.000000)), new ArrayList<Double>(Arrays.asList(0.864188, -0.442863, 0.238856)), new ArrayList<Double>(Arrays.asList(0.951056, -0.162460, 0.262866)), new ArrayList<Double>(Arrays.asList(0.809017, -0.309017, 0.500000)), new ArrayList<Double>(Arrays.asList(0.681718, -0.147621, 0.716567)), new ArrayList<Double>(Arrays.asList(0.850651, 0.000000, 0.525731)), new ArrayList<Double>(Arrays.asList(0.864188, 0.442863, -0.238856)), new ArrayList<Double>(Arrays.asList(0.809017, 0.309017, -0.500000)), new ArrayList<Double>(Arrays.asList(0.951056, 0.162460, -0.262866)), new ArrayList<Double>(Arrays.asList(0.525731, 0.000000, -0.850651)), new ArrayList<Double>(Arrays.asList(0.681718, 0.147621, -0.716567)), new ArrayList<Double>(Arrays.asList(0.681718, -0.147621, -0.716567)), new ArrayList<Double>(Arrays.asList(0.850651, 0.000000, -0.525731)), new ArrayList<Double>(Arrays.asList(0.809017, -0.309017, -0.500000)), new ArrayList<Double>(Arrays.asList(0.864188, -0.442863, -0.238856)), new ArrayList<Double>(Arrays.asList(0.951056, -0.162460, -0.262866)), new ArrayList<Double>(Arrays.asList(0.147621, 0.716567, -0.681718)), new ArrayList<Double>(Arrays.asList(0.309017, 0.500000, -0.809017)), new ArrayList<Double>(Arrays.asList(0.425325, 0.688191, -0.587785)), new ArrayList<Double>(Arrays.asList(0.442863, 0.238856, -0.864188)), new ArrayList<Double>(Arrays.asList(0.587785, 0.425325, -0.688191)), new ArrayList<Double>(Arrays.asList(0.688191, 0.587785, -0.425325)), new ArrayList<Double>(Arrays.asList(-0.147621, 0.716567, -0.681718)), new ArrayList<Double>(Arrays.asList(-0.309017, 0.500000, -0.809017)), new ArrayList<Double>(Arrays.asList(0.000000, 0.525731, -0.850651)), new ArrayList<Double>(Arrays.asList(-0.525731, 0.000000, -0.850651)), new ArrayList<Double>(Arrays.asList(-0.442863, 0.238856, -0.864188)), new ArrayList<Double>(Arrays.asList(-0.295242, 0.000000, -0.955423)), new ArrayList<Double>(Arrays.asList(-0.162460, 0.262866, -0.951056)), new ArrayList<Double>(Arrays.asList(0.000000, 0.000000, -1.000000)), new ArrayList<Double>(Arrays.asList(0.295242, 0.000000, -0.955423)), new ArrayList<Double>(Arrays.asList(0.162460, 0.262866, -0.951056)), new ArrayList<Double>(Arrays.asList(-0.442863, -0.238856, -0.864188)), new ArrayList<Double>(Arrays.asList(-0.309017, -0.500000, -0.809017)), new ArrayList<Double>(Arrays.asList(-0.162460, -0.262866, -0.951056)), new ArrayList<Double>(Arrays.asList(0.000000, -0.850651, -0.525731)), new ArrayList<Double>(Arrays.asList(-0.147621, -0.716567, -0.681718)), new ArrayList<Double>(Arrays.asList(0.147621, -0.716567, -0.681718)), new ArrayList<Double>(Arrays.asList(0.000000, -0.525731, -0.850651)), new ArrayList<Double>(Arrays.asList(0.309017, -0.500000, -0.809017)), new ArrayList<Double>(Arrays.asList(0.442863, -0.238856, -0.864188)), new ArrayList<Double>(Arrays.asList(0.162460, -0.262866, -0.951056)), new ArrayList<Double>(Arrays.asList(0.238856, -0.864188, -0.442863)), new ArrayList<Double>(Arrays.asList(0.500000, -0.809017, -0.309017)), new ArrayList<Double>(Arrays.asList(0.425325, -0.688191, -0.587785)), new ArrayList<Double>(Arrays.asList(0.716567, -0.681718, -0.147621)), new ArrayList<Double>(Arrays.asList(0.688191, -0.587785, -0.425325)), new ArrayList<Double>(Arrays.asList(0.587785, -0.425325, -0.688191)), new ArrayList<Double>(Arrays.asList(0.000000, -0.955423, -0.295242)), new ArrayList<Double>(Arrays.asList(0.000000, -1.000000, 0.000000)), new ArrayList<Double>(Arrays.asList(0.262866, -0.951056, -0.162460)), new ArrayList<Double>(Arrays.asList(0.000000, -0.850651, 0.525731)), new ArrayList<Double>(Arrays.asList(0.000000, -0.955423, 0.295242)), new ArrayList<Double>(Arrays.asList(0.238856, -0.864188, 0.442863)), new ArrayList<Double>(Arrays.asList(0.262866, -0.951056, 0.162460)), new ArrayList<Double>(Arrays.asList(0.500000, -0.809017, 0.309017)), new ArrayList<Double>(Arrays.asList(0.716567, -0.681718, 0.147621)), new ArrayList<Double>(Arrays.asList(0.525731, -0.850651, 0.000000)), new ArrayList<Double>(Arrays.asList(-0.238856, -0.864188, -0.442863)), new ArrayList<Double>(Arrays.asList(-0.500000, -0.809017, -0.309017)), new ArrayList<Double>(Arrays.asList(-0.262866, -0.951056, -0.162460)), new ArrayList<Double>(Arrays.asList(-0.850651, -0.525731, 0.000000)), new ArrayList<Double>(Arrays.asList(-0.716567, -0.681718, -0.147621)), new ArrayList<Double>(Arrays.asList(-0.716567, -0.681718, 0.147621)), new ArrayList<Double>(Arrays.asList(-0.525731, -0.850651, 0.000000)), new ArrayList<Double>(Arrays.asList(-0.500000, -0.809017, 0.309017)), new ArrayList<Double>(Arrays.asList(-0.238856, -0.864188, 0.442863)), new ArrayList<Double>(Arrays.asList(-0.262866, -0.951056, 0.162460)), new ArrayList<Double>(Arrays.asList(-0.864188, -0.442863, 0.238856)), new ArrayList<Double>(Arrays.asList(-0.809017, -0.309017, 0.500000)), new ArrayList<Double>(Arrays.asList(-0.688191, -0.587785, 0.425325)), new ArrayList<Double>(Arrays.asList(-0.681718, -0.147621, 0.716567)), new ArrayList<Double>(Arrays.asList(-0.442863, -0.238856, 0.864188)), new ArrayList<Double>(Arrays.asList(-0.587785, -0.425325, 0.688191)), new ArrayList<Double>(Arrays.asList(-0.309017, -0.500000, 0.809017)), new ArrayList<Double>(Arrays.asList(-0.147621, -0.716567, 0.681718)), new ArrayList<Double>(Arrays.asList(-0.425325, -0.688191, 0.587785)), new ArrayList<Double>(Arrays.asList(-0.162460, -0.262866, 0.951056)), new ArrayList<Double>(Arrays.asList(0.442863, -0.238856, 0.864188)), new ArrayList<Double>(Arrays.asList(0.162460, -0.262866, 0.951056)), new ArrayList<Double>(Arrays.asList(0.309017, -0.500000, 0.809017)), new ArrayList<Double>(Arrays.asList(0.147621, -0.716567, 0.681718)), new ArrayList<Double>(Arrays.asList(0.000000, -0.525731, 0.850651)), new ArrayList<Double>(Arrays.asList(0.425325, -0.688191, 0.587785)), new ArrayList<Double>(Arrays.asList(0.587785, -0.425325, 0.688191)), new ArrayList<Double>(Arrays.asList(0.688191, -0.587785, 0.425325)), new ArrayList<Double>(Arrays.asList(-0.955423, 0.295242, 0.000000)), new ArrayList<Double>(Arrays.asList(-0.951056, 0.162460, 0.262866)), new ArrayList<Double>(Arrays.asList(-1.000000, 0.000000, 0.000000)), new ArrayList<Double>(Arrays.asList(-0.850651, 0.000000, 0.525731)), new ArrayList<Double>(Arrays.asList(-0.955423, -0.295242, 0.000000)), new ArrayList<Double>(Arrays.asList(-0.951056, -0.162460, 0.262866)), new ArrayList<Double>(Arrays.asList(-0.864188, 0.442863, -0.238856)), new ArrayList<Double>(Arrays.asList(-0.951056, 0.162460, -0.262866)), new ArrayList<Double>(Arrays.asList(-0.809017, 0.309017, -0.500000)), new ArrayList<Double>(Arrays.asList(-0.864188, -0.442863, -0.238856)), new ArrayList<Double>(Arrays.asList(-0.951056, -0.162460, -0.262866)), new ArrayList<Double>(Arrays.asList(-0.809017, -0.309017, -0.500000)), new ArrayList<Double>(Arrays.asList(-0.681718, 0.147621, -0.716567)), new ArrayList<Double>(Arrays.asList(-0.681718, -0.147621, -0.716567)), new ArrayList<Double>(Arrays.asList(-0.850651, 0.000000, -0.525731)), new ArrayList<Double>(Arrays.asList(-0.688191, 0.587785, -0.425325)), new ArrayList<Double>(Arrays.asList(-0.587785, 0.425325, -0.688191)), new ArrayList<Double>(Arrays.asList(-0.425325, 0.688191, -0.587785)), new ArrayList<Double>(Arrays.asList(-0.425325, -0.688191, -0.587785)), new ArrayList<Double>(Arrays.asList(-0.587785, -0.425325, -0.688191)), new ArrayList<Double>(Arrays.asList(-0.688191, -0.587785, -0.425325))));
        return this.anormsTable;
    }
    public void _invalidateAnormsTable() { this.anormsTable = null; }
    private List<Frame> frames;
    private boolean _shouldWriteFrames = false;
    private boolean _enabledFrames = true;
    public List<Frame> frames() {
        if (_shouldWriteFrames)
            _writeFrames();
        if (this.frames != null)
            return this.frames;
        if (!_enabledFrames)
            return null;
        long _pos = this._io.pos();
        this._io.seek(ofsFrames());
        this._raw_frames = new ArrayList<byte[]>();
        this.frames = new ArrayList<Frame>();
        for (int i = 0; i < numFrames(); i++) {
            this._raw_frames.add(this._io.readBytes(bytesPerFrame()));
            KaitaiStream _io__raw_frames = new ByteBufferKaitaiStream(this._raw_frames.get(i));
            Frame _t_frames = new Frame(_io__raw_frames, this, _root);
            try {
                _t_frames._read();
            } finally {
                this.frames.add(_t_frames);
            }
        }
        this._io.seek(_pos);
        return this.frames;
    }
    public void setFrames(List<Frame> _v) { _dirty = true; frames = _v; }
    public void setFrames_Enabled(boolean _v) { _dirty = true; _enabledFrames = _v; }

    private void _writeFrames() {
        _shouldWriteFrames = false;
        long _pos = this._io.pos();
        this._io.seek(ofsFrames());
        this._raw_frames = new ArrayList<byte[]>();
        for (int i = 0; i < this.frames.size(); i++) {
            final KaitaiStream _io__raw_frames = new ByteBufferKaitaiStream(bytesPerFrame());
            this._io.addChildStream(_io__raw_frames);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (bytesPerFrame()));
                final Quake2Md2 _this = this;
                final int _i = i;
                _io__raw_frames.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_frames.add(_io__raw_frames.toByteArray());
                        if (_this._raw_frames.get(((Number) (_i)).intValue()).length != bytesPerFrame())
                            throw new ConsistencyError("raw(frames)", bytesPerFrame(), _this._raw_frames.get(((Number) (_i)).intValue()).length);
                        parent.writeBytes(_this._raw_frames.get(((Number) (_i)).intValue()));
                    }
                });
            }
            this.frames.get(((Number) (i)).intValue())._write_Seq(_io__raw_frames);
        }
        this._io.seek(_pos);
    }
    private GlCmdsList glCmds;
    private boolean _shouldWriteGlCmds = false;
    private boolean _enabledGlCmds = true;
    public GlCmdsList glCmds() {
        if (_shouldWriteGlCmds)
            _writeGlCmds();
        if (this.glCmds != null)
            return this.glCmds;
        if (!_enabledGlCmds)
            return null;
        long _pos = this._io.pos();
        this._io.seek(ofsGlCmds());
        this._raw_glCmds = this._io.readBytes(4 * numGlCmds());
        KaitaiStream _io__raw_glCmds = new ByteBufferKaitaiStream(this._raw_glCmds);
        this.glCmds = new GlCmdsList(_io__raw_glCmds, this, _root);
        this.glCmds._read();
        this._io.seek(_pos);
        return this.glCmds;
    }
    public void setGlCmds(GlCmdsList _v) { _dirty = true; glCmds = _v; }
    public void setGlCmds_Enabled(boolean _v) { _dirty = true; _enabledGlCmds = _v; }

    private void _writeGlCmds() {
        _shouldWriteGlCmds = false;
        long _pos = this._io.pos();
        this._io.seek(ofsGlCmds());
        final KaitaiStream _io__raw_glCmds = new ByteBufferKaitaiStream(4 * numGlCmds());
        this._io.addChildStream(_io__raw_glCmds);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (4 * numGlCmds()));
            final Quake2Md2 _this = this;
            _io__raw_glCmds.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_glCmds = _io__raw_glCmds.toByteArray();
                    if (_this._raw_glCmds.length != 4 * numGlCmds())
                        throw new ConsistencyError("raw(gl_cmds)", 4 * numGlCmds(), _this._raw_glCmds.length);
                    parent.writeBytes(_this._raw_glCmds);
                }
            });
        }
        this.glCmds._write_Seq(_io__raw_glCmds);
        this._io.seek(_pos);
    }
    private List<String> skins;
    private boolean _shouldWriteSkins = false;
    private boolean _enabledSkins = true;
    public List<String> skins() {
        if (_shouldWriteSkins)
            _writeSkins();
        if (this.skins != null)
            return this.skins;
        if (!_enabledSkins)
            return null;
        long _pos = this._io.pos();
        this._io.seek(ofsSkins());
        this.skins = new ArrayList<String>();
        for (int i = 0; i < numSkins(); i++) {
            this.skins.add(new String(KaitaiStream.bytesTerminate(this._io.readBytes(64), (byte) 0, false), StandardCharsets.US_ASCII));
        }
        this._io.seek(_pos);
        return this.skins;
    }
    public void setSkins(List<String> _v) { _dirty = true; skins = _v; }
    public void setSkins_Enabled(boolean _v) { _dirty = true; _enabledSkins = _v; }

    private void _writeSkins() {
        _shouldWriteSkins = false;
        long _pos = this._io.pos();
        this._io.seek(ofsSkins());
        for (int i = 0; i < this.skins.size(); i++) {
            this._io.writeBytesLimit((this.skins.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")), 64, (byte) 0, (byte) 0);
        }
        this._io.seek(_pos);
    }
    private List<TexPoint> texCoords;
    private boolean _shouldWriteTexCoords = false;
    private boolean _enabledTexCoords = true;
    public List<TexPoint> texCoords() {
        if (_shouldWriteTexCoords)
            _writeTexCoords();
        if (this.texCoords != null)
            return this.texCoords;
        if (!_enabledTexCoords)
            return null;
        long _pos = this._io.pos();
        this._io.seek(ofsTexCoords());
        this.texCoords = new ArrayList<TexPoint>();
        for (int i = 0; i < numTexCoords(); i++) {
            TexPoint _t_texCoords = new TexPoint(this._io, this, _root);
            try {
                _t_texCoords._read();
            } finally {
                this.texCoords.add(_t_texCoords);
            }
        }
        this._io.seek(_pos);
        return this.texCoords;
    }
    public void setTexCoords(List<TexPoint> _v) { _dirty = true; texCoords = _v; }
    public void setTexCoords_Enabled(boolean _v) { _dirty = true; _enabledTexCoords = _v; }

    private void _writeTexCoords() {
        _shouldWriteTexCoords = false;
        long _pos = this._io.pos();
        this._io.seek(ofsTexCoords());
        for (int i = 0; i < this.texCoords.size(); i++) {
            this.texCoords.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.seek(_pos);
    }
    private List<Triangle> triangles;
    private boolean _shouldWriteTriangles = false;
    private boolean _enabledTriangles = true;
    public List<Triangle> triangles() {
        if (_shouldWriteTriangles)
            _writeTriangles();
        if (this.triangles != null)
            return this.triangles;
        if (!_enabledTriangles)
            return null;
        long _pos = this._io.pos();
        this._io.seek(ofsTriangles());
        this.triangles = new ArrayList<Triangle>();
        for (int i = 0; i < numTriangles(); i++) {
            Triangle _t_triangles = new Triangle(this._io, this, _root);
            try {
                _t_triangles._read();
            } finally {
                this.triangles.add(_t_triangles);
            }
        }
        this._io.seek(_pos);
        return this.triangles;
    }
    public void setTriangles(List<Triangle> _v) { _dirty = true; triangles = _v; }
    public void setTriangles_Enabled(boolean _v) { _dirty = true; _enabledTriangles = _v; }

    private void _writeTriangles() {
        _shouldWriteTriangles = false;
        long _pos = this._io.pos();
        this._io.seek(ofsTriangles());
        for (int i = 0; i < this.triangles.size(); i++) {
            this.triangles.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.seek(_pos);
    }
    private byte[] magic;
    private long version;
    private long skinWidthPx;
    private long skinHeightPx;
    private long bytesPerFrame;
    private long numSkins;
    private long verticesPerFrame;
    private long numTexCoords;
    private long numTriangles;
    private long numGlCmds;
    private long numFrames;
    private long ofsSkins;
    private long ofsTexCoords;
    private long ofsTriangles;
    private long ofsFrames;
    private long ofsGlCmds;
    private long ofsEof;
    private Quake2Md2 _root;
    private KaitaiStruct.ReadWrite _parent;
    private List<byte[]> _raw_frames;
    private byte[] _raw_glCmds;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public long version() { return version; }
    public void setVersion(long _v) { _dirty = true; version = _v; }
    public long skinWidthPx() { return skinWidthPx; }
    public void setSkinWidthPx(long _v) { _dirty = true; skinWidthPx = _v; }
    public long skinHeightPx() { return skinHeightPx; }
    public void setSkinHeightPx(long _v) { _dirty = true; skinHeightPx = _v; }
    public long bytesPerFrame() { return bytesPerFrame; }
    public void setBytesPerFrame(long _v) { _dirty = true; bytesPerFrame = _v; }
    public long numSkins() { return numSkins; }
    public void setNumSkins(long _v) { _dirty = true; numSkins = _v; }
    public long verticesPerFrame() { return verticesPerFrame; }
    public void setVerticesPerFrame(long _v) { _dirty = true; verticesPerFrame = _v; }
    public long numTexCoords() { return numTexCoords; }
    public void setNumTexCoords(long _v) { _dirty = true; numTexCoords = _v; }
    public long numTriangles() { return numTriangles; }
    public void setNumTriangles(long _v) { _dirty = true; numTriangles = _v; }
    public long numGlCmds() { return numGlCmds; }
    public void setNumGlCmds(long _v) { _dirty = true; numGlCmds = _v; }
    public long numFrames() { return numFrames; }
    public void setNumFrames(long _v) { _dirty = true; numFrames = _v; }
    public long ofsSkins() { return ofsSkins; }
    public void setOfsSkins(long _v) { _dirty = true; ofsSkins = _v; }
    public long ofsTexCoords() { return ofsTexCoords; }
    public void setOfsTexCoords(long _v) { _dirty = true; ofsTexCoords = _v; }
    public long ofsTriangles() { return ofsTriangles; }
    public void setOfsTriangles(long _v) { _dirty = true; ofsTriangles = _v; }
    public long ofsFrames() { return ofsFrames; }
    public void setOfsFrames(long _v) { _dirty = true; ofsFrames = _v; }
    public long ofsGlCmds() { return ofsGlCmds; }
    public void setOfsGlCmds(long _v) { _dirty = true; ofsGlCmds = _v; }
    public long ofsEof() { return ofsEof; }
    public void setOfsEof(long _v) { _dirty = true; ofsEof = _v; }
    public Quake2Md2 _root() { return _root; }
    public void set_root(Quake2Md2 _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public List<byte[]> _raw_frames() { return _raw_frames; }
    public void set_raw_Frames(List<byte[]> _v) { _dirty = true; _raw_frames = _v; }
    public byte[] _raw_glCmds() { return _raw_glCmds; }
    public void set_raw_GlCmds(byte[] _v) { _dirty = true; _raw_glCmds = _v; }
}
