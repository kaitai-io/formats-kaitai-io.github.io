// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{
    public partial class Edid : KaitaiStruct
    {
        public static Edid FromFile(string fileName)
        {
            return new Edid(new KaitaiStream(fileName));
        }

        public Edid(KaitaiStream io, KaitaiStruct parent = null, Edid root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            f_mfgYear = false;
            f_mfgIdCh1 = false;
            f_mfgIdCh3 = false;
            f_gamma = false;
            f_mfgIdCh2 = false;
            _read();
        }
        private void _read() {
            _magic = m_io.EnsureFixedContents(new byte[] { 0, 255, 255, 255, 255, 255, 255, 0 });
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
            _chromacity = m_io.ReadBytes(10);
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
        private double _gamma;
        public double Gamma
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
        private byte[] _chromacity;
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
        public byte[] Chromacity { get { return _chromacity; } }
        public Edid M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
