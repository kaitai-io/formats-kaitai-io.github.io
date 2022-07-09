// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// xwd is a file format written by eponymous X11 screen capture
    /// application (xwd stands for &quot;X Window Dump&quot;). Typically, an average
    /// user transforms xwd format into something more widespread by any of
    /// `xwdtopnm` and `pnmto...` utilities right away.
    /// 
    /// xwd format itself provides a raw uncompressed bitmap with some
    /// metainformation, like pixel format, width, height, bit depth,
    /// etc. Note that technically format includes machine-dependent fields
    /// and thus is probably a poor choice for true cross-platform usage.
    /// </summary>
    public partial class Xwd : KaitaiStruct
    {
        public static Xwd FromFile(string fileName)
        {
            return new Xwd(new KaitaiStream(fileName));
        }


        public enum PixmapFormat
        {
            XYBitmap = 0,
            XYPixmap = 1,
            ZPixmap = 2,
        }

        public enum ByteOrder
        {
            Le = 0,
            Be = 1,
        }

        public enum VisualClass
        {
            StaticGray = 0,
            GrayScale = 1,
            StaticColor = 2,
            PseudoColor = 3,
            TrueColor = 4,
            DirectColor = 5,
        }
        public Xwd(KaitaiStream p__io, KaitaiStruct p__parent = null, Xwd p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _lenHeader = m_io.ReadU4be();
            __raw_hdr = m_io.ReadBytes((LenHeader - 4));
            var io___raw_hdr = new KaitaiStream(__raw_hdr);
            _hdr = new Header(io___raw_hdr, this, m_root);
            __raw_colorMap = new List<byte[]>();
            _colorMap = new List<ColorMapEntry>();
            for (var i = 0; i < Hdr.ColorMapEntries; i++)
            {
                __raw_colorMap.Add(m_io.ReadBytes(12));
                var io___raw_colorMap = new KaitaiStream(__raw_colorMap[__raw_colorMap.Count - 1]);
                _colorMap.Add(new ColorMapEntry(io___raw_colorMap, this, m_root));
            }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, Xwd p__parent = null, Xwd p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fileVersion = m_io.ReadU4be();
                _pixmapFormat = ((Xwd.PixmapFormat) m_io.ReadU4be());
                _pixmapDepth = m_io.ReadU4be();
                _pixmapWidth = m_io.ReadU4be();
                _pixmapHeight = m_io.ReadU4be();
                _xOffset = m_io.ReadU4be();
                _byteOrder = ((Xwd.ByteOrder) m_io.ReadU4be());
                _bitmapUnit = m_io.ReadU4be();
                _bitmapBitOrder = m_io.ReadU4be();
                _bitmapPad = m_io.ReadU4be();
                _bitsPerPixel = m_io.ReadU4be();
                _bytesPerLine = m_io.ReadU4be();
                _visualClass = ((Xwd.VisualClass) m_io.ReadU4be());
                _redMask = m_io.ReadU4be();
                _greenMask = m_io.ReadU4be();
                _blueMask = m_io.ReadU4be();
                _bitsPerRgb = m_io.ReadU4be();
                _numberOfColors = m_io.ReadU4be();
                _colorMapEntries = m_io.ReadU4be();
                _windowWidth = m_io.ReadU4be();
                _windowHeight = m_io.ReadU4be();
                _windowX = m_io.ReadS4be();
                _windowY = m_io.ReadS4be();
                _windowBorderWidth = m_io.ReadU4be();
                _creator = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(0, false, true, true));
            }
            private uint _fileVersion;
            private PixmapFormat _pixmapFormat;
            private uint _pixmapDepth;
            private uint _pixmapWidth;
            private uint _pixmapHeight;
            private uint _xOffset;
            private ByteOrder _byteOrder;
            private uint _bitmapUnit;
            private uint _bitmapBitOrder;
            private uint _bitmapPad;
            private uint _bitsPerPixel;
            private uint _bytesPerLine;
            private VisualClass _visualClass;
            private uint _redMask;
            private uint _greenMask;
            private uint _blueMask;
            private uint _bitsPerRgb;
            private uint _numberOfColors;
            private uint _colorMapEntries;
            private uint _windowWidth;
            private uint _windowHeight;
            private int _windowX;
            private int _windowY;
            private uint _windowBorderWidth;
            private string _creator;
            private Xwd m_root;
            private Xwd m_parent;

            /// <summary>
            /// X11WD file version (always 07h)
            /// </summary>
            public uint FileVersion { get { return _fileVersion; } }

            /// <summary>
            /// Format of the image data
            /// </summary>
            public PixmapFormat PixmapFormat { get { return _pixmapFormat; } }

            /// <summary>
            /// Pixmap depth in pixels - in practice, bits per pixel
            /// </summary>
            public uint PixmapDepth { get { return _pixmapDepth; } }

            /// <summary>
            /// Pixmap width in pixels
            /// </summary>
            public uint PixmapWidth { get { return _pixmapWidth; } }

            /// <summary>
            /// Pixmap height in pixels
            /// </summary>
            public uint PixmapHeight { get { return _pixmapHeight; } }

            /// <summary>
            /// Bitmap X offset (number of pixels to ignore at the beginning of each scan-line)
            /// </summary>
            public uint XOffset { get { return _xOffset; } }

            /// <summary>
            /// Byte order of image data
            /// </summary>
            public ByteOrder ByteOrder { get { return _byteOrder; } }

            /// <summary>
            /// Bitmap base data size
            /// </summary>
            public uint BitmapUnit { get { return _bitmapUnit; } }

            /// <summary>
            /// Bit-order of image data
            /// </summary>
            public uint BitmapBitOrder { get { return _bitmapBitOrder; } }

            /// <summary>
            /// Bitmap scan-line pad
            /// </summary>
            public uint BitmapPad { get { return _bitmapPad; } }

            /// <summary>
            /// Bits per pixel
            /// </summary>
            public uint BitsPerPixel { get { return _bitsPerPixel; } }

            /// <summary>
            /// Bytes per scan-line
            /// </summary>
            public uint BytesPerLine { get { return _bytesPerLine; } }

            /// <summary>
            /// Class of the image
            /// </summary>
            public VisualClass VisualClass { get { return _visualClass; } }

            /// <summary>
            /// Red mask
            /// </summary>
            public uint RedMask { get { return _redMask; } }

            /// <summary>
            /// Green mask
            /// </summary>
            public uint GreenMask { get { return _greenMask; } }

            /// <summary>
            /// Blue mask
            /// </summary>
            public uint BlueMask { get { return _blueMask; } }

            /// <summary>
            /// Size of each color mask in bits
            /// </summary>
            public uint BitsPerRgb { get { return _bitsPerRgb; } }

            /// <summary>
            /// Number of colors in image
            /// </summary>
            public uint NumberOfColors { get { return _numberOfColors; } }

            /// <summary>
            /// Number of entries in color map
            /// </summary>
            public uint ColorMapEntries { get { return _colorMapEntries; } }

            /// <summary>
            /// Window width
            /// </summary>
            public uint WindowWidth { get { return _windowWidth; } }

            /// <summary>
            /// Window height
            /// </summary>
            public uint WindowHeight { get { return _windowHeight; } }

            /// <summary>
            /// Window upper left X coordinate
            /// </summary>
            public int WindowX { get { return _windowX; } }

            /// <summary>
            /// Window upper left Y coordinate
            /// </summary>
            public int WindowY { get { return _windowY; } }

            /// <summary>
            /// Window border width
            /// </summary>
            public uint WindowBorderWidth { get { return _windowBorderWidth; } }

            /// <summary>
            /// Program that created this xwd file
            /// </summary>
            public string Creator { get { return _creator; } }
            public Xwd M_Root { get { return m_root; } }
            public Xwd M_Parent { get { return m_parent; } }
        }
        public partial class ColorMapEntry : KaitaiStruct
        {
            public static ColorMapEntry FromFile(string fileName)
            {
                return new ColorMapEntry(new KaitaiStream(fileName));
            }

            public ColorMapEntry(KaitaiStream p__io, Xwd p__parent = null, Xwd p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entryNumber = m_io.ReadU4be();
                _red = m_io.ReadU2be();
                _green = m_io.ReadU2be();
                _blue = m_io.ReadU2be();
                _flags = m_io.ReadU1();
                _padding = m_io.ReadU1();
            }
            private uint _entryNumber;
            private ushort _red;
            private ushort _green;
            private ushort _blue;
            private byte _flags;
            private byte _padding;
            private Xwd m_root;
            private Xwd m_parent;

            /// <summary>
            /// Number of the color map entry
            /// </summary>
            public uint EntryNumber { get { return _entryNumber; } }
            public ushort Red { get { return _red; } }
            public ushort Green { get { return _green; } }
            public ushort Blue { get { return _blue; } }
            public byte Flags { get { return _flags; } }
            public byte Padding { get { return _padding; } }
            public Xwd M_Root { get { return m_root; } }
            public Xwd M_Parent { get { return m_parent; } }
        }
        private uint _lenHeader;
        private Header _hdr;
        private List<ColorMapEntry> _colorMap;
        private Xwd m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_hdr;
        private List<byte[]> __raw_colorMap;

        /// <summary>
        /// Size of the header in bytes
        /// </summary>
        public uint LenHeader { get { return _lenHeader; } }
        public Header Hdr { get { return _hdr; } }
        public List<ColorMapEntry> ColorMap { get { return _colorMap; } }
        public Xwd M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawHdr { get { return __raw_hdr; } }
        public List<byte[]> M_RawColorMap { get { return __raw_colorMap; } }
    }
}
