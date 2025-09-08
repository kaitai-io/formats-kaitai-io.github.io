// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// The Portable Image Format (PIF) is a basic, bitmap-like image format with the
    /// focus on ease of use (implementation) and small size for embedded
    /// applications.
    /// 
    /// See &lt;https://github.com/gfcwfzkm/PIF-Image-Format&gt; for more info.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/C%20Library/pifdec.c#L300">Source</a>
    /// </remarks>
    public partial class Pif : KaitaiStruct
    {
        public static Pif FromFile(string fileName)
        {
            return new Pif(new KaitaiStream(fileName));
        }


        public enum CompressionType
        {
            None = 0,
            Rle = 32222,
        }

        public enum ImageType
        {
            Rgb332 = 7763,
            Rgb888 = 17212,
            IndexedRgb332 = 18754,
            IndexedRgb565 = 18759,
            IndexedRgb888 = 18770,
            BlackWhite = 32170,
            Rgb16c = 47253,
            Rgb565 = 58821,
        }
        public Pif(KaitaiStream p__io, KaitaiStruct p__parent = null, Pif p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_imageData = false;
            _read();
        }
        private void _read()
        {
            _fileHeader = new PifHeader(m_io, this, m_root);
            _infoHeader = new InformationHeader(m_io, this, m_root);
            if (InfoHeader.UsesIndexedMode) {
                __raw_colorTable = m_io.ReadBytes(InfoHeader.LenColorTable);
                var io___raw_colorTable = new KaitaiStream(__raw_colorTable);
                _colorTable = new ColorTableData(io___raw_colorTable, this, m_root);
            }
        }
        public partial class ColorTableData : KaitaiStruct
        {
            public static ColorTableData FromFile(string fileName)
            {
                return new ColorTableData(new KaitaiStream(fileName));
            }

            public ColorTableData(KaitaiStream p__io, Pif p__parent = null, Pif p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<int>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        switch (M_Root.InfoHeader.ImageType) {
                        case Pif.ImageType.IndexedRgb332: {
                            _entries.Add(m_io.ReadBitsIntLe(8));
                            break;
                        }
                        case Pif.ImageType.IndexedRgb565: {
                            _entries.Add(m_io.ReadBitsIntLe(16));
                            break;
                        }
                        case Pif.ImageType.IndexedRgb888: {
                            _entries.Add(m_io.ReadBitsIntLe(24));
                            break;
                        }
                        }
                        i++;
                    }
                }
            }
            private List<int> _entries;
            private Pif m_root;
            private Pif m_parent;
            public List<int> Entries { get { return _entries; } }
            public Pif M_Root { get { return m_root; } }
            public Pif M_Parent { get { return m_parent; } }
        }
        public partial class InformationHeader : KaitaiStruct
        {
            public static InformationHeader FromFile(string fileName)
            {
                return new InformationHeader(new KaitaiStream(fileName));
            }

            public InformationHeader(KaitaiStream p__io, Pif p__parent = null, Pif p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_lenColorTableEntry = false;
                f_lenColorTableFull = false;
                f_lenColorTableMax = false;
                f_usesIndexedMode = false;
                _read();
            }
            private void _read()
            {
                _imageType = ((Pif.ImageType) m_io.ReadU2le());
                if (!( ((_imageType == Pif.ImageType.Rgb888) || (_imageType == Pif.ImageType.Rgb565) || (_imageType == Pif.ImageType.Rgb332) || (_imageType == Pif.ImageType.Rgb16c) || (_imageType == Pif.ImageType.BlackWhite) || (_imageType == Pif.ImageType.IndexedRgb888) || (_imageType == Pif.ImageType.IndexedRgb565) || (_imageType == Pif.ImageType.IndexedRgb332)) ))
                {
                    throw new ValidationNotAnyOfError(_imageType, m_io, "/types/information_header/seq/0");
                }
                _bitsPerPixel = m_io.ReadU2le();
                {
                    ushort M_ = _bitsPerPixel;
                    if (!((ImageType == Pif.ImageType.Rgb888 ? M_ == 24 : (ImageType == Pif.ImageType.Rgb565 ? M_ == 16 : (ImageType == Pif.ImageType.Rgb332 ? M_ == 8 : (ImageType == Pif.ImageType.Rgb16c ? M_ == 4 : (ImageType == Pif.ImageType.BlackWhite ? M_ == 1 : (UsesIndexedMode ? M_ <= 8 : true))))))))
                    {
                        throw new ValidationExprError(_bitsPerPixel, m_io, "/types/information_header/seq/1");
                    }
                }
                _width = m_io.ReadU2le();
                _height = m_io.ReadU2le();
                _lenImageData = m_io.ReadU4le();
                if (!(_lenImageData <= M_Root.FileHeader.LenFile - M_Root.FileHeader.OfsImageData))
                {
                    throw new ValidationGreaterThanError(M_Root.FileHeader.LenFile - M_Root.FileHeader.OfsImageData, _lenImageData, m_io, "/types/information_header/seq/4");
                }
                _lenColorTable = m_io.ReadU2le();
                if (!(_lenColorTable >= (UsesIndexedMode ? LenColorTableEntry * 1 : 0)))
                {
                    throw new ValidationLessThanError((UsesIndexedMode ? LenColorTableEntry * 1 : 0), _lenColorTable, m_io, "/types/information_header/seq/5");
                }
                if (!(_lenColorTable <= (UsesIndexedMode ? (LenColorTableMax < LenColorTableFull ? LenColorTableMax : LenColorTableFull) : 0)))
                {
                    throw new ValidationGreaterThanError((UsesIndexedMode ? (LenColorTableMax < LenColorTableFull ? LenColorTableMax : LenColorTableFull) : 0), _lenColorTable, m_io, "/types/information_header/seq/5");
                }
                _compression = ((Pif.CompressionType) m_io.ReadU2le());
                if (!( ((_compression == Pif.CompressionType.None) || (_compression == Pif.CompressionType.Rle)) ))
                {
                    throw new ValidationNotAnyOfError(_compression, m_io, "/types/information_header/seq/6");
                }
            }
            private bool f_lenColorTableEntry;
            private sbyte _lenColorTableEntry;
            public sbyte LenColorTableEntry
            {
                get
                {
                    if (f_lenColorTableEntry)
                        return _lenColorTableEntry;
                    f_lenColorTableEntry = true;
                    _lenColorTableEntry = (sbyte) ((ImageType == Pif.ImageType.IndexedRgb888 ? 3 : (ImageType == Pif.ImageType.IndexedRgb565 ? 2 : (ImageType == Pif.ImageType.IndexedRgb332 ? 1 : 0))));
                    return _lenColorTableEntry;
                }
            }
            private bool f_lenColorTableFull;
            private int _lenColorTableFull;
            public int LenColorTableFull
            {
                get
                {
                    if (f_lenColorTableFull)
                        return _lenColorTableFull;
                    f_lenColorTableFull = true;
                    _lenColorTableFull = (int) (LenColorTableEntry * (1 << BitsPerPixel));
                    return _lenColorTableFull;
                }
            }
            private bool f_lenColorTableMax;
            private int _lenColorTableMax;
            public int LenColorTableMax
            {
                get
                {
                    if (f_lenColorTableMax)
                        return _lenColorTableMax;
                    f_lenColorTableMax = true;
                    _lenColorTableMax = (int) (M_Root.FileHeader.OfsImageData - M_Root.FileHeader.OfsImageDataMin);
                    return _lenColorTableMax;
                }
            }
            private bool f_usesIndexedMode;
            private bool _usesIndexedMode;
            public bool UsesIndexedMode
            {
                get
                {
                    if (f_usesIndexedMode)
                        return _usesIndexedMode;
                    f_usesIndexedMode = true;
                    _usesIndexedMode = (bool) (LenColorTableEntry != 0);
                    return _usesIndexedMode;
                }
            }
            private ImageType _imageType;
            private ushort _bitsPerPixel;
            private ushort _width;
            private ushort _height;
            private uint _lenImageData;
            private ushort _lenColorTable;
            private CompressionType _compression;
            private Pif m_root;
            private Pif m_parent;
            public ImageType ImageType { get { return _imageType; } }

            /// <summary>
            /// See &lt;https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf&gt;:
            /// 
            /// &gt; Bits per Pixel: Bit size that each Pixel occupies. Bit size for an
            /// &gt; Indexed Image cannot go beyond 8 bits.
            /// </summary>
            public ushort BitsPerPixel { get { return _bitsPerPixel; } }
            public ushort Width { get { return _width; } }
            public ushort Height { get { return _height; } }
            public uint LenImageData { get { return _lenImageData; } }

            /// <summary>
            /// See &lt;https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf&gt;:
            /// 
            /// &gt; Color Table Size: (...), only used in Indexed mode, otherwise zero.
            /// ---
            /// &gt; **Note**: The presence of the Color Table is mandatory when Bits per
            /// &gt; Pixel &lt;= 8, unless Image Type states RGB332, RGB16C or B/W
            /// ---
            /// &gt; **Color Table** (semi-optional)
            /// &gt;
            /// &gt; (...) The amount of Colors has to be same or less than [Bits per
            /// &gt; Pixel] allow, otherwise the image is invalid.
            /// </summary>
            public ushort LenColorTable { get { return _lenColorTable; } }
            public CompressionType Compression { get { return _compression; } }
            public Pif M_Root { get { return m_root; } }
            public Pif M_Parent { get { return m_parent; } }
        }
        public partial class PifHeader : KaitaiStruct
        {
            public static PifHeader FromFile(string fileName)
            {
                return new PifHeader(new KaitaiStream(fileName));
            }

            public PifHeader(KaitaiStream p__io, Pif p__parent = null, Pif p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_ofsImageDataMin = false;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 80, 73, 70, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 80, 73, 70, 0 }, _magic, m_io, "/types/pif_header/seq/0");
                }
                _lenFile = m_io.ReadU4le();
                if (!(_lenFile >= OfsImageDataMin))
                {
                    throw new ValidationLessThanError(OfsImageDataMin, _lenFile, m_io, "/types/pif_header/seq/1");
                }
                _ofsImageData = m_io.ReadU4le();
                if (!(_ofsImageData >= OfsImageDataMin))
                {
                    throw new ValidationLessThanError(OfsImageDataMin, _ofsImageData, m_io, "/types/pif_header/seq/2");
                }
                if (!(_ofsImageData <= LenFile))
                {
                    throw new ValidationGreaterThanError(LenFile, _ofsImageData, m_io, "/types/pif_header/seq/2");
                }
            }
            private bool f_ofsImageDataMin;
            private int _ofsImageDataMin;
            public int OfsImageDataMin
            {
                get
                {
                    if (f_ofsImageDataMin)
                        return _ofsImageDataMin;
                    f_ofsImageDataMin = true;
                    _ofsImageDataMin = (int) (12 + 16);
                    return _ofsImageDataMin;
                }
            }
            private byte[] _magic;
            private uint _lenFile;
            private uint _ofsImageData;
            private Pif m_root;
            private Pif m_parent;
            public byte[] Magic { get { return _magic; } }
            public uint LenFile { get { return _lenFile; } }
            public uint OfsImageData { get { return _ofsImageData; } }
            public Pif M_Root { get { return m_root; } }
            public Pif M_Parent { get { return m_parent; } }
        }
        private bool f_imageData;
        private byte[] _imageData;
        public byte[] ImageData
        {
            get
            {
                if (f_imageData)
                    return _imageData;
                f_imageData = true;
                long _pos = m_io.Pos;
                m_io.Seek(FileHeader.OfsImageData);
                _imageData = m_io.ReadBytes(InfoHeader.LenImageData);
                m_io.Seek(_pos);
                return _imageData;
            }
        }
        private PifHeader _fileHeader;
        private InformationHeader _infoHeader;
        private ColorTableData _colorTable;
        private Pif m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_colorTable;
        public PifHeader FileHeader { get { return _fileHeader; } }
        public InformationHeader InfoHeader { get { return _infoHeader; } }
        public ColorTableData ColorTable { get { return _colorTable; } }
        public Pif M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawColorTable { get { return __raw_colorTable; } }
    }
}
