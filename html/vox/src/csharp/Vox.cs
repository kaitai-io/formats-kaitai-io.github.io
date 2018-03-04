// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://github.com/ephtracy/voxel-model/blob/master/MagicaVoxel-file-format-vox.txt">Format Description</a>
    /// </remarks>
    public partial class Vox : KaitaiStruct
    {
        public static Vox FromFile(string fileName)
        {
            return new Vox(new KaitaiStream(fileName));
        }


        public enum ChunkType
        {
            Main = 1296124238,
            Matt = 1296127060,
            Pack = 1346454347,
            Rgba = 1380401729,
            Size = 1397316165,
            Xyzi = 1482250825,
        }

        public enum MaterialType
        {
            Diffuse = 0,
            Metal = 1,
            Glass = 2,
            Emissive = 3,
        }

        public enum PropertyBitsType
        {
            Plastic = 1,
            Roughness = 2,
            Specular = 4,
            Ior = 8,
            Attenuation = 16,
            Power = 32,
            Glow = 64,
            IsTotalPower = 128,
        }
        public Vox(KaitaiStream p__io, KaitaiStruct p__parent = null, Vox p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _magic = m_io.EnsureFixedContents(new byte[] { 86, 79, 88, 32 });
            _version = m_io.ReadU4le();
            _main = new Chunk(m_io, this, m_root);
        }
        public partial class Chunk : KaitaiStruct
        {
            public static Chunk FromFile(string fileName)
            {
                return new Chunk(new KaitaiStream(fileName));
            }

            public Chunk(KaitaiStream p__io, KaitaiStruct p__parent = null, Vox p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _chunkId = ((Vox.ChunkType) m_io.ReadU4be());
                _numBytesOfChunkContent = m_io.ReadU4le();
                _numBytesOfChildrenChunks = m_io.ReadU4le();
                if (NumBytesOfChunkContent != 0) {
                    switch (ChunkId) {
                    case Vox.ChunkType.Size: {
                        __raw_chunkContent = m_io.ReadBytes(NumBytesOfChunkContent);
                        var io___raw_chunkContent = new KaitaiStream(__raw_chunkContent);
                        _chunkContent = new Size(io___raw_chunkContent, this, m_root);
                        break;
                    }
                    case Vox.ChunkType.Matt: {
                        __raw_chunkContent = m_io.ReadBytes(NumBytesOfChunkContent);
                        var io___raw_chunkContent = new KaitaiStream(__raw_chunkContent);
                        _chunkContent = new Matt(io___raw_chunkContent, this, m_root);
                        break;
                    }
                    case Vox.ChunkType.Xyzi: {
                        __raw_chunkContent = m_io.ReadBytes(NumBytesOfChunkContent);
                        var io___raw_chunkContent = new KaitaiStream(__raw_chunkContent);
                        _chunkContent = new Xyzi(io___raw_chunkContent, this, m_root);
                        break;
                    }
                    case Vox.ChunkType.Pack: {
                        __raw_chunkContent = m_io.ReadBytes(NumBytesOfChunkContent);
                        var io___raw_chunkContent = new KaitaiStream(__raw_chunkContent);
                        _chunkContent = new Pack(io___raw_chunkContent, this, m_root);
                        break;
                    }
                    case Vox.ChunkType.Rgba: {
                        __raw_chunkContent = m_io.ReadBytes(NumBytesOfChunkContent);
                        var io___raw_chunkContent = new KaitaiStream(__raw_chunkContent);
                        _chunkContent = new Rgba(io___raw_chunkContent, this, m_root);
                        break;
                    }
                    default: {
                        _chunkContent = m_io.ReadBytes(NumBytesOfChunkContent);
                        break;
                    }
                    }
                }
                if (NumBytesOfChildrenChunks != 0) {
                    _childrenChunks = new List<Chunk>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _childrenChunks.Add(new Chunk(m_io, this, m_root));
                            i++;
                        }
                    }
                }
            }
            private ChunkType _chunkId;
            private uint _numBytesOfChunkContent;
            private uint _numBytesOfChildrenChunks;
            private object _chunkContent;
            private List<Chunk> _childrenChunks;
            private Vox m_root;
            private KaitaiStruct m_parent;
            private byte[] __raw_chunkContent;
            public ChunkType ChunkId { get { return _chunkId; } }
            public uint NumBytesOfChunkContent { get { return _numBytesOfChunkContent; } }
            public uint NumBytesOfChildrenChunks { get { return _numBytesOfChildrenChunks; } }
            public object ChunkContent { get { return _chunkContent; } }
            public List<Chunk> ChildrenChunks { get { return _childrenChunks; } }
            public Vox M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
            public byte[] M_RawChunkContent { get { return __raw_chunkContent; } }
        }
        public partial class Size : KaitaiStruct
        {
            public static Size FromFile(string fileName)
            {
                return new Size(new KaitaiStream(fileName));
            }

            public Size(KaitaiStream p__io, Vox.Chunk p__parent = null, Vox p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _sizeX = m_io.ReadU4le();
                _sizeY = m_io.ReadU4le();
                _sizeZ = m_io.ReadU4le();
            }
            private uint _sizeX;
            private uint _sizeY;
            private uint _sizeZ;
            private Vox m_root;
            private Vox.Chunk m_parent;
            public uint SizeX { get { return _sizeX; } }
            public uint SizeY { get { return _sizeY; } }
            public uint SizeZ { get { return _sizeZ; } }
            public Vox M_Root { get { return m_root; } }
            public Vox.Chunk M_Parent { get { return m_parent; } }
        }
        public partial class Rgba : KaitaiStruct
        {
            public static Rgba FromFile(string fileName)
            {
                return new Rgba(new KaitaiStream(fileName));
            }

            public Rgba(KaitaiStream p__io, Vox.Chunk p__parent = null, Vox p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _colors = new List<Color>((int) (256));
                for (var i = 0; i < 256; i++)
                {
                    _colors.Add(new Color(m_io, this, m_root));
                }
            }
            private List<Color> _colors;
            private Vox m_root;
            private Vox.Chunk m_parent;
            public List<Color> Colors { get { return _colors; } }
            public Vox M_Root { get { return m_root; } }
            public Vox.Chunk M_Parent { get { return m_parent; } }
        }
        public partial class Pack : KaitaiStruct
        {
            public static Pack FromFile(string fileName)
            {
                return new Pack(new KaitaiStream(fileName));
            }

            public Pack(KaitaiStream p__io, Vox.Chunk p__parent = null, Vox p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numModels = m_io.ReadU4le();
            }
            private uint _numModels;
            private Vox m_root;
            private Vox.Chunk m_parent;
            public uint NumModels { get { return _numModels; } }
            public Vox M_Root { get { return m_root; } }
            public Vox.Chunk M_Parent { get { return m_parent; } }
        }
        public partial class Matt : KaitaiStruct
        {
            public static Matt FromFile(string fileName)
            {
                return new Matt(new KaitaiStream(fileName));
            }

            public Matt(KaitaiStream p__io, Vox.Chunk p__parent = null, Vox p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_hasIsTotalPower = false;
                f_hasPlastic = false;
                f_hasAttenuation = false;
                f_hasPower = false;
                f_hasRoughness = false;
                f_hasSpecular = false;
                f_hasIor = false;
                f_hasGlow = false;
                _read();
            }
            private void _read()
            {
                _id = m_io.ReadU4le();
                _materialType = ((Vox.MaterialType) m_io.ReadU4le());
                _materialWeight = m_io.ReadF4le();
                _propertyBits = m_io.ReadU4le();
                if (HasPlastic) {
                    _plastic = m_io.ReadF4le();
                }
                if (HasRoughness) {
                    _roughness = m_io.ReadF4le();
                }
                if (HasSpecular) {
                    _specular = m_io.ReadF4le();
                }
                if (HasIor) {
                    _ior = m_io.ReadF4le();
                }
                if (HasAttenuation) {
                    _attenuation = m_io.ReadF4le();
                }
                if (HasPower) {
                    _power = m_io.ReadF4le();
                }
                if (HasGlow) {
                    _glow = m_io.ReadF4le();
                }
                if (HasIsTotalPower) {
                    _isTotalPower = m_io.ReadF4le();
                }
            }
            private bool f_hasIsTotalPower;
            private bool _hasIsTotalPower;
            public bool HasIsTotalPower
            {
                get
                {
                    if (f_hasIsTotalPower)
                        return _hasIsTotalPower;
                    _hasIsTotalPower = (bool) ((PropertyBits & 128) != 0);
                    f_hasIsTotalPower = true;
                    return _hasIsTotalPower;
                }
            }
            private bool f_hasPlastic;
            private bool _hasPlastic;
            public bool HasPlastic
            {
                get
                {
                    if (f_hasPlastic)
                        return _hasPlastic;
                    _hasPlastic = (bool) ((PropertyBits & 1) != 0);
                    f_hasPlastic = true;
                    return _hasPlastic;
                }
            }
            private bool f_hasAttenuation;
            private bool _hasAttenuation;
            public bool HasAttenuation
            {
                get
                {
                    if (f_hasAttenuation)
                        return _hasAttenuation;
                    _hasAttenuation = (bool) ((PropertyBits & 16) != 0);
                    f_hasAttenuation = true;
                    return _hasAttenuation;
                }
            }
            private bool f_hasPower;
            private bool _hasPower;
            public bool HasPower
            {
                get
                {
                    if (f_hasPower)
                        return _hasPower;
                    _hasPower = (bool) ((PropertyBits & 32) != 0);
                    f_hasPower = true;
                    return _hasPower;
                }
            }
            private bool f_hasRoughness;
            private bool _hasRoughness;
            public bool HasRoughness
            {
                get
                {
                    if (f_hasRoughness)
                        return _hasRoughness;
                    _hasRoughness = (bool) ((PropertyBits & 2) != 0);
                    f_hasRoughness = true;
                    return _hasRoughness;
                }
            }
            private bool f_hasSpecular;
            private bool _hasSpecular;
            public bool HasSpecular
            {
                get
                {
                    if (f_hasSpecular)
                        return _hasSpecular;
                    _hasSpecular = (bool) ((PropertyBits & 4) != 0);
                    f_hasSpecular = true;
                    return _hasSpecular;
                }
            }
            private bool f_hasIor;
            private bool _hasIor;
            public bool HasIor
            {
                get
                {
                    if (f_hasIor)
                        return _hasIor;
                    _hasIor = (bool) ((PropertyBits & 8) != 0);
                    f_hasIor = true;
                    return _hasIor;
                }
            }
            private bool f_hasGlow;
            private bool _hasGlow;
            public bool HasGlow
            {
                get
                {
                    if (f_hasGlow)
                        return _hasGlow;
                    _hasGlow = (bool) ((PropertyBits & 64) != 0);
                    f_hasGlow = true;
                    return _hasGlow;
                }
            }
            private uint _id;
            private MaterialType _materialType;
            private float _materialWeight;
            private uint _propertyBits;
            private float? _plastic;
            private float? _roughness;
            private float? _specular;
            private float? _ior;
            private float? _attenuation;
            private float? _power;
            private float? _glow;
            private float? _isTotalPower;
            private Vox m_root;
            private Vox.Chunk m_parent;
            public uint Id { get { return _id; } }
            public MaterialType MaterialType { get { return _materialType; } }
            public float MaterialWeight { get { return _materialWeight; } }
            public uint PropertyBits { get { return _propertyBits; } }
            public float? Plastic { get { return _plastic; } }
            public float? Roughness { get { return _roughness; } }
            public float? Specular { get { return _specular; } }
            public float? Ior { get { return _ior; } }
            public float? Attenuation { get { return _attenuation; } }
            public float? Power { get { return _power; } }
            public float? Glow { get { return _glow; } }
            public float? IsTotalPower { get { return _isTotalPower; } }
            public Vox M_Root { get { return m_root; } }
            public Vox.Chunk M_Parent { get { return m_parent; } }
        }
        public partial class Xyzi : KaitaiStruct
        {
            public static Xyzi FromFile(string fileName)
            {
                return new Xyzi(new KaitaiStream(fileName));
            }

            public Xyzi(KaitaiStream p__io, Vox.Chunk p__parent = null, Vox p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numVoxels = m_io.ReadU4le();
                _voxels = new List<Voxel>((int) (NumVoxels));
                for (var i = 0; i < NumVoxels; i++)
                {
                    _voxels.Add(new Voxel(m_io, this, m_root));
                }
            }
            private uint _numVoxels;
            private List<Voxel> _voxels;
            private Vox m_root;
            private Vox.Chunk m_parent;
            public uint NumVoxels { get { return _numVoxels; } }
            public List<Voxel> Voxels { get { return _voxels; } }
            public Vox M_Root { get { return m_root; } }
            public Vox.Chunk M_Parent { get { return m_parent; } }
        }
        public partial class Color : KaitaiStruct
        {
            public static Color FromFile(string fileName)
            {
                return new Color(new KaitaiStream(fileName));
            }

            public Color(KaitaiStream p__io, Vox.Rgba p__parent = null, Vox p__root = null) : base(p__io)
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
            private Vox m_root;
            private Vox.Rgba m_parent;
            public byte R { get { return _r; } }
            public byte G { get { return _g; } }
            public byte B { get { return _b; } }
            public byte A { get { return _a; } }
            public Vox M_Root { get { return m_root; } }
            public Vox.Rgba M_Parent { get { return m_parent; } }
        }
        public partial class Voxel : KaitaiStruct
        {
            public static Voxel FromFile(string fileName)
            {
                return new Voxel(new KaitaiStream(fileName));
            }

            public Voxel(KaitaiStream p__io, Vox.Xyzi p__parent = null, Vox p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _x = m_io.ReadU1();
                _y = m_io.ReadU1();
                _z = m_io.ReadU1();
                _colorIndex = m_io.ReadU1();
            }
            private byte _x;
            private byte _y;
            private byte _z;
            private byte _colorIndex;
            private Vox m_root;
            private Vox.Xyzi m_parent;
            public byte X { get { return _x; } }
            public byte Y { get { return _y; } }
            public byte Z { get { return _z; } }
            public byte ColorIndex { get { return _colorIndex; } }
            public Vox M_Root { get { return m_root; } }
            public Vox.Xyzi M_Parent { get { return m_parent; } }
        }
        private byte[] _magic;
        private uint _version;
        private Chunk _main;
        private Vox m_root;
        private KaitaiStruct m_parent;
        public byte[] Magic { get { return _magic; } }

        /// <summary>
        /// 150 expected
        /// </summary>
        public uint Version { get { return _version; } }
        public Chunk Main { get { return _main; } }
        public Vox M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
