// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
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
public class Quake2Md2 extends KaitaiStruct {
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

    public Quake2Md2(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Quake2Md2(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Quake2Md2(KaitaiStream _io, KaitaiStruct _parent, Quake2Md2 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
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
    public static class CompressedVec extends KaitaiStruct {
        public static CompressedVec fromFile(String fileName) throws IOException {
            return new CompressedVec(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.xCompressed = this._io.readU1();
            this.yCompressed = this._io.readU1();
            this.zCompressed = this._io.readU1();
        }

        public void _fetchInstances() {
        }
        private Double x;
        public Double x() {
            if (this.x != null)
                return this.x;
            this.x = ((Number) (xCompressed() * _parent()._parent().scale().x() + _parent()._parent().translate().x())).doubleValue();
            return this.x;
        }
        private Double y;
        public Double y() {
            if (this.y != null)
                return this.y;
            this.y = ((Number) (yCompressed() * _parent()._parent().scale().y() + _parent()._parent().translate().y())).doubleValue();
            return this.y;
        }
        private Double z;
        public Double z() {
            if (this.z != null)
                return this.z;
            this.z = ((Number) (zCompressed() * _parent()._parent().scale().z() + _parent()._parent().translate().z())).doubleValue();
            return this.z;
        }
        private int xCompressed;
        private int yCompressed;
        private int zCompressed;
        private Quake2Md2 _root;
        private Quake2Md2.Vertex _parent;
        public int xCompressed() { return xCompressed; }
        public int yCompressed() { return yCompressed; }
        public int zCompressed() { return zCompressed; }
        public Quake2Md2 _root() { return _root; }
        public Quake2Md2.Vertex _parent() { return _parent; }
    }
    public static class Frame extends KaitaiStruct {
        public static Frame fromFile(String fileName) throws IOException {
            return new Frame(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.scale = new Vec3f(this._io, this, _root);
            this.translate = new Vec3f(this._io, this, _root);
            this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(16), (byte) 0, false), StandardCharsets.US_ASCII);
            this.vertices = new ArrayList<Vertex>();
            for (int i = 0; i < _root().verticesPerFrame(); i++) {
                this.vertices.add(new Vertex(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            this.scale._fetchInstances();
            this.translate._fetchInstances();
            for (int i = 0; i < this.vertices.size(); i++) {
                this.vertices.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private Vec3f scale;
        private Vec3f translate;
        private String name;
        private List<Vertex> vertices;
        private Quake2Md2 _root;
        private Quake2Md2 _parent;
        public Vec3f scale() { return scale; }
        public Vec3f translate() { return translate; }
        public String name() { return name; }
        public List<Vertex> vertices() { return vertices; }
        public Quake2Md2 _root() { return _root; }
        public Quake2Md2 _parent() { return _parent; }
    }
    public static class GlCmd extends KaitaiStruct {
        public static GlCmd fromFile(String fileName) throws IOException {
            return new GlCmd(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.cmdNumVertices = this._io.readS4le();
            this.vertices = new ArrayList<GlVertex>();
            for (int i = 0; i < numVertices(); i++) {
                this.vertices.add(new GlVertex(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.vertices.size(); i++) {
                this.vertices.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private Integer numVertices;
        public Integer numVertices() {
            if (this.numVertices != null)
                return this.numVertices;
            this.numVertices = ((Number) ((cmdNumVertices() < 0 ? -(cmdNumVertices()) : cmdNumVertices()))).intValue();
            return this.numVertices;
        }
        private GlPrimitive primitive;
        public GlPrimitive primitive() {
            if (this.primitive != null)
                return this.primitive;
            this.primitive = (cmdNumVertices() < 0 ? Quake2Md2.GlPrimitive.TRIANGLE_FAN : Quake2Md2.GlPrimitive.TRIANGLE_STRIP);
            return this.primitive;
        }
        private int cmdNumVertices;
        private List<GlVertex> vertices;
        private Quake2Md2 _root;
        private Quake2Md2.GlCmdsList _parent;
        public int cmdNumVertices() { return cmdNumVertices; }
        public List<GlVertex> vertices() { return vertices; }
        public Quake2Md2 _root() { return _root; }
        public Quake2Md2.GlCmdsList _parent() { return _parent; }
    }
    public static class GlCmdsList extends KaitaiStruct {
        public static GlCmdsList fromFile(String fileName) throws IOException {
            return new GlCmdsList(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            if (!(_io().isEof())) {
                this.items = new ArrayList<GlCmd>();
                {
                    GlCmd _it;
                    int i = 0;
                    do {
                        _it = new GlCmd(this._io, this, _root);
                        this.items.add(_it);
                        i++;
                    } while (!(_it.cmdNumVertices() == 0));
                }
            }
        }

        public void _fetchInstances() {
            if (!(_io().isEof())) {
                for (int i = 0; i < this.items.size(); i++) {
                    this.items.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
        }
        private List<GlCmd> items;
        private Quake2Md2 _root;
        private Quake2Md2 _parent;
        public List<GlCmd> items() { return items; }
        public Quake2Md2 _root() { return _root; }
        public Quake2Md2 _parent() { return _parent; }
    }
    public static class GlVertex extends KaitaiStruct {
        public static GlVertex fromFile(String fileName) throws IOException {
            return new GlVertex(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.texCoordsNormalized = new ArrayList<Float>();
            for (int i = 0; i < 2; i++) {
                this.texCoordsNormalized.add(this._io.readF4le());
            }
            this.vertexIndex = this._io.readU4le();
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.texCoordsNormalized.size(); i++) {
            }
        }
        private List<Float> texCoordsNormalized;
        private long vertexIndex;
        private Quake2Md2 _root;
        private Quake2Md2.GlCmd _parent;
        public List<Float> texCoordsNormalized() { return texCoordsNormalized; }

        /**
         * index to `_root.frames[i].vertices` (for each frame with index `i`)
         */
        public long vertexIndex() { return vertexIndex; }
        public Quake2Md2 _root() { return _root; }
        public Quake2Md2.GlCmd _parent() { return _parent; }
    }
    public static class TexPoint extends KaitaiStruct {
        public static TexPoint fromFile(String fileName) throws IOException {
            return new TexPoint(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.sPx = this._io.readU2le();
            this.tPx = this._io.readU2le();
        }

        public void _fetchInstances() {
        }
        private Double sNormalized;
        public Double sNormalized() {
            if (this.sNormalized != null)
                return this.sNormalized;
            this.sNormalized = ((Number) ((sPx() + 0.0) / _root().skinWidthPx())).doubleValue();
            return this.sNormalized;
        }
        private Double tNormalized;
        public Double tNormalized() {
            if (this.tNormalized != null)
                return this.tNormalized;
            this.tNormalized = ((Number) ((tPx() + 0.0) / _root().skinHeightPx())).doubleValue();
            return this.tNormalized;
        }
        private int sPx;
        private int tPx;
        private Quake2Md2 _root;
        private Quake2Md2 _parent;
        public int sPx() { return sPx; }
        public int tPx() { return tPx; }
        public Quake2Md2 _root() { return _root; }
        public Quake2Md2 _parent() { return _parent; }
    }
    public static class Triangle extends KaitaiStruct {
        public static Triangle fromFile(String fileName) throws IOException {
            return new Triangle(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.vertexIndices = new ArrayList<Integer>();
            for (int i = 0; i < 3; i++) {
                this.vertexIndices.add(this._io.readU2le());
            }
            this.texPointIndices = new ArrayList<Integer>();
            for (int i = 0; i < 3; i++) {
                this.texPointIndices.add(this._io.readU2le());
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.vertexIndices.size(); i++) {
            }
            for (int i = 0; i < this.texPointIndices.size(); i++) {
            }
        }
        private List<Integer> vertexIndices;
        private List<Integer> texPointIndices;
        private Quake2Md2 _root;
        private Quake2Md2 _parent;

        /**
         * indices to `_root.frames[i].vertices` (for each frame with index `i`)
         */
        public List<Integer> vertexIndices() { return vertexIndices; }

        /**
         * indices to `_root.tex_coords`
         */
        public List<Integer> texPointIndices() { return texPointIndices; }
        public Quake2Md2 _root() { return _root; }
        public Quake2Md2 _parent() { return _parent; }
    }
    public static class Vec3f extends KaitaiStruct {
        public static Vec3f fromFile(String fileName) throws IOException {
            return new Vec3f(new ByteBufferKaitaiStream(fileName));
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
        private Quake2Md2 _root;
        private Quake2Md2.Frame _parent;
        public float x() { return x; }
        public float y() { return y; }
        public float z() { return z; }
        public Quake2Md2 _root() { return _root; }
        public Quake2Md2.Frame _parent() { return _parent; }
    }
    public static class Vertex extends KaitaiStruct {
        public static Vertex fromFile(String fileName) throws IOException {
            return new Vertex(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.position = new CompressedVec(this._io, this, _root);
            this.normalIndex = this._io.readU1();
        }

        public void _fetchInstances() {
            this.position._fetchInstances();
        }
        private List<Double> normal;
        public List<Double> normal() {
            if (this.normal != null)
                return this.normal;
            this.normal = _root().anormsTable().get(((Number) (normalIndex())).intValue());
            return this.normal;
        }
        private CompressedVec position;
        private int normalIndex;
        private Quake2Md2 _root;
        private Quake2Md2.Frame _parent;
        public CompressedVec position() { return position; }
        public int normalIndex() { return normalIndex; }
        public Quake2Md2 _root() { return _root; }
        public Quake2Md2.Frame _parent() { return _parent; }
    }
    private List<String> animNames;
    public List<String> animNames() {
        if (this.animNames != null)
            return this.animNames;
        this.animNames = new ArrayList<String>(Arrays.asList("stand", "run", "attack", "pain1", "pain2", "pain3", "jump", "flip", "salute", "taunt", "wave", "point", "crstnd", "crwalk", "crattak", "crpain", "crdeath", "death1", "death2", "death3"));
        return this.animNames;
    }
    private byte[] animNumFrames;
    public byte[] animNumFrames() {
        if (this.animNumFrames != null)
            return this.animNumFrames;
        this.animNumFrames = new byte[] { 40, 6, 8, 4, 4, 4, 6, 12, 11, 17, 11, 12, 19, 6, 9, 4, 5, 6, 6, 8 };
        return this.animNumFrames;
    }
    private byte[] animStartIndices;
    public byte[] animStartIndices() {
        if (this.animStartIndices != null)
            return this.animStartIndices;
        this.animStartIndices = new byte[] { 0, 40, 46, 54, 58, 62, 66, 72, 84, 95, 112, 123, -121, -102, -96, -87, -83, -78, -72, -66 };
        return this.animStartIndices;
    }
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
    private List<Frame> frames;
    public List<Frame> frames() {
        if (this.frames != null)
            return this.frames;
        long _pos = this._io.pos();
        this._io.seek(ofsFrames());
        this.frames = new ArrayList<Frame>();
        for (int i = 0; i < numFrames(); i++) {
            KaitaiStream _io_frames = this._io.substream(bytesPerFrame());
            this.frames.add(new Frame(_io_frames, this, _root));
        }
        this._io.seek(_pos);
        return this.frames;
    }
    private GlCmdsList glCmds;
    public GlCmdsList glCmds() {
        if (this.glCmds != null)
            return this.glCmds;
        long _pos = this._io.pos();
        this._io.seek(ofsGlCmds());
        KaitaiStream _io_glCmds = this._io.substream(4 * numGlCmds());
        this.glCmds = new GlCmdsList(_io_glCmds, this, _root);
        this._io.seek(_pos);
        return this.glCmds;
    }
    private List<String> skins;
    public List<String> skins() {
        if (this.skins != null)
            return this.skins;
        long _pos = this._io.pos();
        this._io.seek(ofsSkins());
        this.skins = new ArrayList<String>();
        for (int i = 0; i < numSkins(); i++) {
            this.skins.add(new String(KaitaiStream.bytesTerminate(this._io.readBytes(64), (byte) 0, false), StandardCharsets.US_ASCII));
        }
        this._io.seek(_pos);
        return this.skins;
    }
    private List<TexPoint> texCoords;
    public List<TexPoint> texCoords() {
        if (this.texCoords != null)
            return this.texCoords;
        long _pos = this._io.pos();
        this._io.seek(ofsTexCoords());
        this.texCoords = new ArrayList<TexPoint>();
        for (int i = 0; i < numTexCoords(); i++) {
            this.texCoords.add(new TexPoint(this._io, this, _root));
        }
        this._io.seek(_pos);
        return this.texCoords;
    }
    private List<Triangle> triangles;
    public List<Triangle> triangles() {
        if (this.triangles != null)
            return this.triangles;
        long _pos = this._io.pos();
        this._io.seek(ofsTriangles());
        this.triangles = new ArrayList<Triangle>();
        for (int i = 0; i < numTriangles(); i++) {
            this.triangles.add(new Triangle(this._io, this, _root));
        }
        this._io.seek(_pos);
        return this.triangles;
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
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }
    public long version() { return version; }
    public long skinWidthPx() { return skinWidthPx; }
    public long skinHeightPx() { return skinHeightPx; }
    public long bytesPerFrame() { return bytesPerFrame; }
    public long numSkins() { return numSkins; }
    public long verticesPerFrame() { return verticesPerFrame; }
    public long numTexCoords() { return numTexCoords; }
    public long numTriangles() { return numTriangles; }
    public long numGlCmds() { return numGlCmds; }
    public long numFrames() { return numFrames; }
    public long ofsSkins() { return ofsSkins; }
    public long ofsTexCoords() { return ofsTexCoords; }
    public long ofsTriangles() { return ofsTriangles; }
    public long ofsFrames() { return ofsFrames; }
    public long ofsGlCmds() { return ofsGlCmds; }
    public long ofsEof() { return ofsEof; }
    public Quake2Md2 _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
