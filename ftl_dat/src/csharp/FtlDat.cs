// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class FtlDat : KaitaiStruct
    {
        public static FtlDat FromFile(string fileName)
        {
            return new FtlDat(new KaitaiStream(fileName));
        }

        public FtlDat(KaitaiStream p__io, KaitaiStruct p__parent = null, FtlDat p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _numFiles = m_io.ReadU4le();
            _files = new List<File>((int) (NumFiles));
            for (var i = 0; i < NumFiles; i++)
            {
                _files.Add(new File(m_io, this, m_root));
            }
        }
        public partial class File : KaitaiStruct
        {
            public static File FromFile(string fileName)
            {
                return new File(new KaitaiStream(fileName));
            }

            public File(KaitaiStream p__io, FtlDat p__parent = null, FtlDat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_meta = false;
                _read();
            }
            private void _read()
            {
                _metaOfs = m_io.ReadU4le();
            }
            private bool f_meta;
            private Meta _meta;
            public Meta Meta
            {
                get
                {
                    if (f_meta)
                        return _meta;
                    if (MetaOfs != 0) {
                        long _pos = m_io.Pos;
                        m_io.Seek(MetaOfs);
                        _meta = new Meta(m_io, this, m_root);
                        m_io.Seek(_pos);
                    }
                    f_meta = true;
                    return _meta;
                }
            }
            private uint _metaOfs;
            private FtlDat m_root;
            private FtlDat m_parent;
            public uint MetaOfs { get { return _metaOfs; } }
            public FtlDat M_Root { get { return m_root; } }
            public FtlDat M_Parent { get { return m_parent; } }
        }
        public partial class Meta : KaitaiStruct
        {
            public static Meta FromFile(string fileName)
            {
                return new Meta(new KaitaiStream(fileName));
            }

            public Meta(KaitaiStream p__io, FtlDat.File p__parent = null, FtlDat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fileSize = m_io.ReadU4le();
                _filenameSize = m_io.ReadU4le();
                _filename = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(FilenameSize));
                _body = m_io.ReadBytes(FileSize);
            }
            private uint _fileSize;
            private uint _filenameSize;
            private string _filename;
            private byte[] _body;
            private FtlDat m_root;
            private FtlDat.File m_parent;
            public uint FileSize { get { return _fileSize; } }
            public uint FilenameSize { get { return _filenameSize; } }
            public string Filename { get { return _filename; } }
            public byte[] Body { get { return _body; } }
            public FtlDat M_Root { get { return m_root; } }
            public FtlDat.File M_Parent { get { return m_parent; } }
        }
        private uint _numFiles;
        private List<File> _files;
        private FtlDat m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// Number of files in the archive
        /// </summary>
        public uint NumFiles { get { return _numFiles; } }
        public List<File> Files { get { return _files; } }
        public FtlDat M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
