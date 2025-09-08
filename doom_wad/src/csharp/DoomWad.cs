// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class DoomWad : KaitaiStruct
    {
        public static DoomWad FromFile(string fileName)
        {
            return new DoomWad(new KaitaiStream(fileName));
        }

        public DoomWad(KaitaiStream p__io, KaitaiStruct p__parent = null, DoomWad p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_index = false;
            _read();
        }
        private void _read()
        {
            _magic = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
            _numIndexEntries = m_io.ReadS4le();
            _indexOffset = m_io.ReadS4le();
        }
        public partial class Blockmap : KaitaiStruct
        {
            public static Blockmap FromFile(string fileName)
            {
                return new Blockmap(new KaitaiStream(fileName));
            }

            public Blockmap(KaitaiStream p__io, DoomWad.IndexEntry p__parent = null, DoomWad p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _originX = m_io.ReadS2le();
                _originY = m_io.ReadS2le();
                _numCols = m_io.ReadS2le();
                _numRows = m_io.ReadS2le();
                _linedefsInBlock = new List<Blocklist>();
                for (var i = 0; i < NumCols * NumRows; i++)
                {
                    _linedefsInBlock.Add(new Blocklist(m_io, this, m_root));
                }
            }
            public partial class Blocklist : KaitaiStruct
            {
                public static Blocklist FromFile(string fileName)
                {
                    return new Blocklist(new KaitaiStream(fileName));
                }

                public Blocklist(KaitaiStream p__io, DoomWad.Blockmap p__parent = null, DoomWad p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_linedefs = false;
                    _read();
                }
                private void _read()
                {
                    _offset = m_io.ReadU2le();
                }
                private bool f_linedefs;
                private List<short> _linedefs;

                /// <summary>
                /// List of linedefs found in this block
                /// </summary>
                public List<short> Linedefs
                {
                    get
                    {
                        if (f_linedefs)
                            return _linedefs;
                        f_linedefs = true;
                        long _pos = m_io.Pos;
                        m_io.Seek(Offset * 2);
                        _linedefs = new List<short>();
                        {
                            var i = 0;
                            short M_;
                            do {
                                M_ = m_io.ReadS2le();
                                _linedefs.Add(M_);
                                i++;
                            } while (!(M_ == -1));
                        }
                        m_io.Seek(_pos);
                        return _linedefs;
                    }
                }
                private ushort _offset;
                private DoomWad m_root;
                private DoomWad.Blockmap m_parent;

                /// <summary>
                /// Offset to the list of linedefs
                /// </summary>
                public ushort Offset { get { return _offset; } }
                public DoomWad M_Root { get { return m_root; } }
                public DoomWad.Blockmap M_Parent { get { return m_parent; } }
            }
            private short _originX;
            private short _originY;
            private short _numCols;
            private short _numRows;
            private List<Blocklist> _linedefsInBlock;
            private DoomWad m_root;
            private DoomWad.IndexEntry m_parent;

            /// <summary>
            /// Grid origin, X coord
            /// </summary>
            public short OriginX { get { return _originX; } }

            /// <summary>
            /// Grid origin, Y coord
            /// </summary>
            public short OriginY { get { return _originY; } }

            /// <summary>
            /// Number of columns
            /// </summary>
            public short NumCols { get { return _numCols; } }

            /// <summary>
            /// Number of rows
            /// </summary>
            public short NumRows { get { return _numRows; } }

            /// <summary>
            /// Lists of linedefs for every block
            /// </summary>
            public List<Blocklist> LinedefsInBlock { get { return _linedefsInBlock; } }
            public DoomWad M_Root { get { return m_root; } }
            public DoomWad.IndexEntry M_Parent { get { return m_parent; } }
        }
        public partial class IndexEntry : KaitaiStruct
        {
            public static IndexEntry FromFile(string fileName)
            {
                return new IndexEntry(new KaitaiStream(fileName));
            }

            public IndexEntry(KaitaiStream p__io, DoomWad p__parent = null, DoomWad p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_contents = false;
                _read();
            }
            private void _read()
            {
                _offset = m_io.ReadS4le();
                _size = m_io.ReadS4le();
                _name = System.Text.Encoding.GetEncoding("ASCII").GetString(KaitaiStream.BytesStripRight(m_io.ReadBytes(8), 0));
            }
            private bool f_contents;
            private object _contents;
            public object Contents
            {
                get
                {
                    if (f_contents)
                        return _contents;
                    f_contents = true;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(Offset);
                    switch (Name) {
                    case "BLOCKMAP": {
                        __raw_contents = io.ReadBytes(Size);
                        var io___raw_contents = new KaitaiStream(__raw_contents);
                        _contents = new Blockmap(io___raw_contents, this, m_root);
                        break;
                    }
                    case "LINEDEFS": {
                        __raw_contents = io.ReadBytes(Size);
                        var io___raw_contents = new KaitaiStream(__raw_contents);
                        _contents = new Linedefs(io___raw_contents, this, m_root);
                        break;
                    }
                    case "PNAMES": {
                        __raw_contents = io.ReadBytes(Size);
                        var io___raw_contents = new KaitaiStream(__raw_contents);
                        _contents = new Pnames(io___raw_contents, this, m_root);
                        break;
                    }
                    case "SECTORS": {
                        __raw_contents = io.ReadBytes(Size);
                        var io___raw_contents = new KaitaiStream(__raw_contents);
                        _contents = new Sectors(io___raw_contents, this, m_root);
                        break;
                    }
                    case "SIDEDEFS": {
                        __raw_contents = io.ReadBytes(Size);
                        var io___raw_contents = new KaitaiStream(__raw_contents);
                        _contents = new Sidedefs(io___raw_contents, this, m_root);
                        break;
                    }
                    case "TEXTURE1": {
                        __raw_contents = io.ReadBytes(Size);
                        var io___raw_contents = new KaitaiStream(__raw_contents);
                        _contents = new Texture12(io___raw_contents, this, m_root);
                        break;
                    }
                    case "TEXTURE2": {
                        __raw_contents = io.ReadBytes(Size);
                        var io___raw_contents = new KaitaiStream(__raw_contents);
                        _contents = new Texture12(io___raw_contents, this, m_root);
                        break;
                    }
                    case "THINGS": {
                        __raw_contents = io.ReadBytes(Size);
                        var io___raw_contents = new KaitaiStream(__raw_contents);
                        _contents = new Things(io___raw_contents, this, m_root);
                        break;
                    }
                    case "VERTEXES": {
                        __raw_contents = io.ReadBytes(Size);
                        var io___raw_contents = new KaitaiStream(__raw_contents);
                        _contents = new Vertexes(io___raw_contents, this, m_root);
                        break;
                    }
                    default: {
                        _contents = io.ReadBytes(Size);
                        break;
                    }
                    }
                    io.Seek(_pos);
                    return _contents;
                }
            }
            private int _offset;
            private int _size;
            private string _name;
            private DoomWad m_root;
            private DoomWad m_parent;
            private byte[] __raw_contents;
            public int Offset { get { return _offset; } }
            public int Size { get { return _size; } }
            public string Name { get { return _name; } }
            public DoomWad M_Root { get { return m_root; } }
            public DoomWad M_Parent { get { return m_parent; } }
            public byte[] M_RawContents { get { return __raw_contents; } }
        }
        public partial class Linedef : KaitaiStruct
        {
            public static Linedef FromFile(string fileName)
            {
                return new Linedef(new KaitaiStream(fileName));
            }

            public Linedef(KaitaiStream p__io, DoomWad.Linedefs p__parent = null, DoomWad p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _vertexStartIdx = m_io.ReadU2le();
                _vertexEndIdx = m_io.ReadU2le();
                _flags = m_io.ReadU2le();
                _lineType = m_io.ReadU2le();
                _sectorTag = m_io.ReadU2le();
                _sidedefRightIdx = m_io.ReadU2le();
                _sidedefLeftIdx = m_io.ReadU2le();
            }
            private ushort _vertexStartIdx;
            private ushort _vertexEndIdx;
            private ushort _flags;
            private ushort _lineType;
            private ushort _sectorTag;
            private ushort _sidedefRightIdx;
            private ushort _sidedefLeftIdx;
            private DoomWad m_root;
            private DoomWad.Linedefs m_parent;
            public ushort VertexStartIdx { get { return _vertexStartIdx; } }
            public ushort VertexEndIdx { get { return _vertexEndIdx; } }
            public ushort Flags { get { return _flags; } }
            public ushort LineType { get { return _lineType; } }
            public ushort SectorTag { get { return _sectorTag; } }
            public ushort SidedefRightIdx { get { return _sidedefRightIdx; } }
            public ushort SidedefLeftIdx { get { return _sidedefLeftIdx; } }
            public DoomWad M_Root { get { return m_root; } }
            public DoomWad.Linedefs M_Parent { get { return m_parent; } }
        }
        public partial class Linedefs : KaitaiStruct
        {
            public static Linedefs FromFile(string fileName)
            {
                return new Linedefs(new KaitaiStream(fileName));
            }

            public Linedefs(KaitaiStream p__io, DoomWad.IndexEntry p__parent = null, DoomWad p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<Linedef>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(new Linedef(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<Linedef> _entries;
            private DoomWad m_root;
            private DoomWad.IndexEntry m_parent;
            public List<Linedef> Entries { get { return _entries; } }
            public DoomWad M_Root { get { return m_root; } }
            public DoomWad.IndexEntry M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://doom.fandom.com/wiki/PNAMES">Source</a>
        /// </remarks>
        public partial class Pnames : KaitaiStruct
        {
            public static Pnames FromFile(string fileName)
            {
                return new Pnames(new KaitaiStream(fileName));
            }

            public Pnames(KaitaiStream p__io, DoomWad.IndexEntry p__parent = null, DoomWad p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numPatches = m_io.ReadU4le();
                _names = new List<string>();
                for (var i = 0; i < NumPatches; i++)
                {
                    _names.Add(System.Text.Encoding.GetEncoding("ASCII").GetString(KaitaiStream.BytesStripRight(m_io.ReadBytes(8), 0)));
                }
            }
            private uint _numPatches;
            private List<string> _names;
            private DoomWad m_root;
            private DoomWad.IndexEntry m_parent;

            /// <summary>
            /// Number of patches registered in this global game directory
            /// </summary>
            public uint NumPatches { get { return _numPatches; } }
            public List<string> Names { get { return _names; } }
            public DoomWad M_Root { get { return m_root; } }
            public DoomWad.IndexEntry M_Parent { get { return m_parent; } }
        }
        public partial class Sector : KaitaiStruct
        {
            public static Sector FromFile(string fileName)
            {
                return new Sector(new KaitaiStream(fileName));
            }


            public enum SpecialSector
            {
                Normal = 0,
                DLightFlicker = 1,
                DLightStrobeFast = 2,
                DLightStrobeSlow = 3,
                DLightStrobeHurt = 4,
                DDamageHellslime = 5,
                DDamageNukage = 7,
                DLightGlow = 8,
                Secret = 9,
                DSectorDoorCloseIn30 = 10,
                DDamageEnd = 11,
                DLightStrobeSlowSync = 12,
                DLightStrobeFastSync = 13,
                DSectorDoorRaiseIn5Mins = 14,
                DFrictionLow = 15,
                DDamageSuperHellslime = 16,
                DLightFireFlicker = 17,
                DDamageLavaWimpy = 18,
                DDamageLavaHefty = 19,
                DScrollEastLavaDamage = 20,
                LightPhased = 21,
                LightSequenceStart = 22,
                LightSequenceSpecial1 = 23,
                LightSequenceSpecial2 = 24,
            }
            public Sector(KaitaiStream p__io, DoomWad.Sectors p__parent = null, DoomWad p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _floorZ = m_io.ReadS2le();
                _ceilZ = m_io.ReadS2le();
                _floorFlat = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(8));
                _ceilFlat = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(8));
                _light = m_io.ReadS2le();
                _specialType = ((SpecialSector) m_io.ReadU2le());
                _tag = m_io.ReadU2le();
            }
            private short _floorZ;
            private short _ceilZ;
            private string _floorFlat;
            private string _ceilFlat;
            private short _light;
            private SpecialSector _specialType;
            private ushort _tag;
            private DoomWad m_root;
            private DoomWad.Sectors m_parent;
            public short FloorZ { get { return _floorZ; } }
            public short CeilZ { get { return _ceilZ; } }
            public string FloorFlat { get { return _floorFlat; } }
            public string CeilFlat { get { return _ceilFlat; } }

            /// <summary>
            /// Light level of the sector [0..255]. Original engine uses
            /// COLORMAP to render lighting, so only 32 actual levels are
            /// available (i.e. 0..7, 8..15, etc).
            /// </summary>
            public short Light { get { return _light; } }
            public SpecialSector SpecialType { get { return _specialType; } }

            /// <summary>
            /// Tag number. When the linedef with the same tag number is
            /// activated, some effect will be triggered in this sector.
            /// </summary>
            public ushort Tag { get { return _tag; } }
            public DoomWad M_Root { get { return m_root; } }
            public DoomWad.Sectors M_Parent { get { return m_parent; } }
        }
        public partial class Sectors : KaitaiStruct
        {
            public static Sectors FromFile(string fileName)
            {
                return new Sectors(new KaitaiStream(fileName));
            }

            public Sectors(KaitaiStream p__io, DoomWad.IndexEntry p__parent = null, DoomWad p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<Sector>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(new Sector(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<Sector> _entries;
            private DoomWad m_root;
            private DoomWad.IndexEntry m_parent;
            public List<Sector> Entries { get { return _entries; } }
            public DoomWad M_Root { get { return m_root; } }
            public DoomWad.IndexEntry M_Parent { get { return m_parent; } }
        }
        public partial class Sidedef : KaitaiStruct
        {
            public static Sidedef FromFile(string fileName)
            {
                return new Sidedef(new KaitaiStream(fileName));
            }

            public Sidedef(KaitaiStream p__io, DoomWad.Sidedefs p__parent = null, DoomWad p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _offsetX = m_io.ReadS2le();
                _offsetY = m_io.ReadS2le();
                _upperTextureName = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(8));
                _lowerTextureName = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(8));
                _normalTextureName = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(8));
                _sectorId = m_io.ReadS2le();
            }
            private short _offsetX;
            private short _offsetY;
            private string _upperTextureName;
            private string _lowerTextureName;
            private string _normalTextureName;
            private short _sectorId;
            private DoomWad m_root;
            private DoomWad.Sidedefs m_parent;
            public short OffsetX { get { return _offsetX; } }
            public short OffsetY { get { return _offsetY; } }
            public string UpperTextureName { get { return _upperTextureName; } }
            public string LowerTextureName { get { return _lowerTextureName; } }
            public string NormalTextureName { get { return _normalTextureName; } }
            public short SectorId { get { return _sectorId; } }
            public DoomWad M_Root { get { return m_root; } }
            public DoomWad.Sidedefs M_Parent { get { return m_parent; } }
        }
        public partial class Sidedefs : KaitaiStruct
        {
            public static Sidedefs FromFile(string fileName)
            {
                return new Sidedefs(new KaitaiStream(fileName));
            }

            public Sidedefs(KaitaiStream p__io, DoomWad.IndexEntry p__parent = null, DoomWad p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<Sidedef>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(new Sidedef(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<Sidedef> _entries;
            private DoomWad m_root;
            private DoomWad.IndexEntry m_parent;
            public List<Sidedef> Entries { get { return _entries; } }
            public DoomWad M_Root { get { return m_root; } }
            public DoomWad.IndexEntry M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Used for TEXTURE1 and TEXTURE2 lumps, which designate how to
        /// combine wall patches to make wall textures. This essentially
        /// provides a very simple form of image compression, allowing
        /// certain elements (&quot;patches&quot;) to be reused / recombined on
        /// different textures for more variety in the game.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://doom.fandom.com/wiki/TEXTURE1_and_TEXTURE2">Source</a>
        /// </remarks>
        public partial class Texture12 : KaitaiStruct
        {
            public static Texture12 FromFile(string fileName)
            {
                return new Texture12(new KaitaiStream(fileName));
            }

            public Texture12(KaitaiStream p__io, DoomWad.IndexEntry p__parent = null, DoomWad p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numTextures = m_io.ReadS4le();
                _textures = new List<TextureIndex>();
                for (var i = 0; i < NumTextures; i++)
                {
                    _textures.Add(new TextureIndex(m_io, this, m_root));
                }
            }
            public partial class Patch : KaitaiStruct
            {
                public static Patch FromFile(string fileName)
                {
                    return new Patch(new KaitaiStream(fileName));
                }

                public Patch(KaitaiStream p__io, DoomWad.Texture12.TextureBody p__parent = null, DoomWad p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _originX = m_io.ReadS2le();
                    _originY = m_io.ReadS2le();
                    _patchId = m_io.ReadU2le();
                    _stepDir = m_io.ReadU2le();
                    _colormap = m_io.ReadU2le();
                }
                private short _originX;
                private short _originY;
                private ushort _patchId;
                private ushort _stepDir;
                private ushort _colormap;
                private DoomWad m_root;
                private DoomWad.Texture12.TextureBody m_parent;

                /// <summary>
                /// X offset to draw a patch at (pixels from left boundary of a texture)
                /// </summary>
                public short OriginX { get { return _originX; } }

                /// <summary>
                /// Y offset to draw a patch at (pixels from upper boundary of a texture)
                /// </summary>
                public short OriginY { get { return _originY; } }

                /// <summary>
                /// Identifier of a patch (as listed in PNAMES lump) to draw
                /// </summary>
                public ushort PatchId { get { return _patchId; } }
                public ushort StepDir { get { return _stepDir; } }
                public ushort Colormap { get { return _colormap; } }
                public DoomWad M_Root { get { return m_root; } }
                public DoomWad.Texture12.TextureBody M_Parent { get { return m_parent; } }
            }
            public partial class TextureBody : KaitaiStruct
            {
                public static TextureBody FromFile(string fileName)
                {
                    return new TextureBody(new KaitaiStream(fileName));
                }

                public TextureBody(KaitaiStream p__io, DoomWad.Texture12.TextureIndex p__parent = null, DoomWad p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _name = System.Text.Encoding.GetEncoding("ASCII").GetString(KaitaiStream.BytesStripRight(m_io.ReadBytes(8), 0));
                    _masked = m_io.ReadU4le();
                    _width = m_io.ReadU2le();
                    _height = m_io.ReadU2le();
                    _columnDirectory = m_io.ReadU4le();
                    _numPatches = m_io.ReadU2le();
                    _patches = new List<Patch>();
                    for (var i = 0; i < NumPatches; i++)
                    {
                        _patches.Add(new Patch(m_io, this, m_root));
                    }
                }
                private string _name;
                private uint _masked;
                private ushort _width;
                private ushort _height;
                private uint _columnDirectory;
                private ushort _numPatches;
                private List<Patch> _patches;
                private DoomWad m_root;
                private DoomWad.Texture12.TextureIndex m_parent;

                /// <summary>
                /// Name of a texture, only `A-Z`, `0-9`, `[]_-` are valid
                /// </summary>
                public string Name { get { return _name; } }
                public uint Masked { get { return _masked; } }
                public ushort Width { get { return _width; } }
                public ushort Height { get { return _height; } }

                /// <summary>
                /// Obsolete, ignored by all DOOM versions
                /// </summary>
                public uint ColumnDirectory { get { return _columnDirectory; } }

                /// <summary>
                /// Number of patches that are used in a texture
                /// </summary>
                public ushort NumPatches { get { return _numPatches; } }
                public List<Patch> Patches { get { return _patches; } }
                public DoomWad M_Root { get { return m_root; } }
                public DoomWad.Texture12.TextureIndex M_Parent { get { return m_parent; } }
            }
            public partial class TextureIndex : KaitaiStruct
            {
                public static TextureIndex FromFile(string fileName)
                {
                    return new TextureIndex(new KaitaiStream(fileName));
                }

                public TextureIndex(KaitaiStream p__io, DoomWad.Texture12 p__parent = null, DoomWad p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_body = false;
                    _read();
                }
                private void _read()
                {
                    _offset = m_io.ReadS4le();
                }
                private bool f_body;
                private TextureBody _body;
                public TextureBody Body
                {
                    get
                    {
                        if (f_body)
                            return _body;
                        f_body = true;
                        long _pos = m_io.Pos;
                        m_io.Seek(Offset);
                        _body = new TextureBody(m_io, this, m_root);
                        m_io.Seek(_pos);
                        return _body;
                    }
                }
                private int _offset;
                private DoomWad m_root;
                private DoomWad.Texture12 m_parent;
                public int Offset { get { return _offset; } }
                public DoomWad M_Root { get { return m_root; } }
                public DoomWad.Texture12 M_Parent { get { return m_parent; } }
            }
            private int _numTextures;
            private List<TextureIndex> _textures;
            private DoomWad m_root;
            private DoomWad.IndexEntry m_parent;

            /// <summary>
            /// Number of wall textures
            /// </summary>
            public int NumTextures { get { return _numTextures; } }
            public List<TextureIndex> Textures { get { return _textures; } }
            public DoomWad M_Root { get { return m_root; } }
            public DoomWad.IndexEntry M_Parent { get { return m_parent; } }
        }
        public partial class Thing : KaitaiStruct
        {
            public static Thing FromFile(string fileName)
            {
                return new Thing(new KaitaiStream(fileName));
            }

            public Thing(KaitaiStream p__io, DoomWad.Things p__parent = null, DoomWad p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _x = m_io.ReadS2le();
                _y = m_io.ReadS2le();
                _angle = m_io.ReadU2le();
                _type = m_io.ReadU2le();
                _flags = m_io.ReadU2le();
            }
            private short _x;
            private short _y;
            private ushort _angle;
            private ushort _type;
            private ushort _flags;
            private DoomWad m_root;
            private DoomWad.Things m_parent;
            public short X { get { return _x; } }
            public short Y { get { return _y; } }
            public ushort Angle { get { return _angle; } }
            public ushort Type { get { return _type; } }
            public ushort Flags { get { return _flags; } }
            public DoomWad M_Root { get { return m_root; } }
            public DoomWad.Things M_Parent { get { return m_parent; } }
        }
        public partial class Things : KaitaiStruct
        {
            public static Things FromFile(string fileName)
            {
                return new Things(new KaitaiStream(fileName));
            }

            public Things(KaitaiStream p__io, DoomWad.IndexEntry p__parent = null, DoomWad p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<Thing>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(new Thing(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<Thing> _entries;
            private DoomWad m_root;
            private DoomWad.IndexEntry m_parent;
            public List<Thing> Entries { get { return _entries; } }
            public DoomWad M_Root { get { return m_root; } }
            public DoomWad.IndexEntry M_Parent { get { return m_parent; } }
        }
        public partial class Vertex : KaitaiStruct
        {
            public static Vertex FromFile(string fileName)
            {
                return new Vertex(new KaitaiStream(fileName));
            }

            public Vertex(KaitaiStream p__io, DoomWad.Vertexes p__parent = null, DoomWad p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _x = m_io.ReadS2le();
                _y = m_io.ReadS2le();
            }
            private short _x;
            private short _y;
            private DoomWad m_root;
            private DoomWad.Vertexes m_parent;
            public short X { get { return _x; } }
            public short Y { get { return _y; } }
            public DoomWad M_Root { get { return m_root; } }
            public DoomWad.Vertexes M_Parent { get { return m_parent; } }
        }
        public partial class Vertexes : KaitaiStruct
        {
            public static Vertexes FromFile(string fileName)
            {
                return new Vertexes(new KaitaiStream(fileName));
            }

            public Vertexes(KaitaiStream p__io, DoomWad.IndexEntry p__parent = null, DoomWad p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<Vertex>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(new Vertex(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<Vertex> _entries;
            private DoomWad m_root;
            private DoomWad.IndexEntry m_parent;
            public List<Vertex> Entries { get { return _entries; } }
            public DoomWad M_Root { get { return m_root; } }
            public DoomWad.IndexEntry M_Parent { get { return m_parent; } }
        }
        private bool f_index;
        private List<IndexEntry> _index;
        public List<IndexEntry> Index
        {
            get
            {
                if (f_index)
                    return _index;
                f_index = true;
                long _pos = m_io.Pos;
                m_io.Seek(IndexOffset);
                _index = new List<IndexEntry>();
                for (var i = 0; i < NumIndexEntries; i++)
                {
                    _index.Add(new IndexEntry(m_io, this, m_root));
                }
                m_io.Seek(_pos);
                return _index;
            }
        }
        private string _magic;
        private int _numIndexEntries;
        private int _indexOffset;
        private DoomWad m_root;
        private KaitaiStruct m_parent;
        public string Magic { get { return _magic; } }

        /// <summary>
        /// Number of entries in the lump index
        /// </summary>
        public int NumIndexEntries { get { return _numIndexEntries; } }

        /// <summary>
        /// Offset to the start of the index
        /// </summary>
        public int IndexOffset { get { return _indexOffset; } }
        public DoomWad M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
