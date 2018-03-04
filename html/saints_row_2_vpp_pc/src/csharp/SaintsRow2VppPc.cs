// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class SaintsRow2VppPc : KaitaiStruct
    {
        public static SaintsRow2VppPc FromFile(string fileName)
        {
            return new SaintsRow2VppPc(new KaitaiStream(fileName));
        }

        public SaintsRow2VppPc(KaitaiStream p__io, KaitaiStruct p__parent = null, SaintsRow2VppPc p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_filenames = false;
            f_ofsExtensions = false;
            f_files = false;
            f_dataStart = false;
            f_extensions = false;
            f_ofsFilenames = false;
            _read();
        }
        private void _read()
        {
            _magic = m_io.EnsureFixedContents(new byte[] { 206, 10, 137, 81, 4 });
            _pad1 = m_io.ReadBytes(335);
            _numFiles = m_io.ReadS4le();
            _containerSize = m_io.ReadS4le();
            _lenOffsets = m_io.ReadS4le();
            _lenFilenames = m_io.ReadS4le();
            _lenExtensions = m_io.ReadS4le();
            _smth5 = m_io.ReadS4le();
            _smth6 = m_io.ReadS4le();
            _smth7 = m_io.ReadS4le();
            _smth8 = m_io.ReadS4le();
            _smth9 = m_io.ReadS4le();
        }
        public partial class Offsets : KaitaiStruct
        {
            public static Offsets FromFile(string fileName)
            {
                return new Offsets(new KaitaiStream(fileName));
            }

            public Offsets(KaitaiStream p__io, SaintsRow2VppPc p__parent = null, SaintsRow2VppPc p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<Offset>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(new Offset(m_io, this, m_root));
                        i++;
                    }
                }
            }
            public partial class Offset : KaitaiStruct
            {
                public static Offset FromFile(string fileName)
                {
                    return new Offset(new KaitaiStream(fileName));
                }

                public Offset(KaitaiStream p__io, SaintsRow2VppPc.Offsets p__parent = null, SaintsRow2VppPc p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_filename = false;
                    f_ext = false;
                    f_body = false;
                    _read();
                }
                private void _read()
                {
                    _nameOfs = m_io.ReadU4le();
                    _extOfs = m_io.ReadU4le();
                    _smth2 = m_io.ReadS4le();
                    _ofsBody = m_io.ReadS4le();
                    _lenBody = m_io.ReadS4le();
                    _alwaysMinus1 = m_io.ReadS4le();
                    _alwaysZero = m_io.ReadS4le();
                }
                private bool f_filename;
                private string _filename;
                public string Filename
                {
                    get
                    {
                        if (f_filename)
                            return _filename;
                        KaitaiStream io = M_Root.Filenames.M_Io;
                        long _pos = io.Pos;
                        io.Seek(NameOfs);
                        _filename = System.Text.Encoding.GetEncoding("UTF-8").GetString(io.ReadBytesTerm(0, false, true, true));
                        io.Seek(_pos);
                        f_filename = true;
                        return _filename;
                    }
                }
                private bool f_ext;
                private string _ext;
                public string Ext
                {
                    get
                    {
                        if (f_ext)
                            return _ext;
                        KaitaiStream io = M_Root.Extensions.M_Io;
                        long _pos = io.Pos;
                        io.Seek(ExtOfs);
                        _ext = System.Text.Encoding.GetEncoding("UTF-8").GetString(io.ReadBytesTerm(0, false, true, true));
                        io.Seek(_pos);
                        f_ext = true;
                        return _ext;
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
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek((M_Root.DataStart + OfsBody));
                        _body = io.ReadBytes(LenBody);
                        io.Seek(_pos);
                        f_body = true;
                        return _body;
                    }
                }
                private uint _nameOfs;
                private uint _extOfs;
                private int _smth2;
                private int _ofsBody;
                private int _lenBody;
                private int _alwaysMinus1;
                private int _alwaysZero;
                private SaintsRow2VppPc m_root;
                private SaintsRow2VppPc.Offsets m_parent;
                public uint NameOfs { get { return _nameOfs; } }
                public uint ExtOfs { get { return _extOfs; } }
                public int Smth2 { get { return _smth2; } }
                public int OfsBody { get { return _ofsBody; } }
                public int LenBody { get { return _lenBody; } }
                public int AlwaysMinus1 { get { return _alwaysMinus1; } }
                public int AlwaysZero { get { return _alwaysZero; } }
                public SaintsRow2VppPc M_Root { get { return m_root; } }
                public SaintsRow2VppPc.Offsets M_Parent { get { return m_parent; } }
            }
            private List<Offset> _entries;
            private SaintsRow2VppPc m_root;
            private SaintsRow2VppPc m_parent;
            public List<Offset> Entries { get { return _entries; } }
            public SaintsRow2VppPc M_Root { get { return m_root; } }
            public SaintsRow2VppPc M_Parent { get { return m_parent; } }
        }
        public partial class Strings : KaitaiStruct
        {
            public static Strings FromFile(string fileName)
            {
                return new Strings(new KaitaiStream(fileName));
            }

            public Strings(KaitaiStream p__io, SaintsRow2VppPc p__parent = null, SaintsRow2VppPc p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<string>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(0, false, true, true)));
                        i++;
                    }
                }
            }
            private List<string> _entries;
            private SaintsRow2VppPc m_root;
            private SaintsRow2VppPc m_parent;
            public List<string> Entries { get { return _entries; } }
            public SaintsRow2VppPc M_Root { get { return m_root; } }
            public SaintsRow2VppPc M_Parent { get { return m_parent; } }
        }
        private bool f_filenames;
        private Strings _filenames;
        public Strings Filenames
        {
            get
            {
                if (f_filenames)
                    return _filenames;
                long _pos = m_io.Pos;
                m_io.Seek(OfsFilenames);
                __raw_filenames = m_io.ReadBytes(LenFilenames);
                var io___raw_filenames = new KaitaiStream(__raw_filenames);
                _filenames = new Strings(io___raw_filenames, this, m_root);
                m_io.Seek(_pos);
                f_filenames = true;
                return _filenames;
            }
        }
        private bool f_ofsExtensions;
        private int _ofsExtensions;
        public int OfsExtensions
        {
            get
            {
                if (f_ofsExtensions)
                    return _ofsExtensions;
                _ofsExtensions = (int) ((((OfsFilenames + LenFilenames) & 4294965248) + 2048));
                f_ofsExtensions = true;
                return _ofsExtensions;
            }
        }
        private bool f_files;
        private Offsets _files;
        public Offsets Files
        {
            get
            {
                if (f_files)
                    return _files;
                long _pos = m_io.Pos;
                m_io.Seek(2048);
                __raw_files = m_io.ReadBytes(LenOffsets);
                var io___raw_files = new KaitaiStream(__raw_files);
                _files = new Offsets(io___raw_files, this, m_root);
                m_io.Seek(_pos);
                f_files = true;
                return _files;
            }
        }
        private bool f_dataStart;
        private int _dataStart;
        public int DataStart
        {
            get
            {
                if (f_dataStart)
                    return _dataStart;
                _dataStart = (int) ((((OfsExtensions + LenExtensions) & 4294965248) + 2048));
                f_dataStart = true;
                return _dataStart;
            }
        }
        private bool f_extensions;
        private Strings _extensions;
        public Strings Extensions
        {
            get
            {
                if (f_extensions)
                    return _extensions;
                long _pos = m_io.Pos;
                m_io.Seek(OfsExtensions);
                __raw_extensions = m_io.ReadBytes(LenExtensions);
                var io___raw_extensions = new KaitaiStream(__raw_extensions);
                _extensions = new Strings(io___raw_extensions, this, m_root);
                m_io.Seek(_pos);
                f_extensions = true;
                return _extensions;
            }
        }
        private bool f_ofsFilenames;
        private int _ofsFilenames;
        public int OfsFilenames
        {
            get
            {
                if (f_ofsFilenames)
                    return _ofsFilenames;
                _ofsFilenames = (int) ((((2048 + LenOffsets) & 4294965248) + 2048));
                f_ofsFilenames = true;
                return _ofsFilenames;
            }
        }
        private byte[] _magic;
        private byte[] _pad1;
        private int _numFiles;
        private int _containerSize;
        private int _lenOffsets;
        private int _lenFilenames;
        private int _lenExtensions;
        private int _smth5;
        private int _smth6;
        private int _smth7;
        private int _smth8;
        private int _smth9;
        private SaintsRow2VppPc m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_filenames;
        private byte[] __raw_files;
        private byte[] __raw_extensions;
        public byte[] Magic { get { return _magic; } }
        public byte[] Pad1 { get { return _pad1; } }
        public int NumFiles { get { return _numFiles; } }
        public int ContainerSize { get { return _containerSize; } }
        public int LenOffsets { get { return _lenOffsets; } }
        public int LenFilenames { get { return _lenFilenames; } }
        public int LenExtensions { get { return _lenExtensions; } }
        public int Smth5 { get { return _smth5; } }
        public int Smth6 { get { return _smth6; } }
        public int Smth7 { get { return _smth7; } }
        public int Smth8 { get { return _smth8; } }
        public int Smth9 { get { return _smth9; } }
        public SaintsRow2VppPc M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawFilenames { get { return __raw_filenames; } }
        public byte[] M_RawFiles { get { return __raw_files; } }
        public byte[] M_RawExtensions { get { return __raw_extensions; } }
    }
}
