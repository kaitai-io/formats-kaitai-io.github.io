// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class Zip : KaitaiStruct
    {
        public static Zip FromFile(string fileName)
        {
            return new Zip(new KaitaiStream(fileName));
        }

        public enum Compression
        {
            None = 0,
            Shrunk = 1,
            Reduced1 = 2,
            Reduced2 = 3,
            Reduced3 = 4,
            Reduced4 = 5,
            Imploded = 6,
            Deflated = 8,
            EnhancedDeflated = 9,
            PkwareDclImploded = 10,
            Bzip2 = 12,
            Lzma = 14,
            IbmTerse = 18,
            IbmLz77Z = 19,
            Ppmd = 98,
        }

        public Zip(KaitaiStream io, KaitaiStruct parent = null, Zip root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            _read();
        }
        private void _read() {
            _sections = new List<PkSection>();
            while (!m_io.IsEof) {
                _sections.Add(new PkSection(m_io, this, m_root));
            }
            }
        public partial class LocalFile : KaitaiStruct
        {
            public static LocalFile FromFile(string fileName)
            {
                return new LocalFile(new KaitaiStream(fileName));
            }

            public LocalFile(KaitaiStream io, Zip.PkSection parent = null, Zip root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _header = new LocalFileHeader(m_io, this, m_root);
                _body = m_io.ReadBytes(Header.CompressedSize);
                }
            private LocalFileHeader _header;
            private byte[] _body;
            private Zip m_root;
            private Zip.PkSection m_parent;
            public LocalFileHeader Header { get { return _header; } }
            public byte[] Body { get { return _body; } }
            public Zip M_Root { get { return m_root; } }
            public Zip.PkSection M_Parent { get { return m_parent; } }
        }
        public partial class CentralDirEntry : KaitaiStruct
        {
            public static CentralDirEntry FromFile(string fileName)
            {
                return new CentralDirEntry(new KaitaiStream(fileName));
            }

            public CentralDirEntry(KaitaiStream io, Zip.PkSection parent = null, Zip root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _versionMadeBy = m_io.ReadU2le();
                _versionNeededToExtract = m_io.ReadU2le();
                _flags = m_io.ReadU2le();
                _compressionMethod = m_io.ReadU2le();
                _lastModFileTime = m_io.ReadU2le();
                _lastModFileDate = m_io.ReadU2le();
                _crc32 = m_io.ReadU4le();
                _compressedSize = m_io.ReadU4le();
                _uncompressedSize = m_io.ReadU4le();
                _fileNameLen = m_io.ReadU2le();
                _extraLen = m_io.ReadU2le();
                _commentLen = m_io.ReadU2le();
                _diskNumberStart = m_io.ReadU2le();
                _intFileAttr = m_io.ReadU2le();
                _extFileAttr = m_io.ReadU4le();
                _localHeaderOffset = m_io.ReadS4le();
                _fileName = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(FileNameLen));
                _extra = m_io.ReadBytes(ExtraLen);
                _comment = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(CommentLen));
                }
            private ushort _versionMadeBy;
            private ushort _versionNeededToExtract;
            private ushort _flags;
            private ushort _compressionMethod;
            private ushort _lastModFileTime;
            private ushort _lastModFileDate;
            private uint _crc32;
            private uint _compressedSize;
            private uint _uncompressedSize;
            private ushort _fileNameLen;
            private ushort _extraLen;
            private ushort _commentLen;
            private ushort _diskNumberStart;
            private ushort _intFileAttr;
            private uint _extFileAttr;
            private int _localHeaderOffset;
            private string _fileName;
            private byte[] _extra;
            private string _comment;
            private Zip m_root;
            private Zip.PkSection m_parent;
            public ushort VersionMadeBy { get { return _versionMadeBy; } }
            public ushort VersionNeededToExtract { get { return _versionNeededToExtract; } }
            public ushort Flags { get { return _flags; } }
            public ushort CompressionMethod { get { return _compressionMethod; } }
            public ushort LastModFileTime { get { return _lastModFileTime; } }
            public ushort LastModFileDate { get { return _lastModFileDate; } }
            public uint Crc32 { get { return _crc32; } }
            public uint CompressedSize { get { return _compressedSize; } }
            public uint UncompressedSize { get { return _uncompressedSize; } }
            public ushort FileNameLen { get { return _fileNameLen; } }
            public ushort ExtraLen { get { return _extraLen; } }
            public ushort CommentLen { get { return _commentLen; } }
            public ushort DiskNumberStart { get { return _diskNumberStart; } }
            public ushort IntFileAttr { get { return _intFileAttr; } }
            public uint ExtFileAttr { get { return _extFileAttr; } }
            public int LocalHeaderOffset { get { return _localHeaderOffset; } }
            public string FileName { get { return _fileName; } }
            public byte[] Extra { get { return _extra; } }
            public string Comment { get { return _comment; } }
            public Zip M_Root { get { return m_root; } }
            public Zip.PkSection M_Parent { get { return m_parent; } }
        }
        public partial class PkSection : KaitaiStruct
        {
            public static PkSection FromFile(string fileName)
            {
                return new PkSection(new KaitaiStream(fileName));
            }

            public PkSection(KaitaiStream io, Zip parent = null, Zip root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _magic = m_io.EnsureFixedContents(new byte[] { 80, 75 });
                _sectionType = m_io.ReadU2le();
                switch (SectionType) {
                case 513: {
                    _body = new CentralDirEntry(m_io, this, m_root);
                    break;
                }
                case 1027: {
                    _body = new LocalFile(m_io, this, m_root);
                    break;
                }
                case 1541: {
                    _body = new EndOfCentralDir(m_io, this, m_root);
                    break;
                }
                }
                }
            private byte[] _magic;
            private ushort _sectionType;
            private KaitaiStruct _body;
            private Zip m_root;
            private Zip m_parent;
            public byte[] Magic { get { return _magic; } }
            public ushort SectionType { get { return _sectionType; } }
            public KaitaiStruct Body { get { return _body; } }
            public Zip M_Root { get { return m_root; } }
            public Zip M_Parent { get { return m_parent; } }
        }
        public partial class LocalFileHeader : KaitaiStruct
        {
            public static LocalFileHeader FromFile(string fileName)
            {
                return new LocalFileHeader(new KaitaiStream(fileName));
            }

            public LocalFileHeader(KaitaiStream io, Zip.LocalFile parent = null, Zip root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _version = m_io.ReadU2le();
                _flags = m_io.ReadU2le();
                _compression = ((Zip.Compression) m_io.ReadU2le());
                _fileModTime = m_io.ReadU2le();
                _fileModDate = m_io.ReadU2le();
                _crc32 = m_io.ReadU4le();
                _compressedSize = m_io.ReadU4le();
                _uncompressedSize = m_io.ReadU4le();
                _fileNameLen = m_io.ReadU2le();
                _extraLen = m_io.ReadU2le();
                _fileName = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(FileNameLen));
                _extra = m_io.ReadBytes(ExtraLen);
                }
            private ushort _version;
            private ushort _flags;
            private Compression _compression;
            private ushort _fileModTime;
            private ushort _fileModDate;
            private uint _crc32;
            private uint _compressedSize;
            private uint _uncompressedSize;
            private ushort _fileNameLen;
            private ushort _extraLen;
            private string _fileName;
            private byte[] _extra;
            private Zip m_root;
            private Zip.LocalFile m_parent;
            public ushort Version { get { return _version; } }
            public ushort Flags { get { return _flags; } }
            public Compression Compression { get { return _compression; } }
            public ushort FileModTime { get { return _fileModTime; } }
            public ushort FileModDate { get { return _fileModDate; } }
            public uint Crc32 { get { return _crc32; } }
            public uint CompressedSize { get { return _compressedSize; } }
            public uint UncompressedSize { get { return _uncompressedSize; } }
            public ushort FileNameLen { get { return _fileNameLen; } }
            public ushort ExtraLen { get { return _extraLen; } }
            public string FileName { get { return _fileName; } }
            public byte[] Extra { get { return _extra; } }
            public Zip M_Root { get { return m_root; } }
            public Zip.LocalFile M_Parent { get { return m_parent; } }
        }
        public partial class EndOfCentralDir : KaitaiStruct
        {
            public static EndOfCentralDir FromFile(string fileName)
            {
                return new EndOfCentralDir(new KaitaiStream(fileName));
            }

            public EndOfCentralDir(KaitaiStream io, Zip.PkSection parent = null, Zip root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _diskOfEndOfCentralDir = m_io.ReadU2le();
                _diskOfCentralDir = m_io.ReadU2le();
                _qtyCentralDirEntriesOnDisk = m_io.ReadU2le();
                _qtyCentralDirEntriesTotal = m_io.ReadU2le();
                _centralDirSize = m_io.ReadU4le();
                _centralDirOffset = m_io.ReadU4le();
                _commentLen = m_io.ReadU2le();
                _comment = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(CommentLen));
                }
            private ushort _diskOfEndOfCentralDir;
            private ushort _diskOfCentralDir;
            private ushort _qtyCentralDirEntriesOnDisk;
            private ushort _qtyCentralDirEntriesTotal;
            private uint _centralDirSize;
            private uint _centralDirOffset;
            private ushort _commentLen;
            private string _comment;
            private Zip m_root;
            private Zip.PkSection m_parent;
            public ushort DiskOfEndOfCentralDir { get { return _diskOfEndOfCentralDir; } }
            public ushort DiskOfCentralDir { get { return _diskOfCentralDir; } }
            public ushort QtyCentralDirEntriesOnDisk { get { return _qtyCentralDirEntriesOnDisk; } }
            public ushort QtyCentralDirEntriesTotal { get { return _qtyCentralDirEntriesTotal; } }
            public uint CentralDirSize { get { return _centralDirSize; } }
            public uint CentralDirOffset { get { return _centralDirOffset; } }
            public ushort CommentLen { get { return _commentLen; } }
            public string Comment { get { return _comment; } }
            public Zip M_Root { get { return m_root; } }
            public Zip.PkSection M_Parent { get { return m_parent; } }
        }
        private List<PkSection> _sections;
        private Zip m_root;
        private KaitaiStruct m_parent;
        public List<PkSection> Sections { get { return _sections; } }
        public Zip M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
