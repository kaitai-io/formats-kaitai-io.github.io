// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Bitmap font format for the GRUB 2 bootloader.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://grub.gibibit.com/New_font_format">Source</a>
    /// </remarks>
    public partial class Grub2Font : KaitaiStruct
    {
        public static Grub2Font FromFile(string fileName)
        {
            return new Grub2Font(new KaitaiStream(fileName));
        }

        public Grub2Font(KaitaiStream p__io, KaitaiStruct p__parent = null, Grub2Font p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(12);
            if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 70, 73, 76, 69, 0, 0, 0, 4, 80, 70, 70, 50 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 70, 73, 76, 69, 0, 0, 0, 4, 80, 70, 70, 50 }, _magic, m_io, "/seq/0");
            }
            _sections = new List<Section>();
            {
                var i = 0;
                Section M_;
                do {
                    M_ = new Section(m_io, this, m_root);
                    _sections.Add(M_);
                    i++;
                } while (!(M_.SectionType == "DATA"));
            }
        }
        public partial class AsceSection : KaitaiStruct
        {
            public static AsceSection FromFile(string fileName)
            {
                return new AsceSection(new KaitaiStream(fileName));
            }

            public AsceSection(KaitaiStream p__io, Grub2Font.Section p__parent = null, Grub2Font p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _ascentInPixels = m_io.ReadU2be();
            }
            private ushort _ascentInPixels;
            private Grub2Font m_root;
            private Grub2Font.Section m_parent;
            public ushort AscentInPixels { get { return _ascentInPixels; } }
            public Grub2Font M_Root { get { return m_root; } }
            public Grub2Font.Section M_Parent { get { return m_parent; } }
        }
        public partial class ChixSection : KaitaiStruct
        {
            public static ChixSection FromFile(string fileName)
            {
                return new ChixSection(new KaitaiStream(fileName));
            }

            public ChixSection(KaitaiStream p__io, Grub2Font.Section p__parent = null, Grub2Font p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _characters = new List<Character>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _characters.Add(new Character(m_io, this, m_root));
                        i++;
                    }
                }
            }
            public partial class Character : KaitaiStruct
            {
                public static Character FromFile(string fileName)
                {
                    return new Character(new KaitaiStream(fileName));
                }

                public Character(KaitaiStream p__io, Grub2Font.ChixSection p__parent = null, Grub2Font p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_definition = false;
                    _read();
                }
                private void _read()
                {
                    _codePoint = m_io.ReadU4be();
                    _flags = m_io.ReadU1();
                    _ofsDefinition = m_io.ReadU4be();
                }
                private bool f_definition;
                private CharacterDefinition _definition;
                public CharacterDefinition Definition
                {
                    get
                    {
                        if (f_definition)
                            return _definition;
                        f_definition = true;
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(OfsDefinition);
                        _definition = new CharacterDefinition(io, this, m_root);
                        io.Seek(_pos);
                        return _definition;
                    }
                }
                private uint _codePoint;
                private byte _flags;
                private uint _ofsDefinition;
                private Grub2Font m_root;
                private Grub2Font.ChixSection m_parent;

                /// <summary>
                /// Unicode code point
                /// </summary>
                public uint CodePoint { get { return _codePoint; } }
                public byte Flags { get { return _flags; } }
                public uint OfsDefinition { get { return _ofsDefinition; } }
                public Grub2Font M_Root { get { return m_root; } }
                public Grub2Font.ChixSection M_Parent { get { return m_parent; } }
            }
            public partial class CharacterDefinition : KaitaiStruct
            {
                public static CharacterDefinition FromFile(string fileName)
                {
                    return new CharacterDefinition(new KaitaiStream(fileName));
                }

                public CharacterDefinition(KaitaiStream p__io, Grub2Font.ChixSection.Character p__parent = null, Grub2Font p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _width = m_io.ReadU2be();
                    _height = m_io.ReadU2be();
                    _xOffset = m_io.ReadS2be();
                    _yOffset = m_io.ReadS2be();
                    _deviceWidth = m_io.ReadS2be();
                    _bitmapData = m_io.ReadBytes((Width * Height + 7) / 8);
                }
                private ushort _width;
                private ushort _height;
                private short _xOffset;
                private short _yOffset;
                private short _deviceWidth;
                private byte[] _bitmapData;
                private Grub2Font m_root;
                private Grub2Font.ChixSection.Character m_parent;
                public ushort Width { get { return _width; } }
                public ushort Height { get { return _height; } }
                public short XOffset { get { return _xOffset; } }
                public short YOffset { get { return _yOffset; } }
                public short DeviceWidth { get { return _deviceWidth; } }

                /// <summary>
                /// A two-dimensional bitmap, one bit per pixel. It is organized as
                /// row-major, top-down, left-to-right. The most significant bit of
                /// each byte corresponds to the leftmost or uppermost pixel from all
                /// bits of the byte. If a bit is set (1, `true`), the pixel is set to
                /// the font color, if a bit is clear (0, `false`), the pixel is
                /// transparent.
                /// 
                /// Rows are **not** padded to byte boundaries (i.e., a
                /// single byte may contain bits belonging to multiple rows). The last
                /// byte of the bitmap _is_ padded with zero bits at all unused least
                /// significant bit positions so that the bitmap ends on a byte
                /// boundary.
                /// </summary>
                public byte[] BitmapData { get { return _bitmapData; } }
                public Grub2Font M_Root { get { return m_root; } }
                public Grub2Font.ChixSection.Character M_Parent { get { return m_parent; } }
            }
            private List<Character> _characters;
            private Grub2Font m_root;
            private Grub2Font.Section m_parent;
            public List<Character> Characters { get { return _characters; } }
            public Grub2Font M_Root { get { return m_root; } }
            public Grub2Font.Section M_Parent { get { return m_parent; } }
        }
        public partial class DescSection : KaitaiStruct
        {
            public static DescSection FromFile(string fileName)
            {
                return new DescSection(new KaitaiStream(fileName));
            }

            public DescSection(KaitaiStream p__io, Grub2Font.Section p__parent = null, Grub2Font p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _descentInPixels = m_io.ReadU2be();
            }
            private ushort _descentInPixels;
            private Grub2Font m_root;
            private Grub2Font.Section m_parent;
            public ushort DescentInPixels { get { return _descentInPixels; } }
            public Grub2Font M_Root { get { return m_root; } }
            public Grub2Font.Section M_Parent { get { return m_parent; } }
        }
        public partial class FamiSection : KaitaiStruct
        {
            public static FamiSection FromFile(string fileName)
            {
                return new FamiSection(new KaitaiStream(fileName));
            }

            public FamiSection(KaitaiStream p__io, Grub2Font.Section p__parent = null, Grub2Font p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fontFamilyName = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(0, false, true, true));
            }
            private string _fontFamilyName;
            private Grub2Font m_root;
            private Grub2Font.Section m_parent;
            public string FontFamilyName { get { return _fontFamilyName; } }
            public Grub2Font M_Root { get { return m_root; } }
            public Grub2Font.Section M_Parent { get { return m_parent; } }
        }
        public partial class MaxhSection : KaitaiStruct
        {
            public static MaxhSection FromFile(string fileName)
            {
                return new MaxhSection(new KaitaiStream(fileName));
            }

            public MaxhSection(KaitaiStream p__io, Grub2Font.Section p__parent = null, Grub2Font p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _maximumCharacterHeight = m_io.ReadU2be();
            }
            private ushort _maximumCharacterHeight;
            private Grub2Font m_root;
            private Grub2Font.Section m_parent;
            public ushort MaximumCharacterHeight { get { return _maximumCharacterHeight; } }
            public Grub2Font M_Root { get { return m_root; } }
            public Grub2Font.Section M_Parent { get { return m_parent; } }
        }
        public partial class MaxwSection : KaitaiStruct
        {
            public static MaxwSection FromFile(string fileName)
            {
                return new MaxwSection(new KaitaiStream(fileName));
            }

            public MaxwSection(KaitaiStream p__io, Grub2Font.Section p__parent = null, Grub2Font p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _maximumCharacterWidth = m_io.ReadU2be();
            }
            private ushort _maximumCharacterWidth;
            private Grub2Font m_root;
            private Grub2Font.Section m_parent;
            public ushort MaximumCharacterWidth { get { return _maximumCharacterWidth; } }
            public Grub2Font M_Root { get { return m_root; } }
            public Grub2Font.Section M_Parent { get { return m_parent; } }
        }
        public partial class NameSection : KaitaiStruct
        {
            public static NameSection FromFile(string fileName)
            {
                return new NameSection(new KaitaiStream(fileName));
            }

            public NameSection(KaitaiStream p__io, Grub2Font.Section p__parent = null, Grub2Font p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fontName = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(0, false, true, true));
            }
            private string _fontName;
            private Grub2Font m_root;
            private Grub2Font.Section m_parent;
            public string FontName { get { return _fontName; } }
            public Grub2Font M_Root { get { return m_root; } }
            public Grub2Font.Section M_Parent { get { return m_parent; } }
        }
        public partial class PtszSection : KaitaiStruct
        {
            public static PtszSection FromFile(string fileName)
            {
                return new PtszSection(new KaitaiStream(fileName));
            }

            public PtszSection(KaitaiStream p__io, Grub2Font.Section p__parent = null, Grub2Font p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fontPointSize = m_io.ReadU2be();
            }
            private ushort _fontPointSize;
            private Grub2Font m_root;
            private Grub2Font.Section m_parent;
            public ushort FontPointSize { get { return _fontPointSize; } }
            public Grub2Font M_Root { get { return m_root; } }
            public Grub2Font.Section M_Parent { get { return m_parent; } }
        }
        public partial class Section : KaitaiStruct
        {
            public static Section FromFile(string fileName)
            {
                return new Section(new KaitaiStream(fileName));
            }

            public Section(KaitaiStream p__io, Grub2Font p__parent = null, Grub2Font p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _sectionType = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
                _lenBody = m_io.ReadU4be();
                if (SectionType != "DATA") {
                    switch (SectionType) {
                    case "ASCE": {
                        __raw_body = m_io.ReadBytes(LenBody);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new AsceSection(io___raw_body, this, m_root);
                        break;
                    }
                    case "CHIX": {
                        __raw_body = m_io.ReadBytes(LenBody);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new ChixSection(io___raw_body, this, m_root);
                        break;
                    }
                    case "DESC": {
                        __raw_body = m_io.ReadBytes(LenBody);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new DescSection(io___raw_body, this, m_root);
                        break;
                    }
                    case "FAMI": {
                        __raw_body = m_io.ReadBytes(LenBody);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new FamiSection(io___raw_body, this, m_root);
                        break;
                    }
                    case "MAXH": {
                        __raw_body = m_io.ReadBytes(LenBody);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new MaxhSection(io___raw_body, this, m_root);
                        break;
                    }
                    case "MAXW": {
                        __raw_body = m_io.ReadBytes(LenBody);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new MaxwSection(io___raw_body, this, m_root);
                        break;
                    }
                    case "NAME": {
                        __raw_body = m_io.ReadBytes(LenBody);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new NameSection(io___raw_body, this, m_root);
                        break;
                    }
                    case "PTSZ": {
                        __raw_body = m_io.ReadBytes(LenBody);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new PtszSection(io___raw_body, this, m_root);
                        break;
                    }
                    case "SLAN": {
                        __raw_body = m_io.ReadBytes(LenBody);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new SlanSection(io___raw_body, this, m_root);
                        break;
                    }
                    case "WEIG": {
                        __raw_body = m_io.ReadBytes(LenBody);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new WeigSection(io___raw_body, this, m_root);
                        break;
                    }
                    default: {
                        _body = m_io.ReadBytes(LenBody);
                        break;
                    }
                    }
                }
            }
            private string _sectionType;
            private uint _lenBody;
            private object _body;
            private Grub2Font m_root;
            private Grub2Font m_parent;
            private byte[] __raw_body;
            public string SectionType { get { return _sectionType; } }

            /// <summary>
            /// Should be set to `0xFFFF_FFFF` for `section_type != &quot;DATA&quot;`
            /// </summary>
            public uint LenBody { get { return _lenBody; } }
            public object Body { get { return _body; } }
            public Grub2Font M_Root { get { return m_root; } }
            public Grub2Font M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }
        public partial class SlanSection : KaitaiStruct
        {
            public static SlanSection FromFile(string fileName)
            {
                return new SlanSection(new KaitaiStream(fileName));
            }

            public SlanSection(KaitaiStream p__io, Grub2Font.Section p__parent = null, Grub2Font p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fontSlant = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(0, false, true, true));
            }
            private string _fontSlant;
            private Grub2Font m_root;
            private Grub2Font.Section m_parent;
            public string FontSlant { get { return _fontSlant; } }
            public Grub2Font M_Root { get { return m_root; } }
            public Grub2Font.Section M_Parent { get { return m_parent; } }
        }
        public partial class WeigSection : KaitaiStruct
        {
            public static WeigSection FromFile(string fileName)
            {
                return new WeigSection(new KaitaiStream(fileName));
            }

            public WeigSection(KaitaiStream p__io, Grub2Font.Section p__parent = null, Grub2Font p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fontWeight = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(0, false, true, true));
            }
            private string _fontWeight;
            private Grub2Font m_root;
            private Grub2Font.Section m_parent;
            public string FontWeight { get { return _fontWeight; } }
            public Grub2Font M_Root { get { return m_root; } }
            public Grub2Font.Section M_Parent { get { return m_parent; } }
        }
        private byte[] _magic;
        private List<Section> _sections;
        private Grub2Font m_root;
        private KaitaiStruct m_parent;
        public byte[] Magic { get { return _magic; } }

        /// <summary>
        /// The &quot;DATA&quot; section acts as a terminator. The documentation says:
        /// &quot;A marker that indicates the remainder of the file is data accessed
        /// via the character index (CHIX) section. When reading this font file,
        /// the rest of the file can be ignored when scanning the sections.&quot;
        /// </summary>
        public List<Section> Sections { get { return _sections; } }
        public Grub2Font M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
