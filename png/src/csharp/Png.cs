// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class Png : KaitaiStruct
    {
        public static Png FromFile(string fileName)
        {
            return new Png(new KaitaiStream(fileName));
        }


        public enum ColorType
        {
            Greyscale = 0,
            Truecolor = 2,
            Indexed = 3,
            GreyscaleAlpha = 4,
            TruecolorAlpha = 6,
        }

        public enum PhysUnit
        {
            Unknown = 0,
            Meter = 1,
        }

        public enum CompressionMethods
        {
            Zlib = 0,
        }
        public Png(KaitaiStream p__io, KaitaiStruct p__parent = null, Png p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _magic = m_io.EnsureFixedContents(new byte[] { 137, 80, 78, 71, 13, 10, 26, 10 });
            _ihdrLen = m_io.EnsureFixedContents(new byte[] { 0, 0, 0, 13 });
            _ihdrType = m_io.EnsureFixedContents(new byte[] { 73, 72, 68, 82 });
            _ihdr = new IhdrChunk(m_io, this, m_root);
            _ihdrCrc = m_io.ReadBytes(4);
            _chunks = new List<Chunk>();
            {
                var i = 0;
                Chunk M_;
                do {
                    M_ = new Chunk(m_io, this, m_root);
                    _chunks.Add(M_);
                    i++;
                } while (!( ((M_.Type == "IEND") || (M_Io.IsEof)) ));
            }
        }
        public partial class Rgb : KaitaiStruct
        {
            public static Rgb FromFile(string fileName)
            {
                return new Rgb(new KaitaiStream(fileName));
            }

            public Rgb(KaitaiStream p__io, Png.PlteChunk p__parent = null, Png p__root = null) : base(p__io)
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
            }
            private byte _r;
            private byte _g;
            private byte _b;
            private Png m_root;
            private Png.PlteChunk m_parent;
            public byte R { get { return _r; } }
            public byte G { get { return _g; } }
            public byte B { get { return _b; } }
            public Png M_Root { get { return m_root; } }
            public Png.PlteChunk M_Parent { get { return m_parent; } }
        }
        public partial class Chunk : KaitaiStruct
        {
            public static Chunk FromFile(string fileName)
            {
                return new Chunk(new KaitaiStream(fileName));
            }

            public Chunk(KaitaiStream p__io, Png p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU4be();
                _type = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                switch (Type) {
                case "iTXt": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new InternationalTextChunk(io___raw_body, this, m_root);
                    break;
                }
                case "gAMA": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new GamaChunk(io___raw_body, this, m_root);
                    break;
                }
                case "tIME": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new TimeChunk(io___raw_body, this, m_root);
                    break;
                }
                case "PLTE": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new PlteChunk(io___raw_body, this, m_root);
                    break;
                }
                case "bKGD": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new BkgdChunk(io___raw_body, this, m_root);
                    break;
                }
                case "pHYs": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new PhysChunk(io___raw_body, this, m_root);
                    break;
                }
                case "tEXt": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new TextChunk(io___raw_body, this, m_root);
                    break;
                }
                case "cHRM": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new ChrmChunk(io___raw_body, this, m_root);
                    break;
                }
                case "sRGB": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SrgbChunk(io___raw_body, this, m_root);
                    break;
                }
                case "zTXt": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new CompressedTextChunk(io___raw_body, this, m_root);
                    break;
                }
                default: {
                    _body = m_io.ReadBytes(Len);
                    break;
                }
                }
                _crc = m_io.ReadBytes(4);
            }
            private uint _len;
            private string _type;
            private object _body;
            private byte[] _crc;
            private Png m_root;
            private Png m_parent;
            private byte[] __raw_body;
            public uint Len { get { return _len; } }
            public string Type { get { return _type; } }
            public object Body { get { return _body; } }
            public byte[] Crc { get { return _crc; } }
            public Png M_Root { get { return m_root; } }
            public Png M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }

        /// <summary>
        /// Background chunk for images with indexed palette.
        /// </summary>
        public partial class BkgdIndexed : KaitaiStruct
        {
            public static BkgdIndexed FromFile(string fileName)
            {
                return new BkgdIndexed(new KaitaiStream(fileName));
            }

            public BkgdIndexed(KaitaiStream p__io, Png.BkgdChunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _paletteIndex = m_io.ReadU1();
            }
            private byte _paletteIndex;
            private Png m_root;
            private Png.BkgdChunk m_parent;
            public byte PaletteIndex { get { return _paletteIndex; } }
            public Png M_Root { get { return m_root; } }
            public Png.BkgdChunk M_Parent { get { return m_parent; } }
        }
        public partial class Point : KaitaiStruct
        {
            public static Point FromFile(string fileName)
            {
                return new Point(new KaitaiStream(fileName));
            }

            public Point(KaitaiStream p__io, Png.ChrmChunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_x = false;
                f_y = false;
                _read();
            }
            private void _read()
            {
                _xInt = m_io.ReadU4be();
                _yInt = m_io.ReadU4be();
            }
            private bool f_x;
            private double _x;
            public double X
            {
                get
                {
                    if (f_x)
                        return _x;
                    _x = (double) ((XInt / 100000.0));
                    f_x = true;
                    return _x;
                }
            }
            private bool f_y;
            private double _y;
            public double Y
            {
                get
                {
                    if (f_y)
                        return _y;
                    _y = (double) ((YInt / 100000.0));
                    f_y = true;
                    return _y;
                }
            }
            private uint _xInt;
            private uint _yInt;
            private Png m_root;
            private Png.ChrmChunk m_parent;
            public uint XInt { get { return _xInt; } }
            public uint YInt { get { return _yInt; } }
            public Png M_Root { get { return m_root; } }
            public Png.ChrmChunk M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Background chunk for greyscale images.
        /// </summary>
        public partial class BkgdGreyscale : KaitaiStruct
        {
            public static BkgdGreyscale FromFile(string fileName)
            {
                return new BkgdGreyscale(new KaitaiStream(fileName));
            }

            public BkgdGreyscale(KaitaiStream p__io, Png.BkgdChunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _value = m_io.ReadU2be();
            }
            private ushort _value;
            private Png m_root;
            private Png.BkgdChunk m_parent;
            public ushort Value { get { return _value; } }
            public Png M_Root { get { return m_root; } }
            public Png.BkgdChunk M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/PNG/#11cHRM">Source</a>
        /// </remarks>
        public partial class ChrmChunk : KaitaiStruct
        {
            public static ChrmChunk FromFile(string fileName)
            {
                return new ChrmChunk(new KaitaiStream(fileName));
            }

            public ChrmChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _whitePoint = new Point(m_io, this, m_root);
                _red = new Point(m_io, this, m_root);
                _green = new Point(m_io, this, m_root);
                _blue = new Point(m_io, this, m_root);
            }
            private Point _whitePoint;
            private Point _red;
            private Point _green;
            private Point _blue;
            private Png m_root;
            private Png.Chunk m_parent;
            public Point WhitePoint { get { return _whitePoint; } }
            public Point Red { get { return _red; } }
            public Point Green { get { return _green; } }
            public Point Blue { get { return _blue; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/PNG/#11IHDR">Source</a>
        /// </remarks>
        public partial class IhdrChunk : KaitaiStruct
        {
            public static IhdrChunk FromFile(string fileName)
            {
                return new IhdrChunk(new KaitaiStream(fileName));
            }

            public IhdrChunk(KaitaiStream p__io, Png p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _width = m_io.ReadU4be();
                _height = m_io.ReadU4be();
                _bitDepth = m_io.ReadU1();
                _colorType = ((Png.ColorType) m_io.ReadU1());
                _compressionMethod = m_io.ReadU1();
                _filterMethod = m_io.ReadU1();
                _interlaceMethod = m_io.ReadU1();
            }
            private uint _width;
            private uint _height;
            private byte _bitDepth;
            private ColorType _colorType;
            private byte _compressionMethod;
            private byte _filterMethod;
            private byte _interlaceMethod;
            private Png m_root;
            private Png m_parent;
            public uint Width { get { return _width; } }
            public uint Height { get { return _height; } }
            public byte BitDepth { get { return _bitDepth; } }
            public ColorType ColorType { get { return _colorType; } }
            public byte CompressionMethod { get { return _compressionMethod; } }
            public byte FilterMethod { get { return _filterMethod; } }
            public byte InterlaceMethod { get { return _interlaceMethod; } }
            public Png M_Root { get { return m_root; } }
            public Png M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/PNG/#11PLTE">Source</a>
        /// </remarks>
        public partial class PlteChunk : KaitaiStruct
        {
            public static PlteChunk FromFile(string fileName)
            {
                return new PlteChunk(new KaitaiStream(fileName));
            }

            public PlteChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<Rgb>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(new Rgb(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<Rgb> _entries;
            private Png m_root;
            private Png.Chunk m_parent;
            public List<Rgb> Entries { get { return _entries; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/PNG/#11sRGB">Source</a>
        /// </remarks>
        public partial class SrgbChunk : KaitaiStruct
        {
            public static SrgbChunk FromFile(string fileName)
            {
                return new SrgbChunk(new KaitaiStream(fileName));
            }


            public enum Intent
            {
                Perceptual = 0,
                RelativeColorimetric = 1,
                Saturation = 2,
                AbsoluteColorimetric = 3,
            }
            public SrgbChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _renderIntent = ((Intent) m_io.ReadU1());
            }
            private Intent _renderIntent;
            private Png m_root;
            private Png.Chunk m_parent;
            public Intent RenderIntent { get { return _renderIntent; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Compressed text chunk effectively allows to store key-value
        /// string pairs in PNG container, compressing &quot;value&quot; part (which
        /// can be quite lengthy) with zlib compression.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/PNG/#11zTXt">Source</a>
        /// </remarks>
        public partial class CompressedTextChunk : KaitaiStruct
        {
            public static CompressedTextChunk FromFile(string fileName)
            {
                return new CompressedTextChunk(new KaitaiStream(fileName));
            }

            public CompressedTextChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _keyword = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(0, false, true, true));
                _compressionMethod = ((Png.CompressionMethods) m_io.ReadU1());
                __raw_textDatastream = m_io.ReadBytesFull();
                _textDatastream = m_io.ProcessZlib(__raw_textDatastream);
            }
            private string _keyword;
            private CompressionMethods _compressionMethod;
            private byte[] _textDatastream;
            private Png m_root;
            private Png.Chunk m_parent;
            private byte[] __raw_textDatastream;

            /// <summary>
            /// Indicates purpose of the following text data.
            /// </summary>
            public string Keyword { get { return _keyword; } }
            public CompressionMethods CompressionMethod { get { return _compressionMethod; } }
            public byte[] TextDatastream { get { return _textDatastream; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
            public byte[] M_RawTextDatastream { get { return __raw_textDatastream; } }
        }

        /// <summary>
        /// Background chunk for truecolor images.
        /// </summary>
        public partial class BkgdTruecolor : KaitaiStruct
        {
            public static BkgdTruecolor FromFile(string fileName)
            {
                return new BkgdTruecolor(new KaitaiStream(fileName));
            }

            public BkgdTruecolor(KaitaiStream p__io, Png.BkgdChunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _red = m_io.ReadU2be();
                _green = m_io.ReadU2be();
                _blue = m_io.ReadU2be();
            }
            private ushort _red;
            private ushort _green;
            private ushort _blue;
            private Png m_root;
            private Png.BkgdChunk m_parent;
            public ushort Red { get { return _red; } }
            public ushort Green { get { return _green; } }
            public ushort Blue { get { return _blue; } }
            public Png M_Root { get { return m_root; } }
            public Png.BkgdChunk M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/PNG/#11gAMA">Source</a>
        /// </remarks>
        public partial class GamaChunk : KaitaiStruct
        {
            public static GamaChunk FromFile(string fileName)
            {
                return new GamaChunk(new KaitaiStream(fileName));
            }

            public GamaChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_gammaRatio = false;
                _read();
            }
            private void _read()
            {
                _gammaInt = m_io.ReadU4be();
            }
            private bool f_gammaRatio;
            private double _gammaRatio;
            public double GammaRatio
            {
                get
                {
                    if (f_gammaRatio)
                        return _gammaRatio;
                    _gammaRatio = (double) ((100000.0 / GammaInt));
                    f_gammaRatio = true;
                    return _gammaRatio;
                }
            }
            private uint _gammaInt;
            private Png m_root;
            private Png.Chunk m_parent;
            public uint GammaInt { get { return _gammaInt; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Background chunk stores default background color to display this
        /// image against. Contents depend on `color_type` of the image.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/PNG/#11bKGD">Source</a>
        /// </remarks>
        public partial class BkgdChunk : KaitaiStruct
        {
            public static BkgdChunk FromFile(string fileName)
            {
                return new BkgdChunk(new KaitaiStream(fileName));
            }

            public BkgdChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                switch (M_Root.Ihdr.ColorType) {
                case Png.ColorType.GreyscaleAlpha: {
                    _bkgd = new BkgdGreyscale(m_io, this, m_root);
                    break;
                }
                case Png.ColorType.Indexed: {
                    _bkgd = new BkgdIndexed(m_io, this, m_root);
                    break;
                }
                case Png.ColorType.Greyscale: {
                    _bkgd = new BkgdGreyscale(m_io, this, m_root);
                    break;
                }
                case Png.ColorType.TruecolorAlpha: {
                    _bkgd = new BkgdTruecolor(m_io, this, m_root);
                    break;
                }
                case Png.ColorType.Truecolor: {
                    _bkgd = new BkgdTruecolor(m_io, this, m_root);
                    break;
                }
                }
            }
            private KaitaiStruct _bkgd;
            private Png m_root;
            private Png.Chunk m_parent;
            public KaitaiStruct Bkgd { get { return _bkgd; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// &quot;Physical size&quot; chunk stores data that allows to translate
        /// logical pixels into physical units (meters, etc) and vice-versa.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/PNG/#11pHYs">Source</a>
        /// </remarks>
        public partial class PhysChunk : KaitaiStruct
        {
            public static PhysChunk FromFile(string fileName)
            {
                return new PhysChunk(new KaitaiStream(fileName));
            }

            public PhysChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _pixelsPerUnitX = m_io.ReadU4be();
                _pixelsPerUnitY = m_io.ReadU4be();
                _unit = ((Png.PhysUnit) m_io.ReadU1());
            }
            private uint _pixelsPerUnitX;
            private uint _pixelsPerUnitY;
            private PhysUnit _unit;
            private Png m_root;
            private Png.Chunk m_parent;

            /// <summary>
            /// Number of pixels per physical unit (typically, 1 meter) by X
            /// axis.
            /// </summary>
            public uint PixelsPerUnitX { get { return _pixelsPerUnitX; } }

            /// <summary>
            /// Number of pixels per physical unit (typically, 1 meter) by Y
            /// axis.
            /// </summary>
            public uint PixelsPerUnitY { get { return _pixelsPerUnitY; } }
            public PhysUnit Unit { get { return _unit; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// International text chunk effectively allows to store key-value string pairs in
        /// PNG container. Both &quot;key&quot; (keyword) and &quot;value&quot; (text) parts are
        /// given in pre-defined subset of iso8859-1 without control
        /// characters.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/PNG/#11iTXt">Source</a>
        /// </remarks>
        public partial class InternationalTextChunk : KaitaiStruct
        {
            public static InternationalTextChunk FromFile(string fileName)
            {
                return new InternationalTextChunk(new KaitaiStream(fileName));
            }

            public InternationalTextChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _keyword = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(0, false, true, true));
                _compressionFlag = m_io.ReadU1();
                _compressionMethod = ((Png.CompressionMethods) m_io.ReadU1());
                _languageTag = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(0, false, true, true));
                _translatedKeyword = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(0, false, true, true));
                _text = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesFull());
            }
            private string _keyword;
            private byte _compressionFlag;
            private CompressionMethods _compressionMethod;
            private string _languageTag;
            private string _translatedKeyword;
            private string _text;
            private Png m_root;
            private Png.Chunk m_parent;

            /// <summary>
            /// Indicates purpose of the following text data.
            /// </summary>
            public string Keyword { get { return _keyword; } }

            /// <summary>
            /// 0 = text is uncompressed, 1 = text is compressed with a
            /// method specified in `compression_method`.
            /// </summary>
            public byte CompressionFlag { get { return _compressionFlag; } }
            public CompressionMethods CompressionMethod { get { return _compressionMethod; } }

            /// <summary>
            /// Human language used in `translated_keyword` and `text`
            /// attributes - should be a language code conforming to ISO
            /// 646.IRV:1991.
            /// </summary>
            public string LanguageTag { get { return _languageTag; } }

            /// <summary>
            /// Keyword translated into language specified in
            /// `language_tag`. Line breaks are not allowed.
            /// </summary>
            public string TranslatedKeyword { get { return _translatedKeyword; } }

            /// <summary>
            /// Text contents (&quot;value&quot; of this key-value pair), written in
            /// language specified in `language_tag`. Linke breaks are
            /// allowed.
            /// </summary>
            public string Text { get { return _text; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Text chunk effectively allows to store key-value string pairs in
        /// PNG container. Both &quot;key&quot; (keyword) and &quot;value&quot; (text) parts are
        /// given in pre-defined subset of iso8859-1 without control
        /// characters.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/PNG/#11tEXt">Source</a>
        /// </remarks>
        public partial class TextChunk : KaitaiStruct
        {
            public static TextChunk FromFile(string fileName)
            {
                return new TextChunk(new KaitaiStream(fileName));
            }

            public TextChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _keyword = System.Text.Encoding.GetEncoding("iso8859-1").GetString(m_io.ReadBytesTerm(0, false, true, true));
                _text = System.Text.Encoding.GetEncoding("iso8859-1").GetString(m_io.ReadBytesFull());
            }
            private string _keyword;
            private string _text;
            private Png m_root;
            private Png.Chunk m_parent;

            /// <summary>
            /// Indicates purpose of the following text data.
            /// </summary>
            public string Keyword { get { return _keyword; } }
            public string Text { get { return _text; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Time chunk stores time stamp of last modification of this image,
        /// up to 1 second precision in UTC timezone.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/PNG/#11tIME">Source</a>
        /// </remarks>
        public partial class TimeChunk : KaitaiStruct
        {
            public static TimeChunk FromFile(string fileName)
            {
                return new TimeChunk(new KaitaiStream(fileName));
            }

            public TimeChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _year = m_io.ReadU2be();
                _month = m_io.ReadU1();
                _day = m_io.ReadU1();
                _hour = m_io.ReadU1();
                _minute = m_io.ReadU1();
                _second = m_io.ReadU1();
            }
            private ushort _year;
            private byte _month;
            private byte _day;
            private byte _hour;
            private byte _minute;
            private byte _second;
            private Png m_root;
            private Png.Chunk m_parent;
            public ushort Year { get { return _year; } }
            public byte Month { get { return _month; } }
            public byte Day { get { return _day; } }
            public byte Hour { get { return _hour; } }
            public byte Minute { get { return _minute; } }
            public byte Second { get { return _second; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }
        private byte[] _magic;
        private byte[] _ihdrLen;
        private byte[] _ihdrType;
        private IhdrChunk _ihdr;
        private byte[] _ihdrCrc;
        private List<Chunk> _chunks;
        private Png m_root;
        private KaitaiStruct m_parent;
        public byte[] Magic { get { return _magic; } }
        public byte[] IhdrLen { get { return _ihdrLen; } }
        public byte[] IhdrType { get { return _ihdrType; } }
        public IhdrChunk Ihdr { get { return _ihdr; } }
        public byte[] IhdrCrc { get { return _ihdrCrc; } }
        public List<Chunk> Chunks { get { return _chunks; } }
        public Png M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
