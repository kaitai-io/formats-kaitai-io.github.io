// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{
    public partial class Pcx : KaitaiStruct
    {
        public static Pcx FromFile(string fileName)
        {
            return new Pcx(new KaitaiStream(fileName));
        }

        public Pcx(KaitaiStream io, KaitaiStruct parent = null, Pcx root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            _read();
        }
        private void _read() {
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

            public Header(KaitaiStream io, Pcx parent = null, Pcx root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _manufacturer = m_io.ReadU1();
                _version = m_io.ReadU1();
                _encoding = m_io.ReadU1();
                _bitsPerPixel = m_io.ReadU1();
                _imgXMin = m_io.ReadU2le();
                _imgYMin = m_io.ReadU2le();
                _imgXMax = m_io.ReadU2le();
                _imgYMax = m_io.ReadU2le();
                _hdpi = m_io.ReadU2le();
                _vdpi = m_io.ReadU2le();
                _colormap = m_io.ReadBytes(48);
                _reserved = m_io.ReadBytes(1);
                _numPlanes = m_io.ReadU1();
                _bytesPerLine = m_io.ReadU2le();
                _paletteInfo = m_io.ReadU2le();
                _hScreenSize = m_io.ReadU2le();
                _vScreenSize = m_io.ReadU2le();
                }
            private byte _manufacturer;
            private byte _version;
            private byte _encoding;
            private byte _bitsPerPixel;
            private ushort _imgXMin;
            private ushort _imgYMin;
            private ushort _imgXMax;
            private ushort _imgYMax;
            private ushort _hdpi;
            private ushort _vdpi;
            private byte[] _colormap;
            private byte[] _reserved;
            private byte _numPlanes;
            private ushort _bytesPerLine;
            private ushort _paletteInfo;
            private ushort _hScreenSize;
            private ushort _vScreenSize;
            private Pcx m_root;
            private Pcx m_parent;
            public byte Manufacturer { get { return _manufacturer; } }
            public byte Version { get { return _version; } }
            public byte Encoding { get { return _encoding; } }
            public byte BitsPerPixel { get { return _bitsPerPixel; } }
            public ushort ImgXMin { get { return _imgXMin; } }
            public ushort ImgYMin { get { return _imgYMin; } }
            public ushort ImgXMax { get { return _imgXMax; } }
            public ushort ImgYMax { get { return _imgYMax; } }
            public ushort Hdpi { get { return _hdpi; } }
            public ushort Vdpi { get { return _vdpi; } }
            public byte[] Colormap { get { return _colormap; } }
            public byte[] Reserved { get { return _reserved; } }
            public byte NumPlanes { get { return _numPlanes; } }
            public ushort BytesPerLine { get { return _bytesPerLine; } }
            public ushort PaletteInfo { get { return _paletteInfo; } }
            public ushort HScreenSize { get { return _hScreenSize; } }
            public ushort VScreenSize { get { return _vScreenSize; } }
            public Pcx M_Root { get { return m_root; } }
            public Pcx M_Parent { get { return m_parent; } }
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
