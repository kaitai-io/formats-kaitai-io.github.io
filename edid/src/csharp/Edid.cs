// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class Edid : KaitaiStruct
    {
        public static Edid FromFile(string fileName)
        {
            return new Edid(new KaitaiStream(fileName));
        }

        public Edid(KaitaiStream p__io, KaitaiStruct p__parent = null, Edid p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_mfgYear = false;
            f_mfgIdCh1 = false;
            f_mfgIdCh3 = false;
            f_gamma = false;
            f_mfgIdCh2 = false;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(8);
            if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 0, 255, 255, 255, 255, 255, 255, 0 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 0, 255, 255, 255, 255, 255, 255, 0 }, Magic, M_Io, "/seq/0");
            }
            _mfgBytes = m_io.ReadU2le();
            _productCode = m_io.ReadU2le();
            _serial = m_io.ReadU4le();
            _mfgWeek = m_io.ReadU1();
            _mfgYearMod = m_io.ReadU1();
            _edidVersionMajor = m_io.ReadU1();
            _edidVersionMinor = m_io.ReadU1();
            _inputFlags = m_io.ReadU1();
            _screenSizeH = m_io.ReadU1();
            _screenSizeV = m_io.ReadU1();
            _gammaMod = m_io.ReadU1();
            _featuresFlags = m_io.ReadU1();
            _chromacity = new ChromacityInfo(m_io, this, m_root);
            _estTimings = new EstTimingsInfo(m_io, this, m_root);
            _stdTimings = new List<StdTiming>((int) (8));
            for (var i = 0; i < 8; i++)
            {
                _stdTimings.Add(new StdTiming(m_io, this, m_root));
            }
        }

        /// <summary>
        /// Chromaticity information: colorimetry and white point
        /// coordinates. All coordinates are stored as fixed precision
        /// 10-bit numbers, bits are shuffled for compactness.
        /// </summary>
        public partial class ChromacityInfo : KaitaiStruct
        {
            public static ChromacityInfo FromFile(string fileName)
            {
                return new ChromacityInfo(new KaitaiStream(fileName));
            }

            public ChromacityInfo(KaitaiStream p__io, Edid p__parent = null, Edid p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_greenXInt = false;
                f_redY = false;
                f_greenYInt = false;
                f_whiteY = false;
                f_redX = false;
                f_whiteX = false;
                f_blueX = false;
                f_whiteXInt = false;
                f_whiteYInt = false;
                f_greenX = false;
                f_redXInt = false;
                f_redYInt = false;
                f_blueXInt = false;
                f_blueY = false;
                f_greenY = false;
                f_blueYInt = false;
                _read();
            }
            private void _read()
            {
                _redX10 = m_io.ReadBitsIntBe(2);
                _redY10 = m_io.ReadBitsIntBe(2);
                _greenX10 = m_io.ReadBitsIntBe(2);
                _greenY10 = m_io.ReadBitsIntBe(2);
                _blueX10 = m_io.ReadBitsIntBe(2);
                _blueY10 = m_io.ReadBitsIntBe(2);
                _whiteX10 = m_io.ReadBitsIntBe(2);
                _whiteY10 = m_io.ReadBitsIntBe(2);
                m_io.AlignToByte();
                _redX92 = m_io.ReadU1();
                _redY92 = m_io.ReadU1();
                _greenX92 = m_io.ReadU1();
                _greenY92 = m_io.ReadU1();
                _blueX92 = m_io.ReadU1();
                _blueY92 = m_io.ReadU1();
                _whiteX92 = m_io.ReadU1();
                _whiteY92 = m_io.ReadU1();
            }
            private bool f_greenXInt;
            private int _greenXInt;
            public int GreenXInt
            {
                get
                {
                    if (f_greenXInt)
                        return _greenXInt;
                    _greenXInt = (int) (((GreenX92 << 2) | GreenX10));
                    f_greenXInt = true;
                    return _greenXInt;
                }
            }
            private bool f_redY;
            private double _redY;

            /// <summary>
            /// Red Y coordinate
            /// </summary>
            public double RedY
            {
                get
                {
                    if (f_redY)
                        return _redY;
                    _redY = (double) ((RedYInt / 1024.0));
                    f_redY = true;
                    return _redY;
                }
            }
            private bool f_greenYInt;
            private int _greenYInt;
            public int GreenYInt
            {
                get
                {
                    if (f_greenYInt)
                        return _greenYInt;
                    _greenYInt = (int) (((GreenY92 << 2) | GreenY10));
                    f_greenYInt = true;
                    return _greenYInt;
                }
            }
            private bool f_whiteY;
            private double _whiteY;

            /// <summary>
            /// White Y coordinate
            /// </summary>
            public double WhiteY
            {
                get
                {
                    if (f_whiteY)
                        return _whiteY;
                    _whiteY = (double) ((WhiteYInt / 1024.0));
                    f_whiteY = true;
                    return _whiteY;
                }
            }
            private bool f_redX;
            private double _redX;

            /// <summary>
            /// Red X coordinate
            /// </summary>
            public double RedX
            {
                get
                {
                    if (f_redX)
                        return _redX;
                    _redX = (double) ((RedXInt / 1024.0));
                    f_redX = true;
                    return _redX;
                }
            }
            private bool f_whiteX;
            private double _whiteX;

            /// <summary>
            /// White X coordinate
            /// </summary>
            public double WhiteX
            {
                get
                {
                    if (f_whiteX)
                        return _whiteX;
                    _whiteX = (double) ((WhiteXInt / 1024.0));
                    f_whiteX = true;
                    return _whiteX;
                }
            }
            private bool f_blueX;
            private double _blueX;

            /// <summary>
            /// Blue X coordinate
            /// </summary>
            public double BlueX
            {
                get
                {
                    if (f_blueX)
                        return _blueX;
                    _blueX = (double) ((BlueXInt / 1024.0));
                    f_blueX = true;
                    return _blueX;
                }
            }
            private bool f_whiteXInt;
            private int _whiteXInt;
            public int WhiteXInt
            {
                get
                {
                    if (f_whiteXInt)
                        return _whiteXInt;
                    _whiteXInt = (int) (((WhiteX92 << 2) | WhiteX10));
                    f_whiteXInt = true;
                    return _whiteXInt;
                }
            }
            private bool f_whiteYInt;
            private int _whiteYInt;
            public int WhiteYInt
            {
                get
                {
                    if (f_whiteYInt)
                        return _whiteYInt;
                    _whiteYInt = (int) (((WhiteY92 << 2) | WhiteY10));
                    f_whiteYInt = true;
                    return _whiteYInt;
                }
            }
            private bool f_greenX;
            private double _greenX;

            /// <summary>
            /// Green X coordinate
            /// </summary>
            public double GreenX
            {
                get
                {
                    if (f_greenX)
                        return _greenX;
                    _greenX = (double) ((GreenXInt / 1024.0));
                    f_greenX = true;
                    return _greenX;
                }
            }
            private bool f_redXInt;
            private int _redXInt;
            public int RedXInt
            {
                get
                {
                    if (f_redXInt)
                        return _redXInt;
                    _redXInt = (int) (((RedX92 << 2) | RedX10));
                    f_redXInt = true;
                    return _redXInt;
                }
            }
            private bool f_redYInt;
            private int _redYInt;
            public int RedYInt
            {
                get
                {
                    if (f_redYInt)
                        return _redYInt;
                    _redYInt = (int) (((RedY92 << 2) | RedY10));
                    f_redYInt = true;
                    return _redYInt;
                }
            }
            private bool f_blueXInt;
            private int _blueXInt;
            public int BlueXInt
            {
                get
                {
                    if (f_blueXInt)
                        return _blueXInt;
                    _blueXInt = (int) (((BlueX92 << 2) | BlueX10));
                    f_blueXInt = true;
                    return _blueXInt;
                }
            }
            private bool f_blueY;
            private double _blueY;

            /// <summary>
            /// Blue Y coordinate
            /// </summary>
            public double BlueY
            {
                get
                {
                    if (f_blueY)
                        return _blueY;
                    _blueY = (double) ((BlueYInt / 1024.0));
                    f_blueY = true;
                    return _blueY;
                }
            }
            private bool f_greenY;
            private double _greenY;

            /// <summary>
            /// Green Y coordinate
            /// </summary>
            public double GreenY
            {
                get
                {
                    if (f_greenY)
                        return _greenY;
                    _greenY = (double) ((GreenYInt / 1024.0));
                    f_greenY = true;
                    return _greenY;
                }
            }
            private bool f_blueYInt;
            private int _blueYInt;
            public int BlueYInt
            {
                get
                {
                    if (f_blueYInt)
                        return _blueYInt;
                    _blueYInt = (int) (((BlueY92 << 2) | BlueY10));
                    f_blueYInt = true;
                    return _blueYInt;
                }
            }
            private ulong _redX10;
            private ulong _redY10;
            private ulong _greenX10;
            private ulong _greenY10;
            private ulong _blueX10;
            private ulong _blueY10;
            private ulong _whiteX10;
            private ulong _whiteY10;
            private byte _redX92;
            private byte _redY92;
            private byte _greenX92;
            private byte _greenY92;
            private byte _blueX92;
            private byte _blueY92;
            private byte _whiteX92;
            private byte _whiteY92;
            private Edid m_root;
            private Edid m_parent;

            /// <summary>
            /// Red X, bits 1..0
            /// </summary>
            public ulong RedX10 { get { return _redX10; } }

            /// <summary>
            /// Red Y, bits 1..0
            /// </summary>
            public ulong RedY10 { get { return _redY10; } }

            /// <summary>
            /// Green X, bits 1..0
            /// </summary>
            public ulong GreenX10 { get { return _greenX10; } }

            /// <summary>
            /// Green Y, bits 1..0
            /// </summary>
            public ulong GreenY10 { get { return _greenY10; } }

            /// <summary>
            /// Blue X, bits 1..0
            /// </summary>
            public ulong BlueX10 { get { return _blueX10; } }

            /// <summary>
            /// Blue Y, bits 1..0
            /// </summary>
            public ulong BlueY10 { get { return _blueY10; } }

            /// <summary>
            /// White X, bits 1..0
            /// </summary>
            public ulong WhiteX10 { get { return _whiteX10; } }

            /// <summary>
            /// White Y, bits 1..0
            /// </summary>
            public ulong WhiteY10 { get { return _whiteY10; } }

            /// <summary>
            /// Red X, bits 9..2
            /// </summary>
            public byte RedX92 { get { return _redX92; } }

            /// <summary>
            /// Red Y, bits 9..2
            /// </summary>
            public byte RedY92 { get { return _redY92; } }

            /// <summary>
            /// Green X, bits 9..2
            /// </summary>
            public byte GreenX92 { get { return _greenX92; } }

            /// <summary>
            /// Green Y, bits 9..2
            /// </summary>
            public byte GreenY92 { get { return _greenY92; } }

            /// <summary>
            /// Blue X, bits 9..2
            /// </summary>
            public byte BlueX92 { get { return _blueX92; } }

            /// <summary>
            /// Blue Y, bits 9..2
            /// </summary>
            public byte BlueY92 { get { return _blueY92; } }

            /// <summary>
            /// White X, bits 9..2
            /// </summary>
            public byte WhiteX92 { get { return _whiteX92; } }

            /// <summary>
            /// White Y, bits 9..2
            /// </summary>
            public byte WhiteY92 { get { return _whiteY92; } }
            public Edid M_Root { get { return m_root; } }
            public Edid M_Parent { get { return m_parent; } }
        }
        public partial class EstTimingsInfo : KaitaiStruct
        {
            public static EstTimingsInfo FromFile(string fileName)
            {
                return new EstTimingsInfo(new KaitaiStream(fileName));
            }

            public EstTimingsInfo(KaitaiStream p__io, Edid p__parent = null, Edid p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _can72040070 = m_io.ReadBitsIntBe(1) != 0;
                _can72040088 = m_io.ReadBitsIntBe(1) != 0;
                _can64048060 = m_io.ReadBitsIntBe(1) != 0;
                _can64048067 = m_io.ReadBitsIntBe(1) != 0;
                _can64048072 = m_io.ReadBitsIntBe(1) != 0;
                _can64048075 = m_io.ReadBitsIntBe(1) != 0;
                _can80060056 = m_io.ReadBitsIntBe(1) != 0;
                _can80060060 = m_io.ReadBitsIntBe(1) != 0;
                _can80060072 = m_io.ReadBitsIntBe(1) != 0;
                _can80060075 = m_io.ReadBitsIntBe(1) != 0;
                _can83262475 = m_io.ReadBitsIntBe(1) != 0;
                _can102476887I = m_io.ReadBitsIntBe(1) != 0;
                _can102476860 = m_io.ReadBitsIntBe(1) != 0;
                _can102476870 = m_io.ReadBitsIntBe(1) != 0;
                _can102476875 = m_io.ReadBitsIntBe(1) != 0;
                _can1280102475 = m_io.ReadBitsIntBe(1) != 0;
                _can115287075 = m_io.ReadBitsIntBe(1) != 0;
                _reserved = m_io.ReadBitsIntBe(7);
            }
            private bool _can72040070;
            private bool _can72040088;
            private bool _can64048060;
            private bool _can64048067;
            private bool _can64048072;
            private bool _can64048075;
            private bool _can80060056;
            private bool _can80060060;
            private bool _can80060072;
            private bool _can80060075;
            private bool _can83262475;
            private bool _can102476887I;
            private bool _can102476860;
            private bool _can102476870;
            private bool _can102476875;
            private bool _can1280102475;
            private bool _can115287075;
            private ulong _reserved;
            private Edid m_root;
            private Edid m_parent;

            /// <summary>
            /// Supports 720 x 400 @ 70Hz
            /// </summary>
            public bool Can72040070 { get { return _can72040070; } }

            /// <summary>
            /// Supports 720 x 400 @ 88Hz
            /// </summary>
            public bool Can72040088 { get { return _can72040088; } }

            /// <summary>
            /// Supports 640 x 480 @ 60Hz
            /// </summary>
            public bool Can64048060 { get { return _can64048060; } }

            /// <summary>
            /// Supports 640 x 480 @ 67Hz
            /// </summary>
            public bool Can64048067 { get { return _can64048067; } }

            /// <summary>
            /// Supports 640 x 480 @ 72Hz
            /// </summary>
            public bool Can64048072 { get { return _can64048072; } }

            /// <summary>
            /// Supports 640 x 480 @ 75Hz
            /// </summary>
            public bool Can64048075 { get { return _can64048075; } }

            /// <summary>
            /// Supports 800 x 600 @ 56Hz
            /// </summary>
            public bool Can80060056 { get { return _can80060056; } }

            /// <summary>
            /// Supports 800 x 600 @ 60Hz
            /// </summary>
            public bool Can80060060 { get { return _can80060060; } }

            /// <summary>
            /// Supports 800 x 600 @ 72Hz
            /// </summary>
            public bool Can80060072 { get { return _can80060072; } }

            /// <summary>
            /// Supports 800 x 600 @ 75Hz
            /// </summary>
            public bool Can80060075 { get { return _can80060075; } }

            /// <summary>
            /// Supports 832 x 624 @ 75Hz
            /// </summary>
            public bool Can83262475 { get { return _can83262475; } }

            /// <summary>
            /// Supports 1024 x 768 @ 87Hz(I)
            /// </summary>
            public bool Can102476887I { get { return _can102476887I; } }

            /// <summary>
            /// Supports 1024 x 768 @ 60Hz
            /// </summary>
            public bool Can102476860 { get { return _can102476860; } }

            /// <summary>
            /// Supports 1024 x 768 @ 70Hz
            /// </summary>
            public bool Can102476870 { get { return _can102476870; } }

            /// <summary>
            /// Supports 1024 x 768 @ 75Hz
            /// </summary>
            public bool Can102476875 { get { return _can102476875; } }

            /// <summary>
            /// Supports 1280 x 1024 @ 75Hz
            /// </summary>
            public bool Can1280102475 { get { return _can1280102475; } }

            /// <summary>
            /// Supports 1152 x 870 @ 75Hz
            /// </summary>
            public bool Can115287075 { get { return _can115287075; } }
            public ulong Reserved { get { return _reserved; } }
            public Edid M_Root { get { return m_root; } }
            public Edid M_Parent { get { return m_parent; } }
        }
        public partial class StdTiming : KaitaiStruct
        {
            public static StdTiming FromFile(string fileName)
            {
                return new StdTiming(new KaitaiStream(fileName));
            }


            public enum AspectRatios
            {
                Ratio1610 = 0,
                Ratio43 = 1,
                Ratio54 = 2,
                Ratio169 = 3,
            }
            public StdTiming(KaitaiStream p__io, Edid p__parent = null, Edid p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_horizActivePixels = false;
                f_refreshRate = false;
                _read();
            }
            private void _read()
            {
                _horizActivePixelsMod = m_io.ReadU1();
                _aspectRatio = ((AspectRatios) m_io.ReadBitsIntBe(2));
                _refreshRateMod = m_io.ReadBitsIntBe(5);
            }
            private bool f_horizActivePixels;
            private int _horizActivePixels;

            /// <summary>
            /// Range of horizontal active pixels.
            /// </summary>
            public int HorizActivePixels
            {
                get
                {
                    if (f_horizActivePixels)
                        return _horizActivePixels;
                    _horizActivePixels = (int) (((HorizActivePixelsMod + 31) * 8));
                    f_horizActivePixels = true;
                    return _horizActivePixels;
                }
            }
            private bool f_refreshRate;
            private int _refreshRate;

            /// <summary>
            /// Vertical refresh rate, Hz.
            /// </summary>
            public int RefreshRate
            {
                get
                {
                    if (f_refreshRate)
                        return _refreshRate;
                    _refreshRate = (int) ((RefreshRateMod + 60));
                    f_refreshRate = true;
                    return _refreshRate;
                }
            }
            private byte _horizActivePixelsMod;
            private AspectRatios _aspectRatio;
            private ulong _refreshRateMod;
            private Edid m_root;
            private Edid m_parent;

            /// <summary>
            /// Range of horizontal active pixels, written in modified form:
            /// `(horiz_active_pixels / 8) - 31`. This yields an effective
            /// range of 256..2288, with steps of 8 pixels.
            /// </summary>
            public byte HorizActivePixelsMod { get { return _horizActivePixelsMod; } }

            /// <summary>
            /// Aspect ratio of the image. Can be used to calculate number
            /// of vertical pixels.
            /// </summary>
            public AspectRatios AspectRatio { get { return _aspectRatio; } }

            /// <summary>
            /// Refresh rate in Hz, written in modified form: `refresh_rate
            /// - 60`. This yields an effective range of 60..123 Hz.
            /// </summary>
            public ulong RefreshRateMod { get { return _refreshRateMod; } }
            public Edid M_Root { get { return m_root; } }
            public Edid M_Parent { get { return m_parent; } }
        }
        private bool f_mfgYear;
        private int _mfgYear;
        public int MfgYear
        {
            get
            {
                if (f_mfgYear)
                    return _mfgYear;
                _mfgYear = (int) ((MfgYearMod + 1990));
                f_mfgYear = true;
                return _mfgYear;
            }
        }
        private bool f_mfgIdCh1;
        private int _mfgIdCh1;
        public int MfgIdCh1
        {
            get
            {
                if (f_mfgIdCh1)
                    return _mfgIdCh1;
                _mfgIdCh1 = (int) (((MfgBytes & 31744) >> 10));
                f_mfgIdCh1 = true;
                return _mfgIdCh1;
            }
        }
        private bool f_mfgIdCh3;
        private int _mfgIdCh3;
        public int MfgIdCh3
        {
            get
            {
                if (f_mfgIdCh3)
                    return _mfgIdCh3;
                _mfgIdCh3 = (int) ((MfgBytes & 31));
                f_mfgIdCh3 = true;
                return _mfgIdCh3;
            }
        }
        private bool f_gamma;
        private double? _gamma;
        public double? Gamma
        {
            get
            {
                if (f_gamma)
                    return _gamma;
                if (GammaMod != 255) {
                    _gamma = (double) (((GammaMod + 100) / 100.0));
                }
                f_gamma = true;
                return _gamma;
            }
        }
        private bool f_mfgIdCh2;
        private int _mfgIdCh2;
        public int MfgIdCh2
        {
            get
            {
                if (f_mfgIdCh2)
                    return _mfgIdCh2;
                _mfgIdCh2 = (int) (((MfgBytes & 992) >> 5));
                f_mfgIdCh2 = true;
                return _mfgIdCh2;
            }
        }
        private byte[] _magic;
        private ushort _mfgBytes;
        private ushort _productCode;
        private uint _serial;
        private byte _mfgWeek;
        private byte _mfgYearMod;
        private byte _edidVersionMajor;
        private byte _edidVersionMinor;
        private byte _inputFlags;
        private byte _screenSizeH;
        private byte _screenSizeV;
        private byte _gammaMod;
        private byte _featuresFlags;
        private ChromacityInfo _chromacity;
        private EstTimingsInfo _estTimings;
        private List<StdTiming> _stdTimings;
        private Edid m_root;
        private KaitaiStruct m_parent;
        public byte[] Magic { get { return _magic; } }
        public ushort MfgBytes { get { return _mfgBytes; } }

        /// <summary>
        /// Manufacturer product code
        /// </summary>
        public ushort ProductCode { get { return _productCode; } }

        /// <summary>
        /// Serial number
        /// </summary>
        public uint Serial { get { return _serial; } }

        /// <summary>
        /// Week of manufacture. Week numbering is not consistent between manufacturers.
        /// </summary>
        public byte MfgWeek { get { return _mfgWeek; } }

        /// <summary>
        /// Year of manufacture, less 1990. (1990–2245). If week=255, it is the model year instead.
        /// </summary>
        public byte MfgYearMod { get { return _mfgYearMod; } }

        /// <summary>
        /// EDID version, usually 1 (for 1.3)
        /// </summary>
        public byte EdidVersionMajor { get { return _edidVersionMajor; } }

        /// <summary>
        /// EDID revision, usually 3 (for 1.3)
        /// </summary>
        public byte EdidVersionMinor { get { return _edidVersionMinor; } }
        public byte InputFlags { get { return _inputFlags; } }

        /// <summary>
        /// Maximum horizontal image size, in centimetres (max 292 cm/115 in at 16:9 aspect ratio)
        /// </summary>
        public byte ScreenSizeH { get { return _screenSizeH; } }

        /// <summary>
        /// Maximum vertical image size, in centimetres. If either byte is 0, undefined (e.g. projector)
        /// </summary>
        public byte ScreenSizeV { get { return _screenSizeV; } }

        /// <summary>
        /// Display gamma, datavalue = (gamma*100)-100 (range 1.00–3.54)
        /// </summary>
        public byte GammaMod { get { return _gammaMod; } }
        public byte FeaturesFlags { get { return _featuresFlags; } }

        /// <summary>
        /// Phosphor or filter chromaticity structure, which provides info on colorimetry and white point
        /// </summary>
        /// <remarks>
        /// Reference: Standard, section 3.7
        /// </remarks>
        public ChromacityInfo Chromacity { get { return _chromacity; } }

        /// <summary>
        /// Block of bit flags that indicates support of so called
        /// &quot;established timings&quot;, which is a commonly used subset of VESA
        /// DMT (Discrete Monitor Timings) modes.
        /// </summary>
        /// <remarks>
        /// Reference: Standard, section 3.8
        /// </remarks>
        public EstTimingsInfo EstTimings { get { return _estTimings; } }

        /// <summary>
        /// Array of descriptions of so called &quot;standard timings&quot;, which are
        /// used to specify up to 8 additional timings not included in
        /// &quot;established timings&quot;.
        /// </summary>
        public List<StdTiming> StdTimings { get { return _stdTimings; } }
        public Edid M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
