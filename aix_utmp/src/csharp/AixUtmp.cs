// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// This spec can be used to parse utmp, wtmp and other similar as created by IBM AIX.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://www.ibm.com/docs/en/aix/7.1?topic=files-utmph-file">Source</a>
    /// </remarks>
    public partial class AixUtmp : KaitaiStruct
    {
        public static AixUtmp FromFile(string fileName)
        {
            return new AixUtmp(new KaitaiStream(fileName));
        }


        public enum EntryType
        {
            Empty = 0,
            RunLvl = 1,
            BootTime = 2,
            OldTime = 3,
            NewTime = 4,
            InitProcess = 5,
            LoginProcess = 6,
            UserProcess = 7,
            DeadProcess = 8,
            Accounting = 9,
        }
        public AixUtmp(KaitaiStream p__io, KaitaiStruct p__parent = null, AixUtmp p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _records = new List<Record>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _records.Add(new Record(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class ExitStatus : KaitaiStruct
        {
            public static ExitStatus FromFile(string fileName)
            {
                return new ExitStatus(new KaitaiStream(fileName));
            }

            public ExitStatus(KaitaiStream p__io, AixUtmp.Record p__parent = null, AixUtmp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _terminationCode = m_io.ReadS2be();
                _exitCode = m_io.ReadS2be();
            }
            private short _terminationCode;
            private short _exitCode;
            private AixUtmp m_root;
            private AixUtmp.Record m_parent;

            /// <summary>
            /// process termination status
            /// </summary>
            public short TerminationCode { get { return _terminationCode; } }

            /// <summary>
            /// process exit status
            /// </summary>
            public short ExitCode { get { return _exitCode; } }
            public AixUtmp M_Root { get { return m_root; } }
            public AixUtmp.Record M_Parent { get { return m_parent; } }
        }
        public partial class Record : KaitaiStruct
        {
            public static Record FromFile(string fileName)
            {
                return new Record(new KaitaiStream(fileName));
            }

            public Record(KaitaiStream p__io, AixUtmp p__parent = null, AixUtmp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _user = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(256));
                _inittabId = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(14));
                _device = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(64));
                _pid = m_io.ReadU8be();
                _type = ((AixUtmp.EntryType) m_io.ReadS2be());
                _timestamp = m_io.ReadS8be();
                _exitStatus = new ExitStatus(m_io, this, m_root);
                _hostname = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(256));
                _dblWordPad = m_io.ReadS4be();
                _reservedA = m_io.ReadBytes(8);
                _reservedV = m_io.ReadBytes(24);
            }
            private string _user;
            private string _inittabId;
            private string _device;
            private ulong _pid;
            private EntryType _type;
            private long _timestamp;
            private ExitStatus _exitStatus;
            private string _hostname;
            private int _dblWordPad;
            private byte[] _reservedA;
            private byte[] _reservedV;
            private AixUtmp m_root;
            private AixUtmp m_parent;

            /// <summary>
            /// User login name
            /// </summary>
            public string User { get { return _user; } }

            /// <summary>
            /// /etc/inittab id
            /// </summary>
            public string InittabId { get { return _inittabId; } }

            /// <summary>
            /// device name (console, lnxx)
            /// </summary>
            public string Device { get { return _device; } }

            /// <summary>
            /// process id
            /// </summary>
            public ulong Pid { get { return _pid; } }

            /// <summary>
            /// Type of login
            /// </summary>
            public EntryType Type { get { return _type; } }

            /// <summary>
            /// time entry was made
            /// </summary>
            public long Timestamp { get { return _timestamp; } }

            /// <summary>
            /// the exit status of a process marked as DEAD PROCESS
            /// </summary>
            public ExitStatus ExitStatus { get { return _exitStatus; } }

            /// <summary>
            /// host name
            /// </summary>
            public string Hostname { get { return _hostname; } }
            public int DblWordPad { get { return _dblWordPad; } }
            public byte[] ReservedA { get { return _reservedA; } }
            public byte[] ReservedV { get { return _reservedV; } }
            public AixUtmp M_Root { get { return m_root; } }
            public AixUtmp M_Parent { get { return m_parent; } }
        }
        private List<Record> _records;
        private AixUtmp m_root;
        private KaitaiStruct m_parent;
        public List<Record> Records { get { return _records; } }
        public AixUtmp M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
