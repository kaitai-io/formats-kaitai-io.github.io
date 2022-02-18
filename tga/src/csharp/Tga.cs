// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// TGA (AKA Truevision TGA, AKA TARGA), is a raster image file format created by Truevision. It supports up to 32 bits per pixel (three 8-bit RGB channels + 8-bit alpha channel), color mapping and optional lossless RLE compression.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://www.dca.fee.unicamp.br/~martino/disciplinas/ea978/tgaffs.pdf">Source</a>
    /// </remarks>
    public partial class Tga : KaitaiStruct
    {
        public static Tga FromFile(string fileName)
        {
            return new Tga(new KaitaiStream(fileName));
        }


        public enum ColorMapEnum
        {
            NoColorMap = 0,
            HasColorMap = 1,
        }

        public enum ImageTypeEnum
        {
            NoImageData = 0,
            UncompColorMapped = 1,
            UncompTrueColor = 2,
            UncompBw = 3,
            RleColorMapped = 9,
            RleTrueColor = 10,
            RleBw = 11,
        }
        public Tga(KaitaiStream p__io, KaitaiStruct p__parent = null, Tga p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_footer = false;
            _read();
        }
        private void _read()
        {
            _imageIdLen = m_io.ReadU1();
            _colorMapType = ((ColorMapEnum) m_io.ReadU1());
            _imageType = ((ImageTypeEnum) m_io.ReadU1());
            _colorMapOfs = m_io.ReadU2le();
            _numColorMap = m_io.ReadU2le();
            _colorMapDepth = m_io.ReadU1();
            _xOffset = m_io.ReadU2le();
            _yOffset = m_io.ReadU2le();
            _width = m_io.ReadU2le();
            _height = m_io.ReadU2le();
            _imageDepth = m_io.ReadU1();
            _imgDescriptor = m_io.ReadU1();
            _imageId = m_io.ReadBytes(ImageIdLen);
            if (ColorMapType == ColorMapEnum.HasColorMap) {
                _colorMap = new List<byte[]>((int) (NumColorMap));
                for (var i = 0; i < NumColorMap; i++)
                {
                    _colorMap.Add(m_io.ReadBytes(((ColorMapDepth + 7) / 8)));
                }
            }
        }
        public partial class TgaFooter : KaitaiStruct
        {
            public static TgaFooter FromFile(string fileName)
            {
                return new TgaFooter(new KaitaiStream(fileName));
            }

            public TgaFooter(KaitaiStream p__io, Tga p__parent = null, Tga p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_isValid = false;
                f_extArea = false;
                _read();
            }
            private void _read()
            {
                _extAreaOfs = m_io.ReadU4le();
                _devDirOfs = m_io.ReadU4le();
                _versionMagic = m_io.ReadBytes(18);
            }
            private bool f_isValid;
            private bool _isValid;
            public bool IsValid
            {
                get
                {
                    if (f_isValid)
                        return _isValid;
                    _isValid = (bool) ((KaitaiStream.ByteArrayCompare(VersionMagic, new byte[] { 84, 82, 85, 69, 86, 73, 83, 73, 79, 78, 45, 88, 70, 73, 76, 69, 46, 0 }) == 0));
                    f_isValid = true;
                    return _isValid;
                }
            }
            private bool f_extArea;
            private TgaExtArea _extArea;
            public TgaExtArea ExtArea
            {
                get
                {
                    if (f_extArea)
                        return _extArea;
                    if (IsValid) {
                        long _pos = m_io.Pos;
                        m_io.Seek(ExtAreaOfs);
                        _extArea = new TgaExtArea(m_io, this, m_root);
                        m_io.Seek(_pos);
                        f_extArea = true;
                    }
                    return _extArea;
                }
            }
            private uint _extAreaOfs;
            private uint _devDirOfs;
            private byte[] _versionMagic;
            private Tga m_root;
            private Tga m_parent;

            /// <summary>
            /// Offset to extension area
            /// </summary>
            public uint ExtAreaOfs { get { return _extAreaOfs; } }

            /// <summary>
            /// Offset to developer directory
            /// </summary>
            public uint DevDirOfs { get { return _devDirOfs; } }
            public byte[] VersionMagic { get { return _versionMagic; } }
            public Tga M_Root { get { return m_root; } }
            public Tga M_Parent { get { return m_parent; } }
        }
        public partial class TgaExtArea : KaitaiStruct
        {
            public static TgaExtArea FromFile(string fileName)
            {
                return new TgaExtArea(new KaitaiStream(fileName));
            }

            public TgaExtArea(KaitaiStream p__io, Tga.TgaFooter p__parent = null, Tga p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _extAreaSize = m_io.ReadU2le();
                _authorName = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(41));
                _comments = new List<string>((int) (4));
                for (var i = 0; i < 4; i++)
                {
                    _comments.Add(System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(81)));
                }
                _timestamp = m_io.ReadBytes(12);
                _jobId = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(41));
                _jobTime = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(6));
                _softwareId = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(41));
                _softwareVersion = m_io.ReadBytes(3);
                _keyColor = m_io.ReadU4le();
                _pixelAspectRatio = m_io.ReadU4le();
                _gammaValue = m_io.ReadU4le();
                _colorCorrOfs = m_io.ReadU4le();
                _postageStampOfs = m_io.ReadU4le();
                _scanLineOfs = m_io.ReadU4le();
                _attributes = m_io.ReadU1();
            }
            private ushort _extAreaSize;
            private string _authorName;
            private List<string> _comments;
            private byte[] _timestamp;
            private string _jobId;
            private string _jobTime;
            private string _softwareId;
            private byte[] _softwareVersion;
            private uint _keyColor;
            private uint _pixelAspectRatio;
            private uint _gammaValue;
            private uint _colorCorrOfs;
            private uint _postageStampOfs;
            private uint _scanLineOfs;
            private byte _attributes;
            private Tga m_root;
            private Tga.TgaFooter m_parent;

            /// <summary>
            /// Extension area size in bytes (always 495)
            /// </summary>
            public ushort ExtAreaSize { get { return _extAreaSize; } }
            public string AuthorName { get { return _authorName; } }

            /// <summary>
            /// Comments, organized as four lines, each consisting of 80 characters plus a NULL
            /// </summary>
            public List<string> Comments { get { return _comments; } }

            /// <summary>
            /// Image creation date / time
            /// </summary>
            public byte[] Timestamp { get { return _timestamp; } }

            /// <summary>
            /// Internal job ID, to be used in image workflow systems
            /// </summary>
            public string JobId { get { return _jobId; } }

            /// <summary>
            /// Hours, minutes and seconds spent creating the file (for billing, etc.)
            /// </summary>
            public string JobTime { get { return _jobTime; } }

            /// <summary>
            /// The application that created the file.
            /// </summary>
            public string SoftwareId { get { return _softwareId; } }
            public byte[] SoftwareVersion { get { return _softwareVersion; } }
            public uint KeyColor { get { return _keyColor; } }
            public uint PixelAspectRatio { get { return _pixelAspectRatio; } }
            public uint GammaValue { get { return _gammaValue; } }

            /// <summary>
            /// Number of bytes from the beginning of the file to the color correction table if present
            /// </summary>
            public uint ColorCorrOfs { get { return _colorCorrOfs; } }

            /// <summary>
            /// Number of bytes from the beginning of the file to the postage stamp image if present
            /// </summary>
            public uint PostageStampOfs { get { return _postageStampOfs; } }

            /// <summary>
            /// Number of bytes from the beginning of the file to the scan lines table if present
            /// </summary>
            public uint ScanLineOfs { get { return _scanLineOfs; } }

            /// <summary>
            /// Specifies the alpha channel
            /// </summary>
            public byte Attributes { get { return _attributes; } }
            public Tga M_Root { get { return m_root; } }
            public Tga.TgaFooter M_Parent { get { return m_parent; } }
        }
        private bool f_footer;
        private TgaFooter _footer;
        public TgaFooter Footer
        {
            get
            {
                if (f_footer)
                    return _footer;
                long _pos = m_io.Pos;
                m_io.Seek((M_Io.Size - 26));
                _footer = new TgaFooter(m_io, this, m_root);
                m_io.Seek(_pos);
                f_footer = true;
                return _footer;
            }
        }
        private byte _imageIdLen;
        private ColorMapEnum _colorMapType;
        private ImageTypeEnum _imageType;
        private ushort _colorMapOfs;
        private ushort _numColorMap;
        private byte _colorMapDepth;
        private ushort _xOffset;
        private ushort _yOffset;
        private ushort _width;
        private ushort _height;
        private byte _imageDepth;
        private byte _imgDescriptor;
        private byte[] _imageId;
        private List<byte[]> _colorMap;
        private Tga m_root;
        private KaitaiStruct m_parent;
        public byte ImageIdLen { get { return _imageIdLen; } }
        public ColorMapEnum ColorMapType { get { return _colorMapType; } }
        public ImageTypeEnum ImageType { get { return _imageType; } }
        public ushort ColorMapOfs { get { return _colorMapOfs; } }

        /// <summary>
        /// Number of entries in a color map
        /// </summary>
        public ushort NumColorMap { get { return _numColorMap; } }

        /// <summary>
        /// Number of bits in a each color maps entry
        /// </summary>
        public byte ColorMapDepth { get { return _colorMapDepth; } }
        public ushort XOffset { get { return _xOffset; } }
        public ushort YOffset { get { return _yOffset; } }

        /// <summary>
        /// Width of the image, in pixels
        /// </summary>
        public ushort Width { get { return _width; } }

        /// <summary>
        /// Height of the image, in pixels
        /// </summary>
        public ushort Height { get { return _height; } }
        public byte ImageDepth { get { return _imageDepth; } }
        public byte ImgDescriptor { get { return _imgDescriptor; } }

        /// <summary>
        /// Arbitrary application-specific information that is used to
        /// identify image. May contain text or some binary data.
        /// </summary>
        public byte[] ImageId { get { return _imageId; } }

        /// <summary>
        /// Color map
        /// </summary>
        public List<byte[]> ColorMap { get { return _colorMap; } }
        public Tga M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
