// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class GranTurismoVol : KaitaiStruct
    {
        public static GranTurismoVol FromFile(string fileName)
        {
            return new GranTurismoVol(new KaitaiStream(fileName));
        }

        public GranTurismoVol(KaitaiStream p__io, KaitaiStruct p__parent = null, GranTurismoVol p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_ofsDir = false;
            f_files = false;
            _read();
        }
        private void _read()
        {
            _magic = m_io.EnsureFixedContents(new byte[] { 71, 84, 70, 83, 0, 0, 0, 0 });
            _numFiles = m_io.ReadU2le();
            _numEntries = m_io.ReadU2le();
            _reserved = m_io.EnsureFixedContents(new byte[] { 0, 0, 0, 0 });
            _offsets = new List<uint>((int) (NumFiles));
            for (var i = 0; i < NumFiles; i++)
            {
                _offsets.Add(m_io.ReadU4le());
            }
        }
        public partial class FileInfo : KaitaiStruct
        {
            public static FileInfo FromFile(string fileName)
            {
                return new FileInfo(new KaitaiStream(fileName));
            }

            public FileInfo(KaitaiStream p__io, GranTurismoVol p__parent = null, GranTurismoVol p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_size = false;
                f_body = false;
                f_isDir = false;
                f_isLastEntry = false;
                _read();
            }
            private void _read()
            {
                _timestamp = m_io.ReadU4le();
                _offsetIdx = m_io.ReadU2le();
                _flags = m_io.ReadU1();
                _name = System.Text.Encoding.GetEncoding("ASCII").GetString(KaitaiStream.BytesTerminate(KaitaiStream.BytesStripRight(m_io.ReadBytes(25), 0), 0, false));
            }
            private bool f_size;
            private int _size;
            public int Size
            {
                get
                {
                    if (f_size)
                        return _size;
                    _size = (int) (((M_Root.Offsets[(OffsetIdx + 1)] & 4294965248) - M_Root.Offsets[OffsetIdx]));
                    f_size = true;
                    return _size;
                }
            }
            private bool f_body;
            private byte[] _body;
            public byte[] Body
            {
                get
                {
                    if (f_body)
                        return _body;
                    if (!(IsDir)) {
                        long _pos = m_io.Pos;
                        m_io.Seek((M_Root.Offsets[OffsetIdx] & 4294965248));
                        _body = m_io.ReadBytes(Size);
                        m_io.Seek(_pos);
                    }
                    f_body = true;
                    return _body;
                }
            }
            private bool f_isDir;
            private bool _isDir;
            public bool IsDir
            {
                get
                {
                    if (f_isDir)
                        return _isDir;
                    _isDir = (bool) ((Flags & 1) != 0);
                    f_isDir = true;
                    return _isDir;
                }
            }
            private bool f_isLastEntry;
            private bool _isLastEntry;
            public bool IsLastEntry
            {
                get
                {
                    if (f_isLastEntry)
                        return _isLastEntry;
                    _isLastEntry = (bool) ((Flags & 128) != 0);
                    f_isLastEntry = true;
                    return _isLastEntry;
                }
            }
            private uint _timestamp;
            private ushort _offsetIdx;
            private byte _flags;
            private string _name;
            private GranTurismoVol m_root;
            private GranTurismoVol m_parent;
            public uint Timestamp { get { return _timestamp; } }
            public ushort OffsetIdx { get { return _offsetIdx; } }
            public byte Flags { get { return _flags; } }
            public string Name { get { return _name; } }
            public GranTurismoVol M_Root { get { return m_root; } }
            public GranTurismoVol M_Parent { get { return m_parent; } }
        }
        private bool f_ofsDir;
        private uint _ofsDir;
        public uint OfsDir
        {
            get
            {
                if (f_ofsDir)
                    return _ofsDir;
                _ofsDir = (uint) (Offsets[1]);
                f_ofsDir = true;
                return _ofsDir;
            }
        }
        private bool f_files;
        private List<FileInfo> _files;
        public List<FileInfo> Files
        {
            get
            {
                if (f_files)
                    return _files;
                long _pos = m_io.Pos;
                m_io.Seek((OfsDir & 4294965248));
                _files = new List<FileInfo>((int) (M_Root.NumEntries));
                for (var i = 0; i < M_Root.NumEntries; i++)
                {
                    _files.Add(new FileInfo(m_io, this, m_root));
                }
                m_io.Seek(_pos);
                f_files = true;
                return _files;
            }
        }
        private byte[] _magic;
        private ushort _numFiles;
        private ushort _numEntries;
        private byte[] _reserved;
        private List<uint> _offsets;
        private GranTurismoVol m_root;
        private KaitaiStruct m_parent;
        public byte[] Magic { get { return _magic; } }
        public ushort NumFiles { get { return _numFiles; } }
        public ushort NumEntries { get { return _numEntries; } }
        public byte[] Reserved { get { return _reserved; } }
        public List<uint> Offsets { get { return _offsets; } }
        public GranTurismoVol M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
