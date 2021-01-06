// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="http://www.shikadi.net/moddingwiki/PAK_Format_(Westwood)">Source</a>
    /// </remarks>
    public partial class Dune2Pak : KaitaiStruct
    {
        public static Dune2Pak FromFile(string fileName)
        {
            return new Dune2Pak(new KaitaiStream(fileName));
        }

        public Dune2Pak(KaitaiStream p__io, KaitaiStruct p__parent = null, Dune2Pak p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_dirSize = false;
            _read();
        }
        private void _read()
        {
            __raw_dir = m_io.ReadBytes(DirSize);
            var io___raw_dir = new KaitaiStream(__raw_dir);
            _dir = new Files(io___raw_dir, this, m_root);
        }
        public partial class Files : KaitaiStruct
        {
            public static Files FromFile(string fileName)
            {
                return new Files(new KaitaiStream(fileName));
            }

            public Files(KaitaiStream p__io, Dune2Pak p__parent = null, Dune2Pak p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _files = new List<File>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _files.Add(new File(i, m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<File> _files;
            private Dune2Pak m_root;
            private Dune2Pak m_parent;
            public List<File> Files { get { return _files; } }
            public Dune2Pak M_Root { get { return m_root; } }
            public Dune2Pak M_Parent { get { return m_parent; } }
        }
        public partial class File : KaitaiStruct
        {
            public File(uint p_idx, KaitaiStream p__io, Dune2Pak.Files p__parent = null, Dune2Pak p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _idx = p_idx;
                f_nextOfs0 = false;
                f_nextOfs = false;
                f_body = false;
                _read();
            }
            private void _read()
            {
                _ofs = m_io.ReadU4le();
                if (Ofs != 0) {
                    _fileName = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(0, false, true, true));
                }
            }
            private bool f_nextOfs0;
            private uint? _nextOfs0;
            public uint? NextOfs0
            {
                get
                {
                    if (f_nextOfs0)
                        return _nextOfs0;
                    if (Ofs != 0) {
                        _nextOfs0 = (uint) (M_Root.Dir.Files[(Idx + 1)].Ofs);
                    }
                    f_nextOfs0 = true;
                    return _nextOfs0;
                }
            }
            private bool f_nextOfs;
            private int? _nextOfs;
            public int? NextOfs
            {
                get
                {
                    if (f_nextOfs)
                        return _nextOfs;
                    if (Ofs != 0) {
                        _nextOfs = (int) ((NextOfs0 == 0 ? M_Root.M_Io.Size : NextOfs0));
                    }
                    f_nextOfs = true;
                    return _nextOfs;
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
                    if (Ofs != 0) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(Ofs);
                        _body = io.ReadBytes((NextOfs - Ofs));
                        io.Seek(_pos);
                        f_body = true;
                    }
                    return _body;
                }
            }
            private uint _ofs;
            private string _fileName;
            private uint _idx;
            private Dune2Pak m_root;
            private Dune2Pak.Files m_parent;
            public uint Ofs { get { return _ofs; } }
            public string FileName { get { return _fileName; } }
            public uint Idx { get { return _idx; } }
            public Dune2Pak M_Root { get { return m_root; } }
            public Dune2Pak.Files M_Parent { get { return m_parent; } }
        }
        private bool f_dirSize;
        private uint _dirSize;
        public uint DirSize
        {
            get
            {
                if (f_dirSize)
                    return _dirSize;
                long _pos = m_io.Pos;
                m_io.Seek(0);
                _dirSize = m_io.ReadU4le();
                m_io.Seek(_pos);
                f_dirSize = true;
                return _dirSize;
            }
        }
        private Files _dir;
        private Dune2Pak m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_dir;
        public Files Dir { get { return _dir; } }
        public Dune2Pak M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawDir { get { return __raw_dir; } }
    }
}
