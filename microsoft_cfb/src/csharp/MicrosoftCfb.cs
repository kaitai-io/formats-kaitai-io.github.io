// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class MicrosoftCfb : KaitaiStruct
    {
        public static MicrosoftCfb FromFile(string fileName)
        {
            return new MicrosoftCfb(new KaitaiStream(fileName));
        }

        public MicrosoftCfb(KaitaiStream io, KaitaiStruct parent = null, MicrosoftCfb root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            f_sectorSize = false;
            f_fat = false;
            f_dir = false;
            _read();
        }
        private void _read() {
            _header = new CfbHeader(m_io, this, m_root);
            }
        public partial class CfbHeader : KaitaiStruct
        {
            public static CfbHeader FromFile(string fileName)
            {
                return new CfbHeader(new KaitaiStream(fileName));
            }

            public CfbHeader(KaitaiStream io, MicrosoftCfb parent = null, MicrosoftCfb root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _signature = m_io.EnsureFixedContents(new byte[] { 208, 207, 17, 224, 161, 177, 26, 225 });
                _clsid = m_io.EnsureFixedContents(new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 });
                _versionMinor = m_io.ReadU2le();
                _versionMajor = m_io.ReadU2le();
                _byteOrder = m_io.EnsureFixedContents(new byte[] { 254, 255 });
                _sectorShift = m_io.ReadU2le();
                _miniSectorShift = m_io.ReadU2le();
                _reserved1 = m_io.ReadBytes(6);
                _sizeDir = m_io.ReadS4le();
                _sizeFat = m_io.ReadS4le();
                _ofsDir = m_io.ReadS4le();
                _transactionSeq = m_io.ReadS4le();
                _miniStreamCutoffSize = m_io.ReadS4le();
                _ofsMiniFat = m_io.ReadS4le();
                _sizeMiniFat = m_io.ReadS4le();
                _ofsDifat = m_io.ReadS4le();
                _sizeDifat = m_io.ReadS4le();
                _difat = new List<int>((int) (109));
                for (var i = 0; i < 109; i++) {
                    _difat.Add(m_io.ReadS4le());
                }
                }
            private byte[] _signature;
            private byte[] _clsid;
            private ushort _versionMinor;
            private ushort _versionMajor;
            private byte[] _byteOrder;
            private ushort _sectorShift;
            private ushort _miniSectorShift;
            private byte[] _reserved1;
            private int _sizeDir;
            private int _sizeFat;
            private int _ofsDir;
            private int _transactionSeq;
            private int _miniStreamCutoffSize;
            private int _ofsMiniFat;
            private int _sizeMiniFat;
            private int _ofsDifat;
            private int _sizeDifat;
            private List<int> _difat;
            private MicrosoftCfb m_root;
            private MicrosoftCfb m_parent;

            /// <summary>
            /// Magic bytes that confirm that this is a CFB file
            /// </summary>
            public byte[] Signature { get { return _signature; } }

            /// <summary>
            /// Reserved class ID field, must be all 0
            /// </summary>
            public byte[] Clsid { get { return _clsid; } }
            public ushort VersionMinor { get { return _versionMinor; } }
            public ushort VersionMajor { get { return _versionMajor; } }

            /// <summary>
            /// In theory, specifies a byte order. In practice, no other values besides FE FF (which imply little endian order) are used.
            /// </summary>
            public byte[] ByteOrder { get { return _byteOrder; } }

            /// <summary>
            /// For major version 3, must be 0x9 (sector size = 512 bytes). For major version 4, must be 0xc (sector size = 4096 bytes).
            /// </summary>
            public ushort SectorShift { get { return _sectorShift; } }
            public ushort MiniSectorShift { get { return _miniSectorShift; } }
            public byte[] Reserved1 { get { return _reserved1; } }

            /// <summary>
            /// Number of directory sectors in this file. For major version 3, must be 0.
            /// </summary>
            public int SizeDir { get { return _sizeDir; } }

            /// <summary>
            /// Number of FAT sectors in this file.
            /// </summary>
            public int SizeFat { get { return _sizeFat; } }

            /// <summary>
            /// Starting sector number for directory stream.
            /// </summary>
            public int OfsDir { get { return _ofsDir; } }

            /// <summary>
            /// A transaction sequence number, which is incremented each time the file is saved if transactions are implemented, 0 otherwise.
            /// </summary>
            public int TransactionSeq { get { return _transactionSeq; } }
            public int MiniStreamCutoffSize { get { return _miniStreamCutoffSize; } }

            /// <summary>
            /// Starting sector number for mini FAT.
            /// </summary>
            public int OfsMiniFat { get { return _ofsMiniFat; } }

            /// <summary>
            /// Number of mini FAT sectors in this file.
            /// </summary>
            public int SizeMiniFat { get { return _sizeMiniFat; } }

            /// <summary>
            /// Starting sector number for DIFAT.
            /// </summary>
            public int OfsDifat { get { return _ofsDifat; } }

            /// <summary>
            /// Number of DIFAT sectors in this file.
            /// </summary>
            public int SizeDifat { get { return _sizeDifat; } }
            public List<int> Difat { get { return _difat; } }
            public MicrosoftCfb M_Root { get { return m_root; } }
            public MicrosoftCfb M_Parent { get { return m_parent; } }
        }
        public partial class FatEntries : KaitaiStruct
        {
            public static FatEntries FromFile(string fileName)
            {
                return new FatEntries(new KaitaiStream(fileName));
            }

            public FatEntries(KaitaiStream io, MicrosoftCfb parent = null, MicrosoftCfb root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _entries = new List<int>();
                while (!m_io.IsEof) {
                    _entries.Add(m_io.ReadS4le());
                }
                }
            private List<int> _entries;
            private MicrosoftCfb m_root;
            private MicrosoftCfb m_parent;
            public List<int> Entries { get { return _entries; } }
            public MicrosoftCfb M_Root { get { return m_root; } }
            public MicrosoftCfb M_Parent { get { return m_parent; } }
        }
        public partial class DirEntry : KaitaiStruct
        {
            public static DirEntry FromFile(string fileName)
            {
                return new DirEntry(new KaitaiStream(fileName));
            }

            public enum ObjType
            {
                Unknown = 0,
                Storage = 1,
                Stream = 2,
                RootStorage = 5,
            }

            public enum RbColor
            {
                Red = 0,
                Black = 1,
            }

            public DirEntry(KaitaiStream io, MicrosoftCfb parent = null, MicrosoftCfb root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                f_miniStream = false;
                _read();
            }
            private void _read() {
                _name = System.Text.Encoding.GetEncoding("UTF-16LE").GetString(m_io.ReadBytes(64));
                _nameLen = m_io.ReadU2le();
                _objectType = ((ObjType) m_io.ReadU1());
                _colorFlag = ((RbColor) m_io.ReadU1());
                _leftSiblingId = m_io.ReadS4le();
                _rightSiblingId = m_io.ReadS4le();
                _childId = m_io.ReadS4le();
                _clsid = m_io.ReadBytes(16);
                _state = m_io.ReadU4le();
                _timeCreate = m_io.ReadU8le();
                _timeMod = m_io.ReadU8le();
                _ofs = m_io.ReadS4le();
                _size = m_io.ReadU8le();
                }
            private bool f_miniStream;
            private byte[] _miniStream;
            public byte[] MiniStream
            {
                get
                {
                    if (f_miniStream)
                        return _miniStream;
                    if (ObjectType == ObjType.RootStorage) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(((Ofs + 1) * M_Root.SectorSize));
                        _miniStream = io.ReadBytes(Size);
                        io.Seek(_pos);
                    }
                    f_miniStream = true;
                    return _miniStream;
                }
            }
            private string _name;
            private ushort _nameLen;
            private ObjType _objectType;
            private RbColor _colorFlag;
            private int _leftSiblingId;
            private int _rightSiblingId;
            private int _childId;
            private byte[] _clsid;
            private uint _state;
            private ulong _timeCreate;
            private ulong _timeMod;
            private int _ofs;
            private ulong _size;
            private MicrosoftCfb m_root;
            private MicrosoftCfb m_parent;
            public string Name { get { return _name; } }
            public ushort NameLen { get { return _nameLen; } }
            public ObjType ObjectType { get { return _objectType; } }
            public RbColor ColorFlag { get { return _colorFlag; } }
            public int LeftSiblingId { get { return _leftSiblingId; } }
            public int RightSiblingId { get { return _rightSiblingId; } }
            public int ChildId { get { return _childId; } }
            public byte[] Clsid { get { return _clsid; } }

            /// <summary>
            /// User-defined flags for storage or root storage objects
            /// </summary>
            public uint State { get { return _state; } }

            /// <summary>
            /// Creation time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC)
            /// </summary>
            public ulong TimeCreate { get { return _timeCreate; } }

            /// <summary>
            /// Modification time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC).
            /// </summary>
            public ulong TimeMod { get { return _timeMod; } }

            /// <summary>
            /// For stream object, number of starting sector. For a root storage object, first sector of the mini stream, if the mini stream exists.
            /// </summary>
            public int Ofs { get { return _ofs; } }

            /// <summary>
            /// For stream object, size of user-defined data in bytes. For a root storage object, size of the mini stream.
            /// </summary>
            public ulong Size { get { return _size; } }
            public MicrosoftCfb M_Root { get { return m_root; } }
            public MicrosoftCfb M_Parent { get { return m_parent; } }
        }
        private bool f_sectorSize;
        private int _sectorSize;
        public int SectorSize
        {
            get
            {
                if (f_sectorSize)
                    return _sectorSize;
                _sectorSize = (int) ((1 << Header.SectorShift));
                f_sectorSize = true;
                return _sectorSize;
            }
        }
        private bool f_fat;
        private FatEntries _fat;
        public FatEntries Fat
        {
            get
            {
                if (f_fat)
                    return _fat;
                long _pos = m_io.Pos;
                m_io.Seek(SectorSize);
                __raw_fat = m_io.ReadBytes((Header.SizeFat * SectorSize));
                var io___raw_fat = new KaitaiStream(__raw_fat);
                _fat = new FatEntries(io___raw_fat, this, m_root);
                m_io.Seek(_pos);
                f_fat = true;
                return _fat;
            }
        }
        private bool f_dir;
        private DirEntry _dir;
        public DirEntry Dir
        {
            get
            {
                if (f_dir)
                    return _dir;
                long _pos = m_io.Pos;
                m_io.Seek(((Header.OfsDir + 1) * SectorSize));
                __raw_dir = m_io.ReadBytes(128);
                var io___raw_dir = new KaitaiStream(__raw_dir);
                _dir = new DirEntry(io___raw_dir, this, m_root);
                m_io.Seek(_pos);
                f_dir = true;
                return _dir;
            }
        }
        private CfbHeader _header;
        private MicrosoftCfb m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_fat;
        private byte[] __raw_dir;
        public CfbHeader Header { get { return _header; } }
        public MicrosoftCfb M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawFat { get { return __raw_fat; } }
        public byte[] M_RawDir { get { return __raw_dir; } }
    }
}
