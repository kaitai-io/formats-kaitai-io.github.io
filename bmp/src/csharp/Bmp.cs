// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// The **BMP file format**, also known as **bitmap image file** or **device independent
    /// bitmap (DIB) file format** or simply a **bitmap**, is a raster graphics image file
    /// format used to store bitmap digital images, independently of the display
    /// device (such as a graphics adapter), especially on Microsoft Windows
    /// and OS/2 operating systems.
    /// 
    /// ## Samples
    /// 
    /// Great collection of various BMP sample files:
    /// [**BMP Suite Image List**](
    ///   http://entropymine.com/jason/bmpsuite/bmpsuite/html/bmpsuite.html
    /// ) (by Jason Summers)
    /// 
    /// If only there was such a comprehensive sample suite for every file format! It's like
    /// a dream for every developer of any binary file format parser. It contains a lot of
    /// different types and variations of BMP files, even the tricky ones, where it's not clear
    /// from the specification how to deal with them (marked there as &quot;**q**uestionable&quot;).
    /// 
    /// If you make a program which will be able to read all the &quot;**g**ood&quot; and &quot;**q**uestionable&quot;
    /// BMP files and won't crash on the &quot;**b**ad&quot; ones, it will definitely have one of the most
    /// extensive support of BMP files in the universe!
    /// 
    /// ## BITMAPV2INFOHEADER and BITMAPV3INFOHEADER
    /// 
    /// A beneficial discussion on Adobe forum (archived):
    /// [**Invalid BMP Format with Alpha channel**](
    ///   https://web.archive.org/web/20150127132443/https://forums.adobe.com/message/3272950
    /// )
    /// 
    /// In 2010, someone noticed that Photoshop generated BMP with an odd type of header. There wasn't
    /// any documentation available for this header at the time (and still isn't).
    /// However, Chris Cox (former Adobe employee) claimed that they hadn't invented any type
    /// of proprietary header and everything they were writing was taken directly
    /// from the Microsoft documentation.
    /// 
    /// It showed up that the unknown header was called BITMAPV3INFOHEADER.
    /// Although Microsoft has apparently requested and verified the use of the header,
    /// the documentation on MSDN has probably got lost and they have probably
    /// forgotten about this type of header.
    /// 
    /// This is the only source I could find about these structures, so we could't rely
    /// on it so much, but I think supporting them as a read-only format won't harm anything.
    /// Due to the fact that it isn't documented anywhere else, most applications don't support it.
    /// 
    /// All Windows headers at once (including mentioned BITMAPV2INFOHEADER and BITMAPV3INFOHEADER):
    /// 
    /// ![Bitmap headers overview](
    ///   https://web.archive.org/web/20190527043845/https://forums.adobe.com/servlet/JiveServlet/showImage/2-3273299-47801/BMP_Headers.png
    /// )
    /// 
    /// ## Specs
    ///  * [Bitmap Storage (Windows Dev Center)](
    ///      https://learn.microsoft.com/en-us/windows/win32/gdi/bitmap-storage
    ///    )
    ///     * BITMAPFILEHEADER
    ///     * BITMAPINFOHEADER
    ///     * BITMAPV4HEADER
    ///     * BITMAPV5HEADER
    ///  * [OS/2 Bitmap File Format](
    ///       https://www.fileformat.info/format/os2bmp/egff.htm
    ///    )
    ///     * BITMAPFILEHEADER (OS2BMPFILEHEADER)
    ///     * BITMAPCOREHEADER (OS21XBITMAPHEADER)
    ///     * OS22XBITMAPHEADER
    ///  * [Microsoft Windows Bitmap](
    ///       http://netghost.narod.ru/gff/graphics/summary/micbmp.htm
    ///    )
    ///     * BITMAPFILEHEADER (WINBMPFILEHEADER)
    ///     * BITMAPCOREHEADER (WIN2XBITMAPHEADER)
    ///     * BITMAPINFOHEADER (WINNTBITMAPHEADER)
    ///     * BITMAPV4HEADER (WIN4XBITMAPHEADER)
    /// </summary>
    public partial class Bmp : KaitaiStruct
    {
        public static Bmp FromFile(string fileName)
        {
            return new Bmp(new KaitaiStream(fileName));
        }


        public enum Intent
        {
            Business = 1,
            Graphics = 2,
            Images = 4,
            AbsColorimetric = 8,
        }

        public enum ColorSpace
        {
            CalibratedRgb = 0,
            ProfileLinked = 1279872587,
            ProfileEmbedded = 1296188740,
            Windows = 1466527264,
            SRgb = 1934772034,
        }

        public enum Os2Rendering
        {
            NoHalftoning = 0,
            ErrorDiffusion = 1,
            Panda = 2,
            SuperCircle = 3,
        }

        public enum HeaderType
        {
            BitmapCoreHeader = 12,
            BitmapInfoHeader = 40,
            BitmapV2InfoHeader = 52,
            BitmapV3InfoHeader = 56,
            Os22xBitmapHeader = 64,
            BitmapV4Header = 108,
            BitmapV5Header = 124,
        }

        public enum Compressions
        {
            Rgb = 0,
            Rle8 = 1,
            Rle4 = 2,
            Bitfields = 3,
            Jpeg = 4,
            Png = 5,
            AlphaBitfields = 6,
        }

        public enum Os2Compressions
        {
            Rgb = 0,
            Rle8 = 1,
            Rle4 = 2,
            Huffman1d = 3,
            Rle24 = 4,
        }
        public Bmp(KaitaiStream p__io, KaitaiStruct p__parent = null, Bmp p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _fileHdr = new FileHeader(m_io, this, m_root);
            __raw_dibInfo = m_io.ReadBytes((FileHdr.OfsBitmap - 14));
            var io___raw_dibInfo = new KaitaiStream(__raw_dibInfo);
            _dibInfo = new BitmapInfo(io___raw_dibInfo, this, m_root);
            __raw_bitmap = m_io.ReadBytesFull();
            var io___raw_bitmap = new KaitaiStream(__raw_bitmap);
            _bitmap = new Bitmap(io___raw_bitmap, this, m_root);
        }

        /// <remarks>
        /// Reference: <a href="https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-ciexyz">Source</a>
        /// </remarks>
        public partial class CieXyz : KaitaiStruct
        {
            public static CieXyz FromFile(string fileName)
            {
                return new CieXyz(new KaitaiStream(fileName));
            }

            public CieXyz(KaitaiStream p__io, Bmp.BitmapV4Extension p__parent = null, Bmp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _x = new FixedPoint2Dot30(m_io, this, m_root);
                _y = new FixedPoint2Dot30(m_io, this, m_root);
                _z = new FixedPoint2Dot30(m_io, this, m_root);
            }
            private FixedPoint2Dot30 _x;
            private FixedPoint2Dot30 _y;
            private FixedPoint2Dot30 _z;
            private Bmp m_root;
            private Bmp.BitmapV4Extension m_parent;
            public FixedPoint2Dot30 X { get { return _x; } }
            public FixedPoint2Dot30 Y { get { return _y; } }
            public FixedPoint2Dot30 Z { get { return _z; } }
            public Bmp M_Root { get { return m_root; } }
            public Bmp.BitmapV4Extension M_Parent { get { return m_parent; } }
        }
        public partial class RgbRecord : KaitaiStruct
        {
            public RgbRecord(bool p_hasReservedField, KaitaiStream p__io, Bmp.ColorTable p__parent = null, Bmp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _hasReservedField = p_hasReservedField;
                _read();
            }
            private void _read()
            {
                _blue = m_io.ReadU1();
                _green = m_io.ReadU1();
                _red = m_io.ReadU1();
                if (HasReservedField) {
                    _reserved = m_io.ReadU1();
                }
            }
            private byte _blue;
            private byte _green;
            private byte _red;
            private byte? _reserved;
            private bool _hasReservedField;
            private Bmp m_root;
            private Bmp.ColorTable m_parent;
            public byte Blue { get { return _blue; } }
            public byte Green { get { return _green; } }
            public byte Red { get { return _red; } }
            public byte? Reserved { get { return _reserved; } }
            public bool HasReservedField { get { return _hasReservedField; } }
            public Bmp M_Root { get { return m_root; } }
            public Bmp.ColorTable M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapv5header">Source</a>
        /// </remarks>
        public partial class BitmapV5Extension : KaitaiStruct
        {
            public static BitmapV5Extension FromFile(string fileName)
            {
                return new BitmapV5Extension(new KaitaiStream(fileName));
            }

            public BitmapV5Extension(KaitaiStream p__io, Bmp.BitmapHeader p__parent = null, Bmp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_hasProfile = false;
                f_profileData = false;
                _read();
            }
            private void _read()
            {
                _intent = ((Bmp.Intent) m_io.ReadU4le());
                _ofsProfile = m_io.ReadU4le();
                _lenProfile = m_io.ReadU4le();
                _reserved = m_io.ReadU4le();
            }
            private bool f_hasProfile;
            private bool _hasProfile;
            public bool HasProfile
            {
                get
                {
                    if (f_hasProfile)
                        return _hasProfile;
                    _hasProfile = (bool) ( ((M_Parent.BitmapV4Ext.ColorSpaceType == Bmp.ColorSpace.ProfileLinked) || (M_Parent.BitmapV4Ext.ColorSpaceType == Bmp.ColorSpace.ProfileEmbedded)) );
                    f_hasProfile = true;
                    return _hasProfile;
                }
            }
            private bool f_profileData;
            private object _profileData;

            /// <remarks>
            /// Reference: <a href="https://learn.microsoft.com/en-us/windows/win32/wcs/using-structures-in-wcs-1-0">"If the profile is embedded, profile data is the actual profile, and if it is linked, the profile data is the null-terminated file name of the profile. This cannot be a Unicode string. It must be composed exclusively of characters from the Windows character set (code page 1252)."</a>
            /// </remarks>
            public object ProfileData
            {
                get
                {
                    if (f_profileData)
                        return _profileData;
                    if (HasProfile) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek((14 + OfsProfile));
                        {
                            bool on = M_Parent.BitmapV4Ext.ColorSpaceType == Bmp.ColorSpace.ProfileLinked;
                            if (on == true)
                            {
                                _profileData = System.Text.Encoding.GetEncoding("windows-1252").GetString(KaitaiStream.BytesTerminate(io.ReadBytes(LenProfile), 0, false));
                            }
                            else
                            {
                                _profileData = io.ReadBytes(LenProfile);
                            }
                        }
                        io.Seek(_pos);
                        f_profileData = true;
                    }
                    return _profileData;
                }
            }
            private Intent _intent;
            private uint _ofsProfile;
            private uint _lenProfile;
            private uint _reserved;
            private Bmp m_root;
            private Bmp.BitmapHeader m_parent;
            public Intent Intent { get { return _intent; } }

            /// <summary>
            /// The offset, in bytes, from the beginning of the BITMAPV5HEADER structure to the start of the profile data.
            /// </summary>
            public uint OfsProfile { get { return _ofsProfile; } }
            public uint LenProfile { get { return _lenProfile; } }
            public uint Reserved { get { return _reserved; } }
            public Bmp M_Root { get { return m_root; } }
            public Bmp.BitmapHeader M_Parent { get { return m_parent; } }
        }
        public partial class ColorMask : KaitaiStruct
        {
            public ColorMask(bool p_hasAlphaMask, KaitaiStream p__io, KaitaiStruct p__parent = null, Bmp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _hasAlphaMask = p_hasAlphaMask;
                _read();
            }
            private void _read()
            {
                _redMask = m_io.ReadU4le();
                _greenMask = m_io.ReadU4le();
                _blueMask = m_io.ReadU4le();
                if (HasAlphaMask) {
                    _alphaMask = m_io.ReadU4le();
                }
            }
            private uint _redMask;
            private uint _greenMask;
            private uint _blueMask;
            private uint? _alphaMask;
            private bool _hasAlphaMask;
            private Bmp m_root;
            private KaitaiStruct m_parent;
            public uint RedMask { get { return _redMask; } }
            public uint GreenMask { get { return _greenMask; } }
            public uint BlueMask { get { return _blueMask; } }
            public uint? AlphaMask { get { return _alphaMask; } }
            public bool HasAlphaMask { get { return _hasAlphaMask; } }
            public Bmp M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapv4header">Source</a>
        /// </remarks>
        public partial class BitmapV4Extension : KaitaiStruct
        {
            public static BitmapV4Extension FromFile(string fileName)
            {
                return new BitmapV4Extension(new KaitaiStream(fileName));
            }

            public BitmapV4Extension(KaitaiStream p__io, Bmp.BitmapHeader p__parent = null, Bmp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _colorSpaceType = ((Bmp.ColorSpace) m_io.ReadU4le());
                _endpointRed = new CieXyz(m_io, this, m_root);
                _endpointGreen = new CieXyz(m_io, this, m_root);
                _endpointBlue = new CieXyz(m_io, this, m_root);
                _gammaRed = new FixedPoint16Dot16(m_io, this, m_root);
                _gammaBlue = new FixedPoint16Dot16(m_io, this, m_root);
                _gammaGreen = new FixedPoint16Dot16(m_io, this, m_root);
            }
            private ColorSpace _colorSpaceType;
            private CieXyz _endpointRed;
            private CieXyz _endpointGreen;
            private CieXyz _endpointBlue;
            private FixedPoint16Dot16 _gammaRed;
            private FixedPoint16Dot16 _gammaBlue;
            private FixedPoint16Dot16 _gammaGreen;
            private Bmp m_root;
            private Bmp.BitmapHeader m_parent;
            public ColorSpace ColorSpaceType { get { return _colorSpaceType; } }
            public CieXyz EndpointRed { get { return _endpointRed; } }
            public CieXyz EndpointGreen { get { return _endpointGreen; } }
            public CieXyz EndpointBlue { get { return _endpointBlue; } }
            public FixedPoint16Dot16 GammaRed { get { return _gammaRed; } }
            public FixedPoint16Dot16 GammaBlue { get { return _gammaBlue; } }
            public FixedPoint16Dot16 GammaGreen { get { return _gammaGreen; } }
            public Bmp M_Root { get { return m_root; } }
            public Bmp.BitmapHeader M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://learn.microsoft.com/en-us/previous-versions/dd183376(v=vs.85)">Source</a>
        /// </remarks>
        public partial class BitmapInfoExtension : KaitaiStruct
        {
            public static BitmapInfoExtension FromFile(string fileName)
            {
                return new BitmapInfoExtension(new KaitaiStream(fileName));
            }

            public BitmapInfoExtension(KaitaiStream p__io, Bmp.BitmapHeader p__parent = null, Bmp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                if (!(M_Parent.ExtendsOs22xBitmap)) {
                    _compression = ((Bmp.Compressions) m_io.ReadU4le());
                }
                if (M_Parent.ExtendsOs22xBitmap) {
                    _os2Compression = ((Bmp.Os2Compressions) m_io.ReadU4le());
                }
                _lenImage = m_io.ReadU4le();
                _xResolution = m_io.ReadU4le();
                _yResolution = m_io.ReadU4le();
                _numColorsUsed = m_io.ReadU4le();
                _numColorsImportant = m_io.ReadU4le();
            }
            private Compressions _compression;
            private Os2Compressions _os2Compression;
            private uint _lenImage;
            private uint _xResolution;
            private uint _yResolution;
            private uint _numColorsUsed;
            private uint _numColorsImportant;
            private Bmp m_root;
            private Bmp.BitmapHeader m_parent;
            public Compressions Compression { get { return _compression; } }
            public Os2Compressions Os2Compression { get { return _os2Compression; } }

            /// <summary>
            /// If biCompression is BI_JPEG or BI_PNG, indicates the size of the JPEG or PNG image buffer.
            /// This may be set to zero for BI_RGB bitmaps.
            /// </summary>
            public uint LenImage { get { return _lenImage; } }
            public uint XResolution { get { return _xResolution; } }
            public uint YResolution { get { return _yResolution; } }
            public uint NumColorsUsed { get { return _numColorsUsed; } }
            public uint NumColorsImportant { get { return _numColorsImportant; } }
            public Bmp M_Root { get { return m_root; } }
            public Bmp.BitmapHeader M_Parent { get { return m_parent; } }
        }
        public partial class FixedPoint2Dot30 : KaitaiStruct
        {
            public static FixedPoint2Dot30 FromFile(string fileName)
            {
                return new FixedPoint2Dot30(new KaitaiStream(fileName));
            }

            public FixedPoint2Dot30(KaitaiStream p__io, Bmp.CieXyz p__parent = null, Bmp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_value = false;
                _read();
            }
            private void _read()
            {
                _raw = m_io.ReadU4le();
            }
            private bool f_value;
            private double _value;
            public double Value
            {
                get
                {
                    if (f_value)
                        return _value;
                    _value = (double) (((Raw + 0.0) / (1 << 30)));
                    f_value = true;
                    return _value;
                }
            }
            private uint _raw;
            private Bmp m_root;
            private Bmp.CieXyz m_parent;
            public uint Raw { get { return _raw; } }
            public Bmp M_Root { get { return m_root; } }
            public Bmp.CieXyz M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Replace with an opaque type if you care about the pixels.
        /// You can look at an example of a JavaScript implementation: https://github.com/generalmimon/bmptool/blob/master/src/Bitmap.js
        /// 
        /// There is a proposal for adding bitmap data type to Kaitai Struct: https://github.com/kaitai-io/kaitai_struct/issues/188
        /// </summary>
        public partial class Bitmap : KaitaiStruct
        {
            public static Bitmap FromFile(string fileName)
            {
                return new Bitmap(new KaitaiStream(fileName));
            }

            public Bitmap(KaitaiStream p__io, Bmp p__parent = null, Bmp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
            }
            private Bmp m_root;
            private Bmp m_parent;
            public Bmp M_Root { get { return m_root; } }
            public Bmp M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapcoreheader">Source</a>
        /// </remarks>
        /// <remarks>
        /// Reference: <a href="https://www.fileformat.info/format/os2bmp/egff.htm#OS2BMP-DMYID.3.1">Source</a>
        /// </remarks>
        public partial class BitmapHeader : KaitaiStruct
        {
            public BitmapHeader(uint p_lenHeader, KaitaiStream p__io, Bmp.BitmapInfo p__parent = null, Bmp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _lenHeader = p_lenHeader;
                f_extendsBitmapV4 = false;
                f_extendsOs22xBitmap = false;
                f_usesFixedPalette = false;
                f_extendsBitmapInfo = false;
                f_imageHeight = false;
                f_isCoreHeader = false;
                f_extendsBitmapV5 = false;
                f_isColorMaskHere = false;
                f_bottomUp = false;
                _read();
            }
            private void _read()
            {
                {
                    bool on = IsCoreHeader;
                    if (on == true)
                    {
                        _imageWidth = m_io.ReadU2le();
                    }
                    else if (on == false)
                    {
                        _imageWidth = m_io.ReadU4le();
                    }
                }
                {
                    bool on = IsCoreHeader;
                    if (on == true)
                    {
                        _imageHeightRaw = m_io.ReadS2le();
                    }
                    else if (on == false)
                    {
                        _imageHeightRaw = m_io.ReadS4le();
                    }
                }
                _numPlanes = m_io.ReadU2le();
                _bitsPerPixel = m_io.ReadU2le();
                if (ExtendsBitmapInfo) {
                    _bitmapInfoExt = new BitmapInfoExtension(m_io, this, m_root);
                }
                if (IsColorMaskHere) {
                    _colorMask = new ColorMask(LenHeader != Bmp.HeaderType.BitmapV2InfoHeader, m_io, this, m_root);
                }
                if (ExtendsOs22xBitmap) {
                    _os22xBitmapExt = new Os22xBitmapExtension(m_io, this, m_root);
                }
                if (ExtendsBitmapV4) {
                    _bitmapV4Ext = new BitmapV4Extension(m_io, this, m_root);
                }
                if (ExtendsBitmapV5) {
                    _bitmapV5Ext = new BitmapV5Extension(m_io, this, m_root);
                }
            }
            private bool f_extendsBitmapV4;
            private bool _extendsBitmapV4;
            public bool ExtendsBitmapV4
            {
                get
                {
                    if (f_extendsBitmapV4)
                        return _extendsBitmapV4;
                    _extendsBitmapV4 = (bool) (LenHeader >= Bmp.HeaderType.BitmapV4Header);
                    f_extendsBitmapV4 = true;
                    return _extendsBitmapV4;
                }
            }
            private bool f_extendsOs22xBitmap;
            private bool _extendsOs22xBitmap;
            public bool ExtendsOs22xBitmap
            {
                get
                {
                    if (f_extendsOs22xBitmap)
                        return _extendsOs22xBitmap;
                    _extendsOs22xBitmap = (bool) (LenHeader == Bmp.HeaderType.Os22xBitmapHeader);
                    f_extendsOs22xBitmap = true;
                    return _extendsOs22xBitmap;
                }
            }
            private bool f_usesFixedPalette;
            private bool _usesFixedPalette;
            public bool UsesFixedPalette
            {
                get
                {
                    if (f_usesFixedPalette)
                        return _usesFixedPalette;
                    _usesFixedPalette = (bool) ( ((!( ((BitsPerPixel == 16) || (BitsPerPixel == 24) || (BitsPerPixel == 32)) )) && (!( ((ExtendsBitmapInfo) && (!(ExtendsOs22xBitmap)) && ( ((BitmapInfoExt.Compression == Bmp.Compressions.Jpeg) || (BitmapInfoExt.Compression == Bmp.Compressions.Png)) )) ))) );
                    f_usesFixedPalette = true;
                    return _usesFixedPalette;
                }
            }
            private bool f_extendsBitmapInfo;
            private bool _extendsBitmapInfo;
            public bool ExtendsBitmapInfo
            {
                get
                {
                    if (f_extendsBitmapInfo)
                        return _extendsBitmapInfo;
                    _extendsBitmapInfo = (bool) (LenHeader >= Bmp.HeaderType.BitmapInfoHeader);
                    f_extendsBitmapInfo = true;
                    return _extendsBitmapInfo;
                }
            }
            private bool f_imageHeight;
            private int _imageHeight;
            public int ImageHeight
            {
                get
                {
                    if (f_imageHeight)
                        return _imageHeight;
                    _imageHeight = (int) ((ImageHeightRaw < 0 ? -(ImageHeightRaw) : ImageHeightRaw));
                    f_imageHeight = true;
                    return _imageHeight;
                }
            }
            private bool f_isCoreHeader;
            private bool _isCoreHeader;
            public bool IsCoreHeader
            {
                get
                {
                    if (f_isCoreHeader)
                        return _isCoreHeader;
                    _isCoreHeader = (bool) (LenHeader == Bmp.HeaderType.BitmapCoreHeader);
                    f_isCoreHeader = true;
                    return _isCoreHeader;
                }
            }
            private bool f_extendsBitmapV5;
            private bool _extendsBitmapV5;
            public bool ExtendsBitmapV5
            {
                get
                {
                    if (f_extendsBitmapV5)
                        return _extendsBitmapV5;
                    _extendsBitmapV5 = (bool) (LenHeader >= Bmp.HeaderType.BitmapV5Header);
                    f_extendsBitmapV5 = true;
                    return _extendsBitmapV5;
                }
            }
            private bool f_isColorMaskHere;
            private bool _isColorMaskHere;
            public bool IsColorMaskHere
            {
                get
                {
                    if (f_isColorMaskHere)
                        return _isColorMaskHere;
                    _isColorMaskHere = (bool) ( ((LenHeader == Bmp.HeaderType.BitmapV2InfoHeader) || (LenHeader == Bmp.HeaderType.BitmapV3InfoHeader) || (ExtendsBitmapV4)) );
                    f_isColorMaskHere = true;
                    return _isColorMaskHere;
                }
            }
            private bool f_bottomUp;
            private bool _bottomUp;
            public bool BottomUp
            {
                get
                {
                    if (f_bottomUp)
                        return _bottomUp;
                    _bottomUp = (bool) (ImageHeightRaw > 0);
                    f_bottomUp = true;
                    return _bottomUp;
                }
            }
            private uint _imageWidth;
            private int _imageHeightRaw;
            private ushort _numPlanes;
            private ushort _bitsPerPixel;
            private BitmapInfoExtension _bitmapInfoExt;
            private ColorMask _colorMask;
            private Os22xBitmapExtension _os22xBitmapExt;
            private BitmapV4Extension _bitmapV4Ext;
            private BitmapV5Extension _bitmapV5Ext;
            private uint _lenHeader;
            private Bmp m_root;
            private Bmp.BitmapInfo m_parent;

            /// <summary>
            /// Image width, px
            /// </summary>
            public uint ImageWidth { get { return _imageWidth; } }

            /// <summary>
            /// Image height, px (positive =&gt; bottom-up image, negative =&gt; top-down image)
            /// </summary>
            public int ImageHeightRaw { get { return _imageHeightRaw; } }

            /// <summary>
            /// Number of planes for target device, must be 1
            /// </summary>
            public ushort NumPlanes { get { return _numPlanes; } }

            /// <summary>
            /// Number of bits per pixel that image buffer uses (1, 4, 8, 16, 24 or 32)
            /// </summary>
            public ushort BitsPerPixel { get { return _bitsPerPixel; } }
            public BitmapInfoExtension BitmapInfoExt { get { return _bitmapInfoExt; } }
            public ColorMask ColorMask { get { return _colorMask; } }
            public Os22xBitmapExtension Os22xBitmapExt { get { return _os22xBitmapExt; } }
            public BitmapV4Extension BitmapV4Ext { get { return _bitmapV4Ext; } }
            public BitmapV5Extension BitmapV5Ext { get { return _bitmapV5Ext; } }
            public uint LenHeader { get { return _lenHeader; } }
            public Bmp M_Root { get { return m_root; } }
            public Bmp.BitmapInfo M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.fileformat.info/format/os2bmp/egff.htm#OS2BMP-DMYID.3.2">Source</a>
        /// </remarks>
        public partial class Os22xBitmapExtension : KaitaiStruct
        {
            public static Os22xBitmapExtension FromFile(string fileName)
            {
                return new Os22xBitmapExtension(new KaitaiStream(fileName));
            }

            public Os22xBitmapExtension(KaitaiStream p__io, Bmp.BitmapHeader p__parent = null, Bmp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _units = m_io.ReadU2le();
                _reserved = m_io.ReadU2le();
                _recording = m_io.ReadU2le();
                _rendering = ((Bmp.Os2Rendering) m_io.ReadU2le());
                _size1 = m_io.ReadU4le();
                _size2 = m_io.ReadU4le();
                _colorEncoding = m_io.ReadU4le();
                _identifier = m_io.ReadU4le();
            }
            private ushort _units;
            private ushort _reserved;
            private ushort _recording;
            private Os2Rendering _rendering;
            private uint _size1;
            private uint _size2;
            private uint _colorEncoding;
            private uint _identifier;
            private Bmp m_root;
            private Bmp.BitmapHeader m_parent;
            public ushort Units { get { return _units; } }
            public ushort Reserved { get { return _reserved; } }

            /// <summary>
            /// Specifies how the bitmap scan lines are stored.
            /// The only valid value for this field is 0, indicating that the bitmap is
            /// stored from left to right and from the bottom up.
            /// </summary>
            public ushort Recording { get { return _recording; } }

            /// <summary>
            /// Specifies the halftoning algorithm used on the bitmap data.
            /// </summary>
            public Os2Rendering Rendering { get { return _rendering; } }

            /// <summary>
            /// rendering == os2_rendering::error_diffusion
            ///   =&gt; error damping as a percentage in the range 0 through 100
            /// rendering == os2_rendering::panda or rendering == os2_rendering::super_circle
            ///   =&gt; X dimension of the pattern used in pixels
            /// </summary>
            public uint Size1 { get { return _size1; } }

            /// <summary>
            /// rendering == os2_rendering::error_diffusion
            ///   =&gt; not used
            /// rendering == os2_rendering::panda or rendering == os2_rendering::super_circle
            ///   =&gt; Y dimension of the pattern used in pixels
            /// </summary>
            public uint Size2 { get { return _size2; } }

            /// <summary>
            /// Specifies the color model used to describe the bitmap data.
            /// The only valid value is 0, indicating the RGB encoding scheme.
            /// </summary>
            public uint ColorEncoding { get { return _colorEncoding; } }

            /// <summary>
            /// Application-specific value
            /// </summary>
            public uint Identifier { get { return _identifier; } }
            public Bmp M_Root { get { return m_root; } }
            public Bmp.BitmapHeader M_Parent { get { return m_parent; } }
        }
        public partial class FixedPoint16Dot16 : KaitaiStruct
        {
            public static FixedPoint16Dot16 FromFile(string fileName)
            {
                return new FixedPoint16Dot16(new KaitaiStream(fileName));
            }

            public FixedPoint16Dot16(KaitaiStream p__io, Bmp.BitmapV4Extension p__parent = null, Bmp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_value = false;
                _read();
            }
            private void _read()
            {
                _raw = m_io.ReadU4le();
            }
            private bool f_value;
            private double _value;
            public double Value
            {
                get
                {
                    if (f_value)
                        return _value;
                    _value = (double) (((Raw + 0.0) / (1 << 16)));
                    f_value = true;
                    return _value;
                }
            }
            private uint _raw;
            private Bmp m_root;
            private Bmp.BitmapV4Extension m_parent;
            public uint Raw { get { return _raw; } }
            public Bmp M_Root { get { return m_root; } }
            public Bmp.BitmapV4Extension M_Parent { get { return m_parent; } }
        }
        public partial class ColorTable : KaitaiStruct
        {
            public ColorTable(bool p_hasReservedField, uint p_numColors, KaitaiStream p__io, Bmp.BitmapInfo p__parent = null, Bmp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _hasReservedField = p_hasReservedField;
                _numColors = p_numColors;
                f_numColorsPresent = false;
                _read();
            }
            private void _read()
            {
                _colors = new List<RgbRecord>();
                for (var i = 0; i < ( ((NumColors > 0) && (NumColors < NumColorsPresent))  ? NumColors : NumColorsPresent); i++)
                {
                    _colors.Add(new RgbRecord(HasReservedField, m_io, this, m_root));
                }
            }
            private bool f_numColorsPresent;
            private int _numColorsPresent;
            public int NumColorsPresent
            {
                get
                {
                    if (f_numColorsPresent)
                        return _numColorsPresent;
                    _numColorsPresent = (int) ((M_Io.Size / (HasReservedField ? 4 : 3)));
                    f_numColorsPresent = true;
                    return _numColorsPresent;
                }
            }
            private List<RgbRecord> _colors;
            private bool _hasReservedField;
            private uint _numColors;
            private Bmp m_root;
            private Bmp.BitmapInfo m_parent;
            public List<RgbRecord> Colors { get { return _colors; } }
            public bool HasReservedField { get { return _hasReservedField; } }

            /// <summary>
            /// If equal to 0, the pallete should contain as many colors as can fit into the pixel value
            /// according to the `bits_per_pixel` field (if `bits_per_pixel` = 8, then the pixel can
            /// represent 2 ** 8 = 256 values, so exactly 256 colors should be present). For more flexibility,
            /// it reads as many colors as it can until EOS is reached (and the image data begin).
            /// </summary>
            public uint NumColors { get { return _numColors; } }
            public Bmp M_Root { get { return m_root; } }
            public Bmp.BitmapInfo M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapfileheader">Source</a>
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
                _fileType = m_io.ReadBytes(2);
                if (!((KaitaiStream.ByteArrayCompare(FileType, new byte[] { 66, 77 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 66, 77 }, FileType, M_Io, "/types/file_header/seq/0");
                }
                _lenFile = m_io.ReadU4le();
                _reserved1 = m_io.ReadU2le();
                _reserved2 = m_io.ReadU2le();
                _ofsBitmap = m_io.ReadS4le();
            }
            private byte[] _fileType;
            private uint _lenFile;
            private ushort _reserved1;
            private ushort _reserved2;
            private int _ofsBitmap;
            private Bmp m_root;
            private Bmp m_parent;
            public byte[] FileType { get { return _fileType; } }

            /// <summary>
            /// not reliable, mostly ignored by BMP decoders
            /// </summary>
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
        /// Reference: <a href="https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfo">Source</a>
        /// </remarks>
        public partial class BitmapInfo : KaitaiStruct
        {
            public static BitmapInfo FromFile(string fileName)
            {
                return new BitmapInfo(new KaitaiStream(fileName));
            }

            public BitmapInfo(KaitaiStream p__io, Bmp p__parent = null, Bmp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_isColorMaskGiven = false;
                f_colorMaskGiven = false;
                f_colorMaskBlue = false;
                f_colorMaskAlpha = false;
                f_colorMaskGreen = false;
                f_isColorMaskHere = false;
                f_colorMaskRed = false;
                _read();
            }
            private void _read()
            {
                _lenHeader = m_io.ReadU4le();
                __raw_header = m_io.ReadBytes((LenHeader - 4));
                var io___raw_header = new KaitaiStream(__raw_header);
                _header = new BitmapHeader(LenHeader, io___raw_header, this, m_root);
                if (IsColorMaskHere) {
                    _colorMask = new ColorMask(Header.BitmapInfoExt.Compression == Bmp.Compressions.AlphaBitfields, m_io, this, m_root);
                }
                if (!(M_Io.IsEof)) {
                    __raw_colorTable = m_io.ReadBytesFull();
                    var io___raw_colorTable = new KaitaiStream(__raw_colorTable);
                    _colorTable = new ColorTable(!(Header.IsCoreHeader), (Header.ExtendsBitmapInfo ? Header.BitmapInfoExt.NumColorsUsed : 0), io___raw_colorTable, this, m_root);
                }
            }
            private bool f_isColorMaskGiven;
            private bool _isColorMaskGiven;
            public bool IsColorMaskGiven
            {
                get
                {
                    if (f_isColorMaskGiven)
                        return _isColorMaskGiven;
                    _isColorMaskGiven = (bool) ( ((Header.ExtendsBitmapInfo) && ( ((Header.BitmapInfoExt.Compression == Bmp.Compressions.Bitfields) || (Header.BitmapInfoExt.Compression == Bmp.Compressions.AlphaBitfields)) ) && ( ((IsColorMaskHere) || (Header.IsColorMaskHere)) )) );
                    f_isColorMaskGiven = true;
                    return _isColorMaskGiven;
                }
            }
            private bool f_colorMaskGiven;
            private ColorMask _colorMaskGiven;
            public ColorMask ColorMaskGiven
            {
                get
                {
                    if (f_colorMaskGiven)
                        return _colorMaskGiven;
                    if (IsColorMaskGiven) {
                        _colorMaskGiven = (ColorMask) ((IsColorMaskHere ? ColorMask : Header.ColorMask));
                    }
                    f_colorMaskGiven = true;
                    return _colorMaskGiven;
                }
            }
            private bool f_colorMaskBlue;
            private uint _colorMaskBlue;
            public uint ColorMaskBlue
            {
                get
                {
                    if (f_colorMaskBlue)
                        return _colorMaskBlue;
                    _colorMaskBlue = (uint) ((IsColorMaskGiven ? ColorMaskGiven.BlueMask : (Header.BitsPerPixel == 16 ? 31 : ( ((Header.BitsPerPixel == 24) || (Header.BitsPerPixel == 32))  ? 255 : 0))));
                    f_colorMaskBlue = true;
                    return _colorMaskBlue;
                }
            }
            private bool f_colorMaskAlpha;
            private uint _colorMaskAlpha;
            public uint ColorMaskAlpha
            {
                get
                {
                    if (f_colorMaskAlpha)
                        return _colorMaskAlpha;
                    _colorMaskAlpha = (uint) (( ((IsColorMaskGiven) && (ColorMaskGiven.HasAlphaMask))  ? ColorMaskGiven.AlphaMask : 0));
                    f_colorMaskAlpha = true;
                    return _colorMaskAlpha;
                }
            }
            private bool f_colorMaskGreen;
            private int _colorMaskGreen;
            public int ColorMaskGreen
            {
                get
                {
                    if (f_colorMaskGreen)
                        return _colorMaskGreen;
                    _colorMaskGreen = (int) ((IsColorMaskGiven ? ColorMaskGiven.GreenMask : (Header.BitsPerPixel == 16 ? 992 : ( ((Header.BitsPerPixel == 24) || (Header.BitsPerPixel == 32))  ? 65280 : 0))));
                    f_colorMaskGreen = true;
                    return _colorMaskGreen;
                }
            }
            private bool f_isColorMaskHere;
            private bool _isColorMaskHere;
            public bool IsColorMaskHere
            {
                get
                {
                    if (f_isColorMaskHere)
                        return _isColorMaskHere;
                    _isColorMaskHere = (bool) ( ((!(M_Io.IsEof)) && (Header.LenHeader == Bmp.HeaderType.BitmapInfoHeader) && ( ((Header.BitmapInfoExt.Compression == Bmp.Compressions.Bitfields) || (Header.BitmapInfoExt.Compression == Bmp.Compressions.AlphaBitfields)) )) );
                    f_isColorMaskHere = true;
                    return _isColorMaskHere;
                }
            }
            private bool f_colorMaskRed;
            private int _colorMaskRed;
            public int ColorMaskRed
            {
                get
                {
                    if (f_colorMaskRed)
                        return _colorMaskRed;
                    _colorMaskRed = (int) ((IsColorMaskGiven ? ColorMaskGiven.RedMask : (Header.BitsPerPixel == 16 ? 31744 : ( ((Header.BitsPerPixel == 24) || (Header.BitsPerPixel == 32))  ? 16711680 : 0))));
                    f_colorMaskRed = true;
                    return _colorMaskRed;
                }
            }
            private uint _lenHeader;
            private BitmapHeader _header;
            private ColorMask _colorMask;
            private ColorTable _colorTable;
            private Bmp m_root;
            private Bmp m_parent;
            private byte[] __raw_header;
            private byte[] __raw_colorTable;
            public uint LenHeader { get { return _lenHeader; } }
            public BitmapHeader Header { get { return _header; } }

            /// <summary>
            /// Valid only for BITMAPINFOHEADER, in all headers extending it the masks are contained in the header itself.
            /// </summary>
            public ColorMask ColorMask { get { return _colorMask; } }
            public ColorTable ColorTable { get { return _colorTable; } }
            public Bmp M_Root { get { return m_root; } }
            public Bmp M_Parent { get { return m_parent; } }
            public byte[] M_RawHeader { get { return __raw_header; } }
            public byte[] M_RawColorTable { get { return __raw_colorTable; } }
        }
        private FileHeader _fileHdr;
        private BitmapInfo _dibInfo;
        private Bitmap _bitmap;
        private Bmp m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_dibInfo;
        private byte[] __raw_bitmap;
        public FileHeader FileHdr { get { return _fileHdr; } }
        public BitmapInfo DibInfo { get { return _dibInfo; } }
        public Bitmap Bitmap { get { return _bitmap; } }
        public Bmp M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawDibInfo { get { return __raw_dibInfo; } }
        public byte[] M_RawBitmap { get { return __raw_bitmap; } }
    }
}
