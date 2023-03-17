// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// ISO9660 is standard filesystem used on read-only optical discs
    /// (mostly CD-ROM). The standard was based on earlier High Sierra
    /// Format (HSF), proposed for CD-ROMs in 1985, and, after several
    /// revisions, it was accepted as ISO9960:1998.
    /// 
    /// The format emphasizes portability (thus having pretty minimal
    /// features and very conservative file names standards) and sequential
    /// access (which favors disc devices with relatively slow rotation
    /// speed).
    /// </summary>
    public partial class Iso9660 : KaitaiStruct
    {
        public static Iso9660 FromFile(string fileName)
        {
            return new Iso9660(new KaitaiStream(fileName));
        }

        public Iso9660(KaitaiStream p__io, KaitaiStruct p__parent = null, Iso9660 p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_sectorSize = false;
            f_primaryVolDesc = false;
            _read();
        }
        private void _read()
        {
        }

        /// <remarks>
        /// Reference: <a href="https://wiki.osdev.org/ISO_9660#The_Primary_Volume_Descriptor">Source</a>
        /// </remarks>
        public partial class VolDescPrimary : KaitaiStruct
        {
            public static VolDescPrimary FromFile(string fileName)
            {
                return new VolDescPrimary(new KaitaiStream(fileName));
            }

            public VolDescPrimary(KaitaiStream p__io, Iso9660.VolDesc p__parent = null, Iso9660 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_pathTable = false;
                _read();
            }
            private void _read()
            {
                _unused1 = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(Unused1, new byte[] { 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0 }, Unused1, M_Io, "/types/vol_desc_primary/seq/0");
                }
                _systemId = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(32));
                _volumeId = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(32));
                _unused2 = m_io.ReadBytes(8);
                if (!((KaitaiStream.ByteArrayCompare(Unused2, new byte[] { 0, 0, 0, 0, 0, 0, 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0, 0, 0 }, Unused2, M_Io, "/types/vol_desc_primary/seq/3");
                }
                _volSpaceSize = new U4bi(m_io, this, m_root);
                _unused3 = m_io.ReadBytes(32);
                if (!((KaitaiStream.ByteArrayCompare(Unused3, new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, Unused3, M_Io, "/types/vol_desc_primary/seq/5");
                }
                _volSetSize = new U2bi(m_io, this, m_root);
                _volSeqNum = new U2bi(m_io, this, m_root);
                _logicalBlockSize = new U2bi(m_io, this, m_root);
                _pathTableSize = new U4bi(m_io, this, m_root);
                _lbaPathTableLe = m_io.ReadU4le();
                _lbaOptPathTableLe = m_io.ReadU4le();
                _lbaPathTableBe = m_io.ReadU4be();
                _lbaOptPathTableBe = m_io.ReadU4be();
                __raw_rootDir = m_io.ReadBytes(34);
                var io___raw_rootDir = new KaitaiStream(__raw_rootDir);
                _rootDir = new DirEntry(io___raw_rootDir, this, m_root);
                _volSetId = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(128));
                _publisherId = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(128));
                _dataPreparerId = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(128));
                _applicationId = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(128));
                _copyrightFileId = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(38));
                _abstractFileId = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(36));
                _bibliographicFileId = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(37));
                _volCreateDatetime = new DecDatetime(m_io, this, m_root);
                _volModDatetime = new DecDatetime(m_io, this, m_root);
                _volExpireDatetime = new DecDatetime(m_io, this, m_root);
                _volEffectiveDatetime = new DecDatetime(m_io, this, m_root);
                _fileStructureVersion = m_io.ReadU1();
                _unused4 = m_io.ReadU1();
                _applicationArea = m_io.ReadBytes(512);
            }
            private bool f_pathTable;
            private PathTableLe _pathTable;
            public PathTableLe PathTable
            {
                get
                {
                    if (f_pathTable)
                        return _pathTable;
                    long _pos = m_io.Pos;
                    m_io.Seek((LbaPathTableLe * M_Root.SectorSize));
                    __raw_pathTable = m_io.ReadBytes(PathTableSize.Le);
                    var io___raw_pathTable = new KaitaiStream(__raw_pathTable);
                    _pathTable = new PathTableLe(io___raw_pathTable, this, m_root);
                    m_io.Seek(_pos);
                    f_pathTable = true;
                    return _pathTable;
                }
            }
            private byte[] _unused1;
            private string _systemId;
            private string _volumeId;
            private byte[] _unused2;
            private U4bi _volSpaceSize;
            private byte[] _unused3;
            private U2bi _volSetSize;
            private U2bi _volSeqNum;
            private U2bi _logicalBlockSize;
            private U4bi _pathTableSize;
            private uint _lbaPathTableLe;
            private uint _lbaOptPathTableLe;
            private uint _lbaPathTableBe;
            private uint _lbaOptPathTableBe;
            private DirEntry _rootDir;
            private string _volSetId;
            private string _publisherId;
            private string _dataPreparerId;
            private string _applicationId;
            private string _copyrightFileId;
            private string _abstractFileId;
            private string _bibliographicFileId;
            private DecDatetime _volCreateDatetime;
            private DecDatetime _volModDatetime;
            private DecDatetime _volExpireDatetime;
            private DecDatetime _volEffectiveDatetime;
            private byte _fileStructureVersion;
            private byte _unused4;
            private byte[] _applicationArea;
            private Iso9660 m_root;
            private Iso9660.VolDesc m_parent;
            private byte[] __raw_rootDir;
            private byte[] __raw_pathTable;
            public byte[] Unused1 { get { return _unused1; } }
            public string SystemId { get { return _systemId; } }
            public string VolumeId { get { return _volumeId; } }
            public byte[] Unused2 { get { return _unused2; } }
            public U4bi VolSpaceSize { get { return _volSpaceSize; } }
            public byte[] Unused3 { get { return _unused3; } }
            public U2bi VolSetSize { get { return _volSetSize; } }
            public U2bi VolSeqNum { get { return _volSeqNum; } }
            public U2bi LogicalBlockSize { get { return _logicalBlockSize; } }
            public U4bi PathTableSize { get { return _pathTableSize; } }
            public uint LbaPathTableLe { get { return _lbaPathTableLe; } }
            public uint LbaOptPathTableLe { get { return _lbaOptPathTableLe; } }
            public uint LbaPathTableBe { get { return _lbaPathTableBe; } }
            public uint LbaOptPathTableBe { get { return _lbaOptPathTableBe; } }
            public DirEntry RootDir { get { return _rootDir; } }
            public string VolSetId { get { return _volSetId; } }
            public string PublisherId { get { return _publisherId; } }
            public string DataPreparerId { get { return _dataPreparerId; } }
            public string ApplicationId { get { return _applicationId; } }
            public string CopyrightFileId { get { return _copyrightFileId; } }
            public string AbstractFileId { get { return _abstractFileId; } }
            public string BibliographicFileId { get { return _bibliographicFileId; } }
            public DecDatetime VolCreateDatetime { get { return _volCreateDatetime; } }
            public DecDatetime VolModDatetime { get { return _volModDatetime; } }
            public DecDatetime VolExpireDatetime { get { return _volExpireDatetime; } }
            public DecDatetime VolEffectiveDatetime { get { return _volEffectiveDatetime; } }
            public byte FileStructureVersion { get { return _fileStructureVersion; } }
            public byte Unused4 { get { return _unused4; } }
            public byte[] ApplicationArea { get { return _applicationArea; } }
            public Iso9660 M_Root { get { return m_root; } }
            public Iso9660.VolDesc M_Parent { get { return m_parent; } }
            public byte[] M_RawRootDir { get { return __raw_rootDir; } }
            public byte[] M_RawPathTable { get { return __raw_pathTable; } }
        }
        public partial class VolDescBootRecord : KaitaiStruct
        {
            public static VolDescBootRecord FromFile(string fileName)
            {
                return new VolDescBootRecord(new KaitaiStream(fileName));
            }

            public VolDescBootRecord(KaitaiStream p__io, Iso9660.VolDesc p__parent = null, Iso9660 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _bootSystemId = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(32));
                _bootId = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(32));
            }
            private string _bootSystemId;
            private string _bootId;
            private Iso9660 m_root;
            private Iso9660.VolDesc m_parent;
            public string BootSystemId { get { return _bootSystemId; } }
            public string BootId { get { return _bootId; } }
            public Iso9660 M_Root { get { return m_root; } }
            public Iso9660.VolDesc M_Parent { get { return m_parent; } }
        }
        public partial class Datetime : KaitaiStruct
        {
            public static Datetime FromFile(string fileName)
            {
                return new Datetime(new KaitaiStream(fileName));
            }

            public Datetime(KaitaiStream p__io, Iso9660.DirEntryBody p__parent = null, Iso9660 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _year = m_io.ReadU1();
                _month = m_io.ReadU1();
                _day = m_io.ReadU1();
                _hour = m_io.ReadU1();
                _minute = m_io.ReadU1();
                _sec = m_io.ReadU1();
                _timezone = m_io.ReadU1();
            }
            private byte _year;
            private byte _month;
            private byte _day;
            private byte _hour;
            private byte _minute;
            private byte _sec;
            private byte _timezone;
            private Iso9660 m_root;
            private Iso9660.DirEntryBody m_parent;
            public byte Year { get { return _year; } }
            public byte Month { get { return _month; } }
            public byte Day { get { return _day; } }
            public byte Hour { get { return _hour; } }
            public byte Minute { get { return _minute; } }
            public byte Sec { get { return _sec; } }
            public byte Timezone { get { return _timezone; } }
            public Iso9660 M_Root { get { return m_root; } }
            public Iso9660.DirEntryBody M_Parent { get { return m_parent; } }
        }
        public partial class DirEntry : KaitaiStruct
        {
            public static DirEntry FromFile(string fileName)
            {
                return new DirEntry(new KaitaiStream(fileName));
            }

            public DirEntry(KaitaiStream p__io, KaitaiStruct p__parent = null, Iso9660 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU1();
                if (Len > 0) {
                    __raw_body = m_io.ReadBytes((Len - 1));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new DirEntryBody(io___raw_body, this, m_root);
                }
            }
            private byte _len;
            private DirEntryBody _body;
            private Iso9660 m_root;
            private KaitaiStruct m_parent;
            private byte[] __raw_body;
            public byte Len { get { return _len; } }
            public DirEntryBody Body { get { return _body; } }
            public Iso9660 M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }
        public partial class VolDesc : KaitaiStruct
        {
            public static VolDesc FromFile(string fileName)
            {
                return new VolDesc(new KaitaiStream(fileName));
            }

            public VolDesc(KaitaiStream p__io, Iso9660 p__parent = null, Iso9660 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _type = m_io.ReadU1();
                _magic = m_io.ReadBytes(5);
                if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 67, 68, 48, 48, 49 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 67, 68, 48, 48, 49 }, Magic, M_Io, "/types/vol_desc/seq/1");
                }
                _version = m_io.ReadU1();
                if (Type == 0) {
                    _volDescBootRecord = new VolDescBootRecord(m_io, this, m_root);
                }
                if (Type == 1) {
                    _volDescPrimary = new VolDescPrimary(m_io, this, m_root);
                }
            }
            private byte _type;
            private byte[] _magic;
            private byte _version;
            private VolDescBootRecord _volDescBootRecord;
            private VolDescPrimary _volDescPrimary;
            private Iso9660 m_root;
            private Iso9660 m_parent;
            public byte Type { get { return _type; } }
            public byte[] Magic { get { return _magic; } }
            public byte Version { get { return _version; } }
            public VolDescBootRecord VolDescBootRecord { get { return _volDescBootRecord; } }
            public VolDescPrimary VolDescPrimary { get { return _volDescPrimary; } }
            public Iso9660 M_Root { get { return m_root; } }
            public Iso9660 M_Parent { get { return m_parent; } }
        }
        public partial class PathTableEntryLe : KaitaiStruct
        {
            public static PathTableEntryLe FromFile(string fileName)
            {
                return new PathTableEntryLe(new KaitaiStream(fileName));
            }

            public PathTableEntryLe(KaitaiStream p__io, Iso9660.PathTableLe p__parent = null, Iso9660 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenDirName = m_io.ReadU1();
                _lenExtAttrRec = m_io.ReadU1();
                _lbaExtent = m_io.ReadU4le();
                _parentDirIdx = m_io.ReadU2le();
                _dirName = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(LenDirName));
                if (KaitaiStream.Mod(LenDirName, 2) == 1) {
                    _padding = m_io.ReadU1();
                }
            }
            private byte _lenDirName;
            private byte _lenExtAttrRec;
            private uint _lbaExtent;
            private ushort _parentDirIdx;
            private string _dirName;
            private byte? _padding;
            private Iso9660 m_root;
            private Iso9660.PathTableLe m_parent;
            public byte LenDirName { get { return _lenDirName; } }
            public byte LenExtAttrRec { get { return _lenExtAttrRec; } }
            public uint LbaExtent { get { return _lbaExtent; } }
            public ushort ParentDirIdx { get { return _parentDirIdx; } }
            public string DirName { get { return _dirName; } }
            public byte? Padding { get { return _padding; } }
            public Iso9660 M_Root { get { return m_root; } }
            public Iso9660.PathTableLe M_Parent { get { return m_parent; } }
        }
        public partial class DirEntries : KaitaiStruct
        {
            public static DirEntries FromFile(string fileName)
            {
                return new DirEntries(new KaitaiStream(fileName));
            }

            public DirEntries(KaitaiStream p__io, Iso9660.DirEntryBody p__parent = null, Iso9660 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<DirEntry>();
                {
                    var i = 0;
                    DirEntry M_;
                    do {
                        M_ = new DirEntry(m_io, this, m_root);
                        _entries.Add(M_);
                        i++;
                    } while (!(M_.Len == 0));
                }
            }
            private List<DirEntry> _entries;
            private Iso9660 m_root;
            private Iso9660.DirEntryBody m_parent;
            public List<DirEntry> Entries { get { return _entries; } }
            public Iso9660 M_Root { get { return m_root; } }
            public Iso9660.DirEntryBody M_Parent { get { return m_parent; } }
        }
        public partial class U4bi : KaitaiStruct
        {
            public static U4bi FromFile(string fileName)
            {
                return new U4bi(new KaitaiStream(fileName));
            }

            public U4bi(KaitaiStream p__io, KaitaiStruct p__parent = null, Iso9660 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _le = m_io.ReadU4le();
                _be = m_io.ReadU4be();
            }
            private uint _le;
            private uint _be;
            private Iso9660 m_root;
            private KaitaiStruct m_parent;
            public uint Le { get { return _le; } }
            public uint Be { get { return _be; } }
            public Iso9660 M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class U2bi : KaitaiStruct
        {
            public static U2bi FromFile(string fileName)
            {
                return new U2bi(new KaitaiStream(fileName));
            }

            public U2bi(KaitaiStream p__io, KaitaiStruct p__parent = null, Iso9660 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _le = m_io.ReadU2le();
                _be = m_io.ReadU2be();
            }
            private ushort _le;
            private ushort _be;
            private Iso9660 m_root;
            private KaitaiStruct m_parent;
            public ushort Le { get { return _le; } }
            public ushort Be { get { return _be; } }
            public Iso9660 M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://wiki.osdev.org/ISO_9660#The_Path_Table">Source</a>
        /// </remarks>
        public partial class PathTableLe : KaitaiStruct
        {
            public static PathTableLe FromFile(string fileName)
            {
                return new PathTableLe(new KaitaiStream(fileName));
            }

            public PathTableLe(KaitaiStream p__io, Iso9660.VolDescPrimary p__parent = null, Iso9660 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<PathTableEntryLe>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(new PathTableEntryLe(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<PathTableEntryLe> _entries;
            private Iso9660 m_root;
            private Iso9660.VolDescPrimary m_parent;
            public List<PathTableEntryLe> Entries { get { return _entries; } }
            public Iso9660 M_Root { get { return m_root; } }
            public Iso9660.VolDescPrimary M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://wiki.osdev.org/ISO_9660#Date.2Ftime_format">Source</a>
        /// </remarks>
        public partial class DecDatetime : KaitaiStruct
        {
            public static DecDatetime FromFile(string fileName)
            {
                return new DecDatetime(new KaitaiStream(fileName));
            }

            public DecDatetime(KaitaiStream p__io, Iso9660.VolDescPrimary p__parent = null, Iso9660 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _year = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
                _month = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(2));
                _day = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(2));
                _hour = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(2));
                _minute = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(2));
                _sec = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(2));
                _secHundreds = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(2));
                _timezone = m_io.ReadU1();
            }
            private string _year;
            private string _month;
            private string _day;
            private string _hour;
            private string _minute;
            private string _sec;
            private string _secHundreds;
            private byte _timezone;
            private Iso9660 m_root;
            private Iso9660.VolDescPrimary m_parent;
            public string Year { get { return _year; } }
            public string Month { get { return _month; } }
            public string Day { get { return _day; } }
            public string Hour { get { return _hour; } }
            public string Minute { get { return _minute; } }
            public string Sec { get { return _sec; } }
            public string SecHundreds { get { return _secHundreds; } }
            public byte Timezone { get { return _timezone; } }
            public Iso9660 M_Root { get { return m_root; } }
            public Iso9660.VolDescPrimary M_Parent { get { return m_parent; } }
        }
        public partial class DirEntryBody : KaitaiStruct
        {
            public static DirEntryBody FromFile(string fileName)
            {
                return new DirEntryBody(new KaitaiStream(fileName));
            }

            public DirEntryBody(KaitaiStream p__io, Iso9660.DirEntry p__parent = null, Iso9660 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_extentAsDir = false;
                f_extentAsFile = false;
                _read();
            }
            private void _read()
            {
                _lenExtAttrRec = m_io.ReadU1();
                _lbaExtent = new U4bi(m_io, this, m_root);
                _sizeExtent = new U4bi(m_io, this, m_root);
                _datetime = new Datetime(m_io, this, m_root);
                _fileFlags = m_io.ReadU1();
                _fileUnitSize = m_io.ReadU1();
                _interleaveGapSize = m_io.ReadU1();
                _volSeqNum = new U2bi(m_io, this, m_root);
                _lenFileName = m_io.ReadU1();
                _fileName = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(LenFileName));
                if (KaitaiStream.Mod(LenFileName, 2) == 0) {
                    _padding = m_io.ReadU1();
                }
                _rest = m_io.ReadBytesFull();
            }
            private bool f_extentAsDir;
            private DirEntries _extentAsDir;
            public DirEntries ExtentAsDir
            {
                get
                {
                    if (f_extentAsDir)
                        return _extentAsDir;
                    if ((FileFlags & 2) != 0) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek((LbaExtent.Le * M_Root.SectorSize));
                        __raw_extentAsDir = io.ReadBytes(SizeExtent.Le);
                        var io___raw_extentAsDir = new KaitaiStream(__raw_extentAsDir);
                        _extentAsDir = new DirEntries(io___raw_extentAsDir, this, m_root);
                        io.Seek(_pos);
                        f_extentAsDir = true;
                    }
                    return _extentAsDir;
                }
            }
            private bool f_extentAsFile;
            private byte[] _extentAsFile;
            public byte[] ExtentAsFile
            {
                get
                {
                    if (f_extentAsFile)
                        return _extentAsFile;
                    if ((FileFlags & 2) == 0) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek((LbaExtent.Le * M_Root.SectorSize));
                        _extentAsFile = io.ReadBytes(SizeExtent.Le);
                        io.Seek(_pos);
                        f_extentAsFile = true;
                    }
                    return _extentAsFile;
                }
            }
            private byte _lenExtAttrRec;
            private U4bi _lbaExtent;
            private U4bi _sizeExtent;
            private Datetime _datetime;
            private byte _fileFlags;
            private byte _fileUnitSize;
            private byte _interleaveGapSize;
            private U2bi _volSeqNum;
            private byte _lenFileName;
            private string _fileName;
            private byte? _padding;
            private byte[] _rest;
            private Iso9660 m_root;
            private Iso9660.DirEntry m_parent;
            private byte[] __raw_extentAsDir;
            public byte LenExtAttrRec { get { return _lenExtAttrRec; } }
            public U4bi LbaExtent { get { return _lbaExtent; } }
            public U4bi SizeExtent { get { return _sizeExtent; } }
            public Datetime Datetime { get { return _datetime; } }
            public byte FileFlags { get { return _fileFlags; } }
            public byte FileUnitSize { get { return _fileUnitSize; } }
            public byte InterleaveGapSize { get { return _interleaveGapSize; } }
            public U2bi VolSeqNum { get { return _volSeqNum; } }
            public byte LenFileName { get { return _lenFileName; } }
            public string FileName { get { return _fileName; } }
            public byte? Padding { get { return _padding; } }
            public byte[] Rest { get { return _rest; } }
            public Iso9660 M_Root { get { return m_root; } }
            public Iso9660.DirEntry M_Parent { get { return m_parent; } }
            public byte[] M_RawExtentAsDir { get { return __raw_extentAsDir; } }
        }
        private bool f_sectorSize;
        private int _sectorSize;
        public int SectorSize
        {
            get
            {
                if (f_sectorSize)
                    return _sectorSize;
                _sectorSize = (int) (2048);
                f_sectorSize = true;
                return _sectorSize;
            }
        }
        private bool f_primaryVolDesc;
        private VolDesc _primaryVolDesc;
        public VolDesc PrimaryVolDesc
        {
            get
            {
                if (f_primaryVolDesc)
                    return _primaryVolDesc;
                long _pos = m_io.Pos;
                m_io.Seek((16 * SectorSize));
                _primaryVolDesc = new VolDesc(m_io, this, m_root);
                m_io.Seek(_pos);
                f_primaryVolDesc = true;
                return _primaryVolDesc;
            }
        }
        private Iso9660 m_root;
        private KaitaiStruct m_parent;
        public Iso9660 M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
