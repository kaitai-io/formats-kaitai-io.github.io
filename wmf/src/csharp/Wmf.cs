// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// WMF (Windows Metafile) is a relatively early vector image format
    /// introduced for Microsoft Windows in 1990.
    /// 
    /// Inside, it provides a serialized list of Windows GDI (Graphics
    /// Device Interface) function calls, which, if played back, result in
    /// an image being drawn on a given surface (display, off-screen buffer,
    /// printer, etc).
    /// </summary>
    /// <remarks>
    /// Reference: <a href="http://www.digitalpreservation.gov/formats/digformatspecs/WindowsMetafileFormat(wmf)Specification.pdf">Source</a>
    /// </remarks>
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

        public enum BinRasterOp
        {
            Black = 1,
            Notmergepen = 2,
            Masknotpen = 3,
            Notcopypen = 4,
            Maskpennot = 5,
            Not = 6,
            Xorpen = 7,
            Notmaskpen = 8,
            Maskpen = 9,
            Notxorpen = 10,
            Nop = 11,
            Mergenotpen = 12,
            Copypen = 13,
            Mergepennot = 14,
            Mergepen = 15,
            White = 16,
        }

        public enum MixMode
        {
            Transparent = 1,
            Opaque = 2,
        }

        public enum PolyFillMode
        {
            Alternate = 1,
            Winding = 2,
        }
        public Wmf(KaitaiStream p__io, KaitaiStruct p__parent = null, Wmf p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _specialHeader = new SpecialHeader(m_io, this, m_root);
            _header = new Header(m_io, this, m_root);
            _records = new List<Record>();
            {
                var i = 0;
                Record M_;
                do {
                    M_ = new Record(m_io, this, m_root);
                    _records.Add(M_);
                    i++;
                } while (!(M_.Function == Func.Eof));
            }
        }
        public partial class ParamsSetwindoworg : KaitaiStruct
        {
            public static ParamsSetwindoworg FromFile(string fileName)
            {
                return new ParamsSetwindoworg(new KaitaiStream(fileName));
            }

            public ParamsSetwindoworg(KaitaiStream p__io, Wmf.Record p__parent = null, Wmf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _y = m_io.ReadS2le();
                _x = m_io.ReadS2le();
            }
            private short _y;
            private short _x;
            private Wmf m_root;
            private Wmf.Record m_parent;

            /// <summary>
            /// Y coordinate of the window origin, in logical units.
            /// </summary>
            public short Y { get { return _y; } }

            /// <summary>
            /// X coordinate of the window origin, in logical units.
            /// </summary>
            public short X { get { return _x; } }
            public Wmf M_Root { get { return m_root; } }
            public Wmf.Record M_Parent { get { return m_parent; } }
        }
        public partial class ParamsSetbkmode : KaitaiStruct
        {
            public static ParamsSetbkmode FromFile(string fileName)
            {
                return new ParamsSetbkmode(new KaitaiStream(fileName));
            }

            public ParamsSetbkmode(KaitaiStream p__io, Wmf.Record p__parent = null, Wmf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _bkMode = ((Wmf.MixMode) m_io.ReadU2le());
            }
            private MixMode _bkMode;
            private Wmf m_root;
            private Wmf.Record m_parent;

            /// <summary>
            /// Defines current graphic context background mix mode.
            /// </summary>
            public MixMode BkMode { get { return _bkMode; } }
            public Wmf M_Root { get { return m_root; } }
            public Wmf.Record M_Parent { get { return m_parent; } }
        }
        public partial class PointS : KaitaiStruct
        {
            public static PointS FromFile(string fileName)
            {
                return new PointS(new KaitaiStream(fileName));
            }

            public PointS(KaitaiStream p__io, KaitaiStruct p__parent = null, Wmf p__root = null) : base(p__io)
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
            private Wmf m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// X coordinate of the point, in logical units.
            /// </summary>
            public short X { get { return _x; } }

            /// <summary>
            /// Y coordinate of the point, in logical units.
            /// </summary>
            public short Y { get { return _y; } }
            public Wmf M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class ParamsSetwindowext : KaitaiStruct
        {
            public static ParamsSetwindowext FromFile(string fileName)
            {
                return new ParamsSetwindowext(new KaitaiStream(fileName));
            }

            public ParamsSetwindowext(KaitaiStream p__io, Wmf.Record p__parent = null, Wmf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _y = m_io.ReadS2le();
                _x = m_io.ReadS2le();
            }
            private short _y;
            private short _x;
            private Wmf m_root;
            private Wmf.Record m_parent;

            /// <summary>
            /// Vertical extent of the window in logical units.
            /// </summary>
            public short Y { get { return _y; } }

            /// <summary>
            /// Horizontal extent of the window in logical units.
            /// </summary>
            public short X { get { return _x; } }
            public Wmf M_Root { get { return m_root; } }
            public Wmf.Record M_Parent { get { return m_parent; } }
        }
        public partial class ParamsPolygon : KaitaiStruct
        {
            public static ParamsPolygon FromFile(string fileName)
            {
                return new ParamsPolygon(new KaitaiStream(fileName));
            }

            public ParamsPolygon(KaitaiStream p__io, Wmf.Record p__parent = null, Wmf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numPoints = m_io.ReadS2le();
                _points = new List<PointS>((int) (NumPoints));
                for (var i = 0; i < NumPoints; i++)
                {
                    _points.Add(new PointS(m_io, this, m_root));
                }
            }
            private short _numPoints;
            private List<PointS> _points;
            private Wmf m_root;
            private Wmf.Record m_parent;
            public short NumPoints { get { return _numPoints; } }
            public List<PointS> Points { get { return _points; } }
            public Wmf M_Root { get { return m_root; } }
            public Wmf.Record M_Parent { get { return m_parent; } }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }


            public enum MetafileType
            {
                MemoryMetafile = 1,
                DiskMetafile = 2,
            }
            public Header(KaitaiStream p__io, Wmf p__parent = null, Wmf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _metafileType = ((MetafileType) m_io.ReadU2le());
                _headerSize = m_io.ReadU2le();
                _version = m_io.ReadU2le();
                _size = m_io.ReadU4le();
                _numberOfObjects = m_io.ReadU2le();
                _maxRecord = m_io.ReadU4le();
                _numberOfMembers = m_io.ReadU2le();
            }
            private MetafileType _metafileType;
            private ushort _headerSize;
            private ushort _version;
            private uint _size;
            private ushort _numberOfObjects;
            private uint _maxRecord;
            private ushort _numberOfMembers;
            private Wmf m_root;
            private Wmf m_parent;
            public MetafileType MetafileType { get { return _metafileType; } }
            public ushort HeaderSize { get { return _headerSize; } }
            public ushort Version { get { return _version; } }
            public uint Size { get { return _size; } }
            public ushort NumberOfObjects { get { return _numberOfObjects; } }
            public uint MaxRecord { get { return _maxRecord; } }
            public ushort NumberOfMembers { get { return _numberOfMembers; } }
            public Wmf M_Root { get { return m_root; } }
            public Wmf M_Parent { get { return m_parent; } }
        }
        public partial class ColorRef : KaitaiStruct
        {
            public static ColorRef FromFile(string fileName)
            {
                return new ColorRef(new KaitaiStream(fileName));
            }

            public ColorRef(KaitaiStream p__io, Wmf.Record p__parent = null, Wmf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _red = m_io.ReadU1();
                _green = m_io.ReadU1();
                _blue = m_io.ReadU1();
                _reserved = m_io.ReadU1();
            }
            private byte _red;
            private byte _green;
            private byte _blue;
            private byte _reserved;
            private Wmf m_root;
            private Wmf.Record m_parent;
            public byte Red { get { return _red; } }
            public byte Green { get { return _green; } }
            public byte Blue { get { return _blue; } }
            public byte Reserved { get { return _reserved; } }
            public Wmf M_Root { get { return m_root; } }
            public Wmf.Record M_Parent { get { return m_parent; } }
        }
        public partial class ParamsSetrop2 : KaitaiStruct
        {
            public static ParamsSetrop2 FromFile(string fileName)
            {
                return new ParamsSetrop2(new KaitaiStream(fileName));
            }

            public ParamsSetrop2(KaitaiStream p__io, Wmf.Record p__parent = null, Wmf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _drawMode = ((Wmf.BinRasterOp) m_io.ReadU2le());
            }
            private BinRasterOp _drawMode;
            private Wmf m_root;
            private Wmf.Record m_parent;

            /// <summary>
            /// Defines current foreground binary raster operation mixing mode.
            /// </summary>
            public BinRasterOp DrawMode { get { return _drawMode; } }
            public Wmf M_Root { get { return m_root; } }
            public Wmf.Record M_Parent { get { return m_parent; } }
        }
        public partial class ParamsSetpolyfillmode : KaitaiStruct
        {
            public static ParamsSetpolyfillmode FromFile(string fileName)
            {
                return new ParamsSetpolyfillmode(new KaitaiStream(fileName));
            }

            public ParamsSetpolyfillmode(KaitaiStream p__io, Wmf.Record p__parent = null, Wmf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _polyFillMode = ((Wmf.PolyFillMode) m_io.ReadU2le());
            }
            private PolyFillMode _polyFillMode;
            private Wmf m_root;
            private Wmf.Record m_parent;

            /// <summary>
            /// Defines current polygon fill mode.
            /// </summary>
            public PolyFillMode PolyFillMode { get { return _polyFillMode; } }
            public Wmf M_Root { get { return m_root; } }
            public Wmf.Record M_Parent { get { return m_parent; } }
        }
        public partial class ParamsPolyline : KaitaiStruct
        {
            public static ParamsPolyline FromFile(string fileName)
            {
                return new ParamsPolyline(new KaitaiStream(fileName));
            }

            public ParamsPolyline(KaitaiStream p__io, Wmf.Record p__parent = null, Wmf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numPoints = m_io.ReadS2le();
                _points = new List<PointS>((int) (NumPoints));
                for (var i = 0; i < NumPoints; i++)
                {
                    _points.Add(new PointS(m_io, this, m_root));
                }
            }
            private short _numPoints;
            private List<PointS> _points;
            private Wmf m_root;
            private Wmf.Record m_parent;
            public short NumPoints { get { return _numPoints; } }
            public List<PointS> Points { get { return _points; } }
            public Wmf M_Root { get { return m_root; } }
            public Wmf.Record M_Parent { get { return m_parent; } }
        }
        public partial class SpecialHeader : KaitaiStruct
        {
            public static SpecialHeader FromFile(string fileName)
            {
                return new SpecialHeader(new KaitaiStream(fileName));
            }

            public SpecialHeader(KaitaiStream p__io, Wmf p__parent = null, Wmf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
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
        public partial class Record : KaitaiStruct
        {
            public static Record FromFile(string fileName)
            {
                return new Record(new KaitaiStream(fileName));
            }

            public Record(KaitaiStream p__io, Wmf p__parent = null, Wmf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _size = m_io.ReadU4le();
                _function = ((Wmf.Func) m_io.ReadU2le());
                switch (Function) {
                case Wmf.Func.Setbkmode: {
                    __raw_params = m_io.ReadBytes(((Size - 3) * 2));
                    var io___raw_params = new KaitaiStream(__raw_params);
                    _params = new ParamsSetbkmode(io___raw_params, this, m_root);
                    break;
                }
                case Wmf.Func.Polygon: {
                    __raw_params = m_io.ReadBytes(((Size - 3) * 2));
                    var io___raw_params = new KaitaiStream(__raw_params);
                    _params = new ParamsPolygon(io___raw_params, this, m_root);
                    break;
                }
                case Wmf.Func.Setbkcolor: {
                    __raw_params = m_io.ReadBytes(((Size - 3) * 2));
                    var io___raw_params = new KaitaiStream(__raw_params);
                    _params = new ColorRef(io___raw_params, this, m_root);
                    break;
                }
                case Wmf.Func.Setpolyfillmode: {
                    __raw_params = m_io.ReadBytes(((Size - 3) * 2));
                    var io___raw_params = new KaitaiStream(__raw_params);
                    _params = new ParamsSetpolyfillmode(io___raw_params, this, m_root);
                    break;
                }
                case Wmf.Func.Setwindoworg: {
                    __raw_params = m_io.ReadBytes(((Size - 3) * 2));
                    var io___raw_params = new KaitaiStream(__raw_params);
                    _params = new ParamsSetwindoworg(io___raw_params, this, m_root);
                    break;
                }
                case Wmf.Func.Setrop2: {
                    __raw_params = m_io.ReadBytes(((Size - 3) * 2));
                    var io___raw_params = new KaitaiStream(__raw_params);
                    _params = new ParamsSetrop2(io___raw_params, this, m_root);
                    break;
                }
                case Wmf.Func.Setwindowext: {
                    __raw_params = m_io.ReadBytes(((Size - 3) * 2));
                    var io___raw_params = new KaitaiStream(__raw_params);
                    _params = new ParamsSetwindowext(io___raw_params, this, m_root);
                    break;
                }
                case Wmf.Func.Polyline: {
                    __raw_params = m_io.ReadBytes(((Size - 3) * 2));
                    var io___raw_params = new KaitaiStream(__raw_params);
                    _params = new ParamsPolyline(io___raw_params, this, m_root);
                    break;
                }
                default: {
                    _params = m_io.ReadBytes(((Size - 3) * 2));
                    break;
                }
                }
            }
            private uint _size;
            private Func _function;
            private object _params;
            private Wmf m_root;
            private Wmf m_parent;
            private byte[] __raw_params;
            public uint Size { get { return _size; } }
            public Func Function { get { return _function; } }
            public object Params { get { return _params; } }
            public Wmf M_Root { get { return m_root; } }
            public Wmf M_Parent { get { return m_parent; } }
            public byte[] M_RawParams { get { return __raw_params; } }
        }
        private SpecialHeader _specialHeader;
        private Header _header;
        private List<Record> _records;
        private Wmf m_root;
        private KaitaiStruct m_parent;
        public SpecialHeader SpecialHeader { get { return _specialHeader; } }
        public Header Header { get { return _header; } }
        public List<Record> Records { get { return _records; } }
        public Wmf M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
