// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class Fallout2Dat : KaitaiStruct
    {
        public static Fallout2Dat FromFile(string fileName)
        {
            return new Fallout2Dat(new KaitaiStream(fileName));
        }


        public enum Compression
        {
            None = 0,
            Zlib = 1,
        }
        public Fallout2Dat(KaitaiStream p__io, KaitaiStruct p__parent = null, Fallout2Dat p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_footer = false;
            f_index = false;
            _read();
        }
        private void _read()
        {
        }
        public partial class Pstr : KaitaiStruct
        {
            public static Pstr FromFile(string fileName)
            {
                return new Pstr(new KaitaiStream(fileName));
            }

            public Pstr(KaitaiStream p__io, Fallout2Dat.File p__parent = null, Fallout2Dat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _size = m_io.ReadU4le();
                _str = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(Size));
            }
            private uint _size;
            private string _str;
            private Fallout2Dat m_root;
            private Fallout2Dat.File m_parent;
            public uint Size { get { return _size; } }
            public string Str { get { return _str; } }
            public Fallout2Dat M_Root { get { return m_root; } }
            public Fallout2Dat.File M_Parent { get { return m_parent; } }
        }
        public partial class Footer : KaitaiStruct
        {
            public static Footer FromFile(string fileName)
            {
                return new Footer(new KaitaiStream(fileName));
            }

            public Footer(KaitaiStream p__io, Fallout2Dat p__parent = null, Fallout2Dat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _indexSize = m_io.ReadU4le();
                _fileSize = m_io.ReadU4le();
            }
            private uint _indexSize;
            private uint _fileSize;
            private Fallout2Dat m_root;
            private Fallout2Dat m_parent;
            public uint IndexSize { get { return _indexSize; } }
            public uint FileSize { get { return _fileSize; } }
            public Fallout2Dat M_Root { get { return m_root; } }
            public Fallout2Dat M_Parent { get { return m_parent; } }
        }
        public partial class Index : KaitaiStruct
        {
            public static Index FromFile(string fileName)
            {
                return new Index(new KaitaiStream(fileName));
            }

            public Index(KaitaiStream p__io, Fallout2Dat p__parent = null, Fallout2Dat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fileCount = m_io.ReadU4le();
                _files = new List<File>((int) (FileCount));
                for (var i = 0; i < FileCount; i++)
                {
                    _files.Add(new File(m_io, this, m_root));
                }
            }
            private uint _fileCount;
            private List<File> _files;
            private Fallout2Dat m_root;
            private Fallout2Dat m_parent;
            public uint FileCount { get { return _fileCount; } }
            public List<File> Files { get { return _files; } }
            public Fallout2Dat M_Root { get { return m_root; } }
            public Fallout2Dat M_Parent { get { return m_parent; } }
        }
        public partial class File : KaitaiStruct
        {
            public static File FromFile(string fileName)
            {
                return new File(new KaitaiStream(fileName));
            }

            public File(KaitaiStream p__io, Fallout2Dat.Index p__parent = null, Fallout2Dat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_contents = false;
                _read();
            }
            private void _read()
            {
                _name = new Pstr(m_io, this, m_root);
                _flags = ((Fallout2Dat.Compression) m_io.ReadU1());
                _sizeUnpacked = m_io.ReadU4le();
                _sizePacked = m_io.ReadU4le();
                _offset = m_io.ReadU4le();
            }
            private bool f_contents;
            private byte[] _contents;
            public byte[] Contents
            {
                get
                {
                    if (f_contents)
                        return _contents;
                    if (Flags == Fallout2Dat.Compression.Zlib) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(Offset);
                        __raw_contents = io.ReadBytes(SizePacked);
                        _contents = m_io.ProcessZlib(__raw_contents);
                        io.Seek(_pos);
                    }
                    f_contents = true;
                    return _contents;
                }
            }
            private Pstr _name;
            private Compression _flags;
            private uint _sizeUnpacked;
            private uint _sizePacked;
            private uint _offset;
            private Fallout2Dat m_root;
            private Fallout2Dat.Index m_parent;
            private byte[] __raw_contents;
            public Pstr Name { get { return _name; } }
            public Compression Flags { get { return _flags; } }
            public uint SizeUnpacked { get { return _sizeUnpacked; } }
            public uint SizePacked { get { return _sizePacked; } }
            public uint Offset { get { return _offset; } }
            public Fallout2Dat M_Root { get { return m_root; } }
            public Fallout2Dat.Index M_Parent { get { return m_parent; } }
            public byte[] M_RawContents { get { return __raw_contents; } }
        }
        private bool f_footer;
        private Footer _footer;
        public Footer Footer
        {
            get
            {
                if (f_footer)
                    return _footer;
                long _pos = m_io.Pos;
                m_io.Seek((M_Io.Size - 8));
                _footer = new Footer(m_io, this, m_root);
                m_io.Seek(_pos);
                f_footer = true;
                return _footer;
            }
        }
        private bool f_index;
        private Index _index;
        public Index Index
        {
            get
            {
                if (f_index)
                    return _index;
                long _pos = m_io.Pos;
                m_io.Seek(((M_Io.Size - 8) - Footer.IndexSize));
                _index = new Index(m_io, this, m_root);
                m_io.Seek(_pos);
                f_index = true;
                return _index;
            }
        }
        private Fallout2Dat m_root;
        private KaitaiStruct m_parent;
        public Fallout2Dat M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
