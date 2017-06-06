// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class QuakeMdl : KaitaiStruct
    {
        public static QuakeMdl FromFile(string fileName)
        {
            return new QuakeMdl(new KaitaiStream(fileName));
        }

        public QuakeMdl(KaitaiStream io, KaitaiStruct parent = null, QuakeMdl root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            _read();
        }
        private void _read() {
            _header = new MdlHeader(m_io, this, m_root);
            _skins = new List<MdlSkin>((int) (Header.NumSkins));
            for (var i = 0; i < Header.NumSkins; i++) {
                _skins.Add(new MdlSkin(m_io, this, m_root));
            }
            _textureCoordinates = new List<MdlTexcoord>((int) (Header.NumVerts));
            for (var i = 0; i < Header.NumVerts; i++) {
                _textureCoordinates.Add(new MdlTexcoord(m_io, this, m_root));
            }
            _triangles = new List<MdlTriangle>((int) (Header.NumTris));
            for (var i = 0; i < Header.NumTris; i++) {
                _triangles.Add(new MdlTriangle(m_io, this, m_root));
            }
            _frames = new List<MdlFrame>((int) (Header.NumFrames));
            for (var i = 0; i < Header.NumFrames; i++) {
                _frames.Add(new MdlFrame(m_io, this, m_root));
            }
            }
        public partial class MdlVertex : KaitaiStruct
        {
            public static MdlVertex FromFile(string fileName)
            {
                return new MdlVertex(new KaitaiStream(fileName));
            }

            public MdlVertex(KaitaiStream io, KaitaiStruct parent = null, QuakeMdl root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _values = new List<byte>((int) (3));
                for (var i = 0; i < 3; i++) {
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
        public partial class MdlTexcoord : KaitaiStruct
        {
            public static MdlTexcoord FromFile(string fileName)
            {
                return new MdlTexcoord(new KaitaiStream(fileName));
            }

            public MdlTexcoord(KaitaiStream io, QuakeMdl parent = null, QuakeMdl root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
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
        public partial class MdlHeader : KaitaiStruct
        {
            public static MdlHeader FromFile(string fileName)
            {
                return new MdlHeader(new KaitaiStream(fileName));
            }

            public MdlHeader(KaitaiStream io, QuakeMdl parent = null, QuakeMdl root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                f_version = false;
                f_skinSize = false;
                _read();
            }
            private void _read() {
                _ident = m_io.EnsureFixedContents(new byte[] { 73, 68, 80, 79 });
                _versionMustBe6 = m_io.EnsureFixedContents(new byte[] { 6, 0, 0, 0 });
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
            private bool f_version;
            private sbyte _version;
            public sbyte Version
            {
                get
                {
                    if (f_version)
                        return _version;
                    _version = (sbyte) (6);
                    f_version = true;
                    return _version;
                }
            }
            private bool f_skinSize;
            private int _skinSize;
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
            private byte[] _versionMustBe6;
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
            public byte[] Ident { get { return _ident; } }
            public byte[] VersionMustBe6 { get { return _versionMustBe6; } }
            public Vec3 Scale { get { return _scale; } }
            public Vec3 Origin { get { return _origin; } }
            public float Radius { get { return _radius; } }
            public Vec3 EyePosition { get { return _eyePosition; } }
            public int NumSkins { get { return _numSkins; } }
            public int SkinWidth { get { return _skinWidth; } }
            public int SkinHeight { get { return _skinHeight; } }
            public int NumVerts { get { return _numVerts; } }
            public int NumTris { get { return _numTris; } }
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

            public MdlSkin(KaitaiStream io, QuakeMdl parent = null, QuakeMdl root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _group = m_io.ReadS4le();
                if (Group == 0) {
                    _singleTextureData = m_io.ReadBytes(M_Root.Header.SkinSize);
                }
                if (Group != 0) {
                    _numFrames = m_io.ReadU4le();
                }
                if (Group != 0) {
                    _frameTimes = new List<float>((int) (NumFrames));
                    for (var i = 0; i < NumFrames; i++) {
                        _frameTimes.Add(m_io.ReadF4le());
                    }
                }
                if (Group != 0) {
                    _groupTextureData = new List<byte[]>((int) (NumFrames));
                    for (var i = 0; i < NumFrames; i++) {
                        _groupTextureData.Add(m_io.ReadBytes(M_Root.Header.SkinSize));
                    }
                }
                }
            private int _group;
            private byte[] _singleTextureData;
            private uint _numFrames;
            private List<float> _frameTimes;
            private List<byte[]> _groupTextureData;
            private QuakeMdl m_root;
            private QuakeMdl m_parent;
            public int Group { get { return _group; } }
            public byte[] SingleTextureData { get { return _singleTextureData; } }
            public uint NumFrames { get { return _numFrames; } }
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

            public MdlFrame(KaitaiStream io, QuakeMdl parent = null, QuakeMdl root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                f_numSimpleFrames = false;
                _read();
            }
            private void _read() {
                _type = m_io.ReadS4le();
                if (Type != 0) {
                    _min = new MdlVertex(m_io, this, m_root);
                }
                if (Type != 0) {
                    _max = new MdlVertex(m_io, this, m_root);
                }
                if (Type != 0) {
                    _time = new List<float>((int) (Type));
                    for (var i = 0; i < Type; i++) {
                        _time.Add(m_io.ReadF4le());
                    }
                }
                _frames = new List<MdlSimpleFrame>((int) (NumSimpleFrames));
                for (var i = 0; i < NumSimpleFrames; i++) {
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

            public MdlSimpleFrame(KaitaiStream io, QuakeMdl.MdlFrame parent = null, QuakeMdl root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _bboxMin = new MdlVertex(m_io, this, m_root);
                _bboxMax = new MdlVertex(m_io, this, m_root);
                _name = System.Text.Encoding.GetEncoding("ASCII").GetString(KaitaiStream.BytesTerminate(KaitaiStream.BytesStripRight(m_io.ReadBytes(16), 0), 0, false));
                _vertices = new List<MdlVertex>((int) (M_Root.Header.NumVerts));
                for (var i = 0; i < M_Root.Header.NumVerts; i++) {
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
        public partial class MdlTriangle : KaitaiStruct
        {
            public static MdlTriangle FromFile(string fileName)
            {
                return new MdlTriangle(new KaitaiStream(fileName));
            }

            public MdlTriangle(KaitaiStream io, QuakeMdl parent = null, QuakeMdl root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _facesFront = m_io.ReadS4le();
                _vertices = new List<int>((int) (3));
                for (var i = 0; i < 3; i++) {
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
        public partial class Vec3 : KaitaiStruct
        {
            public static Vec3 FromFile(string fileName)
            {
                return new Vec3(new KaitaiStream(fileName));
            }

            public Vec3(KaitaiStream io, QuakeMdl.MdlHeader parent = null, QuakeMdl root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
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
