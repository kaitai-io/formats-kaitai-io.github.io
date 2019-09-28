// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// SWF files are used by Adobe Flash (AKA Shockwave Flash, Macromedia
    /// Flash) to encode rich interactive multimedia content and are,
    /// essentially, a container for special bytecode instructions to play
    /// back that content. In early 2000s, it was dominant rich multimedia
    /// web format (.swf files were integrated into web pages and played
    /// back with a browser plugin), but its usage largely declined in
    /// 2010s, as HTML5 and performant browser-native solutions
    /// (i.e. JavaScript engines and graphical approaches, such as WebGL)
    /// emerged.
    /// 
    /// There are a lot of versions of SWF (~36), format is somewhat
    /// documented by Adobe.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://www.adobe.com/content/dam/acom/en/devnet/pdf/swf-file-format-spec.pdf">Source</a>
    /// </remarks>
    public partial class Swf : KaitaiStruct
    {
        public static Swf FromFile(string fileName)
        {
            return new Swf(new KaitaiStream(fileName));
        }


        public enum Compressions
        {
            Zlib = 67,
            None = 70,
            Lzma = 90,
        }

        public enum TagType
        {
            EndOfFile = 0,
            PlaceObject = 4,
            RemoveObject = 5,
            SetBackgroundColor = 9,
            DefineSound = 14,
            PlaceObject2 = 26,
            RemoveObject2 = 28,
            FrameLabel = 43,
            ExportAssets = 56,
            ScriptLimits = 65,
            FileAttributes = 69,
            PlaceObject3 = 70,
            SymbolClass = 76,
            Metadata = 77,
            DefineScalingGrid = 78,
            DoAbc = 82,
            DefineSceneAndFrameLabelData = 86,
        }
        public Swf(KaitaiStream p__io, KaitaiStruct p__parent = null, Swf p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _compression = ((Compressions) m_io.ReadU1());
            _signature = m_io.EnsureFixedContents(new byte[] { 87, 83 });
            _version = m_io.ReadU1();
            _lenFile = m_io.ReadU4le();
            if (Compression == Compressions.None) {
                __raw_plainBody = m_io.ReadBytesFull();
                var io___raw_plainBody = new KaitaiStream(__raw_plainBody);
                _plainBody = new SwfBody(io___raw_plainBody, this, m_root);
            }
            if (Compression == Compressions.Zlib) {
                __raw__raw_zlibBody = m_io.ReadBytesFull();
                __raw_zlibBody = m_io.ProcessZlib(__raw__raw_zlibBody);
                var io___raw_zlibBody = new KaitaiStream(__raw_zlibBody);
                _zlibBody = new SwfBody(io___raw_zlibBody, this, m_root);
            }
        }
        public partial class Rgb : KaitaiStruct
        {
            public static Rgb FromFile(string fileName)
            {
                return new Rgb(new KaitaiStream(fileName));
            }

            public Rgb(KaitaiStream p__io, Swf.Tag p__parent = null, Swf p__root = null) : base(p__io)
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
            private Swf m_root;
            private Swf.Tag m_parent;
            public byte R { get { return _r; } }
            public byte G { get { return _g; } }
            public byte B { get { return _b; } }
            public Swf M_Root { get { return m_root; } }
            public Swf.Tag M_Parent { get { return m_parent; } }
        }
        public partial class DoAbcBody : KaitaiStruct
        {
            public static DoAbcBody FromFile(string fileName)
            {
                return new DoAbcBody(new KaitaiStream(fileName));
            }

            public DoAbcBody(KaitaiStream p__io, Swf.Tag p__parent = null, Swf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _flags = m_io.ReadU4le();
                _name = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(0, false, true, true));
                _abcdata = m_io.ReadBytesFull();
            }
            private uint _flags;
            private string _name;
            private byte[] _abcdata;
            private Swf m_root;
            private Swf.Tag m_parent;
            public uint Flags { get { return _flags; } }
            public string Name { get { return _name; } }
            public byte[] Abcdata { get { return _abcdata; } }
            public Swf M_Root { get { return m_root; } }
            public Swf.Tag M_Parent { get { return m_parent; } }
        }
        public partial class SwfBody : KaitaiStruct
        {
            public static SwfBody FromFile(string fileName)
            {
                return new SwfBody(new KaitaiStream(fileName));
            }

            public SwfBody(KaitaiStream p__io, Swf p__parent = null, Swf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _rect = new Rect(m_io, this, m_root);
                _frameRate = m_io.ReadU2le();
                _frameCount = m_io.ReadU2le();
                if (M_Root.Version >= 8) {
                    _fileAttributesTag = new Tag(m_io, this, m_root);
                }
                _tags = new List<Tag>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _tags.Add(new Tag(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private Rect _rect;
            private ushort _frameRate;
            private ushort _frameCount;
            private Tag _fileAttributesTag;
            private List<Tag> _tags;
            private Swf m_root;
            private Swf m_parent;
            public Rect Rect { get { return _rect; } }
            public ushort FrameRate { get { return _frameRate; } }
            public ushort FrameCount { get { return _frameCount; } }
            public Tag FileAttributesTag { get { return _fileAttributesTag; } }
            public List<Tag> Tags { get { return _tags; } }
            public Swf M_Root { get { return m_root; } }
            public Swf M_Parent { get { return m_parent; } }
        }
        public partial class Rect : KaitaiStruct
        {
            public static Rect FromFile(string fileName)
            {
                return new Rect(new KaitaiStream(fileName));
            }

            public Rect(KaitaiStream p__io, Swf.SwfBody p__parent = null, Swf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_numBits = false;
                f_numBytes = false;
                _read();
            }
            private void _read()
            {
                _b1 = m_io.ReadU1();
                _skip = m_io.ReadBytes(NumBytes);
            }
            private bool f_numBits;
            private int _numBits;
            public int NumBits
            {
                get
                {
                    if (f_numBits)
                        return _numBits;
                    _numBits = (int) ((B1 >> 3));
                    f_numBits = true;
                    return _numBits;
                }
            }
            private bool f_numBytes;
            private int _numBytes;
            public int NumBytes
            {
                get
                {
                    if (f_numBytes)
                        return _numBytes;
                    _numBytes = (int) (((((NumBits * 4) - 3) + 7) / 8));
                    f_numBytes = true;
                    return _numBytes;
                }
            }
            private byte _b1;
            private byte[] _skip;
            private Swf m_root;
            private Swf.SwfBody m_parent;
            public byte B1 { get { return _b1; } }
            public byte[] Skip { get { return _skip; } }
            public Swf M_Root { get { return m_root; } }
            public Swf.SwfBody M_Parent { get { return m_parent; } }
        }
        public partial class Tag : KaitaiStruct
        {
            public static Tag FromFile(string fileName)
            {
                return new Tag(new KaitaiStream(fileName));
            }

            public Tag(KaitaiStream p__io, Swf.SwfBody p__parent = null, Swf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _recordHeader = new RecordHeader(m_io, this, m_root);
                switch (RecordHeader.TagType) {
                case Swf.TagType.DefineSound: {
                    __raw_tagBody = m_io.ReadBytes(RecordHeader.Len);
                    var io___raw_tagBody = new KaitaiStream(__raw_tagBody);
                    _tagBody = new DefineSoundBody(io___raw_tagBody, this, m_root);
                    break;
                }
                case Swf.TagType.SetBackgroundColor: {
                    __raw_tagBody = m_io.ReadBytes(RecordHeader.Len);
                    var io___raw_tagBody = new KaitaiStream(__raw_tagBody);
                    _tagBody = new Rgb(io___raw_tagBody, this, m_root);
                    break;
                }
                case Swf.TagType.ScriptLimits: {
                    __raw_tagBody = m_io.ReadBytes(RecordHeader.Len);
                    var io___raw_tagBody = new KaitaiStream(__raw_tagBody);
                    _tagBody = new ScriptLimitsBody(io___raw_tagBody, this, m_root);
                    break;
                }
                case Swf.TagType.DoAbc: {
                    __raw_tagBody = m_io.ReadBytes(RecordHeader.Len);
                    var io___raw_tagBody = new KaitaiStream(__raw_tagBody);
                    _tagBody = new DoAbcBody(io___raw_tagBody, this, m_root);
                    break;
                }
                case Swf.TagType.ExportAssets: {
                    __raw_tagBody = m_io.ReadBytes(RecordHeader.Len);
                    var io___raw_tagBody = new KaitaiStream(__raw_tagBody);
                    _tagBody = new SymbolClassBody(io___raw_tagBody, this, m_root);
                    break;
                }
                case Swf.TagType.SymbolClass: {
                    __raw_tagBody = m_io.ReadBytes(RecordHeader.Len);
                    var io___raw_tagBody = new KaitaiStream(__raw_tagBody);
                    _tagBody = new SymbolClassBody(io___raw_tagBody, this, m_root);
                    break;
                }
                default: {
                    _tagBody = m_io.ReadBytes(RecordHeader.Len);
                    break;
                }
                }
            }
            private RecordHeader _recordHeader;
            private object _tagBody;
            private Swf m_root;
            private Swf.SwfBody m_parent;
            private byte[] __raw_tagBody;
            public RecordHeader RecordHeader { get { return _recordHeader; } }
            public object TagBody { get { return _tagBody; } }
            public Swf M_Root { get { return m_root; } }
            public Swf.SwfBody M_Parent { get { return m_parent; } }
            public byte[] M_RawTagBody { get { return __raw_tagBody; } }
        }
        public partial class SymbolClassBody : KaitaiStruct
        {
            public static SymbolClassBody FromFile(string fileName)
            {
                return new SymbolClassBody(new KaitaiStream(fileName));
            }

            public SymbolClassBody(KaitaiStream p__io, Swf.Tag p__parent = null, Swf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numSymbols = m_io.ReadU2le();
                _symbols = new List<Symbol>((int) (NumSymbols));
                for (var i = 0; i < NumSymbols; i++)
                {
                    _symbols.Add(new Symbol(m_io, this, m_root));
                }
            }
            public partial class Symbol : KaitaiStruct
            {
                public static Symbol FromFile(string fileName)
                {
                    return new Symbol(new KaitaiStream(fileName));
                }

                public Symbol(KaitaiStream p__io, Swf.SymbolClassBody p__parent = null, Swf p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _tag = m_io.ReadU2le();
                    _name = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(0, false, true, true));
                }
                private ushort _tag;
                private string _name;
                private Swf m_root;
                private Swf.SymbolClassBody m_parent;
                public ushort Tag { get { return _tag; } }
                public string Name { get { return _name; } }
                public Swf M_Root { get { return m_root; } }
                public Swf.SymbolClassBody M_Parent { get { return m_parent; } }
            }
            private ushort _numSymbols;
            private List<Symbol> _symbols;
            private Swf m_root;
            private Swf.Tag m_parent;
            public ushort NumSymbols { get { return _numSymbols; } }
            public List<Symbol> Symbols { get { return _symbols; } }
            public Swf M_Root { get { return m_root; } }
            public Swf.Tag M_Parent { get { return m_parent; } }
        }
        public partial class DefineSoundBody : KaitaiStruct
        {
            public static DefineSoundBody FromFile(string fileName)
            {
                return new DefineSoundBody(new KaitaiStream(fileName));
            }


            public enum SamplingRates
            {
                Rate55Khz = 0,
                Rate11Khz = 1,
                Rate22Khz = 2,
                Rate44Khz = 3,
            }

            public enum Bps
            {
                Sound8Bit = 0,
                Sound16Bit = 1,
            }

            public enum Channels
            {
                Mono = 0,
                Stereo = 1,
            }
            public DefineSoundBody(KaitaiStream p__io, Swf.Tag p__parent = null, Swf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _id = m_io.ReadU2le();
                _format = m_io.ReadBitsInt(4);
                _samplingRate = ((SamplingRates) m_io.ReadBitsInt(2));
                _bitsPerSample = ((Bps) m_io.ReadBitsInt(1));
                _numChannels = ((Channels) m_io.ReadBitsInt(1));
                m_io.AlignToByte();
                _numSamples = m_io.ReadU4le();
            }
            private ushort _id;
            private ulong _format;
            private SamplingRates _samplingRate;
            private Bps _bitsPerSample;
            private Channels _numChannels;
            private uint _numSamples;
            private Swf m_root;
            private Swf.Tag m_parent;
            public ushort Id { get { return _id; } }
            public ulong Format { get { return _format; } }

            /// <summary>
            /// Sound sampling rate, as per enum. Ignored for Nellymoser and Speex codecs.
            /// </summary>
            public SamplingRates SamplingRate { get { return _samplingRate; } }
            public Bps BitsPerSample { get { return _bitsPerSample; } }
            public Channels NumChannels { get { return _numChannels; } }
            public uint NumSamples { get { return _numSamples; } }
            public Swf M_Root { get { return m_root; } }
            public Swf.Tag M_Parent { get { return m_parent; } }
        }
        public partial class RecordHeader : KaitaiStruct
        {
            public static RecordHeader FromFile(string fileName)
            {
                return new RecordHeader(new KaitaiStream(fileName));
            }

            public RecordHeader(KaitaiStream p__io, Swf.Tag p__parent = null, Swf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_tagType = false;
                f_smallLen = false;
                f_len = false;
                _read();
            }
            private void _read()
            {
                _tagCodeAndLength = m_io.ReadU2le();
                if (SmallLen == 63) {
                    _bigLen = m_io.ReadS4le();
                }
            }
            private bool f_tagType;
            private TagType _tagType;
            public TagType TagType
            {
                get
                {
                    if (f_tagType)
                        return _tagType;
                    _tagType = (TagType) (((Swf.TagType) (TagCodeAndLength >> 6)));
                    f_tagType = true;
                    return _tagType;
                }
            }
            private bool f_smallLen;
            private int _smallLen;
            public int SmallLen
            {
                get
                {
                    if (f_smallLen)
                        return _smallLen;
                    _smallLen = (int) ((TagCodeAndLength & 63));
                    f_smallLen = true;
                    return _smallLen;
                }
            }
            private bool f_len;
            private int _len;
            public int Len
            {
                get
                {
                    if (f_len)
                        return _len;
                    _len = (int) ((SmallLen == 63 ? BigLen : SmallLen));
                    f_len = true;
                    return _len;
                }
            }
            private ushort _tagCodeAndLength;
            private int? _bigLen;
            private Swf m_root;
            private Swf.Tag m_parent;
            public ushort TagCodeAndLength { get { return _tagCodeAndLength; } }
            public int? BigLen { get { return _bigLen; } }
            public Swf M_Root { get { return m_root; } }
            public Swf.Tag M_Parent { get { return m_parent; } }
        }
        public partial class ScriptLimitsBody : KaitaiStruct
        {
            public static ScriptLimitsBody FromFile(string fileName)
            {
                return new ScriptLimitsBody(new KaitaiStream(fileName));
            }

            public ScriptLimitsBody(KaitaiStream p__io, Swf.Tag p__parent = null, Swf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _maxRecursionDepth = m_io.ReadU2le();
                _scriptTimeoutSeconds = m_io.ReadU2le();
            }
            private ushort _maxRecursionDepth;
            private ushort _scriptTimeoutSeconds;
            private Swf m_root;
            private Swf.Tag m_parent;
            public ushort MaxRecursionDepth { get { return _maxRecursionDepth; } }
            public ushort ScriptTimeoutSeconds { get { return _scriptTimeoutSeconds; } }
            public Swf M_Root { get { return m_root; } }
            public Swf.Tag M_Parent { get { return m_parent; } }
        }
        private Compressions _compression;
        private byte[] _signature;
        private byte _version;
        private uint _lenFile;
        private SwfBody _plainBody;
        private SwfBody _zlibBody;
        private Swf m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_plainBody;
        private byte[] __raw_zlibBody;
        private byte[] __raw__raw_zlibBody;
        public Compressions Compression { get { return _compression; } }
        public byte[] Signature { get { return _signature; } }
        public byte Version { get { return _version; } }
        public uint LenFile { get { return _lenFile; } }
        public SwfBody PlainBody { get { return _plainBody; } }
        public SwfBody ZlibBody { get { return _zlibBody; } }
        public Swf M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawPlainBody { get { return __raw_plainBody; } }
        public byte[] M_RawZlibBody { get { return __raw_zlibBody; } }
        public byte[] M_RawM_RawZlibBody { get { return __raw__raw_zlibBody; } }
    }
}
