// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://developer.apple.com/library/content/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-BBCGDDDF">Source</a>
    /// </remarks>
    public partial class QuicktimeMov : KaitaiStruct
    {
        public static QuicktimeMov FromFile(string fileName)
        {
            return new QuicktimeMov(new KaitaiStream(fileName));
        }


        public enum AtomType
        {
            Xtra = 1484026465,
            Dinf = 1684631142,
            Dref = 1685218662,
            Edts = 1701082227,
            Elst = 1701606260,
            Free = 1718773093,
            Ftyp = 1718909296,
            Hdlr = 1751411826,
            Iods = 1768907891,
            Mdat = 1835295092,
            Mdhd = 1835296868,
            Mdia = 1835297121,
            Meta = 1835365473,
            Minf = 1835626086,
            Moof = 1836019558,
            Moov = 1836019574,
            Mvhd = 1836476516,
            Smhd = 1936549988,
            Stbl = 1937007212,
            Stco = 1937007471,
            Stsc = 1937011555,
            Stsd = 1937011556,
            Stsz = 1937011578,
            Stts = 1937011827,
            Tkhd = 1953196132,
            Traf = 1953653094,
            Trak = 1953653099,
            Tref = 1953654118,
            Udta = 1969517665,
            Vmhd = 1986881636,
        }

        public enum Brand
        {
            X3g2a = 862401121,
            X3ge6 = 862414134,
            X3ge7 = 862414135,
            X3ge9 = 862414137,
            X3gf9 = 862414393,
            X3gg6 = 862414646,
            X3gg9 = 862414649,
            X3gh9 = 862414905,
            X3gm9 = 862416185,
            X3gma = 862416193,
            X3gp4 = 862416948,
            X3gp5 = 862416949,
            X3gp6 = 862416950,
            X3gp7 = 862416951,
            X3gp8 = 862416952,
            X3gp9 = 862416953,
            X3gr6 = 862417462,
            X3gr9 = 862417465,
            X3gs6 = 862417718,
            X3gs9 = 862417721,
            X3gt8 = 862417976,
            X3gt9 = 862417977,
            X3gtv = 862418038,
            X3gvr = 862418546,
            X3vra = 863400545,
            X3vrb = 863400546,
            X3vrm = 863400557,
            Arri = 1095914057,
            Caep = 1128351056,
            Cdes = 1128555891,
            J2p0 = 1244811312,
            J2p1 = 1244811313,
            Lcag = 1279476039,
            M4a = 1295270176,
            M4b = 1295270432,
            M4p = 1295274016,
            M4v = 1295275552,
            Ma1a = 1296118081,
            Ma1b = 1296118082,
            Mfsm = 1296454477,
            Mgsv = 1296520022,
            Mppi = 1297109065,
            Msnv = 1297305174,
            Miab = 1298743618,
            Miac = 1298743619,
            Mian = 1298743662,
            Mibu = 1298743925,
            Micm = 1298744173,
            Miha = 1298745409,
            Mihb = 1298745410,
            Mihe = 1298745413,
            Mipr = 1298747506,
            Ross = 1380930387,
            Seau = 1397047637,
            Sebk = 1397047883,
            Xavc = 1480676931,
            Adti = 1633973353,
            Aid3 = 1634296883,
            Av01 = 1635135537,
            Avc1 = 1635148593,
            Avci = 1635148649,
            Avcs = 1635148659,
            Avde = 1635148901,
            Avif = 1635150182,
            Avio = 1635150191,
            Avis = 1635150195,
            Bbxm = 1650620525,
            Ca4m = 1667314797,
            Ca4s = 1667314803,
            Caaa = 1667326305,
            Caac = 1667326307,
            Cabl = 1667326572,
            Cama = 1667329377,
            Camc = 1667329379,
            Caqv = 1667330422,
            Casu = 1667330933,
            Ccea = 1667458401,
            Ccff = 1667458662,
            Cdm1 = 1667525937,
            Cdm4 = 1667525940,
            Ceac = 1667588451,
            Cfhd = 1667655780,
            Cfsd = 1667658596,
            Chd1 = 1667785777,
            Chd2 = 1667785778,
            Chdf = 1667785830,
            Chev = 1667786102,
            Chh1 = 1667786801,
            Chhd = 1667786852,
            Cint = 1667853940,
            Clg1 = 1668048689,
            Clg2 = 1668048690,
            Cmf2 = 1668113970,
            Cmfc = 1668114019,
            Cmff = 1668114022,
            Cmfl = 1668114028,
            Cmfs = 1668114035,
            Cmhm = 1668114541,
            Cmhs = 1668114547,
            Comp = 1668246896,
            Csh1 = 1668507697,
            Cud1 = 1668637745,
            Cud2 = 1668637746,
            Cud8 = 1668637752,
            Cud9 = 1668637753,
            Cuvd = 1668642404,
            Cvid = 1668704612,
            Cwvt = 1668773492,
            Da0a = 1684090977,
            Da0b = 1684090978,
            Da1a = 1684091233,
            Da1b = 1684091234,
            Da2a = 1684091489,
            Da2b = 1684091490,
            Da3a = 1684091745,
            Da3b = 1684091746,
            Dash = 1684108136,
            Dby1 = 1684175153,
            Dmb1 = 1684890161,
            Dsms = 1685286259,
            Dts1 = 1685353265,
            Dts2 = 1685353266,
            Dts3 = 1685353267,
            Dv1a = 1685467489,
            Dv1b = 1685467490,
            Dv2a = 1685467745,
            Dv2b = 1685467746,
            Dv3a = 1685468001,
            Dv3b = 1685468002,
            Dvr1 = 1685484081,
            Dvt1 = 1685484593,
            Dxo = 1685614368,
            Emsg = 1701671783,
            Heic = 1751476579,
            Heim = 1751476589,
            Heis = 1751476595,
            Heix = 1751476600,
            Heoi = 1751478121,
            Hevc = 1751479907,
            Hevd = 1751479908,
            Hevi = 1751479913,
            Hevm = 1751479917,
            Hevs = 1751479923,
            Hevx = 1751479928,
            Hvce = 1752589157,
            Hvci = 1752589161,
            Hvcx = 1752589176,
            Hvti = 1752593513,
            Ifaa = 1768317281,
            Ifhd = 1768319076,
            Ifhh = 1768319080,
            Ifhr = 1768319090,
            Ifhs = 1768319091,
            Ifhu = 1768319093,
            Ifhx = 1768319096,
            Ifrm = 1768321645,
            Ifsd = 1768321892,
            Im1i = 1768763753,
            Im1t = 1768763764,
            Im2i = 1768764009,
            Im2t = 1768764020,
            Isc2 = 1769169714,
            Iso2 = 1769172786,
            Iso3 = 1769172787,
            Iso4 = 1769172788,
            Iso5 = 1769172789,
            Iso6 = 1769172790,
            Iso7 = 1769172791,
            Iso8 = 1769172792,
            Iso9 = 1769172793,
            Isoa = 1769172833,
            Isob = 1769172834,
            Isoc = 1769172835,
            Isom = 1769172845,
            J2is = 1781688691,
            J2ki = 1781689193,
            J2ks = 1781689203,
            Jp2 = 1785737760,
            Jpeg = 1785750887,
            Jpgs = 1785751411,
            Jpm = 1785752864,
            Jpoi = 1785753449,
            Jpsi = 1785754473,
            Jpx = 1785755680,
            Jpxb = 1785755746,
            Jxl = 1786276896,
            Jxs = 1786278688,
            Jxsc = 1786278755,
            Jxsi = 1786278761,
            Jxss = 1786278771,
            Lhte = 1818784869,
            Lhti = 1818784873,
            Lmsg = 1819112295,
            Miaf = 1835622758,
            Mif1 = 1835623985,
            Mif2 = 1835623986,
            Mj2s = 1835676275,
            Mjp2 = 1835692082,
            Mp21 = 1836069425,
            Mp41 = 1836069937,
            Mp42 = 1836069938,
            Mp71 = 1836070705,
            Mpuf = 1836086630,
            Msdh = 1836278888,
            Msf1 = 1836279345,
            Msix = 1836280184,
            Niko = 1852402543,
            Nlsl = 1852601196,
            Nras = 1852989811,
            Oa2d = 1868640868,
            Oabl = 1868653164,
            Odcf = 1868850022,
            Ompp = 1869443184,
            Opf2 = 1869637170,
            Opx2 = 1869641778,
            Ovdp = 1870029936,
            Ovly = 1870031993,
            Paff = 1885431398,
            Pana = 1885433441,
            Piff = 1885955686,
            Pmff = 1886217830,
            Pnvi = 1886287465,
            Pred = 1886545252,
            Qt = 1903435808,
            Relo = 1919249519,
            Risx = 1919513464,
            Sdv = 1935963680,
            Senv = 1936027254,
            Sims = 1936289139,
            Sisx = 1936290680,
            Siti = 1936290921,
            Slh1 = 1936484401,
            Slh2 = 1936484402,
            Slh3 = 1936484403,
            Ssss = 1936946035,
            Ttml = 1953787244,
            Ttwv = 1953789814,
            Uhvi = 1969780329,
            Unif = 1970170214,
            Uvvu = 1970697845,
            Vwpt = 1987539060,
            Yt4 = 2037658656,
        }
        public QuicktimeMov(KaitaiStream p__io, KaitaiStruct p__parent = null, QuicktimeMov p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _atoms = new AtomList(m_io, this, m_root);
        }

        /// <remarks>
        /// Reference: <a href="https://developer.apple.com/library/content/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-BBCGFGJG">Source</a>
        /// </remarks>
        public partial class MvhdBody : KaitaiStruct
        {
            public static MvhdBody FromFile(string fileName)
            {
                return new MvhdBody(new KaitaiStream(fileName));
            }

            public MvhdBody(KaitaiStream p__io, QuicktimeMov.Atom p__parent = null, QuicktimeMov p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _version = m_io.ReadU1();
                _flags = m_io.ReadBytes(3);
                _creationTime = m_io.ReadU4be();
                _modificationTime = m_io.ReadU4be();
                _timeScale = m_io.ReadU4be();
                _duration = m_io.ReadU4be();
                _preferredRate = new Fixed32(m_io, this, m_root);
                _preferredVolume = new Fixed16(m_io, this, m_root);
                _reserved1 = m_io.ReadBytes(10);
                _matrix = m_io.ReadBytes(36);
                _previewTime = m_io.ReadU4be();
                _previewDuration = m_io.ReadU4be();
                _posterTime = m_io.ReadU4be();
                _selectionTime = m_io.ReadU4be();
                _selectionDuration = m_io.ReadU4be();
                _currentTime = m_io.ReadU4be();
                _nextTrackId = m_io.ReadU4be();
            }
            private byte _version;
            private byte[] _flags;
            private uint _creationTime;
            private uint _modificationTime;
            private uint _timeScale;
            private uint _duration;
            private Fixed32 _preferredRate;
            private Fixed16 _preferredVolume;
            private byte[] _reserved1;
            private byte[] _matrix;
            private uint _previewTime;
            private uint _previewDuration;
            private uint _posterTime;
            private uint _selectionTime;
            private uint _selectionDuration;
            private uint _currentTime;
            private uint _nextTrackId;
            private QuicktimeMov m_root;
            private QuicktimeMov.Atom m_parent;

            /// <summary>
            /// Version of this movie header atom
            /// </summary>
            public byte Version { get { return _version; } }
            public byte[] Flags { get { return _flags; } }
            public uint CreationTime { get { return _creationTime; } }
            public uint ModificationTime { get { return _modificationTime; } }

            /// <summary>
            /// A time value that indicates the time scale for this
            /// movie - the number of time units that pass per second
            /// in its time coordinate system. A time coordinate system that
            /// measures time in sixtieths of a second, for example, has a
            /// time scale of 60.
            /// </summary>
            public uint TimeScale { get { return _timeScale; } }

            /// <summary>
            /// A time value that indicates the duration of the movie in
            /// time scale units. Note that this property is derived from
            /// the movie's tracks. The value of this field corresponds to
            /// the duration of the longest track in the movie.
            /// </summary>
            public uint Duration { get { return _duration; } }

            /// <summary>
            /// The rate at which to play this movie. A value of 1.0 indicates normal rate.
            /// </summary>
            public Fixed32 PreferredRate { get { return _preferredRate; } }

            /// <summary>
            /// How loud to play this movie's sound. A value of 1.0 indicates full volume.
            /// </summary>
            public Fixed16 PreferredVolume { get { return _preferredVolume; } }
            public byte[] Reserved1 { get { return _reserved1; } }

            /// <summary>
            /// A matrix shows how to map points from one coordinate space into another.
            /// </summary>
            public byte[] Matrix { get { return _matrix; } }

            /// <summary>
            /// The time value in the movie at which the preview begins.
            /// </summary>
            public uint PreviewTime { get { return _previewTime; } }

            /// <summary>
            /// The duration of the movie preview in movie time scale units.
            /// </summary>
            public uint PreviewDuration { get { return _previewDuration; } }

            /// <summary>
            /// The time value of the time of the movie poster.
            /// </summary>
            public uint PosterTime { get { return _posterTime; } }

            /// <summary>
            /// The time value for the start time of the current selection.
            /// </summary>
            public uint SelectionTime { get { return _selectionTime; } }

            /// <summary>
            /// The duration of the current selection in movie time scale units.
            /// </summary>
            public uint SelectionDuration { get { return _selectionDuration; } }

            /// <summary>
            /// The time value for current time position within the movie.
            /// </summary>
            public uint CurrentTime { get { return _currentTime; } }

            /// <summary>
            /// Indicates a value to use for the track ID number of the next
            /// track added to this movie. Note that 0 is not a valid track
            /// ID value.
            /// </summary>
            public uint NextTrackId { get { return _nextTrackId; } }
            public QuicktimeMov M_Root { get { return m_root; } }
            public QuicktimeMov.Atom M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://developer.apple.com/library/content/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-CJBCBIFF">Source</a>
        /// </remarks>
        public partial class FtypBody : KaitaiStruct
        {
            public static FtypBody FromFile(string fileName)
            {
                return new FtypBody(new KaitaiStream(fileName));
            }

            public FtypBody(KaitaiStream p__io, QuicktimeMov.Atom p__parent = null, QuicktimeMov p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _majorBrand = ((QuicktimeMov.Brand) m_io.ReadU4be());
                _minorVersion = m_io.ReadBytes(4);
                _compatibleBrands = new List<Brand>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _compatibleBrands.Add(((QuicktimeMov.Brand) m_io.ReadU4be()));
                        i++;
                    }
                }
            }
            private Brand _majorBrand;
            private byte[] _minorVersion;
            private List<Brand> _compatibleBrands;
            private QuicktimeMov m_root;
            private QuicktimeMov.Atom m_parent;
            public Brand MajorBrand { get { return _majorBrand; } }
            public byte[] MinorVersion { get { return _minorVersion; } }
            public List<Brand> CompatibleBrands { get { return _compatibleBrands; } }
            public QuicktimeMov M_Root { get { return m_root; } }
            public QuicktimeMov.Atom M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Fixed-point 32-bit number.
        /// </summary>
        public partial class Fixed32 : KaitaiStruct
        {
            public static Fixed32 FromFile(string fileName)
            {
                return new Fixed32(new KaitaiStream(fileName));
            }

            public Fixed32(KaitaiStream p__io, KaitaiStruct p__parent = null, QuicktimeMov p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _intPart = m_io.ReadS2be();
                _fracPart = m_io.ReadU2be();
            }
            private short _intPart;
            private ushort _fracPart;
            private QuicktimeMov m_root;
            private KaitaiStruct m_parent;
            public short IntPart { get { return _intPart; } }
            public ushort FracPart { get { return _fracPart; } }
            public QuicktimeMov M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Fixed-point 16-bit number.
        /// </summary>
        public partial class Fixed16 : KaitaiStruct
        {
            public static Fixed16 FromFile(string fileName)
            {
                return new Fixed16(new KaitaiStream(fileName));
            }

            public Fixed16(KaitaiStream p__io, QuicktimeMov.MvhdBody p__parent = null, QuicktimeMov p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _intPart = m_io.ReadS1();
                _fracPart = m_io.ReadU1();
            }
            private sbyte _intPart;
            private byte _fracPart;
            private QuicktimeMov m_root;
            private QuicktimeMov.MvhdBody m_parent;
            public sbyte IntPart { get { return _intPart; } }
            public byte FracPart { get { return _fracPart; } }
            public QuicktimeMov M_Root { get { return m_root; } }
            public QuicktimeMov.MvhdBody M_Parent { get { return m_parent; } }
        }
        public partial class Atom : KaitaiStruct
        {
            public static Atom FromFile(string fileName)
            {
                return new Atom(new KaitaiStream(fileName));
            }

            public Atom(KaitaiStream p__io, QuicktimeMov.AtomList p__parent = null, QuicktimeMov p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_len = false;
                _read();
            }
            private void _read()
            {
                _len32 = m_io.ReadU4be();
                _atomType = ((QuicktimeMov.AtomType) m_io.ReadU4be());
                if (Len32 == 1) {
                    _len64 = m_io.ReadU8be();
                }
                switch (AtomType) {
                case QuicktimeMov.AtomType.Moof: {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new AtomList(io___raw_body, this, m_root);
                    break;
                }
                case QuicktimeMov.AtomType.Tkhd: {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new TkhdBody(io___raw_body, this, m_root);
                    break;
                }
                case QuicktimeMov.AtomType.Stbl: {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new AtomList(io___raw_body, this, m_root);
                    break;
                }
                case QuicktimeMov.AtomType.Traf: {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new AtomList(io___raw_body, this, m_root);
                    break;
                }
                case QuicktimeMov.AtomType.Minf: {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new AtomList(io___raw_body, this, m_root);
                    break;
                }
                case QuicktimeMov.AtomType.Trak: {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new AtomList(io___raw_body, this, m_root);
                    break;
                }
                case QuicktimeMov.AtomType.Moov: {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new AtomList(io___raw_body, this, m_root);
                    break;
                }
                case QuicktimeMov.AtomType.Mdia: {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new AtomList(io___raw_body, this, m_root);
                    break;
                }
                case QuicktimeMov.AtomType.Dinf: {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new AtomList(io___raw_body, this, m_root);
                    break;
                }
                case QuicktimeMov.AtomType.Mvhd: {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new MvhdBody(io___raw_body, this, m_root);
                    break;
                }
                case QuicktimeMov.AtomType.Ftyp: {
                    __raw_body = m_io.ReadBytes(Len);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new FtypBody(io___raw_body, this, m_root);
                    break;
                }
                default: {
                    _body = m_io.ReadBytes(Len);
                    break;
                }
                }
            }
            private bool f_len;
            private int _len;
            public int Len
            {
                get
                {
                    if (f_len)
                        return _len;
                    _len = (int) ((Len32 == 0 ? (M_Io.Size - 8) : (Len32 == 1 ? (Len64 - 16) : (Len32 - 8))));
                    f_len = true;
                    return _len;
                }
            }
            private uint _len32;
            private AtomType _atomType;
            private ulong? _len64;
            private object _body;
            private QuicktimeMov m_root;
            private QuicktimeMov.AtomList m_parent;
            private byte[] __raw_body;
            public uint Len32 { get { return _len32; } }
            public AtomType AtomType { get { return _atomType; } }
            public ulong? Len64 { get { return _len64; } }
            public object Body { get { return _body; } }
            public QuicktimeMov M_Root { get { return m_root; } }
            public QuicktimeMov.AtomList M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }

        /// <remarks>
        /// Reference: <a href="https://developer.apple.com/library/content/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-25550">Source</a>
        /// </remarks>
        public partial class TkhdBody : KaitaiStruct
        {
            public static TkhdBody FromFile(string fileName)
            {
                return new TkhdBody(new KaitaiStream(fileName));
            }

            public TkhdBody(KaitaiStream p__io, QuicktimeMov.Atom p__parent = null, QuicktimeMov p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _version = m_io.ReadU1();
                _flags = m_io.ReadBytes(3);
                _creationTime = m_io.ReadU4be();
                _modificationTime = m_io.ReadU4be();
                _trackId = m_io.ReadU4be();
                _reserved1 = m_io.ReadBytes(4);
                _duration = m_io.ReadU4be();
                _reserved2 = m_io.ReadBytes(8);
                _layer = m_io.ReadU2be();
                _alternativeGroup = m_io.ReadU2be();
                _volume = m_io.ReadU2be();
                _reserved3 = m_io.ReadU2be();
                _matrix = m_io.ReadBytes(36);
                _width = new Fixed32(m_io, this, m_root);
                _height = new Fixed32(m_io, this, m_root);
            }
            private byte _version;
            private byte[] _flags;
            private uint _creationTime;
            private uint _modificationTime;
            private uint _trackId;
            private byte[] _reserved1;
            private uint _duration;
            private byte[] _reserved2;
            private ushort _layer;
            private ushort _alternativeGroup;
            private ushort _volume;
            private ushort _reserved3;
            private byte[] _matrix;
            private Fixed32 _width;
            private Fixed32 _height;
            private QuicktimeMov m_root;
            private QuicktimeMov.Atom m_parent;
            public byte Version { get { return _version; } }
            public byte[] Flags { get { return _flags; } }
            public uint CreationTime { get { return _creationTime; } }
            public uint ModificationTime { get { return _modificationTime; } }

            /// <summary>
            /// Integer that uniquely identifies the track. The value 0 cannot be used.
            /// </summary>
            public uint TrackId { get { return _trackId; } }
            public byte[] Reserved1 { get { return _reserved1; } }
            public uint Duration { get { return _duration; } }
            public byte[] Reserved2 { get { return _reserved2; } }
            public ushort Layer { get { return _layer; } }
            public ushort AlternativeGroup { get { return _alternativeGroup; } }
            public ushort Volume { get { return _volume; } }
            public ushort Reserved3 { get { return _reserved3; } }
            public byte[] Matrix { get { return _matrix; } }
            public Fixed32 Width { get { return _width; } }
            public Fixed32 Height { get { return _height; } }
            public QuicktimeMov M_Root { get { return m_root; } }
            public QuicktimeMov.Atom M_Parent { get { return m_parent; } }
        }
        public partial class AtomList : KaitaiStruct
        {
            public static AtomList FromFile(string fileName)
            {
                return new AtomList(new KaitaiStream(fileName));
            }

            public AtomList(KaitaiStream p__io, KaitaiStruct p__parent = null, QuicktimeMov p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _items = new List<Atom>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _items.Add(new Atom(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<Atom> _items;
            private QuicktimeMov m_root;
            private KaitaiStruct m_parent;
            public List<Atom> Items { get { return _items; } }
            public QuicktimeMov M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        private AtomList _atoms;
        private QuicktimeMov m_root;
        private KaitaiStruct m_parent;
        public AtomList Atoms { get { return _atoms; } }
        public QuicktimeMov M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
