// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Quake 1 model format is used to store 3D models completely with
    /// textures and animations used in the game. Quake 1 engine
    /// (retroactively named &quot;idtech2&quot;) is a popular 3D engine first used
    /// for Quake game by id Software in 1996.
    /// 
    /// Model is constructed traditionally from vertices in 3D space, faces
    /// which connect vertices, textures (&quot;skins&quot;, i.e. 2D bitmaps) and
    /// texture UV mapping information. As opposed to more modern,
    /// bones-based animation formats, Quake model was animated by changing
    /// locations of all vertices it included in 3D space, frame by frame.
    /// 
    /// File format stores:
    /// 
    /// * &quot;Skins&quot; — effectively 2D bitmaps which will be used as a
    ///   texture. Every model can have multiple skins — e.g. these can be
    ///   switched to depict various levels of damage to the
    ///   monsters. Bitmaps are 8-bit-per-pixel, indexed in global Quake
    ///   palette, subject to lighting and gamma adjustment when rendering
    ///   in the game using colormap technique.
    /// * &quot;Texture coordinates&quot; — UV coordinates, mapping 3D vertices to
    ///   skin coordinates.
    /// * &quot;Triangles&quot; — triangular faces connecting 3D vertices.
    /// * &quot;Frames&quot; — locations of vertices in 3D space; can include more
    ///   than one frame, thus allowing representation of different frames
    ///   for animation purposes.
    /// 
    /// Originally, 3D geometry for models for Quake was designed in [Alias
    /// PowerAnimator](https://en.wikipedia.org/wiki/PowerAnimator),
    /// precursor of modern day Autodesk Maya and Autodesk Alias. Therefore,
    /// 3D-related part of Quake model format followed closely Alias TRI
    /// format, and Quake development utilities included a converter from Alias
    /// TRI (`modelgen`).
    /// 
    /// Skins (textures) where prepared as LBM bitmaps with the help from
    /// `texmap` utility in the same development utilities toolkit.
    /// </summary>
    public partial class QuakeMdl : KaitaiStruct
    {
        public static QuakeMdl FromFile(string fileName)
        {
            return new QuakeMdl(new KaitaiStream(fileName));
        }

        public QuakeMdl(KaitaiStream p__io, KaitaiStruct p__parent = null, QuakeMdl p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _header = new MdlHeader(m_io, this, m_root);
            _skins = new List<MdlSkin>();
            for (var i = 0; i < Header.NumSkins; i++)
            {
                _skins.Add(new MdlSkin(m_io, this, m_root));
            }
            _textureCoordinates = new List<MdlTexcoord>();
            for (var i = 0; i < Header.NumVerts; i++)
            {
                _textureCoordinates.Add(new MdlTexcoord(m_io, this, m_root));
            }
            _triangles = new List<MdlTriangle>();
            for (var i = 0; i < Header.NumTris; i++)
            {
                _triangles.Add(new MdlTriangle(m_io, this, m_root));
            }
            _frames = new List<MdlFrame>();
            for (var i = 0; i < Header.NumFrames; i++)
            {
                _frames.Add(new MdlFrame(m_io, this, m_root));
            }
        }
        public partial class MdlVertex : KaitaiStruct
        {
            public static MdlVertex FromFile(string fileName)
            {
                return new MdlVertex(new KaitaiStream(fileName));
            }

            public MdlVertex(KaitaiStream p__io, KaitaiStruct p__parent = null, QuakeMdl p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _values = new List<byte>();
                for (var i = 0; i < 3; i++)
                {
                    _values.Add(m_io.ReadU1());
                }
                _normalIndex = m_io.ReadU1();
            }
            private List<byte> _values;
            private byte _normalIndex;
            private QuakeMdl m_root;
            private KaitaiStruct m_parent;
            public List<byte> Values { get { return _values; } }
            public byte NormalIndex { get { return _normalIndex; } }
            public QuakeMdl M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L79-L83">Source</a>
        /// </remarks>
        /// <remarks>
        /// Reference: <a href="https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD2">Source</a>
        /// </remarks>
        public partial class MdlTexcoord : KaitaiStruct
        {
            public static MdlTexcoord FromFile(string fileName)
            {
                return new MdlTexcoord(new KaitaiStream(fileName));
            }

            public MdlTexcoord(KaitaiStream p__io, QuakeMdl p__parent = null, QuakeMdl p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _onSeam = m_io.ReadS4le();
                _s = m_io.ReadS4le();
                _t = m_io.ReadS4le();
            }
            private int _onSeam;
            private int _s;
            private int _t;
            private QuakeMdl m_root;
            private QuakeMdl m_parent;
            public int OnSeam { get { return _onSeam; } }
            public int S { get { return _s; } }
            public int T { get { return _t; } }
            public QuakeMdl M_Root { get { return m_root; } }
            public QuakeMdl M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L59-L75">Source</a>
        /// </remarks>
        /// <remarks>
        /// Reference: <a href="https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD0">Source</a>
        /// </remarks>
        public partial class MdlHeader : KaitaiStruct
        {
            public static MdlHeader FromFile(string fileName)
            {
                return new MdlHeader(new KaitaiStream(fileName));
            }

            public MdlHeader(KaitaiStream p__io, QuakeMdl p__parent = null, QuakeMdl p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_skinSize = false;
                _read();
            }
            private void _read()
            {
                _ident = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(Ident, new byte[] { 73, 68, 80, 79 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 73, 68, 80, 79 }, Ident, M_Io, "/types/mdl_header/seq/0");
                }
                _version = m_io.ReadS4le();
                if (!(Version == 6))
                {
                    throw new ValidationNotEqualError(6, Version, M_Io, "/types/mdl_header/seq/1");
                }
                _scale = new Vec3(m_io, this, m_root);
                _origin = new Vec3(m_io, this, m_root);
                _radius = m_io.ReadF4le();
                _eyePosition = new Vec3(m_io, this, m_root);
                _numSkins = m_io.ReadS4le();
                _skinWidth = m_io.ReadS4le();
                _skinHeight = m_io.ReadS4le();
                _numVerts = m_io.ReadS4le();
                _numTris = m_io.ReadS4le();
                _numFrames = m_io.ReadS4le();
                _synctype = m_io.ReadS4le();
                _flags = m_io.ReadS4le();
                _size = m_io.ReadF4le();
            }
            private bool f_skinSize;
            private int _skinSize;

            /// <summary>
            /// Skin size in pixels.
            /// </summary>
            public int SkinSize
            {
                get
                {
                    if (f_skinSize)
                        return _skinSize;
                    _skinSize = (int) ((SkinWidth * SkinHeight));
                    f_skinSize = true;
                    return _skinSize;
                }
            }
            private byte[] _ident;
            private int _version;
            private Vec3 _scale;
            private Vec3 _origin;
            private float _radius;
            private Vec3 _eyePosition;
            private int _numSkins;
            private int _skinWidth;
            private int _skinHeight;
            private int _numVerts;
            private int _numTris;
            private int _numFrames;
            private int _synctype;
            private int _flags;
            private float _size;
            private QuakeMdl m_root;
            private QuakeMdl m_parent;

            /// <summary>
            /// Magic signature bytes that every Quake model must
            /// have. &quot;IDPO&quot; is short for &quot;IDPOLYHEADER&quot;.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L132-L133">Source</a>
            /// </remarks>
            public byte[] Ident { get { return _ident; } }
            public int Version { get { return _version; } }

            /// <summary>
            /// Global scaling factors in 3 dimensions for whole model. When
            /// represented in 3D world, this model local coordinates will
            /// be multiplied by these factors.
            /// </summary>
            public Vec3 Scale { get { return _scale; } }
            public Vec3 Origin { get { return _origin; } }
            public float Radius { get { return _radius; } }
            public Vec3 EyePosition { get { return _eyePosition; } }

            /// <summary>
            /// Number of skins (=texture bitmaps) included in this model.
            /// </summary>
            public int NumSkins { get { return _numSkins; } }

            /// <summary>
            /// Width (U coordinate max) of every skin (=texture) in pixels.
            /// </summary>
            public int SkinWidth { get { return _skinWidth; } }

            /// <summary>
            /// Height (V coordinate max) of every skin (=texture) in
            /// pixels.
            /// </summary>
            public int SkinHeight { get { return _skinHeight; } }

            /// <summary>
            /// Number of vertices in this model. Note that this is constant
            /// for all the animation frames and all textures.
            /// </summary>
            public int NumVerts { get { return _numVerts; } }

            /// <summary>
            /// Number of triangles (=triangular faces) in this model.
            /// </summary>
            public int NumTris { get { return _numTris; } }

            /// <summary>
            /// Number of animation frames included in this model.
            /// </summary>
            public int NumFrames { get { return _numFrames; } }
            public int Synctype { get { return _synctype; } }
            public int Flags { get { return _flags; } }
            public float Size { get { return _size; } }
            public QuakeMdl M_Root { get { return m_root; } }
            public QuakeMdl M_Parent { get { return m_parent; } }
        }
        public partial class MdlSkin : KaitaiStruct
        {
            public static MdlSkin FromFile(string fileName)
            {
                return new MdlSkin(new KaitaiStream(fileName));
            }

            public MdlSkin(KaitaiStream p__io, QuakeMdl p__parent = null, QuakeMdl p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _group = m_io.ReadS4le();
                if (Group == 0) {
                    _singleTextureData = m_io.ReadBytes(M_Root.Header.SkinSize);
                }
                if (Group != 0) {
                    _numFrames = m_io.ReadU4le();
                }
                if (Group != 0) {
                    _frameTimes = new List<float>();
                    for (var i = 0; i < NumFrames; i++)
                    {
                        _frameTimes.Add(m_io.ReadF4le());
                    }
                }
                if (Group != 0) {
                    _groupTextureData = new List<byte[]>();
                    for (var i = 0; i < NumFrames; i++)
                    {
                        _groupTextureData.Add(m_io.ReadBytes(M_Root.Header.SkinSize));
                    }
                }
            }
            private int _group;
            private byte[] _singleTextureData;
            private uint? _numFrames;
            private List<float> _frameTimes;
            private List<byte[]> _groupTextureData;
            private QuakeMdl m_root;
            private QuakeMdl m_parent;
            public int Group { get { return _group; } }
            public byte[] SingleTextureData { get { return _singleTextureData; } }
            public uint? NumFrames { get { return _numFrames; } }
            public List<float> FrameTimes { get { return _frameTimes; } }
            public List<byte[]> GroupTextureData { get { return _groupTextureData; } }
            public QuakeMdl M_Root { get { return m_root; } }
            public QuakeMdl M_Parent { get { return m_parent; } }
        }
        public partial class MdlFrame : KaitaiStruct
        {
            public static MdlFrame FromFile(string fileName)
            {
                return new MdlFrame(new KaitaiStream(fileName));
            }

            public MdlFrame(KaitaiStream p__io, QuakeMdl p__parent = null, QuakeMdl p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_numSimpleFrames = false;
                _read();
            }
            private void _read()
            {
                _type = m_io.ReadS4le();
                if (Type != 0) {
                    _min = new MdlVertex(m_io, this, m_root);
                }
                if (Type != 0) {
                    _max = new MdlVertex(m_io, this, m_root);
                }
                if (Type != 0) {
                    _time = new List<float>();
                    for (var i = 0; i < Type; i++)
                    {
                        _time.Add(m_io.ReadF4le());
                    }
                }
                _frames = new List<MdlSimpleFrame>();
                for (var i = 0; i < NumSimpleFrames; i++)
                {
                    _frames.Add(new MdlSimpleFrame(m_io, this, m_root));
                }
            }
            private bool f_numSimpleFrames;
            private int _numSimpleFrames;
            public int NumSimpleFrames
            {
                get
                {
                    if (f_numSimpleFrames)
                        return _numSimpleFrames;
                    _numSimpleFrames = (int) ((Type == 0 ? 1 : Type));
                    f_numSimpleFrames = true;
                    return _numSimpleFrames;
                }
            }
            private int _type;
            private MdlVertex _min;
            private MdlVertex _max;
            private List<float> _time;
            private List<MdlSimpleFrame> _frames;
            private QuakeMdl m_root;
            private QuakeMdl m_parent;
            public int Type { get { return _type; } }
            public MdlVertex Min { get { return _min; } }
            public MdlVertex Max { get { return _max; } }
            public List<float> Time { get { return _time; } }
            public List<MdlSimpleFrame> Frames { get { return _frames; } }
            public QuakeMdl M_Root { get { return m_root; } }
            public QuakeMdl M_Parent { get { return m_parent; } }
        }
        public partial class MdlSimpleFrame : KaitaiStruct
        {
            public static MdlSimpleFrame FromFile(string fileName)
            {
                return new MdlSimpleFrame(new KaitaiStream(fileName));
            }

            public MdlSimpleFrame(KaitaiStream p__io, QuakeMdl.MdlFrame p__parent = null, QuakeMdl p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _bboxMin = new MdlVertex(m_io, this, m_root);
                _bboxMax = new MdlVertex(m_io, this, m_root);
                _name = System.Text.Encoding.GetEncoding("ASCII").GetString(KaitaiStream.BytesTerminate(KaitaiStream.BytesStripRight(m_io.ReadBytes(16), 0), 0, false));
                _vertices = new List<MdlVertex>();
                for (var i = 0; i < M_Root.Header.NumVerts; i++)
                {
                    _vertices.Add(new MdlVertex(m_io, this, m_root));
                }
            }
            private MdlVertex _bboxMin;
            private MdlVertex _bboxMax;
            private string _name;
            private List<MdlVertex> _vertices;
            private QuakeMdl m_root;
            private QuakeMdl.MdlFrame m_parent;
            public MdlVertex BboxMin { get { return _bboxMin; } }
            public MdlVertex BboxMax { get { return _bboxMax; } }
            public string Name { get { return _name; } }
            public List<MdlVertex> Vertices { get { return _vertices; } }
            public QuakeMdl M_Root { get { return m_root; } }
            public QuakeMdl.MdlFrame M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Represents a triangular face, connecting 3 vertices, referenced
        /// by their indexes.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L85-L88">Source</a>
        /// </remarks>
        /// <remarks>
        /// Reference: <a href="https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD3">Source</a>
        /// </remarks>
        public partial class MdlTriangle : KaitaiStruct
        {
            public static MdlTriangle FromFile(string fileName)
            {
                return new MdlTriangle(new KaitaiStream(fileName));
            }

            public MdlTriangle(KaitaiStream p__io, QuakeMdl p__parent = null, QuakeMdl p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _facesFront = m_io.ReadS4le();
                _vertices = new List<int>();
                for (var i = 0; i < 3; i++)
                {
                    _vertices.Add(m_io.ReadS4le());
                }
            }
            private int _facesFront;
            private List<int> _vertices;
            private QuakeMdl m_root;
            private QuakeMdl m_parent;
            public int FacesFront { get { return _facesFront; } }
            public List<int> Vertices { get { return _vertices; } }
            public QuakeMdl M_Root { get { return m_root; } }
            public QuakeMdl M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Basic 3D vector (x, y, z) using single-precision floating point
        /// coordnates. Can be used to specify a point in 3D space,
        /// direction, scaling factor, etc.
        /// </summary>
        public partial class Vec3 : KaitaiStruct
        {
            public static Vec3 FromFile(string fileName)
            {
                return new Vec3(new KaitaiStream(fileName));
            }

            public Vec3(KaitaiStream p__io, QuakeMdl.MdlHeader p__parent = null, QuakeMdl p__root = null) : base(p__io)
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
            private QuakeMdl m_root;
            private QuakeMdl.MdlHeader m_parent;
            public float X { get { return _x; } }
            public float Y { get { return _y; } }
            public float Z { get { return _z; } }
            public QuakeMdl M_Root { get { return m_root; } }
            public QuakeMdl.MdlHeader M_Parent { get { return m_parent; } }
        }
        private MdlHeader _header;
        private List<MdlSkin> _skins;
        private List<MdlTexcoord> _textureCoordinates;
        private List<MdlTriangle> _triangles;
        private List<MdlFrame> _frames;
        private QuakeMdl m_root;
        private KaitaiStruct m_parent;
        public MdlHeader Header { get { return _header; } }
        public List<MdlSkin> Skins { get { return _skins; } }
        public List<MdlTexcoord> TextureCoordinates { get { return _textureCoordinates; } }
        public List<MdlTriangle> Triangles { get { return _triangles; } }
        public List<MdlFrame> Frames { get { return _frames; } }
        public QuakeMdl M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
