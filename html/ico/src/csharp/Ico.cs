// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Microsoft Windows uses specific file format to store applications
    /// icons - ICO. This is a container that contains one or more image
    /// files (effectively, DIB parts of BMP files or full PNG files are
    /// contained inside).
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://msdn.microsoft.com/en-us/library/ms997538.aspx">Source</a>
    /// </remarks>
    public partial class Ico : KaitaiStruct
    {
        public static Ico FromFile(string fileName)
        {
            return new Ico(new KaitaiStream(fileName));
        }

        public Ico(KaitaiStream p__io, KaitaiStruct p__parent = null, Ico p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _magic = m_io.EnsureFixedContents(new byte[] { 0, 0, 1, 0 });
            _numImages = m_io.ReadU2le();
            _images = new List<IconDirEntry>((int) (NumImages));
            for (var i = 0; i < NumImages; i++)
            {
                _images.Add(new IconDirEntry(m_io, this, m_root));
            }
        }
        public partial class IconDirEntry : KaitaiStruct
        {
            public static IconDirEntry FromFile(string fileName)
            {
                return new IconDirEntry(new KaitaiStream(fileName));
            }

            public IconDirEntry(KaitaiStream p__io, Ico p__parent = null, Ico p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_img = false;
                f_pngHeader = false;
                f_isPng = false;
                _read();
            }
            private void _read()
            {
                _width = m_io.ReadU1();
                _height = m_io.ReadU1();
                _numColors = m_io.ReadU1();
                _reserved = m_io.EnsureFixedContents(new byte[] { 0 });
                _numPlanes = m_io.ReadU2le();
                _bpp = m_io.ReadU2le();
                _lenImg = m_io.ReadU4le();
                _ofsImg = m_io.ReadU4le();
            }
            private bool f_img;
            private byte[] _img;

            /// <summary>
            /// Raw image data. Use `is_png` to determine whether this is an
            /// embedded PNG file (true) or a DIB bitmap (false) and call a
            /// relevant parser, if needed to parse image data further.
            /// </summary>
            public byte[] Img
            {
                get
                {
                    if (f_img)
                        return _img;
                    long _pos = m_io.Pos;
                    m_io.Seek(OfsImg);
                    _img = m_io.ReadBytes(LenImg);
                    m_io.Seek(_pos);
                    f_img = true;
                    return _img;
                }
            }
            private bool f_pngHeader;
            private byte[] _pngHeader;

            /// <summary>
            /// Pre-reads first 8 bytes of the image to determine if it's an
            /// embedded PNG file.
            /// </summary>
            public byte[] PngHeader
            {
                get
                {
                    if (f_pngHeader)
                        return _pngHeader;
                    long _pos = m_io.Pos;
                    m_io.Seek(OfsImg);
                    _pngHeader = m_io.ReadBytes(8);
                    m_io.Seek(_pos);
                    f_pngHeader = true;
                    return _pngHeader;
                }
            }
            private bool f_isPng;
            private bool _isPng;

            /// <summary>
            /// True if this image is in PNG format.
            /// </summary>
            public bool IsPng
            {
                get
                {
                    if (f_isPng)
                        return _isPng;
                    _isPng = (bool) ((KaitaiStream.ByteArrayCompare(PngHeader, new byte[] { 137, 80, 78, 71, 13, 10, 26, 10 }) == 0));
                    f_isPng = true;
                    return _isPng;
                }
            }
            private byte _width;
            private byte _height;
            private byte _numColors;
            private byte[] _reserved;
            private ushort _numPlanes;
            private ushort _bpp;
            private uint _lenImg;
            private uint _ofsImg;
            private Ico m_root;
            private Ico m_parent;

            /// <summary>
            /// Width of image, px
            /// </summary>
            public byte Width { get { return _width; } }

            /// <summary>
            /// Height of image, px
            /// </summary>
            public byte Height { get { return _height; } }

            /// <summary>
            /// Number of colors in palette of the image or 0 if image has
            /// no palette (i.e. RGB, RGBA, etc)
            /// </summary>
            public byte NumColors { get { return _numColors; } }
            public byte[] Reserved { get { return _reserved; } }

            /// <summary>
            /// Number of color planes
            /// </summary>
            public ushort NumPlanes { get { return _numPlanes; } }

            /// <summary>
            /// Bits per pixel in the image
            /// </summary>
            public ushort Bpp { get { return _bpp; } }

            /// <summary>
            /// Size of the image data
            /// </summary>
            public uint LenImg { get { return _lenImg; } }

            /// <summary>
            /// Absolute offset of the image data start in the file
            /// </summary>
            public uint OfsImg { get { return _ofsImg; } }
            public Ico M_Root { get { return m_root; } }
            public Ico M_Parent { get { return m_parent; } }
        }
        private byte[] _magic;
        private ushort _numImages;
        private List<IconDirEntry> _images;
        private Ico m_root;
        private KaitaiStruct m_parent;
        public byte[] Magic { get { return _magic; } }

        /// <summary>
        /// Number of images contained in this file
        /// </summary>
        public ushort NumImages { get { return _numImages; } }
        public List<IconDirEntry> Images { get { return _images; } }
        public Ico M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
