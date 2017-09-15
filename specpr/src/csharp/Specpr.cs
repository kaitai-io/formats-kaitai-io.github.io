// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Specpr records are fixed format, 1536 bytes/record. Record number
    /// counting starts at 0. Binary data are in IEEE format real numbers
    /// and non-byte swapped integers (compatiible with all Sun
    /// Microsystems, and Hewlett Packard workstations (Intel and some DEC
    /// machines are byte swapped relative to Suns and HPs). Each record may
    /// contain different information according to the following scheme.
    /// 
    /// You can get some library of spectra from
    /// ftp://ftpext.cr.usgs.gov/pub/cr/co/denver/speclab/pub/spectral.library/splib06.library/
    /// </summary>
    public partial class Specpr : KaitaiStruct
    {
        public static Specpr FromFile(string fileName)
        {
            return new Specpr(new KaitaiStream(fileName));
        }


        public enum RecordType
        {
            DataInitial = 0,
            TextInitial = 1,
            DataContinuation = 2,
            TextContinuation = 3,
        }
        public Specpr(KaitaiStream p__io, KaitaiStruct p__parent = null, Specpr p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _records = new List<Record>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _records.Add(new Record(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class DataInitial : KaitaiStruct
        {
            public static DataInitial FromFile(string fileName)
            {
                return new DataInitial(new KaitaiStream(fileName));
            }

            public DataInitial(KaitaiStream p__io, Specpr.Record p__parent = null, Specpr p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_phaseAngleArcsec = false;
                _read();
            }
            private void _read()
            {
                _ids = new Identifiers(m_io, this, m_root);
                _iscta = new CoarseTimestamp(m_io, this, m_root);
                _isctb = new CoarseTimestamp(m_io, this, m_root);
                _jdatea = m_io.ReadS4be();
                _jdateb = m_io.ReadS4be();
                _istb = new CoarseTimestamp(m_io, this, m_root);
                _isra = m_io.ReadS4be();
                _isdec = m_io.ReadS4be();
                _itchan = m_io.ReadS4be();
                _irmas = m_io.ReadS4be();
                _revs = m_io.ReadS4be();
                _iband = new List<int>((int) (2));
                for (var i = 0; i < 2; i++)
                {
                    _iband.Add(m_io.ReadS4be());
                }
                _irwav = m_io.ReadS4be();
                _irespt = m_io.ReadS4be();
                _irecno = m_io.ReadS4be();
                _itpntr = m_io.ReadS4be();
                _ihist = System.Text.Encoding.GetEncoding("ascii").GetString(KaitaiStream.BytesStripRight(m_io.ReadBytes(60), 32));
                _mhist = new List<string>((int) (4));
                for (var i = 0; i < 4; i++)
                {
                    _mhist.Add(System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(74)));
                }
                _nruns = m_io.ReadS4be();
                _siangl = new IllumAngle(m_io, this, m_root);
                _seangl = new IllumAngle(m_io, this, m_root);
                _sphase = m_io.ReadS4be();
                _iwtrns = m_io.ReadS4be();
                _itimch = m_io.ReadS4be();
                _xnrm = m_io.ReadF4be();
                _scatim = m_io.ReadF4be();
                _timint = m_io.ReadF4be();
                _tempd = m_io.ReadF4be();
                _data = new List<float>((int) (256));
                for (var i = 0; i < 256; i++)
                {
                    _data.Add(m_io.ReadF4be());
                }
            }
            private bool f_phaseAngleArcsec;
            private double _phaseAngleArcsec;

            /// <summary>
            /// The phase angle between iangl and eangl in seconds
            /// </summary>
            public double PhaseAngleArcsec
            {
                get
                {
                    if (f_phaseAngleArcsec)
                        return _phaseAngleArcsec;
                    _phaseAngleArcsec = (double) ((Sphase / 1500));
                    f_phaseAngleArcsec = true;
                    return _phaseAngleArcsec;
                }
            }
            private Identifiers _ids;
            private CoarseTimestamp _iscta;
            private CoarseTimestamp _isctb;
            private int _jdatea;
            private int _jdateb;
            private CoarseTimestamp _istb;
            private int _isra;
            private int _isdec;
            private int _itchan;
            private int _irmas;
            private int _revs;
            private List<int> _iband;
            private int _irwav;
            private int _irespt;
            private int _irecno;
            private int _itpntr;
            private string _ihist;
            private List<string> _mhist;
            private int _nruns;
            private IllumAngle _siangl;
            private IllumAngle _seangl;
            private int _sphase;
            private int _iwtrns;
            private int _itimch;
            private float _xnrm;
            private float _scatim;
            private float _timint;
            private float _tempd;
            private List<float> _data;
            private Specpr m_root;
            private Specpr.Record m_parent;
            public Identifiers Ids { get { return _ids; } }

            /// <summary>
            /// Civil or Universal time when data was last processed
            /// </summary>
            public CoarseTimestamp Iscta { get { return _iscta; } }

            /// <summary>
            /// Civil or Universal time at the start of the spectral run
            /// </summary>
            public CoarseTimestamp Isctb { get { return _isctb; } }

            /// <summary>
            /// Date when data was last processed. Stored as integer*4 Julian Day number *10
            /// </summary>
            public int Jdatea { get { return _jdatea; } }

            /// <summary>
            /// Date when the spectral run began. Stored as integer*4 Julian Day number *10
            /// </summary>
            public int Jdateb { get { return _jdateb; } }

            /// <summary>
            /// Siderial time when the spectral run started. See flag #05.
            /// </summary>
            public CoarseTimestamp Istb { get { return _istb; } }

            /// <summary>
            /// Right ascension coordinates of an astronomical  object, or longitude on a planetary surface (integer*4 numbers in seconds *1000) (RA in RA seconds, Longitude in arc-seconds) See flag #06.
            /// </summary>
            public int Isra { get { return _isra; } }

            /// <summary>
            /// Declination coordinates of an astronomical object, or latitude on a planetary surface (integer*4 number in arc-seconds *1000). See flag #06.
            /// </summary>
            public int Isdec { get { return _isdec; } }

            /// <summary>
            /// Total number of channels in the spectrum (integer*4 value from 1 to 4852)
            /// </summary>
            public int Itchan { get { return _itchan; } }

            /// <summary>
            /// The equivalent atmospheric thickness through which the observation was obtained (=1.0 overhead scaled: airmass*1000; integer*4).
            /// </summary>
            public int Irmas { get { return _irmas; } }

            /// <summary>
            /// The number of independent spectral scans which were added to make the spectrum (integer*4 number).
            /// </summary>
            public int Revs { get { return _revs; } }

            /// <summary>
            /// The channel numbers which define the band normalization (scaling to unity). (integers*4).
            /// </summary>
            public List<int> Iband { get { return _iband; } }

            /// <summary>
            /// The record number within the file where the wavelengths are found (integer*4).
            /// </summary>
            public int Irwav { get { return _irwav; } }

            /// <summary>
            /// The record pointer to where the resolution can be found (or horizontal error bar) (integer*4).
            /// </summary>
            public int Irespt { get { return _irespt; } }

            /// <summary>
            /// The record number within the file where the data is located (integer*4 number).
            /// </summary>
            public int Irecno { get { return _irecno; } }

            /// <summary>
            /// Text data record pointer. This pointer points to a data record where additional text describing the data may be found.  (32 bit integer)
            /// </summary>
            public int Itpntr { get { return _itpntr; } }

            /// <summary>
            /// The program automatic 60 character history.
            /// </summary>
            public string Ihist { get { return _ihist; } }

            /// <summary>
            /// Manual history. Program automatic for large history requirements.
            /// </summary>
            public List<string> Mhist { get { return _mhist; } }

            /// <summary>
            /// The number of independent spectral runs which were summed or averaged to make this spectrum (integer*4).
            /// </summary>
            public int Nruns { get { return _nruns; } }

            /// <summary>
            /// The angle of incidence of illuminating radiation
            ///       integrating sphere = 2000000000
            ///       Geometric albedo   = 2000000001
            /// </summary>
            public IllumAngle Siangl { get { return _siangl; } }

            /// <summary>
            /// The angle of emission of illuminating radiation
            ///       integrating sphere = 2000000000
            ///       Geometric albedo   = 2000000001
            /// </summary>
            public IllumAngle Seangl { get { return _seangl; } }

            /// <summary>
            /// The phase angle between iangl and eangl (Integer*4 number, in arc-seconds*1500). (180 degrees=972000000; -180 deg &lt;= phase &lt;= 180 deg)
            ///       integrating sphere = 2000000000
            /// </summary>
            public int Sphase { get { return _sphase; } }

            /// <summary>
            /// Weighted number of runs (the number of runs of the spectrum with the minimum runs which was used in processing this spectrum, integer*4).
            /// </summary>
            public int Iwtrns { get { return _iwtrns; } }

            /// <summary>
            /// The time observed in the sample beam for each half chop in milliseconds (for chopping spectrometers only). (integer*4)
            /// </summary>
            public int Itimch { get { return _itimch; } }

            /// <summary>
            /// The band normalization factor. For data scaled to 1.0, multiply by this number to recover photometric level (32 bit real number).
            /// </summary>
            public float Xnrm { get { return _xnrm; } }

            /// <summary>
            /// The time it takes to make one scan of the entire spectrum in seconds (32 bit real number).
            /// </summary>
            public float Scatim { get { return _scatim; } }

            /// <summary>
            /// Total integration time (usually=scatime * nruns) (32 bit real number).
            /// </summary>
            public float Timint { get { return _timint; } }

            /// <summary>
            /// Temperature in degrees Kelvin (32 bit real number).
            /// </summary>
            public float Tempd { get { return _tempd; } }

            /// <summary>
            /// The spectral data (256 channels of 32 bit real data numbers).
            /// </summary>
            public List<float> Data { get { return _data; } }
            public Specpr M_Root { get { return m_root; } }
            public Specpr.Record M_Parent { get { return m_parent; } }
        }
        public partial class CoarseTimestamp : KaitaiStruct
        {
            public static CoarseTimestamp FromFile(string fileName)
            {
                return new CoarseTimestamp(new KaitaiStream(fileName));
            }

            public CoarseTimestamp(KaitaiStream p__io, Specpr.DataInitial p__parent = null, Specpr p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_seconds = false;
                _read();
            }
            private void _read()
            {
                _scaledSeconds = m_io.ReadS4be();
            }
            private bool f_seconds;
            private double _seconds;
            public double Seconds
            {
                get
                {
                    if (f_seconds)
                        return _seconds;
                    _seconds = (double) ((ScaledSeconds * 24000));
                    f_seconds = true;
                    return _seconds;
                }
            }
            private int _scaledSeconds;
            private Specpr m_root;
            private Specpr.DataInitial m_parent;
            public int ScaledSeconds { get { return _scaledSeconds; } }
            public Specpr M_Root { get { return m_root; } }
            public Specpr.DataInitial M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// it is big endian
        /// </summary>
        public partial class Icflag : KaitaiStruct
        {
            public static Icflag FromFile(string fileName)
            {
                return new Icflag(new KaitaiStream(fileName));
            }

            public Icflag(KaitaiStream p__io, Specpr.Record p__parent = null, Specpr p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_type = false;
                _read();
            }
            private void _read()
            {
                _reserved = m_io.ReadBitsInt(26);
                _isctbType = m_io.ReadBitsInt(1) != 0;
                _isctaType = m_io.ReadBitsInt(1) != 0;
                _coordinateMode = m_io.ReadBitsInt(1) != 0;
                _errors = m_io.ReadBitsInt(1) != 0;
                _text = m_io.ReadBitsInt(1) != 0;
                _continuation = m_io.ReadBitsInt(1) != 0;
            }
            private bool f_type;
            private RecordType _type;
            public RecordType Type
            {
                get
                {
                    if (f_type)
                        return _type;
                    _type = (RecordType) (((Specpr.RecordType) (((Text ? 1 : 0) * 1) + ((Continuation ? 1 : 0) * 2))));
                    f_type = true;
                    return _type;
                }
            }
            private ulong _reserved;
            private bool _isctbType;
            private bool _isctaType;
            private bool _coordinateMode;
            private bool _errors;
            private bool _text;
            private bool _continuation;
            private Specpr m_root;
            private Specpr.Record m_parent;
            public ulong Reserved { get { return _reserved; } }

            /// <summary>
            /// =0 ctb is civil time
            /// =1 ctb is universal time
            /// </summary>
            public bool IsctbType { get { return _isctbType; } }

            /// <summary>
            /// =0 cta is civil time
            /// =1 cta is universal time
            /// </summary>
            public bool IsctaType { get { return _isctaType; } }

            /// <summary>
            /// RA, Dec / Long., Lat flag
            /// =0 the array &quot;ira&quot; and &quot;idec&quot; corresponds to the right ascension and declination of an astronomical object.
            /// =1 the array &quot;ira&quot; and &quot;idec&quot; correspond to the longitude and latitude of a spot on a planetary surface.
            /// </summary>
            public bool CoordinateMode { get { return _coordinateMode; } }

            /// <summary>
            /// flag to indicate whether or not the data for the error bar (1 sigma standard deviation of the mean) is in the next record set. =0: no errors, =1: errors in next record set.
            /// </summary>
            public bool Errors { get { return _errors; } }

            /// <summary>
            /// =0 the data in the array &quot;data&quot; is data
            /// =1 the data in the array &quot;data&quot; is ascii text as is most of the header info.
            /// </summary>
            public bool Text { get { return _text; } }

            /// <summary>
            /// =0 first record of a spectrum consists of: header then 256 data channels
            /// =1 continuation data record consisting of:
            ///   # bit flags followed by 1532 bytes of
            ///   # real data (bit 1=0) (383 channels)
            ///   # or 1532 bytes of text (bit 1=1).
            ///   # A maximum of 12 continuation records
            ///   # are allowed for a total of 4852
            ///   # channels (limited by arrays of 4864)
            ///   # or 19860 characters of text (bit 1=1).
            /// </summary>
            public bool Continuation { get { return _continuation; } }
            public Specpr M_Root { get { return m_root; } }
            public Specpr.Record M_Parent { get { return m_parent; } }
        }
        public partial class DataContinuation : KaitaiStruct
        {
            public static DataContinuation FromFile(string fileName)
            {
                return new DataContinuation(new KaitaiStream(fileName));
            }

            public DataContinuation(KaitaiStream p__io, Specpr.Record p__parent = null, Specpr p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _cdata = new List<float>((int) (383));
                for (var i = 0; i < 383; i++)
                {
                    _cdata.Add(m_io.ReadF4be());
                }
            }
            private List<float> _cdata;
            private Specpr m_root;
            private Specpr.Record m_parent;

            /// <summary>
            /// The continuation of the data values (383 channels of 32 bit real numbers).
            /// </summary>
            public List<float> Cdata { get { return _cdata; } }
            public Specpr M_Root { get { return m_root; } }
            public Specpr.Record M_Parent { get { return m_parent; } }
        }
        public partial class Identifiers : KaitaiStruct
        {
            public static Identifiers FromFile(string fileName)
            {
                return new Identifiers(new KaitaiStream(fileName));
            }

            public Identifiers(KaitaiStream p__io, KaitaiStruct p__parent = null, Specpr p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _ititle = System.Text.Encoding.GetEncoding("ascii").GetString(KaitaiStream.BytesStripRight(m_io.ReadBytes(40), 32));
                _usernm = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(8));
            }
            private string _ititle;
            private string _usernm;
            private Specpr m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Title which describes the data
            /// </summary>
            public string Ititle { get { return _ititle; } }

            /// <summary>
            /// The name of the user who created the data record
            /// </summary>
            public string Usernm { get { return _usernm; } }
            public Specpr M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class IllumAngle : KaitaiStruct
        {
            public static IllumAngle FromFile(string fileName)
            {
                return new IllumAngle(new KaitaiStream(fileName));
            }

            public IllumAngle(KaitaiStream p__io, Specpr.DataInitial p__parent = null, Specpr p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_secondsTotal = false;
                f_minutesTotal = false;
                f_degreesTotal = false;
                _read();
            }
            private void _read()
            {
                _angl = m_io.ReadS4be();
            }
            private bool f_secondsTotal;
            private int _secondsTotal;
            public int SecondsTotal
            {
                get
                {
                    if (f_secondsTotal)
                        return _secondsTotal;
                    _secondsTotal = (int) ((Angl / 6000));
                    f_secondsTotal = true;
                    return _secondsTotal;
                }
            }
            private bool f_minutesTotal;
            private int _minutesTotal;
            public int MinutesTotal
            {
                get
                {
                    if (f_minutesTotal)
                        return _minutesTotal;
                    _minutesTotal = (int) ((SecondsTotal / 60));
                    f_minutesTotal = true;
                    return _minutesTotal;
                }
            }
            private bool f_degreesTotal;
            private int _degreesTotal;
            public int DegreesTotal
            {
                get
                {
                    if (f_degreesTotal)
                        return _degreesTotal;
                    _degreesTotal = (int) ((MinutesTotal / 60));
                    f_degreesTotal = true;
                    return _degreesTotal;
                }
            }
            private int _angl;
            private Specpr m_root;
            private Specpr.DataInitial m_parent;

            /// <summary>
            /// (Integer*4 number, in arc-seconds*6000). (90 degrees=1944000000; -90 deg &lt;= angle &lt;= 90 deg)
            /// </summary>
            public int Angl { get { return _angl; } }
            public Specpr M_Root { get { return m_root; } }
            public Specpr.DataInitial M_Parent { get { return m_parent; } }
        }
        public partial class TextInitial : KaitaiStruct
        {
            public static TextInitial FromFile(string fileName)
            {
                return new TextInitial(new KaitaiStream(fileName));
            }

            public TextInitial(KaitaiStream p__io, Specpr.Record p__parent = null, Specpr p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _ids = new Identifiers(m_io, this, m_root);
                _itxtpt = m_io.ReadU4be();
                _itxtch = m_io.ReadS4be();
                _itext = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(1476));
            }
            private Identifiers _ids;
            private uint _itxtpt;
            private int _itxtch;
            private string _itext;
            private Specpr m_root;
            private Specpr.Record m_parent;
            public Identifiers Ids { get { return _ids; } }

            /// <summary>
            /// Text data record pointer. This pointer points  to a data record where additional text may be may be found.
            /// </summary>
            public uint Itxtpt { get { return _itxtpt; } }

            /// <summary>
            /// The number of text characters (maximum= 19860).
            /// </summary>
            public int Itxtch { get { return _itxtch; } }

            /// <summary>
            /// 1476 characters of text.  Text has embedded newlines so the number of lines available is limited only by the number of characters available.
            /// </summary>
            public string Itext { get { return _itext; } }
            public Specpr M_Root { get { return m_root; } }
            public Specpr.Record M_Parent { get { return m_parent; } }
        }
        public partial class Record : KaitaiStruct
        {
            public static Record FromFile(string fileName)
            {
                return new Record(new KaitaiStream(fileName));
            }

            public Record(KaitaiStream p__io, Specpr p__parent = null, Specpr p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _icflag = new Icflag(m_io, this, m_root);
                switch (Icflag.Type) {
                case Specpr.RecordType.DataInitial: {
                    __raw_content = m_io.ReadBytes((1536 - 4));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new DataInitial(io___raw_content, this, m_root);
                    break;
                }
                case Specpr.RecordType.DataContinuation: {
                    __raw_content = m_io.ReadBytes((1536 - 4));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new DataContinuation(io___raw_content, this, m_root);
                    break;
                }
                case Specpr.RecordType.TextContinuation: {
                    __raw_content = m_io.ReadBytes((1536 - 4));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new TextContinuation(io___raw_content, this, m_root);
                    break;
                }
                case Specpr.RecordType.TextInitial: {
                    __raw_content = m_io.ReadBytes((1536 - 4));
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new TextInitial(io___raw_content, this, m_root);
                    break;
                }
                default: {
                    _content = m_io.ReadBytes((1536 - 4));
                    break;
                }
                }
            }
            private Icflag _icflag;
            private object _content;
            private Specpr m_root;
            private Specpr m_parent;
            private byte[] __raw_content;

            /// <summary>
            /// Total number of bytes comprising the document.
            /// </summary>
            public Icflag Icflag { get { return _icflag; } }
            public object Content { get { return _content; } }
            public Specpr M_Root { get { return m_root; } }
            public Specpr M_Parent { get { return m_parent; } }
            public byte[] M_RawContent { get { return __raw_content; } }
        }
        public partial class TextContinuation : KaitaiStruct
        {
            public static TextContinuation FromFile(string fileName)
            {
                return new TextContinuation(new KaitaiStream(fileName));
            }

            public TextContinuation(KaitaiStream p__io, Specpr.Record p__parent = null, Specpr p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _tdata = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(1532));
            }
            private string _tdata;
            private Specpr m_root;
            private Specpr.Record m_parent;

            /// <summary>
            /// 1532 characters of text.
            /// </summary>
            public string Tdata { get { return _tdata; } }
            public Specpr M_Root { get { return m_root; } }
            public Specpr.Record M_Parent { get { return m_parent; } }
        }
        private List<Record> _records;
        private Specpr m_root;
        private KaitaiStruct m_parent;
        public List<Record> Records { get { return _records; } }
        public Specpr M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
