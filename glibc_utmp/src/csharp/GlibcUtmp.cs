// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class GlibcUtmp : KaitaiStruct
    {
        public static GlibcUtmp FromFile(string fileName)
        {
            return new GlibcUtmp(new KaitaiStream(fileName));
        }


        public enum EntryType
        {
            Empty = 0,
            RunLvl = 1,
            BootTime = 2,
            NewTime = 3,
            OldTime = 4,
            InitProcess = 5,
            LoginProcess = 6,
            UserProcess = 7,
            DeadProcess = 8,
            Accounting = 9,
        }
        public GlibcUtmp(KaitaiStream p__io, KaitaiStruct p__parent = null, GlibcUtmp p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            __raw_records = new List<byte[]>();
            _records = new List<Record>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    __raw_records.Add(m_io.ReadBytes(384));
                    var io___raw_records = new KaitaiStream(__raw_records[__raw_records.Count - 1]);
                    _records.Add(new Record(io___raw_records, this, m_root));
                    i++;
                }
            }
        }
        public partial class Record : KaitaiStruct
        {
            public static Record FromFile(string fileName)
            {
                return new Record(new KaitaiStream(fileName));
            }

            public Record(KaitaiStream p__io, GlibcUtmp p__parent = null, GlibcUtmp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _utType = ((GlibcUtmp.EntryType) m_io.ReadS4le());
                _pid = m_io.ReadU4le();
                _line = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(32));
                _id = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                _user = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(32));
                _host = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(256));
                _exit = m_io.ReadU4le();
                _session = m_io.ReadS4le();
                _tv = new Timeval(m_io, this, m_root);
                _addrV6 = m_io.ReadBytes(16);
                _reserved = m_io.ReadBytes(20);
            }
            private EntryType _utType;
            private uint _pid;
            private string _line;
            private string _id;
            private string _user;
            private string _host;
            private uint _exit;
            private int _session;
            private Timeval _tv;
            private byte[] _addrV6;
            private byte[] _reserved;
            private GlibcUtmp m_root;
            private GlibcUtmp m_parent;

            /// <summary>
            /// Type of login
            /// </summary>
            public EntryType UtType { get { return _utType; } }

            /// <summary>
            /// Process ID of login process
            /// </summary>
            public uint Pid { get { return _pid; } }

            /// <summary>
            /// Devicename
            /// </summary>
            public string Line { get { return _line; } }

            /// <summary>
            /// Inittab ID
            /// </summary>
            public string Id { get { return _id; } }

            /// <summary>
            /// Username
            /// </summary>
            public string User { get { return _user; } }

            /// <summary>
            /// Hostname for remote login
            /// </summary>
            public string Host { get { return _host; } }

            /// <summary>
            /// Exit status of a process marked as DEAD_PROCESS
            /// </summary>
            public uint Exit { get { return _exit; } }

            /// <summary>
            /// Session ID, used for windowing
            /// </summary>
            public int Session { get { return _session; } }

            /// <summary>
            /// Time entry was made
            /// </summary>
            public Timeval Tv { get { return _tv; } }

            /// <summary>
            /// Internet address of remote host
            /// </summary>
            public byte[] AddrV6 { get { return _addrV6; } }
            public byte[] Reserved { get { return _reserved; } }
            public GlibcUtmp M_Root { get { return m_root; } }
            public GlibcUtmp M_Parent { get { return m_parent; } }
        }
        public partial class Timeval : KaitaiStruct
        {
            public static Timeval FromFile(string fileName)
            {
                return new Timeval(new KaitaiStream(fileName));
            }

            public Timeval(KaitaiStream p__io, GlibcUtmp.Record p__parent = null, GlibcUtmp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _sec = m_io.ReadS4le();
                _usec = m_io.ReadS4le();
            }
            private int _sec;
            private int _usec;
            private GlibcUtmp m_root;
            private GlibcUtmp.Record m_parent;

            /// <summary>
            /// Seconds
            /// </summary>
            public int Sec { get { return _sec; } }

            /// <summary>
            /// Microseconds
            /// </summary>
            public int Usec { get { return _usec; } }
            public GlibcUtmp M_Root { get { return m_root; } }
            public GlibcUtmp.Record M_Parent { get { return m_parent; } }
        }
        private List<Record> _records;
        private GlibcUtmp m_root;
        private KaitaiStruct m_parent;
        private List<byte[]> __raw_records;
        public List<Record> Records { get { return _records; } }
        public GlibcUtmp M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public List<byte[]> M_RawRecords { get { return __raw_records; } }
    }
}
