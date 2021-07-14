// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// The NeXT/Sun audio file format.
    /// 
    /// Sample files:
    /// 
    /// * &lt;https://github.com/python/cpython/tree/b8a7daf077da/Lib/test/sndhdrdata&gt;
    /// * &lt;ftp://ftp-ccrma.stanford.edu/pub/Lisp/sf.tar.gz&gt;
    /// * &lt;http://www-mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/Samples.html&gt;
    /// </summary>
    /// <remarks>
    /// Reference: <a href="http://www-mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/AU.html">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="http://soundfile.sapp.org/doc/NextFormat/">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="http://soundfile.sapp.org/doc/NextFormat/soundstruct.h">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/andreiw/polaris/blob/deb47cb/usr/src/head/audio/au.h#L87-L112">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/libsndfile/libsndfile/blob/86c9f9eb/src/au.c#L39-L74">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/chirlu/sox/blob/dd8b63bd/src/au.c#L34-L49">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/mpruett/audiofile/blob/b62c902/libaudiofile/NeXT.cpp#L65-L96">Source</a>
    /// </remarks>
    public partial class Au : KaitaiStruct
    {
        public static Au FromFile(string fileName)
        {
            return new Au(new KaitaiStream(fileName));
        }


        public enum Encodings
        {
            Mulaw8 = 1,
            Linear8 = 2,
            Linear16 = 3,
            Linear24 = 4,
            Linear32 = 5,
            Float = 6,
            Double = 7,
            Fragmented = 8,
            Nested = 9,
            DspCore = 10,
            FixedPoint8 = 11,
            FixedPoint16 = 12,
            FixedPoint24 = 13,
            FixedPoint32 = 14,
            Display = 16,
            MulawSquelch = 17,
            Emphasized = 18,
            Compressed = 19,
            CompressedEmphasized = 20,
            DspCommands = 21,
            DspCommandsSamples = 22,
            AdpcmG721 = 23,
            AdpcmG722 = 24,
            AdpcmG7233 = 25,
            AdpcmG7235 = 26,
            Alaw8 = 27,
            Aes = 28,
            DeltaMulaw8 = 29,
        }
        public Au(KaitaiStream p__io, KaitaiStruct p__parent = null, Au p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_lenData = false;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 46, 115, 110, 100 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 46, 115, 110, 100 }, Magic, M_Io, "/seq/0");
            }
            _ofsData = m_io.ReadU4be();
            __raw_header = m_io.ReadBytes(((OfsData - 4) - 4));
            var io___raw_header = new KaitaiStream(__raw_header);
            _header = new Header(io___raw_header, this, m_root);
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, Au p__parent = null, Au p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _dataSize = m_io.ReadU4be();
                _encoding = ((Au.Encodings) m_io.ReadU4be());
                _sampleRate = m_io.ReadU4be();
                _numChannels = m_io.ReadU4be();
                if (!(NumChannels >= 1))
                {
                    throw new ValidationLessThanError(1, NumChannels, M_Io, "/types/header/seq/3");
                }
                _comment = System.Text.Encoding.GetEncoding("ASCII").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytesFull(), 0, false));
            }
            private uint _dataSize;
            private Encodings _encoding;
            private uint _sampleRate;
            private uint _numChannels;
            private string _comment;
            private Au m_root;
            private Au m_parent;

            /// <summary>
            /// don't read this field, access `_root.len_data` instead
            /// 
            /// value `0xffff_ffff` means unspecified size
            /// </summary>
            public uint DataSize { get { return _dataSize; } }
            public Encodings Encoding { get { return _encoding; } }
            public uint SampleRate { get { return _sampleRate; } }

            /// <summary>
            /// number of interleaved channels
            /// </summary>
            public uint NumChannels { get { return _numChannels; } }

            /// <summary>
            /// Most resources claim that this field must be at least 4 bytes long.
            /// However, most programs don't enforce it, and [Audacity](
            /// https://www.audacityteam.org/) even generates .au files with this field
            /// being 0-byte long. According to &lt;https://nixdoc.net/man-pages/IRIX/man4/dmedia/next.4.html&gt;,
            /// &quot;NeXT files require that this chunk be at least 4 bytes (chars) long,
            /// whereas this chunk may be zerolength in a Sun .au file.&quot;
            /// 
            /// By convention, size should be a multiple of 4 -
            /// see &lt;https://github.com/chirlu/sox/blob/dd8b63bd/src/au.c#L132-L133&gt;.
            /// Page &lt;http://soundfile.sapp.org/doc/NextFormat/&gt; also mentions that for some
            /// sound playing programs, this field must have an even byte size. So a multiple
            /// of 4 is probably best for compatibility.
            /// 
            /// Must be null-terminated. It is usually an ASCII text string, but this space
            /// might be also used to store application-specific binary (i.e. non-ASCII) data.
            /// </summary>
            public string Comment { get { return _comment; } }
            public Au M_Root { get { return m_root; } }
            public Au M_Parent { get { return m_parent; } }
        }
        private bool f_lenData;
        private int _lenData;
        public int LenData
        {
            get
            {
                if (f_lenData)
                    return _lenData;
                _lenData = (int) ((Header.DataSize == 4294967295 ? (M_Io.Size - OfsData) : Header.DataSize));
                f_lenData = true;
                return _lenData;
            }
        }
        private byte[] _magic;
        private uint _ofsData;
        private Header _header;
        private Au m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_header;
        public byte[] Magic { get { return _magic; } }
        public uint OfsData { get { return _ofsData; } }
        public Header Header { get { return _header; } }
        public Au M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawHeader { get { return __raw_header; } }
    }
}
