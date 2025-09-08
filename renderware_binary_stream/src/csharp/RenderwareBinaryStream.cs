// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://gtamods.com/wiki/RenderWare_binary_stream_file">Source</a>
    /// </remarks>
    public partial class RenderwareBinaryStream : KaitaiStruct
    {
        public static RenderwareBinaryStream FromFile(string fileName)
        {
            return new RenderwareBinaryStream(new KaitaiStream(fileName));
        }


        public enum Sections
        {
            Struct = 1,
            String = 2,
            Extension = 3,
            Camera = 5,
            Texture = 6,
            Material = 7,
            MaterialList = 8,
            AtomicSection = 9,
            PlaneSection = 10,
            World = 11,
            Spline = 12,
            Matrix = 13,
            FrameList = 14,
            Geometry = 15,
            Clump = 16,
            Light = 18,
            UnicodeString = 19,
            Atomic = 20,
            TextureNative = 21,
            TextureDictionary = 22,
            AnimationDatabase = 23,
            Image = 24,
            SkinAnimation = 25,
            GeometryList = 26,
            AnimAnimation = 27,
            Team = 28,
            Crowd = 29,
            DeltaMorphAnimation = 30,
            RightToRender = 31,
            MultitextureEffectNative = 32,
            MultitextureEffectDictionary = 33,
            TeamDictionary = 34,
            PlatformIndependentTextureDictionary = 35,
            TableOfContents = 36,
            ParticleStandardGlobalData = 37,
            Altpipe = 38,
            PlatformIndependentPeds = 39,
            PatchMesh = 40,
            ChunkGroupStart = 41,
            ChunkGroupEnd = 42,
            UvAnimationDictionary = 43,
            CollTree = 44,
            MetricsPlg = 257,
            SplinePlg = 258,
            StereoPlg = 259,
            VrmlPlg = 260,
            MorphPlg = 261,
            PvsPlg = 262,
            MemoryLeakPlg = 263,
            AnimationPlg = 264,
            GlossPlg = 265,
            LogoPlg = 266,
            MemoryInfoPlg = 267,
            RandomPlg = 268,
            PngImagePlg = 269,
            BonePlg = 270,
            VrmlAnimPlg = 271,
            SkyMipmapVal = 272,
            MrmPlg = 273,
            LodAtomicPlg = 274,
            MePlg = 275,
            LightmapPlg = 276,
            RefinePlg = 277,
            SkinPlg = 278,
            LabelPlg = 279,
            ParticlesPlg = 280,
            GeomtxPlg = 281,
            SynthCorePlg = 282,
            StqppPlg = 283,
            PartPpPlg = 284,
            CollisionPlg = 285,
            HanimPlg = 286,
            UserDataPlg = 287,
            MaterialEffectsPlg = 288,
            ParticleSystemPlg = 289,
            DeltaMorphPlg = 290,
            PatchPlg = 291,
            TeamPlg = 292,
            CrowdPpPlg = 293,
            MipSplitPlg = 294,
            AnisotropyPlg = 295,
            GcnMaterialPlg = 297,
            GeometricPvsPlg = 298,
            XboxMaterialPlg = 299,
            MultiTexturePlg = 300,
            ChainPlg = 301,
            ToonPlg = 302,
            PtankPlg = 303,
            ParticleStandardPlg = 304,
            PdsPlg = 305,
            PrtadvPlg = 306,
            NormalMapPlg = 307,
            AdcPlg = 308,
            UvAnimationPlg = 309,
            CharacterSetPlg = 384,
            NohsWorldPlg = 385,
            ImportUtilPlg = 386,
            SlerpPlg = 387,
            OptimPlg = 388,
            TlWorldPlg = 389,
            DatabasePlg = 390,
            RaytracePlg = 391,
            RayPlg = 392,
            LibraryPlg = 393,
            Plg2d = 400,
            TileRenderPlg = 401,
            JpegImagePlg = 402,
            TgaImagePlg = 403,
            GifImagePlg = 404,
            QuatPlg = 405,
            SplinePvsPlg = 406,
            MipmapPlg = 407,
            MipmapkPlg = 408,
            Font2d = 409,
            IntersectionPlg = 410,
            TiffImagePlg = 411,
            PickPlg = 412,
            BmpImagePlg = 413,
            RasImagePlg = 414,
            SkinFxPlg = 415,
            VcatPlg = 416,
            Path2d = 417,
            Brush2d = 418,
            Object2d = 419,
            Shape2d = 420,
            Scene2d = 421,
            PickRegion2d = 422,
            ObjectString2d = 423,
            AnimationPlg2d = 424,
            Animation2d = 425,
            Keyframe2d = 432,
            Maestro2d = 433,
            Barycentric = 434,
            PlatformIndependentTextureDictionaryTk = 435,
            TocTk = 436,
            TplTk = 437,
            AltpipeTk = 438,
            AnimationTk = 439,
            SkinSplitTookit = 440,
            CompressedKeyTk = 441,
            GeometryConditioningPlg = 442,
            WingPlg = 443,
            GenericPipelineTk = 444,
            LightmapConversionTk = 445,
            FilesystemPlg = 446,
            DictionaryTk = 447,
            UvAnimationLinear = 448,
            UvAnimationParameter = 449,
            BinMeshPlg = 1294,
            NativeDataPlg = 1296,
            ZmodelerLock = 61982,
            AtomicVisibilityDistance = 39055872,
            ClumpVisibilityDistance = 39055873,
            FrameVisibilityDistance = 39055874,
            PipelineSet = 39056115,
            Unused5 = 39056116,
            TexdictionaryLink = 39056117,
            SpecularMaterial = 39056118,
            Unused8 = 39056119,
            Effect2d = 39056120,
            ExtraVertColour = 39056121,
            CollisionModel = 39056122,
            GtaHanim = 39056123,
            ReflectionMaterial = 39056124,
            Breakable = 39056125,
            Frame = 39056126,
            Unused16 = 39056127,
        }
        public RenderwareBinaryStream(KaitaiStream p__io, KaitaiStruct p__parent = null, RenderwareBinaryStream p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_version = false;
            _read();
        }
        private void _read()
        {
            _code = ((Sections) m_io.ReadU4le());
            _size = m_io.ReadU4le();
            _libraryIdStamp = m_io.ReadU4le();
            switch (Code) {
            case Sections.Atomic: {
                __raw_body = m_io.ReadBytes(Size);
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new ListWithHeader(io___raw_body, this, m_root);
                break;
            }
            case Sections.Clump: {
                __raw_body = m_io.ReadBytes(Size);
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new ListWithHeader(io___raw_body, this, m_root);
                break;
            }
            case Sections.FrameList: {
                __raw_body = m_io.ReadBytes(Size);
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new ListWithHeader(io___raw_body, this, m_root);
                break;
            }
            case Sections.Geometry: {
                __raw_body = m_io.ReadBytes(Size);
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new ListWithHeader(io___raw_body, this, m_root);
                break;
            }
            case Sections.GeometryList: {
                __raw_body = m_io.ReadBytes(Size);
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new ListWithHeader(io___raw_body, this, m_root);
                break;
            }
            case Sections.TextureDictionary: {
                __raw_body = m_io.ReadBytes(Size);
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new ListWithHeader(io___raw_body, this, m_root);
                break;
            }
            case Sections.TextureNative: {
                __raw_body = m_io.ReadBytes(Size);
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new ListWithHeader(io___raw_body, this, m_root);
                break;
            }
            default: {
                _body = m_io.ReadBytes(Size);
                break;
            }
            }
        }

        /// <remarks>
        /// Reference: <a href="https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure">Source</a>
        /// </remarks>
        public partial class Frame : KaitaiStruct
        {
            public static Frame FromFile(string fileName)
            {
                return new Frame(new KaitaiStream(fileName));
            }

            public Frame(KaitaiStream p__io, RenderwareBinaryStream.StructFrameList p__parent = null, RenderwareBinaryStream p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _rotationMatrix = new Matrix(m_io, this, m_root);
                _position = new Vector3d(m_io, this, m_root);
                _curFrameIdx = m_io.ReadS4le();
                _matrixCreationFlags = m_io.ReadU4le();
            }
            private Matrix _rotationMatrix;
            private Vector3d _position;
            private int _curFrameIdx;
            private uint _matrixCreationFlags;
            private RenderwareBinaryStream m_root;
            private RenderwareBinaryStream.StructFrameList m_parent;
            public Matrix RotationMatrix { get { return _rotationMatrix; } }
            public Vector3d Position { get { return _position; } }
            public int CurFrameIdx { get { return _curFrameIdx; } }
            public uint MatrixCreationFlags { get { return _matrixCreationFlags; } }
            public RenderwareBinaryStream M_Root { get { return m_root; } }
            public RenderwareBinaryStream.StructFrameList M_Parent { get { return m_parent; } }
        }
        public partial class GeometryNonNative : KaitaiStruct
        {
            public static GeometryNonNative FromFile(string fileName)
            {
                return new GeometryNonNative(new KaitaiStream(fileName));
            }

            public GeometryNonNative(KaitaiStream p__io, RenderwareBinaryStream.StructGeometry p__parent = null, RenderwareBinaryStream p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                if (M_Parent.IsPrelit) {
                    _prelitColors = new List<Rgba>();
                    for (var i = 0; i < M_Parent.NumVertices; i++)
                    {
                        _prelitColors.Add(new Rgba(m_io, this, m_root));
                    }
                }
                _uvLayers = new List<UvLayer>();
                for (var i = 0; i < M_Parent.NumUvLayers; i++)
                {
                    _uvLayers.Add(new UvLayer(M_Parent.NumVertices, m_io, this, m_root));
                }
                _triangles = new List<Triangle>();
                for (var i = 0; i < M_Parent.NumTriangles; i++)
                {
                    _triangles.Add(new Triangle(m_io, this, m_root));
                }
            }
            private List<Rgba> _prelitColors;
            private List<UvLayer> _uvLayers;
            private List<Triangle> _triangles;
            private RenderwareBinaryStream m_root;
            private RenderwareBinaryStream.StructGeometry m_parent;
            public List<Rgba> PrelitColors { get { return _prelitColors; } }
            public List<UvLayer> UvLayers { get { return _uvLayers; } }
            public List<Triangle> Triangles { get { return _triangles; } }
            public RenderwareBinaryStream M_Root { get { return m_root; } }
            public RenderwareBinaryStream.StructGeometry M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Typical structure used by many data types in RenderWare binary
        /// stream. Substream contains a list of binary stream entries,
        /// first entry always has type &quot;struct&quot; and carries some specific
        /// binary data it in, determined by the type of parent. All other
        /// entries, beside the first one, are normal, self-describing
        /// records.
        /// </summary>
        public partial class ListWithHeader : KaitaiStruct
        {
            public static ListWithHeader FromFile(string fileName)
            {
                return new ListWithHeader(new KaitaiStream(fileName));
            }

            public ListWithHeader(KaitaiStream p__io, RenderwareBinaryStream p__parent = null, RenderwareBinaryStream p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_version = false;
                _read();
            }
            private void _read()
            {
                _code = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_code, new byte[] { 1, 0, 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 1, 0, 0, 0 }, _code, m_io, "/types/list_with_header/seq/0");
                }
                _headerSize = m_io.ReadU4le();
                _libraryIdStamp = m_io.ReadU4le();
                switch (M_Parent.Code) {
                case RenderwareBinaryStream.Sections.Atomic: {
                    __raw_header = m_io.ReadBytes(HeaderSize);
                    var io___raw_header = new KaitaiStream(__raw_header);
                    _header = new StructAtomic(io___raw_header, this, m_root);
                    break;
                }
                case RenderwareBinaryStream.Sections.Clump: {
                    __raw_header = m_io.ReadBytes(HeaderSize);
                    var io___raw_header = new KaitaiStream(__raw_header);
                    _header = new StructClump(io___raw_header, this, m_root);
                    break;
                }
                case RenderwareBinaryStream.Sections.FrameList: {
                    __raw_header = m_io.ReadBytes(HeaderSize);
                    var io___raw_header = new KaitaiStream(__raw_header);
                    _header = new StructFrameList(io___raw_header, this, m_root);
                    break;
                }
                case RenderwareBinaryStream.Sections.Geometry: {
                    __raw_header = m_io.ReadBytes(HeaderSize);
                    var io___raw_header = new KaitaiStream(__raw_header);
                    _header = new StructGeometry(io___raw_header, this, m_root);
                    break;
                }
                case RenderwareBinaryStream.Sections.GeometryList: {
                    __raw_header = m_io.ReadBytes(HeaderSize);
                    var io___raw_header = new KaitaiStream(__raw_header);
                    _header = new StructGeometryList(io___raw_header, this, m_root);
                    break;
                }
                case RenderwareBinaryStream.Sections.TextureDictionary: {
                    __raw_header = m_io.ReadBytes(HeaderSize);
                    var io___raw_header = new KaitaiStream(__raw_header);
                    _header = new StructTextureDictionary(io___raw_header, this, m_root);
                    break;
                }
                default: {
                    _header = m_io.ReadBytes(HeaderSize);
                    break;
                }
                }
                _entries = new List<RenderwareBinaryStream>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(new RenderwareBinaryStream(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private bool f_version;
            private int _version;
            public int Version
            {
                get
                {
                    if (f_version)
                        return _version;
                    f_version = true;
                    _version = (int) (((LibraryIdStamp & 4294901760) != 0 ? (LibraryIdStamp >> 14 & 261888) + 196608 | LibraryIdStamp >> 16 & 63 : LibraryIdStamp << 8));
                    return _version;
                }
            }
            private byte[] _code;
            private uint _headerSize;
            private uint _libraryIdStamp;
            private object _header;
            private List<RenderwareBinaryStream> _entries;
            private RenderwareBinaryStream m_root;
            private RenderwareBinaryStream m_parent;
            private byte[] __raw_header;
            public byte[] Code { get { return _code; } }
            public uint HeaderSize { get { return _headerSize; } }
            public uint LibraryIdStamp { get { return _libraryIdStamp; } }
            public object Header { get { return _header; } }
            public List<RenderwareBinaryStream> Entries { get { return _entries; } }
            public RenderwareBinaryStream M_Root { get { return m_root; } }
            public RenderwareBinaryStream M_Parent { get { return m_parent; } }
            public byte[] M_RawHeader { get { return __raw_header; } }
        }

        /// <remarks>
        /// Reference: <a href="https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure">Source</a>
        /// </remarks>
        public partial class Matrix : KaitaiStruct
        {
            public static Matrix FromFile(string fileName)
            {
                return new Matrix(new KaitaiStream(fileName));
            }

            public Matrix(KaitaiStream p__io, RenderwareBinaryStream.Frame p__parent = null, RenderwareBinaryStream p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<Vector3d>();
                for (var i = 0; i < 3; i++)
                {
                    _entries.Add(new Vector3d(m_io, this, m_root));
                }
            }
            private List<Vector3d> _entries;
            private RenderwareBinaryStream m_root;
            private RenderwareBinaryStream.Frame m_parent;
            public List<Vector3d> Entries { get { return _entries; } }
            public RenderwareBinaryStream M_Root { get { return m_root; } }
            public RenderwareBinaryStream.Frame M_Parent { get { return m_parent; } }
        }
        public partial class MorphTarget : KaitaiStruct
        {
            public static MorphTarget FromFile(string fileName)
            {
                return new MorphTarget(new KaitaiStream(fileName));
            }

            public MorphTarget(KaitaiStream p__io, RenderwareBinaryStream.StructGeometry p__parent = null, RenderwareBinaryStream p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _boundingSphere = new Sphere(m_io, this, m_root);
                _hasVertices = m_io.ReadU4le();
                _hasNormals = m_io.ReadU4le();
                if (HasVertices != 0) {
                    _vertices = new List<Vector3d>();
                    for (var i = 0; i < M_Parent.NumVertices; i++)
                    {
                        _vertices.Add(new Vector3d(m_io, this, m_root));
                    }
                }
                if (HasNormals != 0) {
                    _normals = new List<Vector3d>();
                    for (var i = 0; i < M_Parent.NumVertices; i++)
                    {
                        _normals.Add(new Vector3d(m_io, this, m_root));
                    }
                }
            }
            private Sphere _boundingSphere;
            private uint _hasVertices;
            private uint _hasNormals;
            private List<Vector3d> _vertices;
            private List<Vector3d> _normals;
            private RenderwareBinaryStream m_root;
            private RenderwareBinaryStream.StructGeometry m_parent;
            public Sphere BoundingSphere { get { return _boundingSphere; } }
            public uint HasVertices { get { return _hasVertices; } }
            public uint HasNormals { get { return _hasNormals; } }
            public List<Vector3d> Vertices { get { return _vertices; } }
            public List<Vector3d> Normals { get { return _normals; } }
            public RenderwareBinaryStream M_Root { get { return m_root; } }
            public RenderwareBinaryStream.StructGeometry M_Parent { get { return m_parent; } }
        }
        public partial class Rgba : KaitaiStruct
        {
            public static Rgba FromFile(string fileName)
            {
                return new Rgba(new KaitaiStream(fileName));
            }

            public Rgba(KaitaiStream p__io, RenderwareBinaryStream.GeometryNonNative p__parent = null, RenderwareBinaryStream p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _r = m_io.ReadU1();
                _g = m_io.ReadU1();
                _b = m_io.ReadU1();
                _a = m_io.ReadU1();
            }
            private byte _r;
            private byte _g;
            private byte _b;
            private byte _a;
            private RenderwareBinaryStream m_root;
            private RenderwareBinaryStream.GeometryNonNative m_parent;
            public byte R { get { return _r; } }
            public byte G { get { return _g; } }
            public byte B { get { return _b; } }
            public byte A { get { return _a; } }
            public RenderwareBinaryStream M_Root { get { return m_root; } }
            public RenderwareBinaryStream.GeometryNonNative M_Parent { get { return m_parent; } }
        }
        public partial class Sphere : KaitaiStruct
        {
            public static Sphere FromFile(string fileName)
            {
                return new Sphere(new KaitaiStream(fileName));
            }

            public Sphere(KaitaiStream p__io, RenderwareBinaryStream.MorphTarget p__parent = null, RenderwareBinaryStream p__root = null) : base(p__io)
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
                _radius = m_io.ReadF4le();
            }
            private float _x;
            private float _y;
            private float _z;
            private float _radius;
            private RenderwareBinaryStream m_root;
            private RenderwareBinaryStream.MorphTarget m_parent;
            public float X { get { return _x; } }
            public float Y { get { return _y; } }
            public float Z { get { return _z; } }
            public float Radius { get { return _radius; } }
            public RenderwareBinaryStream M_Root { get { return m_root; } }
            public RenderwareBinaryStream.MorphTarget M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://gtamods.com/wiki/Atomic_(RW_Section)#Structure">Source</a>
        /// </remarks>
        public partial class StructAtomic : KaitaiStruct
        {
            public static StructAtomic FromFile(string fileName)
            {
                return new StructAtomic(new KaitaiStream(fileName));
            }

            public StructAtomic(KaitaiStream p__io, RenderwareBinaryStream.ListWithHeader p__parent = null, RenderwareBinaryStream p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _frameIndex = m_io.ReadU4le();
                _geometryIndex = m_io.ReadU4le();
                _flagRender = m_io.ReadBitsIntLe(1) != 0;
                __unnamed3 = m_io.ReadBitsIntLe(1) != 0;
                _flagCollisionTest = m_io.ReadBitsIntLe(1) != 0;
                __unnamed5 = m_io.ReadBitsIntLe(29);
                m_io.AlignToByte();
                _unused = m_io.ReadU4le();
            }
            private uint _frameIndex;
            private uint _geometryIndex;
            private bool _flagRender;
            private bool __unnamed3;
            private bool _flagCollisionTest;
            private ulong __unnamed5;
            private uint _unused;
            private RenderwareBinaryStream m_root;
            private RenderwareBinaryStream.ListWithHeader m_parent;
            public uint FrameIndex { get { return _frameIndex; } }
            public uint GeometryIndex { get { return _geometryIndex; } }
            public bool FlagRender { get { return _flagRender; } }
            public bool Unnamed_3 { get { return __unnamed3; } }
            public bool FlagCollisionTest { get { return _flagCollisionTest; } }
            public ulong Unnamed_5 { get { return __unnamed5; } }
            public uint Unused { get { return _unused; } }
            public RenderwareBinaryStream M_Root { get { return m_root; } }
            public RenderwareBinaryStream.ListWithHeader M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://gtamods.com/wiki/RpClump">Source</a>
        /// </remarks>
        public partial class StructClump : KaitaiStruct
        {
            public static StructClump FromFile(string fileName)
            {
                return new StructClump(new KaitaiStream(fileName));
            }

            public StructClump(KaitaiStream p__io, RenderwareBinaryStream.ListWithHeader p__parent = null, RenderwareBinaryStream p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numAtomics = m_io.ReadU4le();
                if (M_Parent.Version >= 208896) {
                    _numLights = m_io.ReadU4le();
                }
                if (M_Parent.Version >= 208896) {
                    _numCameras = m_io.ReadU4le();
                }
            }
            private uint _numAtomics;
            private uint? _numLights;
            private uint? _numCameras;
            private RenderwareBinaryStream m_root;
            private RenderwareBinaryStream.ListWithHeader m_parent;
            public uint NumAtomics { get { return _numAtomics; } }
            public uint? NumLights { get { return _numLights; } }
            public uint? NumCameras { get { return _numCameras; } }
            public RenderwareBinaryStream M_Root { get { return m_root; } }
            public RenderwareBinaryStream.ListWithHeader M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure">Source</a>
        /// </remarks>
        public partial class StructFrameList : KaitaiStruct
        {
            public static StructFrameList FromFile(string fileName)
            {
                return new StructFrameList(new KaitaiStream(fileName));
            }

            public StructFrameList(KaitaiStream p__io, RenderwareBinaryStream.ListWithHeader p__parent = null, RenderwareBinaryStream p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numFrames = m_io.ReadU4le();
                _frames = new List<Frame>();
                for (var i = 0; i < NumFrames; i++)
                {
                    _frames.Add(new Frame(m_io, this, m_root));
                }
            }
            private uint _numFrames;
            private List<Frame> _frames;
            private RenderwareBinaryStream m_root;
            private RenderwareBinaryStream.ListWithHeader m_parent;
            public uint NumFrames { get { return _numFrames; } }
            public List<Frame> Frames { get { return _frames; } }
            public RenderwareBinaryStream M_Root { get { return m_root; } }
            public RenderwareBinaryStream.ListWithHeader M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://gtamods.com/wiki/RpGeometry">Source</a>
        /// </remarks>
        public partial class StructGeometry : KaitaiStruct
        {
            public static StructGeometry FromFile(string fileName)
            {
                return new StructGeometry(new KaitaiStream(fileName));
            }

            public StructGeometry(KaitaiStream p__io, RenderwareBinaryStream.ListWithHeader p__parent = null, RenderwareBinaryStream p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_isNative = false;
                f_isPrelit = false;
                f_isTextured = false;
                f_isTextured2 = false;
                f_numUvLayers = false;
                f_numUvLayersRaw = false;
                _read();
            }
            private void _read()
            {
                _format = m_io.ReadU4le();
                _numTriangles = m_io.ReadU4le();
                _numVertices = m_io.ReadU4le();
                _numMorphTargets = m_io.ReadU4le();
                if (M_Parent.Version < 212992) {
                    _surfProp = new SurfaceProperties(m_io, this, m_root);
                }
                if (!(IsNative)) {
                    _geometry = new GeometryNonNative(m_io, this, m_root);
                }
                _morphTargets = new List<MorphTarget>();
                for (var i = 0; i < NumMorphTargets; i++)
                {
                    _morphTargets.Add(new MorphTarget(m_io, this, m_root));
                }
            }
            private bool f_isNative;
            private bool _isNative;
            public bool IsNative
            {
                get
                {
                    if (f_isNative)
                        return _isNative;
                    f_isNative = true;
                    _isNative = (bool) ((Format & 16777216) != 0);
                    return _isNative;
                }
            }
            private bool f_isPrelit;
            private bool _isPrelit;
            public bool IsPrelit
            {
                get
                {
                    if (f_isPrelit)
                        return _isPrelit;
                    f_isPrelit = true;
                    _isPrelit = (bool) ((Format & 8) != 0);
                    return _isPrelit;
                }
            }
            private bool f_isTextured;
            private bool _isTextured;
            public bool IsTextured
            {
                get
                {
                    if (f_isTextured)
                        return _isTextured;
                    f_isTextured = true;
                    _isTextured = (bool) ((Format & 4) != 0);
                    return _isTextured;
                }
            }
            private bool f_isTextured2;
            private bool _isTextured2;
            public bool IsTextured2
            {
                get
                {
                    if (f_isTextured2)
                        return _isTextured2;
                    f_isTextured2 = true;
                    _isTextured2 = (bool) ((Format & 128) != 0);
                    return _isTextured2;
                }
            }
            private bool f_numUvLayers;
            private int _numUvLayers;
            public int NumUvLayers
            {
                get
                {
                    if (f_numUvLayers)
                        return _numUvLayers;
                    f_numUvLayers = true;
                    _numUvLayers = (int) ((NumUvLayersRaw == 0 ? (IsTextured2 ? 2 : (IsTextured ? 1 : 0)) : NumUvLayersRaw));
                    return _numUvLayers;
                }
            }
            private bool f_numUvLayersRaw;
            private int _numUvLayersRaw;
            public int NumUvLayersRaw
            {
                get
                {
                    if (f_numUvLayersRaw)
                        return _numUvLayersRaw;
                    f_numUvLayersRaw = true;
                    _numUvLayersRaw = (int) ((Format & 16711680) >> 16);
                    return _numUvLayersRaw;
                }
            }
            private uint _format;
            private uint _numTriangles;
            private uint _numVertices;
            private uint _numMorphTargets;
            private SurfaceProperties _surfProp;
            private GeometryNonNative _geometry;
            private List<MorphTarget> _morphTargets;
            private RenderwareBinaryStream m_root;
            private RenderwareBinaryStream.ListWithHeader m_parent;
            public uint Format { get { return _format; } }
            public uint NumTriangles { get { return _numTriangles; } }
            public uint NumVertices { get { return _numVertices; } }
            public uint NumMorphTargets { get { return _numMorphTargets; } }
            public SurfaceProperties SurfProp { get { return _surfProp; } }
            public GeometryNonNative Geometry { get { return _geometry; } }
            public List<MorphTarget> MorphTargets { get { return _morphTargets; } }
            public RenderwareBinaryStream M_Root { get { return m_root; } }
            public RenderwareBinaryStream.ListWithHeader M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://gtamods.com/wiki/Geometry_List_(RW_Section)#Structure">Source</a>
        /// </remarks>
        public partial class StructGeometryList : KaitaiStruct
        {
            public static StructGeometryList FromFile(string fileName)
            {
                return new StructGeometryList(new KaitaiStream(fileName));
            }

            public StructGeometryList(KaitaiStream p__io, RenderwareBinaryStream.ListWithHeader p__parent = null, RenderwareBinaryStream p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numGeometries = m_io.ReadU4le();
            }
            private uint _numGeometries;
            private RenderwareBinaryStream m_root;
            private RenderwareBinaryStream.ListWithHeader m_parent;
            public uint NumGeometries { get { return _numGeometries; } }
            public RenderwareBinaryStream M_Root { get { return m_root; } }
            public RenderwareBinaryStream.ListWithHeader M_Parent { get { return m_parent; } }
        }
        public partial class StructTextureDictionary : KaitaiStruct
        {
            public static StructTextureDictionary FromFile(string fileName)
            {
                return new StructTextureDictionary(new KaitaiStream(fileName));
            }

            public StructTextureDictionary(KaitaiStream p__io, RenderwareBinaryStream.ListWithHeader p__parent = null, RenderwareBinaryStream p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numTextures = m_io.ReadU4le();
            }
            private uint _numTextures;
            private RenderwareBinaryStream m_root;
            private RenderwareBinaryStream.ListWithHeader m_parent;
            public uint NumTextures { get { return _numTextures; } }
            public RenderwareBinaryStream M_Root { get { return m_root; } }
            public RenderwareBinaryStream.ListWithHeader M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://gtamods.com/wiki/RpGeometry">Source</a>
        /// </remarks>
        public partial class SurfaceProperties : KaitaiStruct
        {
            public static SurfaceProperties FromFile(string fileName)
            {
                return new SurfaceProperties(new KaitaiStream(fileName));
            }

            public SurfaceProperties(KaitaiStream p__io, RenderwareBinaryStream.StructGeometry p__parent = null, RenderwareBinaryStream p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _ambient = m_io.ReadF4le();
                _specular = m_io.ReadF4le();
                _diffuse = m_io.ReadF4le();
            }
            private float _ambient;
            private float _specular;
            private float _diffuse;
            private RenderwareBinaryStream m_root;
            private RenderwareBinaryStream.StructGeometry m_parent;
            public float Ambient { get { return _ambient; } }
            public float Specular { get { return _specular; } }
            public float Diffuse { get { return _diffuse; } }
            public RenderwareBinaryStream M_Root { get { return m_root; } }
            public RenderwareBinaryStream.StructGeometry M_Parent { get { return m_parent; } }
        }
        public partial class TexCoord : KaitaiStruct
        {
            public static TexCoord FromFile(string fileName)
            {
                return new TexCoord(new KaitaiStream(fileName));
            }

            public TexCoord(KaitaiStream p__io, RenderwareBinaryStream.UvLayer p__parent = null, RenderwareBinaryStream p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _u = m_io.ReadF4le();
                _v = m_io.ReadF4le();
            }
            private float _u;
            private float _v;
            private RenderwareBinaryStream m_root;
            private RenderwareBinaryStream.UvLayer m_parent;
            public float U { get { return _u; } }
            public float V { get { return _v; } }
            public RenderwareBinaryStream M_Root { get { return m_root; } }
            public RenderwareBinaryStream.UvLayer M_Parent { get { return m_parent; } }
        }
        public partial class Triangle : KaitaiStruct
        {
            public static Triangle FromFile(string fileName)
            {
                return new Triangle(new KaitaiStream(fileName));
            }

            public Triangle(KaitaiStream p__io, RenderwareBinaryStream.GeometryNonNative p__parent = null, RenderwareBinaryStream p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _vertex2 = m_io.ReadU2le();
                _vertex1 = m_io.ReadU2le();
                _materialId = m_io.ReadU2le();
                _vertex3 = m_io.ReadU2le();
            }
            private ushort _vertex2;
            private ushort _vertex1;
            private ushort _materialId;
            private ushort _vertex3;
            private RenderwareBinaryStream m_root;
            private RenderwareBinaryStream.GeometryNonNative m_parent;
            public ushort Vertex2 { get { return _vertex2; } }
            public ushort Vertex1 { get { return _vertex1; } }
            public ushort MaterialId { get { return _materialId; } }
            public ushort Vertex3 { get { return _vertex3; } }
            public RenderwareBinaryStream M_Root { get { return m_root; } }
            public RenderwareBinaryStream.GeometryNonNative M_Parent { get { return m_parent; } }
        }
        public partial class UvLayer : KaitaiStruct
        {
            public UvLayer(uint p_numVertices, KaitaiStream p__io, RenderwareBinaryStream.GeometryNonNative p__parent = null, RenderwareBinaryStream p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _numVertices = p_numVertices;
                _read();
            }
            private void _read()
            {
                _texCoords = new List<TexCoord>();
                for (var i = 0; i < NumVertices; i++)
                {
                    _texCoords.Add(new TexCoord(m_io, this, m_root));
                }
            }
            private List<TexCoord> _texCoords;
            private uint _numVertices;
            private RenderwareBinaryStream m_root;
            private RenderwareBinaryStream.GeometryNonNative m_parent;
            public List<TexCoord> TexCoords { get { return _texCoords; } }
            public uint NumVertices { get { return _numVertices; } }
            public RenderwareBinaryStream M_Root { get { return m_root; } }
            public RenderwareBinaryStream.GeometryNonNative M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure">Source</a>
        /// </remarks>
        public partial class Vector3d : KaitaiStruct
        {
            public static Vector3d FromFile(string fileName)
            {
                return new Vector3d(new KaitaiStream(fileName));
            }

            public Vector3d(KaitaiStream p__io, KaitaiStruct p__parent = null, RenderwareBinaryStream p__root = null) : base(p__io)
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
            private RenderwareBinaryStream m_root;
            private KaitaiStruct m_parent;
            public float X { get { return _x; } }
            public float Y { get { return _y; } }
            public float Z { get { return _z; } }
            public RenderwareBinaryStream M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        private bool f_version;
        private int _version;
        public int Version
        {
            get
            {
                if (f_version)
                    return _version;
                f_version = true;
                _version = (int) (((LibraryIdStamp & 4294901760) != 0 ? (LibraryIdStamp >> 14 & 261888) + 196608 | LibraryIdStamp >> 16 & 63 : LibraryIdStamp << 8));
                return _version;
            }
        }
        private Sections _code;
        private uint _size;
        private uint _libraryIdStamp;
        private object _body;
        private RenderwareBinaryStream m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_body;
        public Sections Code { get { return _code; } }
        public uint Size { get { return _size; } }
        public uint LibraryIdStamp { get { return _libraryIdStamp; } }
        public object Body { get { return _body; } }
        public RenderwareBinaryStream M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawBody { get { return __raw_body; } }
    }
}
