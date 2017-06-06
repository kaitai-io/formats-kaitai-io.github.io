// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class Wmf : KaitaiStruct
    {
        public static Wmf FromFile(string fileName)
        {
            return new Wmf(new KaitaiStream(fileName));
        }

        public enum Func
        {
            Eof = 0,
            Savedc = 30,
            Realizepalette = 53,
            Setpalentries = 55,
            Createpalette = 247,
            Setbkmode = 258,
            Setmapmode = 259,
            Setrop2 = 260,
            Setrelabs = 261,
            Setpolyfillmode = 262,
            Setstretchbltmode = 263,
            Settextcharextra = 264,
            Restoredc = 295,
            Invertregion = 298,
            Paintregion = 299,
            Selectclipregion = 300,
            Selectobject = 301,
            Settextalign = 302,
            Resizepalette = 313,
            Dibcreatepatternbrush = 322,
            Setlayout = 329,
            Deleteobject = 496,
            Createpatternbrush = 505,
            Setbkcolor = 513,
            Settextcolor = 521,
            Settextjustification = 522,
            Setwindoworg = 523,
            Setwindowext = 524,
            Setviewportorg = 525,
            Setviewportext = 526,
            Offsetwindoworg = 527,
            Offsetviewportorg = 529,
            Lineto = 531,
            Moveto = 532,
            Offsetcliprgn = 544,
            Fillregion = 552,
            Setmapperflags = 561,
            Selectpalette = 564,
            Createpenindirect = 762,
            Createfontindirect = 763,
            Createbrushindirect = 764,
            Polygon = 804,
            Polyline = 805,
            Scalewindowext = 1040,
            Scaleviewportext = 1042,
            Excludecliprect = 1045,
            Intersectcliprect = 1046,
            Ellipse = 1048,
            Floodfill = 1049,
            Rectangle = 1051,
            Setpixel = 1055,
            Frameregion = 1065,
            Animatepalette = 1078,
            Textout = 1313,
            Polypolygon = 1336,
            Extfloodfill = 1352,
            Roundrect = 1564,
            Patblt = 1565,
            Escape = 1574,
            Createregion = 1791,
            Arc = 2071,
            Pie = 2074,
            Chord = 2096,
            Bitblt = 2338,
            Dibbitblt = 2368,
            Exttextout = 2610,
            Stretchblt = 2851,
            Dibstretchblt = 2881,
            Setdibtodev = 3379,
            Stretchdib = 3907,
        }

        public Wmf(KaitaiStream io, KaitaiStruct parent = null, Wmf root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            _read();
        }
        private void _read() {
            _specialHdr = new SpecialHeader(m_io, this, m_root);
            _header = new WmfHeader(m_io, this, m_root);
            _records = new List<Record>();
            {
                Record M_;
                do {
                    M_ = new Record(m_io, this, m_root);
                    _records.Add(M_);
                } while (!(M_.Function == Func.Eof));
            }
            }
        public partial class SpecialHeader : KaitaiStruct
        {
            public static SpecialHeader FromFile(string fileName)
            {
                return new SpecialHeader(new KaitaiStream(fileName));
            }

            public SpecialHeader(KaitaiStream io, Wmf parent = null, Wmf root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _magic = m_io.EnsureFixedContents(new byte[] { 215, 205, 198, 154 });
                _handle = m_io.EnsureFixedContents(new byte[] { 0, 0 });
                _left = m_io.ReadS2le();
                _top = m_io.ReadS2le();
                _right = m_io.ReadS2le();
                _bottom = m_io.ReadS2le();
                _inch = m_io.ReadU2le();
                _reserved = m_io.EnsureFixedContents(new byte[] { 0, 0, 0, 0 });
                _checksum = m_io.ReadU2le();
                }
            private byte[] _magic;
            private byte[] _handle;
            private short _left;
            private short _top;
            private short _right;
            private short _bottom;
            private ushort _inch;
            private byte[] _reserved;
            private ushort _checksum;
            private Wmf m_root;
            private Wmf m_parent;
            public byte[] Magic { get { return _magic; } }
            public byte[] Handle { get { return _handle; } }
            public short Left { get { return _left; } }
            public short Top { get { return _top; } }
            public short Right { get { return _right; } }
            public short Bottom { get { return _bottom; } }
            public ushort Inch { get { return _inch; } }
            public byte[] Reserved { get { return _reserved; } }
            public ushort Checksum { get { return _checksum; } }
            public Wmf M_Root { get { return m_root; } }
            public Wmf M_Parent { get { return m_parent; } }
        }
        public partial class WmfHeader : KaitaiStruct
        {
            public static WmfHeader FromFile(string fileName)
            {
                return new WmfHeader(new KaitaiStream(fileName));
            }

            public enum MetafileType
            {
                MemoryMetafile = 1,
                DiskMetafile = 2,
            }

            public WmfHeader(KaitaiStream io, Wmf parent = null, Wmf root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _type = ((MetafileType) m_io.ReadU2le());
                _headerSize = m_io.ReadU2le();
                _version = m_io.ReadU2le();
                _size = m_io.ReadU4le();
                _numberOfObjects = m_io.ReadU2le();
                _maxRecord = m_io.ReadU4le();
                _numberOfMembers = m_io.ReadU2le();
                }
            private MetafileType _type;
            private ushort _headerSize;
            private ushort _version;
            private uint _size;
            private ushort _numberOfObjects;
            private uint _maxRecord;
            private ushort _numberOfMembers;
            private Wmf m_root;
            private Wmf m_parent;
            public MetafileType Type { get { return _type; } }
            public ushort HeaderSize { get { return _headerSize; } }
            public ushort Version { get { return _version; } }
            public uint Size { get { return _size; } }
            public ushort NumberOfObjects { get { return _numberOfObjects; } }
            public uint MaxRecord { get { return _maxRecord; } }
            public ushort NumberOfMembers { get { return _numberOfMembers; } }
            public Wmf M_Root { get { return m_root; } }
            public Wmf M_Parent { get { return m_parent; } }
        }
        public partial class Record : KaitaiStruct
        {
            public static Record FromFile(string fileName)
            {
                return new Record(new KaitaiStream(fileName));
            }

            public Record(KaitaiStream io, Wmf parent = null, Wmf root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _size = m_io.ReadU4le();
                _function = ((Wmf.Func) m_io.ReadU2le());
                _params = m_io.ReadBytes(((Size - 3) * 2));
                }
            private uint _size;
            private Func _function;
            private byte[] _params;
            private Wmf m_root;
            private Wmf m_parent;
            public uint Size { get { return _size; } }
            public Func Function { get { return _function; } }
            public byte[] Params { get { return _params; } }
            public Wmf M_Root { get { return m_root; } }
            public Wmf M_Parent { get { return m_parent; } }
        }
        private SpecialHeader _specialHdr;
        private WmfHeader _header;
        private List<Record> _records;
        private Wmf m_root;
        private KaitaiStruct m_parent;
        public SpecialHeader SpecialHdr { get { return _specialHdr; } }
        public WmfHeader Header { get { return _header; } }
        public List<Record> Records { get { return _records; } }
        public Wmf M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
