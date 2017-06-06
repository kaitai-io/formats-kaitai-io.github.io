// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class Jpeg : KaitaiStruct
    {
        public static Jpeg FromFile(string fileName)
        {
            return new Jpeg(new KaitaiStream(fileName));
        }

        public enum ComponentId
        {
            Y = 1,
            Cb = 2,
            Cr = 3,
            I = 4,
            Q = 5,
        }

        public Jpeg(KaitaiStream io, KaitaiStruct parent = null, Jpeg root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            _read();
        }
        private void _read() {
            _segments = new List<Segment>();
            while (!m_io.IsEof) {
                _segments.Add(new Segment(m_io, this, m_root));
            }
            }
        public partial class Segment : KaitaiStruct
        {
            public static Segment FromFile(string fileName)
            {
                return new Segment(new KaitaiStream(fileName));
            }

            public enum MarkerEnum
            {
                Tem = 1,
                Sof0 = 192,
                Sof1 = 193,
                Sof2 = 194,
                Sof3 = 195,
                Dht = 196,
                Sof5 = 197,
                Sof6 = 198,
                Sof7 = 199,
                Soi = 216,
                Eoi = 217,
                Sos = 218,
                Dqt = 219,
                Dnl = 220,
                Dri = 221,
                Dhp = 222,
                App0 = 224,
                App1 = 225,
                App2 = 226,
                App3 = 227,
                App4 = 228,
                App5 = 229,
                App6 = 230,
                App7 = 231,
                App8 = 232,
                App9 = 233,
                App10 = 234,
                App11 = 235,
                App12 = 236,
                App13 = 237,
                App14 = 238,
                App15 = 239,
                Com = 254,
            }

            public Segment(KaitaiStream io, Jpeg parent = null, Jpeg root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _magic = m_io.EnsureFixedContents(new byte[] { 255 });
                _marker = ((MarkerEnum) m_io.ReadU1());
                if ( ((Marker != MarkerEnum.Soi) && (Marker != MarkerEnum.Eoi)) ) {
                    _length = m_io.ReadU2be();
                }
                if ( ((Marker != MarkerEnum.Soi) && (Marker != MarkerEnum.Eoi)) ) {
                    switch (Marker) {
                    case MarkerEnum.Sos: {
                        __raw_data = m_io.ReadBytes((Length - 2));
                        var io___raw_data = new KaitaiStream(__raw_data);
                        _data = new SegmentSos(io___raw_data, this, m_root);
                        break;
                    }
                    case MarkerEnum.App1: {
                        __raw_data = m_io.ReadBytes((Length - 2));
                        var io___raw_data = new KaitaiStream(__raw_data);
                        _data = new SegmentApp1(io___raw_data, this, m_root);
                        break;
                    }
                    case MarkerEnum.Sof0: {
                        __raw_data = m_io.ReadBytes((Length - 2));
                        var io___raw_data = new KaitaiStream(__raw_data);
                        _data = new SegmentSof0(io___raw_data, this, m_root);
                        break;
                    }
                    case MarkerEnum.App0: {
                        __raw_data = m_io.ReadBytes((Length - 2));
                        var io___raw_data = new KaitaiStream(__raw_data);
                        _data = new SegmentApp0(io___raw_data, this, m_root);
                        break;
                    }
                    default: {
                        _data = m_io.ReadBytes((Length - 2));
                        break;
                    }
                    }
                }
                if (Marker == MarkerEnum.Sos) {
                    _imageData = m_io.ReadBytesFull();
                }
                }
            private byte[] _magic;
            private MarkerEnum _marker;
            private ushort _length;
            private object _data;
            private byte[] _imageData;
            private Jpeg m_root;
            private Jpeg m_parent;
            private byte[] __raw_data;
            public byte[] Magic { get { return _magic; } }
            public MarkerEnum Marker { get { return _marker; } }
            public ushort Length { get { return _length; } }
            public object Data { get { return _data; } }
            public byte[] ImageData { get { return _imageData; } }
            public Jpeg M_Root { get { return m_root; } }
            public Jpeg M_Parent { get { return m_parent; } }
            public byte[] M_RawData { get { return __raw_data; } }
        }
        public partial class SegmentSos : KaitaiStruct
        {
            public static SegmentSos FromFile(string fileName)
            {
                return new SegmentSos(new KaitaiStream(fileName));
            }

            public SegmentSos(KaitaiStream io, Jpeg.Segment parent = null, Jpeg root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _numComponents = m_io.ReadU1();
                _components = new List<Component>((int) (NumComponents));
                for (var i = 0; i < NumComponents; i++) {
                    _components.Add(new Component(m_io, this, m_root));
                }
                _startSpectralSelection = m_io.ReadU1();
                _endSpectral = m_io.ReadU1();
                _apprBitPos = m_io.ReadU1();
                }
            public partial class Component : KaitaiStruct
            {
                public static Component FromFile(string fileName)
                {
                    return new Component(new KaitaiStream(fileName));
                }

                public Component(KaitaiStream io, Jpeg.SegmentSos parent = null, Jpeg root = null) : base(io)
                {
                    m_parent = parent;
                    m_root = root;
                    _read();
                }
                private void _read() {
                    _id = ((Jpeg.ComponentId) m_io.ReadU1());
                    _huffmanTable = m_io.ReadU1();
                    }
                private ComponentId _id;
                private byte _huffmanTable;
                private Jpeg m_root;
                private Jpeg.SegmentSos m_parent;

                /// <summary>
                /// Scan component selector
                /// </summary>
                public ComponentId Id { get { return _id; } }
                public byte HuffmanTable { get { return _huffmanTable; } }
                public Jpeg M_Root { get { return m_root; } }
                public Jpeg.SegmentSos M_Parent { get { return m_parent; } }
            }
            private byte _numComponents;
            private List<Component> _components;
            private byte _startSpectralSelection;
            private byte _endSpectral;
            private byte _apprBitPos;
            private Jpeg m_root;
            private Jpeg.Segment m_parent;

            /// <summary>
            /// Number of components in scan
            /// </summary>
            public byte NumComponents { get { return _numComponents; } }

            /// <summary>
            /// Scan components specification
            /// </summary>
            public List<Component> Components { get { return _components; } }

            /// <summary>
            /// Start of spectral selection or predictor selection
            /// </summary>
            public byte StartSpectralSelection { get { return _startSpectralSelection; } }

            /// <summary>
            /// End of spectral selection
            /// </summary>
            public byte EndSpectral { get { return _endSpectral; } }

            /// <summary>
            /// Successive approximation bit position high + Successive approximation bit position low or point transform
            /// </summary>
            public byte ApprBitPos { get { return _apprBitPos; } }
            public Jpeg M_Root { get { return m_root; } }
            public Jpeg.Segment M_Parent { get { return m_parent; } }
        }
        public partial class SegmentApp1 : KaitaiStruct
        {
            public static SegmentApp1 FromFile(string fileName)
            {
                return new SegmentApp1(new KaitaiStream(fileName));
            }

            public SegmentApp1(KaitaiStream io, Jpeg.Segment parent = null, Jpeg root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _magic = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(0, false, true, true));
                switch (Magic) {
                case "Exif": {
                    _body = new ExifInJpeg(m_io, this, m_root);
                    break;
                }
                }
                }
            private string _magic;
            private ExifInJpeg _body;
            private Jpeg m_root;
            private Jpeg.Segment m_parent;
            public string Magic { get { return _magic; } }
            public ExifInJpeg Body { get { return _body; } }
            public Jpeg M_Root { get { return m_root; } }
            public Jpeg.Segment M_Parent { get { return m_parent; } }
        }
        public partial class SegmentSof0 : KaitaiStruct
        {
            public static SegmentSof0 FromFile(string fileName)
            {
                return new SegmentSof0(new KaitaiStream(fileName));
            }

            public SegmentSof0(KaitaiStream io, Jpeg.Segment parent = null, Jpeg root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _bitsPerSample = m_io.ReadU1();
                _imageHeight = m_io.ReadU2be();
                _imageWidth = m_io.ReadU2be();
                _numComponents = m_io.ReadU1();
                _components = new List<Component>((int) (NumComponents));
                for (var i = 0; i < NumComponents; i++) {
                    _components.Add(new Component(m_io, this, m_root));
                }
                }
            public partial class Component : KaitaiStruct
            {
                public static Component FromFile(string fileName)
                {
                    return new Component(new KaitaiStream(fileName));
                }

                public Component(KaitaiStream io, Jpeg.SegmentSof0 parent = null, Jpeg root = null) : base(io)
                {
                    m_parent = parent;
                    m_root = root;
                    f_samplingX = false;
                    f_samplingY = false;
                    _read();
                }
                private void _read() {
                    _id = ((Jpeg.ComponentId) m_io.ReadU1());
                    _samplingFactors = m_io.ReadU1();
                    _quantizationTableId = m_io.ReadU1();
                    }
                private bool f_samplingX;
                private int _samplingX;
                public int SamplingX
                {
                    get
                    {
                        if (f_samplingX)
                            return _samplingX;
                        _samplingX = (int) (((SamplingFactors & 240) >> 4));
                        f_samplingX = true;
                        return _samplingX;
                    }
                }
                private bool f_samplingY;
                private int _samplingY;
                public int SamplingY
                {
                    get
                    {
                        if (f_samplingY)
                            return _samplingY;
                        _samplingY = (int) ((SamplingFactors & 15));
                        f_samplingY = true;
                        return _samplingY;
                    }
                }
                private ComponentId _id;
                private byte _samplingFactors;
                private byte _quantizationTableId;
                private Jpeg m_root;
                private Jpeg.SegmentSof0 m_parent;

                /// <summary>
                /// Component selector
                /// </summary>
                public ComponentId Id { get { return _id; } }
                public byte SamplingFactors { get { return _samplingFactors; } }
                public byte QuantizationTableId { get { return _quantizationTableId; } }
                public Jpeg M_Root { get { return m_root; } }
                public Jpeg.SegmentSof0 M_Parent { get { return m_parent; } }
            }
            private byte _bitsPerSample;
            private ushort _imageHeight;
            private ushort _imageWidth;
            private byte _numComponents;
            private List<Component> _components;
            private Jpeg m_root;
            private Jpeg.Segment m_parent;
            public byte BitsPerSample { get { return _bitsPerSample; } }
            public ushort ImageHeight { get { return _imageHeight; } }
            public ushort ImageWidth { get { return _imageWidth; } }
            public byte NumComponents { get { return _numComponents; } }
            public List<Component> Components { get { return _components; } }
            public Jpeg M_Root { get { return m_root; } }
            public Jpeg.Segment M_Parent { get { return m_parent; } }
        }
        public partial class ExifInJpeg : KaitaiStruct
        {
            public static ExifInJpeg FromFile(string fileName)
            {
                return new ExifInJpeg(new KaitaiStream(fileName));
            }

            public ExifInJpeg(KaitaiStream io, Jpeg.SegmentApp1 parent = null, Jpeg root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _extraZero = m_io.EnsureFixedContents(new byte[] { 0 });
                __raw_data = m_io.ReadBytesFull();
                var io___raw_data = new KaitaiStream(__raw_data);
                _data = new Exif(io___raw_data);
                }
            private byte[] _extraZero;
            private Exif _data;
            private Jpeg m_root;
            private Jpeg.SegmentApp1 m_parent;
            private byte[] __raw_data;
            public byte[] ExtraZero { get { return _extraZero; } }
            public Exif Data { get { return _data; } }
            public Jpeg M_Root { get { return m_root; } }
            public Jpeg.SegmentApp1 M_Parent { get { return m_parent; } }
            public byte[] M_RawData { get { return __raw_data; } }
        }
        public partial class SegmentApp0 : KaitaiStruct
        {
            public static SegmentApp0 FromFile(string fileName)
            {
                return new SegmentApp0(new KaitaiStream(fileName));
            }

            public enum DensityUnit
            {
                NoUnits = 0,
                PixelsPerInch = 1,
                PixelsPerCm = 2,
            }

            public SegmentApp0(KaitaiStream io, Jpeg.Segment parent = null, Jpeg root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _magic = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(5));
                _versionMajor = m_io.ReadU1();
                _versionMinor = m_io.ReadU1();
                _densityUnits = ((DensityUnit) m_io.ReadU1());
                _densityX = m_io.ReadU2be();
                _densityY = m_io.ReadU2be();
                _thumbnailX = m_io.ReadU1();
                _thumbnailY = m_io.ReadU1();
                _thumbnail = m_io.ReadBytes(((ThumbnailX * ThumbnailY) * 3));
                }
            private string _magic;
            private byte _versionMajor;
            private byte _versionMinor;
            private DensityUnit _densityUnits;
            private ushort _densityX;
            private ushort _densityY;
            private byte _thumbnailX;
            private byte _thumbnailY;
            private byte[] _thumbnail;
            private Jpeg m_root;
            private Jpeg.Segment m_parent;
            public string Magic { get { return _magic; } }
            public byte VersionMajor { get { return _versionMajor; } }
            public byte VersionMinor { get { return _versionMinor; } }
            public DensityUnit DensityUnits { get { return _densityUnits; } }

            /// <summary>
            /// Horizontal pixel density. Must not be zero.
            /// </summary>
            public ushort DensityX { get { return _densityX; } }

            /// <summary>
            /// Vertical pixel density. Must not be zero.
            /// </summary>
            public ushort DensityY { get { return _densityY; } }

            /// <summary>
            /// Horizontal pixel count of the following embedded RGB thumbnail. May be zero.
            /// </summary>
            public byte ThumbnailX { get { return _thumbnailX; } }

            /// <summary>
            /// Vertical pixel count of the following embedded RGB thumbnail. May be zero.
            /// </summary>
            public byte ThumbnailY { get { return _thumbnailY; } }

            /// <summary>
            /// Uncompressed 24 bit RGB (8 bits per color channel) raster thumbnail data in the order R0, G0, B0, ... Rn, Gn, Bn
            /// </summary>
            public byte[] Thumbnail { get { return _thumbnail; } }
            public Jpeg M_Root { get { return m_root; } }
            public Jpeg.Segment M_Parent { get { return m_parent; } }
        }
        private List<Segment> _segments;
        private Jpeg m_root;
        private KaitaiStruct m_parent;
        public List<Segment> Segments { get { return _segments; } }
        public Jpeg M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
