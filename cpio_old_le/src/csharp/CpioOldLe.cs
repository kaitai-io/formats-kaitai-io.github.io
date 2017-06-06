// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class CpioOldLe : KaitaiStruct
    {
        public static CpioOldLe FromFile(string fileName)
        {
            return new CpioOldLe(new KaitaiStream(fileName));
        }

        public CpioOldLe(KaitaiStream io, KaitaiStruct parent = null, CpioOldLe root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            _read();
        }
        private void _read() {
            _files = new List<File>();
            while (!m_io.IsEof) {
                _files.Add(new File(m_io, this, m_root));
            }
            }
        public partial class File : KaitaiStruct
        {
            public static File FromFile(string fileName)
            {
                return new File(new KaitaiStream(fileName));
            }

            public File(KaitaiStream io, CpioOldLe parent = null, CpioOldLe root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _header = new FileHeader(m_io, this, m_root);
                _pathName = m_io.ReadBytes((Header.PathNameSize - 1));
                _stringTerminator = m_io.EnsureFixedContents(new byte[] { 0 });
                if (KaitaiStream.Mod(Header.PathNameSize, 2) == 1) {
                    _pathNamePadding = m_io.EnsureFixedContents(new byte[] { 0 });
                }
                _fileData = m_io.ReadBytes(Header.FileSize.Value);
                if (KaitaiStream.Mod(Header.FileSize.Value, 2) == 1) {
                    _fileDataPadding = m_io.EnsureFixedContents(new byte[] { 0 });
                }
                if ( (((KaitaiStream.ByteArrayCompare(PathName, new byte[] { 84, 82, 65, 73, 76, 69, 82, 33, 33, 33 }) == 0)) && (Header.FileSize.Value == 0)) ) {
                    _endOfFilePadding = m_io.ReadBytesFull();
                }
                }
            private FileHeader _header;
            private byte[] _pathName;
            private byte[] _stringTerminator;
            private byte[] _pathNamePadding;
            private byte[] _fileData;
            private byte[] _fileDataPadding;
            private byte[] _endOfFilePadding;
            private CpioOldLe m_root;
            private CpioOldLe m_parent;
            public FileHeader Header { get { return _header; } }
            public byte[] PathName { get { return _pathName; } }
            public byte[] StringTerminator { get { return _stringTerminator; } }
            public byte[] PathNamePadding { get { return _pathNamePadding; } }
            public byte[] FileData { get { return _fileData; } }
            public byte[] FileDataPadding { get { return _fileDataPadding; } }
            public byte[] EndOfFilePadding { get { return _endOfFilePadding; } }
            public CpioOldLe M_Root { get { return m_root; } }
            public CpioOldLe M_Parent { get { return m_parent; } }
        }
        public partial class FileHeader : KaitaiStruct
        {
            public static FileHeader FromFile(string fileName)
            {
                return new FileHeader(new KaitaiStream(fileName));
            }

            public FileHeader(KaitaiStream io, CpioOldLe.File parent = null, CpioOldLe root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _magic = m_io.EnsureFixedContents(new byte[] { 199, 113 });
                _deviceNumber = m_io.ReadU2le();
                _inodeNumber = m_io.ReadU2le();
                _mode = m_io.ReadU2le();
                _userId = m_io.ReadU2le();
                _groupId = m_io.ReadU2le();
                _numberOfLinks = m_io.ReadU2le();
                _rDeviceNumber = m_io.ReadU2le();
                _modificationTime = new FourByteUnsignedInteger(m_io, this, m_root);
                _pathNameSize = m_io.ReadU2le();
                _fileSize = new FourByteUnsignedInteger(m_io, this, m_root);
                }
            private byte[] _magic;
            private ushort _deviceNumber;
            private ushort _inodeNumber;
            private ushort _mode;
            private ushort _userId;
            private ushort _groupId;
            private ushort _numberOfLinks;
            private ushort _rDeviceNumber;
            private FourByteUnsignedInteger _modificationTime;
            private ushort _pathNameSize;
            private FourByteUnsignedInteger _fileSize;
            private CpioOldLe m_root;
            private CpioOldLe.File m_parent;
            public byte[] Magic { get { return _magic; } }
            public ushort DeviceNumber { get { return _deviceNumber; } }
            public ushort InodeNumber { get { return _inodeNumber; } }
            public ushort Mode { get { return _mode; } }
            public ushort UserId { get { return _userId; } }
            public ushort GroupId { get { return _groupId; } }
            public ushort NumberOfLinks { get { return _numberOfLinks; } }
            public ushort RDeviceNumber { get { return _rDeviceNumber; } }
            public FourByteUnsignedInteger ModificationTime { get { return _modificationTime; } }
            public ushort PathNameSize { get { return _pathNameSize; } }
            public FourByteUnsignedInteger FileSize { get { return _fileSize; } }
            public CpioOldLe M_Root { get { return m_root; } }
            public CpioOldLe.File M_Parent { get { return m_parent; } }
        }
        public partial class FourByteUnsignedInteger : KaitaiStruct
        {
            public static FourByteUnsignedInteger FromFile(string fileName)
            {
                return new FourByteUnsignedInteger(new KaitaiStream(fileName));
            }

            public FourByteUnsignedInteger(KaitaiStream io, CpioOldLe.FileHeader parent = null, CpioOldLe root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                f_value = false;
                _read();
            }
            private void _read() {
                _mostSignificantBits = m_io.ReadU2le();
                _leastSignificantBits = m_io.ReadU2le();
                }
            private bool f_value;
            private int _value;
            public int Value
            {
                get
                {
                    if (f_value)
                        return _value;
                    _value = (int) ((LeastSignificantBits + (MostSignificantBits << 16)));
                    f_value = true;
                    return _value;
                }
            }
            private ushort _mostSignificantBits;
            private ushort _leastSignificantBits;
            private CpioOldLe m_root;
            private CpioOldLe.FileHeader m_parent;
            public ushort MostSignificantBits { get { return _mostSignificantBits; } }
            public ushort LeastSignificantBits { get { return _leastSignificantBits; } }
            public CpioOldLe M_Root { get { return m_root; } }
            public CpioOldLe.FileHeader M_Parent { get { return m_parent; } }
        }
        private List<File> _files;
        private CpioOldLe m_root;
        private KaitaiStruct m_parent;
        public List<File> Files { get { return _files; } }
        public CpioOldLe M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
