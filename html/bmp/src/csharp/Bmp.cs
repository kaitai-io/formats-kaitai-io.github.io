// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{
    public partial class Bmp : KaitaiStruct
    {
        public static Bmp FromFile(string fileName)
        {
            return new Bmp(new KaitaiStream(fileName));
        }


        public enum Compressions
        {
            Rgb = 0,
            Rle8 = 1,
            Rle4 = 2,
            Bitfields = 3,
            Jpeg = 4,
            Png = 5,
            Cmyk = 11,
            CmykRle8 = 12,
            CmykRle4 = 13,
        }
        public Bmp(KaitaiStream p__io, KaitaiStruct p__parent = null, Bmp p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_image = false;
            _read();
        }
        private void _read()
        {
            _fileHdr = new FileHeader(m_io, this, m_root);
            _lenDibHeader = m_io.ReadS4le();
            switch (LenDibHeader) {
            case 104: {
                __raw_dibHeader = m_io.ReadBytes((LenDibHeader - 4));
                var io___raw_dibHeader = new KaitaiStream(__raw_dibHeader);
                _dibHeader = new BitmapCoreHeader(io___raw_dibHeader, this, m_root);
                break;
            }
            case 12: {
                __raw_dibHeader = m_io.ReadBytes((LenDibHeader - 4));
                var io___raw_dibHeader = new KaitaiStream(__raw_dibHeader);
                _dibHeader = new BitmapCoreHeader(io___raw_dibHeader, this, m_root);
                break;
            }
            case 40: {
                __raw_dibHeader = m_io.ReadBytes((LenDibHeader - 4));
                var io___raw_dibHeader = new KaitaiStream(__raw_dibHeader);
                _dibHeader = new BitmapInfoHeader(io___raw_dibHeader, this, m_root);
                break;
            }
            case 124: {
                __raw_dibHeader = m_io.ReadBytes((LenDibHeader - 4));
                var io___raw_dibHeader = new KaitaiStream(__raw_dibHeader);
                _dibHeader = new BitmapCoreHeader(io___raw_dibHeader, this, m_root);
                break;
            }
            default: {
                _dibHeader = m_io.ReadBytes((LenDibHeader - 4));
                break;
            }
            }
        }

        /// <remarks>
        /// Reference: <a href="https://msdn.microsoft.com/en-us/library/dd183374.aspx">Source</a>
        /// </remarks>
        public partial class FileHeader : KaitaiStruct
        {
            public static FileHeader FromFile(string fileName)
            {
                return new FileHeader(new KaitaiStream(fileName));
            }

            public FileHeader(KaitaiStream p__io, Bmp p__parent = null, Bmp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.EnsureFixedContents(new byte[] { 66, 77 });
                _lenFile = m_io.ReadU4le();
                _reserved1 = m_io.ReadU2le();
                _reserved2 = m_io.ReadU2le();
                _ofsBitmap = m_io.ReadS4le();
            }
            private byte[] _magic;
            private uint _lenFile;
            private ushort _reserved1;
            private ushort _reserved2;
            private int _ofsBitmap;
            private Bmp m_root;
            private Bmp m_parent;
            public byte[] Magic { get { return _magic; } }
            public uint LenFile { get { return _lenFile; } }
            public ushort Reserved1 { get { return _reserved1; } }
            public ushort Reserved2 { get { return _reserved2; } }

            /// <summary>
            /// Offset to actual raw pixel data of the image
            /// </summary>
            public int OfsBitmap { get { return _ofsBitmap; } }
            public Bmp M_Root { get { return m_root; } }
            public Bmp M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://msdn.microsoft.com/en-us/library/dd183372.aspx">Source</a>
        /// </remarks>
        public partial class BitmapCoreHeader : KaitaiStruct
        {
            public static BitmapCoreHeader FromFile(string fileName)
            {
                return new BitmapCoreHeader(new KaitaiStream(fileName));
            }

            public BitmapCoreHeader(KaitaiStream p__io, Bmp p__parent = null, Bmp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _imageWidth = m_io.ReadU2le();
                _imageHeight = m_io.ReadU2le();
                _numPlanes = m_io.ReadU2le();
                _bitsPerPixel = m_io.ReadU2le();
            }
            private ushort _imageWidth;
            private ushort _imageHeight;
            private ushort _numPlanes;
            private ushort _bitsPerPixel;
            private Bmp m_root;
            private Bmp m_parent;

            /// <summary>
            /// Image width, px
            /// </summary>
            public ushort ImageWidth { get { return _imageWidth; } }

            /// <summary>
            /// Image height, px
            /// </summary>
            public ushort ImageHeight { get { return _imageHeight; } }

            /// <summary>
            /// Number of planes for target device, must be 1
            /// </summary>
            public ushort NumPlanes { get { return _numPlanes; } }

            /// <summary>
            /// Number of bits per pixel that image buffer uses (1, 4, 8, or 24)
            /// </summary>
            public ushort BitsPerPixel { get { return _bitsPerPixel; } }
            public Bmp M_Root { get { return m_root; } }
            public Bmp M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://msdn.microsoft.com/en-us/library/dd183376.aspx">Source</a>
        /// </remarks>
        public partial class BitmapInfoHeader : KaitaiStruct
        {
            public static BitmapInfoHeader FromFile(string fileName)
            {
                return new BitmapInfoHeader(new KaitaiStream(fileName));
            }

            public BitmapInfoHeader(KaitaiStream p__io, Bmp p__parent = null, Bmp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _imageWidth = m_io.ReadU4le();
                _imageHeight = m_io.ReadU4le();
                _numPlanes = m_io.ReadU2le();
                _bitsPerPixel = m_io.ReadU2le();
                _compression = ((Bmp.Compressions) m_io.ReadU4le());
                _lenImage = m_io.ReadU4le();
                _xPxPerM = m_io.ReadU4le();
                _yPxPerM = m_io.ReadU4le();
                _numColorsUsed = m_io.ReadU4le();
                _numColorsImportant = m_io.ReadU4le();
            }
            private uint _imageWidth;
            private uint _imageHeight;
            private ushort _numPlanes;
            private ushort _bitsPerPixel;
            private Compressions _compression;
            private uint _lenImage;
            private uint _xPxPerM;
            private uint _yPxPerM;
            private uint _numColorsUsed;
            private uint _numColorsImportant;
            private Bmp m_root;
            private Bmp m_parent;
            public uint ImageWidth { get { return _imageWidth; } }
            public uint ImageHeight { get { return _imageHeight; } }
            public ushort NumPlanes { get { return _numPlanes; } }
            public ushort BitsPerPixel { get { return _bitsPerPixel; } }
            public Compressions Compression { get { return _compression; } }
            public uint LenImage { get { return _lenImage; } }
            public uint XPxPerM { get { return _xPxPerM; } }
            public uint YPxPerM { get { return _yPxPerM; } }
            public uint NumColorsUsed { get { return _numColorsUsed; } }
            public uint NumColorsImportant { get { return _numColorsImportant; } }
            public Bmp M_Root { get { return m_root; } }
            public Bmp M_Parent { get { return m_parent; } }
        }
        private bool f_image;
        private byte[] _image;
        public byte[] Image
        {
            get
            {
                if (f_image)
                    return _image;
                long _pos = m_io.Pos;
                m_io.Seek(FileHdr.OfsBitmap);
                _image = m_io.ReadBytesFull();
                m_io.Seek(_pos);
                f_image = true;
                return _image;
            }
        }
        private FileHeader _fileHdr;
        private int _lenDibHeader;
        private object _dibHeader;
        private Bmp m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_dibHeader;
        public FileHeader FileHdr { get { return _fileHdr; } }
        public int LenDibHeader { get { return _lenDibHeader; } }
        public object DibHeader { get { return _dibHeader; } }
        public Bmp M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawDibHeader { get { return __raw_dibHeader; } }
    }
}
