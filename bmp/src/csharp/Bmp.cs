// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{
    public partial class Bmp : KaitaiStruct
    {
        public static Bmp FromFile(string fileName)
        {
            return new Bmp(new KaitaiStream(fileName));
        }

        public Bmp(KaitaiStream io, KaitaiStruct parent = null, Bmp root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            f_image = false;
            _read();
        }
        private void _read() {
            _fileHdr = new FileHeader(m_io, this, m_root);
            _dibHdr = new DibHeader(m_io, this, m_root);
            }
        public partial class FileHeader : KaitaiStruct
        {
            public static FileHeader FromFile(string fileName)
            {
                return new FileHeader(new KaitaiStream(fileName));
            }

            public FileHeader(KaitaiStream io, Bmp parent = null, Bmp root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _fileType = m_io.ReadBytes(2);
                _fileSize = m_io.ReadU4le();
                _reserved1 = m_io.ReadU2le();
                _reserved2 = m_io.ReadU2le();
                _bitmapOfs = m_io.ReadS4le();
                }
            private byte[] _fileType;
            private uint _fileSize;
            private ushort _reserved1;
            private ushort _reserved2;
            private int _bitmapOfs;
            private Bmp m_root;
            private Bmp m_parent;
            public byte[] FileType { get { return _fileType; } }
            public uint FileSize { get { return _fileSize; } }
            public ushort Reserved1 { get { return _reserved1; } }
            public ushort Reserved2 { get { return _reserved2; } }
            public int BitmapOfs { get { return _bitmapOfs; } }
            public Bmp M_Root { get { return m_root; } }
            public Bmp M_Parent { get { return m_parent; } }
        }
        public partial class DibHeader : KaitaiStruct
        {
            public static DibHeader FromFile(string fileName)
            {
                return new DibHeader(new KaitaiStream(fileName));
            }

            public DibHeader(KaitaiStream io, Bmp parent = null, Bmp root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _dibHeaderSize = m_io.ReadS4le();
                if (DibHeaderSize == 12) {
                    __raw_bitmapCoreHeader = m_io.ReadBytes((DibHeaderSize - 4));
                    var io___raw_bitmapCoreHeader = new KaitaiStream(__raw_bitmapCoreHeader);
                    _bitmapCoreHeader = new BitmapCoreHeader(io___raw_bitmapCoreHeader, this, m_root);
                }
                if (DibHeaderSize == 40) {
                    __raw_bitmapInfoHeader = m_io.ReadBytes((DibHeaderSize - 4));
                    var io___raw_bitmapInfoHeader = new KaitaiStream(__raw_bitmapInfoHeader);
                    _bitmapInfoHeader = new BitmapInfoHeader(io___raw_bitmapInfoHeader, this, m_root);
                }
                if (DibHeaderSize == 124) {
                    __raw_bitmapV5Header = m_io.ReadBytes((DibHeaderSize - 4));
                    var io___raw_bitmapV5Header = new KaitaiStream(__raw_bitmapV5Header);
                    _bitmapV5Header = new BitmapCoreHeader(io___raw_bitmapV5Header, this, m_root);
                }
                if ( ((DibHeaderSize != 12) && (DibHeaderSize != 40) && (DibHeaderSize != 124)) ) {
                    _dibHeaderBody = m_io.ReadBytes((DibHeaderSize - 4));
                }
                }
            private int _dibHeaderSize;
            private BitmapCoreHeader _bitmapCoreHeader;
            private BitmapInfoHeader _bitmapInfoHeader;
            private BitmapCoreHeader _bitmapV5Header;
            private byte[] _dibHeaderBody;
            private Bmp m_root;
            private Bmp m_parent;
            private byte[] __raw_bitmapCoreHeader;
            private byte[] __raw_bitmapInfoHeader;
            private byte[] __raw_bitmapV5Header;
            public int DibHeaderSize { get { return _dibHeaderSize; } }
            public BitmapCoreHeader BitmapCoreHeader { get { return _bitmapCoreHeader; } }
            public BitmapInfoHeader BitmapInfoHeader { get { return _bitmapInfoHeader; } }
            public BitmapCoreHeader BitmapV5Header { get { return _bitmapV5Header; } }
            public byte[] DibHeaderBody { get { return _dibHeaderBody; } }
            public Bmp M_Root { get { return m_root; } }
            public Bmp M_Parent { get { return m_parent; } }
            public byte[] M_RawBitmapCoreHeader { get { return __raw_bitmapCoreHeader; } }
            public byte[] M_RawBitmapInfoHeader { get { return __raw_bitmapInfoHeader; } }
            public byte[] M_RawBitmapV5Header { get { return __raw_bitmapV5Header; } }
        }
        public partial class BitmapCoreHeader : KaitaiStruct
        {
            public static BitmapCoreHeader FromFile(string fileName)
            {
                return new BitmapCoreHeader(new KaitaiStream(fileName));
            }

            public BitmapCoreHeader(KaitaiStream io, Bmp.DibHeader parent = null, Bmp root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
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
            private Bmp.DibHeader m_parent;
            public ushort ImageWidth { get { return _imageWidth; } }
            public ushort ImageHeight { get { return _imageHeight; } }
            public ushort NumPlanes { get { return _numPlanes; } }
            public ushort BitsPerPixel { get { return _bitsPerPixel; } }
            public Bmp M_Root { get { return m_root; } }
            public Bmp.DibHeader M_Parent { get { return m_parent; } }
        }
        public partial class BitmapInfoHeader : KaitaiStruct
        {
            public static BitmapInfoHeader FromFile(string fileName)
            {
                return new BitmapInfoHeader(new KaitaiStream(fileName));
            }

            public BitmapInfoHeader(KaitaiStream io, Bmp.DibHeader parent = null, Bmp root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _imageWidth = m_io.ReadU4le();
                _imageHeight = m_io.ReadU4le();
                _numPlanes = m_io.ReadU2le();
                _bitsPerPixel = m_io.ReadU2le();
                _compression = m_io.ReadU4le();
                _sizeImage = m_io.ReadU4le();
                _xPxPerM = m_io.ReadU4le();
                _yPxPerM = m_io.ReadU4le();
                _numColorsUsed = m_io.ReadU4le();
                _numColorsImportant = m_io.ReadU4le();
                }
            private uint _imageWidth;
            private uint _imageHeight;
            private ushort _numPlanes;
            private ushort _bitsPerPixel;
            private uint _compression;
            private uint _sizeImage;
            private uint _xPxPerM;
            private uint _yPxPerM;
            private uint _numColorsUsed;
            private uint _numColorsImportant;
            private Bmp m_root;
            private Bmp.DibHeader m_parent;
            public uint ImageWidth { get { return _imageWidth; } }
            public uint ImageHeight { get { return _imageHeight; } }
            public ushort NumPlanes { get { return _numPlanes; } }
            public ushort BitsPerPixel { get { return _bitsPerPixel; } }
            public uint Compression { get { return _compression; } }
            public uint SizeImage { get { return _sizeImage; } }
            public uint XPxPerM { get { return _xPxPerM; } }
            public uint YPxPerM { get { return _yPxPerM; } }
            public uint NumColorsUsed { get { return _numColorsUsed; } }
            public uint NumColorsImportant { get { return _numColorsImportant; } }
            public Bmp M_Root { get { return m_root; } }
            public Bmp.DibHeader M_Parent { get { return m_parent; } }
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
                m_io.Seek(FileHdr.BitmapOfs);
                _image = m_io.ReadBytesFull();
                m_io.Seek(_pos);
                f_image = true;
                return _image;
            }
        }
        private FileHeader _fileHdr;
        private DibHeader _dibHdr;
        private Bmp m_root;
        private KaitaiStruct m_parent;
        public FileHeader FileHdr { get { return _fileHdr; } }
        public DibHeader DibHdr { get { return _dibHdr; } }
        public Bmp M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
