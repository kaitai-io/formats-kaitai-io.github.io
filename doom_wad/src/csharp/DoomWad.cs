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

        public DoomWad(KaitaiStream io, KaitaiStruct parent = null, DoomWad root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            f_index = false;
            _read();
        }
        private void _read() {
            _magic = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
            _numIndexEntries = m_io.ReadS4le();
            _indexOffset = m_io.ReadS4le();
            }
        public partial class Sectors : KaitaiStruct
        {
            public static Sectors FromFile(string fileName)
            {
                return new Sectors(new KaitaiStream(fileName));
            }

            public Sectors(KaitaiStream io, DoomWad.IndexEntry parent = null, DoomWad root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _entries = new List<Sector>();
                while (!m_io.IsEof) {
                    _entries.Add(new Sector(m_io, this, m_root));
                }
                }
            private List<Sector> _entries;
            private DoomWad m_root;
            private DoomWad.IndexEntry m_parent;
            public List<Sector> Entries { get { return _entries; } }
            public DoomWad M_Root { get { return m_root; } }
            public DoomWad.IndexEntry M_Parent { get { return m_parent; } }
        }
        public partial class Vertex : KaitaiStruct
        {
            public static Vertex FromFile(string fileName)
            {
                return new Vertex(new KaitaiStream(fileName));
            }

            public Vertex(KaitaiStream io, DoomWad.Vertexes parent = null, DoomWad root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
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
        public partial class Linedef : KaitaiStruct
        {
            public static Linedef FromFile(string fileName)
            {
                return new Linedef(new KaitaiStream(fileName));
            }

            public Linedef(KaitaiStream io, DoomWad.Linedefs parent = null, DoomWad root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
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
        public partial class Thing : KaitaiStruct
        {
            public static Thing FromFile(string fileName)
            {
                return new Thing(new KaitaiStream(fileName));
            }

            public Thing(KaitaiStream io, DoomWad.Things parent = null, DoomWad root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
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

            public Sector(KaitaiStream io, DoomWad.Sectors parent = null, DoomWad root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
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
            /// Light level of the sector [0..255]. Original engine uses COLORMAP to render lighting, so only 32 actual levels are available (i.e. 0..7, 8..15, etc).
            /// </summary>
            public short Light { get { return _light; } }
            public SpecialSector SpecialType { get { return _specialType; } }

            /// <summary>
            /// Tag number. When the linedef with the same tag number is activated, some effect will be triggered in this sector.
            /// </summary>
            public ushort Tag { get { return _tag; } }
            public DoomWad M_Root { get { return m_root; } }
            public DoomWad.Sectors M_Parent { get { return m_parent; } }
        }
        public partial class Vertexes : KaitaiStruct
        {
            public static Vertexes FromFile(string fileName)
            {
                return new Vertexes(new KaitaiStream(fileName));
            }

            public Vertexes(KaitaiStream io, DoomWad.IndexEntry parent = null, DoomWad root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _entries = new List<Vertex>();
                while (!m_io.IsEof) {
                    _entries.Add(new Vertex(m_io, this, m_root));
                }
                }
            private List<Vertex> _entries;
            private DoomWad m_root;
            private DoomWad.IndexEntry m_parent;
            public List<Vertex> Entries { get { return _entries; } }
            public DoomWad M_Root { get { return m_root; } }
            public DoomWad.IndexEntry M_Parent { get { return m_parent; } }
        }
        public partial class Sidedef : KaitaiStruct
        {
            public static Sidedef FromFile(string fileName)
            {
                return new Sidedef(new KaitaiStream(fileName));
            }

            public Sidedef(KaitaiStream io, DoomWad.Sidedefs parent = null, DoomWad root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
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
        public partial class Things : KaitaiStruct
        {
            public static Things FromFile(string fileName)
            {
                return new Things(new KaitaiStream(fileName));
            }

            public Things(KaitaiStream io, DoomWad.IndexEntry parent = null, DoomWad root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _entries = new List<Thing>();
                while (!m_io.IsEof) {
                    _entries.Add(new Thing(m_io, this, m_root));
                }
                }
            private List<Thing> _entries;
            private DoomWad m_root;
            private DoomWad.IndexEntry m_parent;
            public List<Thing> Entries { get { return _entries; } }
            public DoomWad M_Root { get { return m_root; } }
            public DoomWad.IndexEntry M_Parent { get { return m_parent; } }
        }
        public partial class Linedefs : KaitaiStruct
        {
            public static Linedefs FromFile(string fileName)
            {
                return new Linedefs(new KaitaiStream(fileName));
            }

            public Linedefs(KaitaiStream io, DoomWad.IndexEntry parent = null, DoomWad root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _entries = new List<Linedef>();
                while (!m_io.IsEof) {
                    _entries.Add(new Linedef(m_io, this, m_root));
                }
                }
            private List<Linedef> _entries;
            private DoomWad m_root;
            private DoomWad.IndexEntry m_parent;
            public List<Linedef> Entries { get { return _entries; } }
            public DoomWad M_Root { get { return m_root; } }
            public DoomWad.IndexEntry M_Parent { get { return m_parent; } }
        }
        public partial class IndexEntry : KaitaiStruct
        {
            public static IndexEntry FromFile(string fileName)
            {
                return new IndexEntry(new KaitaiStream(fileName));
            }

            public IndexEntry(KaitaiStream io, DoomWad parent = null, DoomWad root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                f_contents = false;
                _read();
            }
            private void _read() {
                _offset = m_io.ReadS4le();
                _size = m_io.ReadS4le();
                _name = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(8));
                }
            private bool f_contents;
            private object _contents;
            public object Contents
            {
                get
                {
                    if (f_contents)
                        return _contents;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(Offset);
                    switch (Name) {
                    case "SECTORS\0": {
                        __raw_contents = io.ReadBytes(Size);
                        var io___raw_contents = new KaitaiStream(__raw_contents);
                        _contents = new Sectors(io___raw_contents, this, m_root);
                        break;
                    }
                    case "VERTEXES": {
                        __raw_contents = io.ReadBytes(Size);
                        var io___raw_contents = new KaitaiStream(__raw_contents);
                        _contents = new Vertexes(io___raw_contents, this, m_root);
                        break;
                    }
                    case "BLOCKMAP": {
                        __raw_contents = io.ReadBytes(Size);
                        var io___raw_contents = new KaitaiStream(__raw_contents);
                        _contents = new Blockmap(io___raw_contents, this, m_root);
                        break;
                    }
                    case "THINGS\0\0": {
                        __raw_contents = io.ReadBytes(Size);
                        var io___raw_contents = new KaitaiStream(__raw_contents);
                        _contents = new Things(io___raw_contents, this, m_root);
                        break;
                    }
                    case "LINEDEFS": {
                        __raw_contents = io.ReadBytes(Size);
                        var io___raw_contents = new KaitaiStream(__raw_contents);
                        _contents = new Linedefs(io___raw_contents, this, m_root);
                        break;
                    }
                    case "SIDEDEFS": {
                        __raw_contents = io.ReadBytes(Size);
                        var io___raw_contents = new KaitaiStream(__raw_contents);
                        _contents = new Sidedefs(io___raw_contents, this, m_root);
                        break;
                    }
                    default: {
                        _contents = io.ReadBytes(Size);
                        break;
                    }
                    }
                    io.Seek(_pos);
                    f_contents = true;
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
        public partial class Sidedefs : KaitaiStruct
        {
            public static Sidedefs FromFile(string fileName)
            {
                return new Sidedefs(new KaitaiStream(fileName));
            }

            public Sidedefs(KaitaiStream io, DoomWad.IndexEntry parent = null, DoomWad root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _entries = new List<Sidedef>();
                while (!m_io.IsEof) {
                    _entries.Add(new Sidedef(m_io, this, m_root));
                }
                }
            private List<Sidedef> _entries;
            private DoomWad m_root;
            private DoomWad.IndexEntry m_parent;
            public List<Sidedef> Entries { get { return _entries; } }
            public DoomWad M_Root { get { return m_root; } }
            public DoomWad.IndexEntry M_Parent { get { return m_parent; } }
        }
        public partial class Blockmap : KaitaiStruct
        {
            public static Blockmap FromFile(string fileName)
            {
                return new Blockmap(new KaitaiStream(fileName));
            }

            public Blockmap(KaitaiStream io, DoomWad.IndexEntry parent = null, DoomWad root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _originX = m_io.ReadS2le();
                _originY = m_io.ReadS2le();
                _numCols = m_io.ReadS2le();
                _numRows = m_io.ReadS2le();
                _linedefsInBlock = new List<Blocklist>((int) ((NumCols * NumRows)));
                for (var i = 0; i < (NumCols * NumRows); i++) {
                    _linedefsInBlock.Add(new Blocklist(m_io, this, m_root));
                }
                }
            public partial class Blocklist : KaitaiStruct
            {
                public static Blocklist FromFile(string fileName)
                {
                    return new Blocklist(new KaitaiStream(fileName));
                }

                public Blocklist(KaitaiStream io, DoomWad.Blockmap parent = null, DoomWad root = null) : base(io)
                {
                    m_parent = parent;
                    m_root = root;
                    f_linedefs = false;
                    _read();
                }
                private void _read() {
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
                        long _pos = m_io.Pos;
                        m_io.Seek((Offset * 2));
                        _linedefs = new List<short>();
                        {
                            short M_;
                            do {
                                M_ = m_io.ReadS2le();
                                _linedefs.Add(M_);
                            } while (!(M_ == -1));
                        }
                        m_io.Seek(_pos);
                        f_linedefs = true;
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
        private bool f_index;
        private List<IndexEntry> _index;
        public List<IndexEntry> Index
        {
            get
            {
                if (f_index)
                    return _index;
                long _pos = m_io.Pos;
                m_io.Seek(IndexOffset);
                _index = new List<IndexEntry>((int) (NumIndexEntries));
                for (var i = 0; i < NumIndexEntries; i++) {
                    _index.Add(new IndexEntry(m_io, this, m_root));
                }
                m_io.Seek(_pos);
                f_index = true;
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
