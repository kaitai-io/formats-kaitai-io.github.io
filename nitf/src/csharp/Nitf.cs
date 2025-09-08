// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;
using System;

namespace Kaitai
{

    /// <summary>
    /// The NITF (National Image Transition Format) format is a file format developed by the U.S. Government for
    /// storing imagery, e.g. from satellites.
    /// 
    /// According to the [foreword of the specification](https://web.archive.org/web/20181105050336/https://www.gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf):
    /// &gt; The National Imagery Transmission Format Standard (NITFS) is the suite of standards for formatting digital
    /// &gt; imagery and imagery-related products and exchanging them among members of the Intelligence Community (IC) as
    /// &gt; defined by the Executive Order 12333, and other United States Government departments and agencies.&quot;
    /// 
    /// This implementation is set to version format (`file_version`) of 02.10 and `standard_type` of `BF01`.
    /// It was implemented by [River Loop Security](https://www.riverloopsecurity.com/).
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://web.archive.org/web/20181105050336/https://www.gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf">Source</a>
    /// </remarks>
    public partial class Nitf : KaitaiStruct
    {
        public static Nitf FromFile(string fileName)
        {
            return new Nitf(new KaitaiStream(fileName));
        }

        public Nitf(KaitaiStream p__io, KaitaiStruct p__parent = null, Nitf p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _header = new Header(m_io, this, m_root);
            _imageSegments = new List<ImageSegment>();
            for (var i = 0; i < Convert.ToInt64(Header.NumImageSegments, 10); i++)
            {
                _imageSegments.Add(new ImageSegment(i, m_io, this, m_root));
            }
            _graphicsSegments = new List<GraphicsSegment>();
            for (var i = 0; i < Convert.ToInt64(Header.NumGraphicsSegments, 10); i++)
            {
                _graphicsSegments.Add(new GraphicsSegment(i, m_io, this, m_root));
            }
            _textSegments = new List<TextSegment>();
            for (var i = 0; i < Convert.ToInt64(Header.NumTextFiles, 10); i++)
            {
                _textSegments.Add(new TextSegment(i, m_io, this, m_root));
            }
            _dataExtensionSegments = new List<DataExtensionSegment>();
            for (var i = 0; i < Convert.ToInt64(Header.NumDataExtension, 10); i++)
            {
                _dataExtensionSegments.Add(new DataExtensionSegment(i, m_io, this, m_root));
            }
            _reservedExtensionSegments = new List<ReservedExtensionSegment>();
            for (var i = 0; i < Convert.ToInt64(Header.NumReservedExtension, 10); i++)
            {
                _reservedExtensionSegments.Add(new ReservedExtensionSegment(i, m_io, this, m_root));
            }
        }
        public partial class BandInfo : KaitaiStruct
        {
            public static BandInfo FromFile(string fileName)
            {
                return new BandInfo(new KaitaiStream(fileName));
            }

            public BandInfo(KaitaiStream p__io, Nitf.ImageSubHeader p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _representation = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(2));
                _subcategory = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(6));
                _imgFilterCondition = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_imgFilterCondition, new byte[] { 78 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 78 }, _imgFilterCondition, m_io, "/types/band_info/seq/2");
                }
                _imgFilterCode = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(3));
                _numLuts = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(1));
                if (Convert.ToInt64(NumLuts, 10) != 0) {
                    _numLutEntries = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(5));
                }
                _luts = new List<byte[]>();
                for (var i = 0; i < Convert.ToInt64(NumLuts, 10); i++)
                {
                    _luts.Add(m_io.ReadBytes(Convert.ToInt64(NumLutEntries, 10)));
                }
            }
            private string _representation;
            private string _subcategory;
            private byte[] _imgFilterCondition;
            private string _imgFilterCode;
            private string _numLuts;
            private string _numLutEntries;
            private List<byte[]> _luts;
            private Nitf m_root;
            private Nitf.ImageSubHeader m_parent;

            /// <summary>
            /// Indicates processing required to display the nth band of image w.r.t. the general image type recorded by IREP field
            /// </summary>
            public string Representation { get { return _representation; } }
            public string Subcategory { get { return _subcategory; } }
            public byte[] ImgFilterCondition { get { return _imgFilterCondition; } }

            /// <summary>
            /// Reserved
            /// </summary>
            public string ImgFilterCode { get { return _imgFilterCode; } }
            public string NumLuts { get { return _numLuts; } }

            /// <summary>
            /// Number of entries in each of the LUTs for the nth image band
            /// </summary>
            public string NumLutEntries { get { return _numLutEntries; } }
            public List<byte[]> Luts { get { return _luts; } }
            public Nitf M_Root { get { return m_root; } }
            public Nitf.ImageSubHeader M_Parent { get { return m_parent; } }
        }
        public partial class Clasnfo : KaitaiStruct
        {
            public static Clasnfo FromFile(string fileName)
            {
                return new Clasnfo(new KaitaiStream(fileName));
            }

            public Clasnfo(KaitaiStream p__io, KaitaiStruct p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _securityClass = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(1));
                _securitySystem = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(2));
                _codewords = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(11));
                _controlAndHandling = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(2));
                _releaseability = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(20));
                _declassType = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(2));
                _declassDate = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(8));
                _declassExemption = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                _downgrade = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(1));
                _downgradeDate = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(8));
                _classText = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(43));
                _classAuthorityType = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(1));
                _classAuthority = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(40));
                _classReason = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(1));
                _sourceDate = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(8));
                _controlNumber = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(15));
            }
            private string _securityClass;
            private string _securitySystem;
            private string _codewords;
            private string _controlAndHandling;
            private string _releaseability;
            private string _declassType;
            private string _declassDate;
            private string _declassExemption;
            private string _downgrade;
            private string _downgradeDate;
            private string _classText;
            private string _classAuthorityType;
            private string _classAuthority;
            private string _classReason;
            private string _sourceDate;
            private string _controlNumber;
            private Nitf m_root;
            private KaitaiStruct m_parent;
            public string SecurityClass { get { return _securityClass; } }
            public string SecuritySystem { get { return _securitySystem; } }
            public string Codewords { get { return _codewords; } }
            public string ControlAndHandling { get { return _controlAndHandling; } }
            public string Releaseability { get { return _releaseability; } }
            public string DeclassType { get { return _declassType; } }
            public string DeclassDate { get { return _declassDate; } }
            public string DeclassExemption { get { return _declassExemption; } }
            public string Downgrade { get { return _downgrade; } }
            public string DowngradeDate { get { return _downgradeDate; } }
            public string ClassText { get { return _classText; } }
            public string ClassAuthorityType { get { return _classAuthorityType; } }
            public string ClassAuthority { get { return _classAuthority; } }
            public string ClassReason { get { return _classReason; } }
            public string SourceDate { get { return _sourceDate; } }
            public string ControlNumber { get { return _controlNumber; } }
            public Nitf M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class DataExtensionSegment : KaitaiStruct
        {
            public DataExtensionSegment(ushort p_idx, KaitaiStream p__io, Nitf p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _idx = p_idx;
                _read();
            }
            private void _read()
            {
                __raw_dataSubHeader = m_io.ReadBytes(Convert.ToInt64(M_Parent.Header.Ldnfo[Idx].LengthDataExtensionSubheader, 10));
                var io___raw_dataSubHeader = new KaitaiStream(__raw_dataSubHeader);
                _dataSubHeader = new DataSubHeader(io___raw_dataSubHeader, this, m_root);
                _dataDataField = m_io.ReadBytes(Convert.ToInt64(M_Parent.Header.Ldnfo[Idx].LengthDataExtensionSegment, 10));
            }
            private DataSubHeader _dataSubHeader;
            private byte[] _dataDataField;
            private ushort _idx;
            private Nitf m_root;
            private Nitf m_parent;
            private byte[] __raw_dataSubHeader;
            public DataSubHeader DataSubHeader { get { return _dataSubHeader; } }
            public byte[] DataDataField { get { return _dataDataField; } }
            public ushort Idx { get { return _idx; } }
            public Nitf M_Root { get { return m_root; } }
            public Nitf M_Parent { get { return m_parent; } }
            public byte[] M_RawDataSubHeader { get { return __raw_dataSubHeader; } }
        }
        public partial class DataSubHeader : KaitaiStruct
        {
            public static DataSubHeader FromFile(string fileName)
            {
                return new DataSubHeader(new KaitaiStream(fileName));
            }

            public DataSubHeader(KaitaiStream p__io, Nitf.DataExtensionSegment p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_treOfl = false;
                _read();
            }
            private void _read()
            {
                _desBase = new DataSubHeaderBase(m_io, this, m_root);
                if (TreOfl) {
                    _overflowedHeaderType = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(6));
                }
                if (TreOfl) {
                    _dataItemOverflowed = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(3));
                }
                _desDefinedSubheaderFieldsLen = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                _desshf = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(Convert.ToInt64(DesDefinedSubheaderFieldsLen, 10)));
                _desDefinedDataField = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesFull());
            }
            private bool f_treOfl;
            private bool _treOfl;
            public bool TreOfl
            {
                get
                {
                    if (f_treOfl)
                        return _treOfl;
                    f_treOfl = true;
                    _treOfl = (bool) (DesBase.Desid == "TRE_OVERFLOW");
                    return _treOfl;
                }
            }
            private DataSubHeaderBase _desBase;
            private string _overflowedHeaderType;
            private string _dataItemOverflowed;
            private string _desDefinedSubheaderFieldsLen;
            private string _desshf;
            private string _desDefinedDataField;
            private Nitf m_root;
            private Nitf.DataExtensionSegment m_parent;
            public DataSubHeaderBase DesBase { get { return _desBase; } }
            public string OverflowedHeaderType { get { return _overflowedHeaderType; } }
            public string DataItemOverflowed { get { return _dataItemOverflowed; } }
            public string DesDefinedSubheaderFieldsLen { get { return _desDefinedSubheaderFieldsLen; } }
            public string Desshf { get { return _desshf; } }
            public string DesDefinedDataField { get { return _desDefinedDataField; } }
            public Nitf M_Root { get { return m_root; } }
            public Nitf.DataExtensionSegment M_Parent { get { return m_parent; } }
        }
        public partial class DataSubHeaderBase : KaitaiStruct
        {
            public static DataSubHeaderBase FromFile(string fileName)
            {
                return new DataSubHeaderBase(new KaitaiStream(fileName));
            }

            public DataSubHeaderBase(KaitaiStream p__io, KaitaiStruct p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _filePartTypeDe = m_io.ReadBytes(2);
                if (!((KaitaiStream.ByteArrayCompare(_filePartTypeDe, new byte[] { 68, 69 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 68, 69 }, _filePartTypeDe, m_io, "/types/data_sub_header_base/seq/0");
                }
                _desid = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(25));
                _dataDefinitionVersion = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(2));
                _declasnfo = new Clasnfo(m_io, this, m_root);
            }
            private byte[] _filePartTypeDe;
            private string _desid;
            private string _dataDefinitionVersion;
            private Clasnfo _declasnfo;
            private Nitf m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// File Part Type desigantor for Data Extension
            /// </summary>
            public byte[] FilePartTypeDe { get { return _filePartTypeDe; } }
            public string Desid { get { return _desid; } }
            public string DataDefinitionVersion { get { return _dataDefinitionVersion; } }
            public Clasnfo Declasnfo { get { return _declasnfo; } }
            public Nitf M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Streaming file Header Data Extension Segment Subheader
        /// </summary>
        public partial class DataSubHeaderStreaming : KaitaiStruct
        {
            public static DataSubHeaderStreaming FromFile(string fileName)
            {
                return new DataSubHeaderStreaming(new KaitaiStream(fileName));
            }

            public DataSubHeaderStreaming(KaitaiStream p__io, KaitaiStruct p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _desBase = new DataSubHeaderBase(m_io, this, m_root);
                _desDefinedSubheaderFieldsLen = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                _sfhL1 = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(7));
                _sfhDelim1 = m_io.ReadU4be();
                _sfhDr = new List<byte>();
                for (var i = 0; i < Convert.ToInt64(SfhL1, 10); i++)
                {
                    _sfhDr.Add(m_io.ReadU1());
                }
                _sfhDelim2 = m_io.ReadU4be();
                _sfhL2 = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(7));
            }
            private DataSubHeaderBase _desBase;
            private string _desDefinedSubheaderFieldsLen;
            private string _sfhL1;
            private uint _sfhDelim1;
            private List<byte> _sfhDr;
            private uint _sfhDelim2;
            private string _sfhL2;
            private Nitf m_root;
            private KaitaiStruct m_parent;
            public DataSubHeaderBase DesBase { get { return _desBase; } }
            public string DesDefinedSubheaderFieldsLen { get { return _desDefinedSubheaderFieldsLen; } }

            /// <summary>
            /// SFH Length 1: number of bytes in sfh_dr field
            /// </summary>
            public string SfhL1 { get { return _sfhL1; } }

            /// <summary>
            /// Shall contain the value 0x0A6E1D97.
            /// </summary>
            public uint SfhDelim1 { get { return _sfhDelim1; } }
            public List<byte> SfhDr { get { return _sfhDr; } }

            /// <summary>
            /// Shall contain the value 0x0ECA14BF.
            /// </summary>
            public uint SfhDelim2 { get { return _sfhDelim2; } }

            /// <summary>
            /// A repeat of sfh_l1.
            /// </summary>
            public string SfhL2 { get { return _sfhL2; } }
            public Nitf M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class DataSubHeaderTre : KaitaiStruct
        {
            public static DataSubHeaderTre FromFile(string fileName)
            {
                return new DataSubHeaderTre(new KaitaiStream(fileName));
            }

            public DataSubHeaderTre(KaitaiStream p__io, KaitaiStruct p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _desBase = new DataSubHeaderBase(m_io, this, m_root);
                if (DesBase.Desid == "TRE_OVERFLOW") {
                    _overflowedHeaderType = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(6));
                }
                if (DesBase.Desid == "TRE_OVERFLOW") {
                    _dataItemOverflowed = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(3));
                }
                _desDefinedSubheaderFieldsLen = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                _desDefinedDataField = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(Convert.ToInt64(DesDefinedSubheaderFieldsLen, 10)));
            }
            private DataSubHeaderBase _desBase;
            private string _overflowedHeaderType;
            private string _dataItemOverflowed;
            private string _desDefinedSubheaderFieldsLen;
            private string _desDefinedDataField;
            private Nitf m_root;
            private KaitaiStruct m_parent;
            public DataSubHeaderBase DesBase { get { return _desBase; } }
            public string OverflowedHeaderType { get { return _overflowedHeaderType; } }
            public string DataItemOverflowed { get { return _dataItemOverflowed; } }
            public string DesDefinedSubheaderFieldsLen { get { return _desDefinedSubheaderFieldsLen; } }
            public string DesDefinedDataField { get { return _desDefinedDataField; } }
            public Nitf M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class DateTime : KaitaiStruct
        {
            public static DateTime FromFile(string fileName)
            {
                return new DateTime(new KaitaiStream(fileName));
            }

            public DateTime(KaitaiStream p__io, KaitaiStruct p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                __unnamed0 = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(14));
            }
            private string __unnamed0;
            private Nitf m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// UTC time of image acquisition in the format CCYYMMDDhhmmss: CC century, YY last two digits of the year, MM month, DD day, hh hour, mm minute, ss second
            /// </summary>
            public string Unnamed_0 { get { return __unnamed0; } }
            public Nitf M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class Encrypt : KaitaiStruct
        {
            public static Encrypt FromFile(string fileName)
            {
                return new Encrypt(new KaitaiStream(fileName));
            }

            public Encrypt(KaitaiStream p__io, KaitaiStruct p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                __unnamed0 = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(1));
            }
            private string __unnamed0;
            private Nitf m_root;
            private KaitaiStruct m_parent;
            public string Unnamed_0 { get { return __unnamed0; } }
            public Nitf M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class GraphicSubHeader : KaitaiStruct
        {
            public static GraphicSubHeader FromFile(string fileName)
            {
                return new GraphicSubHeader(new KaitaiStream(fileName));
            }

            public GraphicSubHeader(KaitaiStream p__io, Nitf.GraphicsSegment p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _filePartTypeSy = m_io.ReadBytes(2);
                if (!((KaitaiStream.ByteArrayCompare(_filePartTypeSy, new byte[] { 83, 89 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 83, 89 }, _filePartTypeSy, m_io, "/types/graphic_sub_header/seq/0");
                }
                _graphicId = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(10));
                _graphicName = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(20));
                _graphicClassification = new Clasnfo(m_io, this, m_root);
                _encryption = new Encrypt(m_io, this, m_root);
                _graphicType = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_graphicType, new byte[] { 67 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 67 }, _graphicType, m_io, "/types/graphic_sub_header/seq/5");
                }
                _reserved1 = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(13));
                _graphicDisplayLevel = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(3));
                _graphicAttachmentLevel = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(3));
                _graphicLocation = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(10));
                _firstGraphicBoundLoc = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(10));
                _graphicColor = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(1));
                _secondGraphicBoundLoc = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(10));
                _reserved2 = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(2));
                _graphicsExtendedSubHeader = new TreHeader(m_io, this, m_root);
            }
            private byte[] _filePartTypeSy;
            private string _graphicId;
            private string _graphicName;
            private Clasnfo _graphicClassification;
            private Encrypt _encryption;
            private byte[] _graphicType;
            private string _reserved1;
            private string _graphicDisplayLevel;
            private string _graphicAttachmentLevel;
            private string _graphicLocation;
            private string _firstGraphicBoundLoc;
            private string _graphicColor;
            private string _secondGraphicBoundLoc;
            private string _reserved2;
            private TreHeader _graphicsExtendedSubHeader;
            private Nitf m_root;
            private Nitf.GraphicsSegment m_parent;
            public byte[] FilePartTypeSy { get { return _filePartTypeSy; } }
            public string GraphicId { get { return _graphicId; } }
            public string GraphicName { get { return _graphicName; } }
            public Clasnfo GraphicClassification { get { return _graphicClassification; } }
            public Encrypt Encryption { get { return _encryption; } }
            public byte[] GraphicType { get { return _graphicType; } }

            /// <summary>
            /// Reserved
            /// </summary>
            public string Reserved1 { get { return _reserved1; } }
            public string GraphicDisplayLevel { get { return _graphicDisplayLevel; } }
            public string GraphicAttachmentLevel { get { return _graphicAttachmentLevel; } }
            public string GraphicLocation { get { return _graphicLocation; } }
            public string FirstGraphicBoundLoc { get { return _firstGraphicBoundLoc; } }
            public string GraphicColor { get { return _graphicColor; } }
            public string SecondGraphicBoundLoc { get { return _secondGraphicBoundLoc; } }

            /// <summary>
            /// Reserved
            /// </summary>
            public string Reserved2 { get { return _reserved2; } }
            public TreHeader GraphicsExtendedSubHeader { get { return _graphicsExtendedSubHeader; } }
            public Nitf M_Root { get { return m_root; } }
            public Nitf.GraphicsSegment M_Parent { get { return m_parent; } }
        }
        public partial class GraphicsSegment : KaitaiStruct
        {
            public GraphicsSegment(ushort p_idx, KaitaiStream p__io, Nitf p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _idx = p_idx;
                _read();
            }
            private void _read()
            {
                _graphicSubHeader = new GraphicSubHeader(m_io, this, m_root);
                _graphicDataField = m_io.ReadBytes(Convert.ToInt64(M_Parent.Header.Lnnfo[Idx].LengthGraphicSegment, 10));
            }
            private GraphicSubHeader _graphicSubHeader;
            private byte[] _graphicDataField;
            private ushort _idx;
            private Nitf m_root;
            private Nitf m_parent;
            public GraphicSubHeader GraphicSubHeader { get { return _graphicSubHeader; } }
            public byte[] GraphicDataField { get { return _graphicDataField; } }
            public ushort Idx { get { return _idx; } }
            public Nitf M_Root { get { return m_root; } }
            public Nitf M_Parent { get { return m_parent; } }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, Nitf p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fileProfileName = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_fileProfileName, new byte[] { 78, 73, 84, 70 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 78, 73, 84, 70 }, _fileProfileName, m_io, "/types/header/seq/0");
                }
                _fileVersion = m_io.ReadBytes(5);
                if (!((KaitaiStream.ByteArrayCompare(_fileVersion, new byte[] { 48, 50, 46, 49, 48 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 48, 50, 46, 49, 48 }, _fileVersion, m_io, "/types/header/seq/1");
                }
                _complexityLevel = m_io.ReadBytes(2);
                _standardType = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_standardType, new byte[] { 66, 70, 48, 49 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 66, 70, 48, 49 }, _standardType, m_io, "/types/header/seq/3");
                }
                _originatingStationId = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(10));
                _fileDateTime = new DateTime(m_io, this, m_root);
                _fileTitle = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(80));
                _fileSecurity = new Clasnfo(m_io, this, m_root);
                _fileCopyNumber = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(5));
                _fileNumOfCopys = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(5));
                _encryption = new Encrypt(m_io, this, m_root);
                _fileBgColor = m_io.ReadBytes(3);
                _originatorName = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(24));
                _originatorPhone = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(18));
                _fileLength = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(12));
                _fileHeaderLength = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(6));
                _numImageSegments = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(3));
                _linfo = new List<LengthImageInfo>();
                for (var i = 0; i < Convert.ToInt64(NumImageSegments, 10); i++)
                {
                    _linfo.Add(new LengthImageInfo(m_io, this, m_root));
                }
                _numGraphicsSegments = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(3));
                _lnnfo = new List<LengthGraphicInfo>();
                for (var i = 0; i < Convert.ToInt64(NumGraphicsSegments, 10); i++)
                {
                    _lnnfo.Add(new LengthGraphicInfo(m_io, this, m_root));
                }
                _reservedNumx = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(3));
                _numTextFiles = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(3));
                _ltnfo = new List<LengthTextInfo>();
                for (var i = 0; i < Convert.ToInt64(NumTextFiles, 10); i++)
                {
                    _ltnfo.Add(new LengthTextInfo(m_io, this, m_root));
                }
                _numDataExtension = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(3));
                _ldnfo = new List<LengthDataInfo>();
                for (var i = 0; i < Convert.ToInt64(NumDataExtension, 10); i++)
                {
                    _ldnfo.Add(new LengthDataInfo(m_io, this, m_root));
                }
                _numReservedExtension = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(3));
                _lrnfo = new List<LengthReservedInfo>();
                for (var i = 0; i < Convert.ToInt64(NumReservedExtension, 10); i++)
                {
                    _lrnfo.Add(new LengthReservedInfo(m_io, this, m_root));
                }
                _userDefinedHeader = new TreHeader(m_io, this, m_root);
                _extendedHeader = new TreHeader(m_io, this, m_root);
            }
            private byte[] _fileProfileName;
            private byte[] _fileVersion;
            private byte[] _complexityLevel;
            private byte[] _standardType;
            private string _originatingStationId;
            private DateTime _fileDateTime;
            private string _fileTitle;
            private Clasnfo _fileSecurity;
            private string _fileCopyNumber;
            private string _fileNumOfCopys;
            private Encrypt _encryption;
            private byte[] _fileBgColor;
            private string _originatorName;
            private string _originatorPhone;
            private string _fileLength;
            private string _fileHeaderLength;
            private string _numImageSegments;
            private List<LengthImageInfo> _linfo;
            private string _numGraphicsSegments;
            private List<LengthGraphicInfo> _lnnfo;
            private string _reservedNumx;
            private string _numTextFiles;
            private List<LengthTextInfo> _ltnfo;
            private string _numDataExtension;
            private List<LengthDataInfo> _ldnfo;
            private string _numReservedExtension;
            private List<LengthReservedInfo> _lrnfo;
            private TreHeader _userDefinedHeader;
            private TreHeader _extendedHeader;
            private Nitf m_root;
            private Nitf m_parent;
            public byte[] FileProfileName { get { return _fileProfileName; } }
            public byte[] FileVersion { get { return _fileVersion; } }
            public byte[] ComplexityLevel { get { return _complexityLevel; } }

            /// <summary>
            /// Value of BF01 indicates the file is formatted using ISO/IEC IS 12087-5.
            /// </summary>
            public byte[] StandardType { get { return _standardType; } }
            public string OriginatingStationId { get { return _originatingStationId; } }
            public DateTime FileDateTime { get { return _fileDateTime; } }
            public string FileTitle { get { return _fileTitle; } }
            public Clasnfo FileSecurity { get { return _fileSecurity; } }
            public string FileCopyNumber { get { return _fileCopyNumber; } }
            public string FileNumOfCopys { get { return _fileNumOfCopys; } }
            public Encrypt Encryption { get { return _encryption; } }
            public byte[] FileBgColor { get { return _fileBgColor; } }
            public string OriginatorName { get { return _originatorName; } }
            public string OriginatorPhone { get { return _originatorPhone; } }
            public string FileLength { get { return _fileLength; } }
            public string FileHeaderLength { get { return _fileHeaderLength; } }
            public string NumImageSegments { get { return _numImageSegments; } }
            public List<LengthImageInfo> Linfo { get { return _linfo; } }
            public string NumGraphicsSegments { get { return _numGraphicsSegments; } }
            public List<LengthGraphicInfo> Lnnfo { get { return _lnnfo; } }
            public string ReservedNumx { get { return _reservedNumx; } }
            public string NumTextFiles { get { return _numTextFiles; } }
            public List<LengthTextInfo> Ltnfo { get { return _ltnfo; } }
            public string NumDataExtension { get { return _numDataExtension; } }
            public List<LengthDataInfo> Ldnfo { get { return _ldnfo; } }
            public string NumReservedExtension { get { return _numReservedExtension; } }
            public List<LengthReservedInfo> Lrnfo { get { return _lrnfo; } }
            public TreHeader UserDefinedHeader { get { return _userDefinedHeader; } }
            public TreHeader ExtendedHeader { get { return _extendedHeader; } }
            public Nitf M_Root { get { return m_root; } }
            public Nitf M_Parent { get { return m_parent; } }
        }
        public partial class ImageComment : KaitaiStruct
        {
            public static ImageComment FromFile(string fileName)
            {
                return new ImageComment(new KaitaiStream(fileName));
            }

            public ImageComment(KaitaiStream p__io, Nitf.ImageSubHeader p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                __unnamed0 = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(80));
            }
            private string __unnamed0;
            private Nitf m_root;
            private Nitf.ImageSubHeader m_parent;
            public string Unnamed_0 { get { return __unnamed0; } }
            public Nitf M_Root { get { return m_root; } }
            public Nitf.ImageSubHeader M_Parent { get { return m_parent; } }
        }
        public partial class ImageDataMask : KaitaiStruct
        {
            public static ImageDataMask FromFile(string fileName)
            {
                return new ImageDataMask(new KaitaiStream(fileName));
            }

            public ImageDataMask(KaitaiStream p__io, Nitf.ImageSegment p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_bmrbndSize = false;
                f_bmrtmrCount = false;
                f_hasBmr = false;
                f_hasTmr = false;
                f_tmrbndSize = false;
                f_totalSize = false;
                f_tpxcdSize = false;
                _read();
            }
            private void _read()
            {
                _blockedImgDataOffset = m_io.ReadU4be();
                _bmrlnth = m_io.ReadU2be();
                _tmrlnth = m_io.ReadU2be();
                _tpxcdlnth = m_io.ReadU2be();
                _tpxcd = m_io.ReadBytes(TpxcdSize);
                if (HasBmr) {
                    _bmrbnd = new List<uint>();
                    for (var i = 0; i < BmrtmrCount; i++)
                    {
                        _bmrbnd.Add(m_io.ReadU4be());
                    }
                }
                if (HasTmr) {
                    _tmrbnd = new List<uint>();
                    for (var i = 0; i < BmrtmrCount; i++)
                    {
                        _tmrbnd.Add(m_io.ReadU4be());
                    }
                }
            }
            private bool f_bmrbndSize;
            private int _bmrbndSize;
            public int BmrbndSize
            {
                get
                {
                    if (f_bmrbndSize)
                        return _bmrbndSize;
                    f_bmrbndSize = true;
                    _bmrbndSize = (int) ((HasBmr ? BmrtmrCount * 4 : 0));
                    return _bmrbndSize;
                }
            }
            private bool f_bmrtmrCount;
            private int _bmrtmrCount;
            public int BmrtmrCount
            {
                get
                {
                    if (f_bmrtmrCount)
                        return _bmrtmrCount;
                    f_bmrtmrCount = true;
                    _bmrtmrCount = (int) ((Convert.ToInt64(M_Parent.ImageSubHeader.NumBlocksPerRow, 10) * Convert.ToInt64(M_Parent.ImageSubHeader.NumBlocksPerCol, 10)) * (M_Parent.ImageSubHeader.ImgMode != "S" ? 1 : (Convert.ToInt64(M_Parent.ImageSubHeader.NumBands, 10) != 0 ? Convert.ToInt64(M_Parent.ImageSubHeader.NumBands, 10) : Convert.ToInt64(M_Parent.ImageSubHeader.NumMultispectralBands, 10))));
                    return _bmrtmrCount;
                }
            }
            private bool f_hasBmr;
            private bool _hasBmr;
            public bool HasBmr
            {
                get
                {
                    if (f_hasBmr)
                        return _hasBmr;
                    f_hasBmr = true;
                    _hasBmr = (bool) (Bmrlnth != 0);
                    return _hasBmr;
                }
            }
            private bool f_hasTmr;
            private bool _hasTmr;
            public bool HasTmr
            {
                get
                {
                    if (f_hasTmr)
                        return _hasTmr;
                    f_hasTmr = true;
                    _hasTmr = (bool) (Tmrlnth != 0);
                    return _hasTmr;
                }
            }
            private bool f_tmrbndSize;
            private int _tmrbndSize;
            public int TmrbndSize
            {
                get
                {
                    if (f_tmrbndSize)
                        return _tmrbndSize;
                    f_tmrbndSize = true;
                    _tmrbndSize = (int) ((HasTmr ? BmrtmrCount * 4 : 0));
                    return _tmrbndSize;
                }
            }
            private bool f_totalSize;
            private int _totalSize;
            public int TotalSize
            {
                get
                {
                    if (f_totalSize)
                        return _totalSize;
                    f_totalSize = true;
                    _totalSize = (int) ((((((4 + 2) + 2) + 2) + TpxcdSize) + BmrbndSize) + TmrbndSize);
                    return _totalSize;
                }
            }
            private bool f_tpxcdSize;
            private int _tpxcdSize;
            public int TpxcdSize
            {
                get
                {
                    if (f_tpxcdSize)
                        return _tpxcdSize;
                    f_tpxcdSize = true;
                    _tpxcdSize = (int) ((KaitaiStream.Mod(Tpxcdlnth, 8) == 0 ? Tpxcdlnth : Tpxcdlnth + (8 - KaitaiStream.Mod(Tpxcdlnth, 8))) / 8);
                    return _tpxcdSize;
                }
            }
            private uint _blockedImgDataOffset;
            private ushort _bmrlnth;
            private ushort _tmrlnth;
            private ushort _tpxcdlnth;
            private byte[] _tpxcd;
            private List<uint> _bmrbnd;
            private List<uint> _tmrbnd;
            private Nitf m_root;
            private Nitf.ImageSegment m_parent;
            public uint BlockedImgDataOffset { get { return _blockedImgDataOffset; } }

            /// <summary>
            /// Block Mask Record Length
            /// </summary>
            public ushort Bmrlnth { get { return _bmrlnth; } }

            /// <summary>
            /// Pad Pixel Mask Record Length
            /// </summary>
            public ushort Tmrlnth { get { return _tmrlnth; } }

            /// <summary>
            /// Pad Output Pixel Code Length
            /// </summary>
            public ushort Tpxcdlnth { get { return _tpxcdlnth; } }

            /// <summary>
            /// Pad Output Pixel Code
            /// </summary>
            public byte[] Tpxcd { get { return _tpxcd; } }

            /// <summary>
            /// Block n, Band m Offset
            /// </summary>
            public List<uint> Bmrbnd { get { return _bmrbnd; } }

            /// <summary>
            /// Pad Pixel n, Band m
            /// </summary>
            public List<uint> Tmrbnd { get { return _tmrbnd; } }
            public Nitf M_Root { get { return m_root; } }
            public Nitf.ImageSegment M_Parent { get { return m_parent; } }
        }
        public partial class ImageSegment : KaitaiStruct
        {
            public ImageSegment(ushort p_idx, KaitaiStream p__io, Nitf p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _idx = p_idx;
                f_hasMask = false;
                _read();
            }
            private void _read()
            {
                _imageSubHeader = new ImageSubHeader(m_io, this, m_root);
                if (HasMask) {
                    _imageDataMask = new ImageDataMask(m_io, this, m_root);
                }
                if (HasMask) {
                    _imageDataField = m_io.ReadBytes(Convert.ToInt64(M_Parent.Header.Linfo[Idx].LengthImageSegment, 10) - ImageDataMask.TotalSize);
                }
            }
            private bool f_hasMask;
            private bool _hasMask;
            public bool HasMask
            {
                get
                {
                    if (f_hasMask)
                        return _hasMask;
                    f_hasMask = true;
                    _hasMask = (bool) (ImageSubHeader.ImgCompression.Substring(0, 2 - 0) == "MM");
                    return _hasMask;
                }
            }
            private ImageSubHeader _imageSubHeader;
            private ImageDataMask _imageDataMask;
            private byte[] _imageDataField;
            private ushort _idx;
            private Nitf m_root;
            private Nitf m_parent;
            public ImageSubHeader ImageSubHeader { get { return _imageSubHeader; } }
            public ImageDataMask ImageDataMask { get { return _imageDataMask; } }
            public byte[] ImageDataField { get { return _imageDataField; } }
            public ushort Idx { get { return _idx; } }
            public Nitf M_Root { get { return m_root; } }
            public Nitf M_Parent { get { return m_parent; } }
        }
        public partial class ImageSubHeader : KaitaiStruct
        {
            public static ImageSubHeader FromFile(string fileName)
            {
                return new ImageSubHeader(new KaitaiStream(fileName));
            }

            public ImageSubHeader(KaitaiStream p__io, Nitf.ImageSegment p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _filePartType = m_io.ReadBytes(2);
                if (!((KaitaiStream.ByteArrayCompare(_filePartType, new byte[] { 73, 77 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 73, 77 }, _filePartType, m_io, "/types/image_sub_header/seq/0");
                }
                _imageId1 = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(10));
                _imageDateTime = new DateTime(m_io, this, m_root);
                _targetId = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(17));
                _imageId2 = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(80));
                _imageSecurityClassification = new Clasnfo(m_io, this, m_root);
                _encryption = new Encrypt(m_io, this, m_root);
                _imageSource = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(42));
                _numSigRows = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(8));
                _numSigCols = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(8));
                _pixelValueType = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(3));
                _imageRepresentation = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(8));
                _imageCategory = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(8));
                _actualBitsPerPixelPerBand = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(2));
                _pixelJustification = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(1));
                _imageCoordinateRep = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(1));
                _imageGeoLoc = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(60));
                _numImgComments = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(1));
                _imgComments = new List<ImageComment>();
                for (var i = 0; i < Convert.ToInt64(NumImgComments, 10); i++)
                {
                    _imgComments.Add(new ImageComment(m_io, this, m_root));
                }
                _imgCompression = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(2));
                _compressionRateCode = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                _numBands = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(1));
                if (Convert.ToInt64(NumBands, 10) == 0) {
                    _numMultispectralBands = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(5));
                }
                _bands = new List<BandInfo>();
                for (var i = 0; i < (Convert.ToInt64(NumBands, 10) != 0 ? Convert.ToInt64(NumBands, 10) : Convert.ToInt64(NumMultispectralBands, 10)); i++)
                {
                    _bands.Add(new BandInfo(m_io, this, m_root));
                }
                _imgSyncCode = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(1));
                _imgMode = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(1));
                _numBlocksPerRow = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                _numBlocksPerCol = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                _numPixelsPerBlockHorz = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                _numPixelsPerBlockVert = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                _numPixelsPerBand = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(2));
                _imgDisplayLevel = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(3));
                _attachmentLevel = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(3));
                _imgLocation = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(10));
                _imgMagnification = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                _userDefImgDataLen = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(5));
                if (Convert.ToInt64(UserDefImgDataLen, 10) != 0) {
                    _userDefOverflow = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(3));
                }
                if (Convert.ToInt64(UserDefImgDataLen, 10) > 2) {
                    _userDefImgData = new List<byte>();
                    for (var i = 0; i < Convert.ToInt64(UserDefImgDataLen, 10) - 3; i++)
                    {
                        _userDefImgData.Add(m_io.ReadU1());
                    }
                }
                _imageExtendedSubHeader = new TreHeader(m_io, this, m_root);
            }
            private byte[] _filePartType;
            private string _imageId1;
            private DateTime _imageDateTime;
            private string _targetId;
            private string _imageId2;
            private Clasnfo _imageSecurityClassification;
            private Encrypt _encryption;
            private string _imageSource;
            private string _numSigRows;
            private string _numSigCols;
            private string _pixelValueType;
            private string _imageRepresentation;
            private string _imageCategory;
            private string _actualBitsPerPixelPerBand;
            private string _pixelJustification;
            private string _imageCoordinateRep;
            private string _imageGeoLoc;
            private string _numImgComments;
            private List<ImageComment> _imgComments;
            private string _imgCompression;
            private string _compressionRateCode;
            private string _numBands;
            private string _numMultispectralBands;
            private List<BandInfo> _bands;
            private string _imgSyncCode;
            private string _imgMode;
            private string _numBlocksPerRow;
            private string _numBlocksPerCol;
            private string _numPixelsPerBlockHorz;
            private string _numPixelsPerBlockVert;
            private string _numPixelsPerBand;
            private string _imgDisplayLevel;
            private string _attachmentLevel;
            private string _imgLocation;
            private string _imgMagnification;
            private string _userDefImgDataLen;
            private string _userDefOverflow;
            private List<byte> _userDefImgData;
            private TreHeader _imageExtendedSubHeader;
            private Nitf m_root;
            private Nitf.ImageSegment m_parent;
            public byte[] FilePartType { get { return _filePartType; } }
            public string ImageId1 { get { return _imageId1; } }
            public DateTime ImageDateTime { get { return _imageDateTime; } }
            public string TargetId { get { return _targetId; } }
            public string ImageId2 { get { return _imageId2; } }
            public Clasnfo ImageSecurityClassification { get { return _imageSecurityClassification; } }
            public Encrypt Encryption { get { return _encryption; } }
            public string ImageSource { get { return _imageSource; } }

            /// <summary>
            /// Total number of rows of significant pixels in the image; only rows indexed 0 to (NROWS - 1) of the image contain significant data.
            /// </summary>
            public string NumSigRows { get { return _numSigRows; } }
            public string NumSigCols { get { return _numSigCols; } }
            public string PixelValueType { get { return _pixelValueType; } }

            /// <summary>
            /// MONO, RGB, RGB/LUT, MULTI, NODISPLY, NVECTOR, POLAR, VPH, YCbCr601
            /// </summary>
            public string ImageRepresentation { get { return _imageRepresentation; } }

            /// <summary>
            /// VIS, SL, TI, FL, RD, EO, OP, HR, HS,CP, BP, SAR, SARIQ, IR, MAP, MS, FP, MRI, XRAY, CAT, VD, PAT, LEG, DTEM, MATR, LOCG, BARO, CURRENT, DEPTH, WIND
            /// </summary>
            public string ImageCategory { get { return _imageCategory; } }
            public string ActualBitsPerPixelPerBand { get { return _actualBitsPerPixelPerBand; } }
            public string PixelJustification { get { return _pixelJustification; } }
            public string ImageCoordinateRep { get { return _imageCoordinateRep; } }
            public string ImageGeoLoc { get { return _imageGeoLoc; } }
            public string NumImgComments { get { return _numImgComments; } }
            public List<ImageComment> ImgComments { get { return _imgComments; } }
            public string ImgCompression { get { return _imgCompression; } }
            public string CompressionRateCode { get { return _compressionRateCode; } }
            public string NumBands { get { return _numBands; } }
            public string NumMultispectralBands { get { return _numMultispectralBands; } }
            public List<BandInfo> Bands { get { return _bands; } }

            /// <summary>
            /// Reserved for future use.
            /// </summary>
            public string ImgSyncCode { get { return _imgSyncCode; } }

            /// <summary>
            /// B = Band Interleaved by Block, P = Band Interleaved by Pixel, R = Band Interleaved by Row, S = Band Sequential
            /// </summary>
            public string ImgMode { get { return _imgMode; } }
            public string NumBlocksPerRow { get { return _numBlocksPerRow; } }
            public string NumBlocksPerCol { get { return _numBlocksPerCol; } }
            public string NumPixelsPerBlockHorz { get { return _numPixelsPerBlockHorz; } }
            public string NumPixelsPerBlockVert { get { return _numPixelsPerBlockVert; } }
            public string NumPixelsPerBand { get { return _numPixelsPerBand; } }
            public string ImgDisplayLevel { get { return _imgDisplayLevel; } }
            public string AttachmentLevel { get { return _attachmentLevel; } }
            public string ImgLocation { get { return _imgLocation; } }
            public string ImgMagnification { get { return _imgMagnification; } }
            public string UserDefImgDataLen { get { return _userDefImgDataLen; } }
            public string UserDefOverflow { get { return _userDefOverflow; } }
            public List<byte> UserDefImgData { get { return _userDefImgData; } }
            public TreHeader ImageExtendedSubHeader { get { return _imageExtendedSubHeader; } }
            public Nitf M_Root { get { return m_root; } }
            public Nitf.ImageSegment M_Parent { get { return m_parent; } }
        }
        public partial class LengthDataInfo : KaitaiStruct
        {
            public static LengthDataInfo FromFile(string fileName)
            {
                return new LengthDataInfo(new KaitaiStream(fileName));
            }

            public LengthDataInfo(KaitaiStream p__io, Nitf.Header p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lengthDataExtensionSubheader = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                _lengthDataExtensionSegment = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(9));
            }
            private string _lengthDataExtensionSubheader;
            private string _lengthDataExtensionSegment;
            private Nitf m_root;
            private Nitf.Header m_parent;
            public string LengthDataExtensionSubheader { get { return _lengthDataExtensionSubheader; } }
            public string LengthDataExtensionSegment { get { return _lengthDataExtensionSegment; } }
            public Nitf M_Root { get { return m_root; } }
            public Nitf.Header M_Parent { get { return m_parent; } }
        }
        public partial class LengthGraphicInfo : KaitaiStruct
        {
            public static LengthGraphicInfo FromFile(string fileName)
            {
                return new LengthGraphicInfo(new KaitaiStream(fileName));
            }

            public LengthGraphicInfo(KaitaiStream p__io, Nitf.Header p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lengthGraphicSubheader = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                _lengthGraphicSegment = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(6));
            }
            private string _lengthGraphicSubheader;
            private string _lengthGraphicSegment;
            private Nitf m_root;
            private Nitf.Header m_parent;
            public string LengthGraphicSubheader { get { return _lengthGraphicSubheader; } }
            public string LengthGraphicSegment { get { return _lengthGraphicSegment; } }
            public Nitf M_Root { get { return m_root; } }
            public Nitf.Header M_Parent { get { return m_parent; } }
        }
        public partial class LengthImageInfo : KaitaiStruct
        {
            public static LengthImageInfo FromFile(string fileName)
            {
                return new LengthImageInfo(new KaitaiStream(fileName));
            }

            public LengthImageInfo(KaitaiStream p__io, Nitf.Header p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lengthImageSubheader = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(6));
                _lengthImageSegment = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(10));
            }
            private string _lengthImageSubheader;
            private string _lengthImageSegment;
            private Nitf m_root;
            private Nitf.Header m_parent;
            public string LengthImageSubheader { get { return _lengthImageSubheader; } }
            public string LengthImageSegment { get { return _lengthImageSegment; } }
            public Nitf M_Root { get { return m_root; } }
            public Nitf.Header M_Parent { get { return m_parent; } }
        }
        public partial class LengthReservedInfo : KaitaiStruct
        {
            public static LengthReservedInfo FromFile(string fileName)
            {
                return new LengthReservedInfo(new KaitaiStream(fileName));
            }

            public LengthReservedInfo(KaitaiStream p__io, Nitf.Header p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lengthReservedExtensionSubheader = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                _lengthReservedExtensionSegment = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(7));
            }
            private string _lengthReservedExtensionSubheader;
            private string _lengthReservedExtensionSegment;
            private Nitf m_root;
            private Nitf.Header m_parent;
            public string LengthReservedExtensionSubheader { get { return _lengthReservedExtensionSubheader; } }
            public string LengthReservedExtensionSegment { get { return _lengthReservedExtensionSegment; } }
            public Nitf M_Root { get { return m_root; } }
            public Nitf.Header M_Parent { get { return m_parent; } }
        }
        public partial class LengthTextInfo : KaitaiStruct
        {
            public static LengthTextInfo FromFile(string fileName)
            {
                return new LengthTextInfo(new KaitaiStream(fileName));
            }

            public LengthTextInfo(KaitaiStream p__io, Nitf.Header p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lengthTextSubheader = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                _lengthTextSegment = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(5));
            }
            private string _lengthTextSubheader;
            private string _lengthTextSegment;
            private Nitf m_root;
            private Nitf.Header m_parent;
            public string LengthTextSubheader { get { return _lengthTextSubheader; } }
            public string LengthTextSegment { get { return _lengthTextSegment; } }
            public Nitf M_Root { get { return m_root; } }
            public Nitf.Header M_Parent { get { return m_parent; } }
        }
        public partial class ReservedExtensionSegment : KaitaiStruct
        {
            public ReservedExtensionSegment(ushort p_idx, KaitaiStream p__io, Nitf p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _idx = p_idx;
                _read();
            }
            private void _read()
            {
                __raw_reservedSubHeader = m_io.ReadBytes(Convert.ToInt64(M_Parent.Header.Lrnfo[Idx].LengthReservedExtensionSubheader, 10));
                var io___raw_reservedSubHeader = new KaitaiStream(__raw_reservedSubHeader);
                _reservedSubHeader = new ReservedSubHeader(io___raw_reservedSubHeader, this, m_root);
                _reservedDataField = m_io.ReadBytes(Convert.ToInt64(M_Parent.Header.Lrnfo[Idx].LengthReservedExtensionSegment, 10));
            }
            private ReservedSubHeader _reservedSubHeader;
            private byte[] _reservedDataField;
            private ushort _idx;
            private Nitf m_root;
            private Nitf m_parent;
            private byte[] __raw_reservedSubHeader;
            public ReservedSubHeader ReservedSubHeader { get { return _reservedSubHeader; } }
            public byte[] ReservedDataField { get { return _reservedDataField; } }
            public ushort Idx { get { return _idx; } }
            public Nitf M_Root { get { return m_root; } }
            public Nitf M_Parent { get { return m_parent; } }
            public byte[] M_RawReservedSubHeader { get { return __raw_reservedSubHeader; } }
        }
        public partial class ReservedSubHeader : KaitaiStruct
        {
            public static ReservedSubHeader FromFile(string fileName)
            {
                return new ReservedSubHeader(new KaitaiStream(fileName));
            }

            public ReservedSubHeader(KaitaiStream p__io, Nitf.ReservedExtensionSegment p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _filePartTypeRe = m_io.ReadBytes(2);
                if (!((KaitaiStream.ByteArrayCompare(_filePartTypeRe, new byte[] { 82, 69 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 82, 69 }, _filePartTypeRe, m_io, "/types/reserved_sub_header/seq/0");
                }
                _resTypeId = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(25));
                _resVersion = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(2));
                _reclasnfo = new Clasnfo(m_io, this, m_root);
                _resUserDefinedSubheaderLength = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                _resUserDefinedSubheaderFields = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(Convert.ToInt64(ResUserDefinedSubheaderLength, 10)));
                _resUserDefinedData = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesFull());
            }
            private byte[] _filePartTypeRe;
            private string _resTypeId;
            private string _resVersion;
            private Clasnfo _reclasnfo;
            private string _resUserDefinedSubheaderLength;
            private string _resUserDefinedSubheaderFields;
            private string _resUserDefinedData;
            private Nitf m_root;
            private Nitf.ReservedExtensionSegment m_parent;
            public byte[] FilePartTypeRe { get { return _filePartTypeRe; } }
            public string ResTypeId { get { return _resTypeId; } }
            public string ResVersion { get { return _resVersion; } }
            public Clasnfo Reclasnfo { get { return _reclasnfo; } }
            public string ResUserDefinedSubheaderLength { get { return _resUserDefinedSubheaderLength; } }
            public string ResUserDefinedSubheaderFields { get { return _resUserDefinedSubheaderFields; } }
            public string ResUserDefinedData { get { return _resUserDefinedData; } }
            public Nitf M_Root { get { return m_root; } }
            public Nitf.ReservedExtensionSegment M_Parent { get { return m_parent; } }
        }
        public partial class TextSegment : KaitaiStruct
        {
            public TextSegment(ushort p_idx, KaitaiStream p__io, Nitf p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _idx = p_idx;
                _read();
            }
            private void _read()
            {
                _textSubHeader = m_io.ReadBytes(1);
                _textDataField = m_io.ReadBytes(Convert.ToInt64(M_Parent.Header.Ltnfo[Idx].LengthTextSegment, 10));
            }
            private byte[] _textSubHeader;
            private byte[] _textDataField;
            private ushort _idx;
            private Nitf m_root;
            private Nitf m_parent;
            public byte[] TextSubHeader { get { return _textSubHeader; } }
            public byte[] TextDataField { get { return _textDataField; } }
            public ushort Idx { get { return _idx; } }
            public Nitf M_Root { get { return m_root; } }
            public Nitf M_Parent { get { return m_parent; } }
        }
        public partial class TextSubHeader : KaitaiStruct
        {
            public static TextSubHeader FromFile(string fileName)
            {
                return new TextSubHeader(new KaitaiStream(fileName));
            }

            public TextSubHeader(KaitaiStream p__io, KaitaiStruct p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _textDateTime = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(14));
                _textTitle = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(80));
                _textSecurityClass = new Clasnfo(m_io, this, m_root);
                _encryp = new Encrypt(m_io, this, m_root);
                _textFormat = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(3));
                _textExtendedSubHeader = new TreHeader(m_io, this, m_root);
            }
            private string _textDateTime;
            private string _textTitle;
            private Clasnfo _textSecurityClass;
            private Encrypt _encryp;
            private string _textFormat;
            private TreHeader _textExtendedSubHeader;
            private Nitf m_root;
            private KaitaiStruct m_parent;
            public string TextDateTime { get { return _textDateTime; } }
            public string TextTitle { get { return _textTitle; } }
            public Clasnfo TextSecurityClass { get { return _textSecurityClass; } }
            public Encrypt Encryp { get { return _encryp; } }

            /// <summary>
            /// MTF (USMTF see MIL-STD-6040), STA (indicates BCS), UT1 (indicates ECS), U8S
            /// </summary>
            public string TextFormat { get { return _textFormat; } }
            public TreHeader TextExtendedSubHeader { get { return _textExtendedSubHeader; } }
            public Nitf M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class Tre : KaitaiStruct
        {
            public static Tre FromFile(string fileName)
            {
                return new Tre(new KaitaiStream(fileName));
            }

            public Tre(KaitaiStream p__io, KaitaiStruct p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _extensionTypeId = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(6));
                _edataLength = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(5));
                _edata = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(Convert.ToInt64(EdataLength, 10)));
            }
            private string _extensionTypeId;
            private string _edataLength;
            private string _edata;
            private Nitf m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// RETAG or CETAG
            /// </summary>
            public string ExtensionTypeId { get { return _extensionTypeId; } }

            /// <summary>
            /// REL or CEL
            /// </summary>
            public string EdataLength { get { return _edataLength; } }

            /// <summary>
            /// REDATA or CEDATA
            /// </summary>
            public string Edata { get { return _edata; } }
            public Nitf M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class TreHeader : KaitaiStruct
        {
            public static TreHeader FromFile(string fileName)
            {
                return new TreHeader(new KaitaiStream(fileName));
            }

            public TreHeader(KaitaiStream p__io, KaitaiStruct p__parent = null, Nitf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _headerDataLength = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(5));
                if (Convert.ToInt64(HeaderDataLength, 10) != 0) {
                    _headerOverflow = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(3));
                }
                if (Convert.ToInt64(HeaderDataLength, 10) > 2) {
                    _headerData = new List<byte>();
                    for (var i = 0; i < Convert.ToInt64(HeaderDataLength, 10) - 3; i++)
                    {
                        _headerData.Add(m_io.ReadU1());
                    }
                }
            }
            private string _headerDataLength;
            private string _headerOverflow;
            private List<byte> _headerData;
            private Nitf m_root;
            private KaitaiStruct m_parent;
            public string HeaderDataLength { get { return _headerDataLength; } }
            public string HeaderOverflow { get { return _headerOverflow; } }
            public List<byte> HeaderData { get { return _headerData; } }
            public Nitf M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        private Header _header;
        private List<ImageSegment> _imageSegments;
        private List<GraphicsSegment> _graphicsSegments;
        private List<TextSegment> _textSegments;
        private List<DataExtensionSegment> _dataExtensionSegments;
        private List<ReservedExtensionSegment> _reservedExtensionSegments;
        private Nitf m_root;
        private KaitaiStruct m_parent;
        public Header Header { get { return _header; } }
        public List<ImageSegment> ImageSegments { get { return _imageSegments; } }
        public List<GraphicsSegment> GraphicsSegments { get { return _graphicsSegments; } }
        public List<TextSegment> TextSegments { get { return _textSegments; } }
        public List<DataExtensionSegment> DataExtensionSegments { get { return _dataExtensionSegments; } }
        public List<ReservedExtensionSegment> ReservedExtensionSegments { get { return _reservedExtensionSegments; } }
        public Nitf M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
