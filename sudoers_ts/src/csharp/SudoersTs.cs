// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// This spec can be used to parse sudo time stamp files located in directories
    /// such as /run/sudo/ts/$USER or /var/lib/sudo/ts/$USER.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://www.sudo.ws/docs/man/1.8.27/sudoers_timestamp.man/">Source</a>
    /// </remarks>
    public partial class SudoersTs : KaitaiStruct
    {
        public static SudoersTs FromFile(string fileName)
        {
            return new SudoersTs(new KaitaiStream(fileName));
        }


        public enum TsType
        {
            Global = 1,
            Tty = 2,
            Ppid = 3,
            Lockexcl = 4,
        }
        public SudoersTs(KaitaiStream p__io, KaitaiStruct p__parent = null, SudoersTs p__root = null) : base(p__io)
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
        public partial class RecordV2 : KaitaiStruct
        {
            public static RecordV2 FromFile(string fileName)
            {
                return new RecordV2(new KaitaiStream(fileName));
            }

            public RecordV2(KaitaiStream p__io, SudoersTs.Record p__parent = null, SudoersTs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _type = ((SudoersTs.TsType) m_io.ReadU2le());
                _flags = new TsFlag(m_io, this, m_root);
                _authUid = m_io.ReadU4le();
                _sid = m_io.ReadU4le();
                _startTime = new Timespec(m_io, this, m_root);
                _ts = new Timespec(m_io, this, m_root);
                if (Type == SudoersTs.TsType.Tty) {
                    _ttydev = m_io.ReadU4le();
                }
                if (Type == SudoersTs.TsType.Ppid) {
                    _ppid = m_io.ReadU4le();
                }
            }
            private TsType _type;
            private TsFlag _flags;
            private uint _authUid;
            private uint _sid;
            private Timespec _startTime;
            private Timespec _ts;
            private uint? _ttydev;
            private uint? _ppid;
            private SudoersTs m_root;
            private SudoersTs.Record m_parent;

            /// <summary>
            /// record type
            /// </summary>
            public TsType Type { get { return _type; } }

            /// <summary>
            /// record flags
            /// </summary>
            public TsFlag Flags { get { return _flags; } }

            /// <summary>
            /// user ID that was used for authentication
            /// </summary>
            public uint AuthUid { get { return _authUid; } }

            /// <summary>
            /// ID of the user's terminal session, if present (when type is TS_TTY)
            /// </summary>
            public uint Sid { get { return _sid; } }

            /// <summary>
            /// start time of the session leader for records of type TS_TTY or of the parent process for records of type TS_PPID
            /// </summary>
            public Timespec StartTime { get { return _startTime; } }

            /// <summary>
            /// actual time stamp, from a monotonic time source
            /// </summary>
            public Timespec Ts { get { return _ts; } }

            /// <summary>
            /// device number of the terminal associated with the session
            /// </summary>
            public uint? Ttydev { get { return _ttydev; } }

            /// <summary>
            /// ID of the parent process
            /// </summary>
            public uint? Ppid { get { return _ppid; } }
            public SudoersTs M_Root { get { return m_root; } }
            public SudoersTs.Record M_Parent { get { return m_parent; } }
        }
        public partial class TsFlag : KaitaiStruct
        {
            public static TsFlag FromFile(string fileName)
            {
                return new TsFlag(new KaitaiStream(fileName));
            }

            public TsFlag(KaitaiStream p__io, KaitaiStruct p__parent = null, SudoersTs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _reserved0 = m_io.ReadBitsIntBe(6);
                _anyuid = m_io.ReadBitsIntBe(1) != 0;
                _disabled = m_io.ReadBitsIntBe(1) != 0;
                _reserved1 = m_io.ReadBitsIntBe(8);
            }
            private ulong _reserved0;
            private bool _anyuid;
            private bool _disabled;
            private ulong _reserved1;
            private SudoersTs m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Reserved (unused) bits
            /// </summary>
            public ulong Reserved0 { get { return _reserved0; } }

            /// <summary>
            /// ignore uid
            /// </summary>
            public bool Anyuid { get { return _anyuid; } }

            /// <summary>
            /// entry disabled
            /// </summary>
            public bool Disabled { get { return _disabled; } }

            /// <summary>
            /// Reserved (unused) bits
            /// </summary>
            public ulong Reserved1 { get { return _reserved1; } }
            public SudoersTs M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class RecordV1 : KaitaiStruct
        {
            public static RecordV1 FromFile(string fileName)
            {
                return new RecordV1(new KaitaiStream(fileName));
            }

            public RecordV1(KaitaiStream p__io, SudoersTs.Record p__parent = null, SudoersTs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _type = ((SudoersTs.TsType) m_io.ReadU2le());
                _flags = new TsFlag(m_io, this, m_root);
                _authUid = m_io.ReadU4le();
                _sid = m_io.ReadU4le();
                _ts = new Timespec(m_io, this, m_root);
                if (Type == SudoersTs.TsType.Tty) {
                    _ttydev = m_io.ReadU4le();
                }
                if (Type == SudoersTs.TsType.Ppid) {
                    _ppid = m_io.ReadU4le();
                }
            }
            private TsType _type;
            private TsFlag _flags;
            private uint _authUid;
            private uint _sid;
            private Timespec _ts;
            private uint? _ttydev;
            private uint? _ppid;
            private SudoersTs m_root;
            private SudoersTs.Record m_parent;

            /// <summary>
            /// record type
            /// </summary>
            public TsType Type { get { return _type; } }

            /// <summary>
            /// record flags
            /// </summary>
            public TsFlag Flags { get { return _flags; } }

            /// <summary>
            /// user ID that was used for authentication
            /// </summary>
            public uint AuthUid { get { return _authUid; } }

            /// <summary>
            /// session ID associated with tty/ppid
            /// </summary>
            public uint Sid { get { return _sid; } }

            /// <summary>
            /// time stamp, from a monotonic time source
            /// </summary>
            public Timespec Ts { get { return _ts; } }

            /// <summary>
            /// device number of the terminal associated with the session
            /// </summary>
            public uint? Ttydev { get { return _ttydev; } }

            /// <summary>
            /// ID of the parent process
            /// </summary>
            public uint? Ppid { get { return _ppid; } }
            public SudoersTs M_Root { get { return m_root; } }
            public SudoersTs.Record M_Parent { get { return m_parent; } }
        }
        public partial class Timespec : KaitaiStruct
        {
            public static Timespec FromFile(string fileName)
            {
                return new Timespec(new KaitaiStream(fileName));
            }

            public Timespec(KaitaiStream p__io, KaitaiStruct p__parent = null, SudoersTs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _sec = m_io.ReadS8le();
                _nsec = m_io.ReadS8le();
            }
            private long _sec;
            private long _nsec;
            private SudoersTs m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// seconds
            /// </summary>
            public long Sec { get { return _sec; } }

            /// <summary>
            /// nanoseconds
            /// </summary>
            public long Nsec { get { return _nsec; } }
            public SudoersTs M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class Record : KaitaiStruct
        {
            public static Record FromFile(string fileName)
            {
                return new Record(new KaitaiStream(fileName));
            }

            public Record(KaitaiStream p__io, SudoersTs p__parent = null, SudoersTs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _version = m_io.ReadU2le();
                _lenRecord = m_io.ReadU2le();
                switch (Version) {
                case 1: {
                    __raw_payload = m_io.ReadBytes((LenRecord - 4));
                    var io___raw_payload = new KaitaiStream(__raw_payload);
                    _payload = new RecordV1(io___raw_payload, this, m_root);
                    break;
                }
                case 2: {
                    __raw_payload = m_io.ReadBytes((LenRecord - 4));
                    var io___raw_payload = new KaitaiStream(__raw_payload);
                    _payload = new RecordV2(io___raw_payload, this, m_root);
                    break;
                }
                default: {
                    _payload = m_io.ReadBytes((LenRecord - 4));
                    break;
                }
                }
            }
            private ushort _version;
            private ushort _lenRecord;
            private object _payload;
            private SudoersTs m_root;
            private SudoersTs m_parent;
            private byte[] __raw_payload;

            /// <summary>
            /// version number of the timestamp_entry struct
            /// </summary>
            public ushort Version { get { return _version; } }

            /// <summary>
            /// size of the record in bytes
            /// </summary>
            public ushort LenRecord { get { return _lenRecord; } }
            public object Payload { get { return _payload; } }
            public SudoersTs M_Root { get { return m_root; } }
            public SudoersTs M_Parent { get { return m_parent; } }
            public byte[] M_RawPayload { get { return __raw_payload; } }
        }
        private List<Record> _records;
        private SudoersTs m_root;
        private KaitaiStruct m_parent;
        public List<Record> Records { get { return _records; } }
        public SudoersTs M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
