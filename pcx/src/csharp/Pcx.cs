// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// PCX is a bitmap image format originally used by PC Paintbrush from
    /// ZSoft Corporation. Originally, it was a relatively simple 128-byte
    /// header + uncompressed bitmap format, but latest versions introduced
    /// more complicated palette support and RLE compression.
    /// 
    /// There's an option to encode 32-bit or 16-bit RGBA pixels, and thus
    /// it can potentially include transparency. Theoretically, it's
    /// possible to encode resolution or pixel density in the some of the
    /// header fields too, but in reality there's no uniform standard for
    /// these, so different implementations treat these differently.
    /// 
    /// PCX format was never made a formal standard. &quot;ZSoft Corporation
    /// Technical Reference Manual&quot; for &quot;Image File (.PCX) Format&quot;, last
    /// updated in 1991, is likely the closest authoritative source.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="http://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt">Source</a>
    /// </remarks>
    public partial class Pcx : KaitaiStruct
    {
        public static Pcx FromFile(string fileName)
        {
            return new Pcx(new KaitaiStream(fileName));
        }


        public enum Versions
        {
            V25 = 0,
            V28WithPalette = 2,
            V28WithoutPalette = 3,
            PaintbrushForWindows = 4,
            V30 = 5,
        }

        public enum Encodings
        {
            Rle = 1,
        }
        public Pcx(KaitaiStream p__io, KaitaiStruct p__parent = null, Pcx p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_palette256 = false;
            _read();
        }
        private void _read()
        {
            __raw_hdr = m_io.ReadBytes(128);
            var io___raw_hdr = new KaitaiStream(__raw_hdr);
            _hdr = new Header(io___raw_hdr, this, m_root);
        }

        /// <remarks>
        /// Reference: <a href="http://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt">- "ZSoft .PCX FILE HEADER FORMAT"</a>
        /// </remarks>
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, Pcx p__parent = null, Pcx p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 10 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 10 }, Magic, M_Io, "/types/header/seq/0");
                }
                _version = ((Pcx.Versions) m_io.ReadU1());
                _encoding = ((Pcx.Encodings) m_io.ReadU1());
                _bitsPerPixel = m_io.ReadU1();
                _imgXMin = m_io.ReadU2le();
                _imgYMin = m_io.ReadU2le();
                _imgXMax = m_io.ReadU2le();
                _imgYMax = m_io.ReadU2le();
                _hdpi = m_io.ReadU2le();
                _vdpi = m_io.ReadU2le();
                _palette16 = m_io.ReadBytes(48);
                _reserved = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(Reserved, new byte[] { 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0 }, Reserved, M_Io, "/types/header/seq/11");
                }
                _numPlanes = m_io.ReadU1();
                _bytesPerLine = m_io.ReadU2le();
                _paletteInfo = m_io.ReadU2le();
                _hScreenSize = m_io.ReadU2le();
                _vScreenSize = m_io.ReadU2le();
            }
            private byte[] _magic;
            private Versions _version;
            private Encodings _encoding;
            private byte _bitsPerPixel;
            private ushort _imgXMin;
            private ushort _imgYMin;
            private ushort _imgXMax;
            private ushort _imgYMax;
            private ushort _hdpi;
            private ushort _vdpi;
            private byte[] _palette16;
            private byte[] _reserved;
            private byte _numPlanes;
            private ushort _bytesPerLine;
            private ushort _paletteInfo;
            private ushort _hScreenSize;
            private ushort _vScreenSize;
            private Pcx m_root;
            private Pcx m_parent;

            /// <summary>
            /// Technically, this field was supposed to be &quot;manufacturer&quot;
            /// mark to distinguish between various software vendors, and
            /// 0x0a was supposed to mean &quot;ZSoft&quot;, but everyone else ended
            /// up writing a 0x0a into this field, so that's what majority
            /// of modern software expects to have in this attribute.
            /// </summary>
            public byte[] Magic { get { return _magic; } }
            public Versions Version { get { return _version; } }
            public Encodings Encoding { get { return _encoding; } }
            public byte BitsPerPixel { get { return _bitsPerPixel; } }
            public ushort ImgXMin { get { return _imgXMin; } }
            public ushort ImgYMin { get { return _imgYMin; } }
            public ushort ImgXMax { get { return _imgXMax; } }
            public ushort ImgYMax { get { return _imgYMax; } }
            public ushort Hdpi { get { return _hdpi; } }
            public ushort Vdpi { get { return _vdpi; } }
            public byte[] Palette16 { get { return _palette16; } }
            public byte[] Reserved { get { return _reserved; } }
            public byte NumPlanes { get { return _numPlanes; } }
            public ushort BytesPerLine { get { return _bytesPerLine; } }
            public ushort PaletteInfo { get { return _paletteInfo; } }
            public ushort HScreenSize { get { return _hScreenSize; } }
            public ushort VScreenSize { get { return _vScreenSize; } }
            public Pcx M_Root { get { return m_root; } }
            public Pcx M_Parent { get { return m_parent; } }
        }
        public partial class TPalette256 : KaitaiStruct
        {
            public static TPalette256 FromFile(string fileName)
            {
                return new TPalette256(new KaitaiStream(fileName));
            }

            public TPalette256(KaitaiStream p__io, Pcx p__parent = null, Pcx p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 12 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 12 }, Magic, M_Io, "/types/t_palette_256/seq/0");
                }
                _colors = new List<Rgb>((int) (256));
                for (var i = 0; i < 256; i++)
                {
                    _colors.Add(new Rgb(m_io, this, m_root));
                }
            }
            private byte[] _magic;
            private List<Rgb> _colors;
            private Pcx m_root;
            private Pcx m_parent;
            public byte[] Magic { get { return _magic; } }
            public List<Rgb> Colors { get { return _colors; } }
            public Pcx M_Root { get { return m_root; } }
            public Pcx M_Parent { get { return m_parent; } }
        }
        public partial class Rgb : KaitaiStruct
        {
            public static Rgb FromFile(string fileName)
            {
                return new Rgb(new KaitaiStream(fileName));
            }

            public Rgb(KaitaiStream p__io, Pcx.TPalette256 p__parent = null, Pcx p__root = null) : base(p__io)
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
            private Pcx m_root;
            private Pcx.TPalette256 m_parent;
            public byte R { get { return _r; } }
            public byte G { get { return _g; } }
            public byte B { get { return _b; } }
            public Pcx M_Root { get { return m_root; } }
            public Pcx.TPalette256 M_Parent { get { return m_parent; } }
        }
        private bool f_palette256;
        private TPalette256 _palette256;

        /// <remarks>
        /// Reference: <a href="http://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt">- "VGA 256 Color Palette Information"</a>
        /// </remarks>
        public TPalette256 Palette256
        {
            get
            {
                if (f_palette256)
                    return _palette256;
                if ( ((Hdr.Version == Versions.V30) && (Hdr.BitsPerPixel == 8) && (Hdr.NumPlanes == 1)) ) {
                    long _pos = m_io.Pos;
                    m_io.Seek((M_Io.Size - 769));
                    _palette256 = new TPalette256(m_io, this, m_root);
                    m_io.Seek(_pos);
                    f_palette256 = true;
                }
                return _palette256;
            }
        }
        private Header _hdr;
        private Pcx m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_hdr;
        public Header Hdr { get { return _hdr; } }
        public Pcx M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawHdr { get { return __raw_hdr; } }
    }
}
