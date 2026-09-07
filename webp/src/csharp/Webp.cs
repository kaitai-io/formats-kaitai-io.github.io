// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System;
using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://developers.google.com/speed/webp/docs/riff_container">Source</a>
    /// </remarks>
    public partial class Webp : KaitaiStruct
    {
        public static Webp FromFile(string fileName)
        {
            return new Webp(new KaitaiStream(fileName));
        }


        public enum ChunkNames
        {
            XmpVar = 5262680,
            Vp8 = 540561494,
            Xmp = 542133592,
            Exif = 1179211845,
            Anmf = 1179471425,
            Alph = 1213221953,
            Vp8l = 1278758998,
            Frgm = 1296519750,
            Anim = 1296649793,
            Iccp = 1346585417,
            Vp8x = 1480085590,
        }

        public enum CompressionMethod
        {
            None = 0,
            WebpLossless = 1,
        }

        public enum FilteringMethod
        {
            None = 0,
            Horizontal = 1,
            Vertical = 2,
            Gradient = 3,
        }

        public enum Preprocessing
        {
            None = 0,
            LevelReduction = 1,
        }
        public Webp(KaitaiStream p__io, KaitaiStruct p__parent = null, Webp p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 82, 73, 70, 70 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 82, 73, 70, 70 }, _magic, m_io, "/seq/0");
            }
            _lenData = m_io.ReadU4le();
            _webp = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(_webp, new byte[] { 87, 69, 66, 80 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 87, 69, 66, 80 }, _webp, m_io, "/seq/2");
            }
            __raw_payload = m_io.ReadBytes(LenData - 4);
            var io___raw_payload = new KaitaiStream(__raw_payload);
            _payload = new Chunks(io___raw_payload, this, m_root);
        }
        public partial class Alph : KaitaiStruct
        {
            public static Alph FromFile(string fileName)
            {
                return new Alph(new KaitaiStream(fileName));
            }

            public Alph(KaitaiStream p__io, Webp.Chunk p__parent = null, Webp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _reserved = m_io.ReadBitsIntBe(2);
                if (!(_reserved == 0))
                {
                    throw new ValidationNotEqualError(0, _reserved, m_io, "/types/alph/seq/0");
                }
                _preprocessing = ((Webp.Preprocessing) m_io.ReadBitsIntBe(2));
                if (!Enum.IsDefined(typeof(Preprocessing), _preprocessing))
                {
                    throw new ValidationNotInEnumError(_preprocessing, m_io, "/types/alph/seq/1");
                }
                _filtering = ((Webp.FilteringMethod) m_io.ReadBitsIntBe(2));
                _compression = ((Webp.CompressionMethod) m_io.ReadBitsIntBe(2));
                if (!Enum.IsDefined(typeof(CompressionMethod), _compression))
                {
                    throw new ValidationNotInEnumError(_compression, m_io, "/types/alph/seq/3");
                }
                m_io.AlignToByte();
                _data = m_io.ReadBytesFull();
            }
            private ulong _reserved;
            private Preprocessing _preprocessing;
            private FilteringMethod _filtering;
            private CompressionMethod _compression;
            private byte[] _data;
            private Webp m_root;
            private Webp.Chunk m_parent;
            public ulong Reserved { get { return _reserved; } }
            public Preprocessing Preprocessing { get { return _preprocessing; } }
            public FilteringMethod Filtering { get { return _filtering; } }
            public CompressionMethod Compression { get { return _compression; } }
            public byte[] Data { get { return _data; } }
            public Webp M_Root { get { return m_root; } }
            public Webp.Chunk M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://developers.google.com/speed/webp/docs/riff_container#animation">Source</a>
        /// </remarks>
        public partial class Anim : KaitaiStruct
        {
            public static Anim FromFile(string fileName)
            {
                return new Anim(new KaitaiStream(fileName));
            }

            public Anim(KaitaiStream p__io, Webp.Chunk p__parent = null, Webp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _backgroundColor = new BgColor(m_io, this, m_root);
                _loopCount = m_io.ReadU2le();
            }
            public partial class BgColor : KaitaiStruct
            {
                public static BgColor FromFile(string fileName)
                {
                    return new BgColor(new KaitaiStream(fileName));
                }

                public BgColor(KaitaiStream p__io, Webp.Anim p__parent = null, Webp p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _blue = m_io.ReadU1();
                    _green = m_io.ReadU1();
                    _red = m_io.ReadU1();
                    _alpha = m_io.ReadU1();
                }
                private byte _blue;
                private byte _green;
                private byte _red;
                private byte _alpha;
                private Webp m_root;
                private Webp.Anim m_parent;
                public byte Blue { get { return _blue; } }
                public byte Green { get { return _green; } }
                public byte Red { get { return _red; } }
                public byte Alpha { get { return _alpha; } }
                public Webp M_Root { get { return m_root; } }
                public Webp.Anim M_Parent { get { return m_parent; } }
            }
            private BgColor _backgroundColor;
            private ushort _loopCount;
            private Webp m_root;
            private Webp.Chunk m_parent;
            public BgColor BackgroundColor { get { return _backgroundColor; } }
            public ushort LoopCount { get { return _loopCount; } }
            public Webp M_Root { get { return m_root; } }
            public Webp.Chunk M_Parent { get { return m_parent; } }
        }
        public partial class Anmf : KaitaiStruct
        {
            public static Anmf FromFile(string fileName)
            {
                return new Anmf(new KaitaiStream(fileName));
            }

            public Anmf(KaitaiStream p__io, Webp.Chunk p__parent = null, Webp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_frameHeight = false;
                f_frameWidth = false;
                f_frameX = false;
                f_frameY = false;
                _read();
            }
            private void _read()
            {
                _frameXDiv2 = m_io.ReadBitsIntLe(24);
                _frameYDiv2 = m_io.ReadBitsIntLe(24);
                _frameWidthMinus1 = m_io.ReadBitsIntLe(24);
                _frameHeightMinus1 = m_io.ReadBitsIntLe(24);
                _duration = m_io.ReadBitsIntLe(24);
                _reserved = m_io.ReadBitsIntBe(6);
                if (!(_reserved == 0))
                {
                    throw new ValidationNotEqualError(0, _reserved, m_io, "/types/anmf/seq/5");
                }
                _blendingMethod = m_io.ReadBitsIntBe(1) != 0;
                _disposalMethod = m_io.ReadBitsIntBe(1) != 0;
                m_io.AlignToByte();
                _data = m_io.ReadBytesFull();
            }
            private bool f_frameHeight;
            private int _frameHeight;
            public int FrameHeight
            {
                get
                {
                    if (f_frameHeight)
                        return _frameHeight;
                    f_frameHeight = true;
                    _frameHeight = (int) (FrameHeightMinus1 + 1);
                    return _frameHeight;
                }
            }
            private bool f_frameWidth;
            private int _frameWidth;
            public int FrameWidth
            {
                get
                {
                    if (f_frameWidth)
                        return _frameWidth;
                    f_frameWidth = true;
                    _frameWidth = (int) (FrameWidthMinus1 + 1);
                    return _frameWidth;
                }
            }
            private bool f_frameX;
            private int _frameX;
            public int FrameX
            {
                get
                {
                    if (f_frameX)
                        return _frameX;
                    f_frameX = true;
                    _frameX = (int) (FrameXDiv2 * 2);
                    return _frameX;
                }
            }
            private bool f_frameY;
            private int _frameY;
            public int FrameY
            {
                get
                {
                    if (f_frameY)
                        return _frameY;
                    f_frameY = true;
                    _frameY = (int) (FrameYDiv2 * 2);
                    return _frameY;
                }
            }
            private ulong _frameXDiv2;
            private ulong _frameYDiv2;
            private ulong _frameWidthMinus1;
            private ulong _frameHeightMinus1;
            private ulong _duration;
            private ulong _reserved;
            private bool _blendingMethod;
            private bool _disposalMethod;
            private byte[] _data;
            private Webp m_root;
            private Webp.Chunk m_parent;
            public ulong FrameXDiv2 { get { return _frameXDiv2; } }
            public ulong FrameYDiv2 { get { return _frameYDiv2; } }
            public ulong FrameWidthMinus1 { get { return _frameWidthMinus1; } }
            public ulong FrameHeightMinus1 { get { return _frameHeightMinus1; } }
            public ulong Duration { get { return _duration; } }
            public ulong Reserved { get { return _reserved; } }
            public bool BlendingMethod { get { return _blendingMethod; } }
            public bool DisposalMethod { get { return _disposalMethod; } }
            public byte[] Data { get { return _data; } }
            public Webp M_Root { get { return m_root; } }
            public Webp.Chunk M_Parent { get { return m_parent; } }
        }
        public partial class Chunk : KaitaiStruct
        {
            public static Chunk FromFile(string fileName)
            {
                return new Chunk(new KaitaiStream(fileName));
            }

            public Chunk(KaitaiStream p__io, Webp.Chunks p__parent = null, Webp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _name = ((Webp.ChunkNames) m_io.ReadU4le());
                if (!Enum.IsDefined(typeof(ChunkNames), _name))
                {
                    throw new ValidationNotInEnumError(_name, m_io, "/types/chunk/seq/0");
                }
                _lenData = m_io.ReadU4le();
                switch (Name) {
                case Webp.ChunkNames.Alph: {
                    __raw_data = m_io.ReadBytes(LenData);
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new Alph(io___raw_data, this, m_root);
                    break;
                }
                case Webp.ChunkNames.Anim: {
                    __raw_data = m_io.ReadBytes(LenData);
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new Anim(io___raw_data, this, m_root);
                    break;
                }
                case Webp.ChunkNames.Anmf: {
                    __raw_data = m_io.ReadBytes(LenData);
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new Anmf(io___raw_data, this, m_root);
                    break;
                }
                case Webp.ChunkNames.Vp8: {
                    __raw_data = m_io.ReadBytes(LenData);
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new Vp8(io___raw_data, this, m_root);
                    break;
                }
                case Webp.ChunkNames.Vp8l: {
                    __raw_data = m_io.ReadBytes(LenData);
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new Vp8l(io___raw_data, this, m_root);
                    break;
                }
                case Webp.ChunkNames.Vp8x: {
                    __raw_data = m_io.ReadBytes(LenData);
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new Vp8x(io___raw_data, this, m_root);
                    break;
                }
                case Webp.ChunkNames.Xmp: {
                    __raw_data = m_io.ReadBytes(LenData);
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new Xmp(io___raw_data, this, m_root);
                    break;
                }
                case Webp.ChunkNames.XmpVar: {
                    __raw_data = m_io.ReadBytes(LenData);
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new Xmp(io___raw_data, this, m_root);
                    break;
                }
                default: {
                    _data = m_io.ReadBytes(LenData);
                    break;
                }
                }
                if (KaitaiStream.Mod(LenData, 2) != 0) {
                    _padding = m_io.ReadBytes(1);
                    if (!((KaitaiStream.ByteArrayCompare(_padding, new byte[] { 0 }) == 0)))
                    {
                        throw new ValidationNotEqualError(new byte[] { 0 }, _padding, m_io, "/types/chunk/seq/3");
                    }
                }
            }
            private ChunkNames _name;
            private uint _lenData;
            private object _data;
            private byte[] _padding;
            private Webp m_root;
            private Webp.Chunks m_parent;
            private byte[] __raw_data;
            public ChunkNames Name { get { return _name; } }
            public uint LenData { get { return _lenData; } }
            public object Data { get { return _data; } }
            public byte[] Padding { get { return _padding; } }
            public Webp M_Root { get { return m_root; } }
            public Webp.Chunks M_Parent { get { return m_parent; } }
            public byte[] M_RawData { get { return __raw_data; } }
        }
        public partial class Chunks : KaitaiStruct
        {
            public static Chunks FromFile(string fileName)
            {
                return new Chunks(new KaitaiStream(fileName));
            }

            public Chunks(KaitaiStream p__io, Webp p__parent = null, Webp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _chunks = new List<Chunk>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _chunks.Add(new Chunk(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<Chunk> _chunks;
            private Webp m_root;
            private Webp m_parent;
            public List<Chunk> Chunks { get { return _chunks; } }
            public Webp M_Root { get { return m_root; } }
            public Webp M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.rfc-editor.org/rfc/rfc6386#section-9.1">Source</a>
        /// </remarks>
        public partial class Vp8 : KaitaiStruct
        {
            public static Vp8 FromFile(string fileName)
            {
                return new Vp8(new KaitaiStream(fileName));
            }

            public Vp8(KaitaiStream p__io, Webp.Chunk p__parent = null, Webp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _frameType = m_io.ReadBitsIntLe(1) != 0;
                if (!(_frameType == false))
                {
                    throw new ValidationNotEqualError(false, _frameType, m_io, "/types/vp8/seq/0");
                }
                _version = m_io.ReadBitsIntLe(3);
                if (!(_version <= 3))
                {
                    throw new ValidationGreaterThanError(3, _version, m_io, "/types/vp8/seq/1");
                }
                _showFrame = m_io.ReadBitsIntLe(1) != 0;
                _lenFirstPartition = m_io.ReadBitsIntLe(19);
                m_io.AlignToByte();
                _startCode = m_io.ReadBytes(3);
                if (!((KaitaiStream.ByteArrayCompare(_startCode, new byte[] { 157, 1, 42 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 157, 1, 42 }, _startCode, m_io, "/types/vp8/seq/4");
                }
                _width = m_io.ReadBitsIntLe(14);
                _horizontalScale = m_io.ReadBitsIntLe(2);
                _height = m_io.ReadBitsIntLe(14);
                _verticalScale = m_io.ReadBitsIntLe(2);
                m_io.AlignToByte();
                _data = m_io.ReadBytesFull();
            }
            private bool _frameType;
            private ulong _version;
            private bool _showFrame;
            private ulong _lenFirstPartition;
            private byte[] _startCode;
            private ulong _width;
            private ulong _horizontalScale;
            private ulong _height;
            private ulong _verticalScale;
            private byte[] _data;
            private Webp m_root;
            private Webp.Chunk m_parent;
            public bool FrameType { get { return _frameType; } }
            public ulong Version { get { return _version; } }
            public bool ShowFrame { get { return _showFrame; } }
            public ulong LenFirstPartition { get { return _lenFirstPartition; } }
            public byte[] StartCode { get { return _startCode; } }
            public ulong Width { get { return _width; } }
            public ulong HorizontalScale { get { return _horizontalScale; } }
            public ulong Height { get { return _height; } }
            public ulong VerticalScale { get { return _verticalScale; } }
            public byte[] Data { get { return _data; } }
            public Webp M_Root { get { return m_root; } }
            public Webp.Chunk M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://developers.google.com/speed/webp/docs/webp_lossless_bitstream_specification">Source</a>
        /// </remarks>
        public partial class Vp8l : KaitaiStruct
        {
            public static Vp8l FromFile(string fileName)
            {
                return new Vp8l(new KaitaiStream(fileName));
            }

            public Vp8l(KaitaiStream p__io, Webp.Chunk p__parent = null, Webp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_imageHeight = false;
                f_imageWidth = false;
                _read();
            }
            private void _read()
            {
                _signature = m_io.ReadU1();
                if (!(_signature == 47))
                {
                    throw new ValidationNotEqualError(47, _signature, m_io, "/types/vp8l/seq/0");
                }
                _imageWidthMinus1 = m_io.ReadBitsIntLe(14);
                _imageHeightMinus1 = m_io.ReadBitsIntLe(14);
                _alphaIsUsed = m_io.ReadBitsIntLe(1) != 0;
                _versionNumber = m_io.ReadBitsIntLe(3);
                if (!(_versionNumber == 0))
                {
                    throw new ValidationNotEqualError(0, _versionNumber, m_io, "/types/vp8l/seq/4");
                }
                m_io.AlignToByte();
                _data = m_io.ReadBytesFull();
            }
            private bool f_imageHeight;
            private int _imageHeight;
            public int ImageHeight
            {
                get
                {
                    if (f_imageHeight)
                        return _imageHeight;
                    f_imageHeight = true;
                    _imageHeight = (int) (ImageHeightMinus1 + 1);
                    return _imageHeight;
                }
            }
            private bool f_imageWidth;
            private int _imageWidth;
            public int ImageWidth
            {
                get
                {
                    if (f_imageWidth)
                        return _imageWidth;
                    f_imageWidth = true;
                    _imageWidth = (int) (ImageWidthMinus1 + 1);
                    return _imageWidth;
                }
            }
            private byte _signature;
            private ulong _imageWidthMinus1;
            private ulong _imageHeightMinus1;
            private bool _alphaIsUsed;
            private ulong _versionNumber;
            private byte[] _data;
            private Webp m_root;
            private Webp.Chunk m_parent;
            public byte Signature { get { return _signature; } }
            public ulong ImageWidthMinus1 { get { return _imageWidthMinus1; } }
            public ulong ImageHeightMinus1 { get { return _imageHeightMinus1; } }

            /// <summary>
            /// A hint only - it should not impact decoding. It should be `false` when
            /// all alpha values are 255 in the picture, and `true` otherwise.
            /// </summary>
            public bool AlphaIsUsed { get { return _alphaIsUsed; } }
            public ulong VersionNumber { get { return _versionNumber; } }
            public byte[] Data { get { return _data; } }
            public Webp M_Root { get { return m_root; } }
            public Webp.Chunk M_Parent { get { return m_parent; } }
        }
        public partial class Vp8x : KaitaiStruct
        {
            public static Vp8x FromFile(string fileName)
            {
                return new Vp8x(new KaitaiStream(fileName));
            }

            public Vp8x(KaitaiStream p__io, Webp.Chunk p__parent = null, Webp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_canvasHeight = false;
                f_canvasWidth = false;
                _read();
            }
            private void _read()
            {
                _reserved1 = m_io.ReadBitsIntBe(2);
                if (!(_reserved1 == 0))
                {
                    throw new ValidationNotEqualError(0, _reserved1, m_io, "/types/vp8x/seq/0");
                }
                _iccProfile = m_io.ReadBitsIntBe(1) != 0;
                _alpha = m_io.ReadBitsIntBe(1) != 0;
                _exif = m_io.ReadBitsIntBe(1) != 0;
                _xmp = m_io.ReadBitsIntBe(1) != 0;
                _animation = m_io.ReadBitsIntBe(1) != 0;
                _reserved2 = m_io.ReadBitsIntBe(1) != 0;
                if (!(_reserved2 == false))
                {
                    throw new ValidationNotEqualError(false, _reserved2, m_io, "/types/vp8x/seq/6");
                }
                _reserved3 = m_io.ReadBitsIntBe(24);
                if (!(_reserved3 == 0))
                {
                    throw new ValidationNotEqualError(0, _reserved3, m_io, "/types/vp8x/seq/7");
                }
                _canvasWidthMinus1 = m_io.ReadBitsIntLe(24);
                _canvasHeightMinus1 = m_io.ReadBitsIntLe(24);
                if (!(_canvasHeightMinus1 <= 4294967295 / CanvasWidth - 1))
                {
                    throw new ValidationGreaterThanError(4294967295 / CanvasWidth - 1, _canvasHeightMinus1, m_io, "/types/vp8x/seq/9");
                }
            }
            private bool f_canvasHeight;
            private int _canvasHeight;
            public int CanvasHeight
            {
                get
                {
                    if (f_canvasHeight)
                        return _canvasHeight;
                    f_canvasHeight = true;
                    _canvasHeight = (int) (CanvasHeightMinus1 + 1);
                    return _canvasHeight;
                }
            }
            private bool f_canvasWidth;
            private int _canvasWidth;
            public int CanvasWidth
            {
                get
                {
                    if (f_canvasWidth)
                        return _canvasWidth;
                    f_canvasWidth = true;
                    _canvasWidth = (int) (CanvasWidthMinus1 + 1);
                    return _canvasWidth;
                }
            }
            private ulong _reserved1;
            private bool _iccProfile;
            private bool _alpha;
            private bool _exif;
            private bool _xmp;
            private bool _animation;
            private bool _reserved2;
            private ulong _reserved3;
            private ulong _canvasWidthMinus1;
            private ulong _canvasHeightMinus1;
            private Webp m_root;
            private Webp.Chunk m_parent;
            public ulong Reserved1 { get { return _reserved1; } }
            public bool IccProfile { get { return _iccProfile; } }
            public bool Alpha { get { return _alpha; } }
            public bool Exif { get { return _exif; } }
            public bool Xmp { get { return _xmp; } }
            public bool Animation { get { return _animation; } }
            public bool Reserved2 { get { return _reserved2; } }
            public ulong Reserved3 { get { return _reserved3; } }
            public ulong CanvasWidthMinus1 { get { return _canvasWidthMinus1; } }
            public ulong CanvasHeightMinus1 { get { return _canvasHeightMinus1; } }
            public Webp M_Root { get { return m_root; } }
            public Webp.Chunk M_Parent { get { return m_parent; } }
        }
        public partial class Xmp : KaitaiStruct
        {
            public static Xmp FromFile(string fileName)
            {
                return new Xmp(new KaitaiStream(fileName));
            }

            public Xmp(KaitaiStream p__io, Webp.Chunk p__parent = null, Webp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _data = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesFull());
            }
            private string _data;
            private Webp m_root;
            private Webp.Chunk m_parent;
            public string Data { get { return _data; } }
            public Webp M_Root { get { return m_root; } }
            public Webp.Chunk M_Parent { get { return m_parent; } }
        }
        private byte[] _magic;
        private uint _lenData;
        private byte[] _webp;
        private Chunks _payload;
        private Webp m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_payload;
        public byte[] Magic { get { return _magic; } }
        public uint LenData { get { return _lenData; } }
        public byte[] Webp { get { return _webp; } }
        public Chunks Payload { get { return _payload; } }
        public Webp M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawPayload { get { return __raw_payload; } }
    }
}
