// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://download.microsoft.com/download/0/8/4/084c452b-b772-4fe5-89bb-a0cbf082286a/fatgen103.doc">Source</a>
    /// </remarks>
    public partial class Vfat : KaitaiStruct
    {
        public static Vfat FromFile(string fileName)
        {
            return new Vfat(new KaitaiStream(fileName));
        }

        public Vfat(KaitaiStream p__io, KaitaiStruct p__parent = null, Vfat p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_fats = false;
            f_rootDir = false;
            _read();
        }
        private void _read()
        {
            _bootSector = new BootSector(m_io, this, m_root);
        }

        /// <summary>
        /// Extended BIOS Parameter Block for FAT32
        /// </summary>
        public partial class ExtBiosParamBlockFat32 : KaitaiStruct
        {
            public static ExtBiosParamBlockFat32 FromFile(string fileName)
            {
                return new ExtBiosParamBlockFat32(new KaitaiStream(fileName));
            }

            public ExtBiosParamBlockFat32(KaitaiStream p__io, Vfat.BootSector p__parent = null, Vfat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lsPerFat = m_io.ReadU4le();
                _hasActiveFat = m_io.ReadBitsIntLe(1) != 0;
                _reserved1 = m_io.ReadBitsIntLe(3);
                _activeFatId = m_io.ReadBitsIntLe(4);
                m_io.AlignToByte();
                _reserved2 = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(Reserved2, new byte[] { 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0 }, Reserved2, M_Io, "/types/ext_bios_param_block_fat32/seq/4");
                }
                _fatVersion = m_io.ReadU2le();
                _rootDirStartClus = m_io.ReadU4le();
                _lsFsInfo = m_io.ReadU2le();
                _bootSectorsCopyStartLs = m_io.ReadU2le();
                _reserved3 = m_io.ReadBytes(12);
                _physDriveNum = m_io.ReadU1();
                _reserved4 = m_io.ReadU1();
                _extBootSign = m_io.ReadU1();
                _volumeId = m_io.ReadBytes(4);
                _partitionVolumeLabel = System.Text.Encoding.GetEncoding("ASCII").GetString(KaitaiStream.BytesStripRight(m_io.ReadBytes(11), 32));
                _fsTypeStr = System.Text.Encoding.GetEncoding("ASCII").GetString(KaitaiStream.BytesStripRight(m_io.ReadBytes(8), 32));
            }
            private uint _lsPerFat;
            private bool _hasActiveFat;
            private ulong _reserved1;
            private ulong _activeFatId;
            private byte[] _reserved2;
            private ushort _fatVersion;
            private uint _rootDirStartClus;
            private ushort _lsFsInfo;
            private ushort _bootSectorsCopyStartLs;
            private byte[] _reserved3;
            private byte _physDriveNum;
            private byte _reserved4;
            private byte _extBootSign;
            private byte[] _volumeId;
            private string _partitionVolumeLabel;
            private string _fsTypeStr;
            private Vfat m_root;
            private Vfat.BootSector m_parent;

            /// <summary>
            /// Logical sectors per file allocation table (corresponds with
            /// the old entry `ls_per_fat` in the DOS 2.0 BPB).
            /// </summary>
            public uint LsPerFat { get { return _lsPerFat; } }

            /// <summary>
            /// If true, then there is &quot;active&quot; FAT, which is designated in
            /// `active_fat` attribute. If false, all FATs are mirrored as
            /// usual.
            /// </summary>
            public bool HasActiveFat { get { return _hasActiveFat; } }
            public ulong Reserved1 { get { return _reserved1; } }

            /// <summary>
            /// Zero-based number of active FAT, if `has_active_fat`
            /// attribute is true.
            /// </summary>
            public ulong ActiveFatId { get { return _activeFatId; } }
            public byte[] Reserved2 { get { return _reserved2; } }
            public ushort FatVersion { get { return _fatVersion; } }

            /// <summary>
            /// Cluster number of root directory start, typically 2 if it
            /// contains no bad sector. (Microsoft's FAT32 implementation
            /// imposes an artificial limit of 65,535 entries per directory,
            /// whilst many third-party implementations do not.)
            /// </summary>
            public uint RootDirStartClus { get { return _rootDirStartClus; } }

            /// <summary>
            /// Logical sector number of FS Information Sector, typically 1,
            /// i.e., the second of the three FAT32 boot sectors. Values
            /// like 0 and 0xFFFF are used by some FAT32 implementations to
            /// designate abscence of FS Information Sector.
            /// </summary>
            public ushort LsFsInfo { get { return _lsFsInfo; } }

            /// <summary>
            /// First logical sector number of a copy of the three FAT32
            /// boot sectors, typically 6.
            /// </summary>
            public ushort BootSectorsCopyStartLs { get { return _bootSectorsCopyStartLs; } }
            public byte[] Reserved3 { get { return _reserved3; } }

            /// <summary>
            /// Physical drive number (0x00 for (first) removable media,
            /// 0x80 for (first) fixed disk as per INT 13h).
            /// </summary>
            public byte PhysDriveNum { get { return _physDriveNum; } }
            public byte Reserved4 { get { return _reserved4; } }

            /// <summary>
            /// Should be 0x29 to indicate that an EBPB with the following 3
            /// entries exists.
            /// </summary>
            public byte ExtBootSign { get { return _extBootSign; } }

            /// <summary>
            /// Volume ID (serial number).
            /// 
            /// Typically the serial number &quot;xxxx-xxxx&quot; is created by a
            /// 16-bit addition of both DX values returned by INT 21h/AH=2Ah
            /// (get system date) and INT 21h/AH=2Ch (get system time) for
            /// the high word and another 16-bit addition of both CX values
            /// for the low word of the serial number. Alternatively, some
            /// DR-DOS disk utilities provide a /# option to generate a
            /// human-readable time stamp &quot;mmdd-hhmm&quot; build from BCD-encoded
            /// 8-bit values for the month, day, hour and minute instead of
            /// a serial number.
            /// </summary>
            public byte[] VolumeId { get { return _volumeId; } }
            public string PartitionVolumeLabel { get { return _partitionVolumeLabel; } }
            public string FsTypeStr { get { return _fsTypeStr; } }
            public Vfat M_Root { get { return m_root; } }
            public Vfat.BootSector M_Parent { get { return m_parent; } }
        }
        public partial class BootSector : KaitaiStruct
        {
            public static BootSector FromFile(string fileName)
            {
                return new BootSector(new KaitaiStream(fileName));
            }

            public BootSector(KaitaiStream p__io, Vfat p__parent = null, Vfat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_posFats = false;
                f_lsPerFat = false;
                f_lsPerRootDir = false;
                f_isFat32 = false;
                f_sizeFat = false;
                f_posRootDir = false;
                f_sizeRootDir = false;
                _read();
            }
            private void _read()
            {
                _jmpInstruction = m_io.ReadBytes(3);
                _oemName = System.Text.Encoding.GetEncoding("ASCII").GetString(KaitaiStream.BytesStripRight(m_io.ReadBytes(8), 32));
                _bpb = new BiosParamBlock(m_io, this, m_root);
                if (!(IsFat32)) {
                    _ebpbFat16 = new ExtBiosParamBlockFat16(m_io, this, m_root);
                }
                if (IsFat32) {
                    _ebpbFat32 = new ExtBiosParamBlockFat32(m_io, this, m_root);
                }
            }
            private bool f_posFats;
            private int _posFats;

            /// <summary>
            /// Offset of FATs in bytes from start of filesystem
            /// </summary>
            public int PosFats
            {
                get
                {
                    if (f_posFats)
                        return _posFats;
                    _posFats = (int) ((Bpb.BytesPerLs * Bpb.NumReservedLs));
                    f_posFats = true;
                    return _posFats;
                }
            }
            private bool f_lsPerFat;
            private uint _lsPerFat;
            public uint LsPerFat
            {
                get
                {
                    if (f_lsPerFat)
                        return _lsPerFat;
                    _lsPerFat = (uint) ((IsFat32 ? EbpbFat32.LsPerFat : Bpb.LsPerFat));
                    f_lsPerFat = true;
                    return _lsPerFat;
                }
            }
            private bool f_lsPerRootDir;
            private int _lsPerRootDir;

            /// <summary>
            /// Size of root directory in logical sectors
            /// </summary>
            /// <remarks>
            /// Reference: FAT: General Overview of On-Disk Format, section &quot;FAT Data Structure&quot;
            /// </remarks>
            public int LsPerRootDir
            {
                get
                {
                    if (f_lsPerRootDir)
                        return _lsPerRootDir;
                    _lsPerRootDir = (int) (((((Bpb.MaxRootDirRec * 32) + Bpb.BytesPerLs) - 1) / Bpb.BytesPerLs));
                    f_lsPerRootDir = true;
                    return _lsPerRootDir;
                }
            }
            private bool f_isFat32;
            private bool _isFat32;

            /// <summary>
            /// Determines if filesystem is FAT32 (true) or FAT12/16 (false)
            /// by analyzing some preliminary conditions in BPB. Used to
            /// determine whether we should parse post-BPB data as
            /// `ext_bios_param_block_fat16` or `ext_bios_param_block_fat32`.
            /// </summary>
            public bool IsFat32
            {
                get
                {
                    if (f_isFat32)
                        return _isFat32;
                    _isFat32 = (bool) (Bpb.MaxRootDirRec == 0);
                    f_isFat32 = true;
                    return _isFat32;
                }
            }
            private bool f_sizeFat;
            private int _sizeFat;

            /// <summary>
            /// Size of one FAT in bytes
            /// </summary>
            public int SizeFat
            {
                get
                {
                    if (f_sizeFat)
                        return _sizeFat;
                    _sizeFat = (int) ((Bpb.BytesPerLs * LsPerFat));
                    f_sizeFat = true;
                    return _sizeFat;
                }
            }
            private bool f_posRootDir;
            private int _posRootDir;

            /// <summary>
            /// Offset of root directory in bytes from start of filesystem
            /// </summary>
            public int PosRootDir
            {
                get
                {
                    if (f_posRootDir)
                        return _posRootDir;
                    _posRootDir = (int) ((Bpb.BytesPerLs * (Bpb.NumReservedLs + (LsPerFat * Bpb.NumFats))));
                    f_posRootDir = true;
                    return _posRootDir;
                }
            }
            private bool f_sizeRootDir;
            private int _sizeRootDir;

            /// <summary>
            /// Size of root directory in bytes
            /// </summary>
            public int SizeRootDir
            {
                get
                {
                    if (f_sizeRootDir)
                        return _sizeRootDir;
                    _sizeRootDir = (int) ((LsPerRootDir * Bpb.BytesPerLs));
                    f_sizeRootDir = true;
                    return _sizeRootDir;
                }
            }
            private byte[] _jmpInstruction;
            private string _oemName;
            private BiosParamBlock _bpb;
            private ExtBiosParamBlockFat16 _ebpbFat16;
            private ExtBiosParamBlockFat32 _ebpbFat32;
            private Vfat m_root;
            private Vfat m_parent;
            public byte[] JmpInstruction { get { return _jmpInstruction; } }
            public string OemName { get { return _oemName; } }

            /// <summary>
            /// Basic BIOS parameter block, present in all versions of FAT
            /// </summary>
            public BiosParamBlock Bpb { get { return _bpb; } }

            /// <summary>
            /// FAT12/16-specific extended BIOS parameter block
            /// </summary>
            public ExtBiosParamBlockFat16 EbpbFat16 { get { return _ebpbFat16; } }

            /// <summary>
            /// FAT32-specific extended BIOS parameter block
            /// </summary>
            public ExtBiosParamBlockFat32 EbpbFat32 { get { return _ebpbFat32; } }
            public Vfat M_Root { get { return m_root; } }
            public Vfat M_Parent { get { return m_parent; } }
        }
        public partial class BiosParamBlock : KaitaiStruct
        {
            public static BiosParamBlock FromFile(string fileName)
            {
                return new BiosParamBlock(new KaitaiStream(fileName));
            }

            public BiosParamBlock(KaitaiStream p__io, Vfat.BootSector p__parent = null, Vfat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _bytesPerLs = m_io.ReadU2le();
                _lsPerClus = m_io.ReadU1();
                _numReservedLs = m_io.ReadU2le();
                _numFats = m_io.ReadU1();
                _maxRootDirRec = m_io.ReadU2le();
                _totalLs2 = m_io.ReadU2le();
                _mediaCode = m_io.ReadU1();
                _lsPerFat = m_io.ReadU2le();
                _psPerTrack = m_io.ReadU2le();
                _numHeads = m_io.ReadU2le();
                _numHiddenSectors = m_io.ReadU4le();
                _totalLs4 = m_io.ReadU4le();
            }
            private ushort _bytesPerLs;
            private byte _lsPerClus;
            private ushort _numReservedLs;
            private byte _numFats;
            private ushort _maxRootDirRec;
            private ushort _totalLs2;
            private byte _mediaCode;
            private ushort _lsPerFat;
            private ushort _psPerTrack;
            private ushort _numHeads;
            private uint _numHiddenSectors;
            private uint _totalLs4;
            private Vfat m_root;
            private Vfat.BootSector m_parent;

            /// <summary>
            /// Bytes per logical sector
            /// </summary>
            public ushort BytesPerLs { get { return _bytesPerLs; } }

            /// <summary>
            /// Logical sectors per cluster
            /// </summary>
            public byte LsPerClus { get { return _lsPerClus; } }

            /// <summary>
            /// Count of reserved logical sectors. The number of logical
            /// sectors before the first FAT in the file system image.
            /// </summary>
            public ushort NumReservedLs { get { return _numReservedLs; } }

            /// <summary>
            /// Number of File Allocation Tables
            /// </summary>
            public byte NumFats { get { return _numFats; } }

            /// <summary>
            /// Maximum number of FAT12 or FAT16 root directory entries. 0
            /// for FAT32, where the root directory is stored in ordinary
            /// data clusters.
            /// </summary>
            public ushort MaxRootDirRec { get { return _maxRootDirRec; } }

            /// <summary>
            /// Total logical sectors (if zero, use total_ls_4)
            /// </summary>
            public ushort TotalLs2 { get { return _totalLs2; } }

            /// <summary>
            /// Media descriptor
            /// </summary>
            public byte MediaCode { get { return _mediaCode; } }

            /// <summary>
            /// Logical sectors per File Allocation Table for
            /// FAT12/FAT16. FAT32 sets this to 0 and uses the 32-bit value
            /// at offset 0x024 instead.
            /// </summary>
            public ushort LsPerFat { get { return _lsPerFat; } }

            /// <summary>
            /// Physical sectors per track for disks with INT 13h CHS
            /// geometry, e.g., 15 for a &quot;1.20 MB&quot; (1200 KB) floppy. A zero
            /// entry indicates that this entry is reserved, but not used.
            /// </summary>
            public ushort PsPerTrack { get { return _psPerTrack; } }

            /// <summary>
            /// Number of heads for disks with INT 13h CHS geometry,[9]
            /// e.g., 2 for a double sided floppy.
            /// </summary>
            public ushort NumHeads { get { return _numHeads; } }

            /// <summary>
            /// Number of hidden sectors preceding the partition that
            /// contains this FAT volume. This field should always be zero
            /// on media that are not partitioned. This DOS 3.0 entry is
            /// incompatible with a similar entry at offset 0x01C in BPBs
            /// since DOS 3.31.  It must not be used if the logical sectors
            /// entry at offset 0x013 is zero.
            /// </summary>
            public uint NumHiddenSectors { get { return _numHiddenSectors; } }

            /// <summary>
            /// Total logical sectors including hidden sectors. This DOS 3.2
            /// entry is incompatible with a similar entry at offset 0x020
            /// in BPBs since DOS 3.31. It must not be used if the logical
            /// sectors entry at offset 0x013 is zero.
            /// </summary>
            public uint TotalLs4 { get { return _totalLs4; } }
            public Vfat M_Root { get { return m_root; } }
            public Vfat.BootSector M_Parent { get { return m_parent; } }
        }
        public partial class RootDirectoryRec : KaitaiStruct
        {
            public static RootDirectoryRec FromFile(string fileName)
            {
                return new RootDirectoryRec(new KaitaiStream(fileName));
            }

            public RootDirectoryRec(KaitaiStream p__io, Vfat.RootDirectory p__parent = null, Vfat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fileName = m_io.ReadBytes(11);
                __raw_attrs = m_io.ReadBytes(1);
                var io___raw_attrs = new KaitaiStream(__raw_attrs);
                _attrs = new AttrFlags(io___raw_attrs, this, m_root);
                _reserved = m_io.ReadBytes(10);
                __raw_lastWriteTime = m_io.ReadBytes(4);
                var io___raw_lastWriteTime = new KaitaiStream(__raw_lastWriteTime);
                _lastWriteTime = new DosDatetime(io___raw_lastWriteTime);
                _startClus = m_io.ReadU2le();
                _fileSize = m_io.ReadU4le();
            }
            public partial class AttrFlags : KaitaiStruct
            {
                public static AttrFlags FromFile(string fileName)
                {
                    return new AttrFlags(new KaitaiStream(fileName));
                }

                public AttrFlags(KaitaiStream p__io, Vfat.RootDirectoryRec p__parent = null, Vfat p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_longName = false;
                    _read();
                }
                private void _read()
                {
                    _readOnly = m_io.ReadBitsIntLe(1) != 0;
                    _hidden = m_io.ReadBitsIntLe(1) != 0;
                    _system = m_io.ReadBitsIntLe(1) != 0;
                    _volumeId = m_io.ReadBitsIntLe(1) != 0;
                    _isDirectory = m_io.ReadBitsIntLe(1) != 0;
                    _archive = m_io.ReadBitsIntLe(1) != 0;
                    _reserved = m_io.ReadBitsIntLe(2);
                }
                private bool f_longName;
                private bool _longName;
                public bool LongName
                {
                    get
                    {
                        if (f_longName)
                            return _longName;
                        _longName = (bool) ( ((ReadOnly) && (Hidden) && (System) && (VolumeId)) );
                        f_longName = true;
                        return _longName;
                    }
                }
                private bool _readOnly;
                private bool _hidden;
                private bool _system;
                private bool _volumeId;
                private bool _isDirectory;
                private bool _archive;
                private ulong _reserved;
                private Vfat m_root;
                private Vfat.RootDirectoryRec m_parent;
                public bool ReadOnly { get { return _readOnly; } }
                public bool Hidden { get { return _hidden; } }
                public bool System { get { return _system; } }
                public bool VolumeId { get { return _volumeId; } }
                public bool IsDirectory { get { return _isDirectory; } }
                public bool Archive { get { return _archive; } }
                public ulong Reserved { get { return _reserved; } }
                public Vfat M_Root { get { return m_root; } }
                public Vfat.RootDirectoryRec M_Parent { get { return m_parent; } }
            }
            private byte[] _fileName;
            private AttrFlags _attrs;
            private byte[] _reserved;
            private DosDatetime _lastWriteTime;
            private ushort _startClus;
            private uint _fileSize;
            private Vfat m_root;
            private Vfat.RootDirectory m_parent;
            private byte[] __raw_attrs;
            private byte[] __raw_lastWriteTime;
            public byte[] FileName { get { return _fileName; } }
            public AttrFlags Attrs { get { return _attrs; } }
            public byte[] Reserved { get { return _reserved; } }
            public DosDatetime LastWriteTime { get { return _lastWriteTime; } }
            public ushort StartClus { get { return _startClus; } }
            public uint FileSize { get { return _fileSize; } }
            public Vfat M_Root { get { return m_root; } }
            public Vfat.RootDirectory M_Parent { get { return m_parent; } }
            public byte[] M_RawAttrs { get { return __raw_attrs; } }
            public byte[] M_RawLastWriteTime { get { return __raw_lastWriteTime; } }
        }
        public partial class RootDirectory : KaitaiStruct
        {
            public static RootDirectory FromFile(string fileName)
            {
                return new RootDirectory(new KaitaiStream(fileName));
            }

            public RootDirectory(KaitaiStream p__io, Vfat p__parent = null, Vfat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _records = new List<RootDirectoryRec>();
                for (var i = 0; i < M_Root.BootSector.Bpb.MaxRootDirRec; i++)
                {
                    _records.Add(new RootDirectoryRec(m_io, this, m_root));
                }
            }
            private List<RootDirectoryRec> _records;
            private Vfat m_root;
            private Vfat m_parent;
            public List<RootDirectoryRec> Records { get { return _records; } }
            public Vfat M_Root { get { return m_root; } }
            public Vfat M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Extended BIOS Parameter Block (DOS 4.0+, OS/2 1.0+). Used only
        /// for FAT12 and FAT16.
        /// </summary>
        public partial class ExtBiosParamBlockFat16 : KaitaiStruct
        {
            public static ExtBiosParamBlockFat16 FromFile(string fileName)
            {
                return new ExtBiosParamBlockFat16(new KaitaiStream(fileName));
            }

            public ExtBiosParamBlockFat16(KaitaiStream p__io, Vfat.BootSector p__parent = null, Vfat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _physDriveNum = m_io.ReadU1();
                _reserved1 = m_io.ReadU1();
                _extBootSign = m_io.ReadU1();
                _volumeId = m_io.ReadBytes(4);
                _partitionVolumeLabel = System.Text.Encoding.GetEncoding("ASCII").GetString(KaitaiStream.BytesStripRight(m_io.ReadBytes(11), 32));
                _fsTypeStr = System.Text.Encoding.GetEncoding("ASCII").GetString(KaitaiStream.BytesStripRight(m_io.ReadBytes(8), 32));
            }
            private byte _physDriveNum;
            private byte _reserved1;
            private byte _extBootSign;
            private byte[] _volumeId;
            private string _partitionVolumeLabel;
            private string _fsTypeStr;
            private Vfat m_root;
            private Vfat.BootSector m_parent;

            /// <summary>
            /// Physical drive number (0x00 for (first) removable media,
            /// 0x80 for (first) fixed disk as per INT 13h).
            /// </summary>
            public byte PhysDriveNum { get { return _physDriveNum; } }
            public byte Reserved1 { get { return _reserved1; } }

            /// <summary>
            /// Should be 0x29 to indicate that an EBPB with the following 3
            /// entries exists.
            /// </summary>
            public byte ExtBootSign { get { return _extBootSign; } }

            /// <summary>
            /// Volume ID (serial number).
            /// 
            /// Typically the serial number &quot;xxxx-xxxx&quot; is created by a
            /// 16-bit addition of both DX values returned by INT 21h/AH=2Ah
            /// (get system date) and INT 21h/AH=2Ch (get system time) for
            /// the high word and another 16-bit addition of both CX values
            /// for the low word of the serial number. Alternatively, some
            /// DR-DOS disk utilities provide a /# option to generate a
            /// human-readable time stamp &quot;mmdd-hhmm&quot; build from BCD-encoded
            /// 8-bit values for the month, day, hour and minute instead of
            /// a serial number.
            /// </summary>
            public byte[] VolumeId { get { return _volumeId; } }
            public string PartitionVolumeLabel { get { return _partitionVolumeLabel; } }
            public string FsTypeStr { get { return _fsTypeStr; } }
            public Vfat M_Root { get { return m_root; } }
            public Vfat.BootSector M_Parent { get { return m_parent; } }
        }
        private bool f_fats;
        private List<byte[]> _fats;
        public List<byte[]> Fats
        {
            get
            {
                if (f_fats)
                    return _fats;
                long _pos = m_io.Pos;
                m_io.Seek(BootSector.PosFats);
                _fats = new List<byte[]>();
                for (var i = 0; i < BootSector.Bpb.NumFats; i++)
                {
                    _fats.Add(m_io.ReadBytes(BootSector.SizeFat));
                }
                m_io.Seek(_pos);
                f_fats = true;
                return _fats;
            }
        }
        private bool f_rootDir;
        private RootDirectory _rootDir;
        public RootDirectory RootDir
        {
            get
            {
                if (f_rootDir)
                    return _rootDir;
                long _pos = m_io.Pos;
                m_io.Seek(BootSector.PosRootDir);
                __raw_rootDir = m_io.ReadBytes(BootSector.SizeRootDir);
                var io___raw_rootDir = new KaitaiStream(__raw_rootDir);
                _rootDir = new RootDirectory(io___raw_rootDir, this, m_root);
                m_io.Seek(_pos);
                f_rootDir = true;
                return _rootDir;
            }
        }
        private BootSector _bootSector;
        private Vfat m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_rootDir;
        public BootSector BootSector { get { return _bootSector; } }
        public Vfat M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawRootDir { get { return __raw_rootDir; } }
    }
}
