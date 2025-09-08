// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// The MD2 format is used for 3D animated models in id Sofware's Quake II.
    /// 
    /// A model consists of named `frames`, each with the same number of `vertices`
    /// (`vertices_per_frame`). Each such vertex has a `position` and `normal` in
    /// model space. Each vertex has the same topological &quot;meaning&quot; across frames, in
    /// terms of triangle and texture info; it just varies in position and normal for
    /// animation purposes.
    /// 
    /// How the vertices form triangles is defined via disjoint `triangles` or via
    /// `gl_cmds` (which allows strip and fan topology). Each triangle contains three
    /// `vertex_indices` into frame vertices, and three `tex_point_indices` into
    /// global `tex_coords`. Each texture point has pixel coords `s_px` and `t_px`
    /// ranging from 0 to `skin_{width,height}_px` respectively, along with
    /// `{s,t}_normalized` ranging from 0 to 1 for your convenience.
    /// 
    /// A GL command has a `primitive` type (`TRIANGLE_FAN` or `TRIANGLE_STRIP`) along
    /// with some `vertices`. Each GL vertex contains `tex_coords_normalized` from 0
    /// to 1, and a `vertex_index` into frame vertices.
    /// 
    /// A model may also contain `skins`, which are just file paths to PCX images.
    /// However, this is empty for many models, in which case it is up to the client
    /// (e.g. Q2PRO) to offer skins some other way (e.g. by similar filename in the
    /// current directory).
    /// 
    /// There are 198 `frames` in total, partitioned into a fixed set of ranges used
    /// for different animations. Each frame has a standard `name` for humans, but the
    /// client just uses their index and the name can be arbitrary. The name, start
    /// frame index and frame count of each animation can be looked up in the arrays
    /// `anim_names`, `anim_start_indices`, and `anim_num_frames` respectively. This
    /// information is summarized in the following table:
    /// 
    /// ```
    /// |   INDEX  |    NAME | SUFFIX | NOTES                                                  |
    /// |:--------:|--------:|:-------|:-------------------------------------------------------|
    /// |    0-39  |   stand | 01-40  | Idle animation                                         |
    /// |   40-45  |     run | 1-6    | Full run cycle                                         |
    /// |   46-53  |  attack | 1-8    | Shoot, reload; some weapons just repeat 1st few frames |
    /// |   54-57  |   pain1 | 01-04  | Q2Pro also uses this for switching weapons             |
    /// |   58-61  |   pain2 | 01-04  |                                                        |
    /// |   62-65  |   pain3 | 01-04  |                                                        |
    /// |   66-71  |    jump | 1-6    | Starts at height and lands on feet                     |
    /// |   72-83  |    flip | 01-12  | Flipoff, i.e. middle finger                            |
    /// |   84-94  |  salute | 01-11  |                                                        |
    /// |   95-111 |   taunt | 01-17  |                                                        |
    /// |  112-122 |    wave | 01-11  | Q2Pro plays this backwards for a handgrenade toss      |
    /// |  123-134 |   point | 01-12  |                                                        |
    /// |  135-153 |  crstnd | 01-19  | Idle while crouching                                   |
    /// |  154-159 |  crwalk | 1-6    |                                                        |
    /// |  160-168 | crattak | 1-9    |                                                        |
    /// |  169-172 |  crpain | 1-4    |                                                        |
    /// |  173-177 | crdeath | 1-5    |                                                        |
    /// |  178-183 |  death1 | 01-06  |                                                        |
    /// |  184-189 |  death2 | 01-06  |                                                        |
    /// |  190-197 |  death3 | 01-08  |                                                        |
    /// ```
    /// 
    /// The above are filled in for player models; for the separate weapon models,
    /// the final frame is 173 &quot;g_view&quot; (unknown purpose) since weapons aren't shown
    /// during death animations. `a_grenades.md2`, the handgrenade weapon model, is
    /// the same except that the `wave` frames are blank (according to the default
    /// female model files). This is likely due to its dual use as a grenade throw
    /// animation where this model must leave the player's model.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://icculus.org/~phaethon/q3a/formats/md2-schoenblum.html">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="http://tfc.duke.free.fr/coding/md2-specs-en.html">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="http://tastyspleen.net/~panjoo/downloads/quake2_model_frames.html">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="http://wiki.polycount.com/wiki/OldSiteResourcesQuake2FramesList">Source</a>
    /// </remarks>
    public partial class Quake2Md2 : KaitaiStruct
    {
        public static Quake2Md2 FromFile(string fileName)
        {
            return new Quake2Md2(new KaitaiStream(fileName));
        }


        public enum GlPrimitive
        {
            TriangleStrip = 0,
            TriangleFan = 1,
        }
        public Quake2Md2(KaitaiStream p__io, KaitaiStruct p__parent = null, Quake2Md2 p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_animNames = false;
            f_animNumFrames = false;
            f_animStartIndices = false;
            f_anormsTable = false;
            f_frames = false;
            f_glCmds = false;
            f_skins = false;
            f_texCoords = false;
            f_triangles = false;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 73, 68, 80, 50 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 73, 68, 80, 50 }, _magic, m_io, "/seq/0");
            }
            _version = m_io.ReadU4le();
            if (!(_version == 8))
            {
                throw new ValidationNotEqualError(8, _version, m_io, "/seq/1");
            }
            _skinWidthPx = m_io.ReadU4le();
            _skinHeightPx = m_io.ReadU4le();
            _bytesPerFrame = m_io.ReadU4le();
            _numSkins = m_io.ReadU4le();
            _verticesPerFrame = m_io.ReadU4le();
            _numTexCoords = m_io.ReadU4le();
            _numTriangles = m_io.ReadU4le();
            _numGlCmds = m_io.ReadU4le();
            _numFrames = m_io.ReadU4le();
            _ofsSkins = m_io.ReadU4le();
            _ofsTexCoords = m_io.ReadU4le();
            _ofsTriangles = m_io.ReadU4le();
            _ofsFrames = m_io.ReadU4le();
            _ofsGlCmds = m_io.ReadU4le();
            _ofsEof = m_io.ReadU4le();
        }
        public partial class CompressedVec : KaitaiStruct
        {
            public static CompressedVec FromFile(string fileName)
            {
                return new CompressedVec(new KaitaiStream(fileName));
            }

            public CompressedVec(KaitaiStream p__io, Quake2Md2.Vertex p__parent = null, Quake2Md2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_x = false;
                f_y = false;
                f_z = false;
                _read();
            }
            private void _read()
            {
                _xCompressed = m_io.ReadU1();
                _yCompressed = m_io.ReadU1();
                _zCompressed = m_io.ReadU1();
            }
            private bool f_x;
            private double _x;
            public double X
            {
                get
                {
                    if (f_x)
                        return _x;
                    f_x = true;
                    _x = (double) (XCompressed * M_Parent.M_Parent.Scale.X + M_Parent.M_Parent.Translate.X);
                    return _x;
                }
            }
            private bool f_y;
            private double _y;
            public double Y
            {
                get
                {
                    if (f_y)
                        return _y;
                    f_y = true;
                    _y = (double) (YCompressed * M_Parent.M_Parent.Scale.Y + M_Parent.M_Parent.Translate.Y);
                    return _y;
                }
            }
            private bool f_z;
            private double _z;
            public double Z
            {
                get
                {
                    if (f_z)
                        return _z;
                    f_z = true;
                    _z = (double) (ZCompressed * M_Parent.M_Parent.Scale.Z + M_Parent.M_Parent.Translate.Z);
                    return _z;
                }
            }
            private byte _xCompressed;
            private byte _yCompressed;
            private byte _zCompressed;
            private Quake2Md2 m_root;
            private Quake2Md2.Vertex m_parent;
            public byte XCompressed { get { return _xCompressed; } }
            public byte YCompressed { get { return _yCompressed; } }
            public byte ZCompressed { get { return _zCompressed; } }
            public Quake2Md2 M_Root { get { return m_root; } }
            public Quake2Md2.Vertex M_Parent { get { return m_parent; } }
        }
        public partial class Frame : KaitaiStruct
        {
            public static Frame FromFile(string fileName)
            {
                return new Frame(new KaitaiStream(fileName));
            }

            public Frame(KaitaiStream p__io, Quake2Md2 p__parent = null, Quake2Md2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _scale = new Vec3f(m_io, this, m_root);
                _translate = new Vec3f(m_io, this, m_root);
                _name = System.Text.Encoding.GetEncoding("ASCII").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(16), 0, false));
                _vertices = new List<Vertex>();
                for (var i = 0; i < M_Root.VerticesPerFrame; i++)
                {
                    _vertices.Add(new Vertex(m_io, this, m_root));
                }
            }
            private Vec3f _scale;
            private Vec3f _translate;
            private string _name;
            private List<Vertex> _vertices;
            private Quake2Md2 m_root;
            private Quake2Md2 m_parent;
            public Vec3f Scale { get { return _scale; } }
            public Vec3f Translate { get { return _translate; } }
            public string Name { get { return _name; } }
            public List<Vertex> Vertices { get { return _vertices; } }
            public Quake2Md2 M_Root { get { return m_root; } }
            public Quake2Md2 M_Parent { get { return m_parent; } }
        }
        public partial class GlCmd : KaitaiStruct
        {
            public static GlCmd FromFile(string fileName)
            {
                return new GlCmd(new KaitaiStream(fileName));
            }

            public GlCmd(KaitaiStream p__io, Quake2Md2.GlCmdsList p__parent = null, Quake2Md2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_numVertices = false;
                f_primitive = false;
                _read();
            }
            private void _read()
            {
                _cmdNumVertices = m_io.ReadS4le();
                _vertices = new List<GlVertex>();
                for (var i = 0; i < NumVertices; i++)
                {
                    _vertices.Add(new GlVertex(m_io, this, m_root));
                }
            }
            private bool f_numVertices;
            private int _numVertices;
            public int NumVertices
            {
                get
                {
                    if (f_numVertices)
                        return _numVertices;
                    f_numVertices = true;
                    _numVertices = (int) ((CmdNumVertices < 0 ? -(CmdNumVertices) : CmdNumVertices));
                    return _numVertices;
                }
            }
            private bool f_primitive;
            private GlPrimitive _primitive;
            public GlPrimitive Primitive
            {
                get
                {
                    if (f_primitive)
                        return _primitive;
                    f_primitive = true;
                    _primitive = (GlPrimitive) ((CmdNumVertices < 0 ? Quake2Md2.GlPrimitive.TriangleFan : Quake2Md2.GlPrimitive.TriangleStrip));
                    return _primitive;
                }
            }
            private int _cmdNumVertices;
            private List<GlVertex> _vertices;
            private Quake2Md2 m_root;
            private Quake2Md2.GlCmdsList m_parent;
            public int CmdNumVertices { get { return _cmdNumVertices; } }
            public List<GlVertex> Vertices { get { return _vertices; } }
            public Quake2Md2 M_Root { get { return m_root; } }
            public Quake2Md2.GlCmdsList M_Parent { get { return m_parent; } }
        }
        public partial class GlCmdsList : KaitaiStruct
        {
            public static GlCmdsList FromFile(string fileName)
            {
                return new GlCmdsList(new KaitaiStream(fileName));
            }

            public GlCmdsList(KaitaiStream p__io, Quake2Md2 p__parent = null, Quake2Md2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                if (!(M_Io.IsEof)) {
                    _items = new List<GlCmd>();
                    {
                        var i = 0;
                        GlCmd M_;
                        do {
                            M_ = new GlCmd(m_io, this, m_root);
                            _items.Add(M_);
                            i++;
                        } while (!(M_.CmdNumVertices == 0));
                    }
                }
            }
            private List<GlCmd> _items;
            private Quake2Md2 m_root;
            private Quake2Md2 m_parent;
            public List<GlCmd> Items { get { return _items; } }
            public Quake2Md2 M_Root { get { return m_root; } }
            public Quake2Md2 M_Parent { get { return m_parent; } }
        }
        public partial class GlVertex : KaitaiStruct
        {
            public static GlVertex FromFile(string fileName)
            {
                return new GlVertex(new KaitaiStream(fileName));
            }

            public GlVertex(KaitaiStream p__io, Quake2Md2.GlCmd p__parent = null, Quake2Md2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _texCoordsNormalized = new List<float>();
                for (var i = 0; i < 2; i++)
                {
                    _texCoordsNormalized.Add(m_io.ReadF4le());
                }
                _vertexIndex = m_io.ReadU4le();
            }
            private List<float> _texCoordsNormalized;
            private uint _vertexIndex;
            private Quake2Md2 m_root;
            private Quake2Md2.GlCmd m_parent;
            public List<float> TexCoordsNormalized { get { return _texCoordsNormalized; } }

            /// <summary>
            /// index to `_root.frames[i].vertices` (for each frame with index `i`)
            /// </summary>
            public uint VertexIndex { get { return _vertexIndex; } }
            public Quake2Md2 M_Root { get { return m_root; } }
            public Quake2Md2.GlCmd M_Parent { get { return m_parent; } }
        }
        public partial class TexPoint : KaitaiStruct
        {
            public static TexPoint FromFile(string fileName)
            {
                return new TexPoint(new KaitaiStream(fileName));
            }

            public TexPoint(KaitaiStream p__io, Quake2Md2 p__parent = null, Quake2Md2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_sNormalized = false;
                f_tNormalized = false;
                _read();
            }
            private void _read()
            {
                _sPx = m_io.ReadU2le();
                _tPx = m_io.ReadU2le();
            }
            private bool f_sNormalized;
            private double _sNormalized;
            public double SNormalized
            {
                get
                {
                    if (f_sNormalized)
                        return _sNormalized;
                    f_sNormalized = true;
                    _sNormalized = (double) ((SPx + 0.0) / M_Root.SkinWidthPx);
                    return _sNormalized;
                }
            }
            private bool f_tNormalized;
            private double _tNormalized;
            public double TNormalized
            {
                get
                {
                    if (f_tNormalized)
                        return _tNormalized;
                    f_tNormalized = true;
                    _tNormalized = (double) ((TPx + 0.0) / M_Root.SkinHeightPx);
                    return _tNormalized;
                }
            }
            private ushort _sPx;
            private ushort _tPx;
            private Quake2Md2 m_root;
            private Quake2Md2 m_parent;
            public ushort SPx { get { return _sPx; } }
            public ushort TPx { get { return _tPx; } }
            public Quake2Md2 M_Root { get { return m_root; } }
            public Quake2Md2 M_Parent { get { return m_parent; } }
        }
        public partial class Triangle : KaitaiStruct
        {
            public static Triangle FromFile(string fileName)
            {
                return new Triangle(new KaitaiStream(fileName));
            }

            public Triangle(KaitaiStream p__io, Quake2Md2 p__parent = null, Quake2Md2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _vertexIndices = new List<ushort>();
                for (var i = 0; i < 3; i++)
                {
                    _vertexIndices.Add(m_io.ReadU2le());
                }
                _texPointIndices = new List<ushort>();
                for (var i = 0; i < 3; i++)
                {
                    _texPointIndices.Add(m_io.ReadU2le());
                }
            }
            private List<ushort> _vertexIndices;
            private List<ushort> _texPointIndices;
            private Quake2Md2 m_root;
            private Quake2Md2 m_parent;

            /// <summary>
            /// indices to `_root.frames[i].vertices` (for each frame with index `i`)
            /// </summary>
            public List<ushort> VertexIndices { get { return _vertexIndices; } }

            /// <summary>
            /// indices to `_root.tex_coords`
            /// </summary>
            public List<ushort> TexPointIndices { get { return _texPointIndices; } }
            public Quake2Md2 M_Root { get { return m_root; } }
            public Quake2Md2 M_Parent { get { return m_parent; } }
        }
        public partial class Vec3f : KaitaiStruct
        {
            public static Vec3f FromFile(string fileName)
            {
                return new Vec3f(new KaitaiStream(fileName));
            }

            public Vec3f(KaitaiStream p__io, Quake2Md2.Frame p__parent = null, Quake2Md2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _x = m_io.ReadF4le();
                _y = m_io.ReadF4le();
                _z = m_io.ReadF4le();
            }
            private float _x;
            private float _y;
            private float _z;
            private Quake2Md2 m_root;
            private Quake2Md2.Frame m_parent;
            public float X { get { return _x; } }
            public float Y { get { return _y; } }
            public float Z { get { return _z; } }
            public Quake2Md2 M_Root { get { return m_root; } }
            public Quake2Md2.Frame M_Parent { get { return m_parent; } }
        }
        public partial class Vertex : KaitaiStruct
        {
            public static Vertex FromFile(string fileName)
            {
                return new Vertex(new KaitaiStream(fileName));
            }

            public Vertex(KaitaiStream p__io, Quake2Md2.Frame p__parent = null, Quake2Md2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_normal = false;
                _read();
            }
            private void _read()
            {
                _position = new CompressedVec(m_io, this, m_root);
                _normalIndex = m_io.ReadU1();
            }
            private bool f_normal;
            private List<double> _normal;
            public List<double> Normal
            {
                get
                {
                    if (f_normal)
                        return _normal;
                    f_normal = true;
                    _normal = (List<double>) (M_Root.AnormsTable[NormalIndex]);
                    return _normal;
                }
            }
            private CompressedVec _position;
            private byte _normalIndex;
            private Quake2Md2 m_root;
            private Quake2Md2.Frame m_parent;
            public CompressedVec Position { get { return _position; } }
            public byte NormalIndex { get { return _normalIndex; } }
            public Quake2Md2 M_Root { get { return m_root; } }
            public Quake2Md2.Frame M_Parent { get { return m_parent; } }
        }
        private bool f_animNames;
        private List<string> _animNames;
        public List<string> AnimNames
        {
            get
            {
                if (f_animNames)
                    return _animNames;
                f_animNames = true;
                _animNames = (List<string>) (new List<string> { "stand", "run", "attack", "pain1", "pain2", "pain3", "jump", "flip", "salute", "taunt", "wave", "point", "crstnd", "crwalk", "crattak", "crpain", "crdeath", "death1", "death2", "death3" });
                return _animNames;
            }
        }
        private bool f_animNumFrames;
        private byte[] _animNumFrames;
        public byte[] AnimNumFrames
        {
            get
            {
                if (f_animNumFrames)
                    return _animNumFrames;
                f_animNumFrames = true;
                _animNumFrames = (byte[]) (new byte[] { 40, 6, 8, 4, 4, 4, 6, 12, 11, 17, 11, 12, 19, 6, 9, 4, 5, 6, 6, 8 });
                return _animNumFrames;
            }
        }
        private bool f_animStartIndices;
        private byte[] _animStartIndices;
        public byte[] AnimStartIndices
        {
            get
            {
                if (f_animStartIndices)
                    return _animStartIndices;
                f_animStartIndices = true;
                _animStartIndices = (byte[]) (new byte[] { 0, 40, 46, 54, 58, 62, 66, 72, 84, 95, 112, 123, 135, 154, 160, 169, 173, 178, 184, 190 });
                return _animStartIndices;
            }
        }
        private bool f_anormsTable;
        private List<List<double>> _anormsTable;

        /// <remarks>
        /// Reference: <a href="https://github.com/skullernet/q2pro/blob/f4faabd/src/common/math.c#L80
        /// from">Quake anorms.h</a>
        /// </remarks>
        public List<List<double>> AnormsTable
        {
            get
            {
                if (f_anormsTable)
                    return _anormsTable;
                f_anormsTable = true;
                _anormsTable = (List<List<double>>) (new List<List<double>> { new List<double> { -0.525731, 0.000000, 0.850651 }, new List<double> { -0.442863, 0.238856, 0.864188 }, new List<double> { -0.295242, 0.000000, 0.955423 }, new List<double> { -0.309017, 0.500000, 0.809017 }, new List<double> { -0.162460, 0.262866, 0.951056 }, new List<double> { 0.000000, 0.000000, 1.000000 }, new List<double> { 0.000000, 0.850651, 0.525731 }, new List<double> { -0.147621, 0.716567, 0.681718 }, new List<double> { 0.147621, 0.716567, 0.681718 }, new List<double> { 0.000000, 0.525731, 0.850651 }, new List<double> { 0.309017, 0.500000, 0.809017 }, new List<double> { 0.525731, 0.000000, 0.850651 }, new List<double> { 0.295242, 0.000000, 0.955423 }, new List<double> { 0.442863, 0.238856, 0.864188 }, new List<double> { 0.162460, 0.262866, 0.951056 }, new List<double> { -0.681718, 0.147621, 0.716567 }, new List<double> { -0.809017, 0.309017, 0.500000 }, new List<double> { -0.587785, 0.425325, 0.688191 }, new List<double> { -0.850651, 0.525731, 0.000000 }, new List<double> { -0.864188, 0.442863, 0.238856 }, new List<double> { -0.716567, 0.681718, 0.147621 }, new List<double> { -0.688191, 0.587785, 0.425325 }, new List<double> { -0.500000, 0.809017, 0.309017 }, new List<double> { -0.238856, 0.864188, 0.442863 }, new List<double> { -0.425325, 0.688191, 0.587785 }, new List<double> { -0.716567, 0.681718, -0.147621 }, new List<double> { -0.500000, 0.809017, -0.309017 }, new List<double> { -0.525731, 0.850651, 0.000000 }, new List<double> { 0.000000, 0.850651, -0.525731 }, new List<double> { -0.238856, 0.864188, -0.442863 }, new List<double> { 0.000000, 0.955423, -0.295242 }, new List<double> { -0.262866, 0.951056, -0.162460 }, new List<double> { 0.000000, 1.000000, 0.000000 }, new List<double> { 0.000000, 0.955423, 0.295242 }, new List<double> { -0.262866, 0.951056, 0.162460 }, new List<double> { 0.238856, 0.864188, 0.442863 }, new List<double> { 0.262866, 0.951056, 0.162460 }, new List<double> { 0.500000, 0.809017, 0.309017 }, new List<double> { 0.238856, 0.864188, -0.442863 }, new List<double> { 0.262866, 0.951056, -0.162460 }, new List<double> { 0.500000, 0.809017, -0.309017 }, new List<double> { 0.850651, 0.525731, 0.000000 }, new List<double> { 0.716567, 0.681718, 0.147621 }, new List<double> { 0.716567, 0.681718, -0.147621 }, new List<double> { 0.525731, 0.850651, 0.000000 }, new List<double> { 0.425325, 0.688191, 0.587785 }, new List<double> { 0.864188, 0.442863, 0.238856 }, new List<double> { 0.688191, 0.587785, 0.425325 }, new List<double> { 0.809017, 0.309017, 0.500000 }, new List<double> { 0.681718, 0.147621, 0.716567 }, new List<double> { 0.587785, 0.425325, 0.688191 }, new List<double> { 0.955423, 0.295242, 0.000000 }, new List<double> { 1.000000, 0.000000, 0.000000 }, new List<double> { 0.951056, 0.162460, 0.262866 }, new List<double> { 0.850651, -0.525731, 0.000000 }, new List<double> { 0.955423, -0.295242, 0.000000 }, new List<double> { 0.864188, -0.442863, 0.238856 }, new List<double> { 0.951056, -0.162460, 0.262866 }, new List<double> { 0.809017, -0.309017, 0.500000 }, new List<double> { 0.681718, -0.147621, 0.716567 }, new List<double> { 0.850651, 0.000000, 0.525731 }, new List<double> { 0.864188, 0.442863, -0.238856 }, new List<double> { 0.809017, 0.309017, -0.500000 }, new List<double> { 0.951056, 0.162460, -0.262866 }, new List<double> { 0.525731, 0.000000, -0.850651 }, new List<double> { 0.681718, 0.147621, -0.716567 }, new List<double> { 0.681718, -0.147621, -0.716567 }, new List<double> { 0.850651, 0.000000, -0.525731 }, new List<double> { 0.809017, -0.309017, -0.500000 }, new List<double> { 0.864188, -0.442863, -0.238856 }, new List<double> { 0.951056, -0.162460, -0.262866 }, new List<double> { 0.147621, 0.716567, -0.681718 }, new List<double> { 0.309017, 0.500000, -0.809017 }, new List<double> { 0.425325, 0.688191, -0.587785 }, new List<double> { 0.442863, 0.238856, -0.864188 }, new List<double> { 0.587785, 0.425325, -0.688191 }, new List<double> { 0.688191, 0.587785, -0.425325 }, new List<double> { -0.147621, 0.716567, -0.681718 }, new List<double> { -0.309017, 0.500000, -0.809017 }, new List<double> { 0.000000, 0.525731, -0.850651 }, new List<double> { -0.525731, 0.000000, -0.850651 }, new List<double> { -0.442863, 0.238856, -0.864188 }, new List<double> { -0.295242, 0.000000, -0.955423 }, new List<double> { -0.162460, 0.262866, -0.951056 }, new List<double> { 0.000000, 0.000000, -1.000000 }, new List<double> { 0.295242, 0.000000, -0.955423 }, new List<double> { 0.162460, 0.262866, -0.951056 }, new List<double> { -0.442863, -0.238856, -0.864188 }, new List<double> { -0.309017, -0.500000, -0.809017 }, new List<double> { -0.162460, -0.262866, -0.951056 }, new List<double> { 0.000000, -0.850651, -0.525731 }, new List<double> { -0.147621, -0.716567, -0.681718 }, new List<double> { 0.147621, -0.716567, -0.681718 }, new List<double> { 0.000000, -0.525731, -0.850651 }, new List<double> { 0.309017, -0.500000, -0.809017 }, new List<double> { 0.442863, -0.238856, -0.864188 }, new List<double> { 0.162460, -0.262866, -0.951056 }, new List<double> { 0.238856, -0.864188, -0.442863 }, new List<double> { 0.500000, -0.809017, -0.309017 }, new List<double> { 0.425325, -0.688191, -0.587785 }, new List<double> { 0.716567, -0.681718, -0.147621 }, new List<double> { 0.688191, -0.587785, -0.425325 }, new List<double> { 0.587785, -0.425325, -0.688191 }, new List<double> { 0.000000, -0.955423, -0.295242 }, new List<double> { 0.000000, -1.000000, 0.000000 }, new List<double> { 0.262866, -0.951056, -0.162460 }, new List<double> { 0.000000, -0.850651, 0.525731 }, new List<double> { 0.000000, -0.955423, 0.295242 }, new List<double> { 0.238856, -0.864188, 0.442863 }, new List<double> { 0.262866, -0.951056, 0.162460 }, new List<double> { 0.500000, -0.809017, 0.309017 }, new List<double> { 0.716567, -0.681718, 0.147621 }, new List<double> { 0.525731, -0.850651, 0.000000 }, new List<double> { -0.238856, -0.864188, -0.442863 }, new List<double> { -0.500000, -0.809017, -0.309017 }, new List<double> { -0.262866, -0.951056, -0.162460 }, new List<double> { -0.850651, -0.525731, 0.000000 }, new List<double> { -0.716567, -0.681718, -0.147621 }, new List<double> { -0.716567, -0.681718, 0.147621 }, new List<double> { -0.525731, -0.850651, 0.000000 }, new List<double> { -0.500000, -0.809017, 0.309017 }, new List<double> { -0.238856, -0.864188, 0.442863 }, new List<double> { -0.262866, -0.951056, 0.162460 }, new List<double> { -0.864188, -0.442863, 0.238856 }, new List<double> { -0.809017, -0.309017, 0.500000 }, new List<double> { -0.688191, -0.587785, 0.425325 }, new List<double> { -0.681718, -0.147621, 0.716567 }, new List<double> { -0.442863, -0.238856, 0.864188 }, new List<double> { -0.587785, -0.425325, 0.688191 }, new List<double> { -0.309017, -0.500000, 0.809017 }, new List<double> { -0.147621, -0.716567, 0.681718 }, new List<double> { -0.425325, -0.688191, 0.587785 }, new List<double> { -0.162460, -0.262866, 0.951056 }, new List<double> { 0.442863, -0.238856, 0.864188 }, new List<double> { 0.162460, -0.262866, 0.951056 }, new List<double> { 0.309017, -0.500000, 0.809017 }, new List<double> { 0.147621, -0.716567, 0.681718 }, new List<double> { 0.000000, -0.525731, 0.850651 }, new List<double> { 0.425325, -0.688191, 0.587785 }, new List<double> { 0.587785, -0.425325, 0.688191 }, new List<double> { 0.688191, -0.587785, 0.425325 }, new List<double> { -0.955423, 0.295242, 0.000000 }, new List<double> { -0.951056, 0.162460, 0.262866 }, new List<double> { -1.000000, 0.000000, 0.000000 }, new List<double> { -0.850651, 0.000000, 0.525731 }, new List<double> { -0.955423, -0.295242, 0.000000 }, new List<double> { -0.951056, -0.162460, 0.262866 }, new List<double> { -0.864188, 0.442863, -0.238856 }, new List<double> { -0.951056, 0.162460, -0.262866 }, new List<double> { -0.809017, 0.309017, -0.500000 }, new List<double> { -0.864188, -0.442863, -0.238856 }, new List<double> { -0.951056, -0.162460, -0.262866 }, new List<double> { -0.809017, -0.309017, -0.500000 }, new List<double> { -0.681718, 0.147621, -0.716567 }, new List<double> { -0.681718, -0.147621, -0.716567 }, new List<double> { -0.850651, 0.000000, -0.525731 }, new List<double> { -0.688191, 0.587785, -0.425325 }, new List<double> { -0.587785, 0.425325, -0.688191 }, new List<double> { -0.425325, 0.688191, -0.587785 }, new List<double> { -0.425325, -0.688191, -0.587785 }, new List<double> { -0.587785, -0.425325, -0.688191 }, new List<double> { -0.688191, -0.587785, -0.425325 } });
                return _anormsTable;
            }
        }
        private bool f_frames;
        private List<Frame> _frames;
        public List<Frame> Frames
        {
            get
            {
                if (f_frames)
                    return _frames;
                f_frames = true;
                long _pos = m_io.Pos;
                m_io.Seek(OfsFrames);
                __raw_frames = new List<byte[]>();
                _frames = new List<Frame>();
                for (var i = 0; i < NumFrames; i++)
                {
                    __raw_frames.Add(m_io.ReadBytes(BytesPerFrame));
                    var io___raw_frames = new KaitaiStream(__raw_frames[__raw_frames.Count - 1]);
                    _frames.Add(new Frame(io___raw_frames, this, m_root));
                }
                m_io.Seek(_pos);
                return _frames;
            }
        }
        private bool f_glCmds;
        private GlCmdsList _glCmds;
        public GlCmdsList GlCmds
        {
            get
            {
                if (f_glCmds)
                    return _glCmds;
                f_glCmds = true;
                long _pos = m_io.Pos;
                m_io.Seek(OfsGlCmds);
                __raw_glCmds = m_io.ReadBytes(4 * NumGlCmds);
                var io___raw_glCmds = new KaitaiStream(__raw_glCmds);
                _glCmds = new GlCmdsList(io___raw_glCmds, this, m_root);
                m_io.Seek(_pos);
                return _glCmds;
            }
        }
        private bool f_skins;
        private List<string> _skins;
        public List<string> Skins
        {
            get
            {
                if (f_skins)
                    return _skins;
                f_skins = true;
                long _pos = m_io.Pos;
                m_io.Seek(OfsSkins);
                _skins = new List<string>();
                for (var i = 0; i < NumSkins; i++)
                {
                    _skins.Add(System.Text.Encoding.GetEncoding("ASCII").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(64), 0, false)));
                }
                m_io.Seek(_pos);
                return _skins;
            }
        }
        private bool f_texCoords;
        private List<TexPoint> _texCoords;
        public List<TexPoint> TexCoords
        {
            get
            {
                if (f_texCoords)
                    return _texCoords;
                f_texCoords = true;
                long _pos = m_io.Pos;
                m_io.Seek(OfsTexCoords);
                _texCoords = new List<TexPoint>();
                for (var i = 0; i < NumTexCoords; i++)
                {
                    _texCoords.Add(new TexPoint(m_io, this, m_root));
                }
                m_io.Seek(_pos);
                return _texCoords;
            }
        }
        private bool f_triangles;
        private List<Triangle> _triangles;
        public List<Triangle> Triangles
        {
            get
            {
                if (f_triangles)
                    return _triangles;
                f_triangles = true;
                long _pos = m_io.Pos;
                m_io.Seek(OfsTriangles);
                _triangles = new List<Triangle>();
                for (var i = 0; i < NumTriangles; i++)
                {
                    _triangles.Add(new Triangle(m_io, this, m_root));
                }
                m_io.Seek(_pos);
                return _triangles;
            }
        }
        private byte[] _magic;
        private uint _version;
        private uint _skinWidthPx;
        private uint _skinHeightPx;
        private uint _bytesPerFrame;
        private uint _numSkins;
        private uint _verticesPerFrame;
        private uint _numTexCoords;
        private uint _numTriangles;
        private uint _numGlCmds;
        private uint _numFrames;
        private uint _ofsSkins;
        private uint _ofsTexCoords;
        private uint _ofsTriangles;
        private uint _ofsFrames;
        private uint _ofsGlCmds;
        private uint _ofsEof;
        private Quake2Md2 m_root;
        private KaitaiStruct m_parent;
        private List<byte[]> __raw_frames;
        private byte[] __raw_glCmds;
        public byte[] Magic { get { return _magic; } }
        public uint Version { get { return _version; } }
        public uint SkinWidthPx { get { return _skinWidthPx; } }
        public uint SkinHeightPx { get { return _skinHeightPx; } }
        public uint BytesPerFrame { get { return _bytesPerFrame; } }
        public uint NumSkins { get { return _numSkins; } }
        public uint VerticesPerFrame { get { return _verticesPerFrame; } }
        public uint NumTexCoords { get { return _numTexCoords; } }
        public uint NumTriangles { get { return _numTriangles; } }
        public uint NumGlCmds { get { return _numGlCmds; } }
        public uint NumFrames { get { return _numFrames; } }
        public uint OfsSkins { get { return _ofsSkins; } }
        public uint OfsTexCoords { get { return _ofsTexCoords; } }
        public uint OfsTriangles { get { return _ofsTriangles; } }
        public uint OfsFrames { get { return _ofsFrames; } }
        public uint OfsGlCmds { get { return _ofsGlCmds; } }
        public uint OfsEof { get { return _ofsEof; } }
        public Quake2Md2 M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public List<byte[]> M_RawFrames { get { return __raw_frames; } }
        public byte[] M_RawGlCmds { get { return __raw_glCmds; } }
    }
}
