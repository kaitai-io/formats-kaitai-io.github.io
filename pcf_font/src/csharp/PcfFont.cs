// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Portable Compiled Format (PCF) font is a bitmap font format
    /// originating from X11 Window System. It matches BDF format (which is
    /// text-based) closely, but instead being binary and
    /// platform-independent (as opposed to previously used SNF binary
    /// format) due to introduced features to handle different endianness
    /// and bit order.
    /// 
    /// The overall composition of the format is straightforward: it's more
    /// or less classic directory of type-offset-size pointers, pointing to
    /// what PCF format calls &quot;tables&quot;. Each table carries a certain
    /// piece of information related to the font (metadata properties,
    /// metrics, bitmaps, mapping of glyphs to characters, etc).
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://fontforge.org/docs/techref/pcf-format.html">Source</a>
    /// </remarks>
    public partial class PcfFont : KaitaiStruct
    {
        public static PcfFont FromFile(string fileName)
        {
            return new PcfFont(new KaitaiStream(fileName));
        }


        public enum Types
        {
            Properties = 1,
            Accelerators = 2,
            Metrics = 4,
            Bitmaps = 8,
            InkMetrics = 16,
            BdfEncodings = 32,
            Swidths = 64,
            GlyphNames = 128,
            BdfAccelerators = 256,
        }
        public PcfFont(KaitaiStream p__io, KaitaiStruct p__parent = null, PcfFont p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 1, 102, 99, 112 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 1, 102, 99, 112 }, Magic, M_Io, "/seq/0");
            }
            _numTables = m_io.ReadU4le();
            _tables = new List<Table>((int) (NumTables));
            for (var i = 0; i < NumTables; i++)
            {
                _tables.Add(new Table(m_io, this, m_root));
            }
        }

        /// <summary>
        /// Table offers a offset + length pointer to a particular
        /// table. &quot;Type&quot; of table references certain enum. Applications can
        /// ignore enum values which they don't support.
        /// </summary>
        public partial class Table : KaitaiStruct
        {
            public static Table FromFile(string fileName)
            {
                return new Table(new KaitaiStream(fileName));
            }

            public Table(KaitaiStream p__io, PcfFont p__parent = null, PcfFont p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_body = false;
                _read();
            }
            private void _read()
            {
                _type = ((PcfFont.Types) m_io.ReadU4le());
                _format = new Format(m_io, this, m_root);
                _lenBody = m_io.ReadU4le();
                _ofsBody = m_io.ReadU4le();
            }

            /// <summary>
            /// Table containing scalable widths of characters.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://fontforge.org/docs/techref/pcf-format.html#the-scalable-widths-table">Source</a>
            /// </remarks>
            public partial class Swidths : KaitaiStruct
            {
                public static Swidths FromFile(string fileName)
                {
                    return new Swidths(new KaitaiStream(fileName));
                }

                public Swidths(KaitaiStream p__io, PcfFont.Table p__parent = null, PcfFont p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _format = new Format(m_io, this, m_root);
                    _numGlyphs = m_io.ReadU4le();
                    _swidths = new List<uint>((int) (NumGlyphs));
                    for (var i = 0; i < NumGlyphs; i++)
                    {
                        _swidths.Add(m_io.ReadU4le());
                    }
                }
                private Format _format;
                private uint _numGlyphs;
                private List<uint> _swidths;
                private PcfFont m_root;
                private PcfFont.Table m_parent;
                public Format Format { get { return _format; } }
                public uint NumGlyphs { get { return _numGlyphs; } }

                /// <summary>
                /// The scalable width of a character is the width of the corresponding
                /// PostScript character in em-units (1/1000ths of an em).
                /// </summary>
                public List<uint> Swidths { get { return _swidths; } }
                public PcfFont M_Root { get { return m_root; } }
                public PcfFont.Table M_Parent { get { return m_parent; } }
            }

            /// <summary>
            /// Array of properties (key-value pairs), used to convey different X11
            /// settings of a font. Key is always an X font atom.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://fontforge.org/docs/techref/pcf-format.html#properties-table">Source</a>
            /// </remarks>
            public partial class Properties : KaitaiStruct
            {
                public static Properties FromFile(string fileName)
                {
                    return new Properties(new KaitaiStream(fileName));
                }

                public Properties(KaitaiStream p__io, PcfFont.Table p__parent = null, PcfFont p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _format = new Format(m_io, this, m_root);
                    _numProps = m_io.ReadU4le();
                    _props = new List<Prop>((int) (NumProps));
                    for (var i = 0; i < NumProps; i++)
                    {
                        _props.Add(new Prop(m_io, this, m_root));
                    }
                    _padding = m_io.ReadBytes(((NumProps & 3) == 0 ? 0 : (4 - (NumProps & 3))));
                    _lenStrings = m_io.ReadU4le();
                    __raw_strings = m_io.ReadBytes(LenStrings);
                    var io___raw_strings = new KaitaiStream(__raw_strings);
                    _strings = new BytesWithIo(io___raw_strings);
                }

                /// <summary>
                /// Property is a key-value pair, &quot;key&quot; being always a
                /// string and &quot;value&quot; being either a string or a 32-bit
                /// integer based on an additinal flag (`is_string`).
                /// 
                /// Simple offset-based mechanism is employed to keep this
                /// type's sequence fixed-sized and thus have simple access
                /// to property key/value by index.
                /// </summary>
                public partial class Prop : KaitaiStruct
                {
                    public static Prop FromFile(string fileName)
                    {
                        return new Prop(new KaitaiStream(fileName));
                    }

                    public Prop(KaitaiStream p__io, PcfFont.Table.Properties p__parent = null, PcfFont p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        f_name = false;
                        f_strValue = false;
                        f_intValue = false;
                        _read();
                    }
                    private void _read()
                    {
                        _ofsName = m_io.ReadU4le();
                        _isString = m_io.ReadU1();
                        _valueOrOfsValue = m_io.ReadU4le();
                    }
                    private bool f_name;
                    private string _name;

                    /// <summary>
                    /// Name of the property addressed in the strings buffer.
                    /// </summary>
                    public string Name
                    {
                        get
                        {
                            if (f_name)
                                return _name;
                            KaitaiStream io = M_Parent.Strings.M_Io;
                            long _pos = io.Pos;
                            io.Seek(OfsName);
                            _name = System.Text.Encoding.GetEncoding("UTF-8").GetString(io.ReadBytesTerm(0, false, true, true));
                            io.Seek(_pos);
                            f_name = true;
                            return _name;
                        }
                    }
                    private bool f_strValue;
                    private string _strValue;

                    /// <summary>
                    /// Value of the property addressed in the strings
                    /// buffer, if this is a string value.
                    /// </summary>
                    public string StrValue
                    {
                        get
                        {
                            if (f_strValue)
                                return _strValue;
                            if (IsString != 0) {
                                KaitaiStream io = M_Parent.Strings.M_Io;
                                long _pos = io.Pos;
                                io.Seek(ValueOrOfsValue);
                                _strValue = System.Text.Encoding.GetEncoding("UTF-8").GetString(io.ReadBytesTerm(0, false, true, true));
                                io.Seek(_pos);
                                f_strValue = true;
                            }
                            return _strValue;
                        }
                    }
                    private bool f_intValue;
                    private uint? _intValue;

                    /// <summary>
                    /// Value of the property, if this is an integer value.
                    /// </summary>
                    public uint? IntValue
                    {
                        get
                        {
                            if (f_intValue)
                                return _intValue;
                            if (IsString == 0) {
                                _intValue = (uint) (ValueOrOfsValue);
                            }
                            f_intValue = true;
                            return _intValue;
                        }
                    }
                    private uint _ofsName;
                    private byte _isString;
                    private uint _valueOrOfsValue;
                    private PcfFont m_root;
                    private PcfFont.Table.Properties m_parent;

                    /// <summary>
                    /// Offset to name in the strings buffer.
                    /// </summary>
                    public uint OfsName { get { return _ofsName; } }

                    /// <summary>
                    /// Designates if value is an integer (zero) or a string (non-zero).
                    /// </summary>
                    public byte IsString { get { return _isString; } }

                    /// <summary>
                    /// If the value is an integer (`is_string` is false),
                    /// then it's stored here. If the value is a string
                    /// (`is_string` is true), then it stores offset to the
                    /// value in the strings buffer.
                    /// </summary>
                    public uint ValueOrOfsValue { get { return _valueOrOfsValue; } }
                    public PcfFont M_Root { get { return m_root; } }
                    public PcfFont.Table.Properties M_Parent { get { return m_parent; } }
                }
                private Format _format;
                private uint _numProps;
                private List<Prop> _props;
                private byte[] _padding;
                private uint _lenStrings;
                private BytesWithIo _strings;
                private PcfFont m_root;
                private PcfFont.Table m_parent;
                private byte[] __raw_strings;
                public Format Format { get { return _format; } }
                public uint NumProps { get { return _numProps; } }
                public List<Prop> Props { get { return _props; } }
                public byte[] Padding { get { return _padding; } }
                public uint LenStrings { get { return _lenStrings; } }

                /// <summary>
                /// Strings buffer. Never used directly, but instead is
                /// addressed by offsets from the properties.
                /// </summary>
                public BytesWithIo Strings { get { return _strings; } }
                public PcfFont M_Root { get { return m_root; } }
                public PcfFont.Table M_Parent { get { return m_parent; } }
                public byte[] M_RawStrings { get { return __raw_strings; } }
            }

            /// <summary>
            /// Table that allows mapping of character codes to glyphs present in the
            /// font. Supports 1-byte and 2-byte character codes.
            /// 
            /// Note that this mapping is agnostic to character encoding itself - it
            /// can represent ASCII, Unicode (ISO/IEC 10646), various single-byte
            /// national encodings, etc. If application cares about it, normally
            /// encoding will be specified in `properties` table, in the properties named
            /// `CHARSET_REGISTRY` / `CHARSET_ENCODING`.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://fontforge.org/docs/techref/pcf-format.html#the-encoding-table">Source</a>
            /// </remarks>
            public partial class BdfEncodings : KaitaiStruct
            {
                public static BdfEncodings FromFile(string fileName)
                {
                    return new BdfEncodings(new KaitaiStream(fileName));
                }

                public BdfEncodings(KaitaiStream p__io, PcfFont.Table p__parent = null, PcfFont p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _format = new Format(m_io, this, m_root);
                    _minCharOrByte2 = m_io.ReadU2le();
                    _maxCharOrByte2 = m_io.ReadU2le();
                    _minByte1 = m_io.ReadU2le();
                    _maxByte1 = m_io.ReadU2le();
                    _defaultChar = m_io.ReadU2le();
                    _glyphIndexes = new List<ushort>((int) ((((MaxCharOrByte2 - MinCharOrByte2) + 1) * ((MaxByte1 - MinByte1) + 1))));
                    for (var i = 0; i < (((MaxCharOrByte2 - MinCharOrByte2) + 1) * ((MaxByte1 - MinByte1) + 1)); i++)
                    {
                        _glyphIndexes.Add(m_io.ReadU2le());
                    }
                }
                private Format _format;
                private ushort _minCharOrByte2;
                private ushort _maxCharOrByte2;
                private ushort _minByte1;
                private ushort _maxByte1;
                private ushort _defaultChar;
                private List<ushort> _glyphIndexes;
                private PcfFont m_root;
                private PcfFont.Table m_parent;
                public Format Format { get { return _format; } }
                public ushort MinCharOrByte2 { get { return _minCharOrByte2; } }
                public ushort MaxCharOrByte2 { get { return _maxCharOrByte2; } }
                public ushort MinByte1 { get { return _minByte1; } }
                public ushort MaxByte1 { get { return _maxByte1; } }
                public ushort DefaultChar { get { return _defaultChar; } }
                public List<ushort> GlyphIndexes { get { return _glyphIndexes; } }
                public PcfFont M_Root { get { return m_root; } }
                public PcfFont.Table M_Parent { get { return m_parent; } }
            }

            /// <summary>
            /// Table containing character names for every glyph.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://fontforge.org/docs/techref/pcf-format.html#the-glyph-names-table">Source</a>
            /// </remarks>
            public partial class GlyphNames : KaitaiStruct
            {
                public static GlyphNames FromFile(string fileName)
                {
                    return new GlyphNames(new KaitaiStream(fileName));
                }

                public GlyphNames(KaitaiStream p__io, PcfFont.Table p__parent = null, PcfFont p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _format = new Format(m_io, this, m_root);
                    _numGlyphs = m_io.ReadU4le();
                    _names = new List<StringRef>((int) (NumGlyphs));
                    for (var i = 0; i < NumGlyphs; i++)
                    {
                        _names.Add(new StringRef(m_io, this, m_root));
                    }
                    _lenStrings = m_io.ReadU4le();
                    __raw_strings = m_io.ReadBytes(LenStrings);
                    var io___raw_strings = new KaitaiStream(__raw_strings);
                    _strings = new BytesWithIo(io___raw_strings);
                }
                public partial class StringRef : KaitaiStruct
                {
                    public static StringRef FromFile(string fileName)
                    {
                        return new StringRef(new KaitaiStream(fileName));
                    }

                    public StringRef(KaitaiStream p__io, PcfFont.Table.GlyphNames p__parent = null, PcfFont p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        f_value = false;
                        _read();
                    }
                    private void _read()
                    {
                        _ofsString = m_io.ReadU4le();
                    }
                    private bool f_value;
                    private string _value;
                    public string Value
                    {
                        get
                        {
                            if (f_value)
                                return _value;
                            KaitaiStream io = M_Parent.Strings.M_Io;
                            long _pos = io.Pos;
                            io.Seek(OfsString);
                            _value = System.Text.Encoding.GetEncoding("UTF-8").GetString(io.ReadBytesTerm(0, false, true, true));
                            io.Seek(_pos);
                            f_value = true;
                            return _value;
                        }
                    }
                    private uint _ofsString;
                    private PcfFont m_root;
                    private PcfFont.Table.GlyphNames m_parent;
                    public uint OfsString { get { return _ofsString; } }
                    public PcfFont M_Root { get { return m_root; } }
                    public PcfFont.Table.GlyphNames M_Parent { get { return m_parent; } }
                }
                private Format _format;
                private uint _numGlyphs;
                private List<StringRef> _names;
                private uint _lenStrings;
                private BytesWithIo _strings;
                private PcfFont m_root;
                private PcfFont.Table m_parent;
                private byte[] __raw_strings;
                public Format Format { get { return _format; } }
                public uint NumGlyphs { get { return _numGlyphs; } }

                /// <summary>
                /// Glyph names are represented as string references in strings buffer.
                /// </summary>
                public List<StringRef> Names { get { return _names; } }
                public uint LenStrings { get { return _lenStrings; } }

                /// <summary>
                /// Strings buffer which contains all glyph names.
                /// </summary>
                public BytesWithIo Strings { get { return _strings; } }
                public PcfFont M_Root { get { return m_root; } }
                public PcfFont.Table M_Parent { get { return m_parent; } }
                public byte[] M_RawStrings { get { return __raw_strings; } }
            }

            /// <summary>
            /// Table containing uncompressed glyph bitmaps.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://fontforge.org/docs/techref/pcf-format.html#the-bitmap-table">Source</a>
            /// </remarks>
            public partial class Bitmaps : KaitaiStruct
            {
                public static Bitmaps FromFile(string fileName)
                {
                    return new Bitmaps(new KaitaiStream(fileName));
                }

                public Bitmaps(KaitaiStream p__io, PcfFont.Table p__parent = null, PcfFont p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _format = new Format(m_io, this, m_root);
                    _numGlyphs = m_io.ReadU4le();
                    _offsets = new List<uint>((int) (NumGlyphs));
                    for (var i = 0; i < NumGlyphs; i++)
                    {
                        _offsets.Add(m_io.ReadU4le());
                    }
                    _bitmapSizes = new List<uint>((int) (4));
                    for (var i = 0; i < 4; i++)
                    {
                        _bitmapSizes.Add(m_io.ReadU4le());
                    }
                }
                private Format _format;
                private uint _numGlyphs;
                private List<uint> _offsets;
                private List<uint> _bitmapSizes;
                private PcfFont m_root;
                private PcfFont.Table m_parent;
                public Format Format { get { return _format; } }
                public uint NumGlyphs { get { return _numGlyphs; } }
                public List<uint> Offsets { get { return _offsets; } }
                public List<uint> BitmapSizes { get { return _bitmapSizes; } }
                public PcfFont M_Root { get { return m_root; } }
                public PcfFont.Table M_Parent { get { return m_parent; } }
            }
            private bool f_body;
            private object _body;
            public object Body
            {
                get
                {
                    if (f_body)
                        return _body;
                    long _pos = m_io.Pos;
                    m_io.Seek(OfsBody);
                    switch (Type) {
                    case PcfFont.Types.Properties: {
                        __raw_body = m_io.ReadBytes(LenBody);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new Properties(io___raw_body, this, m_root);
                        break;
                    }
                    case PcfFont.Types.BdfEncodings: {
                        __raw_body = m_io.ReadBytes(LenBody);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new BdfEncodings(io___raw_body, this, m_root);
                        break;
                    }
                    case PcfFont.Types.Swidths: {
                        __raw_body = m_io.ReadBytes(LenBody);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new Swidths(io___raw_body, this, m_root);
                        break;
                    }
                    case PcfFont.Types.GlyphNames: {
                        __raw_body = m_io.ReadBytes(LenBody);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new GlyphNames(io___raw_body, this, m_root);
                        break;
                    }
                    case PcfFont.Types.Bitmaps: {
                        __raw_body = m_io.ReadBytes(LenBody);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new Bitmaps(io___raw_body, this, m_root);
                        break;
                    }
                    default: {
                        _body = m_io.ReadBytes(LenBody);
                        break;
                    }
                    }
                    m_io.Seek(_pos);
                    f_body = true;
                    return _body;
                }
            }
            private Types _type;
            private Format _format;
            private uint _lenBody;
            private uint _ofsBody;
            private PcfFont m_root;
            private PcfFont m_parent;
            private byte[] __raw_body;
            public Types Type { get { return _type; } }
            public Format Format { get { return _format; } }
            public uint LenBody { get { return _lenBody; } }
            public uint OfsBody { get { return _ofsBody; } }
            public PcfFont M_Root { get { return m_root; } }
            public PcfFont M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }

        /// <summary>
        /// Table format specifier, always 4 bytes. Original implementation treats
        /// it as always little-endian and makes liberal use of bitmasking to parse
        /// various parts of it.
        /// 
        /// TODO: this format specification recognizes endianness and bit
        /// order format bits, but it does not really takes any parsing
        /// decisions based on them.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://fontforge.org/docs/techref/pcf-format.html#file-header">Source</a>
        /// </remarks>
        public partial class Format : KaitaiStruct
        {
            public static Format FromFile(string fileName)
            {
                return new Format(new KaitaiStream(fileName));
            }

            public Format(KaitaiStream p__io, KaitaiStruct p__parent = null, PcfFont p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _padding1 = m_io.ReadBitsIntBe(2);
                _scanUnitMask = m_io.ReadBitsIntBe(2);
                _isMostSignificantBitFirst = m_io.ReadBitsIntBe(1) != 0;
                _isBigEndian = m_io.ReadBitsIntBe(1) != 0;
                _glyphPadMask = m_io.ReadBitsIntBe(2);
                m_io.AlignToByte();
                _format = m_io.ReadU1();
                _padding = m_io.ReadU2le();
            }
            private ulong _padding1;
            private ulong _scanUnitMask;
            private bool _isMostSignificantBitFirst;
            private bool _isBigEndian;
            private ulong _glyphPadMask;
            private byte _format;
            private ushort _padding;
            private PcfFont m_root;
            private KaitaiStruct m_parent;
            public ulong Padding1 { get { return _padding1; } }
            public ulong ScanUnitMask { get { return _scanUnitMask; } }
            public bool IsMostSignificantBitFirst { get { return _isMostSignificantBitFirst; } }

            /// <summary>
            /// If set, then all integers in the table are treated as big-endian
            /// </summary>
            public bool IsBigEndian { get { return _isBigEndian; } }
            public ulong GlyphPadMask { get { return _glyphPadMask; } }
            public byte Format { get { return _format; } }
            public ushort Padding { get { return _padding; } }
            public PcfFont M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        private byte[] _magic;
        private uint _numTables;
        private List<Table> _tables;
        private PcfFont m_root;
        private KaitaiStruct m_parent;
        public byte[] Magic { get { return _magic; } }
        public uint NumTables { get { return _numTables; } }
        public List<Table> Tables { get { return _tables; } }
        public PcfFont M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
