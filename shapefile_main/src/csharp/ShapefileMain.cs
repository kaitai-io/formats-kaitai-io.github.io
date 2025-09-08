// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class ShapefileMain : KaitaiStruct
    {
        public static ShapefileMain FromFile(string fileName)
        {
            return new ShapefileMain(new KaitaiStream(fileName));
        }


        public enum PartType
        {
            TriangleStrip = 0,
            TriangleFan = 1,
            OuterRing = 2,
            InnerRing = 3,
            FirstRing = 4,
            Ring = 5,
        }

        public enum ShapeType
        {
            NullShape = 0,
            Point = 1,
            PolyLine = 3,
            Polygon = 5,
            MultiPoint = 8,
            PointZ = 11,
            PolyLineZ = 13,
            PolygonZ = 15,
            MultiPointZ = 18,
            PointM = 21,
            PolyLineM = 23,
            PolygonM = 25,
            MultiPointM = 28,
            MultiPatch = 31,
        }
        public ShapefileMain(KaitaiStream p__io, KaitaiStruct p__parent = null, ShapefileMain p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _header = new FileHeader(m_io, this, m_root);
            _records = new List<Record>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _records.Add(new Record(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class BoundingBoxXY : KaitaiStruct
        {
            public static BoundingBoxXY FromFile(string fileName)
            {
                return new BoundingBoxXY(new KaitaiStream(fileName));
            }

            public BoundingBoxXY(KaitaiStream p__io, KaitaiStruct p__parent = null, ShapefileMain p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _x = new BoundsMinMax(m_io, this, m_root);
                _y = new BoundsMinMax(m_io, this, m_root);
            }
            private BoundsMinMax _x;
            private BoundsMinMax _y;
            private ShapefileMain m_root;
            private KaitaiStruct m_parent;
            public BoundsMinMax X { get { return _x; } }
            public BoundsMinMax Y { get { return _y; } }
            public ShapefileMain M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class BoundingBoxXYZM : KaitaiStruct
        {
            public static BoundingBoxXYZM FromFile(string fileName)
            {
                return new BoundingBoxXYZM(new KaitaiStream(fileName));
            }

            public BoundingBoxXYZM(KaitaiStream p__io, ShapefileMain.FileHeader p__parent = null, ShapefileMain p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _x = new BoundsMinMax(m_io, this, m_root);
                _y = new BoundsMinMax(m_io, this, m_root);
                _z = new BoundsMinMax(m_io, this, m_root);
                _m = new BoundsMinMax(m_io, this, m_root);
            }
            private BoundsMinMax _x;
            private BoundsMinMax _y;
            private BoundsMinMax _z;
            private BoundsMinMax _m;
            private ShapefileMain m_root;
            private ShapefileMain.FileHeader m_parent;
            public BoundsMinMax X { get { return _x; } }
            public BoundsMinMax Y { get { return _y; } }
            public BoundsMinMax Z { get { return _z; } }
            public BoundsMinMax M { get { return _m; } }
            public ShapefileMain M_Root { get { return m_root; } }
            public ShapefileMain.FileHeader M_Parent { get { return m_parent; } }
        }
        public partial class BoundsMinMax : KaitaiStruct
        {
            public static BoundsMinMax FromFile(string fileName)
            {
                return new BoundsMinMax(new KaitaiStream(fileName));
            }

            public BoundsMinMax(KaitaiStream p__io, KaitaiStruct p__parent = null, ShapefileMain p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _min = m_io.ReadF8le();
                _max = m_io.ReadF8le();
            }
            private double _min;
            private double _max;
            private ShapefileMain m_root;
            private KaitaiStruct m_parent;
            public double Min { get { return _min; } }
            public double Max { get { return _max; } }
            public ShapefileMain M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class FileHeader : KaitaiStruct
        {
            public static FileHeader FromFile(string fileName)
            {
                return new FileHeader(new KaitaiStream(fileName));
            }

            public FileHeader(KaitaiStream p__io, ShapefileMain p__parent = null, ShapefileMain p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fileCode = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_fileCode, new byte[] { 0, 0, 39, 10 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0, 39, 10 }, _fileCode, m_io, "/types/file_header/seq/0");
                }
                _unusedField1 = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_unusedField1, new byte[] { 0, 0, 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, _unusedField1, m_io, "/types/file_header/seq/1");
                }
                _unusedField2 = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_unusedField2, new byte[] { 0, 0, 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, _unusedField2, m_io, "/types/file_header/seq/2");
                }
                _unusedField3 = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_unusedField3, new byte[] { 0, 0, 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, _unusedField3, m_io, "/types/file_header/seq/3");
                }
                _unusedField4 = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_unusedField4, new byte[] { 0, 0, 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, _unusedField4, m_io, "/types/file_header/seq/4");
                }
                _unusedField5 = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_unusedField5, new byte[] { 0, 0, 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, _unusedField5, m_io, "/types/file_header/seq/5");
                }
                _fileLength = m_io.ReadS4be();
                _version = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_version, new byte[] { 232, 3, 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 232, 3, 0, 0 }, _version, m_io, "/types/file_header/seq/7");
                }
                _shapeType = ((ShapefileMain.ShapeType) m_io.ReadS4le());
                _boundingBox = new BoundingBoxXYZM(m_io, this, m_root);
            }
            private byte[] _fileCode;
            private byte[] _unusedField1;
            private byte[] _unusedField2;
            private byte[] _unusedField3;
            private byte[] _unusedField4;
            private byte[] _unusedField5;
            private int _fileLength;
            private byte[] _version;
            private ShapeType _shapeType;
            private BoundingBoxXYZM _boundingBox;
            private ShapefileMain m_root;
            private ShapefileMain m_parent;

            /// <summary>
            /// corresponds to s4be value of 9994
            /// </summary>
            public byte[] FileCode { get { return _fileCode; } }
            public byte[] UnusedField1 { get { return _unusedField1; } }
            public byte[] UnusedField2 { get { return _unusedField2; } }
            public byte[] UnusedField3 { get { return _unusedField3; } }
            public byte[] UnusedField4 { get { return _unusedField4; } }
            public byte[] UnusedField5 { get { return _unusedField5; } }
            public int FileLength { get { return _fileLength; } }

            /// <summary>
            /// corresponds to s4le value of 1000
            /// </summary>
            public byte[] Version { get { return _version; } }
            public ShapeType ShapeType { get { return _shapeType; } }
            public BoundingBoxXYZM BoundingBox { get { return _boundingBox; } }
            public ShapefileMain M_Root { get { return m_root; } }
            public ShapefileMain M_Parent { get { return m_parent; } }
        }
        public partial class MultiPatch : KaitaiStruct
        {
            public static MultiPatch FromFile(string fileName)
            {
                return new MultiPatch(new KaitaiStream(fileName));
            }

            public MultiPatch(KaitaiStream p__io, ShapefileMain.RecordContents p__parent = null, ShapefileMain p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _boundingBox = new BoundingBoxXY(m_io, this, m_root);
                _numberOfParts = m_io.ReadS4le();
                _numberOfPoints = m_io.ReadS4le();
                _parts = new List<int>();
                for (var i = 0; i < NumberOfParts; i++)
                {
                    _parts.Add(m_io.ReadS4le());
                }
                _partTypes = new List<PartType>();
                for (var i = 0; i < NumberOfParts; i++)
                {
                    _partTypes.Add(((ShapefileMain.PartType) m_io.ReadS4le()));
                }
                _points = new List<Point>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _points.Add(new Point(m_io, this, m_root));
                }
                _zRange = new BoundsMinMax(m_io, this, m_root);
                _zValues = new List<double>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _zValues.Add(m_io.ReadF8le());
                }
                _mRange = new BoundsMinMax(m_io, this, m_root);
                _mValues = new List<double>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _mValues.Add(m_io.ReadF8le());
                }
            }
            private BoundingBoxXY _boundingBox;
            private int _numberOfParts;
            private int _numberOfPoints;
            private List<int> _parts;
            private List<PartType> _partTypes;
            private List<Point> _points;
            private BoundsMinMax _zRange;
            private List<double> _zValues;
            private BoundsMinMax _mRange;
            private List<double> _mValues;
            private ShapefileMain m_root;
            private ShapefileMain.RecordContents m_parent;
            public BoundingBoxXY BoundingBox { get { return _boundingBox; } }
            public int NumberOfParts { get { return _numberOfParts; } }
            public int NumberOfPoints { get { return _numberOfPoints; } }
            public List<int> Parts { get { return _parts; } }
            public List<PartType> PartTypes { get { return _partTypes; } }
            public List<Point> Points { get { return _points; } }
            public BoundsMinMax ZRange { get { return _zRange; } }
            public List<double> ZValues { get { return _zValues; } }
            public BoundsMinMax MRange { get { return _mRange; } }
            public List<double> MValues { get { return _mValues; } }
            public ShapefileMain M_Root { get { return m_root; } }
            public ShapefileMain.RecordContents M_Parent { get { return m_parent; } }
        }
        public partial class MultiPoint : KaitaiStruct
        {
            public static MultiPoint FromFile(string fileName)
            {
                return new MultiPoint(new KaitaiStream(fileName));
            }

            public MultiPoint(KaitaiStream p__io, ShapefileMain.RecordContents p__parent = null, ShapefileMain p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _boundingBox = new BoundingBoxXY(m_io, this, m_root);
                _numberOfPoints = m_io.ReadS4le();
                _points = new List<Point>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _points.Add(new Point(m_io, this, m_root));
                }
            }
            private BoundingBoxXY _boundingBox;
            private int _numberOfPoints;
            private List<Point> _points;
            private ShapefileMain m_root;
            private ShapefileMain.RecordContents m_parent;
            public BoundingBoxXY BoundingBox { get { return _boundingBox; } }
            public int NumberOfPoints { get { return _numberOfPoints; } }
            public List<Point> Points { get { return _points; } }
            public ShapefileMain M_Root { get { return m_root; } }
            public ShapefileMain.RecordContents M_Parent { get { return m_parent; } }
        }
        public partial class MultiPointM : KaitaiStruct
        {
            public static MultiPointM FromFile(string fileName)
            {
                return new MultiPointM(new KaitaiStream(fileName));
            }

            public MultiPointM(KaitaiStream p__io, ShapefileMain.RecordContents p__parent = null, ShapefileMain p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _boundingBox = new BoundingBoxXY(m_io, this, m_root);
                _numberOfPoints = m_io.ReadS4le();
                _points = new List<Point>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _points.Add(new Point(m_io, this, m_root));
                }
                _mRange = new BoundsMinMax(m_io, this, m_root);
                _mValues = new List<double>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _mValues.Add(m_io.ReadF8le());
                }
            }
            private BoundingBoxXY _boundingBox;
            private int _numberOfPoints;
            private List<Point> _points;
            private BoundsMinMax _mRange;
            private List<double> _mValues;
            private ShapefileMain m_root;
            private ShapefileMain.RecordContents m_parent;
            public BoundingBoxXY BoundingBox { get { return _boundingBox; } }
            public int NumberOfPoints { get { return _numberOfPoints; } }
            public List<Point> Points { get { return _points; } }
            public BoundsMinMax MRange { get { return _mRange; } }
            public List<double> MValues { get { return _mValues; } }
            public ShapefileMain M_Root { get { return m_root; } }
            public ShapefileMain.RecordContents M_Parent { get { return m_parent; } }
        }
        public partial class MultiPointZ : KaitaiStruct
        {
            public static MultiPointZ FromFile(string fileName)
            {
                return new MultiPointZ(new KaitaiStream(fileName));
            }

            public MultiPointZ(KaitaiStream p__io, ShapefileMain.RecordContents p__parent = null, ShapefileMain p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _boundingBox = new BoundingBoxXY(m_io, this, m_root);
                _numberOfPoints = m_io.ReadS4le();
                _points = new List<Point>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _points.Add(new Point(m_io, this, m_root));
                }
                _zRange = new BoundsMinMax(m_io, this, m_root);
                _zValues = new List<double>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _zValues.Add(m_io.ReadF8le());
                }
                _mRange = new BoundsMinMax(m_io, this, m_root);
                _mValues = new List<double>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _mValues.Add(m_io.ReadF8le());
                }
            }
            private BoundingBoxXY _boundingBox;
            private int _numberOfPoints;
            private List<Point> _points;
            private BoundsMinMax _zRange;
            private List<double> _zValues;
            private BoundsMinMax _mRange;
            private List<double> _mValues;
            private ShapefileMain m_root;
            private ShapefileMain.RecordContents m_parent;
            public BoundingBoxXY BoundingBox { get { return _boundingBox; } }
            public int NumberOfPoints { get { return _numberOfPoints; } }
            public List<Point> Points { get { return _points; } }
            public BoundsMinMax ZRange { get { return _zRange; } }
            public List<double> ZValues { get { return _zValues; } }
            public BoundsMinMax MRange { get { return _mRange; } }
            public List<double> MValues { get { return _mValues; } }
            public ShapefileMain M_Root { get { return m_root; } }
            public ShapefileMain.RecordContents M_Parent { get { return m_parent; } }
        }
        public partial class Point : KaitaiStruct
        {
            public static Point FromFile(string fileName)
            {
                return new Point(new KaitaiStream(fileName));
            }

            public Point(KaitaiStream p__io, KaitaiStruct p__parent = null, ShapefileMain p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _x = m_io.ReadF8le();
                _y = m_io.ReadF8le();
            }
            private double _x;
            private double _y;
            private ShapefileMain m_root;
            private KaitaiStruct m_parent;
            public double X { get { return _x; } }
            public double Y { get { return _y; } }
            public ShapefileMain M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class PointM : KaitaiStruct
        {
            public static PointM FromFile(string fileName)
            {
                return new PointM(new KaitaiStream(fileName));
            }

            public PointM(KaitaiStream p__io, ShapefileMain.RecordContents p__parent = null, ShapefileMain p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _x = m_io.ReadF8le();
                _y = m_io.ReadF8le();
                _m = m_io.ReadF8le();
            }
            private double _x;
            private double _y;
            private double _m;
            private ShapefileMain m_root;
            private ShapefileMain.RecordContents m_parent;
            public double X { get { return _x; } }
            public double Y { get { return _y; } }
            public double M { get { return _m; } }
            public ShapefileMain M_Root { get { return m_root; } }
            public ShapefileMain.RecordContents M_Parent { get { return m_parent; } }
        }
        public partial class PointZ : KaitaiStruct
        {
            public static PointZ FromFile(string fileName)
            {
                return new PointZ(new KaitaiStream(fileName));
            }

            public PointZ(KaitaiStream p__io, ShapefileMain.RecordContents p__parent = null, ShapefileMain p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _x = m_io.ReadF8le();
                _y = m_io.ReadF8le();
                _z = m_io.ReadF8le();
                _m = m_io.ReadF8le();
            }
            private double _x;
            private double _y;
            private double _z;
            private double _m;
            private ShapefileMain m_root;
            private ShapefileMain.RecordContents m_parent;
            public double X { get { return _x; } }
            public double Y { get { return _y; } }
            public double Z { get { return _z; } }
            public double M { get { return _m; } }
            public ShapefileMain M_Root { get { return m_root; } }
            public ShapefileMain.RecordContents M_Parent { get { return m_parent; } }
        }
        public partial class PolyLine : KaitaiStruct
        {
            public static PolyLine FromFile(string fileName)
            {
                return new PolyLine(new KaitaiStream(fileName));
            }

            public PolyLine(KaitaiStream p__io, ShapefileMain.RecordContents p__parent = null, ShapefileMain p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _boundingBox = new BoundingBoxXY(m_io, this, m_root);
                _numberOfParts = m_io.ReadS4le();
                _numberOfPoints = m_io.ReadS4le();
                _parts = new List<int>();
                for (var i = 0; i < NumberOfParts; i++)
                {
                    _parts.Add(m_io.ReadS4le());
                }
                _points = new List<Point>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _points.Add(new Point(m_io, this, m_root));
                }
            }
            private BoundingBoxXY _boundingBox;
            private int _numberOfParts;
            private int _numberOfPoints;
            private List<int> _parts;
            private List<Point> _points;
            private ShapefileMain m_root;
            private ShapefileMain.RecordContents m_parent;
            public BoundingBoxXY BoundingBox { get { return _boundingBox; } }
            public int NumberOfParts { get { return _numberOfParts; } }
            public int NumberOfPoints { get { return _numberOfPoints; } }
            public List<int> Parts { get { return _parts; } }
            public List<Point> Points { get { return _points; } }
            public ShapefileMain M_Root { get { return m_root; } }
            public ShapefileMain.RecordContents M_Parent { get { return m_parent; } }
        }
        public partial class PolyLineM : KaitaiStruct
        {
            public static PolyLineM FromFile(string fileName)
            {
                return new PolyLineM(new KaitaiStream(fileName));
            }

            public PolyLineM(KaitaiStream p__io, ShapefileMain.RecordContents p__parent = null, ShapefileMain p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _boundingBox = new BoundingBoxXY(m_io, this, m_root);
                _numberOfParts = m_io.ReadS4le();
                _numberOfPoints = m_io.ReadS4le();
                _parts = new List<int>();
                for (var i = 0; i < NumberOfParts; i++)
                {
                    _parts.Add(m_io.ReadS4le());
                }
                _points = new List<Point>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _points.Add(new Point(m_io, this, m_root));
                }
                _mRange = new BoundsMinMax(m_io, this, m_root);
                _mValues = new List<double>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _mValues.Add(m_io.ReadF8le());
                }
            }
            private BoundingBoxXY _boundingBox;
            private int _numberOfParts;
            private int _numberOfPoints;
            private List<int> _parts;
            private List<Point> _points;
            private BoundsMinMax _mRange;
            private List<double> _mValues;
            private ShapefileMain m_root;
            private ShapefileMain.RecordContents m_parent;
            public BoundingBoxXY BoundingBox { get { return _boundingBox; } }
            public int NumberOfParts { get { return _numberOfParts; } }
            public int NumberOfPoints { get { return _numberOfPoints; } }
            public List<int> Parts { get { return _parts; } }
            public List<Point> Points { get { return _points; } }
            public BoundsMinMax MRange { get { return _mRange; } }
            public List<double> MValues { get { return _mValues; } }
            public ShapefileMain M_Root { get { return m_root; } }
            public ShapefileMain.RecordContents M_Parent { get { return m_parent; } }
        }
        public partial class PolyLineZ : KaitaiStruct
        {
            public static PolyLineZ FromFile(string fileName)
            {
                return new PolyLineZ(new KaitaiStream(fileName));
            }

            public PolyLineZ(KaitaiStream p__io, ShapefileMain.RecordContents p__parent = null, ShapefileMain p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _boundingBox = new BoundingBoxXY(m_io, this, m_root);
                _numberOfParts = m_io.ReadS4le();
                _numberOfPoints = m_io.ReadS4le();
                _parts = new List<int>();
                for (var i = 0; i < NumberOfParts; i++)
                {
                    _parts.Add(m_io.ReadS4le());
                }
                _points = new List<Point>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _points.Add(new Point(m_io, this, m_root));
                }
                _zRange = new BoundsMinMax(m_io, this, m_root);
                _zValues = new List<double>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _zValues.Add(m_io.ReadF8le());
                }
                _mRange = new BoundsMinMax(m_io, this, m_root);
                _mValues = new List<double>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _mValues.Add(m_io.ReadF8le());
                }
            }
            private BoundingBoxXY _boundingBox;
            private int _numberOfParts;
            private int _numberOfPoints;
            private List<int> _parts;
            private List<Point> _points;
            private BoundsMinMax _zRange;
            private List<double> _zValues;
            private BoundsMinMax _mRange;
            private List<double> _mValues;
            private ShapefileMain m_root;
            private ShapefileMain.RecordContents m_parent;
            public BoundingBoxXY BoundingBox { get { return _boundingBox; } }
            public int NumberOfParts { get { return _numberOfParts; } }
            public int NumberOfPoints { get { return _numberOfPoints; } }
            public List<int> Parts { get { return _parts; } }
            public List<Point> Points { get { return _points; } }
            public BoundsMinMax ZRange { get { return _zRange; } }
            public List<double> ZValues { get { return _zValues; } }
            public BoundsMinMax MRange { get { return _mRange; } }
            public List<double> MValues { get { return _mValues; } }
            public ShapefileMain M_Root { get { return m_root; } }
            public ShapefileMain.RecordContents M_Parent { get { return m_parent; } }
        }
        public partial class Polygon : KaitaiStruct
        {
            public static Polygon FromFile(string fileName)
            {
                return new Polygon(new KaitaiStream(fileName));
            }

            public Polygon(KaitaiStream p__io, ShapefileMain.RecordContents p__parent = null, ShapefileMain p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _boundingBox = new BoundingBoxXY(m_io, this, m_root);
                _numberOfParts = m_io.ReadS4le();
                _numberOfPoints = m_io.ReadS4le();
                _parts = new List<int>();
                for (var i = 0; i < NumberOfParts; i++)
                {
                    _parts.Add(m_io.ReadS4le());
                }
                _points = new List<Point>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _points.Add(new Point(m_io, this, m_root));
                }
            }
            private BoundingBoxXY _boundingBox;
            private int _numberOfParts;
            private int _numberOfPoints;
            private List<int> _parts;
            private List<Point> _points;
            private ShapefileMain m_root;
            private ShapefileMain.RecordContents m_parent;
            public BoundingBoxXY BoundingBox { get { return _boundingBox; } }
            public int NumberOfParts { get { return _numberOfParts; } }
            public int NumberOfPoints { get { return _numberOfPoints; } }
            public List<int> Parts { get { return _parts; } }
            public List<Point> Points { get { return _points; } }
            public ShapefileMain M_Root { get { return m_root; } }
            public ShapefileMain.RecordContents M_Parent { get { return m_parent; } }
        }
        public partial class PolygonM : KaitaiStruct
        {
            public static PolygonM FromFile(string fileName)
            {
                return new PolygonM(new KaitaiStream(fileName));
            }

            public PolygonM(KaitaiStream p__io, ShapefileMain.RecordContents p__parent = null, ShapefileMain p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _boundingBox = new BoundingBoxXY(m_io, this, m_root);
                _numberOfParts = m_io.ReadS4le();
                _numberOfPoints = m_io.ReadS4le();
                _parts = new List<int>();
                for (var i = 0; i < NumberOfParts; i++)
                {
                    _parts.Add(m_io.ReadS4le());
                }
                _points = new List<Point>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _points.Add(new Point(m_io, this, m_root));
                }
                _mRange = new BoundsMinMax(m_io, this, m_root);
                _mValues = new List<double>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _mValues.Add(m_io.ReadF8le());
                }
            }
            private BoundingBoxXY _boundingBox;
            private int _numberOfParts;
            private int _numberOfPoints;
            private List<int> _parts;
            private List<Point> _points;
            private BoundsMinMax _mRange;
            private List<double> _mValues;
            private ShapefileMain m_root;
            private ShapefileMain.RecordContents m_parent;
            public BoundingBoxXY BoundingBox { get { return _boundingBox; } }
            public int NumberOfParts { get { return _numberOfParts; } }
            public int NumberOfPoints { get { return _numberOfPoints; } }
            public List<int> Parts { get { return _parts; } }
            public List<Point> Points { get { return _points; } }
            public BoundsMinMax MRange { get { return _mRange; } }
            public List<double> MValues { get { return _mValues; } }
            public ShapefileMain M_Root { get { return m_root; } }
            public ShapefileMain.RecordContents M_Parent { get { return m_parent; } }
        }
        public partial class PolygonZ : KaitaiStruct
        {
            public static PolygonZ FromFile(string fileName)
            {
                return new PolygonZ(new KaitaiStream(fileName));
            }

            public PolygonZ(KaitaiStream p__io, ShapefileMain.RecordContents p__parent = null, ShapefileMain p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _boundingBox = new BoundingBoxXY(m_io, this, m_root);
                _numberOfParts = m_io.ReadS4le();
                _numberOfPoints = m_io.ReadS4le();
                _parts = new List<int>();
                for (var i = 0; i < NumberOfParts; i++)
                {
                    _parts.Add(m_io.ReadS4le());
                }
                _points = new List<Point>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _points.Add(new Point(m_io, this, m_root));
                }
                _zRange = new BoundsMinMax(m_io, this, m_root);
                _zValues = new List<double>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _zValues.Add(m_io.ReadF8le());
                }
                _mRange = new BoundsMinMax(m_io, this, m_root);
                _mValues = new List<double>();
                for (var i = 0; i < NumberOfPoints; i++)
                {
                    _mValues.Add(m_io.ReadF8le());
                }
            }
            private BoundingBoxXY _boundingBox;
            private int _numberOfParts;
            private int _numberOfPoints;
            private List<int> _parts;
            private List<Point> _points;
            private BoundsMinMax _zRange;
            private List<double> _zValues;
            private BoundsMinMax _mRange;
            private List<double> _mValues;
            private ShapefileMain m_root;
            private ShapefileMain.RecordContents m_parent;
            public BoundingBoxXY BoundingBox { get { return _boundingBox; } }
            public int NumberOfParts { get { return _numberOfParts; } }
            public int NumberOfPoints { get { return _numberOfPoints; } }
            public List<int> Parts { get { return _parts; } }
            public List<Point> Points { get { return _points; } }
            public BoundsMinMax ZRange { get { return _zRange; } }
            public List<double> ZValues { get { return _zValues; } }
            public BoundsMinMax MRange { get { return _mRange; } }
            public List<double> MValues { get { return _mValues; } }
            public ShapefileMain M_Root { get { return m_root; } }
            public ShapefileMain.RecordContents M_Parent { get { return m_parent; } }
        }
        public partial class Record : KaitaiStruct
        {
            public static Record FromFile(string fileName)
            {
                return new Record(new KaitaiStream(fileName));
            }

            public Record(KaitaiStream p__io, ShapefileMain p__parent = null, ShapefileMain p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _header = new RecordHeader(m_io, this, m_root);
                _contents = new RecordContents(m_io, this, m_root);
            }
            private RecordHeader _header;
            private RecordContents _contents;
            private ShapefileMain m_root;
            private ShapefileMain m_parent;
            public RecordHeader Header { get { return _header; } }

            /// <summary>
            /// the size of this contents section in bytes must equal header.content_length * 2
            /// </summary>
            public RecordContents Contents { get { return _contents; } }
            public ShapefileMain M_Root { get { return m_root; } }
            public ShapefileMain M_Parent { get { return m_parent; } }
        }
        public partial class RecordContents : KaitaiStruct
        {
            public static RecordContents FromFile(string fileName)
            {
                return new RecordContents(new KaitaiStream(fileName));
            }

            public RecordContents(KaitaiStream p__io, ShapefileMain.Record p__parent = null, ShapefileMain p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _shapeType = ((ShapefileMain.ShapeType) m_io.ReadS4le());
                if (ShapeType != ShapefileMain.ShapeType.NullShape) {
                    switch (ShapeType) {
                    case ShapefileMain.ShapeType.MultiPatch: {
                        _shapeParameters = new MultiPatch(m_io, this, m_root);
                        break;
                    }
                    case ShapefileMain.ShapeType.MultiPoint: {
                        _shapeParameters = new MultiPoint(m_io, this, m_root);
                        break;
                    }
                    case ShapefileMain.ShapeType.MultiPointM: {
                        _shapeParameters = new MultiPointM(m_io, this, m_root);
                        break;
                    }
                    case ShapefileMain.ShapeType.MultiPointZ: {
                        _shapeParameters = new MultiPointZ(m_io, this, m_root);
                        break;
                    }
                    case ShapefileMain.ShapeType.Point: {
                        _shapeParameters = new Point(m_io, this, m_root);
                        break;
                    }
                    case ShapefileMain.ShapeType.PointM: {
                        _shapeParameters = new PointM(m_io, this, m_root);
                        break;
                    }
                    case ShapefileMain.ShapeType.PointZ: {
                        _shapeParameters = new PointZ(m_io, this, m_root);
                        break;
                    }
                    case ShapefileMain.ShapeType.PolyLine: {
                        _shapeParameters = new PolyLine(m_io, this, m_root);
                        break;
                    }
                    case ShapefileMain.ShapeType.PolyLineM: {
                        _shapeParameters = new PolyLineM(m_io, this, m_root);
                        break;
                    }
                    case ShapefileMain.ShapeType.PolyLineZ: {
                        _shapeParameters = new PolyLineZ(m_io, this, m_root);
                        break;
                    }
                    case ShapefileMain.ShapeType.Polygon: {
                        _shapeParameters = new Polygon(m_io, this, m_root);
                        break;
                    }
                    case ShapefileMain.ShapeType.PolygonM: {
                        _shapeParameters = new PolygonM(m_io, this, m_root);
                        break;
                    }
                    case ShapefileMain.ShapeType.PolygonZ: {
                        _shapeParameters = new PolygonZ(m_io, this, m_root);
                        break;
                    }
                    }
                }
            }
            private ShapeType _shapeType;
            private KaitaiStruct _shapeParameters;
            private ShapefileMain m_root;
            private ShapefileMain.Record m_parent;
            public ShapeType ShapeType { get { return _shapeType; } }
            public KaitaiStruct ShapeParameters { get { return _shapeParameters; } }
            public ShapefileMain M_Root { get { return m_root; } }
            public ShapefileMain.Record M_Parent { get { return m_parent; } }
        }
        public partial class RecordHeader : KaitaiStruct
        {
            public static RecordHeader FromFile(string fileName)
            {
                return new RecordHeader(new KaitaiStream(fileName));
            }

            public RecordHeader(KaitaiStream p__io, ShapefileMain.Record p__parent = null, ShapefileMain p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _recordNumber = m_io.ReadS4be();
                _contentLength = m_io.ReadS4be();
            }
            private int _recordNumber;
            private int _contentLength;
            private ShapefileMain m_root;
            private ShapefileMain.Record m_parent;
            public int RecordNumber { get { return _recordNumber; } }
            public int ContentLength { get { return _contentLength; } }
            public ShapefileMain M_Root { get { return m_root; } }
            public ShapefileMain.Record M_Parent { get { return m_parent; } }
        }
        private FileHeader _header;
        private List<Record> _records;
        private ShapefileMain m_root;
        private KaitaiStruct m_parent;
        public FileHeader Header { get { return _header; } }

        /// <summary>
        /// the size of this section of the file in bytes must equal (header.file_length * 2) - 100
        /// </summary>
        public List<Record> Records { get { return _records; } }
        public ShapefileMain M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
