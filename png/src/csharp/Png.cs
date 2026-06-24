// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;
using System;

namespace Kaitai
{

    /// <summary>
    /// Test files for APNG can be found at the following locations:
    /// 
    ///   * &lt;https://philip.html5.org/tests/apng/tests.html&gt;
    ///   * &lt;http://littlesvr.ca/apng/&gt;
    /// </summary>
    public partial class Png : KaitaiStruct
    {
        public static Png FromFile(string fileName)
        {
            return new Png(new KaitaiStream(fileName));
        }


        public enum BlendOpValues
        {
            Source = 0,
            Over = 1,
        }

        public enum ColorType
        {
            Greyscale = 0,
            Truecolor = 2,
            Indexed = 3,
            GreyscaleAlpha = 4,
            TruecolorAlpha = 6,
        }

        public enum CompressionMethods
        {
            Zlib = 0,
        }

        public enum DisposeOpValues
        {
            None = 0,
            Background = 1,
            Previous = 2,
        }

        public enum FilterMethod
        {
            Base = 0,
        }

        public enum InterlaceMethod
        {
            None = 0,
            Adam7 = 1,
        }

        public enum PhysUnit
        {
            Unknown = 0,
            Meter = 1,
        }
        public Png(KaitaiStream p__io, KaitaiStruct p__parent = null, Png p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(8);
            if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 137, 80, 78, 71, 13, 10, 26, 10 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 137, 80, 78, 71, 13, 10, 26, 10 }, _magic, m_io, "/seq/0");
            }
            _ihdrLen = m_io.ReadU4be();
            if (!(_ihdrLen == 13))
            {
                throw new ValidationNotEqualError(13, _ihdrLen, m_io, "/seq/1");
            }
            _ihdrType = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(_ihdrType, new byte[] { 73, 72, 68, 82 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 73, 72, 68, 82 }, _ihdrType, m_io, "/seq/2");
            }
            _ihdr = new IhdrChunk(m_io, this, m_root);
            _ihdrCrc = m_io.ReadU4be();
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

        /// <remarks>
        /// Reference: <a href="https://stackoverflow.com/questions/4242402/the-fireworks-png-format-any-insight-any-libs/51683285#51683285">Source</a>
        /// </remarks>
        public partial class AdobeFireworksChunk : KaitaiStruct
        {
            public static AdobeFireworksChunk FromFile(string fileName)
            {
                return new AdobeFireworksChunk(new KaitaiStream(fileName));
            }

            public AdobeFireworksChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                __raw_previewData = m_io.ReadBytesFull();
                _previewData = m_io.ProcessZlib(__raw_previewData);
            }
            private byte[] _previewData;
            private Png m_root;
            private Png.Chunk m_parent;
            private byte[] __raw_previewData;
            public byte[] PreviewData { get { return _previewData; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
            public byte[] M_RawPreviewData { get { return __raw_previewData; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#acTL-chunk">Source</a>
        /// </remarks>
        public partial class AnimationControlChunk : KaitaiStruct
        {
            public static AnimationControlChunk FromFile(string fileName)
            {
                return new AnimationControlChunk(new KaitaiStream(fileName));
            }

            public AnimationControlChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numFrames = m_io.ReadU4be();
                _numPlays = m_io.ReadU4be();
            }
            private uint _numFrames;
            private uint _numPlays;
            private Png m_root;
            private Png.Chunk m_parent;

            /// <summary>
            /// Number of frames, must be equal to the number of `fcTL` chunks (i.e.
            /// `frame_control_chunk` objects)
            /// </summary>
            public uint NumFrames { get { return _numFrames; } }

            /// <summary>
            /// Number of times to loop, 0 indicates infinite looping.
            /// </summary>
            public uint NumPlays { get { return _numPlays; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/skeeto/scratch/tree/58470254f4a95cdf7a53888e405c851c21eb2cae/pngattach">Source</a>
        /// </remarks>
        /// <remarks>
        /// Reference: <a href="https://nullprogram.com/blog/2021/12/31/">A new protocol and tool for PNG file attachments</a>
        /// </remarks>
        public partial class AtchChunk : KaitaiStruct
        {
            public static AtchChunk FromFile(string fileName)
            {
                return new AtchChunk(new KaitaiStream(fileName));
            }


            public enum CompressionAttachMethods
            {
                None = 0,
                Zlib = 1,
            }
            public AtchChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_data = false;
                _read();
            }
            private void _read()
            {
                _fileName = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(0, false, true, true));
                {
                    string M_ = _fileName;
                    if (!( ((M_.Length != 0) && (M_.Substring(0, 1 - 0) != ".")) ))
                    {
                        throw new ValidationExprError(_fileName, m_io, "/types/atch_chunk/seq/0");
                    }
                }
                _compression = ((CompressionAttachMethods) m_io.ReadU1());
                if (!Enum.IsDefined(typeof(CompressionAttachMethods), _compression))
                {
                    throw new ValidationNotInEnumError(_compression, m_io, "/types/atch_chunk/seq/1");
                }
                if (Compression == CompressionAttachMethods.None) {
                    _dataPlain = m_io.ReadBytesFull();
                }
                if (Compression == CompressionAttachMethods.Zlib) {
                    __raw_dataZlib = m_io.ReadBytesFull();
                    _dataZlib = m_io.ProcessZlib(__raw_dataZlib);
                }
            }
            private bool f_data;
            private byte[] _data;
            public byte[] Data
            {
                get
                {
                    if (f_data)
                        return _data;
                    f_data = true;
                    _data = (byte[]) ((Compression == CompressionAttachMethods.None ? DataPlain : DataZlib));
                    return _data;
                }
            }
            private string _fileName;
            private CompressionAttachMethods _compression;
            private byte[] _dataPlain;
            private byte[] _dataZlib;
            private Png m_root;
            private Png.Chunk m_parent;
            private byte[] __raw_dataZlib;

            /// <summary>
            /// From the [official
            /// specification](https://github.com/skeeto/scratch/tree/58470254f4a95cdf7a53888e405c851c21eb2cae/pngattach#atch-chunk-specification):
            /// 
            /// &gt; The name can be any length that fits in the chunk, and should be
            /// &gt; encoded with UTF-8. It's up to each implementation to determine how
            /// &gt; to appropriately interpret the bytestring for the local system.
            /// 
            /// &gt; The name must be at least one byte long, not counting the null
            /// &gt; terminator. It cannot begin with a period (`0x2e`), nor contain
            /// &gt; control bytes (anything less than `0x20`), nor slash (`0x2f`), nor
            /// &gt; backslash (`0x5c`), i.e. no directory hierarchies.
            /// 
            /// As of Kaitai Struct 0.11, we cannot easily check whether a string
            /// contains certain characters, so we only enforce that the file name is
            /// not empty and that it doesn't start with a period.
            /// </summary>
            public string FileName { get { return _fileName; } }
            public CompressionAttachMethods Compression { get { return _compression; } }
            public byte[] DataPlain { get { return _dataPlain; } }
            public byte[] DataZlib { get { return _dataZlib; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
            public byte[] M_RawDataZlib { get { return __raw_dataZlib; } }
        }

        /// <summary>
        /// Background chunk stores default background color to display this
        /// image against. Contents depend on `color_type` of the image.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#11bKGD">Source</a>
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
                case Png.ColorType.Greyscale: {
                    _bkgd = new BkgdGreyscale(m_io, this, m_root);
                    break;
                }
                case Png.ColorType.GreyscaleAlpha: {
                    _bkgd = new BkgdGreyscale(m_io, this, m_root);
                    break;
                }
                case Png.ColorType.Indexed: {
                    _bkgd = new BkgdIndexed(m_io, this, m_root);
                    break;
                }
                case Png.ColorType.Truecolor: {
                    _bkgd = new BkgdTruecolor(m_io, this, m_root);
                    break;
                }
                case Png.ColorType.TruecolorAlpha: {
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
        public partial class ChrmChromaticity : KaitaiStruct
        {
            public static ChrmChromaticity FromFile(string fileName)
            {
                return new ChrmChromaticity(new KaitaiStream(fileName));
            }

            public ChrmChromaticity(KaitaiStream p__io, Png.ChrmChunk p__parent = null, Png p__root = null) : base(p__io)
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
                    f_x = true;
                    _x = (double) (XInt / 100000.0);
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
                    f_y = true;
                    _y = (double) (YInt / 100000.0);
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

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#11cHRM">Source</a>
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
                _whitePoint = new ChrmChromaticity(m_io, this, m_root);
                _red = new ChrmChromaticity(m_io, this, m_root);
                _green = new ChrmChromaticity(m_io, this, m_root);
                _blue = new ChrmChromaticity(m_io, this, m_root);
            }
            private ChrmChromaticity _whitePoint;
            private ChrmChromaticity _red;
            private ChrmChromaticity _green;
            private ChrmChromaticity _blue;
            private Png m_root;
            private Png.Chunk m_parent;
            public ChrmChromaticity WhitePoint { get { return _whitePoint; } }
            public ChrmChromaticity Red { get { return _red; } }
            public ChrmChromaticity Green { get { return _green; } }
            public ChrmChromaticity Blue { get { return _blue; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
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
                f_isAncillary = false;
                f_isPrivate = false;
                f_isSafeToCopy = false;
                f_reservedBit = false;
                f_type = false;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU4be();
                _typeRaw = m_io.ReadBytes(4);
                {
                    byte[] M_ = _typeRaw;
                    if (!( (( (( ((M_[0] >= 65) && (M_[0] <= 90)) ) || ( ((M_[0] >= 97) && (M_[0] <= 122)) )) ) && ( (( ((M_[1] >= 65) && (M_[1] <= 90)) ) || ( ((M_[1] >= 97) && (M_[1] <= 122)) )) ) && ( (( ((M_[2] >= 65) && (M_[2] <= 90)) ) || ( ((M_[2] >= 97) && (M_[2] <= 122)) )) ) && ( (( ((M_[3] >= 65) && (M_[3] <= 90)) ) || ( ((M_[3] >= 97) && (M_[3] <= 122)) )) )) ))
                    {
                        throw new ValidationExprError(_typeRaw, m_io, "/types/chunk/seq/1");
                    }
                }
                switch (Type) {
                case "PLTE": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new PlteChunk(io___raw_body, this, m_root);
                    break;
                }
                case "acTL": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new AnimationControlChunk(io___raw_body, this, m_root);
                    break;
                }
                case "atCh": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new AtchChunk(io___raw_body, this, m_root);
                    break;
                }
                case "bKGD": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new BkgdChunk(io___raw_body, this, m_root);
                    break;
                }
                case "cHRM": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new ChrmChunk(io___raw_body, this, m_root);
                    break;
                }
                case "cICP": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new CicpChunk(io___raw_body, this, m_root);
                    break;
                }
                case "cLLI": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new ClliChunk(io___raw_body, this, m_root);
                    break;
                }
                case "eXIf": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new ExifChunk(io___raw_body, this, m_root);
                    break;
                }
                case "fcTL": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new FrameControlChunk(io___raw_body, this, m_root);
                    break;
                }
                case "fdAT": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new FrameDataChunk(io___raw_body, this, m_root);
                    break;
                }
                case "gAMA": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new GamaChunk(io___raw_body, this, m_root);
                    break;
                }
                case "hIST": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new HistChunk(io___raw_body, this, m_root);
                    break;
                }
                case "iCCP": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new IccpChunk(io___raw_body, this, m_root);
                    break;
                }
                case "iTXt": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new InternationalTextChunk(io___raw_body, this, m_root);
                    break;
                }
                case "mDCV": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new MdcvChunk(io___raw_body, this, m_root);
                    break;
                }
                case "mkBS": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new AdobeFireworksChunk(io___raw_body, this, m_root);
                    break;
                }
                case "mkTS": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new AdobeFireworksChunk(io___raw_body, this, m_root);
                    break;
                }
                case "pHYs": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new PhysChunk(io___raw_body, this, m_root);
                    break;
                }
                case "prVW": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new AdobeFireworksChunk(io___raw_body, this, m_root);
                    break;
                }
                case "sBIT": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SbitChunk(io___raw_body, this, m_root);
                    break;
                }
                case "sPLT": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SpltChunk(io___raw_body, this, m_root);
                    break;
                }
                case "sRGB": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SrgbChunk(io___raw_body, this, m_root);
                    break;
                }
                case "skMf": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new EvernoteSkmfChunk(io___raw_body, this, m_root);
                    break;
                }
                case "skRf": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new EvernoteSkrfChunk(io___raw_body, this, m_root);
                    break;
                }
                case "tEXt": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new TextChunk(io___raw_body, this, m_root);
                    break;
                }
                case "tIME": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new TimeChunk(io___raw_body, this, m_root);
                    break;
                }
                case "tRNS": {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new TrnsChunk(io___raw_body, this, m_root);
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
                _crc = m_io.ReadU4be();
            }
            private bool f_isAncillary;
            private bool _isAncillary;

            /// <summary>
            /// false = critical chunk, true = ancillary chunk
            /// </summary>
            public bool IsAncillary
            {
                get
                {
                    if (f_isAncillary)
                        return _isAncillary;
                    f_isAncillary = true;
                    _isAncillary = (bool) ((TypeRaw[0] & 32) != 0);
                    return _isAncillary;
                }
            }
            private bool f_isPrivate;
            private bool _isPrivate;

            /// <summary>
            /// false = public chunk (defined by the W3C), true = private chunk (can
            /// be defined by anyone)
            /// </summary>
            public bool IsPrivate
            {
                get
                {
                    if (f_isPrivate)
                        return _isPrivate;
                    f_isPrivate = true;
                    _isPrivate = (bool) ((TypeRaw[1] & 32) != 0);
                    return _isPrivate;
                }
            }
            private bool f_isSafeToCopy;
            private bool _isSafeToCopy;

            /// <summary>
            /// Defines whether the chunk may be copied if the image data (i.e.
            /// pixels) is modified. This tells PNG editors how to handle unknown
            /// chunks - see section [14.2 Behavior of PNG
            /// editors](https://www.w3.org/TR/2025/REC-png-3-20250624/#14Ordering) in
            /// the official specification.
            /// </summary>
            public bool IsSafeToCopy
            {
                get
                {
                    if (f_isSafeToCopy)
                        return _isSafeToCopy;
                    f_isSafeToCopy = true;
                    _isSafeToCopy = (bool) ((TypeRaw[3] & 32) != 0);
                    return _isSafeToCopy;
                }
            }
            private bool f_reservedBit;
            private bool _reservedBit;

            /// <summary>
            /// Should be `false`, i.e. all chunk types should have uppercase third
            /// letters (the lowercase third letter is reserved for possible future
            /// extensions to the PNG standard)
            /// </summary>
            public bool ReservedBit
            {
                get
                {
                    if (f_reservedBit)
                        return _reservedBit;
                    f_reservedBit = true;
                    _reservedBit = (bool) ((TypeRaw[2] & 32) != 0);
                    return _reservedBit;
                }
            }
            private bool f_type;
            private string _type;
            public string Type
            {
                get
                {
                    if (f_type)
                        return _type;
                    f_type = true;
                    _type = (string) (System.Text.Encoding.GetEncoding("ASCII").GetString(TypeRaw));
                    return _type;
                }
            }
            private uint _len;
            private byte[] _typeRaw;
            private object _body;
            private uint _crc;
            private Png m_root;
            private Png m_parent;
            private byte[] __raw_body;
            public uint Len { get { return _len; } }

            /// <summary>
            /// Each byte of a chunk type is restricted to the hexadecimal values
            /// 0x41..0x5a and 0x61..0x7a, i.e. uppercase and lowercase ASCII letters
            /// (`A-Z` and `a-z`).
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://www.w3.org/TR/2025/REC-png-3-20250624/#table51">Source</a>
            /// </remarks>
            public byte[] TypeRaw { get { return _typeRaw; } }
            public object Body { get { return _body; } }
            public uint Crc { get { return _crc; } }
            public Png M_Root { get { return m_root; } }
            public Png M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#cICP-chunk">Source</a>
        /// </remarks>
        /// <remarks>
        /// Reference: <a href="https://w3c.github.io/png/Implementation_Report_3e/#cicp">Source</a>
        /// </remarks>
        public partial class CicpChunk : KaitaiStruct
        {
            public static CicpChunk FromFile(string fileName)
            {
                return new CicpChunk(new KaitaiStream(fileName));
            }

            public CicpChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _colorPrimaries = m_io.ReadU1();
                _transferFunction = m_io.ReadU1();
                _matrixCoefficients = m_io.ReadU1();
                if (!(_matrixCoefficients == 0))
                {
                    throw new ValidationNotEqualError(0, _matrixCoefficients, m_io, "/types/cicp_chunk/seq/2");
                }
                _videoFullRangeFlag = m_io.ReadU1();
                if (!( ((_videoFullRangeFlag == 0) || (_videoFullRangeFlag == 1)) ))
                {
                    throw new ValidationNotAnyOfError(_videoFullRangeFlag, m_io, "/types/cicp_chunk/seq/3");
                }
            }
            private byte _colorPrimaries;
            private byte _transferFunction;
            private byte _matrixCoefficients;
            private byte _videoFullRangeFlag;
            private Png m_root;
            private Png.Chunk m_parent;

            /// <summary>
            /// values above 22 are reserved, see
            /// &lt;https://github.com/pnggroup/pngcheck/blob/bd33ad6490269df07cac81e5305f4ebf56c2b637/pngcheck.c#L3322-L3325&gt;
            /// </summary>
            public byte ColorPrimaries { get { return _colorPrimaries; } }

            /// <summary>
            /// values above 18 are reserved, see
            /// &lt;https://github.com/pnggroup/pngcheck/blob/bd33ad6490269df07cac81e5305f4ebf56c2b637/pngcheck.c#L3326-L3329&gt;
            /// </summary>
            public byte TransferFunction { get { return _transferFunction; } }

            /// <summary>
            /// From the [official
            /// specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#cICP-chunk):
            /// 
            /// &gt; RGB is currently the only supported color model in PNG, and as such
            /// &gt; `Matrix Coefficients` shall be set to `0`.
            /// </summary>
            public byte MatrixCoefficients { get { return _matrixCoefficients; } }

            /// <summary>
            /// From the [official
            /// specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#cICP-chunk):
            /// 
            /// &gt; If `Video Full Range Flag` value is `1`, then the image is a
            /// &gt; full-range image. Typically, images in the RGB color representation
            /// &gt; are stored in the full-range signal quantization, therefore the vast
            /// &gt; majority of computer graphics and web images, including those used
            /// &gt; in traditional PNG workflows, are full-range images.
            /// 
            /// &gt; If `Video Full Range Flag` value is `0`, then the image is a
            /// &gt; narrow-range image.
            /// </summary>
            public byte VideoFullRangeFlag { get { return _videoFullRangeFlag; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#cLLI-chunk">Source</a>
        /// </remarks>
        /// <remarks>
        /// Reference: <a href="https://w3c.github.io/png/Implementation_Report_3e/#light">Source</a>
        /// </remarks>
        public partial class ClliChunk : KaitaiStruct
        {
            public static ClliChunk FromFile(string fileName)
            {
                return new ClliChunk(new KaitaiStream(fileName));
            }

            public ClliChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_maxContentLightLevel = false;
                f_maxFrameAverageLightLevel = false;
                _read();
            }
            private void _read()
            {
                _maxContentLightLevelInt = m_io.ReadU4be();
                _maxFrameAverageLightLevelInt = m_io.ReadU4be();
            }
            private bool f_maxContentLightLevel;
            private double _maxContentLightLevel;

            /// <summary>
            /// Maximum Content Light Level (MaxCLL), in cd/m^2
            /// </summary>
            public double MaxContentLightLevel
            {
                get
                {
                    if (f_maxContentLightLevel)
                        return _maxContentLightLevel;
                    f_maxContentLightLevel = true;
                    _maxContentLightLevel = (double) (MaxContentLightLevelInt * 0.0001);
                    return _maxContentLightLevel;
                }
            }
            private bool f_maxFrameAverageLightLevel;
            private double _maxFrameAverageLightLevel;

            /// <summary>
            /// Maximum Frame Average Light Level (MaxFALL), in cd/m^2
            /// </summary>
            public double MaxFrameAverageLightLevel
            {
                get
                {
                    if (f_maxFrameAverageLightLevel)
                        return _maxFrameAverageLightLevel;
                    f_maxFrameAverageLightLevel = true;
                    _maxFrameAverageLightLevel = (double) (MaxFrameAverageLightLevelInt * 0.0001);
                    return _maxFrameAverageLightLevel;
                }
            }
            private uint _maxContentLightLevelInt;
            private uint _maxFrameAverageLightLevelInt;
            private Png m_root;
            private Png.Chunk m_parent;
            public uint MaxContentLightLevelInt { get { return _maxContentLightLevelInt; } }
            public uint MaxFrameAverageLightLevelInt { get { return _maxFrameAverageLightLevelInt; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }
        public partial class CompressedText : KaitaiStruct
        {
            public static CompressedText FromFile(string fileName)
            {
                return new CompressedText(new KaitaiStream(fileName));
            }

            public CompressedText(KaitaiStream p__io, Png.CompressedTextChunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _value = System.Text.Encoding.GetEncoding("ISO-8859-1").GetString(m_io.ReadBytesFull());
            }
            private string _value;
            private Png m_root;
            private Png.CompressedTextChunk m_parent;

            /// <summary>
            /// Text string (the &quot;value&quot; of this key-value pair).
            /// 
            /// Although it is not null-terminated (unlike the keyword), it must not
            /// contain a zero byte (U+0000 NULL character). A newline should be
            /// represented by a single U+000A LINE FEED (LF) character (aka `\n`).
            /// The remaining control characters (U+0001..U+0009, U+000B..0+001F,
            /// U+007F..U+009F) are discouraged.
            /// </summary>
            public string Value { get { return _value; } }
            public Png M_Root { get { return m_root; } }
            public Png.CompressedTextChunk M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Compressed textual data (`zTXt`) chunk effectively allows you to store
        /// key-value string pairs in the PNG container, compressing the &quot;value&quot; part
        /// (which can be quite lengthy) with zlib compression.
        /// 
        /// The `zTXt` and `tEXt` chunks are semantically equivalent, but the `zTXt`
        /// chunk is recommended for storing large blocks of text.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#11zTXt">Source</a>
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
                _keyword = System.Text.Encoding.GetEncoding("ISO-8859-1").GetString(m_io.ReadBytesTerm(0, false, true, true));
                _compressionMethod = ((Png.CompressionMethods) m_io.ReadU1());
                if (!(_compressionMethod == Png.CompressionMethods.Zlib))
                {
                    throw new ValidationNotEqualError(Png.CompressionMethods.Zlib, _compressionMethod, m_io, "/types/compressed_text_chunk/seq/1");
                }
                __raw__raw_text = m_io.ReadBytesFull();
                __raw_text = m_io.ProcessZlib(__raw__raw_text);
                var io___raw_text = new KaitaiStream(__raw_text);
                _text = new CompressedText(io___raw_text, this, m_root);
            }
            private string _keyword;
            private CompressionMethods _compressionMethod;
            private CompressedText _text;
            private Png m_root;
            private Png.Chunk m_parent;
            private byte[] __raw_text;
            private byte[] __raw__raw_text;

            /// <summary>
            /// Indicates the type of information represented by the text string.
            /// 
            /// Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
            /// characters and spaces; that is, only code points 0x20-0x7E and
            /// 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
            /// keyword, leading spaces, trailing spaces, and consecutive spaces are
            /// not permitted.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://www.w3.org/TR/2025/REC-png-3-20250624/#11keywords">Source</a>
            /// </remarks>
            public string Keyword { get { return _keyword; } }
            public CompressionMethods CompressionMethod { get { return _compressionMethod; } }
            public CompressedText Text { get { return _text; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
            public byte[] M_RawText { get { return __raw_text; } }
            public byte[] M_RawM_RawText { get { return __raw__raw_text; } }
        }

        /// <remarks>
        /// Reference: <a href="https://web.archive.org/web/20210302212148/https://discussion.evernote.com/forums/topic/88532-how-to-extract-annotation-information-from-annotated-evernoteskitch-images/#comment-451501">Source</a>
        /// </remarks>
        public partial class EvernoteSkmfChunk : KaitaiStruct
        {
            public static EvernoteSkmfChunk FromFile(string fileName)
            {
                return new EvernoteSkmfChunk(new KaitaiStream(fileName));
            }

            public EvernoteSkmfChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _json = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesFull());
            }
            private string _json;
            private Png m_root;
            private Png.Chunk m_parent;

            /// <summary>
            /// JSON document with information about editable annotations (text,
            /// lines, paths, etc.) in Evernote/Skitch.
            /// 
            /// It refers to the original image stored in the `skRf` chunk (which
            /// usually follows immediately after `skMf`) via the
            /// `.children[0].children[0].uri` JSON property. This has the format
            /// `&quot;skitch+uuid:///$UUID&quot;`, where `$UUID` is a random UUIDv4 value that
            /// matches the `uuid` field in `evernote_skrf_chunk` (i.e. in the first
            /// 16 bytes of the `skRf` chunk).
            /// </summary>
            public string Json { get { return _json; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://web.archive.org/web/20210302212148/https://discussion.evernote.com/forums/topic/88532-how-to-extract-annotation-information-from-annotated-evernoteskitch-images/#comment-451501">Source</a>
        /// </remarks>
        public partial class EvernoteSkrfChunk : KaitaiStruct
        {
            public static EvernoteSkrfChunk FromFile(string fileName)
            {
                return new EvernoteSkrfChunk(new KaitaiStream(fileName));
            }

            public EvernoteSkrfChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _uuid = m_io.ReadBytes(16);
                _origImg = m_io.ReadBytesFull();
            }
            private byte[] _uuid;
            private byte[] _origImg;
            private Png m_root;
            private Png.Chunk m_parent;

            /// <summary>
            /// Random UUIDv4 value used to identify the image. It is referenced by
            /// the `skMf` chunk - see the documentation for the `json` field in
            /// `evernote_skmf_chunk`.
            /// </summary>
            public byte[] Uuid { get { return _uuid; } }

            /// <summary>
            /// The original source image without annotations. It's usually a PNG
            /// image as well, but it can also be a JPEG or possibly other formats.
            /// </summary>
            public byte[] OrigImg { get { return _origImg; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Exchangeable Image File (Exif) Profile (`eXIf`) chunk.
        /// 
        /// Only one `eXIf` chunk is allowed in a PNG datastream.
        /// 
        /// The `eXIf` chunk contains metadata concerning the original image data. If
        /// the image has been edited subsequent to creation of the Exif profile, this
        /// data might no longer apply to the PNG image data.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#eXIf">Source</a>
        /// </remarks>
        public partial class ExifChunk : KaitaiStruct
        {
            public static ExifChunk FromFile(string fileName)
            {
                return new ExifChunk(new KaitaiStream(fileName));
            }

            public ExifChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _exif = new Exif(m_io);
            }
            private Exif _exif;
            private Png m_root;
            private Png.Chunk m_parent;
            public Exif Exif { get { return _exif; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#fcTL-chunk">Source</a>
        /// </remarks>
        public partial class FrameControlChunk : KaitaiStruct
        {
            public static FrameControlChunk FromFile(string fileName)
            {
                return new FrameControlChunk(new KaitaiStream(fileName));
            }

            public FrameControlChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_delay = false;
                _read();
            }
            private void _read()
            {
                _sequenceNumber = m_io.ReadU4be();
                _width = m_io.ReadU4be();
                if (!(_width >= 1))
                {
                    throw new ValidationLessThanError(1, _width, m_io, "/types/frame_control_chunk/seq/1");
                }
                if (!(_width <= M_Root.Ihdr.Width))
                {
                    throw new ValidationGreaterThanError(M_Root.Ihdr.Width, _width, m_io, "/types/frame_control_chunk/seq/1");
                }
                _height = m_io.ReadU4be();
                if (!(_height >= 1))
                {
                    throw new ValidationLessThanError(1, _height, m_io, "/types/frame_control_chunk/seq/2");
                }
                if (!(_height <= M_Root.Ihdr.Height))
                {
                    throw new ValidationGreaterThanError(M_Root.Ihdr.Height, _height, m_io, "/types/frame_control_chunk/seq/2");
                }
                _xOffset = m_io.ReadU4be();
                if (!(_xOffset <= M_Root.Ihdr.Width - Width))
                {
                    throw new ValidationGreaterThanError(M_Root.Ihdr.Width - Width, _xOffset, m_io, "/types/frame_control_chunk/seq/3");
                }
                _yOffset = m_io.ReadU4be();
                if (!(_yOffset <= M_Root.Ihdr.Height - Height))
                {
                    throw new ValidationGreaterThanError(M_Root.Ihdr.Height - Height, _yOffset, m_io, "/types/frame_control_chunk/seq/4");
                }
                _delayNum = m_io.ReadU2be();
                _delayDen = m_io.ReadU2be();
                _disposeOp = ((Png.DisposeOpValues) m_io.ReadU1());
                if (!Enum.IsDefined(typeof(DisposeOpValues), _disposeOp))
                {
                    throw new ValidationNotInEnumError(_disposeOp, m_io, "/types/frame_control_chunk/seq/7");
                }
                _blendOp = ((Png.BlendOpValues) m_io.ReadU1());
                if (!Enum.IsDefined(typeof(BlendOpValues), _blendOp))
                {
                    throw new ValidationNotInEnumError(_blendOp, m_io, "/types/frame_control_chunk/seq/8");
                }
            }
            private bool f_delay;
            private double _delay;

            /// <summary>
            /// Time to display this frame, in seconds
            /// </summary>
            public double Delay
            {
                get
                {
                    if (f_delay)
                        return _delay;
                    f_delay = true;
                    _delay = (double) (DelayNum / (DelayDen == 0 ? 100.0 : DelayDen));
                    return _delay;
                }
            }
            private uint _sequenceNumber;
            private uint _width;
            private uint _height;
            private uint _xOffset;
            private uint _yOffset;
            private ushort _delayNum;
            private ushort _delayDen;
            private DisposeOpValues _disposeOp;
            private BlendOpValues _blendOp;
            private Png m_root;
            private Png.Chunk m_parent;

            /// <summary>
            /// Sequence number of the animation chunk, starting from 0.
            /// 
            /// The `fcTL` and `fdAT` chunks have a 4-byte sequence number. Both chunk
            /// types share the sequence. The purpose of this number is to detect (and
            /// optionally correct) sequence errors in an Animated PNG, since the PNG
            /// specification does not impose ordering restrictions on ancillary
            /// chunks (which means that a PNG editor is technically allowed to
            /// reorder them arbitrarily, see [14.2 Behavior of PNG
            /// editors](https://www.w3.org/TR/png/#14Ordering) in the spec).
            /// 
            /// The first `fcTL` chunk must contain sequence number 0, and the
            /// sequence numbers in the remaining `fcTL` and `fdAT` chunks must be in
            /// ascending order, with no gaps or duplicates.
            /// </summary>
            public uint SequenceNumber { get { return _sequenceNumber; } }

            /// <summary>
            /// Width of the following frame
            /// </summary>
            public uint Width { get { return _width; } }

            /// <summary>
            /// Height of the following frame
            /// </summary>
            public uint Height { get { return _height; } }

            /// <summary>
            /// X position at which to render the following frame
            /// </summary>
            public uint XOffset { get { return _xOffset; } }

            /// <summary>
            /// Y position at which to render the following frame
            /// </summary>
            public uint YOffset { get { return _yOffset; } }

            /// <summary>
            /// Frame delay fraction numerator
            /// </summary>
            public ushort DelayNum { get { return _delayNum; } }

            /// <summary>
            /// Frame delay fraction denominator
            /// </summary>
            public ushort DelayDen { get { return _delayDen; } }

            /// <summary>
            /// Type of frame area disposal to be done after rendering this frame
            /// </summary>
            public DisposeOpValues DisposeOp { get { return _disposeOp; } }

            /// <summary>
            /// Type of frame area rendering for this frame
            /// </summary>
            public BlendOpValues BlendOp { get { return _blendOp; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#fdAT-chunk">Source</a>
        /// </remarks>
        public partial class FrameDataChunk : KaitaiStruct
        {
            public static FrameDataChunk FromFile(string fileName)
            {
                return new FrameDataChunk(new KaitaiStream(fileName));
            }

            public FrameDataChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _sequenceNumber = m_io.ReadU4be();
                _frameData = m_io.ReadBytesFull();
            }
            private uint _sequenceNumber;
            private byte[] _frameData;
            private Png m_root;
            private Png.Chunk m_parent;

            /// <summary>
            /// Sequence number of the animation chunk, starting from 0.
            /// 
            /// The `fcTL` and `fdAT` chunks have a 4-byte sequence number. Both chunk
            /// types share the sequence. The purpose of this number is to detect (and
            /// optionally correct) sequence errors in an Animated PNG, since the PNG
            /// specification does not impose ordering restrictions on ancillary
            /// chunks (which means that a PNG editor is technically allowed to
            /// reorder them arbitrarily, see [14.2 Behavior of PNG
            /// editors](https://www.w3.org/TR/png/#14Ordering) in the spec).
            /// 
            /// The first `fcTL` chunk must contain sequence number 0, and the
            /// sequence numbers in the remaining `fcTL` and `fdAT` chunks must be in
            /// ascending order, with no gaps or duplicates.
            /// </summary>
            public uint SequenceNumber { get { return _sequenceNumber; } }

            /// <summary>
            /// Frame data for the frame. At least one `fdAT` chunk is required for
            /// each frame, except for the first frame, if that frame is represented
            /// by an `IDAT` chunk. The compressed datastream for each frame is the
            /// concatenation of the contents of the data fields of all the `fdAT`
            /// chunks within a frame.
            /// </summary>
            public byte[] FrameData { get { return _frameData; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#11gAMA">Source</a>
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
                f_gamma = false;
                f_invGamma = false;
                _read();
            }
            private void _read()
            {
                _gammaInt = m_io.ReadU4be();
                {
                    uint M_ = _gammaInt;
                    if (!(M_ != 0))
                    {
                        throw new ValidationExprError(_gammaInt, m_io, "/types/gama_chunk/seq/0");
                    }
                }
            }
            private bool f_gamma;
            private double _gamma;

            /// <summary>
            /// Image gamma, typically 0.45455 = 1/2.2
            /// </summary>
            public double Gamma
            {
                get
                {
                    if (f_gamma)
                        return _gamma;
                    f_gamma = true;
                    _gamma = (double) (GammaInt / 100000.0);
                    return _gamma;
                }
            }
            private bool f_invGamma;
            private double _invGamma;

            /// <summary>
            /// Inverse of the image gamma (1 / gamma), typically 2.2 (not considering
            /// rounding)
            /// </summary>
            public double InvGamma
            {
                get
                {
                    if (f_invGamma)
                        return _invGamma;
                    f_invGamma = true;
                    _invGamma = (double) (100000.0 / GammaInt);
                    return _invGamma;
                }
            }
            private uint _gammaInt;
            private Png m_root;
            private Png.Chunk m_parent;

            /// <summary>
            /// Image gamma multiplied by 100000 (a gamma value of 1/2.2 is stored as
            /// 45455)
            /// </summary>
            public uint GammaInt { get { return _gammaInt; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Image histogram (`hIST`) chunk gives the approximate usage frequency of
        /// each color in the palette. A histogram chunk can appear only when a `PLTE`
        /// chunk appears.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#11hIST">Source</a>
        /// </remarks>
        public partial class HistChunk : KaitaiStruct
        {
            public static HistChunk FromFile(string fileName)
            {
                return new HistChunk(new KaitaiStream(fileName));
            }

            public HistChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _usageFreqs = new List<ushort>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _usageFreqs.Add(m_io.ReadU2be());
                        i++;
                    }
                }
            }
            private List<ushort> _usageFreqs;
            private Png m_root;
            private Png.Chunk m_parent;

            /// <summary>
            /// Usage frequencies of each color in the palette.
            /// 
            /// There must be exactly one entry for each entry in the `PLTE` chunk. Each
            /// entry is proportional to the fraction of pixels in the image that have
            /// that palette index; the exact scale factor is chosen by the encoder.
            /// 
            /// Histogram entries are approximate, with the exception that a zero
            /// entry specifies that the corresponding palette entry is not used at
            /// all in the image. A histogram entry must be nonzero if there are any
            /// pixels of that color.
            /// </summary>
            public List<ushort> UsageFreqs { get { return _usageFreqs; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Embedded ICC profile (`iCCP`) chunk.
        /// 
        /// If the `iCCP` chunk is present, the image samples conform to the color
        /// space represented by the embedded ICC profile as defined by the
        /// International Color Consortium.
        /// 
        /// This chunk is ignored unless it is the [highest-precedence color
        /// chunk](https://www.w3.org/TR/png/#color-chunk-precendence) understood by
        /// the decoder. Unless a `cICP` chunk exists, a PNG datastream should contain
        /// at most one embedded profile, whether specified explicitly with an `iCCP`
        /// or implicitly with an `sRGB` chunk.
        /// 
        /// It is recommended that the `sRGB` and `iCCP` chunks do not appear
        /// simultaneously in a PNG datastream.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#11iCCP">Source</a>
        /// </remarks>
        public partial class IccpChunk : KaitaiStruct
        {
            public static IccpChunk FromFile(string fileName)
            {
                return new IccpChunk(new KaitaiStream(fileName));
            }

            public IccpChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _profileName = System.Text.Encoding.GetEncoding("ISO-8859-1").GetString(m_io.ReadBytesTerm(0, false, true, true));
                _compressionMethod = ((Png.CompressionMethods) m_io.ReadU1());
                if (!(_compressionMethod == Png.CompressionMethods.Zlib))
                {
                    throw new ValidationNotEqualError(Png.CompressionMethods.Zlib, _compressionMethod, m_io, "/types/iccp_chunk/seq/1");
                }
                __raw__raw_profile = m_io.ReadBytesFull();
                __raw_profile = m_io.ProcessZlib(__raw__raw_profile);
                var io___raw_profile = new KaitaiStream(__raw_profile);
                _profile = new Icc4(io___raw_profile);
            }
            private string _profileName;
            private CompressionMethods _compressionMethod;
            private Icc4 _profile;
            private Png m_root;
            private Png.Chunk m_parent;
            private byte[] __raw_profile;
            private byte[] __raw__raw_profile;

            /// <summary>
            /// Any convenient name for referring to the profile. It is
            /// case-sensitive.
            /// 
            /// Profile names must contain only printable ISO-8859-1 (Latin-1)
            /// characters and spaces; that is, only code points 0x20-0x7E and
            /// 0xA1-0xFF are allowed. Leading, trailing, and consecutive spaces are
            /// not permitted.
            /// </summary>
            public string ProfileName { get { return _profileName; } }
            public CompressionMethods CompressionMethod { get { return _compressionMethod; } }

            /// <summary>
            /// Embedded ICC profile.
            /// 
            /// The color space of the ICC profile must be:
            /// 
            /// * an RGB color space for color images (color types
            ///   `color_type::truecolor` = 2, `color_type::indexed` = 3, and
            ///   `color_type::truecolor_alpha` = 6), or
            /// * a greyscale color space for greyscale images (color types
            ///   `color_type::greyscale` = 0 and `color_type::greyscale_alpha` = 4).
            /// 
            /// Note that the imported `icc_4.ksy` spec currently in use here supports
            /// only the ICC.1 v4 specification (as the name suggests), not ICC.1 v2.
            /// This means that PNG files with an embedded v2 profile (for example
            /// https://github.com/web-platform-tests/wpt/blob/495d9d7716298588ff49d6e701bf27c5134bde06/css/css-color/support/swap-990000-iCCP.png)
            /// will fail to parse.
            /// 
            /// TODO: extend `icc_4.ksy` to support both v4 and v2 profiles, rename it
            /// to `icc.ksy`, and use it here.
            /// </summary>
            public Icc4 Profile { get { return _profile; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
            public byte[] M_RawProfile { get { return __raw_profile; } }
            public byte[] M_RawM_RawProfile { get { return __raw__raw_profile; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#11IHDR">Source</a>
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
                if (!(_width >= 1))
                {
                    throw new ValidationLessThanError(1, _width, m_io, "/types/ihdr_chunk/seq/0");
                }
                _height = m_io.ReadU4be();
                if (!(_height >= 1))
                {
                    throw new ValidationLessThanError(1, _height, m_io, "/types/ihdr_chunk/seq/1");
                }
                _bitDepth = m_io.ReadU1();
                if (!( ((_bitDepth == 1) || (_bitDepth == 2) || (_bitDepth == 4) || (_bitDepth == 8) || (_bitDepth == 16)) ))
                {
                    throw new ValidationNotAnyOfError(_bitDepth, m_io, "/types/ihdr_chunk/seq/2");
                }
                _colorType = ((Png.ColorType) m_io.ReadU1());
                if (!Enum.IsDefined(typeof(ColorType), _colorType))
                {
                    throw new ValidationNotInEnumError(_colorType, m_io, "/types/ihdr_chunk/seq/3");
                }
                _compressionMethod = ((Png.CompressionMethods) m_io.ReadU1());
                if (!Enum.IsDefined(typeof(CompressionMethods), _compressionMethod))
                {
                    throw new ValidationNotInEnumError(_compressionMethod, m_io, "/types/ihdr_chunk/seq/4");
                }
                _filterMethod = ((Png.FilterMethod) m_io.ReadU1());
                if (!Enum.IsDefined(typeof(FilterMethod), _filterMethod))
                {
                    throw new ValidationNotInEnumError(_filterMethod, m_io, "/types/ihdr_chunk/seq/5");
                }
                _interlaceMethod = ((Png.InterlaceMethod) m_io.ReadU1());
                if (!Enum.IsDefined(typeof(InterlaceMethod), _interlaceMethod))
                {
                    throw new ValidationNotInEnumError(_interlaceMethod, m_io, "/types/ihdr_chunk/seq/6");
                }
            }
            private uint _width;
            private uint _height;
            private byte _bitDepth;
            private ColorType _colorType;
            private CompressionMethods _compressionMethod;
            private FilterMethod _filterMethod;
            private InterlaceMethod _interlaceMethod;
            private Png m_root;
            private Png m_parent;
            public uint Width { get { return _width; } }
            public uint Height { get { return _height; } }
            public byte BitDepth { get { return _bitDepth; } }
            public ColorType ColorType { get { return _colorType; } }
            public CompressionMethods CompressionMethod { get { return _compressionMethod; } }
            public FilterMethod FilterMethod { get { return _filterMethod; } }
            public InterlaceMethod InterlaceMethod { get { return _interlaceMethod; } }
            public Png M_Root { get { return m_root; } }
            public Png M_Parent { get { return m_parent; } }
        }
        public partial class InternationalText : KaitaiStruct
        {
            public static InternationalText FromFile(string fileName)
            {
                return new InternationalText(new KaitaiStream(fileName));
            }

            public InternationalText(KaitaiStream p__io, Png.InternationalTextChunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _value = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesFull());
            }
            private string _value;
            private Png m_root;
            private Png.InternationalTextChunk m_parent;

            /// <summary>
            /// Text string (the &quot;value&quot; of this key-value pair), written in language
            /// specified in `_parent.language_tag`.
            /// 
            /// Although it is not null-terminated (unlike other textual data in the
            /// `iTXt` chunk), it must not contain a zero byte
            /// (U+0000 NULL character). A newline should be represented by a single
            /// U+000A LINE FEED (LF) character (aka `\n`). The remaining control
            /// characters (U+0001..U+0009, U+000B..0+001F, U+007F..U+009F) are
            /// discouraged.
            /// </summary>
            public string Value { get { return _value; } }
            public Png M_Root { get { return m_root; } }
            public Png.InternationalTextChunk M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// International textual data (`iTXt`) chunk effectively allows you to store
        /// key-value string pairs in the PNG container.
        /// 
        /// The &quot;key&quot; part (`keyword`) is restricted to printable ISO-8859-1 (Latin-1)
        /// characters and spaces. The translated keyword and the &quot;value&quot; part
        /// (`text`) are stored in UTF-8 and thus can store text in any language -
        /// this language can be indicated via the language tag (`language_tag`).
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#11iTXt">Source</a>
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
                f_text = false;
                _read();
            }
            private void _read()
            {
                _keyword = System.Text.Encoding.GetEncoding("ISO-8859-1").GetString(m_io.ReadBytesTerm(0, false, true, true));
                _compressionFlag = m_io.ReadU1();
                if (!( ((_compressionFlag == 0) || (_compressionFlag == 1)) ))
                {
                    throw new ValidationNotAnyOfError(_compressionFlag, m_io, "/types/international_text_chunk/seq/1");
                }
                _compressionMethod = ((Png.CompressionMethods) m_io.ReadU1());
                if (!(_compressionMethod == (CompressionFlag == 1 ? Png.CompressionMethods.Zlib : CompressionMethod)))
                {
                    throw new ValidationNotEqualError((CompressionFlag == 1 ? Png.CompressionMethods.Zlib : CompressionMethod), _compressionMethod, m_io, "/types/international_text_chunk/seq/2");
                }
                _languageTag = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(0, false, true, true));
                _translatedKeyword = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(0, false, true, true));
                if (CompressionFlag == 0) {
                    __raw_textPlain = m_io.ReadBytesFull();
                    var io___raw_textPlain = new KaitaiStream(__raw_textPlain);
                    _textPlain = new InternationalText(io___raw_textPlain, this, m_root);
                }
                if (CompressionFlag == 1) {
                    __raw__raw_textZlib = m_io.ReadBytesFull();
                    __raw_textZlib = m_io.ProcessZlib(__raw__raw_textZlib);
                    var io___raw_textZlib = new KaitaiStream(__raw_textZlib);
                    _textZlib = new InternationalText(io___raw_textZlib, this, m_root);
                }
            }
            private bool f_text;
            private string _text;

            /// <summary>
            /// Text string (the &quot;value&quot; of this key-value pair), written in language
            /// specified in `language_tag`.
            /// 
            /// Although it is not null-terminated (unlike other textual data in the
            /// `iTXt` chunk), it must not contain a zero byte
            /// (U+0000 NULL character). A newline should be represented by a single
            /// U+000A LINE FEED (LF) character (aka `\n`). The remaining control
            /// characters (U+0001..U+0009, U+000B..0+001F, U+007F..U+009F) are
            /// discouraged.
            /// </summary>
            public string Text
            {
                get
                {
                    if (f_text)
                        return _text;
                    f_text = true;
                    _text = (string) ((CompressionFlag == 0 ? TextPlain : TextZlib).Value);
                    return _text;
                }
            }
            private string _keyword;
            private byte _compressionFlag;
            private CompressionMethods _compressionMethod;
            private string _languageTag;
            private string _translatedKeyword;
            private InternationalText _textPlain;
            private InternationalText _textZlib;
            private Png m_root;
            private Png.Chunk m_parent;
            private byte[] __raw_textPlain;
            private byte[] __raw_textZlib;
            private byte[] __raw__raw_textZlib;

            /// <summary>
            /// Indicates the type of information represented by the text string.
            /// 
            /// Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
            /// characters and spaces; that is, only code points 0x20-0x7E and
            /// 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
            /// keyword, leading spaces, trailing spaces, and consecutive spaces are
            /// not permitted.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://www.w3.org/TR/2025/REC-png-3-20250624/#11keywords">Source</a>
            /// </remarks>
            public string Keyword { get { return _keyword; } }

            /// <summary>
            /// 0 = text is uncompressed, 1 = text is compressed with a
            /// method specified in `compression_method`.
            /// </summary>
            public byte CompressionFlag { get { return _compressionFlag; } }
            public CompressionMethods CompressionMethod { get { return _compressionMethod; } }

            /// <summary>
            /// Human language used in the `translated_keyword` and `text` fields.
            /// 
            /// From the [official
            /// specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#11iTXt):
            /// 
            /// &gt; The language tag is a well-formed language tag defined by [RFC 5646:
            /// &gt; BCP 47: Tags for Identifying
            /// &gt; Languages](https://www.rfc-editor.org/info/rfc5646/). Unlike the
            /// &gt; keyword, the language tag is case-insensitive. Subtags must appear
            /// &gt; in the [IANA language subtag
            /// &gt; registry](https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry).
            /// &gt; If the language tag is empty, the language is unspecified. Examples
            /// &gt; of language tags include: `en`, `en-GB`, `es-419`, `zh-Hans`,
            /// &gt; `zh-Hans-CN`, `tlh-Cyrl-AQ`, `ar-AE-u-nu-latn`, and `x-private`.
            /// </summary>
            public string LanguageTag { get { return _languageTag; } }

            /// <summary>
            /// The keyword (`keyword`) translated into the language specified in
            /// `language_tag`.
            /// 
            /// It must not contain a zero byte (U+0000 NULL character). Line breaks
            /// should not appear. The remaining control characters (U+0001..U+0009,
            /// U+000B..0+001F, U+007F..U+009F) are discouraged.
            /// </summary>
            public string TranslatedKeyword { get { return _translatedKeyword; } }
            public InternationalText TextPlain { get { return _textPlain; } }
            public InternationalText TextZlib { get { return _textZlib; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
            public byte[] M_RawTextPlain { get { return __raw_textPlain; } }
            public byte[] M_RawTextZlib { get { return __raw_textZlib; } }
            public byte[] M_RawM_RawTextZlib { get { return __raw__raw_textZlib; } }
        }
        public partial class MdcvChromaticity : KaitaiStruct
        {
            public static MdcvChromaticity FromFile(string fileName)
            {
                return new MdcvChromaticity(new KaitaiStream(fileName));
            }

            public MdcvChromaticity(KaitaiStream p__io, Png.MdcvChunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_x = false;
                f_y = false;
                _read();
            }
            private void _read()
            {
                _xInt = m_io.ReadU2be();
                _yInt = m_io.ReadU2be();
            }
            private bool f_x;
            private double _x;
            public double X
            {
                get
                {
                    if (f_x)
                        return _x;
                    f_x = true;
                    _x = (double) (XInt * 0.00002);
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
                    f_y = true;
                    _y = (double) (YInt * 0.00002);
                    return _y;
                }
            }
            private ushort _xInt;
            private ushort _yInt;
            private Png m_root;
            private Png.MdcvChunk m_parent;
            public ushort XInt { get { return _xInt; } }
            public ushort YInt { get { return _yInt; } }
            public Png M_Root { get { return m_root; } }
            public Png.MdcvChunk M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#mDCV-chunk">Source</a>
        /// </remarks>
        /// <remarks>
        /// Reference: <a href="https://w3c.github.io/png/Implementation_Report_3e/#mastering">Source</a>
        /// </remarks>
        public partial class MdcvChunk : KaitaiStruct
        {
            public static MdcvChunk FromFile(string fileName)
            {
                return new MdcvChunk(new KaitaiStream(fileName));
            }

            public MdcvChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_maxLuminance = false;
                f_minLuminance = false;
                _read();
            }
            private void _read()
            {
                _red = new MdcvChromaticity(m_io, this, m_root);
                _green = new MdcvChromaticity(m_io, this, m_root);
                _blue = new MdcvChromaticity(m_io, this, m_root);
                _whitePoint = new MdcvChromaticity(m_io, this, m_root);
                _maxLuminanceInt = m_io.ReadU4be();
                _minLuminanceInt = m_io.ReadU4be();
            }
            private bool f_maxLuminance;
            private double _maxLuminance;

            /// <summary>
            /// Maximum luminance in cd/m^2
            /// </summary>
            public double MaxLuminance
            {
                get
                {
                    if (f_maxLuminance)
                        return _maxLuminance;
                    f_maxLuminance = true;
                    _maxLuminance = (double) (MaxLuminanceInt * 0.0001);
                    return _maxLuminance;
                }
            }
            private bool f_minLuminance;
            private double _minLuminance;

            /// <summary>
            /// Minimum luminance in cd/m^2
            /// </summary>
            public double MinLuminance
            {
                get
                {
                    if (f_minLuminance)
                        return _minLuminance;
                    f_minLuminance = true;
                    _minLuminance = (double) (MinLuminanceInt * 0.0001);
                    return _minLuminance;
                }
            }
            private MdcvChromaticity _red;
            private MdcvChromaticity _green;
            private MdcvChromaticity _blue;
            private MdcvChromaticity _whitePoint;
            private uint _maxLuminanceInt;
            private uint _minLuminanceInt;
            private Png m_root;
            private Png.Chunk m_parent;
            public MdcvChromaticity Red { get { return _red; } }
            public MdcvChromaticity Green { get { return _green; } }
            public MdcvChromaticity Blue { get { return _blue; } }
            public MdcvChromaticity WhitePoint { get { return _whitePoint; } }
            public uint MaxLuminanceInt { get { return _maxLuminanceInt; } }
            public uint MinLuminanceInt { get { return _minLuminanceInt; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Physical pixel dimensions (`pHYs`) chunk specifies the intended physical
        /// size of the pixels (in meters) or pixel aspect ratio for display of the
        /// image.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#11pHYs">Source</a>
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
                f_dotsPerInchX = false;
                f_dotsPerInchY = false;
                _read();
            }
            private void _read()
            {
                _pixelsPerUnitX = m_io.ReadU4be();
                _pixelsPerUnitY = m_io.ReadU4be();
                _unit = ((Png.PhysUnit) m_io.ReadU1());
                if (!Enum.IsDefined(typeof(PhysUnit), _unit))
                {
                    throw new ValidationNotInEnumError(_unit, m_io, "/types/phys_chunk/seq/2");
                }
            }
            private bool f_dotsPerInchX;
            private double? _dotsPerInchX;

            /// <summary>
            /// Horizontal resolution (DPI)
            /// </summary>
            public double? DotsPerInchX
            {
                get
                {
                    if (f_dotsPerInchX)
                        return _dotsPerInchX;
                    f_dotsPerInchX = true;
                    if (Unit == Png.PhysUnit.Meter) {
                        _dotsPerInchX = (double) (PixelsPerUnitX * 0.0254);
                    }
                    return _dotsPerInchX;
                }
            }
            private bool f_dotsPerInchY;
            private double? _dotsPerInchY;

            /// <summary>
            /// Vertical resolution (DPI)
            /// </summary>
            public double? DotsPerInchY
            {
                get
                {
                    if (f_dotsPerInchY)
                        return _dotsPerInchY;
                    f_dotsPerInchY = true;
                    if (Unit == Png.PhysUnit.Meter) {
                        _dotsPerInchY = (double) (PixelsPerUnitY * 0.0254);
                    }
                    return _dotsPerInchY;
                }
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

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#11PLTE">Source</a>
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

        /// <summary>
        /// Significant bits (`sBIT`) chunk stores the original number of significant
        /// bits of the sample values (which can be less than or equal to the sample
        /// depth). This allows PNG decoders to recover the original data losslessly
        /// even if the data had a sample depth not directly supported by PNG.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#11sBIT">Source</a>
        /// </remarks>
        public partial class SbitChunk : KaitaiStruct
        {
            public static SbitChunk FromFile(string fileName)
            {
                return new SbitChunk(new KaitaiStream(fileName));
            }

            public SbitChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_sampleDepth = false;
                _read();
            }
            private void _read()
            {
                switch (M_Root.Ihdr.ColorType) {
                case Png.ColorType.Greyscale: {
                    _significantBits = new SbitGreyscale(false, m_io, this, m_root);
                    break;
                }
                case Png.ColorType.GreyscaleAlpha: {
                    _significantBits = new SbitGreyscale(true, m_io, this, m_root);
                    break;
                }
                case Png.ColorType.Indexed: {
                    _significantBits = new SbitTruecolor(false, m_io, this, m_root);
                    break;
                }
                case Png.ColorType.Truecolor: {
                    _significantBits = new SbitTruecolor(false, m_io, this, m_root);
                    break;
                }
                case Png.ColorType.TruecolorAlpha: {
                    _significantBits = new SbitTruecolor(true, m_io, this, m_root);
                    break;
                }
                }
            }
            private bool f_sampleDepth;
            private byte _sampleDepth;
            public byte SampleDepth
            {
                get
                {
                    if (f_sampleDepth)
                        return _sampleDepth;
                    f_sampleDepth = true;
                    _sampleDepth = (byte) ((M_Root.Ihdr.ColorType == Png.ColorType.Indexed ? 8 : M_Root.Ihdr.BitDepth));
                    return _sampleDepth;
                }
            }
            private KaitaiStruct _significantBits;
            private Png m_root;
            private Png.Chunk m_parent;
            public KaitaiStruct SignificantBits { get { return _significantBits; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }
        public partial class SbitGreyscale : KaitaiStruct
        {
            public SbitGreyscale(bool p_hasAlpha, KaitaiStream p__io, Png.SbitChunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _hasAlpha = p_hasAlpha;
                _read();
            }
            private void _read()
            {
                _grey = m_io.ReadU1();
                if (!(_grey >= 1))
                {
                    throw new ValidationLessThanError(1, _grey, m_io, "/types/sbit_greyscale/seq/0");
                }
                if (!(_grey <= M_Parent.SampleDepth))
                {
                    throw new ValidationGreaterThanError(M_Parent.SampleDepth, _grey, m_io, "/types/sbit_greyscale/seq/0");
                }
                if (HasAlpha) {
                    _alpha = m_io.ReadU1();
                    if (!(_alpha >= 1))
                    {
                        throw new ValidationLessThanError(1, _alpha, m_io, "/types/sbit_greyscale/seq/1");
                    }
                    if (!(_alpha <= M_Parent.SampleDepth))
                    {
                        throw new ValidationGreaterThanError(M_Parent.SampleDepth, _alpha, m_io, "/types/sbit_greyscale/seq/1");
                    }
                }
            }
            private byte _grey;
            private byte? _alpha;
            private bool _hasAlpha;
            private Png m_root;
            private Png.SbitChunk m_parent;
            public byte Grey { get { return _grey; } }
            public byte? Alpha { get { return _alpha; } }
            public bool HasAlpha { get { return _hasAlpha; } }
            public Png M_Root { get { return m_root; } }
            public Png.SbitChunk M_Parent { get { return m_parent; } }
        }
        public partial class SbitTruecolor : KaitaiStruct
        {
            public SbitTruecolor(bool p_hasAlpha, KaitaiStream p__io, Png.SbitChunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _hasAlpha = p_hasAlpha;
                _read();
            }
            private void _read()
            {
                _red = m_io.ReadU1();
                if (!(_red >= 1))
                {
                    throw new ValidationLessThanError(1, _red, m_io, "/types/sbit_truecolor/seq/0");
                }
                if (!(_red <= M_Parent.SampleDepth))
                {
                    throw new ValidationGreaterThanError(M_Parent.SampleDepth, _red, m_io, "/types/sbit_truecolor/seq/0");
                }
                _green = m_io.ReadU1();
                if (!(_green >= 1))
                {
                    throw new ValidationLessThanError(1, _green, m_io, "/types/sbit_truecolor/seq/1");
                }
                if (!(_green <= M_Parent.SampleDepth))
                {
                    throw new ValidationGreaterThanError(M_Parent.SampleDepth, _green, m_io, "/types/sbit_truecolor/seq/1");
                }
                _blue = m_io.ReadU1();
                if (!(_blue >= 1))
                {
                    throw new ValidationLessThanError(1, _blue, m_io, "/types/sbit_truecolor/seq/2");
                }
                if (!(_blue <= M_Parent.SampleDepth))
                {
                    throw new ValidationGreaterThanError(M_Parent.SampleDepth, _blue, m_io, "/types/sbit_truecolor/seq/2");
                }
                if (HasAlpha) {
                    _alpha = m_io.ReadU1();
                    if (!(_alpha >= 1))
                    {
                        throw new ValidationLessThanError(1, _alpha, m_io, "/types/sbit_truecolor/seq/3");
                    }
                    if (!(_alpha <= M_Parent.SampleDepth))
                    {
                        throw new ValidationGreaterThanError(M_Parent.SampleDepth, _alpha, m_io, "/types/sbit_truecolor/seq/3");
                    }
                }
            }
            private byte _red;
            private byte _green;
            private byte _blue;
            private byte? _alpha;
            private bool _hasAlpha;
            private Png m_root;
            private Png.SbitChunk m_parent;
            public byte Red { get { return _red; } }
            public byte Green { get { return _green; } }
            public byte Blue { get { return _blue; } }
            public byte? Alpha { get { return _alpha; } }
            public bool HasAlpha { get { return _hasAlpha; } }
            public Png M_Root { get { return m_root; } }
            public Png.SbitChunk M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Suggested palette (`sPLT`) chunk.
        /// 
        /// Multiple `sPLT` chunks are permitted, but each must have a different
        /// palette name.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#11sPLT">Source</a>
        /// </remarks>
        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#12Suggested-palettes">Source</a>
        /// </remarks>
        public partial class SpltChunk : KaitaiStruct
        {
            public static SpltChunk FromFile(string fileName)
            {
                return new SpltChunk(new KaitaiStream(fileName));
            }

            public SpltChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _paletteName = System.Text.Encoding.GetEncoding("ISO-8859-1").GetString(m_io.ReadBytesTerm(0, false, true, true));
                _sampleDepth = m_io.ReadU1();
                if (!( ((_sampleDepth == 8) || (_sampleDepth == 16)) ))
                {
                    throw new ValidationNotAnyOfError(_sampleDepth, m_io, "/types/splt_chunk/seq/1");
                }
                _entries = new List<SpltEntry>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(new SpltEntry(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private string _paletteName;
            private byte _sampleDepth;
            private List<SpltEntry> _entries;
            private Png m_root;
            private Png.Chunk m_parent;

            /// <summary>
            /// Any convenient name for referring to the palette. It is
            /// case-sensitive. The palette name may aid the choice of the appropriate
            /// suggested palette when more than one appears in a PNG datastream.
            /// 
            /// Palette names must contain only printable ISO-8859-1 (Latin-1)
            /// characters and spaces; that is, only code points 0x20-0x7E and
            /// 0xA1-0xFF are allowed. Leading, trailing, and consecutive spaces are
            /// not permitted.
            /// </summary>
            public string PaletteName { get { return _paletteName; } }
            public byte SampleDepth { get { return _sampleDepth; } }

            /// <summary>
            /// There may be any number of entries. Entries must appear &quot;in decreasing
            /// order of frequency&quot; (note: strictly speaking, I think the W3C
            /// specification actually meant &quot;non-increasing&quot;). There is no
            /// requirement that the entries all be used by the image, nor that they
            /// all be different.
            /// 
            /// The color samples are not premultiplied by alpha, nor are they
            /// precomposited against any background.
            /// 
            /// Entries in `sPLT` use the same gamma value and chromaticity values as
            /// the PNG image, but may fall outside the range of values used in the
            /// color space of the PNG image; for example, in a greyscale PNG image,
            /// each `sPLT` entry would typically have equal red, green, and blue
            /// values, but this is not required. Similarly, `sPLT` entries can have
            /// non-opaque alpha values even when the PNG image does not use
            /// transparency.
            /// </summary>
            public List<SpltEntry> Entries { get { return _entries; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }
        public partial class SpltEntry : KaitaiStruct
        {
            public static SpltEntry FromFile(string fileName)
            {
                return new SpltEntry(new KaitaiStream(fileName));
            }

            public SpltEntry(KaitaiStream p__io, Png.SpltChunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                switch (M_Parent.SampleDepth) {
                case 8: {
                    _red = m_io.ReadU1();
                    break;
                }
                default: {
                    _red = m_io.ReadU2be();
                    break;
                }
                }
                switch (M_Parent.SampleDepth) {
                case 8: {
                    _green = m_io.ReadU1();
                    break;
                }
                default: {
                    _green = m_io.ReadU2be();
                    break;
                }
                }
                switch (M_Parent.SampleDepth) {
                case 8: {
                    _blue = m_io.ReadU1();
                    break;
                }
                default: {
                    _blue = m_io.ReadU2be();
                    break;
                }
                }
                switch (M_Parent.SampleDepth) {
                case 8: {
                    _alpha = m_io.ReadU1();
                    break;
                }
                default: {
                    _alpha = m_io.ReadU2be();
                    break;
                }
                }
                _freq = m_io.ReadU2be();
            }
            private ushort _red;
            private ushort _green;
            private ushort _blue;
            private ushort _alpha;
            private ushort _freq;
            private Png m_root;
            private Png.SpltChunk m_parent;
            public ushort Red { get { return _red; } }
            public ushort Green { get { return _green; } }
            public ushort Blue { get { return _blue; } }

            /// <summary>
            /// An alpha value of 0 means fully transparent. An alpha value of 255
            /// (when `_parent.sample_depth` is 8) or 65535 (when
            /// `_parent.sample_depth` is 16) means fully opaque.
            /// </summary>
            public ushort Alpha { get { return _alpha; } }

            /// <summary>
            /// Each frequency value is proportional to the fraction of the pixels in
            /// the image for which that palette entry is the closest match in RGBA
            /// space, before the image has been composited against any background.
            /// 
            /// The exact scale factor is chosen by the PNG encoder; it is recommended
            /// that the resulting range of individual values reasonably fills the
            /// range 0 to 65535.
            /// 
            /// Zero is a valid frequency meaning that the color is &quot;least important&quot;
            /// or that it is rarely, if ever, used. When all the frequencies are
            /// zero, they are meaningless, that is to say, nothing may be inferred
            /// about the actual frequencies with which the colors appear in the PNG
            /// image.
            /// </summary>
            public ushort Freq { get { return _freq; } }
            public Png M_Root { get { return m_root; } }
            public Png.SpltChunk M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#11sRGB">Source</a>
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
                if (!Enum.IsDefined(typeof(Intent), _renderIntent))
                {
                    throw new ValidationNotInEnumError(_renderIntent, m_io, "/types/srgb_chunk/seq/0");
                }
            }
            private Intent _renderIntent;
            private Png m_root;
            private Png.Chunk m_parent;
            public Intent RenderIntent { get { return _renderIntent; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Textual data (`tEXt`) chunk effectively allows you to store key-value
        /// string pairs in the PNG container.
        /// 
        /// Both the &quot;key&quot; (`keyword`) and &quot;value&quot; (`text`) parts are restricted to
        /// printable ISO-8859-1 (Latin-1) characters and ASCII spaces, with the
        /// exception that `text` can also contain newlines (U+000A LINE FEED (LF)
        /// characters) and U+00A0 NON-BREAKING SPACE characters.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#11tEXt">Source</a>
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
                _keyword = System.Text.Encoding.GetEncoding("ISO-8859-1").GetString(m_io.ReadBytesTerm(0, false, true, true));
                _text = System.Text.Encoding.GetEncoding("ISO-8859-1").GetString(m_io.ReadBytesFull());
            }
            private string _keyword;
            private string _text;
            private Png m_root;
            private Png.Chunk m_parent;

            /// <summary>
            /// Indicates the type of information represented by the text string.
            /// 
            /// Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
            /// characters and spaces; that is, only code points 0x20-0x7E and
            /// 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
            /// keyword, leading spaces, trailing spaces, and consecutive spaces are
            /// not permitted.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://www.w3.org/TR/2025/REC-png-3-20250624/#11keywords">Source</a>
            /// </remarks>
            public string Keyword { get { return _keyword; } }

            /// <summary>
            /// Text string (the &quot;value&quot; of this key-value pair).
            /// 
            /// Although it is not null-terminated (unlike the keyword), it must not
            /// contain a zero byte (U+0000 NULL character). A newline should be
            /// represented by a single U+000A LINE FEED (LF) character (aka `\n`).
            /// The remaining control characters (U+0001..U+0009, U+000B..0+001F,
            /// U+007F..U+009F) are discouraged.
            /// </summary>
            public string Text { get { return _text; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Time chunk stores time stamp of last modification of this image,
        /// up to 1 second precision in UTC timezone.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#11tIME">Source</a>
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

        /// <summary>
        /// Transparency (`tRNS`) chunk specifies either alpha values that are
        /// associated with palette entries (for indexed-color images) or a single
        /// transparent color (for greyscale and truecolor images).
        /// 
        /// A `tRNS` chunk must not appear for color types
        /// `color_type::greyscale_alpha` = 4 and `color_type::truecolor_alpha` = 6,
        /// since a full alpha channel is already present in those cases.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://www.w3.org/TR/png/#11tRNS">Source</a>
        /// </remarks>
        public partial class TrnsChunk : KaitaiStruct
        {
            public static TrnsChunk FromFile(string fileName)
            {
                return new TrnsChunk(new KaitaiStream(fileName));
            }

            public TrnsChunk(KaitaiStream p__io, Png.Chunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_sampleMask = false;
                _read();
            }
            private void _read()
            {
                if (M_Root.Ihdr.ColorType == Png.ColorType.Indexed) {
                    _paletteAlphas = new List<byte>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _paletteAlphas.Add(m_io.ReadU1());
                            i++;
                        }
                    }
                }
                switch (M_Root.Ihdr.ColorType) {
                case Png.ColorType.Greyscale: {
                    _transparentColor = new TrnsGreyscaleColor(m_io, this, m_root);
                    break;
                }
                case Png.ColorType.Truecolor: {
                    _transparentColor = new TrnsTruecolorColor(m_io, this, m_root);
                    break;
                }
                }
            }
            private bool f_sampleMask;
            private int _sampleMask;
            public int SampleMask
            {
                get
                {
                    if (f_sampleMask)
                        return _sampleMask;
                    f_sampleMask = true;
                    _sampleMask = (int) ((1 << M_Root.Ihdr.BitDepth) - 1);
                    return _sampleMask;
                }
            }
            private List<byte> _paletteAlphas;
            private KaitaiStruct _transparentColor;
            private Png m_root;
            private Png.Chunk m_parent;

            /// <summary>
            /// Alpha values associated with palette entries in the `PLTE` chunk.
            /// 
            /// Each entry indicates that pixels of the corresponding palette index
            /// shall be treated as having the specified alpha value. Alpha values
            /// have the same interpretation as in an 8-bit full alpha channel: 0 is
            /// fully transparent, 255 is fully opaque, regardless of image bit depth.
            /// 
            /// The `tRNS` chunk must not contain more alpha values than there are
            /// palette entries, but it may contain fewer values than there are
            /// palette entries. In this case, the alpha value for all remaining
            /// palette entries is assumed to be 255. If all palette indices are
            /// opaque, the `tRNS` chunk may be omitted.
            /// </summary>
            public List<byte> PaletteAlphas { get { return _paletteAlphas; } }

            /// <summary>
            /// Pixels of the specified grey sample value or RGB sample values are
            /// treated as transparent (equivalent to alpha value 0); all other pixels
            /// are to be treated as fully opaque (alpha value `2^{bitdepth} - 1`).
            /// 
            /// If the image bit depth is less than 16, the least significant bits of
            /// these sample values are used. Encoders should set the other bits to 0,
            /// and decoders must mask the other bits to 0 before the value is used.
            /// 
            /// Note: in this Kaitai Struct implementation, the bitmask used to
            /// implement this masking is stored in the value instance `sample_mask`.
            /// </summary>
            public KaitaiStruct TransparentColor { get { return _transparentColor; } }
            public Png M_Root { get { return m_root; } }
            public Png.Chunk M_Parent { get { return m_parent; } }
        }
        public partial class TrnsGreyscaleColor : KaitaiStruct
        {
            public static TrnsGreyscaleColor FromFile(string fileName)
            {
                return new TrnsGreyscaleColor(new KaitaiStream(fileName));
            }

            public TrnsGreyscaleColor(KaitaiStream p__io, Png.TrnsChunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_grey = false;
                _read();
            }
            private void _read()
            {
                _greyRaw = m_io.ReadU2be();
            }
            private bool f_grey;
            private int _grey;
            public int Grey
            {
                get
                {
                    if (f_grey)
                        return _grey;
                    f_grey = true;
                    _grey = (int) (GreyRaw & M_Parent.SampleMask);
                    return _grey;
                }
            }
            private ushort _greyRaw;
            private Png m_root;
            private Png.TrnsChunk m_parent;
            public ushort GreyRaw { get { return _greyRaw; } }
            public Png M_Root { get { return m_root; } }
            public Png.TrnsChunk M_Parent { get { return m_parent; } }
        }
        public partial class TrnsTruecolorColor : KaitaiStruct
        {
            public static TrnsTruecolorColor FromFile(string fileName)
            {
                return new TrnsTruecolorColor(new KaitaiStream(fileName));
            }

            public TrnsTruecolorColor(KaitaiStream p__io, Png.TrnsChunk p__parent = null, Png p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_blue = false;
                f_green = false;
                f_red = false;
                _read();
            }
            private void _read()
            {
                _redRaw = m_io.ReadU2be();
                _greenRaw = m_io.ReadU2be();
                _blueRaw = m_io.ReadU2be();
            }
            private bool f_blue;
            private int _blue;
            public int Blue
            {
                get
                {
                    if (f_blue)
                        return _blue;
                    f_blue = true;
                    _blue = (int) (BlueRaw & M_Parent.SampleMask);
                    return _blue;
                }
            }
            private bool f_green;
            private int _green;
            public int Green
            {
                get
                {
                    if (f_green)
                        return _green;
                    f_green = true;
                    _green = (int) (GreenRaw & M_Parent.SampleMask);
                    return _green;
                }
            }
            private bool f_red;
            private int _red;
            public int Red
            {
                get
                {
                    if (f_red)
                        return _red;
                    f_red = true;
                    _red = (int) (RedRaw & M_Parent.SampleMask);
                    return _red;
                }
            }
            private ushort _redRaw;
            private ushort _greenRaw;
            private ushort _blueRaw;
            private Png m_root;
            private Png.TrnsChunk m_parent;
            public ushort RedRaw { get { return _redRaw; } }
            public ushort GreenRaw { get { return _greenRaw; } }
            public ushort BlueRaw { get { return _blueRaw; } }
            public Png M_Root { get { return m_root; } }
            public Png.TrnsChunk M_Parent { get { return m_parent; } }
        }
        private byte[] _magic;
        private uint _ihdrLen;
        private byte[] _ihdrType;
        private IhdrChunk _ihdr;
        private uint _ihdrCrc;
        private List<Chunk> _chunks;
        private Png m_root;
        private KaitaiStruct m_parent;
        public byte[] Magic { get { return _magic; } }
        public uint IhdrLen { get { return _ihdrLen; } }
        public byte[] IhdrType { get { return _ihdrType; } }
        public IhdrChunk Ihdr { get { return _ihdr; } }
        public uint IhdrCrc { get { return _ihdrCrc; } }
        public List<Chunk> Chunks { get { return _chunks; } }
        public Png M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
