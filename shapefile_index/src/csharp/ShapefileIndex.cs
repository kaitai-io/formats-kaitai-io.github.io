// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class ShapefileIndex : KaitaiStruct
    {
        public static ShapefileIndex FromFile(string fileName)
        {
            return new ShapefileIndex(new KaitaiStream(fileName));
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
        public ShapefileIndex(KaitaiStream p__io, KaitaiStruct p__parent = null, ShapefileIndex p__root = null) : base(p__io)
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
        public partial class FileHeader : KaitaiStruct
        {
            public static FileHeader FromFile(string fileName)
            {
                return new FileHeader(new KaitaiStream(fileName));
            }

            public FileHeader(KaitaiStream p__io, ShapefileIndex p__parent = null, ShapefileIndex p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fileCode = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(FileCode, new byte[] { 0, 0, 39, 10 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0, 39, 10 }, FileCode, M_Io, "/types/file_header/seq/0");
                }
                _unusedField1 = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(UnusedField1, new byte[] { 0, 0, 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, UnusedField1, M_Io, "/types/file_header/seq/1");
                }
                _unusedField2 = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(UnusedField2, new byte[] { 0, 0, 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, UnusedField2, M_Io, "/types/file_header/seq/2");
                }
                _unusedField3 = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(UnusedField3, new byte[] { 0, 0, 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, UnusedField3, M_Io, "/types/file_header/seq/3");
                }
                _unusedField4 = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(UnusedField4, new byte[] { 0, 0, 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, UnusedField4, M_Io, "/types/file_header/seq/4");
                }
                _unusedField5 = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(UnusedField5, new byte[] { 0, 0, 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, UnusedField5, M_Io, "/types/file_header/seq/5");
                }
                _fileLength = m_io.ReadS4be();
                _version = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(Version, new byte[] { 232, 3, 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 232, 3, 0, 0 }, Version, M_Io, "/types/file_header/seq/7");
                }
                _shapeType = ((ShapefileIndex.ShapeType) m_io.ReadS4le());
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
            private ShapefileIndex m_root;
            private ShapefileIndex m_parent;

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
            public ShapefileIndex M_Root { get { return m_root; } }
            public ShapefileIndex M_Parent { get { return m_parent; } }
        }
        public partial class Record : KaitaiStruct
        {
            public static Record FromFile(string fileName)
            {
                return new Record(new KaitaiStream(fileName));
            }

            public Record(KaitaiStream p__io, ShapefileIndex p__parent = null, ShapefileIndex p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _offset = m_io.ReadS4be();
                _contentLength = m_io.ReadS4be();
            }
            private int _offset;
            private int _contentLength;
            private ShapefileIndex m_root;
            private ShapefileIndex m_parent;
            public int Offset { get { return _offset; } }
            public int ContentLength { get { return _contentLength; } }
            public ShapefileIndex M_Root { get { return m_root; } }
            public ShapefileIndex M_Parent { get { return m_parent; } }
        }
        public partial class BoundingBoxXYZM : KaitaiStruct
        {
            public static BoundingBoxXYZM FromFile(string fileName)
            {
                return new BoundingBoxXYZM(new KaitaiStream(fileName));
            }

            public BoundingBoxXYZM(KaitaiStream p__io, ShapefileIndex.FileHeader p__parent = null, ShapefileIndex p__root = null) : base(p__io)
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
            private ShapefileIndex m_root;
            private ShapefileIndex.FileHeader m_parent;
            public BoundsMinMax X { get { return _x; } }
            public BoundsMinMax Y { get { return _y; } }
            public BoundsMinMax Z { get { return _z; } }
            public BoundsMinMax M { get { return _m; } }
            public ShapefileIndex M_Root { get { return m_root; } }
            public ShapefileIndex.FileHeader M_Parent { get { return m_parent; } }
        }
        public partial class BoundsMinMax : KaitaiStruct
        {
            public static BoundsMinMax FromFile(string fileName)
            {
                return new BoundsMinMax(new KaitaiStream(fileName));
            }

            public BoundsMinMax(KaitaiStream p__io, ShapefileIndex.BoundingBoxXYZM p__parent = null, ShapefileIndex p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _min = m_io.ReadF8be();
                _max = m_io.ReadF8be();
            }
            private double _min;
            private double _max;
            private ShapefileIndex m_root;
            private ShapefileIndex.BoundingBoxXYZM m_parent;
            public double Min { get { return _min; } }
            public double Max { get { return _max; } }
            public ShapefileIndex M_Root { get { return m_root; } }
            public ShapefileIndex.BoundingBoxXYZM M_Parent { get { return m_parent; } }
        }
        private FileHeader _header;
        private List<Record> _records;
        private ShapefileIndex m_root;
        private KaitaiStruct m_parent;
        public FileHeader Header { get { return _header; } }

        /// <summary>
        /// the size of this section of the file in bytes must equal (header.file_length * 2) - 100
        /// </summary>
        public List<Record> Records { get { return _records; } }
        public ShapefileIndex M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
