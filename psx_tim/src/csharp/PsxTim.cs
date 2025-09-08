// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="http://fileformats.archiveteam.org/wiki/TIM_(PlayStation_graphics)">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://mrclick.zophar.net/TilEd/download/timgfx.txt">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://www.romhacking.net/documents/31/">Source</a>
    /// </remarks>
    public partial class PsxTim : KaitaiStruct
    {
        public static PsxTim FromFile(string fileName)
        {
            return new PsxTim(new KaitaiStream(fileName));
        }


        public enum BppType
        {
            Bpp4 = 0,
            Bpp8 = 1,
            Bpp16 = 2,
            Bpp24 = 3,
        }
        public PsxTim(KaitaiStream p__io, KaitaiStruct p__parent = null, PsxTim p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_bpp = false;
            f_hasClut = false;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 16, 0, 0, 0 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 16, 0, 0, 0 }, _magic, m_io, "/seq/0");
            }
            _flags = m_io.ReadU4le();
            if (HasClut) {
                _clut = new Bitmap(m_io, this, m_root);
            }
            _img = new Bitmap(m_io, this, m_root);
        }
        public partial class Bitmap : KaitaiStruct
        {
            public static Bitmap FromFile(string fileName)
            {
                return new Bitmap(new KaitaiStream(fileName));
            }

            public Bitmap(KaitaiStream p__io, PsxTim p__parent = null, PsxTim p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU4le();
                _originX = m_io.ReadU2le();
                _originY = m_io.ReadU2le();
                _width = m_io.ReadU2le();
                _height = m_io.ReadU2le();
                _body = m_io.ReadBytes(Len - 12);
            }
            private uint _len;
            private ushort _originX;
            private ushort _originY;
            private ushort _width;
            private ushort _height;
            private byte[] _body;
            private PsxTim m_root;
            private PsxTim m_parent;
            public uint Len { get { return _len; } }
            public ushort OriginX { get { return _originX; } }
            public ushort OriginY { get { return _originY; } }
            public ushort Width { get { return _width; } }
            public ushort Height { get { return _height; } }
            public byte[] Body { get { return _body; } }
            public PsxTim M_Root { get { return m_root; } }
            public PsxTim M_Parent { get { return m_parent; } }
        }
        private bool f_bpp;
        private int _bpp;
        public int Bpp
        {
            get
            {
                if (f_bpp)
                    return _bpp;
                f_bpp = true;
                _bpp = (int) (Flags & 3);
                return _bpp;
            }
        }
        private bool f_hasClut;
        private bool _hasClut;
        public bool HasClut
        {
            get
            {
                if (f_hasClut)
                    return _hasClut;
                f_hasClut = true;
                _hasClut = (bool) ((Flags & 8) != 0);
                return _hasClut;
            }
        }
        private byte[] _magic;
        private uint _flags;
        private Bitmap _clut;
        private Bitmap _img;
        private PsxTim m_root;
        private KaitaiStruct m_parent;
        public byte[] Magic { get { return _magic; } }

        /// <summary>
        /// Encodes bits-per-pixel and whether CLUT is present in a file or not
        /// </summary>
        public uint Flags { get { return _flags; } }

        /// <summary>
        /// CLUT (Color LookUp Table), one or several palettes for indexed color image, represented as a
        /// </summary>
        public Bitmap Clut { get { return _clut; } }
        public Bitmap Img { get { return _img; } }
        public PsxTim M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
