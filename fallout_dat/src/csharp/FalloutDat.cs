// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class FalloutDat : KaitaiStruct
    {
        public static FalloutDat FromFile(string fileName)
        {
            return new FalloutDat(new KaitaiStream(fileName));
        }


        public enum Compression
        {
            None = 32,
            Lzss = 64,
        }
        public FalloutDat(KaitaiStream p__io, KaitaiStruct p__parent = null, FalloutDat p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _folderCount = m_io.ReadU4be();
            _unknown1 = m_io.ReadU4be();
            _unknown2 = m_io.ReadU4be();
            _timestamp = m_io.ReadU4be();
            _folderNames = new List<Pstr>((int) (FolderCount));
            for (var i = 0; i < FolderCount; i++)
            {
                _folderNames.Add(new Pstr(m_io, this, m_root));
            }
            _folders = new List<Folder>((int) (FolderCount));
            for (var i = 0; i < FolderCount; i++)
            {
                _folders.Add(new Folder(m_io, this, m_root));
            }
        }
        public partial class Pstr : KaitaiStruct
        {
            public static Pstr FromFile(string fileName)
            {
                return new Pstr(new KaitaiStream(fileName));
            }

            public Pstr(KaitaiStream p__io, KaitaiStruct p__parent = null, FalloutDat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _size = m_io.ReadU1();
                _str = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(Size));
            }
            private byte _size;
            private string _str;
            private FalloutDat m_root;
            private KaitaiStruct m_parent;
            public byte Size { get { return _size; } }
            public string Str { get { return _str; } }
            public FalloutDat M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class Folder : KaitaiStruct
        {
            public static Folder FromFile(string fileName)
            {
                return new Folder(new KaitaiStream(fileName));
            }

            public Folder(KaitaiStream p__io, FalloutDat p__parent = null, FalloutDat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fileCount = m_io.ReadU4be();
                _unknown = m_io.ReadU4be();
                _flags = m_io.ReadU4be();
                _timestamp = m_io.ReadU4be();
                _files = new List<File>((int) (FileCount));
                for (var i = 0; i < FileCount; i++)
                {
                    _files.Add(new File(m_io, this, m_root));
                }
            }
            private uint _fileCount;
            private uint _unknown;
            private uint _flags;
            private uint _timestamp;
            private List<File> _files;
            private FalloutDat m_root;
            private FalloutDat m_parent;
            public uint FileCount { get { return _fileCount; } }
            public uint Unknown { get { return _unknown; } }
            public uint Flags { get { return _flags; } }
            public uint Timestamp { get { return _timestamp; } }
            public List<File> Files { get { return _files; } }
            public FalloutDat M_Root { get { return m_root; } }
            public FalloutDat M_Parent { get { return m_parent; } }
        }
        public partial class File : KaitaiStruct
        {
            public static File FromFile(string fileName)
            {
                return new File(new KaitaiStream(fileName));
            }

            public File(KaitaiStream p__io, FalloutDat.Folder p__parent = null, FalloutDat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_contents = false;
                _read();
            }
            private void _read()
            {
                _name = new Pstr(m_io, this, m_root);
                _flags = ((FalloutDat.Compression) m_io.ReadU4be());
                _offset = m_io.ReadU4be();
                _sizeUnpacked = m_io.ReadU4be();
                _sizePacked = m_io.ReadU4be();
            }
            private bool f_contents;
            private byte[] _contents;
            public byte[] Contents
            {
                get
                {
                    if (f_contents)
                        return _contents;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(Offset);
                    _contents = io.ReadBytes((Flags == FalloutDat.Compression.None ? SizeUnpacked : SizePacked));
                    io.Seek(_pos);
                    f_contents = true;
                    return _contents;
                }
            }
            private Pstr _name;
            private Compression _flags;
            private uint _offset;
            private uint _sizeUnpacked;
            private uint _sizePacked;
            private FalloutDat m_root;
            private FalloutDat.Folder m_parent;
            public Pstr Name { get { return _name; } }
            public Compression Flags { get { return _flags; } }
            public uint Offset { get { return _offset; } }
            public uint SizeUnpacked { get { return _sizeUnpacked; } }
            public uint SizePacked { get { return _sizePacked; } }
            public FalloutDat M_Root { get { return m_root; } }
            public FalloutDat.Folder M_Parent { get { return m_parent; } }
        }
        private uint _folderCount;
        private uint _unknown1;
        private uint _unknown2;
        private uint _timestamp;
        private List<Pstr> _folderNames;
        private List<Folder> _folders;
        private FalloutDat m_root;
        private KaitaiStruct m_parent;
        public uint FolderCount { get { return _folderCount; } }
        public uint Unknown1 { get { return _unknown1; } }
        public uint Unknown2 { get { return _unknown2; } }
        public uint Timestamp { get { return _timestamp; } }
        public List<Pstr> FolderNames { get { return _folderNames; } }
        public List<Folder> Folders { get { return _folders; } }
        public FalloutDat M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
