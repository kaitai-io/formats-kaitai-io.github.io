// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;


/**
 * @see <a href="https://gtamods.com/wiki/RenderWare_binary_stream_file">Source</a>
 */
public class RenderwareBinaryStream extends KaitaiStruct.ReadWrite {
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
    public RenderwareBinaryStream() {
        this(null, null, null);
    }

    public RenderwareBinaryStream(KaitaiStream _io) {
        this(_io, null, null);
    }

    public RenderwareBinaryStream(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public RenderwareBinaryStream(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, RenderwareBinaryStream _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.code = Sections.byId(this._io.readU4le());
        this.size = this._io.readU4le();
        this.libraryIdStamp = this._io.readU4le();
        {
            Sections on = code();
            if (on != null) {
                switch (code()) {
                case ATOMIC: {
                    this._raw_body = this._io.readBytes(size());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new ListWithHeader(_io__raw_body, this, _root);
                    ((ListWithHeader) (this.body))._read();
                    break;
                }
                case CLUMP: {
                    this._raw_body = this._io.readBytes(size());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new ListWithHeader(_io__raw_body, this, _root);
                    ((ListWithHeader) (this.body))._read();
                    break;
                }
                case FRAME_LIST: {
                    this._raw_body = this._io.readBytes(size());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new ListWithHeader(_io__raw_body, this, _root);
                    ((ListWithHeader) (this.body))._read();
                    break;
                }
                case GEOMETRY: {
                    this._raw_body = this._io.readBytes(size());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new ListWithHeader(_io__raw_body, this, _root);
                    ((ListWithHeader) (this.body))._read();
                    break;
                }
                case GEOMETRY_LIST: {
                    this._raw_body = this._io.readBytes(size());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new ListWithHeader(_io__raw_body, this, _root);
                    ((ListWithHeader) (this.body))._read();
                    break;
                }
                case TEXTURE_DICTIONARY: {
                    this._raw_body = this._io.readBytes(size());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new ListWithHeader(_io__raw_body, this, _root);
                    ((ListWithHeader) (this.body))._read();
                    break;
                }
                case TEXTURE_NATIVE: {
                    this._raw_body = this._io.readBytes(size());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new ListWithHeader(_io__raw_body, this, _root);
                    ((ListWithHeader) (this.body))._read();
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
        _dirty = false;
    }

    public void _fetchInstances() {
        {
            Sections on = code();
            if (on != null) {
                switch (code()) {
                case ATOMIC: {
                    ((ListWithHeader) (this.body))._fetchInstances();
                    break;
                }
                case CLUMP: {
                    ((ListWithHeader) (this.body))._fetchInstances();
                    break;
                }
                case FRAME_LIST: {
                    ((ListWithHeader) (this.body))._fetchInstances();
                    break;
                }
                case GEOMETRY: {
                    ((ListWithHeader) (this.body))._fetchInstances();
                    break;
                }
                case GEOMETRY_LIST: {
                    ((ListWithHeader) (this.body))._fetchInstances();
                    break;
                }
                case TEXTURE_DICTIONARY: {
                    ((ListWithHeader) (this.body))._fetchInstances();
                    break;
                }
                case TEXTURE_NATIVE: {
                    ((ListWithHeader) (this.body))._fetchInstances();
                    break;
                }
                default: {
                    break;
                }
                }
            } else {
            }
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU4le(((Number) (this.code.id())).longValue());
        this._io.writeU4le(this.size);
        this._io.writeU4le(this.libraryIdStamp);
        {
            Sections on = code();
            if (on != null) {
                switch (code()) {
                case ATOMIC: {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (size()));
                        final RenderwareBinaryStream _this = this;
                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_body = _io__raw_body.toByteArray();
                                if (((byte[]) (_this._raw_body)).length != size())
                                    throw new ConsistencyError("raw(body)", size(), ((byte[]) (_this._raw_body)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                            }
                        });
                    }
                    ((ListWithHeader) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case CLUMP: {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (size()));
                        final RenderwareBinaryStream _this = this;
                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_body = _io__raw_body.toByteArray();
                                if (((byte[]) (_this._raw_body)).length != size())
                                    throw new ConsistencyError("raw(body)", size(), ((byte[]) (_this._raw_body)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                            }
                        });
                    }
                    ((ListWithHeader) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case FRAME_LIST: {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (size()));
                        final RenderwareBinaryStream _this = this;
                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_body = _io__raw_body.toByteArray();
                                if (((byte[]) (_this._raw_body)).length != size())
                                    throw new ConsistencyError("raw(body)", size(), ((byte[]) (_this._raw_body)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                            }
                        });
                    }
                    ((ListWithHeader) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case GEOMETRY: {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (size()));
                        final RenderwareBinaryStream _this = this;
                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_body = _io__raw_body.toByteArray();
                                if (((byte[]) (_this._raw_body)).length != size())
                                    throw new ConsistencyError("raw(body)", size(), ((byte[]) (_this._raw_body)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                            }
                        });
                    }
                    ((ListWithHeader) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case GEOMETRY_LIST: {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (size()));
                        final RenderwareBinaryStream _this = this;
                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_body = _io__raw_body.toByteArray();
                                if (((byte[]) (_this._raw_body)).length != size())
                                    throw new ConsistencyError("raw(body)", size(), ((byte[]) (_this._raw_body)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                            }
                        });
                    }
                    ((ListWithHeader) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case TEXTURE_DICTIONARY: {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (size()));
                        final RenderwareBinaryStream _this = this;
                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_body = _io__raw_body.toByteArray();
                                if (((byte[]) (_this._raw_body)).length != size())
                                    throw new ConsistencyError("raw(body)", size(), ((byte[]) (_this._raw_body)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                            }
                        });
                    }
                    ((ListWithHeader) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case TEXTURE_NATIVE: {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(size());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (size()));
                        final RenderwareBinaryStream _this = this;
                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_body = _io__raw_body.toByteArray();
                                if (((byte[]) (_this._raw_body)).length != size())
                                    throw new ConsistencyError("raw(body)", size(), ((byte[]) (_this._raw_body)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                            }
                        });
                    }
                    ((ListWithHeader) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                default: {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                    break;
                }
                }
            } else {
                this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
            }
        }
    }

    public void _check() {
        {
            Sections on = code();
            if (on != null) {
                switch (code()) {
                case ATOMIC: {
                    if (!Objects.equals(((RenderwareBinaryStream.ListWithHeader) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((RenderwareBinaryStream.ListWithHeader) (this.body))._root());
                    if (!Objects.equals(((RenderwareBinaryStream.ListWithHeader) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((RenderwareBinaryStream.ListWithHeader) (this.body))._parent());
                    break;
                }
                case CLUMP: {
                    if (!Objects.equals(((RenderwareBinaryStream.ListWithHeader) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((RenderwareBinaryStream.ListWithHeader) (this.body))._root());
                    if (!Objects.equals(((RenderwareBinaryStream.ListWithHeader) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((RenderwareBinaryStream.ListWithHeader) (this.body))._parent());
                    break;
                }
                case FRAME_LIST: {
                    if (!Objects.equals(((RenderwareBinaryStream.ListWithHeader) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((RenderwareBinaryStream.ListWithHeader) (this.body))._root());
                    if (!Objects.equals(((RenderwareBinaryStream.ListWithHeader) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((RenderwareBinaryStream.ListWithHeader) (this.body))._parent());
                    break;
                }
                case GEOMETRY: {
                    if (!Objects.equals(((RenderwareBinaryStream.ListWithHeader) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((RenderwareBinaryStream.ListWithHeader) (this.body))._root());
                    if (!Objects.equals(((RenderwareBinaryStream.ListWithHeader) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((RenderwareBinaryStream.ListWithHeader) (this.body))._parent());
                    break;
                }
                case GEOMETRY_LIST: {
                    if (!Objects.equals(((RenderwareBinaryStream.ListWithHeader) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((RenderwareBinaryStream.ListWithHeader) (this.body))._root());
                    if (!Objects.equals(((RenderwareBinaryStream.ListWithHeader) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((RenderwareBinaryStream.ListWithHeader) (this.body))._parent());
                    break;
                }
                case TEXTURE_DICTIONARY: {
                    if (!Objects.equals(((RenderwareBinaryStream.ListWithHeader) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((RenderwareBinaryStream.ListWithHeader) (this.body))._root());
                    if (!Objects.equals(((RenderwareBinaryStream.ListWithHeader) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((RenderwareBinaryStream.ListWithHeader) (this.body))._parent());
                    break;
                }
                case TEXTURE_NATIVE: {
                    if (!Objects.equals(((RenderwareBinaryStream.ListWithHeader) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((RenderwareBinaryStream.ListWithHeader) (this.body))._root());
                    if (!Objects.equals(((RenderwareBinaryStream.ListWithHeader) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((RenderwareBinaryStream.ListWithHeader) (this.body))._parent());
                    break;
                }
                default: {
                    if (((byte[]) (this.body)).length != size())
                        throw new ConsistencyError("body", size(), ((byte[]) (this.body)).length);
                    break;
                }
                }
            } else {
                if (((byte[]) (this.body)).length != size())
                    throw new ConsistencyError("body", size(), ((byte[]) (this.body)).length);
            }
        }
        _dirty = false;
    }

    /**
     * @see <a href="https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure">Source</a>
     */
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

        public Frame(KaitaiStream _io, RenderwareBinaryStream.StructFrameList _parent) {
            this(_io, _parent, null);
        }

        public Frame(KaitaiStream _io, RenderwareBinaryStream.StructFrameList _parent, RenderwareBinaryStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.rotationMatrix = new Matrix(this._io, this, _root);
            this.rotationMatrix._read();
            this.position = new Vector3d(this._io, this, _root);
            this.position._read();
            this.curFrameIdx = this._io.readS4le();
            this.matrixCreationFlags = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.rotationMatrix._fetchInstances();
            this.position._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.rotationMatrix._write_Seq(this._io);
            this.position._write_Seq(this._io);
            this._io.writeS4le(this.curFrameIdx);
            this._io.writeU4le(this.matrixCreationFlags);
        }

        public void _check() {
            if (!Objects.equals(this.rotationMatrix._root(), _root()))
                throw new ConsistencyError("rotation_matrix", _root(), this.rotationMatrix._root());
            if (!Objects.equals(this.rotationMatrix._parent(), this))
                throw new ConsistencyError("rotation_matrix", this, this.rotationMatrix._parent());
            if (!Objects.equals(this.position._root(), _root()))
                throw new ConsistencyError("position", _root(), this.position._root());
            if (!Objects.equals(this.position._parent(), this))
                throw new ConsistencyError("position", this, this.position._parent());
            _dirty = false;
        }
        private Matrix rotationMatrix;
        private Vector3d position;
        private int curFrameIdx;
        private long matrixCreationFlags;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.StructFrameList _parent;
        public Matrix rotationMatrix() { return rotationMatrix; }
        public void setRotationMatrix(Matrix _v) { _dirty = true; rotationMatrix = _v; }
        public Vector3d position() { return position; }
        public void setPosition(Vector3d _v) { _dirty = true; position = _v; }
        public int curFrameIdx() { return curFrameIdx; }
        public void setCurFrameIdx(int _v) { _dirty = true; curFrameIdx = _v; }
        public long matrixCreationFlags() { return matrixCreationFlags; }
        public void setMatrixCreationFlags(long _v) { _dirty = true; matrixCreationFlags = _v; }
        public RenderwareBinaryStream _root() { return _root; }
        public void set_root(RenderwareBinaryStream _v) { _dirty = true; _root = _v; }
        public RenderwareBinaryStream.StructFrameList _parent() { return _parent; }
        public void set_parent(RenderwareBinaryStream.StructFrameList _v) { _dirty = true; _parent = _v; }
    }
    public static class GeometryNonNative extends KaitaiStruct.ReadWrite {
        public static GeometryNonNative fromFile(String fileName) throws IOException {
            return new GeometryNonNative(new ByteBufferKaitaiStream(fileName));
        }
        public GeometryNonNative() {
            this(null, null, null);
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
        }
        public void _read() {
            if (_parent().isPrelit()) {
                this.prelitColors = new ArrayList<Rgba>();
                for (int i = 0; i < _parent().numVertices(); i++) {
                    Rgba _t_prelitColors = new Rgba(this._io, this, _root);
                    try {
                        _t_prelitColors._read();
                    } finally {
                        this.prelitColors.add(_t_prelitColors);
                    }
                }
            }
            this.uvLayers = new ArrayList<UvLayer>();
            for (int i = 0; i < _parent().numUvLayers(); i++) {
                UvLayer _t_uvLayers = new UvLayer(this._io, this, _root, _parent().numVertices());
                try {
                    _t_uvLayers._read();
                } finally {
                    this.uvLayers.add(_t_uvLayers);
                }
            }
            this.triangles = new ArrayList<Triangle>();
            for (int i = 0; i < _parent().numTriangles(); i++) {
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
            if (_parent().isPrelit()) {
                for (int i = 0; i < this.prelitColors.size(); i++) {
                    this.prelitColors.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
            for (int i = 0; i < this.uvLayers.size(); i++) {
                this.uvLayers.get(((Number) (i)).intValue())._fetchInstances();
            }
            for (int i = 0; i < this.triangles.size(); i++) {
                this.triangles.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            if (_parent().isPrelit()) {
                for (int i = 0; i < this.prelitColors.size(); i++) {
                    this.prelitColors.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }
            for (int i = 0; i < this.uvLayers.size(); i++) {
                this.uvLayers.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            for (int i = 0; i < this.triangles.size(); i++) {
                this.triangles.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (_parent().isPrelit()) {
                if (this.prelitColors.size() != _parent().numVertices())
                    throw new ConsistencyError("prelit_colors", _parent().numVertices(), this.prelitColors.size());
                for (int i = 0; i < this.prelitColors.size(); i++) {
                    if (!Objects.equals(this.prelitColors.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("prelit_colors", _root(), this.prelitColors.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.prelitColors.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("prelit_colors", this, this.prelitColors.get(((Number) (i)).intValue())._parent());
                }
            }
            if (this.uvLayers.size() != _parent().numUvLayers())
                throw new ConsistencyError("uv_layers", _parent().numUvLayers(), this.uvLayers.size());
            for (int i = 0; i < this.uvLayers.size(); i++) {
                if (!Objects.equals(this.uvLayers.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("uv_layers", _root(), this.uvLayers.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.uvLayers.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("uv_layers", this, this.uvLayers.get(((Number) (i)).intValue())._parent());
                if (this.uvLayers.get(((Number) (i)).intValue()).numVertices() != _parent().numVertices())
                    throw new ConsistencyError("uv_layers", _parent().numVertices(), this.uvLayers.get(((Number) (i)).intValue()).numVertices());
            }
            if (this.triangles.size() != _parent().numTriangles())
                throw new ConsistencyError("triangles", _parent().numTriangles(), this.triangles.size());
            for (int i = 0; i < this.triangles.size(); i++) {
                if (!Objects.equals(this.triangles.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("triangles", _root(), this.triangles.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.triangles.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("triangles", this, this.triangles.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<Rgba> prelitColors;
        private List<UvLayer> uvLayers;
        private List<Triangle> triangles;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.StructGeometry _parent;
        public List<Rgba> prelitColors() { return prelitColors; }
        public void setPrelitColors(List<Rgba> _v) { _dirty = true; prelitColors = _v; }
        public List<UvLayer> uvLayers() { return uvLayers; }
        public void setUvLayers(List<UvLayer> _v) { _dirty = true; uvLayers = _v; }
        public List<Triangle> triangles() { return triangles; }
        public void setTriangles(List<Triangle> _v) { _dirty = true; triangles = _v; }
        public RenderwareBinaryStream _root() { return _root; }
        public void set_root(RenderwareBinaryStream _v) { _dirty = true; _root = _v; }
        public RenderwareBinaryStream.StructGeometry _parent() { return _parent; }
        public void set_parent(RenderwareBinaryStream.StructGeometry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Typical structure used by many data types in RenderWare binary
     * stream. Substream contains a list of binary stream entries,
     * first entry always has type "struct" and carries some specific
     * binary data it in, determined by the type of parent. All other
     * entries, beside the first one, are normal, self-describing
     * records.
     */
    public static class ListWithHeader extends KaitaiStruct.ReadWrite {
        public static ListWithHeader fromFile(String fileName) throws IOException {
            return new ListWithHeader(new ByteBufferKaitaiStream(fileName));
        }
        public ListWithHeader() {
            this(null, null, null);
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
        }
        public void _read() {
            this.code = this._io.readBytes(4);
            if (!(Arrays.equals(this.code, new byte[] { 1, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 1, 0, 0, 0 }, this.code, this._io, "/types/list_with_header/seq/0");
            }
            this.headerSize = this._io.readU4le();
            this.libraryIdStamp = this._io.readU4le();
            {
                Sections on = _parent().code();
                if (on != null) {
                    switch (_parent().code()) {
                    case ATOMIC: {
                        this._raw_header = this._io.readBytes(headerSize());
                        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(this._raw_header);
                        this.header = new StructAtomic(_io__raw_header, this, _root);
                        ((StructAtomic) (this.header))._read();
                        break;
                    }
                    case CLUMP: {
                        this._raw_header = this._io.readBytes(headerSize());
                        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(this._raw_header);
                        this.header = new StructClump(_io__raw_header, this, _root);
                        ((StructClump) (this.header))._read();
                        break;
                    }
                    case FRAME_LIST: {
                        this._raw_header = this._io.readBytes(headerSize());
                        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(this._raw_header);
                        this.header = new StructFrameList(_io__raw_header, this, _root);
                        ((StructFrameList) (this.header))._read();
                        break;
                    }
                    case GEOMETRY: {
                        this._raw_header = this._io.readBytes(headerSize());
                        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(this._raw_header);
                        this.header = new StructGeometry(_io__raw_header, this, _root);
                        ((StructGeometry) (this.header))._read();
                        break;
                    }
                    case GEOMETRY_LIST: {
                        this._raw_header = this._io.readBytes(headerSize());
                        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(this._raw_header);
                        this.header = new StructGeometryList(_io__raw_header, this, _root);
                        ((StructGeometryList) (this.header))._read();
                        break;
                    }
                    case TEXTURE_DICTIONARY: {
                        this._raw_header = this._io.readBytes(headerSize());
                        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(this._raw_header);
                        this.header = new StructTextureDictionary(_io__raw_header, this, _root);
                        ((StructTextureDictionary) (this.header))._read();
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
                    RenderwareBinaryStream _t_entries = new RenderwareBinaryStream(this._io, this, _root);
                    try {
                        _t_entries._read();
                    } finally {
                        this.entries.add(_t_entries);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                Sections on = _parent().code();
                if (on != null) {
                    switch (_parent().code()) {
                    case ATOMIC: {
                        ((StructAtomic) (this.header))._fetchInstances();
                        break;
                    }
                    case CLUMP: {
                        ((StructClump) (this.header))._fetchInstances();
                        break;
                    }
                    case FRAME_LIST: {
                        ((StructFrameList) (this.header))._fetchInstances();
                        break;
                    }
                    case GEOMETRY: {
                        ((StructGeometry) (this.header))._fetchInstances();
                        break;
                    }
                    case GEOMETRY_LIST: {
                        ((StructGeometryList) (this.header))._fetchInstances();
                        break;
                    }
                    case TEXTURE_DICTIONARY: {
                        ((StructTextureDictionary) (this.header))._fetchInstances();
                        break;
                    }
                    default: {
                        break;
                    }
                    }
                } else {
                }
            }
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.code);
            this._io.writeU4le(this.headerSize);
            this._io.writeU4le(this.libraryIdStamp);
            {
                Sections on = _parent().code();
                if (on != null) {
                    switch (_parent().code()) {
                    case ATOMIC: {
                        final KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(headerSize());
                        this._io.addChildStream(_io__raw_header);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (headerSize()));
                            final ListWithHeader _this = this;
                            _io__raw_header.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_header = _io__raw_header.toByteArray();
                                    if (((byte[]) (_this._raw_header)).length != headerSize())
                                        throw new ConsistencyError("raw(header)", headerSize(), ((byte[]) (_this._raw_header)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_header)))));
                                }
                            });
                        }
                        ((StructAtomic) (this.header))._write_Seq(_io__raw_header);
                        break;
                    }
                    case CLUMP: {
                        final KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(headerSize());
                        this._io.addChildStream(_io__raw_header);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (headerSize()));
                            final ListWithHeader _this = this;
                            _io__raw_header.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_header = _io__raw_header.toByteArray();
                                    if (((byte[]) (_this._raw_header)).length != headerSize())
                                        throw new ConsistencyError("raw(header)", headerSize(), ((byte[]) (_this._raw_header)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_header)))));
                                }
                            });
                        }
                        ((StructClump) (this.header))._write_Seq(_io__raw_header);
                        break;
                    }
                    case FRAME_LIST: {
                        final KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(headerSize());
                        this._io.addChildStream(_io__raw_header);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (headerSize()));
                            final ListWithHeader _this = this;
                            _io__raw_header.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_header = _io__raw_header.toByteArray();
                                    if (((byte[]) (_this._raw_header)).length != headerSize())
                                        throw new ConsistencyError("raw(header)", headerSize(), ((byte[]) (_this._raw_header)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_header)))));
                                }
                            });
                        }
                        ((StructFrameList) (this.header))._write_Seq(_io__raw_header);
                        break;
                    }
                    case GEOMETRY: {
                        final KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(headerSize());
                        this._io.addChildStream(_io__raw_header);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (headerSize()));
                            final ListWithHeader _this = this;
                            _io__raw_header.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_header = _io__raw_header.toByteArray();
                                    if (((byte[]) (_this._raw_header)).length != headerSize())
                                        throw new ConsistencyError("raw(header)", headerSize(), ((byte[]) (_this._raw_header)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_header)))));
                                }
                            });
                        }
                        ((StructGeometry) (this.header))._write_Seq(_io__raw_header);
                        break;
                    }
                    case GEOMETRY_LIST: {
                        final KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(headerSize());
                        this._io.addChildStream(_io__raw_header);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (headerSize()));
                            final ListWithHeader _this = this;
                            _io__raw_header.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_header = _io__raw_header.toByteArray();
                                    if (((byte[]) (_this._raw_header)).length != headerSize())
                                        throw new ConsistencyError("raw(header)", headerSize(), ((byte[]) (_this._raw_header)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_header)))));
                                }
                            });
                        }
                        ((StructGeometryList) (this.header))._write_Seq(_io__raw_header);
                        break;
                    }
                    case TEXTURE_DICTIONARY: {
                        final KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(headerSize());
                        this._io.addChildStream(_io__raw_header);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (headerSize()));
                            final ListWithHeader _this = this;
                            _io__raw_header.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_header = _io__raw_header.toByteArray();
                                    if (((byte[]) (_this._raw_header)).length != headerSize())
                                        throw new ConsistencyError("raw(header)", headerSize(), ((byte[]) (_this._raw_header)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_header)))));
                                }
                            });
                        }
                        ((StructTextureDictionary) (this.header))._write_Seq(_io__raw_header);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.header)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.header)))));
                }
            }
            for (int i = 0; i < this.entries.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (this.code.length != 4)
                throw new ConsistencyError("code", 4, this.code.length);
            if (!(Arrays.equals(this.code, new byte[] { 1, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 1, 0, 0, 0 }, this.code, null, "/types/list_with_header/seq/0");
            }
            {
                Sections on = _parent().code();
                if (on != null) {
                    switch (_parent().code()) {
                    case ATOMIC: {
                        if (!Objects.equals(((RenderwareBinaryStream.StructAtomic) (this.header))._root(), _root()))
                            throw new ConsistencyError("header", _root(), ((RenderwareBinaryStream.StructAtomic) (this.header))._root());
                        if (!Objects.equals(((RenderwareBinaryStream.StructAtomic) (this.header))._parent(), this))
                            throw new ConsistencyError("header", this, ((RenderwareBinaryStream.StructAtomic) (this.header))._parent());
                        break;
                    }
                    case CLUMP: {
                        if (!Objects.equals(((RenderwareBinaryStream.StructClump) (this.header))._root(), _root()))
                            throw new ConsistencyError("header", _root(), ((RenderwareBinaryStream.StructClump) (this.header))._root());
                        if (!Objects.equals(((RenderwareBinaryStream.StructClump) (this.header))._parent(), this))
                            throw new ConsistencyError("header", this, ((RenderwareBinaryStream.StructClump) (this.header))._parent());
                        break;
                    }
                    case FRAME_LIST: {
                        if (!Objects.equals(((RenderwareBinaryStream.StructFrameList) (this.header))._root(), _root()))
                            throw new ConsistencyError("header", _root(), ((RenderwareBinaryStream.StructFrameList) (this.header))._root());
                        if (!Objects.equals(((RenderwareBinaryStream.StructFrameList) (this.header))._parent(), this))
                            throw new ConsistencyError("header", this, ((RenderwareBinaryStream.StructFrameList) (this.header))._parent());
                        break;
                    }
                    case GEOMETRY: {
                        if (!Objects.equals(((RenderwareBinaryStream.StructGeometry) (this.header))._root(), _root()))
                            throw new ConsistencyError("header", _root(), ((RenderwareBinaryStream.StructGeometry) (this.header))._root());
                        if (!Objects.equals(((RenderwareBinaryStream.StructGeometry) (this.header))._parent(), this))
                            throw new ConsistencyError("header", this, ((RenderwareBinaryStream.StructGeometry) (this.header))._parent());
                        break;
                    }
                    case GEOMETRY_LIST: {
                        if (!Objects.equals(((RenderwareBinaryStream.StructGeometryList) (this.header))._root(), _root()))
                            throw new ConsistencyError("header", _root(), ((RenderwareBinaryStream.StructGeometryList) (this.header))._root());
                        if (!Objects.equals(((RenderwareBinaryStream.StructGeometryList) (this.header))._parent(), this))
                            throw new ConsistencyError("header", this, ((RenderwareBinaryStream.StructGeometryList) (this.header))._parent());
                        break;
                    }
                    case TEXTURE_DICTIONARY: {
                        if (!Objects.equals(((RenderwareBinaryStream.StructTextureDictionary) (this.header))._root(), _root()))
                            throw new ConsistencyError("header", _root(), ((RenderwareBinaryStream.StructTextureDictionary) (this.header))._root());
                        if (!Objects.equals(((RenderwareBinaryStream.StructTextureDictionary) (this.header))._parent(), this))
                            throw new ConsistencyError("header", this, ((RenderwareBinaryStream.StructTextureDictionary) (this.header))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.header)).length != headerSize())
                            throw new ConsistencyError("header", headerSize(), ((byte[]) (this.header)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.header)).length != headerSize())
                        throw new ConsistencyError("header", headerSize(), ((byte[]) (this.header)).length);
                }
            }
            for (int i = 0; i < this.entries.size(); i++) {
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private Integer version;
        public Integer version() {
            if (this.version != null)
                return this.version;
            this.version = ((Number) (((libraryIdStamp() & 4294901760L) != 0 ? (libraryIdStamp() >> 14 & 261888) + 196608 | libraryIdStamp() >> 16 & 63 : libraryIdStamp() << 8))).intValue();
            return this.version;
        }
        public void _invalidateVersion() { this.version = null; }
        private byte[] code;
        private long headerSize;
        private long libraryIdStamp;
        private Object header;
        private List<RenderwareBinaryStream> entries;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream _parent;
        private byte[] _raw_header;
        public byte[] code() { return code; }
        public void setCode(byte[] _v) { _dirty = true; code = _v; }
        public long headerSize() { return headerSize; }
        public void setHeaderSize(long _v) { _dirty = true; headerSize = _v; }
        public long libraryIdStamp() { return libraryIdStamp; }
        public void setLibraryIdStamp(long _v) { _dirty = true; libraryIdStamp = _v; }
        public Object header() { return header; }
        public void setHeader(Object _v) { _dirty = true; header = _v; }
        public List<RenderwareBinaryStream> entries() { return entries; }
        public void setEntries(List<RenderwareBinaryStream> _v) { _dirty = true; entries = _v; }
        public RenderwareBinaryStream _root() { return _root; }
        public void set_root(RenderwareBinaryStream _v) { _dirty = true; _root = _v; }
        public RenderwareBinaryStream _parent() { return _parent; }
        public void set_parent(RenderwareBinaryStream _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_header() { return _raw_header; }
        public void set_raw_Header(byte[] _v) { _dirty = true; _raw_header = _v; }
    }

    /**
     * @see <a href="https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure">Source</a>
     */
    public static class Matrix extends KaitaiStruct.ReadWrite {
        public static Matrix fromFile(String fileName) throws IOException {
            return new Matrix(new ByteBufferKaitaiStream(fileName));
        }
        public Matrix() {
            this(null, null, null);
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
        }
        public void _read() {
            this.entries = new ArrayList<Vector3d>();
            for (int i = 0; i < 3; i++) {
                Vector3d _t_entries = new Vector3d(this._io, this, _root);
                try {
                    _t_entries._read();
                } finally {
                    this.entries.add(_t_entries);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.entries.size() != 3)
                throw new ConsistencyError("entries", 3, this.entries.size());
            for (int i = 0; i < this.entries.size(); i++) {
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<Vector3d> entries;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.Frame _parent;
        public List<Vector3d> entries() { return entries; }
        public void setEntries(List<Vector3d> _v) { _dirty = true; entries = _v; }
        public RenderwareBinaryStream _root() { return _root; }
        public void set_root(RenderwareBinaryStream _v) { _dirty = true; _root = _v; }
        public RenderwareBinaryStream.Frame _parent() { return _parent; }
        public void set_parent(RenderwareBinaryStream.Frame _v) { _dirty = true; _parent = _v; }
    }
    public static class MorphTarget extends KaitaiStruct.ReadWrite {
        public static MorphTarget fromFile(String fileName) throws IOException {
            return new MorphTarget(new ByteBufferKaitaiStream(fileName));
        }
        public MorphTarget() {
            this(null, null, null);
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
        }
        public void _read() {
            this.boundingSphere = new Sphere(this._io, this, _root);
            this.boundingSphere._read();
            this.hasVertices = this._io.readU4le();
            this.hasNormals = this._io.readU4le();
            if (hasVertices() != 0) {
                this.vertices = new ArrayList<Vector3d>();
                for (int i = 0; i < _parent().numVertices(); i++) {
                    Vector3d _t_vertices = new Vector3d(this._io, this, _root);
                    try {
                        _t_vertices._read();
                    } finally {
                        this.vertices.add(_t_vertices);
                    }
                }
            }
            if (hasNormals() != 0) {
                this.normals = new ArrayList<Vector3d>();
                for (int i = 0; i < _parent().numVertices(); i++) {
                    Vector3d _t_normals = new Vector3d(this._io, this, _root);
                    try {
                        _t_normals._read();
                    } finally {
                        this.normals.add(_t_normals);
                    }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.boundingSphere._fetchInstances();
            if (hasVertices() != 0) {
                for (int i = 0; i < this.vertices.size(); i++) {
                    this.vertices.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
            if (hasNormals() != 0) {
                for (int i = 0; i < this.normals.size(); i++) {
                    this.normals.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.boundingSphere._write_Seq(this._io);
            this._io.writeU4le(this.hasVertices);
            this._io.writeU4le(this.hasNormals);
            if (hasVertices() != 0) {
                for (int i = 0; i < this.vertices.size(); i++) {
                    this.vertices.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }
            if (hasNormals() != 0) {
                for (int i = 0; i < this.normals.size(); i++) {
                    this.normals.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }
        }

        public void _check() {
            if (!Objects.equals(this.boundingSphere._root(), _root()))
                throw new ConsistencyError("bounding_sphere", _root(), this.boundingSphere._root());
            if (!Objects.equals(this.boundingSphere._parent(), this))
                throw new ConsistencyError("bounding_sphere", this, this.boundingSphere._parent());
            if (hasVertices() != 0) {
                if (this.vertices.size() != _parent().numVertices())
                    throw new ConsistencyError("vertices", _parent().numVertices(), this.vertices.size());
                for (int i = 0; i < this.vertices.size(); i++) {
                    if (!Objects.equals(this.vertices.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("vertices", _root(), this.vertices.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.vertices.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("vertices", this, this.vertices.get(((Number) (i)).intValue())._parent());
                }
            }
            if (hasNormals() != 0) {
                if (this.normals.size() != _parent().numVertices())
                    throw new ConsistencyError("normals", _parent().numVertices(), this.normals.size());
                for (int i = 0; i < this.normals.size(); i++) {
                    if (!Objects.equals(this.normals.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("normals", _root(), this.normals.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.normals.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("normals", this, this.normals.get(((Number) (i)).intValue())._parent());
                }
            }
            _dirty = false;
        }
        private Sphere boundingSphere;
        private long hasVertices;
        private long hasNormals;
        private List<Vector3d> vertices;
        private List<Vector3d> normals;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.StructGeometry _parent;
        public Sphere boundingSphere() { return boundingSphere; }
        public void setBoundingSphere(Sphere _v) { _dirty = true; boundingSphere = _v; }
        public long hasVertices() { return hasVertices; }
        public void setHasVertices(long _v) { _dirty = true; hasVertices = _v; }
        public long hasNormals() { return hasNormals; }
        public void setHasNormals(long _v) { _dirty = true; hasNormals = _v; }
        public List<Vector3d> vertices() { return vertices; }
        public void setVertices(List<Vector3d> _v) { _dirty = true; vertices = _v; }
        public List<Vector3d> normals() { return normals; }
        public void setNormals(List<Vector3d> _v) { _dirty = true; normals = _v; }
        public RenderwareBinaryStream _root() { return _root; }
        public void set_root(RenderwareBinaryStream _v) { _dirty = true; _root = _v; }
        public RenderwareBinaryStream.StructGeometry _parent() { return _parent; }
        public void set_parent(RenderwareBinaryStream.StructGeometry _v) { _dirty = true; _parent = _v; }
    }
    public static class Rgba extends KaitaiStruct.ReadWrite {
        public static Rgba fromFile(String fileName) throws IOException {
            return new Rgba(new ByteBufferKaitaiStream(fileName));
        }
        public Rgba() {
            this(null, null, null);
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
        }
        public void _read() {
            this.r = this._io.readU1();
            this.g = this._io.readU1();
            this.b = this._io.readU1();
            this.a = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.r);
            this._io.writeU1(this.g);
            this._io.writeU1(this.b);
            this._io.writeU1(this.a);
        }

        public void _check() {
            _dirty = false;
        }
        private int r;
        private int g;
        private int b;
        private int a;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.GeometryNonNative _parent;
        public int r() { return r; }
        public void setR(int _v) { _dirty = true; r = _v; }
        public int g() { return g; }
        public void setG(int _v) { _dirty = true; g = _v; }
        public int b() { return b; }
        public void setB(int _v) { _dirty = true; b = _v; }
        public int a() { return a; }
        public void setA(int _v) { _dirty = true; a = _v; }
        public RenderwareBinaryStream _root() { return _root; }
        public void set_root(RenderwareBinaryStream _v) { _dirty = true; _root = _v; }
        public RenderwareBinaryStream.GeometryNonNative _parent() { return _parent; }
        public void set_parent(RenderwareBinaryStream.GeometryNonNative _v) { _dirty = true; _parent = _v; }
    }
    public static class Sphere extends KaitaiStruct.ReadWrite {
        public static Sphere fromFile(String fileName) throws IOException {
            return new Sphere(new ByteBufferKaitaiStream(fileName));
        }
        public Sphere() {
            this(null, null, null);
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
        }
        public void _read() {
            this.x = this._io.readF4le();
            this.y = this._io.readF4le();
            this.z = this._io.readF4le();
            this.radius = this._io.readF4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeF4le(this.x);
            this._io.writeF4le(this.y);
            this._io.writeF4le(this.z);
            this._io.writeF4le(this.radius);
        }

        public void _check() {
            _dirty = false;
        }
        private float x;
        private float y;
        private float z;
        private float radius;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.MorphTarget _parent;
        public float x() { return x; }
        public void setX(float _v) { _dirty = true; x = _v; }
        public float y() { return y; }
        public void setY(float _v) { _dirty = true; y = _v; }
        public float z() { return z; }
        public void setZ(float _v) { _dirty = true; z = _v; }
        public float radius() { return radius; }
        public void setRadius(float _v) { _dirty = true; radius = _v; }
        public RenderwareBinaryStream _root() { return _root; }
        public void set_root(RenderwareBinaryStream _v) { _dirty = true; _root = _v; }
        public RenderwareBinaryStream.MorphTarget _parent() { return _parent; }
        public void set_parent(RenderwareBinaryStream.MorphTarget _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://gtamods.com/wiki/Atomic_(RW_Section)#Structure">Source</a>
     */
    public static class StructAtomic extends KaitaiStruct.ReadWrite {
        public static StructAtomic fromFile(String fileName) throws IOException {
            return new StructAtomic(new ByteBufferKaitaiStream(fileName));
        }
        public StructAtomic() {
            this(null, null, null);
        }

        public StructAtomic(KaitaiStream _io) {
            this(_io, null, null);
        }

        public StructAtomic(KaitaiStream _io, RenderwareBinaryStream.ListWithHeader _parent) {
            this(_io, _parent, null);
        }

        public StructAtomic(KaitaiStream _io, RenderwareBinaryStream.ListWithHeader _parent, RenderwareBinaryStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.frameIndex = this._io.readU4le();
            this.geometryIndex = this._io.readU4le();
            this.flagRender = this._io.readBitsIntLe(1) != 0;
            this._unnamed3 = this._io.readBitsIntLe(1) != 0;
            this.flagCollisionTest = this._io.readBitsIntLe(1) != 0;
            this._unnamed5 = this._io.readBitsIntLe(29);
            this.unused = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.frameIndex);
            this._io.writeU4le(this.geometryIndex);
            this._io.writeBitsIntLe(1, (this.flagRender ? 1 : 0));
            this._io.writeBitsIntLe(1, (this._unnamed3 ? 1 : 0));
            this._io.writeBitsIntLe(1, (this.flagCollisionTest ? 1 : 0));
            this._io.writeBitsIntLe(29, this._unnamed5);
            this._io.writeU4le(this.unused);
        }

        public void _check() {
            _dirty = false;
        }
        private long frameIndex;
        private long geometryIndex;
        private boolean flagRender;
        private boolean _unnamed3;
        private boolean flagCollisionTest;
        private long _unnamed5;
        private long unused;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.ListWithHeader _parent;
        public long frameIndex() { return frameIndex; }
        public void setFrameIndex(long _v) { _dirty = true; frameIndex = _v; }
        public long geometryIndex() { return geometryIndex; }
        public void setGeometryIndex(long _v) { _dirty = true; geometryIndex = _v; }
        public boolean flagRender() { return flagRender; }
        public void setFlagRender(boolean _v) { _dirty = true; flagRender = _v; }
        public boolean _unnamed3() { return _unnamed3; }
        public void set_unnamed3(boolean _v) { _dirty = true; _unnamed3 = _v; }
        public boolean flagCollisionTest() { return flagCollisionTest; }
        public void setFlagCollisionTest(boolean _v) { _dirty = true; flagCollisionTest = _v; }
        public long _unnamed5() { return _unnamed5; }
        public void set_unnamed5(long _v) { _dirty = true; _unnamed5 = _v; }
        public long unused() { return unused; }
        public void setUnused(long _v) { _dirty = true; unused = _v; }
        public RenderwareBinaryStream _root() { return _root; }
        public void set_root(RenderwareBinaryStream _v) { _dirty = true; _root = _v; }
        public RenderwareBinaryStream.ListWithHeader _parent() { return _parent; }
        public void set_parent(RenderwareBinaryStream.ListWithHeader _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://gtamods.com/wiki/RpClump">Source</a>
     */
    public static class StructClump extends KaitaiStruct.ReadWrite {
        public static StructClump fromFile(String fileName) throws IOException {
            return new StructClump(new ByteBufferKaitaiStream(fileName));
        }
        public StructClump() {
            this(null, null, null);
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
        }
        public void _read() {
            this.numAtomics = this._io.readU4le();
            if (_parent().version() >= 208896) {
                this.numLights = this._io.readU4le();
            }
            if (_parent().version() >= 208896) {
                this.numCameras = this._io.readU4le();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (_parent().version() >= 208896) {
            }
            if (_parent().version() >= 208896) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.numAtomics);
            if (_parent().version() >= 208896) {
                this._io.writeU4le(this.numLights);
            }
            if (_parent().version() >= 208896) {
                this._io.writeU4le(this.numCameras);
            }
        }

        public void _check() {
            if (_parent().version() >= 208896) {
            }
            if (_parent().version() >= 208896) {
            }
            _dirty = false;
        }
        private long numAtomics;
        private Long numLights;
        private Long numCameras;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.ListWithHeader _parent;
        public long numAtomics() { return numAtomics; }
        public void setNumAtomics(long _v) { _dirty = true; numAtomics = _v; }
        public Long numLights() { return numLights; }
        public void setNumLights(Long _v) { _dirty = true; numLights = _v; }
        public Long numCameras() { return numCameras; }
        public void setNumCameras(Long _v) { _dirty = true; numCameras = _v; }
        public RenderwareBinaryStream _root() { return _root; }
        public void set_root(RenderwareBinaryStream _v) { _dirty = true; _root = _v; }
        public RenderwareBinaryStream.ListWithHeader _parent() { return _parent; }
        public void set_parent(RenderwareBinaryStream.ListWithHeader _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure">Source</a>
     */
    public static class StructFrameList extends KaitaiStruct.ReadWrite {
        public static StructFrameList fromFile(String fileName) throws IOException {
            return new StructFrameList(new ByteBufferKaitaiStream(fileName));
        }
        public StructFrameList() {
            this(null, null, null);
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
        }
        public void _read() {
            this.numFrames = this._io.readU4le();
            this.frames = new ArrayList<Frame>();
            for (int i = 0; i < numFrames(); i++) {
                Frame _t_frames = new Frame(this._io, this, _root);
                try {
                    _t_frames._read();
                } finally {
                    this.frames.add(_t_frames);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.frames.size(); i++) {
                this.frames.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.numFrames);
            for (int i = 0; i < this.frames.size(); i++) {
                this.frames.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.frames.size() != numFrames())
                throw new ConsistencyError("frames", numFrames(), this.frames.size());
            for (int i = 0; i < this.frames.size(); i++) {
                if (!Objects.equals(this.frames.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("frames", _root(), this.frames.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.frames.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("frames", this, this.frames.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private long numFrames;
        private List<Frame> frames;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.ListWithHeader _parent;
        public long numFrames() { return numFrames; }
        public void setNumFrames(long _v) { _dirty = true; numFrames = _v; }
        public List<Frame> frames() { return frames; }
        public void setFrames(List<Frame> _v) { _dirty = true; frames = _v; }
        public RenderwareBinaryStream _root() { return _root; }
        public void set_root(RenderwareBinaryStream _v) { _dirty = true; _root = _v; }
        public RenderwareBinaryStream.ListWithHeader _parent() { return _parent; }
        public void set_parent(RenderwareBinaryStream.ListWithHeader _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://gtamods.com/wiki/RpGeometry">Source</a>
     */
    public static class StructGeometry extends KaitaiStruct.ReadWrite {
        public static StructGeometry fromFile(String fileName) throws IOException {
            return new StructGeometry(new ByteBufferKaitaiStream(fileName));
        }
        public StructGeometry() {
            this(null, null, null);
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
        }
        public void _read() {
            this.format = this._io.readU4le();
            this.numTriangles = this._io.readU4le();
            this.numVertices = this._io.readU4le();
            this.numMorphTargets = this._io.readU4le();
            if (_parent().version() < 212992) {
                this.surfProp = new SurfaceProperties(this._io, this, _root);
                this.surfProp._read();
            }
            if (!(isNative())) {
                this.geometry = new GeometryNonNative(this._io, this, _root);
                this.geometry._read();
            }
            this.morphTargets = new ArrayList<MorphTarget>();
            for (int i = 0; i < numMorphTargets(); i++) {
                MorphTarget _t_morphTargets = new MorphTarget(this._io, this, _root);
                try {
                    _t_morphTargets._read();
                } finally {
                    this.morphTargets.add(_t_morphTargets);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (_parent().version() < 212992) {
                this.surfProp._fetchInstances();
            }
            if (!(isNative())) {
                this.geometry._fetchInstances();
            }
            for (int i = 0; i < this.morphTargets.size(); i++) {
                this.morphTargets.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.format);
            this._io.writeU4le(this.numTriangles);
            this._io.writeU4le(this.numVertices);
            this._io.writeU4le(this.numMorphTargets);
            if (_parent().version() < 212992) {
                this.surfProp._write_Seq(this._io);
            }
            if (!(isNative())) {
                this.geometry._write_Seq(this._io);
            }
            for (int i = 0; i < this.morphTargets.size(); i++) {
                this.morphTargets.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (_parent().version() < 212992) {
                if (!Objects.equals(this.surfProp._root(), _root()))
                    throw new ConsistencyError("surf_prop", _root(), this.surfProp._root());
                if (!Objects.equals(this.surfProp._parent(), this))
                    throw new ConsistencyError("surf_prop", this, this.surfProp._parent());
            }
            if (!(isNative())) {
                if (!Objects.equals(this.geometry._root(), _root()))
                    throw new ConsistencyError("geometry", _root(), this.geometry._root());
                if (!Objects.equals(this.geometry._parent(), this))
                    throw new ConsistencyError("geometry", this, this.geometry._parent());
            }
            if (this.morphTargets.size() != numMorphTargets())
                throw new ConsistencyError("morph_targets", numMorphTargets(), this.morphTargets.size());
            for (int i = 0; i < this.morphTargets.size(); i++) {
                if (!Objects.equals(this.morphTargets.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("morph_targets", _root(), this.morphTargets.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.morphTargets.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("morph_targets", this, this.morphTargets.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private Boolean isNative;
        public Boolean isNative() {
            if (this.isNative != null)
                return this.isNative;
            this.isNative = (format() & 16777216) != 0;
            return this.isNative;
        }
        public void _invalidateIsNative() { this.isNative = null; }
        private Boolean isPrelit;
        public Boolean isPrelit() {
            if (this.isPrelit != null)
                return this.isPrelit;
            this.isPrelit = (format() & 8) != 0;
            return this.isPrelit;
        }
        public void _invalidateIsPrelit() { this.isPrelit = null; }
        private Boolean isTextured;
        public Boolean isTextured() {
            if (this.isTextured != null)
                return this.isTextured;
            this.isTextured = (format() & 4) != 0;
            return this.isTextured;
        }
        public void _invalidateIsTextured() { this.isTextured = null; }
        private Boolean isTextured2;
        public Boolean isTextured2() {
            if (this.isTextured2 != null)
                return this.isTextured2;
            this.isTextured2 = (format() & 128) != 0;
            return this.isTextured2;
        }
        public void _invalidateIsTextured2() { this.isTextured2 = null; }
        private Integer numUvLayers;
        public Integer numUvLayers() {
            if (this.numUvLayers != null)
                return this.numUvLayers;
            this.numUvLayers = ((Number) ((numUvLayersRaw() == 0 ? (isTextured2() ? 2 : (isTextured() ? 1 : 0)) : numUvLayersRaw()))).intValue();
            return this.numUvLayers;
        }
        public void _invalidateNumUvLayers() { this.numUvLayers = null; }
        private Integer numUvLayersRaw;
        public Integer numUvLayersRaw() {
            if (this.numUvLayersRaw != null)
                return this.numUvLayersRaw;
            this.numUvLayersRaw = ((Number) ((format() & 16711680) >> 16)).intValue();
            return this.numUvLayersRaw;
        }
        public void _invalidateNumUvLayersRaw() { this.numUvLayersRaw = null; }
        private long format;
        private long numTriangles;
        private long numVertices;
        private long numMorphTargets;
        private SurfaceProperties surfProp;
        private GeometryNonNative geometry;
        private List<MorphTarget> morphTargets;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.ListWithHeader _parent;
        public long format() { return format; }
        public void setFormat(long _v) { _dirty = true; format = _v; }
        public long numTriangles() { return numTriangles; }
        public void setNumTriangles(long _v) { _dirty = true; numTriangles = _v; }
        public long numVertices() { return numVertices; }
        public void setNumVertices(long _v) { _dirty = true; numVertices = _v; }
        public long numMorphTargets() { return numMorphTargets; }
        public void setNumMorphTargets(long _v) { _dirty = true; numMorphTargets = _v; }
        public SurfaceProperties surfProp() { return surfProp; }
        public void setSurfProp(SurfaceProperties _v) { _dirty = true; surfProp = _v; }
        public GeometryNonNative geometry() { return geometry; }
        public void setGeometry(GeometryNonNative _v) { _dirty = true; geometry = _v; }
        public List<MorphTarget> morphTargets() { return morphTargets; }
        public void setMorphTargets(List<MorphTarget> _v) { _dirty = true; morphTargets = _v; }
        public RenderwareBinaryStream _root() { return _root; }
        public void set_root(RenderwareBinaryStream _v) { _dirty = true; _root = _v; }
        public RenderwareBinaryStream.ListWithHeader _parent() { return _parent; }
        public void set_parent(RenderwareBinaryStream.ListWithHeader _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://gtamods.com/wiki/Geometry_List_(RW_Section)#Structure">Source</a>
     */
    public static class StructGeometryList extends KaitaiStruct.ReadWrite {
        public static StructGeometryList fromFile(String fileName) throws IOException {
            return new StructGeometryList(new ByteBufferKaitaiStream(fileName));
        }
        public StructGeometryList() {
            this(null, null, null);
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
        }
        public void _read() {
            this.numGeometries = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.numGeometries);
        }

        public void _check() {
            _dirty = false;
        }
        private long numGeometries;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.ListWithHeader _parent;
        public long numGeometries() { return numGeometries; }
        public void setNumGeometries(long _v) { _dirty = true; numGeometries = _v; }
        public RenderwareBinaryStream _root() { return _root; }
        public void set_root(RenderwareBinaryStream _v) { _dirty = true; _root = _v; }
        public RenderwareBinaryStream.ListWithHeader _parent() { return _parent; }
        public void set_parent(RenderwareBinaryStream.ListWithHeader _v) { _dirty = true; _parent = _v; }
    }
    public static class StructTextureDictionary extends KaitaiStruct.ReadWrite {
        public static StructTextureDictionary fromFile(String fileName) throws IOException {
            return new StructTextureDictionary(new ByteBufferKaitaiStream(fileName));
        }
        public StructTextureDictionary() {
            this(null, null, null);
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
        }
        public void _read() {
            this.numTextures = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.numTextures);
        }

        public void _check() {
            _dirty = false;
        }
        private long numTextures;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.ListWithHeader _parent;
        public long numTextures() { return numTextures; }
        public void setNumTextures(long _v) { _dirty = true; numTextures = _v; }
        public RenderwareBinaryStream _root() { return _root; }
        public void set_root(RenderwareBinaryStream _v) { _dirty = true; _root = _v; }
        public RenderwareBinaryStream.ListWithHeader _parent() { return _parent; }
        public void set_parent(RenderwareBinaryStream.ListWithHeader _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://gtamods.com/wiki/RpGeometry">Source</a>
     */
    public static class SurfaceProperties extends KaitaiStruct.ReadWrite {
        public static SurfaceProperties fromFile(String fileName) throws IOException {
            return new SurfaceProperties(new ByteBufferKaitaiStream(fileName));
        }
        public SurfaceProperties() {
            this(null, null, null);
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
        }
        public void _read() {
            this.ambient = this._io.readF4le();
            this.specular = this._io.readF4le();
            this.diffuse = this._io.readF4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeF4le(this.ambient);
            this._io.writeF4le(this.specular);
            this._io.writeF4le(this.diffuse);
        }

        public void _check() {
            _dirty = false;
        }
        private float ambient;
        private float specular;
        private float diffuse;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.StructGeometry _parent;
        public float ambient() { return ambient; }
        public void setAmbient(float _v) { _dirty = true; ambient = _v; }
        public float specular() { return specular; }
        public void setSpecular(float _v) { _dirty = true; specular = _v; }
        public float diffuse() { return diffuse; }
        public void setDiffuse(float _v) { _dirty = true; diffuse = _v; }
        public RenderwareBinaryStream _root() { return _root; }
        public void set_root(RenderwareBinaryStream _v) { _dirty = true; _root = _v; }
        public RenderwareBinaryStream.StructGeometry _parent() { return _parent; }
        public void set_parent(RenderwareBinaryStream.StructGeometry _v) { _dirty = true; _parent = _v; }
    }
    public static class TexCoord extends KaitaiStruct.ReadWrite {
        public static TexCoord fromFile(String fileName) throws IOException {
            return new TexCoord(new ByteBufferKaitaiStream(fileName));
        }
        public TexCoord() {
            this(null, null, null);
        }

        public TexCoord(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TexCoord(KaitaiStream _io, RenderwareBinaryStream.UvLayer _parent) {
            this(_io, _parent, null);
        }

        public TexCoord(KaitaiStream _io, RenderwareBinaryStream.UvLayer _parent, RenderwareBinaryStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.u = this._io.readF4le();
            this.v = this._io.readF4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeF4le(this.u);
            this._io.writeF4le(this.v);
        }

        public void _check() {
            _dirty = false;
        }
        private float u;
        private float v;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.UvLayer _parent;
        public float u() { return u; }
        public void setU(float _v) { _dirty = true; u = _v; }
        public float v() { return v; }
        public void setV(float _v) { _dirty = true; v = _v; }
        public RenderwareBinaryStream _root() { return _root; }
        public void set_root(RenderwareBinaryStream _v) { _dirty = true; _root = _v; }
        public RenderwareBinaryStream.UvLayer _parent() { return _parent; }
        public void set_parent(RenderwareBinaryStream.UvLayer _v) { _dirty = true; _parent = _v; }
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

        public Triangle(KaitaiStream _io, RenderwareBinaryStream.GeometryNonNative _parent) {
            this(_io, _parent, null);
        }

        public Triangle(KaitaiStream _io, RenderwareBinaryStream.GeometryNonNative _parent, RenderwareBinaryStream _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.vertex2 = this._io.readU2le();
            this.vertex1 = this._io.readU2le();
            this.materialId = this._io.readU2le();
            this.vertex3 = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.vertex2);
            this._io.writeU2le(this.vertex1);
            this._io.writeU2le(this.materialId);
            this._io.writeU2le(this.vertex3);
        }

        public void _check() {
            _dirty = false;
        }
        private int vertex2;
        private int vertex1;
        private int materialId;
        private int vertex3;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.GeometryNonNative _parent;
        public int vertex2() { return vertex2; }
        public void setVertex2(int _v) { _dirty = true; vertex2 = _v; }
        public int vertex1() { return vertex1; }
        public void setVertex1(int _v) { _dirty = true; vertex1 = _v; }
        public int materialId() { return materialId; }
        public void setMaterialId(int _v) { _dirty = true; materialId = _v; }
        public int vertex3() { return vertex3; }
        public void setVertex3(int _v) { _dirty = true; vertex3 = _v; }
        public RenderwareBinaryStream _root() { return _root; }
        public void set_root(RenderwareBinaryStream _v) { _dirty = true; _root = _v; }
        public RenderwareBinaryStream.GeometryNonNative _parent() { return _parent; }
        public void set_parent(RenderwareBinaryStream.GeometryNonNative _v) { _dirty = true; _parent = _v; }
    }
    public static class UvLayer extends KaitaiStruct.ReadWrite {
        public UvLayer(long numVertices) {
            this(null, null, null, numVertices);
        }

        public UvLayer(KaitaiStream _io, long numVertices) {
            this(_io, null, null, numVertices);
        }

        public UvLayer(KaitaiStream _io, RenderwareBinaryStream.GeometryNonNative _parent, long numVertices) {
            this(_io, _parent, null, numVertices);
        }

        public UvLayer(KaitaiStream _io, RenderwareBinaryStream.GeometryNonNative _parent, RenderwareBinaryStream _root, long numVertices) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.numVertices = numVertices;
        }
        public void _read() {
            this.texCoords = new ArrayList<TexCoord>();
            for (int i = 0; i < numVertices(); i++) {
                TexCoord _t_texCoords = new TexCoord(this._io, this, _root);
                try {
                    _t_texCoords._read();
                } finally {
                    this.texCoords.add(_t_texCoords);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.texCoords.size(); i++) {
                this.texCoords.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.texCoords.size(); i++) {
                this.texCoords.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.texCoords.size() != numVertices())
                throw new ConsistencyError("tex_coords", numVertices(), this.texCoords.size());
            for (int i = 0; i < this.texCoords.size(); i++) {
                if (!Objects.equals(this.texCoords.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("tex_coords", _root(), this.texCoords.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.texCoords.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("tex_coords", this, this.texCoords.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<TexCoord> texCoords;
        private long numVertices;
        private RenderwareBinaryStream _root;
        private RenderwareBinaryStream.GeometryNonNative _parent;
        public List<TexCoord> texCoords() { return texCoords; }
        public void setTexCoords(List<TexCoord> _v) { _dirty = true; texCoords = _v; }
        public long numVertices() { return numVertices; }
        public void setNumVertices(long _v) { _dirty = true; numVertices = _v; }
        public RenderwareBinaryStream _root() { return _root; }
        public void set_root(RenderwareBinaryStream _v) { _dirty = true; _root = _v; }
        public RenderwareBinaryStream.GeometryNonNative _parent() { return _parent; }
        public void set_parent(RenderwareBinaryStream.GeometryNonNative _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure">Source</a>
     */
    public static class Vector3d extends KaitaiStruct.ReadWrite {
        public static Vector3d fromFile(String fileName) throws IOException {
            return new Vector3d(new ByteBufferKaitaiStream(fileName));
        }
        public Vector3d() {
            this(null, null, null);
        }

        public Vector3d(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Vector3d(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Vector3d(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, RenderwareBinaryStream _root) {
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
        private RenderwareBinaryStream _root;
        private KaitaiStruct.ReadWrite _parent;
        public float x() { return x; }
        public void setX(float _v) { _dirty = true; x = _v; }
        public float y() { return y; }
        public void setY(float _v) { _dirty = true; y = _v; }
        public float z() { return z; }
        public void setZ(float _v) { _dirty = true; z = _v; }
        public RenderwareBinaryStream _root() { return _root; }
        public void set_root(RenderwareBinaryStream _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    private Integer version;
    public Integer version() {
        if (this.version != null)
            return this.version;
        this.version = ((Number) (((libraryIdStamp() & 4294901760L) != 0 ? (libraryIdStamp() >> 14 & 261888) + 196608 | libraryIdStamp() >> 16 & 63 : libraryIdStamp() << 8))).intValue();
        return this.version;
    }
    public void _invalidateVersion() { this.version = null; }
    private Sections code;
    private long size;
    private long libraryIdStamp;
    private Object body;
    private RenderwareBinaryStream _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_body;
    public Sections code() { return code; }
    public void setCode(Sections _v) { _dirty = true; code = _v; }
    public long size() { return size; }
    public void setSize(long _v) { _dirty = true; size = _v; }
    public long libraryIdStamp() { return libraryIdStamp; }
    public void setLibraryIdStamp(long _v) { _dirty = true; libraryIdStamp = _v; }
    public Object body() { return body; }
    public void setBody(Object _v) { _dirty = true; body = _v; }
    public RenderwareBinaryStream _root() { return _root; }
    public void set_root(RenderwareBinaryStream _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_body() { return _raw_body; }
    public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
}
