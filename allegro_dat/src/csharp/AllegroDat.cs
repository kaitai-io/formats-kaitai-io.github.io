// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Allegro library for C (mostly used for game and multimedia apps
    /// programming) used its own container file format.
    /// 
    /// In general, it allows storage of arbitrary binary data blocks
    /// bundled together with some simple key-value style metadata
    /// (&quot;properties&quot;) for every block. Allegro also pre-defines some simple
    /// formats for bitmaps, fonts, MIDI music, sound samples and
    /// palettes. Allegro library v4.0+ also support LZSS compression.
    /// 
    /// This spec applies to Allegro data files for library versions 2.2 up
    /// to 4.4.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://liballeg.org/stabledocs/en/datafile.html">Source</a>
    /// </remarks>
    public partial class AllegroDat : KaitaiStruct
    {
        public static AllegroDat FromFile(string fileName)
        {
            return new AllegroDat(new KaitaiStream(fileName));
        }


        public enum PackEnum
        {
            Unpacked = 1936484398,
        }
        public AllegroDat(KaitaiStream p__io, KaitaiStruct p__parent = null, AllegroDat p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _packMagic = ((PackEnum) m_io.ReadU4be());
            _datMagic = m_io.EnsureFixedContents(new byte[] { 65, 76, 76, 46 });
            _numObjects = m_io.ReadU4be();
            _objects = new List<DatObject>((int) (NumObjects));
            for (var i = 0; i < NumObjects; i++)
            {
                _objects.Add(new DatObject(m_io, this, m_root));
            }
        }

        /// <summary>
        /// Simple monochrome monospaced font, 95 characters, 8x16 px
        /// characters.
        /// </summary>
        public partial class DatFont16 : KaitaiStruct
        {
            public static DatFont16 FromFile(string fileName)
            {
                return new DatFont16(new KaitaiStream(fileName));
            }

            public DatFont16(KaitaiStream p__io, AllegroDat.DatFont p__parent = null, AllegroDat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _chars = new List<byte[]>((int) (95));
                for (var i = 0; i < 95; i++)
                {
                    _chars.Add(m_io.ReadBytes(16));
                }
            }
            private List<byte[]> _chars;
            private AllegroDat m_root;
            private AllegroDat.DatFont m_parent;
            public List<byte[]> Chars { get { return _chars; } }
            public AllegroDat M_Root { get { return m_root; } }
            public AllegroDat.DatFont M_Parent { get { return m_parent; } }
        }
        public partial class DatBitmap : KaitaiStruct
        {
            public static DatBitmap FromFile(string fileName)
            {
                return new DatBitmap(new KaitaiStream(fileName));
            }

            public DatBitmap(KaitaiStream p__io, AllegroDat.DatObject p__parent = null, AllegroDat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _bitsPerPixel = m_io.ReadS2be();
                _width = m_io.ReadU2be();
                _height = m_io.ReadU2be();
                _image = m_io.ReadBytesFull();
            }
            private short _bitsPerPixel;
            private ushort _width;
            private ushort _height;
            private byte[] _image;
            private AllegroDat m_root;
            private AllegroDat.DatObject m_parent;
            public short BitsPerPixel { get { return _bitsPerPixel; } }
            public ushort Width { get { return _width; } }
            public ushort Height { get { return _height; } }
            public byte[] Image { get { return _image; } }
            public AllegroDat M_Root { get { return m_root; } }
            public AllegroDat.DatObject M_Parent { get { return m_parent; } }
        }
        public partial class DatFont : KaitaiStruct
        {
            public static DatFont FromFile(string fileName)
            {
                return new DatFont(new KaitaiStream(fileName));
            }

            public DatFont(KaitaiStream p__io, AllegroDat.DatObject p__parent = null, AllegroDat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fontSize = m_io.ReadS2be();
                switch (FontSize) {
                case 8: {
                    _body = new DatFont8(m_io, this, m_root);
                    break;
                }
                case 16: {
                    _body = new DatFont16(m_io, this, m_root);
                    break;
                }
                case 0: {
                    _body = new DatFont39(m_io, this, m_root);
                    break;
                }
                }
            }
            private short _fontSize;
            private KaitaiStruct _body;
            private AllegroDat m_root;
            private AllegroDat.DatObject m_parent;
            public short FontSize { get { return _fontSize; } }
            public KaitaiStruct Body { get { return _body; } }
            public AllegroDat M_Root { get { return m_root; } }
            public AllegroDat.DatObject M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Simple monochrome monospaced font, 95 characters, 8x8 px
        /// characters.
        /// </summary>
        public partial class DatFont8 : KaitaiStruct
        {
            public static DatFont8 FromFile(string fileName)
            {
                return new DatFont8(new KaitaiStream(fileName));
            }

            public DatFont8(KaitaiStream p__io, AllegroDat.DatFont p__parent = null, AllegroDat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _chars = new List<byte[]>((int) (95));
                for (var i = 0; i < 95; i++)
                {
                    _chars.Add(m_io.ReadBytes(8));
                }
            }
            private List<byte[]> _chars;
            private AllegroDat m_root;
            private AllegroDat.DatFont m_parent;
            public List<byte[]> Chars { get { return _chars; } }
            public AllegroDat M_Root { get { return m_root; } }
            public AllegroDat.DatFont M_Parent { get { return m_parent; } }
        }
        public partial class DatObject : KaitaiStruct
        {
            public static DatObject FromFile(string fileName)
            {
                return new DatObject(new KaitaiStream(fileName));
            }

            public DatObject(KaitaiStream p__io, AllegroDat p__parent = null, AllegroDat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_type = false;
                _read();
            }
            private void _read()
            {
                _properties = new List<Property>();
                {
                    var i = 0;
                    Property M_;
                    do {
                        M_ = new Property(m_io, this, m_root);
                        _properties.Add(M_);
                        i++;
                    } while (!(!(M_.IsValid)));
                }
                _lenCompressed = m_io.ReadS4be();
                _lenUncompressed = m_io.ReadS4be();
                switch (Type) {
                case "BMP ": {
                    __raw_body = m_io.ReadBytes(LenCompressed);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new DatBitmap(io___raw_body, this, m_root);
                    break;
                }
                case "RLE ": {
                    __raw_body = m_io.ReadBytes(LenCompressed);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new DatRleSprite(io___raw_body, this, m_root);
                    break;
                }
                case "FONT": {
                    __raw_body = m_io.ReadBytes(LenCompressed);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new DatFont(io___raw_body, this, m_root);
                    break;
                }
                default: {
                    _body = m_io.ReadBytes(LenCompressed);
                    break;
                }
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
                    _type = (string) (Properties[Properties.Count - 1].Magic);
                    f_type = true;
                    return _type;
                }
            }
            private List<Property> _properties;
            private int _lenCompressed;
            private int _lenUncompressed;
            private object _body;
            private AllegroDat m_root;
            private AllegroDat m_parent;
            private byte[] __raw_body;
            public List<Property> Properties { get { return _properties; } }
            public int LenCompressed { get { return _lenCompressed; } }
            public int LenUncompressed { get { return _lenUncompressed; } }
            public object Body { get { return _body; } }
            public AllegroDat M_Root { get { return m_root; } }
            public AllegroDat M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }

        /// <summary>
        /// New bitmap font format introduced since Allegro 3.9: allows
        /// flexible designation of character ranges, 8-bit colored
        /// characters, etc.
        /// </summary>
        public partial class DatFont39 : KaitaiStruct
        {
            public static DatFont39 FromFile(string fileName)
            {
                return new DatFont39(new KaitaiStream(fileName));
            }

            public DatFont39(KaitaiStream p__io, AllegroDat.DatFont p__parent = null, AllegroDat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numRanges = m_io.ReadS2be();
                _ranges = new List<Range>((int) (NumRanges));
                for (var i = 0; i < NumRanges; i++)
                {
                    _ranges.Add(new Range(m_io, this, m_root));
                }
            }
            public partial class Range : KaitaiStruct
            {
                public static Range FromFile(string fileName)
                {
                    return new Range(new KaitaiStream(fileName));
                }

                public Range(KaitaiStream p__io, AllegroDat.DatFont39 p__parent = null, AllegroDat p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _mono = m_io.ReadU1();
                    _startChar = m_io.ReadU4be();
                    _endChar = m_io.ReadU4be();
                    _chars = new List<FontChar>((int) (((EndChar - StartChar) + 1)));
                    for (var i = 0; i < ((EndChar - StartChar) + 1); i++)
                    {
                        _chars.Add(new FontChar(m_io, this, m_root));
                    }
                }
                private byte _mono;
                private uint _startChar;
                private uint _endChar;
                private List<FontChar> _chars;
                private AllegroDat m_root;
                private AllegroDat.DatFont39 m_parent;
                public byte Mono { get { return _mono; } }

                /// <summary>
                /// First character in range
                /// </summary>
                public uint StartChar { get { return _startChar; } }

                /// <summary>
                /// Last character in range (inclusive)
                /// </summary>
                public uint EndChar { get { return _endChar; } }
                public List<FontChar> Chars { get { return _chars; } }
                public AllegroDat M_Root { get { return m_root; } }
                public AllegroDat.DatFont39 M_Parent { get { return m_parent; } }
            }
            public partial class FontChar : KaitaiStruct
            {
                public static FontChar FromFile(string fileName)
                {
                    return new FontChar(new KaitaiStream(fileName));
                }

                public FontChar(KaitaiStream p__io, AllegroDat.DatFont39.Range p__parent = null, AllegroDat p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _width = m_io.ReadU2be();
                    _height = m_io.ReadU2be();
                    _body = m_io.ReadBytes((Width * Height));
                }
                private ushort _width;
                private ushort _height;
                private byte[] _body;
                private AllegroDat m_root;
                private AllegroDat.DatFont39.Range m_parent;
                public ushort Width { get { return _width; } }
                public ushort Height { get { return _height; } }
                public byte[] Body { get { return _body; } }
                public AllegroDat M_Root { get { return m_root; } }
                public AllegroDat.DatFont39.Range M_Parent { get { return m_parent; } }
            }
            private short _numRanges;
            private List<Range> _ranges;
            private AllegroDat m_root;
            private AllegroDat.DatFont m_parent;
            public short NumRanges { get { return _numRanges; } }
            public List<Range> Ranges { get { return _ranges; } }
            public AllegroDat M_Root { get { return m_root; } }
            public AllegroDat.DatFont M_Parent { get { return m_parent; } }
        }
        public partial class Property : KaitaiStruct
        {
            public static Property FromFile(string fileName)
            {
                return new Property(new KaitaiStream(fileName));
            }

            public Property(KaitaiStream p__io, AllegroDat.DatObject p__parent = null, AllegroDat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_isValid = false;
                _read();
            }
            private void _read()
            {
                _magic = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                if (IsValid) {
                    _type = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                }
                if (IsValid) {
                    _lenBody = m_io.ReadU4be();
                }
                if (IsValid) {
                    _body = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(LenBody));
                }
            }
            private bool f_isValid;
            private bool _isValid;
            public bool IsValid
            {
                get
                {
                    if (f_isValid)
                        return _isValid;
                    _isValid = (bool) (Magic == "prop");
                    f_isValid = true;
                    return _isValid;
                }
            }
            private string _magic;
            private string _type;
            private uint? _lenBody;
            private string _body;
            private AllegroDat m_root;
            private AllegroDat.DatObject m_parent;
            public string Magic { get { return _magic; } }
            public string Type { get { return _type; } }
            public uint? LenBody { get { return _lenBody; } }
            public string Body { get { return _body; } }
            public AllegroDat M_Root { get { return m_root; } }
            public AllegroDat.DatObject M_Parent { get { return m_parent; } }
        }
        public partial class DatRleSprite : KaitaiStruct
        {
            public static DatRleSprite FromFile(string fileName)
            {
                return new DatRleSprite(new KaitaiStream(fileName));
            }

            public DatRleSprite(KaitaiStream p__io, AllegroDat.DatObject p__parent = null, AllegroDat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _bitsPerPixel = m_io.ReadS2be();
                _width = m_io.ReadU2be();
                _height = m_io.ReadU2be();
                _lenImage = m_io.ReadU4be();
                _image = m_io.ReadBytesFull();
            }
            private short _bitsPerPixel;
            private ushort _width;
            private ushort _height;
            private uint _lenImage;
            private byte[] _image;
            private AllegroDat m_root;
            private AllegroDat.DatObject m_parent;
            public short BitsPerPixel { get { return _bitsPerPixel; } }
            public ushort Width { get { return _width; } }
            public ushort Height { get { return _height; } }
            public uint LenImage { get { return _lenImage; } }
            public byte[] Image { get { return _image; } }
            public AllegroDat M_Root { get { return m_root; } }
            public AllegroDat.DatObject M_Parent { get { return m_parent; } }
        }
        private PackEnum _packMagic;
        private byte[] _datMagic;
        private uint _numObjects;
        private List<DatObject> _objects;
        private AllegroDat m_root;
        private KaitaiStruct m_parent;
        public PackEnum PackMagic { get { return _packMagic; } }
        public byte[] DatMagic { get { return _datMagic; } }
        public uint NumObjects { get { return _numObjects; } }
        public List<DatObject> Objects { get { return _objects; } }
        public AllegroDat M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
