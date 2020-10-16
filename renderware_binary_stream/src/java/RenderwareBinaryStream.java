// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Arrays;


/**
 * @see <a href="https://www.gtamodding.com/wiki/RenderWare_binary_stream_file">Source</a>
 */
public class RenderwareBinaryStream extends KaitaiStruct {
    public static RenderwareBinaryStream fromFile(String fileName) throws IOException {
        return new RenderwareBinaryStream(new ByteBufferKaitaiStream(fileName));
    }

    public enum Sections {
        STRUCT(1),
        STRING(2),
        EXTENSION(3),
        CAMERA(5),
        TEXTURE(6),
        MATERIAL(7),
        MATERIAL_LIST(8),
        ATOMIC_SECTION(9),
        PLANE_SECTION(10),
        WORLD(11),
        SPLINE(12),
        MATRIX(13),
        FRAME_LIST(14),
        GEOMETRY(15),
        CLUMP(16),
        LIGHT(18),
        UNICODE_STRING(19),
        ATOMIC(20),
        TEXTURE_NATIVE(21),
        TEXTURE_DICTIONARY(22),
        ANIMATION_DATABASE(23),
        IMAGE(24),
        SKIN_ANIMATION(25),
        GEOMETRY_LIST(26),
        ANIM_ANIMATION(27),
        TEAM(28),
        CROWD(29),
        DELTA_MORPH_ANIMATION(30),
        RIGHT_TO_RENDER(31),
        MULTITEXTURE_EFFECT_NATIVE(32),
        MULTITEXTURE_EFFECT_DICTIONARY(33),
        TEAM_DICTIONARY(34),
        PLATFORM_INDEPENDENT_TEXTURE_DICTIONARY(35),
        TABLE_OF_CONTENTS(36),
        PARTICLE_STANDARD_GLOBAL_DATA(37),
        ALTPIPE(38),
        PLATFORM_INDEPENDENT_PEDS(39),
        PATCH_MESH(40),
        CHUNK_GROUP_START(41),
        CHUNK_GROUP_END(42),
        UV_ANIMATION_DICTIONARY(43),
        COLL_TREE(44),
        METRICS_PLG(257),
        SPLINE_PLG(258),
        STEREO_PLG(259),
        VRML_PLG(260),
        MORPH_PLG(261),
        PVS_PLG(262),
        MEMORY_LEAK_PLG(263),
        ANIMATION_PLG(264),
        GLOSS_PLG(265),
        LOGO_PLG(266),
        MEMORY_INFO_PLG(267),
        RANDOM_PLG(268),
        PNG_IMAGE_PLG(269),
        BONE_PLG(270),
        VRML_ANIM_PLG(271),
        SKY_MIPMAP_VAL(272),
        MRM_PLG(273),
        LOD_ATOMIC_PLG(274),
        ME_PLG(275),
        LIGHTMAP_PLG(276),
        REFINE_PLG(277),
        SKIN_PLG(278),
        LABEL_PLG(279),
        PARTICLES_PLG(280),
        GEOMTX_PLG(281),
        SYNTH_CORE_PLG(282),
        STQPP_PLG(283),
        PART_PP_PLG(284),
        COLLISION_PLG(285),
        HANIM_PLG(286),
        USER_DATA_PLG(287),
        MATERIAL_EFFECTS_PLG(288),
        PARTICLE_SYSTEM_PLG(289),
        DELTA_MORPH_PLG(290),
        PATCH_PLG(291),
        TEAM_PLG(292),
        CROWD_PP_PLG(293),
        MIP_SPLIT_PLG(294),
        ANISOTROPY_PLG(295),
        GCN_MATERIAL_PLG(297),
        GEOMETRIC_PVS_PLG(298),
        XBOX_MATERIAL_PLG(299),
        MULTI_TEXTURE_PLG(300),
        CHAIN_PLG(301),
        TOON_PLG(302),
        PTANK_PLG(303),
        PARTICLE_STANDARD_PLG(304),
        PDS_PLG(305),
        PRTADV_PLG(306),
        NORMAL_MAP_PLG(307),
        ADC_PLG(308),
        UV_ANIMATION_PLG(309),
        CHARACTER_SET_PLG(384),
        NOHS_WORLD_PLG(385),
        IMPORT_UTIL_PLG(386),
        SLERP_PLG(387),
        OPTIM_PLG(388),
        TL_WORLD_PLG(389),
        DATABASE_PLG(390),
        RAYTRACE_PLG(391),
        RAY_PLG(392),
        LIBRARY_PLG(393),
        PLG_2D(400),
        TILE_RENDER_PLG(401),
        JPEG_IMAGE_PLG(402),
        TGA_IMAGE_PLG(403),
        GIF_IMAGE_PLG(404),
        QUAT_PLG(405),
        SPLINE_PVS_PLG(406),
        MIPMAP_PLG(407),
        MIPMAPK_PLG(408),
        FONT_2D(409),
        INTERSECTION_PLG(410),
        TIFF_IMAGE_PLG(411),
        PICK_PLG(412),
        BMP_IMAGE_PLG(413),
        RAS_IMAGE_PLG(414),
        SKIN_FX_PLG(415),
        VCAT_PLG(416),
        PATH_2D(417),
        BRUSH_2D(418),
        OBJECT_2D(419),
        SHAPE_2D(420),
        SCENE_2D(421),
        PICK_REGION_2D(422),
        OBJECT_STRING_2D(423),
        ANIMATION_PLG_2D(424),
        ANIMATION_2D(425),
        KEYFRAME_2D(432),
        MAESTRO_2D(433),
        BARYCENTRIC(434),
        PLATFORM_INDEPENDENT_TEXTURE_DICTIONARY_TK(435),
        TOC_TK(436),
        TPL_TK(437),
        ALTPIPE_TK(438),
        ANIMATION_TK(439),
        SKIN_SPLIT_TOOKIT(440),
        COMPRESSED_KEY_TK(441),
        GEOMETRY_CONDITIONING_PLG(442),
        WING_PLG(443),
        GENERIC_PIPELINE_TK(444),
        LIGHTMAP_CONVERSION_TK(445),
        FILESYSTEM_PLG(446),
        DICTIONARY_TK(447),
        UV_ANIMATION_LINEAR(448),
        UV_ANIMATION_PARAMETER(449),
        BIN_MESH_PLG(1294),
        NATIVE_DATA_PLG(1296),
        ZMODELER_LOCK(61982),
        ATOMIC_VISIBILITY_DISTANCE(39055872),
        CLUMP_VISIBILITY_DISTANCE(39055873),
        FRAME_VISIBILITY_DISTANCE(39055874),
        PIPELINE_SET(39056115),
        UNUSED_5(39056116),
        TEXDICTIONARY_LINK(39056117),
        SPECULAR_MATERIAL(39056118),
        UNUSED_8(39056119),
        EFFECT_2D(39056120),
        EXTRA_VERT_COLOUR(39056121),
        COLLISION_MODEL(39056122),
        GTA_HANIM(39056123),
        REFLECTION_MATERIAL(39056124),
        BREAKABLE(39056125),
        FRAME(39056126),
        UNUSED_16(39056127);

        private final long id;
        Sections(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Sections> byId = new HashMap<Long, Sections>(167);
        static {
            for (Sections e : Sections.values())
                byId.put(e.id(), e);
        }
        public static Sections byId(long id) { return byId.get(id); }
    }

    public RenderwareBinaryStream(KaitaiStream _io) {
        this(_io, null, null);
    }

    public RenderwareBinaryStream(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public RenderwareBinaryStream(KaitaiStream _io, KaitaiStruct _parent, RenderwareBinaryStream _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.code = Sections.byId(this._io.readU4le());
        this.size = this._io.readU4le();
        this.libraryIdStamp = this._io.readU4le();
        {
            Sections on = code();
            if (on != null) {
                switch (code()) {
                case GEOMETRY: {
                    this._raw_body = this._io.readBytes(size());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new ListWithHeader(_io__raw_body, this, _root);
                    break;
                }
                case TEXTURE_DICTIONARY: {
                    this._raw_body = this._io.readBytes(size());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new ListWithHeader(_io__raw_body, this, _root);
                    break;
                }
                case GEOMETRY_LIST: {
                    this._raw_body = this._io.readBytes(size());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new ListWithHeader(_io__raw_body, this, _root);
                    break;
                }
                case TEXTURE_NATIVE: {
                    this._raw_body = this._io.readBytes(size());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new ListWithHeader(_io__raw_body, this, _root);
                    break;
                }
                case CLUMP: {
                    this._raw_body = this._io.readBytes(size());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new ListWithHeader(_io__raw_body, this, _root);
                    break;
                }
                case FRAME_LIST: {
                    this._raw_body = this._io.readBytes(size());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new ListWithHeader(_io__raw_body, this, _root);
                    break;
                }
                default: {
                    this.body = this._io.readBytes(size());
                    break;
                }
                }
            } else {
                this.body = this._io.readBytes(size());
            }
        }
    }

    /**
     * @see <a href="https://www.gtamodding.com/wiki/RpClump">Source</a>
     */
    public static class StructClump extends KaitaiStruct {
        public static StructClump fromFile(String fileName) throws IOException {
            return new StructClump(new ByteBufferKaitaiStream(fileName));
        }

        public StructClump(KaitaiStream _io) {
            this(_io, null, null);
        }

        public StructClump(KaitaiStream _io, RenderwareBinaryStream.ListWithHeader _parent) {
            this(_io, _parent, null);
        }

        public StructClump(KaitaiStream _io, RenderwareBinaryStream.ListWithHeader _parent, RenderwareBinaryStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.numAtomics = this._io.readU4le();
            if (_parent().version() >= 208896) {
                this.numLights = this._io.readU4le();
            }
            if (_parent().version() >= 208896) {
                this.numCameras = this._io.readU4le();
            }
        }
        private long numAtomics;
        private Long numLights;
        private Long numCameras;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.ListWithHeader _parent;
        public long numAtomics() { return numAtomics; }
        public Long numLights() { return numLights; }
        public Long numCameras() { return numCameras; }
        public RenderwareBinaryStream _root() { return _root; }
        public RenderwareBinaryStream.ListWithHeader _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.gtamodding.com/wiki/RpGeometry">Source</a>
     */
    public static class StructGeometry extends KaitaiStruct {
        public static StructGeometry fromFile(String fileName) throws IOException {
            return new StructGeometry(new ByteBufferKaitaiStream(fileName));
        }

        public StructGeometry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public StructGeometry(KaitaiStream _io, RenderwareBinaryStream.ListWithHeader _parent) {
            this(_io, _parent, null);
        }

        public StructGeometry(KaitaiStream _io, RenderwareBinaryStream.ListWithHeader _parent, RenderwareBinaryStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.format = this._io.readU4le();
            this.numTriangles = this._io.readU4le();
            this.numVertices = this._io.readU4le();
            this.numMorphTargets = this._io.readU4le();
            if (_parent().version() < 212992) {
                this.surfProp = new SurfaceProperties(this._io, this, _root);
            }
            if (!(isNative())) {
                this.geometry = new GeometryNonNative(this._io, this, _root);
            }
            morphTargets = new ArrayList<MorphTarget>(((Number) (numMorphTargets())).intValue());
            for (int i = 0; i < numMorphTargets(); i++) {
                this.morphTargets.add(new MorphTarget(this._io, this, _root));
            }
        }
        private Boolean isTextured;
        public Boolean isTextured() {
            if (this.isTextured != null)
                return this.isTextured;
            boolean _tmp = (boolean) ((format() & 4) != 0);
            this.isTextured = _tmp;
            return this.isTextured;
        }
        private Boolean isPrelit;
        public Boolean isPrelit() {
            if (this.isPrelit != null)
                return this.isPrelit;
            boolean _tmp = (boolean) ((format() & 8) != 0);
            this.isPrelit = _tmp;
            return this.isPrelit;
        }
        private Boolean isTextured2;
        public Boolean isTextured2() {
            if (this.isTextured2 != null)
                return this.isTextured2;
            boolean _tmp = (boolean) ((format() & 128) != 0);
            this.isTextured2 = _tmp;
            return this.isTextured2;
        }
        private Boolean isNative;
        public Boolean isNative() {
            if (this.isNative != null)
                return this.isNative;
            boolean _tmp = (boolean) ((format() & 16777216) != 0);
            this.isNative = _tmp;
            return this.isNative;
        }
        private long format;
        private long numTriangles;
        private long numVertices;
        private long numMorphTargets;
        private SurfaceProperties surfProp;
        private GeometryNonNative geometry;
        private ArrayList<MorphTarget> morphTargets;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.ListWithHeader _parent;
        public long format() { return format; }
        public long numTriangles() { return numTriangles; }
        public long numVertices() { return numVertices; }
        public long numMorphTargets() { return numMorphTargets; }
        public SurfaceProperties surfProp() { return surfProp; }
        public GeometryNonNative geometry() { return geometry; }
        public ArrayList<MorphTarget> morphTargets() { return morphTargets; }
        public RenderwareBinaryStream _root() { return _root; }
        public RenderwareBinaryStream.ListWithHeader _parent() { return _parent; }
    }
    public static class GeometryNonNative extends KaitaiStruct {
        public static GeometryNonNative fromFile(String fileName) throws IOException {
            return new GeometryNonNative(new ByteBufferKaitaiStream(fileName));
        }

        public GeometryNonNative(KaitaiStream _io) {
            this(_io, null, null);
        }

        public GeometryNonNative(KaitaiStream _io, RenderwareBinaryStream.StructGeometry _parent) {
            this(_io, _parent, null);
        }

        public GeometryNonNative(KaitaiStream _io, RenderwareBinaryStream.StructGeometry _parent, RenderwareBinaryStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            if (_parent().isPrelit()) {
                prelitColors = new ArrayList<Rgba>(((Number) (_parent().numVertices())).intValue());
                for (int i = 0; i < _parent().numVertices(); i++) {
                    this.prelitColors.add(new Rgba(this._io, this, _root));
                }
            }
            if ( ((_parent().isTextured()) || (_parent().isTextured2())) ) {
                texCoords = new ArrayList<TexCoord>(((Number) (_parent().numVertices())).intValue());
                for (int i = 0; i < _parent().numVertices(); i++) {
                    this.texCoords.add(new TexCoord(this._io, this, _root));
                }
            }
            triangles = new ArrayList<Triangle>(((Number) (_parent().numTriangles())).intValue());
            for (int i = 0; i < _parent().numTriangles(); i++) {
                this.triangles.add(new Triangle(this._io, this, _root));
            }
        }
        private ArrayList<Rgba> prelitColors;
        private ArrayList<TexCoord> texCoords;
        private ArrayList<Triangle> triangles;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.StructGeometry _parent;
        public ArrayList<Rgba> prelitColors() { return prelitColors; }
        public ArrayList<TexCoord> texCoords() { return texCoords; }
        public ArrayList<Triangle> triangles() { return triangles; }
        public RenderwareBinaryStream _root() { return _root; }
        public RenderwareBinaryStream.StructGeometry _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.gtamodding.com/wiki/Geometry_List_(RW_Section)#Structure">Source</a>
     */
    public static class StructGeometryList extends KaitaiStruct {
        public static StructGeometryList fromFile(String fileName) throws IOException {
            return new StructGeometryList(new ByteBufferKaitaiStream(fileName));
        }

        public StructGeometryList(KaitaiStream _io) {
            this(_io, null, null);
        }

        public StructGeometryList(KaitaiStream _io, RenderwareBinaryStream.ListWithHeader _parent) {
            this(_io, _parent, null);
        }

        public StructGeometryList(KaitaiStream _io, RenderwareBinaryStream.ListWithHeader _parent, RenderwareBinaryStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.numGeometries = this._io.readU4le();
        }
        private long numGeometries;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.ListWithHeader _parent;
        public long numGeometries() { return numGeometries; }
        public RenderwareBinaryStream _root() { return _root; }
        public RenderwareBinaryStream.ListWithHeader _parent() { return _parent; }
    }
    public static class Rgba extends KaitaiStruct {
        public static Rgba fromFile(String fileName) throws IOException {
            return new Rgba(new ByteBufferKaitaiStream(fileName));
        }

        public Rgba(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Rgba(KaitaiStream _io, RenderwareBinaryStream.GeometryNonNative _parent) {
            this(_io, _parent, null);
        }

        public Rgba(KaitaiStream _io, RenderwareBinaryStream.GeometryNonNative _parent, RenderwareBinaryStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.r = this._io.readU1();
            this.g = this._io.readU1();
            this.b = this._io.readU1();
            this.a = this._io.readU1();
        }
        private int r;
        private int g;
        private int b;
        private int a;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.GeometryNonNative _parent;
        public int r() { return r; }
        public int g() { return g; }
        public int b() { return b; }
        public int a() { return a; }
        public RenderwareBinaryStream _root() { return _root; }
        public RenderwareBinaryStream.GeometryNonNative _parent() { return _parent; }
    }
    public static class Sphere extends KaitaiStruct {
        public static Sphere fromFile(String fileName) throws IOException {
            return new Sphere(new ByteBufferKaitaiStream(fileName));
        }

        public Sphere(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Sphere(KaitaiStream _io, RenderwareBinaryStream.MorphTarget _parent) {
            this(_io, _parent, null);
        }

        public Sphere(KaitaiStream _io, RenderwareBinaryStream.MorphTarget _parent, RenderwareBinaryStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.x = this._io.readF4le();
            this.y = this._io.readF4le();
            this.z = this._io.readF4le();
            this.radius = this._io.readF4le();
        }
        private float x;
        private float y;
        private float z;
        private float radius;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.MorphTarget _parent;
        public float x() { return x; }
        public float y() { return y; }
        public float z() { return z; }
        public float radius() { return radius; }
        public RenderwareBinaryStream _root() { return _root; }
        public RenderwareBinaryStream.MorphTarget _parent() { return _parent; }
    }
    public static class MorphTarget extends KaitaiStruct {
        public static MorphTarget fromFile(String fileName) throws IOException {
            return new MorphTarget(new ByteBufferKaitaiStream(fileName));
        }

        public MorphTarget(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MorphTarget(KaitaiStream _io, RenderwareBinaryStream.StructGeometry _parent) {
            this(_io, _parent, null);
        }

        public MorphTarget(KaitaiStream _io, RenderwareBinaryStream.StructGeometry _parent, RenderwareBinaryStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.boundingSphere = new Sphere(this._io, this, _root);
            this.hasVertices = this._io.readU4le();
            this.hasNormals = this._io.readU4le();
            if (hasVertices() != 0) {
                vertices = new ArrayList<Vector3d>(((Number) (_parent().numVertices())).intValue());
                for (int i = 0; i < _parent().numVertices(); i++) {
                    this.vertices.add(new Vector3d(this._io, this, _root));
                }
            }
            if (hasNormals() != 0) {
                normals = new ArrayList<Vector3d>(((Number) (_parent().numVertices())).intValue());
                for (int i = 0; i < _parent().numVertices(); i++) {
                    this.normals.add(new Vector3d(this._io, this, _root));
                }
            }
        }
        private Sphere boundingSphere;
        private long hasVertices;
        private long hasNormals;
        private ArrayList<Vector3d> vertices;
        private ArrayList<Vector3d> normals;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.StructGeometry _parent;
        public Sphere boundingSphere() { return boundingSphere; }
        public long hasVertices() { return hasVertices; }
        public long hasNormals() { return hasNormals; }
        public ArrayList<Vector3d> vertices() { return vertices; }
        public ArrayList<Vector3d> normals() { return normals; }
        public RenderwareBinaryStream _root() { return _root; }
        public RenderwareBinaryStream.StructGeometry _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.gtamodding.com/wiki/RpGeometry">Source</a>
     */
    public static class SurfaceProperties extends KaitaiStruct {
        public static SurfaceProperties fromFile(String fileName) throws IOException {
            return new SurfaceProperties(new ByteBufferKaitaiStream(fileName));
        }

        public SurfaceProperties(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SurfaceProperties(KaitaiStream _io, RenderwareBinaryStream.StructGeometry _parent) {
            this(_io, _parent, null);
        }

        public SurfaceProperties(KaitaiStream _io, RenderwareBinaryStream.StructGeometry _parent, RenderwareBinaryStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.ambient = this._io.readF4le();
            this.specular = this._io.readF4le();
            this.diffuse = this._io.readF4le();
        }
        private float ambient;
        private float specular;
        private float diffuse;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.StructGeometry _parent;
        public float ambient() { return ambient; }
        public float specular() { return specular; }
        public float diffuse() { return diffuse; }
        public RenderwareBinaryStream _root() { return _root; }
        public RenderwareBinaryStream.StructGeometry _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.gtamodding.com/wiki/Frame_List_(RW_Section)#Structure">Source</a>
     */
    public static class StructFrameList extends KaitaiStruct {
        public static StructFrameList fromFile(String fileName) throws IOException {
            return new StructFrameList(new ByteBufferKaitaiStream(fileName));
        }

        public StructFrameList(KaitaiStream _io) {
            this(_io, null, null);
        }

        public StructFrameList(KaitaiStream _io, RenderwareBinaryStream.ListWithHeader _parent) {
            this(_io, _parent, null);
        }

        public StructFrameList(KaitaiStream _io, RenderwareBinaryStream.ListWithHeader _parent, RenderwareBinaryStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.numFrames = this._io.readU4le();
            frames = new ArrayList<Frame>(((Number) (numFrames())).intValue());
            for (int i = 0; i < numFrames(); i++) {
                this.frames.add(new Frame(this._io, this, _root));
            }
        }
        private long numFrames;
        private ArrayList<Frame> frames;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.ListWithHeader _parent;
        public long numFrames() { return numFrames; }
        public ArrayList<Frame> frames() { return frames; }
        public RenderwareBinaryStream _root() { return _root; }
        public RenderwareBinaryStream.ListWithHeader _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.gtamodding.com/wiki/Frame_List_(RW_Section)#Structure">Source</a>
     */
    public static class Matrix extends KaitaiStruct {
        public static Matrix fromFile(String fileName) throws IOException {
            return new Matrix(new ByteBufferKaitaiStream(fileName));
        }

        public Matrix(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Matrix(KaitaiStream _io, RenderwareBinaryStream.Frame _parent) {
            this(_io, _parent, null);
        }

        public Matrix(KaitaiStream _io, RenderwareBinaryStream.Frame _parent, RenderwareBinaryStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            entries = new ArrayList<Vector3d>(((Number) (3)).intValue());
            for (int i = 0; i < 3; i++) {
                this.entries.add(new Vector3d(this._io, this, _root));
            }
        }
        private ArrayList<Vector3d> entries;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.Frame _parent;
        public ArrayList<Vector3d> entries() { return entries; }
        public RenderwareBinaryStream _root() { return _root; }
        public RenderwareBinaryStream.Frame _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.gtamodding.com/wiki/Frame_List_(RW_Section)#Structure">Source</a>
     */
    public static class Vector3d extends KaitaiStruct {
        public static Vector3d fromFile(String fileName) throws IOException {
            return new Vector3d(new ByteBufferKaitaiStream(fileName));
        }

        public Vector3d(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Vector3d(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Vector3d(KaitaiStream _io, KaitaiStruct _parent, RenderwareBinaryStream _root) {
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
        private RenderwareBinaryStream _root;
        private KaitaiStruct _parent;
        public float x() { return x; }
        public float y() { return y; }
        public float z() { return z; }
        public RenderwareBinaryStream _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * Typical structure used by many data types in RenderWare binary
     * stream. Substream contains a list of binary stream entries,
     * first entry always has type "struct" and carries some specific
     * binary data it in, determined by the type of parent. All other
     * entries, beside the first one, are normal, self-describing
     * records.
     */
    public static class ListWithHeader extends KaitaiStruct {
        public static ListWithHeader fromFile(String fileName) throws IOException {
            return new ListWithHeader(new ByteBufferKaitaiStream(fileName));
        }

        public ListWithHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ListWithHeader(KaitaiStream _io, RenderwareBinaryStream _parent) {
            this(_io, _parent, null);
        }

        public ListWithHeader(KaitaiStream _io, RenderwareBinaryStream _parent, RenderwareBinaryStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.code = this._io.readBytes(4);
            if (!(Arrays.equals(code(), new byte[] { 1, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 1, 0, 0, 0 }, code(), _io(), "/types/list_with_header/seq/0");
            }
            this.headerSize = this._io.readU4le();
            this.libraryIdStamp = this._io.readU4le();
            {
                Sections on = _parent().code();
                if (on != null) {
                    switch (_parent().code()) {
                    case GEOMETRY: {
                        this._raw_header = this._io.readBytes(headerSize());
                        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(_raw_header);
                        this.header = new StructGeometry(_io__raw_header, this, _root);
                        break;
                    }
                    case TEXTURE_DICTIONARY: {
                        this._raw_header = this._io.readBytes(headerSize());
                        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(_raw_header);
                        this.header = new StructTextureDictionary(_io__raw_header, this, _root);
                        break;
                    }
                    case GEOMETRY_LIST: {
                        this._raw_header = this._io.readBytes(headerSize());
                        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(_raw_header);
                        this.header = new StructGeometryList(_io__raw_header, this, _root);
                        break;
                    }
                    case CLUMP: {
                        this._raw_header = this._io.readBytes(headerSize());
                        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(_raw_header);
                        this.header = new StructClump(_io__raw_header, this, _root);
                        break;
                    }
                    case FRAME_LIST: {
                        this._raw_header = this._io.readBytes(headerSize());
                        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(_raw_header);
                        this.header = new StructFrameList(_io__raw_header, this, _root);
                        break;
                    }
                    default: {
                        this.header = this._io.readBytes(headerSize());
                        break;
                    }
                    }
                } else {
                    this.header = this._io.readBytes(headerSize());
                }
            }
            this.entries = new ArrayList<RenderwareBinaryStream>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new RenderwareBinaryStream(this._io));
                    i++;
                }
            }
        }
        private Integer version;
        public Integer version() {
            if (this.version != null)
                return this.version;
            int _tmp = (int) (((libraryIdStamp() & 4294901760L) != 0 ? ((((libraryIdStamp() >> 14) & 261888) + 196608) | ((libraryIdStamp() >> 16) & 63)) : (libraryIdStamp() << 8)));
            this.version = _tmp;
            return this.version;
        }
        private byte[] code;
        private long headerSize;
        private long libraryIdStamp;
        private Object header;
        private ArrayList<RenderwareBinaryStream> entries;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream _parent;
        private byte[] _raw_header;
        public byte[] code() { return code; }
        public long headerSize() { return headerSize; }
        public long libraryIdStamp() { return libraryIdStamp; }
        public Object header() { return header; }
        public ArrayList<RenderwareBinaryStream> entries() { return entries; }
        public RenderwareBinaryStream _root() { return _root; }
        public RenderwareBinaryStream _parent() { return _parent; }
        public byte[] _raw_header() { return _raw_header; }
    }
    public static class Triangle extends KaitaiStruct {
        public static Triangle fromFile(String fileName) throws IOException {
            return new Triangle(new ByteBufferKaitaiStream(fileName));
        }

        public Triangle(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Triangle(KaitaiStream _io, RenderwareBinaryStream.GeometryNonNative _parent) {
            this(_io, _parent, null);
        }

        public Triangle(KaitaiStream _io, RenderwareBinaryStream.GeometryNonNative _parent, RenderwareBinaryStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.vertex2 = this._io.readU2le();
            this.vertex1 = this._io.readU2le();
            this.materialId = this._io.readU2le();
            this.vertex3 = this._io.readU2le();
        }
        private int vertex2;
        private int vertex1;
        private int materialId;
        private int vertex3;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.GeometryNonNative _parent;
        public int vertex2() { return vertex2; }
        public int vertex1() { return vertex1; }
        public int materialId() { return materialId; }
        public int vertex3() { return vertex3; }
        public RenderwareBinaryStream _root() { return _root; }
        public RenderwareBinaryStream.GeometryNonNative _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.gtamodding.com/wiki/Frame_List_(RW_Section)#Structure">Source</a>
     */
    public static class Frame extends KaitaiStruct {
        public static Frame fromFile(String fileName) throws IOException {
            return new Frame(new ByteBufferKaitaiStream(fileName));
        }

        public Frame(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Frame(KaitaiStream _io, RenderwareBinaryStream.StructFrameList _parent) {
            this(_io, _parent, null);
        }

        public Frame(KaitaiStream _io, RenderwareBinaryStream.StructFrameList _parent, RenderwareBinaryStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.rotationMatrix = new Matrix(this._io, this, _root);
            this.position = new Vector3d(this._io, this, _root);
            this.curFrameIdx = this._io.readS4le();
            this.matrixCreationFlags = this._io.readU4le();
        }
        private Matrix rotationMatrix;
        private Vector3d position;
        private int curFrameIdx;
        private long matrixCreationFlags;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.StructFrameList _parent;
        public Matrix rotationMatrix() { return rotationMatrix; }
        public Vector3d position() { return position; }
        public int curFrameIdx() { return curFrameIdx; }
        public long matrixCreationFlags() { return matrixCreationFlags; }
        public RenderwareBinaryStream _root() { return _root; }
        public RenderwareBinaryStream.StructFrameList _parent() { return _parent; }
    }
    public static class TexCoord extends KaitaiStruct {
        public static TexCoord fromFile(String fileName) throws IOException {
            return new TexCoord(new ByteBufferKaitaiStream(fileName));
        }

        public TexCoord(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TexCoord(KaitaiStream _io, RenderwareBinaryStream.GeometryNonNative _parent) {
            this(_io, _parent, null);
        }

        public TexCoord(KaitaiStream _io, RenderwareBinaryStream.GeometryNonNative _parent, RenderwareBinaryStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.u = this._io.readF4le();
            this.v = this._io.readF4le();
        }
        private float u;
        private float v;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.GeometryNonNative _parent;
        public float u() { return u; }
        public float v() { return v; }
        public RenderwareBinaryStream _root() { return _root; }
        public RenderwareBinaryStream.GeometryNonNative _parent() { return _parent; }
    }
    public static class StructTextureDictionary extends KaitaiStruct {
        public static StructTextureDictionary fromFile(String fileName) throws IOException {
            return new StructTextureDictionary(new ByteBufferKaitaiStream(fileName));
        }

        public StructTextureDictionary(KaitaiStream _io) {
            this(_io, null, null);
        }

        public StructTextureDictionary(KaitaiStream _io, RenderwareBinaryStream.ListWithHeader _parent) {
            this(_io, _parent, null);
        }

        public StructTextureDictionary(KaitaiStream _io, RenderwareBinaryStream.ListWithHeader _parent, RenderwareBinaryStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.numTextures = this._io.readU4le();
        }
        private long numTextures;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.ListWithHeader _parent;
        public long numTextures() { return numTextures; }
        public RenderwareBinaryStream _root() { return _root; }
        public RenderwareBinaryStream.ListWithHeader _parent() { return _parent; }
    }
    private Integer version;
    public Integer version() {
        if (this.version != null)
            return this.version;
        int _tmp = (int) (((libraryIdStamp() & 4294901760L) != 0 ? ((((libraryIdStamp() >> 14) & 261888) + 196608) | ((libraryIdStamp() >> 16) & 63)) : (libraryIdStamp() << 8)));
        this.version = _tmp;
        return this.version;
    }
    private Sections code;
    private long size;
    private long libraryIdStamp;
    private Object body;
    private RenderwareBinaryStream _root;
    private KaitaiStruct _parent;
    private byte[] _raw_body;
    public Sections code() { return code; }
    public long size() { return size; }
    public long libraryIdStamp() { return libraryIdStamp; }
    public Object body() { return body; }
    public RenderwareBinaryStream _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_body() { return _raw_body; }
}
