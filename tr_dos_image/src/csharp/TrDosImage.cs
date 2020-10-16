// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// .trd file is a raw dump of TR-DOS (ZX-Spectrum) floppy. .trd files are
    /// headerless and contain consequent &quot;logical tracks&quot;, each logical track
    /// consists of 16 256-byte sectors.
    /// 
    /// Logical tracks are defined the same way as used by TR-DOS: for single-side
    /// floppies it's just a physical track number, for two-side floppies sides are
    /// interleaved, i.e. logical_track_num = (physical_track_num &lt;&lt; 1) | side
    /// 
    /// So, this format definition is more for TR-DOS filesystem than for .trd files,
    /// which are formatless.
    /// 
    /// Strings (file names, disk label, disk password) are padded with spaces and use
    /// ZX Spectrum character set, including UDGs, block drawing chars and Basic
    /// tokens. ASCII range is mostly standard ASCII, with few characters (^, `, DEL)
    /// replaced with (up arrow, pound, copyright symbol).
    /// 
    /// .trd file can be smaller than actual floppy disk, if last logical tracks are
    /// empty (contain no file data) they can be omitted.
    /// </summary>
    public partial class TrDosImage : KaitaiStruct
    {
        public static TrDosImage FromFile(string fileName)
        {
            return new TrDosImage(new KaitaiStream(fileName));
        }


        public enum DiskType
        {
            Type80TracksDoubleSide = 22,
            Type40TracksDoubleSide = 23,
            Type80TracksSingleSide = 24,
            Type40TracksSingleSide = 25,
        }
        public TrDosImage(KaitaiStream p__io, KaitaiStruct p__parent = null, TrDosImage p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_volumeInfo = false;
            _read();
        }
        private void _read()
        {
            _files = new List<File>();
            {
                var i = 0;
                File M_;
                do {
                    M_ = new File(m_io, this, m_root);
                    _files.Add(M_);
                    i++;
                } while (!(M_.IsTerminator));
            }
        }
        public partial class VolumeInfo : KaitaiStruct
        {
            public static VolumeInfo FromFile(string fileName)
            {
                return new VolumeInfo(new KaitaiStream(fileName));
            }

            public VolumeInfo(KaitaiStream p__io, TrDosImage p__parent = null, TrDosImage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_numTracks = false;
                f_numSides = false;
                _read();
            }
            private void _read()
            {
                _catalogEnd = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(CatalogEnd, new byte[] { 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0 }, CatalogEnd, M_Io, "/types/volume_info/seq/0");
                }
                _unused = m_io.ReadBytes(224);
                _firstFreeSectorSector = m_io.ReadU1();
                _firstFreeSectorTrack = m_io.ReadU1();
                _diskType = ((TrDosImage.DiskType) m_io.ReadU1());
                _numFiles = m_io.ReadU1();
                _numFreeSectors = m_io.ReadU2le();
                _trDosId = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(TrDosId, new byte[] { 16 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 16 }, TrDosId, M_Io, "/types/volume_info/seq/7");
                }
                _unused2 = m_io.ReadBytes(2);
                _password = m_io.ReadBytes(9);
                _unused3 = m_io.ReadBytes(1);
                _numDeletedFiles = m_io.ReadU1();
                _label = m_io.ReadBytes(8);
                _unused4 = m_io.ReadBytes(3);
            }
            private bool f_numTracks;
            private sbyte _numTracks;
            public sbyte NumTracks
            {
                get
                {
                    if (f_numTracks)
                        return _numTracks;
                    _numTracks = (sbyte) (((DiskType & 1) != 0 ? 40 : 80));
                    f_numTracks = true;
                    return _numTracks;
                }
            }
            private bool f_numSides;
            private sbyte _numSides;
            public sbyte NumSides
            {
                get
                {
                    if (f_numSides)
                        return _numSides;
                    _numSides = (sbyte) (((DiskType & 8) != 0 ? 1 : 2));
                    f_numSides = true;
                    return _numSides;
                }
            }
            private byte[] _catalogEnd;
            private byte[] _unused;
            private byte _firstFreeSectorSector;
            private byte _firstFreeSectorTrack;
            private DiskType _diskType;
            private byte _numFiles;
            private ushort _numFreeSectors;
            private byte[] _trDosId;
            private byte[] _unused2;
            private byte[] _password;
            private byte[] _unused3;
            private byte _numDeletedFiles;
            private byte[] _label;
            private byte[] _unused4;
            private TrDosImage m_root;
            private TrDosImage m_parent;
            public byte[] CatalogEnd { get { return _catalogEnd; } }
            public byte[] Unused { get { return _unused; } }
            public byte FirstFreeSectorSector { get { return _firstFreeSectorSector; } }

            /// <summary>
            /// track number is logical, for double-sided disks it's
            /// (physical_track &lt;&lt; 1) | side, the same way that tracks are stored
            /// sequentially in .trd file
            /// </summary>
            public byte FirstFreeSectorTrack { get { return _firstFreeSectorTrack; } }
            public DiskType DiskType { get { return _diskType; } }

            /// <summary>
            /// Number of non-deleted files. Directory can have more than
            /// number_of_files entries due to deleted files
            /// </summary>
            public byte NumFiles { get { return _numFiles; } }
            public ushort NumFreeSectors { get { return _numFreeSectors; } }
            public byte[] TrDosId { get { return _trDosId; } }
            public byte[] Unused2 { get { return _unused2; } }
            public byte[] Password { get { return _password; } }
            public byte[] Unused3 { get { return _unused3; } }
            public byte NumDeletedFiles { get { return _numDeletedFiles; } }
            public byte[] Label { get { return _label; } }
            public byte[] Unused4 { get { return _unused4; } }
            public TrDosImage M_Root { get { return m_root; } }
            public TrDosImage M_Parent { get { return m_parent; } }
        }
        public partial class PositionAndLengthCode : KaitaiStruct
        {
            public static PositionAndLengthCode FromFile(string fileName)
            {
                return new PositionAndLengthCode(new KaitaiStream(fileName));
            }

            public PositionAndLengthCode(KaitaiStream p__io, TrDosImage.File p__parent = null, TrDosImage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _startAddress = m_io.ReadU2le();
                _length = m_io.ReadU2le();
            }
            private ushort _startAddress;
            private ushort _length;
            private TrDosImage m_root;
            private TrDosImage.File m_parent;

            /// <summary>
            /// Default memory address to load this byte array into
            /// </summary>
            public ushort StartAddress { get { return _startAddress; } }
            public ushort Length { get { return _length; } }
            public TrDosImage M_Root { get { return m_root; } }
            public TrDosImage.File M_Parent { get { return m_parent; } }
        }
        public partial class Filename : KaitaiStruct
        {
            public static Filename FromFile(string fileName)
            {
                return new Filename(new KaitaiStream(fileName));
            }

            public Filename(KaitaiStream p__io, TrDosImage.File p__parent = null, TrDosImage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_firstByte = false;
                _read();
            }
            private void _read()
            {
                _name = m_io.ReadBytes(8);
            }
            private bool f_firstByte;
            private byte _firstByte;
            public byte FirstByte
            {
                get
                {
                    if (f_firstByte)
                        return _firstByte;
                    long _pos = m_io.Pos;
                    m_io.Seek(0);
                    _firstByte = m_io.ReadU1();
                    m_io.Seek(_pos);
                    f_firstByte = true;
                    return _firstByte;
                }
            }
            private byte[] _name;
            private TrDosImage m_root;
            private TrDosImage.File m_parent;
            public byte[] Name { get { return _name; } }
            public TrDosImage M_Root { get { return m_root; } }
            public TrDosImage.File M_Parent { get { return m_parent; } }
        }
        public partial class PositionAndLengthPrint : KaitaiStruct
        {
            public static PositionAndLengthPrint FromFile(string fileName)
            {
                return new PositionAndLengthPrint(new KaitaiStream(fileName));
            }

            public PositionAndLengthPrint(KaitaiStream p__io, TrDosImage.File p__parent = null, TrDosImage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _extentNo = m_io.ReadU1();
                _reserved = m_io.ReadU1();
                _length = m_io.ReadU2le();
            }
            private byte _extentNo;
            private byte _reserved;
            private ushort _length;
            private TrDosImage m_root;
            private TrDosImage.File m_parent;
            public byte ExtentNo { get { return _extentNo; } }
            public byte Reserved { get { return _reserved; } }
            public ushort Length { get { return _length; } }
            public TrDosImage M_Root { get { return m_root; } }
            public TrDosImage.File M_Parent { get { return m_parent; } }
        }
        public partial class PositionAndLengthGeneric : KaitaiStruct
        {
            public static PositionAndLengthGeneric FromFile(string fileName)
            {
                return new PositionAndLengthGeneric(new KaitaiStream(fileName));
            }

            public PositionAndLengthGeneric(KaitaiStream p__io, TrDosImage.File p__parent = null, TrDosImage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _reserved = m_io.ReadU2le();
                _length = m_io.ReadU2le();
            }
            private ushort _reserved;
            private ushort _length;
            private TrDosImage m_root;
            private TrDosImage.File m_parent;
            public ushort Reserved { get { return _reserved; } }
            public ushort Length { get { return _length; } }
            public TrDosImage M_Root { get { return m_root; } }
            public TrDosImage.File M_Parent { get { return m_parent; } }
        }
        public partial class PositionAndLengthBasic : KaitaiStruct
        {
            public static PositionAndLengthBasic FromFile(string fileName)
            {
                return new PositionAndLengthBasic(new KaitaiStream(fileName));
            }

            public PositionAndLengthBasic(KaitaiStream p__io, TrDosImage.File p__parent = null, TrDosImage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _programAndDataLength = m_io.ReadU2le();
                _programLength = m_io.ReadU2le();
            }
            private ushort _programAndDataLength;
            private ushort _programLength;
            private TrDosImage m_root;
            private TrDosImage.File m_parent;
            public ushort ProgramAndDataLength { get { return _programAndDataLength; } }
            public ushort ProgramLength { get { return _programLength; } }
            public TrDosImage M_Root { get { return m_root; } }
            public TrDosImage.File M_Parent { get { return m_parent; } }
        }
        public partial class File : KaitaiStruct
        {
            public static File FromFile(string fileName)
            {
                return new File(new KaitaiStream(fileName));
            }

            public File(KaitaiStream p__io, TrDosImage p__parent = null, TrDosImage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_isDeleted = false;
                f_isTerminator = false;
                f_contents = false;
                _read();
            }
            private void _read()
            {
                __raw_name = m_io.ReadBytes(8);
                var io___raw_name = new KaitaiStream(__raw_name);
                _name = new Filename(io___raw_name, this, m_root);
                _extension = m_io.ReadU1();
                switch (Extension) {
                case 66: {
                    _positionAndLength = new PositionAndLengthBasic(m_io, this, m_root);
                    break;
                }
                case 67: {
                    _positionAndLength = new PositionAndLengthCode(m_io, this, m_root);
                    break;
                }
                case 35: {
                    _positionAndLength = new PositionAndLengthPrint(m_io, this, m_root);
                    break;
                }
                default: {
                    _positionAndLength = new PositionAndLengthGeneric(m_io, this, m_root);
                    break;
                }
                }
                _lengthSectors = m_io.ReadU1();
                _startingSector = m_io.ReadU1();
                _startingTrack = m_io.ReadU1();
            }
            private bool f_isDeleted;
            private bool _isDeleted;
            public bool IsDeleted
            {
                get
                {
                    if (f_isDeleted)
                        return _isDeleted;
                    _isDeleted = (bool) (Name.FirstByte == 1);
                    f_isDeleted = true;
                    return _isDeleted;
                }
            }
            private bool f_isTerminator;
            private bool _isTerminator;
            public bool IsTerminator
            {
                get
                {
                    if (f_isTerminator)
                        return _isTerminator;
                    _isTerminator = (bool) (Name.FirstByte == 0);
                    f_isTerminator = true;
                    return _isTerminator;
                }
            }
            private bool f_contents;
            private byte[] _contents;
            public byte[] Contents
            {
                get
                {
                    if (f_contents)
                        return _contents;
                    long _pos = m_io.Pos;
                    m_io.Seek((((StartingTrack * 256) * 16) + (StartingSector * 256)));
                    _contents = m_io.ReadBytes((LengthSectors * 256));
                    m_io.Seek(_pos);
                    f_contents = true;
                    return _contents;
                }
            }
            private Filename _name;
            private byte _extension;
            private KaitaiStruct _positionAndLength;
            private byte _lengthSectors;
            private byte _startingSector;
            private byte _startingTrack;
            private TrDosImage m_root;
            private TrDosImage m_parent;
            private byte[] __raw_name;
            public Filename Name { get { return _name; } }
            public byte Extension { get { return _extension; } }
            public KaitaiStruct PositionAndLength { get { return _positionAndLength; } }
            public byte LengthSectors { get { return _lengthSectors; } }
            public byte StartingSector { get { return _startingSector; } }
            public byte StartingTrack { get { return _startingTrack; } }
            public TrDosImage M_Root { get { return m_root; } }
            public TrDosImage M_Parent { get { return m_parent; } }
            public byte[] M_RawName { get { return __raw_name; } }
        }
        private bool f_volumeInfo;
        private VolumeInfo _volumeInfo;
        public VolumeInfo VolumeInfo
        {
            get
            {
                if (f_volumeInfo)
                    return _volumeInfo;
                long _pos = m_io.Pos;
                m_io.Seek(2048);
                _volumeInfo = new VolumeInfo(m_io, this, m_root);
                m_io.Seek(_pos);
                f_volumeInfo = true;
                return _volumeInfo;
            }
        }
        private List<File> _files;
        private TrDosImage m_root;
        private KaitaiStruct m_parent;
        public List<File> Files { get { return _files; } }
        public TrDosImage M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
