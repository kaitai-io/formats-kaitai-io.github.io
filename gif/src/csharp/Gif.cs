// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// GIF (Graphics Interchange Format) is an image file format, developed
    /// in 1987. It became popular in 1990s as one of the main image formats
    /// used in World Wide Web.
    /// 
    /// GIF format allows encoding of palette-based images up to 256 colors
    /// (each of the colors can be chosen from a 24-bit RGB
    /// colorspace). Image data stream uses LZW (Lempel-Ziv-Welch) lossless
    /// compression.
    /// 
    /// Over the years, several version of the format were published and
    /// several extensions to it were made, namely, a popular Netscape
    /// extension that allows to store several images in one file, switching
    /// between them, which produces crude form of animation.
    /// 
    /// Structurally, format consists of several mandatory headers and then
    /// a stream of blocks follows. Blocks can carry additional
    /// metainformation or image data.
    /// </summary>
    public partial class Gif : KaitaiStruct
    {
        public static Gif FromFile(string fileName)
        {
            return new Gif(new KaitaiStream(fileName));
        }


        public enum BlockType
        {
            Extension = 33,
            LocalImageDescriptor = 44,
            EndOfFile = 59,
        }

        public enum ExtensionLabel
        {
            GraphicControl = 249,
            Comment = 254,
            Application = 255,
        }
        public Gif(KaitaiStream p__io, KaitaiStruct p__parent = null, Gif p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _hdr = new Header(m_io, this, m_root);
            _logicalScreenDescriptor = new LogicalScreenDescriptorStruct(m_io, this, m_root);
            if (LogicalScreenDescriptor.HasColorTable) {
                __raw_globalColorTable = m_io.ReadBytes((LogicalScreenDescriptor.ColorTableSize * 3));
                var io___raw_globalColorTable = new KaitaiStream(__raw_globalColorTable);
                _globalColorTable = new ColorTable(io___raw_globalColorTable, this, m_root);
            }
            _blocks = new List<Block>();
            {
                var i = 0;
                Block M_;
                do {
                    M_ = new Block(m_io, this, m_root);
                    _blocks.Add(M_);
                    i++;
                } while (!( ((M_Io.IsEof) || (M_.BlockType == BlockType.EndOfFile)) ));
            }
        }

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 22</a>
        /// </remarks>
        public partial class ImageData : KaitaiStruct
        {
            public static ImageData FromFile(string fileName)
            {
                return new ImageData(new KaitaiStream(fileName));
            }

            public ImageData(KaitaiStream p__io, Gif.LocalImageDescriptor p__parent = null, Gif p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lzwMinCodeSize = m_io.ReadU1();
                _subblocks = new Subblocks(m_io, this, m_root);
            }
            private byte _lzwMinCodeSize;
            private Subblocks _subblocks;
            private Gif m_root;
            private Gif.LocalImageDescriptor m_parent;
            public byte LzwMinCodeSize { get { return _lzwMinCodeSize; } }
            public Subblocks Subblocks { get { return _subblocks; } }
            public Gif M_Root { get { return m_root; } }
            public Gif.LocalImageDescriptor M_Parent { get { return m_parent; } }
        }
        public partial class ColorTableEntry : KaitaiStruct
        {
            public static ColorTableEntry FromFile(string fileName)
            {
                return new ColorTableEntry(new KaitaiStream(fileName));
            }

            public ColorTableEntry(KaitaiStream p__io, Gif.ColorTable p__parent = null, Gif p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _red = m_io.ReadU1();
                _green = m_io.ReadU1();
                _blue = m_io.ReadU1();
            }
            private byte _red;
            private byte _green;
            private byte _blue;
            private Gif m_root;
            private Gif.ColorTable m_parent;
            public byte Red { get { return _red; } }
            public byte Green { get { return _green; } }
            public byte Blue { get { return _blue; } }
            public Gif M_Root { get { return m_root; } }
            public Gif.ColorTable M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 18</a>
        /// </remarks>
        public partial class LogicalScreenDescriptorStruct : KaitaiStruct
        {
            public static LogicalScreenDescriptorStruct FromFile(string fileName)
            {
                return new LogicalScreenDescriptorStruct(new KaitaiStream(fileName));
            }

            public LogicalScreenDescriptorStruct(KaitaiStream p__io, Gif p__parent = null, Gif p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_hasColorTable = false;
                f_colorTableSize = false;
                _read();
            }
            private void _read()
            {
                _screenWidth = m_io.ReadU2le();
                _screenHeight = m_io.ReadU2le();
                _flags = m_io.ReadU1();
                _bgColorIndex = m_io.ReadU1();
                _pixelAspectRatio = m_io.ReadU1();
            }
            private bool f_hasColorTable;
            private bool _hasColorTable;
            public bool HasColorTable
            {
                get
                {
                    if (f_hasColorTable)
                        return _hasColorTable;
                    _hasColorTable = (bool) ((Flags & 128) != 0);
                    f_hasColorTable = true;
                    return _hasColorTable;
                }
            }
            private bool f_colorTableSize;
            private int _colorTableSize;
            public int ColorTableSize
            {
                get
                {
                    if (f_colorTableSize)
                        return _colorTableSize;
                    _colorTableSize = (int) ((2 << (Flags & 7)));
                    f_colorTableSize = true;
                    return _colorTableSize;
                }
            }
            private ushort _screenWidth;
            private ushort _screenHeight;
            private byte _flags;
            private byte _bgColorIndex;
            private byte _pixelAspectRatio;
            private Gif m_root;
            private Gif m_parent;
            public ushort ScreenWidth { get { return _screenWidth; } }
            public ushort ScreenHeight { get { return _screenHeight; } }
            public byte Flags { get { return _flags; } }
            public byte BgColorIndex { get { return _bgColorIndex; } }
            public byte PixelAspectRatio { get { return _pixelAspectRatio; } }
            public Gif M_Root { get { return m_root; } }
            public Gif M_Parent { get { return m_parent; } }
        }
        public partial class LocalImageDescriptor : KaitaiStruct
        {
            public static LocalImageDescriptor FromFile(string fileName)
            {
                return new LocalImageDescriptor(new KaitaiStream(fileName));
            }

            public LocalImageDescriptor(KaitaiStream p__io, Gif.Block p__parent = null, Gif p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_hasColorTable = false;
                f_hasInterlace = false;
                f_hasSortedColorTable = false;
                f_colorTableSize = false;
                _read();
            }
            private void _read()
            {
                _left = m_io.ReadU2le();
                _top = m_io.ReadU2le();
                _width = m_io.ReadU2le();
                _height = m_io.ReadU2le();
                _flags = m_io.ReadU1();
                if (HasColorTable) {
                    __raw_localColorTable = m_io.ReadBytes((ColorTableSize * 3));
                    var io___raw_localColorTable = new KaitaiStream(__raw_localColorTable);
                    _localColorTable = new ColorTable(io___raw_localColorTable, this, m_root);
                }
                _imageData = new ImageData(m_io, this, m_root);
            }
            private bool f_hasColorTable;
            private bool _hasColorTable;
            public bool HasColorTable
            {
                get
                {
                    if (f_hasColorTable)
                        return _hasColorTable;
                    _hasColorTable = (bool) ((Flags & 128) != 0);
                    f_hasColorTable = true;
                    return _hasColorTable;
                }
            }
            private bool f_hasInterlace;
            private bool _hasInterlace;
            public bool HasInterlace
            {
                get
                {
                    if (f_hasInterlace)
                        return _hasInterlace;
                    _hasInterlace = (bool) ((Flags & 64) != 0);
                    f_hasInterlace = true;
                    return _hasInterlace;
                }
            }
            private bool f_hasSortedColorTable;
            private bool _hasSortedColorTable;
            public bool HasSortedColorTable
            {
                get
                {
                    if (f_hasSortedColorTable)
                        return _hasSortedColorTable;
                    _hasSortedColorTable = (bool) ((Flags & 32) != 0);
                    f_hasSortedColorTable = true;
                    return _hasSortedColorTable;
                }
            }
            private bool f_colorTableSize;
            private int _colorTableSize;
            public int ColorTableSize
            {
                get
                {
                    if (f_colorTableSize)
                        return _colorTableSize;
                    _colorTableSize = (int) ((2 << (Flags & 7)));
                    f_colorTableSize = true;
                    return _colorTableSize;
                }
            }
            private ushort _left;
            private ushort _top;
            private ushort _width;
            private ushort _height;
            private byte _flags;
            private ColorTable _localColorTable;
            private ImageData _imageData;
            private Gif m_root;
            private Gif.Block m_parent;
            private byte[] __raw_localColorTable;
            public ushort Left { get { return _left; } }
            public ushort Top { get { return _top; } }
            public ushort Width { get { return _width; } }
            public ushort Height { get { return _height; } }
            public byte Flags { get { return _flags; } }
            public ColorTable LocalColorTable { get { return _localColorTable; } }
            public ImageData ImageData { get { return _imageData; } }
            public Gif M_Root { get { return m_root; } }
            public Gif.Block M_Parent { get { return m_parent; } }
            public byte[] M_RawLocalColorTable { get { return __raw_localColorTable; } }
        }
        public partial class Block : KaitaiStruct
        {
            public static Block FromFile(string fileName)
            {
                return new Block(new KaitaiStream(fileName));
            }

            public Block(KaitaiStream p__io, Gif p__parent = null, Gif p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _blockType = ((Gif.BlockType) m_io.ReadU1());
                switch (BlockType) {
                case Gif.BlockType.Extension: {
                    _body = new Extension(m_io, this, m_root);
                    break;
                }
                case Gif.BlockType.LocalImageDescriptor: {
                    _body = new LocalImageDescriptor(m_io, this, m_root);
                    break;
                }
                }
            }
            private BlockType _blockType;
            private KaitaiStruct _body;
            private Gif m_root;
            private Gif m_parent;
            public BlockType BlockType { get { return _blockType; } }
            public KaitaiStruct Body { get { return _body; } }
            public Gif M_Root { get { return m_root; } }
            public Gif M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 19</a>
        /// </remarks>
        public partial class ColorTable : KaitaiStruct
        {
            public static ColorTable FromFile(string fileName)
            {
                return new ColorTable(new KaitaiStream(fileName));
            }

            public ColorTable(KaitaiStream p__io, KaitaiStruct p__parent = null, Gif p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<ColorTableEntry>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(new ColorTableEntry(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<ColorTableEntry> _entries;
            private Gif m_root;
            private KaitaiStruct m_parent;
            public List<ColorTableEntry> Entries { get { return _entries; } }
            public Gif M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 17</a>
        /// </remarks>
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, Gif p__parent = null, Gif p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(3);
                if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 71, 73, 70 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 71, 73, 70 }, Magic, M_Io, "/types/header/seq/0");
                }
                _version = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(3));
            }
            private byte[] _magic;
            private string _version;
            private Gif m_root;
            private Gif m_parent;
            public byte[] Magic { get { return _magic; } }
            public string Version { get { return _version; } }
            public Gif M_Root { get { return m_root; } }
            public Gif M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 23</a>
        /// </remarks>
        public partial class ExtGraphicControl : KaitaiStruct
        {
            public static ExtGraphicControl FromFile(string fileName)
            {
                return new ExtGraphicControl(new KaitaiStream(fileName));
            }

            public ExtGraphicControl(KaitaiStream p__io, Gif.Extension p__parent = null, Gif p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_transparentColorFlag = false;
                f_userInputFlag = false;
                _read();
            }
            private void _read()
            {
                _blockSize = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(BlockSize, new byte[] { 4 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 4 }, BlockSize, M_Io, "/types/ext_graphic_control/seq/0");
                }
                _flags = m_io.ReadU1();
                _delayTime = m_io.ReadU2le();
                _transparentIdx = m_io.ReadU1();
                _terminator = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(Terminator, new byte[] { 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0 }, Terminator, M_Io, "/types/ext_graphic_control/seq/4");
                }
            }
            private bool f_transparentColorFlag;
            private bool _transparentColorFlag;
            public bool TransparentColorFlag
            {
                get
                {
                    if (f_transparentColorFlag)
                        return _transparentColorFlag;
                    _transparentColorFlag = (bool) ((Flags & 1) != 0);
                    f_transparentColorFlag = true;
                    return _transparentColorFlag;
                }
            }
            private bool f_userInputFlag;
            private bool _userInputFlag;
            public bool UserInputFlag
            {
                get
                {
                    if (f_userInputFlag)
                        return _userInputFlag;
                    _userInputFlag = (bool) ((Flags & 2) != 0);
                    f_userInputFlag = true;
                    return _userInputFlag;
                }
            }
            private byte[] _blockSize;
            private byte _flags;
            private ushort _delayTime;
            private byte _transparentIdx;
            private byte[] _terminator;
            private Gif m_root;
            private Gif.Extension m_parent;
            public byte[] BlockSize { get { return _blockSize; } }
            public byte Flags { get { return _flags; } }
            public ushort DelayTime { get { return _delayTime; } }
            public byte TransparentIdx { get { return _transparentIdx; } }
            public byte[] Terminator { get { return _terminator; } }
            public Gif M_Root { get { return m_root; } }
            public Gif.Extension M_Parent { get { return m_parent; } }
        }
        public partial class Subblock : KaitaiStruct
        {
            public static Subblock FromFile(string fileName)
            {
                return new Subblock(new KaitaiStream(fileName));
            }

            public Subblock(KaitaiStream p__io, KaitaiStruct p__parent = null, Gif p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenBytes = m_io.ReadU1();
                _bytes = m_io.ReadBytes(LenBytes);
            }
            private byte _lenBytes;
            private byte[] _bytes;
            private Gif m_root;
            private KaitaiStruct m_parent;
            public byte LenBytes { get { return _lenBytes; } }
            public byte[] Bytes { get { return _bytes; } }
            public Gif M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class ApplicationId : KaitaiStruct
        {
            public static ApplicationId FromFile(string fileName)
            {
                return new ApplicationId(new KaitaiStream(fileName));
            }

            public ApplicationId(KaitaiStream p__io, Gif.ExtApplication p__parent = null, Gif p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenBytes = m_io.ReadU1();
                if (!(LenBytes == 11))
                {
                    throw new ValidationNotEqualError(11, LenBytes, M_Io, "/types/application_id/seq/0");
                }
                _applicationIdentifier = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(8));
                _applicationAuthCode = m_io.ReadBytes(3);
            }
            private byte _lenBytes;
            private string _applicationIdentifier;
            private byte[] _applicationAuthCode;
            private Gif m_root;
            private Gif.ExtApplication m_parent;
            public byte LenBytes { get { return _lenBytes; } }
            public string ApplicationIdentifier { get { return _applicationIdentifier; } }
            public byte[] ApplicationAuthCode { get { return _applicationAuthCode; } }
            public Gif M_Root { get { return m_root; } }
            public Gif.ExtApplication M_Parent { get { return m_parent; } }
        }
        public partial class ExtApplication : KaitaiStruct
        {
            public static ExtApplication FromFile(string fileName)
            {
                return new ExtApplication(new KaitaiStream(fileName));
            }

            public ExtApplication(KaitaiStream p__io, Gif.Extension p__parent = null, Gif p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _applicationId = new ApplicationId(m_io, this, m_root);
                _subblocks = new List<Subblock>();
                {
                    var i = 0;
                    Subblock M_;
                    do {
                        M_ = new Subblock(m_io, this, m_root);
                        _subblocks.Add(M_);
                        i++;
                    } while (!(M_.LenBytes == 0));
                }
            }
            private ApplicationId _applicationId;
            private List<Subblock> _subblocks;
            private Gif m_root;
            private Gif.Extension m_parent;
            public ApplicationId ApplicationId { get { return _applicationId; } }
            public List<Subblock> Subblocks { get { return _subblocks; } }
            public Gif M_Root { get { return m_root; } }
            public Gif.Extension M_Parent { get { return m_parent; } }
        }
        public partial class Subblocks : KaitaiStruct
        {
            public static Subblocks FromFile(string fileName)
            {
                return new Subblocks(new KaitaiStream(fileName));
            }

            public Subblocks(KaitaiStream p__io, KaitaiStruct p__parent = null, Gif p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<Subblock>();
                {
                    var i = 0;
                    Subblock M_;
                    do {
                        M_ = new Subblock(m_io, this, m_root);
                        _entries.Add(M_);
                        i++;
                    } while (!(M_.LenBytes == 0));
                }
            }
            private List<Subblock> _entries;
            private Gif m_root;
            private KaitaiStruct m_parent;
            public List<Subblock> Entries { get { return _entries; } }
            public Gif M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class Extension : KaitaiStruct
        {
            public static Extension FromFile(string fileName)
            {
                return new Extension(new KaitaiStream(fileName));
            }

            public Extension(KaitaiStream p__io, Gif.Block p__parent = null, Gif p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _label = ((Gif.ExtensionLabel) m_io.ReadU1());
                switch (Label) {
                case Gif.ExtensionLabel.Application: {
                    _body = new ExtApplication(m_io, this, m_root);
                    break;
                }
                case Gif.ExtensionLabel.Comment: {
                    _body = new Subblocks(m_io, this, m_root);
                    break;
                }
                case Gif.ExtensionLabel.GraphicControl: {
                    _body = new ExtGraphicControl(m_io, this, m_root);
                    break;
                }
                default: {
                    _body = new Subblocks(m_io, this, m_root);
                    break;
                }
                }
            }
            private ExtensionLabel _label;
            private KaitaiStruct _body;
            private Gif m_root;
            private Gif.Block m_parent;
            public ExtensionLabel Label { get { return _label; } }
            public KaitaiStruct Body { get { return _body; } }
            public Gif M_Root { get { return m_root; } }
            public Gif.Block M_Parent { get { return m_parent; } }
        }
        private Header _hdr;
        private LogicalScreenDescriptorStruct _logicalScreenDescriptor;
        private ColorTable _globalColorTable;
        private List<Block> _blocks;
        private Gif m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_globalColorTable;
        public Header Hdr { get { return _hdr; } }
        public LogicalScreenDescriptorStruct LogicalScreenDescriptor { get { return _logicalScreenDescriptor; } }

        /// <remarks>
        /// Reference: <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 18</a>
        /// </remarks>
        public ColorTable GlobalColorTable { get { return _globalColorTable; } }
        public List<Block> Blocks { get { return _blocks; } }
        public Gif M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawGlobalColorTable { get { return __raw_globalColorTable; } }
    }
}
